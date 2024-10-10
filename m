Return-Path: <linux-arm-msm+bounces-33827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC900998233
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 11:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CFEC28A17B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 09:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172171A264C;
	Thu, 10 Oct 2024 09:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnGHnmWb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6A71A08C5;
	Thu, 10 Oct 2024 09:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728552594; cv=none; b=OUodFnzyzUk/IV5YdSkDYkhQz1dXVu1Aqx16jDERnpMhmMpAhnsTY69gB7CDHpxEWd6aSzcEqQ6j/Dt4lqHvSeThQQR3o1tN1qd+UFvS0shXBVfUZquLCg5GHmXj6QZ/73a1vQirwu9RwbwwnQm5oplu6+tboVSYOuiZnug86jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728552594; c=relaxed/simple;
	bh=wygPBK0maJmHMNj8t3gRaivMfDHnHdWPpKzMIB4FL0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7Hh3DkX3ODGokr+Uy/snAp5c0hgpRGa3UdnOk0B/DWj1mSUDZY3cH51upTPgTOKDJ5iNU7WX8AKoB6Em2YNUi9xoSiW4Ep5vTkmCNyhnNDF4JFX67VdJPiLs5qa3qZHlBX/H5LOa4s1GeJmmGpmUdqfgzVzGIxAxLud8a1vWiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnGHnmWb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E1AC4CEC5;
	Thu, 10 Oct 2024 09:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728552593;
	bh=wygPBK0maJmHMNj8t3gRaivMfDHnHdWPpKzMIB4FL0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnGHnmWbp+auJiEspx8VO/l5+R2+/CVeKtvukoRzdPnZnBGbrlUMWkAL/u4TP0goV
	 +iIWIzoKhALMHv2U6R0Gf4cEocuWNfK4T31OsRy6Eumua/goNV9uyqSCgMDbeKxJsz
	 CuYEZMAnElKoQ0jFtB0jQeKDV9YlZoeQkIvyF6LAhnj0isxX+G7EA53qR6dwx12v99
	 0JF22AbZmLHtlNAHhjWWa+Aju0kojicTM3cz9Y5womxQ05rgcZjVHce6rF8S3UqcR8
	 e+6VFODW/Bipgp1LJSZf12gzfoS+KZUoAZZ5wDksVRIh5tiUj8HHnf54cbWj9PS5pz
	 SRslHn/pxwZvQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sypUb-000000001X1-0lz5;
	Thu, 10 Oct 2024 11:29:57 +0200
Date: Thu, 10 Oct 2024 11:29:57 +0200
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
Subject: Re: [PATCH 1/3] arm64: dts: qcom: x1e80100: Add QUP power domains
 and OPPs
Message-ID: <ZweelaVcejunff6u@hovoldconsulting.com>
References: <20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org>
 <20241007-x1e80100-pwrseq-qcp-v1-1-f7166510ab17@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007-x1e80100-pwrseq-qcp-v1-1-f7166510ab17@linaro.org>

On Mon, Oct 07, 2024 at 08:22:25PM +0200, Stephan Gerhold wrote:
> Add the power domains and OPP tables to all the QUP-related UART/I2C/SPI
> nodes to ensure that we vote for the necessary performance states. Similar
> to sm8350.dtsi, the OPPs depend on the QUP instance. The first two
> instances in each geniqup group need &rpmhpd_opp_svs starting at 120MHz,
> the others already starting at 100MHz. I2C always runs at a lower clock
> frequency and therefore uses a fixed vote.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Looks good to me.

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

