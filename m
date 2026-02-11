Return-Path: <linux-arm-msm+bounces-92578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKbgOaIsjGlOiwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 08:15:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94429121D07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 08:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D356330168B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 07:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D11B2C11D0;
	Wed, 11 Feb 2026 07:15:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699C923BD1B
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770794142; cv=none; b=cIf6zRGg6YO/2yhApV6PLx84Ee9DEOfK+TngCKeLbR8wdMF9CKwS6PgUyYYewQN/DArKAl/+YGYhGy+HRyqRg+Eeprb1PKfTDm4UtfJyIY3K1emyfEJ3IFX5dPE8j4XdOY1daUkMW9RpDjhQl30lKQbQLb277+fzGe3MsGIIU5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770794142; c=relaxed/simple;
	bh=1z9QXfaNM31CLdI80Xi3sblAOGbXr02fTw9N8R8Tk3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oVvU21g4gd13WZLPVKHPDa2fkFPbpnNEa1r1dkTN7A+OUNRT3mTj90Pej5z9Fkf2W9SUVS9ViBs+Qb0V8X4Jc3ACH3kieqAepjSOpRkg96DAG1NcDTvwGsrz2EXgGD8JmNpXs9jqG347elCNmluSOEp4roApFTDw3FDEI2BJ7KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=li-nk.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=li-nk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-354bb7d2cb1so295650a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 23:15:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770794141; x=1771398941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1z9QXfaNM31CLdI80Xi3sblAOGbXr02fTw9N8R8Tk3Y=;
        b=YgHgA/6FMB0ahcUAIdsRyCmhUpivYR/KUlhFkvKr73LlyNuMXfBQpT+emETq38YmoU
         kJWQIpC649qq53Lv9AmTcAv3u0Sxm7uopSE6HIUwPH/nfbcIGXtx8abI9YHETWS03WhL
         aUAWXlv5CaQvDeHOzXJIPu3r8X20gMMyQjopfTEJYfSUIipFKY1WLaQ5Xjs3RqWhyC+9
         c0XcWuiMeIT+snfZ0gauxkdHLOJ7cg50pfywldIP19t1jc/1yQvMrj3+vyFyapNw6gRs
         3VenC39SozYFvM3xco7UIvuZpm9vSPxwsNYOU3aO2je0vNuZqyDcih95iQc168137Rd8
         H85Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbsq4XrId0mnfBs0s1uqxNl0O8IswUwj8K/L6fKvUao6vpSGFdrpo37C4hO/r+qWlHRFrwd7S/PSg2kxX3@vger.kernel.org
X-Gm-Message-State: AOJu0YzUVY5Ivl/72F93U+XEiVTOIvnQcmnew0EjT68AR3GACPGKUSHU
	dndzZNB6dp55FyxibMcYEh7BWslnEZJ9WM0HKMhv3ipedIm3k/J24/XU
X-Gm-Gg: AZuq6aIE9AtZvRzT7q/HjMnZTtpe9ZgnC1ryIBLammK2q+cAeWjRxc/T8csGje0QLVn
	lBX0EvXWipbvxrkQEz7qfkQe+eVEh09U4P5yBJysw67Lbvh7OhlPkMyo7zdYxW+vdtU1M6EnZBi
	N4GHjOxomeExbK7mZibz/tEOMrGHgSYadGXFePGo2yYh4TIF96EkMFWqCOpxAPWrLaUVv+Hl6TZ
	7/IAx+Zcv3F7XEqh0isW4cUciR8U9y67vmVrh5uGjTtgcNbDSr4b2Rk1DGn6V4Eie3PGkFrGQFb
	Z7G8eiGkWZ1OI5wSNu8Hq8QY8f35hEgA6LSizfmLyTvqf07YfzMJ83YDYAvCC+WUiIVZgEV+1Fe
	DTM9YOXoYwn3w+5sc+zl15fwKHNBIsTiYlr0DrLRoyXX+oUDvbqXeWJ+kAh3yQT6yNbw3MeJkOM
	VALlfR+gXaqyGmzBg0mGhcYqqcxSFOrCAPEZ9KXk68KS3eaat5eII4C1bJYF/hWsxYASNUNnOre
	8dmQ4Uc0KW9
X-Received: by 2002:a17:90b:5106:b0:354:57eb:c826 with SMTP id 98e67ed59e1d1-3566641e5ddmr4309870a91.2.1770794140714;
        Tue, 10 Feb 2026 23:15:40 -0800 (PST)
Received: from bishop.localdomain ([207.32.167.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662f6b624sm5300572a91.11.2026.02.10.23.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 23:15:40 -0800 (PST)
Received: by bishop.localdomain (Postfix, from userid 1000)
	id 06E8D142C7E; Tue, 10 Feb 2026 23:15:40 -0800 (PST)
From: li-nkSN <colin@li-nk.org>
To: jens.glathe@oldschoolsolutions.biz
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Colin K. Williams" <colin@li-nk.org>
Subject: Re: [PATCH 0/4] arm64: qcom: x1-vivobook-s15: add X1P42100 variant, restructure dts files
Date: Tue, 10 Feb 2026 23:15:38 -0800
Message-ID: <20260211071538.182318-1-colin@li-nk.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260208-b4-vivobook-v1-0-3a9b5e153909@oldschoolsolutions.biz>
References: <20260208-b4-vivobook-v1-0-3a9b5e153909@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92578-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[li-nk.org];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[colin@li-nk.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 94429121D07
X-Rspamd-Action: no action

I have been testing Jens's device tree for the X1P42100 ASUS Vivobook S15
for about a year now on my hardware. The generated DTB works well and the
device is fully operational in daily use.

tested-by: Colin K. Williams <colin@li-nk.org>

