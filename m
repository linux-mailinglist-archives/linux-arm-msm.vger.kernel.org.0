Return-Path: <linux-arm-msm+bounces-77076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F01DEBD73EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 06:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A65D84E6524
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 04:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAF2309DB4;
	Tue, 14 Oct 2025 04:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMdmEn00"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D3F30B509
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 04:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416151; cv=none; b=YNsBylPuG5XIk18c6i41w0hHc/A+gOZaK7o6HSLA+GjBGi5GrampUVDMGle1qMC1hlMwoRTy6QtRuz0pqkAaVTjYUDXGWaLEqUawNFUYJonj8kcSuYIc3rmpEpSVVErCEIxypT6TK4TnldQYCT3Nd/Q0zk8ht0QXrkQivgS0DEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416151; c=relaxed/simple;
	bh=9sCf1XLCcsUswVl3Rkx1h9I82mM+ztc4hZsli0CE2lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvZkjtyOkgHVFx49ZmRC+1WxY/ButdohjSqVL6F826TD7lA1d3RD+AlfMCa3oKsVg8V5IchH+HHimC/+9r4028b2ik1izDkuXbiAJsWMlIwrAsMTesSakmFNLsDlBTRM44oBSBoAMbe++0TPxhM8gi6pDQCkkAPHl0DN+DcC8CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMdmEn00; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDKKN012552
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 04:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	76Uf+fwA3Xpg7xvSPdyXGE020wdT1FMcByxhgc0urqI=; b=kMdmEn00yS6M83CC
	4k6Kg8VTjQHYM0O3XuRJPOO1RMFCDqxguOz7bNKnmjiD7/mb79wWj4NRk9Mpfx7L
	VAtH1BPjRCgErvv5EkAAYoQbl3OZQz2N0byqnUS1qQOpzEXGqgEfjFFbND/ziTzP
	qDzpqrDf/6yBxFtHiNitsof8mqQXnca7FOw8UuuGyFiDvv3b0cZZj6Q5u9F8x8EZ
	vEb9yt2MmQukxdq2EENiz8D0wBB+cRSdwTMpT+KVdv5Qp/kTSlKKflh8Si+zvkq7
	4JduH/WlJ3tPVPdescQriRWUXs4e0Y/MYDUK3/i2cjkqYwjxYoK4SIKT6R3/OJV+
	PgyVGQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5f4hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 04:29:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-277f0ea6fc6so191370515ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 21:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760416147; x=1761020947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=76Uf+fwA3Xpg7xvSPdyXGE020wdT1FMcByxhgc0urqI=;
        b=eb3RxmBxfaeUI5IY0goY9zbfvKQxwAWTq2Ad7/D07jSEE7g+OgUHsREb5sdXWnQJ6m
         8cpnBW80et5AbTbvemGaLj1B+xp36wzcRlF2Y434Djvh3hYrMmNLbZlfXmBLO0NUOm9e
         FfAf+2RDJvarnm00En/PEB9hhM0bYr3WTkcYLSI7E+y2X2xEjLLBGWO4/z1WXDjHJLro
         KXgv3sD0kUyv8WzZK8hYNEha/zCToj7wBx3XOjAyOsg1QpehDGY8osVdJoizX0CA7oIO
         UfzuiHPEAq/upSp2Qe9dMQdxf1GQ+jxHA+yCA8y4qNqv++xgmVWGcEIoBIFFukodc8/j
         /riw==
X-Gm-Message-State: AOJu0YzIK5lNm5MIbEaTU48mM7k2sjxwyjOnh27XKp8SRqn/5S9C78Ym
	zpVxFQ5cUBdymaCkiTM+94EnaB1sYKGNfb6TC6OK0Nh52MUJAso8zb+6u1cVBN17ecWEi7g2X3k
	Adt2dDRLZQZQJzhl7AzCP/4ByGs8IxDwOxPJX/ggnIuDmFEHWkp/3kcV+rdCIhZr50jjB
X-Gm-Gg: ASbGncu2lNDFItSwyfrUqsOREYXrDl9QXrFwCr2EcWvqFqV/eJIDLUT0oa8yuFzlDGY
	g2EQ9lSyil2zzLUSEiD82j9CDZZ/qXbdp+LAlyNKZN6iSGtLPcZnSa0mNPWYKffw0YL5tLgZfh3
	5erOCoal/cqCNSwUjFZSRo9sFcD6GM/fyH1twjSa/pdji7evB0t5jqBGzELVlhBg0dwIJhsbPt7
	5/+up+EW64/SZczbLc029R1f+oldpL/NPUwg27kYUezhswcNwtpOX8UInjDct48AE0faXl8Swsw
	Q2hS8JWCbsks1UYCKWZnsMHqm5icti+uUw15nbe+PHI9x4Tzic4WUDqbE70pecat/p7IK1xojzV
	5hvseXeFB7TsHN6dCwt92iu76CzXZoZS+Y08=
X-Received: by 2002:a17:903:2f0e:b0:272:a900:c42b with SMTP id d9443c01a7336-290273ef03dmr293435105ad.31.1760416147273;
        Mon, 13 Oct 2025 21:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo56hdv0/dwNtL5Wxo+sarDBi14f7clvza/iuR1VsNREYq6JiByn196MwLZ/ftVk8FAoGsTQ==
X-Received: by 2002:a17:903:2f0e:b0:272:a900:c42b with SMTP id d9443c01a7336-290273ef03dmr293434895ad.31.1760416146825;
        Mon, 13 Oct 2025 21:29:06 -0700 (PDT)
Received: from [10.133.33.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f56c04sm149462735ad.110.2025.10.13.21.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 21:29:06 -0700 (PDT)
Message-ID: <e9813a47-c40b-475a-8faf-de0811c9066e@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 12:28:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] dt-bindings: remoteproc: qcom,pas: Document pas for
 Kaanapali SoCCP
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-4-611bf7be8329@oss.qualcomm.com>
 <a8796335-bec3-4c1f-afea-b5b7909d8ba3@kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <a8796335-bec3-4c1f-afea-b5b7909d8ba3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6kPRZ1e5fNpbuAsDPzfXmIC9TCA9f1W6
X-Proofpoint-ORIG-GUID: 6kPRZ1e5fNpbuAsDPzfXmIC9TCA9f1W6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX2reLcnPEZ0D/
 dSbhllCBTKDjmp3eqJUvRrbft78eqaXBMX9NZcMc/ANlRKklW30++1MdZIWY8sSTcQagSQt9iv1
 1d9nFzd0qNq7H8qoKZQ+fmElKhcuUU5k6GbtPW6Ic+o6E5iDNHEaAEKVmGITwTux0hh3pTAGvKg
 gTqyQir6wUD3Hxo+rY34ga6OdZGlqlRCVrK7l7O6FZEcm8P1814mIl9sXNHgTPflM6tGSBIO+vy
 bcJ9ZcdrJXOKRK1+Y/ENSZbkDownx/uT3KtJhLOpFyhk+HLIlFlYEZu189vwWdHbaLNKHGOfXem
 eFTXKmgvy9364pswTzJhtIJb+gE7OJrwtbtc4MCXlAQ+lNQI/SUL9IYlwWFBPDH/TCBBmgyU+xA
 L8E8tgrxRDGWXec/cXPEyhhg3m2KlQ==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68edd194 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yaF9TFSo-8KvDqLiQccA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020



On 10/9/2025 6:27 PM, Krzysztof Kozlowski wrote:
> On 25/09/2025 08:37, Jingyi Wang wrote:
>> +
>> +  glink-edge:
>> +    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>> +    unevaluatedProperties: false
>> +    description: |
> 
> Drop |
> 
> 

Will fix

>> +      Qualcomm G-Link subnode which represents communication edge, channels
>> +      and devices related to the Remoteproc.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - memory-region
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - qcom,smem-states
>> +  - qcom,smem-state-names
>> +
>> +unevaluatedProperties: false
> 
> That's wrong in this context. But if you add missing (and corrected
> pas-common) then it would make sense.
> 

Sorry I didn't get this point, could you make it more clear?

The property for Kaanapali SoCCP doesn't follow qcom,pas-common.yaml
(the interrupts are different) so it was not included here, like
"qcom,qcs404-cdsp-pil.yaml"

So I think just adding the missing "power-domains","power-domain-names"
under "required" will be okay?

Thanks,
Jingyi

> 
> Best regards,
> Krzysztof



