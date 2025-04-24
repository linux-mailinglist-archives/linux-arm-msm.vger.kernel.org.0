Return-Path: <linux-arm-msm+bounces-55465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3116A9B422
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 18:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C53A54C2592
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2716828B4F1;
	Thu, 24 Apr 2025 16:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AK750G2N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6B1284670;
	Thu, 24 Apr 2025 16:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745512342; cv=none; b=WWtPdUyzJhF9BtQGwp86b/6B1621hEilI3FyNocvMrgAhHsYgWCTtsTRamKmxKj0Gy45IuhvuSvjuSR+JmJeICg8tmVzXX7XbPmPU6LAq1ZkS1RijDvw6AGnW/D0/i2jESV9S0xXhZ3ASGf6xJH+SPqyDKnHBQPlYF8uCREqFhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745512342; c=relaxed/simple;
	bh=wPeL1vGFY5IWE3+oaeSPLzinkDr/dTg07KqCG46tJQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cXc1EjHvzS5cKVZarew05nVXWo0exwQabQm1z7SOZMMXhShaUVbEZgDJ318x/sqRJ+/Q1XteazwEeox0KFBN5T7ALr3Bhm1WTjVPHCP/8yeMdps9Wj3S7raig+VIK76IC41wsU5O+e1bdRuNO5SVXZ2xWHtZy7A8bZtMDqdGbic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AK750G2N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OC3gUG017703;
	Thu, 24 Apr 2025 16:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwTC1fVt+YSHOpVKiEz3YJ3Wb+QFfPzZMI+15IrngMA=; b=AK750G2NVD1rifAO
	xP1Cs2lV2yb8jhuhPpARdJR8LCcxiyq/WhJ03FFMB9KNSsBnMd1ebWX5k8/DN9xA
	kdBqPkmMZNnlk8YPT5GgdKGlxBNGx1rirRcft5by2QVsD41779mLWLB34rGr5kPD
	cT1aPvIwg6pl7eUlCm31y5FbnTGLZAp22Jiise7YMJlsnFuAvtEXvfkJyiKjVrvS
	HDfQCMU+P9SR17FkQhutUNtv7NqYOZBrMKn2btTQp+Di0llTBabYKFeU75A8fEAK
	Ujn6DmugJOzP/nDg8UtfgLepNncAnGbeBho8UiRIxBVUjpiihShDwcRGAFMAGQp4
	wunaGw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh26bjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 16:32:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OGW9qO009059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 16:32:09 GMT
Received: from [10.110.125.18] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 09:32:08 -0700
Message-ID: <37df3ce3-2161-4c42-a658-d36fc4208ee8@quicinc.com>
Date: Thu, 24 Apr 2025 09:32:07 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] coresight: Add coresight TGU driver
To: Songwei Chai <quic_songchai@quicinc.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, James Clark
	<james.clark@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250423101054.954066-1-quic_songchai@quicinc.com>
 <20250423101054.954066-3-quic_songchai@quicinc.com>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20250423101054.954066-3-quic_songchai@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680a678a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=YS0KeBGhMWwNwvnsnWcA:9 a=QEXdDO2ut3YA:10
 a=AMdsP11zolQA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dZGMBpIijIK4QXnUq6ZzHrYOevnpaL8a
X-Proofpoint-ORIG-GUID: dZGMBpIijIK4QXnUq6ZzHrYOevnpaL8a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDExMyBTYWx0ZWRfX4zUtTjqz+Al5 BQy8fRU1XgcGDZ/Si7XPxYClnJ06DWxxYfM32Sfg3/MpzahV64fbIlW8GovTA6HqADaKPszZPOG YVCXeU32Jw4Rxck5q2CknmAb277ZC5U15KLiy8COTbxG0VnjmRaF9gERNa34CAYEkjmsTi+loc8
 502NOBZlcMYsIIu+cgnpbljsrF/zC57hCPjZ84Sgou/oq70PbBh8Nr2jQyBrBCQse1B4fzLBb03 CtaWvT0wGZ+58xY7p/D6R8tlv9baoKuXHveT7dwCgqfAK8tzMeCw9v6NMoaLREx7z6E0BOMygMk fs63QKHjrKQP0K3TLFnqwAeciic1X7sjMiKimc/vRR0YNxzLp6UPDz4HVQwo1+UWpZ8xpH2A+Rr
 3pBnX3J5QMunFndXLlrtcSwY/fMpfLVm32jS8LAimek1l/3R7VOc0YbM4QKGd42ewOQGe0lN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_07,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1011 spamscore=0 mlxlogscore=916
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240113

On 4/23/2025 3:10 AM, Songwei Chai wrote:
> +Date:		February 2025

If you are sending new revision then please update month and kernel version. 

> +KernelVersion	6.15
> +Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>


-- 
---Trilok Soni

