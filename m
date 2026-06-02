Return-Path: <linux-arm-msm+bounces-110743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jLLXEG6OHmpAlAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:03:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E257562A142
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B40F3064083
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 07:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF4B3B8BA1;
	Tue,  2 Jun 2026 07:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iTqgna7E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218E73B83E1
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 07:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387125; cv=none; b=ZYWBEOxvERshPFYx3ZGwWl8GwLgWllTg+z5A62B2+A5FmLwfqlAIfQEk0PIo5SsSZj1tOBV2AO+kbYiduta5nkAJzkYTdfv2C4ptd1KO64E9S8PUb2vc/1+imOI1HCX2HLrs1lDhJTjYvpnpJISOlAeC4cgUZFdZ0lw4Tr1Ye9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387125; c=relaxed/simple;
	bh=XYy3V5eZVklfkWl8JgnpZ2HUfddY5d0AG93Z+sOiyhY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N4yz54Ae5dKYGRVzOEhQIhnFCcoqZv2Vjg0fChP37rPz3djwxCf12BYuZP5trCDK8lSb2bXbb8rdMy3V9PEX2yZ1tsK7Evr75DLk352muFPC0ZDwLRPYHMzjmX/5JxhwX/Mvh26URrA2qoCzSMrjY3qvq37n/ABfITNO1DhZxz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iTqgna7E; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FD51F008A7
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 07:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780387123;
	bh=Y+nB6IjclCObNAHhbLPlcvSO9M8DxxTvdwCzmJ5QJZg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=iTqgna7E+hWKHD3aOI8+v/yhc5iKnW6VNU+6H1Y4UXKRk+uta+rit+vS0MXOgaGxj
	 olYKG6qoAkvQfShSjr2BXKUeMd/Hs8C2dhYXTcdp9a3nujrhrvdXqjmIAkn7V89jQc
	 iYyHdVKR/PWtx+9+yFRusM0v98GkqnhiFHf25y9t0UwXfhuh9OjyYhYUH15Vf2uIUW
	 kixiaK3VwwcfyqM0mp4kAy0QCmmE3BwmxAe9UZG5AR/jIhDikWV0OQQqNpDZYaR0Q4
	 SUO7cl2so0yYnMljjdS2Abij55Z8uYsYD3ZBq4Pp4RepmMvj1vTs1lL0JKeUMjboiV
	 B9St35uCjfNtg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39677c434efso25385271fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 00:58:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YyHeCqg4DkJkDKzhrg2jYL5E3FohFTQLGzICHfEtTR/5TETgC3H
	jQpuYObKMVspu6qPk0LMuqvjrCiTX+ZloTJjFPOHD/nGdE6h84E2BGecihnDwhuLvOT/jcVrOvj
	y4Jz1iSKfm3HOrPnIQCuDQIH8ED0dsPBWNvnR/A0f4Q==
X-Received: by 2002:a2e:984d:0:b0:393:c6b5:993b with SMTP id
 38308e7fff4ca-39664f1631cmr31958381fa.24.1780387122616; Tue, 02 Jun 2026
 00:58:42 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 02:58:40 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 02:58:40 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260601-sm8350-wifi-v1-5-242917d88031@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com> <20260601-sm8350-wifi-v1-5-242917d88031@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 02:58:40 -0500
X-Gmail-Original-Message-ID: <CAMRc=MeDtwzBN2Hb7tZ9DLXRy9XjVnZpRCp4NZUNB8Ads6S_cw@mail.gmail.com>
X-Gm-Features: AVHnY4JkGrXXY2Io5k3AOPxVnoFnOn_nu0dA5WLYX-xPYi8QVC5JYyOfCFzeixs
Message-ID: <CAMRc=MeDtwzBN2Hb7tZ9DLXRy9XjVnZpRCp4NZUNB8Ads6S_cw@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8350: expand UART18 to 4 pins config
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110743-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,bgdev.pl,kernel.org,google.com,oss.qualcomm.com,gmail.com,holtmann.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E257562A142
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 1 Jun 2026 11:46:53 +0200, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> said:
> On SM8350 platforms the primary use of UART18 is a 4-pin UART (targeting
> Bluetooth or other similar applications). Add all 4 pins to the default
> pinctrl entry for the UART.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index c830953156ec..eb2a795d8edb 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -3309,7 +3309,7 @@ qup_uart6_default: qup-uart6-default-state {
>  			};
>
>  			qup_uart18_default: qup-uart18-default-state {
> -				pins = "gpio68", "gpio69";
> +				pins = "gpio68", "gpio69", "gpio70", "gpio71";
>  				function = "qup18";
>  				drive-strength = <2>;
>  				bias-disable;
>
> --
> 2.47.3
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

