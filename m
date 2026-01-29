Return-Path: <linux-arm-msm+bounces-91140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLAaNywke2nXBgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 10:11:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4810CADF3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 10:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3284830138A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 09:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86916376BDD;
	Thu, 29 Jan 2026 09:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5OXmsek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D727B50F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677864; cv=none; b=dPM59Dlts/qgbJwdVQbs+gtJHgc77mf+kUzmlaJuZZg+ycpFQQSINcvZm+i21vcmFn+XmEmXmBJQtKM/jqQWQt1WNNI6W/f38OIEfWRCtnoQQsaXy3ju4CM5haFZiyO8ai0JQBCSj25e5KJg/sYRMAbrWfzMAOBXQdGAVQZQUKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677864; c=relaxed/simple;
	bh=AYOs/LhIpS1QbFW/wJR/DWvbUY+aRCU/JaMpxZiwGvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oCt7+tTa8TXszNAGsDvj96OIPwY0aFDF0m4jOlOTeYawmBQAl3JzIgnFzg1yxfWtdNNgMB7DxQOsPEa7izAdUG5Io4eqUuOXwm6ZfsKNpfwmoNStQRBQl9W207nC0YzRtahZ2SmS7w7J/UEpkfz2T4LUCToCvm5suC+jBz5e51E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5OXmsek; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29efd139227so4757065ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 01:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769677862; x=1770282662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RsxZVDoaeUk3c8W7bg+2od0RNsPRBc+p9ugPkxBtaco=;
        b=i5OXmsekJSdR2g84RTSWxhvUk6wTInLncSXswQNKB0ZpysJfBA5l/O/CFNbrqRQIGQ
         OvUz4U0a/4iQ9v/mfrz5oJokWqCsps/gFlytwU59V487mP8jrCIN7SOec15aui80vdcA
         FCiQmLQmbhtaPTlr3JXChwpasw0uDzc/pqclQwXGk4V5CaBXN/NzAPI48xBak6afiwCi
         SrQir2DsUhQFCbNkkiPYGzNqmI5YHNAdwZq9sX2lF63QEQa6123gZ7m9rqhYTJzkrIve
         FKXjN+sWGVKbCjbrwNmpY/1ewCLovl65XpvYeWx3tpk/RPUUhmqp2FQBPJMw7nHhSPk+
         HTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769677862; x=1770282662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsxZVDoaeUk3c8W7bg+2od0RNsPRBc+p9ugPkxBtaco=;
        b=tc7406k2O7v/sFeN2Bbj/SFHUwTwqjkX6doo3Urc1NhtoDA8bHen67sH8xKbveHThw
         iBIuu7Ba4wztTDF089WfjOoMRPdvFXyc0+vIlsEq8RF4tMi7nxGrMSDNb6LkaZTmgrqQ
         YyqfUvpKTFOTPQ1emS6DBgMU8gPeQAqcbQFeivWUUM4e8WugM9ZA0OSzk4WDOLEgqc9N
         vLbkTH/tJqaaRs0p7HPs2dCVcyyX7EmA5c4LYcnq5KiPsIkJLwuEzGkwD3k8wS6HjNtk
         elxr9UI5Mw5+VA403Zia0znABiWTVZdEhUrtg2fMceZi4ns6Qz9iYTfhx5mpe0Qlb/ZW
         RI5g==
X-Forwarded-Encrypted: i=1; AJvYcCVVmcy4JT1zDbUEGFne7TpIWrkhXC0aVS32t52QziXs/N6sH5BO5AU+9I5eAMv5CekrS9fuL3E0pZert4WY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8b+Dh77kEthYm6x41K1r2wqNY2n5dsFwoVrwifINneeJQgfFd
	PqIvL3+Jz71hcYc7clx1K/W9Y6lFYyydQDAaHGSjV0DDFhUCi9I4iXkf
X-Gm-Gg: AZuq6aIx/f4q7dxXLDVNKedw9cDM9e8AwRSroqi7ZlHCU0WZpBV1uEhDEAyNY4IcKpB
	8ng6nOB+SxYR249h5nhlPcgrFYL3x2FnXmeLY3rXst3aheruJQj0QHHtx7at7holtkTa+NLC/RW
	kS+p355NaJMXmLGGw/BbVRDsFOrzYNfxHrtfen0Gcx1zdxCvVySFI6z+0RbtBadXXwXKBrr+bCz
	gPIiZ6Fc28pMAhxgybkt3yuexQq7RSnR95yDCQSADyG2XnUsUxpg2aQv3AEeUyAKvO+TXEDmykN
	5JxFp2ScS0KdosmgmiFIAFUNRVzajPVxTEsQl4VPBB9wa/ApN/XYRgTA6If1a13PPRiuqVlMgTU
	mkZ3fH87hsmyWisO9jqhj+kfPWoQuUNnKW3n6jKO1SlR15ThmDos1Q9n10IMxYUZVfLqOUAy8Np
	yCwBwVwdo2m78wC3FHUAu7VXe5yhZ/R+bP4g==
X-Received: by 2002:a17:902:ce8e:b0:29e:a615:f508 with SMTP id d9443c01a7336-2a870e34a96mr80533085ad.28.1769677862376;
        Thu, 29 Jan 2026 01:11:02 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b415b01sm43645235ad.40.2026.01.29.01.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 01:11:01 -0800 (PST)
Message-ID: <2c59e43f-aee1-4ddb-88dc-1bbf6287c926@gmail.com>
Date: Thu, 29 Jan 2026 14:41:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/3] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260114100043.1310164-1-tessolveupstream@gmail.com>
 <20260114100043.1310164-4-tessolveupstream@gmail.com>
 <5102252a-0f50-4ee9-97b4-a90859a33b2b@oss.qualcomm.com>
 <128a5f86-dd3f-4e5e-a55f-3c8b5993779b@gmail.com>
 <5c5oalpne2xedc42yomtur3lo7vvdyncgs7yd46xw4nvi6pzbd@vcjz3wsyjd3c>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <5c5oalpne2xedc42yomtur3lo7vvdyncgs7yd46xw4nvi6pzbd@vcjz3wsyjd3c>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-91140-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4810CADF3B
X-Rspamd-Action: no action



On 16-01-2026 13:24, Dmitry Baryshkov wrote:
> On Fri, Jan 16, 2026 at 11:25:50AM +0530, tessolveupstream@gmail.com wrote:
>>
>>
>> On 15-01-2026 07:54, Jie Gan wrote:
>>>
>>>
>>> On 1/14/2026 6:00 PM, Sudarshan Shetty wrote:
>>>> Add the device tree for the QCS615-based Talos EVK platform. The
>>>> platform is composed of a System-on-Module following the SMARC
>>>> standard, and a Carrier Board.
>>>>
>>>> The Carrier Board supports several display configurations, HDMI and
>>>> LVDS. Both configurations use the same base hardware, with the display
>>>> selection controlled by a DIP switch.
>>>>
>>>> Use a DTBO file, talos-evk-lvds-auo,g133han01.dtso, which defines an
>>>> overlay that disables HDMI and adds LVDS. The DTs file talos-evk
>>>> can describe the HDMI display configurations.
>>>>
>>>> The initial device tree includes support for:
>>>> - CPU and memory
>>>> - UART
>>>> - GPIOs
>>>> - Regulators
>>>> - PMIC
>>>> - Early console
>>>> - AT24MAC602 EEPROM
>>>> - MCP2515 SPI to CAN
>>>> - ADV7535 DSI-to-HDMI bridge
>>>> - DisplayPort interface
>>>> - SN65DSI84ZXHR DSI-to-LVDS bridge
>>>> - Wi-Fi/BT
>>>>
> 
>>>> +
>>>> +&usb_1 {
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&usb_1_dwc3 {
>>>> +    dr_mode = "host";
>>>> +};
>>>> +
>>>> +&usb_hsphy_1 {
>>>> +    vdd-supply = <&vreg_l5a>;
>>>> +    vdda-pll-supply = <&vreg_l12a>;
>>>> +    vdda-phy-dpdm-supply = <&vreg_l13a>;
>>>> +
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&usb_2 {
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&usb_2_dwc3 {
>>>> +    dr_mode = "host";
>>>> +};
>>>
>>> Both usb devices have been configured to host mode, do we need adb?
>>> The adb only work with usb peripheral mode.
>>>
>>
>> This topic was discussed previously, and the fix was implemented 
>> based on that discussion.
>> For reference, I’m sharing the earlier communication in the 
>> links below.
>>
>> https://lore.kernel.org/all/qq4aak33bn3mqxd2edu6zgkkshby63mmitg7zqkly2rj4c2lh7@4s7sndb7e2jr/T/#meaa464a4e6992b36b5d8d41ddc691ee4ea36b1ce
>>
>> https://lore.kernel.org/all/20251014120223.1914790-1-tessolveupstream@gmail.com/T/#t
> 
> Neither of these links is relevant to the question.
> 

In our hardware design, the USB0 controller is a USB 3.0-capable 
controller whose high‑speed (HS) differential lines are routed through 
a mechanical switch.

a) During EDL (flashing) mode:
   The HS lines are explicitly routed to the Micro‑USB port. 
   This allows the SoC to enter "device mode" for firmware flashing.

b) After EDL completes (normal operation):
   The mechanical switch is driven to route the HS signals to the on‑
   board USB 3.0 hub.
   The hub connects to four Type-A ports, all designed for host mode 
   only.
   The Micro-USB connector is now electrically disconnected.

Why host-only mode: Once the switch routes to the hub, there's no 
electrical path back to the Micro-USB port. The USB controller can 
only talk to the hub and its downstream Type-A ports, which are wired 
for host mode only. Device mode is physically impossible in this 
configuration.
Therefore, USB0 must be configured as host-only in the device tree, 
since device mode cannot work after the system boots.
 
The USB1 controller supports USB 2.0 and has its data lines directly 
routed to a Type-A connector. This hardware design restricts the 
controller to host-only operation, preventing any peripheral/device 
mode functionality.
> 


