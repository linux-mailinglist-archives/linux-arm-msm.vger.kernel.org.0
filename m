Return-Path: <linux-arm-msm+bounces-27903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1568F947804
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 11:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4D6CB24BC4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 09:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74BA15382C;
	Mon,  5 Aug 2024 09:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HFBnp/wr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CD5149DF0;
	Mon,  5 Aug 2024 09:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722849090; cv=none; b=pI6GLNHfT2v91l/oqFSohG1q8Qvl8Cd9oQIk1cKnF/iNTBAuWV1O7T99cujPaTXAMuZs/Z/xdbC7BaZU6gC7ed2U3AemmMdJRKgQL32VXyH6oUFtHMsFygB/N0XN6mXdrXYIZplTd0UKekl1xvmMQqomQrkD8vYZMAdowA9bqeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722849090; c=relaxed/simple;
	bh=i5zIOm7S89BrZm3aW8t/P05emF53tX4XWiN++XwdZT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=InX6Ip1TUvAmHxnTqjE5HPiM9n8VBvFDMIH2cwd0G/3TN4cWFqS0YiR1BSQALKilfgEvlgKAv64WYGtlsyHs0b5WBV5fL+qkIEVnr5and2JiKm1ZwnMHVsrRWayopSrlert2Fp4ViNJK/cQX/wIVTj8itTPbKUi7+pKm9Vbv72w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HFBnp/wr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4752VdkF021461;
	Mon, 5 Aug 2024 09:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qjtu41wYbJCXZ106LK7UBdo9ClnXQPbNMkOHM4EbM+8=; b=HFBnp/wrLDHRjwXA
	X+znW/MywrCe3BPjxAm/5QP5S3Jgq/ZVSxjyr0bLr1/+0oxZDEquUgg8UPzb9ckn
	70vc2IxEkHYv/IL4iH88P3VQ1QDvR0k9cEmXVFNGtYq58JrlW4c+VjbeFzYHhsG5
	Bsdu6XRWiKpWRXB5W+lOGdcCk49bu1UpCcFl30kuBEXtiFudFSnPfkSNp0EiOmYy
	wPUG1qPuog8z6MMcsUre3J3JxIKU7TdwPoa27RO1GrXijDIiRBaxpjdUTq0xihvz
	Mk6bM+OKO50rooTD6RiTBXYCjkANzC9FXMwuCqRSqWn6elMDAS01tZ3GLyMzEciA
	5EmC1A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40scmtudfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Aug 2024 09:11:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4759BNhY011605
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Aug 2024 09:11:23 GMT
Received: from [10.216.33.72] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 Aug 2024
 02:11:20 -0700
Message-ID: <3cca4d67-e420-442d-bb38-4eb0649dcdf4@quicinc.com>
Date: Mon, 5 Aug 2024 14:41:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq9574: Update the alpha PLL type for GPLLs
To: Stephen Boyd <sboyd@kernel.org>, <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <mturquette@baylibre.com>
CC: <quic_devipriy@quicinc.com>
References: <20240801110040.505860-1-quic_amansing@quicinc.com>
 <ff92343652a998b97981e63ea5dc301f.sboyd@kernel.org>
Content-Language: en-US
From: Amandeep Singh <quic_amansing@quicinc.com>
In-Reply-To: <ff92343652a998b97981e63ea5dc301f.sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IwwXAv1qCZwf_LX9lwZ2Ys0l47Jk1pIs
X-Proofpoint-GUID: IwwXAv1qCZwf_LX9lwZ2Ys0l47Jk1pIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-04_14,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408050065

On 8/3/2024 6:35 AM, Stephen Boyd wrote:
> Quoting Amandeep Singh (2024-08-01 04:00:40)
>> From: devi priya <quic_devipriy@quicinc.com>
>>
>> Update PLL offsets to DEFAULT_EVO to configure MDIO to 800MHz.
> 
> Is this fixing a problem? I can't figure out how urgent this patch is
> from the one sentence commit text.

The incorrect clock frequency leads to an incorrect MDIO clock. This,
in turn, affects the MDIO hardware configurations as the divider is 
calculated from the MDIO clock frequency. If the clock frequency is
not as expected, the MDIO register fails due to the generation of an 
incorrect MDIO frequency.

This issue is critical as it results in incorrect MDIO configurations 
and ultimately leads to the MDIO function not working. This results in
a complete feature failure affecting all Ethernet PHYs. Specifically,
Ethernet will not work on IPQ9574 due to this issue.

Currently, the clock frequency is set to CLK_ALPHA_PLL_TYPE_DEFAULT. 
However, this setting does not yield the expected clock frequency. To 
rectify this, we need to change this to CLK_ALPHA_PLL_TYPE_DEFAULT_EVO.

This modification ensures that the clock frequency aligns with our 
expectations, thereby resolving the MDIO register failure and ensuring 
the proper functioning of the Ethernet on IPQ9574.

