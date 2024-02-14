Return-Path: <linux-arm-msm+bounces-11106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B699A8554F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 22:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E65E1F26C94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 21:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C9013F003;
	Wed, 14 Feb 2024 21:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F32IyfOs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685CA13EFFA
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 21:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707946657; cv=none; b=XAAyIQIDXL/6XwlILIbON8co6rQRQ6hDVr27yIJyCEtYNvElHBesjJYsperOoLaBWQ87TbvOg+dio3O8b/TxTiGVjghJJsh2x/NI39Bl1t1MAVb9jrb2GbYdJgQBPpd6f+m2Uc3I8M851F7AildPu3QW9TbxpirmsgcytDlvvRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707946657; c=relaxed/simple;
	bh=rTR0KwEV3pN6LQgr03O1fGeN2jOztRwS9iqPUavn6rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVlUP5MYDlmHbs07jGHxRMMKSLNks2DLBQcLD6IAwTfrPCeZ117/wiujTZc0hT2Lc9g/fltawT9cuWnesEX9lXQSDsaVpmUgPiXcMF0plChAmyFqzHR2akbg1d+gP6MEmxDWU2GXK6nVly3Q6+DldcC2oMUIjadBd0pRUdJGYBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F32IyfOs; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a26f73732c5so20063566b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 13:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707946653; x=1708551453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ir/unotnfD5rMdtsGoyJfuSxeOlSTFmP2bDl4ko9QIQ=;
        b=F32IyfOsrm+T+CJX6/WvoP80dYy6ETeXGlbVRkaicnVqz8HvvY3cja/Y8P7muR23xZ
         OsKkSkhqpIpGytV2UwPpJ+fkpZKt2aAcTPLbmsuqVMzQDUv2rMYGhG6HzaQZ6nVl2C0x
         FJR6G8SEeAU2KpoeYk4ifDrWrpQ9KcnMEUqOwnItZ0x+sV2zs8r4oF1NF5aD9LpfwDYj
         MvHyA8er3UoPYiC/VdE9dRgtbngpRCNiWTwX9QB+MPYsgodpXnfCup5Pt3Q1OkLiy5iG
         ApSaGkXX9HKvZUJPpl9lclKp+MbJfABnpUcbU4xhBRieU4EsipgcpZp3CRDK5IEgmmvE
         wc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707946653; x=1708551453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ir/unotnfD5rMdtsGoyJfuSxeOlSTFmP2bDl4ko9QIQ=;
        b=w6ebBGZgB8EtotYEiaJ22DdbQgtVDH6PWPItNDpzhIVqkaPWblmSU+nOog0w1cOIYv
         FWEaYOq2AzhqHZRg1/c9pcwIM1qXrrnSE7VGr1kbOHH7s3qEvmrTLt5O/ZyQn+wxlIHn
         TJ7aBdlsxESJJJYZJtVu6t1gD5y0xWhDmRIsOId8Kn0GPok3oWWJYA36PM2fGDrL1HWF
         ZdrB4KCASCzT+Uy7D9PWVTLBwDsVO3doVoFLEf70c09aNtT4y2Ho2fyoOUlBXO+cXkuC
         +ZHXD8m4CuMMbvjSvV2yoOJ7BdaXYrPEgtlvYbmuFSjIkmBV8dj01nhdPaaGkNQ/331o
         rbCA==
X-Forwarded-Encrypted: i=1; AJvYcCXYR+3RygziB//owV/m208EpEz7qYyltvPBfPTeQWiGoP194+AMQ+Dr3aqjZIak7RqQiAngeiEQgyhNdpTZXKSUx/Q9xOUW4dzX48C24g==
X-Gm-Message-State: AOJu0YynH4vQEEFc4ZvT4NrKa2BSw2nVIse03kSAyR2TzzTHe5r/plM3
	FSn/y3zrgEjjlzhdbi2IHoDevIKf7zrhMQ26YFmT2pycVDtJwQR1lVWAvoAyI28=
X-Google-Smtp-Source: AGHT+IHk8JLhkU3PqjlB3r1X7UjDpDlD05JGbvpAVKzdIOh6hcCu0LS+v/I1vied8tFOXqlMkHNH4g==
X-Received: by 2002:a17:906:ccc1:b0:a3d:30a0:2e79 with SMTP id ot1-20020a170906ccc100b00a3d30a02e79mr2565149ejb.54.1707946653601;
        Wed, 14 Feb 2024 13:37:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWf55Ibmdxn4mP1NgfJga60DJOumX4O0k/ju9udq+ijqg03KBqFzNuxp3XkGYlC8PLAgOML2h7P9FIrghvOxk+13ZbEiPwSDSQpzylyKcGKntugzulOXfO+UO0HJWUMaqvCtevi42PRrUUzUS/BXVaAnsPCZC/Oyp1WTdnoNVxdUl+Q/KiUx+tTpiXOcnfxIQlJBxP/YAuDrCiniNFjo24YgFRBqo4nznj4EKhPoBPPe6Xk1vCO3tz+0OO7F2YPl5wZAgtZicZTKn+kA0Ee7eAHqaB/QuO4hnkES/QspkiETCivrxFxKUBnNk9GepzntLozlmbkNCQVFg5F3PnRJ2SHFpX81NPX4ua6xQCF7KGxdftPmEEb60b3KfHRaxI8+qf+9lKArK5F7+YfQnM6yTVzZ/lbYBqPnCsF8ERlRsMjex4BvwfrPksIMGVL5h03HdQxtVn9pfBqTxB+ceGzYV88sL/GGwpt/zOx2WWJJkTRKegN/sMgqQ==
Received: from linaro.org ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id hw20-20020a170907a0d400b00a3cf243de37sm2249089ejc.111.2024.02.14.13.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 13:37:33 -0800 (PST)
Date: Wed, 14 Feb 2024 23:37:31 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC v3 2/4] spmi: pmic-arb: Make the APID init a version
 operation
Message-ID: <Zc0ymyR87km2rZjW@linaro.org>
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
 <20240214-spmi-multi-master-support-v3-2-0bae0ef04faf@linaro.org>
 <d9f88786-abe3-4826-adbd-fee461a70c2c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9f88786-abe3-4826-adbd-fee461a70c2c@linaro.org>

On 24-02-14 22:16:58, Konrad Dybcio wrote:
> On 14.02.2024 22:13, Abel Vesa wrote:
> > Rather than using conditionals in probe function, add the APID init
> > as a version specific operation. Due to v7, which supports multiple
> > buses, pass on the bus index to be used for sorting out the apid base
> > and count.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> 
> [...]
> 
> 
> > +
> >  /*
> >   * v5 offset per ee and per apid for observer channels and per apid for
> >   * read/write channels.
> > @@ -1178,6 +1246,49 @@ static int pmic_arb_offset_v5(struct spmi_pmic_arb *pmic_arb, u8 sid, u16 addr,
> >  	return offset;
> >  }
> >  
> > +/*
> > + * Only v7 supports 2 bus buses. Each bus will get a different apid count,
> 
> "bus buses"?

Urgh. Will fix in the next version.

> 
> Konrad

