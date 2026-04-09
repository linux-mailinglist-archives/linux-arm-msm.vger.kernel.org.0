Return-Path: <linux-arm-msm+bounces-102515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKntB//N12mrTAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 18:04:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 713C83CD531
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 18:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 663373180DBF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 15:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843D53DEAD5;
	Thu,  9 Apr 2026 15:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jA5ovNtH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603493242A4
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 15:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750066; cv=none; b=lOVTEglX+/KdgLrVXy7YPHlGHpbX8El+rYf8lNVt26W3SkkrbjkO6dTGcWlptg2Qax2OS3RCd2B6EeM4dC9NGqTl0sIGlQQwR7oUqW7IBa4HDzsYdlOmrthSpToPri0Y0bqE0Rk67zhaKXVCn47yAB2VySdxkNCSKs77aqJhMGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750066; c=relaxed/simple;
	bh=eK9MGD5tSEBxokm4T+iGz0HWHdf9PQRcKcx4jYbcqEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EbVEhEyGWVV9C6dbK7uOFpSSBuo/Pvlf1ZxJ9ma3cVwN+X+WuInqPYB+RZvRq3Kb7nJOrHfpDGE55pocfmhUNI05eVw78W7lmHxyQXh70p+w4wZggYbFVEZpH7iwBfifwEgGyojJF72NbAOIXpKlHj761gWq4tSsh8f72EaUU1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jA5ovNtH; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38ddf19c9feso1997091fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 08:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775750063; x=1776354863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6Jt6AukoS7IYn65JxBCNeqqBaBH71CuaQqswHltSRU=;
        b=jA5ovNtH3UqyyPXf2U2A4H7GS71qFQlm2jFbSlsalPZVZ+0t2BDY37ICb/nz3lII8t
         YlETRozbETm6dHnhtVT7bHzeScfpV00kwtoBEDNuAvtfaj+evLY2BmRkOa8+OHRcrEtD
         C+6sOQR26wjn+FJPgAu2piF7Wc6JBqr6u+Fp/ptc4iHKzXMg4Zs88Z4epVB3/OuKP4bD
         Rp+MVVSaormgihUOopKXzxo/kx6QirKUiT9m0HdqFcKNxn5S47sylozDxG59Vvb9Alv3
         yGx9ttk0oJ8zMO1Cdo7qqOvgIVinQDhf1gmsmHw6BfiruUx9WBeSCT5gPwb+9aRnsYAS
         5yJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775750063; x=1776354863;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H6Jt6AukoS7IYn65JxBCNeqqBaBH71CuaQqswHltSRU=;
        b=tRVDO8o2TVVLJjUuFSZzf8pDPRRRwi1PFepHNvo1xst90h+1dDUvF8GZvaxMXxBgTM
         bhWSBezftPSkeOd/OPQKy4v/MsQPC66kOdrY7tjoVOCxK/JYpXf1wdrzklnCbYoC7WrT
         XnKO38lhvRMi+EiCqzEfuKZWbgC7j/Py+wqpLIJMQzPTcOLXav/GdWedfDHlEGaCPxxj
         A0sHN5Jo9qgYwDcF19HaNlqvzkMNXTkRbIs0zC8qSjbw1qA4kZaqVvOQf66zPvAR6S2A
         1G4myDpwer5JILecfUv+a/MVwKVipTwpdH1IiX3NErhpLnmbRp4wSBGXLSjaAEuSu8k2
         GxTw==
X-Forwarded-Encrypted: i=1; AJvYcCU+slTtmZ9wD1IjKWHvkympJ3xmWi0dXLhnWuLp5m1Y5a2RF8lM0zUQu8DeH3Aig7rwkKFKEKVquN74MRa7@vger.kernel.org
X-Gm-Message-State: AOJu0YxjZTvRC3wBprHrkezdij4NoFTpPyHsu25TtEW2SAZ9xc1LDM9J
	ahlZM/q2kPLFBGcbRUvyj5rvlCZpvu3jvqBBm3rNUqhDWtaJsM+HXRmUL+jkpoVB6iU=
X-Gm-Gg: AeBDietLb5P3rqvx3CUomX8tqdRR/K/aObepECIzMawswGP2NJIxew4KFv+LRLqfMkT
	N+QJ//cfjpy9rYPA0fy5+r7Al6QcbEvP2V1v6Thj9zOGrL+Ad39W4eCJgyz3TVcm86no/z5i/p1
	sTC+FmeFU2gucyGBTpy8xfWz3xsE+hmvVZ9dWCoJxf2hATrV4+kvdYnlsgoij7jCCHciizeriLE
	mIP1R18DFdW+KrvqzgVz/HxZLQo3sTYMKcrQrM6aaNFxqtLGb19l5IIq7U22gKa5mkCX5G8R2uM
	796LEsrXVLKlL6OGHjmnO8jV5rzLqoo+vYSxmPVf8jaAB3LpzNq42nAaRT1EEG8+O4bLXPPAjVP
	h6BZLj2o8vcniLWB/jqnj0Yom9E9weiCXWPU52zIfyL4C/KBtCneeuWg6+HXbwfFwZsa6EDFklW
	matM4I1NQ3bKHlf2avqJcjzMvs6JwdEOLoCTkG46vg0RGv7xxWURLfQHs39l7VWSbhdruHbEhVC
	0nyVA==
X-Received: by 2002:a2e:a541:0:b0:38d:f18c:a8d9 with SMTP id 38308e7fff4ca-38df18cc908mr30091421fa.8.1775750062424;
        Thu, 09 Apr 2026 08:54:22 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49298f1csm273751fa.12.2026.04.09.08.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 08:54:22 -0700 (PDT)
Message-ID: <059811df-a19c-4cb8-8f80-bc7b6435ac65@linaro.org>
Date: Thu, 9 Apr 2026 18:54:21 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] media: qcom: camss: csid: Rename en_vc to en_port
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
 linux-kernel@vger.kernel.org
References: <20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org>
 <20260407-camss-rdi-fix-v3-5-08f72d1f3442@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260407-camss-rdi-fix-v3-5-08f72d1f3442@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-102515-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 713C83CD531
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 13:34, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> The en_vc mask has always also been an en_port mask. Name the variable for
> what it does a bitmask of ports. When implementing v4l2 subdev streams it
> probably makes more sense to have tuples for port/vc mappings. Such a
> change right now feels like putting the cart before the horse.
> 
> Sanitise the name in the interregnum.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

