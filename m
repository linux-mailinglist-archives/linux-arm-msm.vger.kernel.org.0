Return-Path: <linux-arm-msm+bounces-92744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAeROevEjmnCEgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 07:30:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 319F5133419
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 07:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 161C03004C28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 06:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C0326E6F2;
	Fri, 13 Feb 2026 06:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TvV3d3Va"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1128325C704
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770964196; cv=none; b=J7+xzO5U4movIgE6IzA4lTnvgcKWBFin59rE6Atv+FNu7ZNbig6Kq/0hetmVZ3J3W2aexvplLOuxew0hHzgAbo8c3OGa0Q2d89LE4JrFjeeTsnBYFPn/WYv0oDsMy9yUzs4Ic1cfTah9g7P4d4QorpmFppqJrpsJunRsSANMsDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770964196; c=relaxed/simple;
	bh=kCswgtylYBaH+vm/oPXmR7sifyk95YR7in+IPuGhek8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YTSeEkqDZC4zj7g3vncZS9s1ffC0DIQtJS1BnKVA4AI7s0HJXHRepr5PZDev13sFUn0wPMMs9ZMgc21ZwdIo/0+KnSSnVPTHtRpahQQ/wMF6Hc3g1fQMHY3Zr66zTth0CgzG3hb0WbRa0JgiwTfLJTJahsO6W6rPL6qxzyHIiAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TvV3d3Va; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38708d20d2eso689581fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 22:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770964193; x=1771568993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUbCeLqkSBbz9Qag85Qyx4nbeZ0oQ9o4jeNsX3hpN7E=;
        b=TvV3d3Va8K1iBsadKDQqIW603oHKx8o3Xuto8XmG4SPghONKlNfmUGxssGv15pFmlh
         f0Um43LcP8I2FfsUTbgckiZx9nyDPOWbG7jS3qUisOTpOL1Y+sIxPouZ7+xzF2YeeckY
         nycxvmGg8UNHNVMTMjZQpIETgFT0uZ+O4N8Jlf6j5uHeg4Vxl3hxhiYlq+DsbcXoVDad
         tOnWCFbYNs7IkbS1tWzHUWDaFsIcnedDoJdbesHm5tb5iAdvT/48kRyQJskIMD2oIveg
         GXSRJCyFbfaxt8r+k0912VwGZJ+CcFwnFkWFxtBNhG3MhdjKyZLll0CTgp7N+uo8gVqP
         lOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770964193; x=1771568993;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OUbCeLqkSBbz9Qag85Qyx4nbeZ0oQ9o4jeNsX3hpN7E=;
        b=vo8xaA2fPqZ+SakXeUHsXreVX1K03LkmdScMfyq4H7qKrd6M7Nu4r+OZReoJz/bWg0
         R1Iw2PZ7rZ3VzBdDF/n7P7GENNKeNYwMAtiHbB2uS4ClEubZBN+z7LNuRlcAybTladg+
         vl0PNyZLp+NECtyvD4HG5ZqHUvGST4WSlNWDN0YCH0tQtuCYqS53GX+wVFwBtjWB9sd3
         MTBvCB9752QbSDwDTNNAHQ+7KZWa4u2ucyPua3qLODLfkUU9pOpWUat8IhU2TeKXajD8
         c7JK8rgRoKM3wLY2ps/JpJptxIReysMO0xAUG27BeWYWj7kbLS6cfirvWAf/IqkUgwIQ
         dppA==
X-Forwarded-Encrypted: i=1; AJvYcCU2fmn582n4melXRRZYcI8FfriA8vvFbo/2I+Bsgo32V1RNhYjCrteSs6S0vPgDMRjCScyzF5bns0TR0a4y@vger.kernel.org
X-Gm-Message-State: AOJu0YzlfIzWvoWzSs3s0g9O1ivqF/7j/OKxGPJA+iSfI7vaLxAwk3WC
	8wtcddE2cotvS2W3cudO5VJijkhh+Cx3Fbwj+5tAX4rdQUEAgYbhWYjNxTVbEJNuIEs=
X-Gm-Gg: AZuq6aKXOQOlS+WruwSgNDJgS4t5TK+zbN1KBQWfqdw8Oy5ra0QadHg75DatNX+A0Ud
	1H5mreU7OmuJ6OmqhDTDjhOhpVh4Hbv4PIKWu/mKiyEILxgNNOuVeJjIcaBl8KqgKiHhSbt32Jd
	SL8ghoRrzy1HmpwpQ3Fet3oeeGhnCP5MHd7lCvs1qJ+v5QaqlK6jslEBSvNlrsIe7x+s3MpCxf3
	gyCE4CK6X5gUgLubxhMAYFbGiGh4z+6UAlX2JmpnS5adCf1TKrEw7/IfVqfpM8dAOBKjpsLi3LR
	QPjmS1ETH4JOcf+PBQXf4oizFMpmOoOlAv9IujBhrp34pGZJJujKKe47WMJAkvg9tCXczNnK5Lh
	omV7sXt5Fokg8X3dLUxTjt8EndPufqzlAbQuT0ajTLIGgDeqXybEZ3nk3VenKb23sxHJ1HwmgzB
	W6MEDoWBOouU3b52g65tsyz2nv8itGDfT9x+eFng7rqrfbgIpgb1jcx+MfLLs8XmF0FPqFOBBXx
	Ya4xw==
X-Received: by 2002:a2e:be2b:0:b0:387:170:73ff with SMTP id 38308e7fff4ca-387ed8ce87emr2166921fa.4.1770964193194;
        Thu, 12 Feb 2026 22:29:53 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068925a8sm11374891fa.8.2026.02.12.22.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 22:29:51 -0800 (PST)
Message-ID: <e63b5a65-3c59-433f-a8cf-93bac14aead0@linaro.org>
Date: Fri, 13 Feb 2026 08:29:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] media: i2c: IMX355 for the Pixel 3a
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
References: <20260210020207.10246-1-mailingradian@gmail.com>
 <aYvLppaYsNDDD4DX@rdacayan>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aYvLppaYsNDDD4DX@rdacayan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92744-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 319F5133419
X-Rspamd-Action: no action

On 2/11/26 02:21, Richard Acayan wrote:
> On Mon, Feb 09, 2026 at 09:01:59PM -0500, Richard Acayan wrote:
>> This adds support for the IMX355 in devicetree and adds support for the
>> Pixel 3a front camera.
>>
>> Changes since v7 (https://lore.kernel.org/r/20260117040657.27043-1-mailingradian@gmail.com):
>> - restrict data-lanes to 4 (4/7)
> 
> Apparently the 4th patch has been blocked by Gmail.

To complete the series you can send it by

   git send-email --in-reply-to="<20260210020207.10246-1-mailingradian@gmail.com>" <snip> v8-0004-*

-- 
Best wishes,
Vladimir

