Return-Path: <linux-arm-msm+bounces-112299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qYDhBHYEKWqbOwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:30:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6C6666428
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:30:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=IMTQiNER;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112299-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112299-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C03131317A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 06:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70898372062;
	Wed, 10 Jun 2026 06:23:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710E81A6814;
	Wed, 10 Jun 2026 06:23:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072617; cv=none; b=KnqOi2/Scm7giSRcAzHE7iuSAlfpjX8jNOzfLqGgkXUC+q1Nf0IyYdBMLtoiVB+R+Y9hOnMtfPpbhuZooLYS82a1KS0GpDwZyfInIzIQ0lgECy5KwjLEtUrj49eSPsvHERKQ1MjZvf0hZFcIiK85Yvc4wyuTOpr/TuUnuc/BWH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072617; c=relaxed/simple;
	bh=rFJSbHbDtoePohRS2EsLsjmHLP6vVMSmcHIITysF5r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jv+IW5+d88v08txMhxS9+t66+vdStrKMtjYpr+Pg9Oxfv8szHjMuce1xqa1e3/X3+sa8ieFOQHHM8vakUVSY7ojlJV1sK3qmSYRaTVsczsjrChnwH3/2LkKLWz8moED9D2SJ1y2lKDDGAMi8/fvh+41tf5pv7UUkMtnTmustR54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMTQiNER; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17CBC1F00893;
	Wed, 10 Jun 2026 06:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781072616;
	bh=7pJCdmP/I1O9qQOYy3P6wkUiGVmzpOS2+Rao0WrGW64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IMTQiNERSJazYilIigjjFiYbyNChVIRknRAokvryq5rlvBubewjeD3JaSHn+6UQxN
	 UM9NOS+leh5PE1n1YNYL93aPK8iSU9m9SNeO8MunUBtPna3GrIpBLTNu4clPEKGxTT
	 cg0pPPk+9TKrWQ5nOw408qsJSzgtfpJf1HR0mMaUceQYe1IOdH1FEP+Et0hhSuLa/9
	 CnXaKcNAvdnTZNs27XPdO/+3VCRmOqKwaU0h0UYHFPM7YcMa0A98weK2Jtd0q7/GqO
	 6C1vGN9GI5ZtUyTqdUKkOFomXKK1ytB9mMvnYH58YnAH1gBlOBEvVFarNPfoPJFvw6
	 Sy93YFxIdW4tg==
Date: Wed, 10 Jun 2026 08:23:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Message-ID: <20260610-lovely-bumblebee-of-fame-505a1c@quoll>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-1-17df09e5940c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-1-17df09e5940c@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112299-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com,oss.qualcomm.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E6C6666428

On Tue, Jun 09, 2026 at 08:32:52PM +0530, Taniya Das wrote:
> Eliza Video clock controller is on CX and MX rails similar to Milos.
> Add compatible string for Eliza video clock controller to the existing
> Milos videocc binding and add the dt-bindings header for Eliza.
> 
> The video clock controller exposes power domains, so '#power-domain-cells'
> must be present in the device node. Add it to the required properties list
> to enforce this in binding validation.
> 
> There is no ABI breakage and no impact to the existing devices, since the
> nodes using this binding already specify the '#power-domain-cells' property
> for videocc.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
>  include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


