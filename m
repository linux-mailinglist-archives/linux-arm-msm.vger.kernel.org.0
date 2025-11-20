Return-Path: <linux-arm-msm+bounces-82726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B1572C75C72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 18:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2E580343648
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 17:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A34272810;
	Thu, 20 Nov 2025 17:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9CMCDx9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFAD1E9905;
	Thu, 20 Nov 2025 17:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763660481; cv=none; b=EwVbY8kh66371KSgyoLOgH2Mbk+8kUaiz8a8isOPkLtwPEBFsTslpNOj8/kAuXiyBMwmrMPOa5z8wRhZLXjyJV25HLUn4H6zObv6qDSANfkcN95Zg5bjEuXn3oC4X7/lTwsg6qrapkvfLxfsazYj43+gDvyzSBGdzJQiMX0eQ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763660481; c=relaxed/simple;
	bh=JK829sAIpe0+DrFBl0+4EDY2O6EilCGqBMpGmZHthHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drEkGFivzfJ/8DROSSjXhe6EsE8iRy8h5hzaJzHARKywVs0iemlZSk60jbLk4Ux9ehUdxyVRHWPWjUlGOcYbRisVtWSml7b6pvPJJpUGWnG6EmW8TlDnGd6VZLqzsRrAle1fpklvFOkFZxtawzJc6C/VTKKsmq29/oqlA5JOKJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9CMCDx9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16671C4CEF1;
	Thu, 20 Nov 2025 17:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763660481;
	bh=JK829sAIpe0+DrFBl0+4EDY2O6EilCGqBMpGmZHthHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9CMCDx99Koz16binJQrQRi/VCOmqB5y9Otc+x3tmP2fcvBD/7NyQECHVrHBKD5Q1
	 LWw41g6R7+0z4kpYq4mNya4X+uRFidXvL2GDbSM7au5nsRbv09JhueVUouywBqPW/C
	 VLgILxWlHKPwzUcHGJYtB1wO/qy15QR1aOLGFIGt87nK/rGzEh3kPQkatC7rSnTSro
	 ibceTC/1hqTyO/+nIJf6I5au6+tj1nOmxC93R46WXWvXDxfx+HSoZLZT/CjmFOgA63
	 gLtyfKvn4R5D7ZmobGO1xJcmYTNSb7Vzl5eFeIHqWLYjgziZt/fG8kS9xbL4MsWytL
	 pj4pqg63+cL9Q==
Date: Thu, 20 Nov 2025 11:41:19 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: add ipq8064 board variants
Message-ID: <20251120174119.GA1586641-robh@kernel.org>
References: <20251120135435.12824-1-ansuelsmth@gmail.com>
 <8e75be2b-643e-4380-a018-3cb718745101@oss.qualcomm.com>
 <691f3465.050a0220.105096.7667@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <691f3465.050a0220.105096.7667@mx.google.com>

On Thu, Nov 20, 2025 at 04:31:47PM +0100, Christian Marangi wrote:
> On Thu, Nov 20, 2025 at 04:25:37PM +0100, Konrad Dybcio wrote:
> > On 11/20/25 2:54 PM, Christian Marangi wrote:
> > > Document QCOM ipq8064 board variants ipq8062, ipq8065, ipq8066,
> > > ipq8068, ipq8069 now matched by the QCOM cpufreq nvmem driver if
> > > socinfo can't derive the variant from SMEM.
> > > 
> > > Suggested-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > >  .../devicetree/bindings/arm/qcom.yaml         | 20 +++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> > > index 18b5ed044f9f..0eb1619fede8 100644
> > > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > > @@ -299,12 +299,32 @@ properties:
> > >                - qcom,ipq5424-rdp466
> > >            - const: qcom,ipq5424
> > >  
> > > +      - items:
> > > +          - const: qcom,ipq8062
> > > +          - const: qcom,ipq8064
> > 
> > Since 'items' requires that all items are present (and in this order),
> > we would normally have a board name go first.. but I suppose this is
> > some sort of a fix to the issue that sparked this (posting the link
> > for others to have more context)
> > 
> > But since these SoCs do exist, I wouldn't say this is necessarily
> > wrong..
> >
> 
> Well we can see this as a ""template"" for device that might be added
> using the ipq8062 or ipq8065 compatible.
> 
> When device with that variant will be added we would have to just add an
> enum with the real device name on top of it (as first element).
> 
> Honestly I should have added these compatible long time ago as on
> OpenWrt we have tons of device that are ipq8062 or ipq8065 with the
> compatible structure
> 
> "device,name", "qcom,ipq8065", "qcom,ipq8064".

If you don't you have any boards yet, you can do:

items:
  - description: ...
  - const: qcom,ipq8065
  - const: qcom,ipq8064

Just to prevent skipping a board compatible.

But you said you have tons of devices, so...

Rob

