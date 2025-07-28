Return-Path: <linux-arm-msm+bounces-66943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AD6B14486
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 00:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07C573AAC32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 22:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17F6234963;
	Mon, 28 Jul 2025 22:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Bb6GNomM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CFE233735;
	Mon, 28 Jul 2025 22:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753743464; cv=none; b=uFP2GfX49x2zQ6gIDrwlYdpD9awoaIY3m75hDgWlyE0nBqSqB/PS7QIini567g7sUB8jhbNzOvf3xyDivVJ6hCFBVdPTWMAPURx/CaAiR5qBzto1R9NSjde6A2gDHoAf9R9NsGWrXIl6x3q9Be6urqnTca16L9d6noMPbg04ii8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753743464; c=relaxed/simple;
	bh=KrfPeIxLtzassEdgVe7fa0hfKzDapdtLqh2MxlQhWa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iPFiK7cfH1c5t42zV55cn0IpaDL97/AsuBt2A0X8vISmCSQr8gFLK0A3H0pmD/kFO9e19toTrtV3vU4fkwLVhdwIYG5O9s1OHuZntMkS66AEx70CrxuzK/ztHS64FB2zxcdD30IZ02OlFYhDZSKlcAha2ka3VLh1nk7f29SC8uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Bb6GNomM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SLQKQ5018874;
	Mon, 28 Jul 2025 22:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xD8cQ7yn9XFz5hkimuyli8cnaasnhtvgIf1
	9viUxqmM=; b=Bb6GNomMFtlyZjMK1ON3S0+1Zz+yMQLCzYJYWy0slA8MM4f6T97
	xmciZw9LugtT00nM3O33EsLLIwetvCbCydbJ6/mc+AVCHjTfTKnThh6TIILR+H65
	cZZdxaIQ0JzpICtelL7873qXJD2iIec0gCm8LNU/VgQ0N4Pj5Pa7qTFu20QPX1Iv
	1k6FLRaiMcdxSn4mx7UH2f8YzYYrS0se/nw1G9ztA8kjgklUnc9PT5p7JcPmqemV
	WNBw9IH/2G2kavkpdGrrNMoJTHLTL+6XtH0ers/P8LIhvucpRgNOse+OzYTR/i4r
	OiMUm7hu4x+GAdwGyXjcrnDwW8asDZJj9Ug==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q85x4jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 22:57:24 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56SMvJw8002507;
	Mon, 28 Jul 2025 22:57:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4859be3d6g-1;
	Mon, 28 Jul 2025 22:57:19 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56SMvJZh002502;
	Mon, 28 Jul 2025 22:57:19 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 56SMvJPI002500;
	Mon, 28 Jul 2025 22:57:19 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 98715571886; Tue, 29 Jul 2025 04:27:18 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        James.Bottomley@HansenPartnership.com, huobean@gmail.com,
        mani@kernel.org, martin.petersen@oracle.com, beanhuo@micron.com,
        peter.wang@mediatek.com, andre.draszik@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>,
        Palash Kambar <quic_pkambar@quicinc.com>
Subject: [PATCH V1] ufs: core: Fix interrupt handling for MCQ Mode in ufshcd_intr
Date: Tue, 29 Jul 2025 04:27:11 +0530
Message-ID: <20250728225711.29273-1-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE3MSBTYWx0ZWRfXy1QyKOAt8Q7I
 NSVlT4yLPXK7l7ZwGqu/Mx1I2nmivT4uAOwKEF9bdNWFXhymvdGeycLHK/Rlr5KhxOVDk9MO22G
 1B/Rp+0YRXyz5JLoCstR24JT9bXjPNx+9WvDI7s4hL1j4kEJHIF2LPriYLRQ/bR4iKqd40QmUlR
 29fbj6xJ42k+CfKngVvCtV8XYUsII1UGKc9+z/qwtnsvClkM/kB2mkwXOaveAeytrEZ5MmCrQ+t
 OncucR6XfM6OhCs3SKHz5gdz/SiUIlLLNgtl2GCd0u6/QNWquX8At5J22FVVyiV/5FLYv9qMZen
 FpoF2dootza6M68Xexl3DfXFLCvOs3vLSMRlGwK8oDZoPFdL3+4UfcuffPNiK9cvQSBbHeEgaV9
 oExiDSkO+Y1cKWucfA0CiLI8jBaWsp0+VSNYq85AQ58w/tuXUsHPq0EcltVlC/FrRpt+Gmjm
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=68880054 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=1I9EAur-ZsVtEViakn4A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 53dTJx-iZAk_yhB8odWdff8deSOSR81w
X-Proofpoint-GUID: 53dTJx-iZAk_yhB8odWdff8deSOSR81w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_04,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280171

Commit 3c7ac40d7322 ("scsi: ufs: core: Delegate the interrupt service
routine to a threaded IRQ handler") introduced a regression where
the UFS interrupt status register (IS) was not cleared in
ufshcd_intr() when operating in MCQ mode. As a result, the IS register
remained uncleared.

This led to a persistent issue during UIC interrupts:
ufshcd_is_auto_hibern8_error() consistently returned true because the
UFSHCD_UIC_HIBERN8_MASK bit was set, while the active command was
neither UIC_CMD_DME_HIBER_ENTER nor UIC_CMD_DME_HIBER_EXIT. This
caused continuous auto hibern8 enter errors and device failed to boot.

To fix this, the patch ensures that the interrupt status register is
properly cleared in the ufshcd_intr() function for both MCQ mode with
ESI enabled.

[    4.553226] ufshcd-qcom 1d84000.ufs: ufshcd_check_errors: Auto
Hibern8 Enter failed - status: 0x00000040, upmcrs: 0x00000001
[    4.553229] ufshcd-qcom 1d84000.ufs: ufshcd_check_errors: saved_err
0x40 saved_uic_err 0x0
[    4.553311] host_regs: 00000000: d5c7033f 20e0071f 00000400 00000000
[    4.553312] host_regs: 00000010: 01000000 00010217 00000c96 00000000
[    4.553314] host_regs: 00000020: 00000440 00170ef5 00000000 00000000
[    4.553316] host_regs: 00000030: 0000010f 00000001 00000000 00000000
[    4.553317] host_regs: 00000040: 00000000 00000000 00000000 00000000
[    4.553319] host_regs: 00000050: fffdf000 0000000f 00000000 00000000
[    4.553320] host_regs: 00000060: 00000001 80000000 00000000 00000000
[    4.553322] host_regs: 00000070: fffde000 0000000f 00000000 00000000
[    4.553323] host_regs: 00000080: 00000001 00000000 00000000 00000000
[    4.553325] host_regs: 00000090: 00000002 d0020000 00000000 01930200

Fixes: 3c7ac40d7322 ("scsi: ufs: core: Delegate the interrupt service routine to a threaded IRQ handler")
Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>

---
 drivers/ufs/core/ufshcd.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index fd8015ed36a4..5413464d63c8 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -7145,14 +7145,19 @@ static irqreturn_t ufshcd_threaded_intr(int irq, void *__hba)
 static irqreturn_t ufshcd_intr(int irq, void *__hba)
 {
 	struct ufs_hba *hba = __hba;
+	u32 intr_status, enabled_intr_status;

 	/* Move interrupt handling to thread when MCQ & ESI are not enabled */
 	if (!hba->mcq_enabled || !hba->mcq_esi_enabled)
 		return IRQ_WAKE_THREAD;

+	intr_status = ufshcd_readl(hba, REG_INTERRUPT_STATUS);
+	enabled_intr_status = intr_status & ufshcd_readl(hba, REG_INTERRUPT_ENABLE);
+
+	ufshcd_writel(hba, intr_status, REG_INTERRUPT_STATUS);
+
 	/* Directly handle interrupts since MCQ ESI handlers does the hard job */
-	return ufshcd_sl_intr(hba, ufshcd_readl(hba, REG_INTERRUPT_STATUS) &
-				   ufshcd_readl(hba, REG_INTERRUPT_ENABLE));
+	return ufshcd_sl_intr(hba, enabled_intr_status);
 }

 static int ufshcd_clear_tm_cmd(struct ufs_hba *hba, int tag)
--
2.48.1


