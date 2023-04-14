Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0A66E2759
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Apr 2023 17:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbjDNPts (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Apr 2023 11:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbjDNPtl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Apr 2023 11:49:41 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38866B775;
        Fri, 14 Apr 2023 08:49:20 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33EFaGkm026799;
        Fri, 14 Apr 2023 15:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eV+8MZDuXiIKzGSEQKZCDKTMq3JK9EG9jZYw22hxMKA=;
 b=hp/bj73VTbHNmgwWQ8gn28A7fFjCEZ88tx4vM2DzctjywscXPWmGDd7SFu1LGxDyqW6L
 3HvYsuEqKGbY6/QIzjhdIErFXF4CoDKV4hRAb72c2eAx89C4PawJgHV7cZ64jvPQp6yg
 C1nptY5U4xQZcFu8wrYC8VoSD8VWj32rLIB3/cXuiD9lyoPwcQizfS/+Zuq4n2N/Ayl2
 J2YLRhu6bSTw6R1VZ6Des6tgiqX5uk0FCMINkfPf6f3LOM1j3WLOiuccWbd4qwBmQyhK
 +wl6zHn1xGGlxTJZv6i9rbZWSt1f9x+FXANlfjn6r5nsaAeHNVZ7D/13C//zUw+o11bs Tw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pxdtekm2x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Apr 2023 15:48:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33EFmj08023194
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Apr 2023 15:48:45 GMT
Received: from [10.110.73.215] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 14 Apr
 2023 08:48:44 -0700
Message-ID: <049697ba-d997-62c0-6e21-ffb287ac3100@quicinc.com>
Date:   Fri, 14 Apr 2023 08:48:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: always program dsc active bits
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
CC:     Kuogee Hsieh <quic_khsieh@quicinc.com>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <andersson@kernel.org>, <quic_sbillaka@quicinc.com>,
        <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1681247095-1201-1-git-send-email-quic_khsieh@quicinc.com>
 <z7wj2lcgcdxsqh7ylhec3ig6o4p6q37zqvpzoxp4bd4vid2z2n@ubsgt3ebqrwr>
 <83f9a438-52c5-83f3-1767-92d16518d8f0@quicinc.com>
 <feedv4isliterjtwyicqfarwuvzhtov3jkmvjcwqvt7itkyh7y@e2jq5t6r3lxc>
 <e78e576a-2a04-e7ca-f6c4-701d508541ad@quicinc.com>
 <mfzi535qsjtcznwdvgb7qyzk25rcsrkwozah6ji4thqsj73n3m@asybxllomisg>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <mfzi535qsjtcznwdvgb7qyzk25rcsrkwozah6ji4thqsj73n3m@asybxllomisg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kftFes2vevQaZo5fUhQal7v15W_k_Nbg
X-Proofpoint-GUID: kftFes2vevQaZo5fUhQal7v15W_k_Nbg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_08,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=957 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304140138
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/14/2023 12:35 AM, Marijn Suijten wrote:
> On 2023-04-12 10:33:15, Abhinav Kumar wrote:
> [..]
>>> What happens if a device boots without DSC panel connected?  Will
>>> CTL_DSC_FLUSH be zero and not (unnecessarily, I assume) flush any of the
>>> DSC blocks?  Or could this flush uninitialized state to the block?
>>>
>>
>> If we bootup without DSC panel connected, the kernel's cfg->dsc will be
>> 0 and default register value of CTL_DSC_FLUSH will be 0 so it wont flush
>> any DSC blocks.
> 
> Ack, that makes sense.  However, if I connect a DSC panel, then
> disconnect it (now the register should be non-zero, but cfg->dsc will be
> zero), and then replug a non-DSC panel multiple times, it'll get flushed
> every time because we never clear CTL_DSC_FLUSH after that?
> 

If we remove it after kernel starts, that issue is there even today 
without that change because DSI is not a hot-pluggable display so a 
teardown wont happen when you plug out the panel. How will cfg->dsc be 0 
then? In that case, its not a valid test as there was no indication to 
DRM that display was disconnected so we cannot tear it down.

>> Sure, as I wrote in the other response, we can move this
>> to reset_intf_cfg later when the other pieces are fixed. And leave a
>> FIXME here.
> 
> Kuogee forgot to CC me on this patchs so I did not read/receive that
> side of the email thread.  Will catch up before reviewing v2.
> 
> - Marijn
