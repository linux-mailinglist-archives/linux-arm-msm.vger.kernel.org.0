Return-Path: <linux-arm-msm+bounces-43274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C079FC1C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 20:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8413165E5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 19:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE51D212B3C;
	Tue, 24 Dec 2024 19:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1Niv7LR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3213EA76;
	Tue, 24 Dec 2024 19:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735069339; cv=none; b=We5qCIfqHMMIEyXbihvdzhWMKtvrvIYO5DRo63z3xduxo3WylKktGx998ueo9Fb9cdnnTl4/BO+jrMKqvgpA+cVx8SD6S4CTb+RG64UmyryvoLW+mJa8P0sqejyc1rR7os43PeF/PUYQdw+GUBlb0LfbjPlsbcfulHshe75hJi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735069339; c=relaxed/simple;
	bh=JrZT6Hk1aPlHYydr+/4h5NOAxAcjwjSCgl97/aJtbwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1vs1Kil239CYi6q//NQZTxTh718jG8jcnqJELv86EITobhoGWlvnHL1f2axTbWVQW4M4negCTOKiG3fJdqAfNjmB0Cp2EZeeVIKYZA6EVdsFnJf+DdGG91csZcyDm60q7ZY6bGlZbUmj7FxIFAtWHgfh60ck/b2fK9GuZAPt7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1Niv7LR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB85C4CED0;
	Tue, 24 Dec 2024 19:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735069339;
	bh=JrZT6Hk1aPlHYydr+/4h5NOAxAcjwjSCgl97/aJtbwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R1Niv7LRgpX1zrJavq1++z7ooV05u6dnjP/6+41g/K27CvwJgzUan3LHDP4U7jVWP
	 jwXDa6TZQAIIHaqJOezU9lW1vnUg6VMLQfgSbF0R7OtcmwLdpXmk5UA2GgJs0mI2l/
	 k1buHJMS7rUtwppUmgBLinf0Tss0ayTpYZumoXkKMaq74NKzQwtBrM0xZJ1EHFahuy
	 H4kgwzLCdcrmVFi99U7R+1esQ/4PjHQSGMgBF9p99kmj+z5+7PJRchGPqevtfC0QHO
	 qS50yzuj30km8q8Zhw/V8xyKlOrQrK82+hSlnrrPrToPl+uS2ueDMAfzsgsFAi7aD2
	 TUulHmhpqQZWA==
Date: Wed, 25 Dec 2024 01:12:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, quic_ppratap@quicinc.com,
	quic_jackp@quicinc.com
Subject: Re: (subset) [PATCH v3 0/3] Add support for USB controllers on QCS615
Message-ID: <Z2sOl9ltv0ug4d82@vaman>
References: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
 <173505391861.950293.11120368190852109172.b4-ty@kernel.org>
 <anfqf3jvh7timbvbfqfidylb4iro47cdinbb2y64fdalbiszum@2s3n7axnxixb>
 <Z2sJK9g7hiHnPwYA@vaman>
 <i7gptvn2fitpqypycjhsyjnp63s2w5omx4jtpubylfc3hx3m5l@jbuin5uvxuoc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <i7gptvn2fitpqypycjhsyjnp63s2w5omx4jtpubylfc3hx3m5l@jbuin5uvxuoc>

On 24-12-24, 21:33, Dmitry Baryshkov wrote:
> On Wed, Dec 25, 2024 at 12:49:07AM +0530, Vinod Koul wrote:
> > On 24-12-24, 17:38, Dmitry Baryshkov wrote:
> > > On Tue, Dec 24, 2024 at 08:55:18PM +0530, Vinod Koul wrote:
> > > > 
> > > > On Tue, 24 Dec 2024 14:16:18 +0530, Krishna Kurapati wrote:
> > > > > This series aims at enabling USB on QCS615 which has 2 USB controllers.
> > > > > The primary controller is SuperSpeed capable and secondary one is
> > > > > High Speed only capable. The High Speed Phy is a QUSB2 phy and the
> > > > > SuperSpeed Phy is a QMP Uni Phy which supports non-concurrent DP.
> > > > > 
> > > > > Link to v1:
> > > > > https://lore.kernel.org/all/20241014084432.3310114-1-quic_kriskura@quicinc.com/
> > > > > 
> > > > > [...]
> > > > 
> > > > Applied, thanks!
> > > > 
> > > > [2/3] phy: qcom-qusb2: Add support for QCS615
> > > >       commit: 8adbf20e05025f588d68fb5b0fbbdab4e9a6f97e
> > > 
> > > Is there any issue with the two remaining patches?
> > 
> > Something wrong with b4... I have applied 2 & 3
> > Patch 1 should go thru USB tree
> 
> Hmm, strange. But then, please excuse my ignorance, do we have bindings
> for these two patches?

I see to have missed one!

This one is documented see:
d146d384222e dt-bindings: phy: qcom,qusb2: Add bindings for QCS615

but, the third patch is sadly not... I am dropping the third patch

-- 
~Vinod

