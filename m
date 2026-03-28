Return-Path: <linux-arm-msm+bounces-100549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECp4IIX8x2mIfwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 17:06:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0607E34F18B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 17:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8304302FEB9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 16:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2B1397E68;
	Sat, 28 Mar 2026 16:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jwqLnsdT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA07396571
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713828; cv=none; b=lTaQX5j1AUTWQqyZY4uGqq5kxoYHHkTresimBh1H+hTV1mpd1M79xJNn1sz/WPT8L55rNKqHwJ9QMVRlbCeUkJ2mSukPLxnvyAQKV961ZCPwQVblsVZV8wBIpINvxb2v3gwum4mAnw4OJAKD3v92/K0OOKSGrXXEJ1a0wscdaV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713828; c=relaxed/simple;
	bh=lgGKVbBKE+fTwLHxUCzt47tu/KqD2I6032H0u1C/qDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GLlfxthKwcclOg4gyJv7MoK2NCVPrkQOUZjSZm3Zen+HlFJVN+PuuxRj0PMdX6oENqNEo0Fch6a/PqciDkrq/s15rHFGqxYiiEsuF6FBzC40yyzkymUD5FId14GMnnxhUs/24bd4sEP/sorDML/3ngGcOcBH0hd8/SKRSryG/BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jwqLnsdT; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b97ed4ad579so499933866b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 09:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774713824; x=1775318624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CrcVPMX3tCYm4PmLUfk7Jvax7+NoYzH2ICdp4Ljkplk=;
        b=jwqLnsdTtXARIM7b06zfcgK5MohtZhAgHgH1jypglmzPAvx7p5/t3uawXn9QSOFxVm
         z1wn8V9qGlWOHada2kuW0LahpJFxKXQ3R5Ic0PO/26R/CDsOUNjhtO4RtBzVA3XFkHdF
         DF7osjMpjT6wExlL/imqNGVOe+SHDlQuIqssP9bO4we7GzI2an5HJw2vWxJnLoV9nAi6
         VE4YNa5dixHXqExKs4J+EWe8zlpdCVyu0JZHcYMo2bddFu/ikJtIJP+zjVPke71PRCws
         CjtLlN4q643iz+sRByT4JkqZd7BwUqWM3rGjTd4tiLr0QM85rMGpD5YqUOU9VxfbUahW
         wWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774713824; x=1775318624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CrcVPMX3tCYm4PmLUfk7Jvax7+NoYzH2ICdp4Ljkplk=;
        b=H9lBXNLz30gDmKpU26rKmlo4unjpuUHa1iHDmEZWBcJW35vJbKbOhcbRo221fF8UKZ
         IKZ6k9DiTJViiBSKfXGAE5cBPfFvcGmvmf9ma6cLYJKcYjrERgVcU/vd0O2cQmIAX6Ax
         hBb65kY6FGeAHn1e/u3XAuL/q99Zb5FL11gtSmBsenGhVEceayE3wvmoMyYyaEjzAKTe
         MYzOR5VNWO/J8JbEmoet0kW6YWNUWX8XLlmoKGJL5Qfr9lVDN4oj8BITtqVQdgFK6gV/
         2UT7kkcKh6p/S1oh66oVCbuwMnkLNxVJ2kFxZTY8+UGFVC8GpJsJSnBpqkBx0juiGbrh
         nD0A==
X-Forwarded-Encrypted: i=1; AJvYcCXkvIl0FUWHSm+3uyTENyChwMuxIb05kvuSHqlcxGL1NoSgCz5WwGNZmjR95uLTB9roHni2Jd4Uv+UR7E5V@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe6T6yarrXP8eWws5OpUwzyt64y0TdaiU9k8If2nZqCjuS/GzW
	xQNQCpUuoDnQG7K3sfNBDy+B7Czk4d7M3mIFIZSN7y9CEjbK+6HfAAsGbQXjmUsbEE9lxnUZH6f
	+EaX3
X-Gm-Gg: ATEYQzwosqr/E8g3Y/yerf0sExIEqHiAIP/NkepnuWthWwwUPp3TNfBR+/HL+YfWu3P
	3GNB1+LDYZkOlSwvRtThKw9EIqnooOU5tZrnQf+AY3aZd6LUdFM/TvYAboW62U68dRP4L+FiPpz
	mTFaFyzqDn7rYscb/2TzvBmMjutapsXSxQfNtW0qBdKLLQoTsbP+FcbCk+H6+45H92nAiVnm1Rp
	3FvfJ0nlxLwxB47Dov9/GIXHxGKyEXiOAkWFMQppSIpxHDdNSg+rYzam6GXCcy7Dw+E2KPWOm3+
	JIO8r/vSZS9WDu5//ruYOMR6kF6diVzUv/qhvWDQHcacgAPaQMULRqtQQcl4AKrb+YrvkARK5+D
	90XPkdrFHEzVME4EXevSfxgvxQTMvo4kLDNsmY4bTh8WJldmo3Q7lSOVfoRPb5p/TcgUqR0D35I
	0iI9DxmVRRe0AQ6ZHCCyP748nGvoxL/SjxGQ==
X-Received: by 2002:a05:600c:8b77:b0:486:ffa3:584 with SMTP id 5b1f17b1804b1-48727f17035mr92343295e9.15.1774699085874;
        Sat, 28 Mar 2026 04:58:05 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.108.64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f173dsm5134165f8f.15.2026.03.28.04.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 04:58:05 -0700 (PDT)
Message-ID: <ccc4f25f-1796-419a-8d10-7180b28b0547@linaro.org>
Date: Sat, 28 Mar 2026 11:58:07 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] media: qcom: camss: Fix clock and IRQ
 configurations for sa8775p platform
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <uLRnS7PkynWp9Kn5RKKBeGY6obUZTTQfoIDTjSGe4xBdLmrU8OhgrUeADUAv4sLVAxhCLLY0jdE46Z6RnGyvpw==@protonmail.internalid>
 <20260313-vfelite_fix-v2-0-7014429c8345@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260313-vfelite_fix-v2-0-7014429c8345@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-100549-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 0607E34F18B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 10:13, Wenmeng Liu wrote:
> This series contains three fixes for the Qualcomm Camera Subsystem driver
> on sa8775p platform:
> 
> 1. Fix CSID IRQ offset.
> 2. Fix CSID lite clock configuration.
> 3. Add missing clocks for VFE lite instances.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
> Changes in v2:
> - Split patch 1 into 2. -- bryan
> - Remove duplicate clk rates struct.
> - Link to v1: https://lore.kernel.org/r/20260313-vfelite_fix-v1-0-2ee7de00dee7@oss.qualcomm.com
> 
> ---
> Wenmeng Liu (3):
>        media: qcom: camss: Fix csid IRQ offset for sa8775p
>        media: qcom: camss: Fix csid clock configuration for sa8775p
>        media: qcom: camss: Add missing clocks for VFE lite on sa8775p
> 
>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  6 +-
>   drivers/media/platform/qcom/camss/camss.c          | 80 +++++++++++-----------
>   2 files changed, 43 insertions(+), 43 deletions(-)
> ---
> base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
> change-id: 20260313-vfelite_fix-00a36e8dccfd
> 
> Best regards,
> --
> Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> 
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


