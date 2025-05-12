Return-Path: <linux-arm-msm+bounces-57649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAB5AB4747
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 00:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4E6C3AD571
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 22:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9261DE896;
	Mon, 12 May 2025 22:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="n7iUojaJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0572C1E51D;
	Mon, 12 May 2025 22:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747089119; cv=none; b=o/uWVKuW9G9CH6SFq6qmKzpcFxR6xwXNJnrg4bcklyKSjV1D03sMGiRFGTzX5fOWDdrBWId0NSuhWB9KIGfwXZOAxTR874tS5lja2Grm8jvHB7FeILagZl4AUQhHawhFsZdoOUK/XDRBCjCcxE7cR+KHdhDrZ0sTK9ChKJr4eNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747089119; c=relaxed/simple;
	bh=RZiIcIs1PuMj2VXYMOfeh18MmftaP3biuib72BYcumE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AfuS407tueObwOGrT+pk8jHHp/3jaM8FxJ1/QqF6suho2QAifD2z0cKSi/JEySRBIwiFrzCD9SjmkqXcYnfU3d9JhRTMtAlzkB1DpnQEKgQRvo8cvWbM9UX9BAa+wdH/n6qOFE7PX/hNPE2zMYUF0Wk4y9PgHtkatCujz3fDXe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=n7iUojaJ; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4ZxDqc4gzhzlvq82;
	Mon, 12 May 2025 22:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1747089113; x=1749681114; bh=1FCMBZKRgqOtoLjNgFwQVUJQ
	g6hd6Q3nZJiJEDM/GdU=; b=n7iUojaJuw53IBUL4yjewpqX1Rm982CnOIXzavxz
	/Z4HvJMc9POEZ/5WbOrntNRBsxq2HyAkceClL3jham7sa2BJuhBo/Nexmzsqhvyq
	CS+8IA+Ys7an/4l9cCZxYrtgjKXbcPi/uhCT1R4z/OOPpZEsf0U6IfIMgNXegJYa
	bUC28eJIVfpmsmvkVVjeVyjfSa8BYSbX2Pk2Whl8yMPjrrB0cPcfQXjUvCHuDS6e
	aIvoBf8RFRAZiECTD+DYCfZOOjnB5kHo6cm8niqxMEnO1MtTdGmWanGMbNcfhT4v
	qjZlZkkPd49HPBT3uhiTtdGVeyd1LhQcGZM+57X5lBnOhg==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id gvvtx5GO0s_c; Mon, 12 May 2025 22:31:53 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4ZxDqG41qlzlschm;
	Mon, 12 May 2025 22:31:37 +0000 (UTC)
Message-ID: <c428f074-c010-4225-960e-56aa65a799d8@acm.org>
Date: Mon, 12 May 2025 15:31:36 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] scsi: ufs: core: skip UFS clkscale if host
 asynchronous scan in progress
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 mani@kernel.org, beanhuo@micron.com, avri.altman@wdc.com,
 junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com, neil.armstrong@linaro.org,
 luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com,
 peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250508093854.3281475-1-quic_ziqichen@quicinc.com>
 <fd13e179-f2d8-4085-86da-c6b0fce2de5b@acm.org>
 <5748d0cc-a603-4b44-bbfc-d39d684b2ea6@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <5748d0cc-a603-4b44-bbfc-d39d684b2ea6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 5/8/25 10:02 PM, Ziqi Chen wrote:
>=20
>=20
> On 5/9/2025 12:06 AM, Bart Van Assche wrote:
>> On 5/8/25 2:38 AM, Ziqi Chen wrote:
>>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>>> index 1c53ccf5a616..04f40677e76a 100644
>>> --- a/drivers/ufs/core/ufshcd.c
>>> +++ b/drivers/ufs/core/ufshcd.c
>>> @@ -1207,6 +1207,9 @@ static bool=20
>>> ufshcd_is_devfreq_scaling_required(struct ufs_hba *hba,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (list_empty(head))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>>> +=C2=A0=C2=A0=C2=A0 if (hba->host->async_scan)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>>
>> Testing a boolean is never a proper way to synchronize code sections.
>> As an example, the SCSI core could set hba->host->async_scan after thi=
s
>> check completed and before the code below is executed. I think we need=
 a
>> better solution.
>=20
> Hi Bart,
>=20
> I get your point, we have also taken this into consideration. That's wh=
y
> we move ufshcd_devfreq_init() out of ufshd_add_lus().
>=20
> Old sequence:
>=20
> | ufshcd_async_scan()
>  =C2=A0 |ufshcd_add_lus()
>  =C2=A0=C2=A0=C2=A0 |ufshcd_devfreq_init()
>  =C2=A0=C2=A0=C2=A0 |=C2=A0 | enable UFS clock scaling
>  =C2=A0=C2=A0=C2=A0 |scsi_scan_host()
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |scsi_prep_async_scan()
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 | set host->a=
sync_scan to '1'
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |async_schedule(do_scan_async, da=
ta)
>=20
> With this old sequence , The ufs devfreq monitor started before the
> scsi_prep_async_scan(),=C2=A0 the SCSI core could set hba->host->async_=
scan
> after this check.
>=20
> New sequence:
>=20
> | ufshcd_async_scan()
>  =C2=A0 |ufshcd_add_lus()
>  =C2=A0 | |scsi_scan_host()
>  =C2=A0 |=C2=A0=C2=A0=C2=A0 |scsi_prep_async_scan()
>  =C2=A0 |=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 | set host->async_scan =
to '1'
>  =C2=A0 |=C2=A0=C2=A0=C2=A0 |async_schedule(do_scan_async, data)
>  =C2=A0 |ufshcd_devfreq_init()
>  =C2=A0 |=C2=A0=C2=A0=C2=A0 |enable UFS clock scaling
>=20
> With the new sequence , it is guaranteed that host->async_scan
> is set before the UFS clock scaling enabling.
>=20
> I guess you might be worried about out-of-order execution will
> cause this flag not be set before clock scaling enabling with
> extremely low probability?
> If yes, do you have any suggestion on this ?

The new sequence depends on SCSI core internals that may change at
any time. SCSI drivers like the UFS drivers shouldn't depend on this
behavior since there are no guarantees that this behavior won't change.

Can host->scan_mutex be used to serialize clock scaling and LUN
scanning? I think this mutex is already used by a SCSI driver to
serialize against LUN addition and removal (storvsc).

Thanks,

Bart.

