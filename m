Return-Path: <linux-arm-msm+bounces-102512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CF+HObvO12mrTAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 18:07:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB2F3CD642
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 18:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25EF83096A05
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 15:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9773630B1;
	Thu,  9 Apr 2026 15:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p1ILTGxc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B5E22F77B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 15:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750001; cv=none; b=mxtOeSYY4w693cGWK3Qs13Kzsxb5syBOoCMZxlGymx1NliSzGD34XjntUi0tdFbLmUIegjUi1TRkDRnSKniKPrOn32uYwCbbVlQYDyHshfR9zZhJkSC5NAb9rIDRFrv9vv7BJW0DR0K6nfvJI6fdkpkIlYujerJhi9GyjjXABN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750001; c=relaxed/simple;
	bh=CcfeUTBqdrPWX9PLWNaqEnioi2DbZM/+yoVkROngFHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GDjj5M7jRvZ4LDGXn0oTEF6AkuCv9kYWWTNr96ta0JTXkv92bLQtiuhqAUIZoFuSDCUQzQ7OKQB3kOBGcoSL2g7BwOGQjSWioKAV8muRQ95uqOyl2m0fC22A1tnQzkADrxo31DL2un8m2F94D7/nEADeP6pcbLIXvCgwRRASdZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p1ILTGxc; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38de162c718so751151fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 08:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775749998; x=1776354798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dePcqvygy03K7J//IlqvJIbf/FJzL8WZk9xUAjuc8o=;
        b=p1ILTGxchXHgH8PufWY13xJvOeG6AEee3Hyla1EuSPb0chDVpiY7yMtzth3G0zASU1
         d+NwNqx40G5eWz6uf49gau2wZqzrAl6aeTTcCv4ZCqWunL2hCb1rjPEpasTFoZ2u7Mjj
         9qLlpWP/Xron5nn/RsgCkm+0Ze6nvYvnhZYvIDC/erW3eNmmfFrzP6/unawA63uImEEO
         2b3tbjoCpUlKRngVYS2+/DA1o7CvXmsQ9bPlE9HbTzMLn4rttz8GEqqLvws8F333Dos1
         3zfpX029enhSWrRPaWjdLqXeypuAClQw3R59xahNjb09SeB2K7zzKJed/GC2x8FC39sX
         tTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775749998; x=1776354798;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2dePcqvygy03K7J//IlqvJIbf/FJzL8WZk9xUAjuc8o=;
        b=e1O7QwDbnbRMIlfxOgvv3nqfxTQs72ROsvu1SGJhUxQoGSU1kNQPoFA7APZePEWRqj
         GjZRCETwYEUNuF8SQ/WraYipFNXPhdixjQDWiJ+CrYuhG2jwQ+Tv7tkQKDf3oVxnydsv
         VbQk1gLHFhQk1wW2P4gT0wEFD5mrnZ3CYL3sTR6GWdsaFicugViVt0/C5485warcR+Zj
         VLGHWCCkB+96kky/2HAGkmZdFC58Ck4e0iG8OaBI/8J2KYCv8NU4CSxgCSrW/oj8GtSn
         6qO0/3iyYOFjpid+840bnEK4E1Ma9tu1fxnjtve89iBxuuxg0kHGHOJpUQ21FCTJGezc
         GaFA==
X-Forwarded-Encrypted: i=1; AJvYcCVj01PTYcRDuWoAHCDseYKVGnqvjT3mf9nCzxOIDDCcqaqsSuHTgIhwlYQLQVAytJ+itHEWs6gA+iZ2SZ+2@vger.kernel.org
X-Gm-Message-State: AOJu0YwiwXcCtXYyKVb1PD390WU89OoeSaXecGOvmASMLMm39x2Ii/mY
	IteBPZ90WkaQ8Bg5nB6ws8YNJHiPrQzqKd5/X0cWA83uZHLVots2boM5aKNoLXOWXXI=
X-Gm-Gg: AeBDietgk1ShW8XGXH0BbRo+QUWdQcyYCqBPzrCGi3UCOmXIacn5VvaDqZxa4HBh68q
	Wlv9d4QetMWLua9N0xwz6VzB9+w42fz+7oCXXMH3S0ybCU1EwR+BX6BNKSp8pSmmf/lRvOFXJPM
	ROTW9+eXBe3wXCfX2vvmyWB3IMrr9sQRg73NI3YzyjPd6ZAeV+0XQf9QU466NYN6tnz1Xy7xUhX
	RjGkHtIB7I/wDp9cGCnHNkPrKo3an2qpOUk4zHzharLHrG99Y33CfmNeLXKg0dsi2VB0zsWHhxc
	zsnpHSNKUp4Uc40jakrM9pWYm/zwoOBUN216mZNqfeeXfuGReAql2UfpNKjR+YLpO1Mylr2AyDc
	yF2h7HMe0gLWJh++/vHO8MzsGKozqTrXxhQiD8m14EJq5ryqkwVpeBzyl1egcRDufSBhhBigqKr
	SXVOnrLIlaawkHfyB0vbl1pOq48aZUQ8b9pzP+1phY004vXGrQ57AdziCVkCrP99FeBgX9cC1NK
	yBUmQ==
X-Received: by 2002:a2e:a813:0:b0:38c:6616:e2b3 with SMTP id 38308e7fff4ca-38d9d4e188emr35046621fa.7.1775749997451;
        Thu, 09 Apr 2026 08:53:17 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e4957eb57sm210041fa.36.2026.04.09.08.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 08:53:17 -0700 (PDT)
Message-ID: <d3c22f40-28af-4ba5-90e4-61643ad6d82f@linaro.org>
Date: Thu, 9 Apr 2026 18:53:16 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] media: qcom: camss: Fix RDI streaming for CSID 340
To: bod@kernel.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
 Milen Mitkov <quic_mmitkov@quicinc.com>,
 Depeng Shao <quic_depengs@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org>
 <20260407-camss-rdi-fix-v3-2-08f72d1f3442@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260407-camss-rdi-fix-v3-2-08f72d1f3442@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102512-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 7BB2F3CD642
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 13:34, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Fix streaming from CSIDn RDI1 and RDI2 to VFEn RDI1 and RDI2. A pattern we
> have replicated throughout CAMSS where we use the VC number to populate
> both the VC fields and port fields of the CSID means that in practice only
> VC = 0 on CSIDn:RDI0 to VFEn:RDI0 works.
> 
> Fix that for CSID 340 by separating VC and port. Fix to VC zero as a bugfix
> we will look to properly populate the VC field with follow on patches
> later.
> 
> Fixes: f0fc808a466a ("media: qcom: camss: Add CSID 340 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

