Return-Path: <linux-arm-msm+bounces-68954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C45EEB2466E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 12:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8982916411F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 09:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6B12FA0FD;
	Wed, 13 Aug 2025 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIryKJOX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BE72F7453;
	Wed, 13 Aug 2025 09:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755078949; cv=none; b=pI6MzM8KTFqb8shABeftKXHzgN8eLbEbsXWZw/WK5uEHSmZ6K1dtx8biSQpDnlcN6Nnj1IRpkdPllPGMKCINY6vuP+fByvMlqI5aq6OLztzFZadmgzkvGnJC3pXYekguyQo63sHFaWGPmhx4hFzc3vjgrWU8n62epp0iQTLgG8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755078949; c=relaxed/simple;
	bh=qoss9gBQfXJPeGqiJY+aLKqpCiT20+A7Tc3eoa5CTjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1uppE+tChiL4POPCA7seuwjYgQQ8BwKRpnfdg+TSRjMG8U2O4myQJ384BWhg5mh08DmyW8IL8Ri7DNAEQRGVU4mIbZ7vzsMpSCcetwhPeFqBYEk2WFxeGTXoiz4sycE25xOh2glGZOy9ZEL5YaYs4bOYMOvtbN+m8rfRRvfnEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIryKJOX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4419C4CEEB;
	Wed, 13 Aug 2025 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755078948;
	bh=qoss9gBQfXJPeGqiJY+aLKqpCiT20+A7Tc3eoa5CTjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oIryKJOXuKzsBJxAANbWkdKRAzianWzd51zKouaIMXQeBFROvRyeFlaKKLZZ/T4/d
	 KtE+Y282z04iVn0XAVWEpkM6Oniq4gQrDUYIZZddY2EHfCpkdvXqL/BAsodaflHPpP
	 QquroJRsF60l3X5igJDWPg9bZ+DgqZqlbOk5EXuMZu6zRJypeiauAYw5zgVf/2+uX4
	 I9CSyW1CdaZHTtKCRNNICh4RxlR3yxjwsLyCrxHV8IBZY2A3TV+MWkBqSF9mAJ8uDS
	 7ihKITuiQGdLudL6d9hVUKVUS8+wG87w2HGmwSJ+w0sP64os48ofNGy+AxvyiZHleR
	 Xp2jVI9s6qF+w==
Date: Wed, 13 Aug 2025 15:25:40 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Palash Kambar <quic_pkambar@quicinc.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_nitirawa@quicinc.com
Subject: Re: [PATCH v3] ufs: ufs-qcom: Align programming sequence of Shared
 ICE for  UFS controller v5
Message-ID: <x5pkfdxwnpqv66d4y3bucpd6vpxbsahdt2mdj6mdlb43emfkxn@dktn4wpuosgr>
References: <20250812091714.774868-1-quic_pkambar@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250812091714.774868-1-quic_pkambar@quicinc.com>

On Tue, Aug 12, 2025 at 02:47:14PM GMT, Palash Kambar wrote:
> Disable of AES core in Shared ICE is not supported during power
> collapse for UFS Host Controller V5.0.
> 

Could you please add more info on the issue observed?

> Hence follow below steps to reset the ICE upon exiting power collapse
> and align with Hw programming guide.
> 
> a. Write 0x18 to UFS_MEM_ICE_CFG
> b. Write 0x0 to UFS_MEM_ICE_CFG
> 

Please be explicit about the fields you are writing to.

> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
> 
> ---
> changes from V1:
> 1) Incorporated feedback from Konrad and Manivannan by adding a delay
>    between ICE reset assertion and deassertion.
> 2) Removed magic numbers and replaced them with meaningful constants.
> 
> changes from V2:
> 1) Addressed Manivannan's comment and moved change to ufs_qcom_resume.
> ---
>  drivers/ufs/host/ufs-qcom.c | 14 ++++++++++++++
>  drivers/ufs/host/ufs-qcom.h |  2 +-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 444a09265ded..60bf5e60b747 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -38,6 +38,9 @@
>  #define DEEMPHASIS_3_5_dB	0x04
>  #define NO_DEEMPHASIS		0x0
>  
> +#define UFS_ICE_RESET_ASSERT_VALUE	0x18
> +#define UFS_ICE_RESET_DEASSERT_VALUE	0x00

Please define the actual bits as per the documentation, not the value you are
writing. Here, you are changing two fields:

ICE_SYNC_RST_SEL BIT(3)
ICE_SYNC_RST_SW BIT(4)

> +
>  enum {
>  	TSTBUS_UAWM,
>  	TSTBUS_UARM,
> @@ -756,6 +759,17 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	if (err)
>  		return err;
>  
> +	if ((!ufs_qcom_is_link_active(hba)) &&
> +	    host->hw_ver.major == 5 &&
> +	    host->hw_ver.minor == 0 &&
> +	    host->hw_ver.step == 0) {
> +		ufshcd_writel(hba, UFS_ICE_RESET_ASSERT_VALUE, UFS_MEM_ICE);
> +		ufshcd_readl(hba, UFS_MEM_ICE);
> +		usleep_range(50, 100);

Please add a comment above the delay to make it clear that the delay is not as
per the doc:
		/*
		 * HW documentation doesn't recommend any delay between the
		 * reset set and clear. But we are enforcing an arbitrary delay
		 * to give flops enough time to settle in.
		 */

> +		ufshcd_writel(hba, UFS_ICE_RESET_DEASSERT_VALUE, UFS_MEM_ICE);
> +		ufshcd_readl(hba, UFS_MEM_ICE);
> +	}
> +
>  	return ufs_qcom_ice_resume(host);
>  }
>  
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index 6840b7526cf5..cc1324ce05c7 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -60,7 +60,7 @@ enum {
>  	UFS_AH8_CFG				= 0xFC,
>  
>  	UFS_RD_REG_MCQ				= 0xD00,
> -
> +	UFS_MEM_ICE				= 0x2600,

As the internal doc, this register is called UFS_MEM_ICE_CFG.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

