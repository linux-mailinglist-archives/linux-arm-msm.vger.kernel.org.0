Return-Path: <linux-arm-msm+bounces-19844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFC38C587A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 17:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A83B2823D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 15:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1940317EB8A;
	Tue, 14 May 2024 15:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZLdC/41u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1EE17EB85;
	Tue, 14 May 2024 15:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715699143; cv=none; b=VkPX6W2XgPFtgfE89yaoaBxJBjgge8Gk+baAOgWEdU4yXpCwFxyrAsKFBrEQH7WXPsSlJm6SBIUT2/slhICH7kbSmVI//Rs0u5iBEKEibtcUrR11jP5TT3RgbiXplsXlC4870p9NfURAQGetdE6yiuVnruaSRL8DNCg1oTToU/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715699143; c=relaxed/simple;
	bh=5GILNYJBdvDZm0mhNtCLxf9JUSDp63tVm9azYv1NwFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oEhtM481KAErGNtzOyD1Bg/gSkHxIEM7c4t+C/K6S1BVxMZ8sFmB2XbdwRiZSbBRgd87JGg0gZ2M2B9AivW/q+eW0KZwe6YW9fjnO4CnXJynQpiqOzUIvW13pV4QT4NCSqdTCZgPjYVrTblo3daRjTSK74yDW6DhFW7+uxX0h9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZLdC/41u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44E9KfOa009163;
	Tue, 14 May 2024 15:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=CAFdmMvCUhpGGh046dh2ju6ygYsQmLFdNBeE9Jo18AA=; b=ZL
	dC/41u8ZKr0p35085q4nUF8uM3zqMxpRZiopiq0+FCsJ9FVzToFKw/5pUOa66NZn
	nPQcqs2kLB+Fj9VEXzuXHBE389PhF2AIQkqnqbuGetW6fEkshpAajXfbx/ooFK8v
	toN9TbAoJSaDhwJX/vLaJXuqt+LeuCGA9n5JnW84RZVTrN48caCRxmY1J02u7Q6b
	AwACleVkIigdgx8SsU6HSH1Tb86m0J1j6DkVsFPGb8ke1Xivdkr1JKwx7rfklYYT
	iZGoVafeuQmSyjVW4tYI5T3I+zqd71zrM+WQRXCWnNp5ZfF73eWQCd0gXjctzfIu
	aB25EotGmIkT1U+qKzfA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y21edegjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 15:05:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44EF5LTl006831
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 15:05:21 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 May
 2024 08:05:20 -0700
Message-ID: <7985e7d7-e96c-0657-7a56-973d0b802d59@quicinc.com>
Date: Tue, 14 May 2024 09:05:19 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] net: qrtr: ns: Fix module refcnt
Content-Language: en-US
To: Chris Lew <quic_clew@quicinc.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>, Luca
 Weiss <luca@z3ntu.xyz>
CC: Manivannan Sadhasivam <mani@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240513-fix-qrtr-rmmod-v1-1-312a7cd2d571@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240513-fix-qrtr-rmmod-v1-1-312a7cd2d571@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V411-oSlk7QTWY2EWHr3AVpeMohPGScK
X-Proofpoint-ORIG-GUID: V411-oSlk7QTWY2EWHr3AVpeMohPGScK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_08,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140106

On 5/13/2024 11:31 AM, Chris Lew wrote:
> The qrtr protocol core logic and the qrtr nameservice are combined into
> a single module. Neither the core logic or nameservice provide much
> functionality by themselves; combining the two into a single module also
> prevents any possible issues that may stem from client modules loading
> inbetween qrtr and the ns.
> 
> Creating a socket takes two references to the module that owns the
> socket protocol. Since the ns needs to create the control socket, this
> creates a scenario where there are always two references to the qrtr
> module. This prevents the execution of 'rmmod' for qrtr.
> 
> To resolve this, forcefully put the module refcount for the socket
> opened by the nameservice.
> 
> Fixes: a365023a76f2 ("net: qrtr: combine nameservice into main module")
> Reported-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Tested-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Chris Lew <quic_clew@quicinc.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

