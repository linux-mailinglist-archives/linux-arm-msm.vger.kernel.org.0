Return-Path: <linux-arm-msm+bounces-64022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D43AFC98E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 13:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DE9A3ABD77
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 11:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DA12D9480;
	Tue,  8 Jul 2025 11:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZkcCWHy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2781F2D8397;
	Tue,  8 Jul 2025 11:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751974121; cv=none; b=GadfGbzfTcxiuer72xGMRJszmbNuHFSS36F1NNLiGUuQksVqNUJvxrVdhIFSY2Cb3/VVb0McHt6+PubkMWefh4EJpiwTbcpvLIf7juXAVM2RV6L/P87p+U8uG/mda58dyF/tcCijXOQWmuki562dj17oBJPCkl69pgeurYpgmtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751974121; c=relaxed/simple;
	bh=PAI6WWFjtdwba/04acNLopfZYFgXznmyKhSYceX0CEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtM22Ngpto4ihGVQzk/kTd2EQXUhr5Ts6zBP9MvSOkW7M6EoRU8Wo3WbWc2VM28NBjTaFd28hyQ9Szy4OIdm7msD2aMBFKWhE8SHpg7F+6NhLlj5sJNO0GxjH7iQV396KKPTvKGzeAAiP24S91cZU0Ntt07ZBodpMB3QgFKsF9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZkcCWHy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0851EC4CEED;
	Tue,  8 Jul 2025 11:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751974120;
	bh=PAI6WWFjtdwba/04acNLopfZYFgXznmyKhSYceX0CEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GZkcCWHy/s1fPtI1pg5EzNMm3q/RrWvryx9XfoEccjN0AR/whV4DY81m4ilcxiAAw
	 1MqILkTdvHwieuH6G0I3Lve1NdLzOdQbZPaXcNXd628OBjAQQiabHY8qTNQva4G/Pl
	 I/nALbY+YIDelNdRPnHVf2fmiBO2GHXMO8etY6ceABrbcg+JXZ8l1jnTZNEJFF/Pco
	 BVE1B7Ix2qcfvHafpqgP85De9qQQvD1nxdAxnyuAkrzVUgZAoUMJv1ml045l3IB5Cm
	 t/Api+Dt8MWa5qYSxJjVXBjDzg7NNhbh1fyFpmAdqVUSibdBzBOCC/eW3sZgeVB9ya
	 qD9NnULPDgk5g==
Date: Tue, 8 Jul 2025 16:58:31 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Asutosh Das <quic_asutoshd@quicinc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Stanley Chu <stanley.chu@mediatek.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Can Guo <quic_cang@quicinc.com>, 
	Nitin Rawat <quic_nitirawa@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [RFC/RFT PATCH 0/5] Clean up UFS(-qcom) MCQ situation
Message-ID: <mh4vv3i64rfx4hog7vgw6hnqk2ehrxkhz45q4e3pg66ufqsx37@csffhmn5fwm2>
References: <20250704-topic-qcom_ufs_mcq_cleanup-v1-0-c70d01b3d334@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704-topic-qcom_ufs_mcq_cleanup-v1-0-c70d01b3d334@oss.qualcomm.com>

On Fri, Jul 04, 2025 at 07:36:08PM GMT, Konrad Dybcio wrote:
> The initial implementation was quite messy, including requesting
> regions that do not really exist in hardware (or at least not in the
> way they were described).
> 
> As we have no users (and the corresponding dt-bindings were never even
> accepted), remove a whole lot of boilerplate code and clean up the
> software's expectations.
> 
> Note that this revision does not fix the bindings defficiency yet.
> 
> Compile-tested only & not the best code I've written, but I'm looking
> for feedback whether this approach is acceptable.
> 

I pushed for the bindings change within Qcom for a very long time, but it
didn't materialize. I don't think it makes sense to accept any series
targeting MCQ without bindings change (especially when it touches the memory
regions).

So please include the bindings change when you post the *real* series.

- Mani

> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (5):
>       ufs: ufs-qcom: Fix UFS base region name in MCQ case
>       ufs: ufs-qcom: Remove inferred MCQ mappings
>       ufs: ufs-qcom: Don't try to map inexistent regions
>       ufs: ufs-qcom: Rename "mcq_sqd" to "mcq_opr"
>       ufs: ufs-qcom: Kill ufshcd_res_info
> 
>  drivers/ufs/host/ufs-qcom.c      | 151 ++++++++++-----------------------------
>  drivers/ufs/host/ufs-qcom.h      |   4 ++
>  drivers/ufs/host/ufshcd-pltfrm.c |   4 +-
>  include/ufs/ufshcd.h             |  26 +------
>  4 files changed, 45 insertions(+), 140 deletions(-)
> ---
> base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
> change-id: 20250704-topic-qcom_ufs_mcq_cleanup-3e7614ae06a8
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

