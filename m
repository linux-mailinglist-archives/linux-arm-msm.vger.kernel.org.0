Return-Path: <linux-arm-msm+bounces-47767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B27D0A328F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 15:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 444471885405
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 14:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E511FBCA6;
	Wed, 12 Feb 2025 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="wI5257yL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC10C18D65E;
	Wed, 12 Feb 2025 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739371543; cv=none; b=TOER2Ta8/oyLOv3k0+JhlIWc/ABitC2XK7JkWjMWQAaNguja0eBH7AmnO15fhhDgARQ8VVCB9XmdWOV6/0I78mHMOIkN/hNHy8VA5vjxt6zUsn/djOwWYk3y5hKBStZvZvEl4+mIhfm0B0BADktLdycnW9Mz4zkfH0Bow1x9q5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739371543; c=relaxed/simple;
	bh=zPPPVDyPCQy/uHZXmtEqFziYEoLwnzvm/k6HokPTs8Y=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ReSfxEUqRdZDEV6vudAUHO7o0baFs/ro9DSJd/sZ6eahzcEQ3S3T7esCYkn0aMZS/x3rURn12OR+7+VpLT2RaN/ZOLVIWg35YCmVaYH5KxSHcGOQqTua34BOima48LNxr1lzwLMQqRBMNzc5ZmgDDPDioAMZ21DJQCyg+TeNG9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=wI5257yL; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1739371528; x=1739976328; i=markus.elfring@web.de;
	bh=zPPPVDyPCQy/uHZXmtEqFziYEoLwnzvm/k6HokPTs8Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=wI5257yL/FVTiY5mUkYGejkdhVaRmGYvugLmvPDMzLMngyHvByBwQQQknYe+C3lg
	 840gW3JUYmvLT8Z51sOVUamRng+HvfbWhyC+KycDYSjHzhU4YNWpHZh7dghAeLKrW
	 zv4D2yi+Atoemvj3brYS4dAVEjYl+q8KZRceYtUxCWTJ3Aj+dipeP2TbrdwZ13K3x
	 XA5aw8S4hoAeTzRsoHu3ZzIxTHt9vPx20OBmZLSSORekQBrwtMGaB0XyQ6z52ox3d
	 PUblNMwdNVJco5ntQ7U3hP1X841h7TiFErFa/pBfi028I4v1UH6JXswlTzb2Zymvn
	 67iPkISqALY+GVOOpA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.11]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MGgJK-1teKFu0sgk-009tly; Wed, 12
 Feb 2025 15:45:28 +0100
Message-ID: <f4757a63-c1f7-4b4f-854b-db533c8b70ad@web.de>
Date: Wed, 12 Feb 2025 15:45:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
References: <20250211092017.562-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] clk: qcom: Fix missing error check for
 dev_pm_domain_attach()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250211092017.562-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9HptBoJr+kFWKWd/ACV89eXSi3Vqg5qVerrcCbM5ck8oPCJkGhW
 H11Szp+hF184Zyod+1e14zLL/BbnjEBwuS49kqycnWHR0DDAgK+9/WwanAUkts7SfXTlFkA
 s28hgN4rCw350nRlH2uI9aopBiBRaKTbrEIpMeLPnoFAl6+4h4+agoaC720zkQVBha04VTb
 QRHR53cyeO8df3y/5GiiA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Qjil/6/MEY8=;B6S1G8rplb9b1l6QX8AOpnucNI6
 dL/ZMmIeQJuyZU3DSZc/mQMrrp17/l7okkgDsGor1bbTU03dM3IjXTOd058vYbkunYfbNbxaw
 fpSdFytDXDJE7OZ4k3tz+u+0Ocbi0RvvScIGnZWk3d+wl4n6XF12t6QT8lPhxnLUL5k+pIWZn
 IjkwBMJ2uzlwLZ6et+cd7g1SrY7xVa10hsWE7Y4x8za6aSpchOCf7AalXz/EuKxwEVQ2NAFDn
 Om6SwG8tgfr6genhda7+Z8qZYn4Tog7Ed99RBSJh9rjkJl3COkIsgUK71w0M41e4ygfbAt2Z0
 6WsZ3vHQqWTht8GH7lUWUJV7CGC4eXKLrNpdmhWc9ZhGvfGzwClJu8NnK3BeS4Q//z0U4tZ8E
 WCak4R/GNZJZSdp49QtgBondz2kyVmJa0nBpHhHMQDQEpt/QwG5G+8XaepORSzXR6MTGhJh5x
 uijktZ8jGBqHwUu8GSmzrwaMFPyaqO5MGLgGPp0XPuB8ONfEQJOIbVh1sPUrdr9PJSCgnAQy6
 grcj2NrtklCHw2R6WbZbQ/hp1hkC94MPvp9shLFgUyX0QFbwXlTeqE5NpTjEbiy3RsInLCVwe
 joAZkQpn+M3EEpRLrORHDC2+G/pdTcanjhgASpl226e8k9WHHvEWRXRQxeWUbgl6SJREMeY3Y
 orjhjr0BbyGmo5/rCoRqwHsOShcHMA1Y6Cpq4db1h878NMNVD3LV6YS4HNF4Vja23A8BR8jD6
 hbKpwsuGJcPxSPsWza/a2UaluKYM+aCnBD2Ke1NQ4S1oqU3KOBvy/oeksDtZpepNza9aMrJws
 LMKb5Uudq9338WBAS7qRKLFTiml6IHK4Y1CW80VcWbTR1zne8vEoE9G+m4OLUNqK3UD6IMc2m
 bjg2BudAoC6KUZuMJBQwgOgyWXnemQLPl04bmMFFx3d5nvZwXHB0axtiZOnsaDMXHcZ2ITlK9
 VjzsPUZroZBJ4efIhjL6kdGQETijEci3VYHNhYWcAsUuDOxSwhS637bYly0qLr9lc7iEXWVdE
 qv46FHaFt94pLc2l9mI9B6ZMz4LxmDi7t7InppklqN0fbDXJXMabLXLs4pclS3Ud5fKtPTPT7
 drLuXxXwgfZ1QY2Cm2dtaB1QxAKM9/VfndG8k5xD3gjQeu1LFiwj6LbuZhpr2kD4R4ACzsOX3
 dKtofWp5OrNcCP7aTNsAFOimsw5Gq0XiA1Vn8vFY5XjQBmWiF875sF0s2OHvmesHFoAo0By4c
 1LWEGWXBf+abj2nqn0zu5nP5S+GBTDZ86Ag42hjizZrOjerzW91+2xAHJ+8ktHwc+SgjcwOeC
 4b9+wL7PZ9BjgXYNp+h8wYW5ZW1K5UdalgKBweVjR/iK4FMwN1xwvOKBYUyPzKoQLeerLAyGq
 lh8kXmt9EaS11HrydZNMXHJLzi3bOeh+dHnHb7RP/e22bEtTStuB4lj8L4UfvarJqS6qET1EV
 u5EeQJQsc86cc4U4Kmz6MU91xEjg=

=E2=80=A6
> This patch adds a check for the return value =E2=80=A6

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc2#n94


How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc2#n145

Regards,
Markus

