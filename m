Return-Path: <linux-arm-msm+bounces-79760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968E1C21DDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 20:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E02E44203EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 19:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A6430FF04;
	Thu, 30 Oct 2025 19:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DxbNvTrB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A23293C4E;
	Thu, 30 Oct 2025 19:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761851312; cv=none; b=RBWS/prf7NVrE8tGJkI63MVppPQMNmVGie7cs0gllRkOsSOY1B+fis5AQLfq4BmZCmbne4dxIZUO/20uFvhSmbDNfA8ED5rWhP+TNg4ZJYnZZWG/f2QNS5bF24XWNj3MU7/5dzerSXuFEPrvQ7pygwmHzy88nFUW+jWah+qjSbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761851312; c=relaxed/simple;
	bh=kOo+PpES5NgQcULf7S+Q+UVAhdpsgLGwKOQrs8bQIEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jpH/XRcUFwVp/leX/ETe7XsaMKAUR/TlcqQKQWHnTfipHDSEbvOts+a4npvDg+PQdyaURhIYuFq7ZU3bhbFnPK0+C0NCa092IxQAfA2tagLbH655cyuXh5w1ORluucIQGHAxmuhEwOKGsMAKXVpt7YHR6WxFwPHNYGIS4iyovuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DxbNvTrB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC8FC4CEFB;
	Thu, 30 Oct 2025 19:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761851311;
	bh=kOo+PpES5NgQcULf7S+Q+UVAhdpsgLGwKOQrs8bQIEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DxbNvTrBua7xWRyCgNRUIZ3uCilnBZbV/HdNHv7X7+SaC+wACQ1cwzbTRtnwqeIt5
	 s2JoJnBGaOwRV/uMKCFwHv9n+044xo2h5IDoWWFxDuL7UqA2OM114R+6xXCwZI3ntp
	 ASzXawONhxHRiKUDwMeZbCpwxFzs7hSwq6eTO0gzCDmDE6npO9Y8QJCui+s6TQAVDJ
	 bsOOL0v2QDyy3lozq/F8/itl3Dra4M5Lv6adOVL3qEofKcT12q5Z6SnlhOp4QhFLJl
	 aGYRi1dD19NrzTbdNpY2A7RadUp8qRTIZh+LZ4M6ePkeKwBZBsFMb6pOqKwhESnx/z
	 s4N2+YwlZE6MQ==
Date: Thu, 30 Oct 2025 14:11:40 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: mailbox: qcom: Add IPCC support for
 Glymur Platform
Message-ID: <ofoie57qkonmyots5y3jf3sn27zy45rd54raosvo2gu4nzrxjo@3hvm7bp7vswa>
References: <20251029-knp-ipcc-v2-0-8ba303ab82de@oss.qualcomm.com>
 <20251029-knp-ipcc-v2-2-8ba303ab82de@oss.qualcomm.com>
 <67038d9f-7c6c-4bb3-ba64-b06816b76be7@kernel.org>
 <qyfxtoe7ixko7k5whtzjpkynwpeqxzb2sgwq7y4y3kstblapz5@ggny5uq7qv6s>
 <5468378e-3ca3-45d2-98bf-9388005bba85@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5468378e-3ca3-45d2-98bf-9388005bba85@kernel.org>

On Thu, Oct 30, 2025 at 06:53:59AM +0100, Krzysztof Kozlowski wrote:
> On 29/10/2025 18:23, Bjorn Andersson wrote:
> > On Wed, Oct 29, 2025 at 04:49:30PM +0100, Krzysztof Kozlowski wrote:
> >> On 29/10/2025 09:15, Jingyi Wang wrote:
> >>> diff --git a/include/dt-bindings/mailbox/qcom,glymur-ipcc.h b/include/dt-bindings/mailbox/qcom,glymur-ipcc.h
> >>> new file mode 100644
> >>> index 000000000000..3ab8189974a5
> >>> --- /dev/null
> >>> +++ b/include/dt-bindings/mailbox/qcom,glymur-ipcc.h
> >>> @@ -0,0 +1,68 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
> >>> +/*
> >>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>> + */
> >>> +
> >>> +#ifndef __DT_BINDINGS_MAILBOX_IPCC_GLYMUR_H
> >>> +#define __DT_BINDINGS_MAILBOX_IPCC_GLYMUR_H
> >>> +
> >>> +/* Glymur physical client IDs */
> >>> +#define IPCC_MPROC_AOP			0
> >>
> >>
> >> Here the same - not used by Linux.
> > 
> > How is this different from e.g.:
> > 
> > include/dt-bindings/interrupt-controller/arm-gic.h:#define GIC_SPI 0
> 
> $ git grep GIC_SPI
> drivers/irqchip/irq-mchp-eic.c
> 

My interpretation of that snippet (and the other use cases) is that they
are programmatically constructing the values of a DT property, not that
they define the SW API.

> How is this not used by Linux? What is drivers/irqchip/foo.c if not a
> Linux driver?
> 

No argument there.

[..]
> > 
> >> Or provide explanation in terms what Linux interface you are binding
> >> here (please focus on Linux or other SW).
> >>
> > 
> > Don't we use include/dt-bindings to define hardware constants for use in
> 
> No, we do not.
> 

I have completely missed this. Perhaps this is the first use case, but
the result is non-the-less:

$ find arch/*/boot/dts/qcom -name '*.h' | wc -l
0


But this makes sense, and I like it.

@Jingyi, as these header constants are consumed only by DeviceTree
source, please move them to arch/arm64/boot/dts/qcom/

Thanks,
Bjorn

