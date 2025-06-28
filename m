Return-Path: <linux-arm-msm+bounces-62908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8021AEC7B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 16:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BE2F3B7A0A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 14:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D2521D3E2;
	Sat, 28 Jun 2025 14:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Er8+EO/Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7001AF0B5
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 14:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751121228; cv=none; b=L5u2r/G3GUFrb+tUUmSWdCCuyXV6L8xcM2XabZ2lPyzNh1lhHqbdqG99L2ikRavxg8O8hjZJTFm75LgP2qkl+MfT4ZPCK9KT7O7iyyyUqsXEIWlC7jHjmQSeqYg3Tal3wBtK3aJ0QOWEQFSmJq7smz0I0xmMrYdHQVG5thVDp44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751121228; c=relaxed/simple;
	bh=H/z1iLiEZXOU4uzftN0AnKLKkX0XaCAs2CMguHD8mao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dGPLDKZDKdD5807iBT3q9+UOXDARL4r59oaSuJFIngR9DwFlHX0/6CLD8HkqvRFbaC/sBY5nFeIaAhmYiAqg+Oqx17QYkKuJtMfSrrkLKkhgf8BP6YN4k186xL+wvDfpTR+WOQ3wclI5YMYtl3lTsq9VBSzPc0m12B0iEK8OAe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Er8+EO/Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S2K1r2030260
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 14:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HuVOl6ZxJLGQ7rcb1ieCWzhWudrjJUbl0x5e2lJC0QE=; b=Er8+EO/ZK69WgHqO
	Ck2djVAHNvo8e6tzV4dwm764jGaPgLwdDVIGgy8/qCY7wUkD+4dC7Sty8lMi+zcZ
	DzmQRqn7/ydTmUyL6k/+mh3pRFoE/whwMnSDnlOCW6VeUkNKo/81nYvb3nxkc2Wl
	DbF8C+KXaa9zFOROIXMJn0goehAcweStzWOSg5DNTD8J+64fd/to8A1zwwn/imai
	ObPbhdlPOZLsfOBknjSP+d8Zcea8/3zuJpsqmFn4Gf+88nNSTg1Aqhp62yydrgu0
	5Jry/U602mxmMnLyy2tj54NBra1k0DbZdlojYgVmAwjtqczNXjVnQpAVbxrUkF6u
	AohWjQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq0ybx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 14:33:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb53b1e007so7506016d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 07:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751121225; x=1751726025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HuVOl6ZxJLGQ7rcb1ieCWzhWudrjJUbl0x5e2lJC0QE=;
        b=WbrCUT3cA/hJVmPo5pINZucA9lG5zi480eFj6IyZQFaaGXjv34usG5VUJrvXpeNe6O
         MNYVMYgpGpb0IY3Ucvfe9bFTX2NsYUFN9y7251e/fLKv9L7KJIotadNODtIfWtKEuCyN
         PpIzgRMFcaEkC/m7bm6ySiUUDhyX9qUPan1KEYtICItXYHVRnN2/2uPg5g8TD9DGBcQO
         ynxrtyLQPM5nLLg2MmMWXVWFfQTCjgEu7I4F3B7QuV7q3ikhanKbfuGDnQYCRUlJ2q8W
         28gXbHEhj14dB0AEerHsdTWRPkDinQtUmOadPQRiDxGUdp/N9Aq6C+GjAVAiJIp3i9EZ
         NeOA==
X-Forwarded-Encrypted: i=1; AJvYcCX3S+MMy2dYs7k7IhC/s55dFKBt9qZoSr3107DJtmUdMSXjzBW+bXmzULvdm4qi/o0CpZSxKvZS0e4JihYx@vger.kernel.org
X-Gm-Message-State: AOJu0YzyOP4BGWZVPJkJKi+kib9n3qlUgOZlQRXq4vp3jczNyHGWJOv3
	dEyMwmPKoQVdqSy4MFZbo3xid9muFDRyu5sLYnaA+NXuq60hF1goTLtTTbXwbr8PlKuJMh40Lot
	8X3+V7qLY1qx0vxhPMntUq5UCc/GWJLhLrOOP5WvUulvtrN6lTpHWxtCshphtexWoSXuW
X-Gm-Gg: ASbGncvBf4SM3vb8gFx5cXCEqrPiPqDzW1CpK4W/348GPG+AiGbXK6wSHkucwVoVPqS
	lGmqXxzNpv5CHL5d5DfFPL04MR2p9yF5qK5U5I/MPrlUneXlLqgP3n2U4R4xeNGWpcNOH21ArlO
	H+gDwZXSbckcEVAWmuIRbtl4jSpvZmLdhtIYG6r7ySC/NCrvTMVx/eC58xCE8rNwyoJs8MF8gFH
	u+bvC71YVuXA1lFJrEAIYIumEkMD2r+A9i4VtTr0i8HbHolcEnw9PGHoj5h41sdUwpZnMuOofUm
	YsxEJ+gXaK4Q5bsOChXpRFuQTAr1qZWXlOthGAA3IwnFu8mvAfBWPRgmjtxWtSMrdlXt4Y+tAci
	FjpI=
X-Received: by 2002:a05:620a:468f:b0:7c3:d798:e8ae with SMTP id af79cd13be357-7d44c1e865bmr174083985a.2.1751121224471;
        Sat, 28 Jun 2025 07:33:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqoPiCw9YRPSLc7lTHGilnDJ3WRFqDc+rvgBEJtqW7+0Cd1vSfc7+jJ37iPWQdoj4t8l0x/Q==
X-Received: by 2002:a05:620a:468f:b0:7c3:d798:e8ae with SMTP id af79cd13be357-7d44c1e865bmr174080385a.2.1751121223668;
        Sat, 28 Jun 2025 07:33:43 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831ff8b3sm3057699a12.67.2025.06.28.07.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 07:33:43 -0700 (PDT)
Message-ID: <80079934-c341-4557-b1fc-29e2c132dd3b@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 16:33:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: document the SM7635 Top Level
 Mode Multiplexer
To: Rob Herring <robh@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-pinctrl-v1-0-ebfa9e886594@fairphone.com>
 <20250625-sm7635-pinctrl-v1-1-ebfa9e886594@fairphone.com>
 <20250627204432.GA45217-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627204432.GA45217-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zNl0iA__RJI2yo5NDvUZJ_2KD0hI21o0
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=685ffd49 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=6H0WHjuAAAAA:8
 a=z9lO1hKNhkvoeKZr6R8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: zNl0iA__RJI2yo5NDvUZJ_2KD0hI21o0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDEyMSBTYWx0ZWRfX7K60dze4Rc1O
 rcztd2Ph52jJzFdbzrdfid+nFURi/iAvQ7vHh+M1ETHBtqhDP/SCG0Ev79rWqHYiNqnmx30du8M
 i4j4Xq6iJU2tgN1ZLoSxa7slrb+mXb0rjpjMpT2uH7rDnIF7laM7eWU5B47Zsw+OhnA4IVdmEbj
 oAj6HxCzk3cpwytu2ITWnKwsEK8ndR0VP+Fdo6d2tdLXLNfphZCt1WK/tKutcVgWXOSWt+a9iwJ
 jLJdfTEkc1GdGFzCGe+BlL+3f6JqW5aC7hFunSppU6d2J/kBBUPqN2rm7cGeplBZT0/7lmvdtH4
 4au2DzqDT528wmWO1kGj18BP7Q5GbgAzX9MGGvml2PYqaxmnbZ3JfN61jj4+maxZHrQKfk5vJLK
 1MA1kBumScN05upjyHjLhCjCqTYV7v/GNzee6qspGd0OzXFUtogEB1HmmxDYgev5RkVLySN+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280121

On 6/27/25 10:44 PM, Rob Herring wrote:
> On Wed, Jun 25, 2025 at 11:12:01AM +0200, Luca Weiss wrote:
>> Document the Top Level Mode Multiplexer on the SM7635 Platform.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  .../bindings/pinctrl/qcom,sm7635-tlmm.yaml         | 133 +++++++++++++++++++++
>>  1 file changed, 133 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm7635-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm7635-tlmm.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..3f49239efb6e866015b40e3477a8bd0edd21b1fc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm7635-tlmm.yaml
>> @@ -0,0 +1,133 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/qcom,sm7635-tlmm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies, Inc. SM7635 TLMM block
>> +
>> +maintainers:
>> +  - Luca Weiss <luca.weiss@fairphone.com>
>> +
>> +description:
>> +  Top Level Mode Multiplexer pin controller in Qualcomm SM7635 SoC.
>> +
>> +allOf:
>> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm7635-tlmm
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  gpio-reserved-ranges:
>> +    minItems: 1
>> +    maxItems: 84
>> +
>> +  gpio-line-names:
>> +    maxItems: 167
>> +
>> +patternProperties:
>> +  "-state$":
>> +    oneOf:
>> +      - $ref: "#/$defs/qcom-sm7635-tlmm-state"
>> +      - patternProperties:
>> +          "-pins$":
>> +            $ref: "#/$defs/qcom-sm7635-tlmm-state"
>> +        additionalProperties: false
> 
> Is there really value in continuing this complicated QCom pattern? Can 
> we just have 1 level or 2 levels only?

The 1-level pattern is useful for states that contain settings for
a single pin (or a common set of settings for multiple pins), whereas
the 2-level one makes sense for groups of differently-set pins that
are logically coupled (e.g. a set of SDHCI-active states)

Only keeping 1 would increase the boilerplate as each group of
logically-adjacent pins would need to be referred to individually in
pinctrl-n = <>, whereas keeping only option 2 would increase
boilerplate in the state definitions (think creating a 2d array for
a single scalar value)

So I think both are rather useful in their own regard..

Konrad

