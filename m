Return-Path: <linux-arm-msm+bounces-6339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB79822655
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 02:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64C72284A41
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 01:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053AA171D4;
	Wed,  3 Jan 2024 01:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bAVBo8bt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876B5171B4
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jan 2024 01:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5e74b4d5445so78162907b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 17:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704244066; x=1704848866; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=35dNUpEGdR0voSwa/oaqyC6xwJnRqPPHt0JIWQIJZ8k=;
        b=bAVBo8btJ+78amdZAdfKMyAkzL2z3S20K/kKgo5PCDg0z0M8pTZEt4BJV3LxXz/tEM
         P20MkQaixnotTxx+cH9PCDKrgA+faWoXpS50qawJmEEXnPXgbLoujVqfnAHXIMoLXLcw
         MzAslgTNLLeF5Zx1ErwO+SDjzuY6K/7TDDURLFl6BcCHAJMZns/ZyW/3bD2SoJBMPqYa
         M+I255QDkNsNuDz2X8ooSKfzefFfFU0zCcikxhbjHXnDn0v9Z9iKjL5kdqRsJHdlyyrC
         MQPCt/kk5Zb9CcNLEBDzOFDJOqHQOLqgrF6XGF+a6g/lJLZN9T76XC4Ujw3DhHEzQUyV
         IymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704244066; x=1704848866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35dNUpEGdR0voSwa/oaqyC6xwJnRqPPHt0JIWQIJZ8k=;
        b=u/w3FsnVGzueZGnQFL/hnnc8jAD3Q9pgHCoa08f0kvYP0ScAaVQvraoUShG94TINqc
         m63GlQt2+cTPxeuBf64dxqOWqoX4ZEp1ZikXQRGIP25kGwklOHsHxalZ/h3XqBhgKF6U
         wg4JPIqTCHrPx0D5LfeBOxpQPD3bpS4Gm9mZ64xEUYDmVHPj2H9M+tID6L1xQ14HQvYD
         i9StKSMK37XQwStpbVq4Hpxwt/BXspTrfaTGwLLuNsvuTRV4UqYdHOYxGyjvqNzD415C
         xSpWoVS2G0jY4+B6j60/wSt8UTiwaKeyQFKF1hbm69yAcIvYbYnm4Ga1kvaTX2PAGe6J
         3XSA==
X-Gm-Message-State: AOJu0Yy3vcgXwS/h4IQ7+8KPMVUUBVOPGBMsw7gK7mBTKvIoQrJV89Ob
	JiwwDo1ngLTkUsxES1nnK8DfgWq410V0GmG7NX9FmqKnrDtKrw==
X-Google-Smtp-Source: AGHT+IGZegfu6lorsuid+Vmcqw49DDaXeSQatFEr1HuphlfHrKEjWjgjYPuQDtXrth2b2eVEauQ2/BU4th6XV1l9R7Q=
X-Received: by 2002:a0d:d945:0:b0:5e7:6f9c:b194 with SMTP id
 b66-20020a0dd945000000b005e76f9cb194mr11759932ywe.15.1704244066648; Tue, 02
 Jan 2024 17:07:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-topic-gpu_cooling-v1-0-fda30c57e353@linaro.org> <20240102-topic-gpu_cooling-v1-9-fda30c57e353@linaro.org>
In-Reply-To: <20240102-topic-gpu_cooling-v1-9-fda30c57e353@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Jan 2024 03:07:35 +0200
Message-ID: <CAA8EJpqyhckdohmAy-2ptYUKF0JJAm-pYdAtbvT8k6LkRw6Prg@mail.gmail.com>
Subject: Re: [PATCH 09/12] arm64: dts: qcom: sm8350: Hook up GPU cooling device
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jan 2024 at 15:37, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> In order to allow for throttling the GPU, hook up the cooling device
> to the respective thermal zones. Also, update the trip point label
> to be more telling, while at it.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

