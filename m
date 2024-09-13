Return-Path: <linux-arm-msm+bounces-31665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7389F977704
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 04:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A62351C23C59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 02:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8E733F7;
	Fri, 13 Sep 2024 02:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bgHLWVJo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1152A1D2
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 02:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726195692; cv=none; b=l0RrscMKpYzel5l/Rne/jjYmQf4YlWCMY2FUQW+wrmd3AqiinmoqLE+W6JYtROZ197S6SzVC7PN9gdgT4FljHjlTU2YCuXsUpSQqRMJXDmhIaYhVBNQUk3ViqFle1Tj0FZQnRJi1XJT6M1Azrgvd/9XrKAl4QtOWyMh1AN7Lt/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726195692; c=relaxed/simple;
	bh=tU65Nz80xLZIeCHYSTCadUavy5KqfqmiiygfebBIaEE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4t68GCqWP62H8LzEoL6PaRSfzisT8xyagBORQlT5gyk5dr4RZPdb2s8uWrrvWiVrQKF05qgUvO7r3sDaRt+is+QvWKiGkCCZMchgGDU5WUMDZRdj3ulv4NgsK2luIYFRRR3HQq4IXvC9lsyk7yLKIke8YvKCRxy35R0p2UEI8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bgHLWVJo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CMB2ao019761;
	Fri, 13 Sep 2024 02:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DBvFCIiw72kAbAYPAX5lfkxF
	zbLNIj6PSAwYHyWKbx4=; b=bgHLWVJo+UAzrvsWQRBDCouFBTPpEKW9CTC4r5Cw
	PuVunaSm69CkEwQ5I0Y5G+0NtXLTzfyro1eSX9Gza7YcShwfN/MF29DHMuhafYbU
	+pyz1P/21hIacPX/sxD2KCNLM6DD7i9vrlCg6S6QUwM1EVDUlB9e56NliWAL07rZ
	nxT+hk0oqe8HaGuizxrcdbOmgWsNbL6JNip2V+NaL4Yin2aKuiGODA2hUxPTqFL7
	CT46iwlp+SxmniAdLiLKJ906/q5DPgAYF71QOlhzbPchbfNsRhMUWNvIav78LAhW
	QRbXr80uycd8FJYHupMw702JrLlLPDvjo0n2V1F1SPgoKw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5nydhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 02:47:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48D2ljDu010988
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 02:47:45 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Sep 2024 19:47:44 -0700
Date: Thu, 12 Sep 2024 19:47:43 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Doug Anderson
	<dianders@chromium.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        <ath11k@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [RFC] Qualcomm RB3 Gen2 WiFi firmware pull
Message-ID: <ZuOnz1QcNZUVYPZZ@hu-bjorande-lv.qualcomm.com>
References: <20240912092457.1887906-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240912092457.1887906-1-dmitry.baryshkov@linaro.org>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RiIktDBdNmKRT9iEukQsAYgyduvCHsPo
X-Proofpoint-ORIG-GUID: RiIktDBdNmKRT9iEukQsAYgyduvCHsPo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1011 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409130020

On Thu, Sep 12, 2024 at 12:24:57PM +0300, Dmitry Baryshkov wrote:
> Hello,
> 
> I'm planning to send the following pull request to linux-firmware, adding WiFi
> DSP firmware for the RB3 Gen2 board. However before doing that I wanted to
> check if it's fine with all affected maintainers.
> 
> Qualcomm RB3 Gen2 board resets if it's used with the existing WCN6750 firmware,
> most likely because of the differences in the TZ setup. This pull request adds
> firmware specific to the qcm6490 / qcs6490 SoC family.
> 

Given that this firmware runs on the SoC, isn't it device specific? Does
it make sense to carry this under ath11k/, when it's expected to have
the same form and distribution as the other remoteproc firmware?

> 
> @Kalle, I understand that you cannot and won't fully support this firmware set.
> As a preparation to adding these files I moved existing files to the sc7280/
> subdir and pil-squashed them.  It is a generic preference to use a single MBN
> file instead of MDT + Bnn files. The mdt_loader detects the format without
> using the extension, handles the differences internally and doesn't require any
> changes to the driver or to the DT.  Could you please ack such a change?
> 

I much prefer that we switch this to the single-file version, so I'm
onboard with this.

> 
> @Bjorn, @Konrad in the past we have pushed all WPSS / WiFi firmware to ath10k
> and ath11k even if gets executed on the host.  I should have caught this while
> reviewing DT changes.  This branch uses firmware name that isn't compatible
> with the existing DT files.  Would you insist on adding compatibility symlink
> or we'd better fix the DT files?
> 

I think we have a limited user base of sc7280-chrome-common, so we
should be able to fix up the DeviceTree, and avoid the symlink.

But I'd prefer Doug's ack on that.

> ---
> 
> The following changes since commit 4a0367b33aeaa7fe1255a920d0e39f825b6985c1:
> 
>   Merge branch 'rtl8852b' into 'main' (2024-09-11 11:00:41 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/lumag/linux-firmware rb3gen2-wpss
> 
> for you to fetch changes up to fb8c67987c89b6f33fb787dfc6ff6e5e0f317f6d:
> 
>   ath11k: add device-specific firmware for QCM6490 boards (2024-09-12 11:58:57 +0300)
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (2):
>       ath11k: move WCN6750 firmware to the device-specific subdir
>       ath11k: add device-specific firmware for QCM6490 boards
> 
>  WHENCE                                             |  18 ++++++++----------
>  ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn              | Bin 0 -> 7734064 bytes

qcm or qcs?

Regards,
Bjorn

>  ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} | Bin 5819999 -> 7463728 bytes
>  ath11k/WCN6750/hw1.0/wpss.b00                      | Bin 340 -> 0 bytes
>  ath11k/WCN6750/hw1.0/wpss.b01                      | Bin 6848 -> 0 bytes
>  ath11k/WCN6750/hw1.0/wpss.b02                      | Bin 10300 -> 0 bytes
>  ath11k/WCN6750/hw1.0/wpss.b03                      | Bin 4096 -> 0 bytes
>  ath11k/WCN6750/hw1.0/wpss.b05                      | Bin 164332 -> 0 bytes
>  ath11k/WCN6750/hw1.0/wpss.b06                      | Bin 266684 -> 0 bytes
>  ath11k/WCN6750/hw1.0/wpss.b07                      | Bin 1176368 -> 0 bytes
>  ath11k/WCN6750/hw1.0/wpss.b08                      |   0
>  ath11k/WCN6750/hw1.0/wpss.mdt                      | Bin 7188 -> 0 bytes
>  12 files changed, 8 insertions(+), 10 deletions(-)
>  create mode 100644 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
>  rename ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} (77%)
>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt

