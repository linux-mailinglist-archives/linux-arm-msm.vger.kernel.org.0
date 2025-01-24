Return-Path: <linux-arm-msm+bounces-46036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B6DA1B0B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 08:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08E953AAE9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 07:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085E61DA2FD;
	Fri, 24 Jan 2025 07:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2LADKZB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DE233998
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 07:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737702517; cv=none; b=axRJlC+aLC+rTSvw+OWxFtS02/ITuWglZyJbmQfuWKP7OoJvhKPLrRh7XhQUuJ4j8Qstg+miCjcftUscys+jacCs/PGpvE9gd0oil1REpnKO/NEd1z6pIT8ZToqEekLu19CGZ8MN+BPBH5DNDjoijku/W4Wo4MXEJxGlflAnJxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737702517; c=relaxed/simple;
	bh=bbWuCKzdRDfHke4jR912REo6Gk6j7bDUt2JZed/wDBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+vFSYlrLoSk2jk1EVze24dSCnJXLowFwwdV8ZdwlG1yC/4LDUjGD19nY+UbENVx4mOsMApB3Q0aA0fP4pXKqnNxQAg91AQw06LN9cn7lpWmkgB6Wrc4HME/GY85H2UYZ0o+esa0bjmTV+BL38SyrV2ud5kLdwxZjK7cXi4xl/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2LADKZB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240F2C4CED2;
	Fri, 24 Jan 2025 07:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737702517;
	bh=bbWuCKzdRDfHke4jR912REo6Gk6j7bDUt2JZed/wDBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d2LADKZB5awe3E0KMAb3m5f9NjSPkC9DH/VLGN6cMHwqMtZXpi4/9NTdBt0EluiMq
	 slXh8EcPydHRtWf0dlsdC8gIUCEqqhlTo4MkyQ2hYA3lrZ6h+YmWOMpJvVQizSMBq7
	 06JqtcgBPkle3IiJd7QTWiid23ki806rOBPhWmD2Eg5TP4ckQ7pHRFl/s8Vxx3JAGD
	 OJyqGJM7BIDQvbMyzNsYE1zz9Iosn1zBLfWSDCv5I27y5p8eVFeoVrdYatifR1C0+G
	 +Ce0+1UcAehyiUzs/5SmwLZ5BhAXdT5J+hC2vOhPnR6kcLnGdGZa+nZXLlZ+5K9PDD
	 +8ytgqq6vZ28A==
Date: Fri, 24 Jan 2025 12:38:29 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	"Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>,
	vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de,
	abel.vesa@linaro.org, neil.armstrong@linaro.org,
	manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
Message-ID: <20250124070829.oar3hlkshkpam57d@thinkpad>
References: <20250121094140.4006801-1-quic_wenbyao@quicinc.com>
 <20250121094140.4006801-3-quic_wenbyao@quicinc.com>
 <CAA8EJppXQpDrdXzJsTE7HWs=POt7yFAw0JVZFabN6Ks3fhZiWQ@mail.gmail.com>
 <a2cc5a5a-6cbd-7564-a8df-8af2a652de2f@quicinc.com>
 <ya27ma6iah7ts6sj35payj6ek4z7m6y5v4pnxd6wtqrp3cbyta@ypvrzwa4bnfv>
 <188a9efd-718e-4ac5-b89a-29f2713e1dba@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <188a9efd-718e-4ac5-b89a-29f2713e1dba@quicinc.com>

+ Mayank (with whom I discussed this topic internally)

On Fri, Jan 24, 2025 at 02:22:01PM +0800, Qiang Yu wrote:
> 
> On 1/22/2025 5:43 PM, Dmitry Baryshkov wrote:
> > On Wed, Jan 22, 2025 at 03:17:39PM +0800, Wenbin Yao (Consultant) wrote:
> > > On 1/21/2025 6:36 PM, Dmitry Baryshkov wrote:
> > > > On Tue, 21 Jan 2025 at 11:43, Wenbin Yao <quic_wenbyao@quicinc.com> wrote:
> > > > > From: Qiang Yu <quic_qianyu@quicinc.com>
> > > > > 
> > > > > Currently, BCR reset and PHY register setting are mandatory for every port
> > > > > before link training. However, some QCOM PCIe PHYs support no_csr reset.
> > > > > Different than BCR reset that is used to reset entire PHY including
> > > > > hardware and register, once no_csr reset is toggled, only PHY hardware will
> > > > > be reset but PHY registers will be retained,
> > > > I'm sorry, I can't parse this.
> > > The difference between no_csr reset and bcr reset is that no_csr reset
> > > doesn't reset the phy registers. If a phy is enabled in UEFI, its registers
> > > are programed. After Linux boot up, the registers will not be reset but
> > > keep the value programmed by UEFI if we only do no_csr reset, so we can
> > > skip phy setting.
> > Please fix capitalization of the abbreviations (PHY, BCR) and add
> > similar text to the commit message.
> > 
> > > > > which means PHY setting can
> > > > > be skipped during PHY init if PCIe link was enabled in booltloader and only
> > > > > no_csr is toggled after that.
> > > > > 
> > > > > Hence, determine whether the PHY has been enabled in bootloader by
> > > > > verifying QPHY_START_CTRL register. If it is programmed and no_csr reset is
> > > > > present, skip BCR reset and PHY register setting, so that PCIe link can be
> > > > > established with no_csr reset only.
> > > > This doesn't tell us why we want to do so. The general rule is not to
> > > > depend on the bootloaders at all. The reason is pretty simple: it is
> > > > hard to update bootloaders, while it is relatively easy to update the
> > > > kernel. If the hardware team issues any kind of changes to the
> > > > programming tables, the kernel will get them earlier than the
> > > > bootloader.
> > > With this change, we don't need to upstream phy setting for all phys
> > > support no_csr reset, this will save a great deal of efforts and simplify
> > > the phy driver. Our goal is to remove proprietary PCIe firmware operations
> > > from kernel. PHY is just the start and will be followed by controller,
> > > clocks, regulators, etc. If program table need to be changed, the place to
> > > do that will be UEFI.
> > Well, that sounds like a very bad idea. Please don't do that. Linux
> > kernel drivers should not depend on the UEFI or a bootloader. Unless
> > there is a good reason for that, Linux should continue to be able to
> > reset and program the PCIe PHY (as well as all other hw blocks).
> I'm wondering if it's really necessary for Linux to be able to program the
> PHY. Perhaps Linux should only care about common aspects defined by the
> PCIe spec like bus scanning, BAR space allocation, and functions provided
> by other PCIe capabilities. As for the specific operations that are
> different on various platforms, it might be more appropriate for the
> firmware to take care of them. This way, the responsibilities can be more
> clearly divided, and the driver could potentially be
> more streamlined.
> 

It is not necessary in an ideal world, but what we have seen is Qcom releasing
updated PHY init sequence after upstreaming the initial PHY driver support. In
that case, the devices with old firmware will become outdated unless the fw is
updated (which is not straightforward compared to updating the kernel).

But, I do like this idea of reusing the PHY init sequence in the kernel. Though
we cannot just do it for all platforms. Maybe we can enable it on platforms like
compute starting from X1E and see how it goes? Just to minimize the impact if it
didn't go well.

> On the other hand, since the no_csr reset can retain register values,
> maybe we should still make full use of it, even if we don't want to
> rely on UEFI. For example, during runtime suspend/resume
> (the D3cold -> D0 cycle)

D3Cold during runtime suspend in bizarre.

>, when re-initializing the PHY, same PHY
> settings will be programmed again. This is a bit redundant.
> 

Hmm, what would happen if the CX collapse happens during system suspend? Will
the PHY registers be retained?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

