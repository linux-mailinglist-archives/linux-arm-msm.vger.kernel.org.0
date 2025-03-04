Return-Path: <linux-arm-msm+bounces-50285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B200DA4F08C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 23:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD679171AC3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 22:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCAC1F666B;
	Tue,  4 Mar 2025 22:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o6yEm8FA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5161C2E338E;
	Tue,  4 Mar 2025 22:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741127597; cv=none; b=MdNcngkRdUEpg/4tHQU5QrSZ4+WiXsaSJi+DoRTu0pIhS+YPgEl7+LWP1ZNeu+7uNCI/6IYJYtEq+DQzLI6nxayKewvqC1j1Ko9xKZMWKKX48PpJjURaFOeFXXkX00LDaZwGC69Dr9pZNE/8D2h3HdmyQ+L604ttxCUsbTY+hA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741127597; c=relaxed/simple;
	bh=0MvwTVPn+rG6FROc0/0+IZOLkMjweCpzGoPWfDWsO3A=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=o6a+B2bs10zRgr9pg8NDArDutQftLB6FFMcUihAkFcPuYT+kp8ZBC93lN8OwoaF9j3FNs43dhAg+FHlG3jBQoPp6GOdXQl0DMMHVVGr6Xxe+rVeN8lIK4SyQDgZX7aQxxRIMMdEXA+uDdr6gtcwRipMZkBCWwjHr7F6UmT/3oJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o6yEm8FA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7933EC4CEE5;
	Tue,  4 Mar 2025 22:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741127596;
	bh=0MvwTVPn+rG6FROc0/0+IZOLkMjweCpzGoPWfDWsO3A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=o6yEm8FAzwuLSIKAwPDrL7FuVDGxQt2Bn2/C49Aj50riSfzMj+3agVVAGdVuLh62b
	 jmaa2GwAQ73gV00gEq/PBHjkbudVz29XLeHlFNSobzXn1uSq8yKoHGQWSdheDqMB5y
	 votlEMfRbmIuVuY/TzPUMIQXe7LDIbtmi1QVL6CT6bW82WRd9i+BRsJS9os7mo4NVG
	 Mbh4L+G6FJsQOmcsFS6vw6XgsTe0ok2mugm9aEOeMCozmnCu38uvoHk7ZTnob+O4Dn
	 VAQD6iCebak3ARin9mnfRA1y2voHEISKXFgte9RWn1om2NWWc2LIj5ELHlhEZ1tPtv
	 hVFVm22Sb59vA==
Date: Tue, 04 Mar 2025 16:33:14 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, quic_rpavan@quicinc.com, andersson@kernel.org, 
 konradybcio@kernel.org, quic_sarata@quicinc.com, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, quic_sharathv@quicinc.com
To: Kaustubh Pandey <quic_kapandey@quicinc.com>
In-Reply-To: <20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com>
References: <20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com>
Message-Id: <174112750057.3751450.15783784234696025160.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcom6490-idp: Add IPA nodes


On Tue, 04 Mar 2025 20:51:33 +0530, Kaustubh Pandey wrote:
> Add IPA nodes for Qualcomm qcm6490 board.
> 
> Signed-off-by: Kaustubh Pandey <quic_kapandey@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com:

arch/arm64/boot/dts/qcom/qcm6490-idp.dts:119.31-122.5: ERROR (duplicate_label): /reserved-memory/ipa-fw@8b300000: Duplicate label 'ipa_fw_mem' on /reserved-memory/ipa-fw@8b300000 and /reserved-memory/ipa-fw@8b700000
ERROR: Input tree has errors, aborting (use -f to force output)
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/qcom/qcm6490-idp.dtb] Error 2
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/qcom] Error 2
make[2]: Target 'arch/arm64/boot/dts/qcom/qcm6490-idp.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1462: qcom/qcm6490-idp.dtb] Error 2
make: *** [Makefile:251: __sub-make] Error 2






