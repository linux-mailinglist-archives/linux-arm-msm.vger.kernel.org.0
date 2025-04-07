Return-Path: <linux-arm-msm+bounces-53453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CFAA7EDB0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 21:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F05616D4E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 19:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6751219A8F;
	Mon,  7 Apr 2025 19:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="WJpXTXoP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C966D221D98;
	Mon,  7 Apr 2025 19:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744054593; cv=none; b=pIo1NoMaoMzLjaGwncVMS5dnmscDb1kIgW+gXuE3ka9QTntwYwOSuu7fxt41sLm69Y+4WY63TViQIEVVp85WpmP0eRDizG7Z/JV5XfieURIrzmtbe/+iVtzoMJOxTUZ54XC8r3Am7/O/r0z/WfcgyejYv9BKiYQx8bhsxQ+bNbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744054593; c=relaxed/simple;
	bh=fljdIlQJZT48DDgJB+u4ctW66iyga2K+jR8BgagU+oA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nH4WtERTat26rz+TSnJgriPArkIeoMGrRE2UPWpTTGeV67MPn4Esf2aFBt0Nlz2hZOqHCUG7KYmQ8jjnk4aqd/spLXLWzApDqPwcKsjV7NfEspvYum8UJK/fd8gmibSod2Si0q17WQneKEFffBq4TfQ4gZaVZAs+ugXX0V+3xGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=WJpXTXoP; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4ZWfbL45x6zm0GSr;
	Mon,  7 Apr 2025 19:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1744054588; x=1746646589; bh=fljdIlQJZT48DDgJB+u4ctW6
	6iyga2K+jR8BgagU+oA=; b=WJpXTXoP0bkw3nRXfL8aGYfCprCbIVUz7G+C4d1R
	czvIRvIu8ZoeEfblMK4HmrmWUpLSG6rOyUwdZUf2stXVmmRkrVKry5tcSSlTrM2f
	aeFekgDVxgP+3NpkVGW6zcgeN2hbIjNFLoY3n/kAJjbEcynBLAmRKPTH9Jm+YHt3
	0H2fYej9KKsNEg5z3bg5C6AUWlxZ4tCCXsuHyaJ8fpXGpIbdSuvarDdfRVsey/ue
	7zC2JgtJqgrEBZzOe+IWjq5TC7c8w6rKYS8lgS5feY50zsol0P8BpvUeNFzFoTEw
	BeRhAIsl99nIRlTbCyml1Qd9WrN20gOFyAup8WhuCve5Fw==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id sMQVAaMjmlv4; Mon,  7 Apr 2025 19:36:28 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4ZWfbB4sGmzlvt1M;
	Mon,  7 Apr 2025 19:36:21 +0000 (UTC)
Message-ID: <c78c2abd-292f-4e61-830a-683dee012b6c@acm.org>
Date: Mon, 7 Apr 2025 12:36:20 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 2/3] ufs: core: track when MCQ ESI is enabled
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250407-topic-ufs-use-threaded-irq-v3-0-08bee980f71e@linaro.org>
 <20250407-topic-ufs-use-threaded-irq-v3-2-08bee980f71e@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250407-topic-ufs-use-threaded-irq-v3-2-08bee980f71e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/7/25 3:17 AM, Neil Armstrong wrote:
> In preparation of adding a threaded interrupt handler, track when
> the MCQ ESI interrupt handlers were installed so we can optimize the
> MCQ interrupt handling to avoid walking the threaded handler in the case
> ESI handlers are enabled.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

