Return-Path: <linux-arm-msm+bounces-855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2DC7EED41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 09:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F750B20AB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 08:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB03DF69;
	Fri, 17 Nov 2023 08:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLbxMLKq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C004FBFF;
	Fri, 17 Nov 2023 08:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10639C433C9;
	Fri, 17 Nov 2023 08:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700208636;
	bh=Sp+Yq9p97aTc8MUbIdNZJygJ6geUY1h1i1/p9budoWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLbxMLKq0lNgG9N/Ba88EMFlKtbxc8Oj21pGhiTvxuXKnarkvsW83GnoqStVsJaHn
	 BvtW0+bhg0tqx7pUzV3dzpaCWPs9beLTlc2epp8lXc7igFYprVGqwYUI4wz1rmaYfA
	 xyl3Dl7YUM+tp4vHsPPvMzR+0jmolWSvyU9NVMr0DEhhVv02dUyf+r4m7ZMjoQnNk4
	 2jg18MSAXyCPG3BfJMJYqQGZOt/qyJqE9mNxJZ169Aj+QrAiyTP+21tlHZrNVmS7rb
	 +bhoiqQjwX6ZQn7FpS81C1M1V4lxDW1KFI3XKnFzpvAC9CmBBke4IhnosNBkngC7Vs
	 XMgApAwYJHzIA==
Date: Fri, 17 Nov 2023 13:40:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Mrinmay Sarkar <quic_msarkar@quicinc.com>, agross@kernel.org,
	andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com,
	quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com, robh@kernel.org,
	quic_krichai@quicinc.com, quic_vbadigan@quicinc.com,
	quic_parass@quicinc.com, quic_schintav@quicinc.com,
	quic_shijjose@quicinc.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 1/3] PCI: qcom: Enable cache coherency for SA8775P RC
Message-ID: <20231117081025.GF10361@thinkpad>
References: <1700051821-1087-1-git-send-email-quic_msarkar@quicinc.com>
 <1700051821-1087-2-git-send-email-quic_msarkar@quicinc.com>
 <CAA8EJprWP3ThYyPZDF7ddG9Awdk9D7ovxes--r0VS3Ma53VqxA@mail.gmail.com>
 <CAA8EJprouEiex2YGuMjJCmwiWmhbYXaUpTBkWhEXpF08iGzk6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJprouEiex2YGuMjJCmwiWmhbYXaUpTBkWhEXpF08iGzk6Q@mail.gmail.com>

On Wed, Nov 15, 2023 at 03:21:26PM +0200, Dmitry Baryshkov wrote:
> On Wed, 15 Nov 2023 at 15:18, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, 15 Nov 2023 at 14:37, Mrinmay Sarkar <quic_msarkar@quicinc.com> wrote:
> > >
> > > This change will enable cache snooping logic to support
> > > cache coherency for 8775 RC platform.
> > >
> > > Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-qcom.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > index 6902e97..b82ccd1 100644
> > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > @@ -51,6 +51,7 @@
> > >  #define PARF_SID_OFFSET                                0x234
> > >  #define PARF_BDF_TRANSLATE_CFG                 0x24c
> > >  #define PARF_SLV_ADDR_SPACE_SIZE               0x358
> > > +#define PCIE_PARF_NO_SNOOP_OVERIDE             0x3d4
> > >  #define PARF_DEVICE_TYPE                       0x1000
> > >  #define PARF_BDF_TO_SID_TABLE_N                        0x2000
> > >
> > > @@ -117,6 +118,10 @@
> > >  /* PARF_LTSSM register fields */
> > >  #define LTSSM_EN                               BIT(8)
> > >
> > > +/* PARF_NO_SNOOP_OVERIDE register fields */
> > > +#define WR_NO_SNOOP_OVERIDE_EN                 BIT(1)
> > > +#define RD_NO_SNOOP_OVERIDE_EN                 BIT(3)
> > > +
> > >  /* PARF_DEVICE_TYPE register fields */
> > >  #define DEVICE_TYPE_RC                         0x4
> > >
> > > @@ -961,6 +966,14 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
> > >
> > >  static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
> > >  {
> > > +       struct dw_pcie *pci = pcie->pci;
> > > +       struct device *dev = pci->dev;
> > > +
> > > +       /* Enable cache snooping for SA8775P */
> > > +       if (of_device_is_compatible(dev->of_node, "qcom,pcie-sa8775p"))
> >
> > Quoting my feedback from v1:
> >
> > Obviously: please populate a flag in the data structures instead of
> > doing of_device_is_compatible(). Same applies to the patch 2.
> 
> Mani, I saw your response for the v1, but I forgot to respond. In my
> opinion, it's better to have the flag now, even if it is just for a
> single platform. It allows us to follow the logic of the driver and
> saves few string ops.
> 

Ok, I do not have a strong opinion on this.

- Mani

> >
> >
> > > +               writel(WR_NO_SNOOP_OVERIDE_EN | RD_NO_SNOOP_OVERIDE_EN,
> > > +                               pcie->parf + PCIE_PARF_NO_SNOOP_OVERIDE);
> > > +
> > >         qcom_pcie_clear_hpc(pcie->pci);
> > >
> > >         return 0;
> > > --
> > > 2.7.4
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry
> 
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
மணிவண்ணன் சதாசிவம்

