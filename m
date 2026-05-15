Return-Path: <linux-arm-msm+bounces-107723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iG6ODMHEBmpdngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:01:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFDE54A410
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74D3A307BFD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 06:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDB23CC306;
	Fri, 15 May 2026 06:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJJQV4Qr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8D839A068;
	Fri, 15 May 2026 06:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828165; cv=none; b=l99Tdj+bDrWDWAmBDTfClSUVXNah6GMd8XqliBf+DZH8NkoVw3sMzlNjmtabcn/MIH1vD1zUZG6OujrsZQ6xrZdhE6Hb7slZwW6fJX+NoIYCANzzqQO+0q0KkOnBnyadCBY5x5gSJQSG1r64wakK1DDn3TaOPNzivXHcT0Wskfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828165; c=relaxed/simple;
	bh=E28SEwLIDb3+PpAiZhmbhvwtDQg3wtx7EViGkXr64Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAkJ1NF074Ky0G3AZWW7FcHqvwIiZqt+dS6rvGhgUuFxnV0L1cT7/FQyiHddIkD6Bep9bD7iGZTYz0xipjeZeQNHgAKOf4ytcjgkDprFegbug7e46lOen34xJUqHJ0qhb6GPWgAB1HHp+ntwpoe/Si2t0lmZlNcC6yK2qhKEFC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJJQV4Qr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EEBBC2BCB0;
	Fri, 15 May 2026 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778828164;
	bh=E28SEwLIDb3+PpAiZhmbhvwtDQg3wtx7EViGkXr64Wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MJJQV4QrvjrVeyk/zbPckCwRwn65BEuaG7LwZto5P/D3wmmjimQi/zUa4Sec7/0dh
	 MHmCmfGvQZDRlt4su9VfN9/+g/bp9nKRyeyv96KrwoFJh8/RAbgfwkBdK9eVJM/NhE
	 TCBWF+9EycGm6B4H3aeMS05eYseTFVcGA8pv0Iu0M0xq1MsX+I2AHJOqEAFeHfstO3
	 ZWyV4BV/L3Qm+stJ7VBVBNJr8vdVtCM5B8nkg2cYqONLVOuhe+49rran6JIqATR2ZO
	 QRelSO+94VeIB3cBoWFb9AqB2mQ6ebHT6VWurhUjqsr4v7AvIUzPT0Ky+b3SkzkQe9
	 XQvW7mJQvbvzQ==
Date: Fri, 15 May 2026 08:56:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: clock: qcom,rpmcc: add msm8960
 compatible
Message-ID: <20260515-eminent-black-coucal-0acbfb@quoll>
References: <20260514-msm8960-wifi-v2-0-7cbae45dab5e@smankusors.com>
 <20260514-msm8960-wifi-v2-1-7cbae45dab5e@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260514-msm8960-wifi-v2-1-7cbae45dab5e@smankusors.com>
X-Rspamd-Queue-Id: 6FFDE54A410
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107723-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 09:08:30PM +0700, Antony Kurniawan Soemardi wrote:
> +      - items:
> +          - const: qcom,rpmcc-msm8960
> +          - const: qcom,rpmcc-apq8064
> +          - const: qcom,rpmcc
>  
>    '#clock-cells':
>      const: 1
> @@ -90,7 +95,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: qcom,rpmcc-apq8064
> +            enum:
> +              - qcom,rpmcc-apq8064
> +              - qcom,rpmcc-msm8960

This change is not necessary, drop.

>      then:
>        properties:
>          clocks:
> @@ -164,3 +171,13 @@ examples:
>              clock-names = "pxo";
>          };
>      };
> +
> +  - |
> +    rpm {
> +        clock-controller {
> +            compatible = "qcom,rpmcc-msm8960", "qcom,rpmcc-apq8064", "qcom,rpmcc";

No need for new example for difference in compatible. Drop.

Best regards,
Krzysztof


