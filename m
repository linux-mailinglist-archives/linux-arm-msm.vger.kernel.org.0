Return-Path: <linux-arm-msm+bounces-71653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 755B7B4099B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 17:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 185DA7B185A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 15:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CCB32BF49;
	Tue,  2 Sep 2025 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qoop0PUo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B9E322C63;
	Tue,  2 Sep 2025 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828033; cv=none; b=mbUqsDHmlszu/ipyOtM9QqP6V11WV66HD2ts04QbHwZq3Hl5Jjn0xwM3UBdiBeSYzmlfVEgsbnOCk/huL0QkkzvAm9+dAyNewjdyjLWY+oADaQ2g5lx4wSovxJv30BTLW50CuKqAQdJDgzDCMrjuXOKCIi688p3IDtz9/UbWuQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828033; c=relaxed/simple;
	bh=hySp48UnvCMROUWJRYJLQKxmvnRkw1XrdDo4283avGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qrcHWKWRt8byknsPurO20oeJP8SOu/7DsZRFt2tqXofCJ/jB5AFGfagl5TvatKCrHwJ08IFld5kynidpxIxhbJddXjzC2ZBJlWH5cLSH0jqG4WanGAe7qledJJpxbnoBQwEX2L8AFrH6Pd4irgQvuzDio4dkYFY/KY/y1pZHMB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qoop0PUo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B677EC4CEF5;
	Tue,  2 Sep 2025 15:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756828032;
	bh=hySp48UnvCMROUWJRYJLQKxmvnRkw1XrdDo4283avGI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qoop0PUoSRM7ccmH7X8HwPTe7IYpZZvry2Ic2hA7KoefFUH/anzpnvOBKOltqjwe1
	 OpzJ0z4m8CdbdMVbYpijEzEwETP+ZqCYtD0xxYJq+wRa/L2rC7mnCRPaQj8m38RJLc
	 ELXcPSUI2XtH2MOk9xI7+bNNrwyGW/zdP3S+DvU585IbH18Uw5xg34If1MBch5Z6Df
	 JqeNkacp9ytKscwh8qyTDQsx4UhWLdN73ToFtubojBtKQTgUUnRR7EerCIdJExV8w5
	 FE+5OUtRHQnapmtloTd4b1BecIQDSwl9YuR4lCgOEuLzsUkHoDOxRw1YtE50Mj2pT3
	 pRjiTS+ZxJMAw==
Message-ID: <ebd1a1b7-c911-43f6-91cc-fcc2c01bc600@kernel.org>
Date: Tue, 2 Sep 2025 17:47:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] soundwire: qcom: deprecate qcom,din/out-ports
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org,
 conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250901195037.47156-5-srinivas.kandagatla@oss.qualcomm.com>
 <20250902-light-vegan-snake-efe03c@kuoka>
 <3c41bc8e-796b-4efe-97cd-03b737f09689@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <3c41bc8e-796b-4efe-97cd-03b737f09689@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/09/2025 15:13, Srinivas Kandagatla wrote:
> On 9/2/25 9:38 AM, Krzysztof Kozlowski wrote:
>> On Mon, Sep 01, 2025 at 08:50:34PM +0100, Srinivas Kandagatla wrote:
>>> Number of input and output ports can be dynamically read from the
>>> controller registers, getting this value from Device Tree is redundant
>>> and potentially lead to bugs.
>>>
>>> Remove the code parsing this property along with marking this as
>>> deprecated in device tree bindings.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> ---
>>>  drivers/soundwire/qcom.c | 134 ++++++++++++++-------------------------
>>>  1 file changed, 49 insertions(+), 85 deletions(-)
>>>
>>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>>> index 7f19ebba6137..4fa3e1c080ef 100644
>>> --- a/drivers/soundwire/qcom.c
>>> +++ b/drivers/soundwire/qcom.c
>>> @@ -128,7 +128,6 @@
>>>  #define MAX_FREQ_NUM						1
>>>  #define TIMEOUT_MS						100
>>>  #define QCOM_SWRM_MAX_RD_LEN					0x1
>>> -#define QCOM_SDW_MAX_PORTS					14
>>>  #define DEFAULT_CLK_FREQ					9600000
>>>  #define SWRM_MAX_DAIS						0xF
>>>  #define SWR_INVALID_PARAM					0xFF
>>> @@ -195,6 +194,7 @@ struct qcom_swrm_ctrl {
>>>  	int wake_irq;
>>>  	int num_din_ports;
>>>  	int num_dout_ports;
>>> +	int nports;
>>>  	int cols_index;
>>>  	int rows_index;
>>>  	unsigned long port_mask;
>>> @@ -202,7 +202,7 @@ struct qcom_swrm_ctrl {
>>>  	u8 rcmd_id;
>>>  	u8 wcmd_id;
>>>  	/* Port numbers are 1 - 14 */
>>> -	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS + 1];
>>> +	struct qcom_swrm_port_config *pconfig;
>>>  	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
>>>  	enum sdw_slave_status status[SDW_MAX_DEVICES + 1];
>>>  	int (*reg_read)(struct qcom_swrm_ctrl *ctrl, int reg, u32 *val);
>>> @@ -1157,7 +1157,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>>>  				       struct snd_pcm_hw_params *params,
>>>  				       int direction)
>>>  {
>>> -	struct sdw_port_config pconfig[QCOM_SDW_MAX_PORTS];
>>> +	struct sdw_port_config *pconfig __free(kfree) = NULL;
>>
>> That's incorrect usage of __free(), missing constructor.
>>
>>>  	struct sdw_stream_config sconfig;
>>>  	struct sdw_master_runtime *m_rt;
>>>  	struct sdw_slave_runtime *s_rt;
>>> @@ -1167,6 +1167,10 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>>>  	int maxport, pn, nports = 0, ret = 0;
>>>  	unsigned int m_port;
>>>  
>>> +	pconfig = kcalloc(ctrl->nports, sizeof(*pconfig), GFP_KERNEL);
>>
>> This almost always goes to definition and I do not see anything
>> preventing it.
> Yes, It can go to the definition.
> 
> But does this matter for a single instance of __free? I thought this was

EVERY __free() must have constructor in definition and only exceptions
are allowed if you cannot find such constructor (e.g. there are two for
the same variable).

> an issue if we have multiple __free() or guard() and __free() the order
> of definitions matter.

Yeah, for that reason this would matter, but here it is about preferred
style.

> 
> Will follow the recommendation in v2.
> 
> thanks,
> --srini
>>
>>> +	if (!pconfig)
>>> +		return -ENOMEM;
>>
>> Best regards,
>> Krzysztof
>>
> 


Best regards,
Krzysztof

