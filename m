Return-Path: <linux-arm-msm+bounces-87841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA3ECFD33D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 11:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C8E83065971
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 10:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA70931AABF;
	Wed,  7 Jan 2026 10:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEmx6uct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhM3qbFU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FC13191AC
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 10:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781652; cv=none; b=ETmV1yY226xH9uYGk1hOZUz2jGccf4J3D15nrRX8EhDM81n1zl+LxYNR1HYzf+X3UV93cb5M61PZlbOAeD3AGbLaHApO+V3IGZ/fVUyRyUR9bzL15wrD0Xsuk5G+UyKJC0awqfug8t1AznX93uJvPT02jtbx7WL0Jac/10AHBRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781652; c=relaxed/simple;
	bh=jxxOLKWQy24X1JdBxMKRyeqBnPRYT3VXTWPuCnAcFg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ji09XDL83b71DcaS3TLRBTHwH9BZoMMwCkjF1pDFVsprhIj2YBPWGfzUFUDpb8Fq9cWBEsJjTwr0Psj9jGD1wT7p7BXfLa9NpKanCpL2t7fQ6ww71t96JQiz6sQhIJLRNgtrRo+yDusrZEIkVXNehTQaDSgmm3LMWiLe9/gzA3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEmx6uct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhM3qbFU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079RDYT4136987
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 10:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dd18Z1YzmeXBFzrrg4MrKCKtq5jjlT4LY/xzF2U61z4=; b=DEmx6uctIURqOGQd
	XRdYb+08Y8JQmg/rLOTTmrSD1uhlH5Ob1Kb5pK2A0IYCRoORBmZ1iKfllPakWBhu
	ZcwFV9DFMqMRhm0skF/dg7jvFCLIrq+H/2Pjl/on6xJQWI76tH851JzRabgosyoJ
	w5zyOzOLMAtd7S3une893xP7VwIqwqnDBEim5XuvMvyqMxWC6A7xidugtDykGF6d
	d4rVqvlBCHCiRwNyIE7fMIx0m/byPvFBW1/K3n5mxagf7lX2x7Ut+wnzbwvw4DYQ
	v3sAxQNpMTKrEQiFX5zoC9/DNw9DCq61duLcAV3K3ua12GEf9d7KrX+RZEy73ElC
	io54sg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e2x2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:27:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0d59f0198so21844005ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 02:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767781650; x=1768386450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dd18Z1YzmeXBFzrrg4MrKCKtq5jjlT4LY/xzF2U61z4=;
        b=EhM3qbFU6/V+y3hvPh8AumYHRCbmFLQyoDk3YL/MtDn3FAnZ7VTaFvruJ52HUX7jLP
         kzqilUjvADwVuxPllhnZTxngLys+l+/iYE0U6eq5NfPy1Z/h0nH0luwkK+s71GJbJqo3
         Tf+u9sWk08UQIT0KiuMmX4IyJJH2RDF2r0baYfMs3GRcfmq6JstOL97Fiq/wqacfEGIH
         Vs1wU5zdOoW0qDJgMNdBvJzRLMX/7myqvLDYYujnzMMUWfR4SNghHkHwXkZglMsufRvS
         7cCYfnXkdUJ8buJJpsOuIa5vyxHmcfX4bMljq/dujyg7MCFRQS6Bs3UnN2s9amZD0Rmm
         ipIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781650; x=1768386450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dd18Z1YzmeXBFzrrg4MrKCKtq5jjlT4LY/xzF2U61z4=;
        b=nbtDkKyjYGaV23+QA9pmDrhnKw1xOIQfa5IcCMtliLNtKmm8ji7c2hOh4Y6AzgELMW
         T7w0PWn5HDUS/0uUha3hcqQRlqoRZZQ7ciM6HSi1WzXyiKgvHKgU4SKEPzbLjb0T/3RN
         GwOrjuYC5B8aHXAe1Y7Tpw5mo6BRfVJG+y0WyRcUc8evtW/6heDScy+27ia7rz6v/tFc
         50lOjGoRq6XM4Ko3df9vq5CF7t6V4lAiTistEJS/LJDmibIKjei0aPQbzHT9hfZ7om2E
         pY6pg16lob0zF96XluqX8Bi3GvBpEh15SnXbPV6SuoqF+xHmKAbwwlTh+PORjHSk3CPN
         fBRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgxybQOKlL4AaxZQmOHuQjqFMe6D80FTKnOlMA8SJsY3y6pDS6UYlQ4b4UPmzzlKT5fs9fvlmW//vGeH38@vger.kernel.org
X-Gm-Message-State: AOJu0YxPvlbIRvSGqEnsnMWZV1VAsBnlCeiI2peSsO6JvBlCPUTN4bOw
	19+ftbXEjPZ/HcdBiHq/4gZQfqKoLz8q0HvN+fc/jVcpeNAsqhj3nBgJNxdvY/0Jq8DNtWuCaWi
	Vn5ff0wY5gVnKoFFpywCFcr5w1gemVyiFROx0bDLU8w3+0eMRvR4VclIDqp/OtpbXX4Yx
X-Gm-Gg: AY/fxX6Kw4YXbGBowaoT03UkWkVjRBQcnwNxK+7hlD/h2bmKDcMp/zaNYxP01/1x4eo
	gFvq0okDf2d46Q9qNSKE6fzNxWGPyRFQN5MEvNqmPwJqQW5ybXnE6hMysLKn35NCUNhgJWGVpqG
	cBMpgU1KiF8Y3/8AbFiBqWibhKY5WA4SadX1ujP229dPxa/dD5w6TmA9ikYTwqltIb86Z7B6mcx
	u5ifFwN42qxK6OLou2YD+5RVSqTlEPHiV5etETZ5A0w51646vHGMOPkbowo4ZXnQUrsfgavgvfr
	0h/B4r5J8JBGT5/7ttVfkz+yz9w3km/JbTFO3E7J0h4GT0sQYXXNa2eBeIw9csUuyvtBrMdH8NT
	2HhHBeGMSKKPkyB0HsTMz0A2tNuN3mhZBtSzjBE25Lg==
X-Received: by 2002:a17:902:ce08:b0:2a0:34ee:3725 with SMTP id d9443c01a7336-2a3ee4456c1mr19470325ad.14.1767781649708;
        Wed, 07 Jan 2026 02:27:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9ywrDhvBZ0wnU7MYSCgeUFZYxYnTIlc0Ny6WlDiHewTpQIXm6yQb6LXotIU6yBAibh93cyw==
X-Received: by 2002:a17:902:ce08:b0:2a0:34ee:3725 with SMTP id d9443c01a7336-2a3ee4456c1mr19470135ad.14.1767781649225;
        Wed, 07 Jan 2026 02:27:29 -0800 (PST)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2ac2sm47256485ad.90.2026.01.07.02.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 02:27:28 -0800 (PST)
Message-ID: <8f1b8d75-e3db-42e6-ba47-ce4d26aa6987@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 15:57:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] media: iris: Skip resolution set on first IPSC
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
 <20251229-iris-fixes-v2-2-6dce2063d782@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251229-iris-fixes-v2-2-6dce2063d782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4NSBTYWx0ZWRfXw0CF5TKpyO5U
 uUpNjMCn3h5eaUCLgvmthv9XaNYNGdQCxeRHFzXsAgNn5cuP3uj27cFV9uwoTV6F6MC0rOt+C3H
 gRX+g2f+/SGvkH8gOSqiOPliZkwiM4ZinVze/t8t9PS6D30Mf7BHJIWAVvNs75rKeyzzSC9y01i
 5AF4zfRrPG9IXVVXv/Cg3RZ6Axxkc2bOGwpgbqDeFGlMNZOzbU8AL95JSCTGgmT6zQ8TXqdCYB1
 bALQTQ6UsA5vYWHVMGdl4a6QghEYIRwdTHayL6ycdG4F/AQe0I43cQtyoi4wz78N+mvuGKO3Pgw
 JOIzkegn8nodI6a/f8opkEKLW0y8ZV6yYbQaUrxLLo/ahysn1IEHMZSLBJlxYuT762hNR9wJ3lg
 94raTYJUbU2wX5j6amw+gXDM3z9Zmqhtl6XC5buhdUetXZ4qVF7mCBd0WWDt8Af+38ZrMI3jkBP
 iGChV4Y7lsABw8jmJ+A==
X-Proofpoint-GUID: Izp2VPX_FjkVW6jbdD96WJFkao-7asvM
X-Proofpoint-ORIG-GUID: Izp2VPX_FjkVW6jbdD96WJFkao-7asvM
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695e3512 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=R43CkeNY5TQw8y71x44A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070085


On 12/29/2025 12:01 PM, Dikshita Agarwal wrote:
> The resolution property is not supposed to be set during reconfig.
> Existing iris_drc_pending(inst) check is insufficient, as it doesn't
> cover the first port setting change.
> 
> Extend the conditional check to also skip resolution setting when
> the instance is in IRIS_INST_SUB_FIRST_IPSC.
> 
> Fixes: caf205548769 ("media: iris: Avoid updating frame size to firmware during reconfig")
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 52da7ef7bab08fb1cb2ac804ccc6e3c7f9677890..5087e51daa842515e9d62730680fb237bf274efa 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -733,7 +733,7 @@ static int iris_hfi_gen1_set_resolution(struct iris_inst *inst, u32 plane)
>   	struct hfi_framesize fs;
>   	int ret;
>   
> -	if (!iris_drc_pending(inst)) {
> +	if (!iris_drc_pending(inst) && !(inst->sub_state & IRIS_INST_SUB_FIRST_IPSC)) {
>   		fs.buffer_type = HFI_BUFFER_INPUT;
>   		fs.width = inst->fmt_src->fmt.pix_mp.width;
>   		fs.height = inst->fmt_src->fmt.pix_mp.height;
> 

Reviewed-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>


