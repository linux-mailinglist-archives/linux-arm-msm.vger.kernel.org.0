Return-Path: <linux-arm-msm+bounces-7028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9517782AEE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 13:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 436202857BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 12:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5477815AF9;
	Thu, 11 Jan 2024 12:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bOBVrCdl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C54154AE
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 12:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d4414ec9c7so26898025ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 04:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704977085; x=1705581885; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eHXpAer/Gbig3Qxr3W1gRcOiFSXPy6mJpjllrKqt6cY=;
        b=bOBVrCdlgt155OEeuM1XWe3aCK4Mdm9DJQSn3MYhokrCQGAo0/OmTWZVfLh5GFf7JC
         5bWyAnjA9cEfph8yBmO/xB8AwBS63I7MH4+WAlJJMH1GsjcaHQ779fWl01/EwGerV0dE
         FzAsZBjlR9n6MdfBwhkZ6yXoPhGPi8u9ZVtysQqefrWNn+4+PwTCeElAJBhG/GGXV/v8
         +lFX7mIWZx162tp3f/JsSDGA/PL4oghgWQemoD4jpDIa89QgzmgyyOQbK1Z+YmtzrOSO
         Yxl+pk7Mfl7jPVuiWizFCabZPoDGkWMT9ocKbKn5xFZS8eH8Qb+OXMIESMM3KJ8C9waG
         Zl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704977085; x=1705581885;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHXpAer/Gbig3Qxr3W1gRcOiFSXPy6mJpjllrKqt6cY=;
        b=L6Kte1qYMLSbJ3jWo6ufrAuSJ5vjUTM2p3BGYcspa66KVSVfwnnM9JN3tdTUI/PsZP
         mIr7tCI7rciTH+BQfwyIrR9+I4o/AREo2NYShulB3DPDM3LBAnFY63CQIVmVvQPNUmnl
         hfq8x15tWzCRrfHo1SnRWiIIYPoHSrHTDOS7/y0jyidczpVfDoUP6BC3moj2L+uaSiFj
         asnfOddB7TdfqoTLwDPiqw69IRXxnXxfoaxmSwfgIgLLu1eN/jSfN0JZ9nlnY408FTz+
         rVISYl7FyarDi0xGLdBecRWMfpZewssVZK7MUqcRMUHqD7/ALcZF09jv4P/2uRGYqWOm
         iX5w==
X-Gm-Message-State: AOJu0Ywq7z5esLQRk57od4e71LthklIStw91tYIdSEBC27SkycceDfTp
	rVAYj3uprg+rk/qK0UaFtpw5GIQe6dGM
X-Google-Smtp-Source: AGHT+IExsnY3r4rVK9uZ6AR+v3mI5VvQPQzDhaELlQG9P7CD6D+Fth/VaxdWKjyVXot9sI6vo5cVmQ==
X-Received: by 2002:a17:902:e844:b0:1d4:7685:90df with SMTP id t4-20020a170902e84400b001d4768590dfmr1191091plg.31.1704977084814;
        Thu, 11 Jan 2024 04:44:44 -0800 (PST)
Received: from thinkpad ([202.131.159.18])
        by smtp.gmail.com with ESMTPSA id j11-20020a170902690b00b001d3c27e00f2sm1072950plk.284.2024.01.11.04.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 04:44:43 -0800 (PST)
Date: Thu, 11 Jan 2024 18:14:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qrb2210-rb1: disable cluster power
 domains
Message-ID: <20240111124439.GB3003@thinkpad>
References: <20240111-qrb2210-rb1-no-cluster-idle-v1-1-cec14ec15b02@linaro.org>
 <20240111044508.GA3761@thinkpad>
 <CAA8EJpp+i58Z_QN4L1NRXoEcoRJNNu3S3JqeYgFP7LY-GBDP0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJpp+i58Z_QN4L1NRXoEcoRJNNu3S3JqeYgFP7LY-GBDP0w@mail.gmail.com>

On Thu, Jan 11, 2024 at 08:02:32AM +0200, Dmitry Baryshkov wrote:
> On Thu, 11 Jan 2024 at 06:45, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Thu, Jan 11, 2024 at 04:01:14AM +0200, Dmitry Baryshkov wrote:
> > > If cluster domain idle state is enabled on the RB1, the board becomes
> > > significantly less responsive. Under certain circumstances (if some of
> > > the devices are disabled in kernel config) the board can even lock up.
> > >
> > > It seems this is caused by the MPM not being pinged during CPU idle (in
> > > the same way the RPMh is pinged when cluster idle is entered).
> > >
> >
> > What does "ping" mean here? Please be more specific.
> 
> See rpmh_rsc_pd_callback(), rpmh_flush() and rpmh_rsc_write_next_wakeup().
> 
> RPMh driver (among other things) on entering the idle writes the next
> wake up time to the RPMh. The MPM driver in the vendor kernel does the
> same, see msm_mpm_timer_write() in msm-4.19
> 

Okay, thanks for the explanation. It'd be good if you have mentioned this in the
commit message as it is not obvious for one to understand what "ping" means.

- Mani

> >
> > - Mani
> >
> > > Disable cluster domain idle for the RB1 board until MPM driver is fixed
> > > to cooperate with the CPU idle states.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 18 ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> > > index aa53b6af6d9c..9a0308ef8b0f 100644
> > > --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> > > @@ -177,6 +177,24 @@ vph_pwr: regulator-vph-pwr {
> > >       };
> > >  };
> > >
> > > +&CPU_PD0 {
> > > +     /delete-property/ power-domains;
> > > +};
> > > +
> > > +&CPU_PD1 {
> > > +     /delete-property/ power-domains;
> > > +};
> > > +
> > > +&CPU_PD2 {
> > > +     /delete-property/ power-domains;
> > > +};
> > > +
> > > +&CPU_PD3 {
> > > +     /delete-property/ power-domains;
> > > +};
> > > +
> > > +/delete-node/ &CLUSTER_PD;
> > > +
> > >  &gpi_dma0 {
> > >       status = "okay";
> > >  };
> > >
> > > ---
> > > base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
> > > change-id: 20240111-qrb2210-rb1-no-cluster-idle-7bf43b3a0452
> > >
> > > Best regards,
> > > --
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > >
> >
> > --
> > மணிவண்ணன் சதாசிவம்
> 
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
மணிவண்ணன் சதாசிவம்

