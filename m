Return-Path: <linux-arm-msm+bounces-26028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D613192F944
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 13:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AAB5B212A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 11:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905D815B0FE;
	Fri, 12 Jul 2024 11:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+LmOE0v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F579155C81;
	Fri, 12 Jul 2024 11:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720782321; cv=none; b=nn+LZ32AI4/wNyq8Qf6ruQV2X7ylA7Sd5FP/SK17J1P6OPZieuPWG+1F0uiB8NcfoNINYoInSOCEWNJxup8Vg7ldPrq+qQEtcM5o8murQxzCjHLwK82H1rJu3cMXy9/4bvT4GZqc8HfYAv6dkQmLpkB6kNkzwVFuK/qpeSBOolo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720782321; c=relaxed/simple;
	bh=unUnZrzQDbLTHX8IxU2OqJG/Uuo0p7Wp3yVGpGZ1y3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTuOAiqo5rdfDNOKCx/YWBXZxVTjoEuHoZZvzaUCHRIk2IMbpNo1xUb4/131CK/60Q5oqhEoiz+pgoP5590fMrLWnK5voyvrGZQMCbFwqB5JBZyUhSe+tOHM6F/ErAHJj4lad8jyIPX4lumtY8mj2iDv+7skm+XltaLS+kXZ6s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+LmOE0v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7314C32782;
	Fri, 12 Jul 2024 11:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720782319;
	bh=unUnZrzQDbLTHX8IxU2OqJG/Uuo0p7Wp3yVGpGZ1y3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+LmOE0voQNkdTM24c6YelqbF+WKuW+aj+ega3wVdAb5wfTi+2DRDmng8t7oTE1vN
	 vGBL1sDF8MctKfKtvB9fSb0HdIJgcAxcJ5nqRekWMbvoLDqhE1enQI8dPk5dPlyXUy
	 hHhpdhXlEo0bRzo4hqoou+hL+3dfgUYttFBJrik84TRJD1MyD43gejG12tyPymfMQu
	 OCPpTCFATrFNVVl1pduJEpQ976NHLew4bJxTPdDJ+YI9stXRT+cjOLCjtOfqJsGlca
	 S07hQfLBdp8L90Aw8tEOofXxDYx8vUHRZyKHcKbLZ+Zc+cXrmN5msLWh/L0Q7prnbb
	 vEeIu/T4Y3dhQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sSE5W-000000001YH-2ZN0;
	Fri, 12 Jul 2024 13:05:18 +0200
Date: Fri, 12 Jul 2024 13:05:18 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-crd: Add LID switch
Message-ID: <ZpEN7u0u4LSFY01p@hovoldconsulting.com>
References: <20240710-x1e80100-crd-lid-v1-1-0156e8a62af6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710-x1e80100-crd-lid-v1-1-0156e8a62af6@linaro.org>

On Wed, Jul 10, 2024 at 10:18:20AM +0200, Stephan Gerhold wrote:
> Add gpio-keys for exposing the LID switch state, similar to
> sc8280xp-lenovo-thinkpad-x13s.dts. Only the GPIO number is different.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Looks good, even if I can't test it currently with the debug board
connected directly to the CRD:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Johan

