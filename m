Return-Path: <linux-arm-msm+bounces-64016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 123FFAFC87B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 305C03BED3C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363D02D8384;
	Tue,  8 Jul 2025 10:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dT8CQC2X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FBE2D8375;
	Tue,  8 Jul 2025 10:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751970898; cv=none; b=NtB54UI7qhW594snvP//Lpblu9HL7boJc0SZ3KpeTVvD7v6qYg/UP5U6zuiXsavtKMRwAJqVpzxS7cY+GFsiTAHm5TVddmb6MyVlWMSYCzZaTMea98NVSTdHAMSRlX68x+FOPE9evSnoR4BVFYmeNJi3bleztoCLxt6onoHz+B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751970898; c=relaxed/simple;
	bh=n53/sygAidGPo7i+HNjWOm5XrXac9IDR0kWLzplqD+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PneaObchTBD6oICnKvVJAMAUXletiLeEulw+9KmMPgN5hK4qSNrRPrdKDFo5KNNBESgsQTEZ2wEwOSR0s0p+M0wHPtby+gMKH6w48NYCaX9K2/TSGx63zOgbZNw0TB65pfvddgyZKpNCkot/d6kga14S2GImQxxjmj0sMyueWVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dT8CQC2X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2FAC4CEED;
	Tue,  8 Jul 2025 10:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751970897;
	bh=n53/sygAidGPo7i+HNjWOm5XrXac9IDR0kWLzplqD+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dT8CQC2XI4A7csvIr84Ke3pH+0dXSRXP9DkQe6ljbnyiTcmnUPooF4CMWfMTN1rfe
	 Smdaku3iNQNuZR+3YrP8n6SbZnft8KYyZIkD1ZG7tF60OiQkM4ShwzcgTxwsSw5HTB
	 d9uCrd6qUk3WnSmVeUviQbqd7joWpgr2G6Ueudy40B/TcLBwLT6wCszI/PGMWlcrK8
	 uZvFZHIK/HpQc0L6Dktvl+WP0S7ECOfPx8elfBxwnZrKm95HyMrpRcnQJQ1S/j3vWs
	 v11gtTk8bIqX7Bo4kwW+gpIrxiFnxjdnMJZ6DuXLtq2Zgjho5Om2l4YPcVN5+lY4Va
	 mqVhFAms/3RJg==
Date: Tue, 8 Jul 2025 16:04:47 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Asutosh Das <quic_asutoshd@quicinc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Stanley Chu <stanley.chu@mediatek.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Can Guo <quic_cang@quicinc.com>, 
	Nitin Rawat <quic_nitirawa@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC/RFT 1/5] ufs: ufs-qcom: Fix UFS base region name in
 MCQ case
Message-ID: <xujhcaw2nj7mzb4cspjsxem75lqfwa7ivnfpzccor7npdu5d7c@xad5hx4b2m4e>
References: <20250704-topic-qcom_ufs_mcq_cleanup-v1-0-c70d01b3d334@oss.qualcomm.com>
 <20250704-topic-qcom_ufs_mcq_cleanup-v1-1-c70d01b3d334@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704-topic-qcom_ufs_mcq_cleanup-v1-1-c70d01b3d334@oss.qualcomm.com>

On Fri, Jul 04, 2025 at 07:36:09PM GMT, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There is no need to reinvent the wheel. There are no users yet, and the
> dt-bindings were never updated to accommodate for this, so fix it while
> we still easily can.
> 

What are you fixing here? Please be explicit. "std" region is not at all in the
device memory map? Or it was present in some earlier ones and removed in the
final tape out version?

- Mani

> Fixes: c263b4ef737e ("scsi: ufs: core: mcq: Configure resource regions")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 318dca7fe3d735431e252e8a2a699ec1b7a36618..8dd9709cbdeef6ede5faa434fcb853e11950721f 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1899,7 +1899,7 @@ static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
>  
>  /* Resources */
>  static const struct ufshcd_res_info ufs_res_info[RES_MAX] = {
> -	{.name = "ufs_mem",},
> +	{.name = "std",},
>  	{.name = "mcq",},
>  	/* Submission Queue DAO */
>  	{.name = "mcq_sqd",},
> 
> -- 
> 2.50.0
> 

-- 
மணிவண்ணன் சதாசிவம்

