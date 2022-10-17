Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1018600F8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 14:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbiJQMy0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 08:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbiJQMyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 08:54:25 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDAAD38A;
        Mon, 17 Oct 2022 05:54:21 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29H9LjAb002818;
        Mon, 17 Oct 2022 12:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=TOhTD07uHODzofuJ/GaxYQqq4SFKmzP9+kXGru1m+9U=;
 b=pdoLTaoxEPqR21LANpdS8dqBYVWCmuYxthGBcaqmvugATDevFDCIJIwQepWius+1wCM4
 kfYXo6zSR8KXji7YXx304jUVYQl19i7K8tufyyovMQPBkUOVRblm0O3bQMvSpccT8s7d
 4e/dD7CWtjZqcfK3O7UC2BAPJX4GXbYXKXOYqZFjshv/Laj3Kpy/HOzSc7CNgWcwDqzs
 QFVPN0NG963qEKRahckRgR79/8/95i8AbgzUltSsV2Iptn8bgOP5WlqT70UZHP5zUTzZ
 /sKk9PBdwgsayzEjbtOvrZsbxChij80YH3Cj0l1uj3hP44dJmfIbUMJwGtdp1fNjW3yj jA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k7jjqwdqq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Oct 2022 12:54:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29HCs9Tf008463
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Oct 2022 12:54:09 GMT
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 17 Oct 2022 05:54:06 -0700
From:   Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@somainline.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Manikanta Pubbisetty" <quic_mpubbise@quicinc.com>
Subject: [PATCH v3 1/2] dt-bindings: qcom: smp2p: Add WPSS node names to pattern property
Date:   Mon, 17 Oct 2022 18:23:45 +0530
Message-ID: <20221017125346.3691-2-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221017125346.3691-1-quic_mpubbise@quicinc.com>
References: <20221017125346.3691-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YUJm42y6IoyRB1Cn4dOAcecXuykXeJTO
X-Proofpoint-GUID: YUJm42y6IoyRB1Cn4dOAcecXuykXeJTO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_10,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 mlxscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210170075
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

WLAN firmware uses SMP2P protocol in order to talk to the application
processor (AP) in certain cases like WoW (Wake on Wireless). WLAN
firmware runs on the WPSS Q6 processor (Wireless Processor SubSystem).
Therefore it is required to have sub nodes pertaining to the WPSS Q6
processor and the application processor in the SMP2P node.

Add WPSS Q6 (Wireless Processor SubSystem) node names to the pattern
property required for WPSS Q6 processor to communicate to the
application processor and vice versa over SMP2P protocol.

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
index 795bd8cd4104..58500529b90f 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
@@ -60,7 +60,7 @@ properties:
       Two identifiers of the inbound and outbound smem items used for this edge.
 
 patternProperties:
-  "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap$":
+  "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|wlan-ap-to-wpss|wlan-wpss-to-ap$":
     type: object
     description:
       Each SMP2P pair contain a set of inbound and outbound entries, these are
-- 
2.38.0

