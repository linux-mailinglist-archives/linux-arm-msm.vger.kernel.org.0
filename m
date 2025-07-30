Return-Path: <linux-arm-msm+bounces-67178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF4BB163DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 17:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0220D7B00C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 15:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA2B2DD608;
	Wed, 30 Jul 2025 15:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="tE0oIhur"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4777B78F4E;
	Wed, 30 Jul 2025 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753890159; cv=none; b=i+V1fgoxVtxZAKdI2dNY/dyIHjAfh5tx4Zs5XwFe2PeyYHDLeDaTzUQqly6mb1seEx0Aa/qbh/+k80b9ngvK815LcWs/KveXCH/5CW4Mh3pogMAKHeJlPqFrH2VBFZhg03nccx/dJwDb+bVM1FqFhGDfJ1JXTr5n0RmhKXZ78gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753890159; c=relaxed/simple;
	bh=8y0o//TYzUzbKwKRuy6EOZNwYhkcVWNfb8USVc/H+ws=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qcl1FHjkULgsdAcyN2lTQ1nb1pxnkPVadIKKZKtRwwU6DfCXhzEEoFjiq1X5de+CFMbsB0FAr7JABOChr9zm/8xZUF/sgGvlmlHQ0rUYMm2AZsD8V17csRTumWDmUUNW5hYQal0OC4nHtBNkxE4+sT3BngsyeYbe7jsEaGhDKxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=tE0oIhur; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bsc0s19BRzm1Hbb;
	Wed, 30 Jul 2025 15:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:content-language:references:from:from:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1753890153; x=1756482154; bh=8y0o//TYzUzbKwKRuy6EOZNw
	YhkcVWNfb8USVc/H+ws=; b=tE0oIhurTvTl46X/22wx7u2BKSPF4cM37pJUBT++
	6rWWQs2uw7oSkyzxzjNFgbx0sJBHoRj1Z56mTr+sOZMHNNrKjRMfkW+EkMFW485b
	FMY9kxvHL4bBEZbeoxV2uPhVQWntH6VrgV8W6B3TzsTzggug88JOKFZoexc3KdVs
	c0nmXGgxuFdzZW6Go2qT3rhrpFuEaqNdYnIILxLHExbKomwoM3H00d/9HbwtKQdx
	Ydbquv1p9zhVv7g8bDBSyv43d6UP14ym2IQaiJRNGEQIVhwHmA/iMvmaSAhG7nl2
	E96fai7L0YF08pABzqGTsEWnfXpRZENnjvQRyGoUsU03iQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id YzB5OBHMuh-f; Wed, 30 Jul 2025 15:42:33 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bsc0T0VLMzm1HcS;
	Wed, 30 Jul 2025 15:42:16 +0000 (UTC)
Message-ID: <3ad6282f-bb41-42c2-9dda-337a0e0be68a@acm.org>
Date: Wed, 30 Jul 2025 08:42:15 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] scsi: ufs: core: Don't perform UFS clkscale if host
 asyn scan in progress
From: Bart Van Assche <bvanassche@acm.org>
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
 <ea382e7c-2436-4e82-a2b5-d5b7737b8828@acm.org>
Content-Language: en-US
In-Reply-To: <ea382e7c-2436-4e82-a2b5-d5b7737b8828@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 7/30/25 8:37 AM, Bart Van Assche wrote:
> On 7/30/25 5:55 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
>> However, in theory, this issue should still be solvable
>> without using a lock.
>> Another idea is to only start ufshcd_devfreq_init
>> when shost->async_scan =3D 0.
>=20
> Does the lockdep complaint mentioned in this email thread occur on
> multiple platforms or only on MediaTek platforms? I don't see any
> lockdep complaints with Martin's SCSI for-next branch on my
> development platform. If this warning only occurs on MediaTek
> platforms, why to modify the UFSHCI core driver to eliminate this
> lockdep complaint?

Answering my own question: clock scaling is not enabled on my
development platform and that's why I'm not seeing this lockdep
complaint.

Bart.

