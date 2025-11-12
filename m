Return-Path: <linux-arm-msm+bounces-81399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D03A0C5202D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 12:36:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85F353AEAB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23BC30F7EA;
	Wed, 12 Nov 2025 11:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gu4k97dS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196A730DD0C;
	Wed, 12 Nov 2025 11:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946968; cv=none; b=u/j1CX/j4gSaEAazU12zzdkxwF5CRzGgbLgA4D+AR+FKyZlKN5vZ8YU75J/xN4qK4zRjXOGfEqy1ZJ2OyqyTSnqF0evl3Rxiq552IB4dWNDJXCA5GfRexgMTW7UwqoclHlgfZPaivnOD3UM17KpsACmD7EjVTtZp5sU3giJxIeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946968; c=relaxed/simple;
	bh=6o7lJdSmPYz3CSs464Iw4AQ9hN14Oy7ACMwHI0Ol1Qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CyS62W6k+K+LjQ2SZIeLPaEFJdHwgpJAUVilUjnsEE302JOa2cLQ3QmUml8j5AWpUf8lTMDywoF2KF+QzeBTDAv6i+EaeJeDOH37OP3fFPtOUkCh7UZDXMGn09p8RvbX/1SRg5thNWLTZZWzL413OeKOUNxYrM9phoDdDo1Zo4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gu4k97dS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9fUQ2721987;
	Wed, 12 Nov 2025 11:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYcNZaT5ZeY0Dk+c0VhKXnCB5fbAqUDNS+tyU5vX0dg=; b=Gu4k97dSkyKUkw8C
	tAOTREkI8702/zA+pP4CuCkkg/GVGgooyh6xZFI6Uvf1pbr4VPiVhvqkaRpU4fqH
	r8t6tEyc09fBLKGY5zdZNnxKp6TZ/F27U5bPe0XtX/6cLyBeesxecaX62a4EjbtS
	98pTSW+PbsZOWDm9rkBl+XGnpMT6XJ7MEElFi02wGeYx6pL6w1XcqtLWSLneZ/HU
	F7+spvufb1JHtTh+trLIxkbz61JyOdwgCKNIkPn/beeOYPbQVDzwuQRu0khZox6+
	xkYsPiODoiWDqr70y0LRH3HgWgVkSSCkKKIiYzdu34sz6QjCWOPmFPfLtVRJUxjQ
	z3SzuA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqu1rbbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 11:29:22 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5ACBTMqu028488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 11:29:22 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 12 Nov
 2025 03:29:19 -0800
Message-ID: <093749fb-5eee-4a1c-a29e-8232e0c9dd6d@quicinc.com>
Date: Wed, 12 Nov 2025 19:29:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>,
        Marcel Holtmann <marcel@holtmann.org>,
        "Luiz Augusto von
 Dentz" <luiz.dentz@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-bluetooth@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_chejiang@quicinc.com>,
        <quic_jiaymao@quicinc.com>, <quic_chezhou@quicinc.com>
References: <20251112074638.1592864-1-quic_shuaz@quicinc.com>
 <0df692e3-7e39-4a7e-916a-c385015a2821@oss.qualcomm.com>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <0df692e3-7e39-4a7e-916a-c385015a2821@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2e6eSQpIqRN2AslMGH3jwWIuBKfpZmaS
X-Authority-Analysis: v=2.4 cv=Hpl72kTS c=1 sm=1 tr=0 ts=69146f92 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=VCngsZfJQ2ioK8oHzuEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 2e6eSQpIqRN2AslMGH3jwWIuBKfpZmaS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA5MiBTYWx0ZWRfX8vygm7JlRZWS
 rdiJr1a4rTtaF+PVI0H7ao4gOldELXw9raVmNdk0usl0bAkovGZB7PNDcybu9PEqPj5/PDDeRqa
 Svden6tdFBSEJMCiijmLHLysAq3oWhwBdvBQtVis6R0xeJlqBw7uRYbATxXan3dx3aFzeHtVfb5
 ZuhusG/f5Z646y2cfxW0v/NxnvPo/fPygo1tuc5Otn3QHUzOMuaG4bPLVtLZcEJbu15HGC1C5R+
 xXY01mVv3Mm+fMs9DpI9HPPoQJqDtyRV5E3jlcXoKtegB281Z7wp4oQptVgPHdZCVRtjLyQdVua
 d5sNa/0rUQ7fUrORCkNiUyr12U/75MNxc5psD5o0z95hTcEgKfIExTbh+braCe7+dYPnCUAefnG
 /vGO7g39E7c0Mc5ArW6fOB7d4Bms0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120092

Hi Konrad

Thank you for your review.
On 11/12/2025 5:53 PM, Konrad Dybcio wrote:
> On 11/12/25 8:46 AM, Shuai Zhang wrote:
>> For WCN6855: download wcnhpbtfwxx.tlv and wcnhpnvxx.xxx;
>> if they do not exist, download hpbtfwxx.tlv and hpnvxx.xxx instead.
>>
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
> 
> Would these files be fundamentally any different, or is it a workaround
> for someone else being creative with filenames?
> 

The prefix “wcn” corresponds to the WCN685x chip, while entries without
the “wcn” prefix correspond to the QCA2066 chip. There are some feature
differences between the two. 

However, due to historical reasons, the WCN685x chip has been using firmware
without the “wcn” prefix. We are now correcting the mapping between the chip
and its corresponding firmware.

If it is necessary to add a comment to explain this, I will submit a new patch.

> Konrad

Best,regard
Shuai

