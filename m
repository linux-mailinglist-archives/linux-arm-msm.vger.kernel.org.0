Return-Path: <linux-arm-msm+bounces-93433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAqUKq5nl2nfxwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 20:42:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F26516219D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 20:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37FE43010DA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 19:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096AF2D0600;
	Thu, 19 Feb 2026 19:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sz1AkQez";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BAGRaHoe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4853093BB
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 19:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771530145; cv=none; b=iJaJkM7/AZOjwbwsYAsoywMn7x6CHgcgon2ixrz+LlnbdM3yvivq1288jBHHextFuUz7ZZBZnzzjIoycS8zMTujgDzELvBUrTSSLHN9sxTVV6ayVAtkGK3FWek4XbIrkC4Mk3NX+CCcHoYEOK4JxAZQz+5fRUjh61sP8+GHAJY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771530145; c=relaxed/simple;
	bh=PAsr7RKpRh4Zf8DPdD6LFZCa0OxAbNZCOIz0Hbu5ZS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SoUAB591xWc89nUzHg85/AxUGL8hAIPMVRJgCaYhWGI+5MIl9mak6EXm2Am0UlCf2aDAwsPLgv4S9NLN0oNVyem1zMR2IQKjrG6VwcGP07/zSdZjR2VRHoIpO8iuLANxjx41uAJV94a70DKraItMQUdW46E9aO3vz0GnA5tJzCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sz1AkQez; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BAGRaHoe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCtwfN3915262
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 19:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sqVevzHA5yFYdbn4seYcAEFxgZSYb3dH9h1uQYK5+vc=; b=Sz1AkQez6keY1MSh
	QwO1Th8Who8Gg/x7ChJPUMx2HZCqpHAtvNmHavqJcKyzzCL8LoHZLm5Q58l7tPOo
	L1RgQ6b/rcW1h1l0t6xv3c+CrLB5CFL5zqOihuSldE3Ae/kUmZOw7k8oWDyJyc0R
	r5hC0SzLt1YSTtHakD07f6idnMkpe7wS65H2LcgkJqBsKjVr1Ilc80lmXtEgNSz9
	BedTN5BjFnQ5uvPYVOafSaZ5vtuSHzMI1Np6KrmpYtVNvBMJ9qGqp945Zj+ozR7W
	sC1OSqVaiSmWypVIsShtjbSq23FxrrFCUidQpBcTGNwMX0tg5YQkkbrUrPYpbzA3
	Vy6yIw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqdgb1p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 19:42:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aad5fc5b2fso11452655ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 11:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771530143; x=1772134943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sqVevzHA5yFYdbn4seYcAEFxgZSYb3dH9h1uQYK5+vc=;
        b=BAGRaHoe44Ye0ghnb/2iGGKiS+LGgqsOehbfc9+HyffB6yuVKcfsDmP3RHUo/RDqli
         VUjywaZjO7e9pCDUdxnYhd3bQt2hDkgZrMBU8u8AlreEWC9Pd7Giw3RUg4ZeWfmrYhuv
         MA/KySQ0QuRHQ+S2pHKeyoZKFcgsNkF/zlXxf+hU4cZ35aI0u85/mmdEL70R0icYpJu6
         Ma12isQvi4T+RicxHK0Oea+hbBM0qzdFTmENfRE1p6tr6EJAdUSeDjGj8eGfi2+O3wmu
         5k8cCuFH9+PjgYIwEJngMCtvWd0MzdJ3zaJQoyBt1DVRIJi8+vIVM1ip9Vt27JOE3CPN
         Ukng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771530143; x=1772134943;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sqVevzHA5yFYdbn4seYcAEFxgZSYb3dH9h1uQYK5+vc=;
        b=mguFMg92DONtgjX7FDan5mMdRcI1iCUacUu5Y9nDg4Hw/5RnoepTvgiqBLmixysRCG
         JPDtJsJfoSR5zKQDIx1UG2qfbGiEjHiV2cpf0hrRnxzmkl0EMTDVmx/53zfs/nYDjdLs
         SVR79y8FcsVb9yNWOMH+nw54Ydqs4FKhAZ78EIHUsDWK46e/DN8K88iFIeidN2V7wjNy
         INMLcsQwKCWRZm/5wV2njXFLDZtl0g121Kv/tUTCjRz3VHfe3hqmG9/2N8KgZUhBjjH9
         6lmGb+So08j6km+Jz2BA0jYRpCdMqAzokiK3TSjCLSyjcIx2DHKNsj12fxSTsWlihPsM
         WStw==
X-Forwarded-Encrypted: i=1; AJvYcCWnsGp2SlDjYzscWILO6DZgRsm+DuXAHyvvhYE7di48PzMQETGep5Ii5GJUii0e4nAkQyCG1ZoRzIJPLjBD@vger.kernel.org
X-Gm-Message-State: AOJu0YzaqmV9KAyzvI8cflyI/FaxVVMiX5jywPd5qypwdJGYH8Mu3kPv
	pHQha4A3Gpr327DOp9m5wOyDv7Z1t9/gBHNXyttVodgjo6kOABT9YyttFiGfRK+ZhOGT2IAudMb
	HgAUU5XQUIali0iMdJk7NTZpbx9nGPKNDn9aMDfxPcaCJgG3l9iBwkLBMk7VIESWTBhxg
X-Gm-Gg: AZuq6aICX24qiz2s14TR7YYc3YCciCelsOuRrPP3ccZlYt5PBfA+yEd9j2ae1pb5LjO
	rygSzVqCK1llXDzaN+JhC9joSXT/wd58EcgpkgKz9WTnAoJOCsiJBzqgmga2rKK6rcW7dMI9lJe
	l9GN+hgbiaiVdI94r81Gp/5NTGKUpWwQLrL+WXV2Z+iJu2IC7RPhegn8yiFz3tG99B2ot3its2h
	BGIj09zJJvDqJeVCMchdNMBGJL5QHtwiWxi3KRfKsUI0QvPy+ToeTJiLeFQBACQRgimAvU1jSv6
	esW+mRnibriiHG7vPr99FLPwi3Vce481jewKussH/tImBf98apoPXqtxxm0n4EwPUrKI3txuyjD
	RYJQ8zYA2gG3B2x1ZSS91EeEyrk1iCLuSM0jZNTrG9CUQBg==
X-Received: by 2002:a17:903:286:b0:2ab:2633:d986 with SMTP id d9443c01a7336-2ad50f9fcf5mr59629755ad.49.1771530142881;
        Thu, 19 Feb 2026 11:42:22 -0800 (PST)
X-Received: by 2002:a17:903:286:b0:2ab:2633:d986 with SMTP id d9443c01a7336-2ad50f9fcf5mr59629445ad.49.1771530142357;
        Thu, 19 Feb 2026 11:42:22 -0800 (PST)
Received: from [192.168.1.6] ([106.222.231.214])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6fa229sm169698005ad.18.2026.02.19.11.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 11:42:22 -0800 (PST)
Message-ID: <d3119277-3205-49cb-81c6-1b12d10c5ec8@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 01:12:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: add missing MODULE_DEVICE_ID definitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Lo=C3=AFc_Minier?= <loic.minier@oss.qualcomm.com>
References: <20260219-msm-device-id-v1-1-9e7315a6fd20@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260219-msm-device-id-v1-1-9e7315a6fd20@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZjfXSqKKN5oEDcfuIsd-OfZsZ1jT99zi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE3OSBTYWx0ZWRfX3K5qEL8K9k5x
 Z+pjIds1bqlTNCmgN5D51xH73t7XT8tVVked0GUueGToCxyLTcexth0UMiWJdQAm95krrT1aWa7
 le0nz2AwV4sFBENI6J4RrUJdlOpaZUYoyEh2RgPKagH9vDd/3vydWGeYiunJoLso1T6VfCcLkBw
 Ux0lkdlwkglELnfrg3NKwuJB/pvf1e9hKUZmgfus8rtq+aJzfyt9ZqXZiD/cpvBCDMNgbqas4+1
 7+m4poXB5LQ/RNHdQcx8Ph15ptyGmtW63rghxbwkhpTasQ7yvVZrwvVQGsRZSRjr9dYSVyJbjeX
 Ic/ZsE7g5hUU6JHI720PyslnzydetLhdk5x+NGU7PeE61kd8mgInHzaQhgo1JA5+4NJSpJMUM81
 R3uMU185/ByK/L96nMd0SKOT/7P6HDWOdT52z6uFYJOWZLSc5DJDASahf03qSKex+6+CXyi8qEH
 5xEeb4sDUksB61OubkA==
X-Proofpoint-GUID: ZjfXSqKKN5oEDcfuIsd-OfZsZ1jT99zi
X-Authority-Analysis: v=2.4 cv=W/M1lBWk c=1 sm=1 tr=0 ts=6997679f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ak1KJoLj4JlN8czLuyNMyw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fs4y5QUGM0Q0NtUbLCQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190179
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93433-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F26516219D
X-Rspamd-Action: no action

On 2/19/2026 5:49 PM, Dmitry Baryshkov wrote:
> The drm/msm module bundles several drivers, each of them having a
> separate OF match table, however only MDSS (subsystem) and KMS devices
> had corresponding MODULE_DEVICE_ID tables. Thus, if the platform has
> enabled only the GPU device (without enabling display counterparts), the
> module will not be picked up and loaded by userspace.
> 
> Add MODULE_DEVICE_ID to the GPU driver and to all other drivers in this
> module.
> 
> Fixes: 55459968176f ("drm/msm: add a330/apq8x74")
> Reported-by: Loïc Minier <loic.minier@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> The Fixes tag points to the first commit introducing OF-based GPU
> matching (and thus possibility for the headless GPU binding). Other
> are not usable without the main MDP4 / MDP5 / DPU drivers, so they
> didn't get the Fixes tags of their own.
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
>  drivers/gpu/drm/msm/dp/dp_display.c        | 1 +
>  drivers/gpu/drm/msm/dsi/dsi.c              | 1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      | 1 +
>  drivers/gpu/drm/msm/hdmi/hdmi.c            | 1 +
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c        | 1 +
>  6 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 554d746f115b..4edfe80c5be7 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -302,6 +302,7 @@ static const struct of_device_id dt_match[] = {
>  	{ .compatible = "qcom,kgsl-3d0" },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, dt_match);
>  
>  static int adreno_runtime_resume(struct device *dev)
>  {
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 476848bf8cd1..d2124d625485 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -210,6 +210,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
>  	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, msm_dp_dt_match);
>  
>  static struct msm_dp_display_private *dev_get_dp_display_private(struct device *dev)
>  {
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index d8bb40ef820e..3c9f01ed6271 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -198,6 +198,7 @@ static const struct of_device_id dt_match[] = {
>  	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290" },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, dt_match);
>  
>  static const struct dev_pm_ops dsi_pm_ops = {
>  	SET_RUNTIME_PM_OPS(msm_dsi_runtime_suspend, msm_dsi_runtime_resume, NULL)
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 7937266de1d2..c59375aaae19 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -582,6 +582,7 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>  #endif
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, dsi_phy_dt_match);
>  
>  /*
>   * Currently, we only support one SoC for each PHY type. When we have multiple
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 5afac09c0d33..d5ef5089c9e9 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -441,6 +441,7 @@ static const struct of_device_id msm_hdmi_dt_match[] = {
>  	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8960_config },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, msm_hdmi_dt_match);
>  
>  static struct platform_driver msm_hdmi_driver = {
>  	.probe = msm_hdmi_dev_probe,
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> index 667573f1db7c..f726555bb681 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> @@ -204,6 +204,7 @@ static const struct of_device_id msm_hdmi_phy_dt_match[] = {
>  	  .data = &msm_hdmi_phy_8998_cfg },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, msm_hdmi_phy_dt_match);
>  
>  static struct platform_driver msm_hdmi_phy_platform_driver = {
>  	.probe      = msm_hdmi_phy_probe,
> 

https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
fwiw, there was a related patch that I posted recently. We can drop that.

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.

> ---
> base-commit: fe9e3edb6a215515d1148d32a5c445c5bdd7916f
> change-id: 20260219-msm-device-id-84b95d22c0b0
> 
> Best regards,


