Return-Path: <linux-arm-msm+bounces-47519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A903A30558
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F054316764E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 08:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D63C1EEA37;
	Tue, 11 Feb 2025 08:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Srii4Zhw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938211EE7CB
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 08:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261546; cv=none; b=aT/Fj+UN6+dGIteCBrtqWkRuK8BrOwDG7RuRmNa7fQZMH8vcoJQcdUZ1cr/kr2a/fYE0+/GGL61/cnTAylogjICoL8Lyr+I9CEexUaXDg8qxHrHFJgdylq1N3jY/6Qcbrsv3EEmbbkAOh3aq2a+dpN7AmpdcJzCwi9xRqEoJwg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261546; c=relaxed/simple;
	bh=hDZF76s0+s3nQKWmMd335G35ca1BnoygOxqTHvKFjnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VhSAyDKRcZAPyxYKOuxs9pBdP3NSmlYwyn04lvaQNQ15TPpnRc6RAQuphPenti8VizGVEPFM7mCVjObZhEk8V+s4sWE3xvwJ5KuIqNhDXtR7KXDVmyO/bIzU4t1kpgZ+oo2dZj/CjXqCOJdzJHLmrOuK4qP+MLXbptw0lHCfdKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Srii4Zhw; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30613802a04so53354001fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 00:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739261542; x=1739866342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZBPv6QOC9HyqG83lsiP8B3hCPsDW+zwfD1sc16aqzQ=;
        b=Srii4ZhwIpcHAV/jIHfFPmKfWk/E0t2DcWQ5xr3tqSSXwPf0gzdKhZ7P/9NfRSbNqh
         HNlcWekNIUwhrD5OBkeu5rnRkVPia6JIhzIJag2lx5/N9KNM0ZNp2308kS+guuYQxDZD
         zC5O2OaiysN+F9WW/VBtPFCNWPLptJel+mYVXpc7MkAQe0S+wdk/q7MV5mmatdLmWi/1
         mARSweym3rzCGN3ZFZ3002Mc8YKQ86J8SdkogDjk4G6vK838i3rpwJ0+JM2gxAJJ4HwR
         l16WxqA/jh5S8JnV20UxPB8C0HZmRwhZKMs44P/2T3UKxcWEyRHR/ZCyV+WehMWV9XWo
         ToEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739261542; x=1739866342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZBPv6QOC9HyqG83lsiP8B3hCPsDW+zwfD1sc16aqzQ=;
        b=o2UXefn4/W7mu4T4UHP/FAJasBmXGb86JX5Sn+xsacdMXc9NppEnLKw8Bdk8EZqMuD
         pu+c9wpDhQoB/DFYQ7aIUfx+k4+w7s+PT+jKNACWLpG6I+L7YTGnm68oHnVLD19vFXrp
         vNJYMyJyD94kI8jxxqAnd9bafDJ0Fjj5pl6bey74NREGL0RVUOGBX+gAZEG2Hn47+ir0
         /CEcLk+WOrYIEVZmW+FfRYBDhQqbTBbySdkQzwq1Wop6VtfN7HNZZ5VpzeCxyDVjUWcN
         /Y7rVK0Pu3DlhviONnHsDfatQYTBdpC0phth1DQk8+R6kAaqZ4Ra1qPkJX6QYNCNK6yJ
         Oa4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfR/maFbJLKO4njOEY7SC9KUyeVB5ss3hVrosOCNAdTbm2CW7KeLnYbTxAnKdnD4lOERAAAZfHEQ012hBc@vger.kernel.org
X-Gm-Message-State: AOJu0YwztPO4LrNcIThW0esfb7QY5/f1ngSn4EJklSa3tm5prgdjRCEg
	mdo2tscnxPZ4UwnLVqurf5Jy1GheizgcmdRztTgaLVpqhXpVV9St9gdARHVyS5JZggFZK8ZY4cv
	oVXfHZ8s6zJyj1ePHHETYdRKbRDK0wZ7YDIncZQ==
X-Gm-Gg: ASbGnctypZ9G8zGfLLtgteg27ND5HvAV1PlhlUIaytgGYY7i+IBkUvV7KVNHyQ6I0im
	i38BW5blveGOJapuEYLopAaSFMb4bhhQ+CLEHWMvwbA9em0UU/Qu0joFBJYKIfzVLICWqJyjBkY
	MntrcLcsE0ds/RJ3nEpXa3M1SEa7s=
X-Google-Smtp-Source: AGHT+IHsnSGZUFQMOoiXCGeHwOhkS4uzUDRmLLENwo/njPODTJnW3qTKSrQ7Ha1UrP2LHvzY0dNeNgevSz0lHNMxLPY=
X-Received: by 2002:a2e:bea4:0:b0:308:fd11:76eb with SMTP id
 38308e7fff4ca-308fd1179e6mr4836001fa.19.1739261542476; Tue, 11 Feb 2025
 00:12:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210202336.349924-1-ebiggers@kernel.org>
In-Reply-To: <20250210202336.349924-1-ebiggers@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 09:12:11 +0100
X-Gm-Features: AWEUYZkUIVqXHClndXAUtENhhMz-NcIhEeDU_e0vb-Z-ySUsEFA2hwDxIAg98Qo
Message-ID: <CAMRc=Md0fsB7Yfx9Au1pXi+7Y_5DQf2z430c9R+tyS9e60-y5w@mail.gmail.com>
Subject: Re: [PATCH v12 0/4] Driver and fscrypt support for HW-wrapped inline
 encryption keys
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Gaurav Kashyap <quic_gaurkash@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jens Axboe <axboe@kernel.dk>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 9:25=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> This patchset is based on linux-block/for-next and is also available at:
>
>     git fetch https://git.kernel.org/pub/scm/fs/fscrypt/linux.git wrapped=
-keys-v12
>
> Now that the block layer support for hardware-wrapped inline encryption
> keys has been applied for 6.15
> (https://lore.kernel.org/r/173920649542.40307.8847368467858129326.b4-ty@k=
ernel.dk),
> this series refreshes the remaining patches.  They add the support for
> hardware-wrapped inline encryption keys to the Qualcomm ICE and UFS
> drivers and to fscrypt.  All tested on SM8650 with xfstests.
>
> TBD whether these will land in 6.15 too, or wait until 6.16 when the
> block patches that patches 2-4 depend on will have landed.
>

Could Jens provide an immutable branch with these patches? I don't
think there's a reason to delay it for another 3 months TBH.

Bartosz

