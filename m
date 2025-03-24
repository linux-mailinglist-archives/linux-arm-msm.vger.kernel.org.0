Return-Path: <linux-arm-msm+bounces-52276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 137B8A6D546
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96B8516D439
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 07:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DCC257AED;
	Mon, 24 Mar 2025 07:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FLKVB7p2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B178257AC3
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 07:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742801979; cv=none; b=Wm85L+q6y2RlA68C+d9GTC0FT2eZX8STQFGlxBQBtV0i/cUgohzQyyx1jXDcYJFMHCt3IxacYkJ5Vf8KCt9y2ccMOXoRZvDu5np7mb6xFM+2T55nidc3jNaj6wnNhymvDXUBK8mqFt2ZnXvHnahqGVq814xezTzrFVGWeOoCLoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742801979; c=relaxed/simple;
	bh=/E1+CdUd622YHSdavtWVNjJeqQ3x0Q9Uv74BQL9+Btc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcLiPQ5ghCYDvX/F3xwBwiWZIt7RStN7BQXl9yETf6cV8lzxcwaNwzRzQFl3Wu18fYbr8YhvD4+/HNrLcF7skrKr7/ezwTDsPcbJVapVqzFW0nD8B1mc5CPyOY4EZesoj1Rp0YhNcWBp6FtapBoqtBx56HejfOihMnUJAEDakC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FLKVB7p2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2240b4de12bso58950395ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 00:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742801975; x=1743406775; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SxcFj9fapiNOLa4zKIqkX0qfsgj2Wcwr7I86fBYGV1c=;
        b=FLKVB7p2BAPSLHdcTWEku7Jr8bx28PABFcTQNHgT3LD2H7FnjPSqljbJlAw1wClIrW
         oJxmtGu2UQkD5foeSAHUjvqz60TPkhnf2wx2NYsTz3YmfYRNEKsN/nADD3Ze1Jb1Hmpk
         FGC/vjcseCeuT6fXeD6HrViyOfRqRy8r+sPanCOj5fAIquYygjY+nxZa8LrOUrne+gqJ
         pWP/tG/UNcNG6A29tkYNYfSiWuNI4Y5kym3lQhQsEUWlYeyqk/XZ6RGnbCNHqLW3J3Yx
         LlmTASDqWn2ba/Qu3lDaZqLocCKYfWfurrQ+npDAte7WGc9HpvNFv1IhX98k5tb+DH4p
         QfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742801975; x=1743406775;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SxcFj9fapiNOLa4zKIqkX0qfsgj2Wcwr7I86fBYGV1c=;
        b=sMliNbXpzzcBQxIy+fpyVJ30RuE/PFZgaenxRjXaNpir35nX6a7yG9HPOrI1n/llff
         VRaRtAuZu0yKsuTygaC1y0Ehr6RQqAgA2LPK+wsfz8cp9RE68MXpwNg5G9mx0VZj/0bO
         0GuEifk8AEl3aN6RNvUvLF6EVLHw3+JfLka6W/9plKuKRETsw0sgcwPjwI4BV3+3yl3A
         sfktFMs7decD3z6a3tJfR9GwRy7bRqhFucCG1uUpyoyuGEeorlNOyQzfBldvEs+2c8qa
         OkF5Xn5BZgmumWp0cCsOmcRheyH7SKnBHTWNJcX246IFToax/G3fpfpHRouD+xp+Yvqk
         HprA==
X-Forwarded-Encrypted: i=1; AJvYcCWgUI/lfKoK8k8TfI30zXT8Yg9DYxiBxxx5V4/BSHv8JSDocWJJy09U8HY/gjdrQeTFwOeXcxHio3ORn1mv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ReTqnEB3JFapwTYdczhEH+KnlI63t2h74NAkEeYciqEO+Ltj
	A+SxTfw9cyQMLdSdjtPB7g45bJDX0jcNMeAiy1SX/3mBMqRr003Wxd3bpLw3ug==
X-Gm-Gg: ASbGncvykjmqVGigb67nOtNE4HTHZNKep1DoZbfxszoHEj2eCh/Hs+q0IA7PnAWUKK/
	MyD3l/jwxN9cmUajq/fFYYGi/sqrp86P1Ly0rK/ulWIxvVETOEOw5rznm73IBTrWqybHNE9mmPm
	Map5aYzauT65Mw/aTPCIchKXNSAO3hkfzMUk6wlSAA3+4bYye80Ja7znvA7TkWEJ9Fe9SAEVz0J
	kQe04WqGoJq8wv1XbDGVc4/1H00UGI/Te7UenlK/uOfhPKbHBOEjAGnb6+YsqpVl2OuyghnZnKP
	yZDuCvxB1iMKIl2pHMpYye5HZd4c7h70PbO1w6dBvJi7fVHKv82KkGVl
X-Google-Smtp-Source: AGHT+IHRecfblK8vR1wTkg7Bdl2kn7F86Ux81QsmlBimFCn4K8XEWHWHnLXKyVSFhm78XAFAqD/w/w==
X-Received: by 2002:a05:6a00:23d5:b0:730:8a0a:9f09 with SMTP id d2e1a72fcca58-73905a02721mr19367881b3a.18.1742801975063;
        Mon, 24 Mar 2025 00:39:35 -0700 (PDT)
Received: from thinkpad ([220.158.156.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390618beafsm7199869b3a.161.2025.03.24.00.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:39:34 -0700 (PDT)
Date: Mon, 24 Mar 2025 13:09:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: MANISH PANDEY <quic_mapa@quicinc.com>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com, quic_cang@quicinc.com, 
	quic_nguyenb@quicinc.com
Subject: Re: [PATCH V3 2/3] scsi: ufs-qcom: Add support for dumping MCQ
 registers
Message-ID: <awc2ql2x5amiahf7l47xqhgl7ugi4zpk5wz7qycgbqb52gh4yb@24za7q2rqqob>
References: <20250313051635.22073-1-quic_mapa@quicinc.com>
 <20250313051635.22073-3-quic_mapa@quicinc.com>
 <20250318064421.bvlv2xz7libxikk5@thinkpad>
 <12753be6-c69b-448d-a258-79221f4dbc7c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12753be6-c69b-448d-a258-79221f4dbc7c@quicinc.com>

On Wed, Mar 19, 2025 at 11:51:07AM +0530, MANISH PANDEY wrote:
> 
> 
> On 3/18/2025 12:14 PM, Manivannan Sadhasivam wrote:
> > On Thu, Mar 13, 2025 at 10:46:34AM +0530, Manish Pandey wrote:
> > > This patch adds functionality to dump MCQ registers.
> > > This will help in diagnosing issues related to MCQ
> > > operations by providing detailed register dumps.
> > > 
> > 
> > Same comment as previous patch. Also, make use of 75 column width.
> > 
> will Update in next patch set.>> Signed-off-by: Manish Pandey
> <quic_mapa@quicinc.com>
> > > ---
> > > 
> > > Changes in v3:
> > > - Addressed Bart's review comments by adding explanations for the
> > >    in_task() and usleep_range() calls.
> > > Changes in v2:
> > > - Rebased patchsets.
> > > - Link to v1: https://lore.kernel.org/linux-arm-msm/20241025055054.23170-1-quic_mapa@quicinc.com/
> > > ---
> > >   drivers/ufs/host/ufs-qcom.c | 60 +++++++++++++++++++++++++++++++++++++
> > >   drivers/ufs/host/ufs-qcom.h |  2 ++
> > >   2 files changed, 62 insertions(+)
> > > 
> > > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > > index f5181773c0e5..fb9da04c0d35 100644
> > > --- a/drivers/ufs/host/ufs-qcom.c
> > > +++ b/drivers/ufs/host/ufs-qcom.c
> > > @@ -1566,6 +1566,54 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
> > >   	return 0;
> > >   }
> > > +static void ufs_qcom_dump_mcq_hci_regs(struct ufs_hba *hba)
> > > +{
> > > +	/* sleep intermittently to prevent CPU hog during data dumps. */
> > > +	/* RES_MCQ_1 */
> > > +	ufshcd_dump_regs(hba, 0x0, 256 * 4, "MCQ HCI 1da0000-1da03f0 ");
> > > +	usleep_range(1000, 1100);
> > 
> > If your motivation is just to not hog the CPU, use cond_resched().
> > 
> > - Mani
> > 
> The intention here is to introduce a specific delay between each dump.

What is the reason for that?

> Therefore, i would like to use usleep_range() instead of cond_resched().
> Please let me know if i am getting it wrong..
> 

Without knowing the reason, I cannot judge. Your comment said that you do not
want to hog the CPU during dump. But now you are saying that you wanted to have
a delay. Both are contradictions.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

