Return-Path: <linux-arm-msm+bounces-31843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E379997A4E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 17:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE7B728F318
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 15:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EE6158543;
	Mon, 16 Sep 2024 15:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhIhvwVs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E943158536;
	Mon, 16 Sep 2024 15:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726499471; cv=none; b=IrbeLXvvv2+9NjC2Wf6bCazxnpMwBEC+n0DTuqYBAf98+939tr9QL6j9CfQk0Fcni+lM6Jo83mGW2fOj/cjErxE6764I0rp+ziswy6x2qxEC0HH/Po1vhXDplAEHjWgqXQCAnFTdE5ogjoL7V9uCBvKs64V93aQ14dBC6Sw4mFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726499471; c=relaxed/simple;
	bh=7Ip9FIDuR285PizAnXWCZdknBLiCMWtb9vzp8vxc5VM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1VKN2EWAsfMrT3Bw6cFw8nIhR1Ou4qOLRm8KOKwBVmW4aKlBuh36mlqLwmaqIr60CHrI/NhHrxX3+vZ8ocBNKxsbxM5iCPTHHxpA+ijMCPVouERCMG+a+c+SysRL4dMjUz2Um1NQyHEVJoUD6erBiKygJgpyoeSEoOGsWQ9rBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhIhvwVs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD847C4CEC4;
	Mon, 16 Sep 2024 15:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726499471;
	bh=7Ip9FIDuR285PizAnXWCZdknBLiCMWtb9vzp8vxc5VM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MhIhvwVsyRzQnD5/COhY2Hc/ayqKjZQntrzmNNEq3nIZQVe8zbeFaNrC1Z1vNxoZ6
	 lqy7sdFalj68xQsypfl7OqHmtcIB9TGbVB9CVPcK4EQwIuA8VpQTGvYkISdPYZt2v/
	 TCn+Aj7t7xVUlmKn8ooN4TRouLBE4+PfiiSN4pZ0rccqK6nBwdbEv+nvx4xD5UY0yp
	 7VHe0us+I+MfQADfgSdPPl9vnVrb2KEryqfYgPr6u1o5eU9bSlIXAtJzfPzanY12qt
	 PXimw/PO6d8CoPwhXWJI3G5Ube4aGaEbT9RvlCnhHMGpIoWi/jyG6gkU2xl21eMWWj
	 +yoDx5xd7WH5w==
Date: Mon, 16 Sep 2024 17:11:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com, Kyle Deng <quic_chunkaid@quicinc.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: soc: qcom,aoss-qmp: Document the
 QCS8300 AOSS channel
Message-ID: <gx43iz42qxwc7gjh3dgyfuunc2vbr7eblwtzeyngmf2vcdpkwo@pm3grjwiiutb>
References: <20240911-qcs8300_binding-v2-0-de8641b3eaa1@quicinc.com>
 <20240911-qcs8300_binding-v2-4-de8641b3eaa1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240911-qcs8300_binding-v2-4-de8641b3eaa1@quicinc.com>

On Wed, Sep 11, 2024 at 04:03:18PM +0800, Jingyi Wang wrote:
> From: Kyle Deng <quic_chunkaid@quicinc.com>
> 
> Document the Always-On Subsystem side channel on the Qualcomm QCS8300
> platform for communication with client found on the SoC such as
> remoteprocs.
> 
> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


