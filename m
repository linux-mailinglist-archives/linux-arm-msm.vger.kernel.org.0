Return-Path: <linux-arm-msm+bounces-116560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gzUBI4qUSmpaEwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 19:29:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C975C70AB29
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 19:29:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=O0r1Bfgg;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116560-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116560-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CD183017F84
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 17:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBCE3016E7;
	Sun,  5 Jul 2026 17:29:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0F32F9D98
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 17:29:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783272581; cv=pass; b=YknOXBnxkPfRK9r7VcX1MT3Y4DvALvyKHCU2HhaxJuuCIpErCctVr14ihRMhgEAs2IxHWASUQwIFo9LqQDOg50Gi4I1JDwUVfV3iW9wJF4O/wCz2k2up1GWQk+I1Aeol2N6/OHr48D1dWxKv2i2VndIxavQNokbG7MTE0nYiJYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783272581; c=relaxed/simple;
	bh=/9tz9Gj7/smAtDHhEOCvlfAtZV2MqM8svnwdDenrBQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qz3Br6CAQiHN4u2wbvPMf1fC8xZgxjE0Bhn6REwspkGH/WBtVKF/wFn7Fo4QiV8V1D4BXONbRrHonHi9sb0/QdZ6n6xP3yvALCDNIqNOSC1LQZgcuRbiDq5i2ndZ9k3cVS9Qjx14RRThXVpt022Q/QI2Kn8Vr9yfxF5BL2hnnQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0r1Bfgg; arc=pass smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so361086f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 10:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783272578; cv=none;
        d=google.com; s=arc-20260327;
        b=MV7cOwvpIDZWFhwEclmO9ChJGqK72WQllZLENB/Zzq/+qFuXy3BE6jCnI+ORmFeuqZ
         F+MDe9VcaSpyfrRdOWEHvyDicLqIuAWXKXS9Pn4DgWMBBvXKAUlRbAWAEajIIJdTiTCJ
         xgGvWTvPDowQ5mDSeserJqztreBTl5K7AblzK5IIlxzkiUhyTZLypdQdUFJAA1NviOUd
         FadMP7h3zvaTC2HchYQslaS/xEpWrTMKa3xgH1Dw093kKHqDKWwGKQ2jjOTQpSNTZVzh
         ELeEFx3dWKrqUsQ6awRixrRhb8O3NYbmxaqQ1/bBoRPTn2PuWdAawNQXmWrqMK/5jKR1
         UpSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XLezQwhPY7BUrn23M2xpKTiVW4rocfdQBq+p53l6sXo=;
        fh=JwfoZ+kTk0aqTvH06lye8V/aLG1HcsrIhJGIAj0AkSk=;
        b=PKjZYQfI6f79VoOSPx5K968GcarWM6RZkqlXz3SnRV3X+maN4TyMN3rCBpeZ/QLVRE
         w62SQQZsFVa4tJN2BgVjbIuSTgmpzXoN6Gvsi9vvghTPtVMHfEFjYf7v/xZalGX7EB45
         jwFUaVY0445XbGR4vCXH9Mz+Ul8wfHUQnp3gqZhPQPhaqkvZ9igKIZ2RMP1G8i59YARZ
         lC37/MucIVsIUYotmNaccnNf9wdvyPRRDgHdphOTEF8Pw1JaBVaKwtoEAp4sMDXj2xto
         jBGiE6oxKTZVk9C1IUyK9C36k+jTVCKE+qMRhRE+Pv6gnxRTLDEhDHjYEEGembxWo56a
         gsyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783272578; x=1783877378; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLezQwhPY7BUrn23M2xpKTiVW4rocfdQBq+p53l6sXo=;
        b=O0r1BfggC+LjcZPINm4juLgMG4gG24UnXCXadJU66f93/SSMQAhmjfnEHU6GVVik4H
         BPeaqbczwHCzy/vDHnhNlCZhy9Vjh2YR/XV0w8+XC7sWNcQ8StWJVGdnHq9OmM8+NAx1
         HM3gNtyzf9Fk2mfX/dkUI+6UHoEmDjxhMkkVqsZWfX80n5WBsYJrgSMVCqSPCgXb9ItT
         v+KFivMiQkC2CFn/K0eveYXwx5POXhoOFDPzv+lj1bUV7fMdx9yO/duwAc6Y61q8NT4Y
         OP7XPB7QgLV5Xulm5Qb88iidQo8Rg7Ha32RiEQHL8gT/bS+oPJnCgf9CSgr8+/91Xd6D
         pKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783272578; x=1783877378;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XLezQwhPY7BUrn23M2xpKTiVW4rocfdQBq+p53l6sXo=;
        b=NxGpGYrzanJWUVPwS4qOVGW8Ioorkvw6LGF7WzxnLfGNY1HxKZTqAzWvgqekL0GAzS
         bFkHV+iWNFxYSRfRRwafGRKiLGhWW+SpLwmKOrisqQj+wij3UFio59Q3c7CMBgFwTzvu
         l8qNpeHQuTHZG12hoorjaSMtkTFE+V+94cpycTpENW/FKYmiiR6mSWbddewzZqHHYAcp
         yFMlggf3VbdtKJWr+5/perpGPwG+3CZ/VUIQIi5xjXrOG3x+c/vzW3pFeOOoO2L1hGnR
         nrfuAD0s9F5axRwZQIUqxzj/SJQex0WbHAIaF0UipAnKR46Usj52ufGhAV05f6bk6Pzf
         8XZw==
X-Forwarded-Encrypted: i=1; AHgh+RpuQLvgXB/pctusybe7GVXOeoDN+guEvZhL/6dDLAnf82Cm7i99mjqMizXWkwFTPeJsj4TFHU1W1vxUeJvu@vger.kernel.org
X-Gm-Message-State: AOJu0YxcPFVEqHR/1ZgAEAiAbeIq/yQdodNpfJF7LuxOzOYPHKdrven6
	FGj/6I2SDAi/PrMOoPKbkGBtSfQMvqF4WL8qiEOA6vvBZjbN4WcYy4pP7W3xFPMLJsyM5Mc9+3P
	j9krkCspT3UULRPsZ8zFzPF7lgSx7hQ0R27SQ
X-Gm-Gg: AfdE7clVc0K6mgIqgaXDcfJFhfjXkdn91XvG5BqEelNpXJt7M9NMrXshVUJQn8nJFjE
	SemzAYg3jQecIjTlCtjPqgrhVJ2+h7kbqYqcQV3oUlTJn0V7gs1qdIfTFdkLm3ZLGJa2fyrSp7o
	PXNESvemMAoW3e3wKK2IVRIJMffC+hbXXPzdlx9KyZrz2rDRVu9GustEDz4qztFZiAaSj7BSNUj
	NiAaVc8KwbnXVrXBw/2CHSPu++cmuJZ+7EXuaNGftxM7F9iS9GuJPxngvm8aFDOkMeYZ3REopXp
	xZeppuAaYQvYkSW7iux6Ov8gDD/Vs+qiZ9ONWOls7OXPdyUYbmWdByne31E8uaLYTsDiHXrzXg/
	ka5BbylY/xRCVmVTbC1CklABG849k2cu7RT+laYl0e3H9GXFya2li5X/ubUuier3ZSKILIe0s9n
	AHpQTHq5g8q9H+JoyOAbYDG66pgkeRiNfamFRfOGTltiweIIkzsjQZmbAPe/JnGD0=
X-Received: by 2002:a05:6000:298d:10b0:46f:558:a43f with SMTP id
 ffacd0b85a97d-47aab57d3b9mr5698021f8f.4.1783272577955; Sun, 05 Jul 2026
 10:29:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com> <20260705-gen3_adc_tm-v3-2-ac62f387dbce@oss.qualcomm.com>
In-Reply-To: <20260705-gen3_adc_tm-v3-2-ac62f387dbce@oss.qualcomm.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sun, 5 Jul 2026 19:29:26 +0200
X-Gm-Features: AVVi8CfQUxrT1-hVwlpSkwk0fu1ROQnVJWm80bpEdP3NZQ2u32dEzKUetnRoGfM
Message-ID: <CALoEA-ynWc7Dash6sprqZotp0gxy3a=t_VY5r7_00KMN6kYBDQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] iio: adc: qcom-spmi-adc5-gen3: Remove an
 unnecessary print
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, linux-arm-msm@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	David Collins <david.collins@oss.qualcomm.com>, 
	Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Stephan Gerhold <stephan.gerhold@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116560-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[joshuacrofts1@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joshuacrofts1@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C975C70AB29

On Sun, 5 Jul 2026 at 18:55, Jishnu Prakash
<jishnu.prakash@oss.qualcomm.com> wrote:
>
> devm_request_threaded_irq internally prints an error message using
> dev_err_probe in case of any errors. Remove the error print in the
> devm_request_threaded_irq failure path as it is not needed.
>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com >

-- 
Kind regards

CJD

