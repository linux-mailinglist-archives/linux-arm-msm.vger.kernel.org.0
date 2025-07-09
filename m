Return-Path: <linux-arm-msm+bounces-64226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE66AFE872
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7F7A4E714E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BDC2D8362;
	Wed,  9 Jul 2025 11:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Nk5LU/un"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DE62BD5BC
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752062173; cv=none; b=o50XCcxEotleSbM9ZuD43Zgb9qNkO7r83Nt5vjtoRU28fpUrAnqSce3imLRYXJ4F8owV1MWzQlo26pXIG+HacdMTpgItz4NdY7lfl11oIcnrhcGUaz4NxEmv7CgQCGNH9d0Q0zNDRwk1olB9Cgh/hUU8voIX/luGxp0ibif3Plk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752062173; c=relaxed/simple;
	bh=vq5TdR2eOaZQq4wzgDb/MUODx9FACB9AhF7YRu/UXj8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dpMiIxPcvheGqYrxe9yLYmTEI0AlMrjgqqtXFJ5MqBzuBnt8bfcVtFKi4ZNHk801/RosR/dlowqzmqjxMVJhywxkJ5Y5yQ8I0RJlUb4qnzgr8dlPWqFfUSf/A+hW0Wuwew3DVA84ow6Y3ZFMWUnYywZEBaBkBgkWoCihNV4t3rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Nk5LU/un; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so1124051566b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752062170; x=1752666970; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vq5TdR2eOaZQq4wzgDb/MUODx9FACB9AhF7YRu/UXj8=;
        b=Nk5LU/unA3B4/PoWsjaeQ0G84+QYetFfFXNnyM2xLEPwM5f44Ekf3SBvG97fEPruyw
         D+RMfYu3yYQf5yl1InGmEwWF86oEw96mDQaHWLPDCrt3GwThX64lC/hG9HX3ke/nRj4k
         JafEfprqmZRDsoRsQOD1orvsXmm85bKd/xZUHELyC9kjAMVsfx6SW1jYi89wiQO8ePp5
         BuJG0Zb6RGPSz0+b7jLlZ93sJ0oAOpel6SDgiRlApvgYII1KBqQh+zvwIqrRB19Uocs0
         2l6jMoFTI+wV/9XHm5PZW/mHKi6aDUFBMkk5Vh8xwfPPh0tDebuyjsnCvmakbZ++iWrJ
         4GiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752062170; x=1752666970;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vq5TdR2eOaZQq4wzgDb/MUODx9FACB9AhF7YRu/UXj8=;
        b=YvMwV6HZuGmWzPNNPL7ZPtL9wt2ZbHpG7gY6orBc5HaaAZlTwgntQ9B6IADnDsfZBT
         Vf+CtnQEli0k6GB9gGJ+hZfEz9tf8HB6CY0JdgFCbtB+8eskgy/MMVD9bmcqLAr8yFMO
         m/bw9fBIyKfZHDW9rWIAE9BC4VQkw13gSXTvnC+hIdws44qHfZl8kAHMedPfOiGITffg
         6xjnnGVgNY/JMPrjTmhvK39jKd4TQfyCzpCcMWAuq668wcEKYmczA5D9x4IdoZvzD1Lp
         edSjJ7rvQcFdFjjKa5JHlYAFulIfSfl5cj5K8T6bOuhZj1Ba5sev/daxk/I8zZck25SL
         Dvmw==
X-Forwarded-Encrypted: i=1; AJvYcCXrkO6PESmT3L3ZI+sHUYPTrnIZWWXLOAiswZWEszpNTY6jRhhKIuvXr4R5+UZ5I+rv727RptDC/RON9UXA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0lO/Nq5DVtd4E6jYxmvbfqssJNakEyITgET/FmJnN7ZHGgHor
	xwEknyTD7F7tlMtInZz9EtIqdpvW9yWR2k1euc2XbQeoLtUTtz8HE7uMasUnkYmUfas=
X-Gm-Gg: ASbGncuWJdAcIMAyLNHGcbpxMRojghfoZzzCpIiu7mJcwvYV9Eu4QKZo8t7Urix7qGm
	5HFt8JinQJhJsyfZ/UfC4vFmhMvPSeBayn8xmGPIsmUov7rwvWNSWq77m+EqBFltGsmYkz2XofX
	Chzw099WUVz0msNIq8GKgHenKBaine405J6RUDVHvM/AJuzx83E4sXiEwBrh1v9t9xtaApENHEl
	2X/I1+oIRXbpya8LeN+ajMhtm4qMU2+TRvvY95m7Nw7egr4cFM5GWftcwzBtSxr6FVKrknl8Uy/
	cx6PT3lCXSSk3J585sJI7kYeP/ZXoWHmQHCg4uqE26IGmKr/yONhQZTp6P9v3VTg/84FzQzBpQo
	Q8KLQuQ3hmP2eYgn2o0YSjkUQQhCa+ug=
X-Google-Smtp-Source: AGHT+IE2lZBOcPVAhbCa9Rpom0DV95oxei90z5HkhH9xsj7T1YUJ++qd0fI4HdkMjuB4B5bxAz52+A==
X-Received: by 2002:a17:906:c152:b0:adb:2e9f:5d11 with SMTP id a640c23a62f3a-ae6cfbe874bmr232648366b.37.1752062170333;
        Wed, 09 Jul 2025 04:56:10 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac460dsm1094703366b.106.2025.07.09.04.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 04:56:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 13:56:09 +0200
Message-Id: <DB7I7D3P01FF.3T5WRSTJIWLVK@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/4] regulator: qcom-rpmh: add support for pm7550
 regulators
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com> <20250625-pm7550-pmr735b-rpmh-regs-v1-4-cab8ef2e5c92@fairphone.com> <bc27209a-e0f8-40bf-979f-3d747c501ae8@oss.qualcomm.com> <23ae6ddb-682a-4c4a-bd63-f0a1adb6f4f8@oss.qualcomm.com>
In-Reply-To: <23ae6ddb-682a-4c4a-bd63-f0a1adb6f4f8@oss.qualcomm.com>

On Wed Jun 25, 2025 at 4:20 PM CEST, Konrad Dybcio wrote:
> On 6/25/25 4:10 PM, Konrad Dybcio wrote:
>> On 6/25/25 11:18 AM, Luca Weiss wrote:
>>> Add RPMH regulators exposed by Qualcomm Technologies, Inc. PM7550 PMIC.
>>> It has 6 FTS525 (FT-SMPS) and 23 LDOs with 3 different types.
>>> L1-L11 are LDO515 LV NMOS, L12-L13 are LDO515 MV PMOS, L14-L23 are
>>> LDO512 MV PMOS.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>=20
>> FWIW everything you said in the commit message is correct, but I'm not
>> 100% sure how to map these LDO types to the existing definitions
>
> OK so found another page (also made sure that the supply maps are
> indeed OK)
>
> SMPS is OK
> L1-L11 is OK
> L14-23 is OK
>
> L12/13 -> pmic5_pldo515_mv

Based on what are you saying that?

Based on 80-62408-1 Rev. AG for the LDO515, the Output voltage range for
MV PMOS is "programmable range 1.504-3.544" which matches "pmic5_pldo".

But yes, in the table next to it, it's saying 1.8-3.3V, which matches
"pmic5_pldo515_mv".

If you're sure, I can update it but the datasheet is a bit confusing.
Let me know!

Regards
Luca

>
> so please update that and add:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad


