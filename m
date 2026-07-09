Return-Path: <linux-arm-msm+bounces-117861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zyVrEgNCT2oKdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:38:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE3372D3F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:38:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=B2fcfZb0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MkBALSkM;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117861-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117861-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26D4D3034522
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 06:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AF43AFD0D;
	Thu,  9 Jul 2026 06:35:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4623F3D3CE4
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 06:35:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578942; cv=none; b=dYKO47IpXvYcNqt50mUWLx5sNNRW8aBgWbM1nBAB6ekYW7oiR3gkf2A6pg8+/IV2EHQrG426JyrAk0D/lqkSmPWgwMssOxIBH5nzQGX/aGuHPRy46pRYg/8BmYwi+MQIoqGA4uvSC7Ji9to3u+KTDUvOt558ruCkqcMOvN/BSGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578942; c=relaxed/simple;
	bh=R0/W2Phyy79uouOevakF9zWVoE+R9xIaDHzt9TBuyms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UwMreX6LzAKAa57wCY485lykms72lpVcbMU0ZwW3IE9/G1SJokDXHMJBxDo0Q2Lizb2ldJW1z2wYQo5CY6DDEdZYdfpV4WZ7c+Qu4pdhuqYzgnZg69uuHBKlEkSkIbsiMvpo9IEWNSbt7y6OCB64vzlpDvNDufCaj/FovP0t8C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2fcfZb0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MkBALSkM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669602BP794116
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 06:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xozTUbTiSFMcUs0rkGns4SRkNmiUaXwEd6jRiqtON08=; b=B2fcfZb0aFCKdWVK
	MgNLx20GCw2EPsjCr+ORonFVi7CYw0SHtf8dKo4VhjyZrM/5Gv5fcqrUnQ+Mmqon
	nzBiHeYKcro771eSoRmo8vVCp9uIKMJVr42UM+IdRvaZtmFRdjWg4UrsW3hURNMZ
	pEkNUMiv4g2QAbK+yhuaggGZYTji9m+Q5NvDHt6whNQXL4pAsneLrPUA1kPvxCAj
	azNXh1KQfshB5FgwWL/K9JnzAQJD/h9ySocMqAnCD6J0IkDwFpo7iyHbrGZQp23i
	BSSM12AQqmPNWuQUz5dfD6Q7/rp7w+rB9TN14G1U2+4cvVRoqvjNV/w6Jz5MFwab
	/qogXg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1yds1bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:35:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a298cd62so1578055a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 23:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783578939; x=1784183739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xozTUbTiSFMcUs0rkGns4SRkNmiUaXwEd6jRiqtON08=;
        b=MkBALSkMaIf3GaUYaMAPa08VLXOUFhOaq0uK3MRBhTOKRVv+kLTZGiUa0r/LvHT7f0
         nWZqMlHYtHT4PVJEmcTitLsXT7DhOpdcZuUVfVJOJUr4rbWog2fjSIH4hJIRDuw6c2NV
         FTvZnEXzUKFA/8jTOHSECoBmhoxiq/zLlXF/WBDDnKAIzx9vgIl/UAa0M456u1fXcsul
         1anbqyoj7W/SsS6dWZKtICb4wY1EfYG0JIq4qoNJ6M5UtpiX9X2nz/vflCUpcvxWwEHG
         sgAAbnnm4XTx3D1zdLrmzzAzT+MTyXUquSZZDvDKF6qGkKH1rduOyAFh5YsmubTS1F8D
         XvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578939; x=1784183739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xozTUbTiSFMcUs0rkGns4SRkNmiUaXwEd6jRiqtON08=;
        b=KuXr4yZG/VM7kUhQnnkgTIK2IL8cfuwt1XPps0aDdH/QpTen7SBUT3IBJR62bXcgJi
         j007mtaVNj+7pdm3XJFQa3h1MOhxHEI1mvR/fw0yW4U/noQqc0eQ1KiYrOqZMcxT4gV+
         V9C8G6R6/VmBzfUL/oJLHBAIT+pMaFsTmibHKH0fcyhy41OkNze9DO7Zks4HuIwzlQoF
         q+rJ6rifX4axplcXP49xPBUVrm6x2qUsthuhV5VPk67mhbWZeMPu23cf8Q+wJN8uRtb2
         4cL9RXocRVzNOk1rIWNAxf1/6G2VSQ+kOCEE+eFCx16FPC2EY9II7sidD4X3SZgCCqbC
         YOFg==
X-Gm-Message-State: AOJu0Yx9Z+wgPV6u5Old9e4uyYy+vRyA6gXob6Q7iMuN6D85tZvXjGSD
	7BYA8m/lDQFoi02ALlw2yVWS4GsKZ2EnyzC8moUuC9mIAfn+oCmbTpbjbjq30XA6RyA5DX5lTyw
	q6YnyISgM+F9h/c+Xu5opf+ZpVmsPxk6tz90/qN+bjoHJCrVFoOhdMj1ky8pqRrSlpGyB
X-Gm-Gg: AfdE7cnF48v3SuuQd3Wt1AsITxMgwX/PX/f4UdMEdkEt/PPGBMKbrYkhEPb7qP//+RU
	5bKmwzUfE7GcC+jVCHPdfIhiKnVnAPKXDV5AqlGf3xasiPfrE+prO5NXyHIs1B6yLOpWYNv1gD+
	anrAD6U2ELli4Alf8lc3g2fuZY+Y0nuujrDRet6J9Gdy4Xmu3Wmtz740qYMqHfrFnioiPBpqs7v
	G2d07DFik0GvCqtC41B+Arx9Aj/HvRoetkKyWmb2Hx1zi6UWJgqKwORgzvovwYnOudGTVOsAuT5
	4YMNy9R3RmhBrxBhxUFa3XIi2HlPHd6epKCpfqpjmNI0bVYxYpkvgKGJ22j29IwVmuhMY6Bp7he
	8s12GPm0Mf5Tn2FKkiqOgr9sPnphVZfe4muDkQ9e+N3BDGg==
X-Received: by 2002:a05:6a20:918e:b0:3ba:f5c7:6bc3 with SMTP id adf61e73a8af0-3c0bce1eb32mr6762088637.10.1783578938527;
        Wed, 08 Jul 2026 23:35:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:918e:b0:3ba:f5c7:6bc3 with SMTP id adf61e73a8af0-3c0bce1eb32mr6762046637.10.1783578938071;
        Wed, 08 Jul 2026 23:35:38 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm28304294eec.16.2026.07.08.23.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:35:37 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 12:05:16 +0530
Subject: [PATCH v3 1/4] phy: qcom: qmp-pcie: Skip PHY reset if already up
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-link_retain-v3-1-81a9d187bb61@oss.qualcomm.com>
References: <20260709-link_retain-v3-0-81a9d187bb61@oss.qualcomm.com>
In-Reply-To: <20260709-link_retain-v3-0-81a9d187bb61@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578926; l=3603;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=R0/W2Phyy79uouOevakF9zWVoE+R9xIaDHzt9TBuyms=;
 b=zmgyhFhIkqGdHGjvKKkpfEdJcW0Brt3sMmnEgbFi4QYkVK845RWPNhu/gAZx5mA8RaCPIKD4g
 ZJcafkp+02wD4pfenTOgkkKbVRS0aSH8uswmthN8/DX9H4SZDn/PofQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2MCBTYWx0ZWRfXx2QRK/X4a3rp
 Rg3hRl+2ZYvEcON04fkgiY+bnApM67ySB9uw1K79tQz3i6rsHYW6YSqhlhxzz5wEzXsekoO2zJU
 pqQMv1LT8jPFIR39PRNkf0aWEIx6SFA=
X-Proofpoint-ORIG-GUID: j22lZouygQfpbYRv8P4lF2BTEPdd4xVO
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f413b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Y7qMJ73t9LdsiZx4VnoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: j22lZouygQfpbYRv8P4lF2BTEPdd4xVO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2MCBTYWx0ZWRfX4fFLkZaGcT4g
 IrWjkwbQCvTn1UYq9bxtstCkoblwTD5XD5AEraVRAQwzJqXTU+FHpZfZWCDbMn65cm3fAnirUnX
 wh6PLA5FkliJb7olzPWyPEBiXl8RymFw9TCIDVSEu8ovgFTJG1VHKJQeJk86BaKxjhG86TktmSm
 SDQhoAzUhyC3Pe71RlH0GRU2bkXUdmaPVn7/LteHejHf09UZlNoxzz5VZsVPNEEwnBzcpLjytz6
 yAgd4WLYjRJAVN0kazDaowFLJxbV1r09WHuBBHSn7l63x13mi98UIbUFFt41NBxN8jftRPJIIBf
 WZi3pIdVHpw99SHEr/me2LT6k2qb9vVaectytFsw0fYhPxYtXTe7v3T3sDEbiwJj/p3VDOOKwLn
 excVtULxfukY2+sH61Ed3EgWUrMeCd24KjF7BKF6frig1sMKZ4imEnqZrrLhNjvPxXfQIAif/dg
 ywZoqlLZXpBKmRMT+Fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117861-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:p.zabel@pengutronix.de,m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:qiang.yu@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,pengutronix.de,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AE3372D3F1

If the bootloader has already powered up the PCIe PHY, performing a
full reset and waiting for the PHY to come up again adds unnecessary
delay during boot.

Extend the existing skip_init handling by introducing a skip_reset
condition. When skip_init is active and the PHY status indicates that
the PHY is already operational, skip asserting and deasserting the
no-csr reset while still enabling the required resources during
power-on.

This allows reusing the bootloader-initialized PHY state and avoids
redundant PHY reinitialization and PCIe link retraining, which can
add hundred's of milliseconds of delay.

This relies on the assumption that when skip_init is enabled and the
PHY is reported as up, the bootloader has already configured the PHY
correctly and the link is in a usable state.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index d3effad7a074..49e10151cb1e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -4862,6 +4862,7 @@ static int qmp_pcie_init(struct phy *phy)
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *pcs = qmp->pcs;
+	bool skip_reset;
 	int ret;
 
 	/*
@@ -4877,6 +4878,9 @@ static int qmp_pcie_init(struct phy *phy)
 		qphy_checkbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START) &&
 		qphy_checkbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], cfg->pwrdn_ctrl);
 
+	skip_reset = qmp->skip_init && !qphy_checkbits(pcs, cfg->regs[QPHY_PCS_STATUS],
+							    cfg->phy_status);
+
 	if (!qmp->skip_init && !cfg->tbls.serdes_num) {
 		dev_err(qmp->dev, "Init sequence not available\n");
 		return -ENODATA;
@@ -4900,13 +4904,15 @@ static int qmp_pcie_init(struct phy *phy)
 		}
 	}
 
-	ret = reset_control_assert(qmp->nocsr_reset);
-	if (ret) {
-		dev_err(qmp->dev, "no-csr reset assert failed\n");
-		goto err_assert_reset;
-	}
+	if (!skip_reset) {
+		ret = reset_control_assert(qmp->nocsr_reset);
+		if (ret) {
+			dev_err(qmp->dev, "no-csr reset assert failed\n");
+			goto err_assert_reset;
+		}
 
-	usleep_range(200, 300);
+		usleep_range(200, 300);
+	}
 
 	if (!qmp->skip_init) {
 		ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
@@ -4956,8 +4962,11 @@ static int qmp_pcie_power_on(struct phy *phy)
 	void __iomem *pcs = qmp->pcs;
 	void __iomem *status;
 	unsigned int mask, val;
+	bool skip_reset;
 	int ret;
 
+	skip_reset = qmp->skip_init && !qphy_checkbits(pcs, cfg->regs[QPHY_PCS_STATUS],
+							    cfg->phy_status);
 	/*
 	 * Write CSR register for PHY that doesn't support no_csr reset or has not
 	 * been initialized.
@@ -4981,10 +4990,12 @@ static int qmp_pcie_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = reset_control_deassert(qmp->nocsr_reset);
-	if (ret) {
-		dev_err(qmp->dev, "no-csr reset deassert failed\n");
-		goto err_disable_pipe_clk;
+	if (!skip_reset) {
+		ret = reset_control_deassert(qmp->nocsr_reset);
+		if (ret) {
+			dev_err(qmp->dev, "no-csr reset deassert failed\n");
+			goto err_disable_pipe_clk;
+		}
 	}
 
 	if (qmp->skip_init)

-- 
2.34.1


