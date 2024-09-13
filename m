Return-Path: <linux-arm-msm+bounces-31762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED36978500
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 17:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D36391F27CED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 15:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F26253373;
	Fri, 13 Sep 2024 15:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cB0TFw2Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A99558B6
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 15:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726241874; cv=none; b=cJNpycGZDtkYOOqEKHT2ncSirw8KqvqGrpyNt1h/+E83hYp5m/p1dTuSwcYaRql3LycwcQ2t9OWxGN6GlUC78fl1JWL3/kdfTCX/JLKtOn5IRRIatVKdvkZ00SeA66mGRWkVGZtugjyBPeCQg6od2abpO/LrY7pU4cJ1DihLP58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726241874; c=relaxed/simple;
	bh=85wuC1UyDMgUXhX7aEoUXNbsEKaqAre+gXlVBz22H1E=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LT/6vJy8698T7xzlWEMCijm+XcOyhMfbj/+2PJVKWPQ8PFZvegXrAIrXdom/6fVhiX3kgY12j6Vlqx9L856fLwUMaIlqKe3mdYBw1SuGR6G5UYFmtruyfDNhMWj18ltc52e1BolMuKAR20G4soc5ewg9c5agRuhAIIpOVEkopcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cB0TFw2Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DAJvgr004962;
	Fri, 13 Sep 2024 15:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NBlo8UM2zJ9FKI4YEVATh9ao
	2MuegB3AxLqnKpMSuJ4=; b=cB0TFw2YHTHTav1s5B9esYGjY2g9/wBOQV+Gmy9a
	OakJzIlXYU9DbTNS7j0Ybk/ulz6FRBow+uTcpPKpa1AB3IXEZNyMLfo7X/8mThWm
	SUg+CEo3rfNHfIhvoqByBRTvv1O05knFGuFF/rHJCvDRTe3vSuuvcBTPZ09rTAKq
	WdO0ktOHM3RiOlz1xi8o0lryilcIu75RGOiHQwkXa7FoUFx09Yo+B/myoW1jTYbn
	f5nKEnu7VageSK11rLxIZRRZpPSduxVyF5fhXPF9abigtgAuVakAqdRAcEc0u43e
	r5xgKXWrRHXXlNtnUD+8HVdHmW9NKGUsCc2bYUKXMhDlMA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy7399qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 15:37:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DFbgWD020678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 15:37:42 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 08:37:42 -0700
Date: Fri, 13 Sep 2024 08:37:41 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kalle Valo
	<kvalo@kernel.org>,
        <ath11k@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [RFC] Qualcomm RB3 Gen2 WiFi firmware pull
Message-ID: <ZuRcRVsEI1D7Cg8h@hu-bjorande-lv.qualcomm.com>
References: <20240912092457.1887906-1-dmitry.baryshkov@linaro.org>
 <ZuOnz1QcNZUVYPZZ@hu-bjorande-lv.qualcomm.com>
 <CAA8EJprNbt1FE-rqL_R+KVyVWHzZekTwfSYnedJYrODFtS6qbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJprNbt1FE-rqL_R+KVyVWHzZekTwfSYnedJYrODFtS6qbQ@mail.gmail.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _AHHnNdIN0YwOk9TYBFfU682Qy7bfJsl
X-Proofpoint-GUID: _AHHnNdIN0YwOk9TYBFfU682Qy7bfJsl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409130109

On Fri, Sep 13, 2024 at 07:12:58AM +0300, Dmitry Baryshkov wrote:
> On Fri, 13 Sept 2024 at 05:48, Bjorn Andersson
> <quic_bjorande@quicinc.com> wrote:
> >
> > On Thu, Sep 12, 2024 at 12:24:57PM +0300, Dmitry Baryshkov wrote:
> > > Hello,
> > >
> > > I'm planning to send the following pull request to linux-firmware, adding WiFi
> > > DSP firmware for the RB3 Gen2 board. However before doing that I wanted to
> > > check if it's fine with all affected maintainers.
> > >
> > > Qualcomm RB3 Gen2 board resets if it's used with the existing WCN6750 firmware,
> > > most likely because of the differences in the TZ setup. This pull request adds
> > > firmware specific to the qcm6490 / qcs6490 SoC family.
> > >
> >
> > Given that this firmware runs on the SoC, isn't it device specific? Does
> > it make sense to carry this under ath11k/, when it's expected to have
> > the same form and distribution as the other remoteproc firmware?
> 
> This is an interesting question. I think that having all WiFi-related
> firmware under athNk makes sense. For example wlanmdsp.mbn files are
> also stored under ath10k/WCN3990/ subdirs.
> So do q6 and m3 firmware files under ath11k/IPQ*/.
> 

I was under the impression that wlanmdsp.mbn (as being run in a
protection domain) had lower security/signature requirements than the
wpss.mbn.

If wpss.mbn is not vendor-signed (in a real product...) then I have no
concerns with keeping it under ath11k/

> >
> > >
> > > @Kalle, I understand that you cannot and won't fully support this firmware set.
> > > As a preparation to adding these files I moved existing files to the sc7280/
> > > subdir and pil-squashed them.  It is a generic preference to use a single MBN
> > > file instead of MDT + Bnn files. The mdt_loader detects the format without
> > > using the extension, handles the differences internally and doesn't require any
> > > changes to the driver or to the DT.  Could you please ack such a change?
> > >
> >
> > I much prefer that we switch this to the single-file version, so I'm
> > onboard with this.
> >
> > >
> > > @Bjorn, @Konrad in the past we have pushed all WPSS / WiFi firmware to ath10k
> > > and ath11k even if gets executed on the host.  I should have caught this while
> > > reviewing DT changes.  This branch uses firmware name that isn't compatible
> > > with the existing DT files.  Would you insist on adding compatibility symlink
> > > or we'd better fix the DT files?
> > >
> >
> > I think we have a limited user base of sc7280-chrome-common, so we
> > should be able to fix up the DeviceTree, and avoid the symlink.
> 
> I think we should keep the ath11k/WCN6750/hw1.0/wpss.mdt symlink,
> that's fine. I was talking about adding the qcom/qcm6490/wpss.mbn ->
> ath11k/WCN6750/hw1.0/wpss.mbn and the same for qcs6490 (just for the
> sake of existing DT files) or it's fine to fix the DT files instead
> and omit the symlink.
> 

Perhaps I'm mistaken, but does WiFi work on those boards today? I'm
inclined to just have us fix up the DT and avoid sprinkling the symlinks
all over the place.


I guess this shows that I need to start holding back on future
firmware-name entries until the linux-firmware structure is known.

> >
> > But I'd prefer Doug's ack on that.
> >
> > > ---
> > >
> > > The following changes since commit 4a0367b33aeaa7fe1255a920d0e39f825b6985c1:
> > >
> > >   Merge branch 'rtl8852b' into 'main' (2024-09-11 11:00:41 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.com/lumag/linux-firmware rb3gen2-wpss
> > >
> > > for you to fetch changes up to fb8c67987c89b6f33fb787dfc6ff6e5e0f317f6d:
> > >
> > >   ath11k: add device-specific firmware for QCM6490 boards (2024-09-12 11:58:57 +0300)
> > >
> > > ----------------------------------------------------------------
> > > Dmitry Baryshkov (2):
> > >       ath11k: move WCN6750 firmware to the device-specific subdir
> > >       ath11k: add device-specific firmware for QCM6490 boards
> > >
> > >  WHENCE                                             |  18 ++++++++----------
> > >  ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn              | Bin 0 -> 7734064 bytes
> >
> > qcm or qcs?
> 
> qcm6490 as the main location, qcs6490 is symlinked via WHENCE file.
> 

Ok!

Regards,
Bjorn

> >
> > Regards,
> > Bjorn
> >
> > >  ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} | Bin 5819999 -> 7463728 bytes
> > >  ath11k/WCN6750/hw1.0/wpss.b00                      | Bin 340 -> 0 bytes
> > >  ath11k/WCN6750/hw1.0/wpss.b01                      | Bin 6848 -> 0 bytes
> > >  ath11k/WCN6750/hw1.0/wpss.b02                      | Bin 10300 -> 0 bytes
> > >  ath11k/WCN6750/hw1.0/wpss.b03                      | Bin 4096 -> 0 bytes
> > >  ath11k/WCN6750/hw1.0/wpss.b05                      | Bin 164332 -> 0 bytes
> > >  ath11k/WCN6750/hw1.0/wpss.b06                      | Bin 266684 -> 0 bytes
> > >  ath11k/WCN6750/hw1.0/wpss.b07                      | Bin 1176368 -> 0 bytes
> > >  ath11k/WCN6750/hw1.0/wpss.b08                      |   0
> > >  ath11k/WCN6750/hw1.0/wpss.mdt                      | Bin 7188 -> 0 bytes
> > >  12 files changed, 8 insertions(+), 10 deletions(-)
> > >  create mode 100644 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
> > >  rename ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} (77%)
> > >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
> > >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
> > >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
> > >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
> > >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
> > >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
> > >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
> > >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
> > >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt
> 
> 
> 
> -- 
> With best wishes
> Dmitry
> 

