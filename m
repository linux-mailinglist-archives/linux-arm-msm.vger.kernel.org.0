Return-Path: <linux-arm-msm+bounces-57122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1DDAADA20
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 10:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2F3D981629
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116F0221713;
	Wed,  7 May 2025 08:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="JAIGVEbo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8DC221708
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 08:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746606468; cv=none; b=gkOQTO42PNnm8aH89n/qt4lbb8nXMS52tydbHzttAE86AMMk1A2pvj0F6TJuztz2PRt+/UVX/h8QiCM6iN4SeyxKRIHIkUZLes3Sf82d/lQ6sxSo2ZQvsV0YQyekJmPGHffqqwhaDtROpVZlWtQ0VFQmn2JzXPpKAOnVDsP+F28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746606468; c=relaxed/simple;
	bh=ZQ6pPahqX49L4FoIRBhZ0n9rPl6wHTixR5GsHVSUubk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=EK5kE2feOWyZIDBA/zv89iCDgb+gadDdDLSrc88Ok/JnTYHRovxYtwefDpFmPSX9NNlc881+ciXYpUx30bHowvClXyP9OnSMKIcdbAgdAXSudkhfIMnS17M/4eOWWyDhyTHUbW2pUhMU4cJYrID0Ag1VOcP2RR9PJiaUq9RiBzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=JAIGVEbo; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so1225605766b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 01:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746606464; x=1747211264; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCYViyp5kWLfzXdJOLLht1vSVoT9lkOIaKumywG/AIc=;
        b=JAIGVEbob9+FV/NFODJBl3mxVj1WGC05bu20pUQl30dx5mtlyc3cOvB6GE+zTy+1KO
         aTUwPpOEtQi7Hw9fz7dIAd6wVDy29K9JK1NuzSPBMJItTVdW1R5VhnGAONOW81L86glK
         HlblZS4CjHFEHNMv6mqj74x6Ln6AHMCY4pkNm3wwSc75siMoW20zUIhFGF6noP4jRGj3
         Am67JbbSU0x8vQYflOn2XC7pzVBtiMWwh7hlJlP3aaF+AnvLD8ewB2532k2x/kRYjb8d
         OweG6QL5pm1e/SdqjEGGpbSga6gJdycD6LAM8fXyZ/qcmQpqcWWw5YqH7iO6l8BcoU9+
         9IcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746606464; x=1747211264;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tCYViyp5kWLfzXdJOLLht1vSVoT9lkOIaKumywG/AIc=;
        b=CHAODFNsCiQvGelXy5yZFGHAXLb8A1hzZItvA2DM9qMpkEWMKqlUYP7m7hckSBP42E
         D5IryTgaZxO7BXQCKUlyNbvSdhzAbRTlMlzgSqaZLPtEc4mt0RTyHwSh7YMOj2Ge/J9f
         EwFBx2KPrvAX4JOurWDFccmH8QyS/jBLve1MvPm94/t7oYM3HZgD78C5iCgHuG3ZTC36
         /apI/YAKwSlKYWGwl9tQ+eiOWPPbsgtFJbG+B7Seax1Q+wR4y8PpgoIt5be1AywSvJ94
         4lOsbc/GZNtKdpyNTIamVy5oOJkaUVqpzQ673OCwia8hXZw2pmSo+fr3+tJVXrlJZwbG
         Sypw==
X-Gm-Message-State: AOJu0YxzlfqR6MYJ6xUoC2/XOWY/+knXIuejp89rZRKcX7s2Pj+JYl1X
	sPFyU1Ls3gXqtqVa2L6GUR4GLtDDzxUGGLG+8+6CPre3WhWNMC2GreYSWj4FFpE=
X-Gm-Gg: ASbGncv6Re8Q0zBYNKjwPzBiRmImeyG1NxFFw3UMpcGQ9Cp50QX2hTFyMWuG+jf3un+
	ouILTsN/5F3f/yTYUpGDsWYDevRwNR9ZxCpBQyPoELIm5GPSKYGvH+arX0xB7YjzAC06RZV4dvQ
	DaCa7/rKIY6V3tafvJMKxS3Iu3EhtI3FzO4/jTTLb5X/ZthLkR2R5CxA5DlsFyhQrUPWQqhiOUP
	mWv4LhZqCCFJhKfJRX1kcAd+n76FLZKOljWi+j/rGd+oGl7pd9rZhoRxPIaZpx3ANtpqLMpMEb8
	cw876dZ83SUoCmyrzhcndFmesHwIvknDr0NC9HSuf9nD1h7WnQjVNnR2XcTPquOewp5MGMbYNWA
	L/roev004jA3jdne0+4dV
X-Google-Smtp-Source: AGHT+IFWVHMkGbVmG1uAPmLK3vq0y13EMcQN92l07tgAXfsVhbprvVYbhymi8zGzYG2gLtYTRHhcDg==
X-Received: by 2002:a17:907:7d91:b0:acb:1078:9f79 with SMTP id a640c23a62f3a-ad1e8befd21mr271452466b.18.1746606464495;
        Wed, 07 May 2025 01:27:44 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c033asm873440066b.91.2025.05.07.01.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 01:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 10:27:43 +0200
Message-Id: <D9PSBGJ3COBM.2ZFBUDFGL4AJC@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Bug fixes for UFS multi-frequency scaling on
 Qcom platform
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Ziqi Chen" <quic_ziqichen@quicinc.com>, <quic_cang@quicinc.com>,
 <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
 <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
 <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
 <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
 <neil.armstrong@linaro.org>, <konrad.dybcio@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250507074415.2451940-1-quic_ziqichen@quicinc.com>
In-Reply-To: <20250507074415.2451940-1-quic_ziqichen@quicinc.com>

Hi Ziqi,

On Wed May 7, 2025 at 9:44 AM CEST, Ziqi Chen wrote:
> This series fixes a few corner cases introduced by multi-frequency scalin=
g feature
> on some old Qcom platforms design.
>
> 1. On some platforms, the frequency tables for unipro clock and the core =
clock are different,
>    which has led to errors when handling the unipro clock.
>
> 2. On some platforms, the maximum gear supported by the host may exceed t=
he maximum gear
>    supported by connected UFS device. Therefore, this should be taken int=
o account when
>    find mapped gear for frequency.
>
> This series has been tested on below platforms -
> sm8550 mtp + UFS3.1
> SM8650 MTP + UFS3.1
> QCS6490 BR3GEN2 + UFS2.2
>
> For change "scsi: ufs: qcom: Check gear against max gear in vop freq_to_g=
ear()"
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on RB3GEN2
>
> For change "scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core Clock fr=
eq"
>            "scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling =
path"
> The original pathes of these two changes are tested by: Luca Weiss <luca.=
weiss@fairphone.com> on
> SM6350, but we have reworked the code logic later.

How about adding these tags to the patches?

Reported-by: Luca Weiss <luca.weiss@fairphone.com>
Closes: https://lore.kernel.org/linux-arm-msm/D9FZ9U3AEXW4.1I12FX3YQ3JPW@fa=
irphone.com/

And despite the print in patch 2 where I've replied separately:

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sm7225-fairphone-fp4

You should probably also add some "Fixes:" metadata to your patches.

Regards
Luca

>
> v1 - > v2:
> For change "scsi: ufs: qcom: Check gear against max gear in vop freq_to_g=
ear()":
> 1. Instead of return 'gear', return '0' directly if didn't find mapped
>    gear
> 2. Derectly return min_t(gear,max_gear) instead assign to 'gear' then
>    return it.
>
> Can Guo (2):
>   scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core Clock freq
>   scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling path
>
> Ziqi Chen (1):
>   scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear()
>
>  drivers/ufs/host/ufs-qcom.c | 134 +++++++++++++++++++++++++++---------
>  1 file changed, 102 insertions(+), 32 deletions(-)


