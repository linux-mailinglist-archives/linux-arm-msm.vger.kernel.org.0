Return-Path: <linux-arm-msm+bounces-51741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AF8A67650
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 505767A1EA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392D020DD7D;
	Tue, 18 Mar 2025 14:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MG/9XEEA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF8C207DFD;
	Tue, 18 Mar 2025 14:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742307990; cv=none; b=jkER5Aj27Hurhik2y7dpA9namUgm+3Y8MqTTDBhrwJjkG3JlY9uw0VhESZqRHOfg+62ztDuUBrb+iv/Ml0EiTibZCtEU1HH/oER+Rtp6k9iKp75wKvU2IalW95O9+GrayINOIIgkOPIBu5NlQ5CvFkuStup/iEQg4zYnVL1H/gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742307990; c=relaxed/simple;
	bh=TpcsD9c3nelJ3Lyj44Oo9ur4b4DcjNSdnS8aexJDl84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqjRGsXZZ7j/v32pdUIP6Pz21505zxLBIj+22dHZSUCGqf9eN2ejT/cfV6OxqxDlPu8/gfKHcdVo+Q0bAtK9jjidM5s05KsscbgZUa1tvOg5kV8ikedOjE6mkQNCP9yQ4hc2+Z0Lwcag8RmSQTS4NYb7aCtV7fAfsR8y6569Ag0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MG/9XEEA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A92C4CEE3;
	Tue, 18 Mar 2025 14:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742307989;
	bh=TpcsD9c3nelJ3Lyj44Oo9ur4b4DcjNSdnS8aexJDl84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MG/9XEEAv/XaQozvYIF3sAinQsYs+yxNfDdRu3IeMObIhRblYZr5BpYB7sd6j1jTq
	 rzE9KQE/+tZOmwXukj/nTLs6+30Uw4PIVI3BvB3S244+eXCGqRd42d0RoSQfUD6IpO
	 9VDGuFpfW1ooDaFHO9Wpgw18ebnqRmBjd6FhraBs8ncfDL1l0B1XapBAJR0WoCHQ6D
	 uByxjdeAtw67yQdu1ZZN+6JM/pZ2qbgy1AA0tUz4X0ZuOJXho5ClxmRg+GyIjSDzp7
	 4A/NRJjjInpT9GheAG4U8KuKGL0XIpUzJrxvhc6xScPskNpfNgMbIqirWwy+dK1Zz+
	 VuF3q/e3v16jA==
Date: Tue, 18 Mar 2025 09:26:27 -0500
From: Rob Herring <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom,wcnss: Document local-mac-address
Message-ID: <20250318142627.GA2735725-robh@kernel.org>
References: <20250317-wcnss-local-mac-v1-1-c7c60d4427be@ixit.cz>
 <20250318-benevolent-bat-of-politeness-119c9a@krzk-bin>
 <11435166-28bc-432b-9b2b-d6bff586c882@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11435166-28bc-432b-9b2b-d6bff586c882@ixit.cz>

On Tue, Mar 18, 2025 at 10:07:22AM +0100, David Heidelberg wrote:
> On 18/03/2025 09:49, Krzysztof Kozlowski wrote:
> > On Mon, Mar 17, 2025 at 09:26:05PM +0100, David Heidelberg wrote:
> > > The device and driver do support setting a custom MAC address.
> > > 
> > > Fixes: c49e9e95f4d1 ("dt: binding: Add Qualcomm WCNSS control binding")
> > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > ---
> > >   Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
> > > index fd6db0ca98eb7e56d7399f55c408844d5e782805..6938dc4ccc2175a65f6f53c6d073fb72cf498b2c 100644
> > > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
> > > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
> > > @@ -68,6 +68,8 @@ properties:
> > >             - const: tx
> > >             - const: rx
> > > +      local-mac-address: true
> > 
> > Which referenced binding provides the definition of this property (its
> > type)? AFAIK, that's not a property of Wifi nodes.
> 
> Good catch!
> 
> Would you find reasonable to add the property to  wireless/ieee80211.yaml ?
> 
> I feel like this could be "shared" between ethernet and ieee80211, but have
> it twice in these two sounds acceptable to me.

Can you pick up and finish this series[1].

Rob

[1] https://lore.kernel.org/all/20230220140201.20450889@kernel.org/#r

