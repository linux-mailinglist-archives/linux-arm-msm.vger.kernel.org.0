Return-Path: <linux-arm-msm+bounces-92713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHVpGnHrjWnG8gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:02:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 203AF12EB97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 827983003734
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792D9DF6C;
	Thu, 12 Feb 2026 15:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVH+lzwC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XR+/9BEh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3205429CE9
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770908490; cv=none; b=ZdvIHDQSwOdMw6RjD4z0Qsc9lQVjR6X9/VzRh9f8c2dCsfLyLk+6UUQ5mltk2E8OnYIs2lo3F/eZDK3kIWVbIJ7IBdmW//oMbPCHE5BOi/jFOmucrMFsqfDJpPu6tGG2y9Kz9mtdxyRmFNuy3DCUzKh8LxfixFX6VfiGNadLYSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770908490; c=relaxed/simple;
	bh=LWfPVJFhuZRaigIzhk5OdpvGw4AR/InmFYo5/gO3ktk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZVxmOGjoC1xCvJrN23IT2ClWu74PArCk5TDnKD7PkG+IfjqlCVG2BNgKg+HHpCcQs7pHRkLCshXujwlDKN8/DiEs6ga/TKpfBBWtOYFurkkpctpF6VvWP2oZhl6ByhtXawFZchOoMk4trcfxrXtCMnx6j1GAUSIfq14JgEZ0X3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVH+lzwC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XR+/9BEh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRhDn588759
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 15:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Td8TkWhaFGm2U4+qFTUwHeU05QZK/KaVCrS+oH4rQ4Y=; b=YVH+lzwCwaaTjQUD
	pgCzHVxmFw0NmNAqwG5GeoX5m3rr0pvjBdYdxZia4OXbTQFTOX1dMiOIhW3JUxYt
	uAP/F7shw6cHXBEqVuz9XLlq/FPTbNGJzoxGiw4o0u+NXkf0jnzU9kqJTuqbDTZh
	DrRv7HmOhsY9wuIYZORwy7XbMEaLSIWQB4H+6HA1o8VK939EAgttKlkvNC9W8Dca
	TgpRHmHmzYln7VoqA9oW+SOdJrr/l6/IZhdvPcXM98QFJSiWvFx+qHY4ifFPNr2S
	WdPkatyhMLP92Fv9Slx5A2f+9gMP37yx/i0eBeqfVFqxnf9TGrhOYsGHxCRYhtER
	DLI9MQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c93snjmnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 15:01:28 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d18e652149so4139560a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 07:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770908487; x=1771513287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Td8TkWhaFGm2U4+qFTUwHeU05QZK/KaVCrS+oH4rQ4Y=;
        b=XR+/9BEhRj15oAUqgvFcJ0wSwcvLBi66u/679/cySaL4uO1Wmfk6gK59QnT9dzfZnm
         EgI+g+XWAiXvjYTcUaWa/ZFXzTbCUixO1fmZAeCGO6gT7kfScc6Lrv5swrjLPHS8M6nC
         LIScGoD2BlQyWo0Iza4RhDCFYlFqpTV2DfBxl01LEIRbSLVxJcfPX1HPUdoBf2isIxtz
         DHNhFn9eBBBZNe2qgpRooW43O/ZUB5ddkwv7iNfKNgtNutoZZI9xnjFmY+uPzdND0iTO
         LLkdlJDGnU7Kx5ksrcOq0LJ+G7NHhvKP68dyV9uuLTWuP/mA6L3b9goRM7ZNL7tCe1f8
         MDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770908487; x=1771513287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Td8TkWhaFGm2U4+qFTUwHeU05QZK/KaVCrS+oH4rQ4Y=;
        b=eK4fo/Nqox0b6LL1NkXcaW7PaapuKivgdLoxlcCcqW6RAiwNSKJ3RStFxfRoPkbgGB
         Mb39+p/rFUXN4QhOY4cM5KTIr6ruJ3pn8LtpnVvjlkVuitrrJ7ug2NnbwBQXeFchU+dj
         rLUKKkebRS9hgidfv8K70MnoPu2meQBQW6Uee5O0AkumsS0Dxh4KkDuO91AwLAkcFSb7
         8KDaP8P+obRwI6W6wxtpxCYFmGe4LlxhrX15itzdmiipcfAl9Ia+DAPIYJTkAOMOAntB
         ZDGdsaiVRtzzlnBdBu1ILaHtPQjpgsBnQhpKzwjeh4GG3RxLJc7G01yot+TYxYq7dSlp
         np8A==
X-Gm-Message-State: AOJu0YzLPZeP4HxjELvJDx+SAHd72Pbs8Ne8ZR54BEGSoobdDB0jRFdF
	Ede9DNaoUv50796xL6ccuY4LnSC86QY/cXnbUQbN6AWeHKHyTlWYXsaFAUYghW5Vxh9TP5iM4J5
	sNvi//F4I7psZfP35lAfX5XVHpK22HVMCswLCKsAzRnawYayfHiblBOqQqAQRgta0qLaJ
X-Gm-Gg: AZuq6aJHhl6qsntw4ijIJfQbmGouNX9wjpLm/7blt+u3b/12IhZStQuwZTbFXAcvzIb
	m3OV2pXJHF0Cp6qM/PBvWNDC81sQLotFS/0fvdWrVY1q3qngbMViLWqwUiYyrES5Lgm2trzfpks
	CRnjzbQeB6k5wB669T1G8iGpDZmL4Fofm7a8RtVllFEUsfRTz9oxDqFRiDNtheqvgfd23Obi9/a
	7HYfH4+ShXCsem+rxpWTbpL0X/BVlJgpUQKWTO4myp/CYOcxI0bcgmpTJXaNOB7ZcdHYSZo65RV
	A6hqmDG7XwOqUmbNvITMSMJ287viBxBQM7UQYsRwMSbZRgDjsTBUBhEM/dHAYg45+4YiyaoWKoz
	y25epi+ZTNwK9gxN/vDKys0S8mBBjpfitWpMc9IFVgqYMAa5RLlpNx8gJk1kFl7wdmF29ok76Vh
	ru43o=
X-Received: by 2002:a05:6830:2b25:b0:7cf:d0f6:a1eb with SMTP id 46e09a7af769-7d4b29884b4mr1211344a34.1.1770908485948;
        Thu, 12 Feb 2026 07:01:25 -0800 (PST)
X-Received: by 2002:a05:6830:2b25:b0:7cf:d0f6:a1eb with SMTP id 46e09a7af769-7d4b29884b4mr1211260a34.1.1770908485219;
        Thu, 12 Feb 2026 07:01:25 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cec9e7asm1834360a12.12.2026.02.12.07.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 07:01:23 -0800 (PST)
Message-ID: <f028462c-ae31-4fa5-b414-e03d3a73fdf4@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 16:01:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Silence remoteproc probe deferral prints
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260212-ath11k-silence-probe-deferr-v1-1-b8a49bb3c332@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260212-ath11k-silence-probe-deferr-v1-1-b8a49bb3c332@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExNSBTYWx0ZWRfXyT55J/78El3U
 5LmTIf1q5ADPTz1JjnsgIZpnsjsqVec2HmI6mlHP2/lWeesVpW0A7zHIXLsSeTz27+tzG+nDuZA
 kPznf2h6cHt08i8wg0a0oQuIRBfUTSlu6XRaxYv78OJIYKe3pCd1sSYyhP9eL7oNQ7K+GtKiWLq
 BnAlnpkoYclbllrpjpEjGlT0liwC1YQz3EcF3nVBnKUO/7My7Y7q3sa0I9m/zHB9Qdw1zIhiZIL
 /0zJQMPx6ScirNx9y9GM7TaAEfcyM3XIWyLWHL3VEwBRiMj6RehPAGja4gvRolMUsF2NKO03+lr
 wz2oQFBikCo9vzY1I7OqC4TY8jyUqkSWQ/YIpuhTod4HTLQOO68uydOWTojs7Mc3ZnUfJoUaHkF
 0Jpqen2vgT0WXKoZvR9eJyGD+zhFGVpRLN4NkxJ0iQfYG1UVJ29BUHEqFI1sElYQ21PivbDi6Y2
 E2vikCf9TrDvxPuDJuw==
X-Proofpoint-ORIG-GUID: ikbYhuJdg0xADsEWMHZYifZbce-erMMz
X-Authority-Analysis: v=2.4 cv=dLCrWeZb c=1 sm=1 tr=0 ts=698deb48 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=IsMmzSx_pjv120c435IA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: ikbYhuJdg0xADsEWMHZYifZbce-erMMz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120115
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92713-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: 203AF12EB97
X-Rspamd-Action: no action

On 2/12/26 3:52 PM, Bjorn Andersson wrote:
> Upon failing to resolve the remoteproc phandle one ath11k_dbg() and one
> ath11k_err() is used to tell the user about the (presumably) temporary
> failure.
> 
> Reduce the log spam by removing the duplicate print and switching to
> dev_err_probe(), in line with how ath12k handles this error.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index 8dfe9b40c12626649639fc1dd9da0e5e0c2dcaf1..08d3a0c8f105b26b1548c5d6006f6ea162fe58ff 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -807,10 +807,8 @@ static int ath11k_core_get_rproc(struct ath11k_base *ab)
>  	}
>  
>  	prproc = rproc_get_by_phandle(rproc_phandle);
> -	if (!prproc) {
> -		ath11k_dbg(ab, ATH11K_DBG_AHB, "failed to get rproc, deferring\n");
> -		return -EPROBE_DEFER;
> -	}
> +	if (!prproc)
> +		return dev_err_probe(&ab->pdev->dev, -EPROBE_DEFER, "failed to get rproc\n");

I'd like to think this doesn't really change the behavior, but I'd rather
see this that in-house print functions..


>  	ab_ahb->tgt_rproc = prproc;
>  
>  	return 0;
> @@ -1190,10 +1188,8 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
>  	ath11k_ahb_init_qmi_ce_config(ab);
>  
>  	ret = ath11k_core_get_rproc(ab);
> -	if (ret) {
> -		ath11k_err(ab, "failed to get rproc: %d\n", ret);
> +	if (ret)
>  		goto err_ce_free;
> -	}

If the rproc handle is unavailable at this point, we undo quite a bit of work
in .probe.. would it make sense to move this check way above?

Konrad

