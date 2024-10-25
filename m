Return-Path: <linux-arm-msm+bounces-35925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAC69B0B57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 19:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C3E51C223FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6378F216E06;
	Fri, 25 Oct 2024 17:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZLh+7S7S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B267216E0A
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876589; cv=none; b=itFxFCI3+nMkigdb2vZ1yOqyuXBa2ZSoWr+RwK7yVAQii30Z5yOpPcRYbBq31RofTL4+MEmzoJjcYQZ9ZSxdsoGAbFWtonGF/lXXjJt5YFmc2X4KslUrMsKNbck0ViQfutG3GMeIbLph8xwmie+M6k/AbARvPocT9dFy7zHAtqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876589; c=relaxed/simple;
	bh=XlzriDhs9/FJ3WEyzQvhgXQd6ewRFcgjDi7vpm6G6Ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bJSmx1mNq2MNZa/82kT2E2zrlShofEbfSM61TVKUrAePzlSmMj+8dvQLBCT3W9v6m8b3KZJjQBx+m9XDtBCtm65aSgf4ApwBTOyVH2VxbTLYXmOxoQDmR/E1PBtGdVgvwEnNsnoo1u6FzTn04PB+KWXT03ToKmbLVb2c7LU6rOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZLh+7S7S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PB6311016079;
	Fri, 25 Oct 2024 17:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U2FLjE1UPux3XHGFKh+Ja0MOzEz7nXXDCL0rMILrrYo=; b=ZLh+7S7SlWdTcN42
	7Y9DotgQrH3c8lJKjSIwES7AzH9S/oz2IVd1ZUT0TD1O/wjQZb0dQI1A/xu4gq7T
	VVzYDYHMjzoYU1odKA+jn7g65ayhB+WkSzaF3aKfyejHZYt5BUqTPHtgBMx1vrDL
	REfkY0QMCew1+VSNiIi2wGcrAASdOlvE1AWRp6JUq63fj7Z7/FhYKrINuJ4GB6LS
	uBPpk0j6tkSsGI2jzJ0V9Ptuv9eL91riYEet/3jECE0vWavmHNEGo6DAouq81nt0
	R2kYopfobzaRlyipdi2G5C9QS6dMbMSp0W0u6XCGqj67DrFbmVdlVtn+UiXqebDU
	L2QstQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ga5js5mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 17:16:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PHG8Yj022693
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 17:16:08 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 10:16:08 -0700
Message-ID: <96a21a93-3cd2-9747-499d-4bfda79840ee@quicinc.com>
Date: Fri, 25 Oct 2024 11:16:07 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] accel/qaic: Add crashdump to Sahara
Content-Language: en-US
To: <andersson@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
        <quic_carlv@quicinc.com>
CC: <ogabbay@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>
References: <20241021200355.544126-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241021200355.544126-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pec-wkN2ajjarPxwLYjRJ49zS5XDDgML
X-Proofpoint-GUID: pec-wkN2ajjarPxwLYjRJ49zS5XDDgML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=967 malwarescore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250133

On 10/21/2024 2:03 PM, Jeffrey Hugo wrote:
> The Sahara protocol has a crashdump functionality. In the hello
> exchange, the device can advertise it has a memory dump available for
> the host to collect. Instead of the device making requests of the host,
> the host requests data from the device which can be later analyzed.
> 
> Implement this functionality and utilize the devcoredump framework for
> handing the dump over to userspace.
> 
> Similar to how firmware loading in Sahara involves multiple files,
> crashdump can consist of multiple files for different parts of the dump.
> Structure these into a single buffer that userspace can parse and
> extract the original files from.
> 
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Pushed to drm-misc-next.

-Jeff

