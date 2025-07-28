Return-Path: <linux-arm-msm+bounces-66828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EF8B1385F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 11:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3EEB1882BB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 09:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA20221557;
	Mon, 28 Jul 2025 09:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OCcEcddA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AE318871F
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753696377; cv=none; b=hVK2TJM+OmlEFZ6RQw7sYPnMypPxsAZoVc08kLISj9oIbgDLoutaRR/g+TTxsjF+mPzLDj9OIp5KnCExWR9pZj3RxqXDrX0MkuayYCR1qhjeupe8eFrUdV7CQ3D9q6cQd7DSmV4icxc0M8tTwfE7LkqXVHXnPhnUUIE/1hTB+UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753696377; c=relaxed/simple;
	bh=/6BNgY7WTTuIY8aoiuMGPX23pPGzhuUKzVHnWFSowHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7uOf0zwF8NlcQlvOWvQV13sv68jWYNN2gUa9MMyBCFMDW3osK4rEwIgUFt7N6JKfmew7AhbjlpqWubfpniM7pT0t+X1wuI0QhOo7W6pKOxGEuA1YhmVsTBZUXTyhqpWlX/wFTGqeWAnpPQMTtI2mpNEmCkT0y6wcVED+xkhea0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OCcEcddA; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-748d982e92cso2626440b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 02:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753696375; x=1754301175; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FXctHXJiprQ+nYxGUG/ZEb1ybwSH4GdemqONLKI8ZTU=;
        b=OCcEcddAVoEeGlBOsvwMtOb/yvfX4WdKBWfrgk3VYf4GAqs5elmdkttQeS5x2Veg6n
         c4nWtwyBUcvjTuv+kSpcBIpU6u/oxeM5V67M5SdL7jaiq4qKeKMV6oVV9T2SI/EkJ36q
         PJvgyYiGFyTHcMi66j03R32fFZ5ChRbqAHFxrTMBuYM4QqTrmCkeUZPBjTHDyuQnVi5Z
         ODiWhjTSWQmHeo3Fefd9EzSu1kevyR5ZlDnzEEpawYUxTtBS2gRTWPoNibyngaq0CdqQ
         fIVKpTlfusKAAw3dd6kHHk+5SLfpYGnH/FO7wdhD4LlaaZuBkrOtiLFaYN1sW1uKl37h
         5iCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753696375; x=1754301175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXctHXJiprQ+nYxGUG/ZEb1ybwSH4GdemqONLKI8ZTU=;
        b=XrsKm4o7c6FkIGkX+iHdghXHIU9LqKgVlp+WL2tlDToJIvBrYqSJKR4IP+s3HCHz4R
         b3subc8Vk5eQBThfKPgVWDHrnyEaIsSOoppyJeUAMPHCFzqaHfRHUGkBN+uOO7oB/JmB
         lYw5Kaz8kHgcuBPpF+FRia/g8lG3AIlGvmV1U67StW+QhY3hpohixLvBUFaX1zPs7ch7
         zl/G9fDte2sbIpd3cLKUrxs+m0f3pe1TKQvO/HQe2TxmmDh66eqyxpPAGWj6xUJ1l1Yo
         UZ8Prbcf/I7nMObgRbUn/39x1Ehf3o6c5Pq5IhZguSz4fGc6fFn6EGhzyHPd2fKE0+Hj
         UEDg==
X-Forwarded-Encrypted: i=1; AJvYcCXGOJzlAvJBAQ+MR9TxgV9nWP1IZAqgNYb4AsbXWg+jWbZNSKlaqtxn363c7ouTRqB7Sb7TYbOaiA3Z7LDE@vger.kernel.org
X-Gm-Message-State: AOJu0YzPY1WFEf4u4xaA3tHwZDSnd1g5+qmyHUMVTUoKbaxVx4apQdQw
	Y3uHGEfihYtmqHvKZJyDlkd11/WE8/nZZP4IsrCy0ovMVtt0D6r40jbUpgH1dA45kq4Hn2IsDQF
	uSs9/LERJLVTvirvHihfKbzpWO2P2Dehun1oCT7BDGw==
X-Gm-Gg: ASbGncsquEMCRAvqEEOG3TV72nA9YPRbipK0d9Eygb7fB54Jf8etERGpYRpMy7AH+1V
	2Tjgc7+rsodGaa/ac5qZRAnedck6YJvrjI/jOANXqM2GnRxT3rdF2fpg2bcqrcBcj24jf7fcuw8
	Sy73yFz1OAlRr02m82JVcR1FKOkf0Fz6YQEhs8EJzMourLZCKvGoOuKePcnAC+xMltZBmTTDM7E
	shwegzE
X-Google-Smtp-Source: AGHT+IEgzkAE3PwKwwLXoiUp2BYY6zf+o5Yb3xVeHDX/6yVmfx6aoJxFSQ+FxTGFP4MlReYfbAv61lzV2Ktp2KRQnEY=
X-Received: by 2002:a05:6a00:22d6:b0:759:5208:59e with SMTP id
 d2e1a72fcca58-7633693f70cmr14865264b3a.7.1753696374766; Mon, 28 Jul 2025
 02:52:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
 <20250722081405.2947294-2-quic_jinlmao@quicinc.com> <727fa9f4-fe25-495e-9d8d-48e504fbe6b0@arm.com>
 <20250722091425.GH3137075@e132581.arm.com> <CAJ9a7VhLLgAak_4FB=iW0izXprM4W+RsKfHUeo=XUHh9LwtUsA@mail.gmail.com>
 <20250722140659.GI3137075@e132581.arm.com> <CAJ9a7ViUoSMV_HHKKRMhcQX=isU+feJvwCaVhu-6EBK4QXJbVg@mail.gmail.com>
 <de702854-aca1-4c78-9555-f2139d5376af@quicinc.com>
In-Reply-To: <de702854-aca1-4c78-9555-f2139d5376af@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 28 Jul 2025 10:52:44 +0100
X-Gm-Features: Ac12FXyvdjPfrN4L2Hgk5dVubMk4o7GnaQ5Xk_Mfd_dD-y0plpjHVgB4QmAHYGo
Message-ID: <CAJ9a7VjTYvFVz1fp2_hNkLrKBbBYkiHHyshgsVT98V8oB_bn8g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add Qualcomm extended CTI
To: Jinlong Mao <quic_jinlmao@quicinc.com>
Cc: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Yingchao Deng <quic_yingdeng@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 23 Jul 2025 at 03:58, Jinlong Mao <quic_jinlmao@quicinc.com> wrote:
>
>
>
> On 7/22/2025 10:56 PM, Mike Leach wrote:
> > On Tue, 22 Jul 2025 at 15:07, Leo Yan <leo.yan@arm.com> wrote:
> >>
> >> On Tue, Jul 22, 2025 at 01:00:18PM +0100, Mike Leach wrote:
> >>
> >> [...]
> >>
> >>> For a change of this magnitude to a CS component, that the ID
> >>> registers will also have to change. This is a requirement of the
> >>> Visible Component Architecture in the CoreSight specification.
> >>> External tools cannot see the device tree.
> >>>
> >>> This is effectively no longer an ARM designed component, so the
> >>> CoreSight specification requires that the DEVARCH register change to
> >>> show qualcomm as the designer, and the architecture value change to
> >>> represent this component.
> >>> DEVID should be used to allow the driver to pick up parameters such as
> >>> number of triggers as per the existing CTI component.
> >>>
> >>> If this component is Coresight compliant then the driver can use the
> >>> ID registers to configure to the extended trigger architecture.
> >>>
> >>> With complete remapping of most of the registers, and the dropping of
> >>> claim tag compatibility - which appears to be a breach of the
> >>> CoreSight specification - it may be better to have a completely
> >>> separate driver for this component.
> >>
> >> Good point. I'd like to confirm with the Qualcomm team: apart from the
> >> differences in register offsets and claim bits, does this CTI module
> >> have exactly the same bit layout and usage as CTI standard
> >> implementation?
> >>
> >> If yes, then from a maintenance perspective, we probably don't want to
> >> have two CTI drivers with identical register settings. It seems plausible
> >> to encapsulate register access and claim logic into several functions.
> >>
> >>    void cti_reg_writel(u32 val, struct cti_drvdata *drvdata, bool relax);
> >>    u32 cti_reg_readl(struct cti_drvdata *drvdata, bool relax);
> >>    int cti_claim_device(struct cti_drvdata *drvdata);
> >>    int cti_disclaim_device(struct cti_drvdata *drvdata, bool unlocked);
> >>
> >> Thanks,
> >> Leo
> >
> > The CTI supports 128 triggers  - which means many more registers to
> > enable / connect etc.
> > I need to study the changes to determine if there are functional
> > differences too.
> >
> > It might be feasible to divide the code into a common file and a pair
> > of variants so some is reused.
> >
> > Mike
> Thanks Mike & Leo & Suzuki.
>
> There is no register to show the version ID to distinguish between ARM
> CTI and QCOM extended CTI.I will double confirm with internal HW team.
>

Can you clarify here please.
The CID0-3, PID0-7, DEVARCH and DEVTYPE registers are part of the
CoreSight specification for component identification.
Can you confirm they are present on your component and the values they have.

If they are present then the CoreSight specification requires that
they be different than the standard ARM CTI.

Regards

Mike

> For extended CTI, only trigger number changes and claim logic. Other
> functions are the same as ARM CTI(bit layout of the register and usage)
>
> Thanks
> Jinlong Mao>
>
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

