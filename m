Return-Path: <linux-arm-msm+bounces-69872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB869B2D40B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 08:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E5A22A7E3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 06:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7362BEC55;
	Wed, 20 Aug 2025 06:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCFGBTN2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6756266B6F
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755671258; cv=none; b=E6qnnRmmKo4ZyAQsd4HOEIDvYZtJIeNAuXgjUcG3tWmkMJbKeALikLJqS/7Y4SsvblfzDoes5yJBsdjqlIhROTYwIEWD8Eo41++irS/4c69EBR45zDIleEqUCVrvS6mjjRsp7OIiQM6VLiKfQnHWml1qRuDDUioOp2pwlXgof0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755671258; c=relaxed/simple;
	bh=yutoOPb0rYP498lWLs9Scfp2OW0gi41bzD2TFy+eBjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YDFLCP1+fHYJSBJlwWBK2z4A/4OgwTECI+d1gNyCbORn1lMnepox+st98KXtuEGgS8UkenwqA+im8Fqz54gRD50NPmkdNybOySE4BmnTR6efkcaf2Uu6cHfuUJKILG5KF08DGRZFhO9Krlgs8tR56fMUYQFHLWcQ8r0hBFymCLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCFGBTN2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oUR3010412
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0YWM5S4dm7vSz3gmoQTVjUJYFT5kv0kabSHfWarxYxM=; b=XCFGBTN23/Vp6ulk
	cA1/eLv7ZLhSywt+Wb89npC+Wr4qQopzFDxh3SWtGIyBXbX9mE780j3emx34FDD2
	7An1K03U+tRmtCtL/shMlVDdgzWHaomLSwsYBMXpgulk5MFSVcFl9KMss+eU0bHF
	y52Zda7qOO0Jjzft7aMR/2FXw93epdhrl4b7jxH8b9OV2PrNXFD6mFRfq17snyx4
	7kErxl79pwoE89eiIHhbdCqqUtYtWwbSVzpPTqWLRZi5wfDhm0FbvcrLoX9QiZrl
	tKOn2mpsoA6ScYJ92Xqe6L02NcziB8WicwJvfWAD5bzylnLikpQvhgpY5jfNrB3U
	wcuzKA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528rn18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:27:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e8ae86ab3so1006338b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 23:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755671254; x=1756276054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0YWM5S4dm7vSz3gmoQTVjUJYFT5kv0kabSHfWarxYxM=;
        b=rfeyjd0wAcEjGDrnnk4iy1VUfaqFPOFJQtb/3j9ObKINhOfj+3zqCEM30wI/GPgdNh
         6/GG3b0ejjUTbeJ0gpfTCzV9s+rsz4ZB0eagvr730iXagKZ0vJ03vZZ4i6M++0au2RWR
         xLojdUqpVCwnBsDya0IsAixzEhu5wooqDM8Ch/wewYds7Yb1C+huCLngjOm5ya/VXs1d
         9sDsDFQK+KlnWvpsf/j5na699KBf+cBlJbrf4CyJHPId2/186gaEB1Nq5ZrMi9BNIOJl
         zntbg1881fhRKmGs2XhWToNB2u+U8yxjjFo3Fnkeydzoab+8ZL56WlY3lftIDM5ltFP4
         KU0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOPwq904NtQg2GsNlJkD8qzcZOS/T3RWC4drY7cR6VQS240IG0Bmzq/qV6CZPE3NUc0CX2MOqrz+3grJT9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4AjiJtxDnranJPwrcg3vasGmPT47XnGaKdZdT0I87srPphtl/
	/dsvlymGV4demk4VDfhSFQHra3Tfp8gZlH+BoPKUwVFc+85h0j9MlDkXrOI+pKGjXNem0uU0srl
	fELvDnT5Fw9g7p5SOYqN7dOSnXGcq0g3QOMri10w8hdyrbQH0oErmXiHPgJa1+pNNAW97
X-Gm-Gg: ASbGncvQiOtDWvLLGUL03/mpfeicFv4nmxehNBElg80yefnLC37UFr5ob7mm6PNeLi0
	INV+D0Jm7vRRgiWh/2Q/GijESS1+wfJykinCrVCUKxDQKJN9yNGvk1nk7EpeixzQj7DwzHKIUX1
	6lXWMQDZGj8hfASXC5sbho/i2NXZlEWhDfGnedNHIpRObxMxX3M00YHWg3BSrEZfWvv394TCMk/
	EgXqfXwp8gRsN0sN2u5UlXgDWwxZ/p/vAREnX/Ayu2E6z1Q99ZwMuF2e9CrutHh21ef7bxKILym
	j8aNxSyj4PdzVpWSNAGnoPpa+dtl5kI1Sl2dp2rbL7gkJZyNnFr/6rcgsDy6NqOKuzgjV9TG17L
	Oe4SoJJdkj57+jXc1FISe6Ix5qL7PZlt+
X-Received: by 2002:a05:6a00:17a5:b0:76e:885a:c344 with SMTP id d2e1a72fcca58-76e8dd4cb80mr2579627b3a.26.1755671254274;
        Tue, 19 Aug 2025 23:27:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmS791N0ixCzI5dRAxbIiWf0iE1fLD86Phx2bw91vneJ+muUr6Yon5CmZn6QVf8jfjkBKoJg==
X-Received: by 2002:a05:6a00:17a5:b0:76e:885a:c344 with SMTP id d2e1a72fcca58-76e8dd4cb80mr2579594b3a.26.1755671253812;
        Tue, 19 Aug 2025 23:27:33 -0700 (PDT)
Received: from [10.133.33.73] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4fa868sm4294504b3a.64.2025.08.19.23.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 23:27:33 -0700 (PDT)
Message-ID: <baa85e52-f275-4d29-b3a9-2880664434f9@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 14:27:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] coresight-tnoc: Add support for Interconnect TNOC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
 <aba6bf1d-5974-4003-9ae2-62033ddf87c5@kernel.org>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <aba6bf1d-5974-4003-9ae2-62033ddf87c5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a56ad7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=T5-8DVSjhCRqEL8X1fcA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Xu1CWj-KrvkUJrj2KXzihu_adjA97Rpd
X-Proofpoint-ORIG-GUID: Xu1CWj-KrvkUJrj2KXzihu_adjA97Rpd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX8QMfkexRPJ0Y
 cKciEd6xAzkRpMRzQXV/yF6yCih7wyYYdpjfYbfZd2lOhXTnN2CG9sZlS2fxjHtDv7AMN2JkI6h
 yVe++TrzigtxrYAO305sQ88e33J6IeuDUfXD12dPtwhlgqiUgN06VBoZdr8ROwtUlMAsvY2uxXe
 49Rifppir7KESCaKdwq5p5o5mqSOgj49ROgSzTh+p2QZG3MvZZPHVqep6qOBD+ipTsA0NRzvriP
 rNrE+HQ905GncHXn/c1NIZi2wiKJMh2sBcV6OdKfmCC1JHB7xrUIg+m+h9fguD833VR9qmRqGzD
 B4xPpRFSmsXByBn2itRL4cNxYpFqcxT/DxLOmijXxSz2hrZI67HWNIiQ7ZSJYX8KU2R9G983yYK
 IAXrOPCkFAybc3bgX+7wSIPWZdVsHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/19/2025 7:30 PM, Krzysztof Kozlowski wrote:
> On 19/08/2025 12:27, Yuanfang Zhang wrote:
>> This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
>> (Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
>> trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
>> this block does not support aggregation or ATID assignment.
>>
>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Refactor the dt-binding file.
> 
> Everything is rafactor. What changed specifically?
> 
> Or you just ignored prevous feedback and did other changes?
> 
The feedback has not been ignored, i will update the detail in next patch.
> 
> 
> Best regards,
> Krzysztof


