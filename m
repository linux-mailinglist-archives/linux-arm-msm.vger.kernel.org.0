Return-Path: <linux-arm-msm+bounces-47295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F85A2DD1F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 12:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D0287A302C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 11:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BE71CAA92;
	Sun,  9 Feb 2025 11:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsP3bWHb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A091CAA70;
	Sun,  9 Feb 2025 11:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739101244; cv=none; b=kt6SP4WqweoQV3nQXrSMdjNZuggylN3PZtmJEtAE5Zh/kyRvbj/AHRrK9E3oz97ElBHneHqy/NW3EPFMJOZ2qJJSBLjqKOSZXurke/5VkMptpZKXawm3qfa2/F+/35tdi+/qdQCt6MB9lEsoRaO+K2FqS/qNatRDS1H+traa+9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739101244; c=relaxed/simple;
	bh=CIK0DWwvcQxoxrvp0Fs/IS337214EaWDY0MuIwPidbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DxF5cm3GB5ZuzlLGxogDndiwA6CbD2hyOPLssipqUdo5lLOXt7DMd/ZJD4HJ3UUBdU8sGgn+/ULgeglKAHD7xL7fEUKtxxxbe2s7iOy+5u49AnkjCJ3Z38xk5HlcgS3xDowcNaUF49OOGyZrnqw5IGQQkF8oyiQ3chY+tYx6FkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsP3bWHb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BE5C4CEDD;
	Sun,  9 Feb 2025 11:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739101244;
	bh=CIK0DWwvcQxoxrvp0Fs/IS337214EaWDY0MuIwPidbU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=WsP3bWHbKX5UpeY2yiqCRRXfJUnUPMkgO4iP0HaIItsDNMVL47TUmIoOMLSyKmFrD
	 tvlvzatzOCe3yFO1LLvqmFlJuLfaArUfMzw0fOkdANlAY5GUiuwLXtYUXXSfgDoloj
	 GDt3ePGw8S3CUiqyIkNPXiDCgqGgJwb/rDXNYwyPuoORN1Sya/0nkjh0vQjda5QC1a
	 nv3Iou6+tjD+QuVxjncyLtMdo0+3uoPscGPfayR6WTLtzxHkiXpL9ld73QYQ/bfAG0
	 m0Pr+Id85ir1P1IU1Il/iX3ZUZL1JoEQebIKmkDvmKcatpbEl7L7XG4AO7iTjMLe8v
	 XGJxn6FTr1Y6g==
Message-ID: <1e3a103d-d468-40c6-b03c-723427d7bb41@kernel.org>
Date: Sun, 9 Feb 2025 12:40:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] i3c: master: Add Qualcomm I3C master controller
 driver
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
 linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-3-quic_msavaliy@quicinc.com>
 <fec85cd8-4c56-4b48-a15f-e7ae08352cc2@kernel.org>
 <e5cad9d0-e602-442f-b216-2f655a9526e3@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <e5cad9d0-e602-442f-b216-2f655a9526e3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/02/2025 13:03, Mukesh Kumar Savaliya wrote:
>>> +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se-clk");
>>> +	if (IS_ERR(gi3c->se.clk)) {
>>> +		ret = PTR_ERR(gi3c->se.clk);
>>> +		dev_err(&pdev->dev, "Error getting SE Core clk %d\n", ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = device_property_read_u32(&pdev->dev, "se-clock-frequency", &gi3c->clk_src_freq);
>>
>> You never tested your DTS or this code... Drop
>>
> I have tested on SM8550 MTP only. Below entry in my internal/local DTSI.


And how is it supposed to work? Are you going to send us your local
internal DTSI? Is it going to pass any checks?

> Do you mean to say i should add this property in yaml too ?

Yes.

You cannot add undocumented ABI. That's a strong NAK.


> se-clock-frequency = <100000000>;
>>
>>> +	if (ret) {
>>> +		dev_info(&pdev->dev, "SE clk freq not specified, default to 100 MHz.\n");
>>> +		gi3c->clk_src_freq = 100000000;
>>> +	}
>>> +
>>> +	ret = geni_icc_get(&gi3c->se, NULL);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/* Set the bus quota to a reasonable value for register access */
>>> +	gi3c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
>>> +	gi3c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
>>> +	ret = geni_icc_set_bw(&gi3c->se);
>>> +	if (ret) {
>>> +		dev_err(&pdev->dev, "%s: icc set bw failed ret:%d\n", __func__, ret);
>>> +		return ret;
>>> +	}
>>> +	dev_dbg(&pdev->dev, "%s: GENI_TO_CORE:%d CPU_TO_GENI:%d\n", __func__,
>>> +		gi3c->se.icc_paths[GENI_TO_CORE].avg_bw, gi3c->se.icc_paths[CPU_TO_GENI].avg_bw);
>>> +
>>> +	ret = device_property_read_u32(&pdev->dev, "dfs-index", &gi3c->dfs_idx);
>>
>> The same. You cannot send us hidden ABI.
>>
>> This code does not look like ready for upstream. Are you sure it was
>> internally reviewed?
>>
> yes, we have taken 2 rounds internally.


And none of the reviewers spotted undocumented ABI? OK, learning
experience for me.


> Are you saying i should add this into yaml ?  what do you mean by 
> hiddern ABI ?


Where is the documentation of the ABI?



Best regards,
Krzysztof

