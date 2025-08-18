Return-Path: <linux-arm-msm+bounces-69602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F970B2AC3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 17:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4F5B1892232
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 15:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F29B24A063;
	Mon, 18 Aug 2025 15:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="jKvlJ7+3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885CE2475D0;
	Mon, 18 Aug 2025 15:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755529790; cv=none; b=trklgMuCRsvjbGTYhdhnlQktw58R4TJ6Lh7Csb089SnZMk7cD3zIjT7hzVxDf6wigx8RoxdZ1JuFHlS0zXCLWCEnmcwTPaZ0SbAf5Lvb5/0j3S8WLDsJj1BKgl7jVhnXR/Wx5xzDZDVLGUnUL3/aEOcwXy5nfFT6oM3wlIKjpqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755529790; c=relaxed/simple;
	bh=OoHXFBJs3RVvVXVOPPjCaOY3KuLDZHmwn39QnBYBxrI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=C7Wq0GRnQph+RMuGNYaTrD7r94skIBmTO4Yvw9ypmdXUGAiJa04rlsblIRyD/JwXgTfPmSpZ1pvHDeMpNvbIZbyjsux9gmLFF8ViVp0gzqVQ0mcLOCLeOjjJg3DRq91W6Kt5xJ/UOomEng0uLTxFPX466FGx8wxrWtmDeXWoxLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=jKvlJ7+3; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1755529770; x=1756134570; i=markus.elfring@web.de;
	bh=E+V/LOW1bu2EkeE4+U011RPBkrEzomVZMrNUq10cEnc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jKvlJ7+3xA5ENZBsH4aKy4YgWDmMal6TOB9ZHpkHo/DPPMsmfW6U2MzJNlKtzg6i
	 WjBxAGg2V62O/c4PpEmA5plIgF9IzJXmDirm5GWA0qhZVCbugUw8Q4wvDc/D2oRjS
	 jxhRd/4AGDYno0W3suZYFAE7nKmmeieZ98Jn8pDCy0yk903bewky5/bVMPZq3W6gC
	 sbwbEZ+WZ/dnnioQpZljc9LtTssY4o1zhDz07NAkw28qUQ3kUAbINqkdo3tdFRZ4d
	 gHRI6LJRTgfV9WxzTQEodSQmF66e/k+w4uJo3oh2c+4jcGYXuwYxR7mdp9sSqbFiy
	 webTNQFELSC1zcAl1A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.231]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MRk0W-1uyRcZ441y-00NC82; Mon, 18
 Aug 2025 17:09:30 +0200
Message-ID: <9c581f57-3fe1-4048-bdb6-bc5f403cd1f2@web.de>
Date: Mon, 18 Aug 2025 17:09:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250818123851.111326-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3] soc: qcom: icc-bwmon: Fix handling
 dev_pm_opp_find_bw_*() errors
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250818123851.111326-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eTQM9eQdXbiH6jdT7QmlWDIHVo3P3nFbci422XWyDrqXEucf+LC
 D/wDmNgBglNgoIAwaNMOexutPbwsSe7nFp4WDkTfAHtfOMbp2of7HhsYJh5ztLCK+TVqfnp
 o/4Ee0lHPt+qYseXahKy1dUJ1GA2yAVjpOHgTQsG4KJROJF0m9EfEBgGCCygmm3i4YIZAFA
 4lBKBM3H9qpeLggGXpjhQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pQkdtFHuP/E=;0D+0S0e95zbJ0xQhdq1p+jsCsvM
 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
 lEgd9FsI1nIpJxjo2nERSIsCOTY6yEn6D2ayF

=E2=80=A6
> let's make the code just obvious to silence warning reported by Smatch:
>=20
>   icc-bwmon.c:693 bwmon_intr_thread() error: 'target_opp' dereferencing =
possible ERR_PTR()
=E2=80=A6

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?


=E2=80=A6
> +++ b/drivers/soc/qcom/icc-bwmon.c
> @@ -656,6 +656,9 @@ static irqreturn_t bwmon_intr_thread(int irq, void *=
dev_id)
>  	if (IS_ERR(target_opp) && PTR_ERR(target_opp) =3D=3D -ERANGE)
>  		target_opp =3D dev_pm_opp_find_bw_floor(bwmon->dev, &bw_kbps, 0);
> =20
> +	if (IS_ERR(target_opp))
> +		return IRQ_HANDLED;
> +
>  	bwmon->target_kbps =3D bw_kbps;
=E2=80=A6

Would you like to avoid a duplicate condition check here?

	if (IS_ERR(target_opp) {
		if (PTR_ERR(target_opp) =3D=3D -ERANGE)
			target_opp =3D dev_pm_opp_find_bw_floor(bwmon->dev, &bw_kbps, 0);

		return IRQ_HANDLED;
	}


Regards,
Markus

