Return-Path: <linux-arm-msm+bounces-118181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7pb2GFucUGqS2QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:16:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9E6737F9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:16:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cIHJo3jc;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118181-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118181-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A8743011361
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 07:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A88390C8D;
	Fri, 10 Jul 2026 07:16:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400A22E7377;
	Fri, 10 Jul 2026 07:16:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783667801; cv=none; b=pc+4hXnjH2jUTdf/FCI0AT0rfZFh/W5Ke3QEpKF9e14hrQ+8pIVh++2wUCTzFcoDaEVkxsCB3qBsyrqHujKTzmNfr2Kj8RCguqnWxY9DPYpm+9sSyese3ryWHDchhIZT32wgAT2/WLF/PhExj/WLGY7RsZhfYDtDq/KjO2Tvalk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783667801; c=relaxed/simple;
	bh=Ys9oobWtYvEK0qfvDnAW8FQv0R5q1avxFlw4KZMFkiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehtpFOa9SJB7KwKQgzwMpVaT36FL6h/XSFBXTq51RZMDOgsmkzSnguA3q6AGDwDbFPZEFsO4xRA9IGapZDewMRDwQOoHjzsICyvgWhFy+QMlnqnyATdxiZdmCdwk417pgWO06VAsfssZQCqt92X2bHmjnj2YFPpthhwfX1FeZIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cIHJo3jc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB85C1F000E9;
	Fri, 10 Jul 2026 07:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783667799;
	bh=7GMpDTWGRU4dY7w5ie7ppKO2arwSSW/8+Md4t+1Az8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cIHJo3jcuX+/TGuTivgCjygxZrOdHFQb+yE/jfnwZNporrf2ESaFDFWHCsBRaGaNV
	 9iKxsOJ2nG1YVxRZlcxgbI+lXcjV56IGS/ueXaRYlSzWNezSRcKouuD/Mwq9mXefMZ
	 qkgw46FRlLCbxFW9bZB1HkupkD/uJ5C/HW2cfTvSHPCJVuSZv8+VvEIsQUi+GvETDg
	 0Dd/SLDzjtOKZVZ9sR946tK9/OrPBmKPAAeYBzo2YoCU3fL8YwyGL5bcS5EWaGfj5t
	 3pfrHn48+mqsPJm6vlK2Z2YwZf90HX7A/YjcmmlyE4AjvDH6UMFxTYUrXdXRcoFyE3
	 OUcENLuOtfKCA==
Date: Fri, 10 Jul 2026 09:16:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Message-ID: <20260710-warping-resolute-wasp-e4b8ce@quoll>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
 <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alBOC18CpkGDhM2m@vbox>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118181-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:Thinh.Nguyen@synopsys.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krishna.kurapati@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB9E6737F9A

On Fri, Jul 10, 2026 at 01:52:45AM +0000, Thinh Nguyen wrote:
> On Thu, Jul 09, 2026, Dmitry Baryshkov wrote:
> > On Thu, Jul 09, 2026 at 02:22:36PM +0530, Krishna Kurapati wrote:
> > > Add property "qcom,has-eusb2-phy" to indicate whether the SoC has eUSB2 phy
> > > or not. This is used to modify dp/dm interrupts during host mode suspend.
> > > 
> > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > ---
> > >  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > > index 8201656b41ed..0c6a839be82f 100644
> > > --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > > @@ -152,6 +152,13 @@ properties:
> > >        HS/FS/LS modes are supported.
> > >      type: boolean
> > >  
> > > +  qcom,has-eusb2-phy:
> > > +    description:
> > > +      If present, it indicates that the controller is working with eUSB2
> > > +      phy. This property is used to modify dp/dm interrupt configurations
> > > +      while entering suspend.
> > > +    type: boolean
> > 
> > I still have exactly the same concern. This information is already
> > present in the DT.
> > 
> 
> Could you clarify what you mean by "this information is already present
> in the DT"? Are you suggesting we use the dwc3 node's compatible string
> to infer the phy type?
> 
> The dwc3 glue compatible describes the controller, not the phy. They are
> separate IP blocks. A board variant could reuse the same dwc3 compatible
> with a different phy attached, making that inference silently wrong.
> 
> The phy type is described somewhere else in the DT (in the phy node
> itself), referenced via the phy's phandle on the dwc3 core child node.
> We could walk that phandle and check whether the phy node's compatible
> contains "eusb2". However, that relies on a naming convention that isn't
> enforced anywhere. All current eusb2 phy compatibles happen to follow it
> (qcom,sm8550-snps-eusb2-phy, qcom,sm8750-m31-eusb2-phy,
> samsung,exynos2200-eusb2-phy, etc.), but a future phy driver could break

You have a fixed/finite list of phys which needs something special, so
that information as Dmitry said is in DT already.

Anyway, the commit msg and property field have insufficient description
of actual hardware problem being represented by this property, so it
looks way too much as SW policy.

Best regards,
Krzysztof


