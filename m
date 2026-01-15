Return-Path: <linux-arm-msm+bounces-89172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FBDD23690
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 99C21301F20F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620E5342509;
	Thu, 15 Jan 2026 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MhNRUBH8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UPSjRDBg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4E135B150
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768468775; cv=none; b=c/+aqnlnEsFzUY6KFUGLOUIZzrOjpw58LbxxiWojVJX9hf4VBtNaju+PXLtsBGYNBLvofWzoBFRLK3yyOUkpVhQVtq3Mj5iKl1QGvj04JyAUng5HwW84jMDEgm28HQfqlEbi6nCHOKfsxvUnnSZPd8w4d02rXb0h+JLLbzmep90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768468775; c=relaxed/simple;
	bh=6s8VUZHOjMk4dyYpQf1ss5Wiadtz5G/FFe3LYD+4uu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MI27TyyIXXlvY0/u3lZh/qzBdMMUnACk3WbP/dpLhtlToifRVGKQuYYdYX2VblChGo32Occi515m3WkN0Mggqm7ZFlrS6jwJSXQjLoNsnTBExY5NXfLt1QQjsSfsyaVyhFqg5eadiHwN09DXJxM919dQdm/jvXyqV4NnCMzA0fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MhNRUBH8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UPSjRDBg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g2ZG783431
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pURHtbp6VGKQeBQ/ldaen2l7gcfocWJuNey1NSuLoXc=; b=MhNRUBH8bvXRD6RZ
	ndIGPioDTeOHk0+CbIlS2sv7nj5KZRutmkVj5eprDgbygh7I1s2chnQW43pSv5Zv
	BjjTDnKRl9Def9ZPsAZfutqQBIcfhKO7enhGCtufkU8+JZwONHdk56CUIyMInfPO
	hHwcfmBfNnS7iBZVYm29ojxzPRW8GhIbxSai4Rx/U+anzDmVNF/UV2HYMpGLaDx1
	mXm79nAF0DazHGE5qLp7VsImtysj3slenQbZ8sNDw8RWoynkgYyus/NJTG09Ec8P
	TetSGZIUfTV+13+3WuO1ZRQpXpPXNELSL2S57lMZA3WckylJEbuqoZR8NWsfmWME
	vjuzyA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5kas4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:19:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c533f07450so24740985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768468772; x=1769073572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pURHtbp6VGKQeBQ/ldaen2l7gcfocWJuNey1NSuLoXc=;
        b=UPSjRDBg47Bf20Wo1Dp2J6anR9U0l7GWFpaqq02qyFOnJyItvYifCbqrzkGYZaQTu6
         Ip5SY2bZR4hbnxgru+EDiimma4naD/eVS2TTug9/5GIVZVlB8Wn1fwYCF6Z6rDfFDfgQ
         POPH2x2ZZquEwwXTiD52M9USItjM19vvPISCMZfIGT3BNiONWILlmMzyyaNjuSIyAk3z
         9dbdVl5xPzJcDY8tSrp2CsqTvkfbAA6+tnqDFBBcH/pTTUtc34rQwzF5TK9oBUoqLd0Z
         FoRhy8yRqkDMN5w7v9C0Qobt9zJ9HKoi54Y8RkfsxXo+4I96YKt2lj6KI8X9btZ6m2LS
         Fpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768468772; x=1769073572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pURHtbp6VGKQeBQ/ldaen2l7gcfocWJuNey1NSuLoXc=;
        b=eKdwPXelGExGDmSbZLCcSqFTI0ZQXBeSSsJ+UwWn6DwCF6lKD05Y9Zlh+MojKOAdmk
         Cq9jfeRYML93XAgvNkWR1QQJiYElgtxGbajtSvmaZDdC1PL2dSXtDsf7CYpufI1EFKEU
         DCMyrH+Je/6/CWabGiIEeFTTpAmnfFpdGmudMRpTh240/uF6nNSc9xLMGGTiYgz1NzDR
         Uf3aLQsPsGgMBCgfxsZ2Kq6Ori2nwHQm7L0TnEEfv1lIprOHQeFoPdpxrFE4FCTv3XwT
         5ka0ZrVyfF6kSAIH5Weu37bbf28D1vnaaP4ErzBfxRaxpG/o/K3Yx+HIXmBVAdUyeeh8
         hQ3w==
X-Gm-Message-State: AOJu0YypzzjPlryoPU7sWv5IC7aUI6ay9zJD9+pW/JFNnKOarvP3O2+s
	O8MdFG9m85kfwLkTKtkBIfaz9mtWn5zyVVdN1W6+IcO/mwqTcu/r5jTXRZgzTJhUKoV7ZPR8z3Z
	DzTKB7qNcUB2Upm8s5Ekc7t5ubLmoMj4Xjzg+V0q9stEpu3u9XNO4fLxr38IZ9EDJgOsH
X-Gm-Gg: AY/fxX75IEZVGTYgP+0Cj4nahIVMlhFRzoPr7qAnjhKynWu7oV0KBitTGZzk9EOnLGc
	hwfLv3oI3dt/LFajpGv+Jk+MU0ltW1SSzOu4HcH7tTHlWUwVYSsw+0cvtRrxgb9ronEdUo7IxWA
	9NBGxA/tippufBkzRPaNJ+LkQcWro5seSX/MO1F6Ss0//ZaFvJ3hGLYXCbvNqYb32EPZ2BxoNak
	cybHh/aJ3tVd00sTTQ3MMgYK9oJv6Ha6JeAwl+1rgxSbGB5VG2aypIGYuQO3YHqIbDq1PJduWQo
	uNE/3ho6Ej8R/X4SqV3WLCNFQErc2WTFFIi8mnZd6wfcguAPrj81KMI7unsle1PzxClBeB8v/O+
	ce8GUImPmsA+sUjPyrbW8BGTvLbQlW2qOJ+sywX92gUC2dKhAjAPJG/ov3kbSU36TYP0=
X-Received: by 2002:a05:620a:4154:b0:8c6:a22b:e11c with SMTP id af79cd13be357-8c6a22be2c5mr48271685a.1.1768468772062;
        Thu, 15 Jan 2026 01:19:32 -0800 (PST)
X-Received: by 2002:a05:620a:4154:b0:8c6:a22b:e11c with SMTP id af79cd13be357-8c6a22be2c5mr48271185a.1.1768468771575;
        Thu, 15 Jan 2026 01:19:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6541197fb4asm1869724a12.15.2026.01.15.01.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 01:19:30 -0800 (PST)
Message-ID: <d826de45-f00c-4af8-947b-246362c2be23@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 10:19:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NCBTYWx0ZWRfX0aov3W8KJkNg
 Dnfnm7QmHmrwtsjfrKXiObtNYhBr5c/1VzsJy02O9Bf2T339JhBN64cmR+1C0QcSb6DbmdO+Ov2
 zgqjT1npxc8Zu03KrZ8Lxj8oBTIFC2dkmk7IW24BWUzZn3lI8TNRY2GWF1Pry3+I1thwev6GHWO
 AYG3EyUwSPQFH8RkFpL39zPM4ifeecSXCxdqnW4hBtgp4PYyI9Id43ILd4fF3AYv5rzh2nGd0sD
 kSbreUknnIh8gtFiiEZXAjY/8fm+qEebk3L9rdb0kItCWsy6Ne6lUMACkuslwcrOX99NrzFPTUa
 bbNLexQcR1xo++Gvc+iKvHkQQ88VsxMwvYz/1te2p+hERvdjNS4OLEZ8wdwM7tiA6NsdOMmA0qH
 UZ+FrR5twVpTxrCuJJ2nVzL+EE5fGHinCi7Evw8IAWr6XBQYbPy+1vdhzLurFc55Onm5X8IIr1t
 Y6bwA/5zXlmzZGk3KpA==
X-Proofpoint-ORIG-GUID: kKcE6X0daW90nXGHx0zRZfqXb8zvahOi
X-Proofpoint-GUID: kKcE6X0daW90nXGHx0zRZfqXb8zvahOi
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=6968b124 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iwLwdXV_GrZBMsYiV9oA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150064

On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Instead of relying on the link_ready flag to specify if DP is connected,
> read the DPCD bits and get the sink count to accurately detect if DP is
> connected.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 60 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 20 -------------
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
>  3 files changed, 62 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5997cd28ba11..a05144de3b93 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1151,6 +1151,66 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
>  	return 0;
>  }
>  
> +/**
> + * msm_dp_bridge_detect - callback to determine if connector is connected
> + * @bridge: Pointer to drm bridge structure
> + * @connector: Pointer to drm connector structure
> + * Returns: Bridge's 'is connected' status
> + */
> +enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
> +					       struct drm_connector *connector)
> +{
> +	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
> +	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
> +	struct msm_dp_display_private *priv;
> +	int ret = 0;
> +	int status = connector_status_disconnected;
> +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> +	struct drm_dp_desc desc;

Reverse-Christmas-tree would be nice 

> +
> +	dp = to_dp_bridge(bridge)->msm_dp_display;
> +
> +	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> +
> +	if (!dp->link_ready)
> +		return status;
> +
> +	msm_dp_aux_enable_xfers(priv->aux, true);
> +
> +	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
> +	if (ret) {

See ef8057b07c72 ("PM: runtime: Wrapper macros for ACQUIRE()/ACQUIRE_ERR()")


> +		DRM_ERROR("failed to pm_runtime_resume\n");
> +		msm_dp_aux_enable_xfers(priv->aux, false);
> +		return status;
> +	}
> +
> +	ret = msm_dp_aux_is_link_connected(priv->aux);
> +	if (dp->internal_hpd && !ret)
> +		goto end;
> +
> +	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);


> +	if (ret)
> +		goto end;
> +
> +	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
> +	if (ret)
> +		goto end;
> +
> +	status = connector_status_connected;
> +	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
> +		int sink_count = drm_dp_read_sink_count(priv->aux);
> +
> +		drm_dbg_dp(dp->drm_dev, "sink_count = %d\n", sink_count);
> +
> +		if (sink_count <= 0)
> +			status = connector_status_disconnected;

< 0 would be an error coming from drm_dp_dpcd_read_byte, should we log
it?

Konrad

