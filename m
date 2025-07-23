Return-Path: <linux-arm-msm+bounces-66329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A65FFB0F599
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 16:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A79F6AA363B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 14:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D9C2E92D5;
	Wed, 23 Jul 2025 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5j4cQOM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131EE2E7F19;
	Wed, 23 Jul 2025 14:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753281674; cv=none; b=oTHdWRh/9APmxH+nsSxtrNTuuizfhXLd4eQ7vV1RxZaQyYjm+goIHyPDEidR4LkiMXvVZ4ZLfeSO8SXZB/uk4TreP3EgPhd9H7wV26iQgNvbx+GCG3FZ7FofQOXQDp1Jj6Whs44GdZnqF+b/lj092tv9VlsQwpJolcvOV0qPcmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753281674; c=relaxed/simple;
	bh=spxFbuCrDuTnv+sdA7w8h/okvSGm6H+gea+90kVlwiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eje1r8bjJV2vOF0pktnZjIv4O2OWBPcYp/+qaLsxqhs2yJBxnpgrKcJxSeKefemwgy8TSfj4WDVb0pWaZDpYzkiBNK8Xow7zHiqBxkMne9LDyhNS/xScYxmm7kIFIicc7q9HUn0W7556GWS44DiFs4jmolz8ABh8Zmkg5NXM6co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5j4cQOM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD08C4CEE7;
	Wed, 23 Jul 2025 14:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753281673;
	bh=spxFbuCrDuTnv+sdA7w8h/okvSGm6H+gea+90kVlwiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M5j4cQOMl/TurLTv8Soh2IDnvM3wRP5z2sfkcYJ5aXlsOjV/mb03z/ET8ClfEiv8k
	 2pGXyMI695U7qlEkyKJ17GOsdOjvC3+GCD09XrRGKbCsLA28O8mg7cMXLyAe/errbi
	 cS1Vj2SEpezAFRVmgU1TI9UyYZswGXrZL3xLvIeYIouUudrjKK/s76mZu59jQ9PSod
	 q+blNge2oQvLDO9eNAI8bmjYPSJLaY+7nOM/dZadkYk/02qCd5Z4EQxpEauiJr6O+t
	 qErmToXfCSDee0j5QFeObtskQOPCgufyE/qD8gwYMVuxukeq8j76p88P9YChxbej+0
	 8TbYEXG3z3UTA==
Date: Wed, 23 Jul 2025 20:11:03 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, agross@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1 0/3] Add DT-based gear and rate limiting support
Message-ID: <tc57sqskjmjloocxzvhay2i5q6xdjjsaia566tmi2yknp5kwx5@3ae2gm3mgzgg>
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>

On Tue, Jul 22, 2025 at 09:41:00PM GMT, Ram Kumar Dwivedi wrote:
> This patch series adds support for limiting the maximum high-speed
> gear and rate used by the UFS controller on Qualcomm platforms via
> device tree.
> 
> Some automotive platforms, such as SA8155, require restricting the
> maximum gear or rate due to hardware limitations. To support this,

What do you mean by 'hardware limitation'? Please explain.

- Mani

> the driver is extended to parse two new optional DT properties and
> apply them during initialization. The default behavior remains
> unchanged if these properties are not specified.
> 
> Ram Kumar Dwivedi (3):
>   scsi: ufs: qcom: Add support for DT-based gear and rate limiting
>   arm64: dts: qcom: sa8155: Add gear and rate limit properties to UFS
>   dt-bindings: ufs: qcom: Document HS gear and rate limit properties
> 
>  .../devicetree/bindings/ufs/qcom,ufs.yaml     | 10 +++++++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi          |  3 ++
>  drivers/ufs/host/ufs-qcom.c                   | 29 +++++++++++++++----
>  3 files changed, 36 insertions(+), 6 deletions(-)
> 
> -- 
> 2.50.1
> 

-- 
மணிவண்ணன் சதாசிவம்

