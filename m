Return-Path: <linux-arm-msm+bounces-14478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B4987FADB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 10:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E72CC282D9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 09:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AA965190;
	Tue, 19 Mar 2024 09:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ur5sHkaH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543FB7CF3E
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710841000; cv=none; b=lXwxqWb7DyBwM84LP1nPsxnVq7KtrCMqO9GKZ046bWyJOd0eVWtDAslbLcVL50DhEsi2wvoXbdxEE40clvl81IDYph1QsmOz3pnGqPxS3GHtBTxNJfR+/LPXFcPn/GZmf5qu0GsytPkBNt2+vsnqHlxtwcwuKCl3fcYX19y3xhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710841000; c=relaxed/simple;
	bh=V0KFxvnAtrXSOfjvHQg7knauss62x8U+7KogQn+yF7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvYN239t+MqaQ9oFX06472Bp9r3n4W00wcMrb3lA4vNRfVhMs4jiheX7CxVzXesgkXztGV2tA5QLXLkG5ydnOQ4KgZkFwzVpdvZX5y0lT56PuWgC4t3k6QPxoDrRaij51ZvdLE07P37t3M/QteyQQgTPxYrppFS5RoaD3llYIgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ur5sHkaH; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-609f24f447cso58867147b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 02:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710840997; x=1711445797; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q0tE4rTRpsmTL16kdGX+KFzRwJVG6ZUmpKExRxozggI=;
        b=ur5sHkaH1WBCooEn4kzGlfv0xfwUj1BPKByU96pD+V7cV8qLZbf9SqY0QcIRcB4pD3
         JygIk8+g0480VCiYNj6AF4Pf3B87qxYmjy8RDRfTfV6tEDpkZvr2WWr7KcI+q6ti0ZX/
         qvUjiFsTdy+FL9C0wJNNd5+lwg09/AlZFgZSb4oVdlB2rfCjhfN7S0T5m54c3G4F5vMG
         corZjYM0KyWV9MBkcxZlVURwDXu6VbNsyHS4d1/6KrLhBj2LQlJPLhaR/iD8FXkljMzz
         xR8jJmHA7VBLhyplUjzZ3KaLz6G1/H3oOm6WThqrrV7MjdZh2Y9OKPHEcr+gpV4RA4rv
         m+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710840997; x=1711445797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0tE4rTRpsmTL16kdGX+KFzRwJVG6ZUmpKExRxozggI=;
        b=WPCePxKgRq5nrH0LHDFkFR2yIOSBA8ORmN+mpE52TMriWm+QnmiJ8vW27ueKjuDlvo
         F4U4laO2WUBpYSMorT6u6Nvxxq6r1QLsq/BDMplU5UqJlNxax1RxdLuwM6EXncTwtYIS
         nzUYRc7DGJPZtnSiuvq6hSosdWjUP/FlSvC+4A1KydtClALxusjM5XEWVKgHeE1fhrOx
         Gl5omtrZMTjrEXj6ebM282IujOdN7s0ztiJ9oJhwYXI2YsKWdbm8dWEa+W+9DxXoJYQX
         6lcEVAV5g8wVjL1y9CpeIeQ3cUj3aaiKQZJr4QhakvXdafhEAGGBMQXypwCy/tfC/vxs
         /k5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXA6bvxm7t/19BOUsaZykaby7wNhajbjPdTyTjRHkyQZXUVndk4dqP0f7/m9PCsKE/nYyijZk/aV8d6vX6nqwvC4hKIL5/KHJaxKm3Imw==
X-Gm-Message-State: AOJu0YzAlmsF8RtZ0F3eQa0Tl2iYA7Pc0hj63pfn9+2Y2nAUFWrzlPbm
	lroLMltg/rXLJRNIxPCHvIFCMCOxWTEhs8LTr+bsmx9H8vt8Af5Wg+LtlrO1vieGkroCdgP9oo4
	ppBPkPZYH+zoLa+LeLmhXII85LXKLRtKmNM2Cqg==
X-Google-Smtp-Source: AGHT+IFuWQSJLHTIN+PSrx6VRbyj8bCDJjySSc07ahzVtGH46dRpslwe/Jo5mgbf3sHZSjSGNrfPeFwn5DSGSqdzqaY=
X-Received: by 2002:a0d:ef07:0:b0:610:968f:c8d2 with SMTP id
 y7-20020a0def07000000b00610968fc8d2mr8021450ywe.39.1710840997353; Tue, 19 Mar
 2024 02:36:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319090729.14674-1-quic_kbajaj@quicinc.com> <20240319090729.14674-5-quic_kbajaj@quicinc.com>
In-Reply-To: <20240319090729.14674-5-quic_kbajaj@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 11:36:26 +0200
Message-ID: <CAA8EJpqgFcBetRRFPQbG1WKHpxqO3tVQ-Yn0k7a+GVx=WN9AWQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] phy: qcpm-qmp-usb: Add support for QDU1000/QRU1000
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Amrit Anand <quic_amrianan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 11:09, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
>
> Add QDU1000/QRU1000 specific register layout and table configs.
>
> Co-developed-by: Amrit Anand <quic_amrianan@quicinc.com>
> Signed-off-by: Amrit Anand <quic_amrianan@quicinc.com>
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 49 +++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

