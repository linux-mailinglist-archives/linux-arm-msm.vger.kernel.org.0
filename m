Return-Path: <linux-arm-msm+bounces-23448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52565911388
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 22:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81FD71C21E60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 20:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CA57406D;
	Thu, 20 Jun 2024 20:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pGOqHizD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9288779949
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 20:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718916122; cv=none; b=eURu6FsdiFC2+csW39bK6vpyKaUynoKgEwI4ELTWK1dIXeKTNL7A6h/p511eqxZFpn4FRq6RvA253EenWwGZ3XFkrzEohsRF//wmOJ7rXkiD7PQQZ1edfs2U1CZ/kWR7Er5ULy00zeyoOft5b0pUqJBsn3fQXq+MjWunKz7Iq0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718916122; c=relaxed/simple;
	bh=STh/90eMk3NBXI2lNFEtFDudfXdIZLwimllATDz1Snw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LT7CZezjUavtB1Nz6FMCnrNgWIFaRuwKgmao8LJSJyOo5Q1khXdjdj5qC0iabRs+b1SOz0sMW9RQb+4eaLmoBXifTR0U7XY7hskHSuYwYMf3O90gOdDyxEU3D1QVjJbfnkNSNm3VY7y9bW7f9pUh15qIOseOGtwzLyubYXrQXNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pGOqHizD; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52bc121fb1eso1529487e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 13:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718916119; x=1719520919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0UDba+xJOloimcJU8oqa5SsgqIPBhxJOEST2VwSWACs=;
        b=pGOqHizD+8IyF2CDvSZvWam4F+yi77z0oG6UJVMRE2LBzFevcAwCYKytnWZNjPa+kX
         4ZVXKHDRBzDITl7P+oVDZRAhq1BgTSrNZzHwLp0+sDeqKfSLqIFgMgKVf6Fl6huL8jN4
         3CP0NWaa7QpsZl526MtdA6svs0v189ms3SqdXBK6NbGAwwvnYkuN37b7UkC8gvKyYPz/
         CdS41E9cAMeFrJDnqBxthVHvYeg8ktDTfCvxIMNwAVlqQPBBaqfb2usoaiWZ3pcsq+fK
         9haD7di8+6O2JcHUTKLEBs0VAKve3QSn8nyUdB/JCRhceMIZ49itWiAzyNu1CrNLudo2
         Jv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718916119; x=1719520919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UDba+xJOloimcJU8oqa5SsgqIPBhxJOEST2VwSWACs=;
        b=DCeQ4LIMyLdm4ZfxuVMiyqjfrCC+yH2YFuGFFy5lriiJhZTvWb/D2PeuA+eEtSGZvB
         SKN1N7SClJ1+mJO8i9DEMTpOD3zoBJyeGpXMqFdsgzx6okbeJqxVuqwHcKn22iPLafPy
         0l2G4LB3U5oHSMrejipkEnqnCGw//2p0cLWppbg1WUB2S/mlDSoKSvmiap+t0/R4u4vg
         ZsM8n7L3sBze4m+kzIXThjcVIJ2NpCq6sTf3tPVz/FpVWYWbZUSbIij7+vvaA49EpbCY
         vzRnq6w7ZcGsrUX0rx4I7of+VpE7S8DUxdGTk2t/zQ9y/NAUsGz/iDtUutmHeKJfjGYY
         Jykw==
X-Forwarded-Encrypted: i=1; AJvYcCVGeKNx5CgEH2pKdemu/+yEN6ymPGokr0WkA5ggOathYRs1x3WkCJ1ZnpnTwspcm3kbomK99iFsOm7AaocRevWI8K6J3IoVKGSWQKmFKA==
X-Gm-Message-State: AOJu0YzS1IJZZxVMOF5KpldRw7Jk9u8I5ukN0IIVDKQpMLKN3OPvePfG
	KzsHirw2ia8Q/jhAbSenYzW/cfg5NRGklgKk3BsLx00AlW2Bc7J4XgPFrGquwJ8=
X-Google-Smtp-Source: AGHT+IFvDEBziAChv29W9y+hlbHpRWjQtdeBZlkVSappPVb9YfmbDmaebeCTAlFW7AujfRDaP7GPgQ==
X-Received: by 2002:a05:6512:3b23:b0:52c:ce28:82d2 with SMTP id 2adb3069b0e04-52cce28854fmr3654990e87.23.1718916118870;
        Thu, 20 Jun 2024 13:41:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca779db82sm1912644e87.176.2024.06.20.13.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:41:58 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:41:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: msm8953: Use mboxes in smsm node
Message-ID: <tx5hi7sb5t2lrn5g2atp3pugusaumifnqateu44h42funftybq@nnfsim7c4xkp>
References: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
 <20240619-smsm-mbox-dts-v1-4-268ab7eef779@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-smsm-mbox-dts-v1-4-268ab7eef779@lucaweiss.eu>

On Wed, Jun 19, 2024 at 06:42:30PM GMT, Luca Weiss wrote:
> With the smsm bindings and driver finally supporting mboxes, switch to
> that and stop using apcs as syscon.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

