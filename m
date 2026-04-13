Return-Path: <linux-arm-msm+bounces-102905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iO8sODSw3GldVQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:58:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 109893E96DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6489F301FDE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457D23AE6E6;
	Mon, 13 Apr 2026 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3ySkQgwO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB3727470
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776070541; cv=none; b=A4joLGCCzPchRvBqBiK3ThKvbEXXhVsIEP1LiYhBhGDHWoE20Ucb9tewegtT+3bjlPX1YGAge45fRtCHBCgu6hExb7S2qF3q2M3LO3QGjzQR4UctEn9G6ya9EZ8mClkpz5fldViZYyOcJgVYGngXCP/hsAOfTYlNL8NYEZFPAZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776070541; c=relaxed/simple;
	bh=D2aNysoazoEf6/3/6uVC+sJTR09Ue84s0LX25WaCQV4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YQxEKZ8FiWB4LqCCKEkm81g8xNsqkt2MGFe9rrXW+jV0ek/JUcP8UNNM3Cm42xkbHc+uPnAOYhtnIbPsRIE11mIL1n0q/xU8TzRo7cEXqaF1XuwWHRk2gSRyD7xyWUVX9sw08C0g2tML2zbKrpivXownTW4E/1yY/ahgNU3R3d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3ySkQgwO; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9358bc9c50so535939166b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776070537; x=1776675337; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgkijLDEm/ABnCWLRgQ2UF0+RYV7WyoElCsuBhyBG+M=;
        b=3ySkQgwO1yZUTJN7Uh7h1KMS56P9ifn7KdETGkcTLiVChB2Qw2TlNtKN/coIoE6lPc
         IF6nGIAudHvXq8oUM/UmKHvXVSjz+5i1Ihx6WGEkB6GUJ3cl5QroEePEKdsxu+OTUtzo
         yoG64nlnabwKyAE42zkWSB2AAyLoyzcVFjTzKuZtUPVEkVOTcUEYtSpvPh6LQtsB4C0e
         5o3KzNNYwHa5OsEcvcRcGgtQrgfd1igyjGe19BDr32MhNwFgZqWDuk5q6ANuoDgZsUBP
         V91hNWC7ZBenk5R5Y+YlxKLpQ7lBFXox5XwkNA855o6XO2f1+1z0MNp/eVRSW/b+Bwmq
         gsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776070537; x=1776675337;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GgkijLDEm/ABnCWLRgQ2UF0+RYV7WyoElCsuBhyBG+M=;
        b=rhUN9z88N+vP5ZJEwwJWSAG1T9V6crVqlf2js35KEBR+qBZeBj2ghDkPeFenRzVrZS
         vKm8fLgo5q/W12arnWhkT/AtR5Ug1wzLA5t2dLD9/8J1zah24GtN8CVC3Ex6aACn2wYh
         4TnYQeCkDbTf9hbGOY5xd7krsPw4Duoyf41PZxGzmhukWHq0FTTHMR0uwMSNAfSLGwIe
         bkOAnQROeP/GuRMDId7o82Rrx3B7T/1AorFDl/BIhqpsSLaDSFIviJbAZ88GQOF6AmdE
         NFjNN2QmV+sP8BKQazTC3+5bTLDf3BOBSQfBVCc6F7LMCm5k5Efb8lxATJIg0fohh7kN
         gILQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMJ7sOCnFWAFxp1n/js6GEX+DFifrFeaciVsoarXo2ggKsMOeGgFHQxtWXb0QzFV8N1cYUNhUSFnWMYN88@vger.kernel.org
X-Gm-Message-State: AOJu0YzjaE6d3bW8TsZDln984uzTnYk+biAbbclDfFFDEzclcZ9bs1aZ
	c0i7WMMKdgPPb08ZJEd4nBET26FFyr3H1IUB826lG9/0sNVH1JREIwS5GevBZ1lgI4I=
X-Gm-Gg: AeBDievniXTeAipPgiXfCeOoH7Llmd22lBuyBfSvPIsv8r9nBnhhKyvMGJhAf5hcE35
	ti6cktnLJNlogenlzFhJazUsKLu0XaYcgRqmM4TdtsAjHvMc/7949ThYdd91oNhRADXSot0KLHx
	+2IxYTontH2lLqYzyKkSJhDWLJvK3CYBQImLO8nLcBXb+8q7V+kxf68lAKt9xQoAOyyFx6I8sXR
	KfKsL5EoigW5l9JvpnzoPYXTZZS6i3XukdeLDhx6EZkj4yI0RFH0/Y0F8RIcBBPSPY1G7uVJW6K
	y0LwcGTFHjtI8ZCpWD4MGNg/0xWo57Ncg1q8ls54LTUiiKP91ZZDkKhVNUvi/IHmHykntMcEd0E
	X115v09wdWqAMQKNMC3dPCffDOwswX3zsUpOxfsWiF1q2ycZ8x3smutYMe/lp+KPIPm/B1PU54m
	+R6LHmP4farAaTgXsU4ZSSB7KdRJDO+T5hKoEF3x+fpRtlnrwY0eqkPywwONS4S37uqawq
X-Received: by 2002:a17:906:5991:b0:b9d:33ce:e85b with SMTP id a640c23a62f3a-b9d7277bf23mr526436266b.43.1776070536883;
        Mon, 13 Apr 2026 01:55:36 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1a3bsm283831866b.62.2026.04.13.01.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 10:55:35 +0200
Message-Id: <DHRWGKASOFM8.15ZNMEOJJK9F5@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm6350: add LPASS LPI pin
 controller
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-4-36583f2a2a2a@fairphone.com>
 <d3upp33rbn66ioxpc65n7uqwz32kxghzue2n3dkd5k4lch3iwg@qgcppndlte5a>
 <DG0XMT4TZKCH.HPXGS9YTG9FA@fairphone.com>
 <91812db8-9774-468e-8a8b-10699a63310c@oss.qualcomm.com>
In-Reply-To: <91812db8-9774-468e-8a8b-10699a63310c@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-102905-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.5:email];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,33c0000:email,fairphone.software:url,googlesource.com:url]
X-Rspamd-Queue-Id: 109893E96DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Konrad,

On Thu Jan 29, 2026 at 12:19 PM CET, Konrad Dybcio wrote:
> On 1/29/26 9:32 AM, Luca Weiss wrote:
>> On Wed Jan 28, 2026 at 11:16 PM CET, Dmitry Baryshkov wrote:
>>> On Wed, Jan 28, 2026 at 01:26:52PM +0100, Luca Weiss wrote:
>>>> Add LPASS LPI pinctrl node required for audio functionality on SM6350.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 +++++++++++++++++++++++++++=
+++++++++
>>>>  1 file changed, 66 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dt=
s/qcom/sm6350.dtsi
>>>> index 9f9b9f9af0da..b1fb6c812da7 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>> @@ -1448,6 +1448,72 @@ compute-cb@5 {
>>>>  			};
>>>>  		};
>>>> =20
>>>> +		lpass_tlmm: pinctrl@33c0000 {
>>>> +			compatible =3D "qcom,sm6350-lpass-lpi-pinctrl";
>>>> +			reg =3D <0x0 0x033c0000 0x0 0x20000>,
>>>> +			      <0x0 0x03550000 0x0 0x10000>;
>>>> +			gpio-controller;
>>>> +			#gpio-cells =3D <2>;
>>>> +			gpio-ranges =3D <&lpass_tlmm 0 0 15>;
>>>> +
>>>> +			clocks =3D <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPL=
E_NO>,
>>>> +				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>>> +			clock-names =3D "core",
>>>> +				      "audio";
>>>> +
>>>> +			i2s1_active: i2s1-active-state {
>>>> +				clk-pins {
>>>> +					pins =3D "gpio6";
>>>> +					function =3D "i2s1_clk";
>>>> +					drive-strength =3D <8>;
>>>> +					bias-disable;
>>>> +					output-high;
>>>
>>> This looks suspicious for the clock pin.
>>>
>>>> +				};
>>>> +
>>>> +				ws-pins {
>>>> +					pins =3D "gpio7";
>>>> +					function =3D "i2s1_ws";
>>>> +					drive-strength =3D <8>;
>>>> +					bias-disable;
>>>> +					output-high;
>>>
>>> The same
>>>
>>>> +				};
>>>> +
>>>> +				data-pins {
>>>> +					pins =3D "gpio8", "gpio9";
>>>> +					function =3D "i2s1_data";
>>>> +					drive-strength =3D <8>;
>>>> +					bias-disable;
>>>> +					output-high;
>>>
>>> And here.
>>=20
>> I've taken this pinctrl from downstream lagoon-lpi.dtsi. There the
>> active config for these pins have "output-high;" set.
>>=20
>> And fwiw this pinctrl works fine at runtime for driving the speaker.
>
> I tried to find an answer.
>
> A doc for this SoC says that i2s clock pins should be at output-low
> (2 mA) when muxed to the i2s_xxx function, with no information about
> bias settings (perhaps bias-disable), and in sleep they should be the
> same (minus the drive strength note, but 2mA is the lowest setting)
>
> I am further confused because the output-enable bit in the cfg
> register specifically says "when in GPIO mode"

Thanks for checking.

What should we do here now? Follow what you found in the docs, or follow
what downstream is doing (8ma output-high)?

https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-extra/d=
evicetree/+/refs/heads/int/15/fp4/qcom/lagoon-lpi.dtsi#219

I think apart from this question, this patchset should be ready to land.

Regards
Luca

p.s. I also briefly checked Google's repositories (which is the only
known place to have a commit history with devicetree since the
devicetree was just shipped with vendor/qcom/proprietary for everybody
else, without history) but there there's also no hint whether there's
any specific reason they deviate.
https://android.googlesource.com/kernel/msm-extra/devicetree/+log/refs/tags=
/android-11.0.0_r0.56/qcom/lagoon-lpi.dtsi

