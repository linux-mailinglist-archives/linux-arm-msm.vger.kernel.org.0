Return-Path: <linux-arm-msm+bounces-14841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D58886D7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 14:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFC321F2131A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 13:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0440F4E1DD;
	Fri, 22 Mar 2024 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eMk4zdrd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD464D5BD
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114099; cv=none; b=Oe/sWHWSR0KEUmnOIVPhIh1a9rctgRDDNgM5nhfObN4WRfJk2j4N9rZ8/eGIn41rVdeulX+bhb9f5ZmV2+3y+ADhf+0/WitWVDfBMqs/hiTxdgxwZe6g07tGdAbO5HxzFCPdduZy5EU4/Omq2+kYIrAmjcK8SG5M+IqqpKzj5nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114099; c=relaxed/simple;
	bh=IzOAEu+wO6bc93he6oyR3C00QDPujoCbNJiCwFw/ehk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dpLz7E3CZsUhGhMrzq4KlYvERs8DUa7Pjb/9vdoY/bX3MS7mP062mWsV27jxApqKsYIuLbbNqziGpEi+QkjIQ/kyBujuRksrfPxxmsgx8DrpCR773QfYB3aiHPOeMVwnnTzp4h85eIL4LnVRbNvVkmPvktjZUSVx+CKyl8lH7rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eMk4zdrd; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dd10ebcd702so2110656276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 06:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711114097; x=1711718897; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R9g57H/zZx4/H4WjLHlsjs71ZcYJXW78b4kk7aQ8Rnc=;
        b=eMk4zdrdkcGXx2x4J+q1Y5EkVIxWSr2/lrylt9TjrsUqAZAH9pNQftmEmSKALzpDUM
         EUi/wTRVTlO5C3R5gtD1mZiOl41QI5evKJtAWC5XeyPZp2kGH8hk+eFyNpz78gR01zib
         JsGH469nn/YaOzdUVxD6XQz1105B0vblG0yIlrYx1eTF3HzjQVpwHDTiKlH+o3/OY010
         bii8EAI2794cKFXQGnsjv/+x1tnGzcIMVbt5uJ8CRUhC90UhbxNp1P42F1HKejgzKI8g
         QIbFG5PLw80Z2Uv8BW2InoGNnKyCe2QCEK0lRVDp7/YhfPI0J2ha2f6Hxu/FAPNtftul
         8idA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711114097; x=1711718897;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9g57H/zZx4/H4WjLHlsjs71ZcYJXW78b4kk7aQ8Rnc=;
        b=SK10JZtZ2eoZkgdDqYrC7/65h/gAiZE3OciZ1qxKfkB3qLdytaDFLxaEwzy7QBTvtT
         MgPy1a/++8IgkDwobQIxLfXV8ubWHlgdTmh1py+xuP3E95VTyT80M+NpNUuZLY4fgzBP
         JkRwMMKU6G4m1BM4FKIrded360KqdF3UDtV4L+vDCcOtPtVz6t7SUMYXtca/zW7mJbMD
         zaK9Jb3jar2Rbz6u1iMg4H4bi9p2Qve4fHIo/UkYvzmm6zDPj2LoW14wAKafAX8+feeB
         cHuG5C44OqRi+laS1NxeRgR7HaTUUmDA/m9SUUvoF25Bc4cnHyns04O/NJ9+2H+I5i8U
         sr0w==
X-Forwarded-Encrypted: i=1; AJvYcCVw0jMIj5PCKdTkdgUxRS/KF1xf7pqJl4/c2aTwZVMnRpgSMaDUf4aQD9XWrONicTYgumiD3vVieaDGVK5I1ZtFHAzOe/Se+nzSgN484Q==
X-Gm-Message-State: AOJu0YytpcMJKhzwJJjHqcAbyiQ1n1qynSsGWm3ZKMkuqwBILHbbSZxi
	YRd2ZXdFMvOIdV7SxX679qSjWVpTkssUffyPN7GRBcuLbJ6dx3BnlSxIQ4Jkh7b4YdulurVftxF
	r4/h+LjJen9w5Wnkk3TZfYNfIZZN0b7fAooIrplT4YuNcVWBO1RM=
X-Google-Smtp-Source: AGHT+IH7CzRuo8/gSz47w0tiHuUL2Af6cUjw8esZFVf+qHXlReq8WQsMmc4NMNSha+DBw0ccFVOkoUZTkavB9NoA+Do=
X-Received: by 2002:a25:aea0:0:b0:dcc:4b44:336c with SMTP id
 b32-20020a25aea0000000b00dcc4b44336cmr2133365ybj.53.1711114097008; Fri, 22
 Mar 2024 06:28:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322-typec-fix-example-v1-0-6b01c347419e@linaro.org>
 <20240322-typec-fix-example-v1-1-6b01c347419e@linaro.org> <230eab52-9751-43fd-8e47-fbfe12410e44@linaro.org>
In-Reply-To: <230eab52-9751-43fd-8e47-fbfe12410e44@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Mar 2024 15:28:05 +0200
Message-ID: <CAA8EJprD3fM966pLV4QXPUu=bFTn24fvPMKOaGqtqkAbdz7sOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,pmic-typec: drop port description
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Mar 2024 at 14:35, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 22/03/2024 11:52, Dmitry Baryshkov wrote:
> > The PMIC Type-C controller doesn't have separate role-switching signal.
> > Instead it has an HS signal connection between embedded USB-C connector
> > node and the HS port of the USB controller.
>
> I take your point on port as a signal but the way type-c determines
> data-role is via the DR_Swap message.
>
> https://www.embedded.com/usb-type-c-and-power-delivery-101-power-delivery-protocol/
>
> We receive an IRQ which is a packet containing DR_Swap - TCPM consumes
> that data and does a data-role switch.
>
> The port then establishes the link between typec-port and redriver or PHY.
>
> So, I think HS should be dropped from the commit logs and names in both
> series.

Then the actual usage doesn't match the schema. usb-c-connector
clearly defines HS, SS and SBU ports
The snps,dwc3.yaml describes ports as ones handling usb-role-switch,
but then clearly writes that port@0 is HS and port@1 is SS. As such, I
think, the correct name for the ports is to have _hs_ in the name

We have pmic-typec/port, separate graph port for role-switching
(supported by TCPM code), but we didn't use it at all on our platforms
(nor do we need it, as we use the HS port).

>
> BTW for the GLINK devices I think the adsp firmware just notifies the
> APSS of the data-role switch so, these types of devices probably should
> have an epdoint with "usb_role_switch" in the name.
>
> ---
> bod
>


-- 
With best wishes
Dmitry

