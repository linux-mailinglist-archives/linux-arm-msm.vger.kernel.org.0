Return-Path: <linux-arm-msm+bounces-98501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKp6EjuwumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:01:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE552BC871
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4A5E3259BA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0AD73EAC7D;
	Wed, 18 Mar 2026 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQ1HaFpa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB1F3E9F8C;
	Wed, 18 Mar 2026 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841882; cv=none; b=r+C2ajLQ6DjoN8vmy1iYI329/7VVuSYFoNyPq++StufwS68huycK/Im/09cKLWpuGK7jrmLzfaB7gek5NpovgC1vHG2oW671hSNp+g3kiZ2UK8HEDdeFCnXcpTZgANF61aA3TJX7zXmb97JfWgpGlKjNK/p+VURcen4hY/ER9tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841882; c=relaxed/simple;
	bh=PgR4C/uVVgP5PRk1scjo2ui7uzU1sYhEQXIY1o7ZGeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JQYIitLXtJEw2F62m4PJY1cLYqRgJLFx8uoUNt3PBwaGydZOaOHJMJJ8iim3pv1MVbaM2wFThA3TV2GSDX93rPLmUbzj7G3JrYVKSlXoVIqTJ66Lspia0kwMs4i7oFm/5HxJ0Ov0davWZzrqg4LjpPF9iaxeHxjgSJHzO9jhAsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQ1HaFpa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53AB3C2BCAF;
	Wed, 18 Mar 2026 13:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841882;
	bh=PgR4C/uVVgP5PRk1scjo2ui7uzU1sYhEQXIY1o7ZGeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BQ1HaFpaFdhGNM7zI7aSGHq79J2Z7OT6a9rb6P3jFx5yQXJYUhqQ5ezSUlJWZpveV
	 bHVOBriVhZwBou9w/V//6bUR5BPWgS3nEtLECi+M3dEDkS9yf48EwN5u5FCORgWxUK
	 rlWyMGz29YrYrumnx76v5TqWO4VbJhB9UoqfcLhWroeMG9WoDZiqjaiA0ENUIe9iu9
	 PnG2J/z5T7wITpYe82Zy7O2fLiW5lcgEgoroENNb3Z1r3JpW+/4M5Cd27tuHA4bBxK
	 gvRc2RkEF5VLKIzMWnBk3lJZBP8rzCTYiGwf5VACxvpLnWYKImKp49g1knMSQs3HT3
	 ck+LH79yBpFQw==
From: Bjorn Andersson <andersson@kernel.org>
To: =?UTF-8?q?Kamil=20Go=C5=82da?= <kamil.golda@protonmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Yedaya Katsman <yedaya.ka@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Add Focaltech FT3518 touchscreen
Date: Wed, 18 Mar 2026 08:50:32 -0500
Message-ID: <177384182898.14526.14370567378778247054.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208-touchscreen-patches-v5-1-5821dff9c9a2@gmail.com>
References: <20260208-touchscreen-patches-v5-1-5821dff9c9a2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98501-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[protonmail.com,kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BCE552BC871
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 08 Feb 2026 23:24:23 +0200, Yedaya Katsman wrote:
> Add device tree node for the Focaltech FT3518 touchscreen on
> Xiaomi Mi A3 (laurel-sprout).
> 
> Enable qupv3_id_0 and i2c2 bus that the touchscreen is on.
> 
> Downstream references:
> Link: https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/laurel-r-oss/arch/arm64/boot/dts/qcom/trinket-pinctrl.dtsi
> Link: https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/laurel-r-oss/arch/arm64/boot/dts/qcom/laurel_sprout-qrd.dtsi
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Add Focaltech FT3518 touchscreen
      commit: ea062e42832274cc8fb0587ea8852e1558cef0e1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

