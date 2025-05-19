Return-Path: <linux-arm-msm+bounces-58377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBA5ABB6FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 488263B90C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 08:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C92B26A09A;
	Mon, 19 May 2025 08:18:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51990269CE5;
	Mon, 19 May 2025 08:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642738; cv=none; b=iuvbslMF2FWeLTc5o8If1vpe+8pZ0tH5IwT5MIquBY9UFJsIPKmOkRQgjJkpHpUUjqBQ+58exrS9mMGFhD1gQCKdKSULiP84t99/RjruJ+FVjW9DpTCkSPJi7D4fcshvJtU0HQh3MUiEl02agH+xFDq3OQ2bDoUpr2KU5x3ZV9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642738; c=relaxed/simple;
	bh=SXu6wFYQBB6ePgVlqFrEo8pieN7ilI+ch3cz0SSz6R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVPPxkwRnSjcjnooH6XXyysVvr5t4ePwI8nxyvLjcDK/SeqT399ZZdwXI5nGlvo62PtDMS4JjtGD1yJFYdin4TvLDPk5ND9TUoWVUl9/RBnal4ivHTBONbZe3kUnwXbdVz2oVc7FiqoB0lkAcF4fva6jVK+cRoervEZ2KvBspEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6124DC4AF0B;
	Mon, 19 May 2025 08:18:57 +0000 (UTC)
Date: Mon, 19 May 2025 10:18:55 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 02/18] dt-bindings: clock: qcom: Update sc8280xp camcc
 bindings
Message-ID: <20250519-barnacle-of-beautiful-enthusiasm-4e6af0@kuoka>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-2-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-2-571c63297d01@quicinc.com>

On Thu, May 15, 2025 at 12:38:47AM GMT, Jagadeesh Kona wrote:
> SC8280XP camcc only requires the MMCX power domain, unlike
> SM8450 camcc which will now support both MMCX and MXC power

I do not see change to sm8450 here. This makes no sense on its own. You
do not move compatibles - what is the point of such change?

> domains. Hence move SC8280XP camcc bindings from SM8450 to
> SA8775P camcc.

Subject: everything could be an update. Be specific.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> SA8775P camcc doesn't support required-opps property currently
> but SC8280XP camcc need that property,  so add required-opps
> based on SC8280XP camcc conditional check in SA8775P camcc
> bindings.

Best regards,
Krzysztof


