Return-Path: <linux-arm-msm+bounces-28730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A20995411A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 07:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2272428AE9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 05:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC1278C7F;
	Fri, 16 Aug 2024 05:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nefMuZMT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96456EDE
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 05:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723785862; cv=none; b=QCA9jh8U0zvyr33MMscyjxzuPWIOuaZoGc4tKJ6XB4x+VhwoQwoLVp21Vy5BfzK6Fr7CiSy1dP58GQgWdenG5Gdzt+NEWwa5KL5l1gCtiWwXbjEkIu5rrdA9Fo4MUsTanXsuJKnrz0jYgUHlVfcbQ3rC1zeyW2LgCaMeoVuQLvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723785862; c=relaxed/simple;
	bh=IAD4Ng0J5zz3wi4ezGMVrCJzBG1aq3TvHsJccVDi9c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPVbfHC+OBM/evDptdRjvebAc0YaBsFymgYgQhfnaQ9hHdIVo3zri7TlwPvYLtKGqSTNFU/sdZMYSSapHqyGK1x1PFjPlMcnjMpA96gBPdAw1fnwFioLaPG7RPgX0huzSwaSO4I7lP7NmkKe+KtBlZavUivSc43ORz95T06wBgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nefMuZMT; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7105043330aso1499621b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 22:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723785860; x=1724390660; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cWvqN8L9T4VZ6SwiImV1tS1PClTOGw7HuC117PJzjSA=;
        b=nefMuZMT5Lo3E1jMZ2Iqf9GMCtg/DwjddWyfaCgxKnTdSU+IUv7aN/Y76izAOlSZlf
         BgeciwRJ6bvgJ5R8ajn4e2i861TWmNi71AlWuHbF+X4R6Wr3CbgYIE3dIdvVr0TG1h+7
         q2vZMxtu+752HWDgRWxVR94GyTwUDJlgKEKX7K2O/pMr9O56swOjPZ2eS3/Wu8UoJNs3
         jqp+i1tW7G4ou4NJkQXJjVshisz9NC3lfr9fNuwimGCBEkrPdqtJR9S/sOK8Xol6dWN4
         elyYrmBV0diM15BZEUxn61vVn+zRQQXQ8bPA0mysO4nCYBDj+vQHyUEaKuGsxprBHhdQ
         5hGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723785860; x=1724390660;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cWvqN8L9T4VZ6SwiImV1tS1PClTOGw7HuC117PJzjSA=;
        b=nuFgBHlr35DcYp7fv+tYchOmGZTa8PihmdxDroRt8CdiWyU08P+oaRSkFzo8HMIK9Q
         7iwl+ypW/nm7l/FkWSibgClsV6voG8Nn7e4QumlnR6jVujsDMgsEpWr40BOrMVr/WhPu
         jy5gHCLio784VzMt8E26/gMNpBB2l9R1YoZvXCIoRPIsbzUF+quW0CWMyoGOjaqy7Z3n
         f/txbyoiNwSBrzhrKohZMlrFoVokJNAHViABaL7Uv1YsQSxTPpms0deFMPvfnIY4WQQn
         PycFOTCm5WbA00QoQ8edHO6Ccg7V0VMLLh/TvTNYOFvVQ7EbW5DayFe0kZ/DceilzBJI
         C7Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUY5Ws7Segqa6Fsr95+Ji6Hjr4AJiN+oFgjjvkA/xF9YNKVC8CAVLKm1EvkSHseDzBW2xp3txFAzbYP+fOJuOhwE3I0uCcipYFISD84rg==
X-Gm-Message-State: AOJu0YwbrqbOocefA6DEB7sZumTdzkAWJkhcGsTtF+4BPMe+uoculc+e
	gLiHyjRUtxptY0LNe6Te4SjYWkK36s/qc3xktbBDQi7noHEgHFaDRKl4vHMIUQ==
X-Google-Smtp-Source: AGHT+IF+/eZuzaCI6HM490oe/E+8yN4V1wgPcX0TKQlnWBZOqOGaPmvWzefXzToBBiZPaWJyrTa+pA==
X-Received: by 2002:a05:6a00:99a:b0:70a:fb91:66d7 with SMTP id d2e1a72fcca58-713c4efbff8mr2435861b3a.20.1723785859871;
        Thu, 15 Aug 2024 22:24:19 -0700 (PDT)
Received: from thinkpad ([36.255.17.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127ae0e9acsm1868956b3a.82.2024.08.15.22.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 22:24:19 -0700 (PDT)
Date: Fri, 16 Aug 2024 10:54:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>,
	Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH v2 2/3] ufs: core: Add a quirk for handling broken LSDBS
 field in controller capabilities register
Message-ID: <20240816052414.GC2331@thinkpad>
References: <20240815-ufs-bug-fix-v2-0-b373afae888f@linaro.org>
 <20240815-ufs-bug-fix-v2-2-b373afae888f@linaro.org>
 <f79a87ba-4d2d-42f0-ab94-1e6821a482f2@acm.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f79a87ba-4d2d-42f0-ab94-1e6821a482f2@acm.org>

On Thu, Aug 15, 2024 at 11:25:38AM -0700, Bart Van Assche wrote:
> On 8/14/24 10:16 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> > index 0b1787074215..8c9ff8696bcd 100644
> > --- a/drivers/ufs/core/ufshcd.c
> > +++ b/drivers/ufs/core/ufshcd.c
> > @@ -2426,7 +2426,11 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
> >   	 * 0h: legacy single doorbell support is available
> >   	 * 1h: indicate that legacy single doorbell support has been removed
> >   	 */
> > -	hba->lsdbs_sup = !FIELD_GET(MASK_LSDBS_SUPPORT, hba->capabilities);
> > +	if (!(hba->quirks & UFSHCD_QUIRK_BROKEN_LSDBS_CAP))
> > +		hba->lsdbs_sup = !FIELD_GET(MASK_LSDBS_SUPPORT, hba->capabilities);
> > +	else
> > +		hba->lsdbs_sup = true;
> > +
> >   	if (!hba->mcq_sup)
> >   		return 0;
> 
> An additional question: since the next patch only sets
> UFSHCD_QUIRK_BROKEN_LSDBS_CAP for a board with a UFSHCI 3.0 controller,
> do we really need the new quirk or can we replace the "!(hba->quirks &
> UFSHCD_QUIRK_BROKEN_LSDBS_CAP)" test with a test that verifies that the
> UFSHCI controller implements version 4.0 or later of the specification?
> 

Ok. First I made a mistake by believing that SM8550 is a 3.0 based controller.
But by looking into the internal documentation, I learned that it is a 4.0
controller without MCQ support. So version check is not possible (and I need to
fix the description as well).

Also, while looking into the version info I found that the Qcom driver sets
UFSHCD_QUIRK_BROKEN_UFS_HCI_VERSION quirk and the callback function
get_ufs_hci_version() just hardcodes the version to 2.0. But the recent SoCs do
reveal the UFSHCD version info correctly in REG_UFS_VERSION register. So the
quirk might only be applicable for 2.0 controllers (not sure if those are
supported now). Will check that and remove that quirk altogether.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

