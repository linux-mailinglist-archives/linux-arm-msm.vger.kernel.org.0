Return-Path: <linux-arm-msm+bounces-118878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aSAXHjhXVWpenAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 23:23:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3B474F3A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 23:23:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="XjHDV3q/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118878-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118878-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 38ABC300AD8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 21:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2796934CFC6;
	Mon, 13 Jul 2026 21:22:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFE529ACC5;
	Mon, 13 Jul 2026 21:22:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783977779; cv=none; b=KBHJcRmAL+lEUZenHDXiaOVObjbztVvz/Jd97TbXTP05R3q55jVmIIMUhfcJzTuFELFKQX5J+6K4dD2V3zekymaEPHrfvQngNVQjJ0xOPU4bDFdTrwXr4+B6jn/u8OhRiJV/CWvwxT0unH+hxd+XLd7geKFJi7Eh6ypXxvgqhJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783977779; c=relaxed/simple;
	bh=DtMAoPkaZZ/TOwAv+N+0avcFzt9PPbgv2ZN0LuHdpqs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=eBk6F4hZ+gvI/W1IYghvdnVhp1qzjG5EGk+V3FN2cDzJPn8IgLGLm6u41JtpnTABIWuv7fpWz5XzTTGr0lKvXy1+kh/2ceI9BMJKeBFklfd6eOl0Oj8yovWYSeHg09szfszdKew1Lie2TQTUmH9pvFO3r+gW3BjzqgwEBku6788=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjHDV3q/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8709E1F000E9;
	Mon, 13 Jul 2026 21:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783977777;
	bh=jWG0/rB6xvK8ubb2dgXTEYCJoQiVYSZPHeWSP24sv5E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=XjHDV3q/o3y2O7ADrG/mJ7ILKj/XbnAsAY8MRtW1MDghH+ZN3cgusyX8uKt7K+AO3
	 ejUOvsa+RVzCm4KajFtYakiWo1qhCn9F/1HHlvGJBc0cpB2HPemvTny+BfqMdJryc1
	 4XOrum0jmJZCS/LAjuSzzRhjn5YjKgRBX0tZujGy9BMWrgy27qHfGYSWYAU56CAmsh
	 2ZYwGqfqy9jp6dFCBph7dJ1SDn8S1p6fdg6VzkWTdlklKrhA/3bD174rNBfWNuy+qX
	 6YnIj4CB5mhLs82J9ztfyjp+HZeqU9Yj1TdA0tEsdAoNEdkbR4R8diQY71zZrV2CAg
	 PJG1buZvPxstA==
Date: Mon, 13 Jul 2026 16:22:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sound@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-arm-msm@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com, 
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 devicetree@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>
To: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
In-Reply-To: <20260714-master-v1-1-1ebe5993225e@oss.qualcomm.com>
References: <20260714-master-v1-0-1ebe5993225e@oss.qualcomm.com>
 <20260714-master-v1-1-1ebe5993225e@oss.qualcomm.com>
Message-Id: <178397777689.3016926.7029134483948462437.robh@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,lpass-va-csr: Add
 HeartBeat pulse clock
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118878-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk+dt@kernel.org,m:linux-sound@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:linux-arm-msm@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:broonie@kernel.org,m:linux-kernel@vger.kernel.org,m:tiwai@suse.com,m:srini@kernel.org,m:devicetree@vger.kernel.org,m:perex@perex.cz,m:sarath.ganapathiraju@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,oss.qualcomm.com,gmail.com,suse.com,perex.cz];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B3B474F3A7


On Tue, 14 Jul 2026 01:35:32 +0530, Sarath Ganapathiraju wrote:
> Add Qualcomm LPASS VA CSR rate generator node that exposes
> the lpass_heartbeat_pulse clock on hawi. Also extend the
> qcom,lpass-va-macro binding to add qcom,hawi-lpass-va-macro with
> its four-clock constraint (mclk, macro, dcodec, heartbeatpulse).
> 
> The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
> start of the DMAs and Codec Interfaces for the audio usecase
> and can serve as a periodic wakeup source for the DSP.
> 
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,lpass-va-csr.yaml          | 47 ++++++++++++++++++++++
>  .../bindings/sound/qcom,lpass-va-macro.yaml        | 18 +++++++++
>  2 files changed, 65 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.example.dtb: va-csr@7ee0000 (qcom,hawi-lpass-va-csr): reg: [[0, 133038080], [0, 57344]] is too long
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-csr.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260714-master-v1-1-1ebe5993225e@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


