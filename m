Return-Path: <linux-arm-msm+bounces-94548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4L2tNkoWommizAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 23:10:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4387C1BE8A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 23:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8DD531A96D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 22:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481F7478858;
	Fri, 27 Feb 2026 22:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="krn+TKrO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAEE47AF4C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 22:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229946; cv=none; b=rSspOiOSv8UK/oRUFREWoRFgJuI2gogEYv0W7a6k59qxkKfdBQkEFaxqGnRlqjvqnx1X297F5jfmruyxnphGWNrAK1Ru67sYv61IBWvyBh+ylelxf7WchfGZccBjZGymierPJ3JWqwvG3dkjz05TkZuKbcYEMHnyEondjuI+nL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229946; c=relaxed/simple;
	bh=Gb6QcE9aWdGZHOycjMfnRVrXJxZtn+RbpOpm64+TpQc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wbd0VrJzS+U/DtBLamS1SRi0l3MT4pThx+ulf2KgExlT+m1bQDcxZBEPyIQQsUr/gCo0KU66e10NMZj5tyjeVwfSxU27yQNXJ2yt1uvrNbiZy4+AKIEqHWkPRBcujgGZM+DRcA+XUe4ubpxaOTjci2lyf3iVKJKFnTaDFBZP+8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=krn+TKrO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806bf39419so26264305e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772229940; x=1772834740; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4JMcfUdK/nUzNjmnLhc+bvOBnyXoR2d2FLx4EtX6jrQ=;
        b=krn+TKrOU3HnqkakNzoqDwrOdJEX7JC2ghY4PugqZBTlT/GGRbRooh/6Oc8NR59y/i
         pAORAZY6QmXZd6GPc5/HovR0ciI1rwvCEqY2vzbgaVrBxa959moB3qPbE3Sazn8bvmwi
         mE8B9OK/5pOyKnXBeRUt+Etu5KXZABUJjlshNuvC206YoKp2kqIp9baaT1bcv1e7kHJv
         0988yw8J32p+5KckVtUTEoFIv4Cjw2Cqz9fKqBXfkqzA9CZli4mtAngOq8fYJu6XZDCx
         7TnuAVnhiLSlfMMHB/lfQI2F3PU1vbDfZD/3453IpXiOrH5Cqk+7HEVTx3aNtjh4eOIh
         554Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229940; x=1772834740;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4JMcfUdK/nUzNjmnLhc+bvOBnyXoR2d2FLx4EtX6jrQ=;
        b=H+8Kq6JvsQls1SCbPSOr5dQttUELztUS2zH22RPsEQ5VsmZY1gs2Ki3E/B6S4UNxJ4
         j+3fa+M6xNOiIZvzh1Cbj2OJd7UB0PB5jzSPy21Lz1EYNgrRYHC/Qr+/e5/s2rYNmSWI
         AuHwtTsciFlEGHCC5SsLdW3AcYu0Qwr814ndCeYii0GgSOSBTTwqEto7A25EF7f7rbCZ
         C6EC4M///AndFDjpqwsrkgqL2HKFmyiLgQY6dXg4t1lqAS3gI+nq4gEqJB8k794jnVja
         N/tr9tjsYGVfRbvZMWTVrK/wzTdhd8LEcTl/yrWOXXXrZNoA3h2z/t9tj0GP0TiA3wcK
         Mlmw==
X-Gm-Message-State: AOJu0YyjoZBVCXXlYCIUYQNlOZh8Fge1FRn1NWA1MgrVoun6CTh/Y1Lf
	reiSjzp7cQjnwWw90C2a4buIwdlVdwDifKbjxggisaW3lJdDhaXjY0ZVXY7eJTUE8wo=
X-Gm-Gg: ATEYQzzF1AiWFcfYmsN3JM3B0R3bXCYLXUQfvoMzQm+2ZSo8KYyv7mtCzUuGL8unQpd
	hPJFwU6MYW3+wTe+h0z5LiwDkcok9E4xXjshO5y4/oJooHqq5DJD/x1r8lZ1fRIm11JzRO4VaJe
	UhENZ8yS/r0vX6pj9QsfRyNPMgFEsmeyUz7X81gG3PgiWwnA3U93EY+9AeySMX78kq45As+4pEE
	zT6NZ6xp64LFkCN0r5ihZWf3SbpqTYGnXRWXph6dt84A+oKNv51EZK5OWpjFCk2i00OiL24lHjL
	9fw+hIqnSexFoa8JfsEwRUMy6RgwUI9pOSqxlixPvmA/HX2yiywAoHicsyN4fOrRKq8X9UclTOh
	PEIJsJnpkR/W/GhMXY++iZmal3fCeBJwo6uJ92sSjjfZ2iCcq0s7p9rOQF5qf3jkQTUQDI6EFN0
	LRDdOsmrWYl+kNkw4lryGxC5wOELs+9Zh/dW+6/4dZRuLXPO6PZurSOWDo+M0SZVXO5OE1JNkW7
	yYUG5QQoeTkq9sDWz9DolbCw3T06nVYxtk=
X-Received: by 2002:a05:600c:1549:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-483c990de68mr72621495e9.8.1772229940362;
        Fri, 27 Feb 2026 14:05:40 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c765c67sm10252283f8f.32.2026.02.27.14.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:05:40 -0800 (PST)
Message-ID: <a90ab7f217e3d2ad4ac9b926fcb5c9d8a6ce43e6.camel@linaro.org>
Subject: Re: [PATCH v8 12/18] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
From: Christopher Obbard <christopher.obbard@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson	
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert
 Foss	 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho
 Chehab	 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue
 <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Konrad
 Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 22:05:39 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-12-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-12-95517393bcb2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94548-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:mid,linaro.org:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4387C1BE8A8
X-Rspamd-Action: no action

Hi Bryan,

On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> Add pmic,id =3D m rpmh to regulator definitions. This regulator set provi=
des
> vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/q=
com/x1-crd.dtsi
> index ded96fb43489b..c89f5ad0aed56 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -865,6 +865,36 @@ vreg_l3j_0p8: ldo3 {
>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
> +
> +	regulators-8 {
> +		compatible =3D "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id =3D "m";
> +
> +		vdd-l1-l2-supply =3D <&vreg_s5j_1p2>;
> +		vdd-l3-l4-supply =3D <&vreg_s4c_1p8>;
> +		vdd-l7-supply =3D <&vreg_bob1>;
> +
> +		vreg_l3m_1p8: ldo3 {
> +			regulator-name =3D "vreg_l3m_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1808000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4m_1p8: ldo4 {
> +			regulator-name =3D "vreg_l4m_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1808000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7m_2p9: ldo7 {
> +			regulator-name =3D "vreg_l7m_2p9";
> +			regulator-min-microvolt =3D <2912000>;
> +			regulator-max-microvolt =3D <2912000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
>  };
> =20
>  &gpu {

