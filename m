Return-Path: <linux-arm-msm+bounces-65377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C51C3B08510
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 08:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D3DC189B9E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D364121767D;
	Thu, 17 Jul 2025 06:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TYoW3SNH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7A3128819
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 06:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752734258; cv=none; b=sPfPCY9GNEs10CL8++HuEgK//H5rJDLIYYfCzmxr/oDFAnH49HFL3QPua4CFKMKjR7Ax5YV4YOWo113OAoOJL+Eg6NGt3NOv0ws/11h8d2fPmcYMukGOf2nq7kvPKgX+EnDFhh1wek7k1unkgoEC5fioHt8Dp1f412iXvI1LaTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752734258; c=relaxed/simple;
	bh=Zni4kW5i/r0n1MT3GlQi9RAdKp2l+BHLM9aozZDydqo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:
	 References:In-Reply-To; b=u9+XqJFa+praIzZAOkZi2xFlPXYjUOaFdidbAiY9yltuG5N4+xGTctC7XkFZl7OVHoQ68Zfo/ljG/PTRXc8444pWGv6jSrpwd6mGdWhd8rh17N4UdRwea9QCQaE5vSmA7vzye66IIMP1HINZc3dOvqq/UuwvGX4nurj8d3JZD/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TYoW3SNH; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so1077592a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 23:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752734254; x=1753339054; darn=vger.kernel.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zni4kW5i/r0n1MT3GlQi9RAdKp2l+BHLM9aozZDydqo=;
        b=TYoW3SNH5iZ8nWo5x3YTIv2lAGyP2cJ6eFc+4n5U1Mm0CtpMZ2YBnGkTRUOJpuCmdH
         Iy9Qsp2y9hjswmFtBWIDG4gENSbKZDCEFToVQNVboOnwURLu3W0Pa74dqbEnpjumkhPS
         unFI294L37Z4DL5MyLvyngf/SYv+7LCkQ2NRVj4V7NDTkNkC2o2797jd0xMNJ4vaOIYY
         lisKCrttO+Viw8XKylroIlqqZc8j0OP4Bzusq82RwxoWYWIc330OBtyxrAdne2CL8WZB
         Bq7w4r/+Qp27cctQB1AQ7vcri0NsSiCIVC7shsmk0ySJZ86NsjZp69cQMGQ6UKccLAaM
         nJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752734254; x=1753339054;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zni4kW5i/r0n1MT3GlQi9RAdKp2l+BHLM9aozZDydqo=;
        b=JTVOZtcF1FnFb2I+d2/YjUxbNZmgdqLfXr2fJOuOk7t55UI6JzQxgL4eRM48essIzc
         tqukEh4Zvo0z1bvE30oCOQkQIwWhYS2Id84bYbNT67IeG4EYMd/YN9XzOZEww2OVIeGV
         VVVzZtFYnz0+qCD3Qfu33+BERkbJFu/xNKl6x7y8AtC5oPAeFInYsZbSrGxOGEIa5weY
         V/xL1pbgw8zZ7i65B96dWvc538eEV1BxhKcBLoSsnOww7dNGhN/lPIAcTKtOiwxUE8qN
         3ePNLQKCk1rENTS0LRWoLU5snmLvbxaT8ZoOfAeImVgZbl1WHf3NtUDX24I4L70R52Zt
         PRbA==
X-Forwarded-Encrypted: i=1; AJvYcCUETegxelvMsrVfRZkmgaQdGsd7VD1HgO/bHwgQndb/0WoPMYK+1m+cvFdiUHHW6xttc6yDyRwNLEkr+WNw@vger.kernel.org
X-Gm-Message-State: AOJu0YwPKzAxYrLnJ7XWoTr6WozNZUXyo0HvVS3D2y/CJHsS3hSscHKv
	fClx2YXeAlj00Erg4IEcYUIyQdIVdEWA8OClEw/+v1nFw3HWFUbLyYedC9qSSxiqgb4=
X-Gm-Gg: ASbGncvXYO58x4kCImGqZVC+vvcaLeimeBLv3dMJrDXdkZ7D9HeyvsBI/vNQrUM6Cne
	TfzlYSPDOA4uRuKbU35kNVK3P2hL57xoHgnWsv0tzqzscHS68bOUtWaLaWcz3jk9aQ33qym1Nyk
	xLvVpSGM4F7sxW8l6HBB+Vz3sMtdKHr+JQl0QQbAEPLERhOx2eB/SxjLUzO5hgssGym6tj0ryZE
	yHlnx8HGJPfS38PHL72IOVeNtm7iQMhjzPdoK0O2LcVK/RPk8qLEQyszkrASHwCeznCVstLACdu
	JZUj6KlI43tq5qtqyrpaaX6oGpbKkCsW3NVs3wsVhhSoofd+h08g6fudWh8R+R4v0G5UudxWexL
	LTotwW5seLM1H3d6f5HoMyyNBTCi8RrSTVDLZNsTCarh5yWBHXFXePklV
X-Google-Smtp-Source: AGHT+IGz1stbTnvtFDRlGNi4Bv6lmWH+rbIuhvgmaYas5MP9Lr4lEhFJPcw6uCq9/uRql5jJ5FaC2w==
X-Received: by 2002:a17:907:a588:b0:ae1:f1e0:8730 with SMTP id a640c23a62f3a-ae9ce1c2d25mr614526466b.57.1752734253912;
        Wed, 16 Jul 2025 23:37:33 -0700 (PDT)
Received: from localhost (212095005146.public.telering.at. [212.95.5.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294b5fsm1285352466b.125.2025.07.16.23.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 23:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Jul 2025 08:37:32 +0200
Message-Id: <DBE4FRROKPLE.2O2PPHRU80073@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: qcom-soc: Document new Milos and
 Glymur SoCs
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250716162412.27471-2-krzysztof.kozlowski@linaro.org>
 <DBE47UNGCDLE.3AZF5XENB5BEB@fairphone.com>
 <7a552f24-50df-4c94-9bda-50712fc72485@linaro.org>
In-Reply-To: <7a552f24-50df-4c94-9bda-50712fc72485@linaro.org>

On Thu Jul 17, 2025 at 8:33 AM CEST, Krzysztof Kozlowski wrote:
> On 17/07/2025 08:27, Luca Weiss wrote:
>> On Wed Jul 16, 2025 at 6:24 PM CEST, Krzysztof Kozlowski wrote:
>>> Extend the schema enforcing correct SoC-block naming to cover Milos
>>> (compatibles already accepted by some maintainers for next release) and
>>> Glymur (posted on mailing lists [1]) SoCs.
>>>
>>> Link: https://lore.kernel.org/linux-devicetree/20250716152017.4070029-1=
-pankaj.patil@oss.qualcomm.com/ [1]
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>>
>>> I asked for documenting the Milos name at v2 of Milos patchset... it di=
d
>>> not happen and patches are already being accepted.
>>=20
>> Sorry about that, I seem to have missed that.
>>=20
>> However I did not see any dt validation errors with my milos dts or
>> dt_binding_check on the bindings, where are these patterns relevant, in
>> case I should touch it again in the future?
>
> There would not be any errors, because how these bindings are written -
> to ignore other, unknown names.

Ok clear, thanks for sending this patch!

Regards
Luca

