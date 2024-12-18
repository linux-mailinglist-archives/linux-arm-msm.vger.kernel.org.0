Return-Path: <linux-arm-msm+bounces-42692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E47759F6C35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 18:19:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A918C7A60E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 17:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB641FA140;
	Wed, 18 Dec 2024 17:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="jE4cLSzW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781CE6EB7C;
	Wed, 18 Dec 2024 17:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734542379; cv=none; b=Fe93iW7eekt4cUYTWVymqNdSCXSbUxRxDwJndBLr2LDq5zYQkzE/CWz0S1OQdWwT7YE7i92x6sh4UBbQAOCenJJkiU71qe28pMauWiO4L94Utlukzx7LFyJVhyLWhYzICaSRNIQRthcFLpniRKADi6krqsQkn4NVxqV/ulQqsgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734542379; c=relaxed/simple;
	bh=zUGTX2Sbr/Y+n0B2aKgCffJBxllW9eT2YqZ9IcLBnd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQ9hDfTvjOkg1ZRRBcul2kf8kXmKk6iRZUhhSKF2N1wyn/a4Je+Z91BlMm7TZizyammZKqeAGoje+w1mdebGDVCSwfTmv5f01LjKy9fjsEG86Qmyzw0XI9THYRPmxamznmEOu6oWqkWCCLfVdsUwSbgtCnQrq3yXwz2QBoHQTyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=jE4cLSzW; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4YD0m85vlZz6ClY9D;
	Wed, 18 Dec 2024 17:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1734542372; x=1737134373; bh=HNfsazHOtIvoyG0rKv4kSW0y
	1EyqA57XAnLNyjOu0r0=; b=jE4cLSzWGFHYoeYXaw1U0yser8cKKCm4nW+NIteb
	6P4cB0wmGEFAf84lVSJreEREIqEUeynbl1lCXKSR53gGdOXC8ULxCHD1LzQ2zj5G
	7iDbZUZ7bjAo0Ta/cZ22aN45DfLgres+F+yYqW0BCaACY0jO4RCUmUqcIYJn2g5h
	ku7B+qnDq0ZH2jltZMH+zYKQH/UTx71VTi4QJ14DgOg//ZFA5YPfYva6ZM0yw002
	DHEg8rZClVB4IKhU1JF2fllZvbUWx0U57Jnz92/3O7g/E8yqhBZ0JbNXC45ZWoUc
	UP8vNC+3ctNgwV3mbT/06qgiADQkcgm/HBa/HLeb5zGUwQ==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id lwM-ixazdC5C; Wed, 18 Dec 2024 17:19:32 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4YD0m24W37z6CmLxj;
	Wed, 18 Dec 2024 17:19:30 +0000 (UTC)
Message-ID: <ac08d417-87b3-4ddd-ae68-8e8e9a68e04a@acm.org>
Date: Wed, 18 Dec 2024 09:19:29 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] scsi: ufs: qcom: Enable UFS Shared ICE Feature
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>,
 manivannan.sadhasivam@linaro.org, James.Bottomley@HansenPartnership.com,
 martin.petersen@oracle.com, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>,
 Nitin Rawat <quic_nitirawa@quicinc.com>
References: <20241218151118.18683-1-quic_rdwivedi@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20241218151118.18683-1-quic_rdwivedi@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/24 7:11 AM, Ram Kumar Dwivedi wrote:
> +static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
> +{
> +	struct ufs_hba *hba = host->hba;
> +	uint8_t val[4] = { NUM_RX_R1W0, NUM_TX_R0W1, NUM_RX_R1W1, NUM_TX_R1W1 };

This array can be declared 'static const', isn't it?

> +	u32 config;
> +
> +	if (!is_ice_config_supported(host))
> +		return;
> +
> +	config = val[0] | (val[1] << 8) | (val[2] << 16) | (val[3] << 24);

Isn't this is an open-coded version of get_unaligned_le32()?

Thanks,

Bart.

