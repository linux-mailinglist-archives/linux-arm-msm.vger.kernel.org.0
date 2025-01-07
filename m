Return-Path: <linux-arm-msm+bounces-44161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D8DA04458
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 406681887F47
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 15:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A766F1F3D51;
	Tue,  7 Jan 2025 15:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElQq3f9P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBF11AD3E0;
	Tue,  7 Jan 2025 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736263619; cv=none; b=dSwGhsiLphJp+mSxXFKk2MIpBwsMkntE2ffsHJErXKa2vR4+bu2K+trTNkjrF0+qwSKPyQtNjyOx12KSNIyua3ABz/2RSOYQ4IloV+LoM6nF3T79gnEGzZGrYS92jaA+RmURytC9UCWN3kRrYo9aQHr0jBwJRsPamGPBFzrMLiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736263619; c=relaxed/simple;
	bh=GnC9g6z307dLDtyo2LZl3efcrpZxudO80UZjLWvMufI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fDeTPGgAG14GggeBT+PZiOAPbFysa4HkIX/7PnJEmi1wh4PZze5ZNHFkCLZgnCQoore2Rax48oKuZBm1LcjuVsJwNuOyybhdGcACeAKBZySTUI2J6KumuHa2lKLWrV8w+finUeMxIRkimP8n5mhCNLgmWLvMpuhganI+endbLqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElQq3f9P; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3a8146a8ddaso57455975ab.1;
        Tue, 07 Jan 2025 07:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736263616; x=1736868416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYd26+ANvMzt3bh8JMGQhBXRVd6LUHx6ZcNpu+1HZ/s=;
        b=ElQq3f9PHUE1bHa3rG5jA5yO4IaB57GNxeHK+J210mFnnEW2c0qPcg1xn1p2Bj0Xob
         qd1GbZO7YvgA9DQBN4VTcI3zdJYXJsL4I+crbMSykyzQCl3HMIEQdwe33m/fDlXt2DG6
         3bscUn37scWeLoKN1Phy6NMA2/KYTMZQYSTWODUT7YkkqzuOHKsEfCw3bGhpLqufGcKx
         BmyvRAdHv+6DW9Fo/pk5SPZctMRRnXpFuExPm/Gfjm7cPLW8ONbXfdmvgseSQtZf01A1
         HPo9w02oyjVrHMFLx+NqO49nCOT/JntF3YQW4bfYmzx7SA7EL68CzOZ/OHigqKsbLR45
         kKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736263616; x=1736868416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYd26+ANvMzt3bh8JMGQhBXRVd6LUHx6ZcNpu+1HZ/s=;
        b=i1abEmFUH0EipvtliHDVq+IJBSXtAY9pnYF7bs7n5G5P68Xcty9br3cTKph44CWiMu
         PTaKC5jkJN8nIA+SqC8p0sSv8zq5w49dF7P2Dq+lbYSLLQp93Lbt2aRogs46TGPTs8st
         2ki44YZ+k6TSmixxTShGsbg7ddIUw7EEOV/nGmlCNnX/vjEGJWL3xSwbdkliE+sEuwlg
         Wv7QAqFkB1N8uCqxVv2uFthA2n11GZejR73yVffUYJHKOsY9Af62Ltof3moYUFSRJE6b
         Gzsm04RiJNCZbxwm3yJ9uZJWy94rFDljJcCq4AdhyYeI2erh3YaZT+bNQuHghNRkajp+
         sSbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6N1P2fEAbfdhq9rJuA+5iRK26d/uAgTKE2xCgwxpZoRxCykXoSqdXbdvCzYWd0S6q7nlWIVR5JZCwoPw7@vger.kernel.org, AJvYcCWPgh0Ia5YqE4mT/oqLuy4DSJ7JVRpCkknCvcH5X9C57ctRyv93NIS5Go8okn6LKPtNatBB2/NYMIHvzeyq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7P9fW++eYARfZYmOImbFTYjvew+7NONwrbzuWccunz8eIXHHO
	Zg3F0+2NCa8mjbDlzguOBjA7KM2sBsw5X0sM9bCifkzcYhCNPHTUoX/hZc6Okqilh4zsEqnuf5r
	7p7oZliHIdb5sY+/R66pXRXg06vVang==
X-Gm-Gg: ASbGncvWr+LkPpEMrTR00KQSeaBjPtt+X3nFVhopuu//awNprq5jUd7PYj2zqBCU7VG
	Vrh/rlFMHIMqjGSpSUpgEMyM7/Qs0BFR9Mwf27d2/isfrAF0EcoJJFikkcA3dXNLIOSkA
X-Google-Smtp-Source: AGHT+IHwuMLCJR6Vl2J967epV117Dufpeur0fSxmS2hJJtoEYpotAHxco0Dw2fvR3j5a3grMMCdXDq+mOt2AdoHs9GI=
X-Received: by 2002:a05:6e02:20eb:b0:3a7:6c6a:e2a2 with SMTP id
 e9e14a558f8ab-3c2d2568e30mr508063205ab.9.1736263615657; Tue, 07 Jan 2025
 07:26:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102183232.115279-1-robdclark@gmail.com> <20250107125738.GA6991@willie-the-truck>
In-Reply-To: <20250107125738.GA6991@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 7 Jan 2025 07:26:44 -0800
Message-ID: <CAF6AEGtZSOMi-=AOmjoXSVkwfyvKOymSuRRMZ7jOcM2wyhu5qg@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
To: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>, 
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 4:57=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Thu, Jan 02, 2025 at 10:32:31AM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > On mmu-500, stall-on-fault seems to stall all context banks, causing th=
e
> > GMU to misbehave.  So limit this feature to smmu-v2 for now.
> >
> > This fixes an issue with an older mesa bug taking outo the system
> > because of GMU going off into the weeds.
> >
> > What we _think_ is happening is that, if the GPU generates 1000's of
> > faults at ~once (which is something that GPUs can be good at), it can
> > result in a sufficient number of stalled translations preventing other
> > transactions from entering the same TBU.
>
> MMU-500 is an implementation of the SMMUv2 architecture, so this feels
> upside-down to me. That is, it should always be valid to probe with
> the less specific "SMMUv2" compatible string (modulo hardware errata)
> and be limited to the architectural behaviour.

I should have been more specific and referred to qcom,smmu-v2

> So what is about MMU-500 that means stalling doesn't work when compared
> to any other SMMUv2 implementation?

Well, I have a limited # of data points, in the sense that there
aren't too many a6xx devices prior to the switch to qcom,smmu-500..
but I have access to crash metrics for a lot of sc7180 devices
(qcom,smmu-v2), and I've been unable to find any signs of this sort of
stall related issue.

So maybe I can't 100% say this is qcom,smmu-500 vs qcom,smmu-v2, vs
some other change in later gens that used qcom,smmu-500 or some other
factor, I'm not sure what other conclusion to draw.

BR,
-R

