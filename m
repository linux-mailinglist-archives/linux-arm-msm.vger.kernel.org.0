Return-Path: <linux-arm-msm+bounces-91136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EE5zC8Qbe2msBQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 09:35:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DA1AD8F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 09:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5CE65303A3FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 08:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CDF2E764D;
	Thu, 29 Jan 2026 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nibbBz65"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5748F37AA88
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 08:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769675577; cv=none; b=Cllx5YyyA+HiXKvWE+CJpXZviPoWxwwFeJ0wVlil5/K3NEFuRfoR2YXoMBnz98liMOkHi8DJ8vkVMcoI/6AOtD0E4H/56cPP0IyuadN+WBigF/ulRw37JRxGmXtTczlM7b3sC7jYF2sYJcx+0qGGo3WbFNGoD2BPMuXhvO7smXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769675577; c=relaxed/simple;
	bh=f1GxHtLA5dSfXy2NJ+XkS6cb4bnCDot1iUR59DpR9nI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HrD/IqnFP6GVCBn1+Qt6ye4ZrEQ1tx2uOO2Gfhs2J7rq3hfWw2V/f+Uc+4t6W9DXVWqfjvMOFXGDq3bJJORUeP5rLmyJ3N5V4tBTTY1hlrbl7Eg81wxbY+W3Et9gWDhVdO2Cue24o8UiGrg1FakeEM29d/zn2YkgiNyFKeGIUm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nibbBz65; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b8850aa5b56so114390566b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769675570; x=1770280370; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaxUdD0qwQbZkk4erIr/YJtf7yeY/WCaddsKbD6XYuw=;
        b=nibbBz656o83NmT6mrloXtlpnlyhz3DhmOQ8fConLPwk8TOVQukpZaFQaQU3JJZg2/
         UKkHK7gwneRZzHFW3P99sFMCngSpJEV7SbiePeMN4fwfGgrTlHggmni6DKUS2eGLdVF5
         KpDxwwgb8n9OuhEWwQ3KllJUX33AwiC90xms756MwU5ul+9o90R+wxHQP6D7CW+dvvDV
         9M6rliQV5lIbBakyN2pqk1yI/E7mfJ6cqGgANiJS+WuNxGwAo9aMpTe36l5lyzdgTnuF
         iKlOcSSEfpw5DNfVrssJo3sS/td1Xa3tRJjvtlmXVwdtVKTB7IqSjCljZP8V8E8aWKOz
         k73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769675570; x=1770280370;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XaxUdD0qwQbZkk4erIr/YJtf7yeY/WCaddsKbD6XYuw=;
        b=ufFN648XJzG/uZptJtQ5/SvHignFEHBbf4CaENpOE2340FZ5Dpi8qCyKbwJzXl8EN4
         g2uFghFFiJVvDAWmCuta1NTnlwfclS3LZBAHQXmTpNquokg4RPFK5qusL+8VO/fTM2xK
         sRk973wdD6tdebMpN4iqIBLzFhy0c9N5Wl9dImRYgV+I9D6FLB5JR7KoQiR6vtuWUFkZ
         WdBZuNCD+Gnb7xEGbxDO+A4bKpddJ/IImWVLruaoPqOWyfOFaiIM1edeaNxdZcwOMBEB
         vgH/GyeCuRU9gZdBHUbTnBa0P3Tdpz0ngQ+/XYHG9E5qKHwRaY7xdZaAjewST1EWtJlu
         ws1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSWaz97Coq9iWau3jyVhLCgUiiXdspVuh9NkvL44b0S6YfDXTFar/v62cVD3P66x6DjMwqH05eHEHm78wA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnni3Y7YsZa0Y/N0Qvp/UhbG6re/oG5gcoZdvSGgGezcdq9jSY
	+AmsFpS7/1Y0Z2oF5W5tvvJstpiYNiFbIzvYgOlLbyTFpG/ZSlPfRELQCCugfcrdVus=
X-Gm-Gg: AZuq6aJvABXtXjfR325w9ixX6xskiBANQYpWXmq2getWglfkfWo7W95aLCAN8Y/Kvq3
	31uT9MtB9MxDpMieW1b7xLjjczDUxxApFPVJIluOwK8KfokXn6fPdGYv99HvkoDn6S5v/YKL1y9
	afTEr+yR2EtgJ/jXozVzCUFYV0pD+gckv/ppeiryPUIdmSlKN2yd3ZchwE8EGo3jA4gjzu/SHXA
	IWvlztfwtT8ymZMNVrsZF3wzTfG1K/P1wbIeg8QYCr38E37eXNnFLTB2STv0yamkOHMAJhZaRL0
	bHZkl9hk0K05/OFH1IMFT818Q3aG6JLfU6Fu3v6Mu+HNDHVXgbRiz//driCnmLPbbgkpob+qWCE
	8TqZlQ8Alnzsu3g5wXMec2mO623TlZUs+J6UgoKCNgWYS6voMIlhB/x7UmqvQ2lsxYvKIP9Abvv
	fjVr9nnIyEQi8qv0A58wm9kqJg5TXMqwVqiSD+XH8m11rTlu3anpOv4Ahz
X-Received: by 2002:a17:906:c10d:b0:b84:2fe8:b5d8 with SMTP id a640c23a62f3a-b8dab2d6bb6mr578618466b.14.1769675569833;
        Thu, 29 Jan 2026 00:32:49 -0800 (PST)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf183cbesm224977466b.38.2026.01.29.00.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 00:32:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 09:32:49 +0100
Message-Id: <DG0XMT4TZKCH.HPXGS9YTG9FA@fairphone.com>
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
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-4-36583f2a2a2a@fairphone.com>
 <d3upp33rbn66ioxpc65n7uqwz32kxghzue2n3dkd5k4lch3iwg@qgcppndlte5a>
In-Reply-To: <d3upp33rbn66ioxpc65n7uqwz32kxghzue2n3dkd5k4lch3iwg@qgcppndlte5a>
X-Rspamd-Server: lfdr
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91136-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,0.0.0.5:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,3d00000:email]
X-Rspamd-Queue-Id: 75DA1AD8F2
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 11:16 PM CET, Dmitry Baryshkov wrote:
> On Wed, Jan 28, 2026 at 01:26:52PM +0100, Luca Weiss wrote:
>> Add LPASS LPI pinctrl node required for audio functionality on SM6350.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 +++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 66 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/=
qcom/sm6350.dtsi
>> index 9f9b9f9af0da..b1fb6c812da7 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> @@ -1448,6 +1448,72 @@ compute-cb@5 {
>>  			};
>>  		};
>> =20
>> +		lpass_tlmm: pinctrl@33c0000 {
>> +			compatible =3D "qcom,sm6350-lpass-lpi-pinctrl";
>> +			reg =3D <0x0 0x033c0000 0x0 0x20000>,
>> +			      <0x0 0x03550000 0x0 0x10000>;
>> +			gpio-controller;
>> +			#gpio-cells =3D <2>;
>> +			gpio-ranges =3D <&lpass_tlmm 0 0 15>;
>> +
>> +			clocks =3D <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_=
NO>,
>> +				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>> +			clock-names =3D "core",
>> +				      "audio";
>> +
>> +			i2s1_active: i2s1-active-state {
>> +				clk-pins {
>> +					pins =3D "gpio6";
>> +					function =3D "i2s1_clk";
>> +					drive-strength =3D <8>;
>> +					bias-disable;
>> +					output-high;
>
> This looks suspicious for the clock pin.
>
>> +				};
>> +
>> +				ws-pins {
>> +					pins =3D "gpio7";
>> +					function =3D "i2s1_ws";
>> +					drive-strength =3D <8>;
>> +					bias-disable;
>> +					output-high;
>
> The same
>
>> +				};
>> +
>> +				data-pins {
>> +					pins =3D "gpio8", "gpio9";
>> +					function =3D "i2s1_data";
>> +					drive-strength =3D <8>;
>> +					bias-disable;
>> +					output-high;
>
> And here.

I've taken this pinctrl from downstream lagoon-lpi.dtsi. There the
active config for these pins have "output-high;" set.

And fwiw this pinctrl works fine at runtime for driving the speaker.

Regards
Luca

>
>> +				};
>> +			};
>> +
>> +			i2s1_sleep: i2s1-sleep-state {
>> +				clk-pins {
>> +					pins =3D "gpio6";
>> +					function =3D "i2s1_clk";
>> +					drive-strength =3D <2>;
>> +					bias-pull-down;
>> +					input-enable;
>> +				};
>> +
>> +				ws-pins {
>> +					pins =3D "gpio7";
>> +					function =3D "i2s1_ws";
>> +					drive-strength =3D <2>;
>> +					bias-pull-down;
>> +					input-enable;
>> +				};
>> +
>> +				data-pins {
>> +					pins =3D "gpio8", "gpio9";
>> +					function =3D "i2s1_data";
>> +					drive-strength =3D <2>;
>> +					bias-pull-down;
>> +					input-enable;
>> +				};
>> +			};
>> +		};
>> +
>>  		gpu: gpu@3d00000 {
>>  			compatible =3D "qcom,adreno-619.0", "qcom,adreno";
>>  			reg =3D <0x0 0x03d00000 0x0 0x40000>,
>>=20
>> --=20
>> 2.52.0
>>=20


