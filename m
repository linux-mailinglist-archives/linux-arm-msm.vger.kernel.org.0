Return-Path: <linux-arm-msm+bounces-118192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iSU8BxW3UGqm3wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:10:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 648FB738DFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:10:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=P8vTz4bu;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118192-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118192-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D1A8311581D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D28C3B0AD7;
	Fri, 10 Jul 2026 08:57:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE962396588;
	Fri, 10 Jul 2026 08:57:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673876; cv=none; b=tHZjqdNC+rs3bzPGcJEstwa/kkbHoofmn/9zc3qQMS1i7PiL13R4QYxjapa7BTW1qSPEH9eBQ6EU1i/CQAPojBnz8lfaZyxM18AxS825pujbcIW1wT2Kd4aXYKdmozk1z7PE35ANRfd0nQ7BMUMV5nxwOUNtMxwuM4VoCq5Rkik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673876; c=relaxed/simple;
	bh=ijsaDfq++OlIGjm7oo5RgW9/BcBQOW5HJYAzmHQYbOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuTLl1rqgLbRgha4UCDJ2JrZ860ARIrggM12QoCAEu5AkhB7TG+kA0t+QjD7ZdkaHA8SCtv63qGgNrTnDEfYeStwUC6Cllieaa2nkH3C3tdeJYc3/nYwkhXZelnXCjPWrn98bjnDkWF6z62NL0WR6jnR5ojbxoUCjT5hhEMCTZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8vTz4bu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6A91F00A3A;
	Fri, 10 Jul 2026 08:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783673874;
	bh=jaJQkqpcn5HVbHw0AoSrqQiKOBbN9hWvVl0ijVMbfg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P8vTz4buj2PGx0sGCwzB9/gPbQIVVqNOHnG5BIAmLT2AfdQsNEgFwh4K4DeJlK64i
	 VO4SmJQ5PtgopHqycdAl3/II3hb0xAbT5y32qFpFelrSzr9+SrQVCTS9OJJrnaYa5c
	 euKRw2ylFtRa/SXxDO5ZGHSqPT+re7VVsgb/dcEw80+nI6fwQ+jKACzvNEBPE3re0f
	 TD2OdlX1evDsH+fM7FymwIlFWYYA1DNahvZiAGjvAw+PAnnmgH14CjfzD7q2aYuwph
	 MyDWC/1e6xJyaPMfLlOcGRWAy4eRGuzg+FSqV9XyOVbcsykAGqYiLX3tbt3lOIzqNj
	 4GQ/IoKo3mTNQ==
Date: Fri, 10 Jul 2026 10:57:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
	Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: qcom,wsa8855: add Qualcomm
 WSA8855 speaker amplifier
Message-ID: <20260710-curly-sympathetic-mongoose-cd25fe@quoll>
References: <20260709175915.3805851-1-prasad.kumpatla@oss.qualcomm.com>
 <20260709175915.3805851-2-prasad.kumpatla@oss.qualcomm.com>
 <178362545943.1021343.12928472425962817382.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178362545943.1021343.12928472425962817382.robh@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118192-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:lgirdwood@gmail.com,m:tiwai@suse.com,m:p.zabel@pengutronix.de,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:broonie@kernel.org,m:conor+dt@kernel.org,m:srini@kernel.org,m:perex@perex.cz,m:linux-arm-msm@vger.kernel.org,m:krzk+dt@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,suse.com,pengutronix.de,vger.kernel.org,kernel.org,perex.cz];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 648FB738DFC

On Thu, Jul 09, 2026 at 02:31:00PM -0500, Rob Herring (Arm) wrote:
> 
> On Thu, 09 Jul 2026 23:29:14 +0530, Prasad Kumpatla wrote:
> > Add bindings for the Qualcomm WSA8855 stereo smart speaker amplifier.
> > 
> > Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> > ---
> >  .../bindings/sound/qcom,wsa8855.yaml          | 93 +++++++++++++++++++
> >  1 file changed, 93 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,wsa8855.example.dtb: speaker@c (qcom,wsa8855): compatible: 'oneOf' conditional failed, one must be fixed:
> 	'qcom,wsa8855' does not match '^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$'
> 	'qcom,wsa8855' does not match '^qcom,sar[0-9]+[a-z]?-.*$'
> 	'qcom,wsa8855' does not match '^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$'
> 	'qcom,wsa8855' does not match '^qcom,(glymur|milos)-.*$'
> 	'qcom,wsa8855' does not match '^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
> 	'qcom,wsa8855' does not match '^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
> 	'qcom,wsa8855' does not match '^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
> 	'qcom,wsa8855' does not match '^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$'
> 	'qcom,wsa8855' does not match '^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
> 	'qcom,wsa8855' does not match '^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$'
> 	'qcom,wsa8855' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,gpucc-sdm630', 'qcom,gpucc-sdm660', 'qcom,lcc-apq8064', 'qcom,lcc-ipq8064', 'qcom,lcc-mdm9615', 'qcom,lcc-msm8960', 'qcom,lpass-cpu-apq8016', 'qcom,usb-ss-ipq4019-phy', 'qcom,usb-hs-ipq4019-phy', 'qcom,vqmmc-ipq4019-regulator']
> 	'qcom,wsa8855' is not one of ['qcom,ipq806x-gmac', 'qcom,ipq806x-nand', 'qcom,ipq806x-sata-phy', 'qcom,ipq806x-usb-phy-ss', 'qcom,ipq806x-usb-phy-hs']
> 	from schema $id: http://devicetree.org/schemas/arm/qcom-soc.yaml

This looks expected. Should be fixed by:
https://lore.kernel.org/all/20260707-dt-bindings-qcom-soc-naming-v2-4-1b7d695be2e1@oss.qualcomm.com/

However this patch should not be applied before above one, otherwise
next will have errors.

Best regards,
Krzysztof


