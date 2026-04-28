Return-Path: <linux-arm-msm+bounces-105051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJAXOyzm8Gm+awEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 18:54:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AFF48964C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 18:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BAD0305EA98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32CA125AA;
	Tue, 28 Apr 2026 16:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XAOIAPWd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+tXFAiG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9695A3264DD
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394436; cv=none; b=dvvnfDaiz4pU/Ka6lVvsHHHsVIhc8tkshoJwbGErU7U/tu1xke9+kYmxFt6X8gWcpFFYG9PKwbAjFw70RyfzZ0C0N+dk7vYwuMJ8+ZKMhSVzQ08SYkn/oqf3oiOMFzTccRhISdPI8FXn9d+UqGRm9T9LJxZZlcN9fRC46h2rMX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394436; c=relaxed/simple;
	bh=RShu+1Z5Vkbnhyyxjm6DupdKxUaZTttioviijUEdBB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kFmwgvRg6Tf5bfIKTLvOGK8jpl1L2d9rzEDy7mtfiJLwmn46f3V3l26nhgzpp0zU3AxifnnS2CIKqZ8nOBP7wEUlToldCI8BGIdIzgzmNGFyYwVDdrUyGM9UZJSU4tl0Z/UsigHDAcosJSjrW3XkfuWpTxuih3GXKWjXErV2kcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XAOIAPWd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+tXFAiG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsTXV1796697
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kLFgekwjjAN3eLuAfL7QdjfZhVRek/Ch91VNErfxHxw=; b=XAOIAPWdaZNrgqfv
	6qwH9I2uHD0hYKaVwSWn0W4viuxiLiIhsAc/3Feoh6e/NmNfelWfdVaH4f0vGIjq
	BWMGUvGtbaNj8MVTkkATX4oRvUrUCU/rTNvUL+5ClBBjjAJ2pFJ6VcnrYLTxi+GP
	Q/FPBJ4O3aaUvpe4NmGRoDiLIR5hutGl+Fvqma+zbtcA5iUAyqA8h/+MXyL27WHF
	Cw8wJ3ffpgxEh/SMxlTksy01Z6++zZyyyCvW6+XI6A8bTULGQ3i64MZoH1u6RSUE
	qDyiZcsnPAw3bLeRAXa81LAZL4+ZaEtGAbiGpmMlgOY/Cg7rSBY+/U2opjv/x1oE
	C3VKZQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttt2snhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:40:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35dacc40f92so11946666a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777394434; x=1777999234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kLFgekwjjAN3eLuAfL7QdjfZhVRek/Ch91VNErfxHxw=;
        b=C+tXFAiGBz8UzACHeKVVJeJphYC7dYlSZaJW9uwnj1WxRrMujrvC4wqTGgIub8uoLx
         dA4NIfZ+IdfAuIZ0NJOX12jWK36uGG6htgLuuGT5+rO7X8q1HHj70kZsT2BI9Inmp9/j
         NnaqTGTdkoE4LQaEocYTEsBp4BQKaDPI3lDX32wqXHNHExEaFgD30T5EiwFwZDXEpuk2
         gUjKI4GFfXw/nl0VIWWA2wJjSxt7gB2QF6tiXMRcf8OtT1xEzLWlhpZ0+s4+/2Wac/Aw
         2lcO9N7zf3lLrOSEUsJP4fzEpNvm3DGFDXlazDWyngiB+JKtLKjp+VHwqAxc0TrbaGgQ
         9BUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777394434; x=1777999234;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLFgekwjjAN3eLuAfL7QdjfZhVRek/Ch91VNErfxHxw=;
        b=dPqrIx8rGOUD1ACCxLkC3siurjS1O4rMm4bqhV39/fv22zhhXnDrVrapF72bLK9vaN
         ib81RtnQ5qntfGKeYSsDVK5CbI8QQTTGE6KCRNstgpv8VPTWfgmeTCidixn2vUTXSTui
         ULGJS41W5+PjbOY0httEr5Nv580ZsCHusIxTHy1i95fbvRySH61CWIb2gSi6WrGIVOLl
         XINT/7PsI+qA8HapAtjt6EHYriDSWI0evfqkUOmLYjYmgQhJnIsVlfXid0SVkGRv/ur2
         QnLehNAg+FM/9r0/YDj0C7HxLQUWzHf+pc6RO6Br++7/N/TLGsyFLsmbu6FeGemG0a0y
         QOGA==
X-Forwarded-Encrypted: i=1; AFNElJ+WIntaU9t4ZQ7g8GYNTbHnGodGeyuZ++zjQU6naB6yL1PeWJM2WhNY+qFbCtZv35L958gg97xlcQoRqF0L@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh5pzV/wu/C5uqa8TOUup1w1pcPlrZ3a1Ibex/qlTjttKvLF0z
	lguTjhHfIlMJyVLup0i1mrdtx8mKKGq3J9PrteEX6YhlhZ4GLoP0vgFWdSOU3ASIbd6yTWm/hqD
	DPOlUj8fWVccakdGnm3+uxlYOFmUCZLEX09peeunPx/oDIK+kCkF50YQrLXDfjpdDuuGE
X-Gm-Gg: AeBDiespUqotO2iJ3yS0ClxTVLzV0HkvGfOnjVZGIRcR7csw9+nDG/slRBubGP3939k
	aTHjJPTFjwbvQjXuQXCwIhqqz/rrSQD/6SkHG2qyoifjVu5xFakxzxntKBz5M98U3TN7dJk9063
	MNiH+j28iCUdoJyYeU7s6GbYYl/EfOJr4XF/W6nf17H2Xlgk/JWsh9q6uF+1ydn/lVX+d5MxvSx
	OH3PkDsuhVeDOe3c8eGFqSLj2cuoSqsGWE63jVGklW+xl6YlW0W5ccPuzShQKs4bKFpNFR4xPwg
	rBdZFe+iJwDX3n1+Jv0JaqGzw0SbwTiixpQ9C6JXL5uRmNVZ1Qav9w0jST2e3nZ8oal46MPKtDR
	YLIbZ+H29X5em3gHnQGM34QSu/AadVw0Y9LxXJMCH7w7XYPiqT9GtDQ==
X-Received: by 2002:a17:90b:4cd0:b0:35f:bb33:d72c with SMTP id 98e67ed59e1d1-36491f891f9mr3691695a91.4.1777394433972;
        Tue, 28 Apr 2026 09:40:33 -0700 (PDT)
X-Received: by 2002:a17:90b:4cd0:b0:35f:bb33:d72c with SMTP id 98e67ed59e1d1-36491f891f9mr3691659a91.4.1777394433473;
        Tue, 28 Apr 2026 09:40:33 -0700 (PDT)
Received: from [10.91.112.28] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a011512dsm157755a91.4.2026.04.28.09.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:40:32 -0700 (PDT)
Message-ID: <e1a94dda-1a4a-4034-b695-a7038760c53c@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 22:10:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Check kzalloc return in
 a8xx_hfi_send_perf_table
To: Chen Ni <nichen@iscas.ac.cn>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: sean@poorly.run, konradybcio@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260428073558.1234238-1-nichen@iscas.ac.cn>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260428073558.1234238-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbIkiCE8 c=1 sm=1 tr=0 ts=69f0e302 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=PRwU12TgqmUXp5Sp-ksA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: _UNP5mtfUpeNHttZPZ4JpMyyOMG1cPTU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2MSBTYWx0ZWRfX+dLsUEeJD5Vn
 lu7C+9PBdkj5ZaCHwedSpt4xZ+/M3gtBPssU0xECBM5JFdVd8C1osZMzyC2ri/8VAWqPzxVKiLG
 2sAkDW+L5c+/lmASGtDtwEp8CXFEjbgwWTjmujnJygqUi3RRYn0Y5Ci8NXOnVQTQLJM51vnLZSV
 kF/g3jg43Q1nukOHmeCV6e3M2F6Rrw43Oc4CRfnRW7lMYWJeqkiVD/b6I0SL0y3zGKTXKkp7sTP
 Mt3jjZ+IWrsJ0xS83/47E+SqtkyCH9wCY8wZG3laxsQbBqL+FmRUAY2d40RJJS6/oC9e1rzhIUm
 /EjljsyL4DUrEOxeN2FdckzrP7lmgAVINzmTPaksj8pMj7IFF0zzB72eTCKQnXf26xacE6/dl5P
 0HyE+ZlQrxVBhmjdDd2FbR1jhXRkFxCJwhAz0P6J84ozZqSa4vmMuoszBHzTV2nn9Vbnj6LBBJ1
 UXm7n0FP9DQJpvj3EIQ==
X-Proofpoint-GUID: _UNP5mtfUpeNHttZPZ4JpMyyOMG1cPTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280161
X-Rspamd-Queue-Id: 44AFF48964C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-105051-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[iscas.ac.cn,oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/28/2026 1:05 PM, Chen Ni wrote:
> Check the return value of kzalloc() to prevent a NULL pointer
> dereference on allocation failure.
> 
> Fixes: 06cfbca0e1c6 ("drm/msm/a6xx: Share dependency vote table with GMU")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 487c2736f2b3..186a73c0b99c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -289,6 +289,8 @@ static int a8xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
>  		(gmu->nr_gpu_freqs * num_gx_votes * sizeof(gmu->gx_arc_votes[0])) +
>  		(gmu->nr_gmu_freqs * num_cx_votes * sizeof(gmu->cx_arc_votes[0]));
>  	tbl = kzalloc(size, GFP_KERNEL);
> +	if (!tbl)
> +		return -ENOMEM;
>  	tbl->type = HFI_TABLE_GPU_PERF;
>  
>  	/* First fill GX votes */


