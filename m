Return-Path: <linux-arm-msm+bounces-66666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEADB11AED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 11:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C861A17CAC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 09:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1039F2D3734;
	Fri, 25 Jul 2025 09:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fgWkHBuN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9034F2D3726
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753436207; cv=none; b=dGXn802snpTgrnxU5trP0r9Zgzwx9fJdd4n5Q2DCdxoljWFbhkXkg4fXNXnFMOL2JCRllmlm9BoRMPLJzvuycrb39V3w4UQUkoy6xDg8DmhvFsn9/pW4LMcCRjE22yBOZvnCq6mBte+ERZKyuvJdDpgDrVH6o89kHfCGT8qv4e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753436207; c=relaxed/simple;
	bh=khoTYrfoYnB9YM56nKHfbl2OMpC++rooCel5p6UgM4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OaKtznAnb3cbowZ251B1pQBTBUnM+lb7e9ZsFHoxk9ZfKr4hXAdlrOcSxVk7bbT7e4Ctw3TANi76AYJmqN0eGx107RgY4wJ4JqgVxvrJvEISBT1G3OP7hH/Y1P0Gdrm9TB6ku83fkafeVPSHXJQV9DsXMoc3y6pipiN2P+58n/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fgWkHBuN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9OcFv009241
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8fGqVCbKdUD5IhTQGdpZfzscjaHJZUBYNn64bhKqYT4=; b=fgWkHBuNJDbkhIhw
	AxC2uJTLEXRNI8Ix3WR2RQZmmj5gMWrJoBAEo6B0XdtZVZXXR93wW50fjRUiNS0t
	bGPoXKI3lEby69VBbAungCRQP3dLfzKbC2iTCBtAjCXn1Bflb/wcgHghS34xzChW
	PGh9XzboVYVRcLUtADuwPCt5WiCBOcN717oLozASa6xdq0R3rB9t783wu3SIOd/J
	AEat6Alg2isnhwI6/vp/1WKG1TkgmCh+CsG73cSdLeJy+vPo1i2jeJIHnI5NFAVj
	hrgsxRG16BKyZZDuUdUVWswCfxqThM85gRuBJTiAHhHg8WKHo+pILan2+NiXnlwu
	Qyrq+g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2t1jfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:36:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31cb5cc3edcso1882285a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 02:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753436203; x=1754041003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8fGqVCbKdUD5IhTQGdpZfzscjaHJZUBYNn64bhKqYT4=;
        b=irpPWfCkMlylVwnfQjGOXerqZKHf2jpZu9aMd/NeFsjMSYDMJvYKU3+th9ljZCxiWx
         lMZhx20Oh8j1Cx8UE9QFcpvD2czpEgipqgMu9wODaACBKqbOSQYkyXcPB6YPW2d6Hnm0
         zM6bCl1qTHm5VaU92oVOx+cPJoEB8w5pJZYUaRnPU5Ksxm+t+ChmaKqQFzK3Vr8TdhLG
         I2wY9fFCg3c4uHWcbd1a0c9x6O1qcGaScZt5giL04SB6bSDFo9z9kTkEATjjvib/Y3H8
         QpCocDCTo5Eerf4PzK9GE4P2QWzZpiINhSBLN4WYl2qYpfwjdqqWdnVDZhKC00RiVc9r
         09ww==
X-Gm-Message-State: AOJu0YyeAO1BHrYBmc0pMzece2G1RAd7Y0NjvmjmtJBiwMhptIDxA9oI
	gDmY2S7zRTIg4BwHr5FiDz4PkLtmnb4iSPHCFDXtEK1ULauSTxXAk43cBWBeWKBN33DcU7H7dEV
	13RaGOk5UnTkmzrZ6C4pshoxUzHfBuPkVqw4CEv1F4NeCa4BopjA18XwHT2cPsuXu8INdNAtgMR
	GkmSO7Jg==
X-Gm-Gg: ASbGncstexuMv6Pksv9Evh6Nza9pQsOO0ftPqZ38tMtVe/M5OKEcd50OWibSxfTBt05
	WTw2OkhGPMHilh2UCu6NFQqXIOg41tD7BzNiifcKXS4J3Grj03Ql/iZgjX4XTtwDXoliyeIkk5i
	+x0KF2qhjCTGeCHPuhwE3hB4QYyp0sbnootS9ArYOhuZbUIXCsG4zTbLvo/YuJttfzbD1fyh8vJ
	lktjhipV4I9E4cecIhmf8BnV0KarOcGbmbJJmLiwFzZg854cIXs5kQzre4eE4Lj1St8MfVE9Y9x
	2oe6geIA41s8yM1au6IE7tqdMPO3vZ5/KHwkorxOmnNTJCWtBUcKsOjI0Mk6AOLN9JUi1cEi6JB
	WUMTfyWnlb+s7QHSzNA474rRA8/8=
X-Received: by 2002:a17:90b:2d8b:b0:311:e8cc:424c with SMTP id 98e67ed59e1d1-31e779fce5amr1572778a91.25.1753436202676;
        Fri, 25 Jul 2025 02:36:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6VQ+hjM+9VTW1JluX17yS5gKOukl9PngNrV2/3XdW+Tv7bW62cUA8gef6d9gMhfXtDXlJ2Q==
X-Received: by 2002:a17:90b:2d8b:b0:311:e8cc:424c with SMTP id 98e67ed59e1d1-31e779fce5amr1572748a91.25.1753436202270;
        Fri, 25 Jul 2025 02:36:42 -0700 (PDT)
Received: from [10.133.33.89] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e6628b1fbsm3127948a91.12.2025.07.25.02.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 02:36:41 -0700 (PDT)
Message-ID: <20829683-b2ce-4aaa-beb4-4ca5774350a2@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 17:36:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250724-hamoa_initial-v2-0-91b00c882d11@oss.qualcomm.com>
 <20250724-hamoa_initial-v2-4-91b00c882d11@oss.qualcomm.com>
 <d55f79ed-0bec-4045-8bc6-9005d19f865d@kernel.org>
 <cf84a8ef-9f4e-4f13-b41e-9525e21a913b@oss.qualcomm.com>
 <3f03b1c0-94a2-4081-adb0-aac4f42ee430@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <3f03b1c0-94a2-4081-adb0-aac4f42ee430@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BMKzrEQG c=1 sm=1 tr=0 ts=6883502c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=kD3CWL0wyOYqigJ9jOwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: m64prS9445mZTPRCI4Lzatu8NBzYWueq
X-Proofpoint-GUID: m64prS9445mZTPRCI4Lzatu8NBzYWueq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA3OCBTYWx0ZWRfXzmBkg39CKOti
 VxPyNK8o789tjhGf8+/Me6B7/+1r7ioE6+Nx9VypAAO/bsst4kz2gUGWiDKuGngvIwob5XKZJyB
 9AE0aX5vA1zJorG8VwpcQ12WK/yt5W0fmMBvSAKXkTbDJU6th0Q2n7DIcFq/fW/8gZG5/1gp7K/
 nMCryp0FqOewiO2ciscblvl9cEuqj6pmKDgPWfLH1uQbGbrKgoeuLPOP6D30wICF8+cFPTGMFFZ
 VumGxLwC4HAcgX8TPz20foSy0PGydlYXmWTQmfT2gI6mMPuNufuSkHBxOC906J2fncDKolNJUoA
 f6WU9UoCtjtXdbOCoWrAMDmg046+6qpZtGRCWTxUnsUgzxIlOq7Y00u4XHbXgwfZ5bg60mp0rRN
 vEYu5PE9/iXE2sRW8BSmHxBuvcZlQdG96RKJBdkB85zkN+0uMN81Vmv1BJ2rkTymcmhdni+C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250078



On 2025-07-25 17:18, Krzysztof Kozlowski wrote:
> On 25/07/2025 11:01, Yijie Yang wrote:
>>
>> wcn7850_pmu: wcn7850-pmu@xxxx {
>>       compatible = "qcom,wcn7850-pmu";
>>       reg = <0x...>;
>>       vdd-supply = <&dummy_reg>;
>>       vddaon-supply = <&dummy_reg>;
>>       vdddig-supply = <&dummy_reg>;
>>       vddrfa1p2-supply = <&dummy_reg>;
>>       vddrfa1p8-supply = <&dummy_reg>;
>> };
>> This approach ensures the DTB passes schema checks while keeping the
>> implementation clean and consistent with the actual platform setup. Do
>> you think this is appropriate?
> 
> No. There is no dummy regulator in the hardware, so you cannot add it to
> the DTS.

What should I do in this case? Is it acceptable to deviate from the 
dt-binding rules due to differences in firmware behavior? Otherwise, 
I’ll need to revert to the first version, leave a TODO in the DTS, and 
wait for someone to properly model the M.2 card.

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


