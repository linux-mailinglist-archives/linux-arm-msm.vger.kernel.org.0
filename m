Return-Path: <linux-arm-msm+bounces-84586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FF5CAA9BF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 17:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E94B5303A8D1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 16:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169DC2FFDD9;
	Sat,  6 Dec 2025 16:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zesh350t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PoPWYrou"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22D92FD69F
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 16:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765037450; cv=none; b=jG0SuGUs7SAwRKJivWHJNUZlj8J3VZiRlA7DaOdVYUpTJufXbJCk8C3MEM8Oz1OUbYc5rfPv2+M5nEigRYY0EAp5vcJ5MEH3+yGBbWCRg0zoBIi3SSbyD0DVDt9nOoPnxDCb5kisEUrzO04u40N6/0bRNEr/nNv8M+9uCRvTxGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765037450; c=relaxed/simple;
	bh=0ZE8Jfb1gslOWBLsAsVh3legGLIoOmDzXgppKZKZCjE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=supblTschDfw0vXD9Pp5NLKSdvh7EEn4f/sM3eYlmi+gWstzHg1jWzXv/18NUS0qwfEsajz/xCO7fNzmUxkwRbqcf4vSrGw7sG7huj9cZ4AGnbpHYbNrsyZKey0T5+SkbTFV9ThUwWom1s13XW1W3d1eSvodJBrRsHmBGOqCJ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zesh350t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PoPWYrou; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B65VmhG2258791
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 16:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o6sTSmYnZ12jK2IzQcfjxY9zJ9YOdaK/5r5QyG9+/88=; b=Zesh350tHTRUSRQx
	C7DwTh+Da6FpRwodhJVF/lTnPHmAqnIVCy2RRIpf33/3aDE/0UPn728b2aHFblJk
	GsIVuqTZTdSOeTR7554aS32s+bSU1or0zTEhZF5c1TUEV5eHTxIqJbEilKK2DJrE
	qCPvbOjHTn9vVaAIpD+0OjW/pvtFQl5S5jMtoqXF0iWi3e1igpScxh9wAgr3o2sI
	BRW06oQocrk2Ew9XtKjChRy8h3sWS1dognp69PuIG1qEQKOS7Rs493WRNBGSQb13
	kd0LFGBE6q+b0bym7alAIXMuPZC41RLv7srnMrxdhvbwM4Jyp9EFCQ69Ed0gx5wE
	ShUrEg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ava6f97uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 16:10:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b609c0f6522so5403033a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 08:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765037447; x=1765642247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o6sTSmYnZ12jK2IzQcfjxY9zJ9YOdaK/5r5QyG9+/88=;
        b=PoPWYroue+dF1cQszD0FoQ5Iz8AKLIqCUXci8TVpsp2z/7NI/FWe/Wr6OY8KMuxhJg
         6vtkS7qQEM8U/odyXQU3uTExDCTSIVQAOjs12xRQV/7C5dstJI2QCapgFvpXf+BVhaCi
         hcB2mi0+2YB2wGbhzcQ0jBWE1/EEk8pLnBcgK1vX3gcCMWIN13pnIE3kp+yginxzE+rl
         FawWSNf5uh/lVZzdYUf2+5AjPiBz9S8zF6RqP0OlrsDueXKxcXTpCIoiR3QoIq5BXpMh
         s4WlaPcrynrsNy4dkVXHjauSytaxVpnCqGGbTsndP6soVU+I4wjZ/cb0E/D5lOOl7XxX
         sU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765037447; x=1765642247;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6sTSmYnZ12jK2IzQcfjxY9zJ9YOdaK/5r5QyG9+/88=;
        b=C0XeYvu3mQ/80udx3BSpRz+3Ye6RJeNx39BmNv+ZHFmUCwR7QqVFMRLPJqm4Oa70BK
         y7zLdUjZ4DGsfODfHEY1cht3SOQqYR2kz4cfL2kuEXaCAC5jD2FM1DAOmVWlHSviYD2u
         unjYF0T6U2Gi8yVuslrVSplpAT64igOpSJEvwGkQEUSES2pcxLSzQePCPbnO95pGKkUp
         bAYl35BDY77SLmNfIoJwWbotOP13nXHy4WKdcGw3OUI/AL8Ixc1JHAIae/c6gW9oWIJi
         OgIiMFbnecRw0343qpNeYeEbPMt29ZFsQIPG/7UgL/KloUEr2ArmBrkq6jECKr/8hphe
         6F5w==
X-Forwarded-Encrypted: i=1; AJvYcCXl0/Kg0P8L5LSgNYLqJqGXZkxuSXR3CkPQoMO/w0eHBJogkyqfOOn1rFv+6olXcQg8zwA0b5y++MgWvUOB@vger.kernel.org
X-Gm-Message-State: AOJu0YxNTREE5X/vjCFu7rH/LX0jFG/kgxDTX+MYacl7m+uVr25tTdLS
	bfSfvDaEJQaxC+G3e1xPGQQwLQPA9sQglJ77SH2ugLoYzOP9lOVPhhtNq4gEC9E9/0oiGWBnuDR
	3/YxYrEAkeGEEgTDrwKGoaMF9J1kw6/YB63McAtxVwRwgKiDxuBNXv3BVFBfz7L37qfGQ
X-Gm-Gg: ASbGncs2rQJcXLQTDyrhgVqB6GZPlc8vbJjwMqKMdmcsClGdG2Euq0i0H5P/toP2NGF
	TVA7CYQeqqUl49aBERw39xc72A1DYQQxakyB9ROlpJCu0p3HSRTZPOsxOlefpJb7c72U44Nvhk9
	eGeaKTlsYCVNaq5r7L61GpbgR+4h7QKtrMo50UxuCYXBgLYnYsIFwZeZ8Ii9IGkRGs+/czs1ShT
	RtSOUykIzn2M3u2HfH6ByMtPLc50LxskPOOOIcNqXu7UPVrLnCVrVzHH/qSmbotJJVcJA/ZwEqS
	ZHIBUNRBVOd4Yalj44DVMnhYGJcHxtefbUzjbGzUrvhCrFf3sgCbGv6+fW3HoW7ITp4BuzdqwC6
	sTRoXojwpXknk7OUi7Sl184wUiqKmh1cFSO05qF+NiHGVHQ==
X-Received: by 2002:a05:7300:b0a8:b0:2a9:97bd:a844 with SMTP id 5a478bee46e88-2abc71cfb2bmr1896757eec.21.1765037446813;
        Sat, 06 Dec 2025 08:10:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBUiVy9ceq0w+zFGZdt77CsGP9QUEEwN6v+h/m5a6bGx9ZanfK8WOLASaDYz7J6zGfR424/A==
X-Received: by 2002:a05:7300:b0a8:b0:2a9:97bd:a844 with SMTP id 5a478bee46e88-2abc71cfb2bmr1896723eec.21.1765037446284;
        Sat, 06 Dec 2025 08:10:46 -0800 (PST)
Received: from [192.168.1.3] ([122.177.243.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm35322770eec.1.2025.12.06.08.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 08:10:45 -0800 (PST)
Message-ID: <377a0412-e49d-435d-8136-ebcd9fac9e7a@oss.qualcomm.com>
Date: Sat, 6 Dec 2025 21:40:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 squelch param update
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251204044644.3072086-1-krishna.kurapati@oss.qualcomm.com>
 <20251204044644.3072086-2-krishna.kurapati@oss.qualcomm.com>
 <fxf66ulont7wnmozqww2cklpp3djkzsgvc3znew4m7t47qlye7@32hxp3yze7h5>
 <20251206-efficient-tireless-dragonfly-c5d2ff@quoll>
Content-Language: en-US
In-Reply-To: <20251206-efficient-tireless-dragonfly-c5d2ff@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XYt7VWzUYyXdOPizcjueTsQAf8_q-ULD
X-Authority-Analysis: v=2.4 cv=NYXrFmD4 c=1 sm=1 tr=0 ts=69345587 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=mGeNq4HQZpM0LKVKY7z1pw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MsxH4LtXGSFWTCPOqMgA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: XYt7VWzUYyXdOPizcjueTsQAf8_q-ULD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDEzMiBTYWx0ZWRfX67PGQaFKkxuy
 0TjlVO0+0ctMC46c9YrkJw4J0xmbdHi30PpzEV6e8+Wm8Do5DB8FKPlYi2kbfEFzK7sg+39ey9u
 ZSV7TBYzYCBl8Cr3f4nY5I3ShBcIKMTEI/C7lbnRc8NuLaDhqZWy4p3FRH6ODRckJbWzxrGtU+v
 CHRSW4HsG2Sjta6rjMXhgcEDNEi9PMiYGOvoY7+bJ1IrIauWxcHdHtW+a+CgpDLbIvrh/+2uonp
 0RpnvOX/1NSApZb+1Ohtb+XBQ5+1u6W2kpS/gsUHxzwBigzQdj0lsE/RTCKkKwGQkCaEf5wpl7f
 2TTi6au6MvDbUsB1rTxFwVP8v8nr+OzYzouuGpNAcF8tX/u4dBVbF6x9n0NFf6WkLylcgAs9IcG
 7Jn60maPwVHP2ugIzonKJNkSfrItfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060132



On 12/6/2025 4:32 PM, Krzysztof Kozlowski wrote:
> On Fri, Dec 05, 2025 at 10:55:36PM +0200, Dmitry Baryshkov wrote:
>> On Thu, Dec 04, 2025 at 10:16:42AM +0530, Krishna Kurapati wrote:
>>> Add squelch detect parameter update for synopsys eusb2 repeater.
>>>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
>>> index 5bf0d6c9c025..f2afcf0e986a 100644
>>> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
>>> @@ -59,6 +59,14 @@ properties:
>>>       minimum: 0
>>>       maximum: 7
>>>   
>>> +  qcom,squelch-detector-bp:
>>
>> -uV? -mV?
> 
> If thi sis adjustment in ratio, then bp is correct. Some sort of
> explanation in commit msg would be nice, but I don't want to stall the
> patchset for that.
> 
> Assuming this is indeed ratio without actual SI units:
> 

Yes, this register values indicates % change in squelch limit. Hence I 
used basis points instead of uV or mV. Will update commit text accordingly.

Regards,
Krishna,

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 


