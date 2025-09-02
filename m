Return-Path: <linux-arm-msm+bounces-71534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9658DB3FB4C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 11:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 347D71B23A4A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 09:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9512F0C68;
	Tue,  2 Sep 2025 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYymdD6X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA60D2F069B
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 09:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756806662; cv=none; b=dohyQMow8Rv/x2qfYsR6Dy3ELjaEzw7k4x3/0YxTtvidnC94kurZBkMroDaO4ycr58/dWEUyht9yjyKdEIlx7DcbHSG9Vt4YWPDDilfMTxbXxP69MqxB9pKNzPugZYNKQzfu5c/XIHhbr2QbHZ6zc89+mIdNXVj71ZqBK7IwEdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756806662; c=relaxed/simple;
	bh=Fw7CUP2+qJw8Q2uQuLdE+0O7GNkj9fOnp/YEL97iIqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkPAIUvamE0xObP9mAYFL8U1R1ll3KeS5RTa5Nlrmj9dJAU74rzl2mPGlXd3vPbeo+Cnt3WTYW5G0i+2+yzoKzpXNzXOaBYWAnzrpGoQGKeU8Mv1ccSs+DMl9dxnqqMgkYREmX77E+ErJjmJkMLXYKKLgYB55O69YkiuROIQ4sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYymdD6X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RkDe020382
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 09:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VS8jFUXuJu8JiDeDzmlG9QSe
	cm6oM4zjP0DoxNt7tcU=; b=oYymdD6X6qwyayEFgz/fOqNrajwjDWGqrvz8iLPR
	7Rzhw1wRjBPU233Zlei1ikNdVlS+E2ZcD/3nsRBySbGiEoEkkum/Yvtbyr9NHSuO
	lAhLh8ztHqvt03HlMlA/gK8iuxaCRtUR9bB+M3L3jRrfXtB1SH48rDS0jsqYyGOM
	ARUiBfv3fO/vvUfLFFmDQJEXIAqZe4PCCAe9dOCMaACO83vmsNW0Vm/Y/+e+b/wW
	tlJnYGqxzEleETI6I7JfGsEMz7doE6apdPTwYE7mYOPR/rIn9V+UTTj+oSnz8C5P
	aQq8Fha71HY/3vaUvJTKWO/icz/XK9ZguZzr9kN6/ks4Mw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8rydns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 09:50:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70fa9206690so46931426d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 02:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756806658; x=1757411458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VS8jFUXuJu8JiDeDzmlG9QSecm6oM4zjP0DoxNt7tcU=;
        b=M+5yrfJlB9UWUw5oGUTdZQO4uBJbH3KB2FBokg2sMM6LGUsefcDtFQ2xRkaDI/SUs0
         uUJV79LtP4zQrwxOVok8CEZQtgniKRcpHNuxAcp8NdCqN0rgzUHs/pTvQen+Hukjc5J7
         ZujhFGdy63Ak6LdI9eNC0N9sQt0qTb0zm7k4R6L4CyVTfjcQRTFpld3GREbS+0qptSa/
         LV+VLI7Slr9Grz/E0bivlsxVtd7NNELeLvUl0p8xFDGm1l9EagYtCbA889Hm/ajZ6qTk
         qify6axm6F+Be1GqtPuEGG82Bs7RTzBgLJRb+0AaEOY22fJhVOY4A6KFxv2uQpZJY4qb
         wDSg==
X-Forwarded-Encrypted: i=1; AJvYcCX6LVdstyivPiCz/oBsRgeLjuiLSMLpxj/3iCZh2euzP+nKzpqwKwveP7sBdT4fE0M9qjPI8QLBQwKbIysz@vger.kernel.org
X-Gm-Message-State: AOJu0YwCLD06N4mhnIET1+0zhGigysoAT3qV1PibB22TrS0g/4PmV7GL
	hOpYyEzw32yA0ajJkgl366/70eLG66SG6jUY0vtV04z+suv9QTQmHnKx+/BL3cjoS2gK1q3fN3V
	UYyFHqmaw8TkvQDHMsrzJfIk9kiyM3u+nnKsExrnv9OX+XuNJVed2ANRmEVXNCbEmI0Ac
X-Gm-Gg: ASbGncuemGyDgWwAidfiFDmCVaadJnKyn8yS2yl6v6ISijKMX2ZKQWJQnDGLbpG2dso
	lWrESrCPR1kUWY9jGNZ/iUI25lJJIWPqkwI13TYtURQTmDCvWZ86vhsb84cSd6Nx5ANZGZ7qi3E
	xV/nAS5b/X47cMXVhfhv4BoxjzR+Zd5EB4zGBfLBS7iRIu8C7Y6By4yudPH1e4Kl5w/lvRDvZED
	bVQjbs0vNPci7ujDX/0MXABhCLvp4bEHssBrh1qsor9AJybpAYJBkd0eb6qTjqdDMkTsnR1zRDc
	iBpsg2DwHuUObLBurTEYIS9M+rHv6DpRgs56UTz04Nx2F9CYlg2oM58aqBAw0T+MZHeVV8ltQpg
	psqhTiSSSRa/oqr87puh0CNjBOAICC4fkUm2OfZuJJ2lZXWnOFidm
X-Received: by 2002:a05:622a:38a:b0:4b2:8ac4:f09e with SMTP id d75a77b69052e-4b31ba120a6mr151877021cf.40.1756806658063;
        Tue, 02 Sep 2025 02:50:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI1gYcFOnDtwfO86fvtbDCwttIApFPz4/9POC1oskRgllyLJ+lFBLaQWgL/L6QoCI7n7hKVw==
X-Received: by 2002:a05:622a:38a:b0:4b2:8ac4:f09e with SMTP id d75a77b69052e-4b31ba120a6mr151876771cf.40.1756806657496;
        Tue, 02 Sep 2025 02:50:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560826d1209sm578672e87.19.2025.09.02.02.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:50:56 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:50:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yingying Tang <quic_yintang@quicinc.com>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yingying Tang <yintang@qti.qualcomm.com>,
        miaoqing.pan@oss.qualcomm.com,
        "stone Zhang (Stone)" <stonez@qti.qualcomm.com>,
        zhichen@qti.qualcomm.com
Subject: Re: [PATCH v8 3/3] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
Message-ID: <lfdgxbezefncmyw6euac6navuaiq25jjrrd4j3sabwjbi5adth@sx76za7f2e5a>
References: <20250828-hamoa_initial-v8-0-c9d173072a5c@oss.qualcomm.com>
 <20250828-hamoa_initial-v8-3-c9d173072a5c@oss.qualcomm.com>
 <qgirqibqvsld7n2ac4cvuvtqknhqkq535jkxnxjjqvss5wpm36@i3mbp7qgqxju>
 <1600b292-df57-4328-baa6-db6467e00096@quicinc.com>
 <wxnyux7a5raz5ltz7hpd5dp5euuwwjts2qvhvr4ksdgoye6pm5@2jxthgfwgpuf>
 <23d10901-6b8a-41fb-8cb2-e8e361093561@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23d10901-6b8a-41fb-8cb2-e8e361093561@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfXyRb+mYHY+sSP
 mfZbqKK2GHt1msSDzMrpkTBKqNK0z7fa16JQHhqgYm0ivXOOebgRYuYa0RKneVAY32LSZzB7ULM
 Y5JDWzomzDE0zRmSV8QB2PpJOrvx59WEphhUrl2ho35w7Fjkz4+wljxidRgM01ur+zZvHJhu8k7
 pK2SBog94EnpwBrfCQvU30grjsQW+JJNkjL4fOnOvIE2aUp8FZwrJBEEv7k2EcjvN9f7qLL7ayb
 ehGqHbngXovU1ysYCpnGZrLyftzQv6YFS1SQFI7KCSk4nNPyMbX25W3l5zspFWQijYKZRLhDmfr
 gTI2ToOVCNHya1Y0tBfTQDzTIXKvOqs7eQY/B2MrQYDWsc199oQ8MA59jZ/lnEf09uLhaGxio5e
 FOYkc3vS
X-Proofpoint-GUID: ujw8BM2a_weCxT4UZqBsLXQoFlk5pLml
X-Proofpoint-ORIG-GUID: ujw8BM2a_weCxT4UZqBsLXQoFlk5pLml
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6be03 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=RJ5EoE1EhMmZrhn8kTQA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On Tue, Sep 02, 2025 at 02:56:37PM +0800, Yingying Tang wrote:
> 
> 
> On 9/2/2025 10:37 AM, Dmitry Baryshkov wrote:
> > On Mon, Sep 01, 2025 at 11:02:24AM +0800, Yingying Tang wrote:
> >>
> >>
> >> On 8/28/2025 7:18 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Aug 28, 2025 at 12:48:47PM +0800, Yijie Yang wrote:
> >>>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
> >>>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
> >>>> embedded system capable of booting to UART.
> >>>>
> >>>> This change enables the following peripherals on the carrier board:
> >>>> - UART
> >>>> - On-board regulators
> >>>> - USB Type-C mux
> >>>> - Pinctrl
> >>>> - Embedded USB (EUSB) repeaters
> >>>> - NVMe
> >>>> - pmic-glink
> >>>> - USB DisplayPorts
> >>>> - Bluetooth
> >>>> - Graphic
> >>>> - Audio
> >>>>
> >>>> Written in collaboration with Quill Qi (Audio) <le.qi@oss.qualcomm.com>,
> >>>> Jie Zhang (Graphics) <quic_jiezh@quicinc.com>, Shuai Zhang (Bluetooth)
> >>>> <quic_shuaz@quicinc.com>, and Yongxing Mou (USB DisplayPorts)
> >>>> <quic_yongmou@quicinc.com>.
> >>>>
> >>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/Makefile          |    1 +
> >>>>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1247 ++++++++++++++++++++++++++++
> >>>>  2 files changed, 1248 insertions(+)
> >>>>
> >>>> +
> >>>> +	wcd938x: audio-codec {
> >>>> +		compatible = "qcom,wcd9385-codec";
> >>>> +
> >>>> +		pinctrl-0 = <&wcd_default>;
> >>>> +		pinctrl-names = "default";
> >>>> +
> >>>> +		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
> >>>> +
> >>>> +		qcom,micbias1-microvolt = <1800000>;
> >>>> +		qcom,micbias2-microvolt = <1800000>;
> >>>> +		qcom,micbias3-microvolt = <1800000>;
> >>>> +		qcom,micbias4-microvolt = <1800000>;
> >>>> +		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000
> >>>> +		500000 500000 500000 500000>;
> >>>
> >>> Other platforms use a single line here. If you don't want to do it,
> >>> align data to start from the same column rather than restarting from the
> >>> column 1.
> >>>
> >>>> +		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> >>>> +		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> >>>> +		qcom,rx-device = <&wcd_rx>;
> >>>> +		qcom,tx-device = <&wcd_tx>;
> >>>> +
> >>>> +		vdd-buck-supply = <&vreg_l15b_1p8>;
> >>>> +		vdd-rxtx-supply = <&vreg_l15b_1p8>;
> >>>> +		vdd-io-supply = <&vreg_l15b_1p8>;
> >>>> +		vdd-mic-bias-supply = <&vreg_bob1>;
> >>>> +
> >>>> +		#sound-dai-cells = <1>;
> >>>> +	};
> >>>> +
> >>>> +	wcn7850-pmu {
> >>>> +		compatible = "qcom,wcn7850-pmu";
> >>>> +
> >>>> +		vdd-supply = <&vreg_wcn_0p95>;
> >>>> +		vddio-supply = <&vreg_l15b_1p8>;
> >>>> +		vddaon-supply = <&vreg_wcn_0p95>;
> >>>> +		vdddig-supply = <&vreg_wcn_0p95>;
> >>>> +		vddrfa1p2-supply = <&vreg_wcn_1p9>;
> >>>> +		vddrfa1p8-supply = <&vreg_wcn_1p9>;
> >>>> +
> >>>> +		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> >>>
> >>> Okay, so how is WiFi controlled? Is there a GPIO? The DT should be
> >>> describing the hardware, not the UEFI behaviour.
> >>>
> >> Hi Dmitry, as I described in previous mail, On hamoa platfrom whole wifi module's power supply and enable gpio are voted in UEFI.
> >> Hamoa is PC platform, so BIOS/UEFI behavior is compatible with Windows/ACPI architecture. UEFI is responsible for enabling power supply 
> >> for all devices which may be used in boot phase (such as WLAN may be used to boot from network).
> > 
> > This is not completely relevant. You are describing driver / Linux /
> > bootloader behaviour. I asked if there is a GPIO in the hardware. If
> > there is one, please add it here.
> 
> Hi Dimitry,
> 
> During the UEFI boot phase, the WLAN enable GPIO has already been asserted, and the WLAN chip is functioning normally. 
> If we include this GPIO in the kernel device tree, when the kernel configures this GPIO, its voltage level may experience a brief glitch, which could cause the WLAN chip to reset and result in a PCIe link down.

Here you are describing driver behaviour. It's a software issue and
can be handled in the driver.

I'm asking you to describe the hardware. From the hardware perspective
there is a GPIO pin. Please describe it in the DT.

> So I didn't add wlan-en-gpio in this hamoa's device tree.
> 
> 
> 
> > 
> >>
> >> So we need not Wifi chip's power and control GPIO in kernel side, thanks 
> > 
> > What if someone requests this GPIO from userspace and pulls it down?
> > 
> >>>> +
> >>>> +		pinctrl-0 = <&wcn_bt_en>;
> >>>> +		pinctrl-names = "default";
> >>>> +
> >>>
> >>
> > 
> 

-- 
With best wishes
Dmitry

