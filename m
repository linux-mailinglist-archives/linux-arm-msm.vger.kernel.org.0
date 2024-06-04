Return-Path: <linux-arm-msm+bounces-21683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7E18FBF96
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 01:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED2461C224C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 23:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582C414D433;
	Tue,  4 Jun 2024 23:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Sh07SUgr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0EC14D296;
	Tue,  4 Jun 2024 23:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717542494; cv=none; b=k8GK46ydBfrOAIVUX0ru1Snzc7I7bPauhu9hD76ttXcpd6+0inmMEZMvYPjGI5iPFaQYM94uIpuwZOjgydruie2jeM1FZjOpCWIj6crarD8M0ZT7hlTBRmFX164Y2OP/Bffq/JvfveVfvkAouNz1sE9VevQ8FiG/Xw62pSOq91U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717542494; c=relaxed/simple;
	bh=Rlz96sMG/kOG1NkbypRbXtCzD5LzoBOpjZ03kKZSVZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KfGeFqo3+Yz9EaHrekejVAQmjSbOCQTwhvlUZiuA2oofWkM5CgNRqxewQ2WvlebdDfBrCOLFZb3sYfjpQXNsdbD5v/8/XbDwlXrviCTKzGmnb9Xx3muaxiAz+9NykxnUYsCn4W/ScBBbO/FDXt69QVLUJ0hUehFViXM96XQhpl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Sh07SUgr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 454HSp4U006214;
	Tue, 4 Jun 2024 23:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rlz96sMG/kOG1NkbypRbXtCzD5LzoBOpjZ03kKZSVZU=; b=Sh07SUgrhjImHfdH
	8SF5gPwkwFVEDWC9F2gQeDqxysGKGJPr/2jsqi4pVZDjYbDd0CTK6X9gFRCGoBmk
	OitrJsxIZIleOjunqKg+LtJMVf4L9jeXQ0r/F2sMtEl7xyaZ8x/sd4Msj7Xe7irj
	+FFCrxMEBlLFeMJOS9cPWWwuD7t8C+12N/pbjSOksp+JjD1Q5a7PSQ+nk7ljVedB
	NnZNPRntRdACwGyvkyIu1VyTtmcCDKJJ/QvEi2jYkD+9TBiyY7mJElBrnvchVHSL
	CeWB663RCxYRf/TckWRXkkvkR05Weo4p17EEf+VRjVPCubqYjl8cXY+a3vmtWVpO
	VG9wqg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj7brrmjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 23:07:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 454N7lP2012541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 23:07:47 GMT
Received: from [10.48.241.109] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 16:07:46 -0700
Message-ID: <ed29f097-eb5d-4133-a3f0-4fb0e8933cb8@quicinc.com>
Date: Tue, 4 Jun 2024 16:07:45 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 32/38] ASoC: qcom: qdsp6: Add headphone jack for
 offload connection status
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
        <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240524001043.10141-1-quic_wcheng@quicinc.com>
 <20240524001043.10141-33-quic_wcheng@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240524001043.10141-33-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pZc8JSSJvyCdzyxMTEuTXq3F2dtNbF2a
X-Proofpoint-GUID: pZc8JSSJvyCdzyxMTEuTXq3F2dtNbF2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=847 clxscore=1011 phishscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406040187

On 5/23/2024 5:10 PM, Wesley Cheng wrote:
[...]
> +EXPORT_SYMBOL_GPL(qcom_snd_usb_offload_jack_remove);
> +MODULE_LICENSE("GPL");

please add missing MODULE_DESCRIPTION()



