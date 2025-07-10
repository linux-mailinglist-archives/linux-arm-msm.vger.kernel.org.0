Return-Path: <linux-arm-msm+bounces-64403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F42B0043F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 15:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 643A6167046
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 13:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE3E2798E2;
	Thu, 10 Jul 2025 13:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="r8CsVReM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ED6270EC5;
	Thu, 10 Jul 2025 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752155171; cv=none; b=HhmdKQpyao7DiEdFSDPcapxgcs9ZKSzII4YcDVbpcRRQ+ghtM/25ycg2wmeyDVUFqTr+jocLZpaBLmc+76AZgwanKb8uXEi2Cz6cgPweYUhXdHlGjPO63RhJQc0FgUZDJHyAWwlckLcsFO+TaPKrSYU93BJ3hAeceaIOgAieef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752155171; c=relaxed/simple;
	bh=NFPfmXSqycBTLuK5t6oHlpDPTEhrnlUyUghjlpQHWoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gNobPiwn9BRyI8u+J+LtRd18o3vJrxwXT7VRoeAmxjtjpBwbLkpSAIPVKD1U4RsYiW/0wZZpPLqpXw6YoXgAm9zmsFgXRQhO9Voc7iTrTD6KZEosQnTkEMaukRWcAcqbcnxXPfUt8S+2vwTJJHOgHEVcv8D+9yHxgS6HAMpp+74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=r8CsVReM; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1752155150; x=1752759950;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=NFPfmXSqycBTLuK5t6oHlpDPTEhrnlUyUghjlpQHWoA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=r8CsVReMWbsat5RQbCuYYfOWS2v4alN3u4KMUB3ZDC9ln1jCn6fsOABqTg+TTc4f
	 kzQhkptXtT/7rjL2v+vRnDs/veCpTacPZ38o8Wa/RlX/7YybU9Wqre+nsLPymgMWv
	 S4gY97NIYQFv4b6xfnPt9ZnI3perHQ7hHJ6mvMR2v/9rTFNX2eYOhEdryURY37an6
	 i6PLQBFsYC7SGjQkn4hX2LBQ6UtoLzVfw+A/zZfK0LONqa4BWvd00tLZHjutiE6GP
	 mWTucJW26916sVKCR+orIhqhOZ+JcvhPNMZW2oAeJm2QH1TJWgA56cdRVe/w0WsNJ
	 7//2tTCFSB6pTUUo2Q==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.107] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MuluN-1uqR2b33z9-016tqZ; Thu, 10 Jul 2025 15:45:50 +0200
Message-ID: <78880702-e405-4e9d-99f3-590a139733c1@oldschoolsolutions.biz>
Date: Thu, 10 Jul 2025 15:45:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: x1-hp-x14: Unify HP Omnibook X14
 device tree structure
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250710-hp-x14-x1p-v7-0-19c10c81713a@oldschoolsolutions.biz>
 <20250710-hp-x14-x1p-v7-2-19c10c81713a@oldschoolsolutions.biz>
 <aac2a4fb-c9e8-4e1d-b0cd-d6481dc27252@kernel.org>
 <056c3569-02d7-4668-89d0-91a8d92814ef@oldschoolsolutions.biz>
 <aa94dcb8-8a9a-407e-9bab-39a321a7136b@kernel.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <aa94dcb8-8a9a-407e-9bab-39a321a7136b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:5Du5I0Qk45RFJmrqN6l/3GNAjSHu8grchjAOSo/dOaYZ2z3nqCG
 9+xa9tzLo4zpomyOiGZEnwYteAloCFlSqjzV/fXs5RE7d1QMPkvMa8MSDJ8Xti8aepdXEqr
 0zQIfQLmUNUEL1VF2lQndcrjfDKOeHSGsUCU1ErWgPxgxILoMio3Lrt8EBwRTZ3JpIVJFvW
 TODTu7HQm2hlxNrOMXhKw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yQv6rHHJ9UQ=;Q9NVzaZSMNpt5lf4RBNZ9hRsXj6
 2XBGEQpcO742oLs5bTR/GN2FtWvsXQkwut7kq+2wcYmydSOhAaxFyyQGSskNeMGJ1ias1xITg
 w3KxhUeS+4Z5ej85i/FxPCEml8gRGfV8f6G1mrAX8saT9Y+T3fJtckMOMteBrq55yq/JWXPqi
 gGAkYyS3JAb2Q+5TetNct8ibDxd83FJdDw4SbO7Jv+2zoE58ev1wT3vD99lGg38UeooRvsOsm
 uZ4oC69xGP2yfaQXDi2NbiaTUFqaoQD+FsUZdIHEwTdHNFKo2tyyMgUg1zkN7z1c7jCrdBRsL
 Ad6ZapFoUOVcIuAoGswlWCJQGY8hblyt5Wjc3nbHuTVl/4S9I3HWrNK3zHb7fscOeAN6MIc2u
 +qaX/e9ybG7K7Zqp+LXNk+VRlRlAbSvebdilHwIHl0g7Fo5yhyIVW3fXK2XHE0eQTlOKS/FX5
 yZd/On2wp/7OSYeEfebpt1oDit5ksQ7xnhirmlrZz5KY9xfKMImDrdzmk+I3UbDLuLZCWBVum
 hh1z4jtlO8JbcGMJ3RPj9jQX45soTTF0bT95HcG/0X7Z78dfb2CAHDmwprlUlmMdF5a9cgmQA
 oJx0p60bqIFQb2MkBVQYuRkp/UFQ+tmLSP8PU+GIa06PLHthSXyasxxU4U/Ro0Myk+pBsDduv
 p/PUC8tw5F1c+VWZpJXoGFNeQpverycy4yXanGULfyFcnE1FJ284a0q4Eul+8b65b4swKOi0v
 XxgnxNlT4cf4s64hDVK/JiZrc9G9bmxdggvEQRpCHPzFJXObDlUkLj5Pw3AiLbPOBWE77LNFa
 sM+BtevxsnicyYTgdJZbz5LCjKsS3ggelf01K39LFNWJbXUP15as9bqC9bnQlKVZuob9IO66f
 sPaX4eRtzddNco8Fng05HWT+y9JElFcQ4ofybVUYUKuv6+aPhhMgSxySy3wOunRKCGm32E7wn
 jsBrqnReaHhA50t/+CyNYbvLhADdx/+mcH5fEiZvKPmIEInu3bqgCo4nd1TMeBmboE2yvS7Vv
 wsj1UIhkOQY+Su+3gGLfM7VjJq1pzoxp38+/G3V/+8GctIoOV7ftthcTmVfk2Y1fGRVMlwzXB
 tr4nxjmlxZqpAAKtGabA54TPNomKgKWO53K/u5KV2FbMcgLTi/4DNhwtQWF5naNIiJX45WWOc
 CiwDnn3/YKlABDpqrdm1b/rrosj4ibwaGxJ2nOU3VctgJkPwF87GTF/OOo53ApJttDBRtWN/K
 fnSOOGOg9f26gQ7nvM+k4Izx8LVGQ5MCVYa6z/tQ5oee7pxMOTmUSp+OZRtiGE0kkzf75D3Uk
 yah0WdGdXrnAeo8hHVoytuLL/H9DB4mqkVsoex0qK0Yi+xSmbh416u3r/wccIIgey3dWJVGIn
 aaV1ouPfnXtlZBB/J7TaZG+aOE8ENIrLwLCzJ4lCSH2yA5fb6rtRu8CoSbzqZiWmP7hc3bEdL
 4uYvvVBFBCQGNAGiTYVGIdGFtkfkHKe14Ytno2UkPx0VGV9OznJrjTZTcbOR3vnREf6dM7WzN
 0XHTnSBMVRlXOc3tJwyjtP5kQiaRgrAuYU+Gb/ulC306zJ/xBlovWHXx1LnKF2esgd8NdjhOz
 km8Dbp4/Tk=

On 10.07.25 15:25, Krzysztof Kozlowski wrote:
> It takes for me. b4 shazam -v6:
[...]
> All tags are there.
>
> If b4 misses it, you should add it.
>
I figured. Did so, actually. Thanks for your patience.

with best regards

Jens


