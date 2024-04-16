Return-Path: <linux-arm-msm+bounces-17583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7818A6B06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 14:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB86D1C215EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 12:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8140B12A177;
	Tue, 16 Apr 2024 12:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X0yYeRTo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F1077F2F
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713270862; cv=none; b=h405s+7c6vePtiyDkwmS147sru+li8ywoPJr28PHzZvLRnyDAZnBh3LK4Aut4TYQB5ilPNHY92ZQxCaF+q2cARIy+03rPL14eqNlAgrb6bOgH/GTfu6FdU71kZKV2LCADKD7DeYEW4wmVrxc2yxb+tW1Cew3GhC8G4DHf7ibnI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713270862; c=relaxed/simple;
	bh=SIpJZv7wDmO6PJvpxTbMmJd4YFOrv5/ZLEYq9V+CZRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nqwCixE7SDK6dGHu6+qdwBJFBlpYXjlQaTJwz4JgjColwz3VqH+nsE+V5XiobVFzKLr0zcCw/A3rE/a+CE3bgy5aokxoTbjjPvMtXrhpJ5M6+D8K7OyV7At450Kp9ql5EhD1ZDTFq4QnmOGY0iHncukV4gDiyAd/6QZLZuCAo6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X0yYeRTo; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so4097247276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 05:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713270860; x=1713875660; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3zwgoQX0Z9a6MDLjvENqiQyvKVaKgnucR/j0TmrXRI=;
        b=X0yYeRToZBa1OHX93ci0omq7hFoxzRuudyCIshesT/qeJvs91GJmwCiSAK2xryzxlJ
         nJbD7L5XSd4LCWz4ESrDWVFVlAWq7Ihl7z+z/KSKcbc3B7LR2YehyeN2x7dR4FYJ8o2x
         DiNAZUuPKyC4Y/gvylTJXzMZpHsuo0cxqZfLU+A7zmQ0smRXGmi3Snd8yj0q+DalMHIP
         TfuuKRY3zQwOUdb4Ut9bb2GJiK9l76+1F5FyZ39E5h7Rprpt831MhqFmH1An4ORquxxC
         G2C4jnwCNoByQv7qISUttxchfSK3uzbwjeUoIY9vl6YJcJu8Ed3Tt/h5efNwKUIAgqUd
         6oNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713270860; x=1713875660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3zwgoQX0Z9a6MDLjvENqiQyvKVaKgnucR/j0TmrXRI=;
        b=HmjjSkEZSs37YdiKkwaOYNzh+SxxNGdKtjoIfJuocSByA+vx+6FoslI09qgSBkqhVg
         BbNVWbWKQlIhmIixH+RVih1EQeaqMW8a53Bufh1Yunc+mSwEwHqbRMVv1cly+ITp2Ng7
         l/s472hUHwodKtb1sBMzxMM4CfKCi/doMKDW5VtXe4XSuEUu0kTUpAJRCQ/Npk+BO4No
         Ty3Hh4G33+2lQmDf+n6zHHXYrDmxtgthdUsfKdSxTM2PbJgbOY5OUkmynJfw4AwMNmlc
         AARaZsmerbYAUQka+DU9589DHxdu+dMMynIfAfFPZp4IL22pf03A8uzQGWYA3iiPM7QS
         kpWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVICnganm/Q6YUQ2IbUaeDRSKautRhHOKcESCOpIr+pThPWz82/0YKYEng4guroEGTHCVb6ZQiCliabOGVcwC+f/GSbzyUb18VqEGDcrw==
X-Gm-Message-State: AOJu0YxntZIUbs2WRVXqrot1HuYYJudx9JkQH6IyeKpOa+q66CRB0rRu
	l7GWJolR67iBdM5CyWk1hX6Ezqm37fKfb99B0Ynkt+Qp130mMglopfhVSuy+ULQgZA37B1t5HXY
	pD/7WwZgacufFRHwi2heRMGFbvHfg8LrKi5WEiw==
X-Google-Smtp-Source: AGHT+IEpxf4rbzlE027P2IcXAeu6If/EETmf2GpXASFLnsjOgY7eMXVxG0DJLlGFGtlWUJmR7N0m2U2uKbzDDFB2J5M=
X-Received: by 2002:a25:bc4c:0:b0:dcb:fe58:a08b with SMTP id
 d12-20020a25bc4c000000b00dcbfe58a08bmr11892925ybk.15.1713270860092; Tue, 16
 Apr 2024 05:34:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416105059.1167-1-quic_vdadhani@quicinc.com> <CAA8EJprzdhDvmZdVXdHEJHpNA_Pj3=77v=y41EajFVe8LmAOnQ@mail.gmail.com>
In-Reply-To: <CAA8EJprzdhDvmZdVXdHEJHpNA_Pj3=77v=y41EajFVe8LmAOnQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 15:34:08 +0300
Message-ID: <CAA8EJpob60Kog7ppTO=LZuJgn5Z91dwqyZ845gX8UXwrOqvZjQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: qcm6490-rb3: Enable gpi-dma and qup node
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Apr 2024 at 15:32, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 16 Apr 2024 at 13:51, Viken Dadhaniya <quic_vdadhani@quicinc.com> wrote:
> >
> > Enable gpi-dma0, gpi-dma1 and qupv3_id_1 nodes for
> > busses usecase on RB3 platform.
> >
> > Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Well, actually:

Unreviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Please place the gpi_dmaN nodes where they belong rather than sticking
them right before the qup nodes. The file should be sorted.

-- 
With best wishes
Dmitry

