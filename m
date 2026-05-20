Return-Path: <linux-arm-msm+bounces-108709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KoO1IzCTDWoKzwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:55:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D2058BFD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51533301779A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5255A3D75D2;
	Wed, 20 May 2026 10:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EI/3dwUJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8443D9DA1;
	Wed, 20 May 2026 10:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779274541; cv=none; b=E4OsEkk1pZS04jOXvZW3+g8WYOK4QF83hPLbxjPl6l6+84L6q+LRbTBQM7Sk7bxfZqw/TLia2MaK+ouOW37MYKD2U4wQq+qArGKWjdVvSZV3/x6tKbPBSTkY+Llf4KdigvnSrTyazbUY0w1cnDRAg18cSsiKaMArMHSshu0jtFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779274541; c=relaxed/simple;
	bh=7bVBRBh3PFN3P+Z+LctZSkdXx9IPSaTzdTa1kZ6gJ0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BewxqPuJ98d02whSJb60+EThVYhqeZ6kSiYRgqvnFRUMyIetFIGbyGaIvYArhnxLGt+O/qc8zZg7kWTGdqU6YgQ44r1giXaaDlfCs0K7Qn3ipdUJwONvFz+hO8FU3mKYeQk1S6blymMlP2e4ODv93adnsp2aI9qDTNtbXBb/iHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EI/3dwUJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0251F000E9;
	Wed, 20 May 2026 10:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779274539;
	bh=f3EIZytbQSOtIaCNJyTReSxIRSFoCJWLiCxTzoWcXZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EI/3dwUJ/VezmW+tTzXiqVPqLEzMjsA0yAGF55RbNX0KzYwy8ShsUh/npiMNPQpWq
	 BJhTZ+K9a8B1pjO1zZZxhQXayN03V9oK4f8TDjAVapyscjrtTilpyfRgUqi70awaPX
	 gBAgDYW9V4Ls64Kqak5IToaSYVBGhO0TMBIrVlf37bO6m1d55usVP2sXkI8sqIDvek
	 7YeCBcz87umEp87fs43GxK6le1fDFSrvlB7SXsqWhfI8/br/Kdb7odrPvMeoeRn6Qz
	 qtCSxVS9svkGLw/VfhiRakTH4EeVJxOYxh2de/+G5TrWJkU/QZ6QsbGD00tvX8lpF+
	 0BxUw3Nw3Vy6g==
Date: Wed, 20 May 2026 12:55:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom-soc: Document more of
 existing legacy style compatibles
Message-ID: <20260520-inquisitive-fearless-pheasant-99a435@quoll>
References: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
 <20260519-dt-bindings-qcom-soc-naming-v1-2-005d29d261ae@oss.qualcomm.com>
 <20a0ba34-0558-4a80-9b7d-2fca13a2f05f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20a0ba34-0558-4a80-9b7d-2fca13a2f05f@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108709-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E1D2058BFD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 12:04:40PM +0200, Konrad Dybcio wrote:
> On 5/19/26 10:03 PM, Krzysztof Kozlowski wrote:
> > The schema misses several old style compatibles with SoC component
> > trailing in the compatible (qcom,IP-SoC):
> >  - qcom,apss-wdt-x1e80100
> >  - qcom,apss-wdt-xxx and qcom,scm-xxx for SoC with code names
> >  - qcom,kpss-gcc-xxx
> >  - qcom,rpmcc-xxx
> >  - qcom,tcsr-xxx
> >  - qcom,usb-hs-phy-xxx
> > 
> > It also missed qcom,ipq806x-ahci.
> > 
> > None of these were flagged by schema, because they were used with
> > fallbacks and the schema checks only for single compatibles.
> > Nevertheless document them for complete picture and for future change,
> > which will apply the schema to fallbacks as well.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> > index b5f3a750cce8..d7d64e0e146b 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> > @@ -40,12 +40,20 @@ properties:
> >  
> >        # Legacy namings - variations of existing patterns/compatibles are OK,
> >        # but do not add completely new entries to these:
> > -      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
> > +      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
> 
> There's also x1(no letter)26100 and the new x2 ones, so perhaps

x126100 is not yet sent to mailing lists. We document what we use.

Similar for x2.

Best regards,
Krzysztof


