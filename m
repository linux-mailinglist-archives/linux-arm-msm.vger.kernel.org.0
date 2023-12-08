Return-Path: <linux-arm-msm+bounces-3959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 843F080A58A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:33:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B671D1C20D4B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124FD19464;
	Fri,  8 Dec 2023 14:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="v9/gjCb5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7KgWsTdQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D65C1712;
	Fri,  8 Dec 2023 06:33:16 -0800 (PST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702045994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1ifPekkHiXm+lcwtuf5lbbYNKF0qvQaOPaFCAVY6Z3g=;
	b=v9/gjCb5yzOa/MONNnVonsIQDXSguuXkH6dOQXz1HZQnwcireIC9FcfuhQAiVx1BzFbNwk
	tJv2phQFVrHSaw7Dkzi1yU2JEL4P7E7Y63i5IYfTOXyJX5a1SmwYz7Ludayt6yCTremiSi
	8+13LSJoMNwgznljoHKKeHY1tsyAJ4fX5m0TSpP64E3lYouhrVMhG67yBo5ghxr29pCOD8
	7ExhXhQ8KfNxPKNGnLjI2zlhPmJqXLeApI0Cl7WPxSS1JkVFZv7vw/RW9Lwb+hJ6EWXdkA
	ZGpcr7zV8VqaaTZL+p549o4Ed8khn9o4NnXZm168z7pvEVy4dvu916MGnUoMfA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702045994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1ifPekkHiXm+lcwtuf5lbbYNKF0qvQaOPaFCAVY6Z3g=;
	b=7KgWsTdQrZJiDvbEvccaBFpNsVcf/LlEosW+NC3hpa9G7kMBm+bf9ksp/OmQSoU6EpCoU+
	W+nlmI1tJxHN8lDQ==
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawn.guo@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v7 0/2] Resolve MPM register space situation
In-Reply-To: <20230328-topic-msgram_mpm-v7-0-6ee2bfeaac2c@linaro.org>
References: <20230328-topic-msgram_mpm-v7-0-6ee2bfeaac2c@linaro.org>
Date: Fri, 08 Dec 2023 15:33:13 +0100
Message-ID: <87il58sr12.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Konrad!

On Mon, Nov 27 2023 at 16:52, Konrad Dybcio wrote:

This list of version changes is useful, but seriously not on top of the
cover letter. It makes me scroll down 60 lines to find the real meat.

<SNIP>

> Depends on resolution of https://github.com/devicetree-org/dt-schema/issues/104

Is this resolved? I can't figure out from this non-format whether this
belongs to V1 or to the actual cover letter...

> The MPM (and some other things, irrelevant to this patchset) resides
> (as far as the ARM cores are concerned, anyway) in a MMIO-mapped region
> that's a portion of the RPM (low-power management core)'s RAM, known
> as the RPM Message RAM. Representing this relation in the Device Tree
> creates some challenges, as one would either have to treat a memory
> region as a bus, map nodes in a way such that their reg-s would be
> overlapping, or supply the nodes with a slice of that region.
>
> This series implements the third option, by adding a qcom,rpm-msg-ram
> property, which has been used for some drivers poking into this region
> before. Bindings ABI compatibility is preserved through keeping the
> "normal" (a.k.a read the reg property and map that region) way of
> passing the register space.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Signed-off-by on the cover letter is completely meaningless.

Thanks,

        tglx

