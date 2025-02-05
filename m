Return-Path: <linux-arm-msm+bounces-46970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA49A2986E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 19:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C745A162F37
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 18:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D71B1FC7D5;
	Wed,  5 Feb 2025 18:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="isxPAbqP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6526F13D897;
	Wed,  5 Feb 2025 18:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738778975; cv=none; b=W3yUBQozw56WrOqWxXjjSaBcU4Vv4ykm4rfCki2kfN7VnazHRxQ5X0ptjilJIR3J7cfqmgPvFeaMpDiJa4Pr2j9K5jRbwb+mQQ4d9dWmSLGFCfvyJMv5Hl8ft2dP+wa311s9iKsdph4El2mnbGjYzcRm0b2XpcFvcTXAZvkfXoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738778975; c=relaxed/simple;
	bh=t6+BkrnP0agQCDh665S6OlqWSc+83kDGCLOgC4MTivQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTImxz0MA/w++1v8qdRTDwPUiken3QJJiJL32ml6NOb/113NUWnNL1hVKUmo5FA6Mma2gxzG01++VPKU6JaWUZkuZyWqz9X9LaQnt5zM2WdASNJM3sqe96zhMA0r/qoqmoKXnc7Y4CNy/t9+6LJyofpFIN71Qq6m+cWSWpd6Opo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=isxPAbqP; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Yp7Y94gN0zlgTwJ;
	Wed,  5 Feb 2025 18:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738778965; x=1741370966; bh=+FL/uNeVgLwJTkZ0mzADq4dm
	/6XJBAEJhpZAzB+CVNo=; b=isxPAbqPMLkJAWQRsZYdFI5KaFLJzP6jcTIuamBS
	2g+cWoJOAnFf8A591ntLF/pBfrpoRXZOQQJBqdCs/W7dCE/Z5qdnKkCSD6deRz64
	M6soUWSI/N4z0FObjbpNfQkwiQlwh+kqZ0pfJiIooS8mn7YOvYMyRtjWH1EyuUkG
	uOLTidrI6bcnYIvagLp5TzF1lC4tAdy1eiBJ+j5vFc1QWfVVYTb1Npc2ZgAEQSvA
	R2d1doaqC+XOmnfu/TCIjPsRsXfELduLXgcTU+ic+rwkNLzPCnm/+CheD8hsGuTd
	FRAMBZ78fBzOkQmBJdP/Q0ahgd0f1tgxp04htAXaC9D5XQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id aZbqg944eimg; Wed,  5 Feb 2025 18:09:25 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Yp7Xt34dRzlgTw2;
	Wed,  5 Feb 2025 18:09:17 +0000 (UTC)
Message-ID: <e0a30d55-5319-48e7-a121-04db8a393f39@acm.org>
Date: Wed, 5 Feb 2025 10:09:16 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] scsi: ufs: core: Toggle Write Booster during clock
 scaling base on gear speed
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 mani@kernel.org, beanhuo@micron.com, avri.altman@wdc.com,
 junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Peter Wang <peter.wang@mediatek.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Andrew Halaney <ahalaney@redhat.com>, Eric Biggers <ebiggers@google.com>,
 Minwoo Im <minwoo.im@samsung.com>, open list <linux-kernel@vger.kernel.org>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
 <20250203081109.1614395-8-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250203081109.1614395-8-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/25 12:11 AM, Ziqi Chen wrote:
> -	/* Enable Write Booster if we have scaled up else disable it */
> -	if (ufshcd_enable_wb_if_scaling_up(hba) && !err)
> -		ufshcd_wb_toggle(hba, scale_up);
> +	/* Enable Write Booster if current gear requires it else disable it */
> +	if (ufshcd_enable_wb_if_scaling_up(hba) && !err) {
> +		bool wb_en = false;
> +
> +		wb_en = hba->pwr_info.gear_rx >= hba->clk_scaling.wb_gear ? true : false;
> +		ufshcd_wb_toggle(hba, wb_en);
> +	}

Both the " = false" initialization and the "? true : false" part are
unnecessary. Please remove the "wb_en" variable entirely, e.g. as follows:

	if (ufshcd_enable_wb_if_scaling_up(hba) && !err)
		ufshcd_wb_toggle(hba, hba->pwr_info.gear_rx >=
				 hba->clk_scaling.wb_gear);

Otherwise this patch looks good to me.

Thanks,

Bart.

