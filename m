Return-Path: <linux-arm-msm+bounces-6564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 388E8825FEE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jan 2024 15:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FB691C20FF7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jan 2024 14:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8B279D0;
	Sat,  6 Jan 2024 14:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzKRE+oK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2BA79EA;
	Sat,  6 Jan 2024 14:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B52C433C8;
	Sat,  6 Jan 2024 14:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704552289;
	bh=Yi7OaNZV5p0EieRmYaH7pJL/K7HiO8O0ei/Zuz7/Als=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HzKRE+oK//NtlnnAmK0VF+ZGS+4xn3PEgkkrF/18msxnjCowmjCeHqozz4pC/xfwJ
	 gJj1a4PJDv2mFWGqaXgyU52/TntoTYgRsOzcgEWUGTa/F5g6A55YBtHBwDZiLPzyUr
	 UKw3XRwSgYyNWBSTKLoPZZj/fByTvlQimuSyklKYEMaIYDgevSz/tXV8T0taM/2NCF
	 ahZB4bhlDAJ/nanKS9SXjep5Cr+jdn0SufvF4cO7Gm5skRFasTCoIFRU3Pynca+KNG
	 Gk3MEV6I4j/jwGHO7cAxoAWzh+G+yxhkTmuFFb2zOkgnIn/TqOsuv0t05GM3/WlsYv
	 U80pcLUwlwGEw==
Date: Sat, 6 Jan 2024 20:14:36 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: Read PK HASH dynamically
Message-ID: <20240106144436.GB2512@thinkpad>
References: <20240105174253.863388-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240105174253.863388-1-quic_jhugo@quicinc.com>

On Fri, Jan 05, 2024 at 10:42:53AM -0700, Jeffrey Hugo wrote:
> The OEM PK HASH registers in the BHI region are read once during firmware
> load (boot), cached, and displayed on demand via sysfs. This has a few
> problems - if firmware load is skipped, the registers will not be read and
> if the register values change over the life of the device the local cache
> will be out of sync.
> 
> Qualcomm Cloud AI 100 can expose both these problems. It is possible for
> mhi_async_power_up() to be invoked while the device is in AMSS EE, which
> would bypass firmware loading. Also, Qualcomm Cloud AI 100 has 5 PK HASH
> slots which can be dynamically provisioned while the device is active,
> which would result in the values changing and users may want to know what
> keys are active.
> 
> Address these concerns by reading the PK HASH registers on-demand during
> the sysfs read. This will result in showing the most current information.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> ---
> 
> v2:
> -Return ret instead of cnt on error in show()
> 
>  drivers/bus/mhi/host/boot.c | 11 +----------
>  drivers/bus/mhi/host/init.c | 16 ++++++++++++----
>  include/linux/mhi.h         |  2 --
>  3 files changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index edc0ec5a0933..dedd29ca8db3 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -395,7 +395,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	void *buf;
>  	dma_addr_t dma_addr;
>  	size_t size, fw_sz;
> -	int i, ret;
> +	int ret;
>  
>  	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>  		dev_err(dev, "Device MHI is not in valid state\n");
> @@ -408,15 +408,6 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	if (ret)
>  		dev_err(dev, "Could not capture serial number via BHI\n");
>  
> -	for (i = 0; i < ARRAY_SIZE(mhi_cntrl->oem_pk_hash); i++) {
> -		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_OEMPKHASH(i),
> -				   &mhi_cntrl->oem_pk_hash[i]);
> -		if (ret) {
> -			dev_err(dev, "Could not capture OEM PK HASH via BHI\n");
> -			break;
> -		}
> -	}
> -
>  	/* wait for ready on pass through or any other execution environment */
>  	if (!MHI_FW_LOAD_CAPABLE(mhi_cntrl->ee))
>  		goto fw_load_ready_state;
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index f78aefd2d7a3..15c1740a2c88 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -97,11 +97,19 @@ static ssize_t oem_pk_hash_show(struct device *dev,
>  {
>  	struct mhi_device *mhi_dev = to_mhi_device(dev);
>  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> -	int i, cnt = 0;
> +	u32 hash_segment[MHI_MAX_OEM_PK_HASH_SEGMENTS];
> +	int i, cnt = 0, ret;
>  
> -	for (i = 0; i < ARRAY_SIZE(mhi_cntrl->oem_pk_hash); i++)
> -		cnt += sysfs_emit_at(buf, cnt, "OEMPKHASH[%d]: 0x%x\n",
> -				i, mhi_cntrl->oem_pk_hash[i]);
> +	for (i = 0; i < MHI_MAX_OEM_PK_HASH_SEGMENTS; i++) {
> +		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_OEMPKHASH(i), &hash_segment[i]);
> +		if (ret) {
> +			dev_err(dev, "Could not capture OEM PK HASH\n");
> +			return ret;
> +		}
> +	}
> +
> +	for (i = 0; i < MHI_MAX_OEM_PK_HASH_SEGMENTS; i++)
> +		cnt += sysfs_emit_at(buf, cnt, "OEMPKHASH[%d]: 0x%x\n", i, hash_segment[i]);
>  
>  	return cnt;
>  }
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 039943ec4d4e..e46c68218fe4 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -323,7 +323,6 @@ struct mhi_controller_config {
>   * @major_version: MHI controller major revision number
>   * @minor_version: MHI controller minor revision number
>   * @serial_number: MHI controller serial number obtained from BHI
> - * @oem_pk_hash: MHI controller OEM PK Hash obtained from BHI
>   * @mhi_event: MHI event ring configurations table
>   * @mhi_cmd: MHI command ring configurations table
>   * @mhi_ctxt: MHI device context, shared memory between host and device
> @@ -410,7 +409,6 @@ struct mhi_controller {
>  	u32 major_version;
>  	u32 minor_version;
>  	u32 serial_number;
> -	u32 oem_pk_hash[MHI_MAX_OEM_PK_HASH_SEGMENTS];
>  
>  	struct mhi_event *mhi_event;
>  	struct mhi_cmd *mhi_cmd;
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

