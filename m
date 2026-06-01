Return-Path: <linux-arm-msm+bounces-110656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JNhCu3CHWrPdQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 19:35:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E3A62350B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 19:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6E403078351
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 17:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AF73DFC60;
	Mon,  1 Jun 2026 17:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XH1qp2Va";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GmmbIANO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21763DD87C
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 17:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780335074; cv=none; b=d7Cd0BZkfIgQ4++M8gHPeD48fTcha4hPkQHmDotrCNskABsjcvt2a1tBN1xnWjuOeZLrQRTI6HS7BF6S30M3stJvKazGwQRf4GuDDXErblejSP/8uU7HoQGvTXKJ48dHJs1WwOFRJmJByvJbYRyX35tMXNZ85he0jwm4vX4b3N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780335074; c=relaxed/simple;
	bh=7iP551rdIZqWRceuZPhGlp/X6IV7S6J757MfaV4YtJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ItRjAQZFzGWmyEA2YPqAqqrvLUBsV2oi8pSJSHXtCBDB5AFuVvJZYk6+c0oENigFJL/mSxk4HzKNWlkfolwOmmfd0CZgq7m2kfVq1gFfG1Rs7w000SwUMNWCTakXwQ2RzHzRkeR0XxTQK1JSL69uyvr8LWrbDN8dI+iJD5T4KdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XH1qp2Va; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GmmbIANO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651CcW8m600489
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 17:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NAzujdDV7tIM1fqduKpVYcQ2/xyyEKE8IHJ1qImwK3U=; b=XH1qp2VaLZHzLMA3
	6JV+N5VKSxcv/Gb7HJP2ZX3MhxOeV57KOk5oL+4v9xOjOQWXkkbTslIpIc2Vv0xj
	PD702yxjfVSACfvEwqmg9SmDOw2NV7efHL06U47OMwnSyUGEOR1bf98hobwZbP77
	YDCoDXmi09J/EHTw/rW1GPMuYU1eMIoZFSrFh/h109tzAOAtLXOkRyehq8RVxxue
	h4ylUsXb2JzK8jRSYQ08E8jcg1a1oDbOpaKQM829RbJdJWxNxXCksMUNZcb8XuGr
	v5bVV9kkyl9iGRWW9E9PCZgOCfy+5/fZht6Lf1eumcqz4cHzUTOOhf25n7gR/KyD
	ejenxg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eha8r9905-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 17:31:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a298cd62so1070608a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 10:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780335071; x=1780939871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAzujdDV7tIM1fqduKpVYcQ2/xyyEKE8IHJ1qImwK3U=;
        b=GmmbIANOvhA4zyKSWdvU3LHW3y0pVSW5DdxObIvdfguOEIjLXnb3t0sRb2EQ0L2SET
         LR0wwKorUcBKSQeqmr8oSIzOsXSCdl58YmESZFrawbDP6zh5Pr2rtrwG5spTBl2ENLm8
         hy10epiGfk0NjXun6vp8N/x47RjZZiWnuZjGm4ICUcaa3YRMuckQ5UyJqvTHhQJfFo4X
         5bDDJOeWyDv4Y4nDLewbgw/tgXNRPIbKyTb/+++nlEfflg7nZoBrq1D04vRXSQTMu8W5
         nIqB53vmviZ5JLTvikqGARlfydmhL1QD1FU1OJGq+39UEJsXGZtCFOYBmfQ4VdJTK/3/
         oiPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780335071; x=1780939871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NAzujdDV7tIM1fqduKpVYcQ2/xyyEKE8IHJ1qImwK3U=;
        b=Anb0aC7ZQVx7+6TEV4PLAcaQFkJUOkL87O81GSSV30gzpW1ccaNCJY3pGTq0M/pZ5k
         QzrR1pXjlSK5EfaCYCNlq1hw+Ng9ccjwQgYszCKZbuJfNWtTehaSiX9BArd383AmJ6Gk
         mL3hXtlyXTzv6oUCKPJ/p5/3TFnyy8Ue1a+2Y9pbXRCVAhSSmzZ6SLxiFjSEMPc662YT
         L+ufEaYH3lpCzzLJH42MUeQIxqQAkSzHDM0OBvKtoh5erB7ZRgEFWBJFeCTU7QJuPqhE
         ZH400SV/cSH7aByvB+baaigR4YcD4rYvhwfQi8r0wCuyAA/umI+fjE/K4+k+tOFOafOC
         qlSg==
X-Gm-Message-State: AOJu0YxUu7y6YmI3glU/wCb3FH9OwejYVOAh+DirnqLKc3fPK0hqYWgT
	XEnZvRNk9mMWDdvwshhHIKw8C3veo9SvJRtOMtcD+ErGvoxZKdT2fQhY7/UbIzrv5E5Rx5rpyMQ
	pRMqj3r9za5zmCyjWdHG7lY8zRVPAqIzfWmmwYZSnZqH182cNpLdOAs46bkq0kA9fwZKA
X-Gm-Gg: Acq92OHeinD/wHu5mXAFHp9ALcr7V4AILIk6j0A2N3100YV5H0Wic+fmJk4VFmZdLhw
	snQl2996pTjG9jzJ/UHKRbmATiVD6lDuTv1BCZOUQd4IxqmTG6xcI+9HYbINdUcOAzcxyx/e9e9
	zhMYopTWtipHTWJia6HXLJzNR64FW9z/iNTsOwTz+SPNtuv1oRWvV0WxozwoDRlczPJfSt4yHcu
	lIgZt8h3WW8Glo+IrtSx7kWypDdktRYcYrZgnJMlmdf+nsiU9Y+5WNQhdSSPfAPi33nXcRzL0Ke
	OUtf5R9NBHkW92e05W+NRxsreuJBuP9dFYRZC4Gtfl8znkCDwKOzQ5zBSBS2u8T/rCUKaKYnBWA
	WgzKXcTy2pbnmyjo8db/ZlRJjuCCP9RKErkyMcKD0Z9uCL+79e9CjFQmupDonRuwad0g=
X-Received: by 2002:a17:902:ea0a:b0:2c0:ccdb:e023 with SMTP id d9443c01a7336-2c0ccdbe53cmr76671015ad.17.1780335070727;
        Mon, 01 Jun 2026 10:31:10 -0700 (PDT)
X-Received: by 2002:a17:902:ea0a:b0:2c0:ccdb:e023 with SMTP id d9443c01a7336-2c0ccdbe53cmr76665545ad.17.1780335063631;
        Mon, 01 Jun 2026 10:31:03 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011f7sm149136085ad.41.2026.06.01.10.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:31:03 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 22:59:46 +0530
Subject: [PATCH v2 3/3] phy: qcom: qmp-pcie: Add QMP PCIe PHY support for
 Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-eliza-v2-3-6b44c9c23d5e@oss.qualcomm.com>
References: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
In-Reply-To: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780335042; l=9259;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=7iP551rdIZqWRceuZPhGlp/X6IV7S6J757MfaV4YtJM=;
 b=rZJ/eG55S5EW1ShOqf9GbkFA2NOi/5FsJGM4wa2Vj+arOOuL62571uzvqZforQxiXDe+NH1tr
 LavIrc8URN5CCinLDlS/3XsDpMuiP3fDPh/hAAYA9DDAESzNMbgRxlz
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=aKnAb79m c=1 sm=1 tr=0 ts=6a1dc1df cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BvlutTLlwcMiLWs3sTYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Z5EAi4kNQF3f4ENpQsurPd2i7PAuZiyp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE3MyBTYWx0ZWRfX6my6nd1rlmfs
 ybVry7CFY9rU3qh8m7R93G6kGg3Px1bZSgcDF0OdXuRS3jZSlpEZB3OKaSi+wKycAJK9OVFyzeG
 ngmuHqWUhtRI/wW1wgnN5ClcM290YrQClbdvPgOEp2plobTPjzvZMo3bC/nTtIaflZgdcH3l7nn
 NpFE45PwE38VnIwH015MopDk1IE6/bpvu8ckT5gr677NdoAdK1PTcTmjijE13NpsHskGTGtS+RQ
 WGEjB9b5MxIJzIEe+VTta4SbRoDxH+VP5XJBmqRcDKqQCVDhzqAdWiXqmWwz4QDvZD1zqFjJKcF
 FuQrHq/Mi+OtnjExJmvCqWrLCX0jpERYQinACp+jSpx8QBTxSNWMjkg7AZYLO3YmUGgJrDDOhpU
 MKPyPzesu71ur1AgsUTL/9tbLBjLquklZ1t73BGk2i3j2Sta2TihALIOkvx3GRDerKlSA7oMUX5
 gHiqzE5f8NuN/IcGLFA==
X-Proofpoint-ORIG-GUID: Z5EAi4kNQF3f4ENpQsurPd2i7PAuZiyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010173
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110656-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 75E3A62350B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add QMP PCIe PHY support for the Eliza SoC. Introduce a new Gen3x1 PHY
configuration with Eliza-specific initialization tables, and reuse the
existing sm8550 Gen3x2 configuration for the Gen3x2 PHY instance.

Also add the missing QPHY_PCIE_V6_PCS_PCIE_INT_AUX_CLK_CONFIG1 register
definition to the PCIe V6 PCS header.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c        | 139 ++++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h |   1 +
 2 files changed, 140 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index fed2fc9bb311..257b4df965c3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -198,6 +198,112 @@ static const struct qmp_phy_init_tbl msm8998_pcie_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_SIGDET_CNTRL, 0x03),
 };
 
+static const struct qmp_phy_init_tbl eliza_qmp_gen3x1_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE1, 0x93),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORECLK_DIV_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE1, 0xb4),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0xf8),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x62),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CLK_ENABLE1, 0x90),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYS_CLK_CTRL, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CLK_SELECT, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADDITIONAL_MISC_3, 0x0f),
+};
+
+static const struct qmp_phy_init_tbl eliza_qmp_gen3x1_pcie_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_REFGEN_REQ_CONFIG1, 0x05),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_G3S2_PRE_GAIN, 0x2e),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_RX_SIGDET_LVL, 0x77),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_RATE_SLEW_CNTRL1, 0x0b),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_PCS_TX_RX_CONFIG, 0x0c),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_EQ_CONFIG2, 0x0f),
+};
+
+static const struct qmp_phy_init_tbl eliza_qmp_gen3x1_pcie_misc_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_PCS_PCIE_POWER_STATE_CONFIG2, 0x1d),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_PCS_PCIE_INT_AUX_CLK_CONFIG1, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_PCS_PCIE_RXEQEVAL_TIME, 0x27),
+};
+
+static const struct qmp_phy_init_tbl eliza_qmp_gen3x1_pcie_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_OFFSET_TX, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_OFFSET_RX, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_1, 0x15),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_4, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_PI_QEC_CTRL, 0x02),
+};
+
+static const struct qmp_phy_init_tbl eliza_qmp_gen3x1_pcie_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_FO_GAIN, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SO_GAIN, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_PI_CONTROLS, 0xf0),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SB2_THRESH1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_AUX_DATA_TCOARSE_TFINE, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_TX_ADAPT_POST_THRESH, 0xf0),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_VGA_CAL_CNTRL1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_VGA_CAL_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_GM_CAL, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_IDAC_TSETTLE_LOW, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_SIDGET_ENABLES, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_LOW, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH2, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH3, 0xb7),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH4, 0xea),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_LOW, 0xdc),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH, 0x5c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH2, 0x9c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH3, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH4, 0x89),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_10_HIGH, 0x94),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_10_HIGH2, 0x5b),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_10_HIGH3, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_10_HIGH4, 0x89),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_SIGDET_CAL_TRIM, 0x08),
+};
+
 static const struct qmp_phy_init_tbl ipq6018_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_PER1, 0x7d),
 	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_PER2, 0x01),
@@ -3532,6 +3638,33 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
 	.txrxz      = 0xd000,
 };
 
+static const struct qmp_phy_cfg eliza_qmp_gen3x1_pciephy_cfg = {
+	.lanes = 1,
+
+	.offsets		= &qmp_pcie_offsets_v5,
+
+	.tbls = {
+		.serdes			= eliza_qmp_gen3x1_pcie_serdes_tbl,
+		.serdes_num		= ARRAY_SIZE(eliza_qmp_gen3x1_pcie_serdes_tbl),
+		.tx			= eliza_qmp_gen3x1_pcie_tx_tbl,
+		.tx_num			= ARRAY_SIZE(eliza_qmp_gen3x1_pcie_tx_tbl),
+		.rx			= eliza_qmp_gen3x1_pcie_rx_tbl,
+		.rx_num			= ARRAY_SIZE(eliza_qmp_gen3x1_pcie_rx_tbl),
+		.pcs			= eliza_qmp_gen3x1_pcie_pcs_tbl,
+		.pcs_num		= ARRAY_SIZE(eliza_qmp_gen3x1_pcie_pcs_tbl),
+		.pcs_misc		= eliza_qmp_gen3x1_pcie_misc_pcs_tbl,
+		.pcs_misc_num		= ARRAY_SIZE(eliza_qmp_gen3x1_pcie_misc_pcs_tbl),
+	},
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= pciephy_v6_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+};
+
 static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -5399,6 +5532,12 @@ static int qmp_pcie_probe(struct platform_device *pdev)
 
 static const struct of_device_id qmp_pcie_of_match_table[] = {
 	{
+		.compatible = "qcom,eliza-qmp-gen3x1-pcie-phy",
+		.data = &eliza_qmp_gen3x1_pciephy_cfg,
+	}, {
+		.compatible = "qcom,eliza-qmp-gen3x2-pcie-phy",
+		.data = &sm8550_qmp_gen3x2_pciephy_cfg,
+	}, {
 		.compatible = "qcom,glymur-qmp-gen4x2-pcie-phy",
 		.data = &glymur_qmp_gen4x2_pciephy_cfg,
 	}, {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h
index 45397cb3c0c6..17a0f9d18acf 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h
@@ -12,6 +12,7 @@
 #define QPHY_PCIE_V6_PCS_PCIE_POWER_STATE_CONFIG2	0x0c
 #define QPHY_PCIE_V6_PCS_PCIE_POWER_STATE_CONFIG4	0x14
 #define QPHY_PCIE_V6_PCS_PCIE_ENDPOINT_REFCLK_DRIVE	0x20
+#define QPHY_PCIE_V6_PCS_PCIE_INT_AUX_CLK_CONFIG1	0x54
 #define QPHY_PCIE_V6_PCS_PCIE_OSC_DTCT_ACTIONS		0x94
 
 #define QPHY_PCIE_V6_PCS_LANE1_INSIG_SW_CTRL2		0x024

-- 
2.34.1


