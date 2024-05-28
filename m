Return-Path: <linux-arm-msm+bounces-20705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 082038D1555
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 09:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A150A284AF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 07:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3250F7345A;
	Tue, 28 May 2024 07:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nZNYbyvQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A762473441
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 07:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716881193; cv=none; b=YMdaW9XjTjEd33DP1EBaf2mFgV6zt0MD/TKTLwWYGx8IbRKkzhormkB4CcHA+LST/0cnnunUihyG9YneKDF1QY4+SgkIfOw86RxDxdBKSEAJD8xZh4ltB4C6i16zpDMuV6huGDWur5bHZAO9uXXPzk0Zyv8zG5uluZy7wxWAZ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716881193; c=relaxed/simple;
	bh=Wb7/vxmVn2sLhr5nQIemWiJRmtkq/q6L+aljI3e6J2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d5Y5GCIxMtuKvw1ohCiCWOGwSFQKiHiLx3hB2uVJslrVyd57aPiVgT1wB61ScSRqK5Bhi0LxnUS4JecWztEF8zQJvUgpI403BYklIAQpoSLYgAZhvGA3gwQXFAX2NUa3klkmxb4mCXf6OraKNo15FcWW2qlcBIIDrRcIqfekFVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nZNYbyvQ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5295e488248so606149e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 00:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716881189; x=1717485989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wb7/vxmVn2sLhr5nQIemWiJRmtkq/q6L+aljI3e6J2Y=;
        b=nZNYbyvQouo36WbOzltHwO2RGZZSFKaJqbl3qhxdfNjXXlovCDkO25r4k//d7AVgDB
         tR+h5zVO4C0IlFI1t7E374z4KcJfQ8qrhQXTtZ2cJuuiN0y2nAYHYJpC7f1nleWTdeiV
         4qN0yqnYrBGVdO9I9QK9HrfGSOiSXb0yuwECs1o8q51qbhYfQLToeh7zhGJZRRexp5pN
         9BIe7+oegzWVdpYDCRVxln9jxokQlnZ/VtEYveMCfJrK6pTXUgoftbokE2h8yhR1qVrp
         AE9doHCra7mR+vLLSW69mYezRiyro16h5JxvK6BgUhAda9aDkMn3DnijrslpneK4FgvJ
         jagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716881189; x=1717485989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wb7/vxmVn2sLhr5nQIemWiJRmtkq/q6L+aljI3e6J2Y=;
        b=JpOqyt6iAkFtCSB5Kt6iW20z3nyRidnSMHKY3ArDFPAK3veS1LghH290xriSTqdlvm
         zIHjCV7wunIOiJRWJak9TSHMZQyU6Byjhf9ZZmgX4uV7rffvad6SCqVBAWHEhSrPFKk/
         dH4uUN2nM75wapmwOLdCR7QOgwt/DKDYXiXkaByn2YI5X36YWK+oK2w5NDvsyWGFLaV1
         GYDk/8o+CACUkyyQC3/UyoSLakD0DJOTl6bKn308GMxJgbtM5VmgGs9v2hMW3PGuVsCc
         OKWWm+Qi/SI1oVZ/35y3i15aOt50Dnzucw+BD3yGoVCq/EPtgJGWM/7svfWYRr3KKS0x
         qdFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj7U1R4eJY2mklnmiSkUtIZe6phpRyKRDgYjUVIBaeCYSn0mesIjhlT0LpOEgXkJo+itkUq+BHEKGywB2KI/9igDeGkCQAepiiW6VlWA==
X-Gm-Message-State: AOJu0YyWoCLRfl0fOovi98of5rHacAYGulyTswmhhNVINA4SA+RV1tLL
	PPpTI4a5BY7eDh5ZlbKYhsyZlfmQgTLt6189JUADzg9y6+34DfMWULNLZpUw9ccXajxP4m4rIti
	rgE3LM4lR7zBTrtVb/3KLbG+yt/MX6tmq8i49dg==
X-Google-Smtp-Source: AGHT+IEqwG8lGB63TRtEHQ50qoCp6W8M3rlfT/je1S6Zp1mGlceEHeIquoczIa/UPZy5YbMAUDrdbQWUFj+EH+rU4f4=
X-Received: by 2002:a2e:83d6:0:b0:2e7:1b8:7b77 with SMTP id
 38308e7fff4ca-2e95b0c163cmr71809171fa.22.1716881189068; Tue, 28 May 2024
 00:26:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
 <20240527-topic-lemans-iot-remoteproc-v2-1-8d24e3409daf@linaro.org> <ae768bb2-cb96-4a05-8752-66bc6bfdab1b@kernel.org>
In-Reply-To: <ae768bb2-cb96-4a05-8752-66bc6bfdab1b@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 May 2024 09:26:17 +0200
Message-ID: <CAMRc=Me9B3H9NM2VKrVSSce0-o=ZZuC2TQxt7eYLD5aWEKy+SA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: qcom,sa8775p-pas:
 Document the SA8775p ADSP, CDSP and GPDSP
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tengfei Fan <quic_tengfan@quicinc.com>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Alex Elder <elder@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 10:56=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 27/05/2024 10:43, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Document the components used to boot the ADSP, CDSP0, CDSP1, GPDSP0 and
> > GPDSP1 on the SA8775p SoC.
> >
> > Co-developed-by: Tengfei Fan <quic_tengfan@quicinc.com>
>
> Missing SoB.
>

Does it though? The patch never passed through Tengfei's hands, I just
wanted to give him credit for the work modifying the sm8550-pas
bindings.

Bart

