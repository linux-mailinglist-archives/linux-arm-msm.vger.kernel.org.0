Return-Path: <linux-arm-msm+bounces-55065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36060A97F88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 08:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4164E189BDE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 06:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CEB25D53C;
	Wed, 23 Apr 2025 06:48:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC3B3398B;
	Wed, 23 Apr 2025 06:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745390933; cv=none; b=EnpmclyB/kmrH8YPAX+EcBsv7eof8XKirw6pxgu4sDxT09HxGRnuexSG1raU4Pte/+z93C5Wnq+nhRb2F1fYav4ViVFJoYE2qmsNKpHQAphCzkmGMw1kvJiFTV1YJpwlI9imKmJdCo1tl+IaM829TX1e0txnlK0eMrQu4shLtgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745390933; c=relaxed/simple;
	bh=rz3h6aO1iqe6HjpBhPgGdm/q1GWce7TmX00nfd6SlpA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EIAH/yAbjjNhnIjyYx5OBfBOXRzJxs6A5kn9mcYt7V3gSv0ME2WcsL5quB0z2pZFK3Kj4iSwntZ9k9ukfbMy4NfbDGfltvjsx77tXDMGyNo1cbIntEN4vlIgSYBIx82g14hx2NyXpEKvk9H5Ob+gy9Scrj7Jtq0AXWC+JiqHGuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpsz6t1745390836t9b6dfae2
X-QQ-Originating-IP: d5OllYoDBWfSWoV0vu3d6MtEzomJiKDiaIT5EPH1lH4=
Received: from [127.0.0.1] ( [117.144.82.47])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Apr 2025 14:47:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5299619483516575992
Message-ID: <98F1324C86982D2B+13f97453-f1ec-4c08-977b-c1bd9a68d409@radxa.com>
Date: Wed, 23 Apr 2025 14:47:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] Add static channel mapping between soundwire
 master and slave
From: Xilin Wu <sophon@radxa.com>
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
 <22F78335AF3DCDCB+3c44f925-88fc-438d-9482-ab39a1d70df8@radxa.com>
Content-Language: en-US
In-Reply-To: <22F78335AF3DCDCB+3c44f925-88fc-438d-9482-ab39a1d70df8@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NfJJAz0ICuA6DrZEMsSV3vPXNizf8zo+0RCjvFzhNAyG8tonserKM+B5
	tqNOPOrp+xfOrMpPE2elETKfkE1oONKDPWICDfeXpY+wmXSLlllzoN82Z0nII6yAj9GTyY/
	P9lyYBKES/ZspLn6/EddqK88WXyb1oEDA0MgaaggUsJylHjcm1p3cqSFp0nUjNPFPhxX94V
	AQDXxdT2ti+OjZyr74/bVTdaaFlNXUvrjpLKWOyk36X3a7UbmGsyIqD0TIKL+EaBXtxXyda
	mj+PNBa4+OnmuEaJLE3y04g2ebqqREAEYB2l5O+bkbfjBtnzJCe1N3EQMlHFCdr68Wg2cHc
	2+I3pg5a4rK7R6H5Boql3Ne+HmTRQvgyt+RqJ542dbMvANIgRpDYjfM3+/2Ym7bpPzs4o7t
	2zbHf9QhLCft1BYTzmfGMVwU7RSbRFbfZW/ETjtQ9SyonwL+RSTXzYQCU2BSQlM/INIRTGX
	S30jIwe3XF1nVcVF0jJBFMCnDdzNruCgD9nuDQIOkgVqW49+ukO5Bx+/tENnQj9+zfwPy06
	osUDm/C/45WfbML1AFlC8PbfNpxLAe3ubC7gPnS/Nkts7JtCxVmwwJrNqXteZ6ZN+mmQSMx
	mpjHubBcRXShsrom5PP1D6yeR7gfQv5r1KO2M9apCapWoGSjZUwNsjn001ZoxrWKPCsQjdp
	BiiAnRfvNgW0TxfjzF6CVpht8xna8v3grx4hgvqQjmScRQuKJ4cyIoHJbkNNevfSq/6B0zP
	DNBbjTmCck4CLESPIIMfVLTRk2hNclIOefA9/OPaQfJgukP6gj4ksUP8btYF8UbrVnI6qbQ
	UBEfMjqnAh4ozKOIgbFBdmDrfzWgtP3g8nImcEszlWxZ+cY+uIJhZhdH6qArqomlwtNphea
	yuNOwVnZnklENXvOshPQ9d3V19+qtoTsb9DduACWx1rR2Q2DzvUGdkhPYs8Tr4e4OWUW60f
	XV0PvW9RXOuT31NGQsjITg2m7MUor3j52csA=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

On 2025/4/22 22:59:13, Xilin Wu wrote:
> On 2025/2/6 19:22:21, Mohammad Rafi Shaik wrote:
>> Add static channel map support between soundwire master and slave.
>>
>> Currently, the channel value for each soundwire port is hardcoded in the
>> wcd937x-sdw driver and the same channel  value is configured in the
>> soundwire master.
>>
>> The Qualcomm board like the QCM6490-IDP require static channel map
>> settings for the soundwire master and slave ports.
>>
>> If another boards which are using enable wcd937x, the channel mapping
>> index values between master and slave may be different depending on the
>> board hw design and requirements. If the above properties are not used
>> in a SoC specific device tree, the channel mapping index values are set
>> to default.
>>
>> With the introduction of the following channel mapping properties, it is
>> now possible to configure the master channel mapping directly from the
>> device tree.
>>
>> Added qcom_swrm_set_channel_map api to set the master channel values
>> which allows more flexible to configure channel values in runtime for
>> specific active soundwire ports.
>>
>> Add get and set channel maps support from codec to cpu dais in common
>> Qualcomm sdw driver.
>>
>> Changes since v5:
>>   - Fixed build compile issue with v5-0003 patch, reported by Mark Brown.
>>
>> Changes since v4:
>>   - Update the order of channel map index values in v4-0001 dt- 
>> bindings patch as suggested by Krzysztof.
>> Changes since v3:
>>   - Change the order of channel map index values in v3-0002 dt- 
>> bindings patch as suggested by Krzysztof.
>>   - Dropped V3-0001 patch which is not required.
>>
>> Changes since v2:
>>   - Rephrase commit description v2-0001 dt-bindings patch as suggested 
>> by Krzysztof.
>>
>> Changes since v1:
>>   - Modified the design and followed new approach to setting the 
>> master channel mask.
>>   - Used existing set_channel_map api as suggested by Pierre-Louis
>>   - Fixed the typo mistake in v1-0001 dt-bindings patch.
>>   - Rephrase the commit description for all v1 patches.
>>
>> Mohammad Rafi Shaik (4):
>>    ASoC: dt-bindings: wcd937x-sdw: Add static channel mapping support
>>    ASoC: codecs: wcd937x: Add static channel mapping support in
>>      wcd937x-sdw
>>    soundwire: qcom: Add set_channel_map api support
>>    ASoC: qcom: sdw: Add get and set channel maps support from codec to
>>      cpu dais
>>
>>   .../bindings/sound/qcom,wcd937x-sdw.yaml      | 36 +++++++++++++
>>   drivers/soundwire/qcom.c                      | 26 +++++++++
>>   sound/soc/codecs/wcd937x-sdw.c                | 39 ++++++++++++--
>>   sound/soc/codecs/wcd937x.c                    | 53 ++++++++++++++++++-
>>   sound/soc/codecs/wcd937x.h                    |  7 ++-
>>   sound/soc/qcom/sdw.c                          | 34 ++++++++++--
>>   6 files changed, 185 insertions(+), 10 deletions(-)
> 
> Hi Mohammad,
> 
> I'm working on a QCS6490 board with the WCD9380 codec. I wonder if a 
> similar patch is needed to enable headset audio? Currently, DisplayPort 
> audio and headset plug-in detection work, but no audio is coming from 
> the headset.
> 
> Additionally, I noticed an unusual output in dmesg:
> 
> qcom-soundwire 3210000.soundwire: qcom_swrm_irq_handler: SWR Port 
> collision detected
> 
> Could this be related to the issue? Let me know if you need further 
> details.
> 

Well, headset audio works now. It seems that the error message has 
nothing to do with it :)

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

