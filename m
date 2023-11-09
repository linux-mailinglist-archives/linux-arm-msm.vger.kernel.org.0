Return-Path: <linux-arm-msm+bounces-330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E437E6EDF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 17:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 915A21C209E7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 16:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D11219FE;
	Thu,  9 Nov 2023 16:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3fFGh4K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D00374DF;
	Thu,  9 Nov 2023 16:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0E5C433CA;
	Thu,  9 Nov 2023 16:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699547586;
	bh=iwH27tYu+P7Y1x7hZ5JuE532p4duwWE/n3Uu9Or2XNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J3fFGh4KIpq1TnzrNOmXXWidRYaHjfyeFKnciwAQyU/CejNlDAL+gnmPwCaBsgv9a
	 /oXcreb34SttsF9ceHXowP42SupsqNQb0z1zgB+4cFjD6sBrlNgpyRMYuqJf5nOs7k
	 yTKs5eE5dts7e4JZzFVowCe5qrekhcF9qhfNzeWLyWKAfwff3WMkXI4Rq/sdx69iu4
	 CsFdvxbDFGitd49vizBmG4+b3Z4GfjJUXek9AnjW0y3GXhgUR0h0lkG2+gCIUsm4ga
	 Qeed+hpUZdLN9oKhmAy5EVR7t2ey9MJ5PR70/zeAQS6sRM+vMSa/cVHkh0buHket+R
	 c7sdtjJCBarpQ==
Date: Thu, 9 Nov 2023 22:02:53 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: quic_jhugo@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH v3 3/4] bus: mhi: host: Avoid processing buffer and event
 of a disable channel
Message-ID: <20231109163253.GL3752@thinkpad>
References: <1699341365-47737-1-git-send-email-quic_qianyu@quicinc.com>
 <1699341365-47737-4-git-send-email-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1699341365-47737-4-git-send-email-quic_qianyu@quicinc.com>

On Tue, Nov 07, 2023 at 03:16:04PM +0800, Qiang Yu wrote:
> Ckeck mhi channel state after getting chan->lock to ensure that we only
> queue buffer to an enabled channel and process event of an enabled channel.
> 

This commit message doesn't give proper explanation on how the channel can go to
disabled state in between parse_xfer_event() and mhi_gen_tre().

- Mani

> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> ---
>  drivers/bus/mhi/host/main.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index a236dc2..b137d54 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -672,6 +672,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>  			}
>  
>  			read_lock_bh(&mhi_chan->lock);
> +			if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED)
> +				goto end_process_tx_event;
>  		}
>  		break;
>  	} /* CC_EOT */
> @@ -1211,6 +1213,8 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  
>  	/* Protect accesses for reading and incrementing WP */
>  	write_lock_bh(&mhi_chan->lock);
> +	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED)
> +		return -EINVAL;
>  
>  	buf_ring = &mhi_chan->buf_ring;
>  	tre_ring = &mhi_chan->tre_ring;
> -- 
> 2.7.4
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

