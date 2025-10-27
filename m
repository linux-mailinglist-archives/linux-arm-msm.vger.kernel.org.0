Return-Path: <linux-arm-msm+bounces-78933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 724C7C0E4B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 223B0406475
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049EA3090DD;
	Mon, 27 Oct 2025 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a81lVIo2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24303090C9;
	Mon, 27 Oct 2025 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573991; cv=none; b=Bo2H3Egg3DTZWcaEiiqZhTXAKTtU03k5pBJJCbviRDQ8fHjbJKaS4wg6rS7A7s/YoKNq9HgJevaAG2ObK/9gVdj2hSVirrS3VO/YU5PZe3X54jKpijTU4r97TCNCUP+OZ+S+FAIjl4+oOEyXPl+e6AGT9hzhrrwRwntIkOoIEG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573991; c=relaxed/simple;
	bh=B3kCA78ErKI5LnmPp9AS/X+XkfKcerKRS2hoEU0e9sM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ezpGCbruKKer+6LOsn3AVi/jSvDBDK2i3bLz65p7ZkxaajUw8+LtK9QWYZNgitndvPFe0kmlHdqpfWQt4HB7QE/8pFvc+xdhY4PfFsXOjnPhI4yVUnKft9zhhZAUQ3jz6JmI2Qhu7Jv0d83hnANmxxPAF6K8TceME5RlcR+pCcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a81lVIo2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3EB5C19421;
	Mon, 27 Oct 2025 14:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761573991;
	bh=B3kCA78ErKI5LnmPp9AS/X+XkfKcerKRS2hoEU0e9sM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a81lVIo2U8vYpVgrz0G+VbBwp/fYeVnsCdHiUvm8BiHnLRiDbiTlL5gbC8x08tS/z
	 sSgMD0Bd9bB550urR4wT2Nyi6bk3NgwQ9AJyraWOKw14dNhXQLEoANPgjGC4EFi5hv
	 x9n97nDg5JXHGLHRyLEeJPEdkMX0VHqOrYIms/5ZpllMTLQvGRhl7EOWnLXQuxbWVs
	 zp2j8c8KXL8IoWa0qKvat3bICILH9s3gDweZcHB7MxpXPnNu6zILtsl81Vu15mb7+W
	 ImzMfYXzoGTJgpbTgZ0N06UBiEdBGsu3H/9oGMWDsEwVLr9zFigXnsBi9/3LLlnphf
	 /jNQg993Q7pHw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add the missing entries in the SMEM image table
Date: Mon, 27 Oct 2025 09:09:06 -0500
Message-ID: <176157405468.8818.2988793421685000869.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929-image_crm-v1-0-e06530c42357@oss.qualcomm.com>
References: <20250929-image_crm-v1-0-e06530c42357@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Sep 2025 19:47:06 +0530, Kathiravan Thirumoorthy wrote:
> Rather than adding support for one each image at a time, populate all
> the image details at once for the completeness. Additionally sort the
> socinfo_image_names array in alphabetical order.
> 
> 

Applied, thanks!

[1/2] soc: qcom: socinfo: arrange the socinfo_image_names array in alphabetical order
      commit: abac241e1d5da20332160b29b23f357016abe3e1
[2/2] soc: qcom: socinfo: add the missing entries to the smem image table
      commit: dcbce2c23e5edcba2ac538e7a53d0e3d1a21f975

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

