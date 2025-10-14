Return-Path: <linux-arm-msm+bounces-77239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A991BDA982
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 18:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 026364E211A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 16:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DED2FFFBB;
	Tue, 14 Oct 2025 16:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="KuUFyIzC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4089721CC55;
	Tue, 14 Oct 2025 16:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760458754; cv=none; b=TEnOdnsEKgqf7mIfsp4urmEuX76+OKvIVPT44Xm+/QSdncqFagzRDWE95+COjse1xk2sk+hUkHIYPvxwTJIgG/E1h6l0GLFkkFUR6LF10RMf016Eb4iYTZ6pMgwaA9P6QlOkThMpwnUwNkrF6q5DC65PHxhfCnFs99nobFRWYAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760458754; c=relaxed/simple;
	bh=HdI2BiqtotC3YgnT812GRKWSulTaQ1RfHIKFyzRI974=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQbwD+4PVu07oFx8iyPmReqGToOG6AqXJDCxH4FyFFe41QD1KuAcUYXuSjnnrIxOdDBAI/il2JQ7Jjva8c485Jffl2FRF9qGkbbxEr9Izu9tONPGtnL0JClktECwKEJcGSqBeuV1tZl1NeFpRDEi6b1oomnUU4XL/wLqfxpWJ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=KuUFyIzC; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cmKCz0CpCzm0yTq;
	Tue, 14 Oct 2025 16:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1760458747; x=1763050748; bh=ezH4sQ6V/nGZXEjHE4GZHEuE
	J8Dh34wh9XPALEp7pno=; b=KuUFyIzCOawkCkNKGujpbB555NOqtYsFs7ZfZJlh
	ptv363dUcncVE+lW1CHAPCdVCylVabGnTbVpysqpP4ltfND2KHJCzck0yPC2KzP7
	h+DTphMW7z7HZg8keeeKLKBpx7s11P9kQz5G1Vk9RjO5ipu2SLH4tCb+1RZv0AFJ
	Dy++4VA4QR6LULFsLrnPMVIlN30NUrwuqfGgKclu03V075rVUAg57kIrhqtH2PXD
	QB4fpbuQCSLu23l+KdT0pjeYaTuwPJfIfSrDuujcFJ1tuYJWOCCZhhdpTR9bIoye
	ZUiQHRm9EIbGacgE81dko1WLa/PC/t9eLRr/mZaHaVxPLg==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id gQwsT2Tuff1v; Tue, 14 Oct 2025 16:19:07 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cmKCd1PDRzm0yVX;
	Tue, 14 Oct 2025 16:18:52 +0000 (UTC)
Message-ID: <f2b56041-b418-4ca9-a84a-ac662a850207@acm.org>
Date: Tue, 14 Oct 2025 09:18:50 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/2] ufs: ufs-qcom: Disable AHIT before SQ tail update
 to prevent race in MCQ mode
To: palash.kambar@oss.qualcomm.com, mani@kernel.org, alim.akhtar@samsung.com,
 avri.altman@wdc.com, peter.griffin@linaro.org, krzk@kernel.org,
 peter.wang@mediatek.com, beanhuo@micron.com, quic_nguyenb@quicinc.com,
 adrian.hunter@intel.com, ebiggers@kernel.org, neil.armstrong@linaro.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
 quic_nitirawa@quicinc.com
References: <20251014060406.1420475-1-palash.kambar@oss.qualcomm.com>
 <20251014060406.1420475-3-palash.kambar@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20251014060406.1420475-3-palash.kambar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/25 11:04 PM, palash.kambar@oss.qualcomm.com wrote:
> +static void ufs_qcom_send_command(struct ufs_hba *hba,
> +				  struct ufshcd_lrb *lrbp)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	unsigned long flags;
> +
> +	if ((host->hw_ver.major == 6 && host->hw_ver.minor == 0 &&
> +	     host->hw_ver.step == 0) && hba->mcq_enabled) {
> +		spin_lock_irqsave(hba->host->host_lock, flags);
> +		if ((++host->active_cmds) == 1)
> +			/* Stop the auto-hiberate idle timer */
> +			ufshcd_writel(hba, 0, REG_AUTO_HIBERNATE_IDLE_TIMER);
> +		spin_unlock_irqrestore(hba->host->host_lock, flags);
> +	}
> +}

Do you realize that obtaining the host lock from the command submission
path introduces a contention point and hence cancels one of the benefits
of MCQ (different CPU cores can submit commands independently)? This
argument still applies if host->active_cmds would be changed into an
atomic counter because making that change would still trigger cache line
ping-pong if UFS commands are submitted from multiple CPU cores
simultaneously. I think this is a strong argument against this patch
series.

An example of how to implement this kind of counter without killing 
performance is available in the block layer (&q->q_usage_counter).
However, implementing a per-cpu counter and checking in an efficient
way whether it has reached zero is much more complicated than the
approach of this patch series.

Is AHIT really that valuable that you want to sacrifice MCQ performance
to enable AHIT? Why not to enable/disable AHIT from the RPM callbacks?

Bart.

