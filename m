Return-Path: <linux-arm-msm+bounces-24683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF7D91C865
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 23:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EB0E1C2279F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 21:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C240579DC5;
	Fri, 28 Jun 2024 21:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N37m5O1h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996747F7F7;
	Fri, 28 Jun 2024 21:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719611248; cv=none; b=Iu8URyAOdD4AQEe2+RSIWZoCVxVowrMGW38MBhSWmBZwkwvkEVzeKoz0KufopQ+pcbmu5kjbk/FSsEivePv1CxdBM87Nf4ZG4KbPSNdFNvZLw8QLx0/Zg3tKAiDIKWd8IshFZkauT1nQIu/ZeBlxE+vMSgXZhDT38Fl9cXFVrsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719611248; c=relaxed/simple;
	bh=eqKROMoY55qQgw/C7WYzzcaFYkwuTX7pn/ahqKrAUto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwepKEvCHNt3xi1ZZmEz/SN694a7D1Wl5ezZyYm2Eu0v9O8WkwvdWFiZT8X5rHqTR6pNyD1B2HQVuAzv6D8YglDL+ui6D3rmW5KZ5p6CYm9L8J4GBMAALbHZMlkPXrmCucHbx58OyIMse7krwh68hZXCeJGhgo71p247Nrzmdrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N37m5O1h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906E2C116B1;
	Fri, 28 Jun 2024 21:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719611248;
	bh=eqKROMoY55qQgw/C7WYzzcaFYkwuTX7pn/ahqKrAUto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N37m5O1hwUMCn8iQCaU9/rQmLds0jhf48g0vpbCVruTBaITXhu04rNbDoqkmYIZWa
	 M3C6QzxfUkkCuElGgS9T2z2/QMb4xbaI/5MKOyrl2JmcMxPJ+UoRMFRJnM2MmbeupX
	 kSorp2TfvaZmiRaaJ1fHBpBFZXOPJ335kTp4eGG63gooK3o6m6STqkXpymms+t+WHp
	 LLuvu3oL08cbDPMTEK384ec/Zcoi14ttnlBSpqEimnJo/jIWToMCbY7EL1ziEjR6qi
	 YhDYxjOmLo0oa7T49u4D+WmU8qYRmf6jF5kujM0efjokCVKFs3S5/1UewTqn9lFasD
	 Vk9eXPnbtz/wg==
Date: Fri, 28 Jun 2024 15:47:24 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	James Clark <james.clark@arm.com>, devicetree@vger.kernel.org,
	Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tao Zhang <quic_taozha@quicinc.com>,
	songchai <quic_songchai@quicinc.com>, linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: Add arm,trace-id for coresight
 dummy source
Message-ID: <171961122510.264738.11293838583492040813.robh@kernel.org>
References: <20240626060724.28862-1-quic_jinlmao@quicinc.com>
 <20240626060724.28862-2-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626060724.28862-2-quic_jinlmao@quicinc.com>


On Tue, 25 Jun 2024 23:07:20 -0700, Mao Jinlong wrote:
> Some dummy source HW has static trace id which cannot be changed via
> software programming. Add arm,trace-id for static id support to
> coresight dummy source.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


