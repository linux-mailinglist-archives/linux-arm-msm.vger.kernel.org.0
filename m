Return-Path: <linux-arm-msm+bounces-14830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5F4886BDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 13:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB3D72827BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 12:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70033FBA3;
	Fri, 22 Mar 2024 12:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IwVMaP2k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CC427453
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 12:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711109492; cv=none; b=Pq1NLiRpHhaRXotVOuq6diofVMAIEdIpsbgdtxNV9ujI9xP5ZBEij05+DlHd2/zlzo68cQ/C6fEVRMFQ+a3T5/scxF1k/i5xaLjxElwJds5/kCRf0yDOanwxADCu9ZX019U+PHM2neCbAlKBK1885Jwq23HyrMncw1fkiHMA3Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711109492; c=relaxed/simple;
	bh=ookcacqQvslMXulbynVMtpcpPlYS0qDy2qdS2UTm+nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L7/OMho5447lZ+O8Rv5lKZFrwhatMTpwmlMkGA91BOa3STDI6vxwla12VEU4TcVgqrJMmOeV486a5v7PKEWvU60eE1x9xJ/5a8ScEYbAXLpjkVN27x6tcHakS3PvCkB/t6okfcVhh9I6KsDr4aj4EbE+w2YexWDDU0CKwjIVcg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IwVMaP2k; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso1978261276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 05:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711109490; x=1711714290; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F/FEfLL5ARXahGfD5kj2pZpy3RrSe+B9Qp8hGUm/NLI=;
        b=IwVMaP2k5UKwOLibawxM8SdE4/U4Gio52NR1UlljOKA5JUS6UsS3FfkM8H7frhobL3
         mljoclux0QxCyy0SDz4vFteM6bS5sKE8u88pZ4/zSK6SGitbga0+Y3nlVOkK4t4iHb+y
         k9Mc0J3s+u8GVI9+7WaB+r3mbMt6j48wC0NLkCz8/B/KEIUj//KElcNCmFzzxwzp00KE
         CEFlZH2XDxTTAevZDDgv8/MHbmbembh20pewjqmhVbWsDQcVkgYKtKg8y4b6z55VAFFf
         Wp3ijo+Mow0r3IlAofNs12nuRQuSQp+xadCegQO3TrI3Z8wH5kXlT9CyOsSmX86YzabJ
         Ngtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711109490; x=1711714290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/FEfLL5ARXahGfD5kj2pZpy3RrSe+B9Qp8hGUm/NLI=;
        b=eW6K6SkaKrZ81isWmiGKE7ANhVycCt4/4YY2hEQkiTmq+ZAnb9fuKjeWvuOsrUl37g
         0k4DYOSl00GZda/53mRsQPGMG68A/sTnLU5oE9isiB5X2Z6VCTnU1xfDyWzuRE65rxWZ
         dxwLxc6l0qCbdr37IN5Gk5BBvOjQjZRR+Jrq8CguEE/yS8BNvWLxY/aBrAUL2U/lLIvk
         GLnDprGbFCE06CmqvIsKXt2M+MmCqMOgRfUGzSLXe+kjDIRCVAx/OLO+HdykXr7qyXza
         BX9m9C9iDqGfcoXHeFnqVwmHt8STTBdX5MOYsW7vztJvcdQ0c4QrfjvVCF6Hb1NxECml
         WoJg==
X-Forwarded-Encrypted: i=1; AJvYcCVXPlhYZVOIq2+8FXp0CDYsNkT5hjYbwoy8LOU1+K/x8sBA1jXYWEgSUjbp0cZpQbl3FRRDpDVlVFdBelIjj33sJpLgzy2gkaJSQ9fuDw==
X-Gm-Message-State: AOJu0Yxb9KxHIeananuXXK3sjoFcScaexczCzUl7AhdAIiOZVmbZqniz
	qV1vJhwhpcKOzesllgTfn0PmucA7yrWQX2OKf9Ap07UI3dbwKyKbo8gbFVpuhp9llHxCCkTZ9QF
	OGbS03QrE66X1AAQZC8XS6GkZtYlBJZlxeQ8sbA==
X-Google-Smtp-Source: AGHT+IGB0HkBiPswuKP8IjOEEr+Ve7Grth1dIhr3BI6d7OWAcFJXCTnZ+hcmMSMVCmZ1rO5o9+1LQZhT6eIjuBhFXWE=
X-Received: by 2002:a25:2f0c:0:b0:dcc:f5d4:8b43 with SMTP id
 v12-20020a252f0c000000b00dccf5d48b43mr1836581ybv.9.1711109489879; Fri, 22 Mar
 2024 05:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322-typec-fix-sm8250-v1-0-1ac22b333ea9@linaro.org>
 <20240322-typec-fix-sm8250-v1-1-1ac22b333ea9@linaro.org> <30f71224-7340-4255-bd48-a96252985b15@linaro.org>
In-Reply-To: <30f71224-7340-4255-bd48-a96252985b15@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Mar 2024 14:11:18 +0200
Message-ID: <CAA8EJpqNM8dsnX6OzZOFeV88ngJ-mE8AKjaKFurT=eKed6Yu4Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: describe HS signals properly
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Luca Weiss <luca.weiss@fairphone.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Mar 2024 at 14:03, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 22/03/2024 11:58, Dmitry Baryshkov wrote:
> > The OF graph should describe physical signals. There is no 'role switch'
> > signal between Type-C connector and the DWC3 USB controller. Instead
> > there is a HighSpeed signal lane between DWC3 controller and the USB-C
> > connector. Rename endpoints in accordance to that (this follows the
> > example lead by other plaforms, including QRB2210 RB1, QRB4210 RB2 and
> > all PMIC GLINK platforms).
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Hmm
>
> I think if you are going to change the name here, you should also do so here
>
> grep role_switch arch/arm64/* -r | wc -l
> 54

Oh, my. I'll take a look at the qcom platforms for v2. And funny
enough sc8180x even uses old bindings for the QMP PHY.

> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


-- 
With best wishes
Dmitry

