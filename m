Return-Path: <linux-arm-msm+bounces-32338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D45E984BE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 22:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D85F1C22D73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 20:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DC1126F0A;
	Tue, 24 Sep 2024 20:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TbPqkR9c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF6D335C7
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 20:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727208126; cv=none; b=n/M0n2c7tI4I70iD45/aZ/7JP0+YxFx9bBaINLxI/s1/VxEpO01uURKECH8xHJFtL+F0Y9At9BbDsMsKMoltNnOqae2Tjp/3ukSVgBNS2flPm4Klg0f8NtE/T1dmjcjCUb/PFi+gfcsrQ7DKaE3FRWD7AfbF3FJxm8xDotFKzW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727208126; c=relaxed/simple;
	bh=I58XqHijHUA2UWwDbiGNUDJ1ijylNn3S1hQqxpel1aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5kT5GG8dHFmrASQJfWEXI3Jx1vIgtxiqT24FkG08AtcQecm3cZn/AaZbdawjhd9gv9yW3Bm79NXV2D5YdeuvCR1TPq/AjJkZj3BLBiigh6R1mzjknfzUcWn1fM4aTh/2pgOb83+E1CPC7cynuqVP4HeAy0MIkhNvbAtMUpnfFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TbPqkR9c; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5356bb5522bso7054116e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 13:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727208122; x=1727812922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pCMBvU2x6ctygjOC+bxXh9ki3HMzf8uD5pWCAHaHSyo=;
        b=TbPqkR9cMgX2WK9NHYZujeQPBZuLFrtke+M5+bUf4zi4YAlmL1qlHdjIjVcKft4jKi
         cw1ZpB/CPmAl6cWQAoBc7SkxBrkYZO65s7Io4xJkJdJaiTJt9ojheUzeaYfj7YNSzhz+
         rrPPigkGrqyxUPVAu1prby0FYXv9JLerq8A9/crH6H2e5sqTpYghJbv0OnByAhGtgl+e
         xCtuR2LbmRtQfNZgMTfs2wB7VR0pXU2oCJqojQCQZK9azTJual6wZZWPOZVmwLVmeTm4
         hFGkuDeR4GIOnBQt1v6AxQ3UwuBwf2SrrltGYhY8i157UHlhLp890laBHgaPGjT1G+bi
         pncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727208122; x=1727812922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCMBvU2x6ctygjOC+bxXh9ki3HMzf8uD5pWCAHaHSyo=;
        b=fQI+RDyebYa/AweGv7h2XJyqxk3hcOZdhQWC8FCHZ53x0+v86BInTpXqm6uYJVitOm
         /JTvTmebEspYEm26gcIIsWb5rgwMRYUxl/DdH8k1WMADiRU8/qXb7175d7IeNLN3EXFv
         tHoc7/RLf/zTMiBIr7g/OjG/zuTLDgj4q6vvxlz9wSmxh6VeFq8LSUXYA4tOGwf7rslv
         7NcJFUwhuVdbXZHndIY44blpDfbp1JT6z1CH465J6zPqiH9DLHQrZQE+92hHfaAOnIxW
         7/o3B3sN3s5ZWoCPMJ2N7DLcwj7kuoJzigGiJzyu+hzaMd/gZ2JE010IZql6xNfLGaXK
         y/6g==
X-Gm-Message-State: AOJu0YznshOxq3gCWXa4sOg3IU9QtJ8jJ92qmiXA8Pbx7uQSGzboMOrC
	pJ0WaMtwrtwBbKEnF2nrn37rgZ5mk0/AVnrPgpznvmk4shgu0CZZezxWBcf7OQTL41P6bPx18yA
	5Z2IvvA==
X-Google-Smtp-Source: AGHT+IFeut3+KrkdV7UIBIPsPMOKFGCrq1HWwv+N5oz9vY5pML8Pt5/c5VD6qEyMSQ4BqOELrDRP3w==
X-Received: by 2002:a05:6512:3dac:b0:537:a855:7d6f with SMTP id 2adb3069b0e04-53877538c38mr81739e87.34.1727208122326;
        Tue, 24 Sep 2024 13:02:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a8648995sm316863e87.197.2024.09.24.13.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 13:02:01 -0700 (PDT)
Date: Tue, 24 Sep 2024 23:02:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: John Schulz <john.schulz1@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org
Subject: Re: (No Subject)
Message-ID: <ysoadpz2lequzaxi3tl66jsnu6rduxoubgzifth7fmmg3axxrv@lxtjlpu65ozp>
References: <20240921204237.8006-1-john.schulz1@protonmail.com>
 <g7jofgrxwdypuemq4xe5h45pbewwviggllffoxongmarozme2m@cewhxcp7ij7j>
 <20240924155442.74210-1-john.schulz1@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924155442.74210-1-john.schulz1@protonmail.com>

On Tue, Sep 24, 2024 at 03:54:59PM GMT, John Schulz wrote:
> Hi Dmitry, 
> 
> I do not have a way of testing this patch. I do see your point in that it may be redundant/unnecessary
> since basic/generic drivers should at the very least output a shell interface. 
> 
> Upon doing more research, I came across the fact that some X1 GPUs have OEM signing that prevent the 
> driver from working. I suspect that is what I am running into when I try testing various distros. All
> of them exhibit the same behavior of the display halting during the bootloader handoff and the HDMI
> port does not output anything. Even the Debian 12 image from Linaro exhibits the same issue. 

Ok. So you have a device with X1P, which you don't seem to be able to
get to work? Could you please try doing the following:

- you might need to modify the GPU DT node to use a different ID there.
  If your guess is right, you might need to specify qcom,adreno-4310c31f
  (this is from your patch)

- you need to define a corresponding entry in a7xx_gpus[]. Try using
  X1-85 as an inspiration.

- only with that in place the x1xx family makes sense.


Also it would be nice if you describe your issue. What exactly do you
observe and what doesn't seem to work?

> 
> I find this a bit odd given that there is a dts entry for the Asus Vivobook S 15 X1E varient. I 
> don't see any comments on whether the dts for that laptop was tested. The Vivobook I have is the
> X1P varient which, to my knowledge, is identical to the X1E one but a different SoC. 
> 
> Perhaps it would be of better use of my (and others) time figuring out if the GPU drivers not
> working is due to OEM locking and if so, trying to unlock it. What do y'all think? 
> 
> P.S. Apologies for the incorrect prefix, should have done more research instead of trying to 
> make an educated guess. 
> 
> Thanks,
> John
> 
> 

-- 
With best wishes
Dmitry

