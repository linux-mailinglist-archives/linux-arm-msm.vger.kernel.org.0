Return-Path: <linux-arm-msm+bounces-38444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC989D3882
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAA1C1F23BEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 10:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3581D177998;
	Wed, 20 Nov 2024 10:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nw2h3b9l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323DF158D6A
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 10:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732099158; cv=none; b=c+fVuUzhpXO1CEZfgd5jCCW6kXW5U1P+8Fjv+xAgU9snTazz8kpdjdrL8702tX7W5VfaJJcHGCQZvuK4yZ72Clk+EOZrdw5bW0HEjt8WxQ7kj9+qw/YL3mG7z4lNpJGnBP7300eME9XI/8KRuuWfiNa3SV6ZWt1Tok4OPii7yqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732099158; c=relaxed/simple;
	bh=TwR7yiebpfVqeK5SWSybxgnPu59KNodky0dFCRd+h4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKahi2uuYi0j/ImnV4VzNEDVDPH444l8qpLO8QIB/mcs7iYz4KFvYy9mYNCcRaMIMgw9LaFPYyG2ED1IaSCeCExnqQHHEZKAiIBhVf1tcEvCS7ubiuJVI0C3Y56gn6/3lv6UXDfNy5Q6yQ7sly1PX0b+UVmCcWd7Cod7dKbmfcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nw2h3b9l; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53da209492cso6510619e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 02:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732099154; x=1732703954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WDF8E3m2N7Vk+a4YnA2jlyfjSe+DimbeOLxWBc4oAvg=;
        b=nw2h3b9lww/6bIj9QPU//KriqH/iBaTrm21q0WJBkcZBDXlFvkabNFH3SZAleeFEUV
         sOXNaNFloAWoZcfl2DJtjNaxa4GKgZvAfiasIEuxYb/EH0iqj9+c67kJT6pUAwpE5tW4
         NEsrvFd8inrUELbvJ29U8BLvcfOQ4CwGmLDx8JjT/pVu5GOunSDB9khbz4pOKD5yBCoo
         k2aS1U8gyF1RSNg/CHg60CzfO8yjWzDwMUk9vVA716+8fQgZ271iq6PDaJAcU2C74WV9
         lJiZkHuWmYEOsS0jdjpZVwL3b29j9BztAbCQsGBOTFP3g1qp7qMzpc+I5OhuRlAp7Oem
         PfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732099154; x=1732703954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDF8E3m2N7Vk+a4YnA2jlyfjSe+DimbeOLxWBc4oAvg=;
        b=N+TOzQALhpDQRyhn5y5nWCat34pPmsF39NWkowHzmLq3tvtlP8yOJfuauqESOV4Y25
         o1ortm5sqWAZ+rk1Gp12OqiL9tOfI7Z1AA7mwcbd/bBEwfOeEwQSaENf9wbfO1dtvmbU
         /59LnigO6Xwb8oEqM4xgZO81+PqepYE5j/HMkzLyBYwHO1JtJTZ2Z4bqAvhPlQKWkQMK
         zjI/8BluqiyJZ1Fq3+3nlGhhylMsP95p/Z9B87HgS0lmGjpBbkwLQirXmK9OIfIYDyEC
         oe60ZbkPaIkbe9qDRVWcCqASd6QoOk6mFZWfR9lc0NaplfhXZfgEiKdmTxLdXqcD3DdU
         93kw==
X-Forwarded-Encrypted: i=1; AJvYcCVcFi96x8P7qqlvWzYsU3aSOzlDfW/WhwDqplISnBUoy7HfT2yUbHcOpoEYxPcRGpFAQNX++TCNbdN1GyjI@vger.kernel.org
X-Gm-Message-State: AOJu0YzM0w4MkZ7yXq5oezmxL0GZvbpJoRY4n2v1sMnNpeO0WULojUDA
	FUb1RLAvnJP9VcxsOT/sslKKYRRupnFySxSU2A1968mGreTqvB7ivJJDZgEywDE=
X-Google-Smtp-Source: AGHT+IH3Vlowq6qX83zYFQ1wyc4wpGbDrW8lYoEpxuvci2lGDIPGfxROFI0K+RJ6ElitxENmM7S/TA==
X-Received: by 2002:a05:6512:3b24:b0:53d:c062:b5b7 with SMTP id 2adb3069b0e04-53dc136739dmr996939e87.42.1732099154281;
        Wed, 20 Nov 2024 02:39:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd3fd036sm584336e87.111.2024.11.20.02.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 02:39:12 -0800 (PST)
Date: Wed, 20 Nov 2024 12:39:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, 
	"Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, "quic_zhgao@quicinc.co" <quic_zhgao@quicinc.com>, 
	linux-arm-msm@vger.kernel.org
Subject: Re: add venus firmware file for qcs615
Message-ID: <egdqhgdiqqny57yiauiyekcvhxvebfttyncqoazslzjprwvakz@txvy7wn4vg7g>
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com>
 <ng4o7sdejoh4jn4nnarjd4lio4lbx2tiuiz5c6bigjbtxldinr@xl5wx6dmdivy>
 <ab4f83c1-5cd6-a80b-fd85-ccc337c8f301@quicinc.com>
 <pqoq64hk2jedmqta5fs4ktcadw4getwkgz324vtrzzotcurpaw@zc6dlhbqtsnz>
 <a1bbc1d0-d3bd-e44e-e393-a7ade909a506@quicinc.com>
 <CAA8EJpoDXKbF5cqb_vzE28zjdC6OC66Zxb5j030QXaCe+FUmfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoDXKbF5cqb_vzE28zjdC6OC66Zxb5j030QXaCe+FUmfw@mail.gmail.com>

On Thu, Nov 14, 2024 at 01:31:14PM +0200, Dmitry Baryshkov wrote:
> On Thu, 14 Nov 2024 at 13:05, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
> >
> >
> > On 11/14/2024 4:16 PM, Dmitry Baryshkov wrote:
> > > On Thu, Nov 14, 2024 at 09:06:55AM +0530, Vikash Garodia wrote:
> > >>
> > >> On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
> > >>> On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
> > >>>> Hello
> > >>>>
> > >>>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> > >>>>
> > >>>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> > >>>>
> > >>>> are available in the Git repository at:
> > >>>>
> > >>>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
> > >>>>
> > >>>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
> > >>>>
> > >>>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
> > >>>>
> > >>>> ----------------------------------------------------------------
> > >>>> Renjiang Han (1):
> > >>>>       qcom: venus-5.4: add venus firmware file for qcs615
> > >>>>
> > >>>> WHENCE                      |   1 +
> > >>>
> > >>> Could you please be more specific, what is the difference between the
> > >>> existing file and a new file? According to the soc_vers the new file
> > >>> supports sdm845. Should it instead replace the old firmware?
> > >> SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
> > >> different signing for qcs615, it takes a separate bin (xxx_s6.mbn).
> > >
> > > Can SDM845 handle v6 signatures? It supports v5 and PSS. Or can QCS615
> > > use v5 signatures?
> > Infact we started with loading sc7180 firmware on qc615, video init failed. So
> > far i have seen 2 categories in signing version for video bins, either default
> > or v6 specific tool.
> 
> Can firmware / security engineers actually advice us on using v5
> firmware signatures with QCS615 _and_ with older platforms?
> Existing venus-5.4/venus.mbn uses v3

Vikash, any updates on this topic? Would it be possible to have a single
FW image with just v5 signatures?

-- 
With best wishes
Dmitry

