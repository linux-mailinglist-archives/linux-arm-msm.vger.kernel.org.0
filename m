Return-Path: <linux-arm-msm+bounces-23157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7721D90E043
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 01:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 895941C21182
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 23:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDD31741DB;
	Tue, 18 Jun 2024 23:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bpZc6O3I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6865313A24F;
	Tue, 18 Jun 2024 23:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718755042; cv=none; b=HZPaNvv1q3bHq2Ur2B1HBd/5px1MrUGEElqsFmqQ98KNQ5sNzemWbjZWxMkBItWwfUTevTNvn+J1geHqEa94tntrjt/dDIC2iHFbFk8G5hI/KGAU2mVfHs4+UqEldrPBYrkKpCmpAhEvHEISqu/o7rLgTYJxrLK5UAMRJXH3IIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718755042; c=relaxed/simple;
	bh=/pmCh5yLIAf/vwfTYhPMuxD/Hb6HWKunmzmcBCasqlg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kW8+rtdEEZgt56kt7TFsmuWmWXulHyibU0CsIPsPuqS6sGeQcE1Qfy5DYWUMNAYlehV2xpHFBDq/92wWnvtDGZg1ShW69OSGYWT+Spc7Tf6IcQVZOCaZkpDRXvB7mjKWzkhwR7dnth9QcHtgKLgpj9Ds++fU+9CiunpO4tUG49s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bpZc6O3I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILag0H010904;
	Tue, 18 Jun 2024 23:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IG8pAosJ7qiq4++NVfvRsXywC9BXttLJ6yJ0IqalFrQ=; b=bpZc6O3IVfOJw4vP
	BzwZSmt2YWlcILN0dyzD2nMdBafeZ3ZAcVxoK7wO33dW1c33boRozd/KU12q58Yv
	8U5pNrbA3icARpSQiC+oXczQXurjjd90rsszTxpQ1VHitBkoM1yVCMUkw9/1do5w
	h84ZGcBa9HD2QONJWzcZNubSZHddppJCheqZCVKKXvdZm9Qz8qFwemSQRzaAeCp1
	ShOVca7RDenfto2a1Fq5WXsjtfCjTB09dFrFdP/4TZ7SDeZnx+ztzcauSKFpIHOc
	zOhetp1+NPOmN75Fwr5RU3uJDwztoJjmhqMkEGpBHFvvwJrCve7Bd/FzZY6Xgtu2
	d2vMXQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja2g73f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 23:57:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45INvFm1029915
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 23:57:15 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Jun 2024 16:57:15 -0700
Date: Tue, 18 Jun 2024 16:57:14 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Deepak Kumar Singh <quic_deesin@quicinc.com>
CC: Caleb Connolly <caleb.connolly@linaro.org>, <andersson@kernel.org>,
        <quic_clew@quicinc.com>, <mathieu.poirier@linaro.org>,
        <linux-kernel@vger.kernel.org>, <quic_sarannya@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH V1] rpmsg: glink: Make glink smem interrupt wakeup capable
Message-ID: <ZnIe2hjPgWipDfgG@hu-bjorande-lv.qualcomm.com>
References: <20240603073648.3475123-1-quic_deesin@quicinc.com>
 <8d10fbbb-471e-4960-a52a-1658df9fbc0c@linaro.org>
 <275417c5-223a-436b-8405-ba3571e19ced@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <275417c5-223a-436b-8405-ba3571e19ced@quicinc.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: td6KUawCW9F-GzR6B-ldhM5WDud6YD4r
X-Proofpoint-ORIG-GUID: td6KUawCW9F-GzR6B-ldhM5WDud6YD4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_06,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=966
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406180175

On Thu, Jun 13, 2024 at 04:05:17PM +0530, Deepak Kumar Singh wrote:
> 
> 
> On 6/3/2024 3:07 PM, Caleb Connolly wrote:
> > Hi Deepak,
> > 
> > On 03/06/2024 09:36, Deepak Kumar Singh wrote:
> > > There are certain usecases which require glink interrupt to be
> > > wakeup capable. For example if handset is in sleep state and
> > > usb charger is plugged in, dsp wakes up and sends glink interrupt
> > > to host for glink pmic channel communication. Glink is suppose to
> > > wakeup host processor completely for further glink data handling.
> > > IRQF_NO_SUSPEND does not gurantee complete wakeup, system may again
> > > enter sleep after interrupt handling and glink data may not be
> > > handled by pmic client driver.
> > > 
> > > To ensure data handling by client configure glink smem device as
> > > wakeup source and attach glink interrupt as wakeup irq. Remove
> > > IRQF_NO_SUSPEND flag as it is no longer required.
> > 
> > I'm not sure I agree with this approach, glink is used for lots of
> > things -- like QRTR, where the sensor DSP and modem may also need to
> > wake the system up (e.g. for "wake on pickup" on mobile, or for incoming
> > calls/sms).
> > 
> > Configuring this to always wake up the system fully will result in a lot
> > of spurious wakeups for arbitrary modem notifications (e.g. signal
> > strength changes) if userspace hasn't properly configured these
> > (something ModemManager currently lacks support for).
> 
> In internal testing at least we don't see such issues, may be downstream
> modem manager is configuring things properly.

As we discussed during the introduction of 1a561c521ba9 ("soc: qcom:
smp2p: Add wakeup capability to SMP2P IRQ"), we don't want a laptop-like
device to wake up in someones backpack and overheat.

If there are gaps in upstream ModemManager it would be desirable to see
those closed, but it seems likely that we have other services doing
similar things?

> Also with devices having
> proper auto suspend feature this change may not be affecting power numbers
> significantly.

There are many types of products where you don't have auto suspend.

> 
> Additionally my understanding is by definition glink interrupt should be
> wakeup capable. May be Bjorn can comment more on this.
> 

That sounds correct, but it was made under the assumption that the apps
software does auto suspend.

Regards,
Bjorn

> Thanks,
> Deepak
> > 
> > IRQF_NO_SUSPEND is presumably necessary to keep the DSPs happy? iirc
> > downstream Qualcomm kernels have historically taken this approach to
> > avoid spurious wakeups.
> > 
> > I proposed an alternative approach some time back that would allow the
> > wakeup to be configured on a per-channel basis.
> > 
> > https://lore.kernel.org/linux-arm-msm/20230117142414.983946-1-caleb.connolly@linaro.org/
> > 
> > Back then Bjorn proposed using some socket specific mechanism to handle
> > this for QRTR, but given this is now a common issue for multiple glink
> > channels, maybe it's something we could revisit.
> > 
> > Requiring the wakeup be enabled by userspace clearly doesn't make sense
> > for your proposed usecase, perhaps there's a way to configure this on a
> > per-channel basis in-kernel (maybe as the rpmsg API?).
> > 
> > Thanks and regards,
> > > 
> > > Signed-off-by: Deepak Kumar Singh <quic_deesin@quicinc.com>
> > > ---
> > >   drivers/rpmsg/qcom_glink_smem.c | 8 ++++++--
> > >   1 file changed, 6 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/rpmsg/qcom_glink_smem.c
> > > b/drivers/rpmsg/qcom_glink_smem.c
> > > index 7a982c60a8dd..f1b553efab13 100644
> > > --- a/drivers/rpmsg/qcom_glink_smem.c
> > > +++ b/drivers/rpmsg/qcom_glink_smem.c
> > > @@ -22,6 +22,7 @@
> > >   #include <linux/regmap.h>
> > >   #include <linux/workqueue.h>
> > >   #include <linux/list.h>
> > > +#include <linux/pm_wakeirq.h>
> > >   #include <linux/rpmsg/qcom_glink.h>
> > > @@ -306,8 +307,7 @@ struct qcom_glink_smem
> > > *qcom_glink_smem_register(struct device *parent,
> > >       smem->irq = of_irq_get(smem->dev.of_node, 0);
> > >       ret = devm_request_irq(&smem->dev, smem->irq, qcom_glink_smem_intr,
> > > -                   IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
> > > -                   "glink-smem", smem);
> > > +                   IRQF_NO_AUTOEN, "glink-smem", smem);
> > >       if (ret) {
> > >           dev_err(&smem->dev, "failed to request IRQ\n");
> > >           goto err_put_dev;
> > > @@ -346,6 +346,8 @@ struct qcom_glink_smem
> > > *qcom_glink_smem_register(struct device *parent,
> > >       smem->glink = glink;
> > > +    device_init_wakeup(dev, true);
> > > +    dev_pm_set_wake_irq(dev, smem->irq);
> > >       enable_irq(smem->irq);
> > >       return smem;
> > > @@ -365,6 +367,8 @@ void qcom_glink_smem_unregister(struct
> > > qcom_glink_smem *smem)
> > >       struct qcom_glink *glink = smem->glink;
> > >       disable_irq(smem->irq);
> > > +    dev_pm_clear_wake_irq(&smem->dev);
> > > +    device_init_wakeup(&smem->dev, false);
> > >       qcom_glink_native_remove(glink);
> > 

