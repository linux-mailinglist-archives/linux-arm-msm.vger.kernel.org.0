Return-Path: <linux-arm-msm+bounces-101171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FayMCZAzGm+RgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 23:44:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 86543372205
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 23:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B22C23070483
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532774534A5;
	Tue, 31 Mar 2026 21:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NwYRp2iR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC814418E6
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 21:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774993039; cv=none; b=HdIfpLhyMvNuhu08hma1rm9xMxFmuZVUoFLu3ShH2QgHdaBca9SNKuBioNws6as893BH2auNb45Axzj+iU6M455SVkLKRvPcWT5cFlw6fhsUh3vOr1Rt4DazAJwUCPxg8wea1C6OV0ZkxYEq/l4x/1XGwOIxpEcpE/ZVq1JRhSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774993039; c=relaxed/simple;
	bh=77TKJXfDqxRbDJZcS4iQHfQ8ePzfWbiSwaDIcMZRDug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOLHFky/N7gyEQuFgSlQEixih9NnbD91+UD5qjrUJ6XrpYLFccAp/4qsyvV7hz8MB12aCGlLmUxNtwU8k96l7mIjxH6SL8YxNbDE4g2eo3oTZ2/4rTXkzy3Zn3sH4kouDW8xAvW6qb4TXJXqLloNT07OyIKrc3L++5T+f1UEHX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NwYRp2iR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a2c0710afdso75616e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774993035; x=1775597835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHUi+YrE+mS2lDKmIKKoK4NA/mtXRLEN2zW5bJXcYuk=;
        b=NwYRp2iRxPPx8fvTfwe0/Bp9h9kSs1CCF1G2mfCPegUPc8pWgatU+ffGKa9dT/6Pi5
         0h9a5fuAppZYQLmujL8LjF16ErqGiOs5pXwzP5nU+lwnmTtVQwGKTVjyouPQ1774Vx7z
         f1bq06Y9Aw2XzbKYsWR1N7tCNQL+ETTk2tD6s55UwFYTGV2rvyES4eaG2wrTFMKFcgvm
         hoYjmzhrwyaCOq0KPdRFme/9ciAH1YqzcYxpFsV8A3dFxNLf1rXUTHe3nmhsVgXdWL7L
         POV8H7IMAnWS1eCQExEtZjh0UpO7oyf6/CmDofzzyhtOGL8JKV6XBIm73YnthF8OJFFl
         i4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774993035; x=1775597835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KHUi+YrE+mS2lDKmIKKoK4NA/mtXRLEN2zW5bJXcYuk=;
        b=I5XUnwPhT9VO8R8mfCLoyH/7QifVayWTsLV51gWGAOdigbAvMZqnPCk8wXdRWuvIsk
         vcJV3wlKYwidai73MGk4vXKS4fKzeFHNz9CFesAsOv8lChw+YJ8tCuZShDTm1vFgkB8v
         e1MM7iA34DXnuQbhBjvFN2p2wtdnt6tEByuWYXi2SAkortrl5oQ4YphI4LXpTUQOdIao
         blTFYedQAVz5h0VB0xWSNk4YACNuFypisPeXDsrVq3TtBSrpvCmry5vI5JXhHtdZJdez
         XBvqUJpmcuLrunQ9tt1B0pks2eVTcf1V7QZ4RXrf3oOWXb6/HNLTrqL9a96OuboDfF3t
         yMrA==
X-Forwarded-Encrypted: i=1; AJvYcCXT9ur3U/K4d8s1KnCjXSO8tf07JEKMrBJRuLSooku6v/S9rEzbWNwuVSvAlhyW3bFi3FqaOTPYQsmkg341@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0J2c6n2QwSHFBtvQKuF5GHKoHGSIA64vTzG9v8x9Qg74mCg9N
	lvtB3BUdbBsYAZ5Idyo6nBybs83GrqE+wNl+fkNwglWlH18sZu0ljsBSHhrsoZcW4ZJ5+EleA51
	phsHj
X-Gm-Gg: ATEYQzyLspHm66DNuFFbJqq18+hQwsG6WHWsvuIh+irDln//zXQL6mKWpc5MCFO1FFo
	XuIoxVXRTFKczuv4vzW2Lyc6Xy3II7rI42yNX8/JlpcF1fkEGHSvZCn5SekZUZBpEO6tdRlGDtt
	7sVCYuI+kJfNjbVcslpFRgnt5IZMl78Mw+KFoVMFRhCrRfzIKJEyig4APCRsZPS91krXtg18Klb
	EDPONPO3KFezUl4AECgQwio0h68M6WFJyzRYvKa6kAwKQTFce5y3/taOCmRAAc33daw6CnuBaTr
	QJx7uoUJrRxlXjsdc7cBjMOMpDLdQ7FF7z0M+ajuPTOiv2p7d7meT8IfGSp1Im3j9RsLw3J76Qk
	6Ni2IdsAHiDDuZrwMYR2l3Z325kDtSwTztmfw57meOEdRxCBgc8WILOphZfF1pf0w9555NUj7I8
	dAT80wOjOgXxCk1+suirJDMrRu1fq+4Qk968MnmpROK22R5drUVRsARdJPvOGKbCGJLTsdBptHr
	ms/DmcQgiN71+Di
X-Received: by 2002:a05:6512:1091:b0:5a1:3d15:287b with SMTP id 2adb3069b0e04-5a2c1c98cc5mr165782e87.0.1774993035132;
        Tue, 31 Mar 2026 14:37:15 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83890bbcsm25187391fa.25.2026.03.31.14.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 14:37:14 -0700 (PDT)
Message-ID: <3c51f9fe-9c5f-47dd-a971-5b2a9e416230@linaro.org>
Date: Wed, 1 Apr 2026 00:37:14 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/7] media: i2c: imx355: Restrict data lanes to 4
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-5-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260217002738.133534-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101171-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.944];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 86543372205
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/17/26 02:27, Richard Acayan wrote:
> The IMX355 sensor driver currently supports having 4 data lanes. There
> can't be more or less, so check if the firmware specifies 4 lanes.

Does IMX355 sensor hardware support any other number of lanes?

1) If no, then it makes no practical sense to check for data lanes number
given by firmware, there can be any stored value, but it's known that the
number of sensor data lanes is 4.

2) If yes, then please return to the sensor dt bindings, and reflect any
other options, right now it is set strictly to 4 lanes only. In case if
'data-lanes' property is omitted, you can use 4 lanes as a default number
of data lanes, and this information shall be documented in the dt bindings.

> 
> Existing ACPI hardware descriptions may not have the data lanes defined
> so this check also accepts a placeholder of 0 lanes.
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Link: https://lore.kernel.org/r/aW3uFcT1zmiF4GUP@kekkonen.localdomain
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   drivers/media/i2c/imx355.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 9ca87488c933..0d6aabea7d59 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -66,6 +66,9 @@
>   #define IMX355_EXT_CLK			19200000
>   #define IMX355_LINK_FREQ_INDEX		0
>   
> +/* number of data lanes */
> +#define IMX355_DATA_LANES		4
> +
>   struct imx355_reg {
>   	u16 address;
>   	u8 val;
> @@ -1705,6 +1708,10 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
>   	if (!cfg)
>   		goto out_err;
>   
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 0
> +	 && bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)
> +		goto out_err;
> +
>   	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
>   				       bus_cfg.nr_of_link_frequencies,
>   				       link_freq_menu_items,

-- 
Best wishes,
Vladimir

