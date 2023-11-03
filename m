Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82A9A7E087E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Nov 2023 19:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbjKCSxU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Nov 2023 14:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjKCSxT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Nov 2023 14:53:19 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6C5BD
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Nov 2023 11:53:14 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A3IW3ev012172;
        Fri, 3 Nov 2023 18:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=cZfZv/K5qf9NPoyLOqvHaWUSPcAGWFKYbFKzEcgKkPQ=;
 b=ONy1bIcRj+kHkhWplvjUbnonDIkVNO5dUTg6EyBrLfDNGhOYOUPf9CbF/I7NquEuaBDU
 pK+tTGwzdrFfjNKklHcR92UBmuO6S1xuRxIfnkyq97QYc9usdjoEfqHMnH5FUXRbkPYm
 nhV9kVHwS05lvkiBpE3FYwWNKgYhYUwHk80Se0KwKH+oHUGLYhniB7Ff4kEgDbddhhid
 bvkli551PH58CglXxnKbYrvSotJy1QKqJM0jE45WWiCefwgP/WHK1POvbKlac+gTh6KO
 xQV2zjeJUU2TuGShLCoKcu5rW/lxSZ4x1lZsTd+ucCQXw5kT3MEAMmSeZVjXEvU07k7Q SQ== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u4qfyj13x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Nov 2023 18:53:11 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A3IrAVE003644
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 3 Nov 2023 18:53:10 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 3 Nov 2023 11:53:10 -0700
Date:   Fri, 3 Nov 2023 11:53:09 -0700
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
CC:     Brian Masney <bmasney@redhat.com>, <linux-arm-msm@vger.kernel.org>
Subject: Re: External display on the x13s?
Message-ID: <20231103185309.GW3553829@hu-bjorande-lv.qualcomm.com>
References: <ZUUrMm1Q/PI5xv6a@brian-x1>
 <181bdfdc-01ef-4e60-ad62-623884cb3d6a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <181bdfdc-01ef-4e60-ad62-623884cb3d6a@linaro.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8edDQ0PUZhJkxZth1z-5v6-GRmIHmSex
X-Proofpoint-GUID: 8edDQ0PUZhJkxZth1z-5v6-GRmIHmSex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-03_18,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 mlxlogscore=838 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311030158
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 03, 2023 at 05:37:36PM +0000, Bryan O'Donoghue wrote:
> On 03/11/2023 17:17, Brian Masney wrote:
> > I have Fedora 39 running on my x13s (with some minor tweaks to the grub
> > BLS boot entry) and it has working GPU, sound, battery status, etc. I
> > see the external display port in the DTS, however it's not working for
> > me. I have pd-mapper and qrtr installed. Does anyone have any
> > suggestions for enabling that? dmesg doesn't give any useful
> > information.
> > 
> > Brian
> > 
> 
> Run gnome and run the display @ < 2k
> 

Brian's question makes it seem like he doesn't have any display, your
<=2k only relates to the display artifacts that you have, right?

Regards,
Bjorn

