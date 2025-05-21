Return-Path: <linux-arm-msm+bounces-58870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB6CABF025
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 11:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFE731659F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B6C2512E2;
	Wed, 21 May 2025 09:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="ONGMrYib"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128F4250C0E;
	Wed, 21 May 2025 09:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747820301; cv=none; b=cGqZYNByhclJRH6bEplX8B6HPJX1DzuKi5LMTKBz4WAHVAReTr9dxvusKgKumVaI4YK4L+DWX+/fOz1whpnsg8TCZFE/FqpDxNSjy7LjLTz0YeI7jbMIZ5WJFfn/a9kj8/+h3v5sF5zfaepxalGjVHE6mc4G17O3JiFT35G/sOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747820301; c=relaxed/simple;
	bh=sN2Q9enEwjF44Vc0IzGcKmrBEuDT+LX8rXmGkj3fLUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ffuj5ujzMnvqlGbOVG6L5JInAVROhsGaQd/hbqM7yODxvTCCfY+ovtiXVqVRULUMzFnIDMq2l2mVhqMRAXz0aafqIW+TpP2fAI/GuJX40UgkVqTi5YB9XKipoMmakVtdgcV1pxo6Nz0WAQhBjFsu/gH3MD0ELXd/ylmFR4zO2G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=ONGMrYib; arc=none smtp.client-ip=217.72.192.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1747820277; x=1748425077;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=7VLMvy2/SiHpLHzXDbguzK+cxknfwXkiYEJ48cxEgk0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ONGMrYibtZPFPHn73ZQRyDXzsCevkdjGHMlSD1ilaMlW1GCkbKgIjVzjtLway87x
	 x3r4Ib1soAD1GwRo7d5vNQiL9lzGmvri7vu0C5Gg79hnc3ouoWAwIVjpREdWUI5MQ
	 mcgA0UC+XigfNyPFLIvhGvmaaC/fq5X852hvUx9f6CzTevvXSNN5xAkMBvP8CvQIk
	 LJLmZuIsNUPBSmxBZPJfcwroUH/2oNPskmpi2AjSfrIoXLbqjCLuv1V1kaU83erA/
	 ciu97pFF0euOumtp+qGMmOTs8RykdRdUDVbRnelqPOgVN4so6RlGO4IZE7R5Pcc+U
	 ORTMkrWv/vNqa/g6nw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.107] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N5mSj-1v25J02w4h-011uwu; Wed, 21 May 2025 11:37:57 +0200
Message-ID: <cb403a64-205c-479b-b203-0926389d34fd@oldschoolsolutions.biz>
Date: Wed, 21 May 2025 11:37:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Add Lenovo Thinkbook 16
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
References: <20250515-tb16-dt-v1-0-dc5846a25c48@oldschoolsolutions.biz>
 <20250515-tb16-dt-v1-1-dc5846a25c48@oldschoolsolutions.biz>
 <20250521-abstract-rampant-vole-5b3ee6@kuoka>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250521-abstract-rampant-vole-5b3ee6@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0YpkTuqDad5bigRrM8K4KvRNJrk+LjUZR18ae8RxPYlF1mt9w2z
 dNQsXQbtKlEOlYcM0fH7mJyufAxXomE53+HHIYbxUZy/+W1FlLOQxbGaAwJxpIxI9qOX43U
 5BaAMasOR21sSFcsREqGWvGsWyTXZ7ZqpUSYISfERuILy6aIIBHAxYfikpIw0hE5eO1NGbS
 7FSM84UAyhR1Iexliwhdw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SIBpl62xUk4=;epCa8/EZQNPnPo+qQp1jMVhHtE7
 ot9UcIdCbtb9Ykc9YTRa0OsHx82pl0POWeU+uSkI7s8wNkKtgx+7JDF3dh0xg27SGpLJKWXXa
 qd4QKoThUuoFMrhkM2TD8Bc6BD+PPzMlntOLcqxql/XFVHjB/gBPUf220IuR/j3nILbl8kZEa
 jNMSGWkgdhU8hh69nxNigavVYlRrbMg3Npola55DVDLzKFDPECjEWsuWvZE1SaZ+EoxVSxSZu
 JlbKj7YnvX2yc0w3Ai4o71YE0b06d0FjBJNvKkHIa2YFF6KTMBLr+4vH3fKCXiLPNdBMKM3Zu
 mEc1VEQmC30/4qmv6tQNugGkeBxkLkR3n+WqC1IOTClHEabiXNi0LLVhwvnP1owxj49e0Tv9t
 7mmjTJmGD4hmBtQFX+Z6UKGtFTe4rqrFrQJnHzDXJE1cF1XyDwajMsYoeDu0k6r39QLOr/Iy6
 S0iZrlIv5kkvQa69Fx5HKpr87H/DAfmgmJ5zUM2WceYRxmnmUetcxqh2q7TUGPPLMUadf2rgD
 q1uRRw9hLLYcMuBKePwHpVWFJS1fXZh/AMIG6JNbJ8VLLbzVZZgX4QI8FWoHrGmRVtPo++csK
 ZWjRuChdlXiwvX0J6ArCPpYqiFvOlaYWfWaqF5pueInBLDyE6lwe+rVqeDe0AIs4u2swHfMdX
 Z26lzHcqWFKaaYPQIYrI1lun68ZNayaErFWKc5s66u0hpe7U1Gmgv/Qik8UqX8CskZuJri1XP
 TF95Iw/tfZzKNGAeSfvRkIyzzzDtUsEt/jlS0vWVZdnJIpXbtYUv6A9EAdizF4wwrBjtI/4U6
 gpO4r67hbsexOJzpnM4rB+hBWd8r40sh9G9avzhwuXeDvlT30Gdnwvlrc5qW+tZ/plYiqkUqp
 BhDtO25okwVV5nNyoTaZvjigaJZsjTOvmeKcP8f0kvUSqUiy4Qs9k15iouAKHEzJr+/df9zx6
 Tzp5fQy7+VadzDMF7YfVMkYvFz3TjKSmnrhN5CR6DEuiAJAMnkZ9Ov+N/e39h2rl7r+AQ9wKX
 9+PixVXVozAvoaFgnjPWlsfqahn/TZU3OYENfn/qFy8HUls2twP6ulv695lwv/qZx/dIqguOA
 qULl470lZnJCUiq3RbzbQBuFOUcIqUXM6Fh8UYffILUyA3dR2GYqQmrjFwveIfFp6em7C5mMs
 /6cX1KWUFMcy1C9ANBTtApWQKsWLxJe+ymYicoLaq1JA4UQuHl7NLLi0si5cZuqBU1U9Tt7sT
 Csyb3U5xQYC/qmZbkT/hM7OV/egH0CBEXlh3r/SC+uf2S1zE/W4sO5G14gCg5I05Loscr5d54
 aRK7Rzx8cZyXktkP+Zmac7KkVqr8Yb+/X6Rf66kZzZd2+dhyHumxvF9bBQ6VcRayA0DsRaVak
 Uu1FRVKKZVaQKa6J1BW2OMMhv+aSQsw+oz50iVxzk9fNJlPgvrpClTUIJW

On 21.05.25 11:31, Krzysztof Kozlowski wrote:
> On Thu, May 15, 2025 at 10:38:55PM GMT, Jens Glathe wrote:
>> Document the x1p-42-100/x1-26-100 variants of the Thinkbook 16 G7 QOY.
>>
>> [1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7=
_QOY/ThinkBook_16_G7_QOY_Spec.pdf
>>
>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Document=
ation/devicetree/bindings/arm/qcom.yaml
>> index a61c85a47e2e759c7c86f3bd49f8597fc5054929..42d22e2fb7817810742a152=
26807bd6a984e6acd 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -1152,8 +1152,10 @@ properties:
>>         - items:
>>             - enum:
>>                 - asus,zenbook-a14-ux3407qa
>> +              - lenovo,thinkbook-16
>>                 - qcom,x1p42100-crd
>>             - const: qcom,x1p42100
>> +          - const: qcom,x1e80100
> You break existing DTS without any explanation in commit msg. What's
> more, your commit msg says something quite different than you are doing
> here.

My bad, v2 is also still wrong. Preparing a v3 which will only add the=20
Thinkbook 16 to qcom.yaml and only say compatible to qcom, x1p42100.

with best regards

Jens


