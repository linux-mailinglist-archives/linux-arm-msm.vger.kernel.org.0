Return-Path: <linux-arm-msm+bounces-62884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E44B0AEC1D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 23:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33D4A564D7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 21:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063B925E46A;
	Fri, 27 Jun 2025 21:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKMM4ZPH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA95E25CC57;
	Fri, 27 Jun 2025 21:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059165; cv=none; b=XtDtBt15iyfR4JQzagl3qMoVcodmnr+krH2XTmW4H2EQ+ksSc8CdGRDZ499jUEAUSQgxhJNptcAogVf/YqDdylJZFfK5Ni9vEVanBmSa1zbhOp4mdFrj+odPCtQf/XDkvPHXKJSav1/Mizld1B4C3WoKd8VdWS9/cB+EEftOrOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059165; c=relaxed/simple;
	bh=9JNcIWRH2v6P/Sbb+bgcwepnMw48U5U73p8nACiIeO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSt2+do6+6NIMb5YokgY4KvWwl9FRU/a7xAKGzcxICdBhVSlb9eIPNlmI7J63G7bcKQX1hGgsbZXAe/Zz2wv66QhsfgJPX5hfgHMtjdaoZd+XUOScs8kVJON1wxAycZTxmqd8Y8Zf8haAfA4EsYZ40rSZnNYI5G6c9dHS5HVuq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKMM4ZPH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C34C4CEE3;
	Fri, 27 Jun 2025 21:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059163;
	bh=9JNcIWRH2v6P/Sbb+bgcwepnMw48U5U73p8nACiIeO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mKMM4ZPHsHKC7elUTQYw7FZhvGBpllKGWQDcQPuGO/rqeC/yEOKMKb1+gvK6npK+h
	 WIzIfAcj+8hZ+x5RRFgMcG38j5JdtTelilcmdypZHQCguX4jHf3DzfHq12l1s9AGtk
	 /nu9/Js0OVCKHMXSAwkag0FcQ2l4w/woNqyWC5APLrTv4CVkzSsOytxLtVw/uOLp90
	 5zZPpl5KM6MCTxp1lvWXbUYR4za80VTjit5G0nFkESZQVd3bIxC4of4P+Hl0HP/tgA
	 e8cQa2Rt76XCtH8j2VovJ3Vmo4BIcRPMObacByuMxxvGahmycrxePQuk7MELDeu3/0
	 5HngcU9+grV5w==
Date: Fri, 27 Jun 2025 16:19:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cristian Cozzolino <cristian_ci@protonmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, phone-devel@vger.kernel.org,
	devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Flipkart
Message-ID: <175105916214.161122.10408553923321798480.robh@kernel.org>
References: <20250626-rimob-initial-devicetree-v3-0-4017ac9fd93d@protonmail.com>
 <20250626-rimob-initial-devicetree-v3-1-4017ac9fd93d@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-rimob-initial-devicetree-v3-1-4017ac9fd93d@protonmail.com>


On Thu, 26 Jun 2025 00:04:26 +0200, Cristian Cozzolino wrote:
> Add Flipkart to the vendor prefixes.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


