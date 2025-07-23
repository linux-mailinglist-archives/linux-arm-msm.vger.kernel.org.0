Return-Path: <linux-arm-msm+bounces-66292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E61BBB0F28D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 14:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2E85AC0261
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D01D2FF;
	Wed, 23 Jul 2025 12:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDinBmuR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB472E54A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753275073; cv=none; b=RTQDd5LbddaU+SJCH17F2zsNCfRFv7aW79HnLaCvgCa6NdeyLkTxgh9RDB2avDT+n2KmipfiMgQllcNhCv8v3kag+ONRnufsWHmFgpNjG6XOyL2A99cP16vQ33vYPUJcoilsKjXUFhzCM1Ppdpv813QwVWSGQbB4Xn+lM0sYR/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753275073; c=relaxed/simple;
	bh=irsV9FvgKnX6e/zN2HFo2i6k5xtyMkY6IvJrcT1VaGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oretbo5m+wKq+p0UaKgW4iMfzyXrsqdglxHiGqiOUAb3w8x8pgHzfzksUfzdIZrQyjvsmP1Jo9LdwHu+eeclPKhFv0HuiuVwhwLpWd3RWFzKHO9sO7jtWRvnRQm4IFZ22qWQtiyJK+PVDUgYT+Gum/DNyYKujj3BuZankdFsm6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDinBmuR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9ekme007879
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 12:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NlfFWNr1gSSRPt5bMOhvfRkXF20NFj8tEIaK0raN8ek=; b=dDinBmuRNisA5rNB
	XgMKeEw5GdSGxEr4JXPZufn/J56dDaC09T/WtKAaClRF9MIJVU9pGxwZuLw7qHx8
	ZHLt3VK82SfyOBmrni0/ZizBueHvWbOPK67NJPIb/wgWIM6PgbSEVNcKwHg8Ikk7
	X0MaPDkHZS9LX66AAOmfl+TpmevMdaBDmzpthHF1Av8FOMnI7D2Pu+1n7yQYwas9
	y7jXcP05ZuBw8oP5YEAt1GTBjcNn9iC3jIGuTmMLhiX+fXqgdYzNaeMo3pTiH7G1
	Qrgpxn8ZxlvYFTzU2WHOSnM25vW4DlvjUgFYhULGw4XAbkeLinLKbLv5Xa79p0gA
	US7m4A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qd5f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 12:51:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e33e133f42so32419785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 05:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753275070; x=1753879870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NlfFWNr1gSSRPt5bMOhvfRkXF20NFj8tEIaK0raN8ek=;
        b=R3VFgj47/h5kqaTCArNsOL8BDMwhBhVqQZq4WvyvRBThJPqzspiclnOn4lJxgKTYFw
         uMspACk1xNbMB9I4uv9LUOkHe1e4bkFl3cfBIWQkSbDcLpT0aeOVezN8FjuyNywXc8yZ
         b3Cvkjvlb4sdTzSpdRS2MtWEM67WB0iH2e9em8WCQXVUn3GND4PwUKAAHKOuM+uD69Kx
         9pZwIpSFlGoeiS49CKR3ScmjChnTo+h0zqMnSVcB6jd3aBGveh4+8/J15cK9LUHycbna
         jLMq/gBILVfw7b29EMjKqDhAxeR3YhQQppDyj59rFYKRtyXbZlZhGaBsvfE6C0RQ2GT5
         GKhA==
X-Forwarded-Encrypted: i=1; AJvYcCUjOOLayiDyZtVEExEjd94OR/GGs9f8o6wVWeiFHuryOUiLQxQw1NZi612HCQk6sk6uJCAAVDOrhN13BpbS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7tGLdLHfAa51Kno+bIkyPuxBxIwCQdmMf9jL/ifRClXV5t9lN
	PF3rIvwVBR75O3mZQ+9de9Cdz4ibSca9qk5/uZATas6GX5h/S3lGlB+5IfHJ2XKScJhnWwJ7G/F
	1V1R8cdmJSRRu7nUssPsyGxl+A0KIBXkvZN6Va9sYdMAsklg7o4cJ5mhCVGHEUTE+0sae
X-Gm-Gg: ASbGnctz/jAWNv7L4MPLtP5wkgkKNpBZwQc0t3jUIlqgD44QfGVQ98I+6Oj92O1zz7F
	7L+lk2R77+8XaRewgmoQYkbZVREHASnofCRX92d83tyVSV9FZBUzq5sgOyBSfvuaal6V/fuQvNv
	4k++5wat+chhSdCZAkSyi+vtC1eJQE5sehz0tr/hrk7QTvFxDlXNmNRC79fMn5ogHjvBRhqUKPK
	NArx2cScfZblYmubH8RMN8pcIworTb3+W6ztWC4sClyzw6sMdnjRW/KHmTjL9kqiGDCE3zKexB9
	Bdukp2lNMrVziXFlv1zXJbI81FcIZS7cUaytkuQdAnsdkM5c02HCv5QOT+pfEfZI6kmlkWwSJuq
	XrF5f1u21Ho1uIQE0vQ==
X-Received: by 2002:a05:6214:c2f:b0:706:c5eb:9b5e with SMTP id 6a1803df08f44-70700638cb8mr17930246d6.7.1753275069675;
        Wed, 23 Jul 2025 05:51:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5cFZGvvUDm1Gyr3QcLnUy4HpdRyf2Pph18NiIjxKW/XL6y8cizNodgiBEKYQU+iXlSkj/wQ==
X-Received: by 2002:a05:6214:c2f:b0:706:c5eb:9b5e with SMTP id 6a1803df08f44-70700638cb8mr17930076d6.7.1753275069154;
        Wed, 23 Jul 2025 05:51:09 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6cad7967sm1039883066b.144.2025.07.23.05.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 05:51:08 -0700 (PDT)
Message-ID: <ba37a9c9-3fd3-46fc-8d72-e57be45fc562@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 14:51:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] bus: mhi: host: pci_generic: Remove MHI driver and
 ensure graceful device recovery
To: Vivek Pernamitta <quic_vpernami@quicinc.com>, Vivek.Pernamitta@quicinc.com,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
 <20250710-sriov_vdev_next-20250630-v2-3-4bd862b822e8@quicinc.com>
 <68f18f09-913d-4ef9-bd13-ad32c1d5f8ca@oss.qualcomm.com>
 <43424518-e73c-4136-bb0c-d4cb30062d7b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <43424518-e73c-4136-bb0c-d4cb30062d7b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDEwOSBTYWx0ZWRfX9Cj3Sy9GWr7X
 1CVS64xY/PWUBZI474Dz2y8aJCQUE54cizna5hzmzB9aEiv1cBY44cMnzJjWYLSlIqQ+x+lA5rl
 aSVpXyKpcK3d5mPFqjzrNmfnv7hzsvANllADrtp9yM0yA6zrotJl7o8n9/9EwsxyZn2bGlUB1sh
 NR5xAuTyYPMyrhTNcCivREtKundgbIG3t5b348p9+ldAuUTlujo0s3vDUesjrszCFIgv1Dme1mj
 ex6M0q4oWrH+8nzDz1HmljWiGVe8BEPPlfM7BYKiqXM+b0dmC66x00TU4vBfid4/7d7UtU8qGcY
 xCRvc83aqrHbCGDGtInpkFQOEWEn1JWwT4sWPHxZsFXXXz/NITP/YWK10Y+iUTqz59XpJeoaexw
 iQxaPKk0O4woCeKMO7HjW2zQu7sTkCehbaVV3QaXDGLchl9yPpBmEeJ40dDkWCUrHdkCmvX3
X-Proofpoint-ORIG-GUID: lef24m-TOIOTkvcuSylzvm85HYfHrKYi
X-Proofpoint-GUID: lef24m-TOIOTkvcuSylzvm85HYfHrKYi
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=6880dabe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=ICarcIS45CnasG25CU0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230109

On 7/23/25 2:11 PM, Vivek Pernamitta wrote:
> 
> 
> On 7/10/2025 6:12 PM, Konrad Dybcio wrote:
>> On 7/10/25 10:58 AM, Vivek.Pernamitta@quicinc.com wrote:
>>> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>>
>>> When the MHI driver is removed from the host side, it is crucial to ensure
>>> graceful recovery of the device. To achieve this, the host driver will
>>> perform the following steps:
>>>
>>> 1. Disable SRIOV for any SRIOV-enabled devices on the Physical Function.
>>> 2. Perform a SOC_RESET on Physical Function (PF).
>>>
>>> Disabling SRIOV ensures that all virtual functions are properly shut down,
>>> preventing any potential issues during the reset process. Performing
>>> SOC_RESET on each physical function guarantees that the device is fully
>>> reset and ready for subsequent operations.
>>>
>>> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>> ---

[...]

>> It seems rather unlikely that out off all MHI devices, only QDU100
>> needs this quirk when working under SR-IOV
> The reset_on_driver_unbind flag has been explicitly added for the QDU100
> device. While other devices might enter RAMDUMP mode and wait when a SOC
> reset is issued, the QDU100 device will pass through without entering
> RAMDUMP mode

Rather inconveniently, this is not something that you mentioned in
the commit message.. Especially in the middle of a series that focuses
on enabling SR-IOV which suggests it's strictly related to virtualization,
making it difficult or impossible to understand the problem that this
patch is actually solving.

Please rewrite the commit message.

Konrad

