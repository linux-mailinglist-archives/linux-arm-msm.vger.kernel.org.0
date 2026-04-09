Return-Path: <linux-arm-msm+bounces-102513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPaZAIvP12mrTAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 18:10:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 940133CD714
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 18:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0C8E3046EB9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 15:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7687C2E8B83;
	Thu,  9 Apr 2026 15:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="joRS/r/e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11535313523
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 15:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750033; cv=none; b=ZNTdlbdwLNtPqA2IOMmzYW7C5WDEm448XZhD3IfctdxriI6iepYcel89f5L4ZEmaSOHnrEr5pMXeEhfmDa+8MjastWNLJ1lhQGdqTaIyTMK5iSe8nluL/ng/rx9K1tVxwGzDZIAshlhI/0KIALFdpZinviAN/FP0UFRtbj9Tt+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750033; c=relaxed/simple;
	bh=lpYW6QtUEzz3MqWh8OmxWBkyfeGJcQZTfJfv+NYNYoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4UBtA+0i5kpBmoNA009ROWcmJIQ0XPuY2QhSjhe+TXl1A6Ac9VpjhqMKh+lWrGDwnig97mO049CdN7w+CoXjxjqc0zH2LdnzmnVL9Fppi2f9/FjhqdwbM6RdRZLff4skizN10R0qXmAu9fZD6GcgByG2BSF7A3tWT8efxUpQjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=joRS/r/e; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38c6bd590f5so892881fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 08:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775750030; x=1776354830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YIT5Bg10xahQ5nKaiIHS18eD2BykZR6y21exJn2IrA=;
        b=joRS/r/e4QaztA46lKFzwLhelpwKUqYHAC9j3IcA7hu6qNWkEXt9I3mv2DxK3xQj+v
         BQaVd51nQiWpSnWrjc7LJUD+dhQYl7t7FoEBbIQcPmdVv9KEpLzT1UwLIE/l0NyYSlNa
         L0tigNjb5D9Avo8kuyWoPaa+Y3Ncwxa5TKGrqVY5HRdOvs8QyrJjB8qeAYVfygpNtDtv
         oUzH9UN7R1rWIZbs1jmFat1c3vnluCetPp7GOPpNIndlLLDRYNZ8hsdUSK4BPYPnTqPw
         MAAxhinNrQTYspaNtJ8qXenLfM6guZcDgd/lcF0V4y+UY9Xr6u5VVdW7xkuJq/je+Fs2
         cvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775750030; x=1776354830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7YIT5Bg10xahQ5nKaiIHS18eD2BykZR6y21exJn2IrA=;
        b=c2Rjk4dmYwaybAmPYdaZqhFl7N3lVT4HyWkBLxAUhtWXq/5AunVauZe6uWQ+EeN/Kn
         APDu3AXcjOQU868fP0cenG8qdc0mL0Ecgv5YmbxRkeZOZB4Rq+eVSq1wfQkung15qUjf
         6Iiqsb/Zg3DitlTlxic5U+vJtmvZ/LSMQ2rFOshtOTDwxqbpzLwsc4u0RRF+ofTQp6z5
         Hdtn86Or/kxNM9lckNoGNHZKIcfYTBFe6Iv/R44bZFhWgjLKH/U0u0gN27yjJ0PafiAM
         LGTgwjDaoXO16nYHj8PDbgd/J0qRj8RoTSuyal1SrLue36SRek5dCk1bSE1OVha8GYR3
         XGKw==
X-Forwarded-Encrypted: i=1; AJvYcCV2adrg08CJFYskG7HmyDSyCvC1Dsl326/rNhcZ95zXy0lT/ItRjgz1egYzAs4DbzBOvG3N4fXfFP3tmOJn@vger.kernel.org
X-Gm-Message-State: AOJu0YyzM6xaRvGxCNmPYVNDg0GUs0aZdwdfJvrEE84iT92KYPCOW1B0
	01hKuROmVNcgbcMvgi1nr45MV/r4dj8HFpm9tlf4bV/KV0Qu/Lgrh0ER0oU//7474PYpkM8ni/R
	6Lb+J
X-Gm-Gg: AeBDieu5lnzJKH1XPbvPnlqLJB3zM0VDlfOB9Gk7pKRJ1fC17fMp6ZDLBhyFD6wREW+
	k1pzAdao7B2u068HuKoMACgz0/gPXYd+m7UQeSPcuDkgB6snlA5YqIZ8UUs6ZBxx/hfTzZKDcSG
	Y5lRg1xtFrXkLgTBgnurgHFjv71agWEbbLklBWDfRJ214q6DRt6kTiCk4PeAggZ94qajgfxODLv
	WJvO/uZFnA3OIdgNdaFjAJSo1jSlVQUu5kd2dWPyfV7ARoaUyHqcs5DM600XBSzTkKahe5dzYv3
	5f+/6GnBzUPy5RuXeauUb+iiCz7n/mzJ6z4yXF2TXJ1LFHKacPTonxOOWa88aYtrxThFoaq321N
	7dZOfea+GCYRfW/KfeMQSYJiXnOmDGWlM5yVCZKwhncyBJWl6tA8IpssU6D/LYTK/dPcDkg1VA3
	NcbKUhwZ4i2zXV03/oYD5I0WfLuolWC+Hr7v/R+D9ihk4vxmPwlH2XOa1PgjCGhE4KHcRhN/ke1
	afyHg==
X-Received: by 2002:a05:6512:3d01:b0:5a2:c981:2f81 with SMTP id 2adb3069b0e04-5a33758dd9cmr4275190e87.5.1775750030027;
        Thu, 09 Apr 2026 08:53:50 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee125esm937e87.46.2026.04.09.08.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 08:53:49 -0700 (PDT)
Message-ID: <f4bf0d34-07a0-4813-83aa-f49fa417df7f@linaro.org>
Date: Thu, 9 Apr 2026 18:53:47 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] media: qcom: camss: Fix RDI streaming for CSID
 GEN2
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
 <20260407-camss-rdi-fix-v3-3-08f72d1f3442@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260407-camss-rdi-fix-v3-3-08f72d1f3442@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102513-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 940133CD714
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
> Fix that for CSID gen2 by separating VC and port. Fix to VC zero as a
> bugfix we will look to properly populate the VC field with follow on
> patches later.
> 
> Fixes: 729fc005c8e2 ("media: qcom: camss: Split testgen, RDI and RX for CSID 170")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

