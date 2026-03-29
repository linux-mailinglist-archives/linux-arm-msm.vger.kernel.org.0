Return-Path: <linux-arm-msm+bounces-100611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BZwxMUMLyWnttgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 13:21:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEB1351C66
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 13:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD6813013D46
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 11:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D7D30C372;
	Sun, 29 Mar 2026 11:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PRk0z8yR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3274C2C15AC
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774783295; cv=none; b=atK/GRRwB1FbVI/zPgK9qsqbBBLMP3qjuEpWIoASr7azjZFbwi62RPbhw1GPH4cnH7CkTCXHFxkuD+2h9uBbSL2ghjhQUHl9r9X2UIGEY84SQPJakBYB8Le99zhgyyzCO4B+F64yCEISuapleNeugq6hoPPNYCA3Iio5weMAzWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774783295; c=relaxed/simple;
	bh=0wR+MgHijwGTIMJCNQj0goJOmIz68prqo+nba/9TQrc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lEzQyJKU57s2U5C/auQwjdgOeOTAe/yJeBkv9Ey7uyecPxqTvPtDTdt/BzmgZhrG3qNk5WCPnjZPpJVHv/ExFNut1/qZ/JnsomqFSvceX7lKabMasIiDtrX+Uslx9HjNsXcNDjRQI1Vs9JfqeEDvsoVbiZbgUqVzgfX4MlCjrgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PRk0z8yR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so41969735e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 04:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774783293; x=1775388093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :reply-to:cc:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TwR3yI+NB25G7HZGBpVG+F40teFK60brAC7VV58HZik=;
        b=PRk0z8yRSIwFZ6p9ut7PnccqOAOZxtNAGJE5fOb6BoheoJ/ssv7jhrgQ7Xks+IVkLo
         WX76YAmAFEqHtUgQQ1LPOWJkyp8C6JefHDjZdwTkdVclx0UKT1gAFbdIEicyut3aBx0s
         4HLE8OE7cpFTX5edbZ+95n2cM0g72s9EQla8hfEUuWr8d7mAACk+hPnmadKjsOcwJihX
         zQbt2Kl2BHywtjjDlXN/8TT1iZisQMpClIhuGZjcpc+4StgY9MMHPNPY5EqPixUXeP2K
         tvN6Wir0npo1fYgz0CQ17pNsKMqKRehjxw9TsjwX7eMI2YFrN6QwC21gGhQlvsbRE2gK
         di0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774783293; x=1775388093;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :reply-to:cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwR3yI+NB25G7HZGBpVG+F40teFK60brAC7VV58HZik=;
        b=ml++7ec31TCaHJj/IcnmxkPgn1ZOhfDKMP8PmVfArSA9zIVWv3uyurgeyhReovfIlV
         C78gTiEjQ7VGI4n63mr2GZLSPaPPhNQsFpBVm4qM20zxxXoC2GEkY7nRVQa/pCMQcUrs
         Himzy7djHQVCmwOyvTTK4IK/fTMiIwyToZhGoYWnxJm3bL8Mk9yk333DkdDUL0yK3BzH
         MjqHdPGnG8+uEqG2b9rZsaAZd+oFewKy+t4iBYn3OvDmLmLNZLKlieL3reTqIDy+PA7i
         UeRfP3ZvSaLoZDsVR1JYKppk+DwBZcK8M6pY1fgngXkSoTV22i1kX6zgOvSVglVdi+nU
         xGhg==
X-Forwarded-Encrypted: i=1; AJvYcCVgUCs2KYtaI0NhQFV3Pb6zYj2uoVgJUV/MzuMRcxLHeKaDJi2hVKGNeNkYUuyKeiRqfQV7shHVUczCsAbo@vger.kernel.org
X-Gm-Message-State: AOJu0YyHDBfkE8+Yq67bfcaoLG0a5hPMvUyBmbCE8fT6QzJODsFAd62t
	VWtE7xfVtxl4Fvw6C+yWF4wZ/fqQW0wSIqij5Mu9t/VmJMenZYMVHjXZ1/J4Zav2szM=
X-Gm-Gg: ATEYQzylDG/sP3kC+ilZ/JId+oT2CJcq0sVMh3mKsT1SVPBLo4RdrJBtQjFz0dOovtZ
	Sn3g0ioc6gDKyjoulv2qEhZGoP/R6gu+b4LjXb9LhAC0s/n7e2R8jm4HUvaNAd2UNawKH6u39gC
	SZDiHMe07fvhSD7B0lH0UYbXbPCDu4kha/Zj0pSEssfYpgvFv2tRXVZkr3Eugb6vdlyip/zrrCu
	lz1wt9XC5O8L8oGllVaLhdgyEb8Dfxyt8h0ADaXSll/F9kc09Zs5i4J6HKwPaHyX2tFp2N0ze7X
	kfr+ySKRQHevkRnAh9rsTGoNOrg+72wWGGspYEDZOw4RE5Bu5Qr+JL2Lu8DnzbzKI/5xU0yDhEj
	ksu3OPk19LKwkaFHHkSy8q1Ns3oK8U8gjEUg0vgH1nXirldT4mwIIrib8kOd/p/LdEl4DW8n+Ug
	ELYNAgEFUgu2UBLGeDqga0rnk5ykpIyR4=
X-Received: by 2002:a05:600c:1d15:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-48727ee9a7amr146841945e9.16.1774783292450;
        Sun, 29 Mar 2026 04:21:32 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.41.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725d9403esm84895655e9.1.2026.03.29.04.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 04:21:31 -0700 (PDT)
Message-ID: <7b580a09-672d-4e9a-b2df-0b931d00a5f2@linaro.org>
Date: Sun, 29 Mar 2026 12:21:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 8/9] media: qcom: camss: csiphy-3ph: C-PHY needs
 own lane configuration
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
Reply-To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-8-e53316d2cc65@ixit.cz>
 <nfc2CPXnL7HNGmguQY70WydVsokdSQ261I11ZurTTGfMaLnHc0UrZH-QO3J-pAeA2hV_ioU_mcW4w7DF5iQKYw==@protonmail.internalid>
 <10c3e5f1-b078-4b48-bfc6-32199270b86b@linaro.org>
Content-Language: en-US
In-Reply-To: <10c3e5f1-b078-4b48-bfc6-32199270b86b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_FROM(0.00)[bounces-100611-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[bryan.odonoghue@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 1AEB1351C66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 03/03/2026 09:59, Bryan O'Donoghue wrote:
> On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
>> @bod
>> Proliferating special cases in switch statements on a per-SoC basis is
>> verboten.
> 
> Hmm, your ideas are intriguing to me, and I wish to subscribe to your
> newsletter.
> 
> ---
> bod
> 

@David.

I'm realising my Simpson's reference probably isn't actionable 
development feedback ;)

How about embeddding a pointer to either a DPHY or CPHY init sequence 
somewhere and checking that pointer ?

If it the CPHY init sequence/table in this case, is NULL return 
-EOPTNOTSUPP.

That way instead of constantly extending a switch for each new SoC we 
enumerate a pointer and check that pointer's validity.

Then we have nice clean code which just checks the value of a pointer, 
instead of an ever-growing list of SoCs in a switch.

---
bod

