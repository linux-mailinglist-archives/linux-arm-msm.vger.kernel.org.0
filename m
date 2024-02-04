Return-Path: <linux-arm-msm+bounces-9749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AA1848F3C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Feb 2024 17:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D48DB21DF0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Feb 2024 16:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8CD22F08;
	Sun,  4 Feb 2024 16:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ERt8fLIp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9594922EEB
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Feb 2024 16:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707063934; cv=none; b=p5JlUk6vcHPlQqopkMKruMJxAC7rbxeBNcSfSqtz0eFJsFIYTFR0oHNCYpSw2aTGE38pJC2IvfDXN9Yb04u/75Ki8AWYNGqDIeTaeITbk+bFkBcDvC9/uv16p918/QEbJkJCSvL0eTsB6/vYFmteLPO0N06mhqOtWjq033jtczY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707063934; c=relaxed/simple;
	bh=Cak8oTO/A404VS+TCvIOe2zk0/RX2ID1i3+ycLZpmUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J55jT7lw3e3LKS37/HtBYZbOC0rxAVi3iihbCmNJatqNSqRW0PATmLgY/YH3krOfsw5i5tO6PeNHYI8cOPavZleSgtSo1Mv2kWSKhoMztZO5i3t/xT4Y72t0RQ6iNjcnJ4NYUGgHboA8drBoZPl37drf/0i8OzT7g01w7uOHn10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ERt8fLIp; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc6df28315fso3322648276.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Feb 2024 08:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707063931; x=1707668731; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tDgFyXQiTCVfR+Z+vTC+6dB9P+1VUIHJVTRXgZF6nms=;
        b=ERt8fLIpHT9grIP2abTNG7eWXCQ9Ciew4wofWDS512Pr+Qa9l9ky57BqI6pLgZ3Zuc
         P24j4Wj7hhpnhv1sZnMPZUwfhSL/OPh/nOCN6V/Y0+ozzd6Jyd6sL0WVflVB+nOvDCgU
         nq7j7aV0FhzGkOc2VSKFBg18jh6IV1lyrP1L+xmBV9jj85P1vDptWv7aOQryB3F7WjRV
         y3QeFzxp0vHtaLy5azB37xcNc09zdeqMblhpvL65m7J0KDoQeLeBerJHwdAN/+wX5RVn
         3ja5/1q1zIDdUyy4ScHKyjh6gxb4nec1po+3JenTkBdkA1Oo2dSX42jmu1lrrXG2YiPq
         LlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707063931; x=1707668731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDgFyXQiTCVfR+Z+vTC+6dB9P+1VUIHJVTRXgZF6nms=;
        b=i426tDyZmkQM3iRGXjGLberfXNCecJjX2YnRpZYgBfp5jqkrh3hbH3SWgbueTjP0Oh
         FEsqeBkTeRoUFt4l9rgaHWuo8ERFxMEQZu7cRO5DZFom3FC9hIGFfGbfVq7vS/o0aMpb
         XmKMn5oBE4iVnRRY2w81h1Ev6ATPqG1C6cLrESv3QiYvrtpXL1uCD9H3y9sdX4iZGL+E
         yVlGbf2GlbbHfQC+0m+1ei/QAwBowUZqMe1h/Hsx4S2W4uN6FH3oewM+EpjwQ6a+Im6H
         te1JfEEGTCvhDK0RkGVUcdvCah/Qz56bVhpWlL7baRSIED89jYjQlaY8hiDD2cbTOD5g
         VpsQ==
X-Gm-Message-State: AOJu0YzgMw6opcQ6XahU2B8Bndoz9faDjvOHQsP8/4Zp5zKU+GaZ7kHr
	v35BE7Rhge9KFP8V/UfbOwZYeDF9103nfcN/tKA1nGmkvMQnalNTHsTZLsHlIZAV8bk5iIBe4kg
	6hdyZGB71OwmzugBfMDAdzPguMUSH0Qfcg9xs+Q==
X-Google-Smtp-Source: AGHT+IECF7o2B+g+CzkQ5IhaJ3FdrB8va470/nqmyCBQ8xGw3mpQ4DVtoT8W9hL5NIjDWFu+zUgzBEDOEaTGljsj1Ew=
X-Received: by 2002:a25:ad5b:0:b0:dc3:7305:549f with SMTP id
 l27-20020a25ad5b000000b00dc37305549fmr5894882ybe.16.1707063931514; Sun, 04
 Feb 2024 08:25:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240119100621.11788-1-quic_tengfan@quicinc.com>
 <20240119100621.11788-2-quic_tengfan@quicinc.com> <7e7bc8ba-f349-47f5-b6ba-6594edccaaa8@linaro.org>
In-Reply-To: <7e7bc8ba-f349-47f5-b6ba-6594edccaaa8@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 4 Feb 2024 17:25:20 +0100
Message-ID: <CAA8EJpq8vvAeHuQYe2cp395m2K7VL46rrhALPySoFpYL5CXLbA@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: arm: qcom: Document QCM8550, QCS8550
 SoC and board
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Feb 2024 at 15:34, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 19/01/2024 11:06, Tengfei Fan wrote:
> > Document QCM8550, QCS8550 SoC and the AIM300 AIoT board bindings.
> > QCS8550 and QCM8550 processor combines powerful computing, extreme edge
> > AI processing, Wi-Fi 7, and robust video and graphics for a wide range
> > of use cases for the Internet of Things (IoT). QCS8550 is a QCS version
> > for QCM8550. Modem RF only in QCM8550 but not in QCS8550.
> > AIM300 Series is a highly optimized family of modules designed to
> > support AIoT applications. The module is mounted onto Qualcomm AIoT
> > carrier board to support verification, evaluation and development. It
> > integrates QCS8550 SoC, UFS and PMIC chip etc.
> > AIM stands for Artificial Intelligence Module. AIoT stands for AI IoT.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> I want to unreview it.

Well, you asked Tengei to drop this trailer in response to v3. But
surprisingly got ignored.

>
> Please fix your commit msg to drop marketing and instead describe the
> SoC. I don't see for example any explanation why there is qcm8550 and
> sm8550. Aren't they the same?
>
>
>
> Best regards,
> Krzysztof
>


-- 
With best wishes
Dmitry

