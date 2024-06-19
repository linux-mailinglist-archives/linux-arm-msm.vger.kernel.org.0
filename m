Return-Path: <linux-arm-msm+bounces-23184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DCC90E3ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 09:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F41951F24F25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 07:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C78B6F319;
	Wed, 19 Jun 2024 07:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RFgQwP03"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05026139;
	Wed, 19 Jun 2024 07:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718780476; cv=none; b=lPESrFCjHUyPYGy4JdcXITOldiQ6ZpYR8MDTIl27R7JmAd+rb40ua4UuylmjmFDA5Q8a68+YkGV1PI2Em7mBGxcEWA0c93IzSyD7d0s0xcMD0vpu5qC9SpDtSLO4y0kjo9p/1pIeEwOQTaA2jNS1Nw6lKyuEB0LaXR0+GRhPjo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718780476; c=relaxed/simple;
	bh=iwhtk3Ys4PDGkUU8JsKoJ12UY9H0KDkClg3X0gGe3Nk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rpVqGbKTw+TlQVJ7k26wTZIQELCZ+CEf6f7xQJNPTuEeDOjcIoJW26XizpqY0RMDYJWmk6ryrtvHi74BUHEiwAKcQbud8kd9KNCkicqdIkqwmwifr4dHqX6qhCjn7IL0saTlzPctS3HwitwOEBCx3SfQEH36n0KElSvySrSOMYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RFgQwP03; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILa5LD009248;
	Wed, 19 Jun 2024 07:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eSalXEMy4rk4VZQPH/LqjOYsYOBmGLTfbihZNli+65M=; b=RFgQwP03finQ3tEY
	Z8gS7ciq9WhipFKSi5//kx5vCbcAw6O4JoL5ORXgDWpo9c2XpVGSOHcfktGXDW3z
	e2OGNbKYyuQvCi0LMmGtpIbO3nnuUw8kmzye/98suKgqUuSwBS21BCwhhcDTW33q
	RiEMJkXbiVp0LIPerdJKe+csjurJ/gQxit5McqAxTsSxS4m5DtgMa92I9/dePBD2
	BjuSPIKvocmnmKioZE6ZtCnmo6SoNo/mGVwrMuM1uSShPfZMOlWKR1bAW2w41Pai
	Iyc2JFIUCioGnI3RSFDBhcEO7JCbZVhk3ocXnczPnAtEO13rHekZuNZb3SSY37jZ
	bpSwnw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9tgwpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 07:01:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45J714eu010884
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 07:01:04 GMT
Received: from [10.206.107.125] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 00:01:01 -0700
Message-ID: <9fc370be-89f4-4006-a4c0-1040dadfe4cd@quicinc.com>
Date: Wed, 19 Jun 2024 12:30:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Oded Gabbay <ogabbay@kernel.org>, <srinivas.kandagatla@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>
References: <20240612064731.25651-1-quic_ekangupt@quicinc.com>
 <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>
 <00b2c65e-c00e-48bf-b118-4785d216cd19@quicinc.com>
 <CAA8EJprOf9vvdBcdX=Xem3UMFo2pmh37ooreqRX0Bzvadv_yTQ@mail.gmail.com>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <CAA8EJprOf9vvdBcdX=Xem3UMFo2pmh37ooreqRX0Bzvadv_yTQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hAN3G2GGXDa6xAo1OUNr57cjkTHWAKXA
X-Proofpoint-ORIG-GUID: hAN3G2GGXDa6xAo1OUNr57cjkTHWAKXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406190050



On 6/19/2024 12:21 PM, Dmitry Baryshkov wrote:
> On Wed, 19 Jun 2024 at 09:45, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>>
>>
>> On 6/12/2024 11:58 PM, Dmitry Baryshkov wrote:
>>> On Wed, Jun 12, 2024 at 12:17:28PM +0530, Ekansh Gupta wrote:
>>>> Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
>>>> to be added for PD notifications and other missing features. Adding
>>>> and maintaining new files from within fastrpc directory would be easy.
>>>>
>>>> Example of feature that is being planned to be introduced in a new C
>>>> file:
>>>> https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
>>>>
>>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>> ---
>>>>  MAINTAINERS                          |  2 +-
>>>>  drivers/misc/Kconfig                 | 13 +------------
>>>>  drivers/misc/Makefile                |  2 +-
>>>>  drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
>>>>  drivers/misc/fastrpc/Makefile        |  2 ++
>>>>  drivers/misc/{ => fastrpc}/fastrpc.c |  0
>>>>  6 files changed, 21 insertions(+), 14 deletions(-)
>>>>  create mode 100644 drivers/misc/fastrpc/Kconfig
>>>>  create mode 100644 drivers/misc/fastrpc/Makefile
>>>>  rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)
>>> Please consider whether it makes sense to move to drivers/accel instead
>>> (and possibly writing a better Kconfig entry, specifying that the driver
>>> is to be used to offload execution to the DSP).
>> Planning to keep the driver to misc/ only as part of this patch. Moving to accel/ might
>> introduce some conventions to be followed which might require significant changes
>> in driver.
> To me this sounds like "we are trying to avoid following the
> conventions by hiding in the shadows".
Not trying to avoid, just trying to look into this separately as the need to take ABI also in account which
includes current device nodes and the uapi header which is present in uapi/misc/fastrpc.h whereas I see all
accel driver uapi headers are part of uapi/drm/.

Will be taking inputs from fastrpc maintainers also.
>> I'll write more meaningful Kconfig entry in next spin.
>>


