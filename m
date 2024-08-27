Return-Path: <linux-arm-msm+bounces-29526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A5E95FE68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 03:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ECC31F216EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 01:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A677749A;
	Tue, 27 Aug 2024 01:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YsbtnWRj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8282DC2C6;
	Tue, 27 Aug 2024 01:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724722931; cv=none; b=AgSGjfQDUEKuo+1b/UqIBLMMJ1qaF6faYSXQBfCo9qGK3lVAR+d05iwcVSd1HWjkFhOjYgedekRWdII16ZT1mbO8oHFNVvJ5YNohzEWJ4GolhblVI6O/HeDt9RaDYsL/9rw80Lab0yL/HyaZWtxNYT1xtn/kEiyJX6Hk9sekkfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724722931; c=relaxed/simple;
	bh=5yCtVb+V90ga90qd/RI0+W60qP03p0k3ZcfCKx6c1FQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SatY3YO1RzhggaZwrSW3C4A1hrtE92TvDmXTC0Fw08ApK5OJCP+UKUn1WZEAF4k93T0sIbCHvn2XEsldg3w2OSB5IWbihOs4FN6x+A5v7UmGuLV0CofQdMIYnEhwczljXoXtUYOirh55eqRmlZzMP4z7dVwItg5G8KjvW9bvDlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YsbtnWRj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QJH5PP012285;
	Tue, 27 Aug 2024 01:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TCUSX7agBNvgz49pHZiPd91J
	woz/djPSQyzQjMkP8Ok=; b=YsbtnWRjTkxSY2ByLINhyED2WCSF++X5J5vK2NZu
	SWP1V0lkvSgR7lHpkfZTpMbegyMQkOzVVpx6+gwl3T3TwnMhQ656qGkYV4c6j2Qv
	rXANWIpuAU/NpBi+cpS9FdVwoCbNXQKXTQwcR+WmoKpvCv6wmzHXdgIhv7NL20kO
	20vnORCLZCwG/mnlk82O1EoYbInJ1qHo/wgsa1GHqX9EBWobDWXLR5LtEV0BPJ4p
	u3qnMct54WgOqMhfaZL8D7tFdHFXYdreprN8vC3HnZ/HkQv1ver+EUzzKWpwpYry
	glEVL6TGMqK6iFrLDZuRpuFGW2909aOFXNWNtCH1ROHWKg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 417993nabt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 01:42:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47R1g4Th005397
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 01:42:04 GMT
Received: from hu-mdtipton-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 26 Aug 2024 18:42:03 -0700
Date: Mon, 26 Aug 2024 18:42:02 -0700
From: Mike Tipton <quic_mdtipton@quicinc.com>
To: Georgi Djakov <quic_c_gdjako@quicinc.com>
CC: <andersson@kernel.org>, <quic_viveka@quicinc.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: qcom: gdsc: Add a flag to skip setting power
 collapse bits
Message-ID: <20240827014202.GA6354@hu-mdtipton-lv.qualcomm.com>
References: <20240813120015.3242787-1-quic_c_gdjako@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240813120015.3242787-1-quic_c_gdjako@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tLmPm-H1tvt8nHBAGwkktn3lBgVGqqZ-
X-Proofpoint-ORIG-GUID: tLmPm-H1tvt8nHBAGwkktn3lBgVGqqZ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_18,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0 clxscore=1011
 phishscore=0 mlxlogscore=731 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408270010

On Tue, Aug 13, 2024 at 05:00:15AM -0700, Georgi Djakov wrote:
> The sdm845 platforms have a hardware issue that requires keeping
> some of the MMNOC GDSCs in SW collapse mode (which is the power-on
> default). But if some driver tries to use these GDSCs and the mode
> is updated because of runtime pm calls, we may get a board hang.
> Introduce a flag to skip any updates to the power collapse settings
> for the impacted GDSCs to avoid unexpected board hangs.
> 
> Cc: Mike Tipton <quic_mdtipton@quicinc.com>
> Cc: Vivek Aknurwar <quic_viveka@quicinc.com>
> Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-sdm845.c | 6 +++---
>  drivers/clk/qcom/gdsc.c       | 3 +++
>  drivers/clk/qcom/gdsc.h       | 1 +
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 

Reviewed-by: Mike Tipton <quic_mdtipton@quicinc.com>

