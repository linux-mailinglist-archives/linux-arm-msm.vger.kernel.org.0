Return-Path: <linux-arm-msm+bounces-13860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCF287867A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 18:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 218C51F218A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 17:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB6C4D9E7;
	Mon, 11 Mar 2024 17:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMGmEjrd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA814D9E6;
	Mon, 11 Mar 2024 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710178987; cv=none; b=SkaHdHcAlEV3aH2LQCVKYhp2ygwh9rudP9oiBrnD3M/3+aeVtWglNimPSphUnR/xxlFGoGltJHoKtotVsQ3AUddGY+95nBeD1FzgELUTN/4fw25nrPs/XJE34HRya43j1RlPz63qEQxb8ER/No6pDHWVPj/pVMcOMiF9utm5vbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710178987; c=relaxed/simple;
	bh=AC7VQDeZIiTw1P1gYlvfffANLbxhOLrq5IOI95ib1zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOUQB5dVeqZA20GmZSOb/sAaF+SnTysiKnFpqP1kK0Mc3OXLq5U7g1HWwfBsyZ5BsqG5TpfLe32ggd9NyxZ2Jfb5Zb4wqDjFILpvAc33N2HpFcW2kuq0y/5+QMjEQzm264G85qWJ5CGwh+LnfiFAv0jJutOzJ+YbvEA5Gdo/Zu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMGmEjrd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37958C433C7;
	Mon, 11 Mar 2024 17:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710178986;
	bh=AC7VQDeZIiTw1P1gYlvfffANLbxhOLrq5IOI95ib1zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LMGmEjrda82O5DhvnTi42aUZp9ZbYiPnUZhHHhvHKnJlmAwWWd1doKEMX5ukChgM0
	 6ymzVfsIu34PImHdcGhsZyUBagJxoq/3G6inXS+LgHlcXfJ3zkEq+6aw62NO3k1TH/
	 fKo68ZmmBEelJreQB30DeJS8gE0l64QjvP1nluzvCOZOhzdCAino3AOPxF3Tm5s66L
	 N38ckNJaE2b4Xg+REUge34XSU2O1GPv7Jn/OTm/e4acdAid/daOWBBJ41AHF+CMEq9
	 4cyMKZkg28+c5DaJn3v8Q5jtvWqykJHeR/j9ibLrSSTRpx1koMdmH/xko23rgIZ5dP
	 P5jGCXFKGZrRg==
Date: Mon, 11 Mar 2024 11:43:03 -0600
From: Rob Herring <robh@kernel.org>
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Wesley Cheng <quic_wcheng@quicinc.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 bindings for QDU1000
Message-ID: <171017898265.1475540.17259448338325982005.robh@kernel.org>
References: <20240311120215.16845-1-quic_kbajaj@quicinc.com>
 <20240311120215.16845-2-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311120215.16845-2-quic_kbajaj@quicinc.com>


On Mon, 11 Mar 2024 17:32:12 +0530, Komal Bajaj wrote:
> Document the compatible string for USB phy found in Qualcomm
> QDU/QRU1000 SoC.
> 
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  .../devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


