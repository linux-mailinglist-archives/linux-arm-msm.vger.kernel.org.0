Return-Path: <linux-arm-msm+bounces-70470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF72B3270E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 08:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5245B4E03FC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 06:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632441E1E16;
	Sat, 23 Aug 2025 06:23:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F451C8603;
	Sat, 23 Aug 2025 06:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755930195; cv=none; b=WAWbzSdZHy+2NFs5kOaRLsEV1EcWVUFJvntKro5VpveUBMy4HhlsFe/W7BJvmPfKwpILoQ2kMFb0c1bGKwKnj6u8aFBsyrxKbbqSOsJeamQ3We3gtL9M9Sk2mUy0MIiUwdodAt+Mq/APJog2E+4Er4Fg5AznLUI2vRs0qPO+Um0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755930195; c=relaxed/simple;
	bh=pxtuM2KduD/5E9Yb8epMJNKjkVtMUdpzmbtrHtrzG3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GRsOjYWvXdyEP4BXJ7zEv/UMgu2vhmueKy8psmSqnf5V4ZYeuwvgmO3qkLzCB+HillA2aydzuwjF4Q2Q26NMRLmh5knmJFoCNtLHIgWTEmY5SvA0OecyPqJnMCSeOmcRk3W4ymfgPKMBhw7tLD+1+kxrkgIqEFVGWa8CNk9StWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpsz9t1755930178tc48283da
X-QQ-Originating-IP: x7xbIcyyCo1zpsoslknfihpVyI0pGLbFhwMzREaCDhM=
Received: from [127.0.0.1] ( [183.15.207.239])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 23 Aug 2025 14:22:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7341857350164985269
Message-ID: <8A7C126C22789C9B+f30def47-302a-45ee-8f76-64ef277f773f@radxa.com>
Date: Sat, 23 Aug 2025 14:22:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document default phy mode
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
 <20250821-topic-x1e80100-hdmi-v1-1-f14ad9430e88@linaro.org>
 <yc7ceoq3bn3lkxdwkrk64ecubej64vblpwlwzyj5cuep2wmjui@nln2t2yicu7o>
 <018751b8-8b9c-4966-94e2-f3ec8625f87d@linaro.org>
From: Xilin Wu <sophon@radxa.com>
Content-Language: en-US
In-Reply-To: <018751b8-8b9c-4966-94e2-f3ec8625f87d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NcJjCMiwxJCEmHIE+6tsCg7Er+yYnK/Ax17qDLGANx3xGkz1K5U7qomB
	cLBC+o6p5yRIvtKObXHvYK8dF6sReKOywUMxJ05BJPVAL9Z8tesPXTR/+9tIKlYM94Kd6If
	CFR+rsvbvnFNLQl8NwmZxxgtbRnAQCfzTL/SxmF6wtSI2I1MBO91+zVl75wFacknBypH4sE
	54g/k65SfFKxBpUvRTfxriJulbiZCzac8PewxydKHK9m+8FvV8W9nydw5nW/YhoF231tlQV
	IAQkvkIUana748YyxDPDAhBiLH6yU0iRd3EIkmmuuFxMSulaiy6hwpDJbaMTKGJMZzvX54r
	JyuSn/P60R235926k4u6SpYQ13r6Q+uS1qmE9F7SrG7WZCQrqdK3QnTNEErVJSb0RCLvs/E
	yERu0REI2+K2cikPzoHcK4+tQedjzZXJ8KaaP1D0Pp5hMkuoWMYv0YiQUechGeF8EqJ6Hpv
	XUSUcJUJLUOb4xF2MLlImUCbrE0mltGgasT8vJXUpMy9KAWMf4t8RpmfIpzzBAOiWRxxig1
	HRKKosBj7jl6lSPDCOQB4Una4mcgrkUWSXDg+VFMqS67NjcF2Qnu1crBqwP3yoGoz0Au+Jy
	mEs+GuoS+fpw95ouxchwdAHbxXfW6YU5Xli8E4/mDfHo6yrLIGonLC2ZK6DXOYm8dPZV0IG
	rOIWqibuLBsuAdkQmto3V19YzVe21YZwMWaFoznkSH/x0HeG/Y9jvoX0MFvfG3JLG2mt6zl
	/MWrdRy+WWz2cY9hiQE83ctLH8dlsqv/3MOyFbm+KXgJOEOtfGo2wE/D476B67sKDP4bDS9
	uMcP82futUSHBMA9BDALjBOyLhDe5cWzpeC11IPFpiJ0G0a4kZmPbQo+whRlSsc2yJVIarX
	EhWoKAO2WRINvv5iw7bz5uh8PK+Vl4stZQIiQIeikJjrNgYTpReEIYKuBfKBJzcAd8QtA+J
	GeKZYgxab3B1A1Qh9eWmPvpH4ir3JgIjA8r6EfIo+2rn0yiGV2u+3MF+vkfrbdfRSf+iZ7N
	qaGTiUKQ==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

On 2025/8/22 19:02:21, Neil Armstrong wrote:
> On 22/08/2025 12:57, Dmitry Baryshkov wrote:
>> On Thu, Aug 21, 2025 at 03:53:26PM +0200, Neil Armstrong wrote:
>>> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
>>> of a combo glue to route either lanes to the 4 shared physical lanes.
>>>
>>> The routing of the lanes can be:
>>> - 2 DP + 2 USB3
>>> - 4 DP
>>> - 2 USB3
>>>
>>> And the layout of the lanes can be swpped depending of an
>>> eventual USB-C connector orientation.
>>>
>>> Nevertheless those QMP Comby PHY can be statically used to
>>> drive a DisplayPort connector, DP->HDMI bridge, USB3 A Connector...
>>>
>>> But if a 4lanes DP->HDMI bridge is directly connected to the
>>> QMP Comby PHY lanes, in the default routing 2 or the 4 lanes would
>>> probbaly be USB3, making the DP->HDMI bridge non functional.
>>>
>>> Add a property to hint in which layout mode the QMP Comby PHY
>>> should be as startup.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   .../bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 13 ++ 
>>> +++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp- 
>>> usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/ 
>>> qcom,sc8280xp-qmp-usb43dp-phy.yaml
>>> index 
>>> c8bc512df08b5694c8599f475de78679a4438449..129475a1d9527733e43ded5a38aad766f9810fe7 100644
>>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp- 
>>> usb43dp-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp- 
>>> usb43dp-phy.yaml
>>> @@ -76,6 +76,19 @@ properties:
>>>     mode-switch: true
>>>     orientation-switch: true
>>> +  qcom,combo-initial-mode:
>>> +    description:
>>> +      Describe the initial mode of the Combo PHY configuration.
>>> +      The Combo PHY is a wrapper on top of a DP PHY and an USB3 PHY,
>>> +      sharing the same SuperSpeed lanes with either DisplayPort over
>>> +      the 4 lanes (dp), USB3 on a pair of lanes (usb3) or both
>>> +      technologies in a 2+2 configuration (usb3+dp) as default.
>>
>> SPecifying this as an initial mode means that it can be switched later.
>> Should we generalize this and desribe it as bus-type (from
>> video-interfaces.yaml) and allow it to be present only if there is no
>> mode-switch property?
> 
> I was not sure about that, and yes we should do that instead but I'm not
> sure about how.
> 
> bus-type sounds great, but the numbering doesn't match so I was thinking 
> instead
> something like phy-type with a string or use the numbers from include/ 
> dt-bindings/phy/phy.h
> 
> The thing is, do we want to keep the dual dp+usb3 as static ? I think 
> it's very possible
> a board would connect the combo phy to an USB3 A connector and a 2lanes 
> DisplayPort connector.

Yes, our board (Radxa Dragon Q6A) is using such design, but with usb3 
and dp lanes swapped. [1] I think this patch series could be extended to 
handle such configuration.

Currently I just change the default orientation to reverse in 
qmp_combo_probe. [2] It works flawlessly. But of course, it's not an 
upstreamable solution :)

FWIW, Rockchip usbdp phy binding [3] has a property called 
`rockchip,dp-lane-mux` to support such configuration.

[1] 
https://dl.radxa.com/q6a/hw/RADXA%20Dragon%20Q6A%20V1.20%20Schematic%2020250621.pdf

[2] 
https://github.com/strongtz/linux-next/commit/928cd166ce81aca7f8e051c72eccbd84ad896d98

[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml#n53

> 
> Neil
> 
>>
>>
>>> +    default: usb3+dp
>>> +    enum:
>>> +      - usb3+dp
>>> +      - usb3
>>> +      - dp
>>> +
>>>     ports:
>>>       $ref: /schemas/graph.yaml#/properties/ports
>>>       properties:
>>>
>>> -- 
>>> 2.34.1
>>>
>>
> 


-- 
Best regards,
Xilin Wu <sophon@radxa.com>

