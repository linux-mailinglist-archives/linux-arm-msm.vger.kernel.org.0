Return-Path: <linux-arm-msm+bounces-82573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22770C70932
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 19:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 33EE12F0CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 18:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9676730E83F;
	Wed, 19 Nov 2025 18:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cb1BRReV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I52SFjlc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436792EBDCD
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 18:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763575601; cv=none; b=FlpiLGN9WuUsdrG0+kKxIXGTledYkjavWv9FU4n/gVE2A5NvTgCZwSB0fWQnhabHcgjejb60zD1gUyyGWqiRcZRx2s5fdWgo3PO561IoCX1QcZnSCcbCbyRdsDIhUUc5Yli1UKHZDZutwspRuJ9MSLF2Tz1bG2pHBApzZr95F4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763575601; c=relaxed/simple;
	bh=00Et7I9cT4nNJksJnG8NwiEkQjpoIYN1zwHw+vnBqj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mEzZ9oBdrScmA4T5NcykxWNUBmL31q9aOAeHChYV0jhbYhGjNUa1mrLAbdCVYD+oh6c3Tk7mTe0StwmHs7STmIGFbDZ9VM8ae4OVE+VtFPPpxH4a4/DnO1biIm/UHR/Jb6DLHySlDhJjsJT0jRPuJsDUv1bf1pQiZM/3hApMUXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cb1BRReV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I52SFjlc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJFkMvl2189156
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 18:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o862kOcvuwQRyFxMDCkRLuG/QYO1ql4833x+8E42oT4=; b=Cb1BRReVWlnM5GsS
	+5X7GO65K6sKpwVSFvRRyu4WkBToHqHwaL1Ltr3SuddK4YG9gA4fIWjlht7RrNh0
	At0k1LPjXoCyaaKTs1wiTiMUl39oAwv7oWuruYBnOoscKHZsnwN3Acb/atjfqty7
	XPbPRt+MpNsXGA0pTTiwRo0dxsmlYfwE40ZkYH96zaOxSEBGugC1y20rxfZMNH7d
	aicyvxRCHCPt6crqd7DrZnkAeD+N1QUv/klHNikWo9vH5MTBAa9iBwZWczz+Mtrc
	fKyjNGCYaahQpBGxrS0Zixp6VB18WE3PY0SQeKgzJ/Jko4Foxnk/WzdQxFQgVYJ0
	c6uU/A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahdpr13bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 18:06:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b9d73d57328so6244412a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 10:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763575591; x=1764180391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o862kOcvuwQRyFxMDCkRLuG/QYO1ql4833x+8E42oT4=;
        b=I52SFjlcGx2mbsjCrOfvbz/JB0H4kHFcRsWyd2Cbb21XDti0HhrDdtBN7D91G5Sc1s
         fbJjRASBJy3KbR0b+AD2pUmSvg5pNqJaPRQ56lqlyZ7RQErwFAqo0eyixBHWSuAVpPWp
         GVpmTQA/urP/kLX/Ou2K57uaPWlozFCJV2/VTDmCwF+PiBAG+y5JK/g7EihN86TNAHwx
         y0zC8gGdolKpPtQKPeyI2F2n+xZ9rpPJTv2LDlHDWhJP75kJLeVTutB7VVOyWdIh3Iwh
         dDUlXB+r1IQXWvZ/hTOPvq7FK4E/Cfii19kIuONrkuVdYtRO47hUWuKj8pZ0rmzOkyNd
         5t+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763575591; x=1764180391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o862kOcvuwQRyFxMDCkRLuG/QYO1ql4833x+8E42oT4=;
        b=TB9tz1TYdNwssqA5C8SyosTdBn+fud3h6srqpOg0KIOQWNwXI2as4P1fOCmrc83+b1
         Kany1TrWwG6uKYELI8Dw1trpLYxlHDlaAx/pyp63wfxpl1ZiKAwK4nA2jxpr/QvyvUKH
         oDc4qSD12IcR75yB7vGQYYKmnZZHRnttpFKI+0sl50f6BMsrmTI4riFDxyOdnhfsl8Vl
         lEepecZJ207d7VvYxOIfqKHgKM9sJDEV8MNfXSZHNpU7bbvjsmcnH0BPBU+F6FM9CoMR
         HDUXlLior0OEBLlTg8oFHi1Ey5o8zAvLu7lu+bRxsQ+sY2hfEUrTCP2OOSVxC7WFwMhb
         YjSw==
X-Forwarded-Encrypted: i=1; AJvYcCUOclJqhaXsIyb+mSINAiFiARuIjY68m315dYPapfWBZlERO0BVTp7FsAGoP/sequ/as+ONgVx9b+BZsf5Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzChMgBrFuY7fwIyd0jUxyxP2IBMo3QqydJsbTqzC720Zvo8Ozk
	00OyNk10R70D1LePZY0D/4FdtAaKmSUc5cnI+tnE6q6YZfA0GfRDyFGSTD93CfFtsa2VxhYhf5S
	ZgxDRblY2jhQZC5MBSgQHm621q3YZoedwtSM3p3VBpQg9WbQb/ViPlIhE8bUo8xPFGVML
X-Gm-Gg: ASbGncs0Bav4DgO9pZqVHl1NGWalcMqu0RZtnPKjtuiPFIqZdxNhkvYkhr2kWmK4arg
	hiiPLzXWLVkd5p9lmOton3+NpEaWf5TEo0WDJqpdgcCOZwVcGGzhiojmI+ErQhzlnRH6HB6bt4S
	RvgkkmO/V9f4Lxo+MisSFFXpV/0YT2tRIVLsgJNiiqP8PYVYzQFAkJ46JuMB/ULV/j6hCkbLVZe
	ioUDB8XVEI7btjt1sM+nGTbewMkNr7oCatvnpCpInp3iVy5PbLJSijdOGnmHNGNzvyy48zcczgE
	XKKK5tIXjeTmraaBo9QVY9Rgx+09qty9SRuHZKH5azJvd0GqHuhMWFm1LOtKtTAxu5i9GiBq+Ox
	tfC7/rrnwY7+7oEWqfGKUSe2kiapmhEJiRwoH3fE=
X-Received: by 2002:a05:6a20:a123:b0:2d5:264c:e4a1 with SMTP id adf61e73a8af0-3613b4c07f9mr489053637.8.1763575590697;
        Wed, 19 Nov 2025 10:06:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVhNY72sMTY4z3Z3kCjEqMsjFsvgckuWXFjMVFg++QoqncF79iRA6QYWRJYHUkt7ly3k5jfQ==
X-Received: by 2002:a05:6a20:a123:b0:2d5:264c:e4a1 with SMTP id adf61e73a8af0-3613b4c07f9mr489014637.8.1763575590165;
        Wed, 19 Nov 2025 10:06:30 -0800 (PST)
Received: from [192.168.1.4] ([122.164.69.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6346sm116417a12.4.2025.11.19.10.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 10:06:29 -0800 (PST)
Message-ID: <50bd3be1-63dd-4bf5-915a-02d923fb0376@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 23:36:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] iommu/arm-smmu: add actlr settings for mdss on sa8775p
 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251118171822.3539062-1-charan.kalla@oss.qualcomm.com>
 <himyof7napywkc44vre5ncqsatkkaxqnqbhjht6hjt53lakper@4wlwsvxkkamc>
Content-Language: en-US
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
In-Reply-To: <himyof7napywkc44vre5ncqsatkkaxqnqbhjht6hjt53lakper@4wlwsvxkkamc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Uq5u9uwB c=1 sm=1 tr=0 ts=691e0727 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=zTkTFZhCv8P113Yyz2MVww==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=antjIYhOioNipfN5IzYA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDE0NCBTYWx0ZWRfXxD39llYQ2lCj
 RHnhglHb2SXFqfNHas478Pp0vIlQj1IrXq6EGHMG8sAZAzEZ9Jnv3CC1nAgmPdkPTbeG2tTFPfK
 m4QsVwODx4q/VaIoya1DFHBmXt/8W//GFkiGXfj7fiEmh2e00fAk/XohRUH99rWxDnJ9ygZNT6a
 xKx30WphETkhlpkD0LXWtkBtnrjeq8+ve9hWDQJLGHxiLd+Z2iwfTxUac1fHW5AAbRzHH0WkC6I
 NtScH7hylbWf5LoBXi7F3jbWNMniTLcYPZyemD0lv1kgiGb7Ib7t5wGXqHNt1HVk7X8d+R2wbmb
 3gIjik5hX5r5yO+w+qRq/UQmu6SBcLiSMTcxAtRhrIXP48/w530vhlkUKE40WNvPB0Pe/Hq7hSR
 uefPB5Ba5ht7sxWPoamp/iVKZrkgIA==
X-Proofpoint-ORIG-GUID: DPQzNFief_JkD0G96teokz2JebbmAt_x
X-Proofpoint-GUID: DPQzNFief_JkD0G96teokz2JebbmAt_x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190144



On 11/18/2025 11:33 PM, Dmitry Baryshkov wrote:
>> Add ACTLR settings for the mdss device on Qualcomm SA8775P platform.
>> This is achieved by adding compatibility string for mdss in the actlr
>> client of match table.
>>
>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>> ---
>>
>> Changed from V1:
>>   1) Added actlr setting only for MDSS and dropped for fastrpc. -- konrad
>>   2) ACTLR table is updated per alphanumeric order -- konrad 
>>   https://lore.kernel.org/all/20251105075307.1658329-1-
>> charan.kalla@oss.qualcomm.com/
>>
>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index 62874b18f645..0b400e22cb00 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -41,6 +41,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>>  	{ .compatible = "qcom,fastrpc",
>>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sa8775p-mdss",
>> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> What's the difference from SC7280? Why don't we need to set CPRE?

Sorry, I'm really not sure If your question imply to talk about the IP
level difference compared to SC7280 for mdss?

Regarding why don't we need CPRE -- these are QoS settings that does
control how well hw behaves i.e., related to performance settings not
the functional ones.  I guess, these settings are derived from factors
like how many masters are sharing a TBU, how crucial are masters using
that TBU(like important ones may be allowed to +7 or +15 and may be
others upto only +1 prefetch).

Thanks,
Charan


