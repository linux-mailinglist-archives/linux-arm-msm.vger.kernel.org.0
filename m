Return-Path: <linux-arm-msm+bounces-97387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPifD/Pcs2ktcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:46:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BB0280B72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F7CF301385F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09A11E9B3A;
	Fri, 13 Mar 2026 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xP/U7Msf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E4428A72F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395182; cv=none; b=sGwswlyVbXSULw3eUVdtA0ZGCG8NG9if9bYKErgGALPSxz2h2tEpydGiQjKJpVQR02nCkfpeVG+gRm/13TEPQZEHbgUjhxgVPyX5EvVoBkuC/2Ew4REkEiDsOs4xIkjsJQWUTs5b50tgpBL3D4UVZZxDiCev8iXZ2vNFCNUfImk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395182; c=relaxed/simple;
	bh=soLnDKoEbEBzJ/46UuD6ujTKl9ZMRtSiLKjg0+glaPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ax8N8uf7kDtvSfY8uZRzADVls2PpdoqS/ewykM2X+LjejLSzK1dx0K6WICBHZGeN3XBgCXGa/P8Jbq2zqQFU8WVF9YCXtWdOowor5hiSm6K9D4NObhG4GwWiKr+yTbRDkteA/+oEjo+M1iitQkMslPcr25YtUCJZLqp2zweTgRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xP/U7Msf; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439fe4985efso1736357f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773395180; x=1773999980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DODGloFIP1eZNq44RxnWC9Eej94b0U2AuyYB0RlreSY=;
        b=xP/U7Msft9Yu93D88XJT5JC30JgEC2QErZxsKTL3HQiSx43LsD+VeRLVffxwjgP0rF
         OT2W0k6MI5hzwJJ1ZmwcdWvttx5SEKjudAaXlxJGOfzLFTbdgEFKbCvfUTMaxGJP445R
         OJToSLB6K4x+xsYe1HU0V47Mnho9Bpeop5jNGdvFrs00uFXOv+c/PWJzBinDDFMoCdyE
         WDEcqQZVc8upzJCCzpwP7sp4lj4AEjGXHgy11tffyIlMfWfMAK+NWsqiTsAqqwm6zxV3
         z5x7odWLJzdqaq+1VW6QbVnbTes8nFnaiepF75g4C1RAF5nfUeF7YlW5hHSirkDYr15F
         T0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773395180; x=1773999980;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DODGloFIP1eZNq44RxnWC9Eej94b0U2AuyYB0RlreSY=;
        b=fUxcECwZqvHvgRuk8zUlx1hKHG3rZ237RiGn0mYwAAiF1Pcv0LwLnpQcJeK3S75Dxp
         G6JJGDGatt++8/UNfiZSPbsfdPJNK8bZh15aXhMEa2MPmGBI69r9XW9CN74nHSbnwHu7
         0VgBjXfgSot+CmuPA6VZYggaWlRHhCGsb3r1da25G3rENAkC9cWBHYbZkVsGQkVV+ZHF
         yYXQkBUBjYIshiZxo4M0tkv+AUix74ZVWqPs1ATRP7xxB1DNlmDiPENlypp93FQrS7P3
         gKbYScD7jSxsz8d3+HVVk2Q/X1NeeVqtoRwuk+5bHHqDCAi5g40HiLlz59MhewdwdhNM
         piOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSS0v5gxmp3QCvPbH1oMUKt61K6b7rYu4NOBBHoknc4QtPvpmis/irwPUG7JFcSZfKTU4TfqkNe1jp4tOs@vger.kernel.org
X-Gm-Message-State: AOJu0YxgLpfRLFsBou9I06NEfx38jHXo79FRhthz0p7ZMSMJALMvCY81
	MUov4C4F555pUpmhktOZiSuMuQOMcgW6yvfdD+PMJYPRrNavJqu86nc+gklDlWfuMBY=
X-Gm-Gg: ATEYQzwzioVnYrzvKmJqYnO8X+iAD58hEsAPIW7Xza3EzFK1cLazuu1Fn2g5OWLRQSE
	HDghABgS0IqFlE0rwONgHVVDYhsEPPvkuQz1TAn59PyFXAvPSGN6nsl60NLfJXrRuwBxAXa7PpZ
	qKx17HQYZsKbl5GU1wTHIWBXHU7SWUts0eMR6JL0BsxX8X7i4WngH9piu+nzXP5m0awf8JMFezY
	c9y2y9adrceA5u4SuST9LyfPelaKoHWpRdviXQfRqB+Oy0KP/zBUyeBdVPVI+CA+VEDl4ZGZwvO
	lCXYOKmf2V1kfmpljUCmsGhwx6dakqvEgg/lxSTbn8yi/3SLI84xZ7+3+RAOAealwJwZBpolLmG
	AAUeqBoCR1UovAWI2xJ4r/fRMuvLRBhvjsdim4RIqo2MFU59nJN4hNz3sy1NwnEbyLYMrP2Ec4m
	qj/+YWcHj2+ZBHPLLzE94oO35nZDbGUdMPSqpPBLCYvnP/gBg=
X-Received: by 2002:a05:6000:310f:b0:439:b1c3:84bc with SMTP id ffacd0b85a97d-43a04d79dedmr5493120f8f.7.1773395179640;
        Fri, 13 Mar 2026 02:46:19 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.176.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm14037146f8f.13.2026.03.13.02.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 02:46:18 -0700 (PDT)
Message-ID: <3499e8ad-ee87-410b-9db1-215d6c20e195@linaro.org>
Date: Fri, 13 Mar 2026 09:46:17 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: qcom: camss: Fix csid clock configuration and
 IRQ offset for 8775p
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260313-vfelite_fix-v1-0-2ee7de00dee7@oss.qualcomm.com>
 <20260313-vfelite_fix-v1-1-2ee7de00dee7@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260313-vfelite_fix-v1-1-2ee7de00dee7@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-97387-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: A9BB0280B72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 09:42, Wenmeng Liu wrote:
> Fix two issues in csid driver for 8775p platform:
> 
> 1. Simplify clock configuration for csid lite by removing unused clocks
>     and correcting clock rates. Only vfe_lite_csid and vfe_lite_cphy_rx
>     clocks are actually needed.

This should be its own patch and should that patch have a Fixes: ?

Simplification != fixing a bug.

> 2. Fix BUF_DONE_IRQ_STATUS_RDI_OFFSET calculation for csid lite on
>     sa8775p platform. The offset should be 0 for csid lite on sa8775p,
> 
> Fixes: ed03e99de0fa ("media: qcom: camss: Add support for CSID 690")
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Yeah this should be standalone then.

My general rule here is if your patch requires line items to explain 
various things being done, then those line-items deserve their own patch.

---
bod

