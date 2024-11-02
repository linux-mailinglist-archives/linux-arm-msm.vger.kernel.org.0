Return-Path: <linux-arm-msm+bounces-36817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 809D89B9E07
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 09:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B61201C20B77
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 08:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9D015957D;
	Sat,  2 Nov 2024 08:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dv0OYtcp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EA1158DD0;
	Sat,  2 Nov 2024 08:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730537896; cv=none; b=lKhB31uW3HHaVk87BYafHiEXk+4eHDNx30hXZtDL/5P17BbKuz87J1t44oQE/gm2Bm0zWhCKZCa3Dwm0Kqp7IzXHZ85i3d51p9P5GHVhhncU1raIKinOGQTLhDg1fw3xt84czynGIw7k/qeCj6jygIJtS2KPC06jRurd44UjunQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730537896; c=relaxed/simple;
	bh=7uwzhKkWx0dLyxsAD8yv9DMaaaL9n66wF9/rBZUhVT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UulyEp/KwVjXGBkHHuEZdHMfDJTWZ9HC5m64JmFges8tonkNzo2hslBVMuxym2PdTnHrImw9Ws9t5Cq65gESjDGcNPwMYQUnhzjxUmXAMO5NkIv5oVe1WHHzYwMwcGMwtDERrqy7LFrMMj+wg1sTNS0V9oKYNFTTdcO5rhA0nyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dv0OYtcp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 705C1C4CEC3;
	Sat,  2 Nov 2024 08:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730537896;
	bh=7uwzhKkWx0dLyxsAD8yv9DMaaaL9n66wF9/rBZUhVT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dv0OYtcpsTAJLktCdnP9aLrPAF8MeGoO9LMcHmzF0Z0cHrS8XobUIKmPYcnvytA/s
	 UrBljdZh2H1/godj+XMTPiJWxfB36A2lpu3jN6K5riOWnqPk7DA7n9oEz4ta5m80T+
	 mIjD8oQptYjIo2n12T+ALrxwIl6sjrvQojL97glNeXjBSHQdKwU3xvZ4N078QbNtbA
	 mZEaKNmpWj5TF2Ze/6jXOJYS5V3LqH/aBJxP8J2U4bfmUsmWeJ+33QuQ78afX2GwPm
	 F2Vw/CQVTQ4tbhOvTc9PrfWP1wkG+SbqreUhPUVAxT8CIjc/52e4cKVckHVG4d0qIl
	 I3N+5omcks3lw==
Date: Sat, 2 Nov 2024 09:58:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: usb: Add Parade PS8830 Type-C
 retimer bindings
Message-ID: <fzqkcpmww65ubqluyy42q2hl6nwhxabwchcaul3ocqjdwhuuo4@dcychynbcstc>
References: <20241101-x1e80100-ps8830-v4-0-f0f7518b263e@linaro.org>
 <20241101-x1e80100-ps8830-v4-1-f0f7518b263e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101-x1e80100-ps8830-v4-1-f0f7518b263e@linaro.org>

On Fri, Nov 01, 2024 at 06:29:39PM +0200, Abel Vesa wrote:
> +$id: http://devicetree.org/schemas/usb/parade,ps883x.yaml#

Filename based on compatible, so: parade,ps8830.yaml

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Parade PS883x USB and DisplayPort Retimer
> +
> +maintainers:
> +  - Abel Vesa <abel.vesa@linaro.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - parade,ps8830
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XO Clock
> +
> +  ps8830,boot-on:

I don't see previous comments addressed/responded to.

Best regards,
Krzysztof


