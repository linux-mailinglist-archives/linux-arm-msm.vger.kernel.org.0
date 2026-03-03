Return-Path: <linux-arm-msm+bounces-95088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KTxDPawpmn9SgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:59:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A607C1EC31A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97B983052ACE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 09:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837E238F64E;
	Tue,  3 Mar 2026 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rh34oxDD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A27238C43F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 09:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531953; cv=none; b=qNNjYhAPUkDpX+MOVRwuUqD6Qro7VrID68gWsLtZ/D2HnWzzrwi3xKcA3vZQqVZMQmbaRsHbs5pVuA47EZN2MGFl6qIgODhTWTLcJMHZ9TcYAHMd0yk5UO5tBcQbIAcJGdNImjYWXwGwAavS1aaslVqn9KEOwcNbcX9WOSCK16Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531953; c=relaxed/simple;
	bh=QGMm0930+mSMs48F38ZiFubmrytzhmnP8xNjA1p9+P8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkxeTTD0NpTttADYLhAh7M0EVTBcu43kU032SsAD5iGur/IIWTxPvNyBdPxXOMfYU4/eeS5P5HaJi6SVbQeWxgPHdGSeOAEypfzzqHv1alR2UsBu0PrEaXkeOXxl5/zd89RTy7nCvmphPE7zGDVLIFWfZ+UU1Y9Zi3N6m3jTYdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rh34oxDD; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439ac15f35fso2626913f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 01:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772531950; x=1773136750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WDpYmlYWuGO7Zj9mNcL9eqWVIj/B7W8gyxJf835jpK4=;
        b=rh34oxDDO3Yo/C4e1eTJh9bHQhti2Kon10q8yfvq9QujYV6JDs68elBzrZWUBfPtYG
         AnUTOtelVroue0gs41PaQ2D0gESVpfiDaaSJXYK4GNxF9oVf6E3cJ+SJHuPs/C6EBt25
         UkBZhW+NFjektlgzcUQvkfoaKzNGqSdQFWBl8NgwEZ3FYU/+IYW/WoF3SSfGO8jP1gMJ
         DCvEr4yQjpwfGM7JPfcL8qVUo35SOLnJ16usSR14UfNNAe4aAjqnfkCaioLLkl0FxvoG
         DZCgnfFKWmvVYcuVgBTFl5I+gG0q1v+Tc0AS3hxW3bZwTDMr/WyF8ip9IOQrBJm0xxgn
         Prig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531950; x=1773136750;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDpYmlYWuGO7Zj9mNcL9eqWVIj/B7W8gyxJf835jpK4=;
        b=izboKo1m2AMiXv4BGzQK3M4MkOAtX68QgzXhb6Ai7maEhSkLtuz4x60FrOBBF4zTw0
         pXjrNULlK1+636u+EgTVQB9asOeDcxxpo3iMxYPJGvOz2qdbsWB+Xy0Z0DXoyxRwSLyJ
         IxOeZz5jMJIvbxLsBVN0fd8tmjwB5NBss86GvZ0fpcj2OWeXwyNTerlhYSWP1xGp4rVO
         wenFo97XNcJbWOAvK8RFemm91cyvqemOjxRNTsr2E3JEQrsXErKkzEp7rvjb8ovQ32+O
         BRStzy+9U70t1agLKbuxDM72hx4OW1jpLPVr2KdXiT9SauFcNuYTFo1uIZWEjFvR46E8
         RnGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgZ3TxU9MbH9IZLDL6YIfZqOABsU/MlZL4i7eKjw4or82y13xIHEqgv9pmkInd9r3zHH+JKBpqINJs4deZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwUaUdUNQ/oXFpM8gj1E9E5uPm6IvrFv6LI/fP/LgyZM8umiOB7
	Fq4QZ+B8pOdgWAs6lSPM97OCxVAdyV3YWAt9XzM8LG7zNtMCNcCouPaZPQh0jSBrtIw=
X-Gm-Gg: ATEYQzzPa9wbyPuANv9pIvICZg9e/MLppmW5SprGnb/Q3og3zr/I+Y/cenlwjifkuU/
	4pH09rW5CkqH4HncFeF/UaukFcPAyCkUlpEM6WlRl8c8NOXSAUF5hbKmrGZcLcMte5qPjGBF8Ht
	53xtaFtQ8ib439cD7qrI5S0oHV7NStGMnlA63Q39kljQfXmFikH+avlMyNffQsj4GIgPNk0nPiz
	MrfvngSU7Xd3LzHhIxWoueWSAuryDZypwnz4DjXGNqKgUho9Iqn7/u+w/FJ2eBl5vdDfssNg+CD
	60om3GFo6RtRf0Kms8MEBmJ96fSP+ECWWQgBY89ATmPlgU6n/DiVZyVlZeOMUdXVWQTWXKTjie0
	RhTgTluSLrOhFE7jl8kVbTg8BlnygNy1PZp7y11pv9nWKWIZbJM8HE7ZgwluxhY9OhsaqR5H027
	m27SPW5Z+RsF8T75a2JNC5Ws3gWDMS96/0lL9KApbMH2YJ+tSdWeMfTdkf6NinrkSD
X-Received: by 2002:a05:600c:190c:b0:47e:e8c2:905f with SMTP id 5b1f17b1804b1-483c9ba7b9fmr240418195e9.8.1772531950449;
        Tue, 03 Mar 2026 01:59:10 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b44207sm351733085e9.7.2026.03.03.01.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:59:09 -0800 (PST)
Message-ID: <10c3e5f1-b078-4b48-bfc6-32199270b86b@linaro.org>
Date: Tue, 3 Mar 2026 09:59:08 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 8/9] media: qcom: camss: csiphy-3ph: C-PHY needs
 own lane configuration
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-8-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-8-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A607C1EC31A
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
	TAGGED_FROM(0.00)[bounces-95088-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
> @bod
> Proliferating special cases in switch statements on a per-SoC basis is
> verboten.

Hmm, your ideas are intriguing to me, and I wish to subscribe to your 
newsletter.

---
bod

