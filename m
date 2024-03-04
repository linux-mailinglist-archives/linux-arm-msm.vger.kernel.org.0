Return-Path: <linux-arm-msm+bounces-13229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AE086FBEF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 09:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4453EB2164E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 08:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2091F18E1E;
	Mon,  4 Mar 2024 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y/Jj8le7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48C718C3B;
	Mon,  4 Mar 2024 08:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709541135; cv=none; b=p8ntTyHFy5A7Nuv5f1cpcH3uji6HIV9YD+wiyjPWiKiK8L4Fk3/3ifpe7PyM/zLU2BKHbQCK3dQ6Xvoq0PDBSf9i5XcJbk5JBKmp51L5zvH8C8YhKx/KQG/XR31j4eo5MPrFuXwc2idTEWZ4sSplBc4HZMAvDrQkkZgpIACnuAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709541135; c=relaxed/simple;
	bh=fn9kDRhZ3uC3sP4IiPeeESBvBHtP48VNUDNBMZJeC3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8BU2e02jCz9HUtH396GZK4/lgsNVay4oMIhOvBJHE6ZH+92kCHuzlWbdoG6xY0C6iE636zyjq06740zRmhZbitEo3Zo7yM78wgfx9NI/V3WXcF9auWzUNeH092zNHscZjfOoCsuQ7yW7Y/PQfLuTdFJ6Jg640f/0B22Y2n2Xzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y/Jj8le7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E829C433F1;
	Mon,  4 Mar 2024 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709541134;
	bh=fn9kDRhZ3uC3sP4IiPeeESBvBHtP48VNUDNBMZJeC3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y/Jj8le7t8Mf67Bo8yrx17ReQ0T67yEoRnZLMGeGsWFFL0O19KHnefe8E782EpjUW
	 swecSn4joziaHzpdw3aPoC8X0dqCBA7wuBdjGhaiyp116bgHhexVtnTWn73LL8Q11i
	 aeuxty/3Xi+ZsVYaR0566NX08/eE9Z7n4jw3kua8=
Date: Mon, 4 Mar 2024 09:32:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: usb: qcom,pmic-typec: add support
 for the PM4125 block
Message-ID: <2024030452-detail-curable-b5a4@gregkh>
References: <20240221-pm4125-typec-v3-0-fdd0ee0465b8@linaro.org>
 <20240221-pm4125-typec-v3-2-fdd0ee0465b8@linaro.org>
 <CAA8EJpps9EPCgwBF8d8DbVzSZQ5tbEnj3RyGcJ=ua0eigDWQzQ@mail.gmail.com>
 <CAA8EJpq=Js3vtRQrUDWi1mOgL3C1iEsaAQs+dwHg=hLyE0U-rw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpq=Js3vtRQrUDWi1mOgL3C1iEsaAQs+dwHg=hLyE0U-rw@mail.gmail.com>

On Mon, Mar 04, 2024 at 02:08:19AM +0200, Dmitry Baryshkov wrote:
> On Wed, 21 Feb 2024 at 02:00, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, 21 Feb 2024 at 01:58, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > The PM4125 PMIC has the same Type-C register block as the PMI632.
> > > Likewise it doesn't support USB Power Delivery. Define the compatible
> > > for the TypeC block found on PM4125, using PMI632 as a compatible.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Making a fool of me, for v2 there was:
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Greg, as Mark has picked up the vbus regulator patch, is there a
> chance of you picking up this patch?

As it doesn't apply to my usb-next branch, it's hard to do so :(

Can you rebase it against there and resend?

thanks,

greg k-h

