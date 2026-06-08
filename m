Return-Path: <linux-arm-msm+bounces-111892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bAetHYfEJmoHkQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:32:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1869A656ABB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:32:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Tu0SSTOg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Dkb1+eoj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111892-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111892-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 269B4304743F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4F437C0F3;
	Mon,  8 Jun 2026 13:30:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1591372EE3
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:30:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925419; cv=none; b=FZWlTgyKpIaZebOg3b0WlNCTTCsp8cDMNTZdEIzXKzK0r/45m2TaC+J/Y0zOoV/Ma93/BmtOsUZIAbTQX6FCKlErdb5+QkPzqcwSes9gykrCLK4az3XVqZy8M5KSSzCWt6elkRoKEiiBZxduIVw/sQYjG6QsWMyxO10W8LPIrXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925419; c=relaxed/simple;
	bh=wU51h2i1j+P7tyeaRqLj4SLZat3sAhChv+NIMaleJU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LZbdgA9vjCWRTA1+cxacSLgJMXh1aNzA7BobQL4GTxro1LFMilsn7/ic2n4+FrU3SRZ4f9StBBWQ4IfCL8rTpBXadHSJynkg3jBsGs6nOTiUyXT5LawNj0XAoXmJiPUjzWmAdmBXmnDQst47NV6fsZMbxN/H+m48EXs8ZRD+EiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tu0SSTOg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dkb1+eoj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRIoJ3789622
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 13:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mMpY65sj+dUK6nSVVEKFgaghqYR4p2ChoNTezZ6kJC8=; b=Tu0SSTOgpab62mLt
	zXHYwS1KMRhkkQcivFAU7zeMEHWG8wEN3pnTkOZf5NOf9a/nZr0jw+0+zS3g3xYR
	B7CQK9r92546i2qalbMEZpXS9V/qvPIgWBpHQdH2FYiga0tmQUnarEjiLj2y7o/e
	le4RQiwFKmZ0Kv0W8V7vJH5lZHrNK4eIi3l9P8qBWgNywdOenY6n5KluNyn5L3im
	1d8/6oPW5SM+mAuIePMOB3wmK/FsmgNKdOydY0OSqtw4Ldpv+X7KmpJs3f6F/4zz
	6k4op9tSj/HEGycK98Y0DZ3Z4ozx/+g17T5gMgJIV5xeT52SMCsCaK/QPGygzzVu
	n9T5qA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsv8amb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 13:30:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso3958424a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780925416; x=1781530216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mMpY65sj+dUK6nSVVEKFgaghqYR4p2ChoNTezZ6kJC8=;
        b=Dkb1+eojjPm8NweGDEPR8d5VFhwQ7SqcqmQA5S/RZlQJDTlA6mL4UrMmKxIv+LI67A
         VLOfkEE98pabi7EhjhUN6ABoNm32eX7QJz3ns886TQqqSi3p6rCaXvZ2Rutn4D7YjVUV
         4hs1qHIUPDUqY5n6gZWnrVKYMSUY0mn2lpydqdCVJr0ICKz8ky4D7NDkh6TSPCqtR9UR
         fZBvgspdisFD+vB5RSoUG1SNlmJ+PfJjC35V2NDi7uarD3hMX31K30oYETyqtoR6Npns
         ai8C5ewz6HF5RY6PYrBtvoSv58esvFpctkBBFWjsbAVfzCBV/zGsVvwTYGvfbO83Nw/J
         5Byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925416; x=1781530216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMpY65sj+dUK6nSVVEKFgaghqYR4p2ChoNTezZ6kJC8=;
        b=kZHWlIzMMRnH7K6qoCXA1RASGJSQqkxzZ7AHvkt/HlsRP+xyytxYgSdRjfbRYOL90e
         bGLoXH/IH5E9YskouDoqY0b5iPoa+ixBxfqQLnfcYeijj7z97QCV/jJyzn2c0OX+B0kD
         P8teTWDBfgEcSOuiVTNQQhBOswKbiQpFkSSxI4ZB/6X65h+eVBtvsrwSwQ4aNme7UjBn
         GWq2rpKOQmlfM0e3Uh/D56SjBsoqtMVZmrNmzM2ShV3qOt0z9srkvnxQtG+1qyYRlyKp
         JfLrPrGYa2drfQz6E3bup2DWo6geKJBEz+bO56hbNQfL5ikSlAGSiZBxALeEhivXl3uV
         qeug==
X-Forwarded-Encrypted: i=1; AFNElJ/WrHWJcSsSHv06LZtumbzvYvJtbE3WtPxpV6Gui8bUDT1ofR29O94Knf6+U2yDHCxLJbqjUaru89N131Nt@vger.kernel.org
X-Gm-Message-State: AOJu0YwM0cd++e3qtJEYQAT3aPUwL/4dbD45/K9jqTape+r/44cZrcTM
	DcGjtSOYBxH9PEbO3x5CasvuQB5qrNn24KoXrVN2kVxO70oG/TAPyl6pvmZ3mFsZ/jQ3PeRmDft
	+UahE04zX5IYBWPNUSNfcK5rslcVja9jfm4ipedWd5EHrbnBQ1R92GklC0Qnry/Jw77q9
X-Gm-Gg: Acq92OGMDhb0G0xMeDVcnE16y1lCO72qlivHOrlRCBAgkDUDS/AzLqD0nJLVLpOiwtn
	2VaMZ+PxIwehL9Ykvw7DIB56Y5KUiOymc03z+VsldK/qhz+d9DXc0X9o4zlE6hs7uFhMAc/ZG9G
	zlWwh4Te2W8a6eiPk9jrm7cBMz8vtiqbm5Ob3CycOlKfqQqq7+2aJ44ceTSzhQH4XMj7v0nGPFw
	fm4VvPOEzMfhyj62KvIymyKiDtQLGBgVnr+BWMP9JNU1Ba4LbIOWE9SjFyYeSRLuXBgjhafw+ZX
	0lhepcr5b11cRCwNqzyqLwteZu3nltba+E5IPhH8ez9dhnG7lbxY3i6Wk255oBQsHz4YWsklmsV
	SvLd0R7LvoVohCH/Cps4OSXoaAw13UQBbJNUIO1s3dLxo6bejudfeor1xl/0a
X-Received: by 2002:a17:90b:5747:b0:36b:9798:4f67 with SMTP id 98e67ed59e1d1-370eee03facmr15489644a91.8.1780925415617;
        Mon, 08 Jun 2026 06:30:15 -0700 (PDT)
X-Received: by 2002:a17:90b:5747:b0:36b:9798:4f67 with SMTP id 98e67ed59e1d1-370eee03facmr15489584a91.8.1780925414897;
        Mon, 08 Jun 2026 06:30:14 -0700 (PDT)
Received: from [10.219.56.113] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf8284dsm19173198a91.4.2026.06.08.06.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 06:30:14 -0700 (PDT)
Message-ID: <68aa9591-49e0-4cb7-9a5b-36405efe7094@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 18:59:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KxPUGK9DdG3Po6zkpPv4YYTNaoNAGC35
X-Proofpoint-ORIG-GUID: KxPUGK9DdG3Po6zkpPv4YYTNaoNAGC35
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a26c3e8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=vPN-sUkGHC-xCyVeAx8A:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNyBTYWx0ZWRfX6dmDVf1EUjsQ
 5cUhe3Sln/fDxwuPrHW9h5NM5zCcSY2UVJuQ4ZdMCU8N/LCE3moy4VWjn8Z8SAQXau01IofRNXP
 J85fM/v/DXTC7MPotAMfEE4qEitVPqFn5wgkIfN+M0gv6Lx+nExlEX6A9vjEXXHGCfS9xgh9DgT
 4LOQlTk0xmV/Wn7wauD+N63fDf75U1wV8bhubV0vaP9SStQ2DRBiAY9Mshb/i5qShrK9E9PHjfT
 8XDykNfhsDv3Zk7lJtHdJJyNkUyEo+GVBkMBedfNC1NoXr3Xg5iulkCLASIapuC9eY8s4JLnXsz
 H8sRZwu1Z1AUZuhCaDx4DleKpcS1HlbiKEcCt12ui60wfDwA4s20bymqdoA2rE8RRonUGZOZRJG
 SJIudq30vxQ0BMvWR4Ink/ySg/NcI+h86BXaKBXKAOK/Yqo63KdBLQmbKHavqk9DHP4r5kFgkvS
 Q0ICHIzwRUSq9Dev2cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111892-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1869A656ABB


...

> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>   drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>   2 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -53,6 +53,11 @@
>   #define MSI_IOVA_BASE			0x8000000
>   #define MSI_IOVA_LENGTH			0x100000
>   
> +/* Interconnect bandwidth vote values for the SMMU register access path */
> +#define ARM_SMMU_ICC_AVG_BW		0
> +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
> +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
> +
>   static int force_stage;
>   module_param(force_stage, int, S_IRUGO);
>   MODULE_PARM_DESC(force_stage,
> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>   	}
>   }
>   
> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
> +{
> +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
> +	if (IS_ERR(smmu->icc_path)) {
> +		int err = PTR_ERR(smmu->icc_path);
> +
> +		if (err == -ENODEV) {
> +			smmu->icc_path = NULL;
> +			return 0;
> +		}
> +		return dev_err_probe(smmu->dev, err,
> +				     "failed to get interconnect path\n");
> +	}
> +	return 0;
> +}
> +
> +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
> +{
> +	if (smmu->icc_path)
> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> +				   ARM_SMMU_ICC_PEAK_BW_HIGH));
> +}
> +
> +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
> +{
> +	if (smmu->icc_path)
> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> +				   ARM_SMMU_ICC_PEAK_BW_LOW));
> +}
> +
>   static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
>   {
>   	/*
> @@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>   	if (err)
>   		return err;
>   
> +	/*
> +	 * Acquire and vote the interconnect path before accessing any SMMU
> +	 * registers (including ARM_SMMU_GR0_ID0 in arm_smmu_device_cfg_probe).
> +	 */
> +	err = arm_smmu_icc_get(smmu);
> +	if (err) {
> +		clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
> +		return err;
> +	}
> +	arm_smmu_icc_enable(smmu);
> +
>   	err = arm_smmu_device_cfg_probe(smmu);
>   	if (err)
>   		return err;
> @@ -2273,8 +2319,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>   
>   	if (pm_runtime_enabled(smmu->dev))
>   		pm_runtime_force_suspend(smmu->dev);
> -	else
> +	else {
>   		clk_bulk_disable(smmu->num_clks, smmu->clks);
> +		arm_smmu_icc_disable(smmu);
> +	}
>   
>   	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>   }
> @@ -2294,9 +2342,13 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
>   	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>   	int ret;
>   
> +	arm_smmu_icc_enable(smmu);
> +
>   	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
> -	if (ret)
> +	if (ret) {
> +		arm_smmu_icc_disable(smmu);
>   		return ret;
> +	}
>   
>   	arm_smmu_device_reset(smmu);
>   
> @@ -2308,6 +2360,7 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>   	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>   
>   	clk_bulk_disable(smmu->num_clks, smmu->clks);
> +	arm_smmu_icc_disable(smmu);
>   
>   	return 0;
>   }
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 26d2e33cd328b8278888585fc07a31485d9397e2..c00606a416b2f4bb44a35e5d67f6ef801df68e1c 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -15,6 +15,7 @@
>   #include <linux/bits.h>
>   #include <linux/clk.h>
>   #include <linux/device.h>
> +#include <linux/interconnect.h>
>   #include <linux/io-64-nonatomic-hi-lo.h>
>   #include <linux/io-pgtable.h>
>   #include <linux/iommu.h>
> @@ -335,6 +336,7 @@ struct arm_smmu_device {
>   	int				num_clks;
>   	unsigned int			*irqs;
>   	struct clk_bulk_data		*clks;
> +	struct icc_path			*icc_path;
>   
>   	spinlock_t			global_sync_lock;
>   
> 

Any feedback or concerns on the interconnect voting approach proposed here?

This helps to address the kernel panic issue [1] reported for one of 
Qualcomm platforms.

[1]: https://github.com/qualcomm-linux/kernel/issues/297

Thanks,
Bibek

