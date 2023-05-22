Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0981270CE0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 00:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjEVWgF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 18:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbjEVWgF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 18:36:05 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 214859C;
        Mon, 22 May 2023 15:36:04 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MKMYxj007942;
        Mon, 22 May 2023 22:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GyF9u10zK3b8Ehcl3xHrJgwZsQ7joD1Bo6aJOLb2Avg=;
 b=f/maWul0KL1bUSXz7ZsyW0A/HZQaOEVM2oWh451aOCCUfK/EILdfYCn5zQBiA6KugsrF
 mbxdjFI98jXLBb5c8tC/BY6ebuGVdo9pdq1MBqEBld2MZ/fokt51L+nkw/mMCb99TaB1
 MRhZMXwZK95Rtl0v2YXN1xOMth490sQCWlFnzfwHHSaM1MM3F7J2aKYg+eNxOUbPQwnA
 nRiryafevhuz1HQbZR0yzpyw5k16dICOwxB7iQtqmZ0wohpMz2MyHznWeLxKImbjDMJ2
 RDmOkXR3dLRUkq1NoaNPyii0LWJSdNVCyvvIfb4dKg69K3HYUmmM40594KzqXhq++Hc9 rA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qre8p09pb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 22:35:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34MMZMvr001817
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 22:35:22 GMT
Received: from [10.71.110.189] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 22 May
 2023 15:35:21 -0700
Message-ID: <9804c558-124d-aca4-c534-158c0457b7bf@quicinc.com>
Date:   Mon, 22 May 2023 15:35:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] drm/msm/dp: enable HDP plugin/unplugged interrupts at
 hpd_enable/disable
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
CC:     <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
        <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
        <airlied@gmail.com>, <agross@kernel.org>,
        <marijn.suijten@somainline.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_sbillaka@quicinc.com>,
        <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1684791092-1822-1-git-send-email-quic_khsieh@quicinc.com>
 <20230522220555.7ood44kavjzzg3lv@ripper>
 <c4d6e019-1582-c94f-d56d-271c420d72ea@linaro.org>
Content-Language: en-US
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <c4d6e019-1582-c94f-d56d-271c420d72ea@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SR81ldgiOMVt5touDXY22-UAFxnm8qrh
X-Proofpoint-GUID: SR81ldgiOMVt5touDXY22-UAFxnm8qrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_16,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=979 mlxscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220191
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



>>>   -static void dp_display_config_hpd(struct dp_display_private *dp)
>>> -{
>>> -
>>> -    dp_display_host_init(dp);
>>> -    dp_catalog_ctrl_hpd_config(dp->catalog);
>>> -
>>> -    /* Enable plug and unplug interrupts only if requested */
>>> -    if (dp->dp_display.internal_hpd)
>>> -        dp_catalog_hpd_config_intr(dp->catalog,
>>> -                DP_DP_HPD_PLUG_INT_MASK |
>>> -                DP_DP_HPD_UNPLUG_INT_MASK,
>>> -                true);
>>> -
>>> -    /* Enable interrupt first time
>>> -     * we are leaving dp clocks on during disconnect
>>> -     * and never disable interrupt
>>> -     */
>>> -    enable_irq(dp->irq);
>>
>> ...we need dp->irq enabled for handling the other interrupts, otherwise
>> e.g. AUX transfers will time out.
>>
>> I added enable_irq(dp_priv->irq) to the EV_HPD_INIT_SETUP case below,
>> just for testing, and with that the patch seems to be working fine.
>>
>>
>> Is there any reason why we need to delay its enablement to after we
>> unmask the HPD interrupts?

my though is aux transaction should happen after plugin interrupt detected.

can you please let me know what did you do to trigger aux timeout?

It does not happen on me at my test.

>
> As I wrote, I'd probably prefer to see enable_irq() and disable_irq() 
> calls gone.

ok, i will move enable_irq() out of here.


>>
>> Regards,
>> Bjorn
>>
>
