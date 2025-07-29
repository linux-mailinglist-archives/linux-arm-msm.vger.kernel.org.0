Return-Path: <linux-arm-msm+bounces-67035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3528B15137
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 18:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EC4E3A37F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 16:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD96226D1F;
	Tue, 29 Jul 2025 16:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="PzMyn007"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A269226CEB;
	Tue, 29 Jul 2025 16:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753806304; cv=none; b=DOoLd+1OmFs/vfq6YJku1F+idPadD3yD560g5U32ZoFvKL6rM45/A6Y/ccyK0JoYSACEsDHtI+usVQR9YzbpvpR/5vdUe88rZHh9ug/Y0NWHL+R+FNuv6XYUk1tCaJurHJ0dROQsPMujKzcIcpYAtls3whWNSsViFZ1O2zkHZ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753806304; c=relaxed/simple;
	bh=SyCSftqdPl8NtlGZzifCpu53xzr59hPAihDgHQzj5iA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=caXJPGwBsCvqVirC6f0H+AwuLa2CQtmDVnBsYMT2lQkXuum46m043qoCoI552oYlD53o7sRz+YMmHmIaDopA4nYisUEmtmREzEdXgzf4EG8VyJKFDXzZhzMK6T5MgVLhDjPZf6bko4qYihkqdqPiV7yDl0bmk5TIQlKApT+RTpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=PzMyn007; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bs10G3bMRzm174J;
	Tue, 29 Jul 2025 16:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1753806299; x=1756398300; bh=SyCSftqdPl8NtlGZzifCpu53
	xzr59hPAihDgHQzj5iA=; b=PzMyn007yVTXvL5CjYqqh5vmGc64b7t5+J+zJdXc
	CoAwALZs9xOrqMc/bhHsJ1hjP1WFyBJo4LVU62yTRxJ16t6+4/1cRnNhEThncEks
	WL2+PWIA9L0iciot3eafstkSMpYPG+7Lew7CK/CAM1XnIAUyeZefY9DxsQeQzlhk
	rMbNhrLSJecQG/ocyXwyUvvGx2T/C+mx8rWsb9gnpZemp2TpVM+cyyCXPfRhl4nN
	eprQ89d/BxfcGzFZEfES4jTtlwyx2IPQ63ISodgZ9JUck4d8iaEHjy7ilV2/qUAK
	wfAK7XqIDo8vlHYSWaqx95v9O3RUF5m3TYLZfGiGfLEYFQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 1QUm-vRmba9L; Tue, 29 Jul 2025 16:24:59 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bs1014X18zm1745;
	Tue, 29 Jul 2025 16:24:48 +0000 (UTC)
Message-ID: <0fd86741-f72e-4a52-9d2c-2388c4a26115@acm.org>
Date: Tue, 29 Jul 2025 09:24:47 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] ufs: core: Fix interrupt handling for MCQ Mode in
 ufshcd_intr
To: Nitin Rawat <quic_nitirawa@quicinc.com>, alim.akhtar@samsung.com,
 avri.altman@wdc.com, James.Bottomley@HansenPartnership.com,
 huobean@gmail.com, mani@kernel.org, martin.petersen@oracle.com,
 beanhuo@micron.com, peter.wang@mediatek.com, andre.draszik@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palash Kambar <quic_pkambar@quicinc.com>
References: <20250728225711.29273-1-quic_nitirawa@quicinc.com>
 <a7cfe930-44b6-41dc-a84b-00f5ba314946@acm.org>
 <1b418968-2a53-443e-8766-9d280447bb2d@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1b418968-2a53-443e-8766-9d280447bb2d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 7/29/25 7:37 AM, Nitin Rawat wrote:
> I reviewed your patch and test it locally=E2=80=94it resolves the issue=
.

Thanks!

> The patch looks good. Since this path handles only UIC, TM, and error=20
> conditions with no IO for MCQ, we still check for outstanding_reqs and=20
> UTP_TRANSFER_REQ_COMPL for the error case within ufshcd_threaded_intr i=
n=20
> the patch. In my opinion, we can skip these additional checks.

We can only skip the outstanding_reqs check if MCQ is enabled. Andr=C3=A9
Draszik is working on a patch that will cause ufshcd_intr() to be called
again for legacy mode so I prefer to keep the outstanding_reqs check.

Bart.

