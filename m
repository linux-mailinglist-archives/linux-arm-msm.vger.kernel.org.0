Return-Path: <linux-arm-msm+bounces-109925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Bs7NKprFmoImQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 05:57:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA485DF13D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 05:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3927D3010F12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 03:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F111A2EDD78;
	Wed, 27 May 2026 03:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eu+djr6z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE63C29C325
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 03:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779854244; cv=none; b=netXXBrSepusZhY/42C7Z4rMmYL10UhN9Jgl0mYIBMNNRyv4Or1NgtEVNF7q9sZ3ODo01HVqAbbbwsxuD4YbACGbbqR2i73p5cRWZTf13hEAaqwXObTKgyUalHzFW228akJMTQowM7QqXC3r+8flBDdnI98HSQdi2YdEA5UgVhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779854244; c=relaxed/simple;
	bh=MBum6xrKvNWqY2WWGbqb1aPnDE7UzrpYnOEdZycNgxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bb5Y+AsmhLnx3h1WE6wNcALeGS9guflMZE4bRHRPSFjJegt4LuZR8MJwj2uxb8ZPcTJ7Cxk8xadUntnBZPPrBtUyPZ28ZDPN5gKEi/PlMSgtwY10sk9vy0LgK+O34ITF7gBrqQ7kMkuxbkycGEXdrX/Vm4u9FcD9ebbRKzSawq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eu+djr6z; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c82a6278a4cso8409197a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 20:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779854242; x=1780459042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBum6xrKvNWqY2WWGbqb1aPnDE7UzrpYnOEdZycNgxs=;
        b=eu+djr6zKmXu7lxsZJnMPKelB3ZXlcubr2CIvhSVqtUyfmTI10MitgddN1RAU4/uGv
         SfGPbEjwfswFjWfHoMzM1qjNorguA7FMhbMshGTyOX4f20OO/MmIZ0u7M1xlxW+nsKV3
         Iu0ZgMPNSkzBkmNtzdg+KMxBLn1ZlUIgqYrRHSBr1ap6285UhpPH0lmGwKa+8ySYEGdz
         CLijREEnKghLp+OYQAwkSDo7i0nf7YXrYM8WCCTtTJCrAoe5Ov0P0iAHWW9e8rKIAwUq
         n2/koCFKpfHN47svRGByk2PfmUIw0bgXKxpvW5T0ZiDs1946EAKtE2sOfdNGZEApWE+O
         4pxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779854242; x=1780459042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MBum6xrKvNWqY2WWGbqb1aPnDE7UzrpYnOEdZycNgxs=;
        b=Et4VgjfiF6G4su/WnfttJLk7zequowjkwFrI1x29XQa0u2KTKpGeaRoP78kkKXZoth
         IDHOXklJAglfpnfHeh/RM10LM8MRSc0/7aBui4nti7u2yiNGsXDrwoQrBA5Uz3qvp/tg
         fWTeihGJOpBeF3Akefw6w13CTN2GaY/RH/TGWTzM0WH5ExJ6uKHvUZpStix/4xNvwPB1
         OcjKvavlpmn9x6bPwUmez8wLQzlG5JBSJ4uhGaHrSoNedofun9dwEg0dfUg0xwc+FhV2
         sUNYvtKb/EFfpLOG8dOa58cndMgs51as/eFMy3sVJzByKsiDG0nQkPEyf/H8GvkRdZII
         0PfA==
X-Forwarded-Encrypted: i=1; AFNElJ+rC12rcRK4EVFR7MGo2CzvblTyTRhEQLlPYrOmZt/Lt9L08lurY9FDzDRyeTXEkBzU0rkl7cxww7i00MJd@vger.kernel.org
X-Gm-Message-State: AOJu0YxpYqwei8dZtjBOToyXViAmplW5prM1DKRh+268mRy4dGj8magQ
	xD+o60t0UNXBQnur4FVFjsbsa94yrFUYYGAh4np1UlXqiuoLaXTuYIbq
X-Gm-Gg: Acq92OG2tLJDzeEMIjJOfalcjOhC4a4xFqgLRQ7oFqcMqrDG+OjyZMuCa1XyKrgrZ3L
	Xw5WnjJujHHdpv1X2yxiq6x8V35kTjjVd4X1SccQsrjNTCPwqoBKC6RN0/czcptLbCRxEX/ErNz
	MLQX6QylvU63f82EBUdR+YUX6yAbtO4MLJ2iZLbkHTt7UczoZVvgFBG7XsmKfm/8JaxSctL2nd6
	kHG6xbFaX8V8yCWGKqYDerrBiJzbG1gxasic8SHIY6UC23PrQAWQw1SRqagAdXrFXkCZdu/3ZPg
	evN4RLHK6l962mQLNW/v3RkMUTTOL+T4FZQOAGdVCQAAZym7FJJF2apQLzM7vzq1TZ5G6fMfo0p
	4ShIMG4GcB9jvm3r+Yll6TspXoE6CgPbs9YKI4H5VsF2+i/c1uo3lIz4hxxFX5vXt6FVaYwtDph
	kU1k2vzQ5n73xhqYoGRcwMNYnb2Lw5Ia0t9LKuqNBdPoOS/vcUC0nU6at58MNKD1wzOqRi
X-Received: by 2002:a05:6a21:3283:b0:398:4a1f:8a54 with SMTP id adf61e73a8af0-3b328c4d724mr23258698637.2.1779854241666;
        Tue, 26 May 2026 20:57:21 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:305:1d13:54a:bb3e:c4d7:dba0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8520560ff8sm11572280a12.24.2026.05.26.20.57.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 26 May 2026 20:57:20 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: Add Vicharak Axon Mini
Date: Wed, 27 May 2026 09:27:12 +0530
Message-ID: <20260527035712.3157-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260519125655.23796-1-blfizzyy@gmail.com>
References: <20260519125655.23796-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109925-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DAA485DF13D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Gentle ping for this v3 series posted on 2026-05-19:

https://lore.kernel.org/all/20260519125655.23796-1-blfizzyy@gmail.com/

Thanks,
Ajit

