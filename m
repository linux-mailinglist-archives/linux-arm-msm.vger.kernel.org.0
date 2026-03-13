Return-Path: <linux-arm-msm+bounces-97364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIxgKKnMs2n2awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:36:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EEB27FCCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CB74E3025EEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF54382F2C;
	Fri, 13 Mar 2026 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjBPCZUX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C00D258EDE;
	Fri, 13 Mar 2026 08:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773390877; cv=none; b=aRBZD/xJ2vcyzmnJIkwOoQGjzxHeFbR97Np1Ky4gcT1KNo6XiA+5vgT7W/2jjkFHZVjocUC71OeR4bDtn2sFg+BH1AyBoCS/eJa6bsvNBeN0QOOzxA3jOEvqNIxMLQXqVpNsfxZv4mVORaOLjEswPl+v5mxfjMz8XFT/HhKWakY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773390877; c=relaxed/simple;
	bh=WtugzcEPYfyprrGD2OUyc4gEtJlzbQXV7ZjF95eoXsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orvKaEZBNpCMbOQh1LY9uDLvjqi23ho86WTv/TBg9JNkn+93ox3otgtlGvyNrIVVjLeNlIlpr1MxOuxjQ15u8R0bFc1QI/5eYUfObpWO492E/gjl4xDKgmSLTdcA0UoX1AH1nx5SHKD9VjNaRKEg6hs/5QBq+Ql3KrWVWlJxT90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjBPCZUX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CF0C19421;
	Fri, 13 Mar 2026 08:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773390876;
	bh=WtugzcEPYfyprrGD2OUyc4gEtJlzbQXV7ZjF95eoXsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mjBPCZUX7Jk+ZCERlPiv2px0v7CzpT/QRcRHKrpGHBiEWepYeTQsr9qrdp8LrXQgW
	 lbfrSs4H3lNFc8adv6r6ClwqoSbMKqshyHNdNHDOTaHyA3QysaK9nKJ9PVlnH+Rx4R
	 SmzqqIiVc5ivloKYtrvqjGFK/2wtl3as20obC2SefRO+8Ps0QSGMhf6rpX3yc80GoP
	 1WoIVPBzt1N8SdiBWnNWMfsfmWxEKLF5w7FhFYCkpq02Qkl1njNnVoEHykPiDprZlb
	 RDvxWVRCM2t/7XYHIZg/lbc/J5aNDwIkk1j90FiOpDWR8kmjF1zt18yJjSIMgJQaSr
	 HJr285wTuzK/g==
Date: Fri, 13 Mar 2026 09:34:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: spmi: qcom,x1e80100-spmi-pmic-arb:
 Document Eliza compatible
Message-ID: <20260313-happy-pristine-galago-2a5a3f@quoll>
References: <20260311-eliza-bindings-spmi-v2-1-12783c6759d9@oss.qualcomm.com>
 <9b8ea7a8-80bd-4aba-89c3-6dbe9d43c41d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9b8ea7a8-80bd-4aba-89c3-6dbe9d43c41d@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97364-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,msgid.link:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C7EEB27FCCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 02:43:27PM +0100, Konrad Dybcio wrote:
> On 3/11/26 2:29 PM, Abel Vesa wrote:
> > The SPMI multi-master Arbiter found on Eliza is version 7.2.0, yet
> > driver-wise, still compatible with the one featured on Hamoa (X1E80100),
> > which is 7.0.1.
> > 
> > So document the Eliza compatible and allow Hamoa one as fallback.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Instead of reworking the whole oneOf for compatibles,
> >   add Eliza similar to sar2130p.
> > - Link to v1: https://patch.msgid.link/20260311-eliza-bindings-spmi-v1-1-1a20eec1179e@oss.qualcomm.com
> > ---
> >  .../devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml          | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
> > index 08369fdd2161..4152469b3880 100644
> > --- a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
> > +++ b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
> > @@ -23,6 +23,9 @@ allOf:
> >  properties:
> >    compatible:
> >      oneOf:
> > +      - items:
> > +          - const: qcom,eliza-spmi-pmic-arb
> > +          - const: qcom,x1e80100-spmi-pmic-arb
> >        - items:
> >            - const: qcom,sar2130p-spmi-pmic-arb
> >            - const: qcom,x1e80100-spmi-pmic-arb
> 
> I think Krzysztof's comment was meant to suggest you shouldn't add an
> intermittent items: entry for a single const (lone-x1e compatible), instead
> passing:

Yeah, you added unnecessary line "items". Your hunk was CHANGING a const
into items+const, so I asked not to change that. If I meant the enum,
then my comment would be under enum.


Best regards,
Krzysztof


