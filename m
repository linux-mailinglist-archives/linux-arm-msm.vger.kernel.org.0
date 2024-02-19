Return-Path: <linux-arm-msm+bounces-11708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E87E85A6A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 15:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDE1B280983
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 14:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A848337708;
	Mon, 19 Feb 2024 14:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lGk0kNmg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061F1376E1
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 14:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354656; cv=none; b=phO6/B4Lxrho4ETmkOw9lXsbf2wIAyPlBjJccCm6ar9JEo7e/3Mt73r44gZixhbv/Ha9ixdGRh8lMr4OvJcB1B8m4H+i+Kxz15uUFvbVWga9UPjU/s7yks0S13BnwAvy8tFtsMEFb4spLtwlX/AuQ2fJcKCcoDSbYRMLV+OD3HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354656; c=relaxed/simple;
	bh=9Na3wL8jpMpPVnEcaEj/4baqNdNNRN6TgavHTXFRdNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FK5O8QFln5zy5RABPvPozknI4i188WkEPWxbw++psZkq45sOdUarxoexeoD0iZVdtbuqQETvPyzPSoUpvmrxMDHQIfEjru7e8pg/5yQnAHKAlW8XtRjLrTkmx4WIOPmPxFejojyjsB645vd7D48nY0rasYyeM/XJskEvljXZLFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lGk0kNmg; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-607dec82853so38364207b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 06:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708354654; x=1708959454; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Szw+QTMnTAcQAZlNeYyyrJj6KbWZ+5DPKy/5tGrWbDo=;
        b=lGk0kNmg/HCwE8qj0FfX0zUNkQtmcJPtsHPfHE3hP1j8GVWuHsHZrY5nYfxr4/WfUv
         niH4xUAwp/aiGKd8ECXeBkF73xsEThstkzGwYcwPCxvNK/c5MgVMvl3I6stqGGZk4hir
         mZxvPMIhLLO+evQRa94UGcqjMsUBiz4jFAcg9Lyr36hDA2R0kplRxAe1BdRjVkTDmH1Z
         cEkeyinC1Qeuz0Wr3cs3Hy40A77LOSx1HjzdueBI+CotM1iHZ0PLcXSul8QE6PTR7iqt
         NZE0VRkum6DsDef6Q6JpSn9fiN7Q7svPZw7ZjAf1QhzuMhCRRpWI82NVDDx5GVmOs9sA
         jUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708354654; x=1708959454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Szw+QTMnTAcQAZlNeYyyrJj6KbWZ+5DPKy/5tGrWbDo=;
        b=YkOiazmy13btjL/glhOhWEGGXz67U1XiBTy52Xp54nd+g5fPMrH/diAOkyWLtLEZjd
         411fdUJbJRnwdxXl9GcfGCHmW9Zuv9HfWh5OxcEkPSd10yf60vzpAYNsLG73GD5C+4b1
         0V2HdMrB6eTUKBpUiJXt8kb9lRk6XzOlkFwKmTpodFuYu/C2ufxKVd0a/9ltoIP/wlg+
         CHC98FcbZuLurQ5MuD9QU+WxI3HOaJ4uzzjkO4ah4NOWSMy6pgtHiquWM7bHmKNUgJmi
         JK73rO3IjPhrPjCkme60t54AGHvVYgqzCke892m49wVywrJw2OQWlUEWSXipqpw+2hlY
         fUeA==
X-Forwarded-Encrypted: i=1; AJvYcCUvuqSnldH8MUxMqzM0HO7/pEfig3LdaFQEZMk9T8d3buu6kX9YOT0XNd4bJd6fZAUrsSV7r2hfplyM50ew512cYBRRNFd3TlNWw3bQGA==
X-Gm-Message-State: AOJu0Yw1k5z+jc9r27TbBmqzqj5B62evBx3f+YLxaLMNMhT7JEx8qePn
	Vxmtjk34SAw04vHUQuT5KBo65UU7SorahSF08C2IO+BB2Lm8BX2RI1C3eIndjkSawMo9bwTqET9
	ojw9c+5G5JfgttzmuRh9bSGsX9v8mzC8J9kIXhA==
X-Google-Smtp-Source: AGHT+IFwS+iE/0NQYgsx7qVKwDMppWGjVew2/XzNi/ojh9QbxDe0oOmgCSu0UPBrXtjFjsGyUMyo5ZWdgudhKw5Ujrs=
X-Received: by 2002:a81:490e:0:b0:608:ba5:729d with SMTP id
 w14-20020a81490e000000b006080ba5729dmr6119664ywa.19.1708354653839; Mon, 19
 Feb 2024 06:57:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org> <20240219-topic-rb1_gpu-v1-7-d260fa854707@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-7-d260fa854707@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 16:57:23 +0200
Message-ID: <CAA8EJprpZxCV-3xkE0OuGg4jHrHcb=EPKCi_wSy5viP7jVwPvg@mail.gmail.com>
Subject: Re: [PATCH 7/8] arm64: dts: qcom: qcm2290: Add GPU nodes
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Feb 2024 at 15:36, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Describe the GPU hardware on the QCM2290.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 154 ++++++++++++++++++++++++++++++++++
>  1 file changed, 154 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

