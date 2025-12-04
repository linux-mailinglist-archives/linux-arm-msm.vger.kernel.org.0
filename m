Return-Path: <linux-arm-msm+bounces-84298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25200CA290C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 07:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73B003008070
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 06:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BFE2FE059;
	Thu,  4 Dec 2025 06:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nEbNRvz3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UnuCwy6A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513C02D9784
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 06:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764830981; cv=none; b=QmHKwDMC69r6iKT/nDLOjqDhi1ogcerqOtXOvBfJDOMNw7z+bxKgD1qpbmgeh9F+5gWK62T3Xh1KSvADV5/5v5h6ju4zrzmuaHtBA63uLx+1jzXFJi6Kxru1cbcHSs/JJH63gSgYnDAILQB8yZJAW/coyzLpXHetBwQUSKxph80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764830981; c=relaxed/simple;
	bh=t0tj1cZznyN+U6ohXMoJO6fvO7fvbE0K7wXck5ehYEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DaTd0nbVofBaLQDRF407NpySxUG3JWw0c/3FenUuE5JqONXdnnuOQMKFK/Sc+l5b9wOTQVcQ4LVC+ssKWmo+XlS1KEpkc6BcWETJEGuiF7rVVLAS2NeXwZiE6s2dIglA2yI+4L7F5wjqYraWfMc+/DrZJqoIGH2Jpa0e6JNNpbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nEbNRvz3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UnuCwy6A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468f7v644808
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 06:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JmxQysCR134n2X2yxpyzNPSzsppqGu72HHKjpEfLnis=; b=nEbNRvz3p6bWvbuz
	zIVmKDC76NjnOBKZIurOuqhCfda/Ts78YN8JAzPecRnMrO8cFPPf2Pwy6K8iqK6K
	VhVop6n2h4dfB7Fe9lSnPJlfJdxeiukr9mxMniq2djLwY5C62SPIyKIvAVTJ6Vwt
	DNEDrUw/Oj/KMQaqhMp1n9vModfHFXj/DgQIyfvJtnzGlG+BP1Y3PlmcnoQyWNNZ
	EPrQ5KDidEL/mE39n/kHwWw86JH2wB637uGrLj8evMf7DYDrRjSTJ3gNUr9d819Y
	53fapIOGp4InouwBBNhbmJsXuWQtulYCID9Flug3jcRE1fxfqsbsKKuNsc74Nsib
	d3Sodg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atsar249a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 06:49:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-299d221b749so11807795ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 22:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764830978; x=1765435778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JmxQysCR134n2X2yxpyzNPSzsppqGu72HHKjpEfLnis=;
        b=UnuCwy6AWYOg7PRrHd6guNrVlIW0suwwnj2HvQbtBo1xt8AXN5kRK41miH8/nHs+Na
         gHpEINEf8+bRLjDtBY1jlbQUR8LhHoygg4Qk3E9G1kF53gJIAnvw7i8iMKe0u5J/Wy4l
         s+AP8R1HcV6gy/Gpn0RLhCcASxXWEJjgqw3q3Um7oQBtYtcB9SoLKNkHdR25XTGbrY/3
         9hplwiNr+VMWTIUdycIGVh5FlisvndXW4Tceq1h9uGOrnFGeJN9YSjAn4X/Kq4/mmyQv
         iSSWRYWs1Z56vnemhiwRsUmlnpbGPnnRcPKNU+2sLqF3gvVR7gkDIqj0aKRB41jI800I
         UQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764830978; x=1765435778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmxQysCR134n2X2yxpyzNPSzsppqGu72HHKjpEfLnis=;
        b=Pb+pjYYdI/FDkuStDLbuOQcf0eOPIkv5zpa1xAoPWOfGbwTtc7KwnQQut105FCKHLr
         chNbF+PjyEeAQz9rsCYkRGL8GXcvsdxiqsAcEj29MJb3zea/JDICU1QmoP/Msc/QWyVB
         lsxuDpD0mntJLT8lEsinleVyJ4/ADxU3bfWrSdPuYw0VHuun3Y6+Pzw9t//oDZO5XPSF
         6Oy5w7NypmW7GtAXuOHTu/2w0Y27aN7PUB98WIFeAY9hXWFbRa/aLz+uhfTtHjnktD6H
         hrS3dXxqSFAYVh7x6PGFFG1XrIjXoVILeXMO1Uhils805+TFG9IRfCu+2XXQgCzRIk2a
         QVrA==
X-Forwarded-Encrypted: i=1; AJvYcCW3Zlpq+Cy/TFUTCsHbT8NDUIANPf3yGAL/Dqiz737HTjSLBgmtfCMNt7E869KPRcJYV7gmxmdA+gsirShN@vger.kernel.org
X-Gm-Message-State: AOJu0YzKB9sOlQuFYOLVV4Jh1bxAq9qb89iZkYCGi6mpGq1j6WliqF91
	ahjmC+4ELxFpKyx2LT1QWR6pkXxXlAQB5XHhlJQY1tnt2CDOUvpiwj4Eb51KG55IPXdR0e2hSDg
	TbzmnWFKPAooed684JOmPo3rtv9QjCJxADWv66Dc7YqiYwHbki+ewOxIr58yMBEjzJrQ8
X-Gm-Gg: ASbGncuYMFc1j04u+c1HQzLKwxBkIBsqHGnu2a2X1uEvlabCKVOqP6AwJN7S+X0m+1/
	iYeUbTVftLzzTRXjneTh1Szjy3/uAWEtI4pHLIzSHRdH+mn1xIcGDLgprmDzc2edpoXB7bvyV0/
	VTfFPD5h7yKRik8cKCgfrq6HgqfV/WCJ7pd0b6PKbZqPgy6hf8IfASJjAnyD5rr9nxdXQ2dqiJO
	hmGRE7SRu0qwfzEoo4DbUEY305obHcotTijQrFljDgLuAYQH0hmKymAujDxvr9iMmUYfjvMvP75
	atf+3LQ3s817Ob+Mgvc1lwbBcqdFsuERQUlmtGLv0SgtlLjBeNH5nAqjwSIxAv2l9ZFbXDS39UW
	kWV2DRvGL+5K51lgDXc9yh1W245JMY9M3f2W1HQ==
X-Received: by 2002:a17:903:3504:b0:297:df4e:fdd5 with SMTP id d9443c01a7336-29d68374edcmr58468335ad.23.1764830977700;
        Wed, 03 Dec 2025 22:49:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgbdk7irsBvw1LZJUA0OWs78tPE68m1BrsOGzvi1/Vkcfye2t+5+TQ2h6idk9qPOk7MkUtEg==
X-Received: by 2002:a17:903:3504:b0:297:df4e:fdd5 with SMTP id d9443c01a7336-29d68374edcmr58467915ad.23.1764830976979;
        Wed, 03 Dec 2025 22:49:36 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaac16fsm8526875ad.87.2025.12.03.22.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 22:49:36 -0800 (PST)
Message-ID: <de44560d-4ed8-41fe-be7b-56412b933a8c@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 12:19:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] dt-bindings: clock: qcom: document the Kaanapali
 GPU Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
 <20251126-elated-stoic-scorpion-25b630@kuoka>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251126-elated-stoic-scorpion-25b630@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EVsx3YlUuu4z9h95sJMruZxl4x6mX9-i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA1MyBTYWx0ZWRfX5HDISP28ykUl
 4Fff7tXvuxNS8ir9+2U/weWvTwWPG1F8qG9+KaHI43pMktJtZc5G5ilN4WHfimYW0n1uOMH1pOE
 xEZUozq/luY/aziCv9iBgufpG8909BNL+TWS4h/mCebrRoYZSWcGXTT6r6Gw+cs/G5f15CRkk2T
 ijLUaMr+jmvQD62XTBaKl1cqJm94B2H1pihZs19R3p1xH3arKQRwimuVm19CsITkaNSvxJa0B+p
 un8eBGbXFdaDkQ3Rzwl2UkYlNUt1o/QNTPJxqGsitL42ojNUdTx3WGm44NPTEl2hl30c6J+vsfG
 2DIqc+wrhR6BbbV3eoZCcLJJg8MvNJEMbopP7Q296//dvkeHQhvxACSCNcm02m3fBwspS5wxyb3
 hzVvbH2SIDEHE7w/mufDuWTXYFctrg==
X-Authority-Analysis: v=2.4 cv=dfONHHXe c=1 sm=1 tr=0 ts=69312f02 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=llZtH8EMZHlCI_xCz4EA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: EVsx3YlUuu4z9h95sJMruZxl4x6mX9-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040053



On 11/26/2025 3:05 PM, Krzysztof Kozlowski wrote:
> On Tue, Nov 25, 2025 at 11:15:16PM +0530, Taniya Das wrote:
>> Add bindings documentation for the Kaanapali Graphics Clock and Graphics
>> power domain Controller.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 63 ++++++++++++++++++++++
>>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
>>  include/dt-bindings/clock/qcom,kaanapali-gpucc.h   | 47 ++++++++++++++++
>>  .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    | 12 +++++
>>  4 files changed, 124 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..31398aec839d88007c9f1de7e1a248beae826640
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
>> @@ -0,0 +1,63 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,kaanapali-gxclkctl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Graphics power domain Controller on Kaanapali
> 
> "Power Domain"
> 

will fix in the next patch.

>> +
>> +maintainers:
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm graphics power domain control module provides the power
>> +  domains on Qualcomm SoCs. This module exposes the GDSC power domain
>> +  which helps the recovery of Graphics subsystem.
>> +
>> +  See also::
> 
> Just one ':'
> 

My bad, will fix it in the next series.


>> +    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,kaanapali-gxclkctl
>> +
>> +  power-domains:
>> +    description:
>> +      Power domains required for the clock controller to operate
>> +    items:
>> +      - description: GFX power domain
>> +      - description: GMXC power domain
>> +      - description: GPUCC(CX) power domain
>> +
>> +  '#power-domain-cells':
> 
> Power domain controllers do not belong to clocks, so this is:
> 1. Misplaced - wrong folder
> 2. Probably wrongly named. gxclkctl sounds like clock controller, but
> this is domain controller?
> 

The GFXCLKCTL is actually a clock controller which has PLLs, clocks and
Power domains (GDSC), but the requirement here is to use the GDSC from
the clock controller to recover the GPU firmware in case of any
failure/hangs. The rest of the resources of the clock controller are
being used by the firmware of GPU. The GDSC is a clock controller
resource and modeled from the clock controller drivers across chipsets.

>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - power-domains
>> +  - '#power-domain-cells'
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        clock-controller@3d68024 {
>> +            compatible = "qcom,kaanapali-gxclkctl";
>> +            reg = <0 0x3d68024 0x0 0x8>;
> 
> Keep consistent hex, so first 0 -> 0x0.

Sure, will fix this.

> But the problem is that you defined a device for two registers,
> basically one domain. I have doubts now whether this is complete and
> real device.
> 

As the Linux GPU driver requires only the GDSC, I have mapped the region
which is required by the clock controller driver. If required, the
entire region can be mapped as well.

>> +            power-domains = <&rpmhpd RPMHPD_GFX>,
>> +                            <&rpmhpd RPMHPD_GMXC>,
>> +                            <&gpucc 0>;
>> +            #power-domain-cells = <1>;
> 
> And cells 1 makes no sense in such case.
> 

We would like to leverage the existing common clock driver(GDSC) code to
register the power-domains and also maintain uniformity across chipsets
and consistency in consumer GDSC phandle usage.


-- 
Thanks,
Taniya Das


