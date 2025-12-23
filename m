Return-Path: <linux-arm-msm+bounces-86430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F1ECDA8F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 21:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1A04309B78B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AB0314A7B;
	Tue, 23 Dec 2025 20:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWZHdW5F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2FF314A7E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766522118; cv=none; b=enw9Bv6njn10S1DjtlTpE9pFoix7+CyIwtTcGfAEARjYvIgynZPC6nXIOm2siSLNG/PnCGVwHNZWlzFji5a4AQu1TMXqLFUEevEJWSQm+YD/5lY7NFfAwom25d/wEW3jW5wSDiX3PmdN1Ny+w1uKG3Ul1Plvsz2OqsRk2CAiwI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766522118; c=relaxed/simple;
	bh=QOueJ1mRgYwmgJidNsqj0fULy188ozhjfLL7kXVZdWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RYgsW7ooYjjj6GAny4hOWkJ4zx8nA7SezHtUKKB/rRM/5itWzLvhTbK0IFXH66k3F7dGdvACMu0ZihOfR3aqmoTfj3cMfwXR+WQaEWMba1kvsk8DgCiPmiSROMUZUzdfIir3FdPh4ox+1Ru2lJ9vZpwMNo4E4NZSylYHjobCaFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWZHdW5F; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7cac8243bcdso3474721a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766522116; x=1767126916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uk5rbnTrDj6OgXv3yPUh1V1C8LXaBlzWsDnZOyRYEI=;
        b=EWZHdW5FEPVcqQmqE2ce8PDKUiN4UqEZIize/qiRSsG4jXZ2JI08qh0WNOGlcb0oTM
         D7PTRyUoYE5E+zCYrVuoaiQwTb7eSzqaw/7qF5NlyUysstIRJeIdgQsDdaC+pKM2oufH
         6ze+/fBRM79QilA6CXFHy9Euxu16QMg8hTIRDSaFhWPKwXnY9u3UdIyeI4FTBNzxn/lr
         qfsnku28Gl7EMbjoWsvuXUxqzCAipHpHMmICH6r84u4jjalS7U+4FkMNB75/heMyknoQ
         hFEbag+Me4oNVH33WhO4p3te2Mi/xU2tQF79CugKsOGIY0CtqPRgyOJxKxxqC+crP2qy
         WSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766522116; x=1767126916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0uk5rbnTrDj6OgXv3yPUh1V1C8LXaBlzWsDnZOyRYEI=;
        b=Nbq7MWPf5//ETL4plFRdKJqrR6b1jaLZxFkVkgKxBkWX5cenCvyhMfc4yVY9MqSmpp
         NNdOd5lo6wovfxyy01FO7eY865lF3kQte1uLbhreK/8Hsg5991/zXae7t1u3MhdRppBV
         E/Rp7VHlIZpIqwks34ic8KQGqJtUDa8GoBOZO/7xEn1AteWChDuCvANqXsVJCCZ9naAg
         logHA/lsj+0u6Nk27FzVLRr75ImQNALQaqHUsFlXTt1IMeOvQ5Iafe0PUBS00A0Zk7mc
         wQP2WuD86nMVgPpE85qYbjz1LfMr5zx2Y3b/9VJN8dAbWhe4snSExiYT1Rwvqe0qNchg
         xeYw==
X-Forwarded-Encrypted: i=1; AJvYcCUWqZNhqK0kHJLals1OHQxXgnLCnqVI1FoLWkJtiFMPyQgL6Pz78OQNgamE9d36wkqkWbfUA4YeFpOMzZoz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3K/dt5bGalN+s5jWVlyBYRl4k3CT2TttjeuoiX16zKTpkNrEv
	PnZ7gs/yIPIVkPG+VuX8egQlUTIL3YouxIpneP56Dvp39nunbBPf0je+
X-Gm-Gg: AY/fxX7k4o6UeIoDac8l31THtEHibvAkUsVBz69PoO7xH9Kl8tEupsaKfSYcOgJFtnc
	gl3ahYG2jyJmbalSMuMma2NMkrDyFORrfbeKHhRuIBeedTKbP6WousBMg73DA1AOo/Y3qOUDgWV
	ApJT85C649IQRN3OwsJjhymAdrDKhyHQQMo366sPIZo0kKEVTPL/sSUw8TE6Lfmc3rmCGmuSDRL
	/H5UMhtE75CnsuQuVtEg8vMkPJuOcCh91/XsaKhkr7Vq7Zj7g/HwdTHOFlzmrlCSbm8hFj6BRsH
	mgfwPyiSwaqyECwgEuZgpINIzKTU4VJsSEovRuAZNzKrZCSN1cGDgTPZGUIvmMFB8xnC+ue+5nZ
	x7pSbz+ps1O481Z13mBJD47CJ5P8h8LMDcZLGpC6PGO+Z/Eql15b9xUJcYm5uJ7OuWNp7k0OU6N
	DQe+LQOPsPotiagqPsBQaEzvx7yZLHY/15fQsQJl8kD401/XK+9fIzda3YpIJkRl4nWUxzcqnzi
	O6n/Uv6WdTTuLISsUWPlrmhZE6oLqE=
X-Google-Smtp-Source: AGHT+IHyErY0P8ecU1HiiChzO9n89IIYBESftCKQJd7X7/dItVzyCNpRjo4JbYfClhw5F35/fWnswA==
X-Received: by 2002:a05:6830:4103:b0:758:1417:7ee7 with SMTP id 46e09a7af769-7cc66a0b453mr8289822a34.5.1766522115974;
        Tue, 23 Dec 2025 12:35:15 -0800 (PST)
Received: from nukework.gtech (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667d571dsm10065971a34.17.2025.12.23.12.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:35:15 -0800 (PST)
From: "Alex G." <mr.nuke.me@gmail.com>
To: andersson@kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mathieu.poirier@linaro.org, krzk+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/9] remoteproc: qcom_q6v5_wcss: support m3 firmware
Date: Tue, 23 Dec 2025 14:35:14 -0600
Message-ID: <5116928.iIbC2pHGDl@nukework.gtech>
In-Reply-To: <5b9cd24e-7eae-4cbb-b013-6ef135902ae7@oss.qualcomm.com>
References:
 <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-7-mr.nuke.me@gmail.com>
 <5b9cd24e-7eae-4cbb-b013-6ef135902ae7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, December 19, 2025 7:29:07 AM CST Konrad Dybcio wrote:
> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
> > IPQ8074, IPQ6018, and IPQ9574 support an m3 firmware image in addtion
> > to the q6 firmware. The firmware releases from qcom provide both q6
> > and m3 firmware for these SoCs. Support loading the m3 firmware image.
> > 
> > Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> > ---
> > 
> >  drivers/remoteproc/qcom_q6v5_wcss.c | 44 +++++++++++++++++++++++++----
> >  1 file changed, 39 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c
> > b/drivers/remoteproc/qcom_q6v5_wcss.c index b62e97c92d058..265010c5c82cb
> > 100644
> > --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> > +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> > @@ -101,7 +101,8 @@ enum {
> > 
> >  };
> >  
> >  struct wcss_data {
> > 
> > -	const char *firmware_name;
> > +	const char *q6_firmware_name;
> > +	const char *m3_firmware_name;
> > 
> >  	unsigned int crash_reason_smem;
> >  	u32 version;
> >  	bool aon_reset_required;
> > 
> > @@ -161,6 +162,7 @@ struct q6v5_wcss {
> > 
> >  	unsigned int crash_reason_smem;
> >  	u32 version;
> >  	bool requires_force_stop;
> > 
> > +	const char *m3_firmware_name;
> > 
> >  	struct qcom_rproc_glink glink_subdev;
> >  	struct qcom_rproc_pdm pdm_subdev;
> > 
> > @@ -922,11 +924,40 @@ static void *q6v5_wcss_da_to_va(struct rproc *rproc,
> > u64 da, size_t len, bool *i> 
> >  	return wcss->mem_region + offset;
> >  
> >  }
> > 
> > +static int q6v5_wcss_load_aux(struct q6v5_wcss *wcss, const char
> > *fw_name)
> > +{
> > +	const struct firmware *extra_fw;
> > +	int ret;
> > +
> > +	dev_info(wcss->dev, "loading additional firmware image %s\n", 
fw_name);
> 
> I don't think this log line is useful beyond development

Remoteproc driver prints the main (q6) fimrware name, so I thought it would be 
prudent to print the names of any additional firmwares:

    remoteproc remoteproc0: Booting fw image IPQ9574/q6_fw.mdt, size 8140

> > +
> > +	ret = request_firmware(&extra_fw, fw_name, wcss->dev);
> > +	if (ret)
> > +		return 0;
> 
> return ret, perhaps? Unless you want to say that "it's fine if the M3 image
> is missing, particularly not to impose any new requirements on existing
> setups". But you haven't spelt that out explicitly.

I intended to not abort when aux firmware is missing. Maybe the better way to 
handle this is to check for "-ENOENT" in the caller instead of return 0 here.

> You also haven't provided an explanation as to why the firmware should be
> loaded. Is it necessary for some functionality? Is it that case on the
> newly-supported IPQ9574?

I don't have a good answer. I reasoned that since the qcom provides it [1], 
the M3 firmware would need to be loaded. I haven't done much testing without 
it.

Alex

[1] https://github.com/quic/upstream-wifi-fw.git


> Konrad





