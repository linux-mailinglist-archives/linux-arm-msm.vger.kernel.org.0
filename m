Return-Path: <linux-arm-msm+bounces-80210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2742DC2F33E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 04:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C2A0A4E5DCD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 03:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0882C158A;
	Tue,  4 Nov 2025 03:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wo52bF9f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B032C11D9;
	Tue,  4 Nov 2025 03:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762228178; cv=none; b=Qmu6kZb+W14Oum/eT5+/EdBkrqaGk359bz+ANuyfEAE1J6YhouvhDDKjQ+cX8E0vvW/0k9pQPCgMyq/7GvtuC1RMEcfqUZm6hxRg2/+MzonAcqMuWh0IVWiWBhVdYNOXYSPSNMlsrL8DYDGGAxLpIs0W9urqkcS7dTOxDT3qf20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762228178; c=relaxed/simple;
	bh=CSPsHBz13TA995XDSdatHZpf+dRhb48wIWVZfHIFDtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j3OUA6zSF7liy8bdgWnEulRnMDFbviAcJJX6t5rjl5qwS0upy18F39wCLFYZeCO/iotbQEgqcxjlgSSJiZX+SduBVCfwWdl80ETni/wCbz+YVMuQV3qtKZqNsV8hCVq0spKNEPvMhfEAj+1an/m9SM61g7VYXU1XBdbcd5qWKtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wo52bF9f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A28DC116D0;
	Tue,  4 Nov 2025 03:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762228177;
	bh=CSPsHBz13TA995XDSdatHZpf+dRhb48wIWVZfHIFDtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wo52bF9ffuMyRrBxcov2Xx9DNTWgd40eD8jyKC3eiFzvzGmQXy+e3LGH7hG3QmH9S
	 gLEyJogHshWT9DgFQZu2lN273F8TuR6E5ZKsykyJu1/LN+s+M+1T5ksv9kgpllG44Q
	 sCS43Ewp4ackZrRB9sG3HQmR5VLatx+N5kv8rRCLAf5QSeENiQpeZH8WW+b8dLajH9
	 8uEwJ1bYkA/i45BHIyaUbVE1T5CJovHaUrHARH2i2D+g62mMJvuF6HLTNUqV5LYuB5
	 Xjn4dLmF5EGnrKlQKI1Oh3EyBmsrqsnnrhK7kIKz9s6lYgpsktl7uE9IvyclKj6k8v
	 i1vuzAODfu7OQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chris.lew@oss.qualcomm.com
Subject: Re: [PATCH v2 0/2] Add support to extract the image versions beyond the first 32 images
Date: Mon,  3 Nov 2025 21:53:02 -0600
Message-ID: <176222838022.1146775.7414051423533712601.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031-image-crm-part2-v2-0-c224c45c381a@oss.qualcomm.com>
References: <20251031-image-crm-part2-v2-0-c224c45c381a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 31 Oct 2025 11:21:00 +0530, Kathiravan Thirumoorthy wrote:
> SMEM item 667 contains the image version details beyond the first 32 images.
> Add support for the same. While at it, drop the WARN_ON() from
> qcom_smem_get() and qcom_smem_alloc() as it doesn't add any values.
> 
> IPQ platforms doesn't have the SMEM item 667. So I couldn't validate the
> image version details from SMEM item 667.
> 
> [...]

Applied, thanks!

[1/2] soc: qcom: smem: drop the WARN_ON() on SMEM item validation
      commit: d403276969b2aae147f671506a6c69089587ddd7
[2/2] soc: qcom: socinfo: add support to extract more than 32 image versions
      commit: db252c105648d1c15826b24dd4251b005e243c30

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

