Return-Path: <linux-arm-msm+bounces-76281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9066CBC3144
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 02:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 422D63E054B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 00:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1237C28641F;
	Wed,  8 Oct 2025 00:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5bgyMdA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAA1285CBD;
	Wed,  8 Oct 2025 00:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759884158; cv=none; b=Fejqf/Y/VXIRUSTfKxplslXY439ubmNLo/GoWYy/+Zec+s0Gd3UbkErLnzIzqH7wLJomzUsKBlLOFG2dtjmq/TMH5/SZjcXLD+ovwtxXH1ZF/q8n3EM4v8nwD5JiEOuTAbO6002fLZWDdYkyn/4wDHH0C5fn+BHBlSKZcBkGCP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759884158; c=relaxed/simple;
	bh=Us9OmsgR+fW1SGZHE7rtfd59UKKbvLz88NLfSMaVR9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+uU8scr/uDT8QEoFMbJj91jOPKxRk6OjQiHLYXpIJsuNtWSiZg2Ue5e4GvlAkywRUBjOGsXo50VRspSZdC7N1eBq09IMPFjfiuzKFYFNe6WC+qCrNrEghEarHhBoXdLmkxbVkIbxt10E9Ekd4dRo7mR9wgdBdSgyq+D1t9ckLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5bgyMdA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23134C4CEF1;
	Wed,  8 Oct 2025 00:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759884157;
	bh=Us9OmsgR+fW1SGZHE7rtfd59UKKbvLz88NLfSMaVR9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X5bgyMdAHLgoj3RqWaTvyULA6IPdyY+GtixaZvBRBwHVxogMHzWjE4U8tYiEp/ZWb
	 iP95JSBYpR/KyeZGAly0AfC7uS0/Sr8myiQm/VsFutyJwpHuYxGLzEqo8VJe+r/OJc
	 c5gHIHWkRBYKPPmbG66dtK9u0CwvRSnT0q3Bs+SNDuT88USobBwjHmESPjM3a2D+tU
	 kJVpYTUlx0P41ebg4JdO5X6DG/YPeLe/z+aEPnUxUdj6juAVkWuAteBDCXTTdJjKcu
	 7HQpVt8GAsxrmZs9esQCIB2r/sjk0kAjk/vyr5OuXh0MgD4Xd04qdZzNfx/ktU5egp
	 cPTjlXVhKXc7g==
Date: Tue, 7 Oct 2025 19:42:36 -0500
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org,
	vkoul@kernel.org, gregkh@linuxfoundation.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/10] dt-bindings: phy:
 qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
Message-ID: <20251008004236.GA1833490-robh@kernel.org>
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
 <20251006222002.2182777-2-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006222002.2182777-2-wesley.cheng@oss.qualcomm.com>

On Mon, Oct 06, 2025 at 03:19:53PM -0700, Wesley Cheng wrote:
> Define a Glymur compatible string for the QMP PHY combo driver, along with
> resource requirements.  Add a different identifier for the primary QMP PHY
> instance as it does not require a clkref entry.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 72 +++++++++++++++++--
>  1 file changed, 65 insertions(+), 7 deletions(-)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml: allOf:1:then:properties:clock-names: {'maxItems': 5, 'items': [{'const': 'aux'}, {'const': 'ref'}, {'const': 'com_aux'}, {'const': 'usb3_pipe'}, {'const': 'clkref'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml: allOf:2:then:properties:clock-names: {'maxItems': 5, 'items': [{'const': 'aux'}, {'const': 'ref'}, {'const': 'com_aux'}, {'const': 'usb3_pipe'}, {'const': 'cfg_ahb'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml: allOf:3:then:properties:clock-names: {'maxItems': 4, 'items': [{'const': 'aux'}, {'const': 'ref'}, {'const': 'com_aux'}, {'const': 'usb3_pipe'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

