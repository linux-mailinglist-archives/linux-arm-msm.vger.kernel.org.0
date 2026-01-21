Return-Path: <linux-arm-msm+bounces-89931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FNvMwUqcGmyWwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:21:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 764D54F00D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 298057C9CE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 01:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A974308F36;
	Wed, 21 Jan 2026 01:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hr1P/qtU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZJpXHr9F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7493305046
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768958426; cv=none; b=i3LYqUAsioQNrqbGY897wudse7z5XlIplWiMIoT/I5mM1vopHXPD9/UTEGkxwyIhtHZl9QKSObvukKO0hiQXneSSiUoKN7xPqpuAR6nW6EmEUdQphuLbs1UGZfhjKGZ1ZXoS5q52mmOIXN0Q5/VOq8GT/WYOTeT5AIwA2IXtuMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768958426; c=relaxed/simple;
	bh=5JB8AC3trGOjYiMF/Fhq2Y/HUQB/85ZeqzwnPtq0T6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H/m3u10CZaweGljKW+vcn4HZVqzCM63ziYWzKX0v+LmkxM1oc1XJRpfpDUPvm4YPTwGQpTtn3gEQXUeSuiLxhrS2l26Jsg5ZH1ROyysYaAtdhxKYROO8PASH28NuFpw53rO2VRG79/wNm0IA5SHNDa+Znpw8z8uu/UoL3k8OUZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hr1P/qtU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZJpXHr9F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KL81Tm877870
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SjgczTXYiWgn6KeOMDJeRiu//VOKNRfEUziRnabI0X0=; b=hr1P/qtUchIEMSyS
	/QFTy8tYPQsm4DK/WNGlunWEUyu4EOrdbGWx9wwM2SW4XsXRZi2Cpa0i7R91XeOu
	6S4Y/aQtsUlgC9A3z/eWEgjXekbYomPtlpH5BMCeOJaOhX0zHTf6WnqVDEGSKjw7
	S14gsLEeinbfW5oAry/tPRB/8HRQDz7OaF/+XoyEUXWH8o1BvfVuc5wJ75A2VBrn
	7O8sTAya1ouGm3y+Rus8W0+CARRlwV+3zzgWsYVtH/prSfZg7ZRH6XaaECMnqLhm
	XGuAOEKvFqPe0hFrXvIdhk9P0ZjV4xS7f4lf2VLz2Le0eKVNRxRL87P9EZUusYd/
	zDhvrw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta42jbrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:20:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a4c50fe5so331585185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 17:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768958423; x=1769563223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjgczTXYiWgn6KeOMDJeRiu//VOKNRfEUziRnabI0X0=;
        b=ZJpXHr9FUGBZogTP2daHK/aXAIO6QMm7KgK8reBgXewOi79FJ7OcdOJNwakKvkAdXt
         pn40JuWPBUqRKsSMxPJtpzD3/V3pLU6SLKggHyRm4Az5lko6me+2ABbLOle5J0QK+uK7
         2etfYIAZJcHi8l4+5yuV+bzKK4AbxukhFnX7nDBrN6fdK41WK7UoGCKdAuvvbnV6ikpR
         r8zQET5llw2FEtzVnMDdhNhsWKRzpgx5/KsqEBVZk2+hlgo+efOE8e3rTvA3BT3Y2HYb
         5Ec4EJskqBbpe6kd7j4u8Tb5m3BUNpAgp+cN5kOUyRFXKuDVdYvaVAggpCnfMO2XdBpO
         H9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768958423; x=1769563223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SjgczTXYiWgn6KeOMDJeRiu//VOKNRfEUziRnabI0X0=;
        b=CbRLzX4s1RAiwSLmLlE+WX/ZbNvywLupPwU4qCtDXJg/8hsaAlFzFy8ogJs5zQBCgj
         k7cAN9AE0coy+LrfL71SJ87zMMjY3kJdY3fQcuvIxBWHDQ9PAyQesu8NCAKC2mZ/mjDe
         XF4slB21h/e/jcMXAJRMsVr7n20wsvAOg+np3bcagHKdQJmN1BS6/eoyO7o0rzIGcGJ9
         GnR5VVXCarZCKoRPCyZGayc8SsP0QDrB8990442rprGBDwKDR8how4gNw/MFal3CU84A
         xIsAejZAjJmoFh8gT6gRk4hWHywqrcy/b6oNKU6rV9LABOuS92hFcwBHHRL/6hv4FUyb
         aDxw==
X-Gm-Message-State: AOJu0Ywtu3vI6XvawFvQi0n0+5w3GlQVvJy7dsK0x30WiYqMdqt2DbG0
	UCHAmR5Q4kado3IJ5pRrWb6IZIJXSCkGXVgDCZB2TDT1HcnyqNYdzP9J7G9F05Rj4l99znfKsVw
	Cf9K+r0Ex1hUuStA6B5f9KEcdehBuVV5vhMA1/LzFb6CREKjIMbACZ4HBmGWkiCl58Y+3
X-Gm-Gg: AZuq6aK682Qq0Jf2O/Fs+fjwUvs5HXivf5iYRMPJ++pUBUCeaenmof5mpohI1bHsq5G
	9G29XBsLN4o5J5isPBbVXqw8ccXZqmywDEdFa7MyQpRq7kYHGkJWLD5a30z/QXtDXzD7nv0Hpxd
	k2+0P/E8hLIR19nN3t5iUFTulZlWh6iKPXteiY8gXf8MkdKmWveI/GEuFsTQKXH68GsSSgbaUHi
	rvQgLV59luCUz82PduFeZNZibcjJP8KgNvw9yo4cO7BNlVK6ziN4dBPOUuAtsmd/zyNkzaX2Xz0
	d+9gDGBe/HRl8NZFCe4k5m6UGsnf07rVtpHvBAzLGeNdXyU9ZTs53G0LBZFh4TVGYa75/LtKEzk
	K+V3jDQGIuWYOi4rM5E1WQRgLos8btdFMLE2bU2EqJiZr4Gmgw/VY7VdImk9XGQSqfJjTHVjWwL
	rP2aPmZgWolxNcJO2UXbjgvLs=
X-Received: by 2002:a05:620a:1a94:b0:8b5:e783:933a with SMTP id af79cd13be357-8c6a69623a5mr2053346885a.77.1768958423091;
        Tue, 20 Jan 2026 17:20:23 -0800 (PST)
X-Received: by 2002:a05:620a:1a94:b0:8b5:e783:933a with SMTP id af79cd13be357-8c6a69623a5mr2053343585a.77.1768958422624;
        Tue, 20 Jan 2026 17:20:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3543d2sm4383110e87.43.2026.01.20.17.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 17:20:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH v4 0/4] drm/msm: UBWC-related fixes
Date: Wed, 21 Jan 2026 03:20:19 +0200
Message-ID: <176895840441.3580355.7884163607590067842.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDAwOSBTYWx0ZWRfX/w45zd3AYBwR
 /UdLwpIvyXDNxB3NuYHEFGLc/d5Jk9xJ3/X+6IHiXk4xzM56jfpP6kHIUZE2x1APVHkDekYjT7n
 Vm+S9joWcokS9pr0XP7ODE3IBlYJWsF2rzXmLcsvPJa9PaYTZd6UVi4X+NNtwpqX9mqEFuYDS56
 sMw8phrDJh3Wr8AwnliKVcl3w6QoJIlOzSHr02R3EUYfBBINk6oRsuBkVehgGjcLzaBSYu+L/Z3
 XLW9q5eTfOEdq6lej171vrUgErS1TxmOLPo2zBJ8x7yZNGsuH6Onn9QPEeIbC0t6tNoSuoJKcwE
 rwuUIERsbPLLFsRyHUgS7rykh5f35hAzSPUwAmsyDN042uzhR4XDqAxGE/dIDT+P7GMMc31urLa
 FQEbiz1wAIp/UA05zZvKN0HVJ1wwtCWXAVa5hQZO7AEBAXPsQX/nY8IBgMizz6ggAi0y+xkqzGY
 rmiW7hJWHZe05x79w3w==
X-Proofpoint-GUID: EA7U_OOh-89DV2q0gEr4Rxqsggoa1I5f
X-Proofpoint-ORIG-GUID: EA7U_OOh-89DV2q0gEr4Rxqsggoa1I5f
X-Authority-Analysis: v=2.4 cv=JeSxbEKV c=1 sm=1 tr=0 ts=697029d8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=jLAEXdeIpK8u8Ys3by8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210009
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89931-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 764D54F00D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 19 Jan 2026 14:16:36 +0200, Dmitry Baryshkov wrote:
> Fix several bugs, possibly causing image corruption when using UBWC with
> the drm/msm driver.
> 
> 

Applied to msm-next, thanks!

[1/4] drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e6177c7a2401
[2/4] drm/msm/dpu: offset HBB values written to DPU by -13
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7ead14d4b974
[3/4] drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5dcec3fc1311
[4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on UBWC 5.x+
      https://gitlab.freedesktop.org/lumag/msm/-/commit/258b080dc280

Best regards,
-- 
With best wishes
Dmitry



