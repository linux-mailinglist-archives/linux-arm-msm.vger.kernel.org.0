Return-Path: <linux-arm-msm+bounces-91764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP4xA/C5gmlVZQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 04:16:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68578E133E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 04:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1B0030B9BE3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 03:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25688276049;
	Wed,  4 Feb 2026 03:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+139zli"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7D31A5B84
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 03:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770174938; cv=pass; b=Aie/YPypD+XY/j3SYdWiXZUa34J1ynRx1YuXLv/ze7YxQLFZz9VwSNVh/CqClxC9mgo9E7XnFvVINgTvR43FD/COF5C0w7Cn9GhdyQQCGFwznW6C8QIDwXXBff8mqId0rcsGOPUyBH8dLZi7UPJgkd4Jd3CHR5G2MAe/TDt0744=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770174938; c=relaxed/simple;
	bh=w3RuX0EdoJywT/ZF1+wVVMneHP7KhgEH3rbWMXD3qyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYBIPFDgUAs4lcvkqFkNhbUeyrOyAmSz5+86MyffD9l1W5WC+NFr5vBOZ3A7koPyteHHXmOLcsq83T6uVlU8FP/WnsP8oaeGEOsKZo6LhkwtbJiEYCBbxwRviB6xrQlWiGpX7msyYdyYxlAR17P756oIrVrxj/u3nNKsfxhmEeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+139zli; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-382f0732612so42249521fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 19:15:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770174934; cv=none;
        d=google.com; s=arc-20240605;
        b=Zm+o/wlb9PvTu5VP7zm1E1BHvHxeatoEdKag1D4I0lmKh3ZFzobXzdI7FlEskfQouJ
         caHGXNoOGrHzpADjKr0kx0qkTIjwrKeHCD6NCmVjz8+3itmsZlFNucNCVSNWFnRxBnCq
         lbuF0/igLgk6OZA6aQgNPInG/cqRlXiXSflDeIl3wVARzsOxJtD9ChoMgz81eb8tPD96
         NJUnu7gwA7NImWhqowv4gumgwIKfWJUUECJk5GlckTf0yZrCmoNTiZxB29V7JW5HN5Gt
         i1+68QyAzg526SMP9e4JXOCQxwNwSVq6nsWPgp9dXBZTNAlgxH12gr9RCqWrwNHcs+Kd
         sUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0mVglm06ujR/mwhHNvcx2p+M5YQoSYv8FdwgcVKEQ1g=;
        fh=KqJA7lh8I4y2caoQbUBtHF9U9T65azK2pM1Nezi05/w=;
        b=gcCyL2pJK8kDHhD4VI/X3qpA1FAauGIyjMaxDIIdblHrCIpaHd/0Z0kJ9zeNXP5W07
         +n5ikOUv+ksAX0g0HL9FxqS/tvplX3bbvl8BzPsIw8MI0Rsw1NTkVPoHeOZ6dv3mmhSV
         54u4R7do8lVB1BnCz6KsUjmpOACw50b6ioAyF0IwSCV0FCmrv5oFTjYECykNoMhEvhlj
         MGGBiABdtlVuAv9IPoAFY8B2UPDRjr52H5Qejv4h/MpT/iBB7HIW40HkSnq3QV40kG2J
         Z1s2owkeU8TyP+j0Yal8pe4Zsi+7PZ4iKcUW7vywfbYhR3Rzp0Ve/H10L+2+HbuEp+UP
         Anqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770174934; x=1770779734; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mVglm06ujR/mwhHNvcx2p+M5YQoSYv8FdwgcVKEQ1g=;
        b=Y+139zliNaMhhcuIS9mo/kT0+WBVexdMO3ez/p+8xGqq80WdywkP2696nWte3UP2DP
         wz5FTRqOTLFbodSFpW9wg1YyJLYdEvLWsf8Tue2547S89ybXRnsEGJJ2OIiAs/keiMWg
         qgZsU/02yW+YRkW1N3MXZ0gNtLvPfaxuHbgOJyXsNswd9mGntxTky9FfSXTNx4TCNlEM
         TN/tpA02qyHaDxep2pKraU1Ld+ShcbjRC5WkKO9AhnmOfF0xBDhjQwnWhrjEiS785otq
         OQQ/J15fQsU2HYUMF9MiiTBqKavxNLFoZRBXjdbVYPC8vbw33a6YMAo7Uh+BN54PcQFz
         SeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770174934; x=1770779734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0mVglm06ujR/mwhHNvcx2p+M5YQoSYv8FdwgcVKEQ1g=;
        b=DrC7qPS73jT2kFw0pT+t/mYpfuS4zo4r0v4kSnNRR1bG4o5XalLS2Cd3ZuFyznTTTt
         b/XlWt4zLSfoPEXknLBW2U8GF8OJMnVCdUbul4Ip2hlCD1uxZOZBisThFMo3JovJBn0j
         t45m7LlM7ANEhN1l5CHVbb5fWSPlvFOQ2+u/955bEuLpUkw2Ax1J+aWzYZZ3dZ2PR5Le
         lKViSPJ8etQi01POnNqjTK/JRkLj/sLAqyR1UzXn/JP7IKjjYh2qH8FLRujBRPXroqXU
         iazgCYGLFhQ9Xxjgo1DzdVdLYHGeHgYkzjBqlkuRpCWbBwlRCjQ5+RytJ8ZYdaUvmEGb
         JDrA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ0vczCfvENBsFskdFNRQZrKrShzdJEpd6DULT6eXRZZSntdp1o+z4h1aydYw9VCJsNosax9VlkEIwCE25@vger.kernel.org
X-Gm-Message-State: AOJu0YwLfpgBQt4WLmGZJ00mDk1oEtd3rCkEsl16K43KmO6F70I3YMAk
	USUSnjlgOULOZDNGqcS/eN6omECtcSn8pxUfz56hmk84nB7P01nqGcOl0TYLIP6OgrQy0BB6R+S
	7N2zjAbME2qiS9QLxfPxMSClc/JF8EWw=
X-Gm-Gg: AZuq6aLR9W3zd+molt70Z8HP8FvI2pC/ewD4LBH40h+esvj90WCjzksUSZ8GaKHg87d
	/FNQUPMIl5U3cRuKP/7L95dKtP/ykY/7iKbdnxYQlqBMhaLtxDADRJW4BlBxf/Rzh0iP5QSZ6LH
	s61EVqf/xgebwAYi7CyzRuUHuK4ExwNXXo+jrEfg5d2TJVr5NGPU/BBJgenVI2Z6466x0g/QUtU
	MUh9S3+aRnFUvASQLOp7oLWjqvnZAnsg5lUyhB+SXU6SMryFnOzUuD9B3xJJjffDff4IvA+SRFH
	w1Iquez+BQXqFq/nxOekGuCyvaHNDlyeDALc0I0DHetjyUtsxRUO92sU
X-Received: by 2002:a05:651c:1990:b0:383:20cd:52fe with SMTP id
 38308e7fff4ca-38691cec340mr5911831fa.17.1770174934088; Tue, 03 Feb 2026
 19:15:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com>
 <20260129-sm8550-abl-dtbo-v1-2-abca3be14024@gmail.com> <eef70e37-3841-47f3-a436-13e18c157176@oss.qualcomm.com>
 <CALHNRZ-aj+rR0qFuiU+cPNsHWQgMJ2mMjzysJudY-TPN9tY3gg@mail.gmail.com> <74380f3e-eb76-4fb8-a1a5-d2151fb410f6@oss.qualcomm.com>
In-Reply-To: <74380f3e-eb76-4fb8-a1a5-d2151fb410f6@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 3 Feb 2026 21:15:23 -0600
X-Gm-Features: AZwV_Qg6JaMOWhGu3NI6D8PK2uS0zXrXjlMa9HeSddgrW6ZSwS_RGr3V81bbK_k
Message-ID: <CALHNRZ_uWJRWEfwW_NjdBcWSf_NTYWLg6DJGAyH0-KmonUQFXg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8550: Add tz-log node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kumar Sharma <quic_vksharma@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lei Chen <quic_chenlei@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-91764-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,0.0.0.0:email,mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,146aa720:email]
X-Rspamd-Queue-Id: 68578E133E
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 3:28=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/3/26 5:25 AM, Aaron Kling wrote:
> > On Fri, Jan 30, 2026 at 4:59=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 1/29/26 8:46 AM, Aaron Kling via B4 Relay wrote:
> >>> From: Lei Chen <quic_chenlei@quicinc.com>
> >>>
> >>> Add DT node to enable tz-log driver.
> >>>
> >>> Signed-off-by: Lei Chen <quic_chenlei@quicinc.com>
> >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>> ---
> >>
> >> It's nice that you preserved the original authorship.
> >>
> >> Please extend the rather lackluster commit message to explain the
> >> "why", which is notably different from the original downstream
> >> addition, since your goal here is to mainly appease a grumpy
> >> bootloader.
> >>
> >>>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 8 ++++++++
> >>>  1 file changed, 8 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/d=
ts/qcom/sm8550.dtsi
> >>> index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..740e3c238e8ed0f162dd1=
68291f6e307ace66e80 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> >>> @@ -5136,6 +5136,14 @@ data-pins {
> >>>                       };
> >>>               };
> >>>
> >>> +             qcom_tzlog: tz-log@146aa720 {
> >>
> >> If we were to implement qcom,tz-log upstream, this would definitely
> >> not be a node randomly in the middle of /soc, rather a child of
> >> imem, most likely.
> >>
> >> Could you please check whether adding a qcom_tzlog label to *any*
> >> node makes the BL happy enough? Does it need the properties that
> >> this node has?
> >
> > It does appear that ABL doesn't care about the path name, only the
> > label. And given that the original change that worked had the label
> > pointing at an empty node, it doesn't fail if all the properties are
> > missing. I moved the node underneath an sram node and the bootloader
> > loaded my dtbo just fine.
> >
> > The imem/sram node, though... The numbers don't add up. Per the
> > downstream dt, qcom,msm-imem@146aa000 has size 0x1000. Then
> > tz-log@146AA720 has size 0x3000. Which... starts within the imem
> > range, then blasts quite far outside of it. So... what should this end
> > up looking like?
>
> The real SYSTEM_IMEM range is base=3D0x14680000 len=3D0x2c000, not all of
> which is accessible to the OS
>
> Perhaps it's high time for me to respin:
>
> https://lore.kernel.org/linux-arm-msm/20250523-topic-ipa_mem_dts-v1-9-f7a=
a94fac1ab@oss.qualcomm.com/
>
> > I should also note that an empty node at /soc@0/tz-log fails dt schema
> > checks. I presume that adding any warnings would immediately get a
> > patch nuked from orbit, which is why I fetched a real binding and node
> > from CLO.
>
> I don't know if that'll be acceptable by others, but if all we need
> is a label *somewhere*, I wouldn't be totally opposed to doing something
> like:
>
> /* The bootloader fails to apply DTBOs if this specific label is absent *=
/
> qcom_tzlog: aliases { ... };

I verified this by tacking the label to the chosen node in the sm8550
dtsi and abl carried on just fine. If this doesn't get a blocking
comment in the next day or so, I'll drop these two tz-log commits, and
fold this into the 'fix dtbos' patch, and send a v2.

Aaron

