Return-Path: <linux-arm-msm+bounces-34458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCFE99EF37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 16:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA72FB2117C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 14:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13641DD0F2;
	Tue, 15 Oct 2024 14:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJgC9hyw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29FD1DD0EC;
	Tue, 15 Oct 2024 14:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729001871; cv=none; b=qXS3Gbnwl0EX7BeDRqwYRNPeC5au5RKvupzyFgZ5iRzI4vrP+jPWX+fhav6fdTtQc0w18PK4Hxn21oUDIk5Ickx8nQEPGrY5M1NJ7nuX1M9CrekhpdlhknUFbH95rzhfcd8F8OKUZTNjM/6442583wxXrEbIBfaAKzEByVdl3Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729001871; c=relaxed/simple;
	bh=7ZCqqhldOOd6DUYa16OTZfL00BpDjYvhQAw64alvAHg=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=EiKvQbFCyJguuJ8PJNwMh40N6ZvMDZ5BqoPSNd2PZ2xjBwfB430tFgcTaSdtF0StmWSPSt10u8F1RPUNKZdW+tQjkaLa1onxoz7/niSjM49aMcSMUlffNnN2ViVk3xBjxHOTiiVkbe1QECaNIu8GJRaSJ/fGTA++xu2Yt9uyBx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJgC9hyw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F60C4CECE;
	Tue, 15 Oct 2024 14:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729001871;
	bh=7ZCqqhldOOd6DUYa16OTZfL00BpDjYvhQAw64alvAHg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=QJgC9hywf606BvmMipuHQldXQvzYJSdX3MNDSO1qRANSJS81sS51n7eKs9HqtdzUb
	 CFB+heYs85uAvlyMgXt5Yz6qDhGpksJsQNEpROiWZFAcnSw9rjfqnQZKhAD3IJPfJp
	 shUFr2bYW6o8unp3MKTdh9WhoSanEGqZvS3M8kPBbc+SnWqrJUrcPduVTGBSVwizJh
	 xYsLjgD3D+jAbKNP7VrirXumnXf98AtTLOnWg07RBkpmD0w13ccOdIttsslES8YdNY
	 M2ZB2g8EaDV+XPSwQKjEIfp9M1cBBi6JyEiH3+Bi8CtigXtk1iTLlvWnrsxs2ceuns
	 h3pfAmRiq0wRw==
Date: Tue, 15 Oct 2024 09:17:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rakesh Kota <quic_kotarake@quicinc.com>
Cc: linux-kernel@vger.kernel.org, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, quic_kamalw@quicinc.com, 
 linux-arm-msm@vger.kernel.org, konradybcio@kernel.org, 
 dmitry.baryshkov@linaro.org, andersson@kernel.org, 
 quic_jprakash@quicinc.com, conor+dt@kernel.org
In-Reply-To: <20241015132049.2037500-1-quic_kotarake@quicinc.com>
References: <20241015132049.2037500-1-quic_kotarake@quicinc.com>
Message-Id: <172900161262.733293.1067268024282118618.robh@kernel.org>
Subject: Re: [PATCH V2] arm64: dts: qcom: qcm6490-idp: Allow UFS regulators
 load/mode setting


On Tue, 15 Oct 2024 18:50:49 +0530, Rakesh Kota wrote:
> The UFS driver expects to be able to set load (and by extension, mode)
> on its supply regulators. Add the necessary properties to make that
> possible.
> 
> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
> ---
> Changes V2:
>  - Dropped the removing Min and Max Voltage change as suggusted by the Dmitry
>  - Link to v1: https://lore.kernel.org/all/20241004080110.4150476-1-quic_kotarake@quicinc.com
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
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


New warnings running 'make CHECK_DTBS=y qcom/qcm6490-idp.dtb' for 20241015132049.2037500-1-quic_kotarake@quicinc.com:

Error: arch/arm64/boot/dts/qcom/qcm6490-idp.dts:287.4-5 syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/qcom/qcm6490-idp.dtb] Error 1
make[2]: *** [scripts/Makefile.build:478: arch/arm64/boot/dts/qcom] Error 2
make[2]: Target 'arch/arm64/boot/dts/qcom/qcm6490-idp.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1412: qcom/qcm6490-idp.dtb] Error 2
make: *** [Makefile:224: __sub-make] Error 2
make: Target 'qcom/qcm6490-idp.dtb' not remade because of errors.






