Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E289D6AE5E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 17:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbjCGQHE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 11:07:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbjCGQGm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 11:06:42 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1FBBE041
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 08:04:50 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 327Db6NY022179;
        Tue, 7 Mar 2023 16:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=O/CGX32N4Yo644oMTGLxLhdR0RnXuXD+8Bm6FtKxLm4=;
 b=UAImtWI9jYrD89AYI1w/qlx2UpXifUxGTaxkRLy88eeaHBhDBDQASCQ0RP2e+LKCipnV
 3mK6vMRDruq0xJbMCgve9lG1DYJo61adWeSfNiZ137NeJinnTd61jQZW4syFWzDOEkQD
 vLROGeewoeAGYZsvXtJH19agRR5ATZElk4/Cecito4GXnZt3ZYJDOS+7BfImCEVETUTM
 7E0WeSAod4qP8vTHrUaXIIDTIqHZVOZD1rTF1xUYURJuZlVkhBiwz2gSj11KZTOX1L0z
 WFlnZpQY7vyLTNMMjaSatw/Ij+JXEUF6e1N5f0tyO1ZvCSpnZ73LGvQ+/j9XNQxQAejb zA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p5ukn2198-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Mar 2023 16:04:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 327G4eSa004543
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 7 Mar 2023 16:04:40 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 7 Mar 2023
 08:04:39 -0800
Message-ID: <a2a59236-302c-80f4-b4db-f3c704edbdd0@quicinc.com>
Date:   Tue, 7 Mar 2023 09:04:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] bus: mhi: ep: Demote unsupported channel error log to
 debug
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
References: <20230307074248.86731-1-manivannan.sadhasivam@linaro.org>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230307074248.86731-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: piayg_1LGFh7rbds7HgVU9E71jV7tYRX
X-Proofpoint-GUID: piayg_1LGFh7rbds7HgVU9E71jV7tYRX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_11,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 mlxlogscore=880 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070145
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/7/2023 12:42 AM, Manivannan Sadhasivam wrote:
> Not all MHI endpoints will support all available channels. Most of them
> support only a selected number of channels based on the implementations.
> In those cases, it is not needed to print error messages in the endpoint.
> So let's demote the error log to debug.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Makes sense to me.

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
