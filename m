Return-Path: <linux-arm-msm+bounces-58431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E24A9ABBBB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8889189C1E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1209B276023;
	Mon, 19 May 2025 10:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V6Hbi8mZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F279320DD75
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652337; cv=none; b=U3mb04JxYmBrxvN3M6AA9WjCDwT39tPsGKoN7wpZuzhUlyflHtX1E414dcL4SAxLK7pTXfx6nx6TJKkkaZJ+Qzf76KwbGE4siglLiX9OjfqcX2EkdSkNNBTYYCKh0fAGlX4PoIiMWiGDH9B2Puyh7fTS+0uEmxbsw4Qd6CisVWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652337; c=relaxed/simple;
	bh=zTK6qAcKQZuF4cfB2PwxVStTZEH+TOc7QDpxhzQeph8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ekk23+ZyT2cTaQilC4L0hFlscGlEeJjR7tU/X+uORtQ05URxwTovQZ0efAX/bCJ2TYCGXM8YfqxYaMAGiTHd5msUTRv3FFZW8Z/3uYdRkqbnuZe2YeB8SyrlKIaQJjp+s4gNJjJg69f+h15T75JntZcxXMaSfnBZ9+2W2+rnjto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V6Hbi8mZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JA0Css032032
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vfA7GtnSYSKUo7p5wgEOmrBapgaTIQDubiWjfuODSw0=; b=V6Hbi8mZt8Q9rTxN
	i6e+4wxppdu9aIST4QWeF4pbhARFuuYr89ACDnyXrLkvQwzBouNcrRRoLBYlY38i
	Gz7J/rXd85S3MskSUm4C05jkjMpQudqpIsySh/BPWN6vB5KmIeMXr0NOvzN54gkp
	LzZYCLxXpRcDZF2p505v3QF0nTwcCMwwruW8lMwuF3ifBX0qmVHG7xVe1DaHBElI
	JbIdnpbwvy8Zh2tY2eQBrvjGfChY12yxytsktbaYLYsonwBikWVPZpChWeOppgHD
	NbG6BcLcMvoIPoKcIHlGHr9swhnHQMsorBygjnsPR9gHFapdR3SEPkM7/jk/2bSD
	azMOjQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsv28v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caef20a528so1200272785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652324; x=1748257124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfA7GtnSYSKUo7p5wgEOmrBapgaTIQDubiWjfuODSw0=;
        b=q4Rs8+lU6n1E9yhnQGc8hnnaCjetyB4XMoTxnY7t/qwn4Rup4vSu41ZSHKzWVaBADy
         4DmT/wiKfj/9GP2nNHiofMgtcmiCeuxG6KGXliUjp3ISAiEfnq0V+Zua/ndb85bje6oW
         Sy2NGY4pZ213IIVkLiaA6MNk8P0ARiQLfGjQ83pxisQlMYz9YctSwqKnqfSFkZ7yxN42
         pTKxiBgYKGtkNmW9HDHoaW3++rwcjIqQZXS/ehcxgVwyo/903wXpCDddMzawoaEJN8Zr
         pyS2uV9bii4lSAmBCGyAQYuD6jD7WfsErlXNuU6EX0FxV0c78OyB1Tr7k/sXQQ9ZL5qF
         qS4g==
X-Forwarded-Encrypted: i=1; AJvYcCUMomS9rnwXFw36FadB0B0vUhzZj7eDkON0X7WYaACxJgaILtfz7YNWYElWJbx1QE6Loscx6yvEiXAWM4uU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5G121Ad8xt1KLb7x6t8o0ZvSydqnCnAXR38YPEBXH4bptD+Q6
	at1KlyzsbkeFGqqOYxrm3f2OYZ3WzIKrwqu4+UgNrlA4F+18ORDyz65MQEqbUoi1N9zEtDA31bw
	CFBCtxYQhZLMuGJmIcHO20ko5T3VmPcu02470jmoaL7j/JTqptZ3ayzae36+SfrJVAauP
X-Gm-Gg: ASbGnctRzYHsH3jKDxs3BF3VfLbplX7Arz+OistunOkuQPz+YpOjSXH1GCqXGMEwGlP
	Ol7ZKZHGoH15gbGqXAqWCMu8ZdFZNdMlyC7Pj9D0S4k67G/w2r2taQCtKYMJBcYhethIdAf6R3v
	o/IuDZyYYiHyUgRod4sHiPcyJyPqaIcxU9WcTv80bvZZPGSOjXqN3Dl3plRFkSq/bsWIWZKaX/y
	4eV7PCnNBoGtZRMz20xJFeERdX1u0l1ZacropL+AZfSHlL3hSY6CysFB6IAKwL2/4f2VE4pyaow
	M23t0FObEGcdgY0zg+nXgGDJFJvPWHnE10OWQXY8uxE9OHATqFn9/nFtbG9vfBWxRZt8Yf6R60A
	beOpG6KOyNm72kCFXgb5YVa3S
X-Received: by 2002:a05:620a:438d:b0:7ce:bc7b:1d0d with SMTP id af79cd13be357-7cebc7b288emr569707985a.38.1747652324675;
        Mon, 19 May 2025 03:58:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG38H3cHcZDLnYTmh+6whPIorhfzFE5GyS34FL7x9/2wg2Uv4PTcUIPRws98NMik6MAgAHrpA==
X-Received: by 2002:a05:620a:438d:b0:7ce:bc7b:1d0d with SMTP id af79cd13be357-7cebc7b288emr569705485a.38.1747652324358;
        Mon, 19 May 2025 03:58:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] drm/display: hdmi: provide common code to get Audio Clock Recovery params
Date: Mon, 19 May 2025 13:58:31 +0300
Message-Id: <174637445761.1385605.12669862804792916978.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
References: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: E1fTGO9awFp0SiGc-in3UpP3ENMkfyaV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfXzpdD/vQgkxis
 9Z6DFLZhqhwkWiwU8wN3RRfuPra+LoPo+x3Oq6ng7f0BdNPQ0/lsQltZzR5kClpsFuQYXO30kta
 /+FQ3U16zAyVf6beYf4mmFlQgdTZojECf/6bjnrqUH0D6n7cu8eHLWOXSgAupjX+rhfLdw0r3gU
 Tx3WHoNFE4Df9OJA35L7/zOrfzvD04st4zsXkP6xFWJW1XFe+bMrEfDl5pphw7F2WCIShWMCVYH
 2xRzMRzCH1slMQNNgviRiMof+6hdCplTTolfG0ncEDjQYmg7bFIcq1MZqmPGpl3Cp2+UjAnSisb
 hmxAOatsKfWZ/VeFpfZCt9BgmkqxKygoKxYhhCrIB8yyRKxrlhD/rHGKAETnRJUZRqh820jt/rT
 X6RtcCE/exXqMvyICetNW/FpKeECrqZLeyfbbUDMfZoM5Xv3G9OSKfuZLTHnVWI7UwnawQro
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682b0eee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=OVqkDxUf0f5yx8408MQA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: E1fTGO9awFp0SiGc-in3UpP3ENMkfyaV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=879 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190104


On Tue, 08 Apr 2025 16:54:24 +0300, Dmitry Baryshkov wrote:
> HDMI standards define a recommended set of values to be used for Audio
> Clock Regeneration. Nevertheless, each HDMI driver dealing with audio
> implements its own way to determine those values. Implement a common
> helper and use it for MSM HDMI (tested), VC4 and DW-HDMI (compile-tested
> only) drivers.
> 
> Note, this helper simply implements the database for these values (HDMI
> Section 7.2). The question of selecting supported formats and rates
> should be handled by sound/soc/codecs/hdmi-codec.c (pretty much like it
> is handled by sound/pci/hda/patch_hdmi.c).
> 
> [...]

Applied, thanks!

[2/3] drm/msm/hdmi: move msm_hdmi_audio_update() out of msm_hdmi_set_timings()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1735917ac44a
[3/3] drm/msm/hdmi: use new helper for ACR tables
      https://gitlab.freedesktop.org/lumag/msm/-/commit/88321e3529f1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

