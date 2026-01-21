Return-Path: <linux-arm-msm+bounces-90093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KVICb1hcWkHGgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 00:31:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 087FB5F8BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 00:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 692BC4A786A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 23:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F0F3D3487;
	Wed, 21 Jan 2026 23:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LsYJEeYi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bf107Poy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE9F3502BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 23:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769038101; cv=none; b=IcQdUjbtgoQTy/2LuHQ15GbGX82s/NRUfOckfjuA1OwfEku8i8CVh5AnMgNpbeXfgE50UfFRoCWvZL1HALrbkUNxFL+ZWb5Lim9AONtoSeV1Q1MO4wUep2J0TRhl63pEm4A/1zw8myR9RRBfTk2J6FESv36oJQhzYrGxmQSGI1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769038101; c=relaxed/simple;
	bh=Xd/bUR6GSxx/NQjlNNdkWM8C2bxnPMSGrkWJuJSHrAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W44DAQSKOw41HTq6SDpgRwM0Y6w8rtvgcOf0voWjWcOXdPD4oh6+gGMt7O+rB1pJ4Xa1qt9pTP+km6cOlUpC7phrQNXxook4HuNSV47i95yeHFXoijcaC2Ht0L2OmfLeQ7GDQBiJMRGJuDs4yRx7ADV3uCqBG0Gu0Qx1uGzJna0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LsYJEeYi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bf107Poy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LMrY3u1407479
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 23:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CIkXGiXGM2ebkuHAMk/WlBNfG8pEKh2PCRvMi0qD2oE=; b=LsYJEeYiZi+ir41k
	/M/p7bmy9BEKyhWDeC7X1Px29QRBF022A4oM9VxXfFdXLw6K+6YZf7QSM9jfN8wz
	yB8YPz1qsU6aJd588a6ip/C+gEAB/HvaW2y46b2BgwE0cwJyCqFisqoI8rlc1bRA
	NjHtqU9lPWMBrNUcljNhFJtHnTS0QlNfvA/ksPLUsxRpOTJhRjmzfNo1GfyC/Fny
	mnkJpBLhWWestCkx+Oe7CCz1IJFjHxPuP2e1nWfcrs3x9h9rJRYOe5Rse7WHJ8lU
	Xe2fBsXNXzxx4SOeOltJ7QPkmgoFbt/nzz3hq8C3N84SQFpuf7NhLaRoJxbumDAL
	c2rAYg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu802r3ys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 23:28:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a69b7813so96794285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 15:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769038096; x=1769642896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIkXGiXGM2ebkuHAMk/WlBNfG8pEKh2PCRvMi0qD2oE=;
        b=bf107Poyb0syVvjYhstsMkJBVxHCaeiJ0gok+T0KNmM8b4L8GCgTiZ59ZkIALCn6Jd
         YDS+/4Af2E1szgYpX57kwty0j6Z0Wn8EOQ2oDenYv8y5082Gj854oHBW1AQI2+k3gcqb
         zstevTN6Tlpchix87OiVr5I/9Yt5bD8IICJTcbMRYSTkG55UypxHKDfGH+rBvgfgrJgB
         x5RQ89K4UO96VodUUd140xYi22TeLMgn7gW1oaDL0NMyHk6epVUZ107mF16k+UQrXQmw
         OWzOO9LB8AEWwde/H2AC3AatshOIIthSDGpKgauVcaAdAMbI/C2kuNnVjs4UsUjjMwbB
         phIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769038096; x=1769642896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CIkXGiXGM2ebkuHAMk/WlBNfG8pEKh2PCRvMi0qD2oE=;
        b=JUcSxsqdMt5ChOXzh25HNgQWZAJyLzuML2oirS9oDJVFFTr+e1tiHWtQNCj9HKFE3B
         Sd0c6dc6DLiLU4etNbfbPtXAbcqG6EkBrklU+fhTsCp7or7U9NuODQDUeOi5jZBRghza
         xwZOGoXzVLunTCebjdAmQPmCkW0+1G3HT5+ZMcuDqQlwNDbLmnDDovWaDQAJGok20ltW
         6eDoNbhUFO7ppq9q4fnP3da9a6OT542S8K0yg6bpHzU2wSVJh50sFedpqZjVQ95MLLJH
         uCIrQiflt+0fkbc2PIAMboRg7CYowDSwbSB+1pTGNcJB7P0QatFwtwT8z6FYVX4asuj8
         VsoQ==
X-Gm-Message-State: AOJu0YyGkyWTdpfiEyJm1zsok7L0ZWH/BATpchBn/CVa/oeMeHt7zG4F
	hcEIB+AzzJdnAlLkS8L7LkOiJD0tzcYBIDE6op5UlsSNf3URf3QDI/fuwKI/ZKN1nUf7vXRWWPg
	4lwyWMHL0KAS2F62fMFc2nRO7chsw5d3zvibCApzEa/E/ZuDfhCF+BVPiCRanYsp03tGL
X-Gm-Gg: AZuq6aJd9Pd16bTuHfgJ9s1NbxQMqQcQNRXuh/gov5srBZdM+o30vsDnGTgbivrgC+1
	i9oJEIec1PDDykpyxKbA/RtraSWlOxx/dWUtx+lKdNLj85EqVn8oRNCI8i7kkarKR73dGs8f+es
	JDawRyKaJE6Apdp3fGtCbEBPvN/9pNk+Wi2pYhkehCk4v9pK2sbDDWRYaENS9SAi6/+0GIho42X
	D8l/yTBjbcEPION6vIsemQW2yHaR5SQrzDgY8pcbmBMVjD8HPpcWDqshchGiexmqXlRLHvOJNXB
	9DbPkT5x053uGDrjEr1H00+EdJ7X3eDQ/rt/fxQnD8tn03ocJ/vwzE++2iru8z432m9m6PRFiny
	zEAZTjbR7+nCX20l4euAtYNJ1Fj67LD23/EXF3yzewrNuTd+ozhZJKzQyKB31Jej/JGdY95BsIG
	sEDx0nhPN3wUetdv8DpslZFM4=
X-Received: by 2002:a05:620a:4729:b0:8c6:3c47:74cb with SMTP id af79cd13be357-8c6a693b459mr2526855685a.49.1769038095916;
        Wed, 21 Jan 2026 15:28:15 -0800 (PST)
X-Received: by 2002:a05:620a:4729:b0:8c6:3c47:74cb with SMTP id af79cd13be357-8c6a693b459mr2526852285a.49.1769038095495;
        Wed, 21 Jan 2026 15:28:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm5159393e87.66.2026.01.21.15.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 15:28:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Federico Amedeo Izzo <federico@izzo.pro>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        nicola@corna.info, David Heidelberg <david@ixit.cz>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v3] drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property
Date: Thu, 22 Jan 2026 01:28:11 +0200
Message-ID: <176903808261.3665431.13908299143545119394.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
References: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TcWbdBQh c=1 sm=1 tr=0 ts=69716110 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=nOrPF5vehO7w3AbniEYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE5NyBTYWx0ZWRfX/Vnggxp9RrQ2
 MYA8QcAe4a6U6qLOoCyrnBZXVvvquf5nWp+J6nQgZL7h/EJxVotQF/Owbz8hoNyLlZ40LLYwShc
 A5AtUKj2LU0nTC2DYoOOxDChbuNF/3XJMaaIJVdqfZURvwUx99zYsqTnj+RSUTFlaxdMZYpjfub
 BAowB5jnFn99m6irMmqiOIalz1B2C6GNEGWYKJmExEKkzdrFDEDGA3HPHsq8Ys5bL5rjAfJQ52b
 d+JQFiHahdyHcbTwFteqewF0uyRYRx6ZjELcLoUwUslRp89yxwJK3vwnLOkBkcvTLQrBvfIkLfO
 GPYJFdPyoQso3xbFMbyGITEEsDR5H2DQD06kfNFAk8IMPzWI7xQPuPo/4fMMxbI/KpV49xdajFo
 RZBCVW9OpwXESlo/Z4UxrWNdHbQbbhdTGwCeilGlQk9ufrU1gBQZhybWsX13shXuXl5G1SptTB3
 dPYQjlEuMQN5ksTgaMQ==
X-Proofpoint-ORIG-GUID: p-Ot36hWbFz-W9icu-RWk4f49ykaeMs9
X-Proofpoint-GUID: p-Ot36hWbFz-W9icu-RWk4f49ykaeMs9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210197
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-90093-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,izzo.pro];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 087FB5F8BA
X-Rspamd-Action: no action

On Sun, 19 Oct 2025 12:06:32 +0200, Federico Amedeo Izzo wrote:
> Add support for DSPP GC block in DPU driver for Qualcomm SoCs.
> Expose the GAMMA_LUT DRM property, which is needed to enable
> night light and basic screen color calibration.
> 
> I used LineageOS downstream kernel as a reference and found the LUT
> format by trial-and-error on OnePlus 6.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property
      https://gitlab.freedesktop.org/lumag/msm/-/commit/39a750ff5fc9

Best regards,
-- 
With best wishes
Dmitry



