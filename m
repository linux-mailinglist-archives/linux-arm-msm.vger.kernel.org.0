Return-Path: <linux-arm-msm+bounces-111719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bEnvLIFwJmoaWgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:34:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 27196653937
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:34:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=wGFcigS3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111719-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111719-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 230223023E35
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942213909A6;
	Mon,  8 Jun 2026 07:32:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D28282F02
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 07:32:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903979; cv=none; b=L98mwZjdcjcm32VQ231jdcp5zVVOJJ1l4rjlpPY8bztnOrxhBUi/4wBLPLiowPOvh8jID82ESpqEg95eK7AKP1QWV4aF66JYA0IveqKB5Aar8AGVK8OFqqQorEFfXyVLhwhFZYkM21VP1hG0OqVD6E/gNqWwEBS1AU80uSSZkfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903979; c=relaxed/simple;
	bh=XMHyOQHx6WIm/tuQ1tglv5lWCjfTXh95qCF2ldK+bKM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gVfmYmze3J5ad0NGoskCNU1qOZQjC/b5ilNs/9kKJkwropE1YmG4LmS8gwV5vDDX4qAqbEwCMvduTdfDIE5NUvALlfmJ2I1+L7bSfUIoh/J7EN2iJ1OkVoGFbHFsBof8FlFhwigEUfoLkobUqJsX+KQRsMGcLk06MBIyJ9Z5RJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wGFcigS3; arc=none smtp.client-ip=209.85.208.54
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68acf0a15b3so5572061a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 00:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1780903975; x=1781508775; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e4yVKORIbgcZMiPjlqQS5Msk7HSGQTKiassh3VqtIA=;
        b=wGFcigS3B+FXukYWVi5TuZg0Iuo6fSbyAfy6NUHUuTyKi3aZ5s5eNx9ncKP3Jjj8qt
         8i1LY9nXLim4RY+BzxCPdSXverYy2XgfIB4EfVKT6B4X/3vKM3K2FZS+gRBkP1euC3BZ
         zGJ2tfn/wD1yVYyWbv/zeVMxld81oyJjV0K0MR8o/vGEekpoivOuxBgs4QjJlPkm1qlv
         Rsqz9h21+KSR+WkU8nwsdA5YnNKdSGYjnzE2q5gS5mVJp7VNQxmYzdgBbofcDQuZwvbO
         b99N69rEUw/T4Sb9GPoWywQgTWJ6HmTdtNeca54HsiJT4ZZx/FIvFqLlJAiczzl7xdFT
         ab9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903975; x=1781508775;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5e4yVKORIbgcZMiPjlqQS5Msk7HSGQTKiassh3VqtIA=;
        b=bsUQIrPCTmplLgY6tF2P1RvA0FQXeMclMhY39VMpvo8vqRJI2hkd80wQu6mlwcu/yr
         hXB/wYu1asHTvgrjsAjCWJ0dfAsaLCzqXAYnXIioNqQvZx7fe4SQ4BHThsS7mWsIncit
         58R5KLvVPe7xBqJyT0oJhE5ZZy50rO/iWkE7A68HHsVgE6b/2cjIJp54GklERl3WyGj6
         aioKAgPqhuIHg+GBotgeIisimNqN5PFW3l6wG+sAPrphhCcE6RX4WjWc/pEHARI8kz7L
         UYsSFyGGJAFL6w5fUE0EwknQjzVyxS0G49t1c1el/xyrPV4SjL17fQ98AZGK5y4lPsYS
         TjMA==
X-Forwarded-Encrypted: i=1; AFNElJ8hJt49DaY540AjeZwoYKMGEqHYfrPAxHgVMOyZP20Z/Jq/sXvKUWng2dhi2lMeNCO/rGSGmtEmnObWUTbH@vger.kernel.org
X-Gm-Message-State: AOJu0YxzFjfx5zIuLFa0VU4ulznXZey7jLuDShYTXGkiYLbPyqYEjsPR
	zfT46cq095NmHqiZsbsbsSIh63h8537samQAvLSsSkczBnROtjuBCyFeyW/6seHu3Ik=
X-Gm-Gg: Acq92OHQQlnyj5Yua5W15Rl/dFbibZzuGZ7BXjCdmrAhX/NjQVI3oxB4fr/UP5rqtkO
	BN6n1tJvZL3eJrcLxXGLKd/cKSPx7dbzyRzFARrUnR3mtnNe62SRBFG1PaiB1YKyrcxr7yddeQ8
	8HkSAQK2pFWoxF2rLAOEgewgj2bquMKwI/IjsfQ4qu5ktMCptPhpjui9LVNEJY6lhrwgZUXjYBo
	vZ4k0+xJKTIyCQG7iQle0fq3f2jNM69tcjiu1KKeu38CfnFU7Sj1S1GhN0EeuMt0SJ7P6Zm3RvK
	WqX6vz/+Fed4NnEFEk+QF5/Px9zgmOGKMaa/OpyS52bbDjAI8HSvmCFnt4SyO+cx4FVJyd00PpZ
	mP9FX91W4E2M+qMcKjjyAqsb/dF0jiHMshpXJGb23ZGgkFVbEgzwRDRaDNagv+/tZRC3F5UZoZ9
	Jvo4xHHNL0PZGTiVTn6FMDxgMut1PnBMLmtcElWhyPzNMfVGznN+sXtdXJU4yeXIcHkHPFemdPO
	l9r644=
X-Received: by 2002:a17:907:3f20:b0:bdf:8e2a:1092 with SMTP id a640c23a62f3a-bf370e639e5mr722825866b.3.1780903975340;
        Mon, 08 Jun 2026 00:32:55 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051d82a31sm831571366b.19.2026.06.08.00.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 00:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 09:32:54 +0200
Message-Id: <DJ3HRRGJZN8F.3UNOV86ZOB47B@fairphone.com>
Cc: "Ajit Pandey" <ajit.pandey@oss.qualcomm.com>, "Imran Shaik"
 <imran.shaik@oss.qualcomm.com>, "Jagadeesh Kona"
 <jagadeesh.kona@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add GP M/N clock controller node
 for SA8775P and QCS8300
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Taniya Das" <taniya.das@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Richard Cochran" <richardcochran@gmail.com>, "Konrad
 Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,redhat.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111719-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:netdev@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:richardcochran@gmail.com,m:konradybcio@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27196653937

Hi Taniya,

On Tue Jun 2, 2026 at 5:21 PM CEST, Taniya Das wrote:
> Add the GP M/N divider clock controller node at 0x088d3000 to the
> SA8775P (kodiak, lemans) and QCS8300 (monaco) SoC device trees.
>
> The node uses the qcom,clk-gp-mnd compatible, is clocked by the PDM
> XO4 and AHB clocks from GCC, and exposes a single clock output
> (gp_mn_clk) on the dedicated gp_mn pin mux function. The XO4 clock
> is pre-assigned to 4.8 MHz (XO/4).
>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 14 ++++++++++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 14 ++++++++++++++
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 14 ++++++++++++++
>  3 files changed, 42 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index 1ff9e1598d00429c03b2bcae41fa370ab2c892bd..cbc13ac37f8aeb0b1071ad060=
9ec11e829d2c798 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -4412,6 +4412,20 @@ usb2_role_switch: endpoint {
>  			};
>  		};
> =20
> +		gp_mn: clock-controller@88d3000 {
> +			compatible =3D "qcom,clk-gp-mnd";
> +			reg =3D <0x0 0x088d3000 0x0 0xc>;
> +			clocks =3D <&gcc GCC_PDM_XO4_CLK>,
> +				 <&gcc GCC_PDM_AHB_CLK>;
> +			clock-names =3D "pdm_clk", "ahb_clk";
> +			clock-output-names =3D "gp_mn_clk";
> +			#clock-cells =3D <0>;
> +			pinctrl-names =3D "active";
> +			pinctrl-0 =3D <&gp_mn_active>;
> +			assigned-clocks =3D <&gcc GCC_PDM_XO4_CLK>;
> +			assigned-clock-rates =3D <4800000>;
> +		};

Am I missing something, or would this just configure gpio60 for all
boards for this clock controller output? On QCM6490 Fairphone 5 this pin
is connected to FP_3P3_EN, so it's definitely not unused.

Maybe disable them by default and let the board enable it, if it wants
to make use of this clock?

Regards
Luca

> +
>  		qspi: spi@88dc000 {
>  			compatible =3D "qcom,sc7280-qspi", "qcom,qspi-v1";
>  			reg =3D <0 0x088dc000 0 0x1000>;
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 19f8cf4e15482947f6049188050c370340afaead..d192f92a896bb13017abdf820=
62e8305aab3e5d5 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4353,6 +4353,20 @@ opp-384000000 {
>  			};
>  		};
> =20
> +		gp_mn: clock-controller@88d3000 {
> +			compatible =3D "qcom,clk-gp-mnd";
> +			reg =3D <0x0 0x088d3000 0x0 0xc>;
> +			clocks =3D <&gcc GCC_PDM_XO4_CLK>,
> +				 <&gcc GCC_PDM_AHB_CLK>;
> +			clock-names =3D "pdm_clk", "ahb_clk";
> +			clock-output-names =3D "gp_mn_clk";
> +			#clock-cells =3D <0>;
> +			pinctrl-names =3D "active";
> +			pinctrl-0 =3D <&gp_mn_active>;
> +			assigned-clocks =3D <&gcc GCC_PDM_XO4_CLK>;
> +			assigned-clock-rates =3D <4800000>;
> +		};
> +
>  		usb_0_hsphy: phy@88e4000 {
>  			compatible =3D "qcom,sa8775p-usb-hs-phy",
>  				     "qcom,usb-snps-hs-5nm-phy";
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index ebe5889daa5300efa7857314e9170d7d2fc33ef7..f6c5ec38c7491b7a16ebfb853=
f8af88bdf1f0db3 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -4867,6 +4867,20 @@ opp-384000000 {
>  			};
>  		};
> =20
> +		gp_mn: clock-controller@88d3000 {
> +			compatible =3D "qcom,clk-gp-mnd";
> +			reg =3D <0x0 0x088d3000 0x0 0xc>;
> +			clocks =3D <&gcc GCC_PDM_XO4_CLK>,
> +				 <&gcc GCC_PDM_AHB_CLK>;
> +			clock-names =3D "pdm_clk", "ahb_clk";
> +			clock-output-names =3D "gp_mn_clk";
> +			#clock-cells =3D <0>;
> +			pinctrl-names =3D "active";
> +			pinctrl-0 =3D <&gp_mn_active>;
> +			assigned-clocks =3D <&gcc GCC_PDM_XO4_CLK>;
> +			assigned-clock-rates =3D <4800000>;
> +		};
> +
>  		usb_1_hsphy: phy@8904000 {
>  			compatible =3D "qcom,qcs8300-usb-hs-phy",
>  				     "qcom,usb-snps-hs-7nm-phy";


