Return-Path: <linux-arm-msm+bounces-24906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2809F924773
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 20:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E297F288B3A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 18:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90321CE090;
	Tue,  2 Jul 2024 18:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWnBpUZy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7521CE08C;
	Tue,  2 Jul 2024 18:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719945862; cv=none; b=M5Jv4abCDWDe29me2rW5g2laIXBdGUqMQI6fRBvCRyWwtR2mISRFMDnnAcmwzWCiV4a1h0xT1QOMvBAYPFsQXywU+jFD4thRIcG+8FC/NHjGAUxphRSJ/MRzMk/hLAzoLi0QXlTReaoAMj9bD3ZbzO6K1aqM8RJgq4ATDPM/r3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719945862; c=relaxed/simple;
	bh=+VYPaSHoBsGAn+u4fC7TOldFkvHGa8TzIynwBLs1h0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oipt5h8hhNymy8MolowSPBRMzKSd0hAyMkVRonUcsOWAxkQMPrU6a0qX6C8nTOF6b1kd+17L5g2d5fYZoPQkJt7EgjyXN2jlbWwFBnRZpIaLMSjgeJ4l9VrX9vqUP4b57cvs2qK/DZ7HFA2qFmkNlK6b1+dVfEtve96T3pKRH04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWnBpUZy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C659C4AF0C;
	Tue,  2 Jul 2024 18:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719945862;
	bh=+VYPaSHoBsGAn+u4fC7TOldFkvHGa8TzIynwBLs1h0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KWnBpUZyXeLaw5+Chn6PRVtR4pGK3O+5TWwX49X+hP2IMlOvm08x3K65/cP0M39W5
	 LeOwp33LjzXWy3jAHPE80f6NCFf4N1sNto4MWLTClGDqeYrqOtsKPOqPZJ1giBwOP+
	 8MxKOAV63iCNU/9a5uG/IGVoR8+Y3GToRymrw1ZYiTbC3EG4lOb2HgTy/lEd1V51vn
	 go1/2qM1t7k2CLHWLkT2OdIsMeUs2Q3j8SrouhkXmoG0eWmhsg6dR2VhQ8XJU71zy8
	 28fevgoqpF6GTsM+LVSAGtR7f1RpoRbdG4rjPdpVz2BvfVRLxf3B2hLHTwL8U3MNU+
	 aFq4vrnC7Cx+A==
From: Will Deacon <will@kernel.org>
To: robdclark@gmail.com,
	robin.murphy@arm.com,
	joro@8bytes.org,
	iommu@lists.linux.dev,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: record reason for deferring probe
Date: Tue,  2 Jul 2024 19:44:01 +0100
Message-Id: <171993979643.1971775.11685745937828043612.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1719910870-25079-1-git-send-email-quic_zhenhuah@quicinc.com>
References: <1719910870-25079-1-git-send-email-quic_zhenhuah@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 02 Jul 2024 17:01:10 +0800, Zhenhua Huang wrote:
> To avoid deferring probe smmu driver silently, record reason for it.
> It can be checked through ../debugfs/devices_deferred as well:
> /sys/kernel/debug# cat devices_deferred
> 15000000.iommu  arm-smmu: qcom_scm not ready
> 
> 

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: record reason for deferring probe
      https://git.kernel.org/will/c/9796cf9b3eb9

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

