Return-Path: <linux-arm-msm+bounces-73266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E7BB54676
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 11:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90F593B9DC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 09:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628B9276028;
	Fri, 12 Sep 2025 09:04:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9862526E16C;
	Fri, 12 Sep 2025 09:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757667899; cv=none; b=BM4EBnLq7/5XzX6EIElWywslsu3GWhm8eWmMeH+U8JdNuIfGY5iFBMc2orDxWTBiLKConsNNB6sA/H6ZjLoxrKIE7vDtDIBs1a003cRV5x95jykxIMHkolkdmcSBdmTQ2h+xxA+ScfOTt8XgODlTpjdp5bERhI26RUQVrxbh7aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757667899; c=relaxed/simple;
	bh=Xj0LY0AHcfqQNpYxaKnjH2glS7ZpclGWn4dMCSpdtpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JxdbkBTKJEsoIeUFl9y7WvRRkMhV3nYt/u+X+l9OCTcQ7tjYYGLv6uuVeBuTR/BLCwna7zfXrlHRDzomBGHsmE2UUohB6KV/AeTGT+r1B6EPT6EqwJhQkwf+Sq783mEYKmiBqkhd8kK3KO5tpq70UaE0U6Ws13jielfB6Wuqyfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz15t1757667881t741699d1
X-QQ-Originating-IP: XMWm7zre2Z3uQ9bGSr8UGT+VYv0IiSBoScGGlTdcPwc=
Received: from [127.0.0.1] ( [116.234.26.9])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 12 Sep 2025 17:04:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2419950997906594026
Message-ID: <103424579111FE76+93c3daf1-4bce-440b-9048-74edb833031e@radxa.com>
Date: Fri, 12 Sep 2025 17:04:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250912-radxa-dragon-q6a-v1-0-8ccdbf9cd19b@radxa.com>
 <56b5bacc-7214-41aa-b969-4f622afcd9f9@oss.qualcomm.com>
From: Xilin Wu <sophon@radxa.com>
Content-Language: en-US
In-Reply-To: <56b5bacc-7214-41aa-b969-4f622afcd9f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MFH6W69P3lT5eK/fx4G74YeP+2DDb9kesT5xGiEyUWTR6jd7X7lhnvjO
	0h0hWC/USXK66GX8hBkDhovhkjVoMQfSMMzXJWSBm/7YM+rzm5QTl/SnudLlBoocE3wPj51
	Tw2M5mdJUHIajsYzCElZzr3Da2Jlp2Hc+kWTw9oW0qMIIfYkT0/xoiTBo+y6rehmkFi1/vj
	IBanTUOMU1MtAslj4n8DZtHDpIad+YMa5b9BVNTVIzeT/EdN8WpdnJZmTL3lgW13lvgT2Dr
	qSX9BjAHFwhZutNIZGyB4OfwW003mucP5YpF8Aj8XzuZJElyrC+nRJeGPyJsTI7frETnmlG
	KlgQLtuq+tmEZ1icy4qksGZoub3pct+xMFGDFm2uUApBxA7J3dSf9t0AYmideDMmIWfb6oh
	VZiP9NxxzfhRXDJxy/ExFEEgMKLDvQAjL3o07HMydl0mJX6LTtCkIULjTc9nctg/D88O3f/
	OwsRKfMsAX1Qy5ESUYGw24yKJ3YFgwYUS4DDQ+IvJYafH77/4mFC1SdxZbS0smGuFLF3cnr
	Ry3BGFPgqxUbtCLOqCbo2AZZVlACqlO1HHSZM5JLW2d8polyoLyMlytQHKdFWweD6xpEZ7H
	A7xrZDsIzktk99RGE08uAGUnM04koEekg2QZcPkFfKqEhRPss4gqwbcBBijUZ8BcnxBZ5XW
	8Xon6f5R/BCTiKxKL0FADRBHrcfOXG7qJMaD7pEJqePmcsTumLUsIJoe9tyKm9jUouRpMI2
	B174fYA/yRHtUD+W27QQBGMk3si4VKOhJzwZb0OuiAg4c8FlOwgWub9W10PbjkAnSXBFNsU
	TBR9SCooK6NhmESZykT9bgGJSXhMdR5cRWMYX3R4OX9YfdWz7NtQPh01AD5crJdNunI54tY
	tovxrTFHEXlxRT4NmmE44drnFQ7daRW5N5v7ud69qHfo81HqcOhkzlju2pHsO/MgcdIrNVt
	Qrn+sc51TuJ5GDs6uQH/auIK2Qv7KoAx4yTDD3JCVwGZTTZMbYxe5jTxTgwfqcCCPSHZ3p/
	RrkSIhtIilo53pWc/eyd5WlzXKX9DckhNnpLgXaMFFfSPXKfCOQrpMDhoRQ5A=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

On 2025/9/12 16:56:04, Konrad Dybcio wrote:
> On 9/12/25 10:03 AM, Xilin Wu wrote:
>> Radxa Dragon Q6A (https://docs.radxa.com/en/dragon/q6a) is a single board
>> computer, based on the Qualcomm QCS6490 platform.
>>
>> The board ships with a modified version of the Qualcomm Linux boot
>> firmware, which is stored on the onboard SPI NOR flash. This allows
>> booting standard EFI-based bootloaders from SD/eMMC/USB/UFS/NVMe. It
>> supports replaceable UFS 3.1/eMMC modules for easy user upgrades.
>>
>> The board schematic is available at [1].
>>
>> Features enabled and working:
>>
>> - USB-A 3.0 port (depends on [2])
>> - Three USB-A 2.0 ports
>> - RTL8111K Ethernet connected to PCIe0
>> - UFS 3.1 module (depends on [3])
>> - eMMC module
>> - SD card
>> - M.2 M-Key 2230 PCIe 3.0 x2
>> - HDMI 2.0 port including audio (depends on [2])
>> - Configurable I2C/SPI/UART from 40-Pin GPIO (depends on [4])
>> - Headphone jack
>> - Onboard thermal sensors
>> - QSPI controller for updating boot firmware
>> - ADSP remoteproc (Type-C and charging features disabled in firmware)
>> - CDSP remoteproc (for AI applications using QNN)
>> - Venus video encode and decode accelerator
> 
> You have a number of features that depend on several other series, and
> as Krzysztof pointed out this is difficult to merge/review.. Could you
> please create a "linux-next/master-ready" version of this series and
> separate the changes for which the dependencies are unmet, putting them
> at the end? This way we can take at least some of your diff.
> 
> If you still want review on them, you can also send them as [PATCH DNM]
> or so
> 
> Konrad
> 

Thanks for the suggestion. I think I can separate the changes that have 
unmet dependencies, and mark them as DNM. Can I send the new series now, 
or am I supposed to wait for a few days?

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

