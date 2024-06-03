Return-Path: <linux-arm-msm+bounces-21478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D8A8D8298
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 14:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42C31B2326E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 12:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7756212C520;
	Mon,  3 Jun 2024 12:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pNyzT3G8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A47912C49E;
	Mon,  3 Jun 2024 12:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717418597; cv=none; b=Va9fzDRMuWPsijRbyUpyC5om34GJVfP91rnVLQ5QjgT8nmjYCAIj8amRBnJV3JAzVOf/OKhDXqUwIWO+nWitUgQ30JJTwtzcP6ynIxD5VH1mcFXp8TZcOduwhudkN/lvlpnNUHy+8rn9p39/e2eX6gDyYz5wUx7m7MFK+vdCSiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717418597; c=relaxed/simple;
	bh=i3lDKw5djP+fp83cE4kSzg6UdwUoiQZr2LDyo4bms+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qe0+vFKYeZ+f7PGh/YO5Nlc3nGTxIXvYEMukdOXMUBvpAlrlKifox8+gS7fTYlj6CpZ97IqU3jfa2rW1PoQ+91jMb3ehbX7mpR8xhEckm6QzXJznGErVXkrooOUPhc2Bj25FNezYziNcjGtTVyR2x1IKpWVlW+yLg2EmVEM195k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pNyzT3G8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16362C32789;
	Mon,  3 Jun 2024 12:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717418597;
	bh=i3lDKw5djP+fp83cE4kSzg6UdwUoiQZr2LDyo4bms+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pNyzT3G8I584aMxukYR+m/77Zul0hA0vZzt3Us/VprrUcEJv2N/66PX7gSM4JvNAK
	 V1gCR99VlB+ECWzZ39Rl4MEz97JiI72VUE1r1VoK9wHBaBHgApciO1GKJgIlZn2M2g
	 mvNd+GRYmbpbEqExwFsdoD/JUW2NuzL6qPReTqNZJk6Ac7x4BQcgi4c5fAkykObqqx
	 0uoGdwk/Ga4KNhpu3lKAdXx4Y/nyvAlTEM6JDIIoKzLadeYK1MFof0ejWchwHOfKiN
	 qf0nWw9HRlhmwCFQsEKju9pWEphCJLU8o+v0nkU7TXaOmiTMwcA75T5Z34FC5U6Ioc
	 ROYrBz460yfdA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sE71v-000000000hP-0EBr;
	Mon, 03 Jun 2024 14:43:15 +0200
Date: Mon, 3 Jun 2024 14:43:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document the X1E80100 QMP PCIe PHY Gen4 x4
Message-ID: <Zl26Y0VklPmiirem@hovoldconsulting.com>
References: <20240531-x1e80100-phy-add-gen4x4-v1-0-5c841dae7850@linaro.org>
 <20240531-x1e80100-phy-add-gen4x4-v1-1-5c841dae7850@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531-x1e80100-phy-add-gen4x4-v1-1-5c841dae7850@linaro.org>

On Fri, May 31, 2024 at 07:06:44PM +0300, Abel Vesa wrote:
> The PCIe 6th instance from X1E80100 can be used in both 4-lane mode or

nit: s/PCIe 6th/sixth PCIe/
nit: s/from/on/
nit: s/both/either/

> 2-lane mode. Document the 4-lane mode as a separate compatible.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Johan

