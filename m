Return-Path: <linux-arm-msm+bounces-6332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E5582263D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 02:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D7D92838B3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 01:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE13EC6;
	Wed,  3 Jan 2024 01:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i/MmXEEi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04B77F1
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jan 2024 01:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dbd721384c0so8151978276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 17:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704243917; x=1704848717; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BEv2QH2KVuhMvrgDbnXCkdJ6xCgxsRbNGj7tKI03iH8=;
        b=i/MmXEEi7nfizMDCVy7sDjmffcvV2RWN9WtLucIfHKejPN8m51xk9jlXALiC3Z9ajB
         OvhfYkiMydKB9TOAJ7jCyDrDG6hbY0Qv6+UjKh7hoOExxD6BG6RGiQs0iP4yFVaefc6v
         E3s9M8Qb82cwrXyHbkCk5T/WgtmljO/A/GVG47DaeIrush7EX9iZvDSuESDbhEUwfhpV
         WpdPFzelOfm1Fr8Ac5K3NzfmCCsSWZxA17XZFkL4R/GDeKaQzBll0Up6LbFb1KXsdRHB
         L/zfbNqyBwRjCabBx+v2ZBTKh4vRKNAZ0A5pLJzPCPnzcPhtYGkqzuRvQY9sjlY10AA8
         h7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704243917; x=1704848717;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEv2QH2KVuhMvrgDbnXCkdJ6xCgxsRbNGj7tKI03iH8=;
        b=qF88ArAQONL1kvbuypOWNQugv/Pryn2US2FtUfDzPX4kNREnD8MY0/BP1bOVhSl/3C
         DUQoE0o5aRYWJYzvAVRlkfh33N/659OYLbIs1tGDEqfITEPx+WmPr8ELNKkJb4G+r9yB
         FuoeUBMnfiEQc8LxVBH+7JJSdM9iUazzG4KD6NVViWVZyvqPeKtYE+r4S/F4xgI/jUAp
         O+O2BJebOGT+kSetD6ywFLH5Ne5PGVIzIrfQQiOBv0lCe7yBy9ft1sDk0sNI0aOyYiHx
         hr9iE9O/fJctcSEM4M7vxbdPVubMCt4GF28XgjvxTiCMAbqI14IHT6tKZzZ3OCLqKY7I
         eP9Q==
X-Gm-Message-State: AOJu0YxfoZMq7RI633vl+SthGm2YBdHGVq4P0EfzeulHRCnlARl187/m
	QQRNWfAZsDUcxRS2TcYqFDy5ACocckxrZP0+Le6SDm3zwVUJjw==
X-Google-Smtp-Source: AGHT+IHfkGuIwtNQdPPbHwaBn3UvsDJtz50KxjJEvZmXZmlrxXCdB2Jrb4/dpfOReh+HkIctIvcVhr+sNbJNn9wmkV8=
X-Received: by 2002:a25:f626:0:b0:db9:34c9:87c9 with SMTP id
 t38-20020a25f626000000b00db934c987c9mr7971145ybd.101.1704243917647; Tue, 02
 Jan 2024 17:05:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-topic-gpu_cooling-v1-0-fda30c57e353@linaro.org> <20240102-topic-gpu_cooling-v1-2-fda30c57e353@linaro.org>
In-Reply-To: <20240102-topic-gpu_cooling-v1-2-fda30c57e353@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Jan 2024 03:05:06 +0200
Message-ID: <CAA8EJprL+iNhvVTg9cX6a5YwM=SFENNQKNeA5A+mJdLamdgEbA@mail.gmail.com>
Subject: Re: [PATCH 02/12] arm64: dts: qcom: msm8939: Hook up GPU cooling device
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jan 2024 at 15:35, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> In order to allow for throttling the GPU, hook up the cooling device
> to the respective thermal zones.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8939.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

