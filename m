Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB966BC286
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 01:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233118AbjCPAbU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 20:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233057AbjCPAbR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 20:31:17 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98EA9EF73
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 17:31:15 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32FMZNIw024819;
        Thu, 16 Mar 2023 00:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5cF0aQHL6hTK5UvqOWWf3uT6tlDl+tp5zzAq58kWVF4=;
 b=myK3hfMNVmpHj1ytxjtl1LMxe8mhrk0MvdciAjG5E+6kc5s5cG3POmrBezIg1CTeOlAK
 fGbpGy5hdqsx9cuHHvZOjph9ueRWGbTNfKxBBYdVWboT5z1BrVoTOm+tbUoP/P3DqUYM
 /JdabekgKrZD52ymlTESrb1dRgKWjn5nlBN8bAHaH86llPpcyMkUy85lkDcySUQcAK1z
 agTBWsaoxn6qakLpzilMpepx0jb0D2F4e6D0RipG1Gpi8UqhUMTKmvh9evyV48zVfirw
 Y3uUxph04EEBpL2N8SGXfBAYbusy4vVPLQMoApi+Kb2k8Z2FpQQoMrGdMC3Ni2TlX/H+ XA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pbpxsg752-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 16 Mar 2023 00:31:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32G0V4SN024749
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 16 Mar 2023 00:31:04 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 15 Mar 2023 17:31:04 -0700
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
CC:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: Re: (subset) [PATCH v2 02/50] drm/msm/dpu: disable features unsupported by QCM2290
Date:   Wed, 15 Mar 2023 17:30:49 -0700
Message-ID: <167892661705.19557.4033120434395579912.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230211231259.1308718-3-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org> <20230211231259.1308718-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ExSHT8pOZ0Tx_Xtv5f2kBDe4PtHDzygH
X-Proofpoint-ORIG-GUID: ExSHT8pOZ0Tx_Xtv5f2kBDe4PtHDzygH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_12,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxscore=0 mlxlogscore=621 suspectscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160003
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sun, 12 Feb 2023 01:12:11 +0200, Dmitry Baryshkov wrote:
> QCM2290 doesn't seem to support reg-dma, UBWC and CSC. Drop
> corresponding features being incorrectly enabled for qcm2290.
> 
> 

Applied, thanks!

[02/50] drm/msm/dpu: disable features unsupported by QCM2290
        (no commit info)

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
