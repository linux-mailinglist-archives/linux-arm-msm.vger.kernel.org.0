Return-Path: <linux-arm-msm+bounces-18440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F898B09F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 14:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD6D4B238A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 12:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39C715ADAD;
	Wed, 24 Apr 2024 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LcPtxt4b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5638C143891
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713962813; cv=none; b=lCi7zl+Ocl52bggTLEsaKhvzigDQ6Ss83jbCz+r/xnnSpVzo17BSJdO3Lp1JfNbSCq2k2dQP2imVtQb7Et+v8RdOOaK69IYslxrXU5DWXpbfnC9/prynZup20GBFwRWCQ7YocaoKElXHlWBesqEglNuD8t+BaXG+NoYje5bBKCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713962813; c=relaxed/simple;
	bh=zM8sR5orAuQQ4cxTB/D5fYnLFqtLGuq1kFg7hhQqLsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iKMwm5vIcwuY4Ndj1SUASOcpjTHRdzAGK/ufPKF38Zw9Oqbfuiwwx77ZF3YX4XD/CMxP2wlF1sSCAOUaIWvIvrqBTcP4YxKeEZ3StrHpIvk2nEL6t7OjO0rOLoOT06yYjWXuDl4SHBthyPPadIz5YxT7blFEvOHN/iEels1EuLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LcPtxt4b; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-61acfd3fd3fso73580627b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 05:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713962810; x=1714567610; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KrXYASI9NEzYia3x8Ig4KvMmkyEG5SofFlBDhZ//oC8=;
        b=LcPtxt4b33cYrPdx3CIRXpjdXWUjT78C/PjdeLpiug8UCKPqIcdOglPHsuV2YUjPW8
         Te903LSzQJTSD7uT2dzNn+lg85EWU30gaisyDnj2/VT6X1cYs6vUxS2KsbmkKpomi7gS
         c3i5tc79qyT0leqS+pCkNo1/R5MONVFi2uHKXBCXWWbWrytKXXU14Nz+3cbaZlvfZmNh
         fBtechV7fjRD+923uahXi878ASAjkgjG+MwM/6vJNT1CdCgSwWHY+3mRBqDMTAF03xpp
         eM5Ray9mAHJKT65WMoA1XrMZl0277+JOP1FoIku36mcb6QK1nvwAcAgbRVWIoZWzeiES
         GQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713962810; x=1714567610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrXYASI9NEzYia3x8Ig4KvMmkyEG5SofFlBDhZ//oC8=;
        b=GGMdXW8ZrfUFaX38qjHCF3+q219fuDYeZD0W0LgjsZBL/JUcoApT4XNjK3hmjtDSaY
         1XWXog4GoYtlMVk6Vw4mCbeeE+jUvp9a0DSmYwV3TvJylNxVf3LIcDUVOZXlevyycGSt
         rXg21OaPzdGahfm1mMXrlP9IVKgetotlTdwtz+LQwLfE8it9qG32Uspfc7bkhclJTl9q
         fX7KhipXUc9bTqYgDyE5bPhWtAJzGKMNPmjKQVlzW9lgRdSiavhAYTrwM6JfGB+a0se2
         qjyoH/u3ehIx+r2ee5TVQByUlmK1Rd6q4ANqIHTdtyYccwDtzuVrGDzPFPNHOVvsD80s
         uVnw==
X-Forwarded-Encrypted: i=1; AJvYcCXcB3PHXgf7UnS95Or0gbLZBN24/4+qbZznBPnbSQbD29jPVWUc9fLMAl6XYTvKaUwPxgThxJvD6AMIAQdQCqkLi/CzP8kCt0C80MwN8A==
X-Gm-Message-State: AOJu0YwGW26onOq0PY85cYJOyDGitErHyIZJkVzbxhwshtHn9sQm86p/
	xfsgMb9AaFmByWBqnv+ovtCym+kyFyr0mEfb6HikUPOVYy9cljUFRJzQ6boq8KP9PksUSo4jKDn
	SVwBh8y7zNJiJNaPuLcKLj1ESpJYRQpOH/ir0hw==
X-Google-Smtp-Source: AGHT+IEx71tun5t5E76UunWIPX06WRdVSlCvojyV6lcnuKs5nx7eNpkieeUAZ+aH8KQvmyHUlsLHPhwiU8grk8etkRM=
X-Received: by 2002:a25:838c:0:b0:dce:1285:e9a5 with SMTP id
 t12-20020a25838c000000b00dce1285e9a5mr2494534ybk.11.1713962810353; Wed, 24
 Apr 2024 05:46:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401-typec-fix-sm8250-v3-0-604dce3ad103@linaro.org>
 <20240401-typec-fix-sm8250-v3-8-604dce3ad103@linaro.org> <d57ab72d-2604-4115-9973-1ce0f24b159f@linaro.org>
In-Reply-To: <d57ab72d-2604-4115-9973-1ce0f24b159f@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 15:46:39 +0300
Message-ID: <CAA8EJprdLB3+30wvVZjpC5pWKUzgw+Mg54YkN3SvU-Ovc25Qpg@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] arm64: dts: qcom: x1e80100: describe USB signals properly
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Luca Weiss <luca.weiss@fairphone.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 17:41, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 1.04.2024 10:33 PM, Dmitry Baryshkov wrote:
> > Follow example of other platforms. Rename HS graph nodes to contain
> > 'dwc3_hs' and link SS lanes from DWC3 controllers to QMP PHYs.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 149 +++++++++++++++++++++++++++++++--
> >  1 file changed, 141 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index f5a3b39ae70e..3213eccc3a3a 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -2543,6 +2543,33 @@ usb_1_ss0_qmpphy: phy@fd5000 {
> >                       #phy-cells = <1>;
> >
> >                       status = "disabled";
> > +
> > +                     ports {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             port@0 {
> > +                                     reg = <0>;
> > +
> > +                                     usb_1_ss0_qmpphy_out: endpoint {
> > +                                     };
> > +                             };
> > +
> > +                             port@1 {
> > +                                     reg = <1>;
> > +
> > +                                     usb_1_ss0_qmpphy_usb_ss_in: endpoint {
> > +                                             remote-endpoint = <&usb_1_ss0_dwc3_ss>;
> > +                                     };
> > +                             };
> > +
> > +                             port@2 {
> > +                                     reg = <2>;
> > +
> > +                                     usb_1_ss0_qmpphy_dp_in: endpoint {
>
> This is more than just DP AFAIU, please call it SBU

This is not the SBU lane. This is for the SS signals. We are not fully
modelling the SBU signals yet anyway.

-- 
With best wishes
Dmitry

