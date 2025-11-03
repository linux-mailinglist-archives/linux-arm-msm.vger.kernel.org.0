Return-Path: <linux-arm-msm+bounces-80106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACA3C2BB88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 13:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 202874F03B1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 12:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02982FC010;
	Mon,  3 Nov 2025 12:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="TBvQN+BO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m19731105.qiye.163.com (mail-m19731105.qiye.163.com [220.197.31.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F70330C352
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 12:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762173218; cv=none; b=QMkY6b0vHaHgW2ubZYr8HUrRcQ9Yg9ooBPuC38+mXgT+wNiydRAzYf462YQv6WX5zxKUO2Y1VOucx3jVkYwSmNC0dCbmPQcDD1ETgdwHReJqYOF89CuroNY/SlOW3Fg7y3SwF1pjCym/VWWPZTj5jlDhEDYW/TwBoI1z+bTVsSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762173218; c=relaxed/simple;
	bh=OIZH6XTUVFastLnyPvfj4ePP87GCWNG9ah+dt/4rXEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZpIvLFC5UikKD5ft4KJqujTWA2oX4xx9ZSM9IW3ZvYY5aOrf8ksJwpTZOL/u3sgx8f2Io3xW7MEhPBs2DNlQPsoLs7b3sf4XuBQob9y5/lAI65jXvrbUWY2h1fsYx4RhRYHq/2H1MCMLDGQ4WcrO3qZtpeHfHpTnG8pAkIMF72Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=TBvQN+BO; arc=none smtp.client-ip=220.197.31.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from ROG.lan (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 28329cce8;
	Mon, 3 Nov 2025 20:33:21 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	casey.connolly@linaro.org,
	christopher.obbard@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	hongyang.zhao@thundersoft.com,
	linux-arm-msm@vger.kernel.org,
	loic.minier@oss.qualcomm.com,
	rosh@debian.org
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board dts
Date: Mon,  3 Nov 2025 20:33:05 +0800
Message-ID: <20251103123305.9982-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <549a6235-dadd-4136-86aa-c96400373722@oss.qualcomm.com>
References: <549a6235-dadd-4136-86aa-c96400373722@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a49b5265809d5kunm2c34bfe4a2cc1b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGhkaVh0eGU8ZTxhNGkgYSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=TBvQN+BOtiG5oagRh7KRv2bFxQM5xZgCmBVvmsTgHD9YuRCa9DIX0wPUqjzcWDTdiiNlhWZQDtHXW9QOvay2xvvWg5KZLiTfLdoeNYKwDXCdTYR0oP+Bb1HHE+6waTCERzqxafdKfCDQzLr236lr9tFVEg5LLR/LS7jfO1XUp0A=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=ifvs5DuQm8zROvP0K1J4gLXgNsWziifaL9kvvUeTizs=;
	h=date:mime-version:subject:message-id:from;

>On 10/31/25 10:27 AM, Hongyang Zhao wrote:
>>> On Sat, Oct 25, 2025 at 08:27:22PM +0800, Hongyang Zhao wrote:
>>>> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
>>>> QCS6490 SoC.
>>>>
>>>> Works:
>>>> - Bluetooth (AP6256)
>>>> - Wi-Fi (AP6256)
>>>> - Ethernet (AX88179B connected to UPD720201)
>>>> - FAN
>>>> - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
>>>> - M.2 M-Key 2280 PCIe 3.0
>>>> - RTC
>>>> - USB Type-C
>>>> - USB Type-A 2.0 port
>>>> - 40PIN: I2C x1, UART x1
>>>>
>>>> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
>>>> Reviewed-by: Roger Shimizu <rosh@debian.org>
>>>> Cc: Casey Connolly <casey.connolly@linaro.org>
>>>> Cc: Christopher Obbard <christopher.obbard@linaro.org>
>>>> Cc: Loic Minier <loic.minier@oss.qualcomm.com>
>>>> ---
>
>[...]
>
>>>> +			cpu_hot: cpu-hot {
>>>> +				temperature = <90000>;
>>>> +				hysteresis = <5000>;
>>>> +				type = "active";
>>>> +			};
>>>
>>> This has the same value as trip-point0. Is it intentional?
>> 
>> I overlooked the temperatures in sc7280.dtsi, I will remove cpu_hot.
>> 
>> Additionally, based on Konrad's final suggestion in
>> "[PATCH v4 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board dts",
>> I will remove the cooling-maps node (user space service will get netlink
>> information to control the fan), and finally change to:
>
>My suggestion was to fix the description and wire up the fan. I called
>your userland service creative because I didn't want to use the other
>word that came to mind.
>

Understood, I will change it to:

&thermal_zones {
	cpu0-thermal {
		trips {
			cpu_tepid: cpu-tepid {
				temperature = <65000>;
				hysteresis = <5000>;
				type = "active";
			};

			cpu_warm: cpu-warm {
				temperature = <80000>;
				hysteresis = <5000>;
				type = "active";
			};
		};

		cooling-maps {
			map-cpu-tepid {
				cooling-device = <&fan0 1 1>;
				trip = <&cpu_tepid>;
			};

			map-cpu-warm {
				cooling-device = <&fan0 2 2>;
				trip = <&cpu_warm>;
			};

			map-cpu-hot {
				cooling-device = <&fan0 3 3>;
				trip = <&cpu0_alert0>;
			};
		};
	};
};

---
Thank you for the review!
Hongyang

