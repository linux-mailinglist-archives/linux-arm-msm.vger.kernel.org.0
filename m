Return-Path: <linux-arm-msm+bounces-94544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHnXLfsUomk0zAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 23:04:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DC91BE6D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 23:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 840E4306CDC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 22:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BF03191D4;
	Fri, 27 Feb 2026 22:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yLnJzUJc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F34E3128AB
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 22:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229834; cv=none; b=o0oqx13RdNUJPzFYq5GThLEgX2IrjG8j+HF8/BdZo+B4LXSmO8TjcPCoI+p8gLJDVyXTU7+KfS/OG9cY6EYGeQckl8v+0xa1CVlbN18NomO6QsCZMQ9Bq5JLjUS11gQlCOCZtjwXScujFrRdXiDR74EtI6qzLhDHOeJEkrmdGaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229834; c=relaxed/simple;
	bh=luIj6BR36tQU2HyGVodtszn4i5/No+68y/na6FloQMQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qoe40kzBMXrmKlwv2qyMFIWxJ7vAUDC6FxuWHXO4G+xeresCiQlxso9GyCMbPdkvUUjowfviiGqMvwwn1TD9XlffxSRRIlyT+YVfqAgLM1XeZ4/mxpzFh8gzLbW6vqlegyMrpMXfckUaY1ZCi+vUlp68h8sJRzbhXPQcmxcTLDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yLnJzUJc; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4398f9e3b40so2645140f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772229831; x=1772834631; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zuSGsJkIR1LhU/dNFIV+PKzO73brARcfdXQ3T/xnWJY=;
        b=yLnJzUJcTTIj6PKNGJg8TiVa0TBAj3pL5ql3TgEZh2iy8DccZoZT1Uzk9rjJkk5YK+
         CBzxKtGOinQnvTneXCgQoWhgiW7qJxt92WN8gFAFAd3Yx4r8WV9PMNBIDQoP87yft02y
         j5DEwQMeHQKNpJqsptQxc6H7RNEvvl/44rZ8w2n2mux9IWKCwDID/1lEcX/0iZBNNsIm
         XZDl84B6VSYkX1L2/Xtw/c86JsL6c8cLlw4UjhMVshBZFJTRmb5JsnntEnXDdbNRIZac
         nK0Azc4C1esDGkoHc+M1ft9t+KSGHp3p2c9c4KAn3mDRQtdXtpFvd6JR7guZG/0SkDGo
         m7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229831; x=1772834631;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zuSGsJkIR1LhU/dNFIV+PKzO73brARcfdXQ3T/xnWJY=;
        b=bG4tbMe26v4JiV32i7pDR2ib93bi9QdRQ+BoJ4qXiMO2me1lQ4omudd6AIEh9fM7+8
         TSNhm+xP8bpXGfQLFBzL/rPj1Khxpyb8u+uzCoIU2n7BP1LWTaro8ng/rmytVO30fqx3
         94nYNT8MHuKjJTUWOmngUOMHm6yB2NRCPUhE2oIJ+0MrIRWkVYjJTRmA3Sk7WL5Kba/T
         eBH2t8JuLSV7E+2CUz6rWvMlL8jP57vJDamdghkyvE7LRO0cNYkbIrn168oeq8U7BlaO
         cygO+91jAQOJNqUICvVAXSJQoFni0JK5O0FA+lWNqYXygfwOMn3IR14wtkaY+Dbmwty9
         HT+A==
X-Gm-Message-State: AOJu0YwL3wZp5loLypuoY5tcmFrGSTSgLfH9l0o48QY+GgOciGiLP/MB
	D56hLUXcmTY4fiiJ/ixVCX2vpBMjx2UVYKnu+Ctjank3d25mHkfxJ3xbk51ytErGowA=
X-Gm-Gg: ATEYQzxh1qucVpq1WZWzSZuzlxzB7mgCV3j8VO7jqspShT1biBJtNq1fG18CIqYfY/g
	Tt44UcY73CYF5BguyYQtYA3QLSY7NlnvdLdfy9vByTCgzMsWaRhkxpXMsaWazrexBvHYq+oL8jM
	VNuMzVOvV5ZtEZoT5YOtN7nxBGIJ8dsrdDWWglQGEGZLQZzioX1L/RqC3Eo5aTRENVd7vcHn/tS
	fmNQHN601N3Q95c3ayhQnA3/O/MHr428EnAvcZTUlgyDjd9tU+sr9Z1Qmmj/9vmLNb7mD2F7xqI
	SPKThEJWIQ7AVFrFC+oxC4RoD4sPhvNoH/m7Ybm5zYnFn1BStHOblqF7TjXibjNdJWuABz+XSo6
	2YSktGTFag+DA65vyfhaLFlPftn3NExkBQZPlH5rsznoaUmtODQNMaKbvyBG5fa121LnIvQmCJC
	4ljvsCyW6LLArNLsqDzR8gLKeP6ntpw0BtGDLljhSXA/GUrIX/iKSTpszqqB3c6tVT8K0DJL0W7
	1Fvb6ewGAbkGrL4NzCTZyt4
X-Received: by 2002:a5d:4527:0:b0:437:664c:3f28 with SMTP id ffacd0b85a97d-4399de4a684mr5861038f8f.47.1772229830567;
        Fri, 27 Feb 2026 14:03:50 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75b5b6sm9219659f8f.18.2026.02.27.14.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:03:49 -0800 (PST)
Message-ID: <9c7fff927b74795994202598fc05c5b81ccf3d97.camel@linaro.org>
Subject: Re: [PATCH v8 08/18] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
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
Date: Fri, 27 Feb 2026 22:03:49 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-8-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-8-95517393bcb2@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94544-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ae00000:email,qualcomm.com:email,aaf0000:email]
X-Rspamd-Queue-Id: 25DC91BE6D0
X-Rspamd-Action: no action

Hi Bryan,

On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteratio=
n
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.
>=20
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index db65c392e6189..f96411f481305 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
>  #include <dt-bindings/clock/qcom,sm8450-videocc.h>
> +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
> @@ -5464,6 +5465,23 @@ videocc: clock-controller@aaf0000 {
>  			#power-domain-cells =3D <1>;
>  		};
> =20
> +
> +		camcc: clock-controller@ade0000 {
> +			compatible =3D "qcom,x1e80100-camcc";
> +			reg =3D <0 0x0ade0000 0 0x20000>;
> +			clocks =3D <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>;
> +			power-domains =3D <&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			required-opps =3D <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +			#power-domain-cells =3D <1>;
> +		};
> +
>  		mdss: display-subsystem@ae00000 {
>  			compatible =3D "qcom,x1e80100-mdss";
>  			reg =3D <0 0x0ae00000 0 0x1000>;

