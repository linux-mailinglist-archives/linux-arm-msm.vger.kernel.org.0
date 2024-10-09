Return-Path: <linux-arm-msm+bounces-33741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FDD99778A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 23:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87699284A24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 21:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67661E25F6;
	Wed,  9 Oct 2024 21:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dte6lDD4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A5E40849;
	Wed,  9 Oct 2024 21:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728509564; cv=none; b=kebb7C8Gbb3akm5iJEu0IHKfIHsjuLqO80SjxLkIywVhtD/fyL++LhfHtJXOvEEJfxUooiwoPtGrzQ9L678sqt3OgtO9wjfclgVLfOML0KEX11/q0OGqn8FNY6c1sUiF8XTnQM3ilAwgPeFTF32Z+tqdGtkfRZCeAVEAU/V76kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728509564; c=relaxed/simple;
	bh=k4l2bGxX3ZLEwSZGVSUBeP6tqyyYf5DoUtxR8lkUQnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjwjKG4OM6wJEb/hfzwPjrNRP28+LaXcQu5cLGVuTHI9r/FtmnmZt3bVFo4iClEYFYwk9vtUUpIB/HcfwHN2XtC4AgN1+OpXpCR58/l5GVXhhyIAIawW68oB7Sx95xPek9pazLKbNBLKc5aaRU/d7xZKMEtzwOW4fXT5ud7JTbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dte6lDD4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08140C4CEC3;
	Wed,  9 Oct 2024 21:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728509564;
	bh=k4l2bGxX3ZLEwSZGVSUBeP6tqyyYf5DoUtxR8lkUQnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dte6lDD4x3WQww5KVG7zR1g7a7pBEF0d/UV/fJIK9MEFrOzakuj5kyAY2D0GS9JgS
	 gqS+cMcTlz5Q3qLXrNuxojFFe42fCy1I8ryQNohVtP10NlVG3zBWxBV/IfvXN21OCk
	 nsyJ5QCYYb7BGozON355Cnom8QwBu9cW4ffk/A9smxo7fl6vgXlksjSnl+txGNApiS
	 pkUXbQW7NyG1adXWlglKJtcoXukki7QrXebulv4EVA8dKYfKBXjna2ULAJS/ND/cQd
	 gh3//3mNVCsgtZsYKm3tMZLejoixOSMG1awrbgf5x7PwDtmSDLygZCtwbtD+weZkmn
	 a/Xj9gRuVTALw==
Date: Wed, 9 Oct 2024 16:32:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, Mantas Pucka <mantas@8devices.com>,
	quic_ppratap@quicinc.com, Vinod Koul <vkoul@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	quic_jackp@quicinc.com, Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 3/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb3-uni: Add
 QCS8300 compatible
Message-ID: <172850948209.746650.7541249019180404346.robh@kernel.org>
References: <20241009195348.2649368-1-quic_kriskura@quicinc.com>
 <20241009195348.2649368-4-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009195348.2649368-4-quic_kriskura@quicinc.com>


On Thu, 10 Oct 2024 01:23:47 +0530, Krishna Kurapati wrote:
> Update dt-bindings to add QCS8300 to QMP Uni Phy list.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


