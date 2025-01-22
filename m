Return-Path: <linux-arm-msm+bounces-45851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1ACA1984E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 19:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96A0316A7DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 18:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDB521518C;
	Wed, 22 Jan 2025 18:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="1+VGhC4i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EA9215075;
	Wed, 22 Jan 2025 18:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737569975; cv=none; b=QjlyQeI7PWtyoU6/tQQ81viVLau3rIqzqiJZcAn6MjUDFbq4DxYWWgjPO2xW89FcVuWSM44Ps+/D6kSt7jbZLLyr2EdsflVc/r2qWAcEmR3cQcWybvTv94Flaen+xToowyykEdPUnr5d/PGSQx/ohQEzuAO4jof//6VljgGJYM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737569975; c=relaxed/simple;
	bh=Xjp+BeX7PWbnyfW3+yXT42zT4XNvZ+klL94N3xT1mBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T0WZDk0cI3l0kXVcKswW6hC0h5pohr5r6EU8a588TRdVYjADdJIIv+yEVwJkeDSQJRdIVE0WzL94dvZ+zHlv+yMbcOgfXbJgUl5wqj1Wbr/O3H8Zn4+g9FZVg7C7NzxSDvkDRUuWx4bYX5x/vBwQUtc09ddBYrOU6uLW/+FQXrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=1+VGhC4i; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4YdXR92KFPz6CmQyd;
	Wed, 22 Jan 2025 18:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1737569962; x=1740161963; bh=T+WExHp/eucasP6spZD90r4r
	BLs5DXcFpo1A+WnUFhk=; b=1+VGhC4iEJJmeJElGE8dCFS9c9hczJFD7CeGGbOG
	ue2x1HsXGfywfXFyEX2KoPLJfCnXi0Rf9bRYk317HJx2EwCsqrZgsFMiXrl+gvND
	19q1sinrkcYXh2uDde9bTZ4fjXQvdmiSLKA84efVoifnUxY25PNf4nqlNDguuL3s
	o3a9BywEKWK16NBg+8toSmdlHO49HKK9XLyTZT777UCjnKofXNKx7fYEAmfCMYln
	narbB/wLjyqHfwn+mzfV+t4SbBubNq1WVj+DRePN9r0IDlCjipOy4bXdQipHBW/e
	hVQK7X1EvtspO4q0+kWmTYRn3aRlgVb+WQeccuuZ233o/Q==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id U4d84v6X9cLj; Wed, 22 Jan 2025 18:19:22 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4YdXQn1V56z6CmQyY;
	Wed, 22 Jan 2025 18:19:12 +0000 (UTC)
Message-ID: <2e42cc2b-5597-435a-a58d-507c46e1132f@acm.org>
Date: Wed, 22 Jan 2025 10:19:10 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vops
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 mani@kernel.org, beanhuo@micron.com, avri.altman@wdc.com,
 junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Maramaina Naresh <quic_mnaresh@quicinc.com>,
 Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-2-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250122100214.489749-2-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/25 2:02 AM, Ziqi Chen wrote:
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index d7aca9e61684..a4dac897a169 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -344,7 +344,7 @@ struct ufs_hba_variant_ops {
>   	void    (*exit)(struct ufs_hba *);
>   	u32	(*get_ufs_hci_version)(struct ufs_hba *);
>   	int	(*set_dma_mask)(struct ufs_hba *);
> -	int	(*clk_scale_notify)(struct ufs_hba *, bool,
> +	int (*clk_scale_notify)(struct ufs_hba *, bool, unsigned long,
>   				    enum ufs_notify_change_status);
>   	int	(*setup_clocks)(struct ufs_hba *, bool,
>   				enum ufs_notify_change_status);

Please keep the indentation consistent.

Thanks,

Bart.

