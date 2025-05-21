Return-Path: <linux-arm-msm+bounces-58961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D743ABFF27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 23:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A0009E5C3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 21:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86937237173;
	Wed, 21 May 2025 21:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EfnLRve4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299C61C32
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 21:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747864223; cv=none; b=n5loHZ07FkzBp6DpfUTVaOMc6QGRGzT+L8lK55Eet6dW3j4MJMrdULIXVw8DHBJe8cOBI8J9TcVvDuNhgxy01ii5Zywz8w2bMimNKFzaXbGCxSBLA9O61klmCK4g7eLCb5pWV+n1ZvmuS+zVIJ1RTLkXHjy6dRaXUYVwsRJUrT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747864223; c=relaxed/simple;
	bh=7ec7YqocymVwZNDYCjWyZ1yTjU3fRuDbwRtmQ/TOvRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6qYWf2h9mQUiCEd2Yg1xk64vbWlJAihw16qNb7EvdXEpjxk/PUjIALUr+RbdHUC80zjGPsS/0ExM2CaRPd7RFFoWuDyGFKFlrUpUBLCMX9g/eSXll3fXmrlc5/AGi+swfjpbHsA6EkjhwT2VK31SQYRY4G6JkWoCxQVGMAX7CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EfnLRve4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIB02E020586
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 21:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+zp2fYs8ondzFr4vvTll2Y287vmt4ccz7UtoifeFSxI=; b=EfnLRve4Mh9358LV
	Wpab+fR0IzO45cj9NXXRksbNCEICfFQXsObzIwFkkL9QNUFDUV+mKJgh1YLsyW4K
	ZJpVKIU9A5yMFf7kBdyQmzLVeEVmd8Ldre5ht/fUtEn/XgtJfn87M0I61iL6MPe8
	KIbQaZR4qf7SX59eAcO69lwDW0XF/9zu6aqbOT34c4/eeEcCr0ypEYnt6fO47pAD
	03NJP/RX9IEaW9OmoUIdbiVZmkjdAsT/VrlmvJDMjJ0PmTajffpBIgknU3ECCNzq
	TRflq0NEyMY4BWVSZ0VVqccbuVlMf5IByLPaCxttQuuvpM8xBAGfUS9EheOPHmo8
	JZml6Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb2kne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 21:50:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54734292aso203405485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 14:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747864218; x=1748469018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+zp2fYs8ondzFr4vvTll2Y287vmt4ccz7UtoifeFSxI=;
        b=xC6dj/Xx8aSgk8Xr9LhkqBSs+Be754lhZrAfznYbB0s+WJ1l9fv5Xcwo9dvAtmTpcp
         XLWEhUKlxlYORkY4WORBgBbIZpMHLSDHlHEBSfzcMnEggg84BmA/hdIXHKVu0OYteq8h
         j0eUfaUbHI0i5KdRUav+Bqrkm6gm8EGbUGoCowWbIkNE0+q2nZQKOf/7veqojqAiDgDr
         MUPGyzmrSXG+HM1sHkxjljwPHx3EGMJ1oOtlOeT75VtDfGCJDoRmaWkw1dtIPGB8Mv6O
         XHMDkzqZGj51hPbeWZ7xD5NGOMn69fVSEEaDAc61FneB2wewuBdC4k4ug4cft277zpYU
         ssWQ==
X-Gm-Message-State: AOJu0YwU+TTIDWW9IjlZuGnkSXoHsMFX7krCFg6Q9fjiEfmIOEVvaqF6
	1y6cNN3b/hrlcQGY5mufVxtByPa0/caztsX4Xy0AiXCiuap349vOYG8fF4gk0f95TXdx8AYY7+Y
	sH6Ztb7FVMsL53WZM39CA80NIyjEdsk2jrE6tCltvYm48Pw+SnwvIFxDFyeYLm1ZmJDFs
X-Gm-Gg: ASbGncuA/2JSjot0PdMXeJdcQmONyiSVWTBiRguSL5OZYPmFoGr3Euoe+TC8BYJfFO7
	X87FuKlWyOhgGZ7LshzpZiQ7kt6mTP1jEdEEq5sOLxC7l7FiCbM3BsLmG/Q3Foijlw/kkybGbFT
	x6aaGPITMDzvNx8wn0KhwRhwLP93S8noAmX/ZDE75IwvHoEGjzwy4CjzDi0qOPjizpi5C6AthUj
	mkAQ6FQQtWu3h9CNlQBY5n+44NM1GiKSa4WY3G7uxqGtwISlvWj1zO00MYYSwECHXtb8OmIACmL
	+l2jbodc0u0b70qUNH5EUkfBfCHJC/Cxgwg76sDRDUw20DpayUFgyghEbdNAH6Xtpg==
X-Received: by 2002:a05:620a:690c:b0:7c5:79e8:412a with SMTP id af79cd13be357-7cd4670a6cemr1500339385a.2.1747864218298;
        Wed, 21 May 2025 14:50:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhpjUEuStNUyCf9hh7nhOCkPVsb6lk4KoJZfgdvB7PPNjy2w1g/CYqphmvRlT+NdxkeyNNBg==
X-Received: by 2002:a05:620a:690c:b0:7c5:79e8:412a with SMTP id af79cd13be357-7cd4670a6cemr1500336985a.2.1747864217699;
        Wed, 21 May 2025 14:50:17 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4383bdsm957087566b.122.2025.05.21.14.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 14:50:17 -0700 (PDT)
Message-ID: <c591730f-3524-4a09-900b-afbb287dcacf@oss.qualcomm.com>
Date: Wed, 21 May 2025 23:50:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp
 boards
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, kernel@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
 <174774807358.443838.11357806964410009443.robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <174774807358.443838.11357806964410009443.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682e4a9c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=gEfo2CItAAAA:8 a=ZVumbe2bShChVuB4CDgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: Tr19Sj65QfzW5omGe_Fg3JSmLO1Yg2QK
X-Proofpoint-GUID: Tr19Sj65QfzW5omGe_Fg3JSmLO1Yg2QK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIxNyBTYWx0ZWRfX7bdnQ3N6Buly
 kcv51mSiIDAQDDMfwHG/OJjw26sMrJVG5Kswt/Iq3yGQjOw8oNcP+QJ3Qn1AVDUsQLCt+UbvT4z
 2zwInxnTRLaD0MeMvy1PDrVjDg7lbMJoZbQqygAAUz540pBCEwthR5sONyAV95NUExEImXvldPS
 nmMUj2rIrwP0YBz/5jaud/MNf5DvqU+9fQYsdJmmYf3953S0GR795ejL6k6SAnFeoh+dsQvzKAl
 cMifrNEgmGYmqs0ZrbV4aG5vTGujGpdU4OIXWmK1Yvf+1BTJF1OC8D7zEwvalL50/xDD7E2Vvgt
 RYWVNpzaqtAjuqmK/A/AMFHGdV5K45zZCgzRe8cWyxqm537LmcYF+91mvKipMaQMPLyozmYKnga
 92ewuiM0b7pgl5YCDZqihGwn0PUQaH4jvesQ5VOqohOdM0LOLaWu5BYSYZHFOpQYavmPQqtK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210217

On 5/20/25 3:37 PM, 'Rob Herring (Arm)' via kernel wrote:
> 
> On Tue, 20 May 2025 11:56:11 +0530, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp boards.
>> The updates include adding the necessary audio device tree support and the required
>> dependencies.
>>
>> Both the qcs6490-RB3Gen2 and qcm6490-idp boards are derived from the same SoC
>> platform. Therefore, the audio support changes are included in a single patch
>> set for consistency and ease of maintenance.
>>
>> Changes in [v3]:
>> 	- Added protection-domain in gpr services.
>> 	- Addressed the review commnets from Konrad Dybcio.
>> 	- Fix DT binding errors reported by Rob Herring.
>> 	- Link to V2 : https://lore.kernel.org/linux-arm-msm/20250429092430.21477-1-quic_pkumpatl@quicinc.com/
>>
>> Changes in [v2]:
>> 	- Created dtsi file to handle common audio nodes to support Audioreach.
>> 	- Addressed the review comments.
>> 	- Link to V1 : https://lore.kernel.org/linux-arm-msm/20250317054151.6095-2-quic_pkumpatl@quicinc.com/
>>
>> Mohammad Rafi Shaik (7):
>>   arm64: dts: qcom: qcs6490-audioreach: Add gpr node
>>   arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
>>   arm64: dts: qcom: qcs6490-audioreach: Modify LPASS macros clock
>>     settings for audioreach
>>   arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
>>   arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
>>   arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370
>>     headset codec
>>   arm64: dts: qcom: qcm6490-idp: Add sound card
>>
>>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts      | 179 ++++++++++++++++++
>>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 158 ++++++++++++++++
>>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  80 ++++++++
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi          |  78 +++++++-
>>  4 files changed, 494 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>>
>>
>> base-commit: 484803582c77061b470ac64a634f25f89715be3f
>> --
>> 2.34.1
>>
>>
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>  Base: using specified base-commit 484803582c77061b470ac64a634f25f89715be3f
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250520062618.2765109-1-quic_pkumpatl@quicinc.com:
> 
> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#

So the schema is valid for qcm6490-audioreach, but not so much for the
pre-audioreach case..

Konrad

> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[225, 8], [225, 7], [226]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[225, 8], [225, 7], [226]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clock-names: ['mclk', 'macro', 'dcodec'] is too long
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clocks: [[225, 56, 1], [225, 102, 1], [225, 103, 1]] is too long
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clock-names: ['mclk', 'macro', 'dcodec'] is too long
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clocks: [[204, 56, 1], [204, 102, 1], [204, 103, 1]] is too long
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pinctrl@33c0000 (qcom,sc7280-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml#
> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: pinctrl@33c0000 (qcom,sc7280-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[237, 8], [237, 7], [238]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[237, 8], [237, 7], [238]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[222, 8], [222, 7], [223]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[222, 8], [222, 7], [223]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[237, 8], [237, 7], [238]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[237, 8], [237, 7], [238]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[359, 360]] is too short
> 	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[359, 360]] is too short
> 	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[217, 8], [217, 7], [218]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[217, 8], [217, 7], [218]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: audio-codec-0 (qcom,wcd9370-codec): 'qcom,micbias4-microvolt' is a required property
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,wcd937x.yaml#
> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: audio-codec-0 (qcom,wcd9370-codec): Unevaluated properties are not allowed ('qcom,micbias1-microvolt', 'qcom,micbias2-microvolt', 'qcom,micbias3-microvolt', 'qcom,rx-device', 'qcom,tx-device', 'reset-gpios', 'vdd-buck-supply', 'vdd-mic-bias-supply', 'vdd-rxtx-supply' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,wcd937x.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[236, 8], [236, 7], [237]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[236, 8], [236, 7], [237]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[225, 8], [225, 7], [226]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[225, 8], [225, 7], [226]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[219, 8], [219, 7], [220]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[219, 8], [219, 7], [220]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[234, 8], [234, 7], [235]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[234, 8], [234, 7], [235]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[234, 8], [234, 7], [235]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[234, 8], [234, 7], [235]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[234, 8], [234, 7], [235]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[234, 8], [234, 7], [235]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[228, 8], [228, 7], [229]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[228, 8], [228, 7], [229]] is too short
> 	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
> 
> 
> 
> 
> 

