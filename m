Return-Path: <linux-arm-msm+bounces-10842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8B5852DA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 11:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7124A1F210BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 10:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CA82C695;
	Tue, 13 Feb 2024 10:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dcVdIZWH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1167B2C692
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 10:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819289; cv=none; b=Z5ZjD6ckcefGa93qG6+X7myKImCZXG5ue2EihcPZjHa3LQeUykJXdIdfIXwQYRC6wNr6HUmNmWOVjKRVvOcynmyLzu4JHPxaB3f2SNOM2z87ejkslGaIoE7qA8Q2gg0KcmGt1MDoJCZ8h5wqPzxEu1jJC/bEX0WyrtgEGkL7Ik4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819289; c=relaxed/simple;
	bh=qdwBhSjUwQlPmDF34us+O31ur8u9qEpELpEa5WnbVSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uv7BC0rQTbnEICacjoD8+50VCbGf4QTrhsYyv12NKOQUPMoWqKoCwsZ9JHsCGvupS+yJRkAcxXCnefAHHx2/NK8VswoVK9I5+BJIW39NNStx4iCjElWi8RZAkvsVsDtUNjquOgEyYL7rRPZ5y+DuGKBGDUZYzrq6LT5Q6zDIlqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dcVdIZWH; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcbf82cdf05so1076571276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 02:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707819287; x=1708424087; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uAkusKZXu4VxkCaxFs2ANE2O6DTRMuupESPk1UtuR8I=;
        b=dcVdIZWHNjh2cBUAqKtpcZxko4CQ+60s+eaEd9GMHyolKoUkSKw1s1m1SMCFQULvsf
         6brq/PQr2gxb7Qha4MMFPtVqD0vRVUtF5y03qrllgiBav9b/ueksOfbEjhf5zNiYB9DG
         yuN09+ZrSOEYji66D1xnFFGPGMnMr44pkCt2MV/Uf7FgGTdrPXtSkdavEU+sZcX3TEim
         I+RKshzL/sBLAUk+JJjnRK8EEm4eCcpTgsuuZQTUjegviflsAy5xABGQ1fi+RkB7AsNL
         f+S9GRnmkMBorgkKi8meVU1Owsn6dSdI9xzEFyYGUJvR3oubgmtWMVS/+08uh8chNCCs
         TGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707819287; x=1708424087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAkusKZXu4VxkCaxFs2ANE2O6DTRMuupESPk1UtuR8I=;
        b=RZ3x/5FBU44jgCRfcM0Rzy50sKFarxYH7JpEaThDOHei36eu3+h9fYCirYKb0oPgOR
         mwA1F2QroaUVZiW622MYDs4bfEZttlq1PjHM+GL/44qhg+DsP5o94ikcQhUme4shPvxQ
         brKR4O3jAFYK++x0FoYVRQ3c8Cs/cIPF+tImUjydUgqKCp7TRQAiWszKBiwpfB6GQ/5h
         KTK6zpW7O6tJcxuOsZxtvR+hEQfsilSTy/tbHU5+je+saMe8CxpHuvq/V2v1Yjd6Z3Pj
         1e7QlMot7/j56Fi1OJsyV4/L7pJJ6Irw83neX8EciSQ4YJyKOr6Sq8PTlC5ZjnJVidrS
         zZ1w==
X-Gm-Message-State: AOJu0YwKzbgHHCHNNH3nmxQdEdtP93R7EDcpcDR2xBpvWsHUE2MoF00v
	1Ps78LbSJJFfsWLWkgoJyVHTjDAVHjTZXNB0TPwclgK/Uu+hC2R0QXWhUyTX8Ho7zwtZ4ac7im/
	sTFRRTWSWCJJU7H9dvHepBPP7sdWnisWLssC2pg==
X-Google-Smtp-Source: AGHT+IEVm1Knjlt3O7qiDjxwD0iN4GvXtg7Ltb1tOjcwmWakmQZAsoE0ftYUaSsSBXyfT4khwq+X23qqApBdH/Do5JI=
X-Received: by 2002:a05:6902:1b89:b0:dcc:f6e2:44d0 with SMTP id
 ei9-20020a0569021b8900b00dccf6e244d0mr593209ybb.37.1707819287099; Tue, 13 Feb
 2024 02:14:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240209-msm8996-fix-ufs-v1-0-107b52e57420@linaro.org>
 <20240209-msm8996-fix-ufs-v1-1-107b52e57420@linaro.org> <6dd8b54e-8334-4bc7-a6c5-7a81c04ed8bb@linaro.org>
In-Reply-To: <6dd8b54e-8334-4bc7-a6c5-7a81c04ed8bb@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Feb 2024 12:14:36 +0200
Message-ID: <CAA8EJprOh0PB1n3c9NS276ck8YrbSTj8wd6J8QqvoozpaB4H9A@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: ufs: qcom,ufs: add second RX lane on
 MSM8996 platform
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Nitin Rawat <quic_nitirawa@quicinc.com>, Can Guo <quic_cang@quicinc.com>, 
	Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <andy.gross@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 11 Feb 2024 at 16:02, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 09/02/2024 22:50, Dmitry Baryshkov wrote:
> > Describe the second RX lane used by the UFS controller on MSM8996
> > platform.
> >
> > Fixes: 462c5c0aa798 ("dt-bindings: ufs: qcom,ufs: convert to dtschema")
>
> Your commit msg does not explain why this is a fix.

.. and it is probably unnecessary, as msm8996 has 'lanes-per-direcion
= <1>;' I'll drop this for v2.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> > index 10c146424baa..f1de3244b473 100644
> > --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> > +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> > @@ -43,11 +43,11 @@ properties:
> >
> >    clocks:
> >      minItems: 8
> > -    maxItems: 11
> > +    maxItems: 12
> >
> >    clock-names:
> >      minItems: 8
> > -    maxItems: 11
> > +    maxItems: 12
>
>
> Best regards,
> Krzysztof
>


-- 
With best wishes
Dmitry

