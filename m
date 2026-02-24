Return-Path: <linux-arm-msm+bounces-93855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yONON3AHnWk7MgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:05:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FF8180D13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C4123096A5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 02:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21121EB9F2;
	Tue, 24 Feb 2026 02:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGPFJ+nU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CF11E8836
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771898687; cv=none; b=t576Ies9vY0t7AsZjr73OdgnEJSlOJz5B6WB5UFHk0fWslEK5t4J8Mm2vfPtKx+lwaCzitwvbY/JvHG8yWQO+MqOuqR+RLElvSlPOGFOn1ZbvpwhNmXJKDGqYX2nTXgwqvGJGVZMMoTTRJ4SYtI2OX8ldmU7P5xgCed4EbAyZ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771898687; c=relaxed/simple;
	bh=uLgluuDCj92jXodSMJnL+H8miLgLtj6VzV3cb/Nfglc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCd5a0DExx0YxiRF0UOQGsawFA1ue/pEU/bathY7ZXh9zSHYkKv7L7WTxHgJVa/RYwzJGYh6/AjcUztbeovwQMpEFk/Sk16Akd90dLInMaHlqX1thPmAvyttfcvRDsGwzy4D3E3WmFygygpxPWgrB78Dxhwj0cAjImAL3xfwg4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGPFJ+nU; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cb5c9ba82bso812429385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771898685; x=1772503485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bhavNWQtfwjo29hZM2bT15wiOFGQrdKpiRqxwXs1Kpc=;
        b=UGPFJ+nUlPm/JdkvdY+IqYtE22zztDmdufDVVxaXh7h6iz/FWDHDZruyA2ahlUsGTY
         Vk7SMVFmG1QsTKyTqM5/1tH1Lg10QBVgiNdonB1p9lzPfb6OhSd91cyQDaRLcdOC6dlJ
         zRO+Ou+Ueln8s612D0i+iIlCbpS2yzLP1ZWm454Kqa6WrRXncH1L+jKPgxJHqVxfWzBW
         puw3q2CVcPl87aB2E7pMwcalUp8jxdFx2GR/8m85zBF8mxj8Gbet7Ac5dllofDbWmJsv
         93aGJo2UZ8yzh8MmHfxEge440j80qd7Jrd2Ud2SfV19n0u9u3rPsEyDUhhayQmbRXNx1
         BIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771898685; x=1772503485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhavNWQtfwjo29hZM2bT15wiOFGQrdKpiRqxwXs1Kpc=;
        b=CQCvFAotXQCR0oFrjJpF0A+BVuK3UY6Z+Rs2vj0TD0XmYI2OPm/lm5EDs+Rt6Xmuzs
         dwMV55V55n3PzREePfwHxIHAeCe7ROrVrsyDlHrdFVFGrr49y4R98sVCFevsdUrMywi9
         TLWfqqFgbUiN0iLawvtIOXgEfKMKHbgzvKEJ18M+kqSIRQ1rSK6MsvMIu2W4czZALVxp
         TUTylL1oFTIZ+q1YyJt1Tg3z/6MgTvA5U17Qt3MI81GU59AQ5lp1eBbwCuG11fdAlpS7
         h3la1KaMXogJcUd4fPTMrmUn9+/wtBI4Hia1SIcDS6wtWUR5xpRhmjzrbMc7B8UhzryS
         e2+g==
X-Forwarded-Encrypted: i=1; AJvYcCWkmEIS0IwQkyLjSIGpchXCh3a0Vrm/3a8dsVYcsN0THj1TnMDzLcn1gUebOPmOerctJ+N3eTGKVySAsRyd@vger.kernel.org
X-Gm-Message-State: AOJu0YwNjSn+qHIY3v65mRuOEtd3UZGQGKTbRRrgkM9RgTvDUSx6u9Ji
	EGctSDcKvrG46JCzNNG4sLOUezCkT7rXEp/Td3yo2tmzyma4XjKIDG+E
X-Gm-Gg: AZuq6aJjneLXb1jzE2SLCmpeZzRdNFlTwZUIF4af7p7caPbIsjwLjPLwGGXUmplw+yz
	ZpowyXtNJomo9LdD458owcBbnl95qn0hdDyUYI4ARo4Gihn5YelqczrQQTk9zUwXW2itqUNUHsD
	TOFK0jgXTWr5/8Wxr9XGzu5aR9IzFAYsbUnYeiVYS/PtVux8MiI7AKRUt2USA2FJJRdGa8bLsta
	1TrE8eElN46caPwJ4sn/16HzbDk0NGU//091qu9YxJyzqcD5If8MwTxPxqAbJp13mlHjhl+URpe
	7/tZEmVf2rHom20vieAYKRmC/O6V7Tu3qBVxiSlFe6Z6uSR7K9TAvs6nxfc1VfSpVnh6SLzBFVA
	yUzhNVoKBXN0mgG59QpB3hmTipJURXEouhXYIAxHlrD2UsYmpgsaKlhSOqEP2AjTOWgWAxulwlF
	+KvPMfj3GBaBYD/srkwWKshFgjv7zkxO3DxxJmibg7MInfXI3qqyvl2SxPNxx49KNrVaSC56LXL
	buoCPixdZ4pOVtN5ZA=
X-Received: by 2002:a05:620a:8412:b0:8ca:105a:f5d1 with SMTP id af79cd13be357-8cb8ca0a6ddmr1082391485a.30.1771898685553;
        Mon, 23 Feb 2026 18:04:45 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d122906sm843410885a.51.2026.02.23.18.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 18:04:44 -0800 (PST)
Date: Mon, 23 Feb 2026 21:05:23 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 01/10] ASoC: dt-bindings: qcom,sm8250: add compatible for
 sdm660-internal
Message-ID: <aZ0HY_fMGAWt8nuh@rdacayan>
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-2-mailingradian@gmail.com>
 <yxrhmblavwkuhfrfgskujs7tz7cykojnqnl2mfrf365lhdem35@bgqwiaft67b3>
 <20260211-skilled-transparent-moth-fac10f@quoll>
 <f1b67c1e-cfc1-4d23-a24e-4dd342edd2e9@mainlining.org>
 <f27ec5bb-1562-4bcc-9178-4ff4d4fe00d8@oss.qualcomm.com>
 <aY_uQZxuwt8rDf6n@rdacayan>
 <ddb41df1-2d60-481b-999e-cc480a6900f3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddb41df1-2d60-481b-999e-cc480a6900f3@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93855-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[mainlining.org,kernel.org,oss.qualcomm.com,gmail.com,perex.cz,suse.com,linuxfoundation.org,quicinc.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 50FF8180D13
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 11:53:49AM +0100, Konrad Dybcio wrote:
> On 2/14/26 4:38 AM, Richard Acayan wrote:
> > On Thu, Feb 12, 2026 at 10:34:27AM +0100, Konrad Dybcio wrote:
> >> On 2/11/26 10:55 PM, Nickolay Goppen wrote:
> >>>
> >>> 11.02.2026 09:51, Krzysztof Kozlowski wrote:
> >>>> On Wed, Feb 11, 2026 at 04:11:24AM +0200, Dmitry Baryshkov wrote:
> >>>>> On Tue, Feb 10, 2026 at 09:02:53PM -0500, Richard Acayan wrote:
> >>>>>> From: Nickolay Goppen <setotau@mainlining.org>
> >>>>>>
> >>>>>> Add compatibles for sdm660-internal based soundcards.
> >>>>> Why is it called "internal"?
> >>>> Yeah... I am pretty sure there is no such sound card. You cannot have
> >>>> sound card internal to the soc, because you need the external components
> >>>> like codecs.
> >>>
> >>> It comes mainly from downstream driver name [1].
> >>>
> >>> Downstream also mentions it as int_codec [2].
> >>>
> >>> There's also an sdm660-external sndcard [3].
> >>
> >> It seems like "external" means "coupled with WCD934x+WSA881x" and "internal"
> >> means "coupled with (digital cdc on SoC and analog on PMIC)-over-intI2S plus
> >> optionally WSA881x".
> > 
> > Interesting you left out WCD9335 (codename tasha), is it never used in
> > production on SDM660?
> 
> I don't know.
> 
> I think both were used with MSM8998, so I wouldn't rule that out being the
> case for 660 too

Okay. If the codec needs separate configuration, the sound card driver
can just compare the codec name like in SC7180.

