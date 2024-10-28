Return-Path: <linux-arm-msm+bounces-36181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 823FC9B33A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 15:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A08121C2278F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 14:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6231DE2B2;
	Mon, 28 Oct 2024 14:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LU3HipJZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B66F13D539;
	Mon, 28 Oct 2024 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730126097; cv=none; b=buA3G+XdQeHbh3NI8+JS2LyPaGUKI2d1JuyrRMmwgzGUN+yntqeO96Zn7n8YhbzkT6rKl9jfnJTtxIjFf2qbx2CvnNHjVguqKqzsFIOOh1Uor++3yEk6H7BkTumJjz9piPAr32QuwPIKpa191maNqcx0nYGZsraGxgQIfhMamC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730126097; c=relaxed/simple;
	bh=KWJaUoA49CGHQv05XYzL7sDq9qbauKoD5an8wjO5Tlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fU/jLFRK44pG46tPy0TLAUSijsasip75/1BA/AV9K+Ph+pVhhUzYyCpCUQR9zv9Cr+aHvBXdbp5nZ8kmLFFtWRIEiDVmOwS2LOUtb0g/q1KEiHSZz8CNUVIjCB9mtBmcxaxga786nbf0MeEd8Z6rEYxn+sDeP3olEWe1f1xdECA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LU3HipJZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SAYBt9025437;
	Mon, 28 Oct 2024 14:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I6wvD3Z4DjzJ28mwsHba6DMGJM7Ky+JcjbXWQQCpDSw=; b=LU3HipJZyEScHE44
	o+frYguUpe7vrS2kkryCschOBRUIczPaShmuuWYhfn4pJlIiFDPqT0SgDvVbh0q3
	Tcn+FYKTyOIDMt6XbDB6e+HOtaCr7wr66sFsAXSoPvGDxt2Sc2mGvXGN+MMHzUGv
	ilUw6zTOzwA41dXlHm6x5F4j2yWVNd2c0BYPcHBMG+KunBZ0VuJd2xySK0ni/Gfu
	1dNW5wobiUIvxqTIHCJ7a4Lg5Ds4uU8lan85qdT0jTvQIKIXdBeA7xYzqxIK1Zze
	yC1r4L03sK9fAe+qDP4SUzK76M4pI7Se/PupMo6F5prOTVEjtqthEVjy5W1z08+u
	ZwIPaA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gsq8da2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 14:34:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49SEYoJO013335
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 14:34:50 GMT
Received: from [10.216.58.214] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 07:34:46 -0700
Message-ID: <16b78c39-c2a0-423f-8849-8b4c93e7ce84@quicinc.com>
Date: Mon, 28 Oct 2024 20:04:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Add support for usb nodes on
 QCS8300
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>
References: <20241011074619.796580-1-quic_kriskura@quicinc.com>
 <20241011074619.796580-2-quic_kriskura@quicinc.com>
 <297dbc48-4c34-4bac-822c-be3ae2d00d32@oss.qualcomm.com>
 <2da5e869-ae44-45b1-a751-8b5edfcdbd30@quicinc.com>
 <5800abe0-19e6-4364-a305-1be63c28c6d9@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <5800abe0-19e6-4364-a305-1be63c28c6d9@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FTk8_24BM-Bi4YKXMQEbw9XPkIdwzAR5
X-Proofpoint-ORIG-GUID: FTk8_24BM-Bi4YKXMQEbw9XPkIdwzAR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410280117



On 10/28/2024 5:08 PM, Konrad Dybcio wrote:
> On 26.10.2024 6:56 PM, Krishna Kurapati wrote:
>>
>>
>> On 10/25/2024 11:58 PM, Konrad Dybcio wrote:
>>> On 11.10.2024 9:46 AM, Krishna Kurapati wrote:
>>>
>>> The commit title should include a `qcs8300: ` part, like others in
>>> the directory (see git log --oneline arch/arm64/boot/dts/qcom).
>>>
>>>> Add support for USB controllers on QCS8300. The second
>>>> controller is only High Speed capable.
>>>>
>>>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcs8300.dtsi | 168 ++++++++++++++++++++++++++
>>>>    1 file changed, 168 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>> index 2c35f96c3f28..4e6ba9f49b95 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>> @@ -1363,6 +1363,174 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>>>>                    qcom,remote-pid = <5>;
>>>>                };
>>>>            };
>>>> +
>>>> +        usb_1_hsphy: phy@8904000 {
>>>> +            compatible = "qcom,qcs8300-usb-hs-phy",
>>>> +                     "qcom,usb-snps-hs-7nm-phy";
>>>> +            reg = <0x0 0x8904000 0x0 0x400>;
>>>
>>> Please pad the address parts to 8 hex digits with leading zeroes.
>>>
>>>> +
>>>> +            clocks = <&rpmhcc RPMH_CXO_CLK>;
>>>> +            clock-names = "ref";
>>>> +
>>>> +            resets = <&gcc GCC_USB2_PHY_PRIM_BCR>;
>>>> +
>>>> +            #phy-cells = <0>;
>>>> +
>>>> +            status = "disabled";
>>>> +        };
>>>> +
>>>> +        usb_2_hsphy: phy@8906000 {
>>>> +            compatible = "qcom,qcs8300-usb-hs-phy",
>>>> +                     "qcom,usb-snps-hs-7nm-phy";
>>>> +            reg = <0x0 0x08906000 0x0 0x400>;
>>>> +
>>>> +            clocks = <&rpmhcc RPMH_CXO_CLK>;
>>>> +            clock-names = "ref";
>>>> +
>>>> +            resets = <&gcc GCC_USB2_PHY_SEC_BCR>;
>>>> +
>>>> +            #phy-cells = <0>;
>>>> +
>>>> +            status = "disabled";
>>>> +        };
>>>> +
>>>> +        usb_qmpphy: phy@8907000 {
>>>> +            compatible = "qcom,qcs8300-qmp-usb3-uni-phy";
>>>> +            reg = <0x0 0x8907000 0x0 0x2000>;
>>>> +
>>>> +            clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>>>> +                 <&gcc GCC_USB_CLKREF_EN>,
>>>> +                 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
>>>> +                 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
>>>> +            clock-names = "aux", "ref", "com_aux", "pipe";
>>>
>>> Please make this a vertical list like in the node below.
>>>
>>> [...]
>>>
>>>> +            interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
>>>
>>> QCOM_ICC_TAG_ALWAYS, see x1e80100.dtsi
>>>
>>>> +                    <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
>>>> +            interconnect-names = "usb-ddr", "apps-usb";
>>>> +
>>>> +            wakeup-source;
>>>> +
>>>> +            status = "disabled";
>>>> +
>>>> +            usb_1_dwc3: usb@a600000 {
>>>> +                compatible = "snps,dwc3";
>>>> +                reg = <0x0 0x0a600000 0x0 0xe000>;
>>>> +                interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
>>>> +                iommus = <&apps_smmu 0x80 0x0>;
>>>> +                phys = <&usb_1_hsphy>, <&usb_qmpphy>;
>>>> +                phy-names = "usb2-phy", "usb3-phy";
>>>> +                snps,dis_u2_susphy_quirk;
>>>> +                snps,dis_enblslpm_quirk;
>>>
>>> That's a very low number of quirks.. Should we have some more?
>>>
>>
>> snps,dis-u1-entry-quirk;
>> snps,dis-u2-entry-quirk;
>> snps,dis_u2_susphy_quirk;
>> snps,ssp-u3-u0-quirk;
>>
>> I would actually like to add these as well, but there is no precedent in upstream as to what quirks to add for usb nodes
> 
> Every single one that applies to the hardware ;)
> 
>> , so I kept only a couple of them. Ideally downstream we disable u1u2 for almost all targets because of some issues in the past. (atleast during tethering use cases, but I need to double check though).
> 
> Does
> 
> 5b8baed4b881 ("arm64: dts: qcom: sc7180: Disable SuperSpeed instances in park mode")
> 
> apply here too?
> 

QCS8300 is Gen-2, so that quirk is not needed.

Regards,
Krishna,

