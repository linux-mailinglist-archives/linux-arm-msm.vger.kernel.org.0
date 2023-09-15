Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2607E7A2541
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 20:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236156AbjIOSAM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 14:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235549AbjIOR7w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 13:59:52 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60ABEAC
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 10:59:47 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38FEWCnj004729;
        Fri, 15 Sep 2023 17:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=wLqLAYh8vdU1kWG4R2K6DX3JlYLNS6uiESUVQyxfRvs=;
 b=dyVbMgyMoKAyFKv+6qyFm3JA18tUoVulQHT9bY65rrTtxhzB1u7+GT0cXEXyfsN5sdUp
 bQzKdzDZ1p3PI5zTs1rdysmile9PPc2XG/abCyEOFKhxPzKVuzfYc3hiFsvRSnYTYTHB
 d3Udmjij3bMzd0fPg8k2fZCXzQUmAmXL2PVjuGLelVV9Q/wFi33x63+NEvJ3aZZg1LrO
 dN9fb98/ZOgrHY1K3OOPDHqqJazDs7EonI08e23e1Ae/PWmBR6PaWsbBtmyXRqOD3N+R
 Wa0R/bKz85sczljyhUj33+hJ+V/ASPnwWDU+iuHaaIcaiLNXIAzQPcWLNjzPmU6Hf1YU 9A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4f6v200q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Sep 2023 17:59:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38FHxTJ4001171
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Sep 2023 17:59:29 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 15 Sep 2023 10:59:28 -0700
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <konrad.dybcio@linaro.org>, <andersson@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH] soc: qcom: smem: Document shared memory item IDs and corresponding structs
Date:   Fri, 15 Sep 2023 11:59:07 -0600
Message-ID: <20230915175907.17134-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TWYcYqNcwnY_Rzxsqjd5tACgtrI2IvZl
X-Proofpoint-ORIG-GUID: TWYcYqNcwnY_Rzxsqjd5tACgtrI2IvZl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_14,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 clxscore=1011 mlxlogscore=999 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150162
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Shared memory items are assigned a globally unique ID and almost always
have a defined structure which is stored in the shared memory.  Document
assigned IDs and corresponding structures.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---

Konrad, before I get too far into this, I was hoping for some early
feedback since this documentation is a request that you made.

Please let me know if this is aligned with what you were wanting.

 include/linux/soc/qcom/smem.h | 176 ++++++++++++++++++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
index 223db6a9c733..2f8d1f3126a4 100644
--- a/include/linux/soc/qcom/smem.h
+++ b/include/linux/soc/qcom/smem.h
@@ -4,6 +4,182 @@
 
 #define QCOM_SMEM_HOST_ANY -1
 
+/* fixed items - these have a static position in shared memory */
+#define SMEM_PROC_COMM				0
+#define SMEM_HEAP_INFO				1
+#define SMEM_ALLOCATION_TABLE			2
+#define SMEM_VERSION_INFO			3
+#define SMEM_HW_RESET_DETECT			4
+#define SMEM_AARM_WARM_BOOT			5
+#define SMEM_DIAG_ERR_MESSAGE			6
+#define SMEM_SPINLOCK_ARRAY			7
+#define SMEM_MEMORY_BARRIER_LOCATION		8
+
+/* dynamic items - these are allocated out of the shared memory heap */
+#define SMEM_AARM_PARTITION_TABLE		9
+#define SMEM_AARM_BAD_BLOCK_TABLE		10
+#define SMEM_RESERVE_BAD_BLOCKS			11
+#define SMEM_WM_UUID				12
+#define SMEM_CHANNEL_ALLOC_TBL			13
+#define SMEM_SMD_BASE_ID			14
+#define SMEM_SMEM_LOG_IDX			78
+#define SMEM_SMEM_LOG_EVENTS			79
+#define SMEM_SMEM_STATIC_LOG_IDX		80
+#define SMEM_SMEM_STATIC_LOG_EVENTS		81
+#define SMEM_SMEM_SLOW_CLOCK_SYNC		82
+#define SMEM_SMEM_SLOW_CLOCK_VALUE		83
+#define SMEM_BIO_LED_BUF			84
+#define SMEM_SMSM_SHARED_STATE			85
+#define SMEM_SMSM_INT_INFO			86
+#define SMEM_SMSM_SLEEP_DELAY			87
+#define SMEM_SMSM_LIMIT_SLEEP			88
+#define SMEM_SLEEP_POWER_COLLAPSE_DISABLED	89
+#define SMEM_KEYPAD_KEYS_PRESSED		90
+#define SMEM_KEYPAD_STATE_UPDATED		91
+#define SMEM_KEYPAD_STATE_IDX			92
+#define SMEM_GPIO_INT				93
+#define SMEM_MDDI_LCD_IDX			94
+#define SMEM_MDDI_HOST_DRIVER_STATE		95
+#define SMEM_MDDI_LCD_DISP_STATE		96
+#define SMEM_LCD_CUR_PANEL			97
+#define SMEM_MARM_BOOT_SEGMENT_INFO		98
+#define SMEM_AARM_BOOT_SEGMENT_INFO		99
+#define SMEM_SLEEP_STATIC			100
+#define SMEM_SCORPION_FREQUENCY			101
+#define SMEM_SMD_PROFILES			102
+#define SMEM_TSSC_BUSY				103
+#define SMEM_HS_SUSPEND_FILTER_INFO		104
+#define SMEM_BATT_INFO				105
+#define SMEM_APPS_BOOT_MODE			106
+#define SMEM_VERSION_FIRST			107
+#define SMEM_VERSION_LAST			131
+#define SMEM_OSS_RRCASN1_BUF1			132
+#define SMEM_OSS_RRCASN1_BUF2			133
+#define SMEM_ID_VENDOR0				134
+#define SMEM_ID_VENDOR1				135
+#define SMEM_ID_VENDOR2				136
+#define SMEM_HW_SW_BUILD_ID			137
+#define SMEM_SMD_BASE_ID_2			138
+#define SMEM_SMD_FIFO_BASE_ID_2			202
+#define SMEM_CHANNEL_ALLOC_TBL_2		266
+#define SMEM_I2C_MUTEX				330
+#define SMEM_SCLK_CONVERSION			331
+#define SMEM_SMD_SMSM_INTR_MUX			332
+#define SMEM_SMSM_CPU_INTR_MASK			333
+#define SMEM_APPS_DEM_SLAVE_DATA		334
+#define SMEM_QDSP6_DEM_SLAVE_DATA		335
+#define SMEM_VSENSE_DATA			336
+#define SMEM_CLKREGIM_SOURCES			337
+#define SMEM_SMD_FIFO_BASE_ID			338
+#define SMEM_USABLE_RAM_PARTITION_TABLE		402
+#define SMEM_POWER_ON_STATUS_INFO		403
+#define SMEM_DAL_AREA				404
+#define SMEM_SMEM_LOG_POWER_IDX			405
+#define SMEM_SMEM_LOG_POWER_WRAP		406
+#define SMEM_SMEM_LOG_POWER_EVENTS		407
+#define SMEM_ERR_CRASH_LOG			408
+#define SMEM_ERR_F3_TRACE_LOG			409
+#define SMEM_SMD_BRIDGE_ALLOC_TABLE		410
+#define SMEM_SMDLITE_TABLE			411
+#define SMEM_SD_IMG_UPGRADE_STATUS		412
+#define SMEM_SEFS_INFO				413
+#define SMEM_RESET_LOG				414
+#define SMEM_RESET_LOG_SYMBOLS			415
+#define SMEM_MODEM_SW_BUILD_ID			416
+#define SMEM_SMEM_LOG_MPROC_WRAP		417
+#define SMEM_BOOT_INFO_FOR_APPS			418
+#define SMEM_SMSM_SIZE_INFO			419
+#define SMEM_SMD_LOOPBACK_REGISTER		420
+#define SMEM_SSR_REASON_MSS0			421
+#define SMEM_SSR_REASON_WCNSS0			422
+#define SMEM_SSR_REASON_LPASS0			423
+#define SMEM_SSR_REASON_DSPS0			424
+#define SMEM_SSR_REASON_VCODEC0			425
+#define SMEM_SMP2P_APPS_BASE			427
+#define SMEM_SMP2P_MODEM_BASE			435
+#define SMEM_SMP2P_AUDIO_BASE			443
+#define SMEM_SMP2P_WIRLESS_BASE			451
+#define SMEM_SMP2P_POWER_BASE			459
+#define SMEM_FLASH_DEVICE_INFO			467
+#define SMEM_BAM_PIPE_MEMORY			468
+#define SMEM_IMAGE_VERSION_TABLE		469
+#define SMEM_LC_DEBUGGER			470
+#define SMEM_FLASH_NAND_DEV_INFO		471
+#define SMEM_A2_BAM_DESCRIPTOR_FIFO		472
+#define SMEM_CPR_CONFIG				473
+#define SMEM_CLOCK_INFO				474
+#define SMEM_IPC_FIFO				475
+#define SMEM_RF_EEPROM_DATA			476
+#define SMEM_COEX_MDM_WCN			477
+#define SMEM_GLINK_NATIVE_XPRT_DESCRIPTOR	478
+#define SMEM_GLINK_NATIVE_XPRT_FIFO_0		479
+#define SMEM_GLINK_NATIVE_XPRT_FIFO_1		480
+#define SMEM_SMP2P_SENSOR_BASE			481
+#define SMEM_NUM_ITEMS				489
+
+/* Legacy communication protocol between "Apps" and "Modem" processors */
+struct smem_proc_comm {
+        __le32 command;
+        __le32 status;
+        __le32 data1;
+        __le32 data2;
+};
+
+/* Metadata structure for shared memory heap allocations */
+struct smem_heap_info {
+        __le32 initialized;
+        __le32 free_offset;
+        __le32 heap_remaining;
+        __le32 reserved;
+};
+
+/* SMEM_ALLOCATION_TABLE is an array of these structures.  512 elements in the array. */
+struct smem_heap_entry {
+        __le32 allocated;
+        __le32 offset;
+        __le32 size;
+        __le32 reserved; /* bits 1:0 reserved, bits 31:2 aux smem base addr */
+};
+
+struct smem_version_info {
+	__le32 version[32];
+};
+
+struct smem_spinlock_array {
+	volatile __le32 lock[8];
+};
+
+#define FLASH_PART_MAGIC1       0x55EE73AA
+#define FLASH_PART_MAGIC2       0xE35EBDDB
+#define FLASH_PTABLE_V3         3
+#define FLASH_PTABLE_V4         4
+#define FLASH_PTABLE_MAX_PARTS_V3 16
+#define FLASH_PTABLE_MAX_PARTS_V4 32
+#define FLASH_PTABLE_ENTRY_NAME_SIZE 16
+
+struct flash_partition_entry {
+        char name[FLASH_PTABLE_ENTRY_NAME_SIZE];
+        __le32 offset;     /* Offset in blocks from beginning of device */
+        __le32 length;     /* Length of the partition in blocks */
+        u8 attr;           /* Flags for this partition */
+};
+
+struct flash_partition_table {
+        __le32 magic1;
+        __le32 magic2;
+        __le32 version;
+        __le32 numparts;
+        struct flash_partition_entry part_entry[FLASH_PTABLE_MAX_PARTS_V4];
+};
+
+/* SMEM_CHANNEL_ALLOC_TBL is an array of these.  Used for SMD. */
+struct smd_alloc_elm {
+        char name[20];
+        __le32 cid;
+        __le32 type;
+        __le32 ref_count;
+};
+
 int qcom_smem_alloc(unsigned host, unsigned item, size_t size);
 void *qcom_smem_get(unsigned host, unsigned item, size_t *size);
 
-- 
2.40.1

