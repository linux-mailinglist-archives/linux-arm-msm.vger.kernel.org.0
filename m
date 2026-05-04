Return-Path: <linux-arm-msm+bounces-105749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBjzELqe+GnHxAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 15:27:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2DE4BDDFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 15:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A22E6305A29E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 13:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC883DA5DF;
	Mon,  4 May 2026 13:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Vfe34t3l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92C13D5227
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900878; cv=none; b=G4kVmYUUTfVh/OUlaH7JaQRpLFrPFnH9P+UbhQLLpkGLlap3xFRolgNSJsqEQf9KbW1tduSS5/5+CPQ/AVI0H3L0RVfRZCNncuQappDQV6MW0ZAtyubNbYuG1zj+s0aFqDUYQlaemEMoX46qv5Tg5nroi0L0icr6HreFP/okrjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900878; c=relaxed/simple;
	bh=RRcMT5aXF695WT2y3yloWwLGYO0Wery2Qd+Ip0HySMg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=dt/0SSn18iw5lt/OxBN+koDkGBjPkkjme/yUtc3y4ojoXOo4deTZIrN24mJC/Y1ARjir3l5tHDiy0P3daSuBFGhUUKDbs9m/M9eZWctWybtGVAoccGnrO9FSQKZ/vdx47hV4Gz4wVPYerGP8RFeDc+Pr9BqeSOGhPDmFeBTvx2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Vfe34t3l; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67c566cb519so2529409a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 06:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777900875; x=1778505675; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cu51mh4jahJU18+vQyHL65Jaia7lK69Ad8pkf9BheHQ=;
        b=Vfe34t3lpzoBSlxMarmtHtJZ6Tq8MHmt9dUapF07HnO9QtHzkXSFoBbdbpjPA/dNPd
         LSHmqVNmgtS/Qcz5ksymrf9ETnAbokCKpfuGVccUjzpRCz3iZfwmdp5yZYdVq8Qt2rXb
         kdmeUi0CpFyYSoEkHdYKBEQXmmzp9qGQOvMJyM1TVUQzcM5LKckfhLkLah/YA0tu/aWL
         AEKft72sUUKEP3w0ESKp/LA2MAZHBaBmQ35/ntiwCWK00l+dTtboshhep/kHmoHX4Y+4
         G+tTJq9M8uDty92qngjUPNEuJEfMnojvoEJikJPylhqyWkRItzTDCliU/KwFuZt80ntD
         2dDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777900875; x=1778505675;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cu51mh4jahJU18+vQyHL65Jaia7lK69Ad8pkf9BheHQ=;
        b=bMepuS7BVBMvwTvI0rvOQtg6UBDUSuRscY6WALeZ9yQfBdoO8pwTodNasrAmVOt5g+
         ukzxGS130kpQaWeMbpoEgl5YnI64Dfnd6QI4hw/nSG+8VRUhU6ZN/O4sOrTwjQyG+zwr
         tHLUjn2wx/vKjKzy6zv6re+s0bH2wf0kN+KveORJ1satpVBuX/p0Fq6SuVSiVimWpTmW
         i2Up0H62Ctmxmj8nqD0nTt4xJ2rcKD8jlRFmil0Bqc1U8YTFsNWtwJhqXowtQjNfmxE5
         o+0V5Kq17rX64mFgh24L1k0W8wGULq5PNXrnKad0ieL+r9WXo4kgUv3Gw6krs0zmlY7d
         NrrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jk8Q139s94y8vOdtLcdXVBJmXakuBE7FpCy0AT+fj54KKrKFagIl6JlzE3rLAN7+g0ucISN0q4KFKdgiq@vger.kernel.org
X-Gm-Message-State: AOJu0YwUuETtGpLjqqDRzSMcDQVM0GiN7MLefG+ZPtGXncij85HGf3Fj
	/nVlC5ddboFmse/I+ZyNS6zgLdVD/i6t4iygW2wTovRRI25iTr9ULeNZpmzSqqh89hU=
X-Gm-Gg: AeBDievcAgJo255bCYvdYm16e23ShMlHsYA58a4Cyj80DI2p1Ve8ywwJMtAjRHxOXTe
	+zhHNYp1xeFK6tY7p25gmfl/ahs2QkqDu21LNWl8duwwRxYGmJsOgNiAXIu814kBkO1w53LRNLs
	EB90Wv6Q2PFLBxfQNG8IXEt2d1nklqQQM+Mh3Lz7ITJTcFBFvmKQ+7nM8dBmzrbFU3zSv8HMgQU
	3ljlIWVYm4G0/S2ushz4o7fIvs0SUtWVaQFXIjUcQtlVeTKmnmZcs/ccWAWbBFCBA7oZgdPOl0r
	ZGo03MbhCDMSzgnEqG89e9Vqnylp8J0QoWzxxjucYyitLgV8QHv+KbJSq/7DRh3E8mraFzq2d5O
	AJGLOACKUiegZ2i6dYb4mgBu2+4vv7Y/aNI8E8sZKbzuNsvf2DXQrvuQ24rjDC0faV7pDCAdKtW
	2OxOQd5Iu2z8mBPkYqxtJCZS015NXGZyN65PEdacdZsDtDL6r/inuZSsVweo+E5mckoOHLOEnai
	rlJZAU=
X-Received: by 2002:a05:6402:2b99:b0:671:eac2:d328 with SMTP id 4fb4d7f45d1cf-67c1992a1c7mr4428495a12.10.1777900875106;
        Mon, 04 May 2026 06:21:15 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b85e28ef8sm3367092a12.2.2026.05.04.06.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:21:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 15:21:11 +0200
Message-Id: <DI9X9D3TTIRE.1CGHQI2LEZ1UL@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Jeff Johnson"
 <jeff.johnson@oss.qualcomm.com>, "Baochen Qiang"
 <baochen.qiang@oss.qualcomm.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Alexander Koskovich" <AKoskovich@pm.me>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, "Marcel Holtmann" <marcel@holtmann.org>,
 "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>, "Balakrishna Godavarthi"
 <quic_bgodavar@quicinc.com>, "Rocky Liao" <quic_rjliao@quicinc.com>,
 "Johannes Berg" <johannes@sipsolutions.net>, "Jeff Johnson"
 <jjohnson@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-bluetooth@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <ath11k@lists.infradead.org>
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: milos-fairphone-fp6: Enable
 WiFi
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
 <4fbs4arx6sez6fffy75ctmzecfvitr6aocau3cczlr2ps2ptld@v7wpa2irsihl>
 <2514523f-a43f-4470-a69b-3d5175d10385@oss.qualcomm.com>
 <DI789NOBWJHK.1V3SFQLCFLS4P@fairphone.com>
 <870d16bb-b426-4285-a299-deb09ae90243@oss.qualcomm.com>
In-Reply-To: <870d16bb-b426-4285-a299-deb09ae90243@oss.qualcomm.com>
X-Rspamd-Queue-Id: AE2DE4BDDFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105749-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pm.me,gmail.com,holtmann.org,quicinc.com,sipsolutions.net,lists.sr.ht,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]

On Mon May 4, 2026 at 3:10 PM CEST, Konrad Dybcio wrote:
> On 5/1/26 11:20 AM, Luca Weiss wrote:
>> Hi Konrad,
>>=20
>> On Tue Apr 7, 2026 at 3:16 PM CEST, Konrad Dybcio wrote:
>>> On 4/3/26 9:35 PM, Dmitry Baryshkov wrote:
>>>> On Fri, Apr 03, 2026 at 03:52:53PM +0200, Luca Weiss wrote:
>>>>> Configure and enable the WiFi node, and add the required pinctrl to
>>>>> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
>>>>>
>>>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>>>> the missing pinctrl to make the WPSS stop crashing.
>>>>>
>>>>> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY=
@fairphone.com/
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++=
++++-
>>>>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/=
arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>>> index db72418b7195..d8ac495ca7c8 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>>> @@ -242,7 +242,7 @@ wcn6750-pmu {
>>>>> =20
>>>>>  		clocks =3D <&rpmhcc RPMH_RF_CLK1>;
>>>>> =20
>>>>> -		pinctrl-0 =3D <&bluetooth_enable_default>;
>>>>> +		pinctrl-0 =3D <&bluetooth_enable_default>, <&pmk8550_sleep_clk_def=
ault>;
>>>>>  		pinctrl-names =3D "default";
>>>>> =20
>>>>>  		regulators {
>>>>> @@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
>>>>>  	qcom,tune-usb2-preem =3D /bits/ 8 <0x6>;
>>>>>  };
>>>>> =20
>>>>> +&pmk8550_gpios {
>>>>> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
>>>>> +		pins =3D "gpio5";
>>>>> +		function =3D "func1";
>>>>> +		input-disable;
>>>>> +		output-enable;
>>>>
>>>> Hmm, if it's a sleep_clk, should it not be handled via the power
>>>> sequencer?
>>>
>>> If you mean that it may be needed to toggle it with specific timings,
>>> possibly..  seems that WCN6855 has a "xo-clk" GPIO defined. I requested
>>> access to some docs that I think should have the answer, hopefully shou=
ld
>>> get it soon.
>>=20
>> Did you manage to get anything there yet?
>
> Yeah, sorry, it got lost in the sea of emails..
>
> The PDF talks about the electrical requirements of the clock signal and
> the section titled "Power-up sequence timing" doesn't mention it at all,
> so my assumption would be "OK so long as it's ticking before you power
> up the WCN"

Thanks for checking!

Is this an R-b then?

Regards
Luca

