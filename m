Return-Path: <linux-arm-msm+bounces-71448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7610B3EEC0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21A941A885D5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3732F34DCF3;
	Mon,  1 Sep 2025 19:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eX/2DigA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027A334DCDE;
	Mon,  1 Sep 2025 19:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756755985; cv=none; b=jZCIPZ1re7Rn2KARrUXBKR2chdyGCYhcUsWFYpfFYHuMrpIgVRzePo9nPE/QwZAXeeiadZ0BtFk1oiC4ArIpSRffXCMHfueBJIwiCVLWXR9DXqUSmdgROhrTF9CrFqFMyxkNe/r6+R4D9GvJPHaeUMQC/Fn5ogK2UIF1X0dZ4FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756755985; c=relaxed/simple;
	bh=xn/VcIgzHE0PmB/v3LOHApTytoYKXknTVhZ//rRTXPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DYmasV0k3dmF6E0KswWBSO2Ri9f4ScarF+i6EImhsPlcH0uag6nuKE44j5X0h6jCMO+XcEU5cd3qlyT6WbEMZTzXrzkQhLs4y6z4erTOMEWM0KnYQBjFgLberwQKLK3iCadrWXSnTRhHIiAo99S34exZjHOrHZGJntVUkPcd5W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eX/2DigA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D6EC4CEF0;
	Mon,  1 Sep 2025 19:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756755984;
	bh=xn/VcIgzHE0PmB/v3LOHApTytoYKXknTVhZ//rRTXPg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eX/2DigAipoH8LZ1yzPeYdsSTG9icEIzHyLoMY2pMGhuWVPHCgJZ65ckmSe1sMXpZ
	 y89byCrXB+rnPDy/nko/utRST3mAqrGrlWyvIT7QeotKTOIaz39XoQ/FnFRvrx/w1U
	 dJFrHW7EAqvu9TAJ+NPak6NnCWTU9TqWFVx144Q+abQitQd4GbmbcyddYkgIh2Ivuf
	 /SILTe45+M4N4KFCXF6v7PnFD7SNLuZXbfIcjDRk+UgTcUvfxgt6LY7epKfLVzjiaE
	 QJZeBcvYSfn600h2ocld8oOIm0CU3OuyqwOPTb8c64fOBGuz2XV/5UFUx/Stjwg5xl
	 rsy5eyU7yxFKw==
From: Bjorn Andersson <andersson@kernel.org>
To: srini@kernel.org,
	amahesh@qti.qualcomm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	Ling Xu <quic_lxu5@quicinc.com>
Cc: quic_kuiw@quicinc.com,
	ekansh.gupta@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v10 0/5] Add support for gdsp remoteproc on lemans
Date: Mon,  1 Sep 2025 14:46:05 -0500
Message-ID: <175675595927.1796591.9742902752337762891.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250813030638.1075-1-quic_lxu5@quicinc.com>
References: <20250813030638.1075-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 13 Aug 2025 08:36:33 +0530, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GDSP remoteprocs. GDSP is General Purpose
> DSP where tasks can be offloaded. Add fastrpc nodes and task offload
> support for GDSP. Also strict domain IDs for domain.
> Patch [v9]: https://lore.kernel.org/linux-arm-msm/20250716132836.1008119-1-quic_lxu5@quicinc.com/
> 
> Changes in v10:
>   - Rebase patch because the file is renamed to lemans.dtsi.
> Changes in v9:
>   - Change the patches order.
> Changes in v8:
>   - Split patch.
> Changes in v7:
>   - Edit commit message.
> Changes in v6:
>   - Edit commit message.
>   - Remove unused definition.
> Changes in v5:
>   - Edit commit message and add sapce before comment end.
>   - Move domain definitions back to driver.
> Changes in v4:
>   - Split patch and change to common syntax.
> Changes in v3:
>   - Restrict domain IDs to represent a domain.
> Changes in v2:
>   - Add GPDSP labels in dt-bindings.
> 
> [...]

Applied, thanks!

[2/5] arm64: dts: qcom: lemans: add GDSP fastrpc-compute-cb nodes
      commit: efc28845524843f199e420695eab3841299b05d2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

