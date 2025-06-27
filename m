Return-Path: <linux-arm-msm+bounces-62709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C57AEABDA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 02:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 914261C40A1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 00:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127AAF510;
	Fri, 27 Jun 2025 00:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rYm0bADu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BC3F4E2;
	Fri, 27 Jun 2025 00:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750985227; cv=none; b=H5Bm6vt+mRNtdC7KedxNfFhXfU7dUVMvgpRVW1X1otONMG+lcpl1bqppd6CCsyPP6Nv/R3mdeVAcnkQ1fvEgQjjtHBVTIo4TAvCCJfsXAji9H+q3McgoJlflNf6BRMqeQptSceHvIxZK6Thc6r1BOMiWcUaxG+eEPrKIta2+r7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750985227; c=relaxed/simple;
	bh=gSOYkdrIr1inTgcm45vXda8FdJ3f7dKJJNg/fWqmP3E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X+avlwiyCoabncfDpILCocfdcK0YYLqMw0z7Jx+C8tIy8bhciDFoAlBo7fNNyZ6/FiGPHxnK9S5nYyVoMdCbmisqjHbI8KUqQjgiYSCQ2Cg0IyUiL6kCj8RdfCYOrRlkNim5GO6ZF647qjrm7gmMMv4A/mLHoq+c6hIDXZctL1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rYm0bADu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C8EC4CEEB;
	Fri, 27 Jun 2025 00:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750985225;
	bh=gSOYkdrIr1inTgcm45vXda8FdJ3f7dKJJNg/fWqmP3E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rYm0bADu8vuDWdLjtZ1INvp8I+M1SeGE4XcqNoMSOeOWJEgHgip4pzF/19Wco5OMc
	 m7DGEn/pJUY+nMBrgSsKrB6TPiz1p3c6+Sn9mHunOFrI6tnT7JxTJNjbxyd6swQr60
	 dxHfexifbec9dis6hceWet5Bgr0XYO6uwFXA4Y1KR2jIi2/d++Jdao0++M0rMw49wW
	 4lq+5pU7S6NhVwWJP4vEj36jKSZZMWwWcN37nMNyRqesSh/aGJcqj9uHsVFGJgmRn4
	 npZSW/RO3D8tW82lpjdEr6mcDXc6YoCKfn+1I7uHJ+axQVs/lzFLdNKltE4nU1u5/X
	 PzULvANoMwdiQ==
From: Vinod Koul <vkoul@kernel.org>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com, 
 martin.petersen@oracle.com, bvanassche@acm.org, andersson@kernel.org, 
 neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com, 
 dmitry.baryshkov@oss.qualcomm.com, quic_cang@quicinc.com, 
 Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Aishwarya <aishwarya.tcv@arm.com>, 
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <20250623134809.20405-1-quic_nitirawa@quicinc.com>
References: <20250623134809.20405-1-quic_nitirawa@quicinc.com>
Subject: Re: [PATCH V3] scsi: ufs: qcom : Fix NULL pointer dereference in
 ufs_qcom_setup_clocks
Message-Id: <175098522490.106297.11028357355875089075.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 17:47:04 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 23 Jun 2025 19:18:09 +0530, Nitin Rawat wrote:
> Fix a NULL pointer dereference in ufs_qcom_setup_clocks due to an
> uninitialized 'host' variable. The variable 'phy' is now assigned
> after confirming 'host' is not NULL.
> 
> Call Stack:
> 
> Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000000
> 
> [...]

Applied, thanks!

[1/1] scsi: ufs: qcom : Fix NULL pointer dereference in ufs_qcom_setup_clocks
      commit: 720fa0cb59e411eca6b274f78073b6d2fe68eb45

Best regards,
-- 
~Vinod



