Return-Path: <linux-arm-msm+bounces-110421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN4lJu5NG2r1AgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 22:51:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C02261356D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 22:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2EDE23075364
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710683546FD;
	Sat, 30 May 2026 20:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyBu6SZ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35517352C35;
	Sat, 30 May 2026 20:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780174114; cv=none; b=bUs6hPbqw967xBJJvcQ3SRja5DtX5Y4TFLMduViAKdaF4nxvG/dtOerUlvI1zqi1Qy/zpB0qhKsZLcTpOwQOMQevPepmgcqPYs7GGNikQO/UyznX97ZgpbBo6M6IEMXw/GUSQ71Uwkf9uw7YQsaOZiZe6h+KgcIRkADxoYISm4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780174114; c=relaxed/simple;
	bh=5+txLqFZyLzhfRSQGSDvj+oSfI9UcKA0qX4oCa6GViU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=piB8g+Tfo3+HH149VkOcehA+9R/hQogs7/9c+w95gDWZUz1GPDUdMmQ4RBJm7vzcjb9Bh6osH+yv4xeZR6CHGHk7LKU1bUyueBUdT6le/rye+R45jOdcwNZdctoo743hwDJWVWXe5fwH+izRi3V/xCAF8kgMKsZ8lqB79leDNYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyBu6SZ5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3EB1F00893;
	Sat, 30 May 2026 20:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780174111;
	bh=zRdUXHUxNpzFpwf/HXedGTjWjMk+ypXQQ/BZbvB5q+Q=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=LyBu6SZ55uxmIlpUrr+vhuMTSuWTftX5z3Mg5zBFqwssuzmXdzbphDpeKgr5e/Su/
	 x5UxnRg9WLZMVwsOjAwXWHKWn2k03DifeEui2lacaNay2WQvXH0vvMCt/u5IQDENfm
	 xiBcynhaoBf/sHd7pOz1d9pvLi4V+9K28OB6edUw9N0zhZiea4qO+M5wzhwTNwaPD/
	 CBxkNauJW4NR7PsYtDZD3pZRKU+y7oCttgUIL6C0f1RYBv6Q1CaOKA4Kz/WVNrKLS3
	 oXM0jDgBEdiVzhXs9WW8s01fyG72X0O7WuK6CHfIIWTPGmy36J6VXwnA55zPND9T+g
	 wjh24vkRARz1Q==
Date: Sat, 30 May 2026 15:48:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>, 
 Zhang Rui <rui.zhang@intel.com>, linux-arm-msm@vger.kernel.org, 
 linux-pm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, devicetree@vger.kernel.org, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Amit Kucheria <amitk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Herman van Hazendonk <github.com@herrie.org>
In-Reply-To: <386f3cef9d50d61f588f99706d9f979c56f8bab8.1780148149.git.github.com@herrie.org>
References: <cover.1780148149.git.github.com@herrie.org>
 <386f3cef9d50d61f588f99706d9f979c56f8bab8.1780148149.git.github.com@herrie.org>
Message-Id: <178017410406.3710254.14105347323539031701.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: qcom: add pm8901-temp-alarm
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,intel.com,kernel.org,arm.com];
	TAGGED_FROM(0.00)[bounces-110421-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,0.0.0.23:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,herrie.org:email]
X-Rspamd-Queue-Id: 5C02261356D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 30 May 2026 16:00:39 +0200, Herman van Hazendonk wrote:
> Add the binding for the temperature-alarm block inside the Qualcomm
> PM8901 PMIC (companion to the PM8058 on MSM8x60). The driver exposes
> the PM8901 die-temperature trip stages (105 / 125 / 145 C) to the
> thermal framework via a thermal-zone, with stage 3 wired as a
> critical trip so the kernel issues orderly_poweroff() when the part
> overheats.
> 
> The binding describes the SSBI sub-node address, the GIC interrupt
> the alarm raises on a stage transition, and the parent PMIC
> reference.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  .../thermal/qcom,pm8901-temp-alarm.yaml       | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.example.dtb: pmic (qcom,pm8901): 'temp-alarm@23' does not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9a-f]+$', 'keypad@[0-9a-f]+$', 'led@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pwrkey@[0-9a-f]+$', 'rtc@[0-9a-f]+$', 'vibrator@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/mfd/qcom-pm8xxx.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.example.dtb: pmic (qcom,pm8901): 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/qcom-pm8xxx.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/386f3cef9d50d61f588f99706d9f979c56f8bab8.1780148149.git.github.com@herrie.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


