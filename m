Return-Path: <linux-arm-msm+bounces-63142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F62EAEEFA4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 09:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AF5E3B14E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 07:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BB225F962;
	Tue,  1 Jul 2025 07:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsMBa4KE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5654E25A2D2;
	Tue,  1 Jul 2025 07:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751354383; cv=none; b=seG2sOhd/VUup15zKHlJNDqEpc9ICuRDvevcpwnLASjFdlhoyzudybtZY0xLiiyKulkrvZuBUiJJKIGS2S8mEXoddSIxPKTnYiv6fS/bsx8kWkhToIWn27i5rTWCjXnh3wf7C8XYUAeJpgl0yukw0Q/CYE7cIMOxUmaA7h1X9Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751354383; c=relaxed/simple;
	bh=nRFdq0Ufl8fZKFfH9IXbqwNnNXwqF2zywQCMfPNAkuM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kgL0pzBFtliRSn5nLJOMZzxWQZ7XOcIOo0EWBFrLa3JZaiUHKXFEg0nDSs4JsVy1ZCbiJmb9bZhIsakANGYzpOH4wVfsPe4pZVfvkiRR7ukyk0IJ5UTv+O4QyLIIXyTmmT6+aVcR2FKpV4tQHRisPSB19UNP9VmKpxhBsk2Yzg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsMBa4KE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5613XfB9002161;
	Tue, 1 Jul 2025 07:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8xmZOaTLmGu1BLDlA3sYynjzRKsXnXqkGlD
	Q29JoaXo=; b=hsMBa4KEI9Y7/kAb/Zzo7+XK0aazyf59uCnFvK57xRA3z8uLy8+
	l6gFLfH4N6qhZn0CshDLnu1t4LSHIugTZiE2rWb/W36mm4Kze/XxCkvKX6xtfMp3
	ZsBeIiH1RcU1QCpRA7J/miwOcG41+y5RyAh+yfeyMUqBOAytT8ze95zyiGFMXfKr
	Y+8TglBkoGQKYgDNu18dMT9t/AKEJ+cbpGSuPvyy85vTUTVY4wpF6tND5vWiWIs2
	fCEIr//xfh6pAh0DEZ8UwwACye9+pcTkfTir+mQQHeaSWBU+fokgUsdGQKUG4gnA
	EnvxyrTdcF2Bdz3V1octvJ42dJxhzJs3i7g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcqf4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 07:19:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5617JGkJ029797;
	Tue, 1 Jul 2025 07:19:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47j9fktsu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 07:19:16 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5617JGn8029792;
	Tue, 1 Jul 2025 07:19:16 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5617JGSb029791
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 07:19:16 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 56A6324053; Tue,  1 Jul 2025 12:49:15 +0530 (+0530)
From: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com,
        alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: [PATCH v6 0/3] Add Qualcomm i3c controller driver support
Date: Tue,  1 Jul 2025 12:48:49 +0530
Message-Id: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _Ig_QL3AX_oXeFtHx7n0B6nzDMfgoDPS
X-Proofpoint-ORIG-GUID: _Ig_QL3AX_oXeFtHx7n0B6nzDMfgoDPS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0MCBTYWx0ZWRfX0xkXUmASOZkC
 eQnBGeePm7thlUUZ/oz+lhHHcCimiQKRPoIN4b7Bgt4pFk0QkOFM6s109eqA2OXiaEJEtUjT9DM
 jlV39FoRr2frfJgoGGz+WlziolfrB0OvpV0ZUqPIIp14wBu1utZMECU3I+IM1Qaij0qF8j27SHR
 7KhSBMvMFl/L+jes8lhOjaRIGG//T0f8eSKPaNkKdjz9JOxOFsMo1jwNInY6DT9qXro9osIHfeI
 QNHsxr4royr/WR+ThV3DvTyZlG9uWeurh6uCDsBwW4WSP7itdcBYgtMRKxlB2eziiiWdVcSAnH4
 yiWojqrTTMCllyd5Zbc7KflfZXZ9Fc7q2hgdAYhKZBKxvQfKyg9WXZF+TQn3TMr7DwPIRcM2mnR
 ehetXGgB05kDz6XiWND4+uQAmXssypID05qPxLb/bkwubJ/1oYzlzHsNR3jyP8irwcPv8lHK
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=68638bf8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=rUOfGwP2bptGRB5RNQ4A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1011 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010040

This patchset adds i3c controller support for the qualcomm's QUPV3 based 
Serial engine (SE) hardware controller. 

The I3C SE(Serial Engine) controller implements I3C master functionality
as defined in the MIPI Specifications for I3C, Version 1.0. 

This patchset was tested on SM8550 MTP device and data transferhas been
tested in I3C SDR mode.

Features tested and supported :
  Standard CCC commands.
  I3C SDR mode private transfers in PIO mode.
  I2C transfers in PIO mode.

Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
----
Link to V5: https://lore.kernel.org/all/20250420081530.2708238-1-quic_msavaliy@quicinc.com/

v5->v6 :
 - Cleaned up with the alignment and Addressed comments from Alok.
 - Kconfig change - Do not Depends on I3C. Follow same as other i3c controller drivers.
 - Probe : Do not set PM to active state as controller is not initialized yet.
 - Updated email domain from quicinc.com to oss.qualcomm.com.

Link to V4: https://lore.kernel.org/all/20250411113516.87958-1-quic_msavaliy@quicinc.com/
v4->v5:
 - Define macros value in lower case hex.
 - Removed unused macro SLV_ADDR_SHFT.
 - Used FIELD_PREP to write command into M_PARAM and removed CCC_HDR_CMD_SHFT macro.
 - Include units.h headerfile and use xHZ macros instead of local defined macro.
 - Changed PACKING_BYTES_PW to PACKING_BYTES_PER_WORD.
 - I3C_ADDR_MASK : Use I2C_ADDR_MASK instead of local define and maintain i3c purpose.
 - geni_i3c_clk_map: converted array initializations for frequency mapping as per C99 standard.
 - Removed bus NULL pointer check from geni_i3c_clk_map_idx() as it's not possible to NULL there.
 - inline functions set_new_addr_slot(), clear_new_addr_slot() and is_new_addr_slot_set().
 - geni_i3c_handle_err() : Added line space after each condition and removed %s from string print.
 - geni_i3c_irq() : Used hardcoded value 4 for sizeof(u32 val).
 - geni_i3c_irq() : simplified condition check and alignment with new variable fifo_read_status.
 - _i3c_geni_execute_command() : Reversed if and else block for natural positive look.
 - geni_i3c_perform_daa() : DCR, BCR, PID - used GENMASK and FIELD_PREP instead of manual shift.
 - geni_i3c_perform_daa() : Used parity8() function to simplify and add a comment for readability.

Link to V3: https://lore.kernel.org/lkml/20250403134644.3935983-1-quic_msavaliy@quicinc.com/T/
v3->v4:
 - Dropped "clock-names" property from dt-bindings as suggested by krzysztof.
 - Makefile: Correct order sequence for i3c-qcom-geni.c.
 - Indentation corrected around print statement.
 - geni_i3c_probe() : Exit with return 0 instead of ret for success.
 - Added sparse annotations around i3c_geni_runtime_get_mutex_lock()/_unlock().

Link to V2: https://patchwork.kernel.org/project/linux-arm-msm/cover/20250326141641.3471906-1-quic_msavaliy@quicinc.com/
v2 -> v3:
 - Removed "master" word from compatible and dt-bindings filename.
 - Changed compatible qcom,i3c-master to qcom,geni-i3c.
 - Renamed qcom,i3c-master.yaml to qcom,geni-i3c.yaml matchin to compatible name.
 - Removed const from compatible property from yaml.
 - Changed driver file name from qcom-i3c-master.c to i3c-qcom-geni.c.
 - Changed Kconfig and Makefile accordingly as per driver filename changes.
 - Changed se-clk to se inside devm_clk_get(&pdev->dev, "se-clk").
 - Removed "se-clock-frequency" read from DTSI and fixed frequency within driver.

Link to V1: https://lore.kernel.org/lkml/20250205143109.2955321-1-quic_msavaliy@quicinc.com/
v1-> v2 :
 - Removed bindings word from subject title of dt-bindings patch.
 - Use Controller name instead of Master as per MIPI alliance guidance and updated title.
 - Added description field for the i3c master into dt-bindings.
 - Changed title to "Qualcomm Geni based QUP I3C Controller".
 - Changed compatible to "qcom,i3c-master" matching dt-binding file and driver.
 - Changed "interrupts-extended" property to "interrupts" as suggested by krzysztof.
 - Dropped reg, clock minItems and added maxItems similar to other dt-bindings.
 - Removed clock-names property from dt-bindings suggested by Krzysztof, Bjorn.
 - Set "se-clock-frequency"  set it within drivers as suggested by Rob.
 - Removed "dfs-index" property and manage it within driver as suggested by Rob.
 - Removed "interrupts" maxItems as we need only 1 interrupt in this change.
 - Added comment for mutex lock mentioning purpose in sruct geni_i3c_dev .
 - Return with dev_err_probe() instead of error log and then return -ENXIO from probe().
 - Removed dev_dbg(&pdev->dev, "Geni I3C probed\n") print log as suggested by krzysztof.
 - Removed CONFIG_PM and else part around runtime PM operations following other drivers.
 - Removed Module alias MODULE_ALIAS("platform:geni_i3c_master").
 - Replaced MASTER with GENI in the Title of MAINTAINER file.
 - Removed duplications from the commit log and removed unwanted statement.
 - Formatted license and copyright similar to other files.
 - Removed SLV_ADDR_MSK and used FIELD_PREP/FIELD_GET instead of local bit shifting operations.
 - Used direct bit positions for each internal Error bit of DM_I3C_CB_ERR.
 - Removed Unused SLV_ADDR_MSK and added SLAVE_ADDR_MASK as GENMASK(15,9).
 - Renamed spinlock as irq_lock.
 - Removed dfs_idx from geni_i3c_dev and made it local inside qcom_geni_i3c_conf().
 - Use boolean cur_is_write instead of enum i3c_trans_dir/gi3c->cur_rnw.
 - Used DECLARE_BITMAP and related set/clear_bit APIs instead of manual operation.
 - Inline the error messages from geni_i3c_err_log directly to improve readability
   and avoid unnecessary jumps caused by the geni_i3c_err_code enum.
 - Converted clk_src_freq of struct geni_i3c_clk_settings to HZ.
 - Removed unwanted debug logs from geni_i3c_clk_map_idx().
 - clk_od_fld and itr renamed to clk_od_idx and clk_idx respectively to map actual usage.
 - Added se-clock-frequency to be read from DTSI, if none, then default to 100MHz source.
 - Changed Error log during bus_init() if OD and PP mode frequencies avaiable or not.
 - Used FIELD_PREP and standard BIT operations inside qcom_geni_i3c_conf() instead manual shifting.
 - Removed unnecessary parentheses from geni_i3c_irq().
 - Moved geni_se_abort_m_cmd() implementation to a new helper function geni_i3c_abort_xfer().
 - Removed unwanted reinitialization of cur_len, cur_idx, cur_rnw from _i3c_geni_execute_command().
 - Removed dev_dbg logs which were meant for developmental debug purpose.
 - Removed unnecessary check nxfers <= 0 from geni_i3c_master_priv_xfers().
 - Replaced devm_kzalloc() by kzalloc() inside geni_i3c_master_attach_i2c_dev() to use
   kfree() from counter function geni_i3c_master_detach_i2c_dev().
 - Replaced devm_kzalloc() by kzalloc() inside geni_i3c_master_attach_i3c_dev() to use
   kfree() from counter function geni_i3c_master_detach_i3c_dev().   
 - Removed geni_i3c_master_reattach_i3c_dev() function as default returns 0.
 - Removed goto label from geni_i3c_master_bus_init() by reorganizing internal code.
   Also used i3c_geni_runtime_get_mutex_lock()/unlock() instead of get_sync() similar to other places.
 - Added indent to fallthrough for switch cases inside geni_i3c_master_supports_ccc_cmd().
 - Renamed i3c_geni_rsrcs_init() to i3c_geni_resources_init().
 - Changed devm_ioremap_resource() to devm_platform_ioremap_resource(), removed platform_get_resource().
 - Replaced dev_err() with dev_err_probe() for core clock named se-clk.
 - Removed development debug prints for votings from gi3c->se.icc_paths.
 - Probe(): Changed all dev_err() to dev_error_probe() with proper log messages.
 - Probe(): Moved static resource allocation immediately after gi3c object allocation.
 - Probe(): Disabled PM if i3c master registration fails during probe().
 - Remove(): Unregister master first and then added Disable of PM as opposite to probe().
 - Removed I3C_CCC_ENTHDR support as it's not supported.
----

Mukesh Kumar Savaliya (3):
  dt-bindings: i3c: Add support for Qualcomm I3C controller
  i3c: master: Add Qualcomm I3C controller driver
  MAINTAINERS: Add maintainer for Qualcomm's I3C controller driver

 .../bindings/i3c/qcom,geni-i3c.yaml           |   59 +
 MAINTAINERS                                   |    8 +
 drivers/i3c/master/Kconfig                    |   12 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/i3c-qcom-geni.c            | 1158 +++++++++++++++++
 5 files changed, 1238 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
 create mode 100644 drivers/i3c/master/i3c-qcom-geni.c

-- 
2.25.1


