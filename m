Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51D6D71746C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 05:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbjEaDj1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 23:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbjEaDj0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 23:39:26 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97DC7C5
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 20:39:24 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34V3Wbgx001593
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 03:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=a54rVMCFoZ4HQzhSjUd4w8dxhLkLh46Kxg+oepWeLrs=;
 b=myIZARpSRFlH3Ydwb3FlDM+MidsZuax8fCnbmrNjSUtzaPJEUhGdGO8+MXpSUE2p394P
 ygR6r95WlSar5Z6hmQADgtANZKNXT7prH+Zn+rr9Ukg3rGYYEatlqvPWCVEK2ThNQC51
 DvSTmSOEqqKr+mBRWGh2M6ddBD1jFIGWV430NUEw5f8FDysccJ8Iuaht8l0+MoCL703C
 1O+47SUEmZaz92ATVbT7UyzDOZBYkGKOmn1LpWL1seMpHPKaGFzDyRfQDapbZmIf/AR6
 ScwimJ/Lm63RmwLgCP/yERzBZhR1kJbKLWBmuISmv7ODtY+fB6y81macrfOpGATULzML xQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qw8v4tpan-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 03:39:24 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34V3dNn2031785
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 03:39:23 GMT
Received: from [10.110.116.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 30 May
 2023 20:39:23 -0700
Message-ID: <a83c7907-a592-6a91-0581-e8d17cf5edc2@quicinc.com>
Date:   Tue, 30 May 2023 20:39:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: EXPORT_SYMBOL_GPL only
Content-Language: en-US
From:   Trilok Soni <quic_tsoni@quicinc.com>
To:     linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <bdf0e3fa-94f1-b3be-f6f5-3050c1019ecc@quicinc.com>
In-Reply-To: <bdf0e3fa-94f1-b3be-f6f5-3050c1019ecc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AAC5NVKVvbuhgb83-XiIikO3uyDCk8Jh
X-Proofpoint-GUID: AAC5NVKVvbuhgb83-XiIikO3uyDCk8Jh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_18,2023-05-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxscore=0 mlxlogscore=793 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305310029
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/24/2023 11:18 AM, Trilok Soni wrote:
> Hello Bjorn and linux-arm-msm members,
> 
> Is it possible to accept the patches which EXPORT_SYMBOL_GPL only for 
> patches submitted on this list?
> 
> If not, I would like to know the reason(s) why we should accept 
> EXPORT_SYMBOL only APIs.

Any feedback here? For all the new patches and modifications submitted 
to linux-arm-msm mailing list related to MSM drivers I am asking to mark 
the APIs and symbols as EXPORT_SYMBOL_GPL only. Let me know if we have 
different opinion here.

---Trilok Soni
