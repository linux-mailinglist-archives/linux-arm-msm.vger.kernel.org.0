Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6115A6950
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 19:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbiH3RMx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 13:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiH3RMx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 13:12:53 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75FF7BA160
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 10:12:52 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27UFxY9e006516;
        Tue, 30 Aug 2022 17:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=h2hoe7mZm4hC7BL4r7rSeUnHj8jKK0E6LOp1nvpUtXs=;
 b=fE9F8NbcYV48u70J3xKZeBBszBHpMW4lOaqVU3A9CSJlS3iaJiIAhz6WxKzM0uJ2yppM
 aLNIFCYUrtxs3t3Z8q77xqzjQT6xZTykiz1i+LT1Z13GoWl7ubn1xWT+u9eUTCYHGBDS
 ZL1JO7DCOgVDJBr+nYDS/52nDFmpGpMUaEKSv7LA88Cz1PGGR4pnhivAsFtwkX/pSVsK
 vpUWn/Y9ayURaMU5xaw/lJBCPnEoDOScrYfHm+eQ/nSlUE8V/fbH9LBzpmzkIYyyK4k5
 l2gvA+bCXbJ+BhzAxKBiLKcQGnt3A8h2AneQ4xxvYRA8u0P/yc5oQrEfryDI6lzO7D+1 1g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j9mwjgd56-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 30 Aug 2022 17:12:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27UHCZ0l024288
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 30 Aug 2022 17:12:35 GMT
Received: from [10.110.39.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 30 Aug
 2022 10:12:35 -0700
Message-ID: <422c2e7a-5f66-fe4a-e80d-184ec9fbddd6@quicinc.com>
Date:   Tue, 30 Aug 2022 10:12:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4] bus: mhi: host: make mhi_controller_config::event_cfg
 const
Content-Language: en-US
To:     Manivannan Sadhasivam <mani@kernel.org>
CC:     Hemant Kumar <quic_hemantk@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <mhi@lists.linux.dev>
References: <20220819210230.17773-1-quic_jjohnson@quicinc.com>
 <20220829205112.12036-1-quic_jjohnson@quicinc.com>
 <20220830074647.GA135982@thinkpad>
From:   Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220830074647.GA135982@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fbFHF9ZeqaZv6HT5p6I3tndLQsVJajct
X-Proofpoint-ORIG-GUID: fbFHF9ZeqaZv6HT5p6I3tndLQsVJajct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_10,2022-08-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208300079
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/30/2022 12:46 AM, Manivannan Sadhasivam wrote:
>> -static struct mhi_event_config mhi_foxconn_sdx55_events[] = {
>> +static struct const mhi_event_config mhi_foxconn_sdx55_events[] = {
> 
> You still haven't fixed this...

Doh, put const in wrong place, v5 posted
