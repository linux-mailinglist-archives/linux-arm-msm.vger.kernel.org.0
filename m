Return-Path: <linux-arm-msm+bounces-112947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NCBXIUsOLGoJKgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:48:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB56F679F61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:48:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=HT4Zui4c;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112947-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112947-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E8F031FA673
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 13:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2448B25F988;
	Fri, 12 Jun 2026 13:46:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFEC1A5BAE
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:46:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271988; cv=none; b=GuY6YoF4b6mNnMQFQWhWhpTE37mkpkAxr7Du8BPO0ZiOKhU166o+slY4tJLuNQ0fWb4RCIarfqpOk5WTimgCRByt9y+mcjxVhdjQrVvIjNTadmZBc1q0EBGUC8R7MrIShm8yvuix3s52Xfp+BF1aCezGYYU+NJNQ+7mboGdY7Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271988; c=relaxed/simple;
	bh=f8j6pTQh6YCRHfsD/tvylB4gaZX50h6BTuMcY7i9jI4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=QASRz6EFDZtB+Zq7wX0yk6swYLmsE5hpOAZ6IWukACRx19hEotE45AKBDlCrJxRiKORhDlD06KM6aHC+d8n5FiDHMl8t7+HZ8lD5o/iBgtbk+gtuq9P3Wz7nZQZKFCm2F2NOk3TOK9hz6cXzvpv0kMjIxemWTbsGse8XlzuMPiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HT4Zui4c; arc=none smtp.client-ip=209.85.208.54
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso2307914a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781271983; x=1781876783; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylCRDVWR0E0OMduxXy2JHO34dLyiiO1L7Ze1awwPVa0=;
        b=HT4Zui4cT3cg+FG7kaRP00saJYnbrMS/19SeAguGZ7ETq8q0Tk9oZaYh394GnqrXBH
         RtqLYGY5DwGolK+RPfqJ2GZ3oBKlzDUOBY/Tp+/Pqgx4t98CBuGErJVKJRlSBNloLxCj
         UzYOeFpFw+7VUNatoVt4m3mcbEAdZgUVOxPiyJVO6DtnoOXAmJ4RSgnI+iqC7766FuGc
         peaaujGXIRKUpKV60dv1PclYlk14kJZn+wEH+x5w9grmuqz7x9OtBEW8FCuFDJWWS3cs
         u7JSg3QWP+ZuiXVbsVD/LMmkk18ZknbTR9bcqlhB3FJbVFDJmG2tuodiY7wTa+9wJ75S
         K5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781271983; x=1781876783;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ylCRDVWR0E0OMduxXy2JHO34dLyiiO1L7Ze1awwPVa0=;
        b=S/TxJ7XKJtcnx9L6IyxORgDMtRGBTul2H9Cp8vqtqkf2iqy9S3jk2zUZyzZvOspKpv
         b77IEBFouIjCObu7CK4qsScXzcWe3I00IRLiCB077arSG5TJQ/AK1VW5NDWvuMYyONR1
         iMIadnBWKIx7zc2bO4wub5YvvcXUPs0+1ToFeUQniPqWLJ4K6ZbVaezY2iqus0quj7ft
         9e9rrKnSy6r1kVntU7xLhTBm5VH7JtmynXxkNjTqmgCJdDVKhbEB81tXbEd50Fxu6rad
         paKbl+nFQN2kGEVhrFgVCA+lEllWbXAjmqYYZ6oVGk/weETzVe6ZNiDMelncmkWHZFik
         rOcw==
X-Forwarded-Encrypted: i=1; AFNElJ//bdpqXIiIS/9H5zi0ty5IvTp9gzoa0BP8LcvOWvfPbE949dZshgeZWO40B7bkqBiM97m5QPjD/IsMvhXr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4lfKQvkuVSbGpqBLlZx4gMTJwbOgYvPeMOBsiL9XOfh6PHnId
	baC6O3xX2DOGjpAFUDM3xAkUyS+HSQdUVaBpO0ED+gdvwEyxWP7yW+hv1vfN1G5a8tE=
X-Gm-Gg: Acq92OHvNSGDM2e6gSleA3tlkmzN7Dts9Y/qLqBCtQb/OK6wx2xs1otjtr4pXq9GzMo
	0SHUB+Yv4R1Xv5CtolxAi+jyBQcizaBFTXl2pR9VIExeMC8sZt/8syvj1AnS5CkKpsYSknWwKn/
	cMxizMXl7V7v1mLhEbKVJP56z45rhFwiiqyWvn4mIxXV4ls3A5hgr4CMKVZVmnH9BNzEcDfwne5
	xTG5VHULQ5wzPCrt3esvono3Py3dYmVlGEpvlJgeT0DwvWP8QL0BxtXfq7GqEvfmkBPUAJSfnc/
	a8OZ1JAz0L5XS9oqe5njpf3cz71S9cdLtozchXaWciU2gx4VHZyvftfx1TtbK/y8wxhqgpnqwyW
	qXvti/+bt2pspE16Ucw4zFp409Q21QNslDP2ZuQp8S726/B4Ewb/NuXcfwgWjGEQY8fi5FWgNS9
	bF1lpgYKIx2EkdWPlEL9Eb0JsXS43TBJ1pS1nRtt060jLOZhf3YpZ3dEiXGQCilk0CaSQVHHGrN
	0fIea01MXAmu0QnqSeaOFtcT0T99GlBwewP7w==
X-Received: by 2002:a05:6402:1f06:b0:687:2ab9:f4a0 with SMTP id 4fb4d7f45d1cf-69378daf678mr995497a12.5.1781271983463;
        Fri, 12 Jun 2026 06:46:23 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937948fc99sm682580a12.23.2026.06.12.06.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 06:46:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 15:46:21 +0200
Message-Id: <DJ747VLQEHIN.Q3SS1FFC9I3L@fairphone.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Sort pinctrl subnodes by
 pins
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <f05ad4ae-140a-40a7-a6ef-9ac2ddb0a939@linaro.org>
In-Reply-To: <f05ad4ae-140a-40a7-a6ef-9ac2ddb0a939@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-112947-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luca.weiss@fairphone.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,fairphone.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB56F679F61

On Fri Jun 12, 2026 at 2:59 PM CEST, Vladimir Zapolskiy wrote:
> As documented in the "Devicetree Sources (DTS) Coding Style" document,
> pinctrl subnodes should be sorted by the pins property. Do this once for
> kodiak.dtsi so that future additions can be added at the right places.
>
> No functional change intended, verified with dtx_diff.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 1382 +++++++++++++++++----------=
-------
>   1 file changed, 691 insertions(+), 691 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index fa540d8c2615..62daef726d32 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi

<snip>

> +			qup_uart12_cts: qup-uart12-cts-state {
> +				pins =3D "gpio48";
> +				function =3D "qup14";
> +			};
> +
> +			qup_uart12_rts: qup-uart12-rts-state {
> +				pins =3D "gpio49";
> +				function =3D "qup14";
> +			};
> +
> +			qup_uart12_tx: qup-uart12-tx-state {
> +				pins =3D "gpio50";
> +				function =3D "qup14";
> +			};
>
> I understand and support the intention to keep this change non-functional=
,
> but this pad "gpio50" is for qup16 also, right?

According to my QCM6490 data sheet, GPIO_50 has these functions:
* UART for qup14 (OK)
* SPI for qup14 (OK)
* SPI for qup16 (no pinctrl)

>
> Similarly pads "gpio54"/"gpio55" for qup14 function, "gpio62"/"gpio63"
> for qup16 function, I find all of these are missing on the original list.

GPIO_54:
* UART qup15 (OK)
* SPI qup15 (OK)
* SPI qup14 (no pinctrl)

GPIO_55:
* UART qup15 (OK)
* SPI qup15 (OK)
* SPI qup14 (no pinctrl)

GPIO_62:
* UART qup17 (OK)
* SPI qup17 (OK)
* SPI qup16 (no pinctrl)

GPIO_63:
* UART qup16 (?)
* SPI qup16 (lane 3) (?)
* SPI qup16 (lane 5) (?)

But the GPIO_63 looks weird, is the data sheet wrong?! Where would
UART_RX of QUP1 SE7 go? Maybe it should be UART qup17 and SPI qup17 and
then SPI qup16 ??

Can somebody at Qualcomm please check 80-20659-1 Rev. AM and maybe make
the apppriate people there aware?

So yes Vladimir, you're correct. Some pinctrl definitions for those SPI
QUPs are not defined. And the datasheet seems wrong as well.

> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Thanks for checking!

Regards
Luca

