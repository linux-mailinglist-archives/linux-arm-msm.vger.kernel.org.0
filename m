Return-Path: <linux-arm-msm+bounces-97933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKL9JDbyt2mfXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:06:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D61299203
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55E23300879E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9273932C3;
	Mon, 16 Mar 2026 12:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cHSj+cUu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDA2192D97
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662652; cv=none; b=FjUUwH3ri8VPyAfQ/RrUrmsSlqGm1Bp3VWGIVtIJ7GewLxAQWZJxfwonUuIFmpXq4l/9s0WxG1EYXi20zEMl+4pENfr6Ktzjm3oSjZXvK8dbJYg7lAf3oPn810CrXrqliouSgoLpac2lGaj9K556rTpkqF3BcF0XrtUMgqxVXv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662652; c=relaxed/simple;
	bh=LX5yusRdGu2NPKbwJNIiJLhad5QQp5GkRw1dSGQMaaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O9wahojMlmK2MGlUTCTevfsJA9uQRDY0cTr0zupqLC27g/unfStqwM9ZJ0tXeUdgUGeZO1MQIuawe8pmGz9JRk/K4LSEt5joLO1Lz/VTBF1hRYbUxYhkpa8jvRDcpTIJpHsFXs+I+O2SI1hUB9TBabOqq24u9jiLzFZKFV1GHt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cHSj+cUu; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9773abf811so456915766b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773662650; x=1774267450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cXZiqeg/Ax9pD8IPIWwwtJQH6u7g8vd5+THmAzzvx+k=;
        b=cHSj+cUurK7pBBqBPSZw0HfyDplYc3TfR85XerAUER8XotcbHoQvx3vknvr2X4BQyI
         4xi8gJUQjVwn5P664RsZkLfdFKz6GEIWWgV5qYLN7+pchQes3YXBChu2EIRbFNQK99wJ
         LkfgelXkfdUSD9QEvG5N3OHWdabmRFz2j5GTAPZpl9SOK0kFoXV7LKUxNeOzuqh9JvK+
         zmJci3zwe5a7rnHIzwWYYokV5rwzTjAPyNSJCYNRRYNfSaDGcqWXi05SgrLdKCcgoCiB
         xSsCwoR+9n12f3sdV/bcpi3XguHOP1gctIU+raRYkfC2LWcbCTf7vxtUuizYh+pR9GA/
         7ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662650; x=1774267450;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXZiqeg/Ax9pD8IPIWwwtJQH6u7g8vd5+THmAzzvx+k=;
        b=Obj7rUsKWQsSBTg3aqHVLhw5dIf1/4rFteoRy4MDCBSKjxtB+NnxN2VHL/LrMksDGA
         zagkYcC79xKSmWNIkQ79jhVuOZxTs56gH46UY5NpBaJJjQThP/FFO8ty3HRYWHiEWenr
         YN4aP8yCDL3CqA93n1ADz+RnCZjPF773gc/Cv6QYAetqL/2LyAN5Z2ybH+GGsn/k1I+o
         bmkS66rkgR1TgR0OgR7fSJSYQxEt2TBYEZeQ26s9kWPJ2/hLJkJWRA1BhpEd5svf2EgA
         F8VvRnmO7rzMFYUnLKA9h/WmdC945+pnNc/sU2wGJgV718AWqIilaEd4ykPeTQ/ACmtg
         Ub2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3Z/RetCM+T2o484gZ4hQLTfqGrGKGfR8CV4G+xxRKicm+ryjbt63njVJDUSbKR0mtp9VixPlLyX6HUdMS@vger.kernel.org
X-Gm-Message-State: AOJu0YzidWhvFkpgRF3vwLMlWVNV5L/EILsQs8ILEJW88GATVEa3lBiF
	tDdxTIr3cZhftUQBF6I+R63xcUg7bVaP6ORP4RJ5ifWoOXUfat9X4gRzpB/FCoThJrc=
X-Gm-Gg: ATEYQzxbcDd3r/7+c5mFwgDJii0JwgUcIe9JahO0qObaXJ29prMW0CjQVDAkmrvrVZ8
	EPaShB2//0PFwNZUU+sn+aJZLJINhlVHsBMVx/MPK49X2fo4JJF2oW7nMdpViyCKnPnprGgPJj9
	gwOXRGH0lJd/BDxniBecDsqZ/v3N0LFWV4XYAp5TwuFkNIfFf0QIBvoG3RSYQH+Hgtt30wDS2cl
	r0KEoTzHY0G1TBtfLj3w0yoy4FMmYT5ulfENoh5nAyCC/6eloVqIZKJM+md+eWpBx3VhmZJprrV
	+uCiovRDTY2qovp5YnEnP+5EOayXH0gphiw481jiGFJcl+dkJH9ND29SomQylFjC0T9x7b/HYId
	zixe6uJxE4Q0pWK6rYD6PjBiKwLNHzmJGvDccLAl7FxjWQnzpcu8uE9+49hCKaK+7v1M1bAEEKH
	aWmue5nn1Z1FvrZQbQw4D3lAeAlbeyfdo9ljeP
X-Received: by 2002:a17:907:1c88:b0:b97:7659:8bca with SMTP id a640c23a62f3a-b9776598f6cmr548363066b.40.1773662649653;
        Mon, 16 Mar 2026 05:04:09 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.226.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97d201082esm10993066b.63.2026.03.16.05.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 05:04:08 -0700 (PDT)
Message-ID: <976c8a29-bcb7-4207-9d3c-5b1f6036300b@linaro.org>
Date: Mon, 16 Mar 2026 12:04:06 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>
 <55db5547-96b0-4d3a-90bf-3d2b289abaa3@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <55db5547-96b0-4d3a-90bf-3d2b289abaa3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-97933-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: F2D61299203
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16/03/2026 10:12, Krzysztof Kozlowski wrote:
>> +		if (IS_ERR(csi2phy->pds[i])) {
> API is terrible, but it does return NULL.

Ah b******s... thanks missed that completely.

---
bod

