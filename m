Return-Path: <linux-arm-msm+bounces-43273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B84C9FC1AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 20:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F71D7A1852
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 19:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6188D212D65;
	Tue, 24 Dec 2024 19:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H51ckFsv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B9C212B1F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 19:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735068822; cv=none; b=Ihf7s8vKT5U9u4ydR/9PYn8Dpf7OinbNgjYZAiST38skit46P+lIxKvR8Vf8P96hgDKo1iAQZXWxhp4GZGXUC/W9gxVo5uBSGsRwnBl7CesWsItB+Z/n52EmOapLZktv5eLCqmvTIJz/3zKS353VPX+ju3nrb+AAIKkrPDmwsxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735068822; c=relaxed/simple;
	bh=dSFj0sRDXNjhaoYnQOd39RTHR4MuQ7/g8Cwqoz6gE+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRyfFA4eIps17PCk6XpiHeQHOyCE8oCn0xE1SIf+NirXHdRMLhFGBijZol+v8mE1FA8XyROd4bmwU33scsvfZ+Mch0DEw4lw72idtNDTHFirKGpCpdaN5JlJ9ALJZAZRDRYppJRmgY6Bnof6RVSF8wInUtsTF+h+pSse1ZxlgcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H51ckFsv; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3043e84c687so44991111fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 11:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735068818; x=1735673618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hj5ZQYj6ZfvnBNr/ZwjvBlcO0X3/akFeihZJe9d7b8A=;
        b=H51ckFsvpTIAC21y2N5D7MaMnMXM/lXaAFqCSic4xIBoIRxSg6eBGoEXaswtwAOd20
         gvcbNEU6vFrzYPnLmvZjB0N0FKTn5Svmud10LLE4pZLo+QEYhcXrkio5OHtMwUMxh/BV
         OO0YLL67xCgLcaT/7tArjTilOHdQlU2uQU+hJhU7NhNw3xIqgOUmLNmih3z+UZd9qZmC
         g54NgRyZDmcNJMoxb0HKV4ep4D7OA1vO50zTyiyje+rlvSAAYij4SiHbj+Cqs9Sh63fw
         Ud49om30o1MmUaj7b9LmJBlghkA3iUkbMudLdiqYU2wdCzIahTEmkctREVL6e/QQ2xu/
         C38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735068818; x=1735673618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hj5ZQYj6ZfvnBNr/ZwjvBlcO0X3/akFeihZJe9d7b8A=;
        b=wjAVwhdEWh0OGojEySIrkYABWjdPYG+G4TI4yHuFX0eVO22RCt5WdPvrDAjP8lfMga
         b5CmcsNstAmJox7s/XRoZRnCNtQjUUA8hG/BAt5AcT2Y/RkeiB9fjhuXPeZDHDGB50e5
         XTNrkZl3g5PK/g8Jk0zQU/lmO8DpcJb4/HydvRgQYUjDkdtFNUaHJoQukQMxiCkIemmb
         r+sly//FL5dJ4aTLmfPDguawxuwvKH/pd27HdxKF6FAfJjfPEF0U1vySwfwEyCDfd51l
         uvvM/NCxWBzx/s8ouVR1UrH6Z9P+WPJfts+M8SZv5DLO2HR2EbzBWy5hSklrAdjUe4ds
         sPfg==
X-Forwarded-Encrypted: i=1; AJvYcCWOlNUfXyKTfQj6aIs2ACx9i9LOswza7QFZ3dLnpMt3akN/ccQOKMaU9zlVD0RFth4s/KDvpiHOktUEjegn@vger.kernel.org
X-Gm-Message-State: AOJu0YwinYhslqfUvskh6Wi0Ja6QLywvFJan5fFr3ixKJlxVXhcDOCXF
	uUzEudCP3L5pWgvWCCJxVT75oNerDhUXVldZdawZJQ9WntqOM7qyEvakK+Yxumw=
X-Gm-Gg: ASbGnctRUEWr8qB1PI2UT9y6+p4fMqXbdDdyJWGygJl75fhNGjEgOa5JxPVQJvx2EN/
	jlAHLBGstt52DapGcVDaaTpnWttXGIod07+bFMrFOjYe7ckGY5VSB7MAkAGUb+jzUN7Cl/TPTJu
	nA+J86uEwaQa0mft1a0zSc6YbBGOiFElmqfzjGdpc80r3UsM5pbWha/TS8uc/n4hErm6i0ynZQK
	rH58s7fsbMb5mbzrU5/04qqjgzO0LalSHk64Z3w7Hn9Qmxaoi8OjdGtT++gTvCeNOFwUEL6V1HO
	+8M6mRYLcynwumS0ABGA74Ly0Pehe6vzLoOi
X-Google-Smtp-Source: AGHT+IEkb0VKMilQU2dWu2ZBHliquu6RNqgoSY7VWxk9u+ibKV61fNt7hOqrfr2SiK3VLvGe0YstxA==
X-Received: by 2002:a05:651c:781:b0:300:3307:389d with SMTP id 38308e7fff4ca-3046858d397mr47101911fa.19.1735068818550;
        Tue, 24 Dec 2024 11:33:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adad4a8sm17662401fa.68.2024.12.24.11.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 11:33:38 -0800 (PST)
Date: Tue, 24 Dec 2024 21:33:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Varadarajan Narayanan <quic_varada@quicinc.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, quic_ppratap@quicinc.com, 
	quic_jackp@quicinc.com
Subject: Re: (subset) [PATCH v3 0/3] Add support for USB controllers on QCS615
Message-ID: <i7gptvn2fitpqypycjhsyjnp63s2w5omx4jtpubylfc3hx3m5l@jbuin5uvxuoc>
References: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
 <173505391861.950293.11120368190852109172.b4-ty@kernel.org>
 <anfqf3jvh7timbvbfqfidylb4iro47cdinbb2y64fdalbiszum@2s3n7axnxixb>
 <Z2sJK9g7hiHnPwYA@vaman>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2sJK9g7hiHnPwYA@vaman>

On Wed, Dec 25, 2024 at 12:49:07AM +0530, Vinod Koul wrote:
> On 24-12-24, 17:38, Dmitry Baryshkov wrote:
> > On Tue, Dec 24, 2024 at 08:55:18PM +0530, Vinod Koul wrote:
> > > 
> > > On Tue, 24 Dec 2024 14:16:18 +0530, Krishna Kurapati wrote:
> > > > This series aims at enabling USB on QCS615 which has 2 USB controllers.
> > > > The primary controller is SuperSpeed capable and secondary one is
> > > > High Speed only capable. The High Speed Phy is a QUSB2 phy and the
> > > > SuperSpeed Phy is a QMP Uni Phy which supports non-concurrent DP.
> > > > 
> > > > Link to v1:
> > > > https://lore.kernel.org/all/20241014084432.3310114-1-quic_kriskura@quicinc.com/
> > > > 
> > > > [...]
> > > 
> > > Applied, thanks!
> > > 
> > > [2/3] phy: qcom-qusb2: Add support for QCS615
> > >       commit: 8adbf20e05025f588d68fb5b0fbbdab4e9a6f97e
> > 
> > Is there any issue with the two remaining patches?
> 
> Something wrong with b4... I have applied 2 & 3
> Patch 1 should go thru USB tree

Hmm, strange. But then, please excuse my ignorance, do we have bindings
for these two patches?

-- 
With best wishes
Dmitry

