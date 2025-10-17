Return-Path: <linux-arm-msm+bounces-77710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41684BE7273
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 10:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E1DC400559
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97942284883;
	Fri, 17 Oct 2025 08:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r+SYuu2D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523BF283C8E
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760689571; cv=none; b=LMmpQ9FFQfvEPKNW2nj+6DyuWf38+bgVhNyW9d3qTp7EAGHAAK77iQvIy+LBsbd0Dm9ySVCR1Bd6gUJQeW06V/+MeS7AXiAPoHKAOeTwWh/3RIn/9FK198InllQMQPQSmjQrgYouq6qm05otujitkzFnK7UC44d9d4AQgddaFhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760689571; c=relaxed/simple;
	bh=yFK6k6NhAz92VDinM24x4y/M4QwPXWbPL4uuyBP1h4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRMksriw4qF3MHgqZbwywGL1UAmpnmdO6or2L6BQedZ31yX+Eg5LUa963CA/63FZx+N8wESAdIopqgR3yFlf0UOnUP+/J/PoIxh8Z2fBsbutcRS956c7Fdtp4xaEsfk6LFUr3ZNOrorPx0X5Pu8gNrpZzNDuEU9weiI804xcrgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r+SYuu2D; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b64cdbb949cso120661066b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 01:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760689565; x=1761294365; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VyUwehKjLcuHDNejMzdoJjZAJgmXLkyY0r2v2tgM9dk=;
        b=r+SYuu2DDkYNv6Li/U1leIJ9WwxXoJxGD9ndnSXAH7VPeHWOfh48H32yVNiClAtCHM
         Pv/SEfjIkKF4QD/jmsMcjf/CbtqX9DD2fq1f6N1tFggBey74g5RquL5lEpL3DaVfnL2Y
         slBIQBVMi8FpAxqYjUj+KAMhTwgsKpDGnknGrgyRjMUCQmUzSOOLn8mIn9MOqMfh5+mG
         PVquCDI2ZnljPY7EAichAHwMy11iKEisB3/+Sl3ZIDQrIbLyufLpdjrBiPcJdFUeJ9EB
         1SLfS34Of8a2ZIb4N2wxnwN2WPniS8CV1DbPXjeJZqZ4LHeOQnu1zDVsoBwjgzdqjtE+
         aTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760689565; x=1761294365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VyUwehKjLcuHDNejMzdoJjZAJgmXLkyY0r2v2tgM9dk=;
        b=i2WRoYvMXvOnM20z//eJMn/QzJgYfJzxYcCPuxFSrSPopBrbzlZhPnrmMolKMn+nBa
         3ggV7FW9yjM1P8dW7gQvmNRhmkJjHHmpiRlzqI65H/TJ9iDPxYAedWum+LDl+6sYImOu
         q14G8SmEjqUUBPNaLu/DPCJBQ5bZdmbNNgZ59a9Dh/Kx+WMMIk9i00evTtvQYDynHZk6
         hX8x0oXbPsmsZWT51a0g4+7xm+/3js8AFTOdBepWJz+j0vENjNvGRO+uER5gJg7CmlWz
         ABnnhkgRzMalHZKxhOht5IXzvKKbTVx+2Sm/zNBigZRwqezd8qN3jbu/ANo1gF2efPC/
         stOw==
X-Forwarded-Encrypted: i=1; AJvYcCUexIfP5JKOIiWJWDgudoDC++ZjdDE8zxR6QQBe5nCfbcld4J0LSS1JT26x0eyWlj9FCTGNc4W6JWbBYTvn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0g7DHCnrnDL07YV6eXdpScTN/nYpbrso8M6yzBEQrx9bRUTxk
	XiOIBl1yNHpL5xoLdgmuo5ixDh8EsgxBOTw7+JTaSzpsonR92Ql5bLrl7Bo9vVCehpNaSZhe7k4
	5O9hu5GbXO3kyGnG5tPTZC97aQjn7Gfe4DwIoqvBRYw==
X-Gm-Gg: ASbGncvSctWpoIZeKu1o0+1xCf00qfFGqLZKeaTpiMYmduvaXovHwMy3OErLHnHhL16
	4WlUDTSHGQptIpQcGG0gEFWy/dF+HRXg6qKljM0uDkGv93JvbL7Dj613x768icd4dTbW0JHmkZm
	xVrH2zP/cYP0TkmXtnYUGDhO2d0bb4Oq71N+XJdQ+6bchdntQN9ito8+TW3v+utxe9bCWxnk8yQ
	trnJQ6nZ9H3bu/pEvs2Snb+xO29N65H3N5czR69Yf6bY32xJOzImENTTlCdD45QkX8/2mWxKYwV
	9srtwwX69Jo8RFK6
X-Google-Smtp-Source: AGHT+IHbtlFXBkl17CEDHiEIXjQIR3AcZWigxlCUhE3F8cQIbFOycTLrDz3Fd9b4pkwziOemPMHap0mwtYPqnRvlsVQ=
X-Received: by 2002:a17:907:9801:b0:b49:b75e:6983 with SMTP id
 a640c23a62f3a-b6475316890mr278570566b.49.1760689565581; Fri, 17 Oct 2025
 01:26:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017070702.1637092-1-rdunlap@infradead.org> <dfc03399-d4f8-4e52-b097-75fbbfd1c8f7@oss.qualcomm.com>
In-Reply-To: <dfc03399-d4f8-4e52-b097-75fbbfd1c8f7@oss.qualcomm.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Fri, 17 Oct 2025 10:25:54 +0200
X-Gm-Features: AS18NWCUY9arCyHfiUtW12k5sMm7r8Ddi1bbMBtkAIVhTV3EnWf4cbcOv4bku4E
Message-ID: <CACMJSetEtS6n8cA0bnH2VORw_4b3Jpw74nqNAqE4W8XLKo6grg@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: tzmem: area: fix qcom_tzmem_policy kernel-doc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Oct 2025 at 10:17, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/17/25 9:07 AM, Randy Dunlap wrote:
> > Fix kernel-doc warnings by using correct kernel-doc syntax and
> > formatting to prevent warnings:
> >
> > Warning: include/linux/firmware/qcom/qcom_tzmem.h:25 Enum value
> >  'QCOM_TZMEM_POLICY_STATIC' not described in enum 'qcom_tzmem_policy'
> > Warning: ../include/linux/firmware/qcom/qcom_tzmem.h:25 Enum value
> >  'QCOM_TZMEM_POLICY_MULTIPLIER' not described in enum 'qcom_tzmem_policy'
> > Warning: ../include/linux/firmware/qcom/qcom_tzmem.h:25 Enum value
> >  'QCOM_TZMEM_POLICY_ON_DEMAND' not described in enum 'qcom_tzmem_policy'
> >
> > Fixes: 84f5a7b67b61 ("firmware: qcom: add a dedicated TrustZone buffer allocator")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > ---
> > Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Cc: Bjorn Andersson <andersson@kernel.org>
> > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > ---
> >  include/linux/firmware/qcom/qcom_tzmem.h |   12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > --- linux-next-20251016.orig/include/linux/firmware/qcom/qcom_tzmem.h
> > +++ linux-next-20251016/include/linux/firmware/qcom/qcom_tzmem.h
> > @@ -17,11 +17,17 @@ struct qcom_tzmem_pool;
> >   * enum qcom_tzmem_policy - Policy for pool growth.
> >   */
> >  enum qcom_tzmem_policy {
> > -     /**< Static pool, never grow above initial size. */
> > +     /**
> > +      * @QCOM_TZMEM_POLICY_STATIC: Static pool,
> > +      * never grow above initial size. */
>
> Didn't know inline '*/' was cool, but if the checkers I'm happy, I'm not
> going to complain either
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

Yes, very surprising. Almost doesn't look "right".

Anyway:
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

