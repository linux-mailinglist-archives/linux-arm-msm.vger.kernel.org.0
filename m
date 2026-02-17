Return-Path: <linux-arm-msm+bounces-93108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jbHjFONElGmcBwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:37:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C4A14AE75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0366D3014561
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F0F326959;
	Tue, 17 Feb 2026 10:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZIKe70w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471D5326953
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771324640; cv=none; b=ic4ldAJ1u+PsiddjEc3W07Mo+H7hA0nlX0KyySZ1AUfDnHPLcWxNaj0YBfL06kPhXEzbOpkb4mBIIvcSjKWguV9Gh+T/uw4I1Pf8Ioa8LrqL+wm4NxFd5zu4MLy3DRTPfaZLRqyTRYb9Fn8+a5dkhebFtV1ZgHk/Q2Os7c0VwYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771324640; c=relaxed/simple;
	bh=cyqpudH36Rl1oTjsQvLkzi0+BXbtNAmcVPepNGdo/Pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oDJS0dg5LXzJ1ylCHOZSLbLpOHJ97PgMQJGn6Ta/slccEIiUPKd0UYdB+/BGP0n55jUwoRPJs6NqLLUPRrujW2sHkMA+AuuWRk0I18rnjUFQIfnHM58LGnYm/j6Xclz4bbR8+vyi1jxqqxla+mlk7gCh1HSXteln9nMkMrx+G5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZIKe70w; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a962230847so34082675ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 02:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771324638; x=1771929438; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uOJrEXGi+rryfJ8hmyQxu2YszelpcUca+qvpaKXUgHA=;
        b=YZIKe70wKH08y9qpsZIAS3tFPYCoiGoj7OwT7NCEgDVReIGTWrfWL412IBVk56HSyA
         O5h7Bg0HQW6nWv30Mde4jVTLg05LSXlI6fDsJ2dI/ZHbIVOzXxsC9ng2FhKQYtkxWORK
         zNb695tZmGup1TxIrF6Hk9+IyYHNs/Yrt+MDOZpZ+rGEHWW3RU1g86kY7s4F6p4c+ZQs
         u1W2jVjBaY634lIQN/qhr5FIxC0l8hTLz/K7y1+6/kVMQLnp92pdD+/ZUlS/9x7OIFNB
         2cEzIu5Sb2WZtKD8Ar0AatKj8SGsfksLawmWRtVqU+aLdavGjZ81mSBIgkf8PpjH/4Yv
         GXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771324638; x=1771929438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOJrEXGi+rryfJ8hmyQxu2YszelpcUca+qvpaKXUgHA=;
        b=eY0XYZYS/rRm/lDVyXjMae3AiEj8dG/UKHWrYgZ1Iy9lgpGvvo5eJnJvPv/H5EBrAV
         kiIRFCh3JiY6Ylwtz4L4fb4lJCy8pLQSRwzw9FO3EoNT0i1HlwmNAYdm/vRRvPGtT+lE
         ZuH/DFvCEFR1XNqNfoVobctF1NGjX6P4wcawBJpkeFjFou8htuCBFGFUwtT+Czsk2gtG
         qtfQn2dP4uj7EsQZWDSa9LObi1VNQ33DE98vgaZJ3lsnAN5qinsWyP12nBJOGbVNAdR0
         Apkl8Nu5sd41GfwBv3YsRT8E5UrXH59QuyVzQUpKtsKR3o9vtRyo/Vb7+nGQA1/xq8tN
         Ef9w==
X-Forwarded-Encrypted: i=1; AJvYcCVCCNEh8bp7skEnb/Grg9Ru6uxODK933KRXjce17gnC9SNlJPdEcQjzxTa8n0cu+vw6dUMzecoaxOaWl2So@vger.kernel.org
X-Gm-Message-State: AOJu0YxaAF75xX2feobh2ro3JxeFsXxftNpOxWK74JIGCelCypDxfmSr
	wUxteuOmHwzzyKIxpWsLRxBX6uaZbCo4aO9avIOTgUL031RqxrEarFca
X-Gm-Gg: AZuq6aLVS/5rXF9TRbqBJGoA/mCwJ0OpJwcVJ1po0KBn5BqMBqgAmNrxN3EWCSx/2Q5
	oSXutlds9Lgm6NDSmbg60sVyjBLRkWnfKgatwRSdhZXSEaE0iJ+9CRyUMnybaCvwjkNX/x9FUNp
	FyuTE9uCG6QGTfa0+q0xKh8ggUz/qG5UH+AC5KBQrSGmxO37GNyo0a8uKvJTUYYmFKJSFjPXXgF
	ZY3YtGIxaNvlVBOqAkVmfjCNA4CUdGqZpvmTi0DRhzD2TNS1A1lAJvRJtpSm0jvfAodJNgRB10s
	zWZe7eNKdUo6KmUJCu6CUJ2cWyU/eTL2KHxW8E3DsUOPCtxurBVykRNr0DKIAsQr8XIFbo6+gXq
	QopDLE0S5qT6XMnT4qkFDYHPv3yYNbBMgqU1S6RZR8D3f4zUEhLj0InuJaFJwGOSOepOddIZH/I
	wNk6bx2/JmCHxoQcJfRYYF74WV15pAOTpwKLQz/YCYsq4fwQ==
X-Received: by 2002:a17:903:b07:b0:2a0:8be7:e3d7 with SMTP id d9443c01a7336-2ab50606c6emr118697085ad.57.1771324638560;
        Tue, 17 Feb 2026 02:37:18 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d58dcsm95276565ad.48.2026.02.17.02.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 02:37:18 -0800 (PST)
Message-ID: <0b86181b-44a2-4d06-8e32-eab76b79a31a@gmail.com>
Date: Tue, 17 Feb 2026 16:07:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/3] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260211042534.162007-1-tessolveupstream@gmail.com>
 <20260211042534.162007-4-tessolveupstream@gmail.com>
 <nplo7goccggnzfq4244rziaa2c367r5ki73irrjtvqio2362bl@7b5xfxboc7sa>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <nplo7goccggnzfq4244rziaa2c367r5ki73irrjtvqio2362bl@7b5xfxboc7sa>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93108-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_PROHIBIT(0.00)[1.23.142.104:email];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 94C4A14AE75
X-Rspamd-Action: no action



On 11-02-2026 11:46, Dmitry Baryshkov wrote:
> On Wed, Feb 11, 2026 at 09:55:34AM +0530, Sudarshan Shetty wrote:
>> Add the device tree for the QCS615-based Talos EVK platform. The
>> platform is composed of a System-on-Module following the SMARC
>> standard, and a Carrier Board.
>>
>> The Carrier Board supports several display configurations, HDMI and
>> LVDS. Both configurations use the same base hardware, with the display
>> selection controlled by a DIP switch.
>>
>> Use a DTBO file, talos-evk-lvds-auo,g133han01.dtso, which defines an
>> overlay that disables HDMI and adds LVDS. The DTs file talos-evk
>> can describe the HDMI display configurations.
>>
>> According to the hardware design and vendor guidance, the WiFi PA
>> supplies VDD_PA_A and VDD_PA_B only need to be enabled at the same time
>> as asserting WLAN_EN.
>>
>> On this platform, WiFi enablement is controlled via the WLAN_EN GPIO
>> (GPIO84), which also drives the VDD_PA_A and VDD_PA_B power enables.
>> Remove the VDD_PA_A and VDD_PA_B regulator nodes from the device tree
>> and rely on WLAN_EN to enable WiFi functionality.
>>
>> The initial device tree includes support for:
>> - CPU and memory
>> - UART
>> - GPIOs
>> - Regulators
>> - PMIC
>> - Early console
>> - AT24MAC602 EEPROM
>> - MCP2515 SPI to CAN
>> - ADV7535 DSI-to-HDMI bridge
>> - DisplayPort interface
>> - SN65DSI84ZXHR DSI-to-LVDS bridge
>> - Wi-Fi/BT
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |   6 +
>>  arch/arm64/boot/dts/qcom/qcs615-ride.dts      |   4 +-
>>  .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 131 ++++
>>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 609 ++++++++++++++++++
>>  .../dts/qcom/talos-evk-usb1-peripheral.dtso   |  10 +
>>  arch/arm64/boot/dts/qcom/talos-evk.dts        | 139 ++++
>>  arch/arm64/boot/dts/qcom/talos.dtsi           |   8 +-
>>  7 files changed, 901 insertions(+), 6 deletions(-)
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index 0ca6b50a6de1..a5f763cf1a55 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -609,7 +609,7 @@ bluetooth {
>>  	};
>>  };
>>  
>> -&usb_hsphy_1 {
>> +&usb_1_hsphy {
>>  	vdd-supply = <&vreg_l5a>;
>>  	vdda-pll-supply = <&vreg_l12a>;
>>  	vdda-phy-dpdm-supply = <&vreg_l13a>;
>> @@ -632,7 +632,7 @@ &usb_1_dwc3 {
>>  	dr_mode = "peripheral";
>>  };
>>  
>> -&usb_hsphy_2 {
>> +&usb_2_hsphy {
>>  	vdd-supply = <&vreg_l5a>;
>>  	vdda-pll-supply = <&vreg_l12a>;
>>  	vdda-phy-dpdm-supply = <&vreg_l13a>;
> 
> Wait... What is going on? This is supposed to be a part of the previous
> patch!
>

Apologies for the oversight. That change was mistakenly split from the previous 
patch during preparation of the series.
Thank you for pointing it out. I have corrected the patch set accordingly and 
will resend the updated version shortly.
 
> 
>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>> index c7dc507a50b5..cb32bfe732fb 100644
>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>> @@ -4304,7 +4304,7 @@ osm_l3: interconnect@18321000 {
>>  			#interconnect-cells = <1>;
>>  		};
>>  
>> -		usb_hsphy_1: phy@88e2000 {
>> +		usb_1_hsphy: phy@88e2000 {
>>  			compatible = "qcom,qcs615-qusb2-phy";
>>  			reg = <0x0 0x88e2000 0x0 0x180>;
>>  
>> @@ -4319,7 +4319,7 @@ usb_hsphy_1: phy@88e2000 {
>>  			status = "disabled";
>>  		};
>>  
>> -		usb_hsphy_2: phy@88e3000 {
>> +		usb_2_hsphy: phy@88e3000 {
>>  			compatible = "qcom,qcs615-qusb2-phy";
>>  			reg = <0x0 0x088e3000 0x0 0x180>;
>>  
>> @@ -4412,7 +4412,7 @@ usb_1_dwc3: usb@a600000 {
>>  				iommus = <&apps_smmu 0x140 0x0>;
>>  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
>>  
>> -				phys = <&usb_hsphy_1>, <&usb_qmpphy>;
>> +				phys = <&usb_1_hsphy>, <&usb_qmpphy>;
>>  				phy-names = "usb2-phy", "usb3-phy";
>>  
>>  				snps,dis-u1-entry-quirk;
>> @@ -4476,7 +4476,7 @@ usb_2_dwc3: usb@a800000 {
>>  				iommus = <&apps_smmu 0xe0 0x0>;
>>  				interrupts = <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>;
>>  
>> -				phys = <&usb_hsphy_2>;
>> +				phys = <&usb_2_hsphy>;
>>  				phy-names = "usb2-phy";
>>  
>>  				snps,dis_u2_susphy_quirk;
> 
> ... And this.
> 


