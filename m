Return-Path: <linux-arm-msm+bounces-60862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46303AD41BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 20:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EB353A1890
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 18:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7341DE2A8;
	Tue, 10 Jun 2025 18:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bghh+Fpv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93F323C8D6
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 18:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749579110; cv=none; b=R0b3KXjsMppjPSsqQm//J1UzuaW9xbHqjqGHKdYSnFIE1NML8JcPySO4tEycE4+Q6ygGky25y682rYvD3UwDIbC477dXIqBrQ8iUh24TCUWXJVMBQB7zYIhSnGfXJEIS7Lj1sfFnOX08E5fQ61Eq2rLj7Hg2EmeD8BZjdqbrW4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749579110; c=relaxed/simple;
	bh=rHmlH02rtBQhOU5fSreB3NZ/qixbOFkAfp1S++oSn7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bRjx7FbjSRz6rxxDVdE/s6nvGrH/EDweocThnj717dAy7kOnaeLF92AwbLLEd1hTMoqa8L4JFzgtkNwnOHqG+Aa3ztk8HPnfL9Ld14KHDiX3KPtA+OoplqY06OAUidfmrb9vG3De+iWEP6/lIgNaTIS3vya/2sxibdcJzsdaptM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bghh+Fpv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AGcv5s017745;
	Tue, 10 Jun 2025 18:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1lgjBE0ZQiFtVoxRkUmb+FYR1lfzS+CPJvhvgqqpvXs=; b=bghh+FpvWRmHihdS
	QyO/S2ftCMgOeGxNOIrXgNdTQ9J0dGM4tViXeZmcin55ZranbMuoEt7mpe9jEXq4
	RsmckiLvQ2l7VhMPRQhswI0jud2nuySFQ7Zka2fZgNqGcAL7y4D1bXuuXExXVlAV
	ZBde2cR+kn3q/uLbGaI9UArkyd2fN1KvIx1W7BNTdM3WMwMhdzd7aj2/4WiKiFIq
	sbr4fcEPCOspir4R7RVwg0Tvrw0eTOIeHocECArdLFqNH6KAjMWRInXes9wWTdQi
	JZw33PWyQ3biireLKxOVW9bdrUPIjCQdhWdzFD9yYpKZGsIhNGiBmdqBCu+7NYDq
	lZwsGw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvabr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 18:11:32 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55AIBVGd029773
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 18:11:31 GMT
Received: from [10.111.163.19] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Jun
 2025 11:11:30 -0700
Message-ID: <bae922db-df0e-4eb7-996c-2defd4fffbd4@quicinc.com>
Date: Tue, 10 Jun 2025 14:11:28 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use dev_printk() in RAS
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, <quic_carlv@quicinc.com>,
        <lizhi.hou@amd.com>, <jacek.lawrynowicz@linux.intel.com>,
        <quic_yabdulra@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250610175912.2086773-1-jeff.hugo@oss.qualcomm.com>
Content-Language: en-US
From: Troy Hanson <quic_thanson@quicinc.com>
In-Reply-To: <20250610175912.2086773-1-jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KdnP_ojUA03-sNC53O8H8V_pl7sFfzlz
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=68487554 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=rOUgymgbAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=R4TYlyjI-1KM9QihRk8A:9
 a=QEXdDO2ut3YA:10 a=MP9ZtiD8KjrkvI0BhSjB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KdnP_ojUA03-sNC53O8H8V_pl7sFfzlz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE0NyBTYWx0ZWRfX+C/WWXk5RIuQ
 AtTf1xEYSgiKF3B/XoAVqUZFYg6aiVRujG/CDXq+nrqb2xB5enRS5JGYXbmEtSZrpPjZkJ4++Cw
 i2fMiFRuqFE2cVkTvPkbRqqmmB6cROjyXida3r0iyTxc2dzgUpwRmoMV2UwQKQ3AZ0g9ZgTJIhc
 n3EFEn0te7aEXIvmSFPNL1lD41ckaUED0odyNl9NQPi2SKaiBKRj08PFNM+My6a+cxq2xpN571e
 oWp/3daMGFS9zGMvlqhLagoK0zTdBtJnxwEsXQg9+yyMi61AxtHmhz/U253vE8F2wbQDbwemGmV
 ZbW+l98V/TL6n362zx+5UmaRB4rLZFKiq42BGC1J/UmBR9TW/cV7d/cvZ/i43zfVeuZBn4v6TzS
 WVIIWwWEMWgP2bR1wBTw1dCps5zsyJJiOzrVMr0oaNF3ifIgHrWUViFIym/EMvYU97E0tv8k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=778 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100147



On 6/10/25 1:59 PM, Jeff Hugo wrote:
> pci_printk() was removed with commit 1c8a0ed2043c ("PCI: Remove unused pci_printk()")
> so change to using dev_printk().
> 
> Fixes: c11a50b170e7 ("accel/qaic: Add Reliability, Accessibility, Serviceability (RAS)")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20250610124809.1e1ff0cd@canb.auug.org.au/
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>

