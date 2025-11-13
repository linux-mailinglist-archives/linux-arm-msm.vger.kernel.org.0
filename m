Return-Path: <linux-arm-msm+bounces-81578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E39C56D3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 11:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 516AB351DF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A82130102A;
	Thu, 13 Nov 2025 10:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2dtIEjpw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852D12E6CA8
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763029587; cv=none; b=LhfhouqPsRlaMPdbDyXVW7sNToMeG9kwb4Pe3bQvSpyLVfVGYWKltohFE7z++Z5ACy4v7k51FrNYOo8mkWST0R8gCeEFxCOv6DoxCOT7jjbYwIGnPV2roV7v7iwQqGqV2QfU3nIdSWyXk/Pe29RiXnMr2xsRynj60516LEB33YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763029587; c=relaxed/simple;
	bh=y6pEkKmQUrDvPxt44l7tHq8+XpLO4nw6MEi1Gb1kcGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oYBZvYxQifEf5x7HJt8pYc8KiCZ5ibf/WUmokiNAFFbuU6t7C19o4dQDDb7olf9r7jTKJwTyzrsiJ1SyjDsKH32UaLhD2g9BlgEZ3Vg3eXKLVHioowbhD54vss7VVBfMnYSnmrFamEp/xa8AtIwmjsQpEIeq38rvas8uorKz9IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2dtIEjpw; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so1302598e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 02:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763029584; x=1763634384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6pEkKmQUrDvPxt44l7tHq8+XpLO4nw6MEi1Gb1kcGw=;
        b=2dtIEjpwiNbMUp8AZbKJSgnT9yMeRacX4NcpcYG81Oa5M5Nnvd7rnwNiGv+mZJwACP
         RMEGaVQ/0+Np3BEXipQt2op57p+v5B6cAUqD1jQLnFrjG6bWfwvFZwSvekAnfpdE5DuR
         a3l8Rcrph4uec9OhuV/JYYPKCjsq3nAayFwBur8/sTMBnHTxAtf2l+g+fOLt0adkPrNL
         biegb8Jqhw7C8XS5QBaGyQD7Mc6ZPe72IFXyZPOZidjVZ1kqKzBx6lzMjX0mjMWBK66L
         bRPXWTJEGUQMI6TynH0pv/9wurwU0C5j7II7sHJJ+J7OtFU+i3Yv5GMSYtU+FFVrLvnX
         yOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763029584; x=1763634384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y6pEkKmQUrDvPxt44l7tHq8+XpLO4nw6MEi1Gb1kcGw=;
        b=BeJL7VUmIUfcS3f4zXVIJlkVvY5kb0HgfdYrDk43uGR2rTLw2DWnhTjeLNLtb5afdx
         n12xZmYm9SXwJ7EXqSrWxEYARC14y4luX+TN+ZH8iXk2ob3iCWUQjekYddTqU5fvjUGS
         RwSOrHQPy/U/huCyRSz1vle9sAmCKI+yoHfWurs+f95ZuM+TOLgUcWBCJ9sfkj8Emrwk
         F9aa838AFWI2fDV9frrH9bZqd9AQWlh4crSeWxENl1OADdWuN+E1IMCfW+sC9aZSGTP/
         P67wP4DrBFW5J91yDQrc5oSclK/vYo7e2rFiaAv3PD/R9/dexkKgCLybLDFRgn40qQ3S
         CotA==
X-Forwarded-Encrypted: i=1; AJvYcCXAmy+ntShRVwAPZgZt1voCPvF3Fv0lWBAEzX0jNFt+CqxU6XABaeMPH1SbLCcqbp53iq6L3vTlYcsyrBbb@vger.kernel.org
X-Gm-Message-State: AOJu0YypqIzgmQ65fUB+Ux9E6ovVYvMAppDJQ8D8cgpdRRfkpFvFEhiS
	o8Yck4srvAKy1PyLR1/2HAtxe9p8shxCrPbgq1WGgzhqSqgxdlhEahWVPvi/Na5hTGw9tbsnsoR
	UiIochavf6cBaqN9JyCZqylgGfDPehK2PCjBoodJO5A==
X-Gm-Gg: ASbGncvr2fSpUNCK7mvVjEgucNrJqpmMf/SixYVACEtETmrTMSHQ7ZUcQyEv/qc07b+
	mR67aJgJBpZZJpMn8rQqaIw2IUcoAEMZYv2IUiDaXqQuyXzwc6UlUx6oDCfJeTAYo/ZpRI9cmAj
	Zsch7j1oy4iuQRH01j2qJlLGZr6U3PSwHsaXTmhdoZ2aJ8Bj1WgbQDX036kV3UyoHcSXnTyv2M9
	EXsphcDGcOMUzedu5Jdmpy62YoVGAz5yZImj5kK1zUU3QBpnMPcTlI+mcrLqaNhy5ueLec6WmOV
	J2vb0mwGMre65dJI
X-Google-Smtp-Source: AGHT+IEWBz0+be0FB+wLbE+7QTcc/OUWq0TgJqUkR7RRmlidFEPDPpiNSaVnc53Ovz4tW1nSH3J0cHCpYlG2Y5YBezE=
X-Received: by 2002:a05:6512:ba3:b0:594:1279:dfc0 with SMTP id
 2adb3069b0e04-5957ecc4170mr718381e87.18.1763029583635; Thu, 13 Nov 2025
 02:26:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106-qcom-bam-dma-refactor-v1-0-0e2baaf3d81a@linaro.org>
 <20251106-qcom-bam-dma-refactor-v1-3-0e2baaf3d81a@linaro.org> <rrw7q7cmkaykng5mnyqk5oxsjednptx3yvjilh3tf5uub4nxzh@p5a4sbgbaha2>
In-Reply-To: <rrw7q7cmkaykng5mnyqk5oxsjednptx3yvjilh3tf5uub4nxzh@p5a4sbgbaha2>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 11:26:11 +0100
X-Gm-Features: AWmQ_bkPrLo5fkHZmAca_a3y1ZYvX0iZcUyH4co_j7LpID1i-okvegYKSrVQn6Y
Message-ID: <CAMRc=Me1DA8ajey++S6_gTP38oDfJKv5CzZbgL5trDC=zT0NYA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dmaengine: qcom: bam_dma: convert tasklet to a workqueue
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 5:15=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Thu, Nov 06, 2025 at 04:44:52PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > There is nothing in the interrupt handling that requires us to run in
> > atomic context so convert the tasklet to a workqueue.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
>
> I like the patch, getting off the tasklet is nice. But reading the
> patch/driver spawned some additional questions (not (necessarily)
> feedback to this patch).
>

Thanks, I can look into it once the locking and these changes are in next.

Bart

