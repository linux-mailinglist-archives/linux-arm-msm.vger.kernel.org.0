Return-Path: <linux-arm-msm+bounces-28795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D729548BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 14:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93DB41C23273
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 12:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA95019A281;
	Fri, 16 Aug 2024 12:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="g1ydmzpZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C152E859
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 12:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811414; cv=none; b=aIYqJ86dmRtuEu1LgjtSx5eJLukiKi55dpZJsH1ls9o+Fe9KDy8G1+KygOqv6fKTKBqq+7Dn7shNZcdQjUHaS/0AxSaPRaUB3gturIa3vd6QbiOEClcAiwuk2ZI9ZaDs+TVlIgivyG4FOwQ9F3EtbxIFeF+8MBUxLMV1fQPZypA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811414; c=relaxed/simple;
	bh=KEWMVxcu/NLQtr33F3tQHy3IBtqOb4ps9ENmIRZm+W0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rMatmJzmAdAueQh9rjtO1hMfT2rcfspUYD9gsPgPxIOvPGxUeT/ysDtXUFr31iCyHqYVe7CrJZVA6sJT/48P/T0fhQpBv4d3snyfv6zxdX+mkXqzKz3ceF8ShfewLliOCT1JIq+nocQk0QJF24JLuRTk+Tff3BjE/nEugo6Oqok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=g1ydmzpZ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52fc4388a64so2532385e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 05:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723811409; x=1724416209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w96eQaH+JFVwUc2NHdKcq4o8sWhYVnxpQd6m10yEznM=;
        b=g1ydmzpZlyIoAsEzBXBw3+psyCyndmGoztl8ZXN7uGBj7hwOEUkoFeBXh+bBeIR/TT
         Nk37KNPO1JhHyJgfr22aAMtI8Gjf692Pua98WGbchNLopYyAX+upK1RV/20nyH+wdGfJ
         ICzRciSIqNlIXtHtpGP4IFnXFu2mzNxZlxG391grEfPsu35kgnCWz/sD98zfVVsxilPU
         TidTK+bVnngIVG/JUUN9mijqm6NaNmRpo4CU3Ir4QpIoVmHalU2gfmrYXGs9agpW1sGd
         OCAYf/TkhTAZN7vBMLIWrRhd98pDYFKbQ/25qSE5Hh2zNphmf32Q3N7k7uO+0xq4JXq9
         mFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811409; x=1724416209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w96eQaH+JFVwUc2NHdKcq4o8sWhYVnxpQd6m10yEznM=;
        b=OaS+/62pknanmnv21WU1urWn9CJDFdfrp4KHc3bkU92j7wPt6G7bBLGePPKaVxJGAJ
         3XWVn4+aWhbpbBePrGD7ucnfuZ0YQY5hSTKiYAyh0YVLr9CLE3nQtC/thq1vvtbqHUhS
         ILdiIY0mXmz1UwBtdnFKU4eu9Pf7wCEtOiEJoVXK7pgKb5boGlGTDHhhnXcunkVCw+Fi
         X3R8PT+1djPB6GfrJ9GMEG7w2QL1ENm2y+e3pWbyiIIDh3B8bCscce5sEvaLihwlAVeT
         2xRb8cXaMRY+FPjifD2NM6ADIhNww3XuNyjXxzTmhJcS3iT9LOi/9YmUW094XVhZq02y
         xJxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhaiNry92Ps/uXxnftBntp7oj+MhEPNWwnKHxcaMrwG8SduNejclsj3HNyL96svcXMwggcOz6ERsaoCfBkfqU9lNps0y0Gba18BxO9qg==
X-Gm-Message-State: AOJu0YwbRwnoyT9TzoWSV5caIW0gHh+12m7W9CNdK0yf+kc3mCVhIp5N
	nQdfq2T7FeWBWAXNU8ZIZiMBfwQ3EHi7nFicR/4rlEHUQlYArw4tJx4yuLAivALWlg/8iAx/72s
	OVBFfwlEPGQ0mXy7twA3cXbHl/QQVc9/W7jddnQ==
X-Google-Smtp-Source: AGHT+IFZaK4vjw4Aem+81rYMCtAGdtY0O6D4wq9Y8v3rCLdzZcg4Vb5soplVtVkp/6l3JtM6+jGW1KtRA1lR1iP6gzQ=
X-Received: by 2002:a05:6512:3dab:b0:52c:c5c4:43d4 with SMTP id
 2adb3069b0e04-5331c6f0065mr1560017e87.53.1723811408941; Fri, 16 Aug 2024
 05:30:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240816102345.16481-1-brgl@bgdev.pl> <c0af2eec-c289-4147-aca2-aac438451f5e@kernel.org>
In-Reply-To: <c0af2eec-c289-4147-aca2-aac438451f5e@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 16 Aug 2024 14:29:56 +0200
Message-ID: <CAMRc=MdmgcRUfYGo25spPOKqjpebiaZUP34B7PuuoAxMAupAYA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: misc: qcom,fastrpc: document new domain ID
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Tengfei Fan <quic_tengfan@quicinc.com>, Ling Xu <quic_lxu5@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 1:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 16/08/2024 12:23, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add "cdsp1" as the new supported label for the CDSP1 fastrpc domain.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b=
/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> > index c27a8f33d8d7..2a5b18982804 100644
> > --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> > +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> > @@ -26,6 +26,7 @@ properties:
> >        - mdsp
> >        - sdsp
> >        - cdsp
> > +      - cdsp1
>
> Are there more than one cdsp domains? Why adding suffixes? Driver source
> code does not have "cdsp1" domain, so this is confusing.
>
> Best regards,
> Krzysztof
>

It does, Srini picked up this patch earlier today. I'm not an expert
in fast RPC but it looks like the domain ID number matters here.

Bart

[1] https://lore.kernel.org/all/20240805-topic-sa8775p-iot-remoteproc-v4-4-=
86affdc72c04@linaro.org/

