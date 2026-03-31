Return-Path: <linux-arm-msm+bounces-101128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAD6DcMazGnHPgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:04:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4DA370565
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0A6C301F9D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD403845C2;
	Tue, 31 Mar 2026 19:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqwJKJBE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IrxJu6CK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05C637883C
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983696; cv=none; b=Y+VwPGyJ7wVOKO3/UXm69N3jZcDyX5mD0B4mF9KE2PSY9/TYtKBVmLhxL4VujJd4gQ87wzAKmNv5htSraWfR60oLMQs66v2pPeq6W6dAkKBDApxIr4u3GXj3RRjQgmeTDZqe/iW0WdMsdfbE54v1BZxZa/4DFEDgWf5MHzVo1sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983696; c=relaxed/simple;
	bh=9leVqDszKusX0x+SXl/cWzT93aDMOKQckxAvgbuEvbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ru5naVIHCYotof1v0MAdd0MsbAWkiEEnudsN+D1n/Qh8aJJ4/bp/QVejPFv6Hh6FLvbwG8dwC8mhE9pfnCLCesg2ra7k2ShzZjnVKSDUZF5PQEz9L+WLb93/iFohMPTGedG5JINQ4FsYHQKuijbMpHXxNaYcBz7uw6OwVy5yxjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqwJKJBE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IrxJu6CK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdJ4n639150
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VexKsPWO3vps9Z0Pir1xUCYsBIZHKwRIOnURGtzdHUA=; b=mqwJKJBEFFCzPiGh
	PJ7vcx9I0XzTmXiCx0OcIssii6PcE4sbvWAf/8OkSveH0tb1sJ61Ov3vakpk/XOa
	FLVtCLpu/yx2307WNEjHsLYxRybnzZcJ4imeKdKPbbAyDUGqhNSQzjTYnzNegv4J
	n1fUnEfncgcmRkCESmpb4uvlvKwAwEOxPvpzdf46hzgEDGITvVa88Ww6/xopJLJ+
	dz/qEkMRZCvoNhp0VxX7yXAlpaMvC9Gf9hdaOAzQWuPFTsH3j8iCA6fL4PxLy3oG
	BleJO/PzKP5PFoBZmnQx7YRZu/SrVfLL9Ktq4fq93xor29wfE8Sdofi2s4oENcik
	Od650A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8g2asab5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:01:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a6c70f1f8so4856640b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774983693; x=1775588493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VexKsPWO3vps9Z0Pir1xUCYsBIZHKwRIOnURGtzdHUA=;
        b=IrxJu6CKYNWzaHfPmSwdXQo/eoA4HpCYwE7cW1b4dsBZVdiPep7l61/ZPEf71dKB2M
         mFAPbaGVB183d6S3ezd2lHA/htJXJQNOHjKZhYFIVB6/uM/pFjZ2GKxJ2bPjQG938Bga
         XQky3ocWEuSnV1e4HciEo0a68FwqcykyAldL+MqUfR9tDL+NGy3ZufX5LNkSDcWYehKb
         W2EkOBn/CrHPsppM7kXOnUmmCyyBvbgReeF54LI2yfwFdMlGhenZQ+hFLLcVnd2YHuzZ
         334NDn4acrx9IWNlWjUI7Qd/49R+zSQnIE7HihIq7dyBS0q2vWyl+WCSnZ4YUHuexkjE
         v9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774983693; x=1775588493;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VexKsPWO3vps9Z0Pir1xUCYsBIZHKwRIOnURGtzdHUA=;
        b=dl/Vg3JvxwhbpgUyu8NLNn9MfKj9T+VTQvKnUvBI6lfHoSymOHMFeCdT+OHCpp4je/
         1tAFALt+oMtvzN1Qxt0fZ3esGlk1rYy/fD25gihy4RPEvQbRHVi41B/1po6Sk0eJ0Pf3
         LrDlxBF7mSfhnd77m541FAtVaKbEzJH1Zft3SzBWy8v1dbgCB3LOmI6ZYvSztfkJ89Np
         gdBdcjNlDc15v/K3E3bHeQj9hvOB9IzTT9/FhyyKZWouhb4VkkxFcjdB1d5MSQcz+ie1
         wHqCUzmRW8DkY5cuRfagA2u+SlFBbFUgG0crHr7c9pDWOQPzWmiW8MpI7kGugtGzli85
         YIJQ==
X-Gm-Message-State: AOJu0YwfkaAB/xwxAUnPopC+gmzSVDUH0D/G2TimTO+EzHEBkUQE6kXR
	hpEFTLv0z4Z486L6aEiD39ru3bjO4ItrdWbRl3a3xGYjlFcFfBq0owmZWm4lv4mEltCFGED5+T1
	BBwIJ7TESWbVy3/HKKLyh8SMYh28CwUqALs8gpXHTwkD7Vxo/Icub1/EvryTn684vYTdG
X-Gm-Gg: ATEYQzzG4uu5G+T9h/Lxv6lia5H6jf4GXb/oOpWQavwnymxFaAsD8RevHxtekvVgNQE
	BfmNeU9zG9fqGPl0rp4ylI7SemyrKEfAfY1UO2YNlJlGhaIoaxpVItP6EiTl6b6JXGB+ppflqTL
	+0zhrgmemunJgfBMbOZQO4QAYXarizDcStxafgGGdXw0gMhk9xr6CC2bHkKw+y2h8woTitOzuvT
	hnNUNVIv9cHat0ctk/YyzNsgA1bXZpLIsaXSYrOYgAInAAuMD8wI6IS8EcGYfdBJuTHh7UJzAWi
	yG9j0pG6CQ8BLqlhoi12Vl+ekzj9tDML1X8iJo4DFJUVRiBMQkIepiuYWEHLT/sacX4k4o+2eDv
	89+1493Ft1I/fhewPGca8/BFovQLeKYKgcfK8p2Wqi5bMjA==
X-Received: by 2002:a05:6a00:130f:b0:81c:446d:6bd0 with SMTP id d2e1a72fcca58-82ce899bea4mr680171b3a.23.1774983693296;
        Tue, 31 Mar 2026 12:01:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:130f:b0:81c:446d:6bd0 with SMTP id d2e1a72fcca58-82ce899bea4mr680122b3a.23.1774983692639;
        Tue, 31 Mar 2026 12:01:32 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.231.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca849849fsm13471709b3a.26.2026.03.31.12.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 12:01:31 -0700 (PDT)
Message-ID: <da57e66d-cc65-4c2b-be3d-51fe15376062@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 00:31:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Fix dumping A650+ debugbus blocks
To: Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260325-drm-msm-a650-debugbus-v1-1-dfbf358890a7@gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260325-drm-msm-a650-debugbus-v1-1-dfbf358890a7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE4MyBTYWx0ZWRfX09LmWqlHW2Yb
 y9wFstFmNYy7dOyxKZd6CSAERhJhl89DPuiz2NLm0jp1aKEbFyo+5Z8g59yKLWaORSVHgzkD0fi
 unuaFrvbcp6/h+DaUaxSW7tjg6upyL5BlMUdnAEiPIii/pS4H4Me78FE9GXrw+ODriLrWTIGMsB
 eOiKAHQgLdyT/qqpfB74R0ffN24QuPv5WyNIov3BzAS6jj+fk5adEdjcAM4o6zteFO8/7fG6Yjs
 trQnsGZU3eu47D1dLyuVKqEw38IxSDxfjqDBvZ/Zp/gHS+DMl0SYAzKAXtgYYcOZJLSaJP0Q5PW
 6f4vikmv0CwRZUB96RUzU2/11MJJr4xFxPEX4nZ9C+Y1yoBQyRPDibiVg4z7jWA7522SyhwdJos
 fCIE6xYwoJFfk6B3VQ8BO8Zqfqg0aPTA2Vqr/AekCYG1YDyQ3M7/a5ILsHzA4r3aIhc2pg8+TYB
 gwG1iCeKGhfE85z5drw==
X-Authority-Analysis: v=2.4 cv=G4ER0tk5 c=1 sm=1 tr=0 ts=69cc1a0e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=YUf46QchBRIYdusOZX0V1g==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=DpCW-ZSMgoX-IK26rl4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: rtu6a-8-TKQt_P2mRs53iIaECjLxh5lv
X-Proofpoint-ORIG-GUID: rtu6a-8-TKQt_P2mRs53iIaECjLxh5lv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310183
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101128-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C4DA370565
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/2026 2:28 AM, Connor Abbott wrote:
> These should be appended after the existing debugbus blocks, instead of
> replacing them.
> 
> Fixes: 1e05bba5e2b8 ("drm/msm/a6xx: Update a6xx gpu coredump")
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index d2d6b2fd3cba303959bd037b60796341315079a1..9699a5b4754628023b67f0eecafcda728953e8d2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -361,7 +361,7 @@ static void a6xx_get_debugbus_blocks(struct msm_gpu *gpu,
>  			sizeof(*a6xx_state->debugbus));
>  
>  	if (a6xx_state->debugbus) {
> -		int i;
> +		int i, j;
>  
>  		for (i = 0; i < ARRAY_SIZE(a6xx_debugbus_blocks); i++)
>  			a6xx_get_debugbus_block(gpu,
> @@ -369,8 +369,6 @@ static void a6xx_get_debugbus_blocks(struct msm_gpu *gpu,
>  				&a6xx_debugbus_blocks[i],
>  				&a6xx_state->debugbus[i]);
>  
> -		a6xx_state->nr_debugbus = ARRAY_SIZE(a6xx_debugbus_blocks);
> -
>  		/*
>  		 * GBIF has same debugbus as of other GPU blocks, fall back to
>  		 * default path if GPU uses GBIF, also GBIF uses exactly same
> @@ -381,17 +379,19 @@ static void a6xx_get_debugbus_blocks(struct msm_gpu *gpu,
>  				&a6xx_gbif_debugbus_block,
>  				&a6xx_state->debugbus[i]);
>  
> -			a6xx_state->nr_debugbus += 1;
> +			i++;
>  		}
>  
>  
>  		if (adreno_is_a650_family(to_adreno_gpu(gpu))) {
> -			for (i = 0; i < ARRAY_SIZE(a650_debugbus_blocks); i++)
> +			for (j = 0; j < ARRAY_SIZE(a650_debugbus_blocks); i++, j++)
>  				a6xx_get_debugbus_block(gpu,
>  					a6xx_state,
> -					&a650_debugbus_blocks[i],
> +					&a650_debugbus_blocks[j],
>  					&a6xx_state->debugbus[i]);
>  		}
> +
> +		a6xx_state->nr_debugbus = i;
>  	}
>  }
>  
> 
> ---
> base-commit: e4eb11b34d6c84f398d8f08d7cb4d6c38e739dd2
> change-id: 20260325-drm-msm-a650-debugbus-80119b64056a
> 
> Best regards,


