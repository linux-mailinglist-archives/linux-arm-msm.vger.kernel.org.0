Return-Path: <linux-arm-msm+bounces-57048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1819BAAD511
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 07:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C625E9860A0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 05:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9388E1E98F3;
	Wed,  7 May 2025 05:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q/4GYWjN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6930A1CEEBE;
	Wed,  7 May 2025 05:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746595095; cv=none; b=emQutWnCH5HKe2xA1sz6Vhd2jQ8RLInAjLnBYaQSWAbPOkl1rrT7xHxMpVAW2fR0zd3Mte8D7mg2uqXHqowv0Ni6sqBehfUWghNcssI3fjPBJAWsDmL8DRN6SF3wdHNppoAVQHvd4tHZkS3ijKmvkJAB3Q5EaD+BdrzQrqzjHDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746595095; c=relaxed/simple;
	bh=GxL1X53hevJPxakPWFVlgrBQbkN9fU3MDMh9imXgFDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X2OBWv//PTO64IJj4D2R45nnwK1KKiD+oxMIqqllvphbKVgYLb6I4HGPY7n14roWvaCey7nqKO7DhVIblqXsyEl54eLKi42ztmWv3WsMRzq/sclCB8NjU4ei/hGHwAqcp70hBzzUzfqerBJ1MgBw4rBC3dw+uNCZwa6e0BpFmRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q/4GYWjN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A60C4CEEF;
	Wed,  7 May 2025 05:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746595094;
	bh=GxL1X53hevJPxakPWFVlgrBQbkN9fU3MDMh9imXgFDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q/4GYWjNB22sTDT+yZBqJUkwgd0Vnb4ZhjHlafxUc+LKDkY2OMWDMrKQZt1Zg/s8K
	 am3rOC8LUuGtRautHtt2KDyoGBea39fxKA5njDRZhNvgW05XvuG+BKWHjDDZ64Y1zH
	 LnMwijmzrjm4SacjzXI52AMKu4SopzOSR2Jd03w0u04J8H+igmkKjBwwOsLh/80GSX
	 MBxegOCFcp9RYZsnhWNtDrvqyT22vN9n0ejPWx99nJhpKwIhzBjDFd4ijg5NN/BBBj
	 Ilikhknyninpyt4ttivjnTQSvfc7VTsoQVM00eqMP2iuZ19K48uWDEg+BeB9R+rOzg
	 BL6C8wqnqihEA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Dang Huynh <danct12@riseup.net>,
	Alexey Minnekhanov <alexey.min@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 0/3] Elminate all DTBs check warnings for SDM630/660 boards
Date: Tue,  6 May 2025 22:18:06 -0700
Message-ID: <174659505806.5380.10483359156289816926.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504115120.1432282-1-alexeymin@postmarketos.org>
References: <20250504115120.1432282-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 04 May 2025 14:51:17 +0300, Alexey Minnekhanov wrote:
> Run the following:
> 
>  make -j1  CHECK_DTBS=y 'qcom/sdm630-*.dtb' \
>          'qcom/sdm636-*.dtb' 'qcom/sdm660-*.dtb' \
>          'qcom/sda660-*.dtb'
> 
> Before:
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sdm630: Add modem metadata mem
      commit: 02a8b9894b9cbf4ffcd8661813826494cf49d3a2
[2/3] arm64: dts: qcom: sdm660-lavender: Add missing USB phy supply
      commit: dbf62a117a1b7f605a98dd1fd1fd6c85ec324ea0
[3/3] arm64: dts: qcom: sda660-ifc6560: Fix dt-validate warning
      commit: f5110806b41eaa0eb0ab1bf2787876a580c6246c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

