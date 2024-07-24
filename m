Return-Path: <linux-arm-msm+bounces-26939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 592F093ACB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 08:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15A33281EA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 06:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82EDB47781;
	Wed, 24 Jul 2024 06:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="LuJLgjYJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC08D4D8A2;
	Wed, 24 Jul 2024 06:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721803060; cv=none; b=pL6By0yRUlSqOaIAdO2qk7aGrJm/AlMk8uxm7kujcrzujNU+jOsYi3qZNra63z9m0Wf6FMxZWrW4SqFb9hfa61s3kwPg0K5XqdJhHrT/tDkDOlISYaAyUqrV1oqu90nHfuHQufTxBFCgdr5KMjXUwxGZg4nnP0N9zX2KPxPgEiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721803060; c=relaxed/simple;
	bh=RTfGj90i3WLbh3f2b+8wNedcrh/JEyZm49rReFqIDTU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ThgkoJcWIZDYfzSfZmwO2qaRKzo88mDKXAvgFf5leK4xXsRrDGXJyX0W8HPcrNqzZwuP/vZedgH7OxKqRxeAq/xC92tz6MQewRghaWbddsS97eMrXNV8nOAuVtOgpvpxy5KDoCS8urj1JxDJCV75br1G6Tm9rwU2PV6Z6Rf5KII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=LuJLgjYJ; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 8BC4C403E6;
	Wed, 24 Jul 2024 11:37:34 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1721803054; bh=RTfGj90i3WLbh3f2b+8wNedcrh/JEyZm49rReFqIDTU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LuJLgjYJ8PSdwTOGbnttijbiGp/xKgyy+uDlIE8lSS7bx6WA3hwZaF0H1oGRbfe9L
	 k81v38Eosxmx0q3H5+leZVYKjCSqxO4Zl1pAnAEfNhTF5Tz4utruKjGqEwML89TIrN
	 k4nemddoLnEPQWGhLPyYjw0dIM68pYPS3J5bnFygfIy0+3pAGONFkeeYwckWEE8nJA
	 bECzoATBXfN3kIKucp6Pk6gE0yD115N2KxfO23gO43FmcfocLBfWkUmbldeqE0Qm3A
	 aRJaG7yqJDRno6HjypwbjXMMNa3ec5aeCPBpSScLZ45ndY/D83UgSSEz+nN7udeXfg
	 67pN4OCQbnLNg==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jul 2024 11:37:33 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Add msm8916/39 based
 Lenovo devices
In-Reply-To: <f8c36008-0deb-41b2-b51a-84de84312bb4@kernel.org>
References: <20240722-msm89xx-wingtech-init-v2-0-0c981bbc5238@trvn.ru>
 <20240722-msm89xx-wingtech-init-v2-1-0c981bbc5238@trvn.ru>
 <f8c36008-0deb-41b2-b51a-84de84312bb4@kernel.org>
Message-ID: <d7ce2f303d6d6faf0d9839ceafb9eb33@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Krzysztof Kozlowski писал(а) 24.07.2024 11:23:
> On 22/07/2024 14:47, Nikita Travkin wrote:
>> Add compaitble values for some variants of Lenovo A6000/A6010/A6020
>> devices. These devices are based on designs from Wingtech so use it's
>> vendor prefix and part numbers for compatibles.
>>
>> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.

Oops, sorry, I indeed forgot to pick up trailers... Seems like
I made a mistake in my usual process and didn't flag the tag mail
as something that I still need to act on :(

Will pick it up in v3 since I need to do changes anyway.

I should probably write an yet another automation rule for this...

Nikita

> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions, under or above your Signed-off-by tag. Tag is "received", when
> provided in a message replied to you on the mailing list. Tools like b4
> can help here. However, there's no need to repost patches *only* to add
> the tags. The upstream maintainer will do that for tags received on the
> version they apply.
> 
> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 
> Best regards,
> Krzysztof

