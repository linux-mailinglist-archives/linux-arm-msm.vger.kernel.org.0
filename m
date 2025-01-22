Return-Path: <linux-arm-msm+bounces-45855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFF0A19861
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 19:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E198165283
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 18:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03285215072;
	Wed, 22 Jan 2025 18:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="OSHOnwvn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80718212D65;
	Wed, 22 Jan 2025 18:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737570256; cv=none; b=tPlXylu/fsKnCyDJdo8BAKbPPHTLmwTNh7XN0NU1RZ9DwU4V61Nd99Tt6eYxZn8ppPaxYwtSA5HbNX+t4Dcvm8jpOFR11X+Pzd0a0nqYBB7hKWQTPL1xsfrxKNpb1iEb7H20AyfSaL3qpbdj14QxcUMpCh6GOnll1lIlgXU//b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737570256; c=relaxed/simple;
	bh=nqrYrj7tdLRzpNaAbiWEJHrZtPG3BqHEMprFxU3fd80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tXc9ngpsBqTsUa8Mk4P9wPq/1Uu3VYgtqhl6dLVhlA3fmHlTLeYf1IKe3M2u7YkuY3eyf0+AqhhGy5idjQEBzRADbYJHePVCna7AKwokwBerXcoEKugG9yFSMsRaWD4EZ91dh27NwGATKVdWUu8LQzxcLRTTxyHflgiWh9AEjtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=OSHOnwvn; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YdXXS4yJ0zlgT1M;
	Wed, 22 Jan 2025 18:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1737570242; x=1740162243; bh=uosoK4zpDoBR8N9Ggvr8FkUz
	52NxzO1PnxQqZiEKHhE=; b=OSHOnwvnPKHLRmubYlkRgVpg23sZL+r/aedMzksI
	tae26IaFUxPCx+0sfmtb+kcCKyd1Z3VXg1vVnVEKbRwrRFSYxH08T1DEgmm+gQCw
	2xzkG8vcc+bUaZ1G+GNUtBk1UT9+ShMoPA3m1NLRy1WMVL8dEi/wUzx1v4yYUz2F
	tzGnNdNxOk8qJVfuLDWwgoRNctqH/rRo+fJcAh9j6Ibr9rwl4W8v+zQe0xNPz0ep
	wHy3INsVPOzs5ruJLHst4PP8oOUlLpVYtcsdZgxC4rnNMJxT0PVUy9ZMXaQh+u05
	pjHoIaxtpXzTTX1V1GShrRo6xsLDggPG1eu9JE1Eyv9Vqw==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id lI36eHm56Tk7; Wed, 22 Jan 2025 18:24:02 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YdXXF0tqbzlgVnN;
	Wed, 22 Jan 2025 18:23:56 +0000 (UTC)
Message-ID: <f03f0cf0-a89f-46a8-a8b7-3c62294b040c@acm.org>
Date: Wed, 22 Jan 2025 10:23:55 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] scsi: ufs: qcom: Implement the
 freq_to_gear_speed() vops
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 mani@kernel.org, beanhuo@micron.com, avri.altman@wdc.com,
 junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 open list <linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-5-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250122100214.489749-5-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/25 2:02 AM, Ziqi Chen wrote:
> +static int ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq, u32 *gear)
> +{
> +	int ret = 0;
> +
> +	switch (freq) {
> +	case 403000000:
> +		*gear = UFS_HS_G5;
> +		break;
> +	case 300000000:
> +		*gear = UFS_HS_G4;
> +		break;
> +	case 201500000:
> +		*gear = UFS_HS_G3;
> +		break;
> +	case 150000000:
> +	case 100000000:
> +		*gear = UFS_HS_G2;
> +		break;
> +	case 75000000:
> +	case 37500000:
> +		*gear = UFS_HS_G1;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		dev_err(hba->dev, "%s: Unsupported clock freq : %lu\n", __func__, freq);
> +		break;
> +	}
> +
> +	if (!ret)
> +		dev_dbg(hba->dev, "%s: Freq %lu to Gear %u\n", __func__, freq, *gear);
> +
> +	return ret;
> +}

Please simplify the above function by returning early in case of an
unsupported clock frequency and by removing the 'ret' variable.

Thanks,

Bart.


