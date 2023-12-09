Return-Path: <linux-arm-msm+bounces-4071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E6880B1D0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 03:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 561A6281843
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 02:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118DE810;
	Sat,  9 Dec 2023 02:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRADnnwR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17B77F;
	Sat,  9 Dec 2023 02:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CF7C433C8;
	Sat,  9 Dec 2023 02:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702090600;
	bh=kF832H0fKF35PnDkBc1TU6nVAAeUJbTnCpDpgEcU20A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mRADnnwR1RrSafNzakM7Psnj39z1KCu4ywwRaJbrO+dyq/dXIhCiIJIA05B5gUF4s
	 0TBqGNC5IOV5/ujB71+DZ2hWmJTE9mOEChKdf6bUVf091uGclOHQ5ed6XwQLyjSoBT
	 rCgI+8B372WhjyRcPX62eis0hFpTv/dtaOydmVaNLDGUW57k77rP+URa2xmZmHrrxI
	 Gpf7kEnxmkppD9iXcwYed6y1/fc2O9uCHU03qdWLwlDdL+YfFz0wsKmA6/5fUOo/gI
	 eZf3aTH/8viArL8lc+V/CQTS45+/CHnZZn6dzywpV7x1hjbwJFOXVW1mtpQ+bzBRzQ
	 HwzvI8C8c8Etg==
Date: Fri, 8 Dec 2023 19:01:14 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Nikita Travkin <nikita@trvn.ru>
Cc: Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: pm8916: Add BMS and charger
Message-ID: <mqfej3mkfbnfzdr3hlziw5jvlgceplqgzhh6yg5anfvqmopbxl@lezh2tmb2ryr>
References: <20231120-pm8916-dtsi-bms-lbc-v4-0-4f91056c8252@trvn.ru>
 <20231120-pm8916-dtsi-bms-lbc-v4-2-4f91056c8252@trvn.ru>
 <mmxk4dko6ib2pgrzcotxf65q5c7d4eaykd4sfh2ryrmfbdabd7@wnttadck2mda>
 <1a6be726b31919a31f369c64e75e0f41@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a6be726b31919a31f369c64e75e0f41@trvn.ru>

On Fri, Dec 08, 2023 at 02:19:11PM +0500, Nikita Travkin wrote:
> Bjorn Andersson писал(а) 08.12.2023 07:48:
> > On Mon, Nov 20, 2023 at 07:03:04PM +0500, Nikita Travkin wrote:
> >> diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> > [..]
> >>
> >> +		pm8916_bms: battery@4000 {
> > 
> > "battery" is not a valid child of the pmic according to
> > mfd/qcom,spmi-pmic.yaml, so please update the binding to remove the
> > warnings that this introduces.
> > 
> 
> This should be done in 1/3 which is already accepted to mfd,
> so the warning should be gone when the stuff is pulled together.
> 

Very good. I just didn't spot that for some reason.

> Sorry for not making sure it's in earlier

No fault on your part, I should have spotted it. Sending binding updates
and DT updates in the same series is preferred way, and as I don't apply
the binding through my tree these warnings show up there.

Thank you,
Bjorn

> Nikita
> 
> > Thanks,
> > Bjorn

