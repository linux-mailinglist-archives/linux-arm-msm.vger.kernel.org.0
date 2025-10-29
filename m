Return-Path: <linux-arm-msm+bounces-79518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BECC1C6B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 18:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66B79406046
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9682E6CBC;
	Wed, 29 Oct 2025 16:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UC9ND6H1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6E22D3EF6;
	Wed, 29 Oct 2025 16:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761754341; cv=none; b=KHUeE5Afpz1hdXnkCVdrvYDNgd1HpTUuRdOHZLXYVCcPGIqxVLL45Cm8RFrXty+H/x3qhIGuypQEkjCpReuvwDj+1Hvozu/VP03rGqIbEjIqKViJytdSM/XyiPwFXEHhh4niWafCpe/edm0EXBIdTToqzQSMaLJtQldT4AM4Jsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761754341; c=relaxed/simple;
	bh=OiHeyOB5BxQZi5pzwSbzaZYMVNw95ZMmtCxK/6h1kAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjYZ7ur/pREjtO7XaSILrVeAquTS4IXt8roQvZtCHTJ+JYHPWpVuDBC0+kSmEqmS5WaWu5SEWH5qBPhhio1gmgQmUhu/qgJCNlgfxjiE8dNTETsyfKyOXAccE35B0NTTM8csw1432I+BcMLQnqHKZS4wdXjZ3PCp/ApBwtQLyp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UC9ND6H1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C47C4CEF7;
	Wed, 29 Oct 2025 16:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761754340;
	bh=OiHeyOB5BxQZi5pzwSbzaZYMVNw95ZMmtCxK/6h1kAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UC9ND6H1E6ZGEId8P98ZrE79+fb++RvGPSrWhvzSD9YTD0v1rVcitkYtvc3T+ROWL
	 ftAEbRap9WJmDVMwecg80NXAatnN3VanEEED6mcD+BBqyR+dI6cbRPEEuTvchTxdPQ
	 tYY1wEISxXLUmSUHAYmSu3NQMEahHXDHmNhQiiw6dKgrrfy15gNadHb+Na+sh1KFXo
	 Q9WeCcQ2SYTOMGWIsSUwShUniTzV6O83mjNMnI4CoiaCtWg1SaN/MqRvjy9E+0OWTg
	 LVU4zEr9lt+8brgrHd5Rzqga8t3epmBIqY0FPzhS1kfpEyAVfM9xMdOGAQtMnQMT/T
	 QQkxLR+1f4ReA==
Date: Wed, 29 Oct 2025 11:15:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: qcom: Add IPCC support for
 Kaanapali Platform
Message-ID: <l6ja2uni4grnhicis3xksmco65l5axodwg6umpomhkssuc4ja5@zy33evwbv3zy>
References: <20251029-knp-ipcc-v2-0-8ba303ab82de@oss.qualcomm.com>
 <20251029-knp-ipcc-v2-1-8ba303ab82de@oss.qualcomm.com>
 <k2wgpzkfklso42nsd6w527gqiadgdb235kzmvgk4wy27vievir@vlyxti5y7yan>
 <cdfde03c-0fa1-4142-87b6-7c023e0b5c0d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdfde03c-0fa1-4142-87b6-7c023e0b5c0d@kernel.org>

On Wed, Oct 29, 2025 at 04:47:17PM +0100, Krzysztof Kozlowski wrote:
> On 29/10/2025 16:16, Bjorn Andersson wrote:
> > On Wed, Oct 29, 2025 at 01:15:09AM -0700, Jingyi Wang wrote:
> >> Add the physical client ids and binding for Kaanapali platform. Physical
> >> client IDs instead of virtual client IDs are used for qcom new platforms
> >> in the Inter Process Communication Controller (IPCC) driver as virtual to
> >> physical mapping logic is removed in HW.
> > 
> > Happy to see the description of what changed wrt physical vs virtual
> > client IDs, but you're leaving the task of figuring out how this
> > explanation is applicable to the imagination of the reader.
> > 
> > Nobody knows that the values in dt-bindings/mailbox/qcom-ipcc.h are
> > "virtual client IDs", so it's not clear that you're trying to provide an
> > explanation to why a new, platform-specific, header file is needed here.
> > 
> > 
> 
> 
> Physical or virtual, standard expectation is that they are used by the
> driver. This does not happen here, so what do they exactly represent?
> Which part of SW ABI?
> 

I was under the impression that they would be used only in DeviceTree
source, and the driver simply uses the values it reads at runtime.

But perhaps my memory is failing me, it's been a while since we
discussed this internally. Either way, the commit message should
document this, so I don't have to remember...

Regards,
Bjorn

> Best regards,
> Krzysztof

