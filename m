Return-Path: <linux-arm-msm+bounces-96304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJcuGn39rmkxLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 18:03:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B5923D4D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 18:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 799FF302FE6E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 17:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9380429ACF6;
	Mon,  9 Mar 2026 17:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhOsN7Tj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B56E299948
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 17:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075681; cv=none; b=TldXhHZ9KpeAy6U4gqgRQXn4qT24vpOh9I2+sIar+Tg1ZOG4CKgWvJfqnhGIiLBTVVsNmb0Ky/1om0rE+0nB/iQKp31rOb5m3YOdPU+TOZYbrkH3xwh3TlH8jU1+GQvd7h/grQUt0L0nkfOZXeD1JOCS+O9app0pfy18sRfPUKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075681; c=relaxed/simple;
	bh=H5DiuJdCeJiJ1Q0vNDzciFaELOrpulAYrj4LL2milhY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=gjVfhQJDQbDQkFlETFVpNG8eHO1NaEhL9S8p46g1ZFJ/DeC4f4DVr9k6bZ0kBDhNJXgkpXigkU/LTyJvFvnyeAaOK+hxthKzCruShGSIK8Nb37JcOxIu4LDm+wkxRgoqozfzfJz3lbxtfJgU09XdURvPkdbbQ7qrZBOHfoPh1tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhOsN7Tj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-485345e1013so12488175e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 10:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773075678; x=1773680478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bGjAJZg3kAEKg3RqCoiUO430+IHfGMI5W87dJSgovE=;
        b=nhOsN7TjpV79V5MADIDStxPeRFSJN1/EMX38hLYh7+wqPJENHrOJckMKhwwlKbGy9Y
         fkK8Kp+TepE0AypuwPipKGrJBPm8lAaEA+1ANcP4o55qVw/JhEvsagkrVDTGdXNZ5DOS
         iNQzgud8TuPFumAa5w7AkrJLDWYyqEoC7nqYpPPTLgXPSOMzyVTQ2z6CJObJX0++OKnu
         A4z4qoOhree9VMgH8KWOLbI10l6snp1eD0mskvbrp208wdrBC7S+mpC7Q02Qw3MSyCYD
         RjbPGvENu54qFxKE91+Av3hF+HaIWMwYLlv1T6oeMZjWk1XestB/RNqfJt0BcRrU51QG
         dAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075678; x=1773680478;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bGjAJZg3kAEKg3RqCoiUO430+IHfGMI5W87dJSgovE=;
        b=NUYp7efxI++DUCPY1DG4kKldy8xcfWNc7Qco90XI8F3Wt1cWeoXSiJGIN6nlFQcyYT
         k0TLyI5OdvsWRqSrwh4082ZSrY+daq4aJuQo9bZbv4TvDXBP4qgfNpOJ+L0pzc1rhqYj
         gz89r5LHqbFtzIcMapqkDL940hwvf6umBUm+BlMBg3EuT2S2Vs+WApinwnkCirJJzeio
         O7qfBzL262suuXWMzfLHwdHku4iVo7ZhdDrWH0H+oFj1XIMHkPh9xci6Hq0uIwxI3z2z
         i+jG1G5EYbecqhSO6nR3pl8eS6fkXh5SF5MdLljodIjVCPpH8DWUnjfTgEIIsaPztLLH
         ZBzA==
X-Forwarded-Encrypted: i=1; AJvYcCUQzZ7JDPQkuO/wDoqPyGh6JfV68oLBQeWgQmobRqjhmkrQnnLzIpJEfMpe3WM/hrOoHu39yvJOygGuvKxR@vger.kernel.org
X-Gm-Message-State: AOJu0YxOXwf3uB2HXU2nWgiIeulh6hZXInXMCz/xrZIqcf5VZUboAgL2
	IMYBjTuMmMRnIfQgN8HDflf5ItIQ5oEVvkOr4U99qiTAGklPqYYVuwyU
X-Gm-Gg: ATEYQzwRc/WgNsR9Fho+1qLbr+Lhwq/Vd9DD2bDz08f8nu84eWvN/c8FerC+DorDxm/
	jAVW8C3vmFXwN9YL+jBkWxQWKYZMBj/FOdIBIu+DAP7ZMAyGEHT9Y9i+uCf0Q3OMIqlybNEclXB
	mhDQadMy0MjAqvWiSZLky5ZYaNdVkINWEfmgH7RrStg4EEPf2cnXPfHTJHTotrDTngzCI8IQS7Q
	23f2+NoidM26dzKS7QtzMx5XWeuMm46JHAXxkcf/flmfODyXWWTHSYgYXfjAoEEVe87nluscj+D
	05m/AjBzpYmf/7CZAnei3p66zrCZPu585OT+DEPUxxxpCjNRTWiQRoqcLKD5fJn/E6vL8Y1257S
	EZpOyQ9epR0y42lc6JI6814BhrFe9p8gJ+ZLPB+4hSZdQaawt2gT0NY5tLK7DrVbuws1pynGPXw
	Z2v08Wr23AqMhWhiZeUR0IW+1scpsgSVO6Mi453fqnGNeHCv4Fk2xP7Mye1F40tZh0lZWJRy9P3
	1iwsJnT0s9BYiB3KJLADXPNsrOYmLHt6shIEhm+pU9OTp1t0TTrcG3xL6ql1TA=
X-Received: by 2002:a05:600c:5894:b0:47e:e48f:43b5 with SMTP id 5b1f17b1804b1-48541a7f3f5mr3310265e9.18.1773075678161;
        Mon, 09 Mar 2026 10:01:18 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f46:ce00:5f9:7f3c:5f9a:2a3d? (p200300ea8f46ce0005f97f3c5f9a2a3d.dip0.t-ipconnect.de. [2003:ea:8f46:ce00:5f9:7f3c:5f9a:2a3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm31393267f8f.30.2026.03.09.10.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 10:01:17 -0700 (PDT)
Message-ID: <9d5724bc-e525-4f8f-b3f8-b16dd5a1164e@gmail.com>
Date: Mon, 9 Mar 2026 18:01:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 net-next 0/5] net: phy: further decouple provider from
 consumer part
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
 linux-phy@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 09B5923D4D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-96304-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hkallweit1@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.865];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

This series aims at further decoupling the provider and consumer part
in phylib.

v2:
- patch 2: add needed Kconfig dependency changes
- patch 5: explain false positive checkpatch error

Heiner Kallweit (5):
  net: phy: move mdio_device reset handling functions in the code
  net: phy: make mdio_device.c part of libphy
  net: phy: move (of_)mdio_find_bus to mdio_bus_provider.c
  net: phy: move registering mdio_bus_class and mdio_bus_type to libphy
  net: phy: move remaining provider code to mdio_bus_provider.c

 drivers/clk/qcom/Kconfig            |   2 +-
 drivers/net/phy/Makefile            |   6 +-
 drivers/net/phy/mdio-private.h      |  11 -
 drivers/net/phy/mdio_bus.c          | 385 ----------------------------
 drivers/net/phy/mdio_bus_provider.c | 319 +++++++++++++++++++++++
 drivers/net/phy/mdio_device.c       | 165 +++++++-----
 drivers/net/phy/phy_device.c        |  13 +
 drivers/net/phy/phylib-internal.h   |   7 +
 drivers/phy/broadcom/Kconfig        |   4 +-
 include/linux/mdio.h                |   2 -
 include/linux/phy.h                 |   3 -
 11 files changed, 444 insertions(+), 473 deletions(-)
 delete mode 100644 drivers/net/phy/mdio-private.h

-- 
2.53.0


