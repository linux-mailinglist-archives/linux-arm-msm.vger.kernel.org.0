Return-Path: <linux-arm-msm+bounces-43004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 936D29F9857
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 18:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B980D16372C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 17:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681F52210E6;
	Fri, 20 Dec 2024 17:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="lYtjxqA8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC94206F2E;
	Fri, 20 Dec 2024 17:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715027; cv=none; b=tQqImz2V0uMiPYz2yS2lruDAaBMypVdQZRohVNeTbIXSWRFDKUr3uztvr/LF8cZmq69SfmQDiqsCsCQ5VoWeZ2xXqcm2xc/Omfg96FBz3d6DXU9NrewC+6ee+rdpQxNaSXF2e0yPu390ofYohKkzU1SEOTGxajHa/AKMtN/Cvkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715027; c=relaxed/simple;
	bh=9X7GqMK0DClbkkPPfv3aR7OpaQ5utFRi/4M1GiD3vFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LW/MtO3G88DRSGWYiq1C5yQ64oaP1xdiSkgGS8y5Qnku1MIgj1nG2zwUORdqvs/t0leq4n8vSfOamJlTKim8swy4+a8Ja8ojc5aqMMrSW/vDSBGz4DvrzfbUbHdAvFd2VDnlPP6SaEnDD7ZvwwMFyaCroYRbsKToQhYlIryOP4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=lYtjxqA8; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4YFDcC2gHVz6CmM6d;
	Fri, 20 Dec 2024 17:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1734715014; x=1737307015; bh=9X7GqMK0DClbkkPPfv3aR7Op
	aQ5utFRi/4M1GiD3vFQ=; b=lYtjxqA8dKyRB4c3fHNw142wUQmaEb8+FED073kP
	qHnDLDylKKlnH6mr6aEV9GhgAF2tZ3fbSkXqWI2kmM3N6HoWJCi8HOjhxLzqnGrB
	TfAmMzltR7BDerAhXqYMPvj+ce9+W0TYxN/4IAJLndPx04eYj2xNcyACiZO/FUFb
	QNj64DI7NdstlN5wd6deGuJvmSloAFb6ZH482M+qDKQI04j4ijFxcByXfrpbRquT
	Of4E9OddZJ0ow6I3IVSrpWUCIdvgd1dILY+uaWcRPba1L7nwkTOu/ltKBfkIU1TA
	CrM0dMlFpBnDtq/ekaiXN5SRNube9aevlpsm+6gU6V2Nfg==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id snpQJZwBogZf; Fri, 20 Dec 2024 17:16:54 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4YFDc30ZmCz6CmM6c;
	Fri, 20 Dec 2024 17:16:50 +0000 (UTC)
Message-ID: <a6eb14c7-84cd-41da-a24a-f0310738eb2f@acm.org>
Date: Fri, 20 Dec 2024 09:16:49 -0800
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
 <ac08d417-87b3-4ddd-ae68-8e8e9a68e04a@acm.org>
 <69503b23-12da-4270-9910-9440dba7df07@quicinc.com>
 <eadb98dd-f482-4479-8ff8-dcf301edf18c@acm.org>
 <1d407f42-681d-4e8b-86f5-a4d368987115@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1d407f42-681d-4e8b-86f5-a4d368987115@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/20/24 2:06 AM, Ram Kumar Dwivedi wrote:
> This function will be only called once during boot and "val" is a local variable, we don't see any advantage in making it static.
> If you still recommend, i will add the static keyword in next patchset.

The advantage of declaring the array static is that the array will be
initialized at compile time instead of at runtime. Additionally, this
will reduce stack utilization (assuming that the compiler does not
optimize out the array entirely).

Thanks,

Bart.


