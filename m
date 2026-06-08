Return-Path: <linux-arm-msm+bounces-111924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pfQPGUTdJmoLmAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 17:18:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CF8657EC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 17:18:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=F7L5qxQH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YKIlHfXt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111924-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111924-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD3E332B0E73
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 15:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D93F40963C;
	Mon,  8 Jun 2026 14:43:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3700C40B380
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 14:43:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929827; cv=none; b=hFI2f44hRYRTj/bYdjPKRjFiBsOOmvrOJxBssTOqARLXNZQFWC+7cuDKJ1ID1lfjx9w0H9WZDb0/wu5tUljddweCeZnNLqM4OFJp9DIKfdKDClf+lUo91VmSCNNI13LHv9tZh/WY29EKZEkx6KTbnF1Ws/M/3FYWO4++PQJhvUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929827; c=relaxed/simple;
	bh=0Ks124g6UDmOjYuZFGg5VXudv4ts64373wIMh9BAh8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YAPgGzaTwVCt2gXsTBkvoroKR7wvj5JflMbgKhZr6K1NyZ1Bns0rfz1yhypy9PT19RJFS3klK7paxXivQ9KstgKLJyGaq/8wteM/OmxVx0uQNZYjlSwfxEm1oFGysZR3dB3b7F7HJWp5hHXO91Q0fogeMflz34D45uFQHWVNQvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7L5qxQH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKIlHfXt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658EY1kV3918047
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 14:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5rvouy0LA0qv0H/lcd4HWDbQ7WITv9x2aTO/Bk6nOo=; b=F7L5qxQHsRm61SUJ
	NnokikmxUR5WaZizasytm9Lk8FXczfnV9dL/1b+eK9d/fss9KWtNfJxcRAePv/QT
	Vv/jSMPZRYTIgh52JeXt8uSA8cQVP8zJVECmJOja+c/rdUKnjEfxK3d536KwTp8v
	yTYPj1GpdAYfoNzeowmlMGMhcnqBVGz4chAtpiLQ0IzztKGWacd8CH4I14DlhiTm
	8BZcUB0iGsX6Ov4WYECyNBxGj2BAZmLT+9/x0XF0ykCr/wUlD3qiUWkPPOiqv+kf
	1t0X5wj0wobR/nqvIb9pJleTVnGQ8tNxubAMj5BTinBkn0rMReFBhQ6fABUkMpOV
	xPRrQA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8h8hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 14:43:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b9d265308so3285897a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780929823; x=1781534623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5rvouy0LA0qv0H/lcd4HWDbQ7WITv9x2aTO/Bk6nOo=;
        b=YKIlHfXt69db29ePeZsD+W0at4AcZmAub07E7wWKvkEvcIJx1WIFjKyXWwB+CKIt+2
         Ytg8PCDhTolO5xTtsXtEJ4ikyzpPEk0Kthkukilt4N1SFo9Ee2tE/vgdOYRAKAQx7DGL
         w3g+TvxAGlvYpjfkV/59AgXF7FONxwr9afJffYF1GPVFaPtMt83NpHF2c62MjdOiPqEr
         lBVJPptTA+kUUKP8SiiSPC/wO382C9uwhSVw5fJlAANJ63oN1zSBYFngv7llbj/BxdsG
         oeiDSnB1oCMkiOed8L4ZY06dyodooYOi10kEWNnP8+tIY3urby1W5b36EzzaSG0UlIfq
         aTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929823; x=1781534623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5rvouy0LA0qv0H/lcd4HWDbQ7WITv9x2aTO/Bk6nOo=;
        b=IUEkdv6ULC8yD2gXeoLx9r4IxWI4poWEwRRLPxnmR1RCpQtSnKSWy2+ZqZ2gaB0FnV
         xVzRUHDXjuWoq01wRRB73HN4tgwoaqL4aJPkHuOr41wmMIaAtaiCjPVdcEJcs+g3Ca9V
         tzOY1pjWKAC1KzX2JU5Pm/PR+Sks303Ane2BQDMYEZEMzb4kX+pLFhMdAWkTi7BTdP/8
         E8aF3DU1dnw1frcetL6uXegOjp3WEb5iLlgmpVz6YVVycOej6P8lg6/FpHzhEdgt5qZg
         a0LhkkxOb/eldhLwFrvX9NWqaanvz7aN6u6DfATj7h61ai2Rcb7OhMrQbEq4Hy7y0FVj
         QXAw==
X-Forwarded-Encrypted: i=1; AFNElJ+PaITy8fn5RJoD89/+9VMSQlNITVhtmyHwHSpgotKoU7PvQaioa9g+unsZcy4MyCLve7cwDxCR4hsYwm6R@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ8h1uYt3x8L3uekpL0sXxy6AiAx3LUm5q/3xtF0rNOT3DB+4g
	+FAjkyKjSMIoF6Frzc4XjIxW9XjO5T9av72WzFMPgp6Ldd+sd1xmGaGeOCFhK3qi+yAzBM+Hme4
	de5J4UfcujI9jMlgc/6SK6JbpqlbqoaaGKQ0OvrkMKeeUSIROWU0VYqgpo7+A88Ch9Luu
X-Gm-Gg: Acq92OGUljsrsoQNeFxyk24rJw1DGXGQmNNor+kElB3bddwKGKi9BRSsNFSSMlVt394
	JzVRAEozixQPtBgk0mOOTSGWgaqBU6oWDOFJoDpoVtpeOXNYW4T3Xzru8afTywk7NpodMVaT+H6
	9ES72xy0De8ijAJCvSMZGFjvuAp1rS7tONsrShiFKc9X6gBZrUaVoyzCPhH4dE+jn1lv5Ndyi5E
	flnddOzLmWViQ+GGGgW+BAO2QoSSfnv1RkaYfO2bneHBCQQVebM90VXmMjMlpu1sR73DhZno6e+
	U3iP7CE3MGY2iQkMNvgXTWGSFNHuRlgVZBz70Q981iOwO/1nXzfQYSnYMVmdiy3c/Aw+Cqqoswx
	yECZR5mrCZTmm/dme+2Wua3nJuSR/PP9xwbWDDVBFAqljPJh1TrI9vtO5kzxO
X-Received: by 2002:a17:90b:180a:b0:36a:7da3:266b with SMTP id 98e67ed59e1d1-370f0c54d08mr16715122a91.21.1780929822991;
        Mon, 08 Jun 2026 07:43:42 -0700 (PDT)
X-Received: by 2002:a17:90b:180a:b0:36a:7da3:266b with SMTP id 98e67ed59e1d1-370f0c54d08mr16715093a91.21.1780929822496;
        Mon, 08 Jun 2026 07:43:42 -0700 (PDT)
Received: from [10.219.56.113] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827f1sm19620137a91.3.2026.06.08.07.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:43:42 -0700 (PDT)
Message-ID: <a3523574-8eaf-452f-8126-db17892d5b40@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 20:13:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <68aa9591-49e0-4cb7-9a5b-36405efe7094@oss.qualcomm.com>
 <bkve3vmokuyrn4agsqyzxlqr5wuy5y6urnliqypac3h6lb32hy@tfkjstevqv2y>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <bkve3vmokuyrn4agsqyzxlqr5wuy5y6urnliqypac3h6lb32hy@tfkjstevqv2y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE0MCBTYWx0ZWRfX09qlA4cmyNsP
 +5l/O6c/JQGnhqe4zLHD3AxrwCtHLsbvm4UpzM9pjN6Fm+BNEXCZCUGRtWu8nU69l6Le+KX/0QS
 nTMJZ5LUVsFu66nEovpu6FyfBVgGU9dyZsrjaGo71yR/IjTxi4LyMV+bFDUBChJo8U3MdVlhZH1
 +k/DJsEqNaxzsGE+nT36RpoZsLDoxZnZ/Nz6hvNHKkEgpXDaCTYppE7Qacem4weCz62VdzXkowN
 QRWDsC33Abw5QL1j4OGyxizt7I7weogTtakdmv7bbr/YxxtG+ZTAwKhNemP4iO8A6kD/d1MhV2R
 4ErI6GtC3L3F7/plEZsaWnfS+5xDfwnvFCFH0g1cCfLGGIKeSZlSmbIEOQpp0RQBRtZUfZEw26a
 K1twmxJ473VfuPhkcFqjyQtfmcYzpwuQkS+ci4CG8fjUmiB828QsCjpGY0BGB7Mayivt9JqTiRk
 YbFhPMPLNGMFGEcTdaQ==
X-Proofpoint-ORIG-GUID: TJyjYolTRQxdDLOqjfDuTjERIoFwZulN
X-Proofpoint-GUID: TJyjYolTRQxdDLOqjfDuTjERIoFwZulN
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a26d520 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=ow02GMYoO05H5sz-MT4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111924-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1CF8657EC2



On 6/8/2026 7:20 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 06:59:34PM +0530, Bibek Kumar Patro wrote:
>>
>> ...
>>
>>> ---
>>>    drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>>    drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>>    2 files changed, 57 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> @@ -53,6 +53,11 @@
>>>    #define MSI_IOVA_BASE			0x8000000
>>>    #define MSI_IOVA_LENGTH			0x100000
>>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>>> +#define ARM_SMMU_ICC_AVG_BW		0
>>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
>>> +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
>>> +
>>>    static int force_stage;
>>>    module_param(force_stage, int, S_IRUGO);
>>>    MODULE_PARM_DESC(force_stage,
>>> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>>>    	}
>>>    }
>>> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
>>> +{
>>> +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
>>> +	if (IS_ERR(smmu->icc_path)) {
>>> +		int err = PTR_ERR(smmu->icc_path);
>>> +
>>> +		if (err == -ENODEV) {
>>> +			smmu->icc_path = NULL;
>>> +			return 0;
>>> +		}
>>> +		return dev_err_probe(smmu->dev, err,
>>> +				     "failed to get interconnect path\n");
>>> +	}
>>> +	return 0;
>>> +}
>>> +
>>> +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
>>> +{
>>> +	if (smmu->icc_path)
>>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>>> +				   ARM_SMMU_ICC_PEAK_BW_HIGH));
>>> +}
>>> +
>>> +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
>>> +{
>>> +	if (smmu->icc_path)
>>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>>> +				   ARM_SMMU_ICC_PEAK_BW_LOW));
>>> +}
>>> +
>>>    static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
>>>    {
>>>    	/*
>>> @@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>>    	if (err)
>>>    		return err;
>>> +	/*
>>> +	 * Acquire and vote the interconnect path before accessing any SMMU
>>> +	 * registers (including ARM_SMMU_GR0_ID0 in arm_smmu_device_cfg_probe).
>>> +	 */
>>> +	err = arm_smmu_icc_get(smmu);
>>> +	if (err) {
>>> +		clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
>>> +		return err;
>>> +	}
>>> +	arm_smmu_icc_enable(smmu);
>>> +
>>>    	err = arm_smmu_device_cfg_probe(smmu);
>>>    	if (err)
>>>    		return err;
>>> @@ -2273,8 +2319,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>>>    	if (pm_runtime_enabled(smmu->dev))
>>>    		pm_runtime_force_suspend(smmu->dev);
>>> -	else
>>> +	else {
>>>    		clk_bulk_disable(smmu->num_clks, smmu->clks);
>>> +		arm_smmu_icc_disable(smmu);
>>> +	}
>>>    	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>>>    }
>>> @@ -2294,9 +2342,13 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
>>>    	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>>>    	int ret;
>>> +	arm_smmu_icc_enable(smmu);
>>> +
>>>    	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
>>> -	if (ret)
>>> +	if (ret) {
>>> +		arm_smmu_icc_disable(smmu);
>>>    		return ret;
>>> +	}
>>>    	arm_smmu_device_reset(smmu);
>>> @@ -2308,6 +2360,7 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>>>    	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>>>    	clk_bulk_disable(smmu->num_clks, smmu->clks);
>>> +	arm_smmu_icc_disable(smmu);
>>>    	return 0;
>>>    }
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>> index 26d2e33cd328b8278888585fc07a31485d9397e2..c00606a416b2f4bb44a35e5d67f6ef801df68e1c 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>> @@ -15,6 +15,7 @@
>>>    #include <linux/bits.h>
>>>    #include <linux/clk.h>
>>>    #include <linux/device.h>
>>> +#include <linux/interconnect.h>
>>>    #include <linux/io-64-nonatomic-hi-lo.h>
>>>    #include <linux/io-pgtable.h>
>>>    #include <linux/iommu.h>
>>> @@ -335,6 +336,7 @@ struct arm_smmu_device {
>>>    	int				num_clks;
>>>    	unsigned int			*irqs;
>>>    	struct clk_bulk_data		*clks;
>>> +	struct icc_path			*icc_path;
>>>    	spinlock_t			global_sync_lock;
>>>
>>
>> Any feedback or concerns on the interconnect voting approach proposed here?
>>
>> This helps to address the kernel panic issue [1] reported for one of
>> Qualcomm platforms.
> 
> Please respond or tend the issues, pointed out by Sashiko.
> 

Sure, I have addressed and replied to the Sashiko warnings on v1,
I'll check on the fresh warnings on V2 along with your suggestions on 
this patch.
< I was wondering if it's needed to respond to Sashiko comments earlier 
or silently address the relevant ones,
so thanks for confirming this as well :) >

Thanks,
Bibek

>>
>> [1]: https://github.com/qualcomm-linux/kernel/issues/297
>>
>> Thanks,
>> Bibek
> 


