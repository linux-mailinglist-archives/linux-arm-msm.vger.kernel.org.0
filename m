Return-Path: <linux-arm-msm+bounces-64808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A79B03E6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 14:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D36B73B1FA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 12:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFA4247294;
	Mon, 14 Jul 2025 12:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ThsZB4SN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E0B24502D
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752495292; cv=none; b=KJHVXXdU3v26jUeY1CMG9O70uMp708n76h0sa3h/hNsaUDqSMSt1m6JLVlEcQeCM6l3wccQF0HvEIW69GRqQxaPyWYGjurpJt36MJVF8Ke8l9OH6QkVCCvR6BzkmLpwyECce48X2+VgVrl/a3WkYzhfwcRF69K96fvtjVOjp5Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752495292; c=relaxed/simple;
	bh=LNvjq/HhF00mQ3s9sufU+eybecRGCk/V8PHR+axvGYY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fsc8MtqHDqB4YJee17MKjIq3zJaE8EpfErDrh8Nek2kmUPCsZMZ50JmxhpmjBxQ8osJAmoh9XZMh/6zX+euPL4uiQcOrfR4Vu2ldSGd5LrWA7UhqM3drCrtI/ft56DhHP9cxjS2bYCrCQwnMbHfaawy+ReKBDmhyhpAS7M+rpYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ThsZB4SN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9alGp020627
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aoI5BFClgTcyFuK38F1KY+FhVdU3uKRCX2U3iUvC0Jg=; b=ThsZB4SNBrInD9Wa
	YmyWGrc2zGW9ciktJh7xytNgsEEs9g1akgkAuE6v+vHjbQTGM0sHGQy7V290e7dp
	15BBbMalNS92yhJdQzs84fRq0Vl0SXMXuNnL3RXxDfzWTxWjVBRKMiA10EpbkkFJ
	9XIKUKVVC8n8W7W+TsIILeQx7tt2ULLhBv9vgwxicXaoH8LCBpIJVOJ8u0NkdZ2A
	7sfng5mMUW0G4TS6rGT6gAwnB3+TuCrlNFkSlDdQrQcVmm85sVVmCJ+Bio4YJQC+
	on2aWSNC5m5HCOdSKchJoEPbUxIb8FHfNetrdbYkRLgOko61vPn3LAJ/e/wUJoOB
	ls6Btg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugfhcmhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:14:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7df5870c8b1so45589285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 05:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752495289; x=1753100089;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aoI5BFClgTcyFuK38F1KY+FhVdU3uKRCX2U3iUvC0Jg=;
        b=jHIrs/9dMtC1CvRh7PIYdPxjjlHDVy68c+lQhYhfMWYgbSDukWhT7SbLTooX3gh+Xv
         PISvnHZh5gmUvVn2I4z+YmZbFzFA7m5XSLDzliJiwopdyE/bZbXEVcweawT3gEp+/HxW
         3kWdrmRwhQSteF/cD+np6AGYoDAb7DrbW0DNITs2KDIpENrmpwp9Ae5EWdh1TmS+rhAT
         k16D1mpVOcvHGdOyzUysVZfGcVeFRHIQtPU3cRPBLx3nSlSOSKBVW2d2bwBYQ1SuDOgO
         /PizRcP+3ijimK9DXRk49yrL89vQJ0s8tP0fy3N5Wi2YqGBgue/sckEMj4CrafAJDcF8
         I+hw==
X-Forwarded-Encrypted: i=1; AJvYcCVVzAEB2RXi3vc1Y/5ox46X9qHNfst1bvcggIE+gz8b6bsWZETm5K2J4jF4uR5w5w3xYk+flZFAMsdlvqJs@vger.kernel.org
X-Gm-Message-State: AOJu0YzTw/+Xy7DcpU9ATJpc6s6B81flvh94BZPzDr11aw8I9YjuY3Ou
	ZIj44Hyv4t0b+IVv8qnMbVlRoqD8iZavmfxGaFngYU8mWHLdZt00lfAjTsZ/RpWV3YRt8g5HaWy
	yYZbhE5bXx7V46JurwgimlVkyzM+eLphl125j+7OvV7PqN8xYFUqbRH+gMVRXcqyb5fYx
X-Gm-Gg: ASbGncvZ4nc83zJyI1d5i62osIF22DJmDC86KNUinnxbX37ONiypONhh7jNZCUOEDNN
	orToRkA7eX1iaR/wpraN1QHaXZaQvVq0j5NWBDX9wj9NDHWC7latx4kIikSprI2qIqMe0YbOoUY
	AFKUJTs3K7ZS9jPoFLGsjTLgkKLN3Jwm+JcDjIgC2TsqdSPETsacAd18rmWbbfb+1oTrpl/4Uji
	p83nnwb5pD2IXZTJVp2e1NvhrfKjcDDdyDbkWh3ks7m1FDfayIu+gR+aRjEJ/ye6Ao8Hf/7xGtu
	ZkeKiFicT8WBIVIAEg/4fhDPAO+sWUIIPjzvzxfNPQUKh11mveAGRdHaoYtEbyZS+rMi+etTwIV
	o6689V9wZXg92KiwMgZM0
X-Received: by 2002:a05:620a:618f:b0:7e3:2d1d:bda5 with SMTP id af79cd13be357-7e32d1dc30fmr94699285a.9.1752495288900;
        Mon, 14 Jul 2025 05:14:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFG5vZyWrc5c1Pue3RENiHkc+kjzDktP9Y1RxdkTc6cDgp35ovMXQ//H2HFsJEBRaNnVMnwSg==
X-Received: by 2002:a05:620a:618f:b0:7e3:2d1d:bda5 with SMTP id af79cd13be357-7e32d1dc30fmr94696585a.9.1752495288322;
        Mon, 14 Jul 2025 05:14:48 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8298f85sm824827066b.144.2025.07.14.05.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 05:14:47 -0700 (PDT)
Message-ID: <45e6873e-adb7-453f-abd6-c7b6620c9b34@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 14:14:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/qcom: Fix pgsize_bitmap
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>, iommu@lists.linux.dev,
        Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Cc: Joerg Roedel <joerg.roedel@amd.com>, Kevin Tian <kevin.tian@intel.com>,
        Linux Kernel Functional Testing <lkft@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Nicolin Chen <nicolinc@nvidia.com>, patches@lists.linux.dev,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Luca Weiss <luca@lucaweiss.eu>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
References: <0-v1-65a7964d2545+195-qcom_pgsize_jgg@nvidia.com>
 <6cc5bb7a-344c-45fa-a8cc-cea34493c759@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6cc5bb7a-344c-45fa-a8cc-cea34493c759@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4PcFD85e_fGeAEUTo9TNvJIvUqbyWvH1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA3MSBTYWx0ZWRfX2LIU32saBC+A
 RZUPuJSVGvgDgNCg0/ALg/K/8VfzoBxKXFKg6WyJbX5kzcDxmMudCWx2Fe0IHtMOvq7u0Ty0RgC
 ba+fMpwH6Y9AcNGoQA7T5BdNKcyeuY+ugvONy6pMCOu8JqrAl/AU5xUw4Gzel4RsbN5GqgyaXo8
 cAWIHCRFCZ0rrWr/JfH0B1Ij1Gf5mCRR2owb61XHWliyCe5YKb2hlITSkJfIKAFQbdB1IziwC4u
 lqK2rvIIUUdeWeCJuCuqcJMrdTcIVpy2E7HR6ZAUK/YROWgMQEj5V6ENTifUOmb2/8DWLgnYZRf
 rahMEhvQPGrxMoGiF+WhoV0nIaRbGIuhdoB+pKMNGt0DkCtDN9/S5y2JM9Wy/DRmULM+AxpkkNr
 cSlUiaaaSZxLEJ56g3eHy80LWuVM4cDgm9UDnPiLnE6Caha0bqJsDbtCytWEN0ZwAMRiWSBJ
X-Proofpoint-GUID: 4PcFD85e_fGeAEUTo9TNvJIvUqbyWvH1
X-Authority-Analysis: v=2.4 cv=HYkUTjE8 c=1 sm=1 tr=0 ts=6874f4ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=KKAkSRfTAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=LZJuRBUwro2lsZWipJkA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140071

On 7/11/25 3:26 PM, Konrad Dybcio wrote:
> On 7/11/25 3:16 PM, Jason Gunthorpe wrote:
>> qcom uses the ARM_32_LPAE_S1 format which uses the ARM long descriptor
>> page table. Eventually arm_32_lpae_alloc_pgtable_s1() will adjust
>> the pgsize_bitmap with:
>>
>> 	cfg->pgsize_bitmap &= (SZ_4K | SZ_2M | SZ_1G);
>>
>> So the current declaration is nonsensical. Fix it to be just SZ_4K which
>> is what it has actually been using so far. Most likely the qcom driver
>> copy and pasted the pgsize_bitmap from something using the ARM_V7S format.
>>
>> Fixes: db64591de4b2 ("iommu/qcom: Remove iommu_ops pgsize_bitmap")
>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>> Closes: https://lore.kernel.org/all/CA+G9fYvif6kDDFar5ZK4Dff3XThSrhaZaJundjQYujaJW978yg@mail.gmail.com/
>> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
>> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>> ---
> 
> The downstream driver from >10y ago for this era of hardware
> suggests (at least some?) users of this driver can issue a magic
> TZ call to switch to (IIUC) ARM_64_LPAE_S1, but there's no
> implementation upstream, so:
> 
> (adding a couple folks interested in the hardware museum to CC to
> bring this to their attention, nothing to act on though)
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I never actually added the people I thought about to CC - fixing
that..

Konrad

