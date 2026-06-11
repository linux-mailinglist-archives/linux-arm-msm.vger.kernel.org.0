Return-Path: <linux-arm-msm+bounces-112695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lGOrI7OIKmqYrwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:06:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7935670AD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:06:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="S9/opner";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112695-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112695-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B8AD322EDB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824013CA499;
	Thu, 11 Jun 2026 10:01:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B653CAA31
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:01:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172095; cv=none; b=cCp/2hLJWb6gUpW8wXkTlU7i7EOnEEPaERjKofv8URC3gD8WmT/nCSNBqZGjo0ybHpY34bFNtezF5z3TwHz5lIX3tH4y5kW4K9AWMgSJ002TVY8qGtu/zlFoFtcNjyrAJygqfDtIOQ3yfw54MGNM/vJ0FvfGf+9zHenbNDYXqYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172095; c=relaxed/simple;
	bh=BkqlSsjGcX3YrWJRnGyFmjujGd7WbYe/KgGnMV2dbnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TFG0Wtlw1E7FxOP8vW1zW8Py/M/C5MECQMKlEr4n4sydEsMzX5Sn9jG06Ds1zhyrudDcyXSCHh/ehzCMiGT2KnWI0LYhOQ8mdGBybR79iNnYp9J3e6SWSsRU7HeM4ykQar69SeJylXQgRc8uWAokjQW6MO6r8GDoixud/cp3NdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S9/opner; arc=none smtp.client-ip=209.85.208.181
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3966e5e7cebso9129451fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 03:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781172092; x=1781776892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6S7G7H1yZX6es3QmcIIuBRUMbZtpN//hujuIUHm018=;
        b=S9/opner4eEUpjL1GL2e2/sQsYAQLzYmgFBHwZ4EXWuvp+5vZ3G2zTirJa8kvsWRw+
         Jj9PedNiVZufkuuxIeMqOoi5U6PRjZCq4G+syevDzY5lhnjNPn5cnf5f34ITcOCQZy5S
         2dV3zDFDKGOx9IvVFyCZ+MQJK2mRtPboLhSMTtIDbxDxRpLZQTXb2UYt2KhibJoUecdk
         KbogJy1usq1fpHVQvTEHHwoGXruaHLhjrIUkcv3KqO71gE1aaktfVxDPoz7z35x1bQxX
         EghRXnXv0236yOfomRaqfQa0I6YD/PLtgj59qXLn6rSYwTAcM+Ysl/IspHHPWoAq35hx
         xAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172092; x=1781776892;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z6S7G7H1yZX6es3QmcIIuBRUMbZtpN//hujuIUHm018=;
        b=qCct18jm58pmT5VDyobWeUkGhC01xQAIDynh2bdPRyy1lKkzQ4BGfvPlsTajJyt67i
         /7in6NydEHydLjQcP9/r7Up8ZUahnEU27QUO4pfdMCTM5s3HD+WOjwBy0YW4qFTzi16r
         WpShyV6FesSg/bUMgFF7JCKZWh4X6zmlXkHUSq/bZTYFjnEUPHOQ0Qu0JbK8TUVzJg5L
         WJRcWAGREUaUwSnJOE4NgaNeZbMHPdJxeRNGDR1qRceiT4vLYtNaKpZbqHa8eOL5jGEl
         pKimB9hAQDr+xarLkcihBl3UKGo7fQFVdZT11sFHyxqppzP0YBINtnbHel7ino8ybAHm
         bMVg==
X-Forwarded-Encrypted: i=1; AFNElJ9OA48e86xTI843SiZuSEhtWTA8p1z8RlAaY4kfWnQtyb9hc1tlBvVgFCqAYhTzjVEejyMqb1R/4AaiGt0Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzRT0FM2JwDDD70d9fvruq+0gqemWqNYf4rcCn1tDykZYDYE/GV
	yxk6TQ50K60pKg3YhmuQCqWj1VfZ5e8BQ/logzL6DTT6mOVVzfPLaVU+SCYO7wKn4+w=
X-Gm-Gg: Acq92OHQp4xXXGsKLMcVskYV7Opt2Q9bbyyKJuyTaEuto9LC3A2/65W4IN73k1ZC/dj
	LLFlTYmDVPGQEho/WpGhs+5dxWK8Gknn+RcBlvy+L9WMxyUKuPF8l7e5gHSqeB5vF/Lk+yWQWCH
	ZkGwSaSf+OHUBS5RFi74Fid7TXfhyQVOJRKgwBjQaYAJcUYwzRqo07mi/S1BZwQq1uGM6ZXQDYE
	QyF5btqbJDAN5PPKycAiPFPNS63hC4fSz97/z8OyxLjY71wxavws4lapbZStQNlveIuE1ryeRRQ
	Xjait+8FYlzZhV8/9NG4fybLGpC5MIt4OELbIoA5uSpnr78UiKDJC8Im6hLXeksRSbF3X2jLG5X
	Q8zT5SQIJtnAB9UdU0+9GpC4amnvd+vGoqRx9NTVcCkVNFhrpBd4xp/hYpYhN0rtF6MQR0NS8Lk
	EFjKEmCPVJctwriUmt//4jnPxYkiAVRqDYGQcJOsuMEZDessTCmPpvSBlnwaOZwnn75uM8ZQMra
	0zU6obicCguq7o+
X-Received: by 2002:a2e:a90f:0:b0:396:7e06:4ecd with SMTP id 38308e7fff4ca-3991a0f7804mr2442451fa.7.1781172091878;
        Thu, 11 Jun 2026 03:01:31 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3991adc355asm3445981fa.41.2026.06.11.03.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:01:31 -0700 (PDT)
Message-ID: <8be0a964-e2fc-4c0a-a5ca-0e9e42b3d747@linaro.org>
Date: Thu, 11 Jun 2026 13:01:30 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] media/arm64: HM1092 IR camera and ASUS Zenbook A14
 (X1P42100) camera support
To: Ramshouriesh <rshouriesh@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112695-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:rshouriesh@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:bryan.odonoghue@linaro.org,m:loic.poulain@oss.qualcomm.com,m:bod@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:alex@vinarskis.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7935670AD8

On 6/10/26 14:09, Ramshouriesh wrote:
> The ASUS Zenbook A14 (Qualcomm X1P42100, "Purwa") has two front cameras
> behind the SoC CAMSS: an OV02C10 RGB sensor and a Himax HM1092 mono NIR
> sensor used for face unlock. This series adds a driver for the HM1092 and
> the device tree to wire both sensors up on the A14.
> 
> The HM1092 binding, driver and MAINTAINERS entry do not depend on the
> rest of the series and can go through the media tree on their own.
> 
> The remaining DTS and PHY patches are the A14 camera enablement. They sit
> on top of several series that are not in mainline yet, listed below. With
> those applied the series builds on next-20260609: the A14 dtb and every
> module it touches (hm1092, qcom-camss including csiphy, and the
> qcom-mipi-csi2 phy) compile and work: both sensors probe and stream
> frames on the A14.
> 
> Prerequisites, in the order they apply:
> 
>    1. phy: dphy: Extend phy_configure_opts_mipi_dphy to support position
>       and polarity (Bryan O'Donoghue, v1)
>       https://lore.kernel.org/all/20260325-dphy-params-extension-v1-0-c6df5599284a@linaro.org/
>    2. clk: qcom: videocc and camcc for X1P42100 (Jagadeesh Kona, v5)
>       https://lore.kernel.org/all/20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com/
>    3. phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver (Bryan O'Donoghue, v8)
>       https://lore.kernel.org/all/20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org/
>    4. media: dt-bindings and PHY updates for CAMSS on x1e80100 (Bryan O'Donoghue, v11)
>       https://lore.kernel.org/all/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org/
>    5. arm64: dts: qcom: x1e/Hamoa camera DTSI (Bryan O'Donoghue, v3)
>       https://lore.kernel.org/all/20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org/
>    6. media: qcom: camss: Add support for X1P42100 camss (Wenmeng Liu, v2)
>       https://lore.kernel.org/all/20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com/

That's a long list.

> 
>  From the videocc/camcc series only the CAMCC block (patch 6/6) is still
> needed; its clock drivers and bindings are already in linux-next. That
> patch adds the camcc node and sets the Purwa camcc and videocc compatibles.
> 
>  From the x1e/Hamoa camera DTSI series only the CCI and CAMSS-block patches
> are needed; its CAMCC block duplicates the videocc/camcc series, and the
> x1e80100 board patches do not apply to the A14.
> 
> Patch 1 adds the OV02C10 node. It is Aleksandrs Vinarskis' work, carried
> here with his Signed-off-by so the A14 camera support stays one chain.

This patch should be removed from consideration, since it is not based on
the upstream codebase.

I'd suggest you to upstream the sensor driver only through linux-media, which
is patches 2/9 and 3/8, all other changes should go only after it.

-- 
Best wishes,
Vladimir

