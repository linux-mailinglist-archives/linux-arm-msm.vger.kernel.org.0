Return-Path: <linux-arm-msm+bounces-40273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B3F9E3CA2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52E96163B17
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7662020899C;
	Wed,  4 Dec 2024 14:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frMyEDke"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44582204F7A;
	Wed,  4 Dec 2024 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733322167; cv=none; b=HjCVhmEgYF0I6/1UGGhscpxDYEzIYtnCEG2a85R4BNUvS1gAMzb+PB++v1Q/Kb84702t32f4fnFSqgFmrttQ9OXwyC4pVvU0c/crm7yWV5Qvp53+ZIjcoCAJCTC82kPQZwXOgjBFHR81NLgAzrYpQ55REFCdvZ7T5jin8gObdhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733322167; c=relaxed/simple;
	bh=HDWOSKjvAqCvChFsMZqsRdhKsZNl0O6/gC113vAJjAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8wMpnHN8/AcocJceplsgDpc4EbE+G0EpuVkO9NlDTedqgaXCKikaMZcAicg+jcpz0A1Z8das8r+bLVjs/DMJfxRrmj1p4f81NM730D0UmSHoPgKCgmlJDJnemr5owo8Hc6SgR7s2o+OX1yyaGp2E8LVRZVy4lAv7sE6u0XcCdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frMyEDke; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB03C4CED2;
	Wed,  4 Dec 2024 14:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733322166;
	bh=HDWOSKjvAqCvChFsMZqsRdhKsZNl0O6/gC113vAJjAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=frMyEDkeNtixLEth/zkrd3ayqRTcaXw54+toyDDZOuaq8X4iq+WJRXzMSfqz6xJzV
	 yU8UC+b0mLA9aHVMq58Zx/oAsGieD4+0Clxn/stNCNaB6X4Mzc078YHT2GsaQ6/hw2
	 +gWU9jSdzKy/1Jt1zQz9GGSfbnqTwfyslmaTS5GOvTLRoReLJHzEDCoIbcAaMNtVYE
	 v+kQFB8tFzFF6ufEjBvNxZ49eJK6q33EHD9CMXtdm9oHrUjw/OK2uLyoLW0Ho6h94r
	 ivwPm0A+I0qXPvdBTrk+x9UPiddYNiBQmysKOfhIStZdbBnA1PRGvOhTNv5gNI+Bzn
	 8+dZyoKBlP+Sw==
Date: Wed, 4 Dec 2024 08:22:44 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Vorel <pvorel@suse.cz>, Harry Austen <hpausten@protonmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	=?utf-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>,
	Alexander Reimelt <alexander.reimelt@posteo.de>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dominik Kobinski <dominikkobinski314@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH RFT 2/4] dt-bindings: usb: qcom,dwc3: Fix MSM8994
 interrupt spec
Message-ID: <173332216439.177606.17601247574261115005.robh@kernel.org>
References: <20241129-topic-qcom_usb_dtb_fixup-v1-0-cba24120c058@oss.qualcomm.com>
 <20241129-topic-qcom_usb_dtb_fixup-v1-2-cba24120c058@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129-topic-qcom_usb_dtb_fixup-v1-2-cba24120c058@oss.qualcomm.com>


On Fri, 29 Nov 2024 23:12:46 +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This SoC doesn't seem to have separate DP/DM interrupts, move it to the
> category that has a "qusb2_phy" one instead.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


