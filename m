Return-Path: <linux-arm-msm+bounces-41314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8A09EB1DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 14:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 609E7285113
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 13:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526B71A9B2B;
	Tue, 10 Dec 2024 13:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Avlx0FOc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2138341C64;
	Tue, 10 Dec 2024 13:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733837241; cv=none; b=A3AGjGMOiAuXFRTvIRAHms7/MEvnKLvSU++j3iBlLPAenZNqqMO++w2Cx7aN4nLwRgkLNyoi65P9wE4olm0zb++uwg5XiLarkraSxi4L84jD3cVq7UoxSN2K+L+gP4yL1MaBZB5/U7bPuYxzUzNdQmZEajV/SP2UPZJZ9FWY3TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733837241; c=relaxed/simple;
	bh=4GUOAJnO+Ff2qNvgD//gQ6bsOnPHFswMxK4h/Ko2Icc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kl9ZXPlpNsCFMoPvrdsXB0m+nEjO7kzs3gJTVT1w5nJboCbu9pDsTVPwSAg7MizhaxBazmAy7/JXghnw/M1hp6XhOLfGkwaOn8/uzGojgBgE3Sn8mLsuBM40oKIiI+ed0Pd4mVKDUvDyzbZTR77YjAqT3jghLvdyjfUlzvL988A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Avlx0FOc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E816C4CED6;
	Tue, 10 Dec 2024 13:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733837240;
	bh=4GUOAJnO+Ff2qNvgD//gQ6bsOnPHFswMxK4h/Ko2Icc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Avlx0FOc7L7HB5fL5ZPiT4zdMVFOhtSL20HJD2Pf2UGT5lHAh0W2ux7jbHQbN1R+h
	 ws4tXO2FHBJuooY46JPyY3JR0HbIbx2PKsmnxbszBRG7YuJz5pkDYgSHLiCAD/N1xA
	 GsQMRqlKx+hECfBhINf7CpV3w03/3XM1ehjOl1qzF9P6VFOFl7QBrOnBWyiQ7CAHA3
	 XugFf0b9F4IHMpTo8CRUSzm1AAaZeAj7yBI9B0+Mdd8N13W/Pdy+YfjjtWRihlVFDZ
	 xmt/bhDTmyUVJ9DgfxXvmG9MZ7a179gQVAX58Yn+M8EYiDg/mk6y2r2BMsnHeiWStz
	 uohI3KLRtto3Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tL0Go-000000002GJ-2wDZ;
	Tue, 10 Dec 2024 14:27:23 +0100
Date: Tue, 10 Dec 2024 14:27:22 +0100
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	"Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-pmics: Enable all SMB2360
 separately
Message-ID: <Z1hBuliHmuOkqTZj@hovoldconsulting.com>
References: <20241210-x1e80100-disable-smb2360-v2-1-2449be2eca29@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210-x1e80100-disable-smb2360-v2-1-2449be2eca29@linaro.org>

On Tue, Dec 10, 2024 at 09:36:01AM +0100, Stephan Gerhold wrote:
> At the moment, x1e80100-pmics.dtsi enables two of the SMB2360 PMICs by
> default and leaves the other two disabled. The third one was originally
> also enabled by default, but then disabled in commit a237b8da413c ("arm64:
> dts: qcom: x1e80100: Disable SMB2360_2 by default"). This is inconsistent
> and confusing. Some laptops will even need SMB2360_1 disabled by default if
> they just have a single USB-C port.
> 
> Make this consistent by keeping all SMB2360 disabled in x1e80100-pmics.dtsi
> and enable them separately for all boards where needed. That way it is
> always clear which ones are available and avoids accidentally trying to
> read/write from missing chips when some of the PMICs are not present.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Makes perfect sense:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

