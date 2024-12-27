Return-Path: <linux-arm-msm+bounces-43463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA579FD034
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 05:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A12A1883757
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 04:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350C035964;
	Fri, 27 Dec 2024 04:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgtqqlqR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06210442F;
	Fri, 27 Dec 2024 04:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735274121; cv=none; b=kAthDvd0sCsjs/BJet6CQh1ZwogkzMgrpFC+e8wK2f5L7/t4QJJvoMvpIKAQZl9xdP/pPw01s+7Yok8ge5okMIVHUAqSFbmqxmjRgS6kYUBJwes9x2ruVe/XI+tLfS50czSKGgZvxs2dK7fDSv34RMRDo9mVXc/y/F6ZOyY6NuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735274121; c=relaxed/simple;
	bh=F5MWcXLh8CHYSVCKsWzMtFE0lKOD9TTI3A6Pw+PIOMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApgydA6DsBuR2eMfilJsw/ml7+DaHg2xxalhMCa0/N72SD7ACMnQuusr7VoOzviOuqFL7eXqM7rjGbALU41+UvoscC6+TyqpGzqb2pDZqN+HZt9Uge6VQKLEU1Yj6Dm8vdhcxaB3mmgYE131pNlaU7D07/JFtNOQ1wwF4As4VBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgtqqlqR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 639A4C4CED0;
	Fri, 27 Dec 2024 04:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735274120;
	bh=F5MWcXLh8CHYSVCKsWzMtFE0lKOD9TTI3A6Pw+PIOMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YgtqqlqR0HwejcIT3ojcyZyyP0WPIkN7nfsOngmwrOSo2ABMnjH0xAXXYArAhPto1
	 90i4JIv35Yvz7lrieNlA5OJzZTDmj6jp+nBlZ0FZ0/U5/avSgP07EexIkg7fPz8jXD
	 LwKKT6/QuCOhZa3HvQsWJuhcSvYyqYXSfIKgFEcuMM3vwVgvyECIRnXu+zCebscZVn
	 hENivBJmxZPMK7fvhIwUBe+IHRNJGsckS5bI9pOoDYjR0wqvfQ58yfANvPjNyBx+Fs
	 zmlFxF0+PK53qpvuPcOWfCaJmhczO8RxHx3zuYzHnXADDngohrjIBml/QplKKbA5nV
	 LewoFGnu/Qm2Q==
Date: Thu, 26 Dec 2024 22:35:17 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Taniya Das <quic_tdas@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shivnandan Kumar <quic_kshivnan@quicinc.com>
Subject: Re: [PATCH v2 0/2] Add support to scale DDR and L3 on SA8775P
Message-ID: <ww3t3tu7p36qzlhcetaxif2xzrpgslydmuqo3fqvisbuar4bjh@qc2u43dck3qi>
References: <20241112-sa8775p-cpufreq-l3-ddr-scaling-v2-0-53d256b3f2a7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-sa8775p-cpufreq-l3-ddr-scaling-v2-0-53d256b3f2a7@quicinc.com>

On Tue, Nov 12, 2024 at 06:14:10PM +0530, Jagadeesh Kona wrote:
> Add support to scale DDR and L3 frequencies
> based on CPU frequencies on Qualcomm SA8775P
> platform. Also add LMH interrupts in cpufreq_hw
> node to indicate if there is any thermal throttle.
> 
> The changes in this series are dependent on below series changes:
> https://lore.kernel.org/all/20241112075826.28296-1-quic_rlaggysh@quicinc.com/

This dependency didn't materialize, so I can only guess that this patch
will have to be changed accordingly. As such, I'm dropping your series
from my queue as well.

It would be much appreciated if you send such tightly dependent 
patches together in the same series in the future.

Regards,
Bjorn

> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
> Changes in v2:
> - Squashed 1st and 2nd patches into a single patch as per review
>   comments.
> - Alinged the & properly for ICC phandles in CPU DT nodes.
> - Updated the commit text for LMH interrupts patch.
> - Link to v1: https://lore.kernel.org/r/20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-0-074e0fb80b33@quicinc.com
> 
> ---
> Jagadeesh Kona (2):
>       arm64: dts: qcom: sa8775p: Add CPU OPP tables to scale DDR/L3
>       arm64: dts: qcom: sa8775p: Add LMH interrupts for cpufreq_hw node
> 
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 215 ++++++++++++++++++++++++++++++++++
>  1 file changed, 215 insertions(+)
> ---
> base-commit: c38b541e924a8c5494db67b0ebf04cbcd84ca767
> change-id: 20241112-sa8775p-cpufreq-l3-ddr-scaling-e10b3d71a80b
> 
> Best regards,
> -- 
> Jagadeesh Kona <quic_jkona@quicinc.com>
> 

