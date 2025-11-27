Return-Path: <linux-arm-msm+bounces-83653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F4DC8FD7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 19:01:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 622693A9827
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 18:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643222F6187;
	Thu, 27 Nov 2025 18:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GxVnsSjt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvkRQBaL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11612F7443
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 18:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266420; cv=none; b=GBZyxbRusf0XZB6HOXiqmLZnnaSy/t9sVvwRplT4V/idH2LT7m294emLq20YJ9D2U8vYHevryGdHmtFDwl90Iipo0TSUqqHlYRUW7rtHLA9G8Eqb5xdZcXBbHojlWUdFpCBrqTpsYIcHZ3wzn+Yyjv0KxE1HQj5rE7NcH/LGzh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266420; c=relaxed/simple;
	bh=Ba7EEZfwnf9YpA9Q41B0CywfBzWd89HDvFHbLNU51l8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+f0v9mZPK0WQKx8hTlPBBUez7MRKvGehHfVC5lRWZyahAKfbZ/NXikSCR7hc7Q2PtKIOT/5wyoPFIVQAF9cnaui6pguFLhgheyKwbhZJCdqkO94aIn7igapdupJOumF9/akXSe9EjidR9dq1S8IR4zfezwGk/JtvPaNSzj27yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GxVnsSjt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvkRQBaL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARGwUeh2388412
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 18:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q/lATIdOhSEqGDt7CypLEeFZtdg/6UCJce/OM1xvcXs=; b=GxVnsSjtUBh408uf
	WgxzbYIAodrv/AmTkEDMBv7rGtEYlL9AcDnwF2AOsvQazaooCRjGy586sS5Cv/cN
	5GVW3ubXSGjyFKHph+5b6gR7gbnzcTB5lpdTzqB5MR426NTqtaYzoOBMa1PxUNDj
	O0E0k4U57g/b63nUXDG0relzUfkidpcmzhpe7ePdvx8ZEzTJ/bL0AHh9o491TWJ1
	x5DMJ4z+23BKK0lRnC/s1tpNdrrycOJIwJiHR0ucVFLLiKHwts6gyxds4Eo/UUEX
	C4TQqtwyLHvA4ik0r7AICQg1dgQXRNLcX5RRZlIpizdFlSf6p9s93EM/ney7KwrD
	VL7BCg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap7n8k5gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 18:00:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297e5a18652so11795715ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764266417; x=1764871217; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/lATIdOhSEqGDt7CypLEeFZtdg/6UCJce/OM1xvcXs=;
        b=HvkRQBaL9f+pm6tD0V8qd1YcFlMyBkw7650nXIw3OISP3UresIJ/4oG6rVJKADaeYY
         Fai8lJ1mHb4pO2A3c9cJGSxej44qPxh8x5JhNW3JthW+atYb2reGbsEMYrdUnMqP4mzp
         EpEU+Q5dbDKdWUDbCr60a60Xyb/PEUf6O6J+r3ZK70AFR62AFkI5Q8+j0v8+/wV5+KOh
         c4oHSUgLck44Prhjnss7kbOuOPB77/SPnzVsqeG4z3P7gBm1UOwhCx+NjOUIXugE3BQT
         GgapWdl9Fq3xeBg1aCuPQuuUARpHR1BvatGbSdf3rMds29gAt/PB74bNK0Vy+wGoDfom
         O68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266417; x=1764871217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/lATIdOhSEqGDt7CypLEeFZtdg/6UCJce/OM1xvcXs=;
        b=TKVIjd46JmlrsBKyqff0J2/+ZpqMNST6PjcXfXY3T/7frZ39UeUnPz6AuYNtb8E5jO
         TmSVgvdtr+4xjjaMRfDM1XiYpyKnSFKFLnpMNaWrFRx2opQ5DFSPoksPP3cvATEZSk8T
         oCdn4z4gfHtcD8/JuA4v0o6tJn93MnpI/JN6wN3AVxj89rUUT38ORRuHL+wiL01hx95c
         ctWhi+EDEGkIeoji8eGa9490oaolIelBl9X9F14RF+xO3kftCWuwlUXBglbx5pDNvCFD
         5xLFA+Qol3kETSzqHBJT7V4O+4+Mydvjf+qx06rchl6JE61Ugxh53NONba+SotpCxa1l
         Paqg==
X-Gm-Message-State: AOJu0YyeefkqxbeVRYz+bEFl47OQJkiALnqETiyJ8Ws9a++7Q5VsB8cB
	m6lMv04InmD8wxycbU6nUbOYSI8zi+W2dYaniMP2gLUpFJ0nse3ftyNj01k/fKAogEnBqQkkeuT
	W6v1zs9B8pPqsVbXPuXD8XmQIaieoqBQMFMFRNMtMRbSc/bscJn6eKvITQagn/ZkQq4B/
X-Gm-Gg: ASbGncv8olnpXuSDE1oV/OT1BxgfHx7uCu+74Cc9FTFmIRRVvNKqeulAnjHujRuobQ7
	Vc9ifBk/zBJf+S0xflBZ2n+U+A7udjZqO9psy2T2HA3lw05fpN4IdiPGX/BXFUeazZnw+0u4gUn
	/+5hlXynStjd+ufk2EkZY7e2gXumXaTsaZnrflN+EXKdb+LXzteECeLEYiYWKIrhsWg9iCM96Fp
	M+lfU1MdtfL/42ICwFCk52i04McJo5NbE+GHhWfHLt3TJnMU3Y+wAWiLqviSQonShWEXrPyYSzo
	Z3i4gKabcSeIMKuJ2Q4ZBQifK/crJeHyZcYLCnN6Uc/aM0Nbbbuyl8TluyMOjkIWG+wMvRkRKxi
	sW4uRlo2BbmrWAnDvqy7MUsI5iRnYPD7oyMkJ1EUTf4yzsQ==
X-Received: by 2002:a05:7022:20f:b0:11b:c2fd:3960 with SMTP id a92af1059eb24-11c9d85ff19mr12760047c88.28.1764266417275;
        Thu, 27 Nov 2025 10:00:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAHdY5FYydHTjid0mTa7ND+uDqfS1StWlaS3Otq1LD46My6KoRoslxU5ireDe85ZKdNyeNJQ==
X-Received: by 2002:a05:7022:20f:b0:11b:c2fd:3960 with SMTP id a92af1059eb24-11c9d85ff19mr12759996c88.28.1764266416239;
        Thu, 27 Nov 2025 10:00:16 -0800 (PST)
Received: from [192.168.1.3] ([122.177.243.249])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965ae9d06sm8164810eec.4.2025.11.27.10.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 10:00:15 -0800 (PST)
Message-ID: <d57b71b0-f0b0-4dd5-91a6-53d570d9d060@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 23:30:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] arm64: dts: qcom: lemans-evk: Add OTG support for
 primary USB controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20251127073537.1218832-1-krishna.kurapati@oss.qualcomm.com>
 <bf6e1039-c3ff-45e5-a225-4f2301c469fb@kernel.org>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <bf6e1039-c3ff-45e5-a225-4f2301c469fb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Z1r425_GVmAEwEgp4ki9llBA7FirkioU
X-Authority-Analysis: v=2.4 cv=AufjHe9P c=1 sm=1 tr=0 ts=692891b2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=oum8EWTtojjz8M1eykIflA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UXIAUNObAAAA:8 a=EUspDBNiAAAA:8
 a=Xc56VXtM65tYru8N8fYA:9 a=QEXdDO2ut3YA:10 a=bFq2RbqkfqsA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-ORIG-GUID: Z1r425_GVmAEwEgp4ki9llBA7FirkioU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzNCBTYWx0ZWRfX0R3nqw7S5KmB
 wwCt3ItNJyiM0uiKfYGwfDanj4poD+hyiYdR0BVC4fJ0oVX8T2hT6GMB7JCx9w4JLWm9RrQPoeI
 IKkx6S2BxeAzXIs4YBMFG/7zjfSWglpf15cU7Grkev/akHQH4Kb/S7DM6YJsFA9SNXFT4svm7fv
 H13aSmZjg85hUX/0AlDscQ6MIBwCcSvIsN4MYL6o2kxzHFi2MUedJPa7bWi9RG0NgVX26o5Uxig
 aeLP2JODc4MPXI48CRr6y6c0BzIfv6DTqg3KIJoOOrXRgox2pofXZQAvODOWnHvz/Lo1yFMoN6X
 Nx5++YMJI8S9OPR57R6v/i4CMd9FFVAZpEm0fNd1Cryog5Ld/31uIEGCq9zJXktNa/HxPi0YjCF
 v9Y/6bJh/ILxTIsLj8zNnEY0L0YdMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270134



On 11/27/2025 1:49 PM, Krzysztof Kozlowski wrote:
> On 27/11/2025 08:35, Krishna Kurapati wrote:
>> Enable OTG support for primary USB controller on EVK Platform. Add
>> HD3SS3220 Type-C port controller present between Type-C port and SoC
>> that provides role switch notifications to controller.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---

[...]

>> +&i2c11 {
>> +	status = "okay";
>> +
>> +	hd3ss3220@67 {
> 


Hi Krzysztof,

Thanks for the review.

> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).
> 

I see the following used in some freescale DTs:
usb-typec@47
usb_typec: usb-typec@67
usb-mux@47

In Renesas DTs I see the following used:
hd3ss3220@47

Can I use "usb-typec" and rename the node ?

Regards,
Krishna,

