Return-Path: <linux-arm-msm+bounces-768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C8D7EDCCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 09:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCD7DB20A57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 08:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA92710A14;
	Thu, 16 Nov 2023 08:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLCiHuXi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB1E33D4;
	Thu, 16 Nov 2023 08:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF7DC433C7;
	Thu, 16 Nov 2023 08:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700122964;
	bh=gS8VWlvt+EbxksnEGUZohKLfR580uh60rnAxbfZfgCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eLCiHuXitSNnOHynfl1TikO2n4fkPy1lTMuHAQsagac+05mF8d5tNMFcu0UN7xVEJ
	 JHlIO674lBqfSNQtS/rO4JXeby5LkkY1wyAAtDQnjYxiS25w/lLLKG2GCQ3vECHvMr
	 Kl993lcBKNpDTfEc4D6HLyS4ekQjRS5jrr/BLBaE5xsogf/D35JgRyW6AIVl/AFfiu
	 vjm0vx5pve1M+sjANGQvUVnWnRLfjW7ASxsvQ3PEBemZYJtta7IDztI0gtJLzFbXuA
	 U5n4T17vORItBU3X8uKk4Xo8r4SPiJjQJtGuH5puvFsmw/GqynOqkiGInzICJotYdf
	 zP5o0FhFHdc7A==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r3Xe7-0008Ls-1z;
	Thu, 16 Nov 2023 09:22:43 +0100
Date: Thu, 16 Nov 2023 09:22:43 +0100
From: Johan Hovold <johan@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, swboyd@chromium.org,
	linux-watchdog@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: sc8280xp: Make watchdog bark
 interrupt edge triggered
Message-ID: <ZVXRUzoTpZ3JNvDT@hovoldconsulting.com>
References: <20231106144335.v2.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
 <20231106144335.v2.7.I1c8ab71570f6906fd020decb80675f05fbe1fe74@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106144335.v2.7.I1c8ab71570f6906fd020decb80675f05fbe1fe74@changeid>

On Mon, Nov 06, 2023 at 02:43:34PM -0800, Douglas Anderson wrote:
> As described in the patch ("arm64: dts: qcom: sc7180: Make watchdog
> bark interrupt edge triggered"), the Qualcomm watchdog timer's bark
> interrupt should be configured as edge triggered. Make the change.

Please always make sure that the commit message is self-contained, and
especially when you're referring to patch which has not yet been applied
(e.g. consider someone doing git blame on this line some time down the
road).

Johan

