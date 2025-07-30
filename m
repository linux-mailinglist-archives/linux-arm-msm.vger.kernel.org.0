Return-Path: <linux-arm-msm+bounces-67176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1D5B163C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 17:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F6F1169BE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 15:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D90283FD6;
	Wed, 30 Jul 2025 15:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="3m9MtMxp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A017C2C9;
	Wed, 30 Jul 2025 15:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753889860; cv=none; b=iW+Swx4iat8Lfj5YzGO2Bc7+gLW03s+r0MbpNU9jPgLnYNsAi4sjAARx+bBaQt+G0g6O7ATEy1lzIqrbmb2NZDordEhbP9LjbQJooXDkFltqebrbkgdQN4QLQsjxBaMp/XsWhAuKhtuEYqErkljictHA6GtxL5Obc6UmZieXUdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753889860; c=relaxed/simple;
	bh=/08/JQ8jZ9IlnfZdfiNfeRjirnvij0n8cFhhiZl/oVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tzPu1JOiEHZaY0GiP82cRFemPlqQxK161roZlIFA2EhC1gOm4QN4siJ9rGVFgQf+z/mQ/GOLYy6mVQlF6e+uTAB+nZ7cdi+SbunlmHD6DUuIOOMLcJHW4brV5fivYkg6JMtL5BXcIM30X4A6v7BU/oqeOWf8z0MumoBl7SRayv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=3m9MtMxp; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bsbv46c4nzm0yTl;
	Wed, 30 Jul 2025 15:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1753889853; x=1756481854; bh=/08/JQ8jZ9IlnfZdfiNfeRji
	rnvij0n8cFhhiZl/oVs=; b=3m9MtMxp1hPrVknBcoBAkX9bW88wD3+GfUnb2PQd
	IaIgdjGmXL7MOuIOS1nncc7WHeTSY1ymxrb5g3rBWcBl/iU7HnJvdbNQLbAAu9yo
	nTOOx+v2qr6svbvxScR3LM4whHjPVkXPCUIkM23fs/9tYJdNYGWfhj6fQKryT13D
	/SjdhvDJ4DSzEerx6DRGgO0CaHWcG8m6da8KQLJDQHnXUE9dw7YJz3CTh3HdiWC3
	y1ABNFcalzQNVMTshzuw2xEC1LsdifwxwGIf0ykbpsOkyLMg849EKLsa9pTFm1RF
	YQ4h5kMQNYblKLhedAiz5Mx8uVCZ13D81uluFrOVK0wVXQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id RyMtXEfdku89; Wed, 30 Jul 2025 15:37:33 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bsbtk32Znzm0xjy;
	Wed, 30 Jul 2025 15:37:17 +0000 (UTC)
Message-ID: <ea382e7c-2436-4e82-a2b5-d5b7737b8828@acm.org>
Date: Wed, 30 Jul 2025 08:37:16 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] scsi: ufs: core: Don't perform UFS clkscale if host
 asyn scan in progress
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
 "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
 "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
 "quic_ziqichen@quicinc.com" <quic_ziqichen@quicinc.com>,
 "luca.weiss@fairphone.com" <luca.weiss@fairphone.com>,
 "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
 "mani@kernel.org" <mani@kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "quic_rampraka@quicinc.com" <quic_rampraka@quicinc.com>,
 "junwoo80.lee@samsung.com" <junwoo80.lee@samsung.com>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 =?UTF-8?B?VHplLW5hbiBXdSAo5ZCz5r6k5Y2XKQ==?= <Tze-nan.Wu@mediatek.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250522081233.2358565-1-quic_ziqichen@quicinc.com>
 <5f3911ffd2c09b6d86300c3905e9c760698df069.camel@mediatek.com>
 <1989e794-6539-4875-9e87-518da0715083@acm.org>
 <10b41d77c287393d4f6e50e712c3713839cb6a8c.camel@mediatek.com>
 <673e1960-f911-451d-ab18-3dc30abddd79@quicinc.com>
 <418bfbe4bfb3f04e805af8fa667144f148787aeb.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <418bfbe4bfb3f04e805af8fa667144f148787aeb.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 7/30/25 5:55 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> However, in theory, this issue should still be solvable
> without using a lock.
> Another idea is to only start ufshcd_devfreq_init
> when shost->async_scan =3D 0.

Does the lockdep complaint mentioned in this email thread occur on
multiple platforms or only on MediaTek platforms? I don't see any
lockdep complaints with Martin's SCSI for-next branch on my
development platform. If this warning only occurs on MediaTek
platforms, why to modify the UFSHCI core driver to eliminate this
lockdep complaint?

Thanks,

Bart.

