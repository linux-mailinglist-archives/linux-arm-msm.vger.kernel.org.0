Return-Path: <linux-arm-msm+bounces-16048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A63E5895021
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 12:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 426341F258DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 10:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C1F4C602;
	Tue,  2 Apr 2024 10:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GI7y1VqX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2BBDF6C
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 10:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712054038; cv=none; b=IOfrUH0E5uBuKXsb1QWe7LKSGgjFD00o+vf+7LuofK8Tvf8TNGWDFexdfn8ijURmX6xDWvtBEcq3JYU+8YyKlMTwW0ylo5fBIE80vOajBbCPi/FoyvTtEFxqqTTsAu3eRBRLdKS3400WJfsOu53pWF88rNTYVSx9Vdjhzyrwmfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712054038; c=relaxed/simple;
	bh=qu9ShLrPQMIkNvbhjhLBUtPyucHuzPdWe9LUMWcl8vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s23tkW+/VxRpKxZ7M2WhZ+/Qy4xU07PdVK1MDWIY1arnipOzVzUaGTpYmc0ShVhAoqzDU9CrdxeIjDIXrW6OL0WeiT0MV9iVmINvRU3SHaUJ8ZMdVz5dqyf+W9LcRM1wV1PbmYSM50rOlZpy87OA9krztBxYd1gY3uvNkzNUUsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GI7y1VqX; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6150c1fa3daso11903567b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712054035; x=1712658835; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MWwVzYWrWmvvKy3bQx9GVyakGKirqAQ+7eqOMn8Hdd4=;
        b=GI7y1VqXg4mxS1WS9UbTNigScyb9HKWlCrAZoIFEwQgJDrZOzTmw72WIqVNLr8hgVF
         WrWLNB8I6F5Voy4HEY4a0yJhxASfX+b8NfoTHWq/Icj/+6+P6KUcn9yIEnJc1DhX42kx
         SollTLK4n2WItiwpzZxzmxdaSKkdKVdgVtE3syjrl40VjGNV9lnjjTX0bVTd+d06QSQC
         x8IKzjyeiBLADYaUXLFJExFm36MzwvcB6V3yeYgPi8ucSMcf2DYDFZRrrHU2MEu9MuoA
         S1Y668159TQgu5xpF2TwCfKntztLIyLDqVpvYDTu/kOizjr19I1KX8QwDj7f7NyfiLo8
         1E7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712054035; x=1712658835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWwVzYWrWmvvKy3bQx9GVyakGKirqAQ+7eqOMn8Hdd4=;
        b=tuyf9wY4gqxhQkXTihllYdQTFh2/gUXZKLefvI9/zo7+9xn2yyPpfQAQMorjJxIyrM
         UZoONg3umcqKLnfOEjbn4ISt1Is88gh3Nqc5jSOt3gJBeCHLNWlHWgfTQhl6KvILxTCE
         bp972Y3lS/J7al76U3BqH/20Cf0Bqf/EZIjwa1ibwze3rjflRHAhtLhDfmUwbEolN1mp
         kXv5BWfHIzU2CODbhZhRBbBSBY9u/QjXRRAAsAAHG43Pe5URv/pfS8BSQy/x/mWFE+0C
         S7JxgPjVzN4ftchjb64uQw1COjQNQ1QOSwGfLGzh5xmGB7xDg1RFPaYOzf6wVH0Bh8gq
         0Cmg==
X-Forwarded-Encrypted: i=1; AJvYcCW9Df2VH13rP3h53bM/QjP5tEaMFEsc2XVluUx++kO8esnaVhs29LhRWpQsqbs7g1wAedoSFgkwrJoZvTvMlIkLUwzyZMpsSeLyyKryBA==
X-Gm-Message-State: AOJu0YwVtIShPpTIqU9Yq3d1EGw3fAjM/gEGarhVHJH9yE8e81bVEQsv
	gw/em9ja7fKO2m+efPRVcXnuHKrrTWbGUSewXM6SC1E1lafC5cQJMBMh+vvooMmbNRtfpw96Y6R
	tdjfcXeATwThMWAYSCnFVUzYpBPv+tcx7IcFqEg==
X-Google-Smtp-Source: AGHT+IGdA7+Mw3wgNp+BztbolUTPAWjuEexFLMEyJS8XuGlLJbUGAceuF7Y90mTButztt/iNjInqR50NU+ZERpjg38U=
X-Received: by 2002:a25:870e:0:b0:dc7:3165:2db1 with SMTP id
 a14-20020a25870e000000b00dc731652db1mr9075771ybl.49.1712054035607; Tue, 02
 Apr 2024 03:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401-typec-fix-sm8250-v3-0-604dce3ad103@linaro.org>
 <20240401-typec-fix-sm8250-v3-3-604dce3ad103@linaro.org> <7088e678-dd0a-4a5d-bef3-e0816a38ce60@linaro.org>
In-Reply-To: <7088e678-dd0a-4a5d-bef3-e0816a38ce60@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Apr 2024 13:33:44 +0300
Message-ID: <CAA8EJpqdevzsN12m-EnxdFbCa5WgiSDMDhtjyf80th1NZwoD6Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] arm64: dts: qcom: sm8250: describe HS signals properly
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Luca Weiss <luca.weiss@fairphone.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 12:42, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 01/04/2024 21:33, Dmitry Baryshkov wrote:
> > Instead
> > there is a HighSpeed signal lane between DWC3 controller and the USB-C
> > connector.
>
> I still don't think this is an accurate statement. The upstream names
> and labels should be followed for consistency but role-switching and the
> DP/DN lines on the type-c port are not related.

I fully agree with you. And that's why I'm replacing the labels. If
you open the bindings for usb-c-connector and for the snps,dwc3 host,
you will see that both bindings describe HS/SS ports. DWC3 also
describes a single port for usb-data-role switching, which can be used
instead of HS/SS ports, but usb-c-connector doesn't have this option.


-- 
With best wishes
Dmitry

