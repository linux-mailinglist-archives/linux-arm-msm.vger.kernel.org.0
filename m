Return-Path: <linux-arm-msm+bounces-106418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL9wADGd/GnJRwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:09:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4EF4E9DAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9227530075CC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B513F23D6;
	Thu,  7 May 2026 14:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cygh2Qjy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dk5bOozo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B28372EF6
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 14:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162704; cv=none; b=fM1gIfaFormcSjkWxARzU0EAcaqklSV7rrHhwZl17g4IHfqyDSRqWZf5BLXojAQlVkTUwl4OzqxtpMUP251Z3aX50WrCbfOe1NiwEYdTwmiUqW73Q3rJlHM5OWXht7R+dSeAOkeIaGA2JEeXY5Hlb/cGdm6EBsc7LbnmseCZ17Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162704; c=relaxed/simple;
	bh=v/5wzLoqtNZBatREQl4Xh8hNuGA7SakUKRA4PHEAC20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQuaUAORmQNLab123jtmBuOOfN9z3onYqU7Z8Fk17qBVYFphToOb5H7BoIkaStmH5tm4pR+G5SJrByTgrgh+nryUEpMUAkSfiSL3N0dNaKEBv/vwAhi+WPHIOsWFtV/BpXhoLTuh29FVvTM58y7f5G1iAnqSe02dK7g9PgcYHAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cygh2Qjy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dk5bOozo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AGnCu150864
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 14:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZShhxOovjzceMtLMUQYhBHlHiz8slZH+0gurq0OqEk8=; b=Cygh2QjygimB4lDY
	nDu4g6wftBDfD9lv7BDk1JZY62SDV7nliBAd/T5r8OoomfwlTJN6dsI7XmC3CYNb
	BVoEb4uVgW+5w+Cn9EpxiMrBItZvwJ5YY7vzIo1lTCPeoQv9IYxglZNK33Zv7XzP
	0fXxI2cqL7IdxrFuleUUGGijY/pBXDFdXhIq3I+0VBuu0udSz7hNGjsXECtqUtam
	g5fh4+UXLG7tb5zpdBMukRTgchYcNoyZ9HuBIMSgYteu7WhQS9bSG7m0CGH0JYhS
	2KL0ZWhEGf9KCGTSNFyxyMQPoWeuces5Z4tVvTfqT4O/w9wTkr0R58ETBjTOcB8M
	DtpLNA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctt542-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 14:05:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba3245a43dso10031635ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778162701; x=1778767501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZShhxOovjzceMtLMUQYhBHlHiz8slZH+0gurq0OqEk8=;
        b=dk5bOozoduIlZWrGI7NThikpnHQUJFmFoyfujb5nZtRDU8Kq8v26EQJ16w45zQ3CYn
         QgKzsE5MIyt+bBq8ZQklgOyP7Qtq/b3GTiX4uzj2KQJRbCfLeCnrAfO/i8i74kKGZmWC
         R855MSj6RGB91lkD5aaAQZNbr/gmzSXfJqswub9/Vc61qiUx2o3bU6/HwsIkjBTJwM6k
         12emKQN9HPh+fL1+FAWeeSxQ/r2vYs3cqQSqsvFM9ON5G2XWKLgRHGMHtrT7pjACk23Q
         d8/hwVhTlczeEkPCBH0686HCnTHmlpni3yl8W1l8/ubU5y8qPIYlgxCg5uuZMzczKf8D
         YMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778162701; x=1778767501;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZShhxOovjzceMtLMUQYhBHlHiz8slZH+0gurq0OqEk8=;
        b=P5+Jq8MbR1WVYRW4Q0C2phpc6kX6iB/9PvYibYrI78sFdwf39l4fbyLiodBeMglg9j
         UmQOIHxuPmebZSzjXjhblep7QGcF+cSyDDr4m+eHmO2YOoiZD4faFbBR6Gb3AumG5SSP
         l6I6xPrprV5zaosd1/6/qqpRrR82y+APw2+thp25/GHcvDd2zhba0B3GoAmRDFiJfXfF
         3CWu0xCeyrJHk6N85eZG2EqjchhB/18uOBsJIBeEWEqETIJYNhj6OkXtBMLtaOfoqaEB
         v8cXZEtzHGXwxhlTMoaMmfBBMhof97Eztn/LD3iaYDvzuJPptnAWCkV36J2VyThAoxcO
         eTmg==
X-Gm-Message-State: AOJu0Yz34TgM8hQROdx/r8uepaQLTjm2baHE7K9o5Kmze0Qg+z2uQOzR
	vUtFkZaCKLSvpi2RYqDIM2QLYOkjT31IH1XG4xGuzjlbnyW6zLrV1B/Xe9aX3SAY6C2JR8wiKh4
	gMk2HCKo6Xb8Yxs1GKxROlY9nK4CSfd1sTp9qmG2AgiB1qv5UXnZQLtZUU6BSWeiQAQhA
X-Gm-Gg: AeBDievro2nLHrmdNDB3jJM/4VF2s5AqMr6G8Cn82gfy6wODGFcqXPuqK31Wm87GU50
	ZpNuUcXdzwshlV1TpCFG5guwr6saqDj520d+9fA03+5Mr5+l5YBQDlVN9OGqEyGQZl1Ju7bvpTr
	FE2JMHL0yMR47PETLkKK49rHIKbllbvQIMKug82d6Tfc28JZiWoVNDGOoDA+UniYHcZ94ljpDdD
	QtBO1uDwL0bDfDPVEcoOl8AdG2d37BCQVZA6N+46YD5wROSaM/tmwlhyUlyjoDYwXG7fs+ianwX
	QG1Y5NkAuMOLQwdCwaKHCL2SNkEF+zXR/j7cbqnoqtN5itbHFpdzjttw397LMsEmK6lRG4ucS/H
	86u+kRdz/exkTb4YXy6sVHx+8BCIrxC2Jp2Q8Mz7ZvOJu+TJLS52WoKRJk69qpYUkaQ==
X-Received: by 2002:a17:903:13ce:b0:2b9:fc68:d8bc with SMTP id d9443c01a7336-2ba7881ba37mr86118745ad.0.1778162700794;
        Thu, 07 May 2026 07:05:00 -0700 (PDT)
X-Received: by 2002:a17:903:13ce:b0:2b9:fc68:d8bc with SMTP id d9443c01a7336-2ba7881ba37mr86117695ad.0.1778162699928;
        Thu, 07 May 2026 07:04:59 -0700 (PDT)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babadd281bsm29136815ad.43.2026.05.07.07.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 07:04:59 -0700 (PDT)
Message-ID: <42d3395e-00d7-454b-bd8d-0a7b70a64887@oss.qualcomm.com>
Date: Thu, 7 May 2026 19:34:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/29] drm/msm/adreno: Trust the SSoT UBWC config
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
 <20260507-ubwc-rework-v4-5-c19593d20c1d@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260507-ubwc-rework-v4-5-c19593d20c1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc9c0d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rXB18VZcS01e0qBHpfIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: CeUAmAFJwxqA7BR5oow4uPzizvT3fCJz
X-Proofpoint-ORIG-GUID: CeUAmAFJwxqA7BR5oow4uPzizvT3fCJz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MCBTYWx0ZWRfX85gJbNfeSoUx
 o/oJ4y5BLKgt+H4kvBfX4eKjfuzcgnYCzixc66heoqJ9xPYIRJpaBDg5zODT7BTXpTT12Sux4oh
 rcIzIJ+ooiqOzfQTwLmwSi4SmcnDQuohzz0ABTrFKnld1prUxwGbBkGdidjuiuQa5gSkKEj7uNi
 bieGkxldSKOQzHtFu9Hqbc9TPJFRsZE9IAbC5mXO5p/lNoi+0nPwIyRzAjBW7THgihqQ7bc0xJl
 BhsDEjGkZDL9VJ4JE8VCjVX50j1TT1ck3D45zhK7/s5ceb1XTzX2jMm8hmOOekHu5HWSMJbAfMW
 sPhBgHCGwPueyDUMZjtM0EHbcta5DL/CURLUw3JS02/7e9BiuvaJ+pxILQHzn3styozuOprhcqy
 ALzFxmLI7fMT+WRZXgaP+cASC4utVyhSNRpMJ87OVsxI/GKQQUPqLrEDNMFN3C2AItIwJ54Em9A
 xIAB+Cj0HHQ+iztmmAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070140
X-Rspamd-Queue-Id: 4E4EF4E9DAF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106418-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/2026 6:33 PM, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Now that the highest_bank_bit value is retrieved from the running
> system and the global config has been part of the tree for a couple
> of releases, there is no reason to keep any hardcoded values inside
> the GPU driver.
> 
> Get rid of them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.

> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 11 ++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 82 ++-------------------------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 --
>  3 files changed, 6 insertions(+), 92 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 79acae11154a..699fc0f551ed 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1725,7 +1725,6 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct platform_device *pdev = priv->gpu_pdev;
>  	struct adreno_platform_config *config = pdev->dev.platform_data;
> -	const struct qcom_ubwc_cfg_data *common_cfg;
>  	struct a5xx_gpu *a5xx_gpu = NULL;
>  	struct adreno_gpu *adreno_gpu;
>  	struct msm_gpu *gpu;
> @@ -1769,13 +1768,9 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  	a5xx_preempt_init(gpu);
>  
>  	/* Inherit the common config and make some necessary fixups */
> -	common_cfg = qcom_ubwc_config_get_data();
> -	if (IS_ERR(common_cfg))
> -		return ERR_CAST(common_cfg);
> -
> -	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
> -	adreno_gpu->_ubwc_config = *common_cfg;
> -	adreno_gpu->ubwc_config = &adreno_gpu->_ubwc_config;
> +	adreno_gpu->ubwc_config = qcom_ubwc_config_get_data();
> +	if (IS_ERR(adreno_gpu->ubwc_config))
> +		return ERR_CAST(adreno_gpu->ubwc_config);
>  
>  	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index d5aba072f44c..1d998636c5a3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -733,82 +733,6 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>  	gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
>  }
>  
> -static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> -{
> -	const struct qcom_ubwc_cfg_data *common_cfg;
> -	struct qcom_ubwc_cfg_data *cfg = &gpu->_ubwc_config;
> -
> -	/* Inherit the common config and make some necessary fixups */
> -	common_cfg = qcom_ubwc_config_get_data();
> -	if (IS_ERR(common_cfg))
> -		return PTR_ERR(common_cfg);
> -
> -	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
> -	*cfg = *common_cfg;
> -
> -	/* Use common config as is for A8x */
> -	if (!adreno_is_a8xx(gpu)) {
> -		cfg->ubwc_swizzle = 0x6;
> -		cfg->highest_bank_bit = 15;
> -	}
> -
> -	if (adreno_is_a610(gpu)) {
> -		cfg->highest_bank_bit = 13;
> -		cfg->ubwc_swizzle = 0x7;
> -	}
> -
> -	if (adreno_is_a612(gpu))
> -		cfg->highest_bank_bit = 14;
> -
> -	if (adreno_is_a618(gpu))
> -		cfg->highest_bank_bit = 14;
> -
> -	if (adreno_is_a619(gpu))
> -		/* TODO: Should be 14 but causes corruption at e.g. 1920x1200 on DP */
> -		cfg->highest_bank_bit = 13;
> -
> -	if (adreno_is_a619_holi(gpu))
> -		cfg->highest_bank_bit = 13;
> -
> -	if (adreno_is_a621(gpu))
> -		cfg->highest_bank_bit = 13;
> -
> -	if (adreno_is_a623(gpu))
> -		cfg->highest_bank_bit = 16;
> -
> -	if (adreno_is_a650(gpu) ||
> -	    adreno_is_a660(gpu) ||
> -	    adreno_is_a690(gpu) ||
> -	    adreno_is_a730(gpu) ||
> -	    adreno_is_a740_family(gpu)) {
> -		/* TODO: get ddr type from bootloader and use 15 for LPDDR4 */
> -		cfg->highest_bank_bit = 16;
> -	}
> -
> -	if (adreno_is_a663(gpu)) {
> -		cfg->highest_bank_bit = 13;
> -		cfg->ubwc_swizzle = 0x4;
> -	}
> -
> -	if (adreno_is_7c3(gpu))
> -		cfg->highest_bank_bit = 14;
> -
> -	if (adreno_is_a702(gpu))
> -		cfg->highest_bank_bit = 14;
> -
> -	if (cfg->highest_bank_bit != common_cfg->highest_bank_bit)
> -		DRM_WARN_ONCE("Inconclusive highest_bank_bit value: %u (GPU) vs %u (UBWC_CFG)\n",
> -			      cfg->highest_bank_bit, common_cfg->highest_bank_bit);
> -
> -	if (cfg->ubwc_swizzle != common_cfg->ubwc_swizzle)
> -		DRM_WARN_ONCE("Inconclusive ubwc_swizzle value: %u (GPU) vs %u (UBWC_CFG)\n",
> -			      cfg->ubwc_swizzle, common_cfg->ubwc_swizzle);
> -
> -	gpu->ubwc_config = &gpu->_ubwc_config;
> -
> -	return 0;
> -}
> -
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -2701,10 +2625,10 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
>  				  adreno_gpu->funcs->mmu_fault_handler);
>  
> -	ret = a6xx_calc_ubwc_config(adreno_gpu);
> -	if (ret) {
> +	adreno_gpu->ubwc_config = qcom_ubwc_config_get_data();
> +	if (IS_ERR(adreno_gpu->ubwc_config)) {
>  		a6xx_destroy(&(a6xx_gpu->base.base));
> -		return ERR_PTR(ret);
> +		return ERR_CAST(adreno_gpu->ubwc_config);
>  	}
>  
>  	/* Set up the preemption specific bits and pieces for each ringbuffer */
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index ec643b84646b..324319762383 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -236,12 +236,7 @@ struct adreno_gpu {
>  	/* firmware: */
>  	const struct firmware *fw[ADRENO_FW_MAX];
>  
> -	/*
> -	 * The migration to the central UBWC config db is still in flight - keep
> -	 * a copy containing some local fixups until that's done.
> -	 */
>  	const struct qcom_ubwc_cfg_data *ubwc_config;
> -	struct qcom_ubwc_cfg_data _ubwc_config;
>  
>  	/*
>  	 * Register offsets are different between some GPUs.
> 


