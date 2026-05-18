Return-Path: <linux-arm-msm+bounces-108300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MC8nM3ulC2qRKQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 01:49:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 90826575272
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 01:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22337302A2E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 23:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D202833EB0E;
	Mon, 18 May 2026 23:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ccsrn69V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC2A33D6D8
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 23:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779147798; cv=none; b=W4v16oR3OBaMGFF/EzENTQRbDcMoufjn8YBGROhHwEnkamODsauO01EvxMu3WbcZZGSmWRVCGtPsADUTSPjFuAY2Dxy5lo7I01wYieVZPyxdeD5xU7zMWTToIvsVhF7FcUdGT2Xd6UT2nfx/kWZxNGTmKz7/r+iwh0ey5MYynvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779147798; c=relaxed/simple;
	bh=ebvesQ8qFlXiPs2rj2qY2O62rXHnvh6W40TORpD1fUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nadusdij+Yk3Xht5Kjfnt6RVtHQVgY5Eux1hYnt5p9digSgypqMG2lVqV5JVUK3OOgeYoCVhRtz1FfoNxwiRok0HXgl9KT5XyoYcS9lanWjsJxrnyJO4GLJj74yNFyARjMu0Xd3i1zazmdB5mhwQvq3UNWeTY+ipoeg2e21d8x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ccsrn69V; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so18507755e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779147795; x=1779752595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEoPrUHKxysLWOASnPxB7i564xWUA+RRCTSF/dKDla0=;
        b=Ccsrn69VKHwxYPp+RUGCy8T3gGSPytVDFcv4W1QpogcqETajHsEJsC+dghGqHNMCj8
         y5rWTYdrqIS6P/dMF1l0LvrJvuaVPoAhds4GcRJvPWyS1ollmSHNW7EjL7h5KJopKnP/
         fvJIPjSVVIeAhLwAULACwYtKUj9Az0aA4dNxwWt/cxIeX30j74o+HA0uSrHSAifWGeQ7
         Wu1sGc37l7kssKj+K/rWsFq4zvjBDmoJ9m7GfHiJeR65FMeQ0ZulRR1sNoWo9DLKXHvR
         E6BqEgklMuDCMPY95kM2nst5+jm52/XtQFEf65uyaaePRNoMOUlAYArvLehFAfdz3Evr
         JO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779147795; x=1779752595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEoPrUHKxysLWOASnPxB7i564xWUA+RRCTSF/dKDla0=;
        b=bljkb9PQSluW33Jnwa3yBEndPp0lzUfcilhOo/c2AFeY9zNy2UABNotOQx5FgGEuju
         H0jJUlkaOOlYka6zsQKLCY7gSHP1ADcm19Sbd+E8/ErGqgOFV9pUvL+l4ZKpYEXvEAEG
         Sg4PnLYo0w4mXYVez8HHocZhEcGOS+H0sUyNJpWozzNBjabwpH4nA8yiLoZxoXwfh387
         jxkCyFD8y+2btKzxKuXP2/g5/LZ4pIzqOnUlCXoJ4DJJYh4RCMrQ3YEt1zCEpFA8Xn/6
         +dRRtJv/0KE7oW6CWs/oFN8i914mPzq9YqspIZ7aJ1RFiLrPGpdvIwd6NNdY8+gxQ5/q
         jlqw==
X-Gm-Message-State: AOJu0YyvuckaybyF8pDoMIVosTpLFAvpbGdZznjKHhW6NT+VS2eMt/6B
	zOPo2K3ztLncj17MWw+Hk2G0KQfgWFptb0K4tWK7wENMtebjLrH6BctkQxB6bsp5tg0=
X-Gm-Gg: Acq92OHMq7MKK8cEm3WKKgiIKafEQz5pBdgyM33nfF2d3VvEK8LCAvfqKpNNagZtdjM
	b4ExNb0p9Hk/1R8jHP99IG9y/NRgP3R4AV2a/n2vSVyjiexbuKsnPF3RrAHqt5XEArmz7ikITsR
	vEjBkPU9mee4cDFAuf17XFrinbnFbnNpCjJ9gWpgNWS33cWMjFj37IShpQdOMcDo6aU7QiS0oXn
	JXYYeiwqmQ3B12KklV4U8fKaZqvaQ70ctIj4r4l2XTn9UTqwrJ4ZFy/tGX/N6d8DXbxtwm3wAiF
	Rgkck+GZWKOAW9Gz0cyWVAsgVwaG3dEUAUBhZnr6xvl7A6z5GdBo4ASMmwViCas+eepnLpJDbuk
	lbjZJyC//FUlqne+j+m/mnkMldZsa5dYRkozliX/iNhdnidMVUWjOhdsYZ1EGVpLtzo6teP+r7F
	89YW7ujQPI0Ma7fQdqR4hFRfusOEJiFlQRSlZUWtE67m4=
X-Received: by 2002:a05:600c:34d4:b0:48f:e230:c3fa with SMTP id 5b1f17b1804b1-48fe6626a58mr269207245e9.32.1779147795601;
        Mon, 18 May 2026 16:43:15 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.40.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed30110sm44562460f8f.13.2026.05.18.16.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 16:43:15 -0700 (PDT)
Message-ID: <ee9061ea-8f70-4b54-af87-420179da9c06@linaro.org>
Date: Tue, 19 May 2026 00:43:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] usb: typec: add Qualcomm PMI8998 USB Type-C
 role-switch support
To: =?UTF-8?B?0JzQsNC60YHQuNC8INCk0YPRgNC80LDQvQ==?= <taygoth@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>
References: <cover.1779127507.git.taygoth@gmail.com>
 <918adf8c-14d0-4d9b-93d8-d34592aa04a9@linaro.org>
 <CAFPzRonyVt9Kd+Sc0ooNz8By6b-Zr_jHr0sBXv-M25dQ0w9Cjg@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAFPzRonyVt9Kd+Sc0ooNz8By6b-Zr_jHr0sBXv-M25dQ0w9Cjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108300-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 90826575272
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 00:37, Максим Фурман wrote:
> Three shapes for adding a second port handler to the existing driver:
>    (a) extracted ops -- pmic_typec_port_ops with chip-specific get_cc /
>        get_vbus / set_mode / set_vconn / start_toggling, refactor PM8150B
>        code into the ops, add parallel PMI8998 implementation
>    (b) parallel port file -- keep PM8150B code untouched, add a sibling
>        source file with the same tcpc_dev callback surface
>    (c) per-chip register table + per-chip decode helpers in the same file
> 
> Bryan, do you have a preference? I'd rather match your taste than guess,
> since you'll be maintaining the merged result.

Taste - loaded with honey, chilli and salt please chef and add the whole 
clove of garlic....

My feeling is sibling file but please use your own taste/discretion.

---
bod

