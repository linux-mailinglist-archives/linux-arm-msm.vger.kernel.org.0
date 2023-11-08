Return-Path: <linux-arm-msm+bounces-206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E20F7E5CEA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 19:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E5461C20941
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 18:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A3A10A0E;
	Wed,  8 Nov 2023 18:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eIzoqse1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1111732C87
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Nov 2023 18:10:45 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CF61FEB;
	Wed,  8 Nov 2023 10:10:45 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A8E15Y8005641;
	Wed, 8 Nov 2023 18:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2dDaqrLyD6bgBMl0XHyCu6Dr2G0wgU+OOOC2HymfpiQ=;
 b=eIzoqse1eFYoOEi+9rIM1h3RevrobYkdQCJBXrF9Cx9QXtyVI01+Zjbg10r3di43HBIu
 GG0bnnqJmZHJe87u9LEb+oZI40gfvGG4f/gylyEP98bxX2dW0UOG48SS5CGf9FRUwcFE
 y0XP84rLYEuQUve1Idh+2tHp/wpAlHxc8T06MoQE7NbbWE8EuxtdMULUf/fp6ThIWY9F
 l56y/mqtkDCoL/aqbPAfZ8ukXnLuHTmwNkMLm0OnavGsm5BTQAxdzUZnYn4kwWWZ8CWM
 bD5AoGy8MXb4kRGK4Zbj73aJXUCzVEjiq1go4cWQaT35XdLNVv0vAOOA7rqLeqH9v8je UQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u7w7rag6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Nov 2023 18:10:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A8IAXpF023228
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Nov 2023 18:10:33 GMT
Received: from [10.71.110.181] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 8 Nov
 2023 10:10:32 -0800
Message-ID: <b708df07-6812-df43-1313-cf6f1289fd47@quicinc.com>
Date: Wed, 8 Nov 2023 10:10:32 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 0/7] incorporate pm runtime framework and eDP clean up
Content-Language: en-US
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
 <55a4f98e-2772-e4fd-ae8a-132f92582c78@quicinc.com>
 <CAA8EJpo9CFf-Z3eiuKPvwf-y6eGkSibro-q-=SBxKK_L-zFOBA@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpo9CFf-Z3eiuKPvwf-y6eGkSibro-q-=SBxKK_L-zFOBA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Am_BIKSb7zh0kfSKvK4xO3IHTv373wpf
X-Proofpoint-ORIG-GUID: Am_BIKSb7zh0kfSKvK4xO3IHTv373wpf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-08_07,2023-11-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=625 priorityscore=1501 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311080149


On 11/7/2023 1:23 PM, Dmitry Baryshkov wrote:
> On Tue, 7 Nov 2023 at 23:01, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>
>> On 11/6/2023 5:55 PM, Dmitry Baryshkov wrote:
>>> On Sat, 7 Oct 2023 at 01:55, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>>> The purpose of this patch series is to incorporate pm runtime framework
>>>> into MSM eDP/DP driver so that eDP panel can be detected by DRM eDP panel
>>>> driver during system probe time. During incorporating procedure, original
>>>> customized pm realted fucntions, such as dp_pm_prepare(), dp_pm_suspend(),
>>>> dp_pm_resume() and dp_pm_prepare(), are removed and replaced with functions
>>>> provided by pm runtiem framework such as pm_runtime_force_suspend() and
>>>> pm_runtime_force_resume(). In addition, both eDP aux-bus and irq handler
>>>> are bound at system probe time too.
>>> With this patchset in place I can crash the board using the following
>>> sequence (SM8350-HDK):
>>>
>>> - plug the USBC DP dongle
>>> - run modetest at any mode, don't press Enter yet
>>> - unplug the dongle
>>> - press Enter to stop modetest
>>>
>>> => the board resets to Sahara.
>>>
>>> Please ping me if you need any additional information from my side.
>> questiosn,
>>
>> 1) which dongle are you used?
> I have used several Dell and Hama USB-C dongles.
>
>> 2) what code branch shoud I used to duplicate this problem.
> I have pushed my kernel tree to
> git.codelinaro.org/dmitry.baryshkov/linux.git, branch test-dp-rpm
> I had several UCSI patches on top, but they should not be relevant.
git.codelinaro.org/dmitry.baryshkov/linux.git, branch test-dp-rpm <== I 
synced out his branch and it is still work at my chromebook Kodiak DUT.
>
>> I can not duplicate  system crash problem at my setup kodiak (SM7325)
>> chrome book with my PM runtime patch series.
>>
>> my code base is Linux 6.6-rc2 + pm runtime patch series (7 patches)
>>
>> I did:
>>
>> 1) plugin either apple dongle (DP-to-HDMI) + 1080p display or DP typeC
>> cable directly to 1080p display
>>
>> 2)  stop ui
>>
>> 3) /usr/bin/modetest -M msm -s 34:1920x1080 (see test pattern show at
>> display)
>>
>> 4) unplug apple dongle or DP typeC cable
>>
>> 5) hit enter key
>>
>> 6) start ui
>>
>> 7) display back to login page of chrome book
>>
>>
>

