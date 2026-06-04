Return-Path: <linux-arm-msm+bounces-111083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aD0wMUrEIGrk7gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 02:18:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD9463C071
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 02:18:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=U1z3KQEw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111083-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111083-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F9263026C2C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 00:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D25473463;
	Thu,  4 Jun 2026 00:09:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56B32030A
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 00:09:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780531768; cv=none; b=KXlv94b0xen8tOiaFPqKyFRBp7NIiNcS9jUu/DdNELTMYgR2E7aaSxBDqiV9BTWJNlQrzUM4TeRBwKD875n2i55ZCPWUgD6gtI0dt94z9JDwjI8xqdJ9o4G6Gro7bsbvKRvwgCbPOWxqH4ldocOCHgljSwXgPpL10mFUjquUlus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780531768; c=relaxed/simple;
	bh=Oky5luA42ST6mjppzADJqKFngQXqBh7GgWzFg4QNMPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i7HLB3NXKG9tKFwhHqw794TSbtzt7Xqq5+YFilLsGWlY5shUEGD0eZq2lrQ98iW+sVk/pjUF2463iSxVXdCLIfyWbA1ZzwUxWD73s9ADvnQ4DxkG321LKdcr6Dm0Yw8ZX+ObT5IXlPiMm71UuHAmcLJ+1AgMgNXj9lBOMizdL5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U1z3KQEw; arc=none smtp.client-ip=209.85.167.53
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa68cf8643so1122e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 17:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780531764; x=1781136564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrH9nbA1I8F4TzBkK1EVYY6LcspB7GUP/tqjuY52j4w=;
        b=U1z3KQEwqWYdj3sj7+I5gT60J1hWhqp+RvlIMsns9Uc1ZHMSKVRQLTiJRjGI7LZmlx
         KoAbhVEcyQZJQy7ZNt0efyrvEmWaPmI9DpN8R8bFpWGpzxqKbPkUcd3TtwI+yALYZh7A
         pzqLc2hnbE6Comdagt/V+0gq/zs1ZVyC6Pez4XJP7s/YYhv5pmAxNfllAIbVc5GHtK4e
         ej5V4M8MsKlLMbCcwrtbnmDpl5laYzvNb8KPTqV6BIv1LtON5MMR1oIwvmq2DqDI+B9R
         zcWvTyDePDlLIrq/L8r4evugQPenJ8jWrjNm5Ozf6F1jDiYuqyx2jtMraPfo+QlIIIx+
         np2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780531764; x=1781136564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CrH9nbA1I8F4TzBkK1EVYY6LcspB7GUP/tqjuY52j4w=;
        b=gaiwcxIadNxrZAnl/8ENCUKPJkg0KMtuxOL9RaL/Z2ipYMC87O7W5+z1r0jylB5AFY
         p2TOg5Plzg19d474zi7rtdaM28oq9gI5LCvCShjmvr8sWGxZ+REAJ5otHmsZQvhoT6Lu
         1Ev4oM9hpJBL0zS5bunrkByB3QOuzVgemfp55COyMC38Pbyyb4ggaTm2E6BPuH0vE2/e
         3yjcsoGzl6Xfi3Q3H6w5DiBXFjczJ6el9oO0VMz8qfCoCJIBrQDBrJ45H97VsVR9y2SI
         YENSIZZnA/7kHLA4JtZca2PK3a5fHW+v93cG68M44nysexHScahusWwGfHdRXGi3YepA
         bYWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+0ePvIBEPeQITqDxpijMUcH3CVox4HDafrS03RtD8N6jQeABpKNwpGb0qCRbZpTmCDPcb3+0EYmFEvZEGP@vger.kernel.org
X-Gm-Message-State: AOJu0YxhIVFYzHg0RUyK9A2AOVaXON/ovNt6KpFkAA/xMChdqKajXkTj
	QgkBH80zLMw3upkf/5ZjAu4C5+6v+Kzyz5BQrI4hSA6vK12l9t/fXr2LJ40Kz5h7BPw=
X-Gm-Gg: Acq92OHf4qMxW3w4h9ijVBTntdRe9lfDrJzou61JqZ7H2lJ8aICG2UH9hsbTo0s5XyV
	+o1un/zzwOcOg8mhbkl1nuHMH/NATKYfEBGWoCHEbCZSjlBgpyO5tBVhOPcr+pMvgRKx7gcGfe0
	Wh2mtJHgj+IbeiC/QIhX1/TNRJ5DAY5IQ5Z6/PL8jJQ9ztAko8yGDGAmasutk7C7s0heGEzjngH
	2solncWeC4aiPB/f+iAIppYBxsZHKPq17F28kT9waaSpXJFQq6kUVZbh2RUUOPG7c84oQvK0JRR
	CDMM1WRKUTarlGZf/gsHnNGjwwKbMf+k7ap9NdhcDJOphuq/fDcxyamaozRk6HatENjLxBg20fc
	acSkrNPC6ZHs19IueWzFuTpf7Lz46TVSSwbqSxzRSDvPClB9yeH6ZnPVYTp5jYkYqPasNMaiLIe
	1cd/kD65kZVa6STDasCngZ1dzkcNxNwROb2wnWJD2m5Ja3yLaAlJxN4hJ9Np1xckHkc3huxP5Y3
	6hyakaVlIHYbGGo
X-Received: by 2002:a05:6512:4012:b0:5aa:67a9:e9da with SMTP id 2adb3069b0e04-5aa81bc78a5mr77694e87.0.1780531764067;
        Wed, 03 Jun 2026 17:09:24 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed2d3sm899017e87.5.2026.06.03.17.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 17:09:23 -0700 (PDT)
Message-ID: <386e9ced-18c4-4276-aaf2-e563351b3a64@linaro.org>
Date: Thu, 4 Jun 2026 03:09:22 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Rename unused macro parameter
To: Hungyu Lin <dennylin0707@gmail.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260603231202.6569-1-dennylin0707@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260603231202.6569-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111083-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DD9463C071

On 6/4/26 02:12, Hungyu Lin wrote:
> The ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_0_CID_c_PLAIN() macro
> declares a parameter named 'c' but uses 'cid' in the macro
> body instead.
> 
> Rename the parameter to match the identifier used in the
> macro body and silence the checkpatch warning:
> 
>    WARNING: Argument 'c' is not used in function-like macro
> 
> No functional change intended.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

