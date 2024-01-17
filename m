Return-Path: <linux-arm-msm+bounces-7425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4910082FDEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 01:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5CF628C594
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 00:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39EDE65A;
	Wed, 17 Jan 2024 00:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f8Z1Enmb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A151563A;
	Wed, 17 Jan 2024 00:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705450102; cv=none; b=etlfKkuAarU9G4jKEuQkS2quDOfMXrRTUWZUtiDo0yELc+tgZpUppWdbcP0B0DzWD0vQ6JNJ9MCNMwOSJ09mG26PEwuCVSAHjeHVmuxfVPI1rYwMDuUmyiU8IVTC8wGLuagq2HixQZWfv2Vk3xldtfmJ5HL8PTSWV0NwTo0BRV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705450102; c=relaxed/simple;
	bh=P0JM9zR9gBSGfm9KJ5WtqW522uZzh+HNnCsqfdStnTw=;
	h=Received:DKIM-Signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:CC:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy:X-QCInternal:
	 X-Proofpoint-Virus-Version:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details; b=n9MCM5f4k+C1KPqAr0ggxIZyz4vlKWvwAM9IOqIs7y/iNPli43hz7IkAe0WUGHbrk4pFw0muxvq/FeSjol86aR5gM8XhmyoULPIy/K2oPomIVEQAXLX3bXcZFZVIhHVOyW2ki6J6DR6yPcC8WLrl0NWIAD6lCNrKlZ16u6JhzoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f8Z1Enmb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40GNfNJw019577;
	Wed, 17 Jan 2024 00:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=P0JM9zR9gBSGfm9KJ5WtqW522uZzh+HNnCsqfdStnTw=; b=f8
	Z1EnmbvDXLNmpAhKU9XIv3i3XH54l6r4BglFqrMW7k0muXPPihtshsCjobdQM5xB
	b5eSTp3u7CcQC2ChO3U6Yq8Z7ktK2x4L32mDXjkzrgQDb801IcZiQu4f/ms0mXmg
	nRDXz7QAGZmbnVrTduEf2xM2JGkdS1K52KX6VMEQGgnU9nTdM7wwIjNRqQ1mY035
	P7pVvmakl4tNj4T59P6GHvof/30EbhZTEHy/UIRJ9l+EHvmM1szoxFiKlkdk5OeY
	scqKiurkeXARURa4LCIo3uHWs0n48qQJ3qrKB8KeTUb9J5UOz/m2e9gIoFQYkRu7
	eLEgaggwdryw2tlwc6PQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vnnajja3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 00:07:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40H07hXQ025375
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 00:07:43 GMT
Received: from [10.110.99.42] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 16 Jan
 2024 16:07:42 -0800
Message-ID: <735322d5-2912-4bc3-9485-f3a254a6b53f@quicinc.com>
Date: Tue, 16 Jan 2024 16:07:41 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/15] phy: qcom: qmp-usb: drop dual-lane handling
Content-Language: en-US
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
	<p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-phy@lists.infradead.org>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-11-182d9aa0a5b3@linaro.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240113-pmi632-typec-v2-11-182d9aa0a5b3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EQCdO70MheI3guuWraSlnfLrBZO9P1ei
X-Proofpoint-ORIG-GUID: EQCdO70MheI3guuWraSlnfLrBZO9P1ei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-16_14,2024-01-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=701 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401170000

On 1/13/2024 12:55 PM, Dmitry Baryshkov wrote:
> Now as all dual-lane PHYs have been migrated to a new driver, drop
> support for dual lanes configuration. If the PHY uses two lanes for USB,
> it is symthom that it should use either a combo USB+DP or a USB-C PHY

now responding on the latest thread...
if you re-spin: s/symthom/symptom/


