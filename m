Return-Path: <linux-arm-msm+bounces-54963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96825A96FD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 17:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 537423A9178
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 15:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2ED29346C;
	Tue, 22 Apr 2025 15:00:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DAD28F520;
	Tue, 22 Apr 2025 15:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745334059; cv=none; b=f2LM7ICMVR5bfxlZU5/tDVMwhTmc6BqE28pz0RqzGoKdWnkSA9aiWCSxpnnwcLyhGpfI8Xvg4AAzshDE9rwtlcdjz3hJ/aYV1mHHW6nww4lMWsEvffQlCp24ziTsu1kPmgH4Ar+3x4RJTOPy3xc8XJNAcJYvn/v8WHcchpJv7fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745334059; c=relaxed/simple;
	bh=Yo2gLzQafcD8WiYwM9WhXEX8DLLO8XmKGQ/dY3GeMfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwAE4AO/8TgR//cwGDCqLE2Y/9hAX9ZFXaBG98JRmIymS04pe3vhf2nGs971kh9tBtT0QAj76SGatj6Rg5LbxbGf7PQ+Q+7iMCqAWIoJeCFqYB+jDcOPtJFnKbegHAAOWefkKBnrgUtOrRYok+bBMKrus0a5s6t05gpXAgQatp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz18t1745333955t2a2a5492
X-QQ-Originating-IP: slj1jKgfTwnqN+XMjwQqPHnengA/+l4/lWr8Zsj3Fts=
Received: from [127.0.0.1] ( [116.234.26.236])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Apr 2025 22:59:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5860704546774926596
Message-ID: <22F78335AF3DCDCB+3c44f925-88fc-438d-9482-ab39a1d70df8@radxa.com>
Date: Tue, 22 Apr 2025 22:59:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] Add static channel mapping between soundwire
 master and slave
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
 kernel@oss.qualcomm.com
References: <20250206112225.3270400-1-quic_mohs@quicinc.com>
From: Xilin Wu <sophon@radxa.com>
Content-Language: en-US
In-Reply-To: <20250206112225.3270400-1-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NOnalZjVTVf0CJoUyorzo28YPlGmfqDe4Z9JM+5tIP5PAhgG8Kv5eyMx
	d0VO+dH+ULZVphZHgISUGqEm9Yvy/is7nA6rr5Mx3KDFTOsP2MMJGKfbJo5ZL7tQmpV3oR4
	Kraj/RSCVYlo5cHp5OR6PpzGcRS59ZswOQQXf1f6dAb1p8Ibei37ngiXd65HjSYxbhpjcsz
	+b18tW6I5XCXJhYH/rVEyMhMs32ng8g2QTIBXZIZnYAN05BqjAOmnp2GfdavdVFhA1N+k1U
	F0ni1iVN1e6wD9iQm99h+6H1JHAFjls+MHZfvShBNzMfiVJAHdMLP4f+8fxHJRctIqd6h2x
	O268kFN35Ddw6/fYMwvwzhze6NWe7unK23B4ZIZszHIfbA1X58xl9If4nzwOe2khzrSNeth
	7q2dnpO1jPVx8BTy3pxC9WcKxDrgR/2BQfq+7IZ3296v5IkvCMBV8NFZj1FSDYHBc+ffxn7
	Tbe6r5VFGViv6xSfRc1RIiCgWKOfD/yAdohHt/Evj1kKlUYEiaxz658OhpvLau6+bh9RDmI
	oOYd/1tCk+fv5inyT+U0Zk6aNaEW8iaIfxlQVHUXs6OGcSk8QDQ5hixPZwGUFfJWAoQ023u
	Y2K5aZsVy//wSM5RTX+TYXtN5Yp8OY7z4RGgHE/0A8G2nW6d7Tp7GM3FvGZIxpmc5oiwMDs
	YJxRf57EXvVGRZl5IS38IXOY53vMr3rx3VhXTk7KvO3hWR7J5egfjakOVKaNDMpf6AFs5bB
	Q6B/ASdInng8W9i+q6fMVx2Jy7r/TNXSRKNVHBWllEzxLEaB45pEcpDEuy/eQx5/oNjGlya
	iddax4xk5zTe+ZjLtHJjTI36FHgAw5mSmBPJGrjblb/u9eeV9nvTMqoI7HY+VRQXTUIQqKw
	cijIKhNKeBSERzEt3BAjobug/bRor+68+nA7v3iFtCHUKXKur3JeqaIFZ8+aVGLK6xlcpJ7
	8a1eVWoxpAcDY0tQ5rAng4cTz
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

On 2025/2/6 19:22:21, Mohammad Rafi Shaik wrote:
> Add static channel map support between soundwire master and slave.
> 
> Currently, the channel value for each soundwire port is hardcoded in the
> wcd937x-sdw driver and the same channel  value is configured in the
> soundwire master.
> 
> The Qualcomm board like the QCM6490-IDP require static channel map
> settings for the soundwire master and slave ports.
> 
> If another boards which are using enable wcd937x, the channel mapping
> index values between master and slave may be different depending on the
> board hw design and requirements. If the above properties are not used
> in a SoC specific device tree, the channel mapping index values are set
> to default.
> 
> With the introduction of the following channel mapping properties, it is
> now possible to configure the master channel mapping directly from the
> device tree.
> 
> Added qcom_swrm_set_channel_map api to set the master channel values
> which allows more flexible to configure channel values in runtime for
> specific active soundwire ports.
> 
> Add get and set channel maps support from codec to cpu dais in common
> Qualcomm sdw driver.
> 
> Changes since v5:
>   - Fixed build compile issue with v5-0003 patch, reported by Mark Brown.
> 
> Changes since v4:
>   - Update the order of channel map index values in v4-0001 dt-bindings patch as suggested by Krzysztof.
>   
> Changes since v3:
>   - Change the order of channel map index values in v3-0002 dt-bindings patch as suggested by Krzysztof.
>   - Dropped V3-0001 patch which is not required.
> 
> Changes since v2:
>   - Rephrase commit description v2-0001 dt-bindings patch as suggested by Krzysztof.
> 
> Changes since v1:
>   - Modified the design and followed new approach to setting the master channel mask.
>   - Used existing set_channel_map api as suggested by Pierre-Louis
>   - Fixed the typo mistake in v1-0001 dt-bindings patch.
>   - Rephrase the commit description for all v1 patches.
> 
> Mohammad Rafi Shaik (4):
>    ASoC: dt-bindings: wcd937x-sdw: Add static channel mapping support
>    ASoC: codecs: wcd937x: Add static channel mapping support in
>      wcd937x-sdw
>    soundwire: qcom: Add set_channel_map api support
>    ASoC: qcom: sdw: Add get and set channel maps support from codec to
>      cpu dais
> 
>   .../bindings/sound/qcom,wcd937x-sdw.yaml      | 36 +++++++++++++
>   drivers/soundwire/qcom.c                      | 26 +++++++++
>   sound/soc/codecs/wcd937x-sdw.c                | 39 ++++++++++++--
>   sound/soc/codecs/wcd937x.c                    | 53 ++++++++++++++++++-
>   sound/soc/codecs/wcd937x.h                    |  7 ++-
>   sound/soc/qcom/sdw.c                          | 34 ++++++++++--
>   6 files changed, 185 insertions(+), 10 deletions(-)

Hi Mohammad,

I'm working on a QCS6490 board with the WCD9380 codec. I wonder if a 
similar patch is needed to enable headset audio? Currently, DisplayPort 
audio and headset plug-in detection work, but no audio is coming from 
the headset.

Additionally, I noticed an unusual output in dmesg:

qcom-soundwire 3210000.soundwire: qcom_swrm_irq_handler: SWR Port 
collision detected

Could this be related to the issue? Let me know if you need further details.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

