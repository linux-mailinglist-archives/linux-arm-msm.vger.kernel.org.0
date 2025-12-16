Return-Path: <linux-arm-msm+bounces-85323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB518CC1B94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 10:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D58F53006D83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 09:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34FD30F53B;
	Tue, 16 Dec 2025 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HADoV5A9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ABA30CDB3
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 09:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765876733; cv=none; b=f3ByEz0Laof1aahkGXRU7x1Zq6ZyvuBLgvQcrCerKSqQnrkuisQeujNZUnBZ1BICaFu8+yK9dvBS+t2ULk5HBXNL3i3TMD72Q+sxJjObQ8dI34ofnIVUHv/vDVYzhDD4u0FpG7h0GZubMJ+dzcCFYzg71PP/zX6WBHifh/kLBBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765876733; c=relaxed/simple;
	bh=KcrNRtlqJchgFyfDgTBsbwObsDV42sBoW4pH25N/Sr0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=F0xEo/IlmYLra3BJ3lUU3FpvMmNl5sWUXR1P9tPZntw0s1fpq/ueexCXpX3Mx4SWmcx1IppC5fFSfiXbsiknqNIyqxrFZtFFvjWSVr5hARQN8y3sZj0MslwrQoh5QD7KdGPI75LZj3ayYVnHdXpwR7aEbUmpCH6mQ3hIflZsVM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HADoV5A9; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b7633027cb2so769768466b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 01:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1765876730; x=1766481530; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCeIHzlrw4s+P/LQ21D5cAkzliZ8F5VovdTUnSLrEPA=;
        b=HADoV5A9NrxhhcSwc7gvjzJrhHttUcApd01J0EjksXKkZ6LtHogExgMgnNgrhd7I7w
         ubP+bTPL0/p3SdYY8ameqltpzv1FjEsREV0KbfTR+YIxMtLzt5bzQhqkBXZHfr7VMeNj
         8G+JUtaRRH3aM5WEuAZz2UJhqDcqtku6tT25CxaZwBax34ixIowEX2MLlmtfdKXhnuwH
         V6x7k8Puok1LdJeXpRveMkycKyNDoUYugketFOR7bprcyqyoBQsJL7Mxh/O33J8Y+LNf
         eMHLDp1/xneDVfIc/zVpBYVoHKlv1eXlATXjndXFhPiXkJhY/7sI5ilKjV54AV2iwI6O
         MXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765876730; x=1766481530;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WCeIHzlrw4s+P/LQ21D5cAkzliZ8F5VovdTUnSLrEPA=;
        b=jdJ16RJ5kXJEmajyDNpL6LO3VfOd1AS13kx0mgL7cOaUN5q/aTuW7IIBJJ46txYrD+
         w7XbrZ/GX5UjHT4zEEN/a0IvlJ+VaBOoAwpwcLS61lAvcW6qpdMqR1ngeWDvfqsNF/Tt
         S8p1V41lagpRqaZTf2PyOD7LrIwtTImpZsueGxlIklLGxAO4Lf2S1r+m9BsuAju19v0E
         cs9fWVj+QSDtSIRVXChNDjVQCLb3sgxyHZaJqBTBFjKkPylRE6Fr13eY7OrUmBcdh5MU
         GrnlCJN/GzCus9o9PJoPoXLaYpJaaQrGfMAJXCbQywNr5oAIglNifI+v0RSrnMS0uo8H
         d7+g==
X-Forwarded-Encrypted: i=1; AJvYcCVmVarkXnLR0dHKDVmSykZGd3E/gIO38LqEvfGxTI5bzz88AtNUKqjJKk2CZl5R2RnYoAWGgTJjHy0Yzy/A@vger.kernel.org
X-Gm-Message-State: AOJu0YyU9u5TRpVWVapNqiBhPmB6K2tafYRGlmoB5bJBzh91dpZpw2Zc
	lPSz+h0VH0t5I7Vlg7aFCvh8F7TDsXrCupFw3aefUOLBPepCeAl4DfLRrMumqiRY06A=
X-Gm-Gg: AY/fxX6eEdc7/sYxL8Ixz8kokC28JpqC5lwYh4iLavovFawydxBXs8wKPx8QXJnBWfY
	JTqLRmFlPoyC+6Ziwc5NAG5RSfpBk1YsC8nzGvmwmA7U1k3qHIBNkGy4AIMQQVv9TQ+8sDPOuB2
	NJToe6DFm+VYnqEsgPZnxd+ZNDMC7ED6JQn51/kbP8RW6+ygcTwPXP26NZjsABFxXGDT2lj8Hbt
	qQikqvOV1Zp2Ym0cUYoJI/VuOQXS/S1HU7errmbUSIsfem0nOlhm9rbl/ZgThWMIrC3idCoADFD
	E2CWzfLDSM9Q5tDlTfT1cCIc2NStm+r63lARwUVINafFoe0VS84xvGj0roRgsOf+TgbNjoSXVkp
	9PFILKfG11VlbsMtRIWogCbrlZAoMHCjqIvWT0t4lmNWK6w5SdPTjdgwfjkfuPGMRnGmgCcaR1T
	Gv/44EFAT448wBTZm8JZ9Y+TMjPMaWB6he/UidCCRwQfmoCduCcO/t9bj+
X-Google-Smtp-Source: AGHT+IHINGYUZmHeA7dg/4q9ys2Ew9hupDViHJerxlWXBq4B4kuIK9ovYNtSguTZkYptqGzKZbPnaA==
X-Received: by 2002:a17:907:9704:b0:b79:e974:4060 with SMTP id a640c23a62f3a-b7d23a6f718mr1515396966b.48.1765876730106;
        Tue, 16 Dec 2025 01:18:50 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa57192bsm1603186066b.53.2025.12.16.01.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 01:18:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 10:18:48 +0100
Message-Id: <DEZJ21VS5IHE.113Y050QAKJZU@fairphone.com>
Cc: "Konrad Dybcio" <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Alexander
 Koskovich" <akoskovich@pm.me>
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for SM7635
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Alexander Koskovich" <AKoskovich@pm.me>, "Bjorn Andersson"
 <andersson@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251214074736.2147462-1-akoskovich@pm.me>
In-Reply-To: <20251214074736.2147462-1-akoskovich@pm.me>

On Sun Dec 14, 2025 at 8:47 AM CET, Alexander Koskovich wrote:
> Add support for the Qualcomm SM7635 SoC to the protection domain
> mapper. SM7635 shares the same protection domain configuration as
> SM8550, so reuse the existing SM8550 domain data.

I'm a bit questioning mentioning SM7635 in the subject and here, might
not be immediately be obvious for people that SM7635=3DMilos, but fine
with me.

>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd=
_mapper.c
> index 6384f271953d..7cc7f261f6ba 100644
> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> @@ -552,6 +552,7 @@ static const struct of_device_id qcom_pdm_domains[] _=
_maybe_unused =3D {
>  	{ .compatible =3D "qcom,apq8074", .data =3D NULL, },
>  	{ .compatible =3D "qcom,apq8084", .data =3D NULL, },
>  	{ .compatible =3D "qcom,apq8096", .data =3D msm8996_domains, },
> +	{ .compatible =3D "qcom,milos", .data =3D sm8550_domains, },

That's also what I have in my milos-mainline tree

https://github.com/milos-mainline/linux/commit/77083786532c6871e2a966aacd2f=
797208f27ae9

Not sure what tree you're using since milos is not fully upstream yet
(waiting for maintainers...), but worth checking my tree before
developing commits in your side.

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

But your patch won't apply to v6.19-rc1 due to conflicts so you'll want
to rebase.

Regards
Luca


>  	{ .compatible =3D "qcom,msm8226", .data =3D NULL, },
>  	{ .compatible =3D "qcom,msm8909", .data =3D NULL, },
>  	{ .compatible =3D "qcom,msm8916", .data =3D NULL, },


