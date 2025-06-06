Return-Path: <linux-arm-msm+bounces-60457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB8EACFF29
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 11:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E653C179111
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 09:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A7D2857DE;
	Fri,  6 Jun 2025 09:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U17dn4Mm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FD51A5BA9;
	Fri,  6 Jun 2025 09:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749201640; cv=none; b=pvJi8oLozza+yMV7Clxuqn6sjAVkbdgSeamXTwnRsFFeYyWxIVpo4iO0E1bS/CLV0XkzBncSnmZP2YSwGjRJfm6Xji2cg0APz2YSFd/9NSM0u1fOcBnFsQWt0prpA2LQVcCtBjdZRJa22tBTKeMTh05exVd+NJbNvUFZex+HLxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749201640; c=relaxed/simple;
	bh=wVvLyYI42aB8DAaYfnAR+c6mL5q1F8ek7omGo2KrAg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lib9p81OakO+702LeriCl2FHy4+tQwUihdkHWqULOrPjJkvlJbleMkovicn4Bca9BNKkNfrMoBsQ3blcVIgT8UzRm9yJvSMf9q+tZFHG1sFBW33ZFNb9oc6oHIeCYh214d24BGqKelWm/HN1IomPBAhKRf7YDrvydA1pZLv543c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U17dn4Mm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55669mgL000728;
	Fri, 6 Jun 2025 09:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wZKkFxeR9biJ3qLe8Wip6JzHw1tYhHdIe+aASwdpvtQ=; b=U17dn4MmdiycKMoj
	J1g+msWQn4Lc6wjyi1mkLUXk7QTU/+zwkUi6RjMmqhhSB3O4oa5ikdRRbySN0+d0
	BsAfm+B0Uu+y1NOLqX4OAMpK4nlDhgS2ksBPmM4HBEbRweGkl7e0cYjdxoT0dZWk
	xKb6+aQ8vvitq5UqEtc77+yhpyu48TAMqvI6f92cHNYu0Fo76ywxN2MpB/r57NMp
	Kir76a+dLgB8Z3mMw5vbpEwsZiRIbVUdX92jmdLSUF59OMRhFSD7+MgVSp6IY1AG
	FixOFN1H+YwLi3f2q7VkSFV72qOpmdteAJIZtuf7pn5OJqwZwncHS7nwN2bzsE0e
	a8wiOw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8qc55q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 09:20:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5569KRZ2022386
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 09:20:27 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Jun 2025
 02:20:24 -0700
Message-ID: <b786f35a-c11b-45e8-877e-aa1996c09d3a@quicinc.com>
Date: Fri, 6 Jun 2025 17:20:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Leo Yan <leo.yan@arm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com>
 <20250522-trace-noc-v6-2-f5a9bcae90ee@quicinc.com>
 <3a19197d-b534-458c-b4d7-51fd9d2c954d@arm.com>
 <40599afc-4342-467c-87d8-3f53cbcfd242@quicinc.com>
 <20250523085655.GD2566836@e132581.arm.com>
 <4d54e620-abb9-4a36-bab0-3970c7e30a5f@arm.com>
 <62d1e4cb-cc13-4333-a160-66a280dca5f6@quicinc.com>
 <17abf8b5-8a2e-4573-a870-e2f98ad866a6@arm.com>
 <20250530125944.GB666854@e132581.arm.com>
 <eb7dbabf-d878-468b-9945-36d8b14a4e65@quicinc.com>
 <20250603122504.GA8020@e132581.arm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20250603122504.GA8020@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UPbfCBk6CXMg_VGL4jSKNUTCTN79b49d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA4NCBTYWx0ZWRfX87+2zbeT/xkf
 QGyAq9hfg4P9sHZzAafRP55SjvYpjSkiIgt5qMEt3WYSI7ARJ9pcHqYxJU6dvu0XlVaM+H0fiTa
 y+Swd2xtjPTRL4aZKcpj+/uIHgVY3Q9vPp2Lh9SHcxE/SHYJxNlGcwdwQmIWvkASU5d2+DfYG8J
 w0AFVN4jdzR2fFeF09cFCd/K7ncvGQiAM7aeiEFzYPTgvhkVk0vXyzyZhpdin90Nv2gSMoapIQn
 IK1h7emQp9UEE8sqgJwD+3T0lFhRuteDMSwbHv5hgtBeydS8DEOHWpAGgxLLhNryUqtHKQYBII0
 frmveaArDpWqQnJz90R99MJvXknwZBoI89sck+mEm6SlZ40M64oRG7P8vcU1T66QnfY5Nd0lU6s
 9HR3N4jl6/Qe0com2iEa9G/TYUnuZXd9ivBuhrHNZGShwZ2S3WPpxqot7sGetkU9yQ2Znvoa
X-Proofpoint-ORIG-GUID: UPbfCBk6CXMg_VGL4jSKNUTCTN79b49d
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=6842b2dc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=paDOMdAM0I4rMZW7xhQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=565 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060084



On 6/3/2025 8:25 PM, Leo Yan wrote:
> On Tue, Jun 03, 2025 at 11:22:58AM +0800, Yuanfang Zhang wrote:
> 
> [...]
> 
>> Using both dynamic and self-contained IDs within the same system can result in ID conflicts, which may cause decoding failures.
> 
> If so, please follow up Suzuki's suggestion to expose Sysfs interface
> in TNOC device node.
> 
> Leo

Done in patch V8.


