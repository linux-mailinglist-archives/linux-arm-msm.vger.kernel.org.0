Return-Path: <linux-arm-msm+bounces-46966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EAEA29847
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 19:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99746164ED0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 18:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE431FC0F7;
	Wed,  5 Feb 2025 18:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="KgqAQ+Zy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461B37083A;
	Wed,  5 Feb 2025 18:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738778585; cv=none; b=d7aHVVPv8yvp3O5qyCa0HLfMDa4td4y+UW2m6Q0oe+okGhVmH/KuqUG/QfJsJM1ehYIRrrapCJB/OfsnRecuhmmdxB8mQw9cAukaQvlhn7v6NYaZgf4XMwEaX9Nzgjf+i8YKuC4/wIll05XwskbzfLXrigP49XTtl2m0xBu0omw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738778585; c=relaxed/simple;
	bh=MhYh0K0cs6hRJ2EkOy56lZy1JN8Whdz+VjNW5lkSwwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RN10Z1+5owHiQ1MwENcuklV7AUgc12/2UAOl2njNS+Q2n63zuzXUmSAlHEN6vd3Lk4JTyI0FHB6KooBt2lV1rAO7hcyHECP4zgo85CFgXq0LL5SwUCZvKhBiyrxQITMkKqlG7na16ZZwAHeHxkOR6VwBirs42h6GX3bD1S8JBr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=KgqAQ+Zy; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Yp7Pg4mNTzlgTwJ;
	Wed,  5 Feb 2025 18:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738778574; x=1741370575; bh=MhYh0K0cs6hRJ2EkOy56lZy1
	JN8Whdz+VjNW5lkSwwA=; b=KgqAQ+ZyBTnOrx4lrw7J5MNMgRb9DWfwiFF+nyfE
	0ECqUOSNnBEMfFYO5vah6+KGICdbDdJqrNb4JMogDb29erGrkDZeyeatDqpIxn0W
	Gp77cx3Ar3deNjqZYOEx8e3LSUFd/I4Jvd2pJVqJa7fysnXrgxR4QFVyJz38g4mZ
	68GwmE9kpsy7WF54QEBKGGxHOqn80Sh/W0q69MbvsUt1oYdgpZ4YscY6SZxryEbK
	kDV0hLPJY53bDXayl9uxuL/famauO2GvCy3km08peZo394QSwikrd1hAJ8uvz0tw
	S9+vtOkM0LYo5Of+ZbDtU0ovn/0eKixBDrhFElAf87YjHA==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id yPbHVnEeDhAD; Wed,  5 Feb 2025 18:02:54 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Yp7PJ56d7zlgTw2;
	Wed,  5 Feb 2025 18:02:44 +0000 (UTC)
Message-ID: <45a2da01-966f-4019-8d7f-ee2b66575804@acm.org>
Date: Wed, 5 Feb 2025 10:02:42 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vop
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
 Andrew Halaney <ahalaney@redhat.com>, Eric Biggers <ebiggers@google.com>,
 Minwoo Im <minwoo.im@samsung.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
 <20250203081109.1614395-2-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250203081109.1614395-2-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/25 12:11 AM, Ziqi Chen wrote:
> Instead of only two frequencies, if OPP V2 is used, the UFS devfreq clock
> scaling may scale the clock among multiple frequencies, so just passing
> up/down to vop clk_scale_notify() is not enough to cover the intermediate
> clock freqs between the min and max freqs. Hence pass the target_freq ,
> which will be used in successive commits, to clk_scale_notify() to allow
> the vop to perform corresponding configurations with regard to the clock
> freqs.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

