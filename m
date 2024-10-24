Return-Path: <linux-arm-msm+bounces-35700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 540A09AE986
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 17:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 173EC282A87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178FD1EC00E;
	Thu, 24 Oct 2024 14:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpdTgi+u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9081EC008;
	Thu, 24 Oct 2024 14:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729781982; cv=none; b=FgNLTyjgW8XRFVD12MvvhOGefYgleapXXPn1DWUXf79M8XmnR7KQCER9vqmYx4hF9TqdPPrR58jFgkLWpZiSHfK9r+fbzW34ueABDD27h/LrBi4pKkS3SI8vs3pC6QRylztHbXbzXP4p4bv1D3GnSMpa8dKacsNSOcDoFkHyOLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729781982; c=relaxed/simple;
	bh=WfDxMdQAYpgsUsc4zuSTaWQ+cXGHvDgPZwLH3R7eKMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JtYJCr0wk18YXKKe6YIedn/6JTtu/UYzFO0cdpAyYmz1ir76vlSys7KcH492grlbGsCGbBxcXOBJXijYEL/rA9QHAb6CD+hu5SATYhjMEnB9zwrXGnoRfB/46mqNslH6LCyTStgOwXJ4PAW3lBNKdsZwbwH446lafQKyrxd5YOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpdTgi+u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E6DC4CEE5;
	Thu, 24 Oct 2024 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729781981;
	bh=WfDxMdQAYpgsUsc4zuSTaWQ+cXGHvDgPZwLH3R7eKMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XpdTgi+uxs1vEQ5eCCQPc1RBWT2crHhp4NDurH9RjjL0yfLC5+TiMhresH5UKL7OT
	 ZF71V5zBiN6xwbehexR70rU2au3hq+H2VleMYpT6crLnvQfIES66dHC2hQt9WvbXIK
	 wuLHem5laQuRm7Lsq/lpNxQpL6XTZpm1iId8Xvr0s//V6emxb677jGqKx4pcH7LU7L
	 bu2GpCd8+SYAJslWIrdLwzydy+5gfc7UvR/HNOs5+AAp7diRYTWLgngrDK2wUO4BEa
	 9QrzJHjsGNh5ULScnhYnsdrq+sbRGdU7K0X1EU0q5GVho/z6Gk6R0bxRyOHncfS1yw
	 3Zt2pzWPVozZQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] arm64: dts: qcom: Use 'ufshc' as the node name for UFS controller nodes
Date: Thu, 24 Oct 2024 09:59:30 -0500
Message-ID: <172978197050.296432.17420111339243991222.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240514-ufs-nodename-fix-v1-0-4c55483ac401@linaro.org>
References: <20240514-ufs-nodename-fix-v1-0-4c55483ac401@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 May 2024 15:08:39 +0200, Manivannan Sadhasivam wrote:
> Devicetree binding has documented the node name for UFS controllers as
> 'ufshc'. So let's use it instead of 'ufs' which is for the UFS devices.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: Use 'ufshc' as the node name for UFS controller nodes
      commit: 15288649e4c037540fa8e8323d44337fc4316df5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

