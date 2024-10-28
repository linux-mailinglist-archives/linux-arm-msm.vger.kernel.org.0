Return-Path: <linux-arm-msm+bounces-36154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F11829B2F0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 12:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE5BF280E4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 11:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5A41D5CF5;
	Mon, 28 Oct 2024 11:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G3A/CT5D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F5F1D31B2
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730115522; cv=none; b=AqDLAgsy+WWc+9F4zQ5MATQi/5h29SkIyRvBU60pHiClMLGpxZ3DCGDt1aXAOPNs7NbC/4b5BJLtwayUwlB31dKyqV5SRC+dFMBROlcs1AhX1wchB/vRTpOHtFIBzAPISlYO3/8bj7vVFgZhUJlRQUbYc8BJnNEMik+d/Y7iEtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730115522; c=relaxed/simple;
	bh=IglqgVGUjmZfVdVL8l6vynVp9FHSWvs1YdSaxF9N1XQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JiR+LJKRA+acupPYsC/NSLBb4WOrss8ZLq+rIyUziD5f0V8w1NkPj2QBrw2Jo7vGEK75cC5Vid2ZhfDPwxIOjaxuP37rbSXKhDeaG6ZotQrMlSKl0cnlNL7B7RgrvRCIrbhMQq0jYf+wi0bB6PmSburj7NJJjCnOhuV69h4p8fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3A/CT5D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SAqDrD021678
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 11:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CFOb/Mz8MxTSzhoQdxnw/yVybKGRopSmpFc7FewOgSg=; b=G3A/CT5DTSh/tyx+
	qRiCMc9PIzJi6r2yGsY9kNUTLNlzBnwsojhjKQAevc+BdexTKJzzrGNscUQMN2dW
	oEQvn9sRzoEFOQQbAp8+wjS/VMrrsdm51lH//RrhzRRPEOGGXRdBIdHjVirCYLky
	Q+muHsiTnfN6Z1VTKP1G35i8mlpXyPIoEsSX6PgHVSTXESAJZZNRtnndvWIIHTuV
	UDHGCtNUf3fkFLTyLKq3N8hyBQqZY0xlTAclxc9CTeMW67vGM4NF2NRGwA7wMXej
	pG/gz7KQWjuO2+JmqqbgfxX3Gd4eXpffkK69exPd8hvMRHhlweXn5JvnG0EbJtvh
	vi5/xw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gs6e4p8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 11:38:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbe6e6bcf2so14432926d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 04:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730115518; x=1730720318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFOb/Mz8MxTSzhoQdxnw/yVybKGRopSmpFc7FewOgSg=;
        b=EBqgtZLbsX5pyBqybtVGbY9JArVU791Agy/JQYeBgdR1C9pU9FoRTlFzuEHF5ExmO9
         D4ezLzIDzGrmwmcisU7mlCHr0UsdEYlBNAjqNTpLnt9vovSST7FW6SlepTNgH3+BfyZ2
         Ljqxqae1QfcUhviKLpH5/hPveUcncurBD0V7nEa/aheCdE+FZ/63+iGDK4EgAkcHzrQt
         Mg9DbdjuC14qOCzrnAj+6/HxrvR/iJui3UErRkJnf/G+ApY+1e2xkFRm5YdN6emOGzBj
         3ZV6InlMG7jxOYWDhNgl1T98oLXMCq2S/ZlhtlAxWc0wem+JU8nAOwO316I7yhruSttO
         OnQA==
X-Forwarded-Encrypted: i=1; AJvYcCX8k/9XulNUwCR2c+EWxsAeS9t6u0dc4BItIS7brUe052d6T57f1IZk+Ca5B0c7ncxrrxogqAB9G/DGqmQ1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3eR/SIVD/X4kqG6Gw3JuTlzIka6B5/cxwrzXwlY0bq5RCt9IF
	RdHlmXCt5VBu+rKTYJACrnYaUFlX4HrjcRwyvlZNb2gYd42ETAn2CQsBS9xyX8eGe8CvJmes8ro
	J+e2kl5xPkaMrlyE5XxBsKRC3QYCex7wB+6binYlvpDz206FZ2ufpNiYgy+sNRDbG
X-Received: by 2002:a0c:fc48:0:b0:6cc:2295:8724 with SMTP id 6a1803df08f44-6d185682eafmr57631476d6.5.1730115518324;
        Mon, 28 Oct 2024 04:38:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnqfUTdtr4QAm4sLjp+J3omyuIbuUB+MzUfKqr5h0k1AsTjgm8AtwXYb8zh9q+f7xKQUx06w==
X-Received: by 2002:a0c:fc48:0:b0:6cc:2295:8724 with SMTP id 6a1803df08f44-6d185682eafmr57631266d6.5.1730115517880;
        Mon, 28 Oct 2024 04:38:37 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb629c250sm3134494a12.27.2024.10.28.04.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 04:38:37 -0700 (PDT)
Message-ID: <5800abe0-19e6-4364-a305-1be63c28c6d9@oss.qualcomm.com>
Date: Mon, 28 Oct 2024 12:38:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Add support for usb nodes on
 QCS8300
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com
References: <20241011074619.796580-1-quic_kriskura@quicinc.com>
 <20241011074619.796580-2-quic_kriskura@quicinc.com>
 <297dbc48-4c34-4bac-822c-be3ae2d00d32@oss.qualcomm.com>
 <2da5e869-ae44-45b1-a751-8b5edfcdbd30@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2da5e869-ae44-45b1-a751-8b5edfcdbd30@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -Q-wYbt8r239kWgEgLwDgu9jPOXj5dW8
X-Proofpoint-GUID: -Q-wYbt8r239kWgEgLwDgu9jPOXj5dW8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280093

On 26.10.2024 6:56 PM, Krishna Kurapati wrote:
> 
> 
> On 10/25/2024 11:58 PM, Konrad Dybcio wrote:
>> On 11.10.2024 9:46 AM, Krishna Kurapati wrote:
>>
>> The commit title should include a `qcs8300: ` part, like others in
>> the directory (see git log --oneline arch/arm64/boot/dts/qcom).
>>
>>> Add support for USB controllers on QCS8300. The second
>>> controller is only High Speed capable.
>>>
>>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 168 ++++++++++++++++++++++++++
>>>   1 file changed, 168 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>> index 2c35f96c3f28..4e6ba9f49b95 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>> @@ -1363,6 +1363,174 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>>>                   qcom,remote-pid = <5>;
>>>               };
>>>           };
>>> +
>>> +        usb_1_hsphy: phy@8904000 {
>>> +            compatible = "qcom,qcs8300-usb-hs-phy",
>>> +                     "qcom,usb-snps-hs-7nm-phy";
>>> +            reg = <0x0 0x8904000 0x0 0x400>;
>>
>> Please pad the address parts to 8 hex digits with leading zeroes.
>>
>>> +
>>> +            clocks = <&rpmhcc RPMH_CXO_CLK>;
>>> +            clock-names = "ref";
>>> +
>>> +            resets = <&gcc GCC_USB2_PHY_PRIM_BCR>;
>>> +
>>> +            #phy-cells = <0>;
>>> +
>>> +            status = "disabled";
>>> +        };
>>> +
>>> +        usb_2_hsphy: phy@8906000 {
>>> +            compatible = "qcom,qcs8300-usb-hs-phy",
>>> +                     "qcom,usb-snps-hs-7nm-phy";
>>> +            reg = <0x0 0x08906000 0x0 0x400>;
>>> +
>>> +            clocks = <&rpmhcc RPMH_CXO_CLK>;
>>> +            clock-names = "ref";
>>> +
>>> +            resets = <&gcc GCC_USB2_PHY_SEC_BCR>;
>>> +
>>> +            #phy-cells = <0>;
>>> +
>>> +            status = "disabled";
>>> +        };
>>> +
>>> +        usb_qmpphy: phy@8907000 {
>>> +            compatible = "qcom,qcs8300-qmp-usb3-uni-phy";
>>> +            reg = <0x0 0x8907000 0x0 0x2000>;
>>> +
>>> +            clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>>> +                 <&gcc GCC_USB_CLKREF_EN>,
>>> +                 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
>>> +                 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
>>> +            clock-names = "aux", "ref", "com_aux", "pipe";
>>
>> Please make this a vertical list like in the node below.
>>
>> [...]
>>
>>> +            interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
>>
>> QCOM_ICC_TAG_ALWAYS, see x1e80100.dtsi
>>
>>> +                    <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
>>> +            interconnect-names = "usb-ddr", "apps-usb";
>>> +
>>> +            wakeup-source;
>>> +
>>> +            status = "disabled";
>>> +
>>> +            usb_1_dwc3: usb@a600000 {
>>> +                compatible = "snps,dwc3";
>>> +                reg = <0x0 0x0a600000 0x0 0xe000>;
>>> +                interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
>>> +                iommus = <&apps_smmu 0x80 0x0>;
>>> +                phys = <&usb_1_hsphy>, <&usb_qmpphy>;
>>> +                phy-names = "usb2-phy", "usb3-phy";
>>> +                snps,dis_u2_susphy_quirk;
>>> +                snps,dis_enblslpm_quirk;
>>
>> That's a very low number of quirks.. Should we have some more?
>>
> 
> snps,dis-u1-entry-quirk;
> snps,dis-u2-entry-quirk;
> snps,dis_u2_susphy_quirk;
> snps,ssp-u3-u0-quirk;
> 
> I would actually like to add these as well, but there is no precedent in upstream as to what quirks to add for usb nodes

Every single one that applies to the hardware ;)

> , so I kept only a couple of them. Ideally downstream we disable u1u2 for almost all targets because of some issues in the past. (atleast during tethering use cases, but I need to double check though).

Does

5b8baed4b881 ("arm64: dts: qcom: sc7180: Disable SuperSpeed instances in park mode")

apply here too?

Konrad

