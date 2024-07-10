Return-Path: <linux-arm-msm+bounces-25866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D07B92D685
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 18:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCBF72841B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 16:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89FF194AFC;
	Wed, 10 Jul 2024 16:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gG3tV/qN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCE6194A66;
	Wed, 10 Jul 2024 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720628867; cv=none; b=SYrUtjaDhiU5qrnoFOs8wsAbjpiz7A7SZMHsFf4YdFc8OblXvGywss+M/nb5zngPbkIqwVWEWJF7u1SSheSNXlFElh8jH7vWE4D43iD7L3vrkdV8xiqdyZEc9lN7TtBRDKNXSqh62rxZ7btHsNtCfZ6bqW4Sil1nPcuYpMJSD/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720628867; c=relaxed/simple;
	bh=TaQWp+cfnQ4j1Bv5I03np4F0DZRpYrtGyDGXjqfU5eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bojc8dqFYlr9IBTCRJB8bO4iteIVgjC/howa2yUmE4D384fwouUFBSGmqF0loPHz0iN+HbrLYRWaigcjV8D103bgxmXfFBjruXi8YpAr2WL2tV4ut/sblU4ldTGJMWJSz8qQtTAaZI6/9TIHRVopUA/+NAnNLW3KMrdRE/R7WXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gG3tV/qN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25F6C32781;
	Wed, 10 Jul 2024 16:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720628866;
	bh=TaQWp+cfnQ4j1Bv5I03np4F0DZRpYrtGyDGXjqfU5eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gG3tV/qNFxAOaFIVb8nvkjnNJs1m+LnG/+148o/J/s0l0Fu5XK71oplaIKs9jOhtr
	 poW2L2TsEhdss3jbmP0LuPiRH6rF2gZV7YenfwhOA2cQIA179BFAGv9MONpezpahAy
	 gMWicTb8KTiijROIKBn3t6e7sP9yPN5LqGcHe6AZ5e5Xz09aTM46ieqlnt46ZdelKg
	 +6iMJzpUqikk/fqbKWIBNAbxYk12kLi2077S/I9TWq8ttUUB3+fXDaaycEiAdgVbmS
	 vEJUBzMpu2HnD1sBOB212BI3HLweH99zn6gDQK28gAVPS9dv/Fy8nNP8Gi44etWQyd
	 JRfi+x+/j/hAg==
Date: Wed, 10 Jul 2024 10:27:45 -0600
From: Rob Herring <robh@kernel.org>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 bindings for QCS9100
Message-ID: <20240710162745.GA3212156-robh@kernel.org>
References: <20240709-document_qcs9100_usb_hs_phy_compatible-v2-1-c84fbbafa9d6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709-document_qcs9100_usb_hs_phy_compatible-v2-1-c84fbbafa9d6@quicinc.com>

On Tue, Jul 09, 2024 at 08:46:19PM +0800, Tengfei Fan wrote:
> Document the compatible string for USB phy found in Qualcomm QCS9100
> SoC.
> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
> platform use non-SCMI resource. In the future, the SA8775p platform will
> move to use SCMI resources and it will have new sa8775p-related device
> tree. Consequently, introduce "qcom,qcs9100-usb-hs-phy" to describe
> non-SCMI based USB phy.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
> Introduce support for the QCS9100 SoC device tree (DTSI) and the
> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
> While the QCS9100 platform is still in the early design stage, the
> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
> mounts the QCS9100 SoC instead of the SA8775p SoC.
> 
> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
> all the compatible strings will be updated from "SA8775p" to "QCS9100".
> The QCS9100 device tree patches will be pushed after all the device tree
> bindings and device driver patches are reviewed.

I'm not convinced this is not just pointless churn. Aren't we going to 
end up with 2 compatible strings for everything? SCMI should just change 
the providers, but otherwise the consumers are the same. I suppose if 
clocks are abstracted into power-domains (an abuse IMO) then the 
bindings change.

Why do we need to support both SCMI and not-SCMI for the same chip?

Rob

