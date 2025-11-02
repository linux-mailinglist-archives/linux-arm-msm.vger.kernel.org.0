Return-Path: <linux-arm-msm+bounces-80023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F1CC2922F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 17:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A42CF3B07C3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 16:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2344323ABBF;
	Sun,  2 Nov 2025 16:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkbOyjCA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3275502BE;
	Sun,  2 Nov 2025 16:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762100647; cv=none; b=Xk9waR8S8k/EIMy7qB5v5aXyH8qSrsCbgyGkV1/Wsde1wXUkWkveGc5E9NIg5vg9+f32siPS53/hZGrQM2/LpuTRs3syBbFAf81iRg4GzMnR9oHRJ2RrI6KHccrjbM9qbdgrQ7Z0yfUrUlDTtVF4Fmhvo77lacHOvs9XdFIRv2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762100647; c=relaxed/simple;
	bh=uu91XHOIZ8NPTqjtls5WKXmrwFqDksaWNDOj6Fc7AO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3Stl+2f+nfDYo6KorgGGFiqGaafMxrfLfrfpqk2jtS0CRl03SH73l9mazg0iTibfGioDDszOctwfz8fL4wujfzKAtJeuSTxWKeJx/8iRIZ5bb7zjv/U6VGZPZxfcVT37llCeR83Pxb94ZL7TCauS7SGHyShaE9vtxJiqtxKcQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkbOyjCA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E6EC4CEF7;
	Sun,  2 Nov 2025 16:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762100646;
	bh=uu91XHOIZ8NPTqjtls5WKXmrwFqDksaWNDOj6Fc7AO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YkbOyjCA+AHXM+QUbzMdp+UejXgcjHevHEyPMFTNDKZlk4N9eD9SzM3UueSNtg1qa
	 X2cZal9JNYqtUva6aWZoDHn37fyQGKg8xXptd9n3mnGH3ucjQVbMjh5WmC7jyJ6CmW
	 Zw2sZvp3hMyF7zCsbZLGrTSpSdc8MvdLId9TlMqRxnraQEYeLa+3jTmemon4+WyvHi
	 TmfcqIYFtm7a3YTxg0xbWhyNNwBXfNQoIQfF9qm8LItr+hwcmog40RqRzZ9JtYnNRA
	 eKJZe4jL/qvaHtVm1N0MyaLwvlIejQi/0ZSWjnfonzNZezOpO+YwTVmvJKszfiuj3q
	 wZZy0iPDdWDvA==
Date: Sun, 2 Nov 2025 17:24:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, broonie@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, perex@perex.cz, tiwai@suse.com, 
	srini@kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org, konradybcio@kernel.org
Subject: Re: [PATCH v3 3/6] ASoC: dt-bindings: qcom,lpass-va-macro:
 re-arrange clock-names
Message-ID: <20251102-thundering-nimble-mongoose-c2bcac@kuoka>
References: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251031120703.590201-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031120703.590201-4-srinivas.kandagatla@oss.qualcomm.com>

On Fri, Oct 31, 2025 at 12:07:00PM +0000, Srinivas Kandagatla wrote:
> re-arrange clock-names in the bindings to be more specific to the SoC
> compatibles, this will give more flexibility to add new SoC's which do
> not support some clocks.
> Move all the clock-names under the SoC compatible rather than keeping
> int on the top level, this makes it more align with other lpass codec
> macros.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,lpass-va-macro.yaml   | 35 +++++++++++--------
>  1 file changed, 20 insertions(+), 15 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


