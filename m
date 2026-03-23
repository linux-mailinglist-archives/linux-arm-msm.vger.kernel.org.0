Return-Path: <linux-arm-msm+bounces-99234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cByEF6o0wWm7RQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:40:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D58042F20C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFA38304CCF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E01BEEC3;
	Mon, 23 Mar 2026 12:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xBy72gcI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44683A758B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269134; cv=none; b=pQDnbDeQLfbwkvbVwfDob96aP6OtyGSStj+cc5TpZipHYxXL+yzcauKds+ufZOUOKc+bF04QPvB/xFY8Zpt14RgMt0BkiC0oS36hdBeFAuV2/Qv79RlSO2lI9Xw1FxijigvgQFbELQbxL8+IMSKzO8pWTo3x6d6pCNK+8bdST+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269134; c=relaxed/simple;
	bh=EaMqpe7Gvk+f0KkZM1xdoZcB1Kyhx8cGrASNkvb3ncI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=dnuWvWYtAsdxeuPwfxAHZ4tYIn+/GTg7Y4vmqDZA6Bddy6dfLs+8oxs6kOVofXj4JsAuse0iqCtBD25399mbGC+MAZMwaZ5V3rzDjfDZ1+i+2DOTHG4hsqLoEQHqtTLM4+aRnRMMj5ClmtzJR/9yY13vD27u42aAcHsT1sfweGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xBy72gcI; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6676d55d01dso4278566a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774269127; x=1774873927; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikFz1SRcP/rW6eUkyNzFzTyCYVUG4zpcRXdMo2dV/lA=;
        b=xBy72gcIHizD3dp1XJMExUtijLYSrEIFPd24HaLDVnm0GFrq2QLitUGuc1ldeG75r5
         2pGqAbjF1jIwRQ3LwkAMa3Xpp1z/HXQvCa2Oekwd9GHAP/QhGya9OP5q7j/+hiw42cWc
         ZRdJ0Xrp09FKmmuE/8LAI1RWqUxBEMuC9uv6I2NHLHEymZ+lCmHIPlBz9dfWEW1Wb3AA
         LeJn+Pk/tlRuTH6z3klUCl8rCzC+i8zrqO3RMS2eK+fSogh2/KK+ScFvTjH4xy0fJ4gR
         sZnKdtRynxNM9MA0OXLNQmUzhyiCW/huyIZSVy+BAPotQtWr5F9I468sxjtQiaNOYJRp
         H8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269127; x=1774873927;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ikFz1SRcP/rW6eUkyNzFzTyCYVUG4zpcRXdMo2dV/lA=;
        b=AaMFFgX7+ubqgqsuyl4HE45vgQTUR2BBFfO+0FSQclBpdmWkJtYb1OtBxiRdS7nbxk
         iwil3LbSVN8hd3s1ZR6N8Okdq1l/wsVm8B4olBh7ZDMGpecoFoyvlAzLey5wMuzo39BQ
         GrvGPTmlmXD1w4hqsExxGGosPsV542cvwJ/V1WeDWdwvcaR9Q58iNpItzIerFrc7KGei
         oQE7zD8K8iHmWWKvg6rHUuF3a457Y6WCTMRwh+8f8x6eDk6C7Zy5lYmEzxMc8L5mVvPE
         uuuJDIow2CHkkbLPfzmnUtIlc89vNjnjWkgFiVbVrMzvqEtlmHPLYp/XJ59ZyKrxL8SO
         EwOw==
X-Gm-Message-State: AOJu0Yz/4kHOkTP7HLpglGYTrkKJECr7VdkjXUet4L4MwZBVSuPEBlyy
	QzLDdydj0LBpckYqCJqIxmt+IRnqesWhRdcMZ1ZimYnADr5FycQYEIim5TFAIu8NStA=
X-Gm-Gg: ATEYQzyGGaKhSj0VwcA7p+ouduopDSNVn/XKp/8mp7GvCICumcI3SVElaGJK6Yu+d2z
	hyKohs5ug31hKvwVmE9x5O0Jdptpw+uUhdtp15WH9xNPOw9fdSnpi14D3ydWt4wbYwwkM9++taq
	OFMcYxQgiqhJQRduY09I4TKQo31v+UwPf2B+a/LI1QX2wJULKV3EZV7xiKoBVf2JRNjakjjqIAW
	8LcYS3ES2Xc6PHjPMP4XNlJS4EIOdnBMmJszQ8H5EEtR1/moJ5xNixEJkK6nG6C/JOHheN/xVP1
	IBDEEZvMgvtngLXng8oWHumf3ZysZa3YYjqVPMSE3BNR2D3bYV2VForIafCvR3nV/WtnJtw4Wzn
	ZVLpISDebijtm2+4b1D/KEKXeruBUdGlnz2kHG6+h7tgFZKEfNeKwcM1DXdjrCxc1miCmvCx558
	zW9tVuv6zH+BSdmN4Q/GzuyK3H77e52iOXkWN7017IFWokrR+iF0yB8fnfjRV8aqV5OShP
X-Received: by 2002:a05:6402:685:b0:669:cc03:3367 with SMTP id 4fb4d7f45d1cf-669cc0336d9mr1300928a12.23.1774269127428;
        Mon, 23 Mar 2026 05:32:07 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cf7e2b69sm3771489a12.7.2026.03.23.05.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:32:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 13:32:05 +0100
Message-Id: <DHA5WVPN3F25.2Q71FMM8PD7UL@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Alexander Koskovich"
 <akoskovich@pm.me>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Kees Cook" <kees@kernel.org>, "Tony Luck"
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: milos: Reduce rmtfs_mem size to
 2.5MiB
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
 <20260321-asteroids-v1-1-4b902901cb49@pm.me>
 <bd33bd53-2539-42ee-ba3c-4a544a61b621@oss.qualcomm.com>
In-Reply-To: <bd33bd53-2539-42ee-ba3c-4a544a61b621@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99234-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D58042F20C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon Mar 23, 2026 at 10:51 AM CET, Konrad Dybcio wrote:
> On 3/21/26 6:00 PM, Alexander Koskovich wrote:
>> The rmtfs_mem region is currently sized at 6MiB but the default for
>> milos downstream is 2.5MiB. This causes remoteproc crashes on devices
>> that expect the smaller size:
>>=20
>> modem_ac.c:281:Access Control Error: Could not protect the region specif=
ied:Start:e1f00000 End:e2180000, PID:1
>>=20
>> Reduce the default to 2.5MiB to match the QCOM downstream config, and
>> override the size for FP6.
>>=20
>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>> ---
>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 4 ++++
>>  arch/arm64/boot/dts/qcom/milos.dtsi              | 2 +-
>>  2 files changed, 5 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm=
64/boot/dts/qcom/milos-fairphone-fp6.dts
>> index 52895dd9e4fa..c0981ab731c4 100644
>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> @@ -724,6 +724,10 @@ &remoteproc_wpss {
>>  	status =3D "okay";
>>  };
>> =20
>> +&rmtfs_mem {
>> +	reg =3D <0x0 0xe1f00000 0x0 0x600000>;
>
> +Luca

You didn't actually Cc me, but I found it on the mailing list anyways :)

>
> Could you please confirm that this was intentional in the first place?
>
> FWIW I see that volcano.dtsi indeed only requests 0x280_000 on a "clean"
> Qualcomm tree

Yes, it's intentional that it's 6 MiB on Fairphone (Gen. 6):

https://gerrit-public.fairphone.software/plugins/gitiles/platform/vendor/qc=
om/proprietary/devicetree/+/b3744ffef87e1f2a232b26e9cb270a1f82554bc3%5E!/

I think Fixes is appropriate since the default for Milos should be
0x280_000 and not 0x600_000?

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")

And maybe a comment like this on top of the node?

/* Increase the size from 2.5 MiB to 6 MiB */

Anyways:

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>


Regards
Luca

