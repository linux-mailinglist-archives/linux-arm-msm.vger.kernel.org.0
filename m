Return-Path: <linux-arm-msm+bounces-73312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3CEB54ABA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 13:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B13F1CC7D55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 11:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C522FF15E;
	Fri, 12 Sep 2025 11:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cGl4kyBQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F262E9EC4
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757675604; cv=none; b=VwMljRcUjBugb5oD+Ykv1SVBUL6QaQZTlH9ybsTjvJpOP/E145IegB9eP39rsaYpJazh9H9TrwqEiJW55SpXtuBxKr/ogr62x0HiGXVbU/OreKtdkQ5kLHZowvg6dmlhgqjgvg2zep8eHyCkgwcSJpBX3/Q0nNfFNC1eRFkQNLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757675604; c=relaxed/simple;
	bh=lszRYL+Ecrj6hfbLW3rI/V8o+x71pST7A4pgIK7ORtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KcQYd9P31GWvL1VYb/TThBkCSU1dJocHK+rf4drys/V3qKGIxOkyxWekZh5eu+/p5u8vgOniwkR7YmwPWOCMDdMK7IX4Xp4ttT7l0rly8lAWWLHrnIpJ7z22nuG7N76drQKtvCGGl/FBCU4Yb9k8qtktNBzFwqaO3M+YRGwwDwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cGl4kyBQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fNxH023232
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qxXLgShVqwLGUck55r1aiE1BCAAIyCD2UObsyto7kis=; b=cGl4kyBQUadgXMKN
	r/Kpk7zQoOLgT6yLqdil6OEl+Uj67NiXb64AzHo+RUkoeY/fSohHUEpOaAI683Fd
	y6WtlhUCyhQiD1RMdbNC6D4RL79bqXSWMfEkJXXl1NzlGK6GUDLMpIZyx7aFfqHM
	IPx/aUFqtkzwB2+jnldQ+QnsjlUPs9vvXy7WHb/XHtd/lb5QQBdVqDUuiK7oIFiv
	YfdnUaLM8b8YbC5NJctqtmBej6nvJoEBCbJUTUR1+9mja1MnOMKEoXSQB+KD+zfQ
	4PCjb3m5ukcObS+KZihMYHaCLBfgvBHIJbnaxhtZMAEXTzCpiAvVL65rrCgnuC7F
	8MDN7Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2fh9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:13:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b3ca5e94d3so678491cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757675601; x=1758280401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qxXLgShVqwLGUck55r1aiE1BCAAIyCD2UObsyto7kis=;
        b=lsG2TQkwW5f+Ic85fBf6hffMmdqkftZ4QiYX5Zl/5dt11FE1gm5JDuAzkG0eCbTaag
         N069G7pi6NKZnH599bidP5EbptdyaYkbeqTZpB+L4SKOZpePbaatZIaUHSbM1zmf2sh7
         ml03ml9rxFG9oNtMG4nyExMaDd04bi0Dxk0BqkvWiz5mngbdFkaZaGphH6XLhA0A6RAr
         M63jXThUyEirJeV6WFk1XYGpqM5KdNoQG9jvT2XhFnAwyRYW9DsMW3xpQi1cbyqtsFob
         imWwzDbmsu0dpIWY5Ev8c+u9z113Tud2Ln9GpLlTG9JGDiCHf7K8aoLu1Z0NbZjB8Va2
         1WJg==
X-Gm-Message-State: AOJu0YxyPc8ScsK1BTCnfXUrZK8p2Nc/QZxHkv1Xcs3ACqPrlCSGLMLK
	nXwN5TlCNjGpbyph6LpYGDJg32L7I0E6VoQjc2kRRbeh9nkS3UeId2IsDdUd2Fu0jmCTVYfCGt+
	m2hnbEeGWpVrXUomZhQI2fV15m/G1aemoU5vI81Nt2YcA/l6ONYYtDMGmrRILwWKIm4Fv
X-Gm-Gg: ASbGncurMMQV6f527MHbJTB4Xey2pd0ARze3B72ZTBkBB2DXpwNOpBXE5IkbpGdXPP5
	w/50B9hFSkjc10iIAyFij5db/AfVPyKCgsGKSxpjJwfq8LuGxOEIhyqAUB+w5cOAqV4CvFcBA03
	Yrb22Ho9k5z5rHyRMpRutz23cW+usIQbkk8SeHlkYnBXeIBAx0Sc7ju46dCiEpfXbjQoJO6enB+
	3hGCPPYU0GxRbXOUSQabz6raJg3e3F+2xgQw960bkkupgXTkA5yDPvSyg+lL+pVA+IaLJI/2cgP
	8XJ7thCcgeY/BIHjP8IKOwq9fZnj6dCJY552KX2jKirNY/13SVz49ob9JHTQioxP0YNYHP5fEnd
	bpAmgChy3ddsCglVxo20Tcw==
X-Received: by 2002:a05:622a:216:b0:4b5:a0fb:59a6 with SMTP id d75a77b69052e-4b77cfb714fmr19387061cf.1.1757675600615;
        Fri, 12 Sep 2025 04:13:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd/y9V7JIR0J7uzETTEsfcWKwZ60LOjy/zwNmRMp4881XwtyUxBdsIb+OOjUIc/XxzrjG+Qg==
X-Received: by 2002:a05:622a:216:b0:4b5:a0fb:59a6 with SMTP id d75a77b69052e-4b77cfb714fmr19386931cf.1.1757675599937;
        Fri, 12 Sep 2025 04:13:19 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07d09e5414sm38020366b.18.2025.09.12.04.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 04:13:19 -0700 (PDT)
Message-ID: <ec31257b-fe10-4de7-8fb6-d649677f680e@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 13:13:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm6490: Introduce the Particle
 Tachyon
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250910-tachyon-v1-0-5090bfd133e0@oss.qualcomm.com>
 <20250910-tachyon-v1-3-5090bfd133e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250910-tachyon-v1-3-5090bfd133e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c40051 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_Hxo6uU0jCpJE4KgPD8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: yMg2ooV2-VY-BlOhfTncrySDnDY1uWqn
X-Proofpoint-GUID: yMg2ooV2-VY-BlOhfTncrySDnDY1uWqn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX4ssiTw0WkxfO
 ozgVf2te07tzBpcvc32Yccj52a6TnDDCKivcroNOCePKK4Z6O7isyoJaRFMSvGzJ60ZvCXMi+YL
 7SVOM6Y46QtAgIMbQ01UUFW76Vhj2ACI00GWBX6BPTyngJHwQtjkgTsM9elOlJBWgUFU8/fp5+0
 ZKkh68eOX2WR7mC8lpo9QmkGXPQzNbJUPTpI/SPNrTrZY6OamXD3NVhk0OFbl5l1WB+MSFxsIQl
 EVm5XTK1d4h4hcLrnDjjLcicNBKeZscFwaThqO66k7If5IdGkMV1Ol8zVaOfl2JnS7kEd7W29GQ
 pzhj40JVcmcfonkgq0Si/aTEu9XynKC08dgR2S+bQF3LyyuNo+XakL5Crk7xE3+BFPox+Ad/JKN
 crKZJngp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

On 9/11/25 1:05 AM, Bjorn Andersson wrote:
> The Particle Tachyon is a single board computer with 5G connectivity
> with AI accelerator, based on the Qualcomm QCM6490 platform.
> 
> Introduce the board, with support for UFS, USB, USB Type-C PD and
> altmode (DisplayPort), GPU, charger/battery status, PCIe shield,
> SD-card, and remoteprocs.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

[...]

> +	leds {
> +		compatible = "gpio-leds";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&activity_led_state>;

property-n
property-names

is preferred, file-wide (you currently have a mixture)

[...]

> +
> +&i2c1 {
> +	status = "okay";

This likely results in a "falling back to 100 KHz" warning/notice,
please specify the bus speed explicitly

[...]

> +&mdss_dp_out {
> +	data-lanes = <0 1>;

Is 2 lanes a hw limitation?

[...]

> +&pmk8350_rtc {

I see no reason for RTC not to be enabled by default

[...]

> +&pon_pwrkey {

Same here> +	status = "okay";
> +};


> +&uart7 {
> +	/delete-property/interrupts;

/delete-property/(space)interrupts, please

(yes we desperately need a formatter)

[...]

> +&usb_1_qmpphy {
> +	vdda-phy-supply = <&vreg_l6b_1p2>;
> +	vdda-pll-supply = <&vreg_l1b_0p912>;
> +
> +	orientation-switch;

This is specified in the SoC DTSI

[...]

> +&usb_dp_qmpphy_dp_in {
> +	remote-endpoint = <&mdss_dp_out>;
> +};

And so is this link

> +
> +&usb_dp_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss_in>;
> +};
> +
> +&usb_dp_qmpphy_usb_ss_in {
> +	remote-endpoint = <&usb_1_dwc3_ss>;
> +};

And this one

Konrad

