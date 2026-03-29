Return-Path: <linux-arm-msm+bounces-100583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA9gMROxyGm6owUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 06:56:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B2B350C2D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 06:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A39D03032653
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 04:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075D826B2CE;
	Sun, 29 Mar 2026 04:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+lz8Ts3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC2527FD6D
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 04:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774760106; cv=none; b=Yiai0bBvns0Gxy7S6p5WZfsZBdMVQCPwJIgqsUb/ZL1y0UlqUTXrAyXwOMnr0zHQbsm/BNtFUXh4fmotxsi19uZAcBUz7lCjrUcun57qlCLfVo+vSnIlZF5fxRPENLV2m0c+4wKXeqgwoCtG0Iu8D+Era4/khQUvtFTCagiqECo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774760106; c=relaxed/simple;
	bh=Js0dPUIASHoguxiVqn6MBMWxAGVCNMhj/7RNejkZNRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VgaFjsMy2EnHJTXYQEHOVV1HjsJxaFA0KLDy+fWTEECbqkAfJP4BlOzeXHsKqZn94yISe28oWb90Ar1DWUA0Oj1xbPJOYnymfc4FcsRuH2m8FD7x+jAGvzcGKQumOdu+z148g2/oIZx8CQUuTrlWuvnlo/R7uzbGHcU2O0fbtqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+lz8Ts3; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82a7539851fso1545979b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 21:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774760105; x=1775364905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+swBzHshtaJ2BsEpHPJ0Jw5GrqxY1V25vs/IOCsBsE=;
        b=X+lz8Ts3qE1fRsTEUra8AYF5slAKSe1n9p5pgRm08yqyAHlIgzuHJhNdP0zx/AzVsV
         6uQxr2CPrWl7w5nS38BId4mL9QykLfOduLEM0Xs6e5UypRN/VaYfrugVg0Srkqr4MlfC
         JmoNrurt65RSm4yp960f/HNdQXlZXqzHP/bNY4GKWy3JCe2bv12TMuTzpuE501oN6VvJ
         Tj4D92rz3ArFzyeY46mUSFmpqifKlwASDWS+9vYQl1N8tEKAf/ooHAhTI2yfvr4GSqzs
         uPT9A21BQJHs1/KpdTAlRwKOuuV/RBdBntuvVMH0O4FhYN77aUjFL62uLrBGwwRHhEo9
         xDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774760105; x=1775364905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+swBzHshtaJ2BsEpHPJ0Jw5GrqxY1V25vs/IOCsBsE=;
        b=VsfcaAVV0O9LTSxj0x7hZWTfIQvjBkvdu+QIrprmus9sHvpi3oVjBlWEKPdTkvJ8B6
         S/7WqY8lBzbB3tLo9g37QJRuXIDOPkIGpLkgXZz5hqZ39CgZJ/rl7o3FJZtVoz1PXYIw
         g7E2ukx2GKRVNYafqC5vpBbtXqBy8Bh26sO4l4Q5A+qEefVxW0M1ActyTJ1Hqh5f5fTo
         4N2haK7e2Rcm4ILEArpnd6W8jvwJit0t3eLYoBfAZePafPrJS3w8YGRbsgHwk0QZsPpS
         lpV9UChwwazmaqm6eZmjsP9bpR97aExj37KqNyr2HbUMSBDjwuhP/swvqCJFglOnT1YQ
         wurg==
X-Forwarded-Encrypted: i=1; AJvYcCVsduFdke3x8O6N2kdIvWHAr2Jn++NwqYVowBV36CeRmYOhbZrvMgx3VyCAGr10yIr8V0qxzydvV8GilWjt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7CxSGbAxlv1NJBkDK/aCqglbaLsCcO0XrG04AA7zvXUrs7zCE
	V9Hia+k1OmVHTHQXPRmiqQo7i0i1wVH+rmDoyG/XXhm3CJmh7VMvdi6g
X-Gm-Gg: ATEYQzxiQDAC9EWINiS05/YjJ3WmtJCHVCrU5I+omfpYD3INQOuf6MwBZKmOlufB+F5
	HimxFpJb9Rp6v4EKeQMF6mIJsVd7UNLECtYy7Ljow5IkG1LmONR0zUsyb9yJu77M8TQd/YiMen0
	og1eQG42qcksHmtN0oqprEVqnb7+syLDTMa+3VWVuRjx1MnNFFoRZBokQ9ZJlgtidsFekCxPZUz
	0wjM6PFpmgv2TSAr8S5AD4RrMD7wCovQZ+ZvD+L+tWeDS6Y01Aq/Qj1gyhsqDSQLNm8cduT/TCk
	4KJ8y+9FBbAAj91qC1mTJtufdn10quUncJ0RRmJjREeFDAIt7hYHbd3QLIf3jw1dFv8SPMKdw6r
	mbJwGnor14Afj3U0XNXun9f83x0/9dZN0FgMiZKHProqNEc216HCbOxo+7udt5mgeIJGP2gmlpd
	WogL6loWF6WfM8ymJJI8xO
X-Received: by 2002:a05:6a00:369b:b0:827:2ee0:411f with SMTP id d2e1a72fcca58-82c95d27b82mr7740643b3a.4.1774760104995;
        Sat, 28 Mar 2026 21:55:04 -0700 (PDT)
Received: from ArchLinux ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca8625269sm4005082b3a.53.2026.03.28.21.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:55:04 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sean Young <sean@mess.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in xiaomi-ginkgo
Date: Sun, 29 Mar 2026 04:54:46 +0000
Message-ID: <20260329045447.9450-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100583-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 74B2B350C2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 18:07:23 +0000 Biswapriyo Nath <nathbappai@gmail.com> wrote:

> This patch series add support for various components in Xiaomi Redmi
> Note 8.
> 

v2 of this patch series was sent here[1].

[1]: https://lore.kernel.org/linux-arm-msm/20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com/


