Return-Path: <linux-arm-msm+bounces-33829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EF899825F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 11:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA8B22872CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 09:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C941A264C;
	Thu, 10 Oct 2024 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guTT+b+j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F3033CE8;
	Thu, 10 Oct 2024 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728552880; cv=none; b=EVDt0hx74Yl29KUJY/LyYLKgwKEIHkdxVvoU2N3YhfzQzdVw/u7RJyEOUwO84P9bMwSnEEZFkbl6FSDSvvWxdGYM+UKa9foLAP08yTmrc62DlcpOs13W3OX+LR997Lcca+5z1Rc0i+VTnsWQ+0vKqzoSHvB6nOp6GHBB7/OI/qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728552880; c=relaxed/simple;
	bh=dWfSFjkqfTJgifxqlOgIG/IsOAQZKlT3tfzmz+XaNrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxU9F6LxQ49WBziiipR0KoPKXI61Sjcm8bJjvGyUrz3rut3Kcz+3FNCLVGhU3b0k0myOSA1tXTOjZoSfQRabwK0MqTv0zDlTtDvdRyY6TwpMvqZmyLtQGx9F+5ghAOU5sJR9TzE8YYWwH+CoeXK7SwPiUHvjx/aTuNAVJQdC+NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guTT+b+j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73971C4CEC5;
	Thu, 10 Oct 2024 09:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728552880;
	bh=dWfSFjkqfTJgifxqlOgIG/IsOAQZKlT3tfzmz+XaNrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=guTT+b+jurmQHBP6Vh91ljDbL0KDxNByuebJtHcbp0k+5FmMcMYmsMmoIO4P+r4Z6
	 4XUwyHgFgKmcAjJspXEcEBflLShDb2PALJD2Er1RgztDxcDqGt6+57hZnXDqmfmRFN
	 oc5p/lRisRdu0+qXKJ1OmeP2aHkmbvobSGRMZJisjztkbyoaiUl1c7w4Xj19JKEd8b
	 XU7FOaut+Nnd+EpLJetsKaYv6nrvAtF9iQaYP7knOt+NXGRX0xZBktqG5YRw4GIpQc
	 2bXlzfdCxlXQN49fAvr6OfjrPf7M+LSaF/evT7jOsayvAwxpfLBlOkJzLGPOuNPdUV
	 3ZzizRZgniqZw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sypZE-000000001bV-3pNR;
	Thu, 10 Oct 2024 11:34:44 +0200
Date: Thu, 10 Oct 2024 11:34:44 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
Message-ID: <ZweftESPrJNEsqGE@hovoldconsulting.com>
References: <20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org>
 <20241007-x1e80100-pwrseq-qcp-v1-3-f7166510ab17@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007-x1e80100-pwrseq-qcp-v1-3-f7166510ab17@linaro.org>

On Mon, Oct 07, 2024 at 08:22:27PM +0200, Stephan Gerhold wrote:
> Add the WiFi/BT nodes for QCP and describe the regulators for the WCN7850
> combo chip using the new power sequencing bindings. All voltages are
> derived from chained fixed regulators controlled using a single GPIO.
> 
> The same setup also works for CRD (and likely most of the other X1E80100
> laptops). However, unlike the QCP they use soldered or removable M.2 cards
> supplied by a single 3.3V fixed regulator. The other necessary voltages are
> then derived inside the M.2 card. Describing this properly requires
> new bindings, so this commit only adds QCP for now.

Based on our discussions it seems we do not really need to describe the
internal PMU at all for WCN7850 (as the bluetooth and wlan blocks can be
enabled indepdendently) so perhaps we can just restore the old binding
and drop most of this boilerplate for all boards.

Johan

