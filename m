Return-Path: <linux-arm-msm+bounces-28468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 040E39517B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 11:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B838B255D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 09:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C8E145A0B;
	Wed, 14 Aug 2024 09:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lGtwgmId"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597D8145327
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 09:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723627697; cv=none; b=sin9dmHfXPGRNQwGTvimhKLVi4XgjnB2h2q0fCwrJ70QrgmrAKhafKfF2Rr7WolfXgzsZ0wYxowIZv75dr9ibCctznHT78xvotttToRwegsdqo33oE/SMhvRlJPscVcSQ0O7kzLpIc2ccwRHj7vrtPp9yVHkfNauX4PS0tR5fP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723627697; c=relaxed/simple;
	bh=KdxsryBtMUzqo1RV5EZOLXiAQ9j8G3+iome+hahtQgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nghMNXc02PWpbNlu1kJTuJa6d8nfAmDbyCq30l70aIsHX18DSvnm77rtogLNr3N7H551LT9nyFoeDdsOjTIti6ffG8GyzKyMdfGiUOaSbu0Hubw50O8zoK2ODv1p0WPJRLxiqraaXqW/S64KvbGrUkexEWg/8gY+X01dnQ7vdP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lGtwgmId; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52efc60a6e6so8563434e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 02:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723627694; x=1724232494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3P9Jq6VrXIYga285qB+T9g1aGPyBny+fQnSPL8FQbI=;
        b=lGtwgmId0QJyB3jd826bOukdBQqZwK2/zvtgGWvs4TU+VZHPSYalQt0bTMWZlcbciy
         u9x3zdC/t4nvb/Dk0ZYd78kgwWmByFlNR+HDpTEiod+XwE/k6ZHeZ5PDY5Axgkv6b3uu
         YQpOku44Hpm6F6kdnAx5zfFAX5JlagUN3lvzjoiwTYEeV941s6w/iFPqWjphKbJzcm6u
         A4BT5+MWiP+VtYOFbiq+Mv89NcOmzCJ93eZeZ2U7lRgpYPvR4ZVDW5DgUglaou9ZI2F2
         ssBMYpAh4XnqMcyTsVVxS0QusB5Vn+30hxBnWowr4YbKYdTVzEJIu45Og3lOsZjBGxBa
         jMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723627694; x=1724232494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3P9Jq6VrXIYga285qB+T9g1aGPyBny+fQnSPL8FQbI=;
        b=bMc2IUb1RuEEE49IbKj3V3SvT9Ls9EYF6B2e0eyV1KAg1XFHVL2L5+3CfJwe5+oKZ0
         4ngI0bD8Cjppxix1Nd/5eynEVS3BWIRjGGdnrAXLDT/kVWLKC0y7TwuV4Zz6a4qp+P/c
         xcm8tR6HeiY5gzHuEpzPpR794SitkNIVmz+iyDvb322LyGmwbWLK2LEqbuy3nHUyvefj
         65o9zz9tLOfcDmmeFPR/NIBla2QJDJxXeBTeiOnAjc9qwzZCyAhTx5HloblgJ54Zyk8H
         lmzDTtiWUXiDOjwnEMko4EM+FbYFtojGLbSHvNsxQudKOdi4IJbT+SDBv6JY7ZgMjgO7
         n1kA==
X-Gm-Message-State: AOJu0YwtW/E+I0xJx9tDwOpoqCQFPwy9APTEqoc6FYy3S7GenFajtKOe
	NZ7gEBgrTNVuEdsA0XBjJgOW9W3fe0I6xGy/j+2axBHP4Gwcvz0BVcsmUwGnKQKbOV851yIsNsM
	LW1chrlDF/+GzluP37ATYj0+1B8zo2hPWyv5LAQ==
X-Google-Smtp-Source: AGHT+IFe05bN9bAq9xy+58l7ncXMDFx1z/bJrarVfwaEv3r5G9ew4J8l/Ct5njAjkzJrtDklkvisuQOYqwkGO+3QFcI=
X-Received: by 2002:a05:6512:3da8:b0:52c:dc25:d706 with SMTP id
 2adb3069b0e04-532edbbd3bemr1391778e87.52.1723627694266; Wed, 14 Aug 2024
 02:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731-tzmem-efivars-fix-v2-0-f0e84071ec07@linaro.org>
In-Reply-To: <20240731-tzmem-efivars-fix-v2-0-f0e84071ec07@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 14 Aug 2024 11:28:03 +0200
Message-ID: <CAMRc=MeS++NAyVn3+9mGpiUypMcX24EyonQPD9NV7tdTf7Ytng@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] firmware: qcom: fix an efivars regression in qseecom
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 9:45=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> The first patch address the regression with efivars using the qseecom
> driver reported by Johan Hovold. The second patch removed dead code that
> was left over during the conversion of the qseecom driver to using
> tzmeme.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes in v2:
> - Update the kerneldoc for qcom_tzmem_to_phys()
> - Link to v1: https://lore.kernel.org/r/20240730-tzmem-efivars-fix-v1-0-b=
b78884810b5@linaro.org
>
> ---
> Bartosz Golaszewski (2):
>       firmware: qcom: tzmem: fix virtual-to-physical address conversion
>       firmware: qcom: qseecom: remove unused functions
>
>  drivers/firmware/qcom/qcom_tzmem.c         | 32 +++++++++++++--------
>  include/linux/firmware/qcom/qcom_qseecom.h | 45 ------------------------=
------
>  2 files changed, 21 insertions(+), 56 deletions(-)
> ---
> base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
> change-id: 20240730-tzmem-efivars-fix-d9635d39cbf2
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

It's been two weeks. Can this be picked up into v6.11?

Bart

