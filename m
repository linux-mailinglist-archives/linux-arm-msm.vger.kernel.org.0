Return-Path: <linux-arm-msm+bounces-72391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6BAB46A3F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 10:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D3B97C378A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 08:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23710272E7E;
	Sat,  6 Sep 2025 08:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="eoveUnZQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62BA36B;
	Sat,  6 Sep 2025 08:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757148448; cv=none; b=EUL7YQpw5//N2qSvB+Avs69f6f5YQoV2cq0S5UaBYfzNf+gBYmuE0QThUhVNwpkS9/gJ5gGI3pDlkZdwJfExH5fWbAX71UJsR1jiZebmCmhO1nJUPceSVhVdDf9oE9GKWpfadZv+vMInUM1lRErg5ZXPup6jhT/FZzswy8Z/uwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757148448; c=relaxed/simple;
	bh=HYRrBYyB0CC6230NaJ4dCWrWOlW2VrILRAxMQJvWm10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o4onPsk6jyq2fG8GD8HYaUk3YagnXXL9EhWIkSrcQ3ZR1Wr4djcUUqLn2921msYw44NRSRy+QNpPx9pisosJT6hGtIp2g2dXqEZBrprcfUb/wbexawqcr3Pyaerewyug+Ixy8pHe55MmpngMyAaghy2hlwv37+mFI0kNot9LPX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=eoveUnZQ; arc=none smtp.client-ip=212.227.126.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1757148438; x=1757753238;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=Z5TpHw/1i9sizZL/L18DqQShuhFMIw2vWBeiWqXJusQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=eoveUnZQrN9PGYnMYIJsKZyt6VEXC883A4AtLEVFXMAeV2H0aHSFsO41efbI2OJq
	 Vpl+Oq2ELeno9wR4gAtN8MZVyJusn/rNsbip04AnvQwS9iZ3sEHLR94JisBcL16b0
	 u87EttCK0wAt6DN8HQUXI+MDPyC3VIDrkLEB7kUggZZw61Yx4KjAAuRXkGzC6Gbwr
	 wAv6PQLjR6iZ0vKlqTzNuH7sTC3CSm15jvp0RLjLb1QnTlisnSLqKZxxU0za1UAhD
	 +Fdt49wHCa2QbmQy7yTaedsb1Qta+8O14fmx9qs3UnPcSTEq5p+pBc8OJh24i4T9S
	 dsk/Dzrlj8FCKt45/w==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MQy0N-1v8Cc612xD-00Ke4k; Sat, 06 Sep 2025 10:41:49 +0200
Message-ID: <a38df652-54c0-4216-9aa5-c8d32599c8f7@oldschoolsolutions.biz>
Date: Sat, 6 Sep 2025 10:41:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
 <20250821-topic-x1e80100-hdmi-v1-3-f14ad9430e88@linaro.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250821-topic-x1e80100-hdmi-v1-3-f14ad9430e88@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QhRL/UXwPaSPd3oTg60CCdzWtMxaB/XVwYUR/VGyFAk3GUisFgC
 cUIA1Xj9/0/C4ya1HbYVvFqOCVF0jbH2+pr0r0i8VxAOZI2va0JaT9Ei0YAoHCwxe+gjswQ
 /RvxsQzNKG1Xw9+jufRyWGxg2Y73AZeacgAdzzAnfDiZAhIuW60pP/8ICwwb5b5dG2ZFXmN
 wo8NcH57rkr0pGv6PdxuQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3aieSKnjtAw=;8wN+uDh3eLswZX3rW5Dm8LcgtyV
 MbJUuYEM72BsliIq1gk1VcDh0Erael2UrqLBH50w4NUneOIWLlD/kyMilenyRlsTHR6k1ICOt
 I+8HiKd3okXsYHWukUlCHC7MLsQy7HjDL4UANFM1cRrm2aAnIo/cZv0TsYfxIVClSvC1PV45M
 AvZfaGVTxbBOsHLErxSCqOnxbO4xkttsD3xHG7sr0K17CXV7YQqr65wsvElxSq+fqx7D21bC9
 RMjagH2bayihdQfLNYe4WWTU19RmoENfj02x323I8c9qF5OxwZVoDg7cBkHqieNN/t5AwJ8/n
 gk9tsI5YrWz27TejnjIRPPM6KnYrLzgo+U9UIzP5WF9eU9op2NhDs8/FxHu1lnwPcLi2GLsI2
 rtp/GNLpR0EflxE0V+ojxZNBWLBEZCB5wZ354nAhWG22QzNRLIaU/Op7PNYs6HMH8XPOCDYxq
 pSZRcUs6bKxjdpHxrBE953KMjcQa3UC1mgEcLaAqMNagQJUpGAmKxBPrKxkfa6eloPZQR33bC
 fC7Y62TODrLVaXwgc3frYdfODZNJJu2w63BCdFde66dEdymB7mzGEUVsrvAWqmwsIbFyrHTfY
 T72uGGRZfzXrXwMkcVuSSd79NhD6ji2W0vT+T0EQAhhj+G9AEoKAyywEHqPwotUqE0Hk9/fLG
 ftGjFL1SZuznf5c/OGq9WBIDnSkW48DtH/ZbS6NX61trjsU0BrGQLgQAjQ0zpTh5EyFchlHKI
 HKctH5oqjKhfDckjGSX/2X3Qjm5wzZPevdNwGq6kI/Q8WHTO1uTfNMJGca0aGzVNsR5mc1S7e
 kt5oSdlPj6B2BG4EnxmVn6FzQSq+AHH3ILEN1ei+xR0y8Rrhl+4Wxn1N2kzXljSyThmXEsLFY
 K+X41wV/t8atVGzsZ0okqjN8XPnz9yJQswVPoyfudVfk/uKG4aAhvJ6hG4tnNIODNQZzsuXYB
 rx1udCsmrDE8azZISXGjD3zYPH4js3nr+cDw/M/EwAvA+/z7qler1BJLkE8wXToyEezbCOK+E
 I7LsTqOndTgFaTnOh82lGu6/GvQwjGQF7iAAsrvClCUBvQ300I7qJzeJ5uxEXvohSpYvdM+LI
 sL28goaZO3vhaiDgNw6hg5t/zq3AR/5KNr7K3W06HRQh5+PUgrXW5d/9MibXLu5vVe8+/HDEv
 y7MKLRltbPoCpY120syKCBIGzT9ISBRFja+TpOCZhuQgexSZ8VbS2KRIiDii3B/e8JeNSOpV5
 Wa/iADkksku4PqifpoHg48GTIwK5JG7s8kKL7zCAFymlIqHtvV8RFRqWL0lIlPAMh4RBlTcKq
 /Xo5qjKhX+rKRGj9zwIDY0nIf1+qJ4nsJ951InyaOjeY73ZqxQDedVa30ffe9nwvcE8zjIssO
 VDlRKhvEd8Ja6lYkdyBg7CU7ssGvWl5czu/BtHJHxnCUD/dpccpPq5DyoSBE8bHZzF7LPyEhJ
 6wtMHm+feBuJcJmA7u/QwIBiIJWwzp2Cz/kAuI1TwAOMisEmGqHYOzialJmLcE0y7O0sikfyW
 uf66+Hfi+E6kubhc1xqxia15+tPQToIv/ZQR1gxP8NXdZqrHoB9ZNl100o/M1bD/VUg9TasP5
 W63uxi9sPNHCC0UJUuhPO+Jwt4P5bEm+0Wu2+agnWKjLXtenM7GLRUSRAk8/5DPbQ6aoTMQUL
 q2jMujg3em8Ia9i0RP3YQRC+L4iZQQQazfOYNel2+VmnSRsVNEcb3+dxfuqRirCbTv0B7LY7V
 d+Vfes5TnBj7w3aHFxsVq75+c4sn5IDFvcTZ6NZGO3Ircq4EsZ46wqL0=

On 21.08.25 15:53, Neil Armstrong wrote:
> The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
> connected to the third QMP Combo PHY 4 lanes.
>
[...]
>   .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 44 ++++++++++++++=
++++++++
>   1 file changed, 44 insertions(+)
[...]
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi=
 b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 4cf61c2a34e31233b1adc93332bcabef22de3f86..5b62b8c3123633360f249e3e=
cdc8ea23f44e8e09 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
[...]
> +&mdss_dp2 {
> +	status =3D "okay";
> +};
> +
> +&mdss_dp2_out {
> +	data-lanes =3D <0 1 2 3>;
> +};
> +

Hi Neil,

shouldn't mdss_dp2_out also have the link-frequencies property?

+=C2=A0 =C2=A0 link-frequencies =3D /bits/ 64 <1620000000 2700000000 54000=
00000=20
8100000000>;

Or is it something the bridge already negotiates?

with best regards

Jens


