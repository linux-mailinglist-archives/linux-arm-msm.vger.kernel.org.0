Return-Path: <linux-arm-msm+bounces-7424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 535A682FDE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 01:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFE2DB22F55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 00:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835898821;
	Wed, 17 Jan 2024 00:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hhk5eiks"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022AC8813;
	Wed, 17 Jan 2024 00:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705449880; cv=none; b=Rk1yAiOnrkwYj28kBonqke64cjdauAlFJcu6dfKKTrfQBRFRKpkFqNXmuqG2BbdPfMo3kYw4eiq5ZUZFzBs9p9i63Gx7DvthIaOoawIid/08EQZNdDM3DIlkyBwQhWrdjXxvR1c8aOvqT6Jobp7TbJHavTPSZd1PWrunAtUGdoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705449880; c=relaxed/simple;
	bh=oUoG7KVTagCiJE3z/rvyUKdC8ngAzBSP6ocA0mr3YGE=;
	h=Received:DKIM-Signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-QCInternal:X-Proofpoint-Virus-Version:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details; b=jr51zvmWaWXsJGd5zB3CPOHG0O6N0O7856C6hkjBHO+5nnktK5E9wJiX9Wt8lG5kOcWuv1B+IcnnEdmAyMiCSecr532jdDjTMpFIVQuj4Z62UVrqEzXEDrJnoXsqyWW/2Zgrc4XwyRGSBNjfc4CgzX//xIeentBB2Dk/mjlmkDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hhk5eiks; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40GNpwfO004069;
	Wed, 17 Jan 2024 00:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=oUoG7KVTagCiJE3z/rvyUKdC8ngAzBSP6ocA0mr3YGE=; b=Hh
	k5eiksMrkj1CSu66RFv0C3bHHsRHk1TXEx88zBvAlXkQcHNIh1XH9l0Ffj7I9WPL
	lG/Vr36GP7d/MwmIakT4cuskJwsYFj28SMRAhbA9Fugs/0n+Ffyn5r6xPpk9kdVd
	wSyEruHFmW82n9gjCnJ/ABfU4vvwyNLz0IMUb0QGXTRLzvZM4tu8x88aT2hYQN7e
	Z+N9y3kWT6UQm/od3DEaZechVvm9sJjFRLsh2xuwG/40Xd6kYnhfYQ25M3H51UaY
	97hN7vHzdeU7mw++vnXk5JF86JruUNyXz01PZgYxxAecUg9NrM79N/cn+hK8arKm
	XRPUFLsxmpdjQ0Iez+Ng==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vnnkeaa2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 00:04:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40H048Mr021623
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 00:04:08 GMT
Received: from [10.110.99.42] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 16 Jan
 2024 16:04:07 -0800
Message-ID: <a9c68fa2-57c2-4ddc-9261-acf1f58b0e38@quicinc.com>
Date: Tue, 16 Jan 2024 16:04:06 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] phy: qcom: qmp-usb: drop dual-lane handling
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>,
        "Kishon Vijay
 Abraham I" <kishon@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-phy@lists.infradead.org>
References: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
 <20240113-pmi632-typec-v1-8-de7dfd459353@linaro.org>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240113-pmi632-typec-v1-8-de7dfd459353@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GFHcz04WR6vLPyaRWl7Xa_kAkk30rIp3
X-Proofpoint-ORIG-GUID: GFHcz04WR6vLPyaRWl7Xa_kAkk30rIp3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-16_14,2024-01-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1011 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=609 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401160189

On 1/12/2024 9:42 PM, Dmitry Baryshkov wrote:
> Now as all dual-lane PHYs have been migrated to a new driver, drop
> support for dual lanes configuration. If the PHY uses two lanes for USB,
> it is symthom that it should use either a combo USB+DP or a USB-C PHY

if you re-spin: s/symthom/symptom/


