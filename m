Return-Path: <linux-arm-msm+bounces-114304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4EHJEwSPO2r1ZggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 10:02:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C96D6BC662
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 10:02:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=pD6F2IU8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114304-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114304-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AD7630B52A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 08:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C273346AE3;
	Wed, 24 Jun 2026 08:00:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C401C2DEA64
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 08:00:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782288047; cv=none; b=Q7oc9KngKBfKTrxXSx4ypQuYDicD3ka+NiayekFJctZMcebUtSUSrCje6bBgjg7fsNfs4FQNNZKTsP4ol5EZHUMgo3HiPJhOxvR4AIXFZDlxE/vf0RD8CkBTD1epUnxalT4xScGSOSZOX0NJIZ1Wg1GSLRItFNPpCtnWLRiHUbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782288047; c=relaxed/simple;
	bh=N/YmEEM3JnJUsV+8++0ZovcY2W6+bqMcuqvJyy9zv1s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=mZcAIqlHSa6xzPKQ/+jvZaaQGpowvjrmnYXQpdOc6gLakM2R2mVwimglf+o2+On9ONT0Na/2QZy/PpTWbzfbpZ+Ool/tbMCXogNfxqZSGf48DieaZCG84mnTencCy4DlO09FL/gyMTlMqxHXOhoT+pa+ioeWUmOfjGek9kNI2BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pD6F2IU8; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4924944fe6bso4769615e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 01:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1782288044; x=1782892844; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTWWK32Ejjyq6jHOCCUN+iBQR69zwL/fyrY9B09gGws=;
        b=pD6F2IU8XyjlwbKBMiPB1AuY0GTqUqf1IW1Lj+vHEyrQFu52+gQRj+C6RcKjRHeod7
         PJGMMH2Y3LBIX+CaBzM4hZD5kCUBhCz/wFW8GY4ml+0q2Degapn/JSCO8I8SqfuhmLsv
         TePN/+JouX4sk24eaUNErpw2yMR/zZ0AdGxpkVFU20KyrVwG5N4kkA3DPmWkcNuHn9GG
         IdPPE3Id3FlE9aGZ7QnRubaLEgc85AQu2OrEaAi3f0sYiLMaW4l24PkGHNB0tDTNpyXg
         a1x+3KArB2WkyM9U4XoKXpJBCHcsynFnkK/hBp3WEQYsirfFiA6ISobpLfke0QvGUMzq
         AhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782288044; x=1782892844;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bTWWK32Ejjyq6jHOCCUN+iBQR69zwL/fyrY9B09gGws=;
        b=HDSKIkDiv+moVMWYLieY5LTlOzn5pULa4cUvSDgUUnnaDzYWbn2CBHEgqQu25YSqIW
         lycjm+xCa9CudIQZ3FxknN+kJ9BuX+5Lx3TWPlPhspquC9UtVEb/kP6DuhGvzKbrnyNx
         4tyqi1UeT3mG58KzYXZGN6BkH2z/ZotxdtRLCbomdFJPNQQ5zGdpJZ4lMgjAJQrMhxNP
         k/XUA9gYwzTCwqDuWzxd9l+SuZLnyPc75CS490Otu6Gx5WtyoOfbM5LMn+wv1PuJ+hqy
         gbX4Iej+S+Ryf3vmnfpqmGaIhBf5wKAfsPP/5VpyRhUXQQPUF8Kt6cgWhHAGhMEP/aQp
         RiPw==
X-Forwarded-Encrypted: i=1; AFNElJ/rLSjAl53vftzHXxAewuRN3zNPNgpQya0i/v1iLIJZL7thnDMxIsfftC4l/lwasWmjd1qPzIQTsV68esFa@vger.kernel.org
X-Gm-Message-State: AOJu0YxCNY2wDHGq7yBtDnx5Ua2ubSTNz5Y+K9l0azikxN9/J8i6zYn/
	qiLp6Ka3mxkLygnTdZH2qvp4SFOnli0KG+oh2sEikKlL7TtsWQPhueYw+ws+ELgHg2w=
X-Gm-Gg: AfdE7cneVR2JU+0jiKswOhrksFHaP3WbPf0MlNju6UXQlKS9pbVhBHIHNweXTUWu7eE
	JIhUeuhp72S/IVQxOtCRvWdnezGQ9vqAD7wGSvpnGIJ0GRRFBxsfcsw7QpB7VCT6nTCL2Pg8iZA
	w6uq4ToRVlcsCeGW1OOQdwPKWygZRo7yPnTbJSaKCHpvs+FUmGF6MbVXKOKXY67VK2ZoDg1e+sC
	WXJFCHOvDkYyJOfNakIQFbsIGuFEu3YmuadABdYUGYxHRiKslH4YhBoIf12ZFQu7cYcM0T0nEsa
	g3eDzQNj2fk2x/AK6rU/ji1gdhBdXBZrMD8YgTxpF9BUUmKXjntPMdXvh3nFztylYmHu05NbN2X
	04TnbEvmUEpgM3V0mR+vXOqQu+HrmRQp0Iq/SNqByqhaRoBnqQbjt/UIbK3WrsXi2kFB8qjtPyu
	I8w2Z2B6WHShHFWY8lAEjP/UxIEVVa/xwuf30AGreCRwszVdw1EX9ZIws=
X-Received: by 2002:a05:600c:4454:b0:490:e913:656a with SMTP id 5b1f17b1804b1-49260874c40mr30465665e9.27.1782288041332;
        Wed, 24 Jun 2026 01:00:41 -0700 (PDT)
Received: from localhost (ip-185-104-138-186.ptr.icomera.net. [185.104.138.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249238bfbsm373948445e9.5.2026.06.24.01.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 01:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jun 2026 10:00:39 +0200
Message-Id: <DJH4DPXBAJ6V.1TJTFGBP413TP@fairphone.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Sort pinctrl subnodes by
 pins
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <f05ad4ae-140a-40a7-a6ef-9ac2ddb0a939@linaro.org>
 <DJ747VLQEHIN.Q3SS1FFC9I3L@fairphone.com>
 <ba0e9f93-fd2b-4895-b8a7-8e38eeff9bcb@oss.qualcomm.com>
 <DJFDYAS1AY8Z.3GD4A5UMWLAUC@fairphone.com>
 <99654e01-3a52-4a9e-b003-24230aa6a248@oss.qualcomm.com>
In-Reply-To: <99654e01-3a52-4a9e-b003-24230aa6a248@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-114304-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:vladimir.zapolskiy@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,fairphone.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C96D6BC662

On Wed Jun 24, 2026 at 9:59 AM CEST, Konrad Dybcio wrote:
> On 6/22/26 9:05 AM, Luca Weiss wrote:
>> On Mon Jun 15, 2026 at 2:09 PM CEST, Konrad Dybcio wrote:
>>> On 6/12/26 3:46 PM, Luca Weiss wrote:
>>>> On Fri Jun 12, 2026 at 2:59 PM CEST, Vladimir Zapolskiy wrote:
>>>>> As documented in the "Devicetree Sources (DTS) Coding Style" document=
,
>>>>> pinctrl subnodes should be sorted by the pins property. Do this once =
for
>>>>> kodiak.dtsi so that future additions can be added at the right places=
.
>>>>>
>>>>> No functional change intended, verified with dtx_diff.
>>>>>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>>>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 1382 +++++++++++++++++------=
-----------
>>>>>   1 file changed, 691 insertions(+), 691 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/d=
ts/qcom/kodiak.dtsi
>>>>> index fa540d8c2615..62daef726d32 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>>
>>>> <snip>
>>>>
>>>>> +			qup_uart12_cts: qup-uart12-cts-state {
>>>>> +				pins =3D "gpio48";
>>>>> +				function =3D "qup14";
>>>>> +			};
>>>>> +
>>>>> +			qup_uart12_rts: qup-uart12-rts-state {
>>>>> +				pins =3D "gpio49";
>>>>> +				function =3D "qup14";
>>>>> +			};
>>>>> +
>>>>> +			qup_uart12_tx: qup-uart12-tx-state {
>>>>> +				pins =3D "gpio50";
>>>>> +				function =3D "qup14";
>>>>> +			};
>>>>>
>>>>> I understand and support the intention to keep this change non-functi=
onal,
>>>>> but this pad "gpio50" is for qup16 also, right?
>>>>
>>>> According to my QCM6490 data sheet, GPIO_50 has these functions:
>>>> * UART for qup14 (OK)
>>>> * SPI for qup14 (OK)
>>>> * SPI for qup16 (no pinctrl)
>>>
>>> "no pinctrl" meaning "not defined in the upstream dt as of today"?
>>=20
>> Correct.
>>=20
>>>>> Similarly pads "gpio54"/"gpio55" for qup14 function, "gpio62"/"gpio63=
"
>>>>> for qup16 function, I find all of these are missing on the original l=
ist.
>>>>
>>>> GPIO_54:
>>>> * UART qup15 (OK)
>>>> * SPI qup15 (OK)
>>>> * SPI qup14 (no pinctrl)
>>>>
>>>> GPIO_55:
>>>> * UART qup15 (OK)
>>>> * SPI qup15 (OK)
>>>> * SPI qup14 (no pinctrl)
>>>>
>>>> GPIO_62:
>>>> * UART qup17 (OK)
>>>> * SPI qup17 (OK)
>>>> * SPI qup16 (no pinctrl)
>>>>
>>>> GPIO_63:
>>>> * UART qup16 (?)
>>>> * SPI qup16 (lane 3) (?)
>>>> * SPI qup16 (lane 5) (?)
>>>>
>>>> But the GPIO_63 looks weird, is the data sheet wrong?! Where would
>>>> UART_RX of QUP1 SE7 go? Maybe it should be UART qup17 and SPI qup17 an=
d
>>>> then SPI qup16 ??
>>>
>>> GPIO63:
>>>
>>> QUP1_SE6 SPI_CS2
>>> QUP1_SE7 UART_RX/SPI_CS0
>>=20
>> That matches pinctrl driver and kodiak.dtsi at least. Still, the data
>> sheet is just wrong there. If you have any contact to relevant people
>> there, please let them know!
>
> Please share the 80-xxxx-xx number and I'll see what I can do

80-20659-1 Rev. AM

Regards
Luca

