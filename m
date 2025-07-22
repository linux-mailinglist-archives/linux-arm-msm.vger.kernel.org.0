Return-Path: <linux-arm-msm+bounces-66059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B575DB0D8BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D59141884F88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 12:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8827528A1D5;
	Tue, 22 Jul 2025 12:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mZISTQk5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D406B2356DA
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753185632; cv=none; b=Y6Uik44fp7cNMEzJzCaMJ/91lbYz0Kow6h19e9PJt+6/+03AzhyAPpqFK5b20pyWjRdFD4KSGtoUymg6Q4apclrRSSf87OO6VF7lAN7H8dlDWcYCPTbrR/gR9azCu5OVr91pUv7mViYYb3VHyJBqVeLvlVoJLc6dz7yrLFH1lk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753185632; c=relaxed/simple;
	bh=TyKN+XzYCkV6rwuA3vy4eTsqF3nFqVxpsgelQW7FRPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ny+MlRrGWCKWEVZrEho2tdrcpcn0imqxaZj+htaP0qIWCq4eF3r472el4riPVNq4fVWbmnhdEMPrud5YtBI3BARDd8aK8+pEFBZwqWHKcyxRxq/NdPgHM+cIyESY/Ghv05Ux3WchJgeGc8n536682iNhqqjBXiLQMMFOGVGNOzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mZISTQk5; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-75bd436d970so1337134b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 05:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753185630; x=1753790430; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ptH7TdqJ1a9RBPR6TZDZBqzzcIS8gfN8+gNc7Nchtao=;
        b=mZISTQk5ifn97Cs+yFblJMTrviWVKG6QQSiD+iA8OMiMRBYkg8b+LdCspi0PCwHWQ0
         jqd+rYEbohqtz8veSa2zResH6/d/pcvlfHQZgaapnbVlhTU0gtZhHxNpnavAp95dM7Pb
         gPOg4WTG//4iO97V6NPkEETpUzvYci3JosnJNb+aCO2CAsxtyXHvn6x2+qsDXuFFMTyv
         aiFfw8lwb9r/fRQDeqKsElYQwo3q6EtOhzHj4bfeVJg7pYLXyoMyC0SiIZ3SfHtJIOXQ
         IFv1raMvPBMck/ZkEaq0AazukXEfBTclmTIoxMEvLXnBR/OCVzICYs22CXiFYla738z4
         0CJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753185630; x=1753790430;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptH7TdqJ1a9RBPR6TZDZBqzzcIS8gfN8+gNc7Nchtao=;
        b=IQueEYe6HK7OCmzXnMvwXibt0zik2ABvv6I3aVZ8Po8FvR1MhnMqIua0wl61trl7zb
         bBRuF4nVaCpv20esYf9zjAxiY7+HJvZEsUpHKDOa7YhXKcJQ9363hN/3POcF3kUJtUoS
         wPU81kQB9yrf+JNplsKKdZ+EWQzvLwPtq6j5vT9CYPbzKPO8oWdTVebMZIM9HWoGa4rE
         mye3beAq7cHzAheQ/wiPXH/ee6I+igoA6bvpT2aq+FB6YFDlKBBAwfZEhj8pwfkG6bcb
         vrCvLrM61+O2sI8u+LZa9/LHE0f5qO/tLhja/XAFxLo8jmyM4hla/oFHJAUI3HZtioJ1
         36mA==
X-Forwarded-Encrypted: i=1; AJvYcCXaFsA1pRIFO4Tz4SvqpGHX2LLu+GbLo7rWKtcHWLyvylHj0/NBfhP2CzQccbKalpjmAm/zsuv92yvp+96o@vger.kernel.org
X-Gm-Message-State: AOJu0YylIT3g1bfWqV0mxMZ9iPj8q2wOHFVisPZrx5bXZnTUlqz8qR59
	0G3zhIyP2JdgB4FrUunU/j5cLPZ9dXANGIAaF3xzej4G4dy95IZZpw7+s5DJdNc+XmBv85zmvJT
	er5mWoBLIUPg/kOu4dCyDaErw3yDzVEN7ATHEvAu85A==
X-Gm-Gg: ASbGncuElbXeF/FJBgGqGBtzzZzUv5ql6daTxRb5P6sMqDbOn8VfftKDozbtsU3X4iW
	fFhVS4gyrA53FKwGtOIRdjFfZZLCA0f8Vt0bJQ963aC+vzOoRruv2ytD2hIxZCJ7jEbEsau87da
	KbALRV2CpDkwSIcP2PufmAy2drCxsvGAspkSh/PfWw4R4LGSt6r8kiLZmZOvBfOPhM5oa3pzzG6
	7iV3TxW
X-Google-Smtp-Source: AGHT+IGTyCeY3UMh/uN26NrX+9pLVitYu44Yg1Cv05hntn0WmZXzyYQmgf2Srl3Zso4XLkxJAtt8NFNBvWJVP5c1/co=
X-Received: by 2002:a05:6a21:6016:b0:1ee:a914:1d67 with SMTP id
 adf61e73a8af0-23810e50f83mr36040966637.2.1753185629855; Tue, 22 Jul 2025
 05:00:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
 <20250722081405.2947294-2-quic_jinlmao@quicinc.com> <727fa9f4-fe25-495e-9d8d-48e504fbe6b0@arm.com>
 <20250722091425.GH3137075@e132581.arm.com>
In-Reply-To: <20250722091425.GH3137075@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 22 Jul 2025 13:00:18 +0100
X-Gm-Features: Ac12FXxwWOJchARr8CvJVCGpP9c_3WusEBTfWMpJDyd4T_uRT6DBiailwW2ufC8
Message-ID: <CAJ9a7VhLLgAak_4FB=iW0izXprM4W+RsKfHUeo=XUHh9LwtUsA@mail.gmail.com>
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

Hi

On Tue, 22 Jul 2025 at 10:14, Leo Yan <leo.yan@arm.com> wrote:
>
> On Tue, Jul 22, 2025 at 09:49:28AM +0100, Suzuki Kuruppassery Poulose wrote:
> > On 22/07/2025 09:14, Mao Jinlong wrote:
> > > From: Yingchao Deng <quic_yingdeng@quicinc.com>
> > >
> > > Add Qualcomm extended CTI support in CTI binding file. Qualcomm
> > > extended CTI supports up to 128 triggers.
> > >
> > > Signed-off-by: Yingchao Deng <quic_yingdeng@quicinc.com>
> > > Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> > > ---
> > >   Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> > > index 2d5545a2b49c..1aa27461f5bc 100644
> > > --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> > > @@ -84,7 +84,9 @@ properties:
> > >             - const: arm,coresight-cti
> > >             - const: arm,primecell
> > >         - items:
> > > -          - const: arm,coresight-cti-v8-arch
> > > +          - enum:
> > > +              - arm,coresight-cti-v8-arch
> > > +              - qcom,coresight-cti-extended
> >
> > Why not call it qcom,coresight-cti ?
> >
> > There are no other "qcom,coresight-cti", so "extended" is not required.
> > Is this specific to CPU (i.e., CPU bound) ?
>
> I roughly went through the second path. Combining two patches in this
> series, I am wandering if can directly check registers (e.g. PID/CID)
> to find CTI with qcom extension. If so, you do not need an extra DT
> binding, right?
>
> Thanks,
> Leo
>
> > Suzuki
> >
> > >             - const: arm,coresight-cti
> > >             - const: arm,primecell
> >
> > _______________________________________________
> > CoreSight mailing list -- coresight@lists.linaro.org
> > To unsubscribe send an email to coresight-leave@lists.linaro.org

For a change of this magnitude to a CS component, that the ID
registers will also have to change. This is a requirement of the
Visible Component Architecture in the CoreSight specification.
External tools cannot see the device tree.

This is effectively no longer an ARM designed component, so the
CoreSight specification requires that the DEVARCH register change to
show qualcomm as the designer, and the architecture value change to
represent this component.
DEVID should be used to allow the driver to pick up parameters such as
number of triggers as per the existing CTI component.

If this component is Coresight compliant then the driver can use the
ID registers to configure to the extended trigger architecture.

With complete remapping of most of the registers, and the dropping of
claim tag compatibility - which appears to be a breach of the
CoreSight specification - it may be better to have a completely
separate driver for this component.

Regards


Mike

--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

