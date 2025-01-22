Return-Path: <linux-arm-msm+bounces-45810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D05A19359
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 15:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C628F3A4708
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 14:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37328213E8C;
	Wed, 22 Jan 2025 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqdgegZ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8074F322E;
	Wed, 22 Jan 2025 14:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737554927; cv=none; b=HAWocCUJ6q0eGWOnnmz63FqsHlM/2+pr25y8ucrjccOn9kMilvm6FnQ1N3VgQp0c/MYK5qE6EpCDC7grxKHmnjXuIcMPW+hYMc5NfrnHv4mWXpGZuFe1X8k/5E6v6MpQeIs6IVsYcAkQWb/B1T2dQNrHJxZMyCe1O/8tnmo1POw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737554927; c=relaxed/simple;
	bh=Vr5CMuJ7WXIe+OEUSCiZCZ+n0fE3WK083QR9rz+lxBQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b458hZYd0P10BbXIDGF02ezEV2sSFWN0tbtH9mAdP8fMvJZLZXQhs3dGtpYYP4nBnZcHGFkzArDMUITDvI9OKlWdN48zEMxiQBTlFaqk3D9tnSqkTn4m4ZQSDBaBCRFSkJ5maP7IiTNk4jhSrCyEi1xYPNwvty/hucPuIVP1tl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqdgegZ8; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5da135d3162so11761473a12.3;
        Wed, 22 Jan 2025 06:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737554924; x=1738159724; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vr5CMuJ7WXIe+OEUSCiZCZ+n0fE3WK083QR9rz+lxBQ=;
        b=gqdgegZ8DGRVIoG24XQSk6h1BOFC0whnZJdwC0CV976DOShKPfnpc1fa2Af1BibJQ1
         PNDZHTfP4ZDPQHWHLHAmmjrq9wafOB32KIIf7YhNprGzb7nZyo0LyxGCd1vW5uCIH5uG
         ZpYGHCcF6uGbr/yJkD1LTe9loFo+dgNUwqB+1+NT5EfPj7bN/NGL317RA+JMHR6jPd7z
         57z1FQz7sb+PAAFzugAa3aT0Iu4tYgkIPf/cqZg5ujBe5U0fvD+FPNyzMtUl/e0kwIEr
         63RrkLj19DncsmNfgLoKiHY3oebZHwUEPKRSnzeokbV7VwGmgFL3ZatRnU0184CBCmTg
         e4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737554924; x=1738159724;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vr5CMuJ7WXIe+OEUSCiZCZ+n0fE3WK083QR9rz+lxBQ=;
        b=ml8wmJ3xfuqlITxKtsawBssPPNkXG3oom3qzusB590xprE8S4clpsEGWulsGn7vb6b
         bKrkkuzsgSyUnVZJFUlO2ahe0NJrW6r5u5W5OBmN7SeuzdXou5du8SObbC/8psyvbgdF
         gkSbXEuvpbeIIXpUdob6idj5rCrDtJhsgOCPg+lqEKDHorML3V+cequ1ZF0vieQ8yk+c
         ccBAwU6Q7e+ic/FzHKkFnsSxL80q/7X424Mwdn2BhCvkbHOj5DEFlrwDEKekh196u5/j
         TajXzx1zdxKKCayGDu1gds4sqSiwrM06H9tn3Ljd4FIxxfwXEK+ZpnyO9KPjXp9Sm3g7
         yGTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrKoOocHOet+CbS3p2PWjUaJ1mlG3FrxNwl/eut/HMILNzKPt/2+x3Cn8/+8y7atgQYX7HbwYIbZj2S80=@vger.kernel.org, AJvYcCXfjgtftg3BGven9iTsyqq8g6BIbkWXBSYflk4v5KqCNsS/lSYZMtkMJ3cieqmywbM4ePG4Wh876jIfZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm9XUKBm4KItlupiBfnuWkRj2YoAcdiHpSuD4SKkWQdRN6MpQ2
	6dPPzFSmCWC3WYmNZH3zXCs6jEyy51xAjV0u5eC1MKB1i3f/Ub5E
X-Gm-Gg: ASbGncsOKC8UWfpNWikxPkqDDYS0qJ1FsPKuZXd5+EEDwQ5LxOOidKKGSyZtGHlO8lW
	nK1K1MSu3oMrXr+XNCU97rjFKQRWVqfar3vL6XKnu2AJ5awTOcFgSUlJ5bj8u+vFrQRiGWJsZUs
	UrNXjHAZ1hBLX9JWq+7S/ai1w98+cNi2RFxe3Ejqf+3li9iCEUKsBPadVk7T+x3SJTiUeKvfS6F
	fwWuMQ6Pq24I+2ydBXzRkssMi7iSmM33I/DcPRkpYgTzwTMuJfCVxx8nHa5CgobRn4MyKMI
X-Google-Smtp-Source: AGHT+IH2NEP4UNloaXkGthBrT4sL9NKjk8qQkyz+9II1I0gTS6OcTxLGYZEnJoB0B/zOf7Oz+BxRJg==
X-Received: by 2002:a05:6402:1d53:b0:5d0:cca6:233a with SMTP id 4fb4d7f45d1cf-5db7d2f59cdmr18220018a12.10.1737554923323;
        Wed, 22 Jan 2025 06:08:43 -0800 (PST)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73edc913sm8724961a12.73.2025.01.22.06.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 06:08:42 -0800 (PST)
Message-ID: <86425106b6756a45444e8f0479c7880cc78498ce.camel@gmail.com>
Subject: Re: [PATCH v2 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vops
From: Bean Huo <huobean@gmail.com>
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com, 
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com,  junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com,  quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Alim Akhtar
 <alim.akhtar@samsung.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Peter Wang
 <peter.wang@mediatek.com>,  Stanley Jhu <chu.stanley@gmail.com>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Andrew Halaney
 <ahalaney@redhat.com>, Maramaina Naresh <quic_mnaresh@quicinc.com>, Eric
 Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:UNIVERSAL FLASH STORAGE
 HOST CONTROLLER DRIVER..." <linux-mediatek@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 22 Jan 2025 15:08:40 +0100
In-Reply-To: <20250122100214.489749-2-quic_ziqichen@quicinc.com>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
	 <20250122100214.489749-2-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-01-22 at 18:02 +0800, Ziqi Chen wrote:
> From: Can Guo <quic_cang@quicinc.com>
>=20
> Instead of only two frequencies, If OPP V2 is used, the UFS devfreq
> clock
> scaling may scale the clock among multiple frequencies, so just
> passing
> up/down to vops clk_scale_notify() is not enough to cover the
> intermediate
> clock freqs between the min and max freqs. Hence pass the target_freq
> ,
> which will be used in successive commits, to clk_scale_notify() to
> allow
> the vops to perform corresponding configurations with regard to the
> clock
> freqs.
>=20
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>

Reviewed-by: Bean Huo <beanhuo@micron.com>

