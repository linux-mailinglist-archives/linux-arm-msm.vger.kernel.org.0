Return-Path: <linux-arm-msm+bounces-59250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37195AC2958
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 20:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF2FB5411F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 18:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4357A22541F;
	Fri, 23 May 2025 18:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMUOR2y9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A7528EC
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024023; cv=none; b=k9xixmrV0P6AKi9aNGCut/Hw9iOj7vX8qaLdjUWgtQRdB66e5qc90UdQ8KwZHyXYJtR6W/rjgsD177IKzulbJrMHo1L4t0U1NdJIzrnh/43Y7bq/M9nOhybB9cMvLSnwjLiFRUxdGEbMeHuUiLT/ogpR8DFnzP44xdrxBkWHmN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024023; c=relaxed/simple;
	bh=4Paog+YoKvP2+bQwGVWBOgtwOdz6A7hOVN1mgB+zfiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mmCpEtFg36hJbeM4qiRMtMs7uGF1rchINuQcKnxeJq3x2rShC8ogVd7p1ZWoX51SsRnTxb/FY7/exsh/CTqQK3v0xysg7W5kJoPXAKRBsEh8snmuUbzN5hUL0wQDDmLzhLU4J4jOQkszxVusAMpYSaaH0Pe1aY0WF55RF884KlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMUOR2y9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NFK6w9017280
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GxYGuWGE7teroSpXw9B8EXIpMo9GtkoYzPs+37tNI9I=; b=IMUOR2y9gMKhgXS6
	SlruDTVk9FfgokmM6AAGRhYO7FkmpGIDOKOiJCs1/cfuFrQ7b946pDPP1GbpxTzO
	nLA85WYwUlwJwWBEbHtqG5Lzb9ifzAb//7jYmi7nA60HXuUqUytc7BhcIs+/K8Xl
	a4VLjimqZiwNFY+okLh4oStNNtbzAkzRwfJjN8hiKH9F+iyQfQnMQP6AchO8qls6
	mUQQxlDc7iGaGEW+YGkz1WMW7FAiqagH1Or0WXhHkYeIq2k1P73o1qDmDmMpX6lW
	HMKT8Z4PX4mv77UMXNKMssUUkNEihsvrs1Ok1khkPX9ujeQMk53pZc9aCmDpobva
	T4P8Ng==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfbaqb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:13:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f2c8929757so204976d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 11:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748024019; x=1748628819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxYGuWGE7teroSpXw9B8EXIpMo9GtkoYzPs+37tNI9I=;
        b=RNfaKDjX13STmIu2CsJuEgjAWS23U15kgQgIjkKfEghcJNg0JfxJnpZLHJQBITvCbk
         Ocmr4VjcgrmvrAtUnYiexWVqOOSxSaAp+MCgj0aQ6eQZwY3mYfC3CT1W44uSmSp337er
         +p3XPcidecNP7Vh21KPVh6BatSVbTunW4JTycB2gMQ5N3xdf/CVdBLJQ04qa/Nrs3TT6
         biw5JfIza61uhR8yn1/QTy147Yy5XI5npxjR/k2k/Eih1Ng+KEDvsootC2JPWxeT61yX
         eVG7jOY15UTLi7+1ek0cSXPD2gvG7V++gt+SEg1q/huE6xYU1z6newr0xIf7QrIRcz6R
         HIow==
X-Forwarded-Encrypted: i=1; AJvYcCV/WyGIunaWpT6vETTCfGNW3S8qKkoNwW8roUdoZl+Yasj6g2Lt56gifaA2WrAQFwHFqjJRIx/n+DEPoOA3@vger.kernel.org
X-Gm-Message-State: AOJu0YwGI9nsyEzRh+BsEnUxLLteGbMFwCD6Sj79q9EtOt4eUbFMh1PG
	WrePAkNaGI7yYJeXn6S8atpaXvOFRIPnI6LWZyr8YPGafU4OCwdXvjisKRRvf2CLUDbT6t/wKuP
	bknJbrTnUKcCbZ7rERYRo1MALi7uHA0sjVgDf3Qc3xcKjN7OcD154cEnHIkWZh6JDV3/4
X-Gm-Gg: ASbGncvTeI9vJZx1O74p9dKdABZ7LtOfCHr4V1+czFddI+JMF0IHjAlrf3H5aEANE2m
	Lko1kKTcilGWQEm+qwAKj2pdhHLxaZ+9iyNFp/m8vQzvcb3g9sqhuhK/vnMczTiW0En1f7ccrx/
	SHSuVWbiJ2BWlqlM4Df0mbg0b3XfZVwpqYqhS414gse2ycT2YBGAl6n498XKTzo/RrHTcmU8VlU
	hUwCo7Rn36JYu3OvnuFlJB7jORreWGnl6Th6gdexYHssryFg03Hfct+QtAotXWPbVzNZOK1lzjE
	9vwQhxw/DzS3dR5Qd04mdYqoqMURy358EfatbWefR9N9MpK6n6gwttxv8jc1OCwyKQ==
X-Received: by 2002:a05:6214:5192:b0:6f8:e1d8:fa9c with SMTP id 6a1803df08f44-6fa9d2a6a1amr2331676d6.9.1748024019486;
        Fri, 23 May 2025 11:13:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv7GPWwXXj2LlrS9GHOVViHjRzQLINpDyj6uWz8zl7Oz/ZeHI6Gl4oFnbSRXMtGdcwoHLU9g==
X-Received: by 2002:a05:6214:5192:b0:6f8:e1d8:fa9c with SMTP id 6a1803df08f44-6fa9d2a6a1amr2331556d6.9.1748024019160;
        Fri, 23 May 2025 11:13:39 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602c2080534sm391575a12.63.2025.05.23.11.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 11:13:38 -0700 (PDT)
Message-ID: <81093c19-a6f7-4653-9688-ca891fd2548b@oss.qualcomm.com>
Date: Fri, 23 May 2025 20:13:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: sram: qcom,imem: Allow modem-tables
To: Alex Elder <elder@ieee.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
 <20250523-topic-ipa_imem-v1-1-b5d536291c7f@oss.qualcomm.com>
 <7707b574-6fcf-487d-909a-d24874f9d686@ieee.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7707b574-6fcf-487d-909a-d24874f9d686@ieee.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: D8NfEBK4DsYQsd9FEHxik__pmy_rdx__
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2NSBTYWx0ZWRfXwgfZW45d12ce
 5JyHOEkKmi505vuvBcjzESBL6X58KAvAJnl9KoXkOguPeyTAhhOtuZByt/PcyJJ0GBnw88y3Uk2
 on59Tx2moP+tPjrVsJzcWbxVfxp+gKhfzs+5799ycXS14de9OWk/WBiQ7OzWMQbZsWlgIooc5s1
 9AtIW2ZcF5+aULboyE1i5Fu96dkINiKGmhkbWQ83pge+E5vjYsLRZS/OO8JdUyY2AxlkXgrbRIx
 JXNDxcamL53qJy/UC2GrMxwBkZWRQV6MPoYvHpLAYybEm0QBXI2gh0z5R6cOpf4udI1PKVfzxX2
 1FhPCKiAuqUmII9fykgdB97vUYS/q+voeWL3CKPX6kJyoqAIsEybK9xmzyB16Z9APZQDWNcmg7X
 rkDsvdtGdYJT1KM7y0x0r2yYt3sHQdf/CTQk+/yJdfw33puO3O8kyfeti2Zkp7cPkCyhES8H
X-Proofpoint-GUID: D8NfEBK4DsYQsd9FEHxik__pmy_rdx__
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=6830bad4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JUd7tuONK7MPmK3lb4kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=937 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230165

On 5/23/25 7:59 PM, Alex Elder wrote:
> On 5/22/25 6:08 PM, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The IP Accelerator hardware/firmware owns a sizeable region within the
>> IMEM, ominously named 'modem-tables', presumably having to do with some
>> internal IPA-modem specifics.
>>
>> It's not actually accessed by the OS, although we have to IOMMU-map it
>> with the IPA device, so that presumably the firmware can act upon it.
>>
>> Allow it as a subnode of IMEM.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> So this will just show up as a subnode of an sram@... node,
> the way "qcom,pil-reloc-info" does.  This is great.
> 
> Is it called "modem-tables" in internal documentation?  Or
> did you choose this ominous name?

Downstream. It's hard to find accurate information on this.

Konrad

