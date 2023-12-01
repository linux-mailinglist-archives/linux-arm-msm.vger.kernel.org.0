Return-Path: <linux-arm-msm+bounces-2945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E132801418
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 21:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 081DA1F20EE8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 20:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73934EB4D;
	Fri,  1 Dec 2023 20:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RKmfIbLY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4DC272B
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 12:11:51 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1ENCN4022105;
	Fri, 1 Dec 2023 20:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=A8mehcLTiQERk0pvO1S9W3rOi0ADBqUuyocjxOW0XsA=;
 b=RKmfIbLYYgVssmwXmv1yB+vjqAwQQpnCN5tDM+KU/cwgWEQKFDAqvoqao+F9DVjgQGW0
 iiiBIOY3RPRktIHXsr9uIn2jAde9141jBtlUXhvdf9+tT/EtAWqNAtB63I1mv95+R/zT
 jmtjDGskZjg8KLd7aNlh9urDe0Vitp/XBPNFp05oADaqu9XOJKtBwTLmdqy3tprZ4Wdy
 s8VadD5w/uaU95IcjG51+vbrm6S/m3h10487MDgxUjpJJ44seR7EckQsYQmOvGQQ59fV
 VilNxDfhdQh+Pwx9NPIswhPvMc6BMGW4YkzgJR4L9GNsiPFaEzEbAglcEETMm3MHM2d9 8Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uprhdvna0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 20:11:44 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1KBg6w014108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 20:11:42 GMT
Received: from [10.110.3.135] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 12:11:41 -0800
Message-ID: <1a6b5c1c-5bb6-e92c-daed-3b1c081438a1@quicinc.com>
Date: Fri, 1 Dec 2023 12:11:39 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 0/2] Stabilize use of vblank_refcount
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
        <marijn.suijten@somainline.org>, <steev@kali.org>
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
 <CAA8EJprzcWTmqkUNN2r81APkv3rE039xhmaZW5=Zp7WkkQ=pHQ@mail.gmail.com>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <CAA8EJprzcWTmqkUNN2r81APkv3rE039xhmaZW5=Zp7WkkQ=pHQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PxUZ3AO1NFwGDLpGiUsxVazof199q4fw
X-Proofpoint-GUID: PxUZ3AO1NFwGDLpGiUsxVazof199q4fw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_18,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010127


On 11/30/2023 11:41 PM, Dmitry Baryshkov wrote:
> On Fri, 1 Dec 2023 at 03:41, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>> There is currently a race condition occuring when accessing
>> vblank_refcount. Therefore, vblank irq timeouts may occur.
>>
>> Avoid any vblank irq timeouts by stablizing the use of vblank_refcount.
>>
>> Changes from prior versions:
>>     v2: - Slightly changed wording of patch #2 commit message
>>     v3: - Mistakenly did not change wording of patch #2 in last version.
>>           It is done now.
> Usually sending a series once a day is enough. If you have any pending
> changes, it might be better to reply to your patch stating that you
> want to do this and that, while still allowing reviewers to respond
> (and thus you can incorporate their review in the next iteration).

Ack. Good to know.

Thank you,

Paloma

>> Paloma Arellano (2):
>>    drm/msm/dpu: Modify vblank_refcount if error in callback
>>    drm/msm/dpu: Add mutex lock in control vblank irq
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  6 ++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  6 ++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 11 +++++++++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 11 +++++++++--
>>   4 files changed, 30 insertions(+), 4 deletions(-)
>>
>> --
>> 2.41.0
>>
>

