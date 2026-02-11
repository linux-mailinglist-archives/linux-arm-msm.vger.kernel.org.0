Return-Path: <linux-arm-msm+bounces-92558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHnKA1D+i2kgegAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 04:58:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EB612118A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 04:58:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 94DF63007A54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9143A34FF7E;
	Wed, 11 Feb 2026 03:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="if4/vhWP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7147C31B124
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 03:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770782279; cv=none; b=Rh0EtNtZBU2DGZB9ZyLeq0EDz2kjfXnUCZ8FpibXN4xKHuN+8SbHZHLN4YHBTp1xfvYzr625/Nq1bg+t/yWvoxw17VHgbwpweKo4fNi1HGROfDp4k3NEY5IIxutRCmWAc/r5wqEuXH8FPGWzVbiHPkBjYUMqxnFQKnjTPzhkwP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770782279; c=relaxed/simple;
	bh=Vwf6MwPNxwf5qH9YPjWuQA3HO9ZAlpcmhn5ASXwPvWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8zXMbkPVCnu79EUp5xD0Uzc8vaomtlfx3uHGod1ypdXx/UoSknkqMpoLcQwfc4Zfc4fpXCs8eWe61f9oG6q4MtqbOhSWfNr4hQKVen+bMiuze9GKhbF58jnSE9dFhkEvfEEIETdC8GAn6W1WfLaLXclyvtCVVIfci+0TK6fJhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=if4/vhWP; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so11576675ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 19:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770782277; x=1771387077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6LkflCyXtk3W49ffamwBiKJAxUhYydXMVu3kci/fYZA=;
        b=if4/vhWPH9RMuXcCFLG9/5ktOGGzm1LfTnWoWSnqe8zE2mSzxUXNBp8y+8zj6ofAy5
         9jUI+1/S3Kc2AlSZsyUiIR/ABoNab/AHdWG1sZyrewOQnLW7zy9XREqgmbfaCf/X8fLk
         zG4SOtZkTiscXOFJGXGhH+iIHb7wPjTqr5mNcBFkCYN20FUjd5ByIihPbLcMJm4OBb0Q
         kTuST1WB+TdwWNL6je6tTFb0ADmiYInM4PeoZKgMPJgdXtzTicQNHlA+AGyrWDvNfeHK
         QHHbGS9tAf2NQMqeHbfv+BYtbrFoRkqS1oqQzCCJHvqGDJu7rg2/U+JwgBu+cTKq7DC2
         IGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770782277; x=1771387077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LkflCyXtk3W49ffamwBiKJAxUhYydXMVu3kci/fYZA=;
        b=TZNtLL3ji3hZzow8lxoyx7URnxyWDdMQxjh4/aj8TCXsxRxdxqbm2854/YP8YNQPpM
         zZvGRQujYUz+Roehd+a/6uwePf4aPaiaCLXXmnCIhE9Al2ZtKPSvIVGQjdmFtFOjA66S
         f4+qOhJVwY8wfjKpNH8JkVI3Ly5ar9oCMiEzxm5QIFz6AzvzBRpdSiQrvjJa6TQG9LfK
         NH2fQcR7UakUfejQDbtdHswBoPl2Y2RmkBam40RRbfxwL+8Rk9dgn3odQMSFTwnLpgKd
         yCa3xgQ5sQX4gEFxX/WsDZj8PhkhH0sZj9Z8RYUdw8srq80vIscd4ONWQyyr+/6juPhA
         +HHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdtj3NuaHp4v4U57AnGxaqjG2YGXKorxpeHqjqyuG1rwKswlGw8orLA/OqOjz62ixLUP0NInV5r1dXKu1H@vger.kernel.org
X-Gm-Message-State: AOJu0YyUt9orLVg0hRBbQJiwqFwUKfEy43o60ZA8C6031K23MoUlo4Cy
	SXcYXVhdPBZXxZnyVjoAKriP/N3Ax5zR1PlAUjFi8TV8ZWvRzIUquqZCUsgugg==
X-Gm-Gg: AZuq6aKhz3tM19iQaA/tazhNuT7W+/3OFCluUmCCwRHi97+mYtdHNqjyB7A+0Nzg5ix
	4MsvExrPwbEoRCsPyl5bfyEBVRH9F/4LDNGWcl6B088ANmHLTsmSXduD5zNN4OH5yOKvDYJaRKo
	W1ShGCTfrcJV5BYRffO54dev2f6u7Evj2SFF7sdZExXh4iEroFdIGx5AhQ1gPuFIZqZ63LfvdTm
	4XdN7mwI2EGKmgDyOp8urF4yXn0iQ8oSndVzxtqXMEMA2IV/9qLg3L3rqTZqcrYPiW/84fTUQe5
	eFW0l1x55BPoGJy8E0GCATOsI51Sd1Vu9OhaJW0lsUmVfFjkKO/1CjOY8oYMKvZKkGaS4obh6hd
	rSUYkWTD2c1oJn6yqcPD2c0Y4YDid/LaHw/pVtmOJcruc+l62+yCN1Is7kOXGafHX5dKK6nskCV
	RfI5IA/sqQthmvWjvsg9Y6q5EA08eftbtZmdLwAOIU4xdogkcDi0WX9WxRwQqB3E2yjf2vU8Ugh
	RpEebpW8rnz+xY=
X-Received: by 2002:a05:620a:28d6:b0:8c6:ca30:fbe9 with SMTP id af79cd13be357-8caeeb510dcmr2216238785a.15.1770775325833;
        Tue, 10 Feb 2026 18:02:05 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0bc2d5sm11981085a.10.2026.02.10.18.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:02:05 -0800 (PST)
Date: Tue, 10 Feb 2026 21:02:42 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: qcom: Add SDM670 LPI pinctrl
Message-ID: <aYvjQjnBk9B5usOk@rdacayan>
References: <20260210021109.11906-1-mailingradian@gmail.com>
 <20260210021109.11906-2-mailingradian@gmail.com>
 <4f89cc2a-6e30-4ee3-bb95-f2df25b5b88f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f89cc2a-6e30-4ee3-bb95-f2df25b5b88f@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92558-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 38EB612118A
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 08:41:32AM +0100, Krzysztof Kozlowski wrote:
> On 10/02/2026 03:11, Richard Acayan wrote:
> > Add the pin controller for the audio Low-Power Island (LPI) on SDM670.
> 
> Subject: Missing "LPASS" before LPI. I really thought you just add TLMM...

Added, but does this extend to the other patches as well?

> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >  .../qcom,sdm670-lpass-lpi-pinctrl.yaml        | 81 +++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..125f365d11fa
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
> > @@ -0,0 +1,81 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm SDM670 SoC LPASS LPI TLMM
> > +
> > +maintainers:
> > +  - Richard Acayan <mailingradian@gmail.com>
> > +
> > +description:
> > +  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
> > +  (LPASS) Low Power Island (LPI) of Qualcomm SDM670 SoC.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sdm670-lpass-lpi-pinctrl
> > +
> > +  reg:
> > +    items:
> > +      - description: LPASS LPI TLMM Control and Status registers
> > +
> 
> Hm, no clocks? In most designs there has to be HW macro or HW codec
> vote. I see SDM660 does not have it either, but I think this might be
> exactly the same mistake.

No clocks for the pin controller, unless the ADSP enables them on its own.

I see other clocks required for full sound support (including some
board-specific codecs), which are unrelated:
- INT_MCLK_0
- PRI_TDM_IBIT
- SEC_TDM_IBIT
- INT0_MI2S_IBIT
- INT3_MI2S_IBIT

