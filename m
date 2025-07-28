Return-Path: <linux-arm-msm+bounces-66818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE3EB1373B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 11:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B59A189221E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 09:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4589221CC49;
	Mon, 28 Jul 2025 09:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EakDVqQ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FF221A95D
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753693670; cv=none; b=KlNesZQX3yIQOMiBCz0H1cPM5aBMDjHVCcD009SX+pyVO/KgQhJuXUPw3JO9zLsZveOX1JmicqABfItr7v7jJHEgyXasRhJKxEDokf9TquXISeVwWg39rMtm7P3/O9jHLndkSZu55/2mn/wJYrCbACphKquIXMKA9h25dU6M4dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753693670; c=relaxed/simple;
	bh=zvZJc37IM1lXzSOwsBhbEwOaTkTKd3wszmRWIQwbGUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MK9TbTcbqQYMBXAkHhGEf+8Gw8PL2BKLKsSC0uBWkYbHNGyPQu1oAGiMfzzcUJzXUUobri9kr6z55DR2JgO8VO4xtBJUgQq3KfjuQGDkDoo/oo55Tljed5CEM9L/aFSNulf4tbj/NDMLrPuC15kwl16l365y3zfISi65f0VrXbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EakDVqQ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4rLxB023331
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OtaOTLSP/DV+d52JHjxMOpsKY7WYh3o1dzdSeMKQJ24=; b=EakDVqQ3QMU8UWWF
	pa75601iZ3iTooCqVGvx8BFtuU7ylEgwa2wvVGgq9L1Pnfk7PRR/hQJXc2uxab4P
	jIQeKz4BTFEdEQ5pUVwFvYvxu4J0UoCZdvOxg8CjSpG4+OGxrx1lW+rTaHBR866y
	t2wOBUkAoNRYffvEZxR6X7IJh59d8G+6sRNXpZnOKKI/4z73H0Bt/Ic54WJyRAtj
	PZ0vQLW45PvMvJIEpBuiqCwpSXXnvV+JEgHSdMlxIYBFXO2ePtXd4OzFu9BcaseN
	n0wmPdaqmoX+BblxRobSkk6gMRGKJGkk7164wQGLn75ljldjFp4v3b58leN9eYzq
	bgEGoA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcr457w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:07:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7073ec538e2so6512706d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 02:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753693660; x=1754298460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OtaOTLSP/DV+d52JHjxMOpsKY7WYh3o1dzdSeMKQJ24=;
        b=ptBj3DLM3sdJk7gnrU22czp0JW5T4DNCWW/t6jx9XydON7IPr5+82poUvSClXKirVJ
         UX0sYWC8zvjJqF9PN11KcLwp0VigsXrsH5Phuw4j8d2vH4FGHUy0xyzkA4QNsZku7qAh
         sGiLcAtUoNfjvXL+ITbTwgOBs542aflrJc2avRe6cLzM0qUQXTMaG14w3yzKITB7cpO0
         GAUv3Oz5Ru/MzBJE1OV4vlE9XxUd0WwBlFPEH40lKh5OUX2vEuLcPZEIyyW13tJPEAcS
         y0fEXuHYieBbIR/KGoZtwOMEhr7ewDPIM6VmaTebe6265fKANZvEgSMrbIdKJwAARvwX
         v9qg==
X-Forwarded-Encrypted: i=1; AJvYcCUnKKmxuzjt+CKG8STzqLGq/GSZL/slQdh7AB8CiObdK+89oB5gaWS7Ai0M/jdU5V3ZNTXHnEieosK3pegW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7iYqARD249Z7Lmr1j30gWq33kbuSpdzXTfH5E5x6NuuxEk4+D
	Eliq6yV5t/FTZfuVN4K4G4lPe6t1snaO+mZEHNmbayn0F3hOA/Y05vjUx+dFHmnv4SfTctoNqH+
	C7ZgocumaxStUC7NWgkixQDm/nKSKilc3C0+EsUgp0UD52hw51Y9qin37dJME9tD84r2j
X-Gm-Gg: ASbGncvHGY9sGV3dDbEmJmIwvbLvh6W3+KucAASTtgBbhynI3AfHZgw6N9IRUANg1Lt
	rDG8akdWni0fky9RffwzajNUqdU10HIn7P4FBOzsOneu1cJlHIVDrpNxpMN2NDOGQKy5/pwpjbz
	i4icSQDPek548lEhP3bhKV4cjgQZ/btJ5RzcOPAZXNyUEft6SkWnIE0US+0dd5kVYgFcTrc9uFU
	tWHwBDY65SgnN063EpwcgxYLEqYH+F/VqgAi5WcZwkScM8UDcPTgOTVJr2/DOYYiA4URBwlkFS3
	D2yQbaXBzxIje1TaSbyVi0Vlc6rX/EWoDYrr4JjbGUxXejnoPJssGmXy4GpqPgkUM9d2A51g0Kl
	coqrxG352lkTUf9sJow==
X-Received: by 2002:a05:620a:390d:b0:7e6:2435:b6a4 with SMTP id af79cd13be357-7e63c1c555cmr619353285a.12.1753693659754;
        Mon, 28 Jul 2025 02:07:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS7dcUDok8MlrUYjDETf2C4hAw3upxujHwxwpLTG4xsI+lKYIU6eMEVLJXJKxX9C5Vz8KwrA==
X-Received: by 2002:a05:620a:390d:b0:7e6:2435:b6a4 with SMTP id af79cd13be357-7e63c1c555cmr619351685a.12.1753693659338;
        Mon, 28 Jul 2025 02:07:39 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635860143sm398459166b.24.2025.07.28.02.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 02:07:38 -0700 (PDT)
Message-ID: <dbd3653e-95b5-486b-b38c-422fca099df4@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 11:07:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Sort nodes by unit address
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250727193652.4029-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250727193652.4029-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA2NyBTYWx0ZWRfX5kuIokfpXRSi
 /KPnPbvCzRNIO3TOIrz6o7h7IfVf3s6Ero/FcUsUfWW8RFtbys1PblDWwlz+KPe+tI+yVKR4cZ2
 qG0E4DhEJMR0QQwzqSBd+d9GIldIpXeiZLQOs/9dIV6p5e8aFJryY0LlgBprwzEiNQaJO1Q8Pb6
 BQZ3DyDl6OalZjbYtmkiOe5hh4Iz98BK+2eNuuB6DIRmiaZJ/IDwreQGXyy9dvg/Q/ZTGqYJqMw
 MZ4lKhSMFtCO8JVFF3FCeTo5bzxhSoBSF2R2HMTtf3msYUSuO6EVQfm0lx5MzUxX4dB7pihEvN+
 6988QGOuBb641VG1Zrc8ojfzqs6xja8Ep0cM41/na5yiHj31zcJWu4mjWdCfo8wiyG4Nwcznfw+
 LdouKgWwhBa9BMU2UZj/KntA0laum7EHUZBxqhbkafKxJ9gAPg8uvTGHhnJ3OrWoYF2uxfm+
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=68873ddc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=x0-Ntm4DP0gVEan9CnAA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: H_E2JW5ClQPgbKXKrELiu01lBjwOevT7
X-Proofpoint-ORIG-GUID: H_E2JW5ClQPgbKXKrELiu01lBjwOevT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=838 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280067

On 7/27/25 9:36 PM, Krzysztof Kozlowski wrote:
> Qualcomm DTS uses sorting of MMIO nodes by the unit address, so move
> few nodes in SM8650 DTSI to fix that.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

