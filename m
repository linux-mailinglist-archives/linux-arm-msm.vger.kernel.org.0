Return-Path: <linux-arm-msm+bounces-114358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3Zf9N1bnO2p1fAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 16:19:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3F76BF07F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 16:19:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DLNroN7P;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UxgKBVfy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114358-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114358-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FA66306D0E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937463C13E0;
	Wed, 24 Jun 2026 14:17:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D157B3C0A07
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:17:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782310677; cv=none; b=gcg6eTzGXUKxiRWl2xRn8Gdy595mHP9h5TXw5/ocl+zHHZvJ6rqAHac4kSX3bx07In47A1qAUte6FxlyssZFu8PVQrjKd3XCXm6CrUuU50TkjCboRwRWa9XNRtCNvfIPKRUZzJ4lSA9M6kqes74x5uFyalTNKEoFKRKIK0Z4ShU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782310677; c=relaxed/simple;
	bh=pCl3h6ucVqnMOohzHo/v0aCy491VEIHbWMyUSASWRyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R+FZZ8sVorGXWJyb3OoCy3xw5p0+WubWbuAr5lx7zse0/FS8PV1PFAdzYW++NtRzAPbqxo0739/BgPz4LHtPfFBK/VsFg+E0asg7QZ8n2CKPuuDBNllbIZxr9blp52OkZTTgcXk8WYR24BRL4CpoIW7tdVBVRhql5HrL/bbXJZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLNroN7P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UxgKBVfy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OAOUFW4182003
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+6ssF2HIXHmvQPCli4smTaLrHpLLy7ZnA9WFvk35e0=; b=DLNroN7PJpkYbY0d
	aNdPudU0aB6F4UFtkRBMnekbSnuv2sAqDu7ncLWRMw0vXhAtFwaAf9t6SmZBQQ2i
	HQpdF0LiCE2bSWswNhiOHEKTSOAzx9uouWsklPu5u0fEwg0oyZBzQsxZLl6WLZXs
	ogentavHP7gdQg1Iwpltu3pg9oW8CFYORnkCyxzBC2+wMbuynTAMw8wuXSc8fN05
	lGAQ20dWb95H21g/5hloSyUzDjqdAhQr7r2G2dNRme5tr7wzQfwlz1FxVELvRIem
	jrr9ahKpLsDe3FiJUqK5o2cvAaau9WVopBb819qEcBrC8RVj8OAvWzxqypD7ApcS
	WNKklQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0aqp9mgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:17:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0d0516ad7so7492655ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782310673; x=1782915473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t+6ssF2HIXHmvQPCli4smTaLrHpLLy7ZnA9WFvk35e0=;
        b=UxgKBVfyfuruI+Dw0qrxxJbMOAB6fz1suVIK7eOKmYcHZ+0I1dvj3SaBIbR8AO+Kta
         0/oZSEve+v/jB7eQnqSBSxJ/o7hxidWTTd7kts48ecEU9of0ov9fDtEMUB3xiaCF/REf
         14jNfe/gOAtjCxzVsfkYlaYXvGauvloPnB2/jYqm7bic4RweX0CaTJo0mrkiZv5X7nCq
         g5TrLKMAnZQH3duXRaLLEFqNUVyk8xS9Luc9IghqwRlx8QE9BDHJABvCaWAqKZeNw+kO
         ESXu/ZgADZyc6CbvVYS6ZCrFqN6VqDPATrB3B6jpTebzxXWQBVmRDTkMAt2cWK4MhNw6
         hqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782310673; x=1782915473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+6ssF2HIXHmvQPCli4smTaLrHpLLy7ZnA9WFvk35e0=;
        b=MLnn2g53SOPyBThbFzLyM3aycCywKCsy/RQQupeu79kLBsGWZ3jd/EdfAoMpnVjxBL
         /4dUxUN7580W3tXITdSp8HwiX6Yb+qUm8KcT2G1wNavoxRSkkZb+fOySAjT90SLYIT0w
         v7Ac+84CEptrIS/YgGkzp+AC+KJ+Tn1d0IlgA9fwgpasTxMkBNHpDeJ0ncT2FAU3p3ZX
         ed9gYWOk65RAfUe0140uNY2ElCILH+PcTO0grm0eDSakjNq6ow0LfOr7LXU4vbCj0q/q
         /oZuG0S6PYNbzz1Tp7MXl7rsmNEFWOyk/FIffJhfsznirkdJDbmbeIB17kVBKew0dEo8
         G7Mg==
X-Forwarded-Encrypted: i=1; AHgh+RokFIqZTqpEA5ek59dVOUaKfj5UcqlsvhkeQ6y3IdRAytMrBpTp5A4COHdGAY7mnwRnv1KdBhPNSGFMzPNW@vger.kernel.org
X-Gm-Message-State: AOJu0YzzwSPp3kbGz4scLf2X3nx47Va8Vo758kVDTr2SCD7iWOsMXIvJ
	3G+IPmerKERqhoF73J28Ok2GszWh+taoZ7VzkgvfHSw0g/IJ5KHSu6Zu9NrWhnyzWECMVbIAwu1
	QOWZ0pTZ371rGRiNJCy2sir648wE7V4Lei+Pzqd5qDH77qXTzTKXfYW2apyldlvyoaQ36
X-Gm-Gg: AfdE7cm/aCgY3DWJfFwpHMAbE+v+huAx8GOQu5UAG3bKPdhEZWHwcItH21H3TmcCEnz
	oFm/3WO9SUOCuzpjB5wlLqEVNx7VeIFSC2ciC/6qcAiqlELqV6K1ZpB0017NvFb3MczAYBJ5Rbi
	VzZdHwsomFINQQzBNLdGtbOrwTDXRRfEK/s1kP7HpGHf6rF2g7/1EotN38GYdc8l/MkXGTtz05Q
	D22Qxfy/Ivc4Bq+LByX4Oe3bDqVfvLup7iZrJpFmAu8ZHRYpBvpBNmqqP3pt3IPYHn+C+oK6WUb
	E9/tN+e+7g6ST86cJQTbIrWLcl38/bwn+G2Gib+TXUKwjo89qAeXB/1Mgu8fKLhXY2tLmFQXJEP
	JK4hQHM1U2DdGwGi9Hd2FSKIMmiFx6ElMfbltEKsQUzgp
X-Received: by 2002:a17:903:1aad:b0:2c1:ef9:4516 with SMTP id d9443c01a7336-2c7e15c5297mr38355045ad.35.1782310673404;
        Wed, 24 Jun 2026 07:17:53 -0700 (PDT)
X-Received: by 2002:a17:903:1aad:b0:2c1:ef9:4516 with SMTP id d9443c01a7336-2c7e15c5297mr38354515ad.35.1782310672780;
        Wed, 24 Jun 2026 07:17:52 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfe8aasm129385595ad.68.2026.06.24.07.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 07:17:51 -0700 (PDT)
Message-ID: <4fb441a2-ce18-40a2-8227-5167779d1ed4@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 19:47:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/16] media: iris: implement support for the Agatti
 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-12-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-12-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eiEmVUMC1M-0Mpw9F6rhekG6NpLW1bwJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDExOCBTYWx0ZWRfX9WMSfYrmdvS6
 Tvg+0456il1z2hQ+zL8K5tWvnn5NQI1z2RV3L50ax5eyInkfx7R93ZWBmKgnIEg+OVuCJIZf9n3
 htadx3QdTXO98rXqbbtZgtaNImN3EmMlmKK+OkUr5yeS5P18WfIHd7BmR2ry0+75LT0XWLfw+rz
 D3fAIH4u8PxjX+5uRM+77up/Z0T9wQxu4qWQi4ObMjo1xrD+og+jm07TblPzAxjm3mHh/MnFU4m
 dyUxVFjMEkYxI84wr5QNopTv31fzFlkTlhTeYcSkesdhEngkRd+4nZ2FKAnM9pTdIdyMCsZQ/cP
 CEVD5rzqlRSS4p6/XFEBVLqH7n2iSnKAtv4IV+nNUV1JqYC+i0UCLvXv5saBeiYMeif/5I/4gLP
 y2vcUQ5GJ0x3E9ZTPzpqZLtjg0gC2A==
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=6a3be712 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=p9trJ_-o6J3B7G-T3u4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDExOCBTYWx0ZWRfXyiBEceTCbSiI
 oWb8aIM4XGnuQljoDomhUzavthZSwqS1mFLIF9CJwt+MdC9OyNgTpxgVcihafjAB27DiIf27ZXP
 Y5caibqcHb3RsLWkhwGY3n02opFgy58=
X-Proofpoint-GUID: eiEmVUMC1M-0Mpw9F6rhekG6NpLW1bwJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114358-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E3F76BF07F



On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> Port support for the AR50Lt video codec core (present for example on the
> Agatti platform) to the Iris driver. Unlike more recent cores this
> generation doesn't have the PIPE property (as it always has only one
> pipe). Also, unlike newer platforms, buffer sizes are requested from the
> firmware instead of being calculated by the driver.
> 
> Co-developed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/Makefile          |   1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 227 +++++++++++++++++++++
>   .../platform/qcom/iris/iris_platform_common.h      |   6 +
>   .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  | 110 ++++++++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  13 ++
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   1 +
>   7 files changed, 362 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index f1b204b95694..bbd1f724963e 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -14,6 +14,7 @@ qcom-iris-objs += iris_buffer.o \
>                iris_hfi_queue.o \
>                iris_platform_vpu2.o \
>                iris_platform_vpu3x.o \
> +             iris_platform_vpu_ar50lt.o \
>                iris_power.o \
>                iris_probe.o \
>                iris_resources.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> index ca1545d28b53..f57af31dbd9f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> @@ -443,3 +443,230 @@ const struct iris_firmware_data iris_hfi_gen1_data = {
>   	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
>   	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>   };
> +
> +static const struct platform_inst_fw_cap iris_inst_fw_cap_gen1_ar50lt_dec[] = {
> +	{
> +		.cap_id = STAGE,
> +		.min = STAGE_1,
> +		.max = STAGE_2,
> +		.step_or_mask = 1,
> +		.value = STAGE_2,
> +		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
> +		.set = iris_set_stage,
> +	},
> +};
> +
> +static const struct platform_inst_fw_cap inst_fw_cap_gen1_ar50lt_enc[] = {
> +	{
> +		.cap_id = STAGE,
> +		.min = STAGE_1,
> +		.max = STAGE_2,
> +		.step_or_mask = 1,
> +		.value = STAGE_2,
> +		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
> +		.set = iris_set_stage,
> +	},
> +	{
> +		.cap_id = PROFILE_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> +		.max = V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH),
> +		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_profile_level_gen1,
> +	},
> +	{
> +		.cap_id = PROFILE_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> +		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_profile_level_gen1,
> +	},
> +	{
> +		.cap_id = LEVEL_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> +		.max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2),
> +		.value = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_profile_level_gen1,
> +	},
> +	{
> +		.cap_id = LEVEL_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> +		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1),
> +		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_profile_level_gen1,
> +	},
> +	{
> +		.cap_id = HEADER_MODE,
> +		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
> +		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
> +				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
> +		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_header_mode_gen1,
> +	},
> +	{
> +		.cap_id = BITRATE,
> +		.min = BITRATE_MIN,
> +		.max = BITRATE_MAX_AR50LT,
> +		.step_or_mask = BITRATE_STEP,
> +		.value = BITRATE_DEFAULT_AR50LT,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_bitrate_gen1,
> +	},
> +	{
> +		.cap_id = BITRATE_MODE,
> +		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> +		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
> +				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
> +		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_RATE_CONTROL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_bitrate_mode_gen1,
> +	},
> +	{
> +		.cap_id = FRAME_SKIP_MODE,
> +		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> +		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
> +				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
> +		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +	},
> +	{
> +		.cap_id = FRAME_RC_ENABLE,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 1,
> +	},
> +	{
> +		.cap_id = GOP_SIZE,
> +		.min = 0,
> +		.max = (1 << 16) - 1,
> +		.step_or_mask = 1,
> +		.value = 30,
> +		.set = iris_set_u32
> +	},
> +	{
> +		.cap_id = ENTROPY_MODE,
> +		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
> +		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
> +				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
> +		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_entropy_mode_gen1,
> +	},
> +	{
> +		.cap_id = MIN_FRAME_QP_H264,
> +		.min = MIN_QP_8BIT_AR50LT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT_AR50LT,
> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_qp_range,
> +	},
> +	{
> +		.cap_id = MIN_FRAME_QP_HEVC,
> +		.min = MIN_QP_8BIT_AR50LT,
> +		.max = MAX_QP_HEVC,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT_AR50LT,
> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_qp_range,
> +	},
> +	{
> +		.cap_id = MAX_FRAME_QP_H264,
> +		.min = MIN_QP_8BIT_AR50LT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MAX_QP,
> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_qp_range,
> +	},
> +	{
> +		.cap_id = MAX_FRAME_QP_HEVC,
> +		.min = MIN_QP_8BIT_AR50LT,
> +		.max = MAX_QP_HEVC,
> +		.step_or_mask = 1,
> +		.value = MAX_QP_HEVC,
> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_qp_range,
> +	},
> +};
> +
> +static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {
> +	BUF_BIN,
> +	BUF_SCRATCH_1,
> +};
> +
> +const struct iris_firmware_data iris_hfi_gen1_ar50lt_data = {
> +	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
> +
> +	.inst_fw_caps_dec = iris_inst_fw_cap_gen1_ar50lt_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(iris_inst_fw_cap_gen1_ar50lt_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_gen1_ar50lt_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen1_ar50lt_enc),
> +
> +	.dec_input_config_params_default =
> +		sm8250_vdec_input_config_param_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
> +	.enc_input_config_params = sm8250_venc_input_config_param,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8250_venc_input_config_param),
> +
> +	.dec_ip_int_buf_tbl = iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
> +
> +	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 6a189489369f..bc04831ae7fc 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -39,6 +39,10 @@ struct iris_inst;
>   #define MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW	5
>   #define MAX_HIER_CODING_LAYER_GEN1		6
>   
> +#define BITRATE_MAX_AR50LT		100000000
> +#define BITRATE_DEFAULT_AR50LT		20000000
> +#define MIN_QP_8BIT_AR50LT		0
> +
>   enum stage_type {
>   	STAGE_1 = 1,
>   	STAGE_2 = 2,
> @@ -51,8 +55,10 @@ enum pipe_type {
>   };
>   
>   extern const struct iris_firmware_data iris_hfi_gen1_data;
> +extern const struct iris_firmware_data iris_hfi_gen1_ar50lt_data;
>   extern const struct iris_firmware_data iris_hfi_gen2_data;
>   
> +extern const struct iris_platform_data qcm2290_data;
>   extern const struct iris_platform_data qcs8300_data;
>   extern const struct iris_platform_data sc7280_data;
>   extern const struct iris_platform_data sm8250_data;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> new file mode 100644
> index 000000000000..393256f39112
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> @@ -0,0 +1,110 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "iris_core.h"
> +#include "iris_ctrls.h"
> +#include "iris_hfi_gen2.h"
> +#include "iris_hfi_gen2_defines.h"
> +#include "iris_platform_common.h"
> +#include "iris_vpu_buffer.h"
> +#include "iris_vpu_common.h"
> +
> +#define WRAPPER_INTR_STATUS_A2HWD_BMSK		0x10
> +
> +const struct iris_firmware_desc iris_vpu_ar50lt_p1_gen1_s6_desc = {
> +	.firmware_data = &iris_hfi_gen1_ar50lt_data,
> +	.get_vpu_buffer_size = iris_vpu_ar50lt_gen1_buf_size,

unlike gen2, gen1 is calling buffer_requirement from firmware for every 
buffer types. And given that call is a synchronous call to firmware i.e 
it calls and wait for a response, i see it can cause delay (and infact 
not needed) if called for multiple internal buffer types. Can we see if 
we can call that call once ? That call to firmware (get prop for 
HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS) fetches requirement for all 
buffer types.

Regards,
Vikash

