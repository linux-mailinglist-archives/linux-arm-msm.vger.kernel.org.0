Return-Path: <linux-arm-msm+bounces-43969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 286B0A01FEC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 08:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C4A218849B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 07:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076A81D6DA3;
	Mon,  6 Jan 2025 07:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRUW3ALS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BB41D5AD9;
	Mon,  6 Jan 2025 07:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736148654; cv=none; b=P+8e7SbwC1YQvKh7io7kJdNHWP9uLamZ4EhVVPlv+hD+M25cxKLIUwPXC3Sx4k6ZKLd13lGV6uZcHaXaBr51ruRLItYfFkqSjA7aZTxVBMFY2U055nbAtyEhvgme+m+5vWnT135cA6AeJ5Xu9lJSQR6B2QeKVrOcibX6P2p0Rb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736148654; c=relaxed/simple;
	bh=A8umhNsnc1N31R4JnrNUjdXvYxI5v8Z8pxqxlPAWkv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oo+UjQwK3PTPKXd4PvanYoWpvwAIFrZ8oHu76BZvTS9Zug1uMorIf9JLPc0alouavOX33TRbUL6FramUSOEsx3mgUhJ99DIAAIiSztOm9ErfqWkps/nlTq0jVEXExFzfP4Y9BeLg17LhdEI28P9KFq+sTxoj/w89ZpxHYRfs888=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRUW3ALS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C444C4CEDF;
	Mon,  6 Jan 2025 07:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736148654;
	bh=A8umhNsnc1N31R4JnrNUjdXvYxI5v8Z8pxqxlPAWkv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iRUW3ALSJsxYGHqKLeYLthPh0D30E3O6H/V3Hb2JBUE0/tphpytB0L1u3fl98TMQE
	 k+kyk5QsOTg6tNebQ/afu/4pw+Xi4QLuCxSWygApOkUYENbRTGgZbqK0Gc0VGkUoUz
	 Wu6KFXSoJk8CChkN7ypfl9QEHwa76lAypPMKesF6QwbokZEriI80Vm/1siOvWzJs0S
	 v2u2rnjZMz6+66wMycItRjMqTA/Y60XdXTggHdCoCPKTHReQTEqMrZbzDTm+L+T8Gq
	 wEmSSzxGcs8n974lVt7bR4jhqYqZuHDdUST7OqE2g4XA6pXMH4vYLUnBA/rLAScQ11
	 gnhRalc3gI6/Q==
Date: Mon, 6 Jan 2025 13:00:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_pkumpatl@quicinc.com, kernel@quicinc.com
Subject: Re: [RESEND v5 3/4] soundwire: qcom: Add set_channel_map api support
Message-ID: <Z3uGqUxn1mCdo3B4@vaman>
References: <20250103055914.1835943-1-quic_mohs@quicinc.com>
 <20250103055914.1835943-4-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103055914.1835943-4-quic_mohs@quicinc.com>

On 03-01-25, 11:29, Mohammad Rafi Shaik wrote:
> Added qcom_swrm_set_channel_map api to set the master channel mask for
> TX and RX paths based on the provided slots.
> 
> Added a new field ch_mask to the qcom_swrm_port_config structure.
> This field is used to store the master channel mask, which allows more
> flexible to configure channel mask in runtime for specific active
> soundwire ports.
> 
> Modified the qcom_swrm_port_enable function to configure master
> channel mask. If the ch_mask is set to SWR_INVALID_PARAM or is zero,
> the function will use the default channel mask.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod

