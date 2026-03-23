Return-Path: <linux-arm-msm+bounces-99108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGPQHLrfwGn6NQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:37:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB412ED1F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2FBD3005E9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 06:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E103433F590;
	Mon, 23 Mar 2026 06:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oMNhdOZL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/AcsbPm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2639933F583
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774247862; cv=none; b=KbofVbyv61cWAbcutl76maDnvB/DklPXZ3Nwmez5erJ8zO3H+/h4E/EeGPQxhS/6eun8xjLZD+mY68mpbJKjhpaGctJ6xH15Tqi2OWf9Bz/CY906dvuydQ6KC+iG3VCdKB9SZDgaBS/51xI4ccAVH0EBuBfAS+HQUSHYEVurABE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774247862; c=relaxed/simple;
	bh=CYd0mpnWhvJJAVOi/PNgNZgSPhp6FNow3uWcpuqOE4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VVa+bvNspWqlETvSkMUOIIIpZGn8VQc7f4Boz3AgRycw236an6oIJuA/1vZi9i6e5MWZ5Nn6vr4ZTL9M2GCtGygW0rUbfGeBpxeti787tVcjqKWBusoEfG1X57w7bMmul5PsikdViTjWiYnQGHjETqR8oFzv0mS7hqY8HCiGyK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oMNhdOZL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/AcsbPm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MLtb1s3385863
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vU7siURhYTx8zoN/W83nFghhGROqoHNN2zoMQ+WsTbw=; b=oMNhdOZLTLXQPKS0
	vxOthA2S27Ho901A3Frx8EOE5zH0rcWEcJY3SOORnwyVSOE712fJFp2kHj0W3imu
	8T++4salG8rlrBhxGZSa8vY5xN5QnKkC3JyBiq/iOLkMYPUL4lrTTH1itkgzWyR1
	dFSW7JFY4b4gG1oMnHPrAUo+1x9Hq/ObE5KNGXwGD2XcK9b23zW0y2ws41vnzSd7
	yAVHIdfIyseGTON2vuLJh+jPNeENfecCazc2ahakKxUvvKvBwQ3FT++WwaFQ7Mj0
	IfrOrmK0qUQDC2guXTDgVrmi1eMoep97Itx8SSzBGvDtVIZNUC7sOLn5R8JHFnLV
	CJj33w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8j09y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:37:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35b901d542bso3098829a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 23:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774247858; x=1774852658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vU7siURhYTx8zoN/W83nFghhGROqoHNN2zoMQ+WsTbw=;
        b=h/AcsbPm2DV0aupLE9C8N1QCvmxONFxh+mb3CHh8OeqSxHYoTzi61U4uVsts6tni8b
         +g/RzEQ04w0MTwAKMYDZmPmGJHHHFtu7y6eY5RYnbPCwdNoOLVaE69Y7PKO4NVMNcztR
         VuCMYfYsFgEh++stnaxS6Z/lXPL8NcpoTOUm43AwXfBZWvAgmiVzSkp6oxJJbaR7Y4Kw
         JWTDxAd52gHSZUf8WEbNlSVly+KpfVmc6v+NnV7MTjewdVlBG4vSzkgwWalfKHnVaI9D
         ugkGNnSOue1KfYVMGG3yj4E6Tuf3sQD0aEauOTEU/L1iyZ6mVBH1rVnzGavWEOQNXhdY
         3+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774247858; x=1774852658;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vU7siURhYTx8zoN/W83nFghhGROqoHNN2zoMQ+WsTbw=;
        b=qT4C8d/rR/MCNOcbBzMo0kw0sDWgRauVhFl98W7KeAtbg8isXaAp3cOzadUGVbcP3s
         yQSTBbokpyfsnYkzCkNCfZksvF1k0xWHE+p22M9zehtqVkYzyLc/+XlKcHhWP49CkO6x
         uByiEcjlfm8ZSlPPTrxx3qjxJjoPquTXbyZv4hlojJCPUxL0pljxeNu5cz4rniqWA6nH
         QZSM4nw05gSl7vzTlZL18hQGUkkceSoZ4FQ2VNyGAfXpqWGfi5TWL3pPdA65T+0SVybh
         IQabuoLcnOEgLMK9n4tnL/LvXudao/r4DCYhb1j0wmaeJKzHvvAFAdHxdTJKnzurJGl3
         4mPw==
X-Forwarded-Encrypted: i=1; AJvYcCWZANJihwhx7EZvGCyuGyybU40GJrsK4OFeexhTpk9Y/VYC+8dCQL3vxiK8HAR4eWCa6iT8j/Xq7gpOhpD0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqa9JeLMkxZ3n6niMHfazblSazzWYD5igkzlEoZduEAnsWJs2w
	ScCqSKU551THCB+9LldocndliusSRSToKY7pLuXqvMkwHpxd10wbZumyBroB+B9RD5XQfbs99N3
	3tzbl8q7Grj1PYMOlPgdJYhWKvUPvGcDLmBzLSG5XdyF42ykwxaB+Be47VNx4S6bIGRUlzqTt5/
	eO
X-Gm-Gg: ATEYQzwLZPW716yAdFOM0OaJZCm55oaTyt6ROUyjxMgKprfSjaP105Uz4vt2r3iv+UE
	SUymqSuJtQ8/KNpiOMceJuEtppUVh71xFHSZlowemyGkOCmA1nJZ474O8do+iV0tq5XkOvJCz+0
	NV6zfF6h5nf+e3C1uNrrI7kT2vUlR28zGs+LUvr9iZBkZNH9WSw8pxYfn/t5sZaq/3oLmv0lzlB
	8cCX+13d+yO/BIpB3oy8DSExsKwlRHGpFECNVkD1p6fgzCXl9txGx/i7KT9p+hUlThEOXnI5Xb0
	UFn05EaSeqnlXfg3omz+MNNNcT7+BX/6S+2qCsaDKyGzLtP9ogZVZb2e8rTWEDFGxj2MOa02FhY
	Hgu4mDSDgKRuA+iTYbPBSd+2j4Ve/qVcRTKG4TUrHPL/5SnlowdrUCA==
X-Received: by 2002:a17:90b:5203:b0:35a:1762:92fc with SMTP id 98e67ed59e1d1-35bd2d1b999mr8566410a91.26.1774247858567;
        Sun, 22 Mar 2026 23:37:38 -0700 (PDT)
X-Received: by 2002:a17:90b:5203:b0:35a:1762:92fc with SMTP id 98e67ed59e1d1-35bd2d1b999mr8566395a91.26.1774247858109;
        Sun, 22 Mar 2026 23:37:38 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc6026a5asm13718361a91.8.2026.03.22.23.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 23:37:37 -0700 (PDT)
Message-ID: <dd95facf-f17b-284f-7652-778bc0b48c70@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:07:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 10/11] media: qcom: iris: use new firmware name for
 SM8250
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-10-55a9566ebf60@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-10-55a9566ebf60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA0OSBTYWx0ZWRfX7xqj2rds2eoN
 ve+JCxt5sa/lzvSTR/dkF/MaXAz0USUsdbgKOIRX3HN9jXDdDJ9dQIBHy8lcfZi1FthBwsSYDU0
 JLAiIjf/A+jKPnSESM2QJSTS+2GGmOmb0457OAMY/PvN4Y4cYEnVdgXHOsf62avSbh1EvxFShGC
 KJXvPYKfIeCaN3xFv7DRrr4ymwAUt8FAAb+krFWHrMhC5DiQAa3Oe/SaZPKIG5MRlZ8MPZdEw2H
 UqNmRQ3YS/RDFm9L+PpfPfywlVILVCEsrMVeCicKhC6bWaAQVBiRls6xgrJAMbNzC12JpXGNmU2
 JeRVSujPe7oN1duBd9OMbxEO7PaCq0lf/ywb4oPm7nHVOBkbsg7OzzfC96y8du/x/iuVYuGkgt2
 FYl6UbpDXRHWShEinmzoUnbuwVfp897dobfGrgFBgDzmBLgQ/BqsRx41ZgvTzRtLMDtSc6OzN6s
 s0sBMi8uDLlzcfwZSOw==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c0dfb3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=hbzS8gabZINpAvasuVNEhA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kfT2U5OO0nN2RMqfEeEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: RxKCb2zncHBjXcuP2_UOjTFqB27oBCLW
X-Proofpoint-GUID: RxKCb2zncHBjXcuP2_UOjTFqB27oBCLW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230049
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99108-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DEB412ED1F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
> The linux-firmware is providing the vpuNN_pM.mbn firmware for SM8250
> since August of 2024. Stop using the legacy firmware name
> (vpu-1.0/venus.mbn) and switch to the standard firmware name schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_vpu2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index ab2a19aa9c36..692fbc2aab56 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -111,7 +111,7 @@ const struct iris_platform_data sm8250_data = {
>  	.opp_clk_tbl = sm8250_opp_clk_table,
>  	/* Upper bound of DMA address range */
>  	.dma_mask = 0xe0000000 - 1,
> -	.fwname = "qcom/vpu-1.0/venus.mbn",
> +	.fwname = "qcom/vpu/vpu20_p4.mbn",
>  	.inst_iris_fmts = iris_fmts_vpu2_dec,
>  	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
>  	.inst_caps = &platform_inst_cap_vpu2,
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

