Return-Path: <linux-arm-msm+bounces-78092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF34CBF4CB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 09:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E05C118C4CAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 07:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC0F26F292;
	Tue, 21 Oct 2025 07:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQ6Aic7a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6645226E6F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 07:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761030194; cv=none; b=bW6V0zYwbfJRluxjJMAsFpNXz3gd0OIlYwcASdbt3roMraawwY1mvUBgfF73GBuKpZlycKcDWlPVD2pjepHnVQwgturLqzTv6rkHGGxkQaaUO3Hgokjxgv59Kis1r8RT0p0nuJEphFHnsKjIhDCAf4k+U47BRvgXpv7d6R7sYYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761030194; c=relaxed/simple;
	bh=Trt9/WBbPE+M4yerJ3ajCCIXdwVs8rCRfWuIswNj814=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7AbdZDm/1BxOEJmjBNk9nt2if5v6YN1I5qb3ymVs75PoH3em6XggtxfP4C8KkdgwA3PvVP4MdHQSwoFUnXYVe3HhTeFjVYQQZzrovpQIUrTp5GEyJlvziaM0P4LmOmIt1IOmotXlhG2r7M/19V/8cGTMy3tnzgCoxPNb1KiEyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQ6Aic7a; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b553412a19bso3542549a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 00:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761030192; x=1761634992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ytwICgmHnNiFmycdKKSg7V7bV41hOS/rk94HNVcG15I=;
        b=VQ6Aic7aIBN7BvnAi+E3SsHA9dsx9Z83eobHy7WN41mtbJgzzdH5YKhZNsZmrKwEDR
         /hsD1Ty1NCCQJceRKRM4md/ZMABuwOGvHMmBicmpsQb6mtDpDrhSQ6wDUNnHTNH3M/9r
         li2IScUP4a+mBit3WTHaxkTrvfFCJhFunUh+f7kSWgU717xJBGjVOuQnTbIXpudZcMgh
         yMnRm3GNDHBbgq8iqYJSJRnjkB7UUbWjTTROtyrLIKW6nk8ymu10Cg0w9XJE5Z/l6ruR
         p+D1y+peF2SQw47DmvcT+0D76LReujNUaHQV+n2er8qs5p7DBkXDka11Hua7jN7EuMik
         B/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761030192; x=1761634992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytwICgmHnNiFmycdKKSg7V7bV41hOS/rk94HNVcG15I=;
        b=ARGL+AdowG3RP1Hxfekfl37j7+W9WyF9hLpFZllfDacLyA5dPGCNAhF/opu7tDjEL/
         A1sGTUxlpcu7gthjVQTUkWWajKUQ2vAp2T3ddvZmL/TCITAfGXVR295rUJ4j+hJL3V71
         0SW6WIiKHD7GFpu/kX1iCJIXdRd8cGXk+alDusxnI5C62sF1w0WC5/wPHPIlAvhEyFBa
         MXaRM4jBc/nw+c2lbClBHUUzMmrqrfP2qNgQvZQrd4wdtLwiIJqFtFVGl/IvKmnSCebK
         JIQoMkgr8KSPZhSo/AJzMnURTy57axJUq6xFtaZYbjOBRHwcY7vr5GR23aWDezJzPkJf
         dxoA==
X-Forwarded-Encrypted: i=1; AJvYcCUBuGoVDQ4VXjrftReW8w3zgJYvcS8MjIo8Ir+5RJsmqvvJ5gJBHgJGEPPTfT1WTUmn53i/wQXOhqbDzXme@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnm82N/PEMm/x+kbpiYk5xXHv2QodEenkqvKtbY5xoH/Vk6WW3
	PjuNfnLAnScNOTspl+mwkL1UPA0iHUO1vfbBQpA86ISg/AEzpqulK4Vv
X-Gm-Gg: ASbGncviY0Rg+OccDSMs4q54Ot5aygna5c+MZc5fmZdrZscwE7JK2AndspyhJgpqmV3
	+PMt2jLyyh8JVNYY74nI5rsnOY873xOy2RWARPKM9cOzquiUVbg97rkkJ12oEgD5i7rM4JNQmft
	UrFbpopDUjRm9ZEbQYRR9Kl3lYYuBxoBg2zzvXTHV2DXRxLXmywISoelc15QxVmZetMTThu2uBJ
	pC3W0v/ZLIB4iYmI7p/Eqy2IqfYneXJBibzYtxE+N7KOCkUZ3ox83/qAdagY1+2dXmf07hGr9U4
	+PkGbvJjvtwrClZU/kS7cYqBmMgOBc19277uthCM5Fb+RGqKKeG0yXCZpec2glUgaa9n7iGm1Bt
	sLaWCibjJ/XRwJ9VJgt8K6Is5Z+tYN8ClLU9f1guzymAQ4XA4czvgm7yMrj5QWfEKUGbjNPH/hN
	ao1dxGqmKljWjfnjTm18gPemc=
X-Google-Smtp-Source: AGHT+IEY2zmPOwhscx1EDdtuLAginTFIvWQhGpHhHiYdyy7zAELaeMJCOQiAd3k0JqmBbx5zBDOJkg==
X-Received: by 2002:a17:903:3bce:b0:24b:1625:5fa5 with SMTP id d9443c01a7336-290c9c89d97mr186476275ad.11.1761030191637;
        Tue, 21 Oct 2025 00:03:11 -0700 (PDT)
Received: from [172.17.49.162] ([103.218.174.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29247223a3csm99924915ad.112.2025.10.21.00.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 00:03:10 -0700 (PDT)
Message-ID: <291a0fb6-12e1-42a8-8cd4-0171ec996ef8@gmail.com>
Date: Tue, 21 Oct 2025 12:33:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: talos-evk: Add ADV7535 DSI-to-HDMI
 bridge
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251015122808.1986627-1-tessolveupstream@gmail.com>
 <1689b441-89f1-4f2e-a528-be0b91d34b36@kernel.org>
Content-Language: en-US
From: Tessolve Upstream <tessolveupstream@gmail.com>
In-Reply-To: <1689b441-89f1-4f2e-a528-be0b91d34b36@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17/10/25 18:50, Krzysztof Kozlowski wrote:
> On 15/10/2025 14:28, Sudarshan Shetty wrote:
>> Hook up the ADV7535 DSI-to-HDMI bridge on the QCS615 Talos EVK board.
>> This provides HDMI output through the external DSI-to-HDMI converter.
>>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 21 ++++++
>>  arch/arm64/boot/dts/qcom/talos-evk.dts      | 76 +++++++++++++++++++++
>>  2 files changed, 97 insertions(+)
> 
> There is no such file.
> 
> You need to squash it into original posting.

Thanks for the review and guidance!
Understood! I will squash it into original post.
> 
> Best regards,
> Krzysztof


