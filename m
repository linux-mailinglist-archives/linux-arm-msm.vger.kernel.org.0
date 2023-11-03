Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2F657E08B8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Nov 2023 20:04:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234284AbjKCTEo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Nov 2023 15:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234435AbjKCTEn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Nov 2023 15:04:43 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E62D51
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Nov 2023 12:04:37 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A3EwxZb026222;
        Fri, 3 Nov 2023 19:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=XbDUxotDkGdvd5lhIBJk3yzgeEn4uAbYEXqZ87BEUAw=;
 b=d5hg+i57XvGIhlEWM7fBs9mqX6decW+rPWDc1QyP2l7sDCLuaTVGusokhIvcGR7WRANR
 W2mvZS8wuL6+ZTEb9Xs5ZyAuS4xfsSjWdIdsfPPZqlz5/cs0xoJgr6SezQeOVVEX9y1j
 dPeiSk4YS0s51IS/N5TBWa88a6AQM/+X7qv5/5dTatAKM5JZPK2HjIeQ+WQT0ZXsWh4j
 lB4gMV7Pe3Uqj97t2f2cSNG4gGXyETAH/pDoBUIGLiJnDYbDgLcYxXUxYuf5wFkSKOHF
 35DZJ3f3J6GWCrsfXRgevgqVXQsP1mqso5/whSQadZ+VAzr7DQ65/xZWZAsBTsoz2ByN sw== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u533j8m3s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Nov 2023 19:04:35 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A3J4Yvc006275
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 3 Nov 2023 19:04:34 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 3 Nov 2023 12:04:34 -0700
Date:   Fri, 3 Nov 2023 12:04:33 -0700
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Brian Masney <bmasney@redhat.com>
CC:     <linux-arm-msm@vger.kernel.org>
Subject: Re: External display on the x13s?
Message-ID: <20231103190433.GX3553829@hu-bjorande-lv.qualcomm.com>
References: <ZUUrMm1Q/PI5xv6a@brian-x1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZUUrMm1Q/PI5xv6a@brian-x1>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KT4T47RhEo3mRgrtsRZydlA7RjoFd3tH
X-Proofpoint-ORIG-GUID: KT4T47RhEo3mRgrtsRZydlA7RjoFd3tH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-03_18,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=958 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2311030160
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 03, 2023 at 01:17:38PM -0400, Brian Masney wrote:
> I have Fedora 39 running on my x13s (with some minor tweaks to the grub
> BLS boot entry) and it has working GPU, sound, battery status, etc. I
> see the external display port in the DTS, however it's not working for
> me. I have pd-mapper and qrtr installed. Does anyone have any
> suggestions for enabling that? dmesg doesn't give any useful
> information.
> 

With the ADSP remoteproc and pd-mapper running, and pd-mapper being able
to pick up the json files you should get your power-supply, and you
should get your USB Type-C events.

Unless I'm mistaken, there's still some issue with Gnome, but you should
be able to validate if the display is detected using "modetest -c". It
should present you with a eDP-1, USB-1 and USB-2 (or eDP-1, DP-1, DP-2
now in the future).


For reference, I'm running v6.6 with no modifications and built straight
from the upstream defconfig. I just confirmed that I can drive my 4k TV
(at 30Hz...) over HDMI with that.

Regards,
Bjorn
