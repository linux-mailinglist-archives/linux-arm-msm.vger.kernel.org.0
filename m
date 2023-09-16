Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 738947A2B7C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Sep 2023 02:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238281AbjIPAMQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 20:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238375AbjIPAL6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 20:11:58 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07D0273D;
        Fri, 15 Sep 2023 17:11:46 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38G07hiv027575;
        Sat, 16 Sep 2023 00:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=DJXYybKJrBl7GHgka4BmKmo4v4Wju0w3cfuDKhuRqeQ=;
 b=fsjzmFS7jm36MMeCfp+/52i7K0FZvaz/ssBM6PQJlZBUGzLxzKzZu3RGwoWKChOT8G04
 KLyHZKTWMm2nmiY7243QK5u16V6TdP5P8q/v2K51Z/cqIunHYufY7M62zO8+f2OzF15F
 oe+9bPoD6YO1qX43SmSUzfGIDL3W+feKQf6JRjySA/8A6GKbnVn4n+74zXhAxvmy9AVn
 /dvH25rgQY9MnHzVmo+ePu4fh7SvvFW3JNZN7cQT0VAuMicnwCcS5ozVi/aRmaUKKTNc
 0BccCNXt2uvmwOqSD8JKHaMsUt3UMb3NOXHJyBdpT8FtO50cBJj3j1Dpr7uvbc5hwPlc 4Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g3gtd2f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 16 Sep 2023 00:11:08 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38G0AiB0011932
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 16 Sep 2023 00:10:44 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 15 Sep 2023 17:10:44 -0700
From:   Wesley Cheng <quic_wcheng@quicinc.com>
To:     <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v6 25/33] ASoC: qcom: qdsp6: q6afe: Split USB AFE dev_token param into separate API
Date:   Fri, 15 Sep 2023 17:10:18 -0700
Message-ID: <20230916001026.315-26-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230916001026.315-1-quic_wcheng@quicinc.com>
References: <20230916001026.315-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _oncAGCP59f8cUy1DGGVfRK17rZvLC4F
X-Proofpoint-ORIG-GUID: _oncAGCP59f8cUy1DGGVfRK17rZvLC4F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_20,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309160000
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Q6USB backend can carry information about the available USB SND cards
and PCM devices discovered on the USB bus.  The dev_token field is used by
the audio DSP to notify the USB offload driver of which card and PCM index
to enable playback on.  Separate this into a dedicated API, so the USB
backend can set the dev_token accordingly.  The audio DSP does not utilize
this information until the AFE port start command is sent, which is done
during the PCM prepare phase.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6afe.c | 49 +++++++++++++++++++++++++-----------
 sound/soc/qcom/qdsp6/q6afe.h |  1 +
 2 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 72c4e6fe20c4..f09a756246f8 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1394,10 +1394,42 @@ void q6afe_tdm_port_prepare(struct q6afe_port *port,
 }
 EXPORT_SYMBOL_GPL(q6afe_tdm_port_prepare);
 
-static int afe_port_send_usb_dev_param(struct q6afe_port *port, struct q6afe_usb_cfg *cfg)
+/**
+ * afe_port_send_usb_dev_param() - Send USB dev token
+ *
+ * @port: Instance of afe port
+ * @cardidx: USB SND card index to reference
+ * @pcmidx: USB SND PCM device index to reference
+ *
+ * The USB dev token carries information about which USB SND card instance and
+ * PCM device to execute the offload on.  This information is carried through
+ * to the stream enable QMI request, which is handled by the offload class
+ * driver.  The information is parsed to determine which USB device to query
+ * the required resources for.
+ */
+int afe_port_send_usb_dev_param(struct q6afe_port *port, int cardidx, int pcmidx)
 {
-	union afe_port_config *pcfg = &port->port_cfg;
 	struct afe_param_id_usb_audio_dev_params usb_dev;
+	int ret;
+
+	memset(&usb_dev, 0, sizeof(usb_dev));
+
+	usb_dev.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
+	usb_dev.dev_token = (cardidx << 16) | (pcmidx << 8);
+	ret = q6afe_port_set_param_v2(port, &usb_dev,
+				AFE_PARAM_ID_USB_AUDIO_DEV_PARAMS,
+				AFE_MODULE_AUDIO_DEV_INTERFACE, sizeof(usb_dev));
+	if (ret)
+		dev_err(port->afe->dev, "%s: AFE device param cmd failed %d\n",
+			__func__, ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(afe_port_send_usb_dev_param);
+
+static int afe_port_send_usb_params(struct q6afe_port *port, struct q6afe_usb_cfg *cfg)
+{
+	union afe_port_config *pcfg = &port->port_cfg;
 	struct afe_param_id_usb_audio_dev_lpcm_fmt lpcm_fmt;
 	struct afe_param_id_usb_audio_svc_interval svc_int;
 	int ret = 0;
@@ -1408,20 +1440,9 @@ static int afe_port_send_usb_dev_param(struct q6afe_port *port, struct q6afe_usb
 		goto exit;
 	}
 
-	memset(&usb_dev, 0, sizeof(usb_dev));
 	memset(&lpcm_fmt, 0, sizeof(lpcm_fmt));
 	memset(&svc_int, 0, sizeof(svc_int));
 
-	usb_dev.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
-	ret = q6afe_port_set_param_v2(port, &usb_dev,
-				      AFE_PARAM_ID_USB_AUDIO_DEV_PARAMS,
-				      AFE_MODULE_AUDIO_DEV_INTERFACE, sizeof(usb_dev));
-	if (ret) {
-		dev_err(port->afe->dev, "%s: AFE device param cmd failed %d\n",
-			__func__, ret);
-		goto exit;
-	}
-
 	lpcm_fmt.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
 	lpcm_fmt.endian = pcfg->usb_cfg.endian;
 	ret = q6afe_port_set_param_v2(port, &lpcm_fmt,
@@ -1463,7 +1484,7 @@ void q6afe_usb_port_prepare(struct q6afe_port *port,
 	pcfg->usb_cfg.num_channels = cfg->num_channels;
 	pcfg->usb_cfg.bit_width = cfg->bit_width;
 
-	afe_port_send_usb_dev_param(port, cfg);
+	afe_port_send_usb_params(port, cfg);
 }
 EXPORT_SYMBOL_GPL(q6afe_usb_port_prepare);
 
diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
index ef47b4ae9e27..2ce5ba9dba69 100644
--- a/sound/soc/qcom/qdsp6/q6afe.h
+++ b/sound/soc/qcom/qdsp6/q6afe.h
@@ -263,6 +263,7 @@ void q6afe_tdm_port_prepare(struct q6afe_port *port, struct q6afe_tdm_cfg *cfg);
 void q6afe_cdc_dma_port_prepare(struct q6afe_port *port,
 				struct q6afe_cdc_dma_cfg *cfg);
 
+int afe_port_send_usb_dev_param(struct q6afe_port *port, int cardidx, int pcmidx);
 int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
 			  int clk_src, int clk_root,
 			  unsigned int freq, int dir);
