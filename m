Return-Path: <linux-arm-msm+bounces-1812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F9E7F7046
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 10:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AFAF1C208AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 09:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B994168DC;
	Fri, 24 Nov 2023 09:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MVNOEcM9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F8CD59
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 01:44:08 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5c85e8fdd2dso15811387b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 01:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700819048; x=1701423848; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8U6oK0q2++i/sXs1uKCpqaJWvWB9Mdi5xB6RzEIJfc=;
        b=MVNOEcM9G0eEAXPXzLCdXukXdinFnlny0Mxgjbbf1swP99lTMhtRcktFhnnIqQTzgL
         bAPySAAjZc6GyPEyUndZZAhaDszbigxus8UHFGpZ0Ov2y81xmP1b2D8K+avvXRf04JY7
         cPS+xSFnlK4u9ir37JOwGG9dcPjOprYAdrJfnpihqJfrisxcnvVxYnwepFAG1dnLDSvy
         yj+dYPC4cHOgyURMHSrn5vv7AmDQ0bc82ZhtADRXJXp2KlWO42qE7/qrWz69UTLppde1
         BhWIBrQLD3Dw3OV55qNCHTFfXY0RqWGR/ui0RaffQ+120DACblH0nzi5CYul/i8K6uED
         CV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700819048; x=1701423848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8U6oK0q2++i/sXs1uKCpqaJWvWB9Mdi5xB6RzEIJfc=;
        b=mqd3CYRirCRXXg/1/RdnRkilcoDyD885Ath7x2PbmKvNdx71s34lGpPqor41/T2xUS
         /SrXVZeFVc3nNK7a6897IAY3po51v+2fTgxPPKm/ay/MoA2lU+HIDd7AmNOCJm5VzxoP
         +Fcf3TG85VwjEmXxUmc9BRABHQUSr/C2ZGKsHtQ3jxCP50slIXQ5WNsVdRTw0jRpAr0R
         gwxnkyGbNvbbOxYQp+vrCdxMiUIT+T43pmOEj9Bx7gVSNvdy3VWGoCDI9TqzO1v2kSJQ
         OU0Vx/mElIk77RgOuAEb7oXXYPR0h+K+HhXf7JztZgFYjhkxiR41L9NtQ2NQ+NTQjlqk
         iUhA==
X-Gm-Message-State: AOJu0YwA7yeYPWpDdtBcKoHgi5Uw5dJ5kH9DF5zOnDBFYKcQHgfkZ8Ug
	MbI+3dTFECyNK8hoXK6rvKzsmIPtlOABMgUA2no0WA==
X-Google-Smtp-Source: AGHT+IGeuqMgtlqATuFeCx8iGbYWfLHMNuuqRCfht/XD+q5njaSfDP6xaMBZmj8/3Vrj0we0rCYnOvhSgUaQ0XkV8Ik=
X-Received: by 2002:a81:4981:0:b0:5a7:c8a9:79e8 with SMTP id
 w123-20020a814981000000b005a7c8a979e8mr2071750ywa.4.1700819048052; Fri, 24
 Nov 2023 01:44:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117093921.31968-1-quic_sibis@quicinc.com>
In-Reply-To: <20231117093921.31968-1-quic_sibis@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Nov 2023 10:43:57 +0100
Message-ID: <CACRpkdbi+H123TPe9yvGGo68o_uAxVZyiSHcJDxB7c8TSMZ-zg@mail.gmail.com>
Subject: Re: [PATCH V2 0/2] pinctrl: qcom: Introduce Pinctrl/GPIO for X1E80100
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, agross@kernel.org, conor+dt@kernel.org, 
	quic_rjendra@quicinc.com, abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, quic_tsoni@quicinc.com, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 10:39=E2=80=AFAM Sibi Sankar <quic_sibis@quicinc.co=
m> wrote:

> This series adds pinctrl/gpio support for the Qualcomm X1E80100 platform,
> aka Snapdragon X Elite.
>
> Our v1 post of the patchsets adding support for Snapdragon X Elite SoC ha=
d
> the part number sc8380xp which is now updated to the new part number x1e8=
0100
> based on the new branding scheme and refers to the exact same SoC.

Patches applied!

Yours,
Linus Walleij

