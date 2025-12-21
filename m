Return-Path: <linux-arm-msm+bounces-86060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BEACD3CBC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 09:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38B24300ACDC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 08:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C807023EA93;
	Sun, 21 Dec 2025 08:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="1cHEaqpQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F257C21D599;
	Sun, 21 Dec 2025 08:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766304557; cv=none; b=ImbVKcoC7GkDADoX4HiXBtxbpbC5DSsynSHsams2/JkyqB1trHwje2hm8S3k3XNt18TjvUv8h5veEMA0OHn+l0wM/d7TVP4fV2vz3CzsibiFzIKhYnztPsamHgg+hJH5baGaBa6iVS7PjoPBy5WIaFoSOaOPp/R2XWapezC0JzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766304557; c=relaxed/simple;
	bh=Letj9I5VO5F7aclP1k2MCJk+2Ona6XiNB8LdSfLghhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IqcFDmzWQOd+kG+5z0DyPTWoCgm6rpsR4zedD16uhu1exWUOjcxZtpLJJGGNYVU63ddFnAPicANNTqfMig9mOhMsKXgWDjn/9lzdW/zPJyCGXkom9dzbVe5AjhRzAiUZRuF0JYNmcpXwL9YhXvGXKgdVKmVc9asdV28vVy8JN8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=1cHEaqpQ; arc=none smtp.client-ip=212.227.17.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1766304553; x=1766909353;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=Letj9I5VO5F7aclP1k2MCJk+2Ona6XiNB8LdSfLghhk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=1cHEaqpQhJHi9t2wFO/ScvMmWf40pfTqLCRmw2SHcR7Urmawn2PGLEAcMH7HE1k6
	 B15T2f2WAADfyoW/YxJTuE4lmTExNVJLFInXqnVOoxV57ohb8qQRS3hNZXYXwFD+7
	 qyMmhKGqWpwoll+HgDohJbir/4N9g7KroqVrjbYVL4Kc/yDylx8vLVzK32GSsTfK+
	 eg+NreyVmPr40L4iGcF8kqmieuvuGIr0aE/IcNOAq86NnMiUJb1Jq8k+uLqReUprG
	 avnWevhCc76r0O9/UIIlB6RNUIUzi4b2wYCPERLRF8yAA3LuTAI6zPZ7edP7R9F31
	 pnD2nJIGm+LDpnhbLQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M5fQq-1vdI9R2Oqo-008hmN; Sun, 21 Dec 2025 09:03:31 +0100
Message-ID: <124d3c41-1826-4927-b4de-1d2d1ccaf5d4@oldschoolsolutions.biz>
Date: Sun, 21 Dec 2025 09:03:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: add
 hdmi bridge with enable pin
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
References: <20251220-tb16-hdmi-v1-0-18b1e20b396e@oldschoolsolutions.biz>
 <20251220-tb16-hdmi-v1-2-18b1e20b396e@oldschoolsolutions.biz>
 <72bq7sblm7iprtxg6oo65mit7vsheux2xatqlk3csf6sp7ersg@77p5hloqf555>
 <8b562354-1c6f-4b13-be55-b23a6a93d9be@oldschoolsolutions.biz>
 <x2zwsjk4vv73a4i4pj2aphvajtjgkw6mkzs5brg6adlm4gnxpu@r7pbypzvcsi6>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <x2zwsjk4vv73a4i4pj2aphvajtjgkw6mkzs5brg6adlm4gnxpu@r7pbypzvcsi6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tVL9hds6vwyiPrvHgK4Y1JRo8PA3UCnwGBZEjhnyMVflDuNd467
 Y6Gq7qFE2nWh6AeoBHQ6cWsS5xef7/cus63Yc/DX1iz7LF6fNnipebWLJ8emTcIsYgFFvrP
 oGlmjVJJXM41Bt3EgwIqV+iwbBcWMDq1akinKjOD9xsgt2k9cdjJVkoDer4CKtZI9w3wDY4
 6K2LHkwjnTWpOF5yhqizA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eL5EABDKFFU=;4gWBem5V5/wxvWoB7qZ068bbzNw
 sJc17IYZSHxpcqUpyXgqBSRwsjcFaGSrq8dYx0PqyU9OAcH39q8Pe8zIdTSveP8q/IJ5JOj5i
 2Om0fHQPr88voewuFPlNFApcjT0WRI9Ifji08AZqW3epgdKiR88537NZOfWyRBvGWcu6Hs7MW
 oCu6mSzaTti7ept84WnIofwaynplVTzQMXDWf1+r+FAJWc2lrvQIKN1/gZm24maRtd0TR8fMY
 lLpHQ2bjSNWUThekxkVsg03ZSQFCIdE8gwZhEEycWe9vrWNQYrwdHXVXkeJfUOardYKsuAsXx
 zOBiTYQ46KpUoMOpr/D8GiGMF6bqACbCrMzxO0PMDqtshzQhvOxIMX7HsERLvJQFiIirrZGEp
 M5fjq6/bavXTLWAfP62r/b4L7Ldj3Z3YOa/32eGRwhmiRYhyN7/tp9NQWdZmyEWRpCYOGBK2R
 7S2NlEM9uTV9VSg50AB5TAQuvvRPyEaHO+NAIcTxe8YIPqZnJ2uHJIhVwZz7jZV+NyautVxfH
 YCaapUHcGAud6fO4WfBcoRYgt9eXCwzGRuem3N0Zr1V9RVsiwXTgR1OeRaylqb8A3yVdB3krt
 VcyhnxXXlTonNor5Nk8OaZcQDAlAOr6xFD3s3xwyDbDJlPNB+NkmhIDebWb2krNik1a2T2dA5
 AePDxh/IjEDTDmsil218InsuDQ9i0XMMRQLTnkP/b7/NWVyb0ob/FexM3ez53mf7c4n1UTqwl
 yF+83NErZwKrEQpeWJB+EZ3QJrxw3gz90qOjwIJmeG/lL3HIMwruTM3IviHeMZL9G4i1dLkiO
 bre1B9agtnYt0EQ7In2mAwameZ1bW97HY0hVjP4bD8bm0yWmIQVhOX2SOcLxTxboFTVApLixQ
 +osf/7v5altynMuByMAgHE0Zm8AsttZJxwBISatKF8eX7WGqHdTWfSb2yIKp5jmVG1e+RdP4t
 ByslrWHZU8NP9YBoIwPmMW2vuITKrPAxyq2aK2Z2d3pwpLbrYxAMJ9HSRcBiq/F8IEj43uifB
 JJVJhd/PAFB0J37VeF0AVdWy4kYlUKt6Kk8aSuZV1oyzi1lkIG9CQ2OWwHoYy/7jEdhq4mrUG
 UmU/eJmyrUv94gTTIo110I33jHwS1+a7Uep92zen2X7g5uxB7LX2mlbMmjymaUY/tDPBBKoHE
 N+DuoIVtNYFTn74NQXT6ScnWIgtzvGDvgrOO6Kgt+OHQaZVANerKIo0oJp3cuep0OpYxu5XqE
 OD+2aDDZzfor09B0MBq6m0irZfq9ZACP5ZA4XMm21vz2JNBLmeuVj9Pg7+dmB2KABOI+O+nTN
 bPlkNIOEOXBeBgBNgAyUCE3xEWYqoFp8g3b5w+IrKyglSN1yEdGCELN8nTCX9cxE+Eo1gxfjF
 mW/l/52JKW0GdNzEXCN9omESbWnTDfNs7d0tKajyUZBLO7EEDxHyyc8K4mRoeNY0xEAJps0yQ
 /7cURzEdAzwWtYzH/q58EJQo1Dg0iovP2F41Ikav8go9f43RrhROvysfWNGHYwMxzxJBsCAUh
 habRQoJYpgaxF3qe5MBgx5Tl+R1/QxqYFPvRBVhn21zMQWc7zoTBarUlFpil7IXhIf6ao9zrp
 c9HWgUOBEJ6SshTUw8X5kMeOcxLIBIeb0W+Wav7+OQCI3fMgsPfPqgmg3hY/j/tO/54vX/pBY
 YLTugfrQqPH+94gNAT83FgWd3uWOpY8jrPUZkXZvePdMrpWwIeDhcImJXEXvWa6bb79FPvGB6
 lHpT1i8gVmwLA8l4dv4nts+eH9hwcj0rUoLYm5MuEQT9sebsTZUyIP9fXUglJDiDJ9fR0o/CN
 T+Fj

On 21.12.25 03:49, Dmitry Baryshkov wrote:
> Photos / scans of the mainboard?
Haven't found good ones where you could even see a chip (let alone=20
markings) in the vicinity of the hdmi connector.
> Okay, I might be misunderstanding something. What do you mean here by
> "gpio119 being used twice"?

/me trying to explain something and confusing people :) Sorry for that.=20
The whole dts has actually one place where the TLMM 119 is explicitly=20
specified, on the hdmi-bridge. It is defined again on the tlmm node for=20
pinctrl as hdmi_bridge_en (function gpio), so far so normal. gpio 119=20
(on the TLMM) is also defined and used as edp_hpd_default on the=20
mdss_dp3 node, there with function edp0_hot.

You need the hdmi_bridge_en and the edp_hpd definition in the dts for=20
both to work. And both use gpio 119, on the TLMM, which might be a bit=20
confusing.

with best regards

Jens


