Return-Path: <linux-arm-msm+bounces-40272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABE89E3DB9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEBF9B35E52
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786C91FCCE0;
	Wed,  4 Dec 2024 14:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rxU7py+B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6D21BD014;
	Wed,  4 Dec 2024 14:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733322148; cv=none; b=eD0zbmGl2ygF9sMdeIfhJY22Vqf+fDS36NGiuNIF52Nqv3WmVgQp336SOW2XpHJuop38cQUr0ilwFcu4CACr3wsk4QpuBBgtSyWlg9vkQBhbztx7n+ghAJm1qOYBrwIhVldXm1uVvQQmE16qYHzxiR9jwzWmYKb9lbkT58z7JFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733322148; c=relaxed/simple;
	bh=CCyS4K6qH/1DQ/HGcYr/W1D5AC4ouG8yMRT5gs8nL6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eeiRSc9DtdRZCiDDo9+pCaeDMSEeJh42xjRK6wV/28IYmx0NsOPp+gS361tifTOrzU5cGOWxH0aSw/GRt96EIrTqQmQjw16JSlipbTTN61XXbHqkKuYVAMRBCmDq4jIpec0zSqgCeJ++NWc6vMLYiijuNqShqPM8S3f55LEy3u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rxU7py+B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9622AC4CECD;
	Wed,  4 Dec 2024 14:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733322147;
	bh=CCyS4K6qH/1DQ/HGcYr/W1D5AC4ouG8yMRT5gs8nL6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rxU7py+B1rzxO1rwvwjkwSfstGL2d7Ydzk2eMWyY6MvP7M4dhhs6TWO9RCqpoEGpq
	 +GFBuLNpYHgQokCjGSh2CguCiJUK3WNucXamRd5mSMU7JfuciAEwtnucZkKPL3Z0GF
	 KhLvRbBo7XnXQqxjoNsDdJrV1niEVibkXH0b8fh7mlXz44DoSus8PK4rXSLADWqKpT
	 dAEfjbuuSfuihx1/i9W9oQs8gqPF350v8SIib1tnoORLGtiaSbO0t1BZBm5p7PHBSo
	 zNRzZgQteJ0XbQzavIliblf4ajk6clNRKBpTlrxyCqi2Fq80oCCQhpysFMRANjtD02
	 qCeGqvfmwJ/CA==
Date: Wed, 4 Dec 2024 08:22:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Petr Vorel <pvorel@suse.cz>, linux-usb@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Konrad Dybcio <konradybcio@gmail.com>,
	Alexander Reimelt <alexander.reimelt@posteo.de>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	=?utf-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Dominik Kobinski <dominikkobinski314@gmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Harry Austen <hpausten@protonmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH RFT 1/4] dt-bindings: usb: qcom,dwc3: Make ss_phy_irq
 optional for MSM8996
Message-ID: <173332214517.177124.9883201791486953471.robh@kernel.org>
References: <20241129-topic-qcom_usb_dtb_fixup-v1-0-cba24120c058@oss.qualcomm.com>
 <20241129-topic-qcom_usb_dtb_fixup-v1-1-cba24120c058@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129-topic-qcom_usb_dtb_fixup-v1-1-cba24120c058@oss.qualcomm.com>


On Fri, 29 Nov 2024 23:12:45 +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> MSM8996 has two DWC3 hosts, one of which is USB2, which naturally
> means it doesn't have a SuperSpeed interrupt. 3 interrupts are already
> allowed, apply the same logic to interrupt-names.
> 
> This fixes warnings such as:
> 
> usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


