Return-Path: <linux-arm-msm+bounces-3233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AB9803180
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 12:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C296D280ED6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 11:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2079E22EF6;
	Mon,  4 Dec 2023 11:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hZMmZlnq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61359C
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 03:29:05 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40c09dfa03cso11214165e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 03:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701689344; x=1702294144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9qpcl1LzmxT9f5tQeRRwg71cpVw9T4IVTGE6Uh/UwRg=;
        b=hZMmZlnqdtoiyGrpK7tyO2jAb9fhCQ6wd6JVMKH10e5fn9xikeX2emtBc/bUwU1nZs
         5arfsBnwytfNYtfRPhpnb4Kh6zhEaywM+jbmEtUwXFaWQC5+uLeotJXEbZdD6bTu5YyP
         pDMHj3j+X8m+mzMM2SA7pMoupIH+qIZhMEV0CHvYHtrg5b0UnAK4pS4jJmBwbhSZfgDt
         3Vw+9f2Ww9Vz+VyVZwVjIQMoVCt0wNvlnJBXC8poAr+cbeGdRpTr4orr5Y/xYouqHDhy
         fNFogl5F6L//DT/bvx/wSPU6w893rgTVPeTTaJfCjQTZuxvKudxqka1fNGQyqIIt/RIm
         Mwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701689344; x=1702294144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qpcl1LzmxT9f5tQeRRwg71cpVw9T4IVTGE6Uh/UwRg=;
        b=P7akkAlI5PgIzLn6EEMD2KB0Pu23XgE4Q3J3gjgYpvqI45dmZDEHUjAGSDVSu+J8Co
         uRb3sJN0mlcg8QdfyHibD6lpnlSbvpbjZifD7SGEHVpA7QpaDMNYxhrGlePYPMYfvq9h
         yoHRBynQ9eqzurfjQaiNSOMmxTwi7YCPwIz77iaBHbalC8FR0VPCJzhe1Sf0Sj6TIKUq
         BzWMbVoNKlSdog4TZyik6h0vFAt6P5kHLMq+Yl1Mghh910Yc157TxLxsbEvCj3u4cdRi
         18/InFFbFsEL+SH6428iG0tZBNTJs6c6ZGtZUUdkgI8+i7WQZlkxLJqjm0WbijgZTtyH
         w3BQ==
X-Gm-Message-State: AOJu0Yx5pP/QPaQ2Qs4erdqYz/IUeU8um49y8xVt5lWJAi3ffmJmJl1Z
	kSKYEA8TagKT0H5Q9YI3ZbcwFg==
X-Google-Smtp-Source: AGHT+IFIeHl8tQ97S00ErYokGEb3QRC/5rN0sbxkKGXJpjkxYbsKvilp4T38N4X/ri9J+zArVgE5Yw==
X-Received: by 2002:a05:600c:3ba9:b0:408:37aa:4766 with SMTP id n41-20020a05600c3ba900b0040837aa4766mr2516553wms.5.1701689344331;
        Mon, 04 Dec 2023 03:29:04 -0800 (PST)
Received: from linaro.org ([82.77.85.67])
        by smtp.gmail.com with ESMTPSA id r21-20020a05600c35d500b0040b3e79bad3sm14655959wmq.40.2023.12.04.03.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 03:29:03 -0800 (PST)
Date: Mon, 4 Dec 2023 13:29:02 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] phy: qcom-qmp: qserdes-txrx: Add some more v6.20
 register offsets
Message-ID: <ZW23/jPxofGw9GnY@linaro.org>
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
 <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-2-d9340d362664@linaro.org>
 <CAA8EJpr2HhiXEbp0QsN-qB+L4WQWiV3o2yCc-f5oqdhdKZGL9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpr2HhiXEbp0QsN-qB+L4WQWiV3o2yCc-f5oqdhdKZGL9A@mail.gmail.com>

On 23-11-22 12:12:00, Dmitry Baryshkov wrote:
> On Wed, 22 Nov 2023 at 12:04, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > Add some missing v6.20 registers offsets that are needed by the new
> > Snapdragon X Elite (X1E80100) platform.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h
> > index 5385a8b60970..7402a94d1be8 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h
> > @@ -14,11 +14,14 @@
> >  #define QSERDES_V6_20_TX_LANE_MODE_3                           0x80
> >
> >  #define QSERDES_V6_20_RX_UCDR_FO_GAIN_RATE_2                   0x08
> > +#define QSERDES_V6_20_RX_UCDR_SO_GAIN_RATE_2                   0x18
> >  #define QSERDES_V6_20_RX_UCDR_FO_GAIN_RATE_3                   0x0c
> 
> As a side note, this should be probably 0x1c. Could you please verify
> it and send a fix?
> 

Double checked. The values are correct. So I'll just put the
SO_GAIN_RATE_2 below FO_GAIN_RATE_3.

> >  #define QSERDES_V6_20_RX_UCDR_PI_CONTROLS                      0x20
> >  #define QSERDES_V6_20_RX_UCDR_SO_ACC_DEFAULT_VAL_RATE3         0x34
> >  #define QSERDES_V6_20_RX_IVCM_CAL_CTRL2                                0x9c
> >  #define QSERDES_V6_20_RX_IVCM_POSTCAL_OFFSET                   0xa0
> > +#define QSERDES_V6_20_RX_DFE_1                                 0xac
> > +#define QSERDES_V6_20_RX_DFE_2                                 0xb0
> >  #define QSERDES_V6_20_RX_DFE_3                                 0xb4
> >  #define QSERDES_V6_20_RX_VGA_CAL_MAN_VAL                       0xe8
> >  #define QSERDES_V6_20_RX_GM_CAL                                        0x10c
> > @@ -41,5 +44,6 @@
> >  #define QSERDES_V6_20_RX_MODE_RATE3_B4                         0x220
> >  #define QSERDES_V6_20_RX_MODE_RATE3_B5                         0x224
> >  #define QSERDES_V6_20_RX_MODE_RATE3_B6                         0x228
> > +#define QSERDES_V6_20_RX_BKUP_CTRL1                            0x22c
> >
> >  #endif
> >
> > --
> > 2.34.1
> >
> >
> 
> 
> -- 
> With best wishes
> Dmitry

