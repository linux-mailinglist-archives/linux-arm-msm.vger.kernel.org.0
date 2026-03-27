Return-Path: <linux-arm-msm+bounces-100351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FGUH0ydxmnrMQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:07:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9F7346792
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 836B63037150
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B392DC764;
	Fri, 27 Mar 2026 15:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Pgd+tgAW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6552EDD70
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624046; cv=none; b=Boh2jsVh2HZTxsWyXLGgRRtTTc3kVT08qRGesC9By2xiAOcCNMTfapsEWDTbIuY+hKDn7VJHZ/LZ0wDorujduoMpZla9S/1sci8d4cYBaYS9bFHSi35YPTvzbkCPol8ziBzIUhmSiTxJfGbQ41EOVQBhQlXLuoDiTZkSiBIFY2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624046; c=relaxed/simple;
	bh=/kUhKxLK/HiVTHt4C8gogYYLUmss6aq6IAKcvjyBAL4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=rVDcnVdRjYg/Mify8gWNcQJoBKy3CHfh+DifceyptfUjQnZJ657ltjmK4s6MYX6QIx/ACNQZqilqkGf2cOLVOu4Te57D7Yotre//80bjAEtO0l4Thxz9VvNrhXavxECWH7qXek1nUXGPFFug0lBBMvqSFPGI4ibDgUVnK7MXc0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Pgd+tgAW; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66abe08cdf5so3574638a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774624042; x=1775228842; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+CkqBk2g+EWPQvgPZYgq6UuU0Pf+l3NHDnxqGjySmmw=;
        b=Pgd+tgAWY5Pk54v9PDgG4uwFTWfOTolPA9ulQ+wQKmgJD0oOAyrkssWFF5oroXJRw1
         N2KQieJFkZjR9exXtUpXpft/27H6ecefXLGWREVPlpDu2/dm8dMBsFcSA3ZmVEoHkfV9
         jyQ1/5enB3VB/iygFkMJClW/uimFxxgDL+5suPesYfuaTMvqe3JkoXAFASKdkt7wIkHX
         N4wELA5mgR93PZREUtXD8XJ68gp77EWMzcpV6e6S8csrGQTyUZfKilzEC0CIX9zDfikJ
         NleNsHQ+VXuXF5fulJOAper32NkRlvnHfbFQqYBiSJ6MaUjQw5NR1wONiQ6EW3KwhwLl
         vvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624042; x=1775228842;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+CkqBk2g+EWPQvgPZYgq6UuU0Pf+l3NHDnxqGjySmmw=;
        b=cR+KZnWJln+I1Ij5fWgIe1us82mQxas5k6ipcZXjTUbuLU42qX32YC27A2iXXz1sKK
         QCSKLpgBmgcgM3+6//iDWgZ53Jk71LtRQEF7VbFDSuiYosb9MIi4LsSmCRqJwdFOAF8s
         bXPFEBkv7Q4KbKS/oQ/ROE3lmnp7AKfKSCiC2weaOE62UZhCJ9LbILdeYL/WMxutk4ih
         Jy82HWIbWO8irHQZHXPa2sAykYpLC6HPPeUfyAOWv1xgsR9zBCoBIyMaaQay1Vkz3RSc
         FI5uIkAOom+t9j2qfZRAqE6MmC+o/SJl+EhGahsvOzwmRI0xQu5iOdqSUl/P94VNL4Nz
         Ro3g==
X-Gm-Message-State: AOJu0Ywm0L+otlvVszriPaPGvtDfKg3ASjG+h9JM0qc5UDKVaru9EUfv
	h+2TpylwOL9wVHz7W5FKN5hCZ86iMVopoeW7oVQ4iJDihGUq5aOtd9GyeWpbaogoTzs=
X-Gm-Gg: ATEYQzwl5C4yu2E0UikNdRn+CLFxsW8vBbmuA9zasIBHUnu7O2MXcrrsEbyRMoCq3Xy
	bXuSo8qcswSdKF7Ppzh/uk7la1aa0xhIpugwEGzUOx8Pu04xtD+hsmoPp9lbJ0b3vBn4IjKfE0L
	zY7vMTDVFlqcXKsbgu1pVio7gNjnzQyx0TXvwdqqvhdPNL+6wqg9gy7gPvTGedp/5LCpz2eqZAL
	Y2R0U/EpCvTRMYTD/TRc3ZYJ+CNEJ1lN7NshBWli+l/kr3617RPWkKOnyOhTtT/x5sZnAg5chKZ
	35aOcdSVarhl0Me3ZoGzIrkXY8MoNxcKuY3yU3lo9blJ5k3itzt9P85T7XJYVCexAY41nEI5Bsu
	i6yWJKblbo7a2CGsEijJYThXp0dc32aFTOoGXsGed+RacEjQ7SGvw1DtEM0dxwi5zAojPwU3/fb
	j1zSEMeUtI1HPV2E+t1KG0P534ZCEeMmel65txskMtk1193ccENGXUFCHWT3oMs413t/uU
X-Received: by 2002:a05:6402:52c7:b0:662:ab67:a560 with SMTP id 4fb4d7f45d1cf-66b28c526dcmr1637141a12.24.1774624042436;
        Fri, 27 Mar 2026 08:07:22 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad5e3bb1csm2337411a12.4.2026.03.27.08.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 08:07:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 16:07:21 +0100
Message-Id: <DHDNPXYB1Y1U.PUNONE3TEXD3@fairphone.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bjorn Andersson" <bjorn.andersson@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
 <20260325-ideacentre-v1-2-768b66aaef30@oss.qualcomm.com>
In-Reply-To: <20260325-ideacentre-v1-2-768b66aaef30@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	TAGGED_FROM(0.00)[bounces-100351-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CA9F7346792
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bjorn,

On Wed Mar 25, 2026 at 11:34 PM CET, Bjorn Andersson wrote:
> The Lenovo IdeaCentre Mini X (Snapdragon) Desktop is a Hamoa-based
> ultracompact desktop PC. It provides HDMI, DisplayPort, USB Type-C
> display outputs, 5 additional USB ports, Ethernet, dual NVME slots,
> headphone jack, WiFi, and Bluetooth.
>
> Introduce a DeviceTree describing this device.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  | 1199 ++++++++++++++=
++++++
>  2 files changed, 1200 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index d69e5f3132c4fd3fbf1ac90e83adf6af6b104a93..fbbec696ac161af42c18acc34=
4a228ba461f65a7 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -21,6 +21,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D hamoa-iot-evk.dtb
>  hamoa-iot-evk-el2-dtbs	:=3D hamoa-iot-evk.dtb x1-el2.dtbo
> =20
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D hamoa-iot-evk-el2.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D hamoa-lenovo-ideacentre-mini-01q8x10.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D ipq5018-rdp432-c2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D ipq5018-tplink-archer-ax55-v1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D ipq5332-rdp441.dtb
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x1=
0.dts b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..cc90cb58a9c17ad166dd641d9=
bbc03b7df5686a6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
> @@ -0,0 +1,1199 @@

<snip>

> +&remoteproc_cdsp {
> +	firmware-name =3D "qcom/x1e80100/LENOVO/91B6/qccdsp8380.mbn",
> +			"qcom/x1e80100/LENOVO/91B6/cdsp_dtbs.elf";
> +
> +	status =3D "okay";
> +};
> +
> +&smb2360_0 {
> +	status =3D "okay";
> +};
> +
> +&smb2360_0 {
> +	status =3D "okay";
> +};

You have this smb2360_0 node enabled twice.

I checked this AI review thingy to see what it's saying , and while most
suggestions are probably kinda useless, it did spot that bit, which I
thought you may want to fix in v2.

https://sashiko.dev/#/patchset/20260325-ideacentre-v1-0-768b66aaef30%40oss.=
qualcomm.com?patch=3D10329
> This isn't a bug, but the smb2360_0 node is defined twice. Can the duplic=
ate
> be removed?

Regards
Luca

