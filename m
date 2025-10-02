Return-Path: <linux-arm-msm+bounces-75786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8036BB367C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 11:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DBD416EF35
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 09:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6D12FFDF6;
	Thu,  2 Oct 2025 09:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6KLbjbU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72872F0C51
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 09:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759396277; cv=none; b=umkGbtcMu7Y0glVIqV5dz2x47bDM11Utu0DRwvD5jRFyahVbMnM8SXHrY1LF/vzLC2QjEl7DG6c2/odWjXr6bHd5M+pAf6CrsvKIU+hvyZeXiuXUg9tRmktbV8mzF03LfD7rAQBY0tg8qVglrI/2HvKSH2ybrzkA9lP7+idJGKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759396277; c=relaxed/simple;
	bh=7vISLXam/StnY/1bXWcjwb5SE+Eeq4/IWHDSz9tGN6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pw0Tz2HT99UaFsgrvNQ13w2A9SHlWlAJr6JS8Gtv+f1NjoEXL+ylRpozDCCkxnBj4Et7DtWS7LGR8eWLzxIUVkfGCY7Jfr4HydGGXQig1hjszPEs3ee+ybrDSz3rcyt2mBRnkvZUTA9yFkdj7zNmp/gZRxQ6w9DDiI3gU4wZCZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6KLbjbU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59299voU024141
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 09:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BbZ0kpARpq5woqsrxuG2UwFJ
	0a+vlIFaF0Nv54X+o7c=; b=U6KLbjbUhNdyAMwZlM9FfmOs7mP6N91HXfXmvS20
	HOY7tlkNP4E5ChWQ6zvumsiQe3TSDvfEw1pYWCzZ7IM+rJQsF2EhcuRN78886gyo
	dK6qAHYQv9bIjmcjnYc2yZktC0bbd7OmjDJPqxpNHwbUZwRcYC6ghzGc3EkfvmHa
	wVZMTEaXljI+0cVji10NPLiskdByedzL+Acdxo/A8OFEGeYUT6bmfofax9deONEu
	n7B4AacZoziPWKS8a0EiVpCJ3fopaUufVOZZKw35hvagNippiQqciX5eBMuXnYk2
	FaPitlgvFxF+12EUtCNe/CCzpbCMd7FrC88IMC9HeT9ykw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977y4xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 09:11:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e484dccaafso19538211cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 02:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759396273; x=1760001073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbZ0kpARpq5woqsrxuG2UwFJ0a+vlIFaF0Nv54X+o7c=;
        b=csW09sRsfsaoOv1ydhrSdDFq/qRV4nhSZ6uFCR1+HJE+jO7i3MQ1yUMpoFT0OUeUhh
         xTQ1XVuDACQAwULSmN6NXLjXos6tbQEr2WJnjJXW+UB4XegFrlwnQlezPYGysABpWdEr
         nDo8nE1uEo4abNMBhjHC29FMiR2wCvYNEi/kyCUnnFa0uN13Q33pmsGY4WyV+/8tQ5MW
         TmjEFHFASkgoynp6Bwh2r8755b3Mo5NQ4flMGwxqlJujkIUwbRQs4fN7Ob5rPr2xtWvx
         ahRYjwuGu7HewW6pCUGxF7Tiogd0CjP6CAj+/oOlea7SEwUrQsLWUE0xObnLLPhAkQFv
         dlLA==
X-Forwarded-Encrypted: i=1; AJvYcCVeGJmKPbwVleZmJuUyXyyxrBgrcAKeZK4uepdhmvLUXT2A7Njfg48HEnRqtXvnVawJ3nmesBKh7oECjH5L@vger.kernel.org
X-Gm-Message-State: AOJu0YzhealArBxg1g051REaFEvbG+FoVt80+rYYa6GPN+UeJ/mG78fk
	dJ/O6kIUg/S1txwkNe9HqL9fObysZYuGBdhzSfNgwu4yWJ7VMnRSfAsH2e/zLpdICYHzRNcbvTn
	/RyRjc56h+fKm0YPxld+ZjaDVh5TNHoXoRvIvQuAJwHMynHmNNlNjWsH44WvAMesjOgkn
X-Gm-Gg: ASbGncuW8dIoAYQQf1w32Fpu310mYU4gjjykBTd1Mq9BAgmiynecYw6JLAM5LxRiu/X
	xraWr5Z6pptlyr79zR0BfTxhuzGP71UmfLMYgSc/tWeP9tminhvDEJuJaan6j0/Kxi8VaL6HoBQ
	Qncr7zAsRKFfa3YkO2vjnZKJQYqwbNvdPm8a51Exg26OuteJCAdfyoo9QP8yH4FJVvvHOcjbLFT
	JM7koqe1AfqXd0hYBRX/OUdJu19h9rN4Cnv0d2Dfe41b/klDowl26U/1O0SLajXLZbbk52Esv/g
	y2ruFckLrBm0RgBFvD0WmLuvobjv3sqf5+9hVOVHNMebUF81Qazzi/aOlg/e87pqyapRgVzfxTL
	8wC+vJ+L9XUQAYD3Tk4Ix8qMI/1VbdVp1suTc9jkWXhiGeKXquasl9ZYy0w==
X-Received: by 2002:a05:622a:154:b0:4d2:ba6f:28fa with SMTP id d75a77b69052e-4e56385c6e9mr37201121cf.34.1759396273450;
        Thu, 02 Oct 2025 02:11:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENSBLEIgOelziMM7PRs4E2JbckXE3QLoNPec5Ivqk6TxCyEXfAzasrbhxr75kMJnXNT42dCg==
X-Received: by 2002:a05:622a:154:b0:4d2:ba6f:28fa with SMTP id d75a77b69052e-4e56385c6e9mr37200711cf.34.1759396272754;
        Thu, 02 Oct 2025 02:11:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba2e1445sm5565831fa.21.2025.10.02.02.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 02:11:11 -0700 (PDT)
Date: Thu, 2 Oct 2025 12:11:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Message-ID: <f4qarbagzswtfb3cozmdp2bul4dpd5jbouce36xgr3mzdsn53x@e26kiedxsxtg>
References: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
 <20251001220534.3166401-8-wesley.cheng@oss.qualcomm.com>
 <ra3bq7guxunk2n7mbrjlefxvxu45clmwzp74vq7bqd2xvp2fv5@z5skxjxs4yxp>
 <8996bd96-0660-70ba-63f4-51111219d146@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8996bd96-0660-70ba-63f4-51111219d146@oss.qualcomm.com>
X-Proofpoint-GUID: ikeJdpGt8zaJ_dpFaekUKraXC-4htHE_
X-Proofpoint-ORIG-GUID: ikeJdpGt8zaJ_dpFaekUKraXC-4htHE_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX/Px9C07U9qs4
 R3Biuh6zGfQ+b9CyMtbNOuauITBqa19yinQ0O9WyM19vJc7ViFq/mMosghpLbKkPSMB1tOPJTsH
 h80Ie6/OwY5oKTPiWZwVwYtzNkiaWcqkXuG4dY5uGD2yZzjzy1a1Ymz6PU5S9zkQeHNPPzkH9oo
 bc5HUWN+vxd5q+05N004FLW3s3nxfbPCs7t5fJezRJPfkTIkkR4FvfUv1rf9IaNMnqJ6GSYUqNs
 4OX2haNsxqOeUIOqVCLsrU8UYhyJNWSeVu6EO//Zh7Pbh3DrEyf6uu3MU7Yy7pO68DTvMW98IVR
 zxGVDEyayLVZahw+gyoZda7dO8DgHTyFtWCKNlBe/PxIWlQkQdlD5GXknGASq7peE3dYQ8QFfko
 2KQq6fBFo3AVdQEvnFXC202bytJD7g==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68de41b2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=97tA0vavRIenci2OwCMA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_03,2025-10-02_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043

On Thu, Oct 02, 2025 at 12:14:37AM -0700, Wesley Cheng wrote:
> 
> 
> On 10/1/2025 5:58 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 01, 2025 at 03:05:31PM -0700, Wesley Cheng wrote:
> > > For SuperSpeed USB to work properly, there is a set of HW settings that
> > > need to be programmed into the USB blocks within the QMP PHY.  Ensure that
> > > these settings follow the latest settings mentioned in the HW programming
> > > guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
> > > new ways to define certain registers, such as the replacement of TXA/RXA
> > > and TXB/RXB register sets.  This was replaced with the LALB register set.
> > > 
> > > There are also some PHY init updates to modify the PCS MISC register space.
> > > Without these, the QMP PHY PLL locking fails.
> > > 
> > > Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 312 ++++++++-
> > >   .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h    |  17 +
> > >   .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h   |  12 +
> > >   .../qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h   | 639 ++++++++++++++++++
> > >   .../phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h  |  33 +
> > >   .../phy-qcom-qmp-usb43-qserdes-com-v8.h       | 224 ++++++
> > >   drivers/phy/qualcomm/phy-qcom-qmp.h           |   4 +
> > >   7 files changed, 1240 insertions(+), 1 deletion(-)
> > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
> > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h
> > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
> > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
> > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h
> > > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
> > > index da2a7ad2cdcc..7211c71fe68c 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-qmp.h
> > > +++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
> > > @@ -32,7 +32,9 @@
> > >   #include "phy-qcom-qmp-qserdes-txrx-v7.h"
> > >   #include "phy-qcom-qmp-qserdes-com-v8.h"
> > > +#include "phy-qcom-qmp-usb43-qserdes-com-v8.h"
> > >   #include "phy-qcom-qmp-qserdes-txrx-v8.h"
> > > +#include "phy-qcom-qmp-qserdes-lalb-v8.h"
> > >   #include "phy-qcom-qmp-qserdes-pll.h"
> > > @@ -60,6 +62,8 @@
> > >   #include "phy-qcom-qmp-pcs-v8_50.h"
> > > +#include "phy-qcom-qmp-usb43-pcs-v8.h"
> > 
> > Let's not include USB-specific header into the generic header.
> 
> Hi Dmitry,
> 
> This is actually referring to the QMP PCS register set for the USB43 based
> PHYs.  Even though it is a QMP PHY v8 (ie phy-qcom-qmp-pcs-v8), there are
> some offset differences between the existing one and the one being added.
> In that case, should we still have it in the USB specific QMP combo driver?
> I guess it might make sense to have it there, as technically the usb43 based
> phy is only really going to be there for USB4 capable cores, and I don't
> think there's much that is common between usb43 and other HW that
> utilize/share the QMP PHY.

Yes, please.

> 
> Thanks
> Wesley Cheng
> 
> > 
> > With that fixed:
> > 
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > 
> > 
> > > +
> > >   /* QPHY_SW_RESET bit */
> > >   #define SW_RESET				BIT(0)
> > >   /* QPHY_POWER_DOWN_CONTROL */
> > > 
> > > -- 
> > > linux-phy mailing list
> > > linux-phy@lists.infradead.org
> > > https://lists.infradead.org/mailman/listinfo/linux-phy
> > 

-- 
With best wishes
Dmitry

