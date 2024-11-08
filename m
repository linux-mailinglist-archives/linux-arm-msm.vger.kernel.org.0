Return-Path: <linux-arm-msm+bounces-37333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A509C177F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 09:08:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DB882837F6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 08:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7361D9A47;
	Fri,  8 Nov 2024 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Unj7k1IP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15541DA31F
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 08:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731053315; cv=none; b=a40kV7kh1qwwAKYD7hPj79NPXtNM5io7U3GrBxgsmtyLryhnKf35PbA4J0VcnjJPThdKfCNulID5c6VcZKtpMqJMLy4x0lrtkxq1nDZy05lueTsiwZq/QyNxnIS6EB/iEiSX+v1sW1VljVN58qPjCMnOrmKYkDLoCK0NGIVBGvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731053315; c=relaxed/simple;
	bh=X564kijAujdsjjH0ORI4+g4gIz95ERPYBq8cJzyP8DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UeW+mdifw/HbTPwIxDO0tDHk4FsxVuF8nHMxbC3lxodh+JVjfTLdj6qY/LnrE6XuhjubFk3aaWPOwFJWApjhLCzQ5ud7y2MG+0Yttu2mIavsbA1YgAJgZ9wVJG0YAO0Am28pOB5UB0/RzfzgX7Uk+F7uHQ1uHKGJcP8RpTaZ0do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Unj7k1IP; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so28278121fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2024 00:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731053311; x=1731658111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X564kijAujdsjjH0ORI4+g4gIz95ERPYBq8cJzyP8DY=;
        b=Unj7k1IPA8USxudDC3cRW4Xobxipgr54vxfkjmjCO/kd7Z+TP2IW/K9qVD7kvMtchG
         OKkloX6r1lS3mir5QonKdt2j0VwHqIikULg/3MzQph6VVeKBf0+Bvfb+VbEJ1SgZXluL
         oE0mX2G+3fneKYH9aV9wLXSvdJ6JyPWDl2dj/JRudMOdszWXa1ol0m0+88LC/CsytsYg
         A+a+kzWWGdIvKPtnMxi0P9SD8cUfbEavaPzYrERlLaKduEKicJz0nOtpQNM7EfYKH8Sd
         3RAj0chKavOpve/jj8//3Hl89UYgmI4yyzs4HIGuCKHZDyH3QyFqMQzfoB4+DFGyiBUb
         jeeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731053311; x=1731658111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X564kijAujdsjjH0ORI4+g4gIz95ERPYBq8cJzyP8DY=;
        b=M7yzQ0fMxBCJE4ZaQiPHegr5JV55OzMt0r5b3BUI6sG4GxxklZYOpK1C3mIHG+9JFE
         8dHZlxohWbGWgZv+xBYGZuAJgOAW83cIqJYfZ+5GT5tn79KU5KdOpbATuRDIbieaKgve
         C2AnLgs0ykbTn9SUfXj4vtVo3qI+G9h+VQVBqUNcwf2yNQbsAN3vjl8Ce7ujqC01VqxA
         5SPAwc90+aOCjzkBDevV0J209T/EKkKb73S7XucFEWD3+neybTUo4KyZmj3NN3CKoZr1
         Z+Hmwh6drBuntQUonDMmFJJoo19+bLYB2rTYw/YDivP2HsA80wVhqc3Zik+tIbjnUPu0
         Yifw==
X-Forwarded-Encrypted: i=1; AJvYcCXr40m0WbLdG25pXa61XUI1iZ042tPgn22dU24tph/8rljvsfYMJXksy10cx3v7/y267KhlYSuokizy/WVb@vger.kernel.org
X-Gm-Message-State: AOJu0YyflTi7wFxIaKlhmJKW/0OB1mOyIQDG65DswH0VoiaUpjsiuAc3
	B1w9bxe40hSngFgJeZVtuUAYEQPVli2gJm9aOZYDi0XGHLXP1HcZ6LCqhLgB5AzXBWpzLCtSMyp
	69crx31Ddts5Z4m0fPlrPPYwDhIGSRfbBjrA+9g==
X-Google-Smtp-Source: AGHT+IHDMtC5ejvi+6P/FwbMQP1yLzs4dvzuAfHzOLWut4QZAFsV0vqXGWBvtrbNy55PKvK+RsMl0V/8jbQgCQMUUQM=
X-Received: by 2002:a2e:be22:0:b0:2f7:6062:a0a9 with SMTP id
 38308e7fff4ca-2ff20963c8dmr4983211fa.7.1731053310923; Fri, 08 Nov 2024
 00:08:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031-msm8917-v2-0-8a075faa89b1@mainlining.org> <20241031-msm8917-v2-3-8a075faa89b1@mainlining.org>
In-Reply-To: <20241031-msm8917-v2-3-8a075faa89b1@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:08:20 +0100
Message-ID: <CACRpkdaWEc8=5CdBMuGdfcSzneR+ODrVvyw8pOFv-6++_JUzqQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] dt-bindings: pinctrl: qcom,pmic-mpp: Document
 PM8937 compatible
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 2:19=E2=80=AFAM Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> wrote:

> Document the Device Tree binding for PM8937 MPPs.
>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
.org>

Patch applied for v6.13.

Yours,
Linus Walleij

