Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0E815B5D20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 17:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbiILPat (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 11:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbiILPas (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 11:30:48 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C5DC25E89;
        Mon, 12 Sep 2022 08:30:48 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CDNUdt018184;
        Mon, 12 Sep 2022 15:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=eKdTyxOiLccVrdw63VF1sE1mujYcuFpBho0TboPJW5c=;
 b=PsMj5mZR3+NH19Fqh5U+NguTjV9qxlBwR/6K/GZFockY+koYURPWKPouHyMxCp+BXMIl
 J1nSlSeGCK+J7ZkFJAE/z9I3rGTRHyxjrX2DFdTVacJIVIP8TL5/cE/OYZYnxikex49S
 CGpj6Sivjmo1/o30ayy2gAcOsuXWhX+2VE65qkcYk4qnKSwvprkaREX5MfJm3eXkdKQh
 GDOAmIxPZj/xZCGjhUwe0UaCIGVzuocSlD6PJLfC/KkhXOBXX5VwrzJUBeSrJWHirTHr
 D4e1F+iy17yFVL9anx8WuWFw8gKLp2rYLeytPoJ4gAUD57mbMUlFNKLnD2a2x+/pa/M3 KQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jgkrsw5rc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Sep 2022 15:30:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28CFUdR5010208
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Sep 2022 15:30:39 GMT
Received: from hu-gokukris-sd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 12 Sep 2022 08:30:38 -0700
From:   Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        "linux-kernel @ vger . kernel . org--cc=Trilok Soni" 
        <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        "Elliot Berman" <quic_eberman@quicinc.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
Subject: [PATCH v1 0/3] Handle coprocessor crash
Date:   Mon, 12 Sep 2022 08:30:26 -0700
Message-ID: <cover.1662995608.git.quic_gokukris@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Wi9yuTupG5gx8jFqjoRRqBpOJyLmd18k
X-Proofpoint-ORIG-GUID: Wi9yuTupG5gx8jFqjoRRqBpOJyLmd18k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_10,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 clxscore=1011 phishscore=0 priorityscore=1501 mlxlogscore=535
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209120052
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make the following changes in case of coprocessor crash:
1. Send subdevice notifications before panic
2. Do not report crash if SSR is disabled
3. Avoid setting smem bit in case of crash

Gokul krishna Krishnakumar (3):
  remoteproc: qcom: q6v5: Send subdevice notifications before panic
  remoteproc: qcom: q6v5: Do not report crash if SSR is disabled
  remoteproc: qcom: q6v5: Avoid setting smem bit in case of crash
    shutdown

 drivers/remoteproc/qcom_q6v5.c | 43 ++++++++++++++++++++++++++++++++++++++----
 drivers/remoteproc/qcom_q6v5.h |  2 ++
 2 files changed, 41 insertions(+), 4 deletions(-)

-- 
2.7.4

