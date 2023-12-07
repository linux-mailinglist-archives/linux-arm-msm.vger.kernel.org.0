Return-Path: <linux-arm-msm+bounces-3719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43735808902
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF4C628125F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78F0405CA;
	Thu,  7 Dec 2023 13:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NL7gs/wZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED7F7AA
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 05:20:43 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2866fe08b32so738440a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 05:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701955243; x=1702560043; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DYFq85X/BIHTHq7kGtptVxvPwKJGLk6dGCvTwIzJ+dU=;
        b=NL7gs/wZCgPM0rqMWLJdFyls4wCWZyBQQyfjvMC84YG2Bkhasgj2+Q03bPxaH+1M9p
         Kx4ETM2drEN9Mg71FE3bB1yA2MNOqE0oqKKAUPCEgBbgY2xC3E8naCQo+NyOHKuB5cuk
         SBitel0hghhFR9AVCngoF/UTJh8rgyYdZBGBwCFnk5Onn4vNCShyPz2byXL/AVLjp/+K
         I/HMbkQS/yt5Ib3RGawC3cuYKjyYfU7TaMmbQT0b1iv1IFR2xD9KsesDkPRiBWXrcB0F
         xr/igbZNYdeLtJUBQuL3so5LmJXxpgzeiygD3umPbyDc4K2CdT40DCQo1r4CcfONg2QD
         2ZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701955243; x=1702560043;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DYFq85X/BIHTHq7kGtptVxvPwKJGLk6dGCvTwIzJ+dU=;
        b=pbtWvWXYrAYizzvi+g0IeU/ZLpFnhukXHlhOJg2nc0Ap0ffESJd8GeorxH424NvAlr
         UGvQGIzGelErBljmA1y17PXv4Lx7qz1jxc5Hll6pEwFM9zZn+lA2XNwDff11zy9FC2+c
         2LnKVB5Wh650O/kLkjl2x23zUPrj9NNUmznxPyr7x9gRgrdGT4394G0u10m6hGP5v1Ok
         MWCMCvlB5EfKWfGg8KbfRfn9ZH91zEWPMXQGKaok3wKFtQHFz7Dh6aI1fTM9dYKvhqP1
         m2DqN+ZlQMpXJNZzGT0SdW8YSYSXJ+7NCeAkVNOlCUmjQx3HTXhunmcb7XJ5OadwYpGV
         m8/A==
X-Gm-Message-State: AOJu0Yye22+ExvIVsxpF2uh1yQZE98gXq4jdOYd0VtKrJAnNtsw+6DvZ
	79niHPz9Op76JC2xJgqqv1QH
X-Google-Smtp-Source: AGHT+IGkgup8HVw36DeNUf8Hl9xmr9ZQZ/zGq74w+jN8tcKimhg+P7eKKuGTOsm5hdUE53L9XXKyEA==
X-Received: by 2002:a17:90a:8c0b:b0:286:f5f1:309a with SMTP id a11-20020a17090a8c0b00b00286f5f1309amr2090274pjo.81.1701955243349;
        Thu, 07 Dec 2023 05:20:43 -0800 (PST)
Received: from thinkpad ([117.248.6.133])
        by smtp.gmail.com with ESMTPSA id ju1-20020a170903428100b001cfc030da6bsm1359638plb.253.2023.12.07.05.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:20:42 -0800 (PST)
Date: Thu, 7 Dec 2023 18:50:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
	quic_skananth@quicinc.com, quic_vpernami@quicinc.com,
	quic_parass@quicinc.com
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: qcom,qmp: Add PCIe
 qcom,refclk-always-on property
Message-ID: <20231207132032.GL2932@thinkpad>
References: <20231201060716.GJ4009@thinkpad>
 <166d307e-7d1b-48b5-90db-9b6df01d87c2@linaro.org>
 <20231201111033.GL4009@thinkpad>
 <f844cd1e-7e4f-4836-bc9a-2e1ed13f064f@linaro.org>
 <20231201123054.GM4009@thinkpad>
 <3a7376aa-18a2-41cb-a4c9-680e735ce75b@linaro.org>
 <20231206131009.GD12802@thinkpad>
 <ZXGVjY9gYMD6-xFJ@hovoldconsulting.com>
 <20231207101252.GJ2932@thinkpad>
 <ZXHDCNosx8PCUzao@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZXHDCNosx8PCUzao@hovoldconsulting.com>

On Thu, Dec 07, 2023 at 02:05:12PM +0100, Johan Hovold wrote:
> On Thu, Dec 07, 2023 at 03:42:52PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Dec 07, 2023 at 10:51:09AM +0100, Johan Hovold wrote:
> > > On Wed, Dec 06, 2023 at 06:40:09PM +0530, Manivannan Sadhasivam wrote:
> > > 
> > > > OK. How about, "qcom,broken-refclk"? This reflects the fact that the default
> > > > refclk operation is broken on this platform, so the OS should be prepared for
> > > > it (by keeping it always on).
> > > 
> > > Shouldn't that be
> > > 
> > > 	qcom,broken-clkreq
> > > 
> > > since its the CLKREQ# signal used to request REFCLK that is broken, not
> > > the REFCLK itself?
> > > 
> > 
> > Darn... You are right. I got carried away by the initial property name. Thanks
> > for spotting!
> 
> Thinking some more on this after hitting send: It may still be wrong
> with a 'broken-clkreq' property in the PHY instead of in the controller
> (or endpoint).
> 
> Could there not be other ways to handle a broken clkreq signal so that
> this really should be a decision made by the OS, for example, to disable
> L1 substates and clock PM?
> 

One has to weigh the power consumption between keeping refclk always on and
disabling L1SS. Chaitanya, can you measure power consumption in both cases?

> Simply leaving the refclk always on in the PHY seems like a bit of a
> hack and I'm not even sure that can be considered correct.
> 

I wouldn't agree it is a hack, even though it may sound like one. The option to
keep refclk always on in the PHY is precisely there for usecase like this.

- Mani

> Having a property that maps directly to that behaviour has rightly been
> rejected, but it seems that simply renaming the flag but keeping it in
> the PHY may still not be the right thing to do here.
> 
> Johan

-- 
மணிவண்ணன் சதாசிவம்

