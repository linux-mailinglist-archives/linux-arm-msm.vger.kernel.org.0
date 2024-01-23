Return-Path: <linux-arm-msm+bounces-7941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D4C838E5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 13:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB5CF1F24AC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 12:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA805DF19;
	Tue, 23 Jan 2024 12:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zaFv2H3l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6426F5DF0C
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 12:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706012310; cv=none; b=MTmg65VmeeATMFp2iX6OGl5PxDr2Ce0XTfJt+Y4hCpW0xA/o5ULrdFX5e/ad7mqQ9KBUmPG7lbQbFLxUFm5hUfUuGljvt2QcMvDBvklRWR/FLI26cuhPg3tDIO++IE9ofErqiNP5unBWf3CetRfYNlxqvDAnclmJjYYYqSlBQ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706012310; c=relaxed/simple;
	bh=2V+Bx4FIrH1pc364z+9nImn5SzIBGQp/BaM/gj1sj74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zqhkc1s24JNjvpdrU7yF4leM+nlu5Hj4rGjVeIc5zWZEV0/0Gpsve91V40662MEP9TAmHLlsxZ+rFDp92e1jI7AZbCby7jFOi7cSqRFtinUxFD5mFO5nu0x9SyrX+lN/huMNBBmLBiKqjVzN/gfrbpRIbfbgiRuvC2fWdjd76sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zaFv2H3l; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5ffdf06e009so19286367b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 04:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706012308; x=1706617108; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gh62vRSBG030L7L0RyJ3ueU0okLJVyWTJjLMCyBYbyQ=;
        b=zaFv2H3lY3gABTnim+cZ7p7QZGduWasw8MPaooj0p39PDsq41Juu/MbsiS3eLvGWDC
         UoUzDK64eFNlK88tnlfhzSekUweYP1csobrEpfVVPoiH53zaXmRkiwkQh13bAQxuyEJB
         gJ+97+7BIrLannpyPKn+lXFtGnSCyiGa5wK5uOFPnmydgS1tZEJWnzmuzqfILH+/H40z
         y/GcaRL5oH9aE4HrQHl3XKcSatiRq8s6XYgHo1bLUIY0/mI1U/d76NHpIqfNfC7Rlhob
         rXLX5Og9wjuDFEyZ7Ip8NrjqcfMQ1bFBWyzErVq5vCVL7Y6hVFNKUz5XdHd5QfFNwO/P
         JC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706012308; x=1706617108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gh62vRSBG030L7L0RyJ3ueU0okLJVyWTJjLMCyBYbyQ=;
        b=GK99CKWSMHXeLcb3jRFG7P+mUi9Q0y3N88mgji0FLiD/XWQP1P3hQ3yJPzPAiCa+lA
         1WVl6GbScuBUHD9OJEFzObFU86yzsZ1wPUEYMQMQ//X3jt/efGLryrab1E/Qye7W1pR6
         bjUvx25fOUDD+33pijrgWXUjVUFTisNHoEL/OhxjTrRjaNB+FJGqaqRM3XcnK+QV2uTl
         AerXrDKBo+D94DrxlPOYAYrQHzI7FgRqEylW4ByLbaG6ow2a0dtd5uUZ8FKPkoTqV698
         VyKDSqd3bvABSzZUWjs2TCa2zy4Xeg2WC3NhUJRv+6lTigwa1pRTaQKT+/EdLY2ZzLoX
         DdtQ==
X-Gm-Message-State: AOJu0Yy09ivxRfMkB/0p5FJ1fMB0pvTgauHsan1+C0ZwpKtdNnzeIex0
	2AiUDYWen4gLOO7kic6D28+IdSkIz5GklLh7CNQ8z+nMuBX7kLUMxfn7JEMImFp4M0VlwvPfJ/Z
	r2rnTbwQQ2A6ymO5m16alYk1vWr/xeGohhqlVqw==
X-Google-Smtp-Source: AGHT+IE3HOE1WBjbwtEXORZxD29BZLU+G+gsdsCkXBrEeww2LPidC5QdtJcqX1/Wzpcr8U8LXecicY1xPGse7G9nY4E=
X-Received: by 2002:a25:c791:0:b0:dc2:3cf6:9bc3 with SMTP id
 w139-20020a25c791000000b00dc23cf69bc3mr2811724ybe.58.1706012308255; Tue, 23
 Jan 2024 04:18:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123102817.2414155-1-quic_uchheda@quicinc.com>
In-Reply-To: <20240123102817.2414155-1-quic_uchheda@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jan 2024 14:18:17 +0200
Message-ID: <CAA8EJppwboaEbKFFACr3LO0OHg4iOJPapKRqoH2EGEYcjV6HfA@mail.gmail.com>
Subject: Re: [PATCH RESEND] arm64: dts: qcom: qcm6490-idp: Add support for
 PM7250B PMIC
To: Umang Chheda <quic_uchheda@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kamal Wadhwa <quic_kamalw@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jan 2024 at 12:28, Umang Chheda <quic_uchheda@quicinc.com> wrote:
>
> qcm6490-idp platform supports PM7250B PMIC as well.
> Add support for the same.

The platform can not "support" PMIC. Please fix the commit message.

>
> Signed-off-by: Umang Chheda <quic_uchheda@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index 03e97e27d16d..2a6e4907c5ee 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -5,8 +5,13 @@
>
>  /dts-v1/;
>
> +/* PM7250B is configured to use SID8/9 */
> +#define PM7250B_SID 8
> +#define PM7250B_SID1 9
> +
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sc7280.dtsi"
> +#include "pm7250b.dtsi"
>  #include "pm7325.dtsi"
>  #include "pm8350c.dtsi"
>  #include "pmk8350.dtsi"
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry

