Return-Path: <linux-arm-msm+bounces-46192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FCAA1D122
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 08:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C61D7A1AEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 07:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D8A25A65E;
	Mon, 27 Jan 2025 07:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NvgjpyKx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5725D15A86B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 07:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737961369; cv=none; b=cuQbacnc1BDJbxzhybBxG0XYnG2yPcdQECQzeX7nLQ70hKE+j4lWotnJsc71PYRaO22GkUnuGt2gU6vfbmdWhVZvxDJLqiEm7osEvHh2IGSbSNp+QlmzJKJWMwTaRGH8cm0ueB4kzvwA8YPDzAUZd3cqCEorNR02/t25p7XdJwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737961369; c=relaxed/simple;
	bh=Jjte7qF0T5d0DvKJnm0OUAEPba9vY7Yiy50vIJZMD0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I187UBY57Pk/uApkb5rvvC1S8SLN8vpaus7J+vq25Q2gACYCgpCghJwUqAS+p+YZGuMS3EdDxmHfLeFWT4FA71lcQaSKEPHoCTt+codsCSEr6lAyjuVltwtaflIeQTVUKLGyTfJhQGB3mxoFrQTQkwDX9H96muFJGiMahqpjSpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NvgjpyKx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R4rd33022758
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 07:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tgoCbfdV7M1m7V98l9FOFOzCnmHIpGeMbHEp6hoi090=; b=NvgjpyKxjtfp7XXr
	/g2TgBbi6vi9loYcZl18MxUEnW+aAY3w4mMcS3AV5ae4XCjjsLmHskUzPXXVx9v2
	WLBrAGZoXW2fPAJRT0c/9d+0urXzaNh+bKLNSGKU3WenIao/h68edae9robd6MJV
	s+5ml1+NUjacWuT7+z9GFtTfUFH8uKHElVFWDEe3EuDgQtYEqoYrPOXimkmEP3b8
	p/yOpsL967L9eEB+GlB4NRVmaA7QHHWlecyOQCqwpjBzhFbwstej4fK9w+q1hNL0
	3nqEjNDZV8L8nw7HkjaOGvjRiINbXXT8Qd797HovsvQligKf+SusXa+7x3qfPalq
	ON84Sg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44e3h2r81r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 07:02:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef91d5c863so8441190a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jan 2025 23:02:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737961365; x=1738566165;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tgoCbfdV7M1m7V98l9FOFOzCnmHIpGeMbHEp6hoi090=;
        b=Zg8fqkMEVwwqLgRGp9kxMpUSeIdQApBsSDnebsgQJy+BEolK5wWkSQ/36ghR5O3+zT
         BB7HNy7XhUmOiqeq5THJiQU6hj5MJo1pVnXgfgcDQXaMICbJtG12s97n4RmE8690t80N
         Er3rXtcFAzZWZACXf7xNbhkymfMVJusLosCB8BG6OyNxdhow7lDKgZIoz9R5epXETWmj
         iEk5v3ylQzJCPUQ9JJA0B+KFOL7MTYVXzYNbQZws3dtnTVQTDCLw4RcZmPsy5TLQPYvJ
         LZ16FUpnDLHg3kARM6uk/+DfFHgvE7/kp7x1JTbX4wSLnaAXQm1GB71OAaQccs3m2gKU
         vDTw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ0IbMqj8yk53354fo+Lwd19Bzrh2y08c0XGNMJEFILksDN/SwA56rh6vnlyXzv+S5zHmTWzWwuUsq5BcO@vger.kernel.org
X-Gm-Message-State: AOJu0YwljjAohyLzUn8zv0D/m5cmTYS4M1UZvInmwIBbR+TtBZo2CvjL
	3jkFAKlazNY9uyQzDBivcH/M9iESssgy3URUcVvTjhV8vVnSE+bfLnYOwS/+XZcbuhYanfqprMT
	BAFs3M5J0un16ijWxVevKGOUlttUiaetoa9M9WNDYGjz7lCupLdMbKT/8XWYobyuX
X-Gm-Gg: ASbGncvl5SqUtvOIfYVY+dovR0evtPv1Xj+X263fITjPAYfrmE29gsL8kZBeKUOtlQp
	IRDJpOd5P56KVhju1lslZMPAbpCrsrMxVqcdK44CyWbvjVhpM7nDC0hds/rR1SVQqH2ZMO09EOU
	axmzJy9ebX44dDMvmVEGSVoIOA7pi25M0Tv93sMz3OZLS1NYtK60ZHK6J/mI2the+GlMwgNpjch
	UqxI025gDThcJpi84asHa4AjXIGwXh6wpVEkI1GIEEv+OuaPAGCwxbJPCpKK2U9rKDLihe1VSfz
	0EsybEANCr1SUjvPuw/jM5B7hvG41c8B
X-Received: by 2002:a05:6a00:849:b0:725:f18a:da52 with SMTP id d2e1a72fcca58-72daf92a025mr60332172b3a.4.1737961365370;
        Sun, 26 Jan 2025 23:02:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmnfBQd58ik1bfdm6hTMz9F2AexOtE7DS7GHHU5uyQHC6Lp93kwmHY04I7t3BWGepUn3l+vg==
X-Received: by 2002:a05:6a00:849:b0:725:f18a:da52 with SMTP id d2e1a72fcca58-72daf92a025mr60332143b3a.4.1737961364900;
        Sun, 26 Jan 2025 23:02:44 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6d2e8bsm6319674b3a.78.2025.01.26.23.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 23:02:44 -0800 (PST)
Date: Mon, 27 Jan 2025 12:32:40 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@linaro.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mailbox: qcom-ipcc: Reset CLEAR_ON_RECV_RD if set
 from boot firmware
Message-ID: <Z5cvkKPF+6WXJZtM@hu-mojha-hyd.qualcomm.com>
References: <20241230075425.2534765-1-mukesh.ojha@oss.qualcomm.com>
 <20250124075646.oc6ni5gp6c23ozp7@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250124075646.oc6ni5gp6c23ozp7@thinkpad>
X-Proofpoint-GUID: V-WvL8f0HMPKikMHK8aqL6x15xpltM1A
X-Proofpoint-ORIG-GUID: V-WvL8f0HMPKikMHK8aqL6x15xpltM1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270055

On Fri, Jan 24, 2025 at 01:26:46PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Dec 30, 2024 at 01:24:25PM +0530, Mukesh Ojha wrote:
> > For some SoCs, boot firmware is using the same IPCC instance used
> > by Linux and it has kept CLEAR_ON_RECV_RD set which basically means
> > interrupt pending registers are cleared when RECV_ID is read and the
> > register automatically updates to the next pending interrupt/client
> > status based on priority.
> > 
> > Clear the CLEAR_ON_RECV_RD if it is set from the boot firmware.
> > 
> 
> Any user visible implications due to this?
>

User visible impact is the case of missing interrupt.

We are accessing IPCC_REG_RECV_ID register both from qcom_ipcc_irq_fn()
and from qcom_ipcc_pm_resume() and for some reason if
qcom_ipcc_pm_resume() run just millisecond before qcom_ipcc_irq_fn after
assertion of interrupt from the remote, qcom_ipcc_pm_resume reads the
IPCC_REG_RECV_ID and clears it and when the same register read from the
qcom_ipcc_irq_fn() it does not see the interrupt.

> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> > Change in v2:
> >  - Corrected email id in the Sob.
> > 
> >  drivers/mailbox/qcom-ipcc.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
> > index 14c7907c6632..0b17a38ea6bf 100644
> > --- a/drivers/mailbox/qcom-ipcc.c
> > +++ b/drivers/mailbox/qcom-ipcc.c
> > @@ -14,6 +14,7 @@
> >  #include <dt-bindings/mailbox/qcom-ipcc.h>
> >  
> >  /* IPCC Register offsets */
> > +#define IPCC_REG_CONFIG			0x08
> >  #define IPCC_REG_SEND_ID		0x0c
> >  #define IPCC_REG_RECV_ID		0x10
> >  #define IPCC_REG_RECV_SIGNAL_ENABLE	0x14
> > @@ -21,6 +22,7 @@
> >  #define IPCC_REG_RECV_SIGNAL_CLEAR	0x1c
> >  #define IPCC_REG_CLIENT_CLEAR		0x38
> >  
> > +#define IPCC_CLEAR_ON_RECV_RD		BIT(0)
> >  #define IPCC_SIGNAL_ID_MASK		GENMASK(15, 0)
> >  #define IPCC_CLIENT_ID_MASK		GENMASK(31, 16)
> >  
> > @@ -274,6 +276,7 @@ static int qcom_ipcc_pm_resume(struct device *dev)
> >  static int qcom_ipcc_probe(struct platform_device *pdev)
> >  {
> >  	struct qcom_ipcc *ipcc;
> > +	u32 config_value;
> >  	static int id;
> >  	char *name;
> >  	int ret;
> > @@ -288,6 +291,19 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
> >  	if (IS_ERR(ipcc->base))
> >  		return PTR_ERR(ipcc->base);
> >  
> > +	/*
> > +	 * It is possible that boot firmware is using the same IPCC instance
> > +	 * as of the HLOS and it has kept CLEAR_ON_RECV_RD set which basically
> > +	 * means Interrupt pending registers are cleared when RECV_ID is read.
> > +	 * The register automatically updates to the next pending interrupt/client
> > +	 * status based on priority.
> > +	 */
> > +	config_value = readl(ipcc->base + IPCC_REG_CONFIG);
> > +	if (config_value & IPCC_CLEAR_ON_RECV_RD) {
> 
> Can't you just clear this bit always?

We can do, but i wanted to be explicit here that something been done
from bootloader which Linux would need to clear.

I see this patch is merged in mainline.

-Mukesh
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

