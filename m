Return-Path: <linux-arm-msm+bounces-42038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECA09F0ECB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE59E16C493
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899341E0E06;
	Fri, 13 Dec 2024 14:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="riCNhT4D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39CE1E3760
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734099044; cv=none; b=OBdcu7uwQ2oxaZDOKAvWF9W12QwHv55AAbuf13iHlsQxGPxxwFNVhj/O70CO1AbzAdW3lUjPOy3sTOt4BFy3UaF7N5q9IUDXOUp3yONhj7K1uYw0T22SfVk0bMCZeZeHxnh370BiJRowx9k1jG+B8wjIZzyXVir6/GAIK6drrMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734099044; c=relaxed/simple;
	bh=4vwGsM1sgE7tWIHGNhitdsUrLk0q5q8fYx52T6mOxls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kbh1JlWHhjVc7iTvZarZx4HgLE1oeRtrnZxTtV8LwpJv4Du7NGUw49gA166gXuX6VeR4DM84vPf9vhEnZ8rRiqyN8L0AnN+XinIrnZjflccSw+15N6/H+mR+WD+TyEmMen3SyGZaLNhjnNdtkt8N7/AAOwrCdKU7mPSs+neerPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=riCNhT4D; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30033e07ef3so19023481fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 06:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734099041; x=1734703841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N1YcfEQwkNy5HAFAwqUbEfo5vhqkWM+UZF8BzuJJgTs=;
        b=riCNhT4Da1sqGYTVGliyp/WBMs1z93OFkyhw1MK0g68K2poY+mQdRm+saNkl9lO3j2
         2JOH0KiCxahSGXKU+NUpXBrMrlHPZQZHJ/61IdtOPZLnNVYKYLDg7nO85sWwjLbYfSQy
         EraOPjGRyCRs7D2kG6/oM9RtPP+VYaDPDwd69sIslIvXpzxa6x1jXGhxULyqGF7QZfuO
         B7MGMv2JyJnOpFzOX7YZMz0MBr8y0GIsG3UyYmVj/6FBadqCeqZnkQ1yVYfJAW5zzCgH
         6OIMbili6svi7kxWBSP9wyStrFTyCNpBX9tcJs9DXyr33UEbFMfA9oQAL9OFfN13D1pT
         RPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734099041; x=1734703841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1YcfEQwkNy5HAFAwqUbEfo5vhqkWM+UZF8BzuJJgTs=;
        b=gRpHW+lgnR/nXfPIx4hWxFJATBFCqAfbBIEa0ethJ5wCpyWi5CLFPLR84uh0nmpC+O
         zsXFjstRcE4x1+qLPHzowUUMY4iIO8dvqy5Za4WlxsnWaWcx4wp/AwWyv3RaPN3im5A7
         7I1P0efBJarl+jDGE6Y42mu8jNj20bkLfKHzfT8BqYzqifgIvjHiuhuYOgA6lvVzYvQx
         GF5Dzujazhb2zmVbKKL1teUb4AZc9XqVpyoHEQaB9f4cqXAJB9v7FZz+WnDoL5MATfWZ
         rJJl/2pYH0a4eD3mAZN9pRMjYwSjtCLFg5+FYa+tlWgLVjntdoR+4nTDRwRa4Vm9azFq
         12mA==
X-Forwarded-Encrypted: i=1; AJvYcCUpiI/a56ixwZMru7cvOq69z9QC/AaS3USnItIGjkjDpcBw04RNRDz/CnggZV5S+qVHQ0Hd0BSfXxaoF4Du@vger.kernel.org
X-Gm-Message-State: AOJu0YxqIZIGYteu9FL1HrTmFzmwj1OTJFauhUR7yGuaOeVBuS5RAA7Z
	om+6oqlUWxR76vu/2BkS6nEQaNT/6BlTzxLoFYDhd/Rijqm+jh3/ZD6/3ThPUZU=
X-Gm-Gg: ASbGncs6Z0K6/XVxOy4sX+9LTeskm4rFW+0WpJEFijAUsu2rgIhBhg8bnfl4JYeJNh8
	G1ysHgDAi9qndzDXGcFW17kVYM/2NSMcZLqg8IQl3AMeZ8n1aSYZW9i46DaRmqcbOcsBmWHzRl1
	a9lJTdeeUJQGUPdenKdp70eMurMiB2NLskUxy/68jvHpS4o1bbvWC3uZzp8H4UkT38v5C74tYpE
	pB9kd4Gb8MdoDQ/uVYxBwOdqf7r8vkaShFlqpqOHAJXJ8f9jBNy07stgJJv7mvo/HXWd6GX1Ret
	BMLIAx6j8d1NvcRw4y/Dy/ffYIY79rSunEPO
X-Google-Smtp-Source: AGHT+IGZCtr+/DlfpCqZVtFM0csLz4vmbTjJUn1ssjFmXM5IHARWF9p4eN3bbwFCK8xSKh8a8fEsOg==
X-Received: by 2002:a2e:be24:0:b0:302:1cfa:244b with SMTP id 38308e7fff4ca-30251c30882mr13038291fa.9.1734099040763;
        Fri, 13 Dec 2024 06:10:40 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-300431a561csm19780001fa.116.2024.12.13.06.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:10:40 -0800 (PST)
Date: Fri, 13 Dec 2024 16:10:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Maud Spierings <maud_spierings@hotmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: scm: Allow QSEECOM on the asus vivobook
 s15
Message-ID: <ct446vgy46m5in5ctz72crvbp6lbcof3ecj7bsboesm6itjcou@kqczzvvdvck4>
References: <20241116-add_asus_qcom_scm-v1-1-5aa2b0fb52bd@hotmail.com>
 <AM7P189MB10099F929FCE7AE7B348399DE33D2@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
 <da39ded1-8904-49a9-b58f-4d31c768bb55@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da39ded1-8904-49a9-b58f-4d31c768bb55@oss.qualcomm.com>

On Fri, Dec 13, 2024 at 02:02:12PM +0100, Konrad Dybcio wrote:
> On 10.12.2024 8:13 PM, Maud Spierings wrote:
> > I fear this may have slipped through the cracks as it has not yet gotten a response.
> > 
> > or does it have to do with [1]?
> > 
> > [1]: https://lore.kernel.org/all/20241103-rework-qseecom-v1-0-1d75d4eedc1e@linaro.org/
> 
> I'm not sure, but I'd much prefer for that one to land instead of
> having this list grow

It's on my todo list, but fist I need to sort out RO efivars support via
QSEECOM. I hope to have time for that during or after the weekend.

-- 
With best wishes
Dmitry

