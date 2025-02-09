Return-Path: <linux-arm-msm+bounces-47292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AA0A2DBFB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 11:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 510F77A2C41
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 10:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C1A14E2E2;
	Sun,  9 Feb 2025 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="e8KWJk7K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFF317BB6;
	Sun,  9 Feb 2025 10:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739096182; cv=none; b=IqaGcjuNx+8fvkbr7y/OiQmcTZF8zhUKBOC07Q4f869am7S7XRTl/498RXCVVCVOGRnNeKGaIBjTc+c+u79UjFzS467RMZwesgjd8zecf4jmZo1UkFsG8ZVMjXpwl51RW3Il2T/6Zlld+w6CECNMgGAfuPUTuzn03qlfyaJXQFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739096182; c=relaxed/simple;
	bh=DsS2geAXtMSqBWDK9YbfnJpbliuNKiJlxEBaQTMgqwA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=diOoH7FfWB0DU3L703mSmVd9D8odD+wEuPS4gcDV//Smp8D8XEICRfeIkth4+9GrqVwINaVIAGInZ3YPmebhq0Qy8rKDSAFyOX5O2MAu28uZl1szuzwPMW2uflYtd4tnmMVVTzOtZXbxMYSAVL8agyCkl7Ao3Ni58yCN8/14rUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=e8KWJk7K; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1739096168; x=1739700968; i=markus.elfring@web.de;
	bh=F3bDdKl8eATlDg8WYVq5TTuNjlsg7scF7CmaxNIlem4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=e8KWJk7KnQ+x/X/TSMhk/eufCcaY5Dw8k2LN0Acynm5KxjdmIHZuxQFlQnOHSkhF
	 0M+vyHWXRKV3SDHtoQcZpuGaENaiCNnUaHeXktQjNP3IyjvPSFvOnufNDxxuO27fL
	 d7hNznti5Pyljzu1GDCER/JQDLwyFiErAGMPKQWK+wLupNBcg4N6Y8wslhdS5r8yB
	 dkhToCQwTBjXVesvsm5nO+pArfDj81n3fx6/U4uWwPIKKJ81V54560XQFtsMrz2GY
	 OqHV9wAMm8njp1ki85/Rxh6ANtddENq/XR5k2X6MYSCp3dduc1fa+wkHhHLX6zthL
	 pIaO9nfvz2C9Jh6LLQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.5]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MidDR-1tE5Gh0OXv-00qiTY; Sun, 09
 Feb 2025 11:16:08 +0100
Message-ID: <797c061c-7324-42e2-b4bd-fd93cf4ff0d0@web.de>
Date: Sun, 9 Feb 2025 11:15:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ethan Carter Edwards <ethan@ethancedwards.com>,
 kernel-hardening@lists.openwall.com, linux-hardening@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>
References: <s6duijftssuzy34ilogc5ggfyukfqxmbflhllyzjlu4ki3xoo4@ci57esahvmxn>
Subject: Re: [PATCH] ASoC: q6dsp: q6apm: change kzalloc to kcalloc
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <s6duijftssuzy34ilogc5ggfyukfqxmbflhllyzjlu4ki3xoo4@ci57esahvmxn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9qLT0/6znlrr/UX2FzpFVqVWgiJtm9nEXtNZITfFV7q0fA3urLi
 ocRmNq9WCEz2HCQzKkoSyn47v8HjzCebI+Oj/qtjnE1FRMWmyCFf5dfO26MJbnfgAdHHFln
 2zjuGAn5UCfMW4tm07CItXxbmqYohhCD4zdFou4/hoh/3/D+Aho/Ns3Il7nnGOa3yYMxaIw
 3PcJMFAN2O6SUFKgFFUPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sSj4urlGScs=;aYQ2CVZDDz1kQzwhW3MloEE1199
 3bTjnrHI7d3xVZuOLLFf1VDWX062zj02hYmpGEh8PFSaH4NZSPV0L6O37cq5eA5FrpRnY6hUM
 Ses7fbc00O6fLHuruFIMZwAPXEaNOkMLntvEF/bPkzpHu17d9QVNfdQb5zWHtTLurnJcBUsQ+
 Ug2KU3fYOEdDiwkPZfXfZ5PTiaq7GiZV2FEuqUBE88JuFw2rhJdPxs/si8yqUoL6VW3BC6BV5
 /qHUsvSbyzjvWsTkk6HqiIQNV43xLtC4uFLHoCxZvQqEFp9NhfumITFGqSEIwB5mi+Fn6g91o
 G5vyAwyezRK/ED9Xa53W0JnI3ak8kxxOIaxCfDT8L375f4tsfZGJ2wTO36xQ5QRN0aY0zxqo2
 dd4hHSZk34h6Az+pZbds8+TvN/DM1YiqU61ySMGM83wlJGHijYcTk1UnBLpCCFoaM+wR7M+vI
 YwY9e1PYoQkBcU9fuhB3e2qdmAjIYKxUV9Zv9BHPcZByWQmpWmI6Fk5xsXQMI+Z8xDrAOmxaT
 wPLL6YJpmIBfyXebgUmB+SJctSZw0sdKawZPNmVh4Q8UAQ3l0tF3l8HGSmDlvo4FQky9DDHqY
 +dpPE1RRjxwkXvAiWUnw+uKWYSJi4APeLlVJzeGX0a5ZU9aF6FfgVzUCAM7my2TCtGFVWsiFd
 ap2nLz3jTA0+vIPW0Q6j6bvgg/ruXVq14NQlIwe4S0UXXlH8R18I2VIwZ1VbMoqU2qau2vAHk
 +y43sExq+zW3g2K4OXXXYmqo4y+AYuXROJhLW72Vjpun7hJUIGYtW1Kxbwz7WOT0NJ5uM8P3S
 3v0xmak90lMqOom4zR+V3PJD5rkBRnBA9Czp9b35VJ+nHqozR2uNxdlwiaNWZlwHUMfKZV1IM
 9Uy1hWtpkGoMADutt6LhzW4iUW/9ASkyZ2Ra12u3USd5u1YwiayZ6EOdkQ5Kbbf5yEIZQGdKI
 kvOzCS6yLogdSoo7b9a4K/RuPPxOsESr3lPzwbrkMY+eu87/CgeGdGUls838JJ6mlu/YSAMl0
 xF2KNIYyqHcdY0bi+BkH7du5ufBnUZ3+N9+OY02OWrwaw1pAkgAkOMDtqLRBe1kcaL7zWIYSA
 m/au2iaUvmcQdRv0O+Uc9G+1ISV85zD6eebAt6JLiIpOt7/V0lf+c2XFc6lr8qeEHKHZI7HIO
 o7YlJaegmMXffKFlK4fIW9cgdKydK/s24g38UlWDW2Nk7wq2NwgUwnsxXbLnBHMLaag/cRS+p
 p3bQNbh+onsXAtr2xyej2FeBbW1UXQtiaB6mR80NKfwT+1p32mIBSsvXjBsnCqmXl4x7UJTBO
 tp+3UUBRPCLWazFoMssAqKOFtzvpJlc4i8aTcN1pr6NPVExOWDXU06W+fuCaRDxmcvpwU6bXp
 D45YEcGOmQ3aPNw3r/OW3noIPaLCuRgukot7yICaD44BJSI0K6LSGbdOYkQ8CS0lEGMpTdBHj
 3U7JovgvjF0/MIpPWUdKJvM8Avig=

> We are replacing any instances of kzalloc(size * count, ...) with
> kcalloc(count, size, ...) due to risk of overflow [1].

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.13#n94


=E2=80=A6
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -230,7 +230,7 @@ int q6apm_map_memory_regions(struct q6apm_graph *gra=
ph, unsigned int dir, phys_a
>  		return 0;
>  	}
>
> -	buf =3D kzalloc(((sizeof(struct audio_buffer)) * periods), GFP_KERNEL)=
;
> +	buf =3D kcalloc(periods, sizeof(struct audio_buffer), GFP_KERNEL);
=E2=80=A6

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.13#n941


How do you think about to increase the application of scope-based resource=
 management?

Regards,
Markus

