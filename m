Return-Path: <linux-arm-msm+bounces-63974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E353AAFC4A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 09:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 405FF174778
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 07:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D8329C323;
	Tue,  8 Jul 2025 07:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bS0s2t8o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F9429B8E6;
	Tue,  8 Jul 2025 07:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961097; cv=none; b=KCmuAhBZkkILlFmTxQcN7grFBdhEXqM/LM9yNHk3xDqHSR4asEljXOwQToT0MdSATsAxxSRNO4YSbCfkDJtP6l6405mQhxm4eHnVlVi3O8m3je/uptYto/vlCi3wExrt6nbbl97jLM0xw91a49sdyjnC1bO1mneN5MuPrNqjWUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961097; c=relaxed/simple;
	bh=/1JtqoeEkpB6seCuYqUwyK70o3RsmdkxYde7eVx/l9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDpy5UdQZdgaxkZfJMW3uAK/kbDw9MBeC0CKsK93SVt/wvay/mwRR1Shsfuzx/2vnFqZDpgENOsLMAyoK1QLbvXxDQC0Dwh/jKe8/JqZ8bukxtMmlWjKATXKlyjCV/TRfjpDG55FViHVTv0Zyqa94g4v9oxi5AA9N8O0UVUzFPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bS0s2t8o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCCDEC4CEF7;
	Tue,  8 Jul 2025 07:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751961097;
	bh=/1JtqoeEkpB6seCuYqUwyK70o3RsmdkxYde7eVx/l9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bS0s2t8oVX9SZ3qWJPgc0j4Vajv62nAeDN3eovHXv8GUp+MLwvy2ettYhBn5WmHyK
	 awk5ujJzdTCIEvTbeC066VyoJJyqldpJ+ZaHZVkGc48KBpXPblQHknxj3MfiND+Z7U
	 YwuSvX5lMcQZTg+LhfMJJo1sRRvDBiCc3d1dVKMMvLtsgok/lxl96yarhRCVZOfl9y
	 2sth84auDyvXQzjH3YOSbWtd0kcf6DNeobbz+8E5F57Aqum4B7y8zYqtGewepcHG8P
	 w2yQGmhV7UK8O4D9dCI1V9ZY97c8EBYfG72FgFhLpLrnRrIzo8gOdHeIPNw9oSuCd3
	 DxDyB4iZhSEPA==
Date: Tue, 8 Jul 2025 13:21:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	bvanassche@acm.org, avri.altman@wdc.com, ebiggers@google.com, 
	neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	"Bao D. Nguyen" <quic_nguyenb@quicinc.com>
Subject: Re: [PATCH V2 1/3] scsi: ufs: ufs-qcom: Update esi_vec_mask for HW
 major version >= 6
Message-ID: <b7uex5sr3rr4q7bed5hh7ocriajmsiuucjrj6cuosoii4mlygn@dximocb3ao7b>
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
> 
> The MCQ feature and ESI are supported by all Qualcomm UFS controller
> versions 6 and above.
> 
> Therefore, update the ESI vector mask in the UFS_MEM_CFG3 register
> for platforms with major version number of 6 or higher.
> 
> Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

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

