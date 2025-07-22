Return-Path: <linux-arm-msm+bounces-66125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDF5B0DFCB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 17:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A76761886E0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0944C2E336F;
	Tue, 22 Jul 2025 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VwuRR2Ul"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB7B2D29D5
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753196188; cv=none; b=NhKG8JKmvXQqwq1mjTKn+7zmmrcmfI1A4EaaTe7OPtfURbVbzGxe7sv4OkpjovOpm0hzvyrU2aBJ4cpUPWQDWwQVxRxdxEDC8KYJu/BIRhKVJebewC82OI32wzu0d4VgKWgZvo5b/6YcJ18Ie3AFXnZ/NJIQJ/VJkUfAt1QF9h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753196188; c=relaxed/simple;
	bh=WqnTnTw6TCoxHuHJthXlpXJ+z1pEP+vq9By2ua6UOxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrULuForz1jXLaC978+Kw4lrRKVRXDDrWq5RudXdhD0v/NnMvm9lgG2zOaomJNFWRtNtDg3AWLDFbcLqTphNVheH/E0r/HsZr6IBvuP8RtZYR84dEApfRTl9S1IELpPonLT4gNI8g9Pv0oLNVFHCFhnusvzk8ko5q9sku2dSMOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VwuRR2Ul; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-313eeb77b1fso4645061a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753196186; x=1753800986; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7h3OZgOFOWka6Sh7FDs0lzIp/bOpR21bNansrj8i0UI=;
        b=VwuRR2Ul8aiHSjOyv8/HyjbxVVVxIIrmr9pB324xcFBx2f6N1Nk2peGJTrqaUWVXP9
         1Uc0XdfrhnGKWFBSSiaNhCDRIL2NLJInGb/hniSM0mJ+sn5Y/J3Y/X0ROdTMioNTJUMs
         eLJdjSsg+pIglYpQj9GKnEVoP/7SrbPFIQ7BJL0TUI2TF7GDzUT4n+kxbDbdqrJh4f5N
         aabBFPuqBVmi64W754KRW5qc2zHQhYJxuRGfVXd4ON9/qq0lqaFDW6FT74xZCUKqyREO
         niRO/CkP0dGxkC6T6K6TaPuQZ4FpVQ5afEonXddeENoksWlvhAgWLK/+ZEmvxTH8Xi5g
         4HgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753196186; x=1753800986;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7h3OZgOFOWka6Sh7FDs0lzIp/bOpR21bNansrj8i0UI=;
        b=cn4PEAUMUb/n7kyZLpM6rvy1zLsK/WHsk5qutB8xy61qHPzt8J+F7h5fj2SzFjgs0v
         JSmfnEFC5W0Vb4RVjSgrQwhhJu1MGW6xNHE9ogWSmiGkXPz4QwPziBZJV6RZTAS7B0Jg
         fc2CG5GldX88N5Bs2LZHJgJl+J0Lz2YshAQVL4QV1OuOUMpvHhWbievuveAZflx2JbPK
         Ogv5ieq+aRxQLvFa1nKVJuXdWcuYYxO5NLLDuharff/X3DYGwOdMYb2QYYijy6+2qut6
         9hjncsgmmjCE+az0LMitHouTA7YqLcqkoR4qwNhqMdIyAFytmLsop2cdTeXhOglCZVG0
         4MtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmblapv6g4cxMSBcFJSGZu83S45JkZQ5I6ig9d/PvSB2WXAV3vqrRaFuTx8YFN+e4o1ETmjE6bzH9rzThv@vger.kernel.org
X-Gm-Message-State: AOJu0YxvODn4ags7/g6mveMXQNOU000agDiFl0VKPb9NF72xX15NUjQU
	lUkD4di90sxqHaHeACsYN26P1fzRnpP09XNFseiJRP5So2kdY4IrncDm+P0xRpk71gPKR7cTqkm
	7R8zq3k4xfhkQUmNrOKXm90Cbuk9FjLl2NWhrk9rZpA==
X-Gm-Gg: ASbGncvdN2feYmwb/61BDhVjAifNAcMh9+2A3yzTdaTtT+QFX5iWmOcVqvzCwizzTz5
	gJROYi2uUDF5dY/+D1zeO7r3q0e9mO1J/R7XkQa1EehkE/Vqn77irpyt5ujddDTEOU9+3OTMqDr
	hgCurbWs4cRF4Uk/ZB8h4auKcakbQogPGWPT38Sjh0amCK6L7VCp0nH6JSo2W8DRqp7CitZFUXJ
	K9f3aDvj2M6d4J0omM=
X-Google-Smtp-Source: AGHT+IEtP/5IDxeEhazTc4DWcg8EKlmHm0Tqj8Htda07oJVKsZ40WoeXfhlC2Cn75AZLmjlrFZm0wdgsuvPCCu8Lrro=
X-Received: by 2002:a17:90b:1cc5:b0:312:e731:5a6b with SMTP id
 98e67ed59e1d1-31c9f4dfc33mr29080180a91.32.1753196186503; Tue, 22 Jul 2025
 07:56:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
 <20250722081405.2947294-2-quic_jinlmao@quicinc.com> <727fa9f4-fe25-495e-9d8d-48e504fbe6b0@arm.com>
 <20250722091425.GH3137075@e132581.arm.com> <CAJ9a7VhLLgAak_4FB=iW0izXprM4W+RsKfHUeo=XUHh9LwtUsA@mail.gmail.com>
 <20250722140659.GI3137075@e132581.arm.com>
In-Reply-To: <20250722140659.GI3137075@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 22 Jul 2025 15:56:15 +0100
X-Gm-Features: Ac12FXws7BfWiZMqb7msBA7EUd24M1rUoi_ExDpG7uyl5EzW-3UU03wnPpGedF8
Message-ID: <CAJ9a7ViUoSMV_HHKKRMhcQX=isU+feJvwCaVhu-6EBK4QXJbVg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add Qualcomm extended CTI
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mao Jinlong <quic_jinlmao@quicinc.com>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Yingchao Deng <quic_yingdeng@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Jul 2025 at 15:07, Leo Yan <leo.yan@arm.com> wrote:
>
> On Tue, Jul 22, 2025 at 01:00:18PM +0100, Mike Leach wrote:
>
> [...]
>
> > For a change of this magnitude to a CS component, that the ID
> > registers will also have to change. This is a requirement of the
> > Visible Component Architecture in the CoreSight specification.
> > External tools cannot see the device tree.
> >
> > This is effectively no longer an ARM designed component, so the
> > CoreSight specification requires that the DEVARCH register change to
> > show qualcomm as the designer, and the architecture value change to
> > represent this component.
> > DEVID should be used to allow the driver to pick up parameters such as
> > number of triggers as per the existing CTI component.
> >
> > If this component is Coresight compliant then the driver can use the
> > ID registers to configure to the extended trigger architecture.
> >
> > With complete remapping of most of the registers, and the dropping of
> > claim tag compatibility - which appears to be a breach of the
> > CoreSight specification - it may be better to have a completely
> > separate driver for this component.
>
> Good point. I'd like to confirm with the Qualcomm team: apart from the
> differences in register offsets and claim bits, does this CTI module
> have exactly the same bit layout and usage as CTI standard
> implementation?
>
> If yes, then from a maintenance perspective, we probably don't want to
> have two CTI drivers with identical register settings. It seems plausible
> to encapsulate register access and claim logic into several functions.
>
>   void cti_reg_writel(u32 val, struct cti_drvdata *drvdata, bool relax);
>   u32 cti_reg_readl(struct cti_drvdata *drvdata, bool relax);
>   int cti_claim_device(struct cti_drvdata *drvdata);
>   int cti_disclaim_device(struct cti_drvdata *drvdata, bool unlocked);
>
> Thanks,
> Leo

The CTI supports 128 triggers  - which means many more registers to
enable / connect etc.
I need to study the changes to determine if there are functional
differences too.

It might be feasible to divide the code into a common file and a pair
of variants so some is reused.

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

