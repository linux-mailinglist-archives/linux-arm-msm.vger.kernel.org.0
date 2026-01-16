Return-Path: <linux-arm-msm+bounces-89410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 909D6D3232B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B84C7300CA0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 13:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B128A28468E;
	Fri, 16 Jan 2026 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="SLKVksQV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F8B274B53;
	Fri, 16 Jan 2026 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571794; cv=none; b=fcNNU5wQjOX06cPt7DuRwLjnj8OfTELJ9Nv8pC09nOch4D44Cn0HjyIJ7L27HD2jx6ioUPxUqMSxzofDB5vWHTtI2MCLpdZZzaesB8fw0L7zpMgWMiufr5il8VeRtuVB0H0XvvxQk3fOTHjY7sq3JdvCpY7co27VVvSY1HpFSsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571794; c=relaxed/simple;
	bh=+z5G66akAQxH/Cbnsg1hKEZPwQPbkq3c/RqKh+0gptI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=RzHIrlj4MvYgMhDMNfMNXVAfQOrOSIMDvixnT5gBVeGN2YBJl4WcJ7UN+BnK+p4TM2jSZWULJMZU2nyNSdhlUuVaOYz12D92U1C1UcSoO/qaYNwT6Ha6Nx5F11kfN22ApMPLHadfoxqS5QAvL6YWVALAIsXKA6kU6ZRU7QaIp6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=SLKVksQV; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1768571775; x=1769176575; i=markus.elfring@web.de;
	bh=+z5G66akAQxH/Cbnsg1hKEZPwQPbkq3c/RqKh+0gptI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SLKVksQVkotH7hnJcRNSA7vpSL7Se6WFWHU/15wL/kNuzZzB8Mxqt7p1JpmUeIVD
	 DH600hdDXrjMvUxR6JjXaY/F3rPrvdWnxaJXphjXBlvXX8mVZI/ONyh97yZy6wR5w
	 7zfB8tlLxiPSQkaX/0y9Uw4MsJAwTfkn5ok6nAxnCvPi7mEzKEH9Ax0CE7tRrt7MX
	 bO8484dVlr23vaUJXxG6XOQkc4FuHIqF7vLWj4543l9LOWNG/iyofSDkXC2QtQI+7
	 06zdqn5DeNirJhqDyo0S3jkxkbkyxyd8vYrogeUabzfb6A31aE6z/aeeZFzTDPnOS
	 mTleeqsEXi8DnibwJA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.218]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M6YN9-1vjFH542Xp-006tmR; Fri, 16
 Jan 2026 14:56:15 +0100
Message-ID: <b073a29f-133d-407a-be4d-896886fa1181@web.de>
Date: Fri, 16 Jan 2026 14:56:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Felix Gu <gu_0233@qq.com>, linux-remoteproc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
References: <tencent_EDC2253D3B1C22217E1259E07765D269100A@qq.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_adsp: Fix reference leak for device
 node
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_EDC2253D3B1C22217E1259E07765D269100A@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ila3NI6lgnwwLQ2x1Aw4y2nlzb6QEihBxN4oX1txEkKSHrGXfZk
 xgwiEQiCRXouy0xQFIqNbntygxQYkC0/o5NFRVJLdv3dx8RVaxMmQhTNiZUZhAeAIIqmF7X
 xtpzAf5iyQomYtgplBtigLUJudIglm1eyF/6gOSPLwZrAb+M4di+3M17cd7xa5BvLdLLBNq
 +YAgUh5Bc/WYIRbmvR/nw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:w666ou0dTgg=;FznVi7JkI2Vxq9Jj9StVEy5kaEx
 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
 1dnsP3mePKZfEZdUi6gc5Q/iprEcj

=E2=80=A6
> In adsp_map_carveout, it does not release the reference.

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.19-rc5#n94

Regards,
Markus

