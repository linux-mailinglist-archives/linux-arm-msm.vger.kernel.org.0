Return-Path: <linux-arm-msm+bounces-87055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1A9CEB4F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 06:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80C233021E52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 05:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED1C30FF2A;
	Wed, 31 Dec 2025 05:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkSI7ssW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PqRAGHLs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CA42E285C
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 05:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767160202; cv=none; b=owBeBH9ezUjfxqSJA4TaJZY9ye6GE1Xr0p0YGpFaUrl7VCpI2JLkZ8QIwjFJgjmIoKLqZR9pTqFQiyXKhYD9NokCDpRM8aJWlQR6fRU9ujlMCMnyonx4ttOzaT5Mob6nOGNQLhEP2cKWi/SWxyKjGsWF++v7+3O3/CBRS4NQsUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767160202; c=relaxed/simple;
	bh=K5u+eRWd7fSWKZVrVjHpRwBJeW28aH7Jd12NZ+vtvZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7hYtw2iy9uUfH6wCMpCWZWeeC5SuAiqhdCVny7/U54SnzVKZtInRlmVbPWZnGV+SilLNRX7ywfzG5zF4/fvsczJq2JWtXhl1H7EHLYpfRF34NUo2Z0vCKQ7UGNeX/AdCdOjbbUljgiOHMk/TFRIIa9wbYhZ4qg2K7uXamAVFeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkSI7ssW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PqRAGHLs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV12OF13971194
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 05:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1zxkjFyeB6W9vaIK/85qvGukvVA2Gg9ekN87KzDrwBE=; b=fkSI7ssWln79ZN54
	31hin3PwHF0DEMjtP/Z/wKXLGnXr4CdmaJipEg7ps3y/X3SkHRvwLQKKjoH8GutN
	r8l7wtc5kIjNvtBTBKaXH+dTGschJl52D3HPXmy5OeGFJVX7ZGQZgEb+qKJ8EhOR
	xcZlu83UiOpzDtyI6L6iJ+2e5FW3R6l7b9OtqO4nXNPIemoG1X4i3tjDw10VFSYG
	/2hG/5dtyv/q3WBFiXOkfz2KlZ3e1QAdwu9znObKVsUl/2CkpiBIKsi6OMZ5OEM4
	Iaa82SOIBI4tRkBYl6bImadcZvDqzyjx8BN1oDGP22Y7+VPCdhBg5S4ZIF0WB243
	uBEJpQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcdky209e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 05:49:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b952a966d7so21532375b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 21:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767160198; x=1767764998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1zxkjFyeB6W9vaIK/85qvGukvVA2Gg9ekN87KzDrwBE=;
        b=PqRAGHLsSEFWJZbWaAr0vCTJGSYNR6irR5EJpcyFVLoqn7LVoDQbetQRy4jW/EYH3T
         EK1Cobj4Bn5cfZeDKY5LvRN3+baUAuUnRyLpKwEusPnMbbEispsD1HdeaYqgYytzMl+1
         flQRPXSHjwoatiYfQprJmzBpAVqwW034owSoPd5bTX5ISmMetEPbzi7rYbOL0Q0NkaL4
         c7pJM29B9fQrtKISGkWOPWabZ5gaJCtol+httVawTKnzp46zSG/GEoQaxoy11Vvj2rEB
         pydsUWl4YhHCxlAURnEQOYUYk6WTv0m4WCbrnXp66kMoAx90y0hMpliP25CBDFGQkOd8
         Fh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767160198; x=1767764998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zxkjFyeB6W9vaIK/85qvGukvVA2Gg9ekN87KzDrwBE=;
        b=RX9P9oHgaNBLYB2EhQDGHylFbtoMkmmJ5bZ/bIOYj4oq9d4ug3pPfjxxf39t4Dylsq
         tjqb7RPvv78pDZmLZl6LL7fGXL/oPfD7T2XQy7rHEi0e9HNh1jhQpEc6jMQ3KT8ZPg8g
         k4yyTLPe6KsKZ1JKMnNTuyyFuEU+yLY+9qxUeu7cniF79sOqqJxF8NchU1dcB1N/l1lC
         eIyIXP5RfYfsV4Q98gDIzM4rKXvQ2QpJa4G2ZEYu7PjDgHA0oaILjLbpr+HV0Q8UMsIv
         U02N1AFsFy7QCkYbhLJWNJYZQfaN+2DLn4PhQrSOyc7Rq8hy2Bb2EVcd0lJfdKWpbITy
         5uaA==
X-Forwarded-Encrypted: i=1; AJvYcCUbPGa/J4jAHcQ4DtsBGlE8QhrZurb1wLQVzNqNS0l6So6c5O7XM6sPfuqWRPgk500tuij9jbpWTmc4x0EQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5InZ/cDPG06LMqX8Y1lXpjlvO3gTNraVP1SAJclfdCdQw11sc
	3LK6pEKAl4i3dNZRlkoRoq+YEXhOE+Mep+4++PLYUr24RY+zNM4Dg6SVE2KnYP1BCXV/n2NTHGm
	w0IwkCDJtDPIqQtXz53RdxNr1vA23nwRuCHLU1FfVjmILY7tZRRQFPfdGn9MMrnA4FkzA
X-Gm-Gg: AY/fxX7B+k6wZoD+lyDTl4LWbq1BpQ3QW87C7/WEQSA51h0TfOdXWbPpptTfN0hy0Tb
	HXuwzUKz03Td4bo0Gh4WV43rM9ngiO/uELi2AKuWREMID39+DeZikGlJ0Bju6dcgANzDZ2pGhpI
	ExBmwpp5TMY+JgaB5I1lUwfVG8B/OLPeMsae4JmvCEuNP0TnzVJTwILZolIgXRnnqjMm07BiaSJ
	XXHx5UXzI2Dm9inhLB0a/Nc6+C3AlciMu1eDS7U5bfJU5C+vSvn20QDxahJsgKwq3JYJZGe0Wig
	th/1hnW7WHDbkJwgZ9CbPXQWoTe+qriKyECqoJUH1WpoAIrfCuxkWr9o9Lcxe6z7CTsPg9Kmd+S
	p2RjSde3/Lw6hrzL9CaCbIY9KKH4LqgRRvgdQjEOp2g==
X-Received: by 2002:a05:6a00:f99:b0:7e8:43f5:bd20 with SMTP id d2e1a72fcca58-7ff6735e9b3mr34201474b3a.53.1767160198363;
        Tue, 30 Dec 2025 21:49:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhDAAd4FXIRm+uxCsatqItAfqk+HxTSDykvgup7HvRPE9rMtXU1lYciJQd0KxdGdeqqlJqSg==
X-Received: by 2002:a05:6a00:f99:b0:7e8:43f5:bd20 with SMTP id d2e1a72fcca58-7ff6735e9b3mr34201448b3a.53.1767160197751;
        Tue, 30 Dec 2025 21:49:57 -0800 (PST)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a19d8sm33944978b3a.42.2025.12.30.21.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 21:49:57 -0800 (PST)
Message-ID: <793dafa1-43bb-49c4-9e05-cfb597ba39c6@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 11:19:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] serial: qcom-geni: Enable PM runtime for serial
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
 <20251110101043.2108414-4-praveen.talari@oss.qualcomm.com>
 <2zeqt3tu36qcxs6xrzqqmn3ssmyzetl6tq6lxrjdvt5dhxrtv4@g5q4zhk4sebs>
 <8c734f2d-59db-4815-bfc6-3823cf3ef37a@oss.qualcomm.com>
 <25f3e3c0-7796-4318-b479-a680b878528a@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <25f3e3c0-7796-4318-b479-a680b878528a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA0NyBTYWx0ZWRfXxt9YQiqyqHf4
 TMwtP6gDVJKTP6ZFCdCC7O+ltvNliOYjktYHKOcW9uIaayHXckw1mihRM0yrqZzl/olpkO5ctQL
 DG8Sz6AHXovMOuILG5md8k5YF5D6VNFQEXvLlCUeh298f17kof6s3bVcMG/i4g6qOMesjTiHLRr
 U3iuYu1adhmfZIuaOZeEsAZZotIInL9e3AzX4i/T2oQGrRo9LJoJbNcVEfwgKGylvP0ckUdD1xT
 BwHMyrnJDwj9xaMs9o4+sud/kjFkO1HoLp/ibhjO4i3gC8WJw+vE6Td0BbEBnS5XYj7RjEuLPXf
 EvmxoHxxz2SFkow3jo1lD+ASnIG0d/ErgfoGcXBgY9s1HwgI1PCk5F5otJAapbuUZBfh+KW/tv7
 qGWPylYvMHVU2a5yatu8vPIDgMNSMsJ3l6iMaN9kpMMwnfxIyrbCgBmzEoTfrhi5hXNSZ6qa51A
 975dxQINTzjHQUMzSUA==
X-Authority-Analysis: v=2.4 cv=Wskm8Nfv c=1 sm=1 tr=0 ts=6954b987 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Q2HD4d10TjE189mA8KgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 22zXo1ez49CRr_YSL3GEasRponEX2GBF
X-Proofpoint-ORIG-GUID: 22zXo1ez49CRr_YSL3GEasRponEX2GBF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310047

Hi Dmitry,

On 12/31/2025 8:30 AM, Dmitry Baryshkov wrote:
> On 31/12/2025 05:00, Praveen Talari wrote:
>> Hi Dmitry,
>>
>> On 12/30/2025 11:53 PM, Dmitry Baryshkov wrote:
>>> On Mon, Nov 10, 2025 at 03:40:42PM +0530, Praveen Talari wrote:
>>>> The GENI serial driver currently handles power resource management
>>>> through calls to the statically defined geni_serial_resources_on() and
>>>> geni_serial_resources_off() functions. This approach reduces modularity
>>>> and limits support for platforms with diverse power management
>>>> mechanisms, including resource managed by firmware.
>>>>
>>>> Improve modularity and enable better integration with platform-specific
>>>> power management, introduce support for runtime PM. Use
>>>> pm_runtime_resume_and_get() and pm_runtime_put_sync() within the
>>>> qcom_geni_serial_pm() callback to control resource power state
>>>> transitions based on UART power state changes.
>>>>
>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>> ---
>>>>   drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++++++++++++--
>>>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>>>
>>>
>>> This breaks BT support on the Qualcomm RB2 platform. With this patch
>>> applied, I'm getting the following:
>>>
>>> root@qcom-armv8a:~# dmesg | grep tty\\\|hci0
>>> [    0.000000] Kernel command line:  ignore_loglevel 
>>> console=ttyMSM0,115200n8 earlycon root=PARTLABEL=rootfs rootwait 
>>> systemd.mask=pd-mapper.service -- 
>>> androidboot.bootdevice=4744000.sdhci androidboot.serialno=2b89b520 
>>> androidboot.baseband=apq 
>>> msm_drm.dsi_display0=qcom,mdss_dsi_ext_bridge_1080p:
>>> [    4.074354] 4a8c000.serial: ttyHS1 at MMIO 0x4a8c000 (irq = 140, 
>>> base_baud = 0) is a MSM
>>> [    4.099410] serial serial0: tty port ttyHS1 registered
>>> [    4.131200] Bluetooth: hci0: setting up wcn399x
>>> [    4.149847] 4a90000.serial: ttyMSM0 at MMIO 0x4a90000 (irq = 142, 
>>> base_baud = 0) is a MSM
>>> [    4.229099] printk: legacy console [ttyMSM0] enabled
>>> [    6.499519] Bluetooth: hci0: command 0xfc00 tx timeout
>>> [    6.514347] Bluetooth: hci0: Reading QCA version information 
>>> failed (-110)
>>> [    6.559933] Bluetooth: hci0: Retry BT power ON:0
>>> [    8.016330] systemd[1]: Created slice Slice /system/getty.
>>> [    8.066194] systemd[1]: Created slice Slice /system/serial-getty.
>>> [    8.148389] systemd[1]: Expecting device /dev/ttyMSM0...
>>> [    8.956804] Bluetooth: hci0: command 0xfc00 tx timeout
>>> [    8.962447] Bluetooth: hci0: Reading QCA version information 
>>> failed (-110)
>>> [    8.976917] Bluetooth: hci0: Retry BT power ON:1
>>> [   11.296715] Bluetooth: hci0: command 0xfc00 tx timeout
>>> [   11.302340] Bluetooth: hci0: Reading QCA version information 
>>> failed (-110)
>>> [   11.309534] Bluetooth: hci0: Retry BT power ON:2
>>> [   13.660078] Bluetooth: hci0: command 0xfc00 tx timeout
>>> [   13.665814] Bluetooth: hci0: Reading QCA version information 
>>> failed (-110)
>>
>> Sure, will check and update.
>>
>> If possible, can you share what is DT filename for RB2.
> 
> qrb4210-rb2.dts

Can you please try below change on target since i didn't get target yet?

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts 
b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 0cd36c54632f..5f8613150bdd 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -694,7 +694,7 @@ sdc2_card_det_n: sd-card-det-n-state {

  &uart3 {
         interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
-                             <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
+                             <&tlmm 11 IRQ_TYPE_EDGE_FALLING>;
         pinctrl-0 = <&uart3_default>;
         pinctrl-1 = <&uart3_sleep>;
         pinctrl-names = "default", "sleep";

Thanks,
Praveen Talari

> 
>>
>> Earlier I had validated on RB1 and Kodiak.
>>
>> Thanks,
>> Praveen
>>
>>>
>>> After reverting the next and this patches, BT is back to normal:
>>>
>>> [    4.067201] 4a8c000.serial: ttyHS1 at MMIO 0x4a8c000 (irq = 140, 
>>> base_baud = 0) is a MSM
>>> [    4.082426] serial serial0: tty port ttyHS1 registered
>>> [    4.106122] 4a90000.serial: ttyMSM0 at MMIO 0x4a90000 (irq = 142, 
>>> base_baud = 0) is a MSM
>>> [    4.108647] Bluetooth: hci0: setting up wcn399x
>>> [    4.125371] printk: legacy console [ttyMSM0] enabled
>>> [    4.445205] Bluetooth: hci0: QCA Product ID   :0x0000000a
>>> [    4.450927] Bluetooth: hci0: QCA SOC Version  :0x40020150
>>> [    4.456470] Bluetooth: hci0: QCA ROM Version  :0x00000201
>>> [    4.462006] Bluetooth: hci0: QCA Patch Version:0x00000001
>>> [    4.509408] Bluetooth: hci0: QCA controller version 0x01500201
>>> [    4.515656] Bluetooth: hci0: QCA Downloading qca/apbtfw11.tlv
>>> [    5.488739] Bluetooth: hci0: QCA Downloading qca/apnv11.bin
>>> [    5.671740] Bluetooth: hci0: QCA setup on UART is completed
>>> [    7.993368] systemd[1]: Created slice Slice /system/getty.
>>> [    8.045612] systemd[1]: Created slice Slice /system/serial-getty.
>>> [    8.125418] systemd[1]: Expecting device /dev/ttyMSM0...
>>>
>>>
> 
> 


