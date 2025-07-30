Return-Path: <linux-arm-msm+bounces-67181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C90B1640D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 18:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D474188E9FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 16:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7135277036;
	Wed, 30 Jul 2025 16:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="xQz+EJMp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F315CCA52;
	Wed, 30 Jul 2025 16:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753891520; cv=none; b=bOXBVTXVl8VvjOBxuEDy30JS0Vym6Pu5x6rbLR8rBuASX8VdI3qSk6Gid3NPqfaDnU6aQfSJI+KfuE+1BbhxEhFmtHnQhvUBFru5ci2+/P8JgcwkojPHkcMHdzzOsD8USZnYULzvlv/j2LDRwPAhXpMUTwhhY3hmQVkoXx0giXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753891520; c=relaxed/simple;
	bh=LUBGEjKuHXPIhfiVYDPE57c2LqjApguMMpnSiZXGnQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qLHJ6II2zn5x++AwwfcxMyH0PPyzaBSkl1oYFnTgj+x70cIyWznJeq4f+fTXdBCIo0aBblQ473ccp47y//Fof20sHfIVi7FkEx5bePuSBPR54KvaMeoNWs8MMMHvAlT0xKa0+cQDVaxpoWu1nKpqCC4i9sGh3vjjxe2PHl/ToPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=xQz+EJMp; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4bscVw4Q07zlgqVc;
	Wed, 30 Jul 2025 16:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1753891509; x=1756483510; bh=LUBGEjKuHXPIhfiVYDPE57c2
	LqjApguMMpnSiZXGnQM=; b=xQz+EJMpbqy8C+BuWhvGaRjRYT97xMjfcxqnviqR
	kRs3K87+siaHJKSwHQ8CRFZNL+M7UImVwgzUB7uusCcrASGYvTRbPgBGwsHbLtVx
	uFO6w3qQywHI70oYCdUbSrt63fz9lwvmZS2B+tndrrztJu23mQ60cPK27+zQdDgp
	huXvbyBUg7x1idiFHWW2MwMDNPxzBGPxldFWLeMn9OloUjEpka1ts267sCihd+FW
	Jz7JuhB7XxSkgTJDy0X8lxwgW/EH4NwYVKTr7Q2NSJ654X+0ALUhLUmiMJn7S6vd
	uHyzu0DmL9bMk/Dwex2lUlfueZXRDapq9OQfTYzq/BKIcg==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id CjNwtf6qn580; Wed, 30 Jul 2025 16:05:09 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4bscVg4Hj3zlgqVY;
	Wed, 30 Jul 2025 16:04:58 +0000 (UTC)
Message-ID: <d0677ace-0f01-4111-8f00-868d83550b65@acm.org>
Date: Wed, 30 Jul 2025 09:04:57 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] ufs: core: Fix interrupt handling for MCQ Mode in
 ufshcd_intr
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "huobean@gmail.com" <huobean@gmail.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "andre.draszik@linaro.org" <andre.draszik@linaro.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "mani@kernel.org" <mani@kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "quic_pkambar@quicinc.com" <quic_pkambar@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250728225711.29273-1-quic_nitirawa@quicinc.com>
 <a7cfe930-44b6-41dc-a84b-00f5ba314946@acm.org>
 <1b418968-2a53-443e-8766-9d280447bb2d@quicinc.com>
 <0fd86741-f72e-4a52-9d2c-2388c4a26115@acm.org>
 <b005d94288a4c4d29a9361b043354bbc8d85e0e8.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <b005d94288a4c4d29a9361b043354bbc8d85e0e8.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


On 7/29/25 11:41 PM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> The threaded ISR was separated out specifically to address
> the issues of the traditional ISR, because a traditional ISR
> must be very fast and short, as it blocks other interrupts.
> But your patch letting the traditional ISR call the threaded
> ISR, doesn=E2=80=99t this bring back the problem where the threaded
> ISR might block other interrupts?
>=20
> So, I prefer this patch clear the interrupt status register
> (IS) directly.
Hi Peter,

Thanks for having taken a look but I think that you misunderstood my
patch. My patch does not modify the behavior of the UFS driver on
systems using the legacy single doorbell mode. It only modifies the
behavior on systems supporting MCQ. And on systems that support MCQ, it
restores the behavior from before when commit 3c7ac40d7322 ("scsi: ufs:
core: Delegate the interrupt service routine to a threaded IRQ handler")
got merged.

On MCQ systems, if the completion interrupt is processed by the CPU core
that submitted the I/O, then I/O workloads are self-regulating. The more
time that is spent in the completion interrupt handler, the more the
submitter will be slowed down. This is not the case in legacy single
doorbell mode since when using that mode all completion interrupts are
processed by a single CPU core.

Bart.

