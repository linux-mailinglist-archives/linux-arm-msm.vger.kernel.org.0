Return-Path: <linux-arm-msm+bounces-28709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FB9953C89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 23:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 035811C25732
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 21:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B1815098F;
	Thu, 15 Aug 2024 21:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m7mn7CNX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785A714F9EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 21:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723756931; cv=none; b=bnaxlcGtl85K7yWixaPLWelf945q/pPSA5kMf0zEDasf+q4KYF8J+VI6FcaOYT0ORXmN1J27/MgfkFJjMns4BXUtaZ5A+jR9VNRJCT/myQnM2S69NIO1edH5scT+AL1xt4KL8CptLQ40n8y5ZSC2pjh7etFX00acoPtFKWXq4gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723756931; c=relaxed/simple;
	bh=A+vHLOq9NoUqiwGSvDJziU1Zw0ojmmVP59Cd593nEz4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=EiYj5olKetL56qZlVmu5e+YQeK+MWaco+Tj6+cbJpi3RZhj+4GqbU1PgTfkDlQt05y8WRzBqUmAARfebkB8a40qZrOlpB0zjMPpO8eEDDr/LRKdA5vqDrTk0nhMEaazfyuFm4PYJiDsEoYJmYYk7WOdWT3AbnU3vsPFCCqDxxlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m7mn7CNX; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7106cf5771bso1174976b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 14:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723756929; x=1724361729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W+HlRIRUrdjlSp2NYKYzQJ+ulk8IynEJhfTRgCgAyxo=;
        b=m7mn7CNXLAnasUW9hyB0/X8b133pgdrhVCn1dHufFVTNWtolSesKyw1c7/cjoIr+Bz
         Zr01D/p6HIbbDGyTT0QNdTwI9HMs3umJ3De/pudbQNXzGtoNH0yNENa3Qb88ytneYznz
         TYlNrKahyWrJSCWW4Cw3McL9XCcADtgQY26WcFgTDRof4zAmAzWqIBSgE1hjcGN0Ex2G
         5Dk3xO+a0E4cypMd1TBs+SSvr8VJDJlcSRrKuboi94thbMtzG7mWTCAFFOpyCmY0ureY
         2BICxPDpgjrhuj0ZFwzS0wtaPOLRyfQQjnvCSw6/htACzrQpnh9AV37VZJDc8NGSP++E
         Wp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723756929; x=1724361729;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W+HlRIRUrdjlSp2NYKYzQJ+ulk8IynEJhfTRgCgAyxo=;
        b=NRM/7invVKrvv8Tgd7SbTNHojonicKxoD66VdYTAPg9pQh+/TQ8SwUXbD8/vVq2Qc+
         +NJG0o7X6pZ+lQf4Ml83/YqF4qwPMtM3aa8mr1RD9UDzd642FXUplOWn3fVT2cvrhTQk
         zJhQmfl+9+Jpq8Vbba+nMt0Zf3qYiwHWBgpLi0hgQbweZ2J8PGxZT8FsA/De3IbcM6aR
         rRACZv4wanXkgG+U4Ilj+Vb6Wr+Q2eEvvMoyvAti/MTHWDLFqX5rwgWL71BoinjCdwm9
         T29sOA9WPoSclsHepoDkGfdOQ0B4xnUapM9fOcmJdACFxGRfqP5osszAeL3HdgZe3zQY
         NbCg==
X-Forwarded-Encrypted: i=1; AJvYcCWCOUaY8ilZaN6sP1rptk+sU4vQWiMtx7nhUaGLWU/qe19b4PWHTyNn3Fw7rsEQgJIm1JGf0wGm6M2OYqQ/evL5xRZQiXlX3nIIrQYETA==
X-Gm-Message-State: AOJu0Yyf20giD4mIgeCHBb6N4dXb3RNjsVhf1mCNm0+r3IJ3NxJ6iEUb
	Ttb5FVi4l6+dvvXRb+AmB3HA4fNmff2DgCE6xYi+jT9qgFr3rzsZBIIWeu/Kp4k=
X-Google-Smtp-Source: AGHT+IEjbRaGmNe3CMocZq1XkueoM1d0mm223c5Hdq++AZRNRWY/2vq38JDRGMS8w3j6PQ63IeN8GQ==
X-Received: by 2002:a05:6a20:8411:b0:1c6:fc9f:eb68 with SMTP id adf61e73a8af0-1c9050638c3mr1180764637.50.1723756928725;
        Thu, 15 Aug 2024 14:22:08 -0700 (PDT)
Received: from [127.0.0.1] ([182.232.48.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add444dsm1479680b3a.15.2024.08.15.14.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 14:22:08 -0700 (PDT)
Date: Fri, 16 Aug 2024 04:22:03 +0700
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org, broonie@kernel.org
CC: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, amit.pundir@linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_ASoC=3A_codecs=3A_lpass-va-macro=3A?=
 =?US-ASCII?Q?_set_the_default_codec_version_for_sm8250?=
User-Agent: K-9 Mail for Android
In-Reply-To: <F07BF288-66F4-497A-A581-5FE4B7B432BD@linaro.org>
References: <20240815164903.18400-1-srinivas.kandagatla@linaro.org> <F07BF288-66F4-497A-A581-5FE4B7B432BD@linaro.org>
Message-ID: <18DCA30B-273D-415A-81EF-EA02CEBDAA94@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 16, 2024 4:07:10 AM GMT+07:00, Dmitry Baryshkov <dmitry=2Ebaryshk=
ov@linaro=2Eorg> wrote:
>On August 15, 2024 11:49:03 PM GMT+07:00, srinivas=2Ekandagatla@linaro=2E=
org wrote:
>>From: Srinivas Kandagatla <srinivas=2Ekandagatla@linaro=2Eorg>
>>
>>sm8250 and sc7280 have lpass codec version 1=2E0, as these are very old
>>platforms, they do not have a reliable way to get the codec version
>>from core_id registers=2E

I wrote that it looked good, but maybe you can also describe, why core_id =
registers are not reliable? Are they just not present on those platforms or=
 is there any other issue?


>>
>>Add the version info into of_data, so that it does not need to use
>>core_id registers to get version number=2E
>>
>>Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get code=
c version")
>>Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to acc=
omdate new codec versions")
>>Fixes: 727de4fbc546 ("ASoC: codecs: lpass-wsa-macro: Correct support for=
 newer v2=2E5 version")
>
>Which commit introduced the issue? I think having just the first tag is e=
nough=2E
>
>LGTM otherwise=2E
>
>>Signed-off-by: Srinivas Kandagatla <srinivas=2Ekandagatla@linaro=2Eorg>
>>---
>> sound/soc/codecs/lpass-va-macro=2Ec | 11 ++++++++++-
>> 1 file changed, 10 insertions(+), 1 deletion(-)
>>
>>diff --git a/sound/soc/codecs/lpass-va-macro=2Ec b/sound/soc/codecs/lpas=
s-va-macro=2Ec
>>index 8454193ed22a=2E=2Ee95d1f29ef18 100644
>>--- a/sound/soc/codecs/lpass-va-macro=2Ec
>>+++ b/sound/soc/codecs/lpass-va-macro=2Ec
>>@@ -228,11 +228,13 @@ struct va_macro {
>> struct va_macro_data {
>> 	bool has_swr_master;
>> 	bool has_npl_clk;
>>+	int version;
>> };
>>=20
>> static const struct va_macro_data sm8250_va_data =3D {
>> 	=2Ehas_swr_master =3D false,
>> 	=2Ehas_npl_clk =3D false,
>>+	=2Eversion =3D LPASS_CODEC_VERSION_1_0,
>> };
>>=20
>> static const struct va_macro_data sm8450_va_data =3D {
>>@@ -1587,7 +1589,14 @@ static int va_macro_probe(struct platform_device =
*pdev)
>> 			goto err_npl;
>> 	}
>>=20
>>-	va_macro_set_lpass_codec_version(va);
>>+	/**
>>+	 * old version of codecs do not have a reliable way to determine the
>>+	 * version from registers, get them from soc specific data
>>+	 */
>>+	if (data->version)
>>+		lpass_macro_set_codec_version(data->version);
>>+	else /* read version from register */
>>+		va_macro_set_lpass_codec_version(va);
>>=20
>> 	if (va->has_swr_master) {
>> 		/* Set default CLK div to 1 */
>
>


--=20
With best wishes
Dmitry

