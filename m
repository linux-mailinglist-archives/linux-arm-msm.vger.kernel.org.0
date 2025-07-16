Return-Path: <linux-arm-msm+bounces-65263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 193C7B077E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 16:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F5401C2087F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F82223DE9;
	Wed, 16 Jul 2025 14:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C0weJCt3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2737F1C2335
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752675715; cv=none; b=SfO1RpuzWL0kh7uk9qZBUJmEQuSXM8947ADb523y3KTvXzWU+K4mVFy2GF7kkGvn/dOg174hb1BALjfK11L5FvL36NZGO8YaaP46I2eaPxEe9HhqcLBEvPJ5RoZ7yt8xTFFBal+3VKlQzq6bAjo3aeiap6GBhwOXq6N33I76CC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752675715; c=relaxed/simple;
	bh=b5WU0cXHr7v+e7BT5Ibw9679ejdgncNvKBhfc/UOLmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fc7i4tGIgWHGxzFCv3oCPTm1+woZFZF8Qm4Nxc+M+KZmXtD+Al7xRBlI1Melhugv/9Ah+qqAPviaMJdeGFV237/yF7HEvkn8R9/CckfkfPqeC8V6aGj61lGpRS/gaBvAUbiBqo7L3/uVGMwEeWHk8SFUmstTwJ0bJH7ckyWNn7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C0weJCt3; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23dea2e01e4so76287565ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 07:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752675708; x=1753280508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRgANhiZNBnDfTk3Cs6H1fGZwr7ZYCqusPX7KWdZOuI=;
        b=C0weJCt38dB9cVd2YJeazsDLnFdjy5rfq45drAFRjOg3MuccYU9xxtnFmLjTSLKXKD
         NpO6ifW5adadc1cZOFNZQmCj0doY3XO+UBQe59vgfiQEmEQOHNjdvrTBNrZpXJgz1quq
         VaQxMAy/pAfochemRJZbFgBfov5OHJJ+wmjCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752675708; x=1753280508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRgANhiZNBnDfTk3Cs6H1fGZwr7ZYCqusPX7KWdZOuI=;
        b=jU3b3RhDbNJTNB0ssGtwsV8+bE0bq/XEXa+1iIpjMjVkINgjQ/3jPZc6QVno3Hxrei
         QHxdY6hyLmAceZqq0k36XTvu5E7fNF3yEeBigPL5YBxDVqrrUjDiLVQ1d4pWQY0FG6of
         OZRanoLbQvZt8tLqc1FqSpY3Nh5sPp37BS2PxLZ7hDEtRQ7GnmdtWSqufnqC8RspLUdv
         EkuA4O+qGuDbB5MHN2CIIexTFw8UFD+jFVmYgkQ6vLBZwSnn776w3KR9LvSu3dzQIa0Z
         E1BhJtrxJwUsGiYR+o1sJQCZVwJYiR5XxFs6aBuflWqOyrlFSygWurzZb58PNx6932fz
         xKtA==
X-Forwarded-Encrypted: i=1; AJvYcCU2w9mLJjOaczzydpadoOFG0O3m533YeVJBgsUAjyWkoEpxYnv+tKd/Tpk5VijG5HNqdD4VX62sAm+eQcQY@vger.kernel.org
X-Gm-Message-State: AOJu0YySpPtmpap5gnvs2nDcBiqRszebsdvLBsbPspMP5SUYnMGvOgDB
	AJFOuF4ULc/f/xjbRQh7JYnuEdkzZLnhL/asT+ob22H/lWjOh/OYmql9wiP8LQWHnjcONhE3+DA
	7nR8=
X-Gm-Gg: ASbGncuJ76AA0GHt3/TAPjRLxSHygFCSuR+LKNadY/9QUw/NY6bzFoyt89Di06qsAOU
	FpqGL2K9Bb7TP2teWQDfk+LWil39kK6ekMM3qeBMHN7fTu04KdUM+MYks+H+CiGZ/dlJMCjhEt9
	Sc2FeuIwEADh9dvcY/tTU96ZGcpaWySOwho3vcuEf4CR1SuaALdfJ9jmI2UdI0nI0IRPwwCVCgL
	zhMpTL7XDCIwR9rPJ4LpIUP0h7Am+zCDsy9n3L3/Jxj2nrj91I0h4ESI32udt9yykKwontqU3WN
	wrshDBUrW+ZsEHwtN/I52gIihFIny0519rpIGShZhs2bPXFMTXNQZNGHfrMcK/Wvm3K1jxK1wXh
	TVO2hb17AEG4QGgyf3rMIPgZTNfGyY4XGAAkQgOFgiGCo9WUZxsFLPHgstqcVfg==
X-Google-Smtp-Source: AGHT+IHfKJdRzi65wsrlbGG9fjokYDxAKl9eXbXsrgV6iCX9CLUNHWwmQ/EIGsFxNeUpOsLdtXY16g==
X-Received: by 2002:a17:903:228a:b0:235:e942:cb9c with SMTP id d9443c01a7336-23e2566aa35mr46783805ad.5.1752675708404;
        Wed, 16 Jul 2025 07:21:48 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42ad295sm126634165ad.81.2025.07.16.07.21.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 07:21:46 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3137c20213cso6375242a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 07:21:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUL3KcVmIi0GpuZQ43sB3SIy9MG3lgNu0uUDlBYxFzSysEVWJTGbu8jwRImaFP0RIZvsALrksyC8gwmu4jQ@vger.kernel.org
X-Received: by 2002:a17:90a:d2c8:b0:312:1c83:58f7 with SMTP id
 98e67ed59e1d1-31c9f2e1b97mr3914439a91.0.1752675705212; Wed, 16 Jul 2025
 07:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
 <20250716-topic-goodnight_cheza-v2-1-6fa8d3261813@oss.qualcomm.com>
In-Reply-To: <20250716-topic-goodnight_cheza-v2-1-6fa8d3261813@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Jul 2025 07:21:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wn4C-cs1y3obzxdtdYcSM44m=AJVnb+Pn3kaaos2ng5Q@mail.gmail.com>
X-Gm-Features: Ac12FXw3qS1FXk204atE8vfiTTzOmf0rWggWMgrUTIEYVKUJNOkL9pqvkeQi0pU
Message-ID: <CAD=FV=Wn4C-cs1y3obzxdtdYcSM44m=AJVnb+Pn3kaaos2ng5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: Remove sdm845-cheza boards
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robin.clark@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 16, 2025 at 3:16=E2=80=AFAM 'Konrad Dybcio' via
cros-qcom-dts-watchers <cros-qcom-dts-watchers@chromium.org> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Cheza was a prototype board, used mainly by the ChromeOS folks, whose
> former efforts on making linux-arm-msm better we greatly appreciate.
>
> There are close to zero known-working devices at this point in time
> (see the link below) and it was never productized.
>
> Remove it to ease maintenance burden.
>
> Link: https://lore.kernel.org/linux-arm-msm/5567e441-055d-443a-b117-ec16b=
53dc059@oss.qualcomm.com/
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile            |    3 -
>  arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts |  238 -----
>  arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts |  238 -----
>  arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts |  174 ----
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi   | 1330 --------------------=
------
>  5 files changed, 1983 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

