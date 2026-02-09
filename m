Return-Path: <linux-arm-msm+bounces-92276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDIOFe7UiWmBCAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:37:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A255310EBDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 016A33016ED7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 11:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3000F371049;
	Mon,  9 Feb 2026 11:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TxtuOdAe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10D736605C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 11:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770637006; cv=none; b=IQNKhbfbz9yaBzKHnWXHXWITMZ9zOeA9J4Ky3jtaAB5payKc+qBPTq/QNuO2CxhvG6kbeKCGChGA8oofdlBoBtAq68zW+rUGZWxBwviW5i9UosM2NYEmUh+Yo8qp9ioWKHNjymS8xuzNqi/WSrqIGPpFVCiq0b7XPFabXDePqoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770637006; c=relaxed/simple;
	bh=jS7w+mNi1x5aaB/vd4zifJyI6GuShvVgleKcUeSY9pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvIcC5o+Oar9HaZUM4Srhxtpv65P8uwMyq/B/EDvWgwHY/1kC2HwxvtIhXF/MtczoN3dfrl2E1zrdzBEZ7eF16pGeQ3wv3rrCjcqZg6TqZtbMN/BWt3KPb/I718Jth8kG8K5kqSzIK8Gz0P+K8hi/6aud1SKKANfK01Ua7lLl7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TxtuOdAe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so66613985e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 03:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770637004; x=1771241804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NM/PrFFohoVLcHQpdOFnX+o8+tO8YjeAGLU0+RPGLOQ=;
        b=TxtuOdAe3p4EqPQcfn+rzj5rWrSQ4ndy7HbdP7MscwsW6LhvZqOi5y/22SoGRNIjpu
         Y/u+gbUYGd4jSwGI8vKvUylhirFYH5dHME2HkXolgs82rg18mhuFrnC2e+Iop5eMj7RW
         zxZfqUOz+3v+n5E1kO43I2HtiGmW3TKQn0zFZytVVY8jtJurqsY+hGrQrWPySZ7QZHVM
         Rj4/ohTuJO55z4xpI253G06W5zFgIO0TnPglNEXe3xInAKDjm9QOxp7cUF+T4ZFc3HtD
         PVhFcEPoaNZxhkpTJU8BWIuett1g+SThfpVOWepmO7GMzGpTL2zn08IBPEQsfhfSndwO
         payw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637004; x=1771241804;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NM/PrFFohoVLcHQpdOFnX+o8+tO8YjeAGLU0+RPGLOQ=;
        b=SupmytCcCxMW/7OLQwqQMoBMDo4teXcEYJe/Y5viF/4pz8ex3z14TbHyrl3WZaxMow
         a8GZEJ21uJbpruzrXq4b/gxgSi6GM/9AMSbMKn4d2o10f/qTwa/Ryoq4NACxvod73WDn
         WOEL6s6VcN7igs1K3C0kd7voKhjL1EnzKJD44Sm8CRI/c24MhMA0D514n5X5HrLbdMyv
         KpTX4DoKdb7h8qJbZX/rRLhQaTfD5GQrd8rv970qgaqHOyfy6JiQ8MM6idS8k9EZcIHq
         kpTR3GPh1jZ9Rj5sXvLy3igd59cbbMG/L0TpCfD61/Y9AcVt7prV75UMOp1Ve+mzs2TV
         LhSg==
X-Forwarded-Encrypted: i=1; AJvYcCUD7zbu+ke/33/dDjVoSMByryHuakc+cTkZYDQN+yoXJ/d8sjxKEdvE/VxjYpbbcRqbfaDbpeU1h4Ugaa1g@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl4jSIMNm/DyrCTivTRJ2LYFXMwB0lfkV2Pei1Gre5tYbvTInB
	CHkUOEIGUL2MB/RoZADD7F6rAluuGmKHGT3XPxzMHimPKq4gSEJI2FU6Z/LYk74N2/I=
X-Gm-Gg: AZuq6aLQBovbOh4FZTcUrnRsiFS0pvgfNPKTa+zKXI5HisD/AZS+OHBz2b2mt4FV01u
	qNyhPYm/TfSDIC3tu6MQ3fKFTI599CmkVx2mbJDqs9v4LYi614pXfp2x+/8HAgwB8T2QSEjLVsZ
	73yBnvc9Y3PorVnk3gPLai5u1UDDHv8psQt5OduuXD/Q6d0r9s1qBibRtdlae/mBDvQeejxWkp5
	oJ8FzIyj/oLbED1qJToAJWZQGtUw0eIv+jgz1eD8EtIGpPA6uPFb7Qg0O8iGVfbDPP+61HyTn4C
	lNmMlGUXmpjpg62+2TK7LTwHBIHtVQiPmmDZeqaJr5xHUYQIURQT5MVQCU1PnfFhDYxL+MifGA/
	+kAU6eNIpIjGhw1ba0+RypzrLaTyyO3PplNaiFLqS4p6aRb+4kIrrg3rpZFqtmI1jUy/2wy/eqa
	ui2LHr482THoxSdVZWzANsi3FX1BaBvuaGe9Aip0JiOMovuQydUoNW
X-Received: by 2002:a05:600c:5290:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-4832020023cmr157204555e9.7.1770637003950;
        Mon, 09 Feb 2026 03:36:43 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fb16sm26165273f8f.25.2026.02.09.03.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 03:36:43 -0800 (PST)
Message-ID: <146ea20e-0779-4ec7-a8c0-09ebd06456d1@linaro.org>
Date: Mon, 9 Feb 2026 11:36:40 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <b6DhOj6aTnv6v2gw9cFy_PHc3yc5J4zM6RoKnTuTlr38CpZ9KI3-knSJnQKiPVTEOb6ZM_Zlt-xMycztV591_g==@protonmail.internalid>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-92276-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: A255310EBDB
X-Rspamd-Action: no action

On 09/02/2026 11:34, Dikshita Agarwal wrote:
> 
> 
> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
>>> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
>>> use Gen1 by default, but boards that intend to use Gen2 firmware can
>>> opt‑in by specifying a Gen2 image through the Device Tree
>>> 'firmware-name' property.
>>>
>>> Based on this property and the availability of the referenced
>>> firmware binary, the driver selects the appropriate HFI generation and
>>> updates its platform data accordingly. Boards that do not
>>> specify a Gen2 firmware, or where the firmware is not present,
>>> automatically fall back to Gen1.
>>>
>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +int iris_update_platform_data(struct iris_core *core)
>>> +{
>>> +	const char *fwname = NULL;
>>> +	const struct firmware *fw;
>>> +	int ret;
>>> +
>>> +	if (of_device_is_compatible(core->dev->of_node, "qcom,sc7280-venus")) {
>>> +		ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
>>> +					    &fwname);
>>> +		if (ret)
>>> +			return 0;
>>> +
>>> +		if (strstr(fwname, "gen2")) {
>>> +			ret = request_firmware(&fw, fwname, core->dev);
>>> +			if (ret) {
>>> +				dev_err(core->dev, "Specified firmware is not present\n");
>>> +				return ret;
>>
>> This is fragile - if someone names names their gen1 firmware something like
>> "myproduct_gen2_vidfw.mbn", it's going to match..
>>
>> Could we instead do something like the explicit format checks in
>> venus/hfi_msgs.c : sys_get_prop_image_version(), based on the **contents**
>> of the binary?
>>
> 
> I agree that checking for "gen2" as a substring in the firmware name is not
> reliable. Unfortunately, we cannot
> usevenus/hfi_msgs.c:sys_get_prop_image_version() (or any Gen1 HFI query) to
> probe the contents of the binary here, because Gen1 vs Gen2 have
> incompatible HFI protocols—probing a Gen2 image with Gen1 HFI (or
> vice‑versa) isn’t viable in this path.
> 
> To avoid accidental matches, I can switch to an exact filename match
> instead. That way, only the specific Gen2 image (for example
> "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
> want to use Gen2 can opt in by naming the firmware accordingly.

Exact match would be reasonable, IMO.

---
bod

