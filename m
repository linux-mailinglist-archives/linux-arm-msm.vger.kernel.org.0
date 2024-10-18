Return-Path: <linux-arm-msm+bounces-35061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A41E9A498E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 00:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A07021F22453
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 22:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76891183CC9;
	Fri, 18 Oct 2024 22:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YMB18N2+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B0E14900E
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 22:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729289775; cv=none; b=SlBc+c4hEhPMa4hYyKlXPuRilxEv43hC3SfSMFfT8apEt6aDTBLdOARjPfyDJbaXD8bvnERSJQsNF+tZCDFErjmfRAIOVwwR5IBE/hcoqj8V6+n7erOl6Cyt4v2JLg60BRgMGM/+qeWacUXSLwc2bM5J+pr20Udk9eU7++P0MOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729289775; c=relaxed/simple;
	bh=Je6l5faIpf/wlrxrG3fkC+tsNzWkf6D1N8N1VBpJwXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MPJZAwWE1aHLWlv43tg7nW2d6A0gLFyb7zhkq0943cxEGQqgFbkCK+9bg5QaSE7Zg6Mng17IcTp5VmM8QBDTvWkXCRyOYFjGbZXB6XEle2uBCMqvUba6jGjFzanJjw/+lYNvmODmpPInDYlLGddJloPEB0z8gJwOisQfi3TkfSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YMB18N2+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ILK3ph005910;
	Fri, 18 Oct 2024 22:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNL0jqFWdQOGnm6VIGRZjM8Ug5MDoKzZo6g/fJk6yEQ=; b=YMB18N2+Qh3akVQs
	Pp5WLxcVAPQcjtzfFgoSbhvv9iU4+20pnAESvRGfaVHOyDEbC2aWTBu+0dMhQ8m+
	K3FGAAzUa9daU1AyV6KkSTvnvlwnI8GauLfaK9cTYRaYw2uYbbIU5LCOj7ZNnEY3
	PofTrhvV5+sUPXtfcktX8NilIgYrhs4iooxap13wbA9zo6CKyw9CDNT3OAq9v1JL
	TCUIvlElbBw8A4hSBTbKWjMrT3ydi7xMJycXYwuIyxfumvJB7WzTpiZOhzjxUlQU
	WPjRGrQxZgVue6NU1yIE7RquB+vagGN4cgBIVRsZz56AjRSfd1HS0n/VbLeYcFad
	t6YTPw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b8rr3v8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 22:16:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IMG3S0007991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 22:16:03 GMT
Received: from [10.48.241.209] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 15:16:03 -0700
Message-ID: <379780f5-bf30-4452-aa9e-f1b6915b6389@quicinc.com>
Date: Fri, 18 Oct 2024 15:16:02 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PULL] ath11k: move WCN6750 firmware to the device-specific
 subdir
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalle Valo
	<kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <linux-firmware@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>
References: <20241011061606.1612918-1-dmitry.baryshkov@linaro.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241011061606.1612918-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h04S1F-VDBdhS1TE6Z5Md8fSu7Jd0fL3
X-Proofpoint-ORIG-GUID: h04S1F-VDBdhS1TE6Z5Md8fSu7Jd0fL3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=661 clxscore=1015
 mlxscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180142

On 10/10/2024 11:16 PM, Dmitry Baryshkov wrote:
> The firmware under ath11k/WCN6750 can not be utilized on other devices using
> WCN6750 to provide WiFi (e.g. on the Qualcomm RB3 gen2 board).  This is an
> attempt to propose a solution by moving the file into device-specifig subdir.
> Other platforms can place firmware files in other subdirs, depending on the
> SoC.
> 
> Note, while performing the move I also propose squashing the firmware file.
> This is the practice recommended by the msm platform maintainers for the DSP
> firmware (not to mention that it also saves us from the extra symlinks). If
> Kalle, ath11k maintainer, objects, I will keep the firmware in the split form.
> 
> For now this is an RFC in order to gather opinion form respective platform and
> driver maintainers.
> 
> ----------------------------------------------------------------
> 
> The following changes since commit d55315295cccf8ce5dc288a74d75cf09b8063cfc:
> 
>   Merge branch 'superm1/qci-patches' into 'main' (2024-10-10 19:11:13 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/lumag/linux-firmware wcn6750-device-specific
> 
> for you to fetch changes up to abe8c109a2b4c422b627335d124473734c8790d8:
> 
>   ath11k: move WCN6750 firmware to the device-specific subdir (2024-10-10 22:26:20 +0300)
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (1):
>       ath11k: move WCN6750 firmware to the device-specific subdir
> 
>  WHENCE                                             |  12 ++----------
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
>  11 files changed, 2 insertions(+), 10 deletions(-)
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

I'm waiting for Kalle to respond, but at a minimum I suspect our internal
firmware tooling would be impacted by this change.

Kalle, do you have concerns or suggestions on how to handle this issue?

/jeff

