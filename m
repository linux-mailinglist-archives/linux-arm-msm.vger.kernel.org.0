Return-Path: <linux-arm-msm+bounces-63524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A483AF73F6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 14:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8BE15659B8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 12:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7E92EF64C;
	Thu,  3 Jul 2025 12:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DJXzZJOk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712C12EA75C
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545212; cv=none; b=I3Pf5ALmWiu3fNgxS+6LhcELGtjLMDS7/tAgx9dH63SYg4Min3VW2mtm0bYUHwWZ4mo9iHW5YJvrR09L0quHsvNGbm9bfa8UFkYoYvRd+uKVNvmbKkFczppsuSyUrOX6yYZFyrKeLfjSPnLw9aYoGXvS43ejTe3msfclwzmzkhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545212; c=relaxed/simple;
	bh=H22Cm7fAW2Mgix3sRqzR1xLudwssIplbSErTvmzGv3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iM25IHVJSjeUG1fZdhQpWbUat8Yw4xYbXQseOD5I2GiKU2AzATbLlKkInQrtG94DvcVatjGBD/8ori2ZACnrLgoVFp75ubUxfbrnPSFWJLXveGbll3JEy6iL59zEPWGOKfxo2tdDFpfijeheYSxZS6Er32KmJtsgtBtxCrws8Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DJXzZJOk; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e7569ccf04cso4637471276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 05:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751545210; x=1752150010; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LJfwdzUcr077GDT95X0ikFnOKfcLc/LKi5CDyQoMdQA=;
        b=DJXzZJOkPLA0wrKmKvpP1dWoueX82Jqw0EKwkQaedkMPaDxW4DbktalE+5S84MdCg5
         rs6/mkLyOTPUM3ZvRGMU4J6GWkVtjslmdBFZtZsbVWSsRMDxXOo1MYKmF1nB5wiirX6Y
         7D/zMFmsGSfOrqa5AbzWMvgmQ5B6MgCBl9R6efXSChKRj0U91ervPfQ8v8HTa4OHHL16
         tPaDehHDkKvyPHQ6XxCvVKV93gPXPttOVWgMPzQIoTbyUispQf4kzfu7KPy2WA6Jgtt2
         lYpEsDyUXQcNDTnBbOLtVThfMh1sPOXuUgIoxKEhSBp5n1O1P3/i4FMPeuBu/TDwgqTO
         eDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751545210; x=1752150010;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJfwdzUcr077GDT95X0ikFnOKfcLc/LKi5CDyQoMdQA=;
        b=USBVZFjPjZhMlLt+y3Xp73CS+1HRJPadoACCe5f9HP0G+VJlOu4wTx/HNhHs+0VgY7
         8XYas5oSieZhEZXk5BZgJQJcdGRTKaQ4WVz8B9NGDES1dV2m+jl3x06KPGqi38fp34fy
         GIDj823LUQsN7xex4Yrrm/JCkRDPzt/KDU/ob+6276dFubpfrnKcOeTEUPy/vlM5VYrX
         ONfL9N3bjNyMJYkyTXqmJBHBSnAGlbwvGcYRZ5YL5C40F3wllxyOM9xOl34hjzw0ZTxw
         MPIXp+P/jmzSh3PLbO7KnF9uvppPShSjCFl7SIym1IgiEl0Qr/zTqd2bd7i0ol2VuRGQ
         hBig==
X-Forwarded-Encrypted: i=1; AJvYcCWyy0L6fiO48Y2lD4ByabR6AGfPIY0H9SG9sNRgnNpWNdzB2qdvCA1jElH95MBE+q6r+90R7AJTsIj9aeNW@vger.kernel.org
X-Gm-Message-State: AOJu0YxeKmW7YH7CETm3zGltlwG4W3bqV96cJ8i2eI/T8LkaKnll65sM
	uGKQFkmESmVHwCY5EIqJxkiJRNgx6XCXZGrhxUIfQ3BR2M1VGClBRlbsdPdZaW+VSWd0PeDQPno
	Mw3naS6cUSWANgNbLJYL7HCTzJQIXSnhvQUPdv8I7jg==
X-Gm-Gg: ASbGncvQVJuN171Rz1lnOLDNeKa7GEwj8BMLOSwMAb6rjEmEIYZszpS/1rIfwkRiJKJ
	CWdjFo1DztKBW1PcMHNp3FIwkTBOFS407Gjm5YZyT1+AeGiwDFY9Vk3WESjBrxXoSk67IMh1aBB
	s7uO2jZmmiwrcp+ruuk7u2h0cCUz8cFTlHZuwRHj9JfCFhDM0A8nKKL7s=
X-Google-Smtp-Source: AGHT+IH5KK9d/YuYxQOB2tPs48I1FLMdjmeeJGaqw1PPBtxv5ff4Hj3lOd6N/27ae75D8h/sJhJCSFTlBM89Ljh9umw=
X-Received: by 2002:a05:690c:6ac2:b0:714:250:8355 with SMTP id
 00721157ae682-7164d26c4a8mr89863427b3.4.1751545210173; Thu, 03 Jul 2025
 05:20:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702085927.10370-1-quic_sayalil@quicinc.com> <20250702085927.10370-2-quic_sayalil@quicinc.com>
In-Reply-To: <20250702085927.10370-2-quic_sayalil@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Jul 2025 14:19:34 +0200
X-Gm-Features: Ac12FXy4OCjuCOdO4kTz7sGzO0ku__i49w4Rk35FXh2a6GcbuOrgABPgI4LBfco
Message-ID: <CAPDyKFrP3EqozUObUZuS3D26YOwnViSrWSOcdNX8J6419TpPKg@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] dt-bindings: mmc: Add sdhci compatible for qcs8300
To: Sayali Lokhande <quic_sayalil@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Jul 2025 at 11:00, Sayali Lokhande <quic_sayalil@quicinc.com> wrote:
>
> Document the sdhci compatible for Qualcomm qcs8300
> to support function for emmc on the Soc.
>
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>

Applied for next, thanks!

Note that, you didn't send this to linux-mmc, hence it did not reach
the patchtracker. Please make sure to update the to/cc-list next time.

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 2b2cbce2458b..5ba2da8dbc7d 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -45,6 +45,7 @@ properties:
>                - qcom,qcm2290-sdhci
>                - qcom,qcs404-sdhci
>                - qcom,qcs615-sdhci
> +              - qcom,qcs8300-sdhci
>                - qcom,qdu1000-sdhci
>                - qcom,sar2130p-sdhci
>                - qcom,sc7180-sdhci
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
>

