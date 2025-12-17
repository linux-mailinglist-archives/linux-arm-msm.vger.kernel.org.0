Return-Path: <linux-arm-msm+bounces-85540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEA0CC8788
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E455C302CBBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 15:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6EF936D4EB;
	Wed, 17 Dec 2025 15:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lh3QtnEj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZdaZT/SV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B244A361DDF
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765985292; cv=none; b=MO5woTk141bLa/uLQpD4NuBQ6/dnDqdBv0jjBWGiNNtSptaJ3Q7OyYT9rmKahneiHwfrAONTIPkQtNJbfAJ1CIp78Qn28vkIA6VMZjRQmoteyb9dM/IHP92+uOoaikfoIYOP73I6n3mm0cbRfixAIhSZkYKuB/FEG2tLj6ad3X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765985292; c=relaxed/simple;
	bh=vS5+QGMhJqTRxwmGixf3B1LtkbQB7ZugwrDt7jvSwIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eePEpCBTLg4Ch+0I+HVln6QGuCzQpEFu2L8WcOKwEVNFxv6rCGfj0VENWuaBNHyHgXwjawwkAoqNzszVwmFqXODvI4JxHJgDTlm6KJofBte7hTi+kuvalhr3PIyrydGATbBlUmwqlSUt15ysFWlrxFum1rtWjHrbEcp0Bfnfw1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lh3QtnEj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZdaZT/SV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKssr330772
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NpvxrAGKgOQQiuwNm3XoE1ZgU+P+KY6K4nV1l37VaBo=; b=lh3QtnEjO5uRQCtF
	uFnxIsyXTPhpuU+pkhgQw1Pnsc9ys/7hLvjsdAr2cJx02hsZ4saAqR2JV01Gpw7t
	RaoW5Fid69HAJqmOWUn4eTFpHM71BruTdebKDlrEwp4tDlhmuYtdmnxN1JmAVRTN
	1lM/s9zWQdAy0fcOO/q6p2LrIXeDtExAHweYhXHhZkjAKxyneh66RoV6kSHpf+v5
	AvDGog8+UTNJwk7TKbdwf1lHuHoN0jwRRksXJMxA8Iyg8LvEUSiAP2tbx0ICxuad
	1Y/GUWKmk5Wi2x8xExrCs2aS251WZgjRniYf2YQAPw9CgWqVH/h2F0XKUT/w6bEK
	YX5wEA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e100e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:28:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed83a05863so18220811cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 07:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765985288; x=1766590088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NpvxrAGKgOQQiuwNm3XoE1ZgU+P+KY6K4nV1l37VaBo=;
        b=ZdaZT/SV64uzOUBsdULUozLOk4m/0oqe4XR6mmKNbjh+wGB/G3nvKcBGHsywCyNZC3
         6wnZcMd4LkqD6ADnohQqPxY9q+m9OZ/UzUUATcQZ6R+f4X5BoM5Ub+Ln97C2vei4WcYz
         DzjFgFRQVp64d8oFRncDXhBvQBjrj6uAz9lFEqwD9j/WkCeID1mMpuwn0odo9vhC0Ufb
         zbB7B7ca/1m5k6KSiAhBSG35KTvTFAlO8wTsbTo6Q20FXT+zpqsJimRZodsBmJgYBEW8
         ZxZH20IbRz4bUsO+Xc8TnrYrwEJI45ag8nljEvZcVItUcC4fJrahUOZlFK8kwF20ZxUn
         4TeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765985288; x=1766590088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NpvxrAGKgOQQiuwNm3XoE1ZgU+P+KY6K4nV1l37VaBo=;
        b=azlok8wfGRpyStcn/7LBJnhJEYiqxG5QtFJfoKcVKTuUiykFEZYS+/bFkKylkj2rRL
         cWUC5nh5zmPx/t/jwWNTAGXFu1VQQsycm0ktjqG/kmtTlFT1xULxwHlBBrVu9JyjSCtc
         taojq0FoRRGUMh/rgLxQkUB/7DwGRSF7IxYOCqTNGYPParSZmcy9iueUufVF5c9WK40v
         LXp/K6qgX8jekCZaGBnVMQvp6WjI1TuAQaJ7RlCckJWf9Iq5K5B9TWnxGBgTmGm7HA/1
         EstuZIw9Rvhs1wFnCJOBq6f0mmRHTrujfQKOirCWvJn8jQ7uV4Alv5L69QAvh11hlcpX
         Sr6Q==
X-Gm-Message-State: AOJu0Yyuo87eqGrIRH+xJ+IvwtZ6Pp6r1p/+yTUVuQzPGL68c3zs5RyS
	HmaGNeMd8QxlLa2tv5Vb4n2I30BdPcOQgefL2CoD2rlYkM8AujjvL3t9yo/fCEhkNuA67KdTwAw
	elaeAzSmZx4lw9N1piB53lgwaIVBWQDM1+juIhsRIndk4OYCKsBvHL+Pyf07wzv2GYYxo
X-Gm-Gg: AY/fxX6ohZ8qFedTks91sLIhr++dq0/l6ZJamIFLzD2ViDu5daqrV5c3D25YCtnhF80
	jV8efnEN3OSXfMf1B13d3uR0rjSFBjXFmdE/G91aZRACjQ97llUp3makzmCrIg3TMnQbKCV8wXY
	hCONEa8TtYdqLMFqBq0QZelO7T50EdTML/0TMtYSgeme4USdIBe04EiqVyvQ0avtBsUod+EgNh8
	xMWzzsi87DfCmtyjlZzkrFKvwi4Fy0PkcxjI8qa+QK+n6nWxj/Qgj+85ZLJbJj95Oz2TKXK60W+
	Ff8YvhDvY6qeWj5f0lwOQVshsPPRXIe5hgy8qRuYqyVGUSYtG9Q2nbERjR1DinTkJM8wZXJCAsY
	r3wxTXzMcFvdFY+pDCzLy1kMQS6oyBE8vo+WErO/eATKps3dRx+qyZvjETF+GsmmxsQ==
X-Received: by 2002:a05:622a:15ca:b0:4ee:87e:dedf with SMTP id d75a77b69052e-4f1d06108d3mr186906721cf.8.1765985287943;
        Wed, 17 Dec 2025 07:28:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQYxBozUDpQ8zpkUoU2aSZ8eRnOyZoPy/cVs78PuFM8EGLqXffXzVf5Xsu375vNciuAlo7fg==
X-Received: by 2002:a05:622a:15ca:b0:4ee:87e:dedf with SMTP id d75a77b69052e-4f1d06108d3mr186906391cf.8.1765985287417;
        Wed, 17 Dec 2025 07:28:07 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f584800sm2692758a12.30.2025.12.17.07.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 07:28:06 -0800 (PST)
Message-ID: <5f1282b2-2447-4ce8-a943-90c88e7f5835@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 16:28:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: Enable known blocks and
 add placeholders
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251216-placeholders-v1-1-d7d544200e7c@ixit.cz>
 <f3ad33e4-1924-4a8e-8fe0-56487ea2c872@oss.qualcomm.com>
 <5199fe6a-550a-4366-bee2-d4ab08ed248b@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5199fe6a-550a-4366-bee2-d4ab08ed248b@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyMSBTYWx0ZWRfX95GlNuIVhduU
 lh9iwkZPmcbx5uueITvqbTy/uhVFVqf6oqcymcmytlfWQjX3yU0tURI1VJJDhxMDbnKHVxwcbRf
 EfkMTYCeuqAbH+pw3Fc+fFCjAYXebPU3LoaB7VVpx+3/hHC1YeiASDNxQGOeu+eaLsibwIk+nG3
 wLt2JFa/xYd4mzhJU3PeRtT4heTrgsMiMAfA1kb/dxuCqtpIziUNe6UsCuBidPLxgJMkTBwP7h/
 Ou5APxCxYymUWi1kTQWzwbWwhG53gxaRwlHtY7CHedXCQsPfzJtqZ1nv2c7ArEOCHQa6QbmQ6La
 sTuiFwBsnl2lgFfDt1BlxZG7LGOcv/9n5BmHpteZgzAQ9IIFK4XCeYFoLiUbv4Yvy+Z7CK2UC2A
 YiiK+ChiOQVkHNGPnkW87HGbPBU7VA==
X-Proofpoint-GUID: CER5remXRNEhDks-wldK2ZFp6uGNcpbY
X-Proofpoint-ORIG-GUID: CER5remXRNEhDks-wldK2ZFp6uGNcpbY
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=6942cc09 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=p0WdMEafAAAA:8 a=6oNqwxbLjnVaV5MYmCcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170121

On 12/17/25 4:00 PM, David Heidelberg wrote:
> On 17/12/2025 13:04, Konrad Dybcio wrote:
>> On 12/16/25 9:34 PM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> We know these devices are present; most of them are supported by
>>> downstream and are close to the mainline kernels.
>>>
>>> This adds placeholders for:
>>>   - front camera (imx371)
>>>   - rear cameras (imx519, imx376k)
>>>   - actuators
>>>   - NFC node on i2c3
>>>
>>> This is very handy when rebasing the integration tree with
>>> support for multiple different blocks at the same time.
>>>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>
>> [...]
>>
>>> +&i2c3 {
>>> +    clock-frequency = <400000>;
>>> +
>>> +    status = "okay";
>>> +
>>> +    /* nxp,nxp-nci-i2c @28 */
>>
>> This seems fairly straightforward to enable - could you just
>> do that instead?
> 
> I have patch for it in-tree, but most likely not correct. See notes in:
> 
> https://gitlab.com/sdm845/sdm845-next/-/commit/eeb765bb1166e020a771ed712fec76b56da229ee
> 
> For now, I can only confirm the device is on the i2c address.

Taking a look at just the names of the sdm845-qrd.dtsi/sony modifications for
their sdm845 phones in downstream which I presume have the exact same chip anyway:

notes based on observation and driver (drivers/nfc/nq-nci.c)

        nq@28 {
                compatible = "qcom,nq-nci";
                reg = <0x28>;
                qcom,nq-irq = <&tlmm 63 0x00>; // interrupt, duplicated below
                qcom,nq-ven = <&tlmm 12 0x00>; // voltage enable, ACTIVE_HIGH
                qcom,nq-firm = <&tlmm 62 0x00>; // firmware download, ACTIVE_HIGH
                qcom,nq-clkreq = <&pm8998_gpios 21 0x00>; // clock enable, INPUT
                qcom,nq-esepwr = <&tlmm 116 0x00>; // eSE power enable, ACTIVE_HIGH
                interrupt-parent = <&tlmm>;
                interrupts = <63 0>;
		[... blurb ...]
        };


   pm8998_gpio_21: pm8998_gpio_21 {
                pins = "gpio21";
                function = "normal";
                input-enable;
                bias-pull-down;
                power-source = <1>;
        };


        /* GPIO_62: NFC_DWLD_EN */
        sdm_gpio_62: sdm_gpio_62 {
                mux {
                        pins = "gpio62";
                        function = "gpio";
                };

                config {
                        pins = "gpio62";
                        drive-strength = <2>;
                        bias-disable;
                        output-low;
                };
        };


        /* GPIO_63: NFC_IRQ */
        sdm_gpio_63: sdm_gpio_63 {
                mux {
                        pins = "gpio63";
                        function = "gpio";
                };

                config {
                        pins = "gpio63";
                        drive-strength = <2>;
                        bias-pull-down;
                        input-enable;
                };
        };


        /* GPIO_12 : NFC_VEN */
        sdm_gpio_12: sdm_gpio_12 {
                mux {
                        pins = "gpio12";
                        function = "gpio";
                };

                config {
                        pins = "gpio12";
                        drive-strength = <2>;
                        bias-disable;
                        output-low;
                };
        };

Konrad

