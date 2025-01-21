Return-Path: <linux-arm-msm+bounces-45674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C070FA17BFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 11:37:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0973F3A2497
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 10:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5B51BD018;
	Tue, 21 Jan 2025 10:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hSUvFLEh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EC01F2385
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 10:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455801; cv=none; b=g4cNTpB928OoEhGSPd0CYf7124VKKPD8U0IZOaaQ0QAxOMJ69JQhi4fUrFmwA3C2LSJsrDqKPPkDS7Ot301Js+a04crSnjBUeaaFUWnJFjZrVoDNCSRbY1ft2GJerZcXaDGrG8qeK5L8EZuRC3BFQjB+IH7y5Xw5mOqfBL0dVEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455801; c=relaxed/simple;
	bh=WJs1a7YvghNKMt//gsZ5tp+QXMnKHykuOV3SsJyGLKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oDIxxoqiGEWBBX5+9nhTo3alLQS7CuRLwGRAes5Q9yUIn/7LNQhtQzy9Dm0O9AnWaJNQCUD0Rg40UBWpV0fPXXUBfkewmMpnnX+4zWX7fic3c8adv3Oq38A1Tv7MdrjyYpyvoGoM6jBz3yLlA+ptXv8B73KGnBptB62tdZRddTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hSUvFLEh; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e53c9035003so8418010276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 02:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737455798; x=1738060598; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uYsSfRqNJj8o50shO4MnohJQTF0XWyzFd4qo9Nzg2zA=;
        b=hSUvFLEhbkVi+y7iI3MGWT/LczKJEd+gSDWBPwcsP+KnokQFyGS4r4KrLMgP/a837X
         RwRvXWcpYiguOp61eDQ175x/hnxn8rzUL+AVDPeQAfCO9s+6j96YKxLIUsl0QilNrbBk
         uEjE2J8DDTqRiNo1oxJ2jNYOjH3pT9tAR9x0ECV9Zx1uhdYWyvcijuH7Vf3pUeaby3OC
         CTbQt/4aZyGsgPDcJOlEll58ia5+megqIRXseD1mBoU68h+IiyITbF+gIxxHkw6hbepn
         R7DCCueUm7sMAh9oLCJNcB/BYIYHffMEE9SW0vpmaHUPY/cK3Ac0SAh1mXrUkbdnRWzq
         rB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737455798; x=1738060598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYsSfRqNJj8o50shO4MnohJQTF0XWyzFd4qo9Nzg2zA=;
        b=qg4kb9TsPn4kgXt1DOb3xBwhrkDY7Ns7CTQbjozUkzhZ41uqiTO5EP8FDggKAG+unP
         z2tzNyUPKEmJKuo+A0DkOBaNCwGsboMqbaDGk8pBQmEUrOsp3U5jouce/4pldiWcKU9w
         DVPJd0EcPD4/qYsLhmNHS/T3suYiWFdffGjJJOxa5ro/Ufio3Ces56xOrmFJQNSjhmiQ
         cWJkbJb1WqGWqPFS/IrnCkefz4HEjgBCB2Qv/1V2v4+kogzLVw3A5c5/BQKhR21ufaJC
         NySRdpHJWBEGzU+Nos6ChAabXxa4mx2XyCknDavcii0yqtDECfps18dIz+iR5j1MVFo2
         KedQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBQwyevGkxVx8FBXn1ayfNix1fJuXRFFxn+BNbfqK8r9eaGBloxpkPei0OSQXmQWoqj8NTJQZCIQTqDYas@vger.kernel.org
X-Gm-Message-State: AOJu0YzWlF+2LUVhzZeeQp4oX6tlcAKRCq4Twob2mtrpConF/57peShh
	f4mHlH9xNZ1YeCMu0zDDMIh5oIlFesgqpZPZ/pg4CmpEUbDL+KWPQFnI8+tJ/Fqa+9f45pkhKyd
	Hpgbi5u1RtUm39F2ENlds4zxMaQbWO5wktir18Q==
X-Gm-Gg: ASbGncs7+mUSLCY0KbxY9KCURlEB2vo8g+aMAWdt/nG8ZkzeUwSr5JwggizcGF/EWbf
	Tf3I07cHzXW+W18hCQLWxYt8s/W9iLAOThXw/BVSiG/Lok4z198rShjdwlDKLu9bz5w==
X-Google-Smtp-Source: AGHT+IGgc5DuaN4EVnKxaaNEieV/Lsus7ZftrBH6yEeXwAV7YxRfKF3ABKJD1IwgaQXrf81aL3myamAyLAsDHtu6Hno=
X-Received: by 2002:a05:690c:6b0a:b0:6ea:7b00:4aa5 with SMTP id
 00721157ae682-6f6eb93266dmr122701137b3.33.1737455798645; Tue, 21 Jan 2025
 02:36:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121094140.4006801-1-quic_wenbyao@quicinc.com> <20250121094140.4006801-3-quic_wenbyao@quicinc.com>
In-Reply-To: <20250121094140.4006801-3-quic_wenbyao@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Jan 2025 12:36:27 +0200
X-Gm-Features: AbW1kvaQ-0WRKtcJxgbDZ6H35o106sf53x8vunv0kmHF65XxhI3rh4OAJPGvtrk
Message-ID: <CAA8EJppXQpDrdXzJsTE7HWs=POt7yFAw0JVZFabN6Ks3fhZiWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add PHY register retention support
To: Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de, 
	abel.vesa@linaro.org, quic_qianyu@quicinc.com, neil.armstrong@linaro.org, 
	manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com, 
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Jan 2025 at 11:43, Wenbin Yao <quic_wenbyao@quicinc.com> wrote:
>
> From: Qiang Yu <quic_qianyu@quicinc.com>
>
> Currently, BCR reset and PHY register setting are mandatory for every port
> before link training. However, some QCOM PCIe PHYs support no_csr reset.
> Different than BCR reset that is used to reset entire PHY including
> hardware and register, once no_csr reset is toggled, only PHY hardware will
> be reset but PHY registers will be retained,

I'm sorry, I can't parse this.

> which means PHY setting can
> be skipped during PHY init if PCIe link was enabled in booltloader and only
> no_csr is toggled after that.
>
> Hence, determine whether the PHY has been enabled in bootloader by
> verifying QPHY_START_CTRL register. If it is programmed and no_csr reset is
> present, skip BCR reset and PHY register setting, so that PCIe link can be
> established with no_csr reset only.

This doesn't tell us why we want to do so. The general rule is not to
depend on the bootloaders at all. The reason is pretty simple: it is
hard to update bootloaders, while it is relatively easy to update the
kernel. If the hardware team issues any kind of changes to the
programming tables, the kernel will get them earlier than the
bootloader.

>
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 91 +++++++++++++++---------
>  1 file changed, 58 insertions(+), 33 deletions(-)
>
-- 
With best wishes
Dmitry

