Return-Path: <linux-arm-msm+bounces-490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 364857E8A65
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 11:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 956AC280D4C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 10:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51090111BE;
	Sat, 11 Nov 2023 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhQJBw2p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A754107B7;
	Sat, 11 Nov 2023 10:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F7FC433C8;
	Sat, 11 Nov 2023 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699700121;
	bh=yhZpTjWRK6RKd63R4nWe56MWy0CMG7eNfkNMHL2QcRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jhQJBw2ply+Us4XYDAgeXbr4WDWJ3jiVW/6DPinTKjrwVwX+DmVqt8lhxT2BJwxSK
	 l744L/rFpeuiglGmmqHidvqtcPsa/pdvx7WgBhSCEnYEwM13o4/mwh8zGli154MW3Y
	 H31OjHIdZq16RiXnkZSVBjDwI7OSWu0R+lv2XDGJU+DvUFgQLtUq60r7nlwQGq8Q3l
	 i7UnynQxBXATG4WzeeQlve+49tMYVrHcmk4LplX+wKMj3OJqHVha8D3fTd0uuS1EZB
	 4kwdRzV75i3StzG5p2Xr/ARidjukxRKkQi1GDKLAnVT/LLpHwnFrd0qnFD3GjRChA/
	 /sF61VX7QLYvQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1r1le1-0001Tb-17;
	Sat, 11 Nov 2023 11:55:18 +0100
Date: Sat, 11 Nov 2023 11:55:17 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, quic_pkondeti@quicinc.com,
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com,
	ahalaney@redhat.com, quic_shazhuss@quicinc.com,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v11 02/13] dt-bindings: usb: Add bindings for multiport
 properties on DWC3 controller
Message-ID: <ZU9dlfM8tdfdqKkx@hovoldconsulting.com>
References: <20230828133033.11988-1-quic_kriskura@quicinc.com>
 <20230828133033.11988-3-quic_kriskura@quicinc.com>
 <ZU4wA9xhfjYBCaTU@hovoldconsulting.com>
 <bc3e9da6-c932-46a0-923a-44be817bd129@quicinc.com>
 <c8b0af46-6513-43fc-994d-4d04f6c65b5e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8b0af46-6513-43fc-994d-4d04f6c65b5e@quicinc.com>

On Sat, Nov 11, 2023 at 03:17:40PM +0530, Krishna Kurapati PSSNV wrote:
> On 11/11/2023 2:00 PM, Krishna Kurapati PSSNV wrote:
> > On 11/10/2023 6:58 PM, Johan Hovold wrote:

> >>>     phy-names:
> >>>       minItems: 1
> >>> -    maxItems: 2
> >>> -    items:
> >>> -      enum:
> >>> -        - usb2-phy
> >>> -        - usb3-phy
> >>> +    maxItems: 8
> >>> +    oneOf:
> >>> +      - items:
> >>> +          enum: [ usb2-phy, usb3-phy ]
> >>> +      - items:
> >>> +          pattern: "^usb[23]-port[0-3]$"
> >>
> >> Shouldn't this just be
> >>
> >>     pattern: "^usb[23]-[0-3]$"
> >>
> >> so that it matches the names that are used by the nvidia bindings?
> >>
> >> We already have some inconsistency in that Amlogic uses a variant based
> >> on the legacy names that needlessly includes "phy" in the names:
> >>
> >>     const: usb2-phy0
> >>     const: usb2-phy1
> >>     const: usb3-phy0
> >>     ...
> >>
> >> I don't think we should be introducing a third naming scheme here so I
> >> suggest just following the nvidia bindings.

> >> > In that case, why don't we use  "^usb[23]-phy[0-3]$". I think its close
> > to what we have on dwc3 core already today (usb2-phy/usb3-phy).
>
> I mean, it isn't needless. It is a phy and shouldn't the binding suggest 
> that and include "-phy" in the name ?

No, adding a '-phy' suffix to each name is unnecessary since the
property is called 'phy-names'.

This is also documented:

	For names used in {clock,dma,interrupt,reset}-names, do not add
	any suffix, e.g.: "tx" instead of "txirq" (for interrupt).

	https://docs.kernel.org/devicetree/bindings/writing-bindings.html

and we've already discussed this when I asked you to drop the likewise
redundant '_irq' suffix from the interrupt names.

Johan

