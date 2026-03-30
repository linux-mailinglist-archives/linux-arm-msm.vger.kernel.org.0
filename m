Return-Path: <linux-arm-msm+bounces-100870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G01HnevymnU/AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 19:14:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E289E35F369
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 19:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EADE300FB7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 17:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABEC33B97B;
	Mon, 30 Mar 2026 17:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geSVXoXb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC769341650
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 17:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774890867; cv=none; b=X1mE+UozmkOg8mAV6plHPAK1NDucFysrbvHROQxuoJ1DPd7lprH/kBSWjIuwcyCWB4aHd4RS0s4Y3ns9pTSSGJW3b+FROw696+i5OVU6yPCU4Vo4Kn5DxgeyeX38BTRvoB0TKLoL8nqQVN11ZWmb+abYtPlV8w3eun031AMBcT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774890867; c=relaxed/simple;
	bh=XYTOVkoEGusHSmstwOHypWXIz7+R10YaZTQEC2zhNLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F34Yyz5jEC5UHSMmwffr4fI3zVK8EHfQ7FgEQMqA4lZA/yzYTFF5HA6/AlP/5sDNvKUEMXOma+lk9Zb1eRehUnIfm9bBhZTIYwt3Gq1Olqymy25MDdKpdo/oSHDERL42/U6GorC2dplA8nwjKM9fAfRpivOttPse5c+0fY31xT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geSVXoXb; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5091d71aa11so57769451cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774890865; x=1775495665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6PqJcIVn2A63jBO1ik10b5dMY7je6jkjKnjpNon1dQM=;
        b=geSVXoXbyiiOexjRiTtwiSxkdZ7U72SIcoHgxAyxRrTS79gLJvaLDRwqV/tPQwDg1z
         JF1yQ9Q3fp01z4eaZN682diAqU/IckAbJzl20gsoC2QMctw+m4GgU3JyuGcGF0jE12R2
         oxEYr4A6a9WoZiV/PRl0eFqX1tvNS9RN+0kFkcALhyLaS9x45vU2LZ/JuGpdPZr4UEkC
         EdSYA40UT3QEeYa8zMr1P4OQUolmp05e6YFhb9p7rTsWJui7p8VGG7nYpXD1h4y+gZcM
         eAtmgIeRS87IgarJ4QNj5Mwtvo6hOAkU0Oav6EGhePovnlRZBUl4DM/R5mw44Y7AYS3g
         JdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774890865; x=1775495665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PqJcIVn2A63jBO1ik10b5dMY7je6jkjKnjpNon1dQM=;
        b=ZLuFLsuP1ldU4Pzs4BudIM1YVjj81f0XAdfd+YqcMRmpPv9omLT2yHcNYSNDKgqtEg
         Q3hpDNZmW+aQbPbvbXzhaDdrXVTVAsE9jZOHJ70BptDIDPjJbxL+33NR8DJo156DkjY5
         wjoeISBcU8DzUYl5IQ6tKia7++QmFbGQrzqGvYMaVJZtJFHLdSBlA83I5gPVhv5s29/W
         FVW9/IYWB09wu1v/2Qy3dNQkFHG6jHbYiw6QLdLmk7fyVnvw2zzbzGwdUh/3CuTy+E4W
         WVliFBhi0NXwJ7VXyJACuiFBBbz8O8u1lp1Hrco5KFi81EWkirvqqEtgkUjElpxizAbx
         56Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXc9MmrjznsETr1FMJF9UCA4DQmxf8faHYHVrbOMgkdrNhgYwb0RrMGd2TJwvfBl9vOfoehJz99B8oJXNvk@vger.kernel.org
X-Gm-Message-State: AOJu0YwuWuQPpr3t6GFZoquQpEx2vzIyJlsEtmc0YWItXhaCEzwhAHG6
	8sN5xpwfvRDdCB2ka300yMcQPDzkkQoUH5JB6SmWD7TmM2eanej8HJQq
X-Gm-Gg: ATEYQzyK3BqGqRc3ftLhI4aAg0GSr8fDgjGNN3XAS3+qvd9Gs4KcvT+UKYulF9oIiOB
	Z2ebuRvCF9jX8fEkbsAiRb94gUIUgM627PLXYEHFYTKLJwZowZ0Y4FebG0q0fbT8pUyLGPt2PDQ
	qcLEACw+5pZTLb5IZivLlxTxWRHeWY5t9JE5eGI5nPuw+OWQPVRaBmS13qhODHjFiee7W8B9fkw
	6P6gZSKxWFLVS6tJrn8I2GcsFNCyAde4q+bh4+zTnkrwoSKzIQ5pUza2iLNJ6AmacR8vPpcznQD
	8KNN8UQg2KxgQqp8xZ5U2wE7W0M1Pw935ETPZrAgsvEi7cmHEWcA2Q3ui1jcgPsSnfzFTwpapqP
	IFe7zYWCwO9O9AzBeiJ82TYtFgX3kvLHhFymApbm+CGiJZcea+1vcmT6wz1q85fuhfxFPrBt78y
	2HBImJWMwYTPzX1a38mPy+2ZA=
X-Received: by 2002:a05:622a:4604:b0:509:2231:977a with SMTP id d75a77b69052e-50d2c8ffd6fmr3608621cf.30.1774890864504;
        Mon, 30 Mar 2026 10:14:24 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c67fefsm66255341cf.4.2026.03.30.10.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 10:14:23 -0700 (PDT)
Date: Mon, 30 Mar 2026 13:15:07 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Nickolay Goppen <setotau@mainlining.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v2 11/11] ASoC: msm8916-wcd-analog: add quirk for cajon
 2.0
Message-ID: <acqvm25ap4LTSB8j@rdacayan>
References: <20260304195815.52347-1-mailingradian@gmail.com>
 <20260304195815.52347-12-mailingradian@gmail.com>
 <aalV5dBloD1BmwzZ@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aalV5dBloD1BmwzZ@linaro.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100870-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,mainlining.org,quicinc.com,linuxfoundation.org,opensource.cirrus.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.393];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E289E35F369
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 05, 2026 at 11:07:33AM +0100, Stephan Gerhold wrote:
> On Wed, Mar 04, 2026 at 02:58:15PM -0500, Richard Acayan wrote:
> > The codec version CAJON_2_0 on the Snapdragon 670 requires touching the
> > HPH test registers. Add the quirk so this driver can also support
> > SDM670.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >  sound/soc/codecs/msm8916-wcd-analog.c | 63 ++++++++++++++++++++++++++-
> >  1 file changed, 61 insertions(+), 2 deletions(-)
> > 
> 
> I think you need some more changes in this driver to support CAJON_2_0
> properly. Specifically, the initial register settings are different from
> what is currently in the driver (wcd_reg_defaults_2_0). There was a
> patch for this [1] (later [2]), but it doesn't look like it was
> merged/finished up.

(+CC: Adam, Vlad)

It looks like the codec part is mostly complete except for some trivial
changes (empty line after compatibles in dt-bindings, constant to use
BIT(n) macro). I can take the codec patches if it's okay with the other
submitters:

- [PATCH v3 2/8] ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953 Adam Skladowski
- [PATCH v3 3/8] ASoC: msm8916-wcd-analog: add pm8950 codec Adam Skladowski
- [PATCH v3 4/8] ASoC: msm8916-wcd-analog: add pm8953 codec Adam Skladowski
- [PATCH v3 8/8] ASoC: msm8916-wcd-analog: add lineout output Adam Skladowski

Maybe all the WCD codec patches should be split off to a new series,
otherwise this series would expand to 15 patches.

> [2]: https://lore.kernel.org/linux-arm-msm/20240731-msm8953-msm8976-asoc-v3-4-163f23c3a28d@gmail.com/

