Return-Path: <linux-arm-msm+bounces-63975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 580C1AFC4B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 09:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E67C4A4B7B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 07:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C97E29A308;
	Tue,  8 Jul 2025 07:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tANrVRMG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211681FFC41;
	Tue,  8 Jul 2025 07:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961208; cv=none; b=niuAl5nKuC+Iw0TZKsBqIGQkpisUb4/1E7yUA+88UfLUrrEjlK9tlo5/SgU1dDuyODla+8iVWcQSa0FuVPWPz+p9RsUvdsZ0/n0Sj0SL9WTDGr9ZzsEKsWL7kU9W3iMF10SRS1RbSVwQ7YFHv/NOTNAgueTPAP9NTihFnQLcw/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961208; c=relaxed/simple;
	bh=Jyzx+XMevh7S3B6VJiH6+KPsG7GZ+sm10yapzQzysBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gp2AMVkFYIMRqaWP4P0xv5iZFIvBEj7GMvqZusqyNznAdRGuuLTQW40Km/0c3kA1OY7jA79RMqvtGCsZK9kHpTb5C52EHrLZJJ9IElpb00B/5ZGxQNRt7c81Dk41HOVI8FsFlYOYPObD+eS7sh4WEBXoTEcA6ApzPI/KJ1C5TYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tANrVRMG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCADC4CEED;
	Tue,  8 Jul 2025 07:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751961207;
	bh=Jyzx+XMevh7S3B6VJiH6+KPsG7GZ+sm10yapzQzysBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tANrVRMGWZakoww+ki6oQPT67oklBbOTQYOVRSEhHvcFXpQtoYSBiUUUGlR210S73
	 Yf0vRPO9VHmPhkjYEQhe4mQBnAk5hUliukPBLOZfM6sO0+7md1NP5KvHsWJqpQvxM/
	 ab2f+iLZSShHbwscouIlEYrozeHwjpJaPDOFniRv4hU6l8NB354Ac/LN7P3m3jek0z
	 9emLC7xdnfYNwzz90YTgk0Djs4eUcWgmnrVuDxe8tTqxfKjPJzXeAMtGIp1xJjHnRK
	 ptkoZ8+LGBxF4sn/kR58blbnQWhnREpO6cfcnnHlokZH0qaBmegCjXJJy8VGAF8Gh5
	 jc3Q79LNc/vKQ==
Date: Tue, 8 Jul 2025 13:23:19 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	bvanassche@acm.org, avri.altman@wdc.com, ebiggers@google.com, 
	neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	"Bao D. Nguyen" <quic_nguyenb@quicinc.com>
Subject: Re: [PATCH V2 1/3] scsi: ufs: ufs-qcom: Update esi_vec_mask for HW
 major version >= 6
Message-ID: <ldid3ptehto2kmzyixih73vc7tszwdiitr74rnwklxeeekwxrn@mm7zmyfickda>
References: <20250707210300.561-1-quic_nitirawa@quicinc.com>
 <20250707210300.561-2-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250707210300.561-2-quic_nitirawa@quicinc.com>

On Tue, Jul 08, 2025 at 02:32:58AM GMT, Nitin Rawat wrote:
> From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>

Nit: Please use consistent subject prefix:

scsi: ufs: qcom:

Maybe we should get rid of 'scsi' prefix since the ufs code is now moved
outside of drivers/scsi/. Bart?

- Mani

> 
> The MCQ feature and ESI are supported by all Qualcomm UFS controller
> versions 6 and above.
> 
> Therefore, update the ESI vector mask in the UFS_MEM_CFG3 register
> for platforms with major version number of 6 or higher.
> 
> Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 318dca7fe3d7..dfdc52333a96 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -2113,8 +2113,7 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
>  
>  	retain_and_null_ptr(qi);
>  
> -	if (host->hw_ver.major == 6 && host->hw_ver.minor == 0 &&
> -	    host->hw_ver.step == 0) {
> +	if (host->hw_ver.major >= 6) {
>  		ufshcd_rmwl(hba, ESI_VEC_MASK, FIELD_PREP(ESI_VEC_MASK, MAX_ESI_VEC - 1),
>  			    REG_UFS_CFG3);
>  	}
> -- 
> 2.48.1
> 

-- 
மணிவண்ணன் சதாசிவம்

