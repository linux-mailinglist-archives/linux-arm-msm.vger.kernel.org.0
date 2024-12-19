Return-Path: <linux-arm-msm+bounces-42735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 331289F748E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 07:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 316BB7A2A4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 06:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C87C14A0AA;
	Thu, 19 Dec 2024 06:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DfAmBqMy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B1B78F4C;
	Thu, 19 Dec 2024 06:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734589001; cv=none; b=li2LNy3r/A6EvbPtLH+mGz0SSzDH+pfZH6RytwDN2oZoTxb/nqBC2sLO+CVcsZGeSprpbhd35mRFuxt/fWTi2F3H2pDjwwOYhxrDe0rBuveAqU0VvjPwLzNl+vzn17RhZg95IYpSAQ9xmjP3RCQZwM9dAUATxYFKgWhE+2xIbgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734589001; c=relaxed/simple;
	bh=ZhyGHaF/gQbFKaN1aLpdkZlPhA+1u0F82ScEbJPOsnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ix3FnpCd8/jaDp/ZelvE2He4r1exd8JcGSAFIZ5oq4iDPyvX7OWcC10o+reLmiZmhyrPZ5C2VJ0tTgfqEbzCN6PdTs12csU1cwlAEmRneTIBKDUza1UmNjeNK9l9LZKXU5bTqZK/VPk+2g68ERalXPhgdSUapU/FNR14bM6saZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DfAmBqMy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ3SbD3001919;
	Thu, 19 Dec 2024 06:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kK5Opena1xVSZM83wubWjcYiRKdnsQja371XurM3dtI=; b=DfAmBqMyIlxherqM
	ejZ5c8WjXdZexHfuBxcSNhvaJcfrzdyAIfUDxr3HrDo+kXt+R34G0U45TDxc5crO
	HzyhVzBR8c+BecbiAJceD52YM9IglVyusz2WMjqgIGtFuN+FVugHBfmeBA0WbDYH
	AnGAyS8e+73OZTsJ+P5rJby3K53zA4jIW5yPFJdgiFYoKSS39BRxvZApswnrv4OW
	Il+R7vCTlJzITs77noSRchwWkRlJ3namHyfGHGlpkyQaZW7jVYdWDuwCeCKsgJFV
	+CbnOe8CZlKDUGIEQOl99XdV1yWQ4zF687gmN9ZNOmPuOoqv/vCevx881LzR3VTn
	G46rcg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mbm60aas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 06:16:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ6GJdE011628
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 06:16:19 GMT
Received: from [10.218.43.20] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 22:16:16 -0800
Message-ID: <69503b23-12da-4270-9910-9440dba7df07@quicinc.com>
Date: Thu, 19 Dec 2024 11:46:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] scsi: ufs: qcom: Enable UFS Shared ICE Feature
To: Bart Van Assche <bvanassche@acm.org>, <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Naveen Kumar Goud Arepalli
	<quic_narepall@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
References: <20241218151118.18683-1-quic_rdwivedi@quicinc.com>
 <ac08d417-87b3-4ddd-ae68-8e8e9a68e04a@acm.org>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <ac08d417-87b3-4ddd-ae68-8e8e9a68e04a@acm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TDYoq5GPD3F6jVpqzeZGrpMBCSRr-e42
X-Proofpoint-GUID: TDYoq5GPD3F6jVpqzeZGrpMBCSRr-e42
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190048



On 18-Dec-24 10:49 PM, Bart Van Assche wrote:
> On 12/18/24 7:11 AM, Ram Kumar Dwivedi wrote:
>> +static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
>> +{
>> +    struct ufs_hba *hba = host->hba;
>> +    uint8_t val[4] = { NUM_RX_R1W0, NUM_TX_R0W1, NUM_RX_R1W1, NUM_TX_R1W1 };
> 
> This array can be declared 'static const', isn't it?

Hi Bart,
As this value is not modified in this function, we will declare it as const in next patchset
> 
>> +    u32 config;
>> +
>> +    if (!is_ice_config_supported(host))
>> +        return;
>> +
>> +    config = val[0] | (val[1] << 8) | (val[2] << 16) | (val[3] << 24);
> 
> Isn't this is an open-coded version of get_unaligned_le32()?
sure will make the suggested change in next patchset

Thanks,
Ram.

> 
> Thanks,
> 
> Bart.


