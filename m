Return-Path: <linux-arm-msm+bounces-67785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 031FBB1B3D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 14:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2EB9621A7E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 12:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5AD9238177;
	Tue,  5 Aug 2025 12:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LrNUMBlq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC7823C50F
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754398367; cv=none; b=sAR8aOBeXfs3bi3KVcIvlJwOyc07x4zAq1DfZM+kgyWeXZbQFghAVB/7XJvaWA226KSvb33XMItPpvByAAKLjvreral0XbFo4+LEtWQla8V1F/8jBrvSGM9YZ5iczyTkV8lzRDyXknCqfi7dBxXoJQkz2Q07dlSPsriqQ70TFYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754398367; c=relaxed/simple;
	bh=q/Pf+LImqDPEmSBNRozyIBQYPrPbtMCscyQ+teS4krA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iau2LAw7mnHVU8wwdEyKXi054aF+SZPzbTo08Iok2M7LQs57pkW0tvMgSmEMhKM1eVyqOB7PCv3PyjRTbwuNKuTKhA1QXoqXtlOcjna/b1imVslncEFZhfJcAXERJMMCRokZYicOAgvdTziY8ie51MjftFpqhrYZr3sppM/9IJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LrNUMBlq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575AcwQc019487
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 12:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5b/KVm/YPT8bnDkJ9iHVahvY3D/dDdc9qRh6qym7lX8=; b=LrNUMBlqeOSxq0ZF
	WzsZwhMS0pS4eshYXzoVJkKV/KNNkBj2IPuMownBSBtPg/1UOJKNAbHceHoGRwVn
	HAz5oeNRubyeAWDK28t1QKv1jRZnnb8U7b/3On5tclzkfxvA3SXL3YsBIm3IOFPq
	wE1nHp3BIVKW0puMdwWLGRu05KFZfJEqpwkJ4uxzlbhhQwgps0dn9U0eXYLsOFhl
	9fBmfK1ctLvEHXTbTyz6T28Wldr0NzoVm5UYP/o1maA43iGNRD7r/F2JSDce3MmK
	EEi1e08GQOa4cY3J7EAdhD9Izth2nW8tMv9OAbI3Tw6b/Z7yS14b6zCg6JpkAvH+
	Ljxe/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ak5a57jf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 12:52:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e802ee0d2aso12742385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 05:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754398364; x=1755003164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5b/KVm/YPT8bnDkJ9iHVahvY3D/dDdc9qRh6qym7lX8=;
        b=eteDqNyK9j/mAIeETJTaaN//pPoXbg1lur/99kNjrRcCOuTcRVe510yBG4J/oMR0HZ
         3nHy4moD1Zp55d1rfxv7WEXrFCSs0Vy6riRYgbBsGT9TLN69M8MnHApb8B6PaedrXriR
         h/05ioBIBl1bHDoixdtJXcpOjHBZfWDfazvA2C3QjlKng9d9gH0xiT2UBqwaBwipy45Q
         2dBH6E/PsWs6ltljvq6Bh2rskkt8zIihunJUpkYW8l0Atg1hNDr/4rviHBH1bh5sYIx+
         yHJXT2OgZ4M7OtSfCOE21pZ8RrXyq4UQ4rTUC+ExHQZ1FEI+RE6ZxM2mCtehZKwC/qYJ
         KJ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjQnacHLV6kelRjrC6Z85b394Osn3C1yvzbIeLhEfNa7lJDg9donqeKVKU36FDhmFnd0ItV6bYqPNvpmGr@vger.kernel.org
X-Gm-Message-State: AOJu0YxoOapBexfhlPbKJ8rti81MxkluxL3KKq+kYu5tNxsDvS/9DZwW
	qaCiEYeRqbw6P8R9SsjALALO8QdrqGkgHEsuB6B1wyWVfrZbBv8n1MtQIu6FNIQjR4Z+ut9WVXq
	4oRn1KlEIRu9GuWUXAh+R+ZYYKZllSLOVtxLfPAqeZNbcHkkMLKvZxq9l6XTh3icXr/Rs
X-Gm-Gg: ASbGnctkjUA8f+6h1AzrDOn0P9eQ/HtxcQU5fQ2lNjFIPqdI4++kKYCoILX/837QJJX
	A7xPRxVuz+xeoQRbOAP2SOUO2AbKwTQUGzSPHDn/jmmCTj7v9D1pJUTEyTdqJ3tWE29xbYLKQo1
	lslpjT3k4x27v/elNoroezfeXzn6gphrYQ+ALgUhVuXulurGNokr/Hjy8d3U+Oi4EtwDGGYlcu7
	jFkZ1+NRRYeTKcK8A5NFjnwVYQ8QaeGoNj4QtPzmqKEnykQxCNprw2NW8mYXCFytMx7nD/RZmon
	9I8w9YNKTxhfCbC3Ia/InRv4JsQl2/PaOekROAQkCzC60v1cm7lELai71Lwia1MALZNEMbdP6xu
	xRMaYXDTjLstz7fUUvw==
X-Received: by 2002:a05:620a:3192:b0:7e1:79eb:18a3 with SMTP id af79cd13be357-7e696361ef6mr813929785a.10.1754398363907;
        Tue, 05 Aug 2025 05:52:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuaX+C0DFmFpdGCDTY1iuKXIqocyyPPc/GJdm4mkE4siPVWTnaA7sBVdxF+3YWQveqC0ePBA==
X-Received: by 2002:a05:620a:3192:b0:7e1:79eb:18a3 with SMTP id af79cd13be357-7e696361ef6mr813927885a.10.1754398363491;
        Tue, 05 Aug 2025 05:52:43 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0763d8sm914523366b.2.2025.08.05.05.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 05:52:42 -0700 (PDT)
Message-ID: <b0e13823-a654-4a1d-88af-0f485bc79fe6@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 14:52:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] arm64: dts: qcom: Add Monaco evaluation kit
 initial board support
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rakesh Kota <quic_kotarake@quicinc.com>,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
References: <20250801163607.1464037-1-umang.chheda@oss.qualcomm.com>
 <20250801163607.1464037-3-umang.chheda@oss.qualcomm.com>
 <4rxy4iuqy3dstfuv744gw327gf5n5g6notjpmkspjme2w4sd3j@5sbqfoumb5y7>
 <588f29a8-827f-412e-b525-a1bd3f6c2d87@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <588f29a8-827f-412e-b525-a1bd3f6c2d87@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA5MyBTYWx0ZWRfXzHX+5LS4n/I5
 mZ7ehdElwp9zmPyIJCuI8ttN/vhAwKpIaJe2D90kEy7LKI1wmZchUrtHocff0H3Y/CO2oCxRrp+
 u0WmdAwbACgqFwPmOg2HyxWZ/SMAn/yrez3fqJv/kKl+tKCGGhcYLkPBHf+F3d9nFNs2FfR9ve+
 N4FrW1oZH8WOAU8//vcw9gA8U2wgW+lG/N+7huW7gt+PiauNMfZoj0bmfFclQeEwQTBwSxp4xzK
 EB7giKGwKufpLl8Kh9qTjR2IDNqnLh5O+tcVcfFO0bDk5AtiTiZSEgnKDl9auU/2165XaCShq6l
 hcaVHpdZWurgkA5OuOvLomeDEu4wQz54COdizilheD+onEiVlDCObuhK1rMuiozscaoW8ely1Tj
 8HffjDgqqSajN/OSdhfTV9S0KQcSvlMceNqMbWe0XeH0s3pIB6VYEBdVWPWKq+eWV4S6kYYn
X-Proofpoint-GUID: 0rLaUOG4C7Ue1u1Or2gnR1VzByhsjuiA
X-Authority-Analysis: v=2.4 cv=LP1mQIW9 c=1 sm=1 tr=0 ts=6891fe9c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KvKYKMb6mzjDDU26cbsA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 0rLaUOG4C7Ue1u1Or2gnR1VzByhsjuiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050093

On 8/4/25 8:18 PM, Umang Chheda wrote:
> Hi Dmitry,
> 
> On 8/1/2025 10:44 PM, Dmitry Baryshkov wrote:
>> On Fri, Aug 01, 2025 at 10:06:07PM +0530, Umang Chheda wrote:
>>> Add initial device tree support for Monaco EVK board, based on
>>> Qualcomm's QCS8300 SoC.
>>>
>>> Implement basic features like uart/ufs to enable 'boot to shell'.
>>
>> "boot to shell" only makes sense if the platform is new and not all
>> devices are enabled in the Linux kernel. Granted by the current level of
>> the platform support, DT files for the EVK should have much more
>> features. Please submit a full DT at once.
>>
> Currently upstream aligned changes for other peripherals are not yet ready
> for this platform, hence posted base DT support, will subsequently post other patches
> when they are ready.

Dmitry refers to non-groundbreaking features, such as USB or SD Card
which are a 5 minute job to enable (since the SoC bits are in place),
mostly just requiring confirming with schematics that regulator
assignment hasn't changed versus other reference boards..

Please keep in mind that the more fragmented your changes are, the
longer it will take for them to be accepted upstream, as separate
patches carry a lot of overhead compared to what they offer.

Konrad

