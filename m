Return-Path: <linux-arm-msm+bounces-26540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C78F934969
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 09:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCD571C2143A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 07:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D001977103;
	Thu, 18 Jul 2024 07:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xa1VXlx4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B89B757FC;
	Thu, 18 Jul 2024 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721289339; cv=none; b=YkEuaoCRQOGbBtxEHVtaC7z4YDMWie0/DckAm1IRfmyfGObeZ+aKL68FJfH8yucm36EThf5OYunozNFHuL0hshoNw3wu5A/kHDD0cuxP4SKiVzTifOCmvW7vnowPhQe3mMPVR6k4hW5gZ4gAT2AqMaHZzg30GFC2ncPPbRWtyFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721289339; c=relaxed/simple;
	bh=Q5oioVh3UZy7ot9pf9yHQZatcUKbqZQrtqRkxDheJFc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwBpdtmXNBIjxt/W+cJ60OGlkgNHloxGYrtqaMRLuNSR4xB5YTXtfhCJA4EUaq/rcp369h/VAHBGRYEhvTQGqyittiyyVacULj1IqenRVADupGvZL4KwGd1ueUHXhRqDCmSfhjh0bPv/4z4Hx3xNe+gIrCNxOc5Z8nlYprMPfzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xa1VXlx4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I5QnrS013065;
	Thu, 18 Jul 2024 07:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dB8zWxmD1jj9Mwtei8TWJs/C
	2KOsAwy3fQTBBO86sco=; b=Xa1VXlx4hzzOvMP5LSU5Tw/Om+2FB2YOn88FvNMv
	euLOX5cDokKY7q8FZHptyyAV4yyQI/+4Ya5NidlDr2Yz8BjH+bA2Xo813A0VHp24
	d4PaTHxFvkx/bAOeVSqlG89FfAP2Nx84aYVz54QB3r57YtKTPRTUxgc8xV5ovSWj
	GtBWPfms1Dh6i6a1xPD+y5B0anMEv8F8lgL2ATOGWMN4VV+KBmFVH4wKehDxnAlI
	/yv2F109J6tYdF/ZHKNqLQdKmWecexBb0LvPDWje2K7tXX3JI6coXM1wITzMGEk8
	R/w4yLDoFo1Va35xFrfHbenRJGbpmi4OMKXN0J9f8nO7YA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfwcp63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 07:55:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46I7tMue009464
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 07:55:22 GMT
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 18 Jul 2024 00:55:17 -0700
Date: Thu, 18 Jul 2024 13:25:14 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Caleb Connolly <caleb.connolly@linaro.org>
CC: Pavan Kondeti <quic_pkondeti@quicinc.com>,
        Maulik Shah
	<quic_mkshah@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>, <stephan@gerhold.net>,
        <swboyd@chromium.org>, <dianders@chromium.org>, <robdclark@gmail.com>,
        <nikita@trvn.ru>, <quic_eberman@quicinc.com>, <quic_lsrao@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>,
        <stable@vger.kernel.org>
Subject: Re: [PATCH v2] soc: qcom: cmd-db: Map shared memory as WC, not WB
Message-ID: <de7930b1-6f33-4ff5-911d-e5156a020585@quicinc.com>
References: <20240718-cmd_db_uncached-v2-1-f6cf53164c90@quicinc.com>
 <a49113a2-d7f8-4b77-81c7-22855809cee8@quicinc.com>
 <1c5b3f7f-95b6-4efb-aa16-11571b87c6c6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1c5b3f7f-95b6-4efb-aa16-11571b87c6c6@linaro.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qRmAnbxXpacTW9p5MtOB18hnM55rH-Wx
X-Proofpoint-ORIG-GUID: qRmAnbxXpacTW9p5MtOB18hnM55rH-Wx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_04,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxscore=0 mlxlogscore=766 impostorscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407180052

On Thu, Jul 18, 2024 at 09:42:27AM +0200, Caleb Connolly wrote:
> Hi Pavan,
> 
> > 
> > Thanks Maulik for sharing the patch. It works as expected. Feel free to
> > use
> 
> Can I ask how you're testing this?
> 
> Kind regards,
> > 
> > Tested-by: Pavankumar Kondeti <quic_pkondeti@quicinc.com>
> > 
> 

The QCM6490 RB3 board boots from upstream kernel. As part of releases
here [1] we plan to support booting Linux in EL2. Currently, I have an
internal board/build with firmware allowing this already. I have boot tested
Maulik's patch (and as well v1 patch). The targets gets reset early in
the boot up w/o this patch and I could boot w/ this patch.

Thanks,
Pavan

[1] https://github.com/quic-yocto/qcom-manifest

