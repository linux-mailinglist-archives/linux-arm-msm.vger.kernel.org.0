Return-Path: <linux-arm-msm+bounces-85666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A9525CCB374
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 10:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 334DE3017651
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 09:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6883328E7;
	Thu, 18 Dec 2025 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="krdYzvvG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OX9Akm5u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC7E2FE04E
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 09:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766050803; cv=none; b=iU6z6kssMs/p+Olsm8o5gJ3qta3Q70pvXKgwWS05x1dE7O8WYVlkV+9PsivWHhUQ3YFolTpieDiS4hlHgVkK8Up5cwLACuKSDZJfmKN0J/TZE67wT2Bo3S0n0Bhw5vVixqYQbXU/U3n33bjZOdBUSK3j12OD/tIZqymQIVmZDkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766050803; c=relaxed/simple;
	bh=18rdI16McX2Rw3Dfb0mIqK2tbkliWndeDDttpJ02WFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lw/Rpjy3dcS9FHSmcy8E9mUZ6U3Xuq5pQpcgeXcMckHf9LEHVfuD1IUrf6BC5MgMHHpJUwRrw+xlvlEh69leoxNdZiGAw42Cgr1DUSqg5678Xno7nbIE+ksPh8PE1gZ9ghCXX6ATVPnK1BwN6kCuOejketIBF7fORWcxgz2ku8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=krdYzvvG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OX9Akm5u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI8oJq6237560
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 09:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/77vK913TTlKN8QIeaXI4qErBxlb52ugP8le19n7SKM=; b=krdYzvvG87C2LTbf
	hzmQpzCbTJr3ekwoATs3LgDfuWtaQ7zAsVTPSIn2ZjkJC+TXhg4kbaPbb6dsXpSO
	veVh2v2ifDj7jqGH02lqu7qBvF6aEAOWOisKc9UF7MHRZoCvxTigreIZGnNnQ6r/
	a4WIqT+HKT0tzGCg94D6NTrnVK3M/1656Vec50f6+HG0cUrSvfzfaxas6BKr6s6d
	5dyf2HuqnARGMnH1CEn7NrYK/idekVq+gRd4Tl3Z9xkd8G5E+gZZvLbELRldL6zM
	rah4aYpjLS8xJ/vR9XZS9VgKqEn5GJhi7QAAanjRe8awoWw5XUtENdwhcH8E96G+
	T/wZMw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b44x3htvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 09:39:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f177f4d02so10724575ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 01:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766050797; x=1766655597; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/77vK913TTlKN8QIeaXI4qErBxlb52ugP8le19n7SKM=;
        b=OX9Akm5usxvjJVF+qjcgn5oKTT1Xgu/VYL4POmhOJaoDXxxyyBWJ4ePwf1CqRf7A+u
         0BTJNM365QKglkX7AS80SYWB3A5KSsAA7hzPGcDgFsPJL9K4FOws9pltubdQSvmixsCj
         bcfyZM1tGHI6F7dHlwqK7807/h5pGsYsp63ge8EwcfK5JR3a0HTuBsqLlp55uO5K0/ak
         BfdAnzVXe0A5RKU2NqjCMPXelew3+/H/lo0Ct55XsuXAWyr+t3FjqXiTh82oK8HhXHkl
         9jp+vSO8/ia0Ds9PBTblbPRDSPd4M5sIwHI5rvDDCsXq2z/Ngnv67Fs7fOsKi9ocWFm4
         Wwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766050797; x=1766655597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/77vK913TTlKN8QIeaXI4qErBxlb52ugP8le19n7SKM=;
        b=lD5009bxnw+0djNszZJBNelTYfGOlXELu50lCvirny+f7Jo7b5SnLeOcgGOFKpxglH
         KOYkMLpiPz8+dNJB/h7Jz7fnBACPu6VhrxiQdpqVWWd6YSKkpsd99sBCftF7BWtAGqm4
         UHiNgMD0NEjZJX5zSrJgSFW6YPkz93sX1ZT+mL4PyWr0sB3waOKzWRfCF22zEm/IDBf2
         gVHI3t0GPfSQtvbUM+jaZMURbcB7iNP+rDVKpKBuDWSokfHN7sBTbDaGgxddh2HT/cyz
         ZPsuXgz8fu5ViWswipqyRSa7RmthYRQDBR9Tkixp8gH8/TZNcS07meelISAPbTAD8tmj
         Qvpw==
X-Forwarded-Encrypted: i=1; AJvYcCUAVx0r6sfhZxFaA4Evw8Z4w869nIMYNkZ1CY1mRCGQgmLoZb9DLqywpSrBgzYapORZNXV0b1+e11PPIlaa@vger.kernel.org
X-Gm-Message-State: AOJu0YxqU1/FjmGOgMNeRPRhi/mIeJD2HXp47hSvuHx/JHxGR1Oy+NqS
	vjJjQgnu0aD6KNURJVwBnc4CogDEGwYTDe6NwuuG9B/uXVL5wBTbnn70rxK13mCWEUBZsXTYMyZ
	md43qhfWw+8TMZ8Kp7QgMjP9GxnQcPmxB2sjEjO7geyTU2cMRAakscQFiaH3HffoXbefe
X-Gm-Gg: AY/fxX5gdaB0um7wDX3NujoFYf3EEP16qHiiTz96IZjojbpHim58ScFx8kPSdLZSMbb
	0mou7jLNEc8+asPsIgF4CteBm8rr4pe/j67F5x5MMetvzhUdFuhxkXoT25qcV5Kq9sItSWYPUr4
	TUe+u0oWChjUstTAzHC0GCb4hANaa9c54CPQNJTG/AtFNvezaptCc+6H+ndCNpKfupF2r5419+U
	euHbBbwI5l/RSu5hGywlaeGGFI6sl2Jxbun/cuGdAYJKAm5Lit6QxSQsUU8Zg9vPGI9tdTLOMF/
	78j5s0JS6sn3/t5oDJIC+5N50QqYgHmtrk6hgFw9dKg+1gdgahRwVv/KJ3DaNcHPcoxRJsm+zPO
	0EFzVvsmImKTAfVeGmewFJcGJHBjl+f4QCQEchNNKvMQT9lArNjH7DGSQ4+1pefI/B1FQGLkZNE
	k=
X-Received: by 2002:a17:903:2cc:b0:295:888e:9fff with SMTP id d9443c01a7336-29f23b5f44dmr202652075ad.20.1766050797492;
        Thu, 18 Dec 2025 01:39:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFM3h7K3BRs43Yizvyw1/lLNzYQJC3C2/OyMTefiN1IrLzUvn1VUrHuWvz0igXIwZUSHnooMQ==
X-Received: by 2002:a17:903:2cc:b0:295:888e:9fff with SMTP id d9443c01a7336-29f23b5f44dmr202651815ad.20.1766050796942;
        Thu, 18 Dec 2025 01:39:56 -0800 (PST)
Received: from [10.133.33.162] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c8absm20015555ad.10.2025.12.18.01.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 01:39:56 -0800 (PST)
Message-ID: <6a6fe308-d2ab-4cdf-a7d8-d322d915cbc2@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 17:39:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-binding: Update oss email address for Coresight
 documents
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        "Rob Herring (Arm)" <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        James Clark <james.clark@linaro.org>,
        Tao Zhang
 <tao.zhang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20250902042143.1010-1-jie.gan@oss.qualcomm.com>
 <175684936304.1217220.3167248149687349464.robh@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <175684936304.1217220.3167248149687349464.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA3OCBTYWx0ZWRfX2U/3bra+YkJH
 gBoH0M1bUQn3iquDdwZj44VYPto4HNUVLKCxmsN76fyBeRsECIf8AzykiqyZ4q6HUVeKMkoF/wX
 PpRiIe4pBs8jonGpDoyE48sP0HU1odpJHypTflwA0AOFulvRIW52CVbwmWFE/+JkvQ6Lksq9zX+
 n7VLZa9npyb5AcPbVg8Z6edotIPVUqnEdAr0S7QW2tHmZB7/18JAB8boJJI2u4SSwdYxn0p4dB8
 VclQPllcsexihV53T2MARL1Rx0/r5GAZyD8WSiMw/O59/xEcqlQBKkxV0ithILlzMCse0YLAcCw
 ICphaLs8xDhrQWVnAUr5+QCc9nL2dYw2N9onSzyZBrM5siIRjELUigQizoWLdn30ikogLkTEm2u
 82yi0aWOovFwz82l35th21B87VMWfA==
X-Proofpoint-GUID: F_aL5K1QNbO6trBtUAzhCnt3OQaceU6T
X-Proofpoint-ORIG-GUID: F_aL5K1QNbO6trBtUAzhCnt3OQaceU6T
X-Authority-Analysis: v=2.4 cv=Zpjg6t7G c=1 sm=1 tr=0 ts=6943cbee cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=hx2rv9DSw3ookLii8U0A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180078



On 9/3/2025 5:42 AM, Rob Herring (Arm) wrote:
> 
> On Tue, 02 Sep 2025 12:21:43 +0800, Jie Gan wrote:
>> Update the OSS email addresses across all Coresight documents, as the
>> previous addresses have been deprecated.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../sysfs-bus-coresight-devices-dummy-source  |  4 +-
>>   .../testing/sysfs-bus-coresight-devices-tpdm  | 56 +++++++++----------
>>   .../arm/arm,coresight-dummy-sink.yaml         |  2 +-
>>   .../arm/arm,coresight-dummy-source.yaml       |  2 +-
>>   .../bindings/arm/qcom,coresight-ctcu.yaml     |  6 +-
>>   .../arm/qcom,coresight-remote-etm.yaml        |  4 +-
>>   .../bindings/arm/qcom,coresight-tnoc.yaml     |  2 +-
>>   .../bindings/arm/qcom,coresight-tpda.yaml     |  4 +-
>>   .../bindings/arm/qcom,coresight-tpdm.yaml     |  4 +-
>>   9 files changed, 42 insertions(+), 42 deletions(-)
>>
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Gentle reminder

> 


