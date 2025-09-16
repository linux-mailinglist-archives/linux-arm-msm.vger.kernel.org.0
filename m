Return-Path: <linux-arm-msm+bounces-73659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C01A7B591C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 11:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA7EB485783
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 09:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73ECB292B2E;
	Tue, 16 Sep 2025 09:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FT/W+ex6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B2C2857E9
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 09:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758013677; cv=none; b=u18kiAPYBxLdCpv+kahkfp7roEXxdzS5Lirfz+0J/6SGY/RK2DIM0ZK+OpqjnqnhFgGE+9We7OxehIp7bfi77FaVL6NZ2oGS0u1o4ztSL45XPPZ3s/uJ3uIzwUSikTTc+/WU3LZBNCeQ93HzRkl4Kesn3l+flgztz4nRbI9reMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758013677; c=relaxed/simple;
	bh=fM1QW+UFz5zHOwXNyLvYeTnh6QmXecM50gjhKcitTM4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UYhqeURE/kYGDjO4AolWNFa7Jj9YFR5tbZ15iUeu1OwEvvtH9SkAmfkrBLiuEUAzlms+jfzgjHmpUu+wBle3vpGaX1COrhRV29UE1MOhgsrM9FYVTWWvh8/KDT5QALjaCsUgHSub7qdnWHbNQcQodZHXytF5yiOFwJrspvmbq00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=FT/W+ex6; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7a16441so778414766b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 02:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758013673; x=1758618473; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGPJfwEdnpfBh17k0uP4IdtgceOjAvM9dH/m5dD76YA=;
        b=FT/W+ex663OkQapBdsdZfiqLbYPbkbzVnog3Xs3mpz4Xgconp9x/dpGRHaPDtPNLW9
         ixh2cYtm4JWK60nHEFL7C90FMizD4O9NDpm0XgjKKbAKa6MQGVYIZKXtIyVNXEvXdPll
         xO78MacI3EikAFs5oCbgOJss/QVWcWRQP37/48n+Z1+GtSUaCGDnsrnrlVrWG8si7O1r
         94TOul6Ohbll7vJbAvAdeUmX/1lwebJ6Um7OcSVt28412nyHT+Czd6S3q0zXW3S+rlON
         zm0+nbxhnU6V+vNzOee64mcGan0mFlRda++wgZ4vaBj70pcHlZQrlVQPf/U9b0edpf2T
         khMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758013673; x=1758618473;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wGPJfwEdnpfBh17k0uP4IdtgceOjAvM9dH/m5dD76YA=;
        b=u3xdzSZnEnPfhoFScksss1kGE2wmo4hokqJS5S0oSctOzlSbwxUYb4lU/hcloltcvl
         2QwK+QR1LYtco+G0G1ipQ7aBb+aB7RTypWB//VoPJpxCUNtuH+pe9fl/o54ONEJXQCgV
         UeP/s04AujUDGPDpcWJQ5uH+1vRcFnQoQWalVfRgryxcTjSZduwERF8OCWOfyCVWVp6P
         F89YW80xhPcJvCYJWxi2HP6cOTJjQlIYOyKPyTlPuMdZqHxB/tUW4KCeLIZi8PkfzXLF
         iTcuPR3RkELvcWFwXrjl0T/A5wBblYACvpEoX69pjStuuRFKxRHSHCv6W2cimSzs7QJU
         we8w==
X-Forwarded-Encrypted: i=1; AJvYcCW1x5X/Wm/Il36DD82kk0pgNL1ftGGNVGQ0B7VJfR4jcEh4ENAw1Ko3Z140VGxVFKZIEdlUbtapaWOfHrxZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxuaWPLNjsONcrsM1YDDtpcVuUNapA6Yvti/Y3UMlG2menaT0KF
	1h82k2s+BS3RrJ9gVZ3xfUp02Y6jjjX1OWoBSsNaO8elUHpgVDq6elvmT2aINukEF88=
X-Gm-Gg: ASbGncuns6k4RKHyiSrv0//AwB381bpRPUgMxDrSr+6/mF+WYfnI13Ss2LnKl4a98Iw
	FAIVV0MXQUeMt1L0dFGTTaAuIfDj6iggiSdSCnbFYr3WddC1hLVwuSPiSI5i7Dscixq6OtoDVXb
	CBRYUVrgeDJKjhSJSsUkdsiTGZFNWT65ZUmlaYGTREqAQSvwy4JomyRWyY8R8hZVFmsSMhsq45j
	g3iRda9znWHaxgc1QYjuqOCLlIF311bTtxMSpcvS0so8Dxp1tUplM3g9o8ia4yFnuP2FzaQ97VT
	brnUQhccq8rq3y7oHoJtTHJDtkQDCX0vvMHNgofJBtj27rzD+BG2dlbQn3c4ADgUC63J45g2NiK
	vZGMnfH2yadU36L6OjsbBF1ElQTkL2XPEgrLXv/Aq+qCOHRPEUR+3AD+8CS+udA7U3sTZ
X-Google-Smtp-Source: AGHT+IEnV71DLjZiRWk5j6jXx0pnqls19vN1Qen2T1tQxSI6t57/t1s9FzfJ1We13UaEvDdr4m6msw==
X-Received: by 2002:a17:906:6d13:b0:b09:c230:12dc with SMTP id a640c23a62f3a-b09c23013dbmr778396666b.8.1758013673277;
        Tue, 16 Sep 2025 02:07:53 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07c7159e6csm899506666b.33.2025.09.16.02.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 02:07:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Sep 2025 11:07:52 +0200
Message-Id: <DCU3U3SF3ZRT.ATK17JG93309@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH 0/3] Fixes/improvements for SM6350 UFS
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
 <DBDAMGN9UQA0.J6KJJ48PLJ2L@fairphone.com>
In-Reply-To: <DBDAMGN9UQA0.J6KJJ48PLJ2L@fairphone.com>

Hi Bjorn,

On Wed Jul 16, 2025 at 9:15 AM CEST, Luca Weiss wrote:
> Hi Bjorn,
>
> On Fri Mar 14, 2025 at 10:17 AM CET, Luca Weiss wrote:
>> Fix the order of the freq-table-hz property, then convert to OPP tables
>> and add interconnect support for UFS for the SM6350 SoC.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> Luca Weiss (3):
>>       arm64: dts: qcom: sm6350: Fix wrong order of freq-table-hz for UFS
>>       arm64: dts: qcom: sm6350: Add OPP table support to UFSHC
>>       arm64: dts: qcom: sm6350: Add interconnect support to UFS
>
> Could you please pick up this series? Konrad already gave his R-b a
> while ago.

Another ping on this series, haven't heard anything in the last 2 months
on this.

Regards
Luca

>
> Regards
> Luca
>
>>
>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 49 ++++++++++++++++++++++++++++-=
-------
>>  1 file changed, 39 insertions(+), 10 deletions(-)
>> ---
>> base-commit: eea255893718268e1ab852fb52f70c613d109b99
>> change-id: 20250314-sm6350-ufs-things-53c5de9fec5e
>>
>> Best regards,


