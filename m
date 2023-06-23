Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEA7273C3D3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jun 2023 00:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbjFWWMu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 18:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjFWWMt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 18:12:49 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B8CDD
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 15:12:48 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35NL8EEA010012;
        Fri, 23 Jun 2023 22:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=O8v3lQVXkeWFyOI99HHvp4iJWJ3r9lAwQlLUotxmmAc=;
 b=ptE3QWEaG6L4DNiFZaiUd/ETy1VJfQPX0+EC6ysP4TbO2/3W1fqBuVDvZJL+wVPhnXNN
 nQ1vlKS4isXLFFFmWZJsrP0kFG0+BCAL81vv1reUvl3keQJ5PUVZuA+T1plGJnaqKPlY
 xzejUhpUEz2AkPFX1g6ckIVOlhZQgbJi5fDS9mt3K7TD7uz7eFRDXtJtWbi5ql8T891B
 //XoFGB9GXl3wyWwQn4CmbaefKWabObYi17micIvXQoc/2l1KknQIFFC7dIJ3Au8r2BZ
 TtLcXr0mPkEY089hegrV5DLPdQiHLOPs1AGFhk02WJmwJN2RaU+fhIJZk3E3ia/1Z+dd pg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rc0sk6t32-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Jun 2023 22:12:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35NMC8Ye014272
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Jun 2023 22:12:08 GMT
Received: from [10.110.61.170] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 23 Jun
 2023 15:12:07 -0700
Message-ID: <fbfb5297-0b89-d48e-459f-7e2cd8aa221b@quicinc.com>
Date:   Fri, 23 Jun 2023 15:12:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230623013731.1088007-1-dmitry.baryshkov@linaro.org>
 <6b74cb1f-3128-4ebd-8ff9-33cc025d957b@quicinc.com>
 <mwxs3rvemvdizqtsfa7pxms5prgrdq2lue6lvkt2f23nehzhwr@uawaxv5jsnmh>
 <ad1cf803-729f-5ef5-a6cf-667ecde0b282@linaro.org>
 <okxoa5ltkvki25q6e25jwoh55l3aav3umowynklinyapg4ojvp@wfxa6upwnk3m>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <okxoa5ltkvki25q6e25jwoh55l3aav3umowynklinyapg4ojvp@wfxa6upwnk3m>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Atq8QTJo4piVg2gIYJfmDBAgk8e1Ta4Q
X-Proofpoint-ORIG-GUID: Atq8QTJo4piVg2gIYJfmDBAgk8e1Ta4Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_12,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 impostorscore=0 mlxlogscore=883 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306230200
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/23/2023 1:28 PM, Marijn Suijten wrote:
> On 2023-06-23 14:37:12, Dmitry Baryshkov wrote:
> <snip>
>>> In fact I asked to make it 0xf00 + 0x10 or 0xf80 + 0x10 to also cover
>>> the CTL registers, but that change didn't make it through.  0x29c is an
>>> arbitrary number that I have no clue what it was based on.
>>
>> This should have been NAKed. or at least TODOed.
> 
> As usual ;) - add new features first, fix the fundamentals... later?
> 
> - Marijn

I think you yourself found out that this was not an arbitary number but 
we atleast wanted to cover the full encoder set.

So fundamentals are always sound sometimes understanding is not ;)
