Return-Path: <linux-arm-msm+bounces-67179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A992B163E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 17:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 842C018C7D6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 15:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9942D9EDF;
	Wed, 30 Jul 2025 15:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="YqSSuGEx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54EA2264CC;
	Wed, 30 Jul 2025 15:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753890656; cv=none; b=JGBNx00k+pg7bJlLbdu7/qfsxXOhBk5bfovzlm4pSokHf33UGiNDdNZn1gy80lr1cAKGxzWgyqAka1BZYBlsATLmfpabASXn0SfKEv/H5LVOZH7c6XDegXgHfpm66rVHfYnsmQ+M0qOSlLx0NkZ4JAMa5XSUVjipDPqbtKozd9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753890656; c=relaxed/simple;
	bh=kfL7V5vYKGcyUdsgSYZAVpHfFn0XNAt9v1kO2jTioBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N5DuBVn+fZ2t1adinRkmcD2aJUkpRdUYyUzXVkvBn2b7FY2I1akt+pduiqX5x1iPTJxwKCrkZG/uyQUbh2w4EdslTaO1ltz9VSucyj01EIdGIZtqPD5TpnBjj86qEul0RjmsPfnUPiGStKtoKG1DbLV3+eKpxYgxAIyHE2pU5og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=YqSSuGEx; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bscBP6Gvxzm1Hcc;
	Wed, 30 Jul 2025 15:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1753890650; x=1756482651; bh=kfL7V5vYKGcyUdsgSYZAVpHf
	Fn0XNAt9v1kO2jTioBo=; b=YqSSuGExBEi34YR2k64/1foM5z5U0vUnb3sM7iZs
	vrxmpwvb+G3EqmdRQfHISMNrmxn3pGCL8e4bzVe+VJh887DyEH1QKjwqOdu3P0Is
	DdthGa1XbKHLQ1pmed+wXTdcxe2GjHAbFn2vra0xhc05MzFOj/zWeUs9XVXh3uP1
	D6/ulp9G4pBu77dKKlvefpmrY1hE/OL/xs8DtPBpAWa/dZLlbDRgO12322TViCQq
	ckydBpWN6b0QntUF6PVmx3PB6taOcq9sC0ZLTHBYNuwqFwFhx9M0mPzrTiKsSFg+
	n7isLOME6qZvcOHIYZseYTF8QCDEzQ218VJwggjabBHgHQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id i9KiTDWc3FTh; Wed, 30 Jul 2025 15:50:50 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bscB22kSWzm1Hcd;
	Wed, 30 Jul 2025 15:50:33 +0000 (UTC)
Message-ID: <08dcffa6-6cf9-4c79-8aa9-a82bd42d3932@acm.org>
Date: Wed, 30 Jul 2025 08:50:32 -0700
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
> Another idea is to only start ufshcd_devfreq_init
> when shost->async_scan =3D 0.

Hmm ... I don't think that this is a solution. There are multiple
ways for triggering a LUN scan and my understanding is that the
clock scaling code should be serialized against LUN scanning.

Here is an example of how LUN scanning can be triggered from user
space by writing into the 'scan' sysfs attribute, even if
shost->async_scan =3D 0:

echo "- - -" > /sys/class/scsi_host/host.../scan

Bart.

