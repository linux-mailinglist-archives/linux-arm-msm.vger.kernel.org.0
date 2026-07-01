Return-Path: <linux-arm-msm+bounces-115765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EwsRAMdERWr+9goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:48:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 681716EFF0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:48:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cVmeTFIC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115765-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115765-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C449D30173BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 16:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2599D376A11;
	Wed,  1 Jul 2026 16:39:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9D03546F4;
	Wed,  1 Jul 2026 16:39:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782923981; cv=none; b=MbVtXMSWXI8wmSC2lr5g7MZaMRW6XKR/x9Ruk6Onp/88fE4MgMl0Vg6vZy95spHRPKdylwhUqqntq7QhhR/Y8J1gfXEq6TnTlhv86QUDXNDfTQj785wunJKikDEwC4cRyFfhJYHJFxjwJXzhIqGwrdIyZnxWyP0xo1gfqEHZoIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782923981; c=relaxed/simple;
	bh=lyrUvzj5pLlGxX1N07kXljqauk/KN3qGL9p1a8s1nqg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=q/oimM3Or0ZpFay4g9bVXR1iGPJCqJ2uwyLLjfPFXW4LwxHiOwlTC1yeWWE3SEZenSZ/AJMCXAs1+/2PC1grUrXmkB5XUHCdPn3t27t/52fAiVvhS577l31apxMquz0HfGxg6gGvgCOkJ1t/8k4RWkqXrMWq66SutqsJlfPgwao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVmeTFIC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B971F00A3A;
	Wed,  1 Jul 2026 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782923979;
	bh=iFJvphVUXGIaYZvKHbf0CeauF0PeInNAnQUDmyOVt+s=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=cVmeTFICLio+/M6sDlp7kqNetzFOziVDjnPdGSa4kCvThn4Zn3TCsIjodRgwxucYe
	 y3hto3FtmItD/mRog59T6Dphf0zAj+hOZbLHi01NtHbjMqnICpvBjemVVShXL2KWlp
	 FPdtET7XzPdnA12N6CNfkug9hV144FQQRWkLMPBvd/N+vtcB4Enfy0OOQSO4HFdoB1
	 wwRzDOzbOa9uuZnBnB/YI+q+DMNzoCL8TUhPgxdu3mPFBqDQ7X89dkO2MKyBlInFo5
	 Y/ggflvCfGc3aLgPAhy89W10hAP/N4AYDGaYfJStLGqwKqwgc7JgbqOFfZ572meOK4
	 Cm4o37QLVGd/g==
Date: Wed, 01 Jul 2026 11:39:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260701135913.1641328-2-prasad.kumpatla@oss.qualcomm.com>
References: <20260701135913.1641328-1-prasad.kumpatla@oss.qualcomm.com>
 <20260701135913.1641328-2-prasad.kumpatla@oss.qualcomm.com>
Message-Id: <178292397778.969422.10745443574988528449.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: add WSA8855 bindings
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115765-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:tiwai@suse.com,m:srini@kernel.org,m:krzk+dt@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:broonie@kernel.org,m:linux-sound@vger.kernel.org,m:perex@perex.cz,m:lgirdwood@gmail.com,m:conor+dt@kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,kernel.org,oss.qualcomm.com,perex.cz,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,devicetree.org:url,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 681716EFF0F


On Wed, 01 Jul 2026 19:29:12 +0530, Prasad Kumpatla wrote:
> Document the Qualcomm WSA8855 stereo smart speaker amplifier.
> 
> The device uses a PCM audio interface and is controlled over I2C. Add the
> required supplies, powerdown GPIO, interrupt line and optional battery
> topology property.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,wsa8855.yaml          | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,wsa8855.example.dtb: speaker@c (qcom,wsa8855): compatible: 'oneOf' conditional failed, one must be fixed:
	'qcom,wsa8855' does not match '^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$'
	'qcom,wsa8855' does not match '^qcom,sar[0-9]+[a-z]?-.*$'
	'qcom,wsa8855' does not match '^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$'
	'qcom,wsa8855' does not match '^qcom,(glymur|milos)-.*$'
	'qcom,wsa8855' does not match '^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,wsa8855' does not match '^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,wsa8855' does not match '^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,wsa8855' does not match '^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$'
	'qcom,wsa8855' does not match '^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,wsa8855' does not match '^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$'
	'qcom,wsa8855' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,gpucc-sdm630', 'qcom,gpucc-sdm660', 'qcom,lcc-apq8064', 'qcom,lcc-ipq8064', 'qcom,lcc-mdm9615', 'qcom,lcc-msm8960', 'qcom,lpass-cpu-apq8016', 'qcom,usb-ss-ipq4019-phy', 'qcom,usb-hs-ipq4019-phy', 'qcom,vqmmc-ipq4019-regulator']
	'qcom,wsa8855' is not one of ['qcom,ipq806x-gmac', 'qcom,ipq806x-nand', 'qcom,ipq806x-sata-phy', 'qcom,ipq806x-usb-phy-ss', 'qcom,ipq806x-usb-phy-hs']
	from schema $id: http://devicetree.org/schemas/arm/qcom-soc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701135913.1641328-2-prasad.kumpatla@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


