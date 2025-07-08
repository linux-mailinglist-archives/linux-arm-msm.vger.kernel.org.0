Return-Path: <linux-arm-msm+bounces-63976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A872AFC4DF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7594518940A8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 08:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CAC299ABD;
	Tue,  8 Jul 2025 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kyqu+CQX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77358D517;
	Tue,  8 Jul 2025 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961580; cv=none; b=SdI8QbEbjtZcp60v/muzbLuBwx1r21HllFIRl9PY8tYKFVBDxlPGPGSvpDN0NPw/MbRFK2btn8SDd2KqkPU22rj+oElNjhS7D67GmGm2cLhmvV7ZJn+nevZUzQDd5A5w5ImptE6d2IxiDtB/zgO0rB5VJEUHDYglLcHg7VyUqLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961580; c=relaxed/simple;
	bh=UFw52grrrw616Gjvfu2OUSVnaRnSOpyLnrG0aT1OL1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CCcbjKw4Sz+auhDm+2UtVbAm5RERKeJb91WdQGyb4DNXDx+OEubOQseTD0wONH5wYLUom6Fn32WP/bbxNClFUPEhDJtAsfUAlGeNdw9G3UlfaEGzBWbOtK/ucH3eiy4+elHHMFzq+iMymcw2ixCP9zHzATWaSuAfMv6Fn48/iX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kyqu+CQX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE560C4CEED;
	Tue,  8 Jul 2025 07:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751961579;
	bh=UFw52grrrw616Gjvfu2OUSVnaRnSOpyLnrG0aT1OL1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kyqu+CQXtx2gJOcVfhfYZSAOxdAUtvEBG5Hvn25xwea3ul67fKg0hIz/0R+oK0mUJ
	 hzCymW1Fsnl2ef9GbmzMulESvkQ3juKDZ/ZrR3q65QKHgXQlx9l66RyhwWW4pEDO0f
	 WXAr0eR2/kD8Kutywi6a1bo6GMgCGOBRtvvfwLHVFrzNOecoeu+UgbrRJOiHgccFQp
	 jUUJEKy1getW2Bo5owSzCx58HHNZeDpTHJN1T60A2FVR6g+q5rn+IWdaXtbHoz1vGR
	 LQy2sAo0K2yVKKVRYo1LpTr5fR1bmvNArGsI5IxpLhmIQRaI6qf5tMkoe89hxgsUmt
	 O3eyFXgdRThog==
Date: Tue, 8 Jul 2025 13:29:31 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	bvanassche@acm.org, avri.altman@wdc.com, ebiggers@google.com, 
	neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V2 2/3] scsi: ufs: core: Add ufshcd_dme_rmw to modify DME
 attributes
Message-ID: <kghfto33klbvpdgehzmjjxzsoqymhrq3dbwbtwa4xddsjdj7q4@uqd7epguntgt>
References: <20250707210300.561-1-quic_nitirawa@quicinc.com>
 <20250707210300.561-3-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250707210300.561-3-quic_nitirawa@quicinc.com>

On Tue, Jul 08, 2025 at 02:32:59AM GMT, Nitin Rawat wrote:
> Introduce `ufshcd_dme_rmw` API to read, modify, and write DME
> attributes in UFS host controllers using a mask and value.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  include/ufs/ufshcd.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index 9b3515cee711..fe4bb248484c 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -1498,6 +1498,32 @@ static inline int ufshcd_vops_phy_initialization(struct ufs_hba *hba)
>  	return 0;
>  }
> 
> +/**
> + * ufshcd_dme_rmw - get modify set a dme attribute

s/dme/DME

Maybe name the function as, 'ufshcd_dme_update()'?

> + * @hba - per adapter instance
> + * @mask - mask to apply on read value
> + * @val - actual value to write
> + * @attr - dme attribute
> + */
> +static inline int ufshcd_dme_rmw(struct ufs_hba *hba, u32 mask,
> +				 u32 val, u32 attr)

Please move the definition to ufshcd.c

> +{
> +	u32 cfg = 0;
> +	int err = 0;

No need to initialize these.

> +
> +	err = ufshcd_dme_get(hba, UIC_ARG_MIB(attr), &cfg);
> +	if (err)
> +		goto out;

Just do, 'return err'.

> +
> +	cfg &= ~mask;
> +	cfg |= (val & mask);
> +
> +	err = ufshcd_dme_set(hba, UIC_ARG_MIB(attr), cfg);

	return ufshcd_dme_set();

- Mani

-- 
மணிவண்ணன் சதாசிவம்

