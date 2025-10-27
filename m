Return-Path: <linux-arm-msm+bounces-78988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB74C0F47C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 17:29:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A85094E06D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 16:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15EF312837;
	Mon, 27 Oct 2025 16:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tDQrWuXh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76184307AFC;
	Mon, 27 Oct 2025 16:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761582569; cv=none; b=GrczWMN0e8WbgRGoNLA95mUhaoFIdOGc8t2++BetTko3WcPSnvfu7bsqMr7XMdnu+pVLLNTartvClrSOGZzovZy+NFwviHAgMrtnOmr//5R9K3JMNYw9j+UdbbYocWRJeVIkwv3+ATkbvvri9ujyKVrX3xLcj0VpnweC1XsqtAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761582569; c=relaxed/simple;
	bh=+HEMJU04coowWSBBpHsy//YjtgafjGHYeOQzFMvBlwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owrXJM20+EEqQjAtel0VGihShzW+5BCvFj9YmzG1/5MVK17H1pVKrM3sy2bcZo0rPhclzw3TXBJ72ahYRwP/NFx/WAe7AQOepCkRBpniKjiv9yVSUJdNAeWaGMUkRN3JVLpyafG4jwENVxKbKDxcPvsQuDNdq1iRSKnwzWnq3dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tDQrWuXh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0329C4CEF1;
	Mon, 27 Oct 2025 16:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761582569;
	bh=+HEMJU04coowWSBBpHsy//YjtgafjGHYeOQzFMvBlwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tDQrWuXh9Aj335gu+t4ZhJjDyHzvZYI4+WkBaLG3wz70kPaoMmZTkxFSh2J02bwxk
	 /m9Nkgp8pf9E7xvBa9cfdr/7UcZ5rbFVVL/kyrAoHNztXGffM4zBAgRekjzu8nyAIs
	 9dUYv625GNG2Sx7MJDaayaFI8U2RSZftNHIkXuQTRB7S4xgSxzr514iXkf5XKLDR/U
	 OHJ85Vn5U8vjtwxJmLcZTT5zA+R6F76A6cUxmGKm7s+rGqbVJIhrzZveeShB8oYJ71
	 OpmHtgM0mOprMuWJiSeVjbA2eDZh2RNkLfGWbQ80viMXP3R2yjgn+SMUgQzTk0O4WO
	 zQ56jWKe4eNJQ==
Date: Mon, 27 Oct 2025 11:29:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org,
	David Collins <david.collins@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	jingyi.wang@oss.qualcomm.com, Stephen Boyd <sboyd@kernel.org>,
	aiqun.yu@oss.qualcomm.com, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: spmi: split out common QCOM SPMI
 PMIC arbiter properties
Message-ID: <176158256441.1074210.9426995798199315066.robh@kernel.org>
References: <20251024-pmic_arb_v8-v3-0-cad8d6a2cbc0@oss.qualcomm.com>
 <20251024-pmic_arb_v8-v3-1-cad8d6a2cbc0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-pmic_arb_v8-v3-1-cad8d6a2cbc0@oss.qualcomm.com>


On Fri, 24 Oct 2025 15:03:21 +0530, Jishnu Prakash wrote:
> Split out the common SPMI PMIC arbiter properties for QCOM devices into a
> separate file so that it can be included as a reference for devices
> using them. This will be needed for the upcoming PMIC v8 arbiter
> support patch, as the v8 arbiter also uses these common properties.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  .../bindings/spmi/qcom,spmi-pmic-arb-common.yaml   | 35 ++++++++++++++++++++++
>  .../bindings/spmi/qcom,spmi-pmic-arb.yaml          | 17 +----------
>  .../bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml | 21 +++----------
>  3 files changed, 40 insertions(+), 33 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


