Return-Path: <linux-arm-msm+bounces-16120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67281895767
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 16:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B4511C228D6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 14:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43D4133439;
	Tue,  2 Apr 2024 14:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N9aaA2Hb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6BA1332A5
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 14:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712069137; cv=none; b=Sm4a9Q5a9Vx6dYQunjBim3Bs9kKqLoq0wEP7uFz0NuYMUMTPhxEHufewvdDhE3Gsv1uCsbO7b4+sciRh8aMmDXdkgEXXwFl0D01Gbowjq6VBSXIfIYgIU8s/PINeluBUO/yg/ATZutZ35VDmUU2FPvZtAvu2azZVxfXWaVJCqvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712069137; c=relaxed/simple;
	bh=dQyII7vmQHRtc0XgOTiHPMjkmRblHUUbSglUykBczkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hxQcfQnZELfqRAlN/yPdJY2d1ITT89pf2wAmJoMoWE1YoL1vL3T7YVV2IaGkQQAVuGyLchPLMLvGmwe9LPKvgKxcSvmW5XiHySz27pDs+dYCv627qyCE4cnJRIByII6Jp71h7mK7B6b/yTDJsS1c7rTmy7Y27N7gU5/GFOztx6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N9aaA2Hb; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-4da702e48e0so577577e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712069135; x=1712673935; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b3+dZ1fpYzh0cVc/i51+AzoQt474NVYKn1M7saZ5Kp0=;
        b=N9aaA2Hb10EPMMlN7M65sDBTOXyFqby+HyEuE0Q9QVVcL8LFF4qotWWzw8v8z1gnGE
         Gj3k3n9rgXnFreOr4+AS6ncWjfDT3XprcWg5kNFeKGUtz9zMV6r9dURj3lh7UWksE6s3
         yAhlOgmstcvX/vQFBHSswwdjkARbRAhCiKkNHgScPWHgJlRnxSuZqTq8hNtcHvHJSt+g
         V4Vo7a4fswcB6uy0FdLt3035zxOfuXZpQ38o+CwhOW0sbZkmX5/t501qVH3uMYx9z2fJ
         PQdN/J6AS9qekJrzux6dSCIGpe5azJoIMNCsn8e0iSwn8FfHQPmhxSt1xNJzDJoDH0gE
         CkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712069135; x=1712673935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3+dZ1fpYzh0cVc/i51+AzoQt474NVYKn1M7saZ5Kp0=;
        b=iHJInasGz0aa8w6Z6ETjQA16sYVDTUeIYYwL1y3geHGVpS35W7ltyn0PJJePy3Obmw
         p2ivRKyLYJLmlqurL7X/pD1J6aBdn4/xEqe9vL9T58X78cKnRcerguQd6IaU6mp3wdzX
         8fFBoW9Yijb9CqWWhQcKOb8xZT6OW3ncNaxDMpKcpEA8pAL8f9SZ88WnivOz4uZoo3DF
         ufnmCwmKLd6U6ZUYFhE6NCJuZlTuEwreb2mR8wb5+RHtgteGF7BOofpOxFiva+FKwtrJ
         7CJzHJlXB6rUHj67BnWK8v5QSpiuYpPAOokpCxdCnMaeNJL8+RAU4SHFHGXlLBDaIHf7
         VA9g==
X-Forwarded-Encrypted: i=1; AJvYcCWoQIUIzJKzvcxfUTEBdcAm8R3jso2pUCj5CRRK1pZz/uV58KZ12dCCq9on/zLtOSNsKsyg4xvrb4cSn9VSn5Wepw5XF9K6FXaZfLxcpQ==
X-Gm-Message-State: AOJu0YxHhoo7arusKkczJBiFqGSflNqO7/zM7XeLWe0CTaMaXackkENo
	OhvmXxDrfjGFYuayTqRdY1fdEnZKoYsoU32+d7sPIyJqCLnghnsFKjJBm8i1/jF7g+84ZYwWEOk
	c0LzEESnvOf8KcoaEJrgpR36DKcm7w29Ra73wLw==
X-Google-Smtp-Source: AGHT+IE1jgEZcgPnB/hD8dZF0oJ3NImwHK9mE9wkjXMjSPzUxoTXJ6/YZxwewKzVuNrajM6LQ0QOegrYmBEtmBqomwI=
X-Received: by 2002:a1f:d5c4:0:b0:4d1:4e40:bd6f with SMTP id
 m187-20020a1fd5c4000000b004d14e40bd6fmr9290884vkg.10.1712069132468; Tue, 02
 Apr 2024 07:45:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401-ufs-icc-fix-v1-1-3bac41bdfa7a@linaro.org>
In-Reply-To: <20240401-ufs-icc-fix-v1-1-3bac41bdfa7a@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Tue, 2 Apr 2024 20:14:56 +0530
Message-ID: <CAMi1Hd2tLrP-Qm5tGSwjtYNjy6Di0PGMeW-j=scqj3jgM2RyjA@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: qcom: Add missing interconnect bandwidth
 values for Gear 5
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Apr 2024 at 20:39, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> These entries are necessary to scale the interconnect bandwidth while
> operating in Gear 5.

This fixes the UFS breakage we see on SM8550-HDK.

Tested-by: Amit Pundir <amit.pundir@linaro.org>

Regards,
Amit Pundir

>
> Cc: Amit Pundir <amit.pundir@linaro.org>
> Fixes: 03ce80a1bb86 ("scsi: ufs: qcom: Add support for scaling interconnects")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/ufs/host/ufs-qcom.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 8d68bd21ae73..696540ca835e 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -47,7 +47,7 @@ enum {
>         TSTBUS_MAX,
>  };
>
> -#define QCOM_UFS_MAX_GEAR 4
> +#define QCOM_UFS_MAX_GEAR 5
>  #define QCOM_UFS_MAX_LANE 2
>
>  enum {
> @@ -67,26 +67,32 @@ static const struct __ufs_qcom_bw_table {
>         [MODE_PWM][UFS_PWM_G2][UFS_LANE_1] = { 1844,            1000 },
>         [MODE_PWM][UFS_PWM_G3][UFS_LANE_1] = { 3688,            1000 },
>         [MODE_PWM][UFS_PWM_G4][UFS_LANE_1] = { 7376,            1000 },
> +       [MODE_PWM][UFS_PWM_G5][UFS_LANE_1] = { 14752,           1000 },
>         [MODE_PWM][UFS_PWM_G1][UFS_LANE_2] = { 1844,            1000 },
>         [MODE_PWM][UFS_PWM_G2][UFS_LANE_2] = { 3688,            1000 },
>         [MODE_PWM][UFS_PWM_G3][UFS_LANE_2] = { 7376,            1000 },
>         [MODE_PWM][UFS_PWM_G4][UFS_LANE_2] = { 14752,           1000 },
> +       [MODE_PWM][UFS_PWM_G5][UFS_LANE_2] = { 29504,           1000 },
>         [MODE_HS_RA][UFS_HS_G1][UFS_LANE_1] = { 127796,         1000 },
>         [MODE_HS_RA][UFS_HS_G2][UFS_LANE_1] = { 255591,         1000 },
>         [MODE_HS_RA][UFS_HS_G3][UFS_LANE_1] = { 1492582,        102400 },
>         [MODE_HS_RA][UFS_HS_G4][UFS_LANE_1] = { 2915200,        204800 },
> +       [MODE_HS_RA][UFS_HS_G5][UFS_LANE_1] = { 5836800,        409600 },
>         [MODE_HS_RA][UFS_HS_G1][UFS_LANE_2] = { 255591,         1000 },
>         [MODE_HS_RA][UFS_HS_G2][UFS_LANE_2] = { 511181,         1000 },
>         [MODE_HS_RA][UFS_HS_G3][UFS_LANE_2] = { 1492582,        204800 },
>         [MODE_HS_RA][UFS_HS_G4][UFS_LANE_2] = { 2915200,        409600 },
> +       [MODE_HS_RA][UFS_HS_G5][UFS_LANE_2] = { 5836800,        819200 },
>         [MODE_HS_RB][UFS_HS_G1][UFS_LANE_1] = { 149422,         1000 },
>         [MODE_HS_RB][UFS_HS_G2][UFS_LANE_1] = { 298189,         1000 },
>         [MODE_HS_RB][UFS_HS_G3][UFS_LANE_1] = { 1492582,        102400 },
>         [MODE_HS_RB][UFS_HS_G4][UFS_LANE_1] = { 2915200,        204800 },
> +       [MODE_HS_RB][UFS_HS_G5][UFS_LANE_1] = { 5836800,        409600 },
>         [MODE_HS_RB][UFS_HS_G1][UFS_LANE_2] = { 298189,         1000 },
>         [MODE_HS_RB][UFS_HS_G2][UFS_LANE_2] = { 596378,         1000 },
>         [MODE_HS_RB][UFS_HS_G3][UFS_LANE_2] = { 1492582,        204800 },
>         [MODE_HS_RB][UFS_HS_G4][UFS_LANE_2] = { 2915200,        409600 },
> +       [MODE_HS_RB][UFS_HS_G5][UFS_LANE_2] = { 5836800,        819200 },
>         [MODE_MAX][0][0]                    = { 7643136,        307200 },
>  };
>
>
> ---
> base-commit: 4cece764965020c22cff7665b18a012006359095
> change-id: 20240401-ufs-icc-fix-123c7ca1be45
>
> Best regards,
> --
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>

