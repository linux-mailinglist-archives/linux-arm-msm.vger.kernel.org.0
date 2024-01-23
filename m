Return-Path: <linux-arm-msm+bounces-7911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C4B8389D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 09:59:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2DD528D3B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 08:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459D25788D;
	Tue, 23 Jan 2024 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wVxu5pWk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC4957306
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 08:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706000339; cv=none; b=Q7q37O+d1mSC8eWXmoYX6ZbxhX47xsmuCUQQU0CYoW2qSRZ1fjYWlrhdQ3zd3o6I7nIJpR8BweLYcZdJ1/91/x0SGLkYI0Wt8fD1tYX09iLcK7kdoZEqVTiz0yGRj4SBO03amqDJzeJYX+1kE63Aqy0bSVPY256Dxxbtd9bwOrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706000339; c=relaxed/simple;
	bh=GdENzMYn4lktZHY4KmY+kX1Nank39qBXFG/o0ROvZNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eoj9jq/hfCeS9FGeNQFtE/oRm53OzR6Ai5fSIVMjfR3/S85YhbKE1MaKZ0BeUQW+Bzy1FD0uBwuiRVjNv3uoeiSisJDCk8Bu7dprsVlbUGXbFCW3N5IvbBj+9btr06faMOjlCB+4PoAfKwtDxJ9QY5Q082lV8ZA6kLyAT9KZrmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wVxu5pWk; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5f69383e653so38776957b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 00:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706000333; x=1706605133; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gd8+YHFNJMug/HTkqV82yzOrM3/5Esu8/DX82CjRhUU=;
        b=wVxu5pWknd9HOkJozXVxTrd9yovv2IN62w8SGAPQriPTWTOK9UGIBmRW3V/r5T7rHo
         DoFeRrbaBDnOFK+5SkzGhLeQP9ZERWVF1WH/zzx4CbFMsvWIpnkpopRSAIllM9LuAXE6
         09sQ4ex2Y5HRwcTqlthmmp4QhXt0gNx8Jll5Vhz35/AbM1lpXd5GP/cN3iOGvrLFEJnL
         GmfYWQQlIiMwt4mMwbYg4KTqRC4ZTD1PNKz40+45+WN3bUPY5CyMhnzRbvmowjA06Cgn
         zKjqJd4fE78dT9MpYnQpWZME5AwTxiJDZi6a1uFu2E92Us6tS0KJgaexkrIVfS04xTAo
         i7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706000333; x=1706605133;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gd8+YHFNJMug/HTkqV82yzOrM3/5Esu8/DX82CjRhUU=;
        b=UxtVZ7jGz8rACuLsDSLTmsg8iY6YafY0WILtsJPKppxg91y3KOFmSRH1ZHQFHi5qes
         JhXUA/+KsnVhQ0HaxPoQnglIeVf3aiLr2hBxlNQPvtAYjUCGvKZ/E+pKRvaiiBtJg4Zb
         T5HVjdmMLe4Vxd4KJ1qq64yT95PEE4/CUnLa55+HvexG2t9e/td2/4xjOzrsBL0DBVQv
         XmS2F7erHmtHnistycrIN0TL80XCIFZ+Wam3iw/NfVZxMOc18yaqMB5fLXuMzDz5DlG3
         Oc0uMrgv7k/Zxkicf9wkX3kSnXxNYDwR072eLBKROk9SYo/TRPBLCAvk62TrUyNJch/W
         u9Mg==
X-Gm-Message-State: AOJu0YzzPPw+P//TLza3sNjRgO3tfP/D2DqoSHiaTDwU6D31DCp8aqp4
	iQh4lPmkGZSIVhorbM+TeUuxUf1ZSa/ER+Wdys82zzbBDp4zzdvkJCxbvOMzJZr6UHWQCsWRV90
	15RDgl4d8yLkZQD0q41lN5yCy6/VPjGha9OENgw==
X-Google-Smtp-Source: AGHT+IFf/yktetlkF3njKK8Z1wzoUWcmawotJ8Ye1DL57gIxMBOqjlwuvWsRSA1pLmywAxwnZS3wOD7ICeW8AzNHXL0=
X-Received: by 2002:a81:bb4a:0:b0:5e7:57df:6341 with SMTP id
 a10-20020a81bb4a000000b005e757df6341mr3802936ywl.38.1706000332818; Tue, 23
 Jan 2024 00:58:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123-sm8650_pm8010_support-v2-0-52f517b20a1d@quicinc.com>
In-Reply-To: <20240123-sm8650_pm8010_support-v2-0-52f517b20a1d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jan 2024 10:58:41 +0200
Message-ID: <CAA8EJpqfQrwBdpAeZGk0+ejwhr4G375Y8gRseGBbJDcTzDKQQA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add PM8010 regulators for sm8650 boards.
To: quic_fenglinw@quicinc.com
Cc: kernel@quicinc.com, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_collinsd@quicinc.com, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jan 2024 at 10:49, Fenglin Wu via B4 Relay
<devnull+quic_fenglinw.quicinc.com@kernel.org> wrote:
>
> Add PM8010 RPMh regulators for sm8650-mtp and sm8650-qrd boards.
>
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---
> Changes in v2:
> - Added Reviewed-by/Tested-by trailers

Please refrain from posting new versions of your series if the only
change consists of the updated trailers. Such changes are handled
automatically by the subsystem maintainers.

> - Link to v1: https://lore.kernel.org/r/20240123-sm8650_pm8010_support-v1-0-dec2224d5740@quicinc.com
>
> ---
> Fenglin Wu (2):
>       arm64: dts: qcom: sm8650-mtp: add PM8010 regulators
>       arm64: dts: qcom: sm8650-qrd: add PM8010 regulators
>
>  arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 118 ++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 118 ++++++++++++++++++++++++++++++++
>  2 files changed, 236 insertions(+)
> ---
> base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
> change-id: 20240123-sm8650_pm8010_support-750c05a5cd5d
>
> Best regards,
> --
> Fenglin Wu <quic_fenglinw@quicinc.com>
>
>


-- 
With best wishes
Dmitry

