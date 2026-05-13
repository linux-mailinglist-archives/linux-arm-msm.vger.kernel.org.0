Return-Path: <linux-arm-msm+bounces-107218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +L6xD9TMA2rx+gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 02:59:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6B252BB0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 02:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 025F7303C9B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 00:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C352DB7BE;
	Wed, 13 May 2026 00:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I0Ze3l0w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZi341R0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F03E2BE7B6
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 00:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778633797; cv=none; b=MOXfaJ3F50PCaspigoefLp6w2Jzupd0ELfEa7vUJ1QQYLyisIFLHmmtxeSUOwUkowTFHWVJ8IqZWlSbzed/M/hiu65ffdL3C5jHl1Psxl1DGrfNOvFodOck3CwyNhE6iihWOgsLRFF2pT5Zacd8kEcJEdnu5nCnb+1ahD0nwJMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778633797; c=relaxed/simple;
	bh=Yb3J+fEuGRyq7ZLtKG3EHSz4iTEJXTNsMix5jmHEJeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owY5ZcYdMQx8fBAxyqg5di0OITnCoUTux3M3uFiBETBEvJ3fqIUUE+k7VV4H8kx6v3ek55fnaD2ofuUXldD6n8k536qkSEav3I6c/zZho6LXy6DYGykU86tmSayUdUBUObLfuyKVLxQOLwD0KlJ8WR6v9MTBFyarAPtJBBNG5EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I0Ze3l0w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZi341R0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D09aQc2044931
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 00:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mzNLFy7qn99ru8thZNqnPLo+
	PSOhBVDWPxQDFQ9+vKU=; b=I0Ze3l0wSevWWO/1g+bC0dDKuh4CtIkeYpHbBK+0
	TJLb61Wamee5UZnh4ea4QNnP1HJfFD/4qVLLDEPPfhKHsEKjJFiRjLP887UCYu9l
	5xkpy1JhFSXOOegG0G7B6FUGHAidHoZzX1twipl732y3LgPCsltRBfu3aKAaHTfC
	iYVzlwKKkmGeu7TO2MPk0g6C152aPUI4RMM3BY3DDsZ+ZeKF+sVbxLAsG1SQbQzv
	THCmsnrYswlHVZt71bvmekPLPsYFqclBxSXPvEUBh1NlJ5kit1P8S/vQXSBgBYho
	1NJNH5ScYVpCIBriSwfGjel9moyJAFjgVgN9ypx7I/s4NQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e45avj9xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 00:56:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514b673c8f1so25134231cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778633787; x=1779238587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mzNLFy7qn99ru8thZNqnPLo+PSOhBVDWPxQDFQ9+vKU=;
        b=RZi341R068VutXyQ2khmIGuA8SBSN6km/pPL1Zvn82ZIBRjFBPloyeUSIqLibS1OC4
         Xf264uKHYHJoTH9st5+p1tOpdPwoR0+0tK+zjvmQSlz/WHEMdiDMYkz7YULXjLBu9KkS
         WFj7tkSGhFr3LvxhbFwmIxYZ5hX83ppn3n0nYhtFgmJ5yX3434iiNfO1egRNrWcGQVwe
         UxVdVqrWlyj5DfVTwJiZ0geiWvCPoylmxHYQUbilbhhDDBZApo+aqxiOtruKy9LpKezZ
         I2dBfzdH9QLkAjdevYShYliRv2c6EyRlpY8AtPNkFhaEclGAL/WqhXiKdYgwlYWg2lZ2
         1d1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778633787; x=1779238587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzNLFy7qn99ru8thZNqnPLo+PSOhBVDWPxQDFQ9+vKU=;
        b=guwGcBcprDffevDujTJFAxUsmEDBIPFs/PnI10ubc2DluDWboA3Nr6kPukw59lneQn
         JNGc7C/KAEXwyFJYvmqhNn8o4JP7Nob5+gQtXJTJwYL5qxaLLbAdDvpz6sdLKiDbVLxA
         1NzvJyVvqexyN8OtOOf4fecXMqbMTiV3CP05+cDuCCb+vsNZ4IJehwqulggRDKOyBtHl
         iBUpqeCAVSgjtc4NVp8jZsy2X7Fcjy16/CPbEOVbEseAbI625uJR8oD3YSzKzge4eQtu
         BTkQb75m2Gbxh6o9RX/acwezKk81pgEmN0fzotuVZHk1HKj6IqoEG4oyVit0gAlHxmWa
         1syA==
X-Forwarded-Encrypted: i=1; AFNElJ8hJxxhU7LJPULmaYQQWN/cXsoFlVBYkizCCO8L4v/vkn369mG4AwGagOnrEUYO3H7Z2S3+4JIXaH7Rv/qj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/OsH3wzuwjT/ULlLqxBW0JxkbePo9lLzhimUrDNY46QHlGvi7
	1rRJpmrj7ANYHg8+KnMPfMepXTRWeatg4+IBf5AYjWosprNmYZ3ttlhEMUGDvxWXGB/S6uBXBzS
	8e4srrVNQgZr7Ww0NMRZvu7p4mp6lOKg8p8z7m12rQpn6Pc2t3LmBYmEYviVUwiznQkVH
X-Gm-Gg: Acq92OFSK1CmZ1Zr6GaTqMy4OJMGfK7BYwfDh9Ld74o2I18VAR1a3WlsNc0ZPFXov5Q
	uUVGRiEQUteT693FsDK4YBcR+gJB/vLvjuUOBLRmNhHRS2yuPt2v3EhrgGTwNsHuwNAbranTfxu
	O55J/4x8ouU5XgHzFacOyd89pdUBto5LEybRedsiyoNANZYPb6O0MqnAXe2+sxiyUMQ+HoZNHx+
	T8mN+2/SuMCIc8CrD8Cw7c9dwopwGzw3oWyDwT0qRk11/ZdK/HDDY/Y6MUsG9+MyU/CR3H/RYt5
	RXge1CGJMElgCXGBaOYemgCi8H4L0mGB/BvPg0v0NdF3q7Rf1wI4Lc6YbqTtIH2pTUJP9Ji5wKe
	ODf1Kr54wv5lRP2jVI2A5xtAfOU/eXUw78XGF+vNlKtQs8d180wSc6vovwhtbQqStTd5q0eNSQ6
	RGnMe3WJdUhxJDuidKt/hhws+0G0Ip1fnPTHo=
X-Received: by 2002:a05:622a:148e:b0:50f:c245:85fd with SMTP id d75a77b69052e-5162f58fd61mr15613871cf.31.1778633787217;
        Tue, 12 May 2026 17:56:27 -0700 (PDT)
X-Received: by 2002:a05:622a:148e:b0:50f:c245:85fd with SMTP id d75a77b69052e-5162f58fd61mr15613551cf.31.1778633786784;
        Tue, 12 May 2026 17:56:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db673sm36801131fa.23.2026.05.12.17.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 17:56:25 -0700 (PDT)
Date: Wed, 13 May 2026 03:56:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 1/5] drm/msm/adreno/a6xx: Mark cxpd device_link as
 stateless
Message-ID: <7s5lewbwd2lukd7o6djvc77vo2xdt6fbsthrjptlmgfqvwfm3q@t5zjnqcz4uar>
References: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
 <20260513-gmu-sync-state-fix-v1-1-6e33e6aa9b4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-gmu-sync-state-fix-v1-1-6e33e6aa9b4f@oss.qualcomm.com>
X-Proofpoint-GUID: ZTli_LQqf5yQdgyWsyUjLN5CWMyksch0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDAwNSBTYWx0ZWRfXxH5oU7/wLzMi
 pq8rClxSJ6no4REn0Toax7bw/TUoaMFc8TX4dwJsDxPB17bUpz8y5lKTPJ1vKL4mR9rTHzjRmRW
 6FldKZX/dAvb3iUMx0crgf46RCdLWigvqpwTYYba86eyh5Gtz34w6JT2MAxRAvKSiLzUUydBPuK
 I1xOV1bHEiKW957jJZzvwuOHUJK8SJ4XPlXZ9p9UO2dJd3jUN5e3rAbxWB6sEvR7g2UO0xU6ROb
 OwyE3CHQiQg7jjfawci77FbEPPesVu8hOV79NzHDhAjG0RpjLfVbXJV6egTcAc6O18Bf7t+X6N5
 MuUTNua0EXvfbh0TjytB/ASqVdvcjo8sowAbdMfrZ56+Cyo38YGZM9HzkREKGJ03HzZ5LY6KxYb
 ghImDzAx6h/1fYNSpYOnVUjyHUKcIm0aZGrFTQe56Sa8O/mNTpNz3PcBKl2OAiWwwcMA7ReUanN
 blr33Ag52G1EZr9jtXw==
X-Authority-Analysis: v=2.4 cv=bOwm5v+Z c=1 sm=1 tr=0 ts=6a03cc3b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=PZmcn8Ua7GWYR-nH1kIA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ZTli_LQqf5yQdgyWsyUjLN5CWMyksch0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130005
X-Rspamd-Queue-Id: 3F6B252BB0C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107218-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 02:22:56AM +0530, Akhil P Oommen wrote:
> Since the cxpd virtual device is a driverless device, it has no real
> struct device_driver bound it the way a normal platform device does. So,
> the managed lifecycle doesn't map cleanly onto it. Since the lifecycle of
> this device_link is managed by the msm driver, pass DL_FLAG_STATELESS
> together with the existing DL_FLAG_PM_RUNTIME flag.
> 
> This fix is required to avoid the below splat when a driver is attached to
> the GMU:
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

