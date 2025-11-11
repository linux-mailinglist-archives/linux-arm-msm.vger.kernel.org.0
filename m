Return-Path: <linux-arm-msm+bounces-81310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9C5C4F13A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 17:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C3D13AF67F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 16:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BB732470A;
	Tue, 11 Nov 2025 16:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nz0r5FKd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="idm+kNBR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7393730C6
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 16:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762879134; cv=none; b=IcuL6R0WRDOhGn+lJG88p0SjVSTrUdPL4TdILp1NYpFJidUTALJ1antdJ7ta7rAhUESuDm/ciiBkWUEC6JjWWgstaYWhvbEViBt6iht8K+k32buLufTAoi90PiQmb7KJPma2RxRoSHduxTq2w8LwJAVXfnfio/VOlgxXlebgPCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762879134; c=relaxed/simple;
	bh=+qdYz/XtetTGoPCv5t4KqvwAvT/1TeJAZ8qatw1pxx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MlxZrSImUtcwtWlgUkSgVDhWwJxYuFKTixGU2YB922grgLKsa4K1JiaAjXaizza1hBFuQrRuqnjIaKcD4I9C98HTWMl+ipXpbBmZWY4r4c4nGQrNBaY68SFPsWcHlhIT2ZI6iEW8GfzF52AHICBRJlXHv9Br384yfALWc+h3R3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nz0r5FKd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=idm+kNBR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBG9762046613
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 16:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Ajgd11uLpejky69OUGyHjuLvddPjy8yyOgWz4cnbxs=; b=Nz0r5FKdqv6gySTY
	4Zi42jhW3/PBijsVKf85AP9ZUQ/gS1aJWsd7xyZC2KAONv0Aob8WQfatK9f55I/d
	02qNtmMkyNTY4LHT7PCkgvGNbiWj3LZ0ekPYmp7cdkDhgUUFacbz+m4Akynv8UxT
	KukjJKuuNg9ESpp6QNV97KRpnEQEQKXrFF+YtZv0DBKWXAJtgLmTxLiaXozLq9g8
	wEFhcPh/qVfwpEQcFPPjPsyTd510vHndkCAWyqv9F5zqgEILop85mQqirtlN/dLT
	kMCW+iaFXvzvsSakxCF7ou++xau0iubXxd/yixaQHWxZP5P/qzIi6D7mJ8C+9HN7
	7CIQHg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac11x1j8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 16:38:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2982b47ce35so23919955ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 08:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762879131; x=1763483931; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Ajgd11uLpejky69OUGyHjuLvddPjy8yyOgWz4cnbxs=;
        b=idm+kNBR+DtbcYSf8gImStGyuvq9IsTazIxkvGOaBEOZSQQES/l4uUAd/fbCeM5SF8
         Nv900cZ2Mjnx7Nwqm1yp/MdRlB4EmOLT5LgUkHtDADxedPDFxKbmq6wog2i2nteAYgvL
         jYod/4NrfnbFATgzplwn7h4ENpPbCglBH1sEWZy8caTZMBv31ii5M8cjjgy+wMs/qhaD
         MueI/oUeNnYJrvoWj6wqdX2VNIHA1ID1YtHasMKLSDB3wiwA/C+4QZiQ7PF34okyMUKa
         0csVuiAqXOqYmF22c4jzsA3dcVdqqtKtUMRBSs0Kk4RfC53Ku8bC8Z5nyHFJSSMwhL8S
         /0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762879131; x=1763483931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Ajgd11uLpejky69OUGyHjuLvddPjy8yyOgWz4cnbxs=;
        b=wv7adix1N2543GtOKJV7zN67H4pAGedXmocmdf8CO1rd/TU9miBzqYhrMmEA5wt3P2
         /097+pAqHEEERvVoDi+uUhRHWhNVcglFW29RoECNcBStE6cTcGsVmI9LiAMaly5pyH7X
         NjsjoMxLYHRrjeLMyar7OQHM/z1E1u6ljgEAWt5fPSJC/dZLyNyMgx0lrxobDfLEF8O4
         7DEAjwnbu6PBX5II6mxB+4/Do6LEpgnjPvOTy9S0XwNjgvHxyKilPby92K6Hc0tc5PB5
         5hZH32p9HQ88iX0uSiB74T10RdnU+nguSPd+4uw6XzM6GsEnN0xobOURTqierY7bxy5h
         ryNg==
X-Forwarded-Encrypted: i=1; AJvYcCWTuRqxvtyRkdCLSFTKFV/jv4PbEjt0M2FXU8TtRTShXmBxQPxE4EfhbPQcEtMElm0ymqTDMUL5gCxLMM0J@vger.kernel.org
X-Gm-Message-State: AOJu0YxIoU5uM3STja/JM73l2Wg9VlV8Vq5UnDDo7ykW8lrNetv8PPsF
	r8ZGg46e0c9Oh70jIQ5z2KhKIbkqWgTQRFZfs9Kz2FqhOX8uYETge7q1O87YRDGBDi4Jn1179X8
	WuL0i50dVU3Zh2wFoHwbSbRLii5vat1mqWr8zONbisqHVF+D1JGzOCyalG06R3g80wwQw
X-Gm-Gg: ASbGncsIJscvHQULROhOVCAa9GGxR/0GB8auuLOyi0VpL4SSqwZT9dNB9BltvQepnpQ
	dNvbR2WLvFIk4IG7E+v4yC1DVhPgVmu0L0Owui59P2KNeIlfrjJuQgaPfsTp3ovqw8DlWywcRo+
	m8QhAxQm/JOsl5bLET9qXICFjl3GQDHpcdO73tQTe0fjUfuAQPL6wcEfHw8Lc+0hmiWAddZnpdi
	6WwCJ9rC9mzINwolavIMon1xeAyryunhSjk1B6vJ9SsooMOQt1wcG9Sz0JbDlShUc7rWYxhyYXI
	7fns7ALPJlvQrQ8ZFcdZ2G7QgDfljgNa+G2XCFXrz5BsxMacaABCLMzwqhgtb8EbcezPzyp4rrC
	AExdWiH6ngs7EPlpd2qW9MdLQdzKns7QTqlNxAptfyuY=
X-Received: by 2002:a17:903:2043:b0:267:a1f1:9b23 with SMTP id d9443c01a7336-297e5649e26mr105041905ad.18.1762879131117;
        Tue, 11 Nov 2025 08:38:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOa4m65Vas0Noz7zxrVMreCFdm1Qy7ow+DGUDRlm+VdMEUixyhFABQQOVLZPBXKDBeLaXayw==
X-Received: by 2002:a17:903:2043:b0:267:a1f1:9b23 with SMTP id d9443c01a7336-297e5649e26mr105041165ad.18.1762879129986;
        Tue, 11 Nov 2025 08:38:49 -0800 (PST)
Received: from [192.168.1.6] ([122.164.80.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc866319sm15703627b3a.54.2025.11.11.08.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 08:38:49 -0800 (PST)
Message-ID: <c34f086a-03c1-4bf8-a50a-40057a3b8510@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 22:08:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: qcom: Add qcom,kaanapali-imem
 compatible
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251102-knp-soc-binding-v3-0-11255ec4a535@oss.qualcomm.com>
 <20251102-knp-soc-binding-v3-1-11255ec4a535@oss.qualcomm.com>
 <20251104-glaring-rebel-pillbug-a467ca@kuoka>
 <790ca394-cee2-412b-97d8-c6416b843010@oss.qualcomm.com>
 <b6717831-1840-4b9a-aade-ab2248e3f75d@kernel.org>
 <9ee07db9-508e-4c08-8f79-6ccfd9b646ab@oss.qualcomm.com>
 <6af33c1b-5b95-4efc-b429-5bfb9ee7caeb@kernel.org>
 <8cf870a8-706d-4514-a87a-a69b64521ab5@oss.qualcomm.com>
 <f539b21b-cfe8-4055-9620-4d5d8d108098@kernel.org>
 <9d80b581-5d3f-4b95-91e7-c73c113b0976@oss.qualcomm.com>
 <c2o4iouc6sm7frcq64jmvxopv3eqvrjxievwwhiwqw6ptwfok3@4qmpfy4yij4m>
 <5b1f8204-1f49-4061-aa4e-f6dfe5ae2a0a@oss.qualcomm.com>
 <e9f52ab2-747d-4893-849f-f9fbdc567f63@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <e9f52ab2-747d-4893-849f-f9fbdc567f63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEzNSBTYWx0ZWRfXxxUmQc7mapxi
 HuVG8FNUI93Rmo6kCWEZf/S5+g8uaqVPhlF25ogbLfx0iNN19Vcst+2TQ7TXGCC885c/1T1TAGr
 WVpRv/a77SmBwgsEu3PvcdfrO+fj7b6W3ppAFv1GZ3oaPhDqOCP7Mbi8AUJ5oek7KsI2V/9ZN1J
 EUAY1zpTwEqz7d4YNlH+1vjqWeS6kmEXm6ygECnJtJGaI1A7m8AD4c/koFFgLpnGEel5T/OcdnA
 sjJWSN0qidlq81ZTbJC1j/dSmS2ZL6FdxFqWOtsW3PEAg4kxtgxBLcNiJPsirBCOlBxPScJ9LB6
 ZH+AYmf7/+2LtUUveON9yX3AJjideBH8ir42wNhcGOmG9hZOwXhMQyv6IPq2JlcrmmglQkAkQT6
 fSL+8qod6Sd+SrlqEYiN2zgDz7i0kQ==
X-Proofpoint-ORIG-GUID: qxgNTs_I1Bcr5JLj8-V4DyKud8bYokXE
X-Authority-Analysis: v=2.4 cv=L94QguT8 c=1 sm=1 tr=0 ts=6913669b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=E6K5ax8UiF4naD6iDMgEyA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Sxa319Jca7sL1mhjEgwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: qxgNTs_I1Bcr5JLj8-V4DyKud8bYokXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_03,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110135


On 11/11/2025 5:38 PM, Aiqun(Maria) Yu wrote:
> On 11/11/2025 4:29 PM, Kathiravan Thirumoorthy wrote:
>> On 11/7/2025 1:54 AM, Bjorn Andersson wrote:
>>> On Tue, Nov 04, 2025 at 03:58:27PM +0100, Konrad Dybcio wrote:
>>>> On 11/4/25 3:52 PM, Krzysztof Kozlowski wrote:
>>>>> On 04/11/2025 15:38, Konrad Dybcio wrote:
>>>>>> On 11/4/25 3:37 PM, Krzysztof Kozlowski wrote:
>>>>>>> On 04/11/2025 15:35, Konrad Dybcio wrote:
>>>>>>>> On 11/4/25 3:26 PM, Krzysztof Kozlowski wrote:
>>>>>>>>> This I got, but nothing here explains why you need generic
>>>>>>>>> compatible.
>>>>>>>>> To re-iterate: there was no generic compatible before, now there
>>>>>>>>> is.
>>>>>>>>> Writing bindings and numerous reviews from DT maintainers ask
>>>>>>>>> not to use
>>>>>>>>> generic compatibles.
>>>>>>>> OK so let's not worry about a generic compatible. IMEM exists since
>>>>>>>> MSM8974 and it only had major hw updates with SM8550. They don't
>>>>>>>> impact the software interface though, so qcom,msm8974-imem is OK.
>>>>>>>>
>>>>>>>> There's a separate control/status register address space for each
>>>>>>>> instance of this IP (usually far apart from the actual SRAM pool),
>>>>>>>> which Linux doesn't have to care about.
>>>>>>> Just use qcom,kaanapali-imem - that's the first device here
>>>>>>> without syscons.
>>>>>> So we don't want to move the existing ones over?
>>>>> This was never discussed and this patch did not do it. You cannot move
>>>>> them, that's ABI.
>>>> I see, I implicitly assumed this would be a sweeping change.
>>>>
>>>> So should the Kaanapali submitters simply send a version of this
>>>> patch with:
>>>>
>>>> - oneOf:
>>>>     - const: qcom,kaanapali-imem
>>>>     - items:
>>>>       # existing big list
>>>>
>>>> ?
>>> We have 33 cases of "this is just a generic Qualcomm IMEM block", could
>>> we just make it "qcom,imem" until there's actually a sign that it's not
>>> a platform-independent block?
> If it’s not platform-specific, why not use a common compatible here? I
> mean let's have a common "qcom,imem" start from kaanapali.
>
> What benefits would a platform-specific approach bring in this case? For
> newer platforms, we could simply adopt the common compatible and avoid
> adding a dedicated platform compatible name.
>
> Also, the old bootloader reboot-mode solution that uses the IMEM area as
> a magic syscon is deprecated for newer targets.
>
>>
>> Any conclusion / further feedback on this would be helpful to move
>> things forward. Thanks in advance.
>
> Which platform are you waiting for as a reference? Or are you only
> focused on the current Kaanapali?
> By the way, great to see we share the same goal here.


I'm working on the IPQ SoCs. All of these discussions started from the 
IPQ series[1], followed by Konrad's IPA stuff[2] and now we are in 
Kaanapali.

[1] 
https://lore.kernel.org/linux-arm-msm/20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com/ 


[2] 
https://lore.kernel.org/linux-arm-msm/20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com/

Reaching a conclusion on this topic together will help us move forward 
with the above mentioned series.


>
>>
>>> Regards,
>>> Bjorn
>>>
>>>> I'm not a huge fan of using kaanapali as the fallback-going-forward
>>>> since it's literally the newest platform on the shelves (or perhaps
>>>> not even on the shelves yet..) so it's going to look funny when
>>>> someone comes up with support for another 2013 soc.. but perhaps
>>>> that's just how things are supposed to be
>>>>
>>>> Konrad
>

