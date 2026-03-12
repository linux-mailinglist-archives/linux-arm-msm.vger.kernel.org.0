Return-Path: <linux-arm-msm+bounces-97100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOmwBCwGsmnXHwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 01:17:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D29226B91C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 01:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 122093068ECA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB293264EF;
	Thu, 12 Mar 2026 00:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EEUll6qn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDC023BCED
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 00:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773274664; cv=none; b=FrKNWARMUd9MYCj+V6a11QbaPbtbnLktaefT/GYZ7ymB+6Za0c1gsluESOBhmIGn6rY8+NuI99Z47eU5W8MWO6Ugcsr8/mAmCY8Jo8ZRn7FYquBa+Oij7R9YlFFXVAsB6rWkpCRCoqicQXf/vCltzAGm1b6nEiWj1lF8eyih9DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773274664; c=relaxed/simple;
	bh=J94a3IVEEaoMRkqxtepLhVXeDfAETLbtAimu3IcKwao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kn+5AClaQ2fHHLAGJer3E8x13eFuJkG3H0om5IIcVGtF4h8ZOSEQEWQOwh839hp7uF5fG9X6d3rpAbV2+zU+p/7qgcabOjCGKOr3jROK8gqBz4hbNVahNKIQgIaMtDYQBwYvKWxbaGQKc+9rKUiBSi8uDG16nnQX3UoW1hfnd+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EEUll6qn; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-482f454be5bso16454695e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 17:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773274661; x=1773879461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J94a3IVEEaoMRkqxtepLhVXeDfAETLbtAimu3IcKwao=;
        b=EEUll6qnRhXRvHboDT7438D1ahG/icnE6WDT/dx2SQUIWgCMZtlNZlFFxsvvaNxyCp
         5KCnWAv4QEEtF6ECCPhZZpu29zNNY6XQVnmGManbcaFZAdeRz/gHISFaNfWfAz3PKxmC
         d2Ae2mWuQ1x4basbClz/uzWjS838Zc6qjeG/boqSlMw1xZaJNcIpsJmilVxlJUYMr73W
         fHZIi3j7jea0EiLUV6erzCxDyq9ZsaJWa0C2SnV9LnzYK/HzvoRbGazj2yiaoshuYnAw
         8PXoenzBNA1ebuW90dC3cMupyKAEePyeVu1ritYofuxk5a9pfQJpecJHZd9sQB/lphui
         ZfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773274661; x=1773879461;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J94a3IVEEaoMRkqxtepLhVXeDfAETLbtAimu3IcKwao=;
        b=SXMSfL09n+4w5Kd06NFHHfb6dZwnJSntlBgBB8f+HkNtUOGpP+TsGXLAxKT0JSUEWL
         Fvv8xJXQe504UM7PoaoSA5tcnIGYKhIGYJFQbnxv3Fm2G603l1srKtaDeC6nKGFJbfEG
         3+CBf3/GF0JoyNcyByUnCrX1j1aMz7zprP5jJR1HMSDRcqQ1W5t6affjjN8f9ghdf3G0
         chjxEwNEq4VEDu2eX5fom7XUQZzgwiY3CFZuiWknl5RRyKvOgJjMGwtyET6IViZ2OIg+
         QIAqoABcS57OluEPjidsRevEKU9V6HSwrVfMyNqHTIpVGknglVG0Y1Sy/10qkLhbzXvA
         iCSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhUiBwNZBfrmTCHwLD/CZu/LE6z8SfhY5G2e1P26YIVgMV3b++MtDC+Y++D62CKxZaIcv/1qEzzRuMRD6M@vger.kernel.org
X-Gm-Message-State: AOJu0YxVcT76FtVF+mqDjQaGRwePHT/eIO4XNev5SLgEbZeopKcnpnYy
	Vr7p/QkXDFZ1oGm1o2aasK7ve/qMBWJkQLH9RqtOXXUgsmC/btxUvL/lvOxEv2yUrdw=
X-Gm-Gg: ATEYQzwaHRgv5L0ZZS6S5uMFi+IQQZ2iT7K/lA6fPb+eL3goblsfsnj0Ixk4pHJLrQR
	ui+0ZQSLSINx5rOpX3LiAosPJ4Gzx44zczWqgtVDSfENaJgesM76RDQJB2dKFtufyUvzUXZIDQa
	WPU7RxZQbUaZ48wZLO6s1qwCaFcE87DbQo7DPujJMQl03ywZ23MojeYPtO71m8+f7GMgKRRb7rB
	KWATf6vtRKHqC/9c7fVuBxEcSyfufS+WFiMrM+ZTI5TLYq9s2a5aE1BZXTmEVP0IdF9mrE0IhaP
	jcqlqG6QFtDNm1we/SjN8nMzszqbVxSbAnXNMCURxaBl0x1IoEVFPglHe0aKhDDR3eD6GKkEVUu
	JrFKb2nKJFuDH6KMnIGiDPpxW3veDGCCXtELJSAAmu+/foIbLCIjuXqbA8egtYyu8RlzjDFLxym
	nI0vmU25nyfyJ9LtCm4LnFB9IZseZOoB3Avw==
X-Received: by 2002:a05:600c:4fd5:b0:485:3989:b3e4 with SMTP id 5b1f17b1804b1-4854f578e86mr24296235e9.6.1773274661166;
        Wed, 11 Mar 2026 17:17:41 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.88.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e9179sm86375075e9.3.2026.03.11.17.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 17:17:40 -0700 (PDT)
Message-ID: <2d0505f7-a9de-4276-9422-0f9d60cc3e62@linaro.org>
Date: Thu, 12 Mar 2026 00:17:39 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] usb: typec: qcom-pmic-typec: simplify allocation
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-usb@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "open list:QUALCOMM TYPEC PORT MANAGER DRIVER"
 <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260311232347.18257-1-rosenp@gmail.com>
 <223e0295-1819-4234-90d9-7db440f25be3@linaro.org>
 <CAKxU2N8_ZsHR9Uzpw=XbnsFiBoY=ai7AZ2_LbEw72ouCVwKb7w@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAKxU2N8_ZsHR9Uzpw=XbnsFiBoY=ai7AZ2_LbEw72ouCVwKb7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-97100-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 6D29226B91C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/03/2026 00:12, Rosen Penev wrote:
>> Patch count bragging rights !
> That's just pointless churn.

Obviously the most important part of all.

In all seriousness though, just break it up a bit plz/ty.

---
bod

