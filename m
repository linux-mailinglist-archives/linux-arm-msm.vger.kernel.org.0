Return-Path: <linux-arm-msm+bounces-118204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +j2wN5+7UGrQ4AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:30:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9D57390DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:30:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=egpopu1Y;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118204-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118204-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E17CE30430FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1220E3DA7F3;
	Fri, 10 Jul 2026 09:14:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F1F3D8133
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:14:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674849; cv=none; b=njr5re9jnfsb1U73zm2BWRnp87BEWX/GfY6kV4UJnh5yzoW56Xv12nllPpoYki9JMNqY6LuqMuE5NJIusHr+oM0Ie2YhFHE1X7dJkR2/fFENemjXtWQd6HXmuDz6Uk3IIc4Ed2Q63lItig9uRM9TwP6g6o8UjJi89DM7cG+ytTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674849; c=relaxed/simple;
	bh=wvm0Fz8XYIYbczgHms8ZrTvLBWRhMOwJik9BqwmZWZ0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=igViBvPrtgOjLRUTraB6fWvWuXrwIx+wvxu0HgFsFoK/6rg4cqXrW5wJVDS06mJO4u3fl1rlNQ272FpaFgQNPcJ59g2ktGYYn92pS4FBEhPoD0yZPbCm4mH1Y5tI7MdVkA1GwUBIFZSTvWi/uwmieTid0tjKVT3eqXErWd4H1DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egpopu1Y; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64B61F00ADB
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783674847;
	bh=Gisgv0ebT87Te8MKY+33sOY2poYhk37ewFT2aaSfjfo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=egpopu1Y8pY6TN8VsDpAnZH0orptIhnNeIXVjr+p9ei3mUzk5FZPCGc9QLimiwDR9
	 9GreB3RyX6o+Q+/eZ+0xlsGWgwdS5yhsdI50+Ps1v0egAyo57DzH4mdWVbVJrmddIU
	 tsFUkBmaMjCbM3Bh9MSSX7ZUtQy2R6rf/lZBbPyuHQXlxKu5kbI7Ezg46yaCUdNNIh
	 06iTfRMJkEsG9m2Xq2oDlEAzVkvIPtRcqj7zFDw7n/s/l48v0Bq9EmTSFWycFNqqhj
	 usrX7B7as927KJLZmwY3HLUGhuFRb1a+R1aUQEFxlT86fXXXyZWUP2eT13ckJzurny
	 SO9vqNWBCro5Q==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c9452244aso7598751fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:14:07 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx7qZtZNtFrCKgqNsg8eiYWKZ4CNA6WFHQ3Ec9G/dJsSC6heXlv
	SS9xGKEiKGb4Nfi2U9awRnLaKYuxdvi7JUkS1EVf2e1qurLasWuh+lgmcIgC6TzTaOG1HZSBTUw
	Q6ywMy/pxkUYhMsK8S8bW0XxK52T1oCkDTm1PzeSr9w==
X-Received: by 2002:a05:6512:1417:b0:5ae:b861:ac27 with SMTP id
 2adb3069b0e04-5b01147ae74mr2483538e87.18.1783674846362; Fri, 10 Jul 2026
 02:14:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Jul 2026 02:14:05 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Jul 2026 02:14:05 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <fab734fd-adfe-45b6-a10f-a8a25f7affb1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
 <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
 <11796dd7-11c8-45e3-8f9e-1dc27da0b229@oss.qualcomm.com> <SN7PR19MB673648D6C15A8E15D35F1E5E9DFE2@SN7PR19MB6736.namprd19.prod.outlook.com>
 <fab734fd-adfe-45b6-a10f-a8a25f7affb1@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 02:14:05 -0700
X-Gmail-Original-Message-ID: <CAMRc=MccvtBxJaddbX0PjjMpV+6iwZeYf2ebq953msbMeVN=Aw@mail.gmail.com>
X-Gm-Features: AVVi8CdKT-87Rn0i992Lmq5_HUcS42coPx89xQWRp9LuWVbKoC0rtNyngcwzlVw
Message-ID: <CAMRc=MccvtBxJaddbX0PjjMpV+6iwZeYf2ebq953msbMeVN=Aw@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: ipq5018: add node required for
 Bluetooth support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	George Moussalem <george.moussalem@outlook.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118204-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:george.moussalem@outlook.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:jeff.johnson@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,outlook.com,kernel.org,holtmann.org,gmail.com,pengutronix.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,outlook.com:email,mail.gmail.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B9D57390DD

On Thu, 9 Jul 2026 20:40:04 +0200, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> said:
> On 7/9/26 8:25 PM, George Moussalem wrote:
>> On 7/9/26 22:17, Konrad Dybcio wrote:
>>> On 7/9/26 11:18 AM, George Moussalem via B4 Relay wrote:
>>>> From: George Moussalem <george.moussalem@outlook.com>
>>>>
>>>> Add node to enable Bluetooth support on the IPQ5018 platform.
>>>>
>>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 16 ++++++++++++++++
>>>>  1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>>> index 6f8004a22a1f..8c252fa3ff5b 100644
>>>> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>>> @@ -453,6 +453,22 @@ tcsr: syscon@1937000 {
>>>>  			reg = <0x01937000 0x21000>;
>>>>  		};
>>>>
>>>> +		bluetooth: bluetooth@7000000 {
>>>> +			compatible = "qcom,ipq5018-bt";
>>>> +			reg = <0x07000000 0x58000>;
>>>> +
>>>> +			firmware-name = "qca/bt_fw_patch.mbn";
>>>
>>> Hm, rethinking this, it must have ipq5018 somewhere in the name
>>
>> I agree but all QCA BT firmware and rampatches are published in the
>> /lib/firmware/qca directory, see:
>> https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/qca
>
> +Jeff, Bartosz?
>

I'm not sure what the question is. This particular blob doesn't seem to exist
anywhere in linux-firmware yet. I agree, ideally the platform name should be in
the firmware name so let's upstream it to linux-firmware as such? Am I missing
something?

Bartosz

