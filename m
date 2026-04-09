Return-Path: <linux-arm-msm+bounces-102514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHvLLM/N12mrTAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 18:03:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD8D3CD4DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 18:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2AB830A1F04
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 15:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C657E322A;
	Thu,  9 Apr 2026 15:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IEO6YDau"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872F42D6409
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 15:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750050; cv=none; b=BObmRr5ANe6Hwc1WNlizk51G4vCrifqlbNgDg3MV0ZlGBDhzsFhCnaf4CWx8z7YmjxhwpyFxKjyrNZCirz1TygDALimc6fcDX3RqOCNGpoWjK4Se7296Y8/ygu0Kg91Rw8xjs2w9rqPyIZH6D+jCsNAnWRSyuEQNNQSqGEhxmxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750050; c=relaxed/simple;
	bh=JaKWtpj7aYsMt3Ph+9iFB5XTzYl3apA/279VbkyHog0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NU2b4DlNAnYP3of+tmQFMrdHnCh8L4eqdVE+e/WTKsYR2r9eF/7u48xGYy/W6PF2HDlnNSYmUx+6etdnUpNc+FkGNrRkNxJoNx3JY30G+ZUFaqK2uTWZZNgBjXk7VRDaGg7mcT9YqTpz4lO5BjGCinoYUFbi/+CgLZMpwu9JmEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IEO6YDau; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38cbfb1322aso1254881fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 08:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775750047; x=1776354847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3M56rBEz5OeVU8uz5WV+I+bOdPl8DKhX5/Z1vQpWSE=;
        b=IEO6YDauyyG+fj4W5uFBfB+k3DTXJXRrA2mmrPhzG/XGRGXiC8fzqr/tbkUs+ikzCo
         ACqtPil47uYkVxllLk6kwo/yK2dhY7eJNhQBYbgxfIAwfdh1faEPQRGrgrJBSmkTgjJx
         1KMaBOXGJSvqeP9vmBSMMwTKU16nzgm2KoWbo/eMMDxww7fd6Wg3eKABpQPVixUaMNge
         E+s4oc+5C2w5IhaoyHhtin/fAGV2aIhfH3UJ2Ts4D3osA3OIUpRSlJSynqTmD9xe9A9d
         RiFa4EemnqzeR24q0oO4Qvvzg6M22YChYoKFwi3GQdLYi79gm6MSheg1seERpN4eji2w
         RnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775750047; x=1776354847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A3M56rBEz5OeVU8uz5WV+I+bOdPl8DKhX5/Z1vQpWSE=;
        b=XK0pXyX4HyWiawcO89GuSoFZ+jTzK0k8DnsD1bGlcEA/pmoDJaHIc9JkcuQ2TOC/6i
         MjJ3b2sSh4MtNC3l2sKwrKlRluJesDIxqbpDZ/vRBmgQ7VPzcOPlJ1KmJEn0zfq6kyjz
         YlABcOtp1YGnW+I/wzZ77a91kuxb33BqsccpDhOLE9NHJn5aRxIDbmrhFtejSy0tnbAC
         qt2KL80TkwK+TdwisyLKJeB3koTtTjUDBuqlFufWDKjj0b4mJmGvSJ4ilANKoZXgpZL+
         gqVvb4wl1QeReulYl198CTBOotzhhrIsZ1TJdaiuXm1vu/okm49h/58afVExy9q2G8Ao
         eo1A==
X-Forwarded-Encrypted: i=1; AJvYcCUl6b8u2+vwVhbTo2FAKFnEGUOz1d/dLFbnXPqwMRP0bQj1OdmVtsR7SiwoUu7f3jAPDUht21sylBXvvyv7@vger.kernel.org
X-Gm-Message-State: AOJu0YztsT4izH02xeW8BCiD8w29qH+G+J6tXTHGw8ma3BsMzCRzgAX3
	mwt2JqTErcNaV+Z25rDN7Kp9kf4bb5GcqYtpBf5FO5TNoMPuUuxUAvW371Crx/6whbQ=
X-Gm-Gg: AeBDieuyg4cJE+uDbJ0982Nrr2QNbP2CajyQO3HjPubodfyE5Tt/j5KrNfCEAFsr/uH
	XVIUOPIQrIbuweuOB3+4rWifmYAk7UU+mLdT21GRDdUAJ8sIgDFcspnoqzRaFv9/y1ru54i2cVc
	//yDvUYbdAFxlqDg6p2hZEZpFdZs4p63wNbG4fDEs/1UmeYspsc14uhiuoUoIzH9XZV1Uc95qI8
	pTrR+Pslfw3yoJ4CLmJ7gizgSIG7dMBRdSEgf13mJnd+US6GbPVmDQOZ4GrJ9S2dxKZbLlmJ+bc
	wDEKDMK+pIZKocusePkSg8evcezKdMXTY5WAl0K3PDGrS32b/Ei2Fe8mp+Sv0hYDE49FqyDu18t
	GNdK22blLRW397LHyiGGnP4uwPQQCE6kQ1UbQlSSuxTQwzNAeFUhc9whvuql4PLnrTw4k5Iv+65
	K9j5esrgPo9JqKUYNihgZlEXvuhSjae/zamRYEhdbOdK97OAlq4oA/aIAi9NsiKinxwtaP2gLax
	1XMxg==
X-Received: by 2002:a2e:be2b:0:b0:38a:325a:8a0b with SMTP id 38308e7fff4ca-38d91d47942mr33866011fa.5.1775750046530;
        Thu, 09 Apr 2026 08:54:06 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495ae96fsm205631fa.39.2026.04.09.08.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 08:54:06 -0700 (PDT)
Message-ID: <9e4b94f8-7792-4310-bcde-b8a810d18e8c@linaro.org>
Date: Thu, 9 Apr 2026 18:54:03 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] media: qcom: camss: Fix RDI streaming for CSID
 GEN3
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
 <20260407-camss-rdi-fix-v3-4-08f72d1f3442@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260407-camss-rdi-fix-v3-4-08f72d1f3442@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-102514-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 5AD8D3CD4DC
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
> Fix that for CSID gen3 by separating VC and port. Fix to VC zero as a
> bugfix we will look to properly populate the VC field with follow on
> patches later.
> 
> Fixes: d96fe1808dcc ("media: qcom: camss: Add CSID 780 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

