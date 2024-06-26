Return-Path: <linux-arm-msm+bounces-24224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B38E7917988
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 09:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 680481F23E84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 07:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186CF1598E3;
	Wed, 26 Jun 2024 07:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M441vDkn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D8B1847;
	Wed, 26 Jun 2024 07:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719386548; cv=none; b=hTfbTOLk9Mtw6BuT+p6T+hv2ZrRi16OlQ3Ekjeg1NjNArtHR8FDHM4YzuJv/2JnhvlAm+ON88uD5jCAU5+zLLYka0PZKU/aMn03jCBKNzvu9B+I9hHrvBsnNdZSU8hLw/rAXw8u86Equ5K2k150slRhC18gAMhnj4fH+Q12cElY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719386548; c=relaxed/simple;
	bh=dDEYqs3Rdgi2+HOgiWUJgVkaqhGwL6aZWZJBSMLnYVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lplbPbHGUunRHblRCMvfZwyCC7vJMsSg2ry6yueJ+v03eGj1IPzOuBbMGdvQbCDFMyvpbfu48+HzJUNmuZn6Lss0BvJPdlJEcfDaIJ8tJosd+WumH/e6JGU50ZTv3mhIkNR6gInX1JLqZAWP9rQ7jHO3ZnCksor1RvPIqzh2gk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M441vDkn; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f44b45d6abso49597995ad.0;
        Wed, 26 Jun 2024 00:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719386546; x=1719991346; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NZafoQO29/Q6rTFpDKnwzpgXx4sA7xg8AQOuO4ZCtag=;
        b=M441vDknjuqA2FqUqruLf2bTwkm2G/cE2L/7YGrMSebPKclO5n/7bae/YkzZfsE/Q+
         mOMmSEe9F/g3oIM8UiBG4RcGUmgqM0GZSLDbank9sXNx80gVa7Y0blyxhZ1xPB7zjIFv
         Rfq3hg2cVCte46sO41zOriyOUS3vPPTFwgeF08mCc5KTTe2jomJjcLe3ZW6SgJ65l/me
         vAjMhcwjMSMKSkKtfIXBMahv5sFl9wep1JHyANnnsWTTMPfyGeJHgqBoqAdXcmb9InEv
         zxZjbONMxAhH/YhMuOmx0ukybrwD9dIZKdKEJBe6wrqM0XBLsrrrmiczpAtXJcYRxrGo
         6QXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719386546; x=1719991346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZafoQO29/Q6rTFpDKnwzpgXx4sA7xg8AQOuO4ZCtag=;
        b=uGT/9qhu3NjzXVEPsOmYddEKjWlJt2IsvEAWZht6TxpzFym8/GNyxuK0aoMvfun/QC
         hbLGxXZGtdQmRd3Jgil1hSHTPott6DaGQVwXBZC0U1Yv0NNp581hyaqfWFQX65/+/MPW
         afCBsxOPGYKgrQCNZUDbshW076aZA12CW/gcZctlmUntTKZN+JzyHWutXMzorTPZdd5F
         UIvnNUqL/D7K4s8cLtvAnZOsVlfAaGVAdDPmPdLucujIZ2atWY1KCF1D6Y1xa4mS0n0h
         /sYJ/ww12No1/yGlxzYEqGH20YSOvbF/pbUNt4QeD1GFNpkUpqR1ad38JTSsx0bkzUco
         I0MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMUjI8A8vj5G+jscqHIqAKrXoHx06Yd8Xen5+jBfpFdPgQE7/G/q11rT/KXGHkpwpuDCfTQ9laA389NN0bU15Vjtkur1F0B/zivMtu4yRDw8QvfeFWvxtRPUMpbScfAQt8PvT0Ntnc3mFpe8F4LqZ3r7wYXNPoBd4uZhdZOsdiyx7K+ANZ1VAeKe95vP7tM7lCcX2eu0pvFAWHIYy0RJP67XI=
X-Gm-Message-State: AOJu0YzXSEWXDlc7yAg3XbOJQxCwRB5w4swbsahr3FusKq9nSMCyV4yw
	0blWSJ7i/RGX0j0tGF0q49cO3W2zDgWUcuKWISIBnUXf+s6b6LbttQuNyn6TjdnyXfUFDADnyO8
	diwXQfJKpSX+xyftQTguysJTI3E4=
X-Google-Smtp-Source: AGHT+IH+qObITWZHk6PebRCUNTXi41wyCtr2DAlpoYkzjXVb5qw2T6xxkPH71QWMWsXJrJcBuEKHCXgRVEJNz3EfFKs=
X-Received: by 2002:a17:90b:4f49:b0:2c7:838d:e96b with SMTP id
 98e67ed59e1d1-2c8582318e9mr8990205a91.26.1719386545607; Wed, 26 Jun 2024
 00:22:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620150122.1406631-1-amadeus@jmu.edu.cn> <20240620150122.1406631-2-amadeus@jmu.edu.cn>
 <e3ad7b57-65dc-4262-b523-8bb81b60892b@gmail.com> <byjfbjwizdxbdyft5duxgkxxfvopi3usufcx26k65ekz4qgiuw@qdd67ebh4a4z>
In-Reply-To: <byjfbjwizdxbdyft5duxgkxxfvopi3usufcx26k65ekz4qgiuw@qdd67ebh4a4z>
From: Robert Marko <robimarko@gmail.com>
Date: Wed, 26 Jun 2024 09:22:14 +0200
Message-ID: <CAOX2RU55AENdibEBeatFDAFMmRM5Q1f2F96k1rTnU5fSAT32ew@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] clk: qcom: gcc-ipq6018: update sdcc max clock frequency
To: Bjorn Andersson <andersson@kernel.org>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Jun 2024 at 06:03, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Sat, Jun 22, 2024 at 04:36:20PM GMT, Robert Marko wrote:
> >
> > On 20. 06. 2024. 17:01, Chukun Pan wrote:
> > > The mmc controller of the IPQ6018 does not support HS400 mode.
> > > So adjust the maximum clock frequency of sdcc to 200 MHz (HS200).
> > >
> > > Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> > > ---
> > >   drivers/clk/qcom/gcc-ipq6018.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
> > > index 7e69de34c310..6c764e3e2665 100644
> > > --- a/drivers/clk/qcom/gcc-ipq6018.c
> > > +++ b/drivers/clk/qcom/gcc-ipq6018.c
> > > @@ -1617,7 +1617,7 @@ static const struct freq_tbl ftbl_sdcc_apps_clk_src[] = {
> > >     F(96000000, P_GPLL2, 12, 0, 0),
> > >     F(177777778, P_GPLL0, 4.5, 0, 0),
> > >     F(192000000, P_GPLL2, 6, 0, 0),
> > > -   F(384000000, P_GPLL2, 3, 0, 0),
> > > +   F(200000000, P_GPLL0, 4, 0, 0),
> >
> > Hi,
> > Are you sure that 200MHz is even valid of a frequency, cause all IPQ SoC-s
> > use 192MHz for the HS200 mode instead.
> >
>
> If I'm parsing the docs correctly, 192MHz, 200MHz and 384MHz are a valid
> frequencies for the clock output, but the SDCC expects to receive 200MHz.
>
> > I would just drop the 384MHz frequency as datasheet clearly states that
> > HS400
> > is not supported.
> >
>
> I'll pick this patch as suggested. Please don't hesitate to send a
> follow up patch according to this suggestion if it turns out to be a
> better choice.

Since you have datasheet and 200MHz is a valid option that is fine
by me.

Regards,
Robert
>
> Regards,
> Bjorn
>
> > Regards,
> > Robert
> >
> > >     { }
> > >   };

