Return-Path: <linux-arm-msm+bounces-44036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD23FA03079
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 20:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 716C61885FB5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 19:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25041DF25D;
	Mon,  6 Jan 2025 19:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkxeFNxj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72F618CBFC;
	Mon,  6 Jan 2025 19:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736191338; cv=none; b=NnsFOJ1CUK3CTOGkuo9I05hai5RGqI+gNZTpfRXfDLGgX5AkNj2qDszkMNEj8wdVzzr3544el9s5eORH6XZLyhT64FMwxscRskpOxIMDf3AQNblzOsmMaz3gc5i24ccwmQGK6yw7uePvAFOEEUH3CprgMYSUB0kD6OWoRHYwVTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736191338; c=relaxed/simple;
	bh=9C1N0/vZNBneiNS/vhrs2GkVaFXnyxA9KNwev5FnjA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKFxZDPGeb8uGlxpxizSR3/QzO4lZSIo8LSOdy7m88XNPxxUgr2lLoR3J/NLkQ1lCPP6Px3i+oEsxlMcYHSmWv5bAIXFNFZWbNF62jsXvBzqR+99EeLDbQ0aR4ybqllHLAwogg5cNoR9ZDLX+RWdParWEqgy0OpGddQAI0xjMQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkxeFNxj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B321C4CED2;
	Mon,  6 Jan 2025 19:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736191338;
	bh=9C1N0/vZNBneiNS/vhrs2GkVaFXnyxA9KNwev5FnjA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MkxeFNxjXIHuJhH04tsOBSXYD6cluwZVcrOoe9nWDYa0p9f0FUY5aKD9J3ul40upb
	 H1KLWXY+XzQcpR5mnuN2qf9jbHmatCvbz41X/aBibRMy3fiAHDhSk7KLFWPBAjEXQV
	 27HGBl5GPpu97sZJFae4SUFV8+y4ZGtkkWG0SxUw8BXHy7EXDkqyH7KhS8zBb47cYk
	 k2hRJMZuo7k5C7nOM9K2HKf5Zhrm7aj6vkA5oJOP3UcFpu406fI/PSPlCSuZ0iuA2K
	 onwl4cPKBjvwJ7nLvyYjugB43lYA9uXl0Gx92WYa2kMW5k7HCYHhHeJR9eXda5Mvdh
	 XatJNm9dLb8eA==
Date: Mon, 6 Jan 2025 13:22:17 -0600
From: Rob Herring <robh@kernel.org>
To: Kyle Deng <quic_chunkaid@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com,
	quic_sudeepgo@quicinc.com, quic_taozhan@quicinc.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: mailbox: qcom,apcs-kpss-global:
 Document the qcs615 APSS
Message-ID: <20250106192217.GA830750-robh@kernel.org>
References: <20241018073417.2338864-1-quic_chunkaid@quicinc.com>
 <20241018073417.2338864-2-quic_chunkaid@quicinc.com>
 <38c8d6b4-8c0a-4317-afaf-7aacdb2bdb31@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38c8d6b4-8c0a-4317-afaf-7aacdb2bdb31@quicinc.com>

On Mon, Jan 06, 2025 at 04:24:05PM +0800, Kyle Deng wrote:
> Gentle ping.
> There are a total of three patches in this series, and the other two have been applied, but this seems to have been overlooked. Thanks!

That would be because it's expected that the mailbox maintainer would 
take this patch, but they weren't Cc'ed. Use get_maintainers.pl or b4 
for series which will call it.

Or Bjorn should pick up these trivial new compatible string only patches 
with the rest of the series.

Anyways, I've just applied it.

Rob

