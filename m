Return-Path: <linux-arm-msm+bounces-109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FAE7E4A3D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 22:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DF4728118D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 21:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167313C09C;
	Tue,  7 Nov 2023 21:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pMzkDX/k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25443C062
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 21:02:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1EE510C6;
	Tue,  7 Nov 2023 13:01:20 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A7GfXVT026997;
	Tue, 7 Nov 2023 21:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7ZwM7r3QrT26WkewixkRvzlkvg33eyhy6lV/EJbSppw=;
 b=pMzkDX/kOsTWxo9K4EoSOBUAzo4ZzJj8Bl7zzLHYz+g/7SqKgtrwx0ER7ilsFq6JbVSS
 ZOI14UftbHZlMCbC3HEmQLdzqWra0XF02iYyz6+EXRWSWSZpIlfDLJUgKb3PNsNdXHfl
 bOFJzzcEGinFbR7MAwodO1KOBS34686x+xLysr9ogXe5LXoZF3u1QYKKSPimH2hRStWo
 OIxvftN2BUKNFSb2Fq1EQNPooDRBSAAUFsvdEZIjkBfsf3ilLeLiOqAPIUy2O3GFmInw
 mJz6FZ7f6ZkvusX9n1iBYfLQBGFgUNmg6cJJWGTTy9ZJqd4njN8qyw9vECUFhPB7RlmA 0w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u74v337y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 21:01:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A7L13jX016096
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Nov 2023 21:01:03 GMT
Received: from [10.110.83.137] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 7 Nov
 2023 13:01:01 -0800
Message-ID: <55a4f98e-2772-e4fd-ae8a-132f92582c78@quicinc.com>
Date: Tue, 7 Nov 2023 13:00:24 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 0/7] incorporate pm runtime framework and eDP clean up
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <marijn.suijten@somainline.org>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpoFRp+7GyO=F3Ar21tfG5Yt0cL6zkAquqg7D1XXQjp50Q@mail.gmail.com>
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpoFRp+7GyO=F3Ar21tfG5Yt0cL6zkAquqg7D1XXQjp50Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u0myOGG0V7VbiTtSM4TzrOb_sXsIbdRh
X-Proofpoint-ORIG-GUID: u0myOGG0V7VbiTtSM4TzrOb_sXsIbdRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-07_12,2023-11-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=627
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2311070174


On 11/6/2023 5:55 PM, Dmitry Baryshkov wrote:
> On Sat, 7 Oct 2023 at 01:55, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>> The purpose of this patch series is to incorporate pm runtime framework
>> into MSM eDP/DP driver so that eDP panel can be detected by DRM eDP panel
>> driver during system probe time. During incorporating procedure, original
>> customized pm realted fucntions, such as dp_pm_prepare(), dp_pm_suspend(),
>> dp_pm_resume() and dp_pm_prepare(), are removed and replaced with functions
>> provided by pm runtiem framework such as pm_runtime_force_suspend() and
>> pm_runtime_force_resume(). In addition, both eDP aux-bus and irq handler
>> are bound at system probe time too.
>
> With this patchset in place I can crash the board using the following
> sequence (SM8350-HDK):
>
> - plug the USBC DP dongle
> - run modetest at any mode, don't press Enter yet
> - unplug the dongle
> - press Enter to stop modetest
>
> => the board resets to Sahara.
>
> Please ping me if you need any additional information from my side.

questiosn,

1) which dongle are you used?

2) what code branch shoud I used to duplicate this problem.

I can not duplicate  system crash problem at my setup kodiak (SM7325) 
chrome book with my PM runtime patch series.

my code base is Linux 6.6-rc2 + pm runtime patch series (7 patches)

I did:

1) plugin either apple dongle (DP-to-HDMI) + 1080p display or DP typeC 
cable directly to 1080p display

2)  stop ui

3) /usr/bin/modetest -M msm -s 34:1920x1080 (see test pattern show at 
display)

4) unplug apple dongle or DP typeC cable

5) hit enter key

6) start ui

7) display back to login page of chrome book



