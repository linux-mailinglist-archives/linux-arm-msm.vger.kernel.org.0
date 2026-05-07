Return-Path: <linux-arm-msm+bounces-106254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gE24Fe4v/GmNMgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:23:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FE34E36C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56A8C30065CC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004A131CA4E;
	Thu,  7 May 2026 06:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j6RXgM43";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KY8Tk4/y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0652033A00C
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135020; cv=none; b=HCgjFP6XzRj0uPsyve3UiRGo2AYNoaIt2gfw6GDOLQKx1sA0U5oUgVLW4pgrk0atL0WG5hTVX9tOkHsu7D5VJHDEZ2wqF05a8FaYnmOhn1SKOCjZQL9RcfJe43/OZl5V1ZXricm3ZKGuTB6eu1Bw2MEdUmX6snX/sHf3Os7oJtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135020; c=relaxed/simple;
	bh=qH1EECkfV5dSUSn+3CyCymN42W5DClqUc7OFgZ4bit8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bkwglXCMmXlnxEV4KL8lwi3DN2Yzzhq551+2Yce5t4UUXvRAVXtqT11Okjp3+vQVUQiah1DBzRmbiPf2sjV5l4+HLCWm1Aq9sZFaDrEw/vMmikQx0uYkavMURiMXb6n4qOAa2AALi5VPBa5PlXa22PnYszTVwSfEPz5irug/py4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j6RXgM43; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KY8Tk4/y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eAJ31669568
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wK+VPxS1WMC
	koCtlXUJwjPjfsGMnoXZIW25/EUsmO/Q=; b=j6RXgM430T1DeX9MlIm3rYMUjUY
	jgiKzaybtjEhce4dvZ9SOyw6Qr9EYi4vwcjdN3jpgAHivHwkKvYTLJrGiwtuxeiv
	hJy9XzSVKNGIqCeCP/eeMEysrBRaBhSueU6/zplWyUBeOkSc5FkfmL6acn7q3i+d
	Uy4qyPxOsSNPaieSn9SrM96mZO2nWpxcFbo37TDZDPG1gNpOaRm5YXLRkHvoPCFM
	yOLEM2zGcAs85AvHRbD0c25sHJqTtCzU8k49hy0nYI3erQVO5urC4d810HEsTokf
	EPIMziKyCx+g5IbJTKzcVYVVrfShn5thRn6eyyRCVAamDZlrQ42q9YFG6Jw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p0g1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:23:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-837d0d71c61so284316b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778135012; x=1778739812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wK+VPxS1WMCkoCtlXUJwjPjfsGMnoXZIW25/EUsmO/Q=;
        b=KY8Tk4/yrSqNOJzsA8S+cBuo5rCGXZ4kmLQSMhoXc4WN5PHRXZXwy42x0foJWPMYIm
         k7RwpPnVAf9pBspPsJJKv+HXKwQDvSXXFYKWYiv2H3PKu4PqEB0Zq/KUZ2N1OOVbxQOP
         bnR8P1b13VxMSly4UWLUbB7RrwAhN68fIcqiwaQ+BdMDXo/zcCOWcIegwtuavXsaRI7E
         Lv0E3kEiG26J6er8M4wuZ9o/3v4usEN7V6RCDD1V1gXC1glr6IKCMs1CaJWZ9I6yV/MI
         5rf+Q4GMrgi54A07fA3diS2XkbEXf8fdrP7qFsCkPSXGiQNYuhPqsTyvSGUulRMI/VZP
         QKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778135012; x=1778739812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wK+VPxS1WMCkoCtlXUJwjPjfsGMnoXZIW25/EUsmO/Q=;
        b=LuqJlvaND+4oIJLwWTauk78q3wGbbettPhUQoCkzI8dOhecke/C//4FKYQy22+Ej1T
         gUaC95G/3mHpGCPa5D/eo9Dvrhkp5b8RavfPc9VG5H+Qrc3W9rpTje/rfw/WLpx8GFZU
         jVjA7cDxLV3qDh9jljQlGGA7lFShrZlnXQBAK1JdxjmmobaRK0zKQ2s5Q/5iCBNE3s4X
         pDIHQLY4PMUrD0UkB8EPPmeVQ7mA9wgqJZtz7vMwYSBF1ReEY1Qye417I9scJAjk4rvV
         /2H1LETZz4Ewt/IqWAPTmVOhQQ/9NrPXaV/GId8zvQECyzdiB3FX3HQ8MlvWVmC13/Lp
         XwrA==
X-Gm-Message-State: AOJu0Yyz+R7nZhyehp4dXMhd2NlK06QWEg6MLKpuYf2WM5jdmG0564v9
	znPG/SvXoP6xZzXwkrXwYyHmq3jM6BYr0AdOIs2bieUzRjNWTNo+YLjJllW1RE5iduOEXQ7cKD9
	N6Vw2s3KnspkRoUXkFt8CDH/S1g5uDmf+o3spFU8JPXCvXpju2AoK8EiURqYrT0NWJge1
X-Gm-Gg: AeBDietJLVes3d3Pvko7vlteOIOb654fJGKkPXVIVnnrBcSzC8zmmawlcZV++kBSIsz
	JUdO93lnBjso6aZ5w6HWT41UaILdN5dcpbFqFXdc8CQoXsxyH1d73Ixw2YeoJI1m+HRKbMLser9
	szh8l4Jw9/GS+twSa9L6fbEzzyTnT2eQF9VQBN7JMGYgyW+6mqHRTaWRg60edL7CZgNWMBXFJQr
	S/S0N1O+HiLPSq3c9gBn3oXRoXXiNhQWnduGDoEOJ0YY2qihXLbtuRfCZLAyvzp8bHeV/67Z1RD
	ynuTypa5MVJLWkIexjZ04YcZHqkIT7f/hr12SBRTsySzRwGX/TS/CDh95ltcumq46X2MDTYazal
	dWagvT4zLZEgr/4zLY0DrvYRG27ArCnBJ/QdPfihlFpk8k9brzvfzQ8AmnUIsNy99CmQxEohd/5
	zCflvgMMR4IGACNGGbTv3TUiM3MpkzVsEhTidIqPcujwDeETk=
X-Received: by 2002:a05:6a00:4b06:b0:82c:6f07:299f with SMTP id d2e1a72fcca58-83a5bfc2192mr6138621b3a.14.1778135011137;
        Wed, 06 May 2026 23:23:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b06:b0:82c:6f07:299f with SMTP id d2e1a72fcca58-83a5bfc2192mr6138564b3a.14.1778135010425;
        Wed, 06 May 2026 23:23:30 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945101sm7346557b3a.13.2026.05.06.23.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:23:30 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: cristian.marussi@arm.com, sudeep.holla@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        jonathanh@nvidia.com, thierry.reding@kernel.org, digetx@gmail.com,
        conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>,
        Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>,
        Amir Vajid <avajid@quicinc.com>
Subject: [RFC V6 6/8] PM / devfreq: Introduce the QCOM SCMI Memlat devfreq device
Date: Thu,  7 May 2026 11:52:35 +0530
Message-Id: <20260507062237.78051-7-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MCBTYWx0ZWRfX/ZIoPVZq0h9m
 ukh30HU/k6tFEzj2zcLR8+adYiCi2yS8pVlt/ojsTZQIDKY/tAmFOgWlj9Soa83wvh4SBT4XQJm
 RU5kxMJaAUEixpIs56PquE0r1o2IYClPxZBF3pCnItQ84OLe3BnQo7j8dDq1LxHHFv3c8h+WbX9
 H29X/wbXB7GD2GWoL0iNa9z8gzmtFQ9J1NCzIY5mp/KERUscBEXtG5JUcHrLloXh2KEGkHkB9vi
 0r2lW9F8i3Wax2uiV+j7aezT+BjReeP++dJETAyPM6++D+Ead5m3zbEM9EXAS4MRHEuuRpRGkUm
 jP2L+oX/gDkokZkklheyFIsYaJvdqoeRYwBUGuHxTxOV/Zi+9KkQEK0jqtYt5SSWIVcDxa+1qQ9
 hAr6o2zrDmB4QJCpU6FmACWocr/5aVPgIvqYG8LN5a+23Npc5zWR7n2FP4Q2Tfa8IAALpEI9eee
 36VuncfCDAvMVc/smPg==
X-Proofpoint-GUID: L2vZaTNMMqVY16LmYJXROmIy1MOHx8ej
X-Proofpoint-ORIG-GUID: L2vZaTNMMqVY16LmYJXROmIy1MOHx8ej
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fc2fe8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=iu2ft60PGK6uEemCoLAA:9 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070060
X-Rspamd-Queue-Id: 07FE34E36C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,nvidia.com,kernel.org,gmail.com,quicinc.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-106254-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,quicinc.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Qualcomm Glymur and Hamoa SoCs, the memlat governor and the mechanism to
control the various caches and ram is hosted on the CPU Control Processor
(CPUCP) and the method to tweak and start the governor is exposed through
the QCOM SCMI Generic Extension Protocol.

Introduce the devfreq scmi client driver that uses the memlat algorithm
string hosted on QCOM SCMI Generic Extension Protocol to detect memory
latency workloads and control frequency/level of the various memory buses
(DDR/LLCC/DDR_QOS). The DDR/LLCC/DDR_QOS are modelled as devfreq devices,
with the governor set to remote devfreq governor. This serves as a way
to get a basic insight into the device operation through trans_stat and
provides for ways to further tweak the parameters of the remote governor.

Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
Co-developed-by: Amir Vajid <avajid@quicinc.com>
Signed-off-by: Amir Vajid <avajid@quicinc.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 drivers/devfreq/Kconfig                    |  13 +
 drivers/devfreq/Makefile                   |   1 +
 drivers/devfreq/scmi-qcom-memlat-cfg.h     | 473 +++++++++++++++++
 drivers/devfreq/scmi-qcom-memlat-devfreq.c | 582 +++++++++++++++++++++
 4 files changed, 1069 insertions(+)
 create mode 100644 drivers/devfreq/scmi-qcom-memlat-cfg.h
 create mode 100644 drivers/devfreq/scmi-qcom-memlat-devfreq.c

diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index 2caa87554914..98b5a50d3189 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -169,6 +169,19 @@ config ARM_SUN8I_A33_MBUS_DEVFREQ
 	  This adds the DEVFREQ driver for the MBUS controller in some
 	  Allwinner sun8i (A33 through H3) and sun50i (A64 and H5) SoCs.
 
+config SCMI_QCOM_MEMLAT_DEVFREQ
+	tristate "Qualcomm Technologies Inc. SCMI client driver"
+	depends on QCOM_SCMI_GENERIC_EXT || COMPILE_TEST
+	select DEVFREQ_GOV_REMOTE
+	help
+	  This driver uses the MEMLAT (memory latency) algorithm string
+	  hosted on QCOM SCMI Vendor Protocol to detect memory latency
+	  workloads and control frequency/level of the various memory
+	  buses (DDR/LLCC/DDR_QOS).
+
+	  This driver defines/documents the parameter IDs used while configuring
+	  the memory buses.
+
 source "drivers/devfreq/event/Kconfig"
 
 endif # PM_DEVFREQ
diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
index cde57c8cda76..b11f94e2f485 100644
--- a/drivers/devfreq/Makefile
+++ b/drivers/devfreq/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_ARM_MEDIATEK_CCI_DEVFREQ)	+= mtk-cci-devfreq.o
 obj-$(CONFIG_ARM_RK3399_DMC_DEVFREQ)	+= rk3399_dmc.o
 obj-$(CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ)	+= sun8i-a33-mbus.o
 obj-$(CONFIG_ARM_TEGRA_DEVFREQ)		+= tegra30-devfreq.o
+obj-$(CONFIG_SCMI_QCOM_MEMLAT_DEVFREQ)	+= scmi-qcom-memlat-devfreq.o
 
 # DEVFREQ Event Drivers
 obj-$(CONFIG_PM_DEVFREQ_EVENT)		+= event/
diff --git a/drivers/devfreq/scmi-qcom-memlat-cfg.h b/drivers/devfreq/scmi-qcom-memlat-cfg.h
new file mode 100644
index 000000000000..e56899489db4
--- /dev/null
+++ b/drivers/devfreq/scmi-qcom-memlat-cfg.h
@@ -0,0 +1,473 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __DRIVERS_DEVFREQ_SCMI_QCOM_MEMLAT_CONFIG_H__
+#define __DRIVERS_DEVFREQ_SCMI_QCOM_MEMLAT_CONFIG_H__
+
+/*
+ * Memlat Effective Frequency Calculation Method
+ * CPUCP_EFFECTIVE_FREQ_METHOD_0 - Uses CPU Cycles and CONST Cycles to calculate
+ * CPUCP_EFFECTIVE_FREQ_METHOD_1 - Uses CPU Cycles and time period
+ */
+#define CPUCP_EFFECTIVE_FREQ_CALC_METHOD_0	0
+#define CPUCP_EFFECTIVE_FREQ_CALC_METHOD_1	1
+
+#define EV_CPU_CYCLES		0
+#define EV_CNT_CYCLES		1
+#define EV_INST_RETIRED		2
+#define EV_STALL_BACKEND_MEM	3
+#define EV_L2_D_RFILL		5
+#define INVALID_IDX		0xff
+
+#define MEMLAT_ALGO_STR		0x4D454D4C4154 /* MEMLAT */
+
+struct scmi_qcom_map_table {
+	unsigned int cpu_freq;
+	unsigned int mem_freq;
+};
+
+struct scmi_qcom_opp_data {
+	unsigned long freq;
+	unsigned int level;
+};
+
+struct scmi_qcom_memory_range {
+	unsigned int min_freq;
+	unsigned int max_freq;
+};
+
+struct scmi_qcom_monitor_cfg {
+	const struct scmi_qcom_map_table *table;
+	const char *name;
+	u32 be_stall_floor;
+	u32 cpu_mask;
+	u32 ipm_ceil;
+	int table_len;
+};
+
+struct scmi_qcom_memory_cfg {
+	const struct scmi_qcom_monitor_cfg *monitor_cfg;
+	const struct scmi_qcom_opp_data *mem_table;
+	struct scmi_qcom_memory_range memory_range;
+	const char *name;
+	u32 memory_type;
+	int monitor_cnt;
+	int num_opps;
+};
+
+struct scmi_qcom_memlat_cfg_data {
+	const struct scmi_qcom_memory_cfg *memory_cfg;
+	u32 cpucp_freq_method;
+	u32 cpucp_sample_ms;
+	int memory_cnt;
+};
+
+static const struct scmi_qcom_opp_data glymur_llcc_table[] = {
+	{ .freq = 315000000 },
+	{ .freq = 479000000 },
+	{ .freq = 545000000 },
+	{ .freq = 725000000 },
+	{ .freq = 840000000 },
+	{ .freq = 959000000 },
+	{ .freq = 1090000000 },
+	{ .freq = 1211000000 },
+};
+
+static const struct scmi_qcom_opp_data hamoa_llcc_table[] = {
+	{ .freq = 300000000 },
+	{ .freq = 466000000 },
+	{ .freq = 600000000 },
+	{ .freq = 806000000 },
+	{ .freq = 933000000 },
+	{ .freq = 1066000000 },
+};
+
+static const struct scmi_qcom_opp_data glymur_ddr_table[] = {
+	{ .freq = 200000000 },
+	{ .freq = 547000000 },
+	{ .freq = 1353000000 },
+	{ .freq = 1555000000 },
+	{ .freq = 1708000000 },
+	{ .freq = 2092000000 },
+	{ .freq = 2736000000 },
+	{ .freq = 3187000000 },
+	{ .freq = 3686000000 },
+	{ .freq = 4224000000 },
+	{ .freq = 4761000000 },
+};
+
+static const struct scmi_qcom_opp_data hamoa_ddr_table[] = {
+	{ .freq = 200000000 },
+	{ .freq = 547000000 },
+	{ .freq = 768000000 },
+	{ .freq = 1555000000 },
+	{ .freq = 1708000000 },
+	{ .freq = 2092000000 },
+	{ .freq = 2736000000 },
+	{ .freq = 3187000000 },
+	{ .freq = 3686000000 },
+	{ .freq = 4224000000 },
+};
+
+static const struct scmi_qcom_opp_data glymur_ddr_qos_table[] = {
+	{ .freq = 1, .level = 0 },
+	{ .freq = 100, .level = 1 },
+};
+
+static const struct scmi_qcom_memory_cfg glymur_memory_cfg[] = {
+	{
+		.memory_type = 0,
+		.name = "ddr",
+		.mem_table = glymur_ddr_table,
+		.num_opps = ARRAY_SIZE(glymur_ddr_table),
+		.monitor_cnt = 4,
+		.memory_range = { .min_freq = 547000, .max_freq = 4761000},
+		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
+			{
+				.name = "mon_0",
+				.cpu_mask = 0x3f,
+				.ipm_ceil = 60000000,
+				.be_stall_floor = 1,
+				.table_len = 8,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 960, .mem_freq = 547000 },
+					{ .cpu_freq = 1133, .mem_freq = 1353000 },
+					{ .cpu_freq = 1594, .mem_freq = 1555000 },
+					{ .cpu_freq = 1920, .mem_freq = 1708000 },
+					{ .cpu_freq = 2228, .mem_freq = 2736000 },
+					{ .cpu_freq = 2362, .mem_freq = 3187000 },
+					{ .cpu_freq = 2650, .mem_freq = 3686000 },
+					{ .cpu_freq = 2938, .mem_freq = 4761000 },
+				}
+			},
+			{
+				.name = "mon_1",
+				.cpu_mask = 0xfc0,
+				.ipm_ceil = 60000000,
+				.be_stall_floor = 1,
+				.table_len = 8,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 356, .mem_freq = 547000 },
+					{ .cpu_freq = 1018, .mem_freq = 1353000 },
+					{ .cpu_freq = 1536, .mem_freq = 1555000 },
+					{ .cpu_freq = 1748, .mem_freq = 1708800 },
+					{ .cpu_freq = 2324, .mem_freq = 2736000 },
+					{ .cpu_freq = 2496, .mem_freq = 3187000 },
+					{ .cpu_freq = 2900, .mem_freq = 3686000 },
+					{ .cpu_freq = 3514, .mem_freq = 4761000 },
+				}
+			},
+			{
+				.name = "mon_2",
+				.cpu_mask = 0x3f000,
+				.ipm_ceil = 60000000,
+				.be_stall_floor = 1,
+				.table_len = 8,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 356, .mem_freq = 547000 },
+					{ .cpu_freq = 1018, .mem_freq = 1353000 },
+					{ .cpu_freq = 1536, .mem_freq = 1555000 },
+					{ .cpu_freq = 1748, .mem_freq = 1708800 },
+					{ .cpu_freq = 2324, .mem_freq = 2736000 },
+					{ .cpu_freq = 2496, .mem_freq = 3187000 },
+					{ .cpu_freq = 2900, .mem_freq = 3686000 },
+					{ .cpu_freq = 3514, .mem_freq = 4761000 },
+				}
+			},
+			{
+				.name = "mon_3",
+				.cpu_mask = 0x3ffff,
+				.table_len = 4,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 2823, .mem_freq = 547000 },
+					{ .cpu_freq = 3034, .mem_freq = 1555000 },
+					{ .cpu_freq = 3226, .mem_freq = 1708000 },
+					{ .cpu_freq = 5012, .mem_freq = 2092000 },
+				}
+			},
+		},
+	},
+	{
+		.memory_type = 1,
+		.name = "llcc",
+		.mem_table = glymur_llcc_table,
+		.num_opps = ARRAY_SIZE(glymur_llcc_table),
+		.monitor_cnt = 3,
+		.memory_range = { .min_freq = 315000, .max_freq = 1211000},
+		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
+			{
+				.name = "mon_0",
+				.cpu_mask = 0x3f,
+				.ipm_ceil = 60000000,
+				.be_stall_floor = 1,
+				.table_len = 7,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 960, .mem_freq = 315000 },
+					{ .cpu_freq = 1113, .mem_freq = 479000 },
+					{ .cpu_freq = 1594, .mem_freq = 545000 },
+					{ .cpu_freq = 1920, .mem_freq = 725000 },
+					{ .cpu_freq = 2362, .mem_freq = 840000 },
+					{ .cpu_freq = 2650, .mem_freq = 959000 },
+					{ .cpu_freq = 2938, .mem_freq = 1211000 },
+				}
+			},
+			{
+				.name = "mon_1",
+				.cpu_mask = 0xfc0,
+				.ipm_ceil = 60000000,
+				.be_stall_floor = 1,
+				.table_len = 7,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 356, .mem_freq = 315000 },
+					{ .cpu_freq = 1018, .mem_freq = 479000 },
+					{ .cpu_freq = 1536, .mem_freq = 545000 },
+					{ .cpu_freq = 1748, .mem_freq = 725000 },
+					{ .cpu_freq = 2496, .mem_freq = 840000 },
+					{ .cpu_freq = 2900, .mem_freq = 959000 },
+					{ .cpu_freq = 3514, .mem_freq = 1211000 },
+				}
+			},
+			{
+				.name = "mon_2",
+				.cpu_mask = 0x3f000,
+				.ipm_ceil = 60000000,
+				.be_stall_floor = 1,
+				.table_len = 7,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 356, .mem_freq = 315000 },
+					{ .cpu_freq = 1018, .mem_freq = 479000 },
+					{ .cpu_freq = 1536, .mem_freq = 545000 },
+					{ .cpu_freq = 1748, .mem_freq = 725000 },
+					{ .cpu_freq = 2496, .mem_freq = 840000 },
+					{ .cpu_freq = 2900, .mem_freq = 959000 },
+					{ .cpu_freq = 3514, .mem_freq = 1211000 },
+				}
+			},
+		},
+	},
+	{
+		.memory_type = 2,
+		.name = "ddr-qos",
+		.monitor_cnt = 3,
+		.mem_table = glymur_ddr_qos_table,
+		.num_opps = ARRAY_SIZE(glymur_ddr_qos_table),
+		.memory_range = { .min_freq = 0, .max_freq = 1},
+		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
+			{
+				.name = "mon_0",
+				.cpu_mask = 0x3f,
+				.ipm_ceil = 80000000,
+				.be_stall_floor = 1,
+				.table_len = 2,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 2362, .mem_freq = 0 },
+					{ .cpu_freq = 2938, .mem_freq = 1 },
+				}
+			},
+			{
+				.name = "mon_1",
+				.cpu_mask = 0xfc0,
+				.ipm_ceil = 80000000,
+				.be_stall_floor = 1,
+				.table_len = 2,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 2496, .mem_freq = 0 },
+					{ .cpu_freq = 3514, .mem_freq = 1 },
+				}
+			},
+			{
+				.name = "mon_2",
+				.cpu_mask = 0x3f000,
+				.ipm_ceil = 80000000,
+				.be_stall_floor = 1,
+				.table_len = 2,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 2496, .mem_freq = 0 },
+					{ .cpu_freq = 3514, .mem_freq = 1 },
+				}
+			},
+		},
+	},
+};
+
+static const struct scmi_qcom_memory_cfg hamoa_memory_cfg[] = {
+	{
+		.memory_type = 0,
+		.name = "ddr",
+		.mem_table = hamoa_ddr_table,
+		.num_opps = ARRAY_SIZE(hamoa_ddr_table),
+		.monitor_cnt = 4,
+		.memory_range = { .min_freq = 200000, .max_freq = 4224000},
+		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
+			{
+				.name = "mon_0",
+				.cpu_mask = 0xf,
+				.ipm_ceil = 20000000,
+				.be_stall_floor = 1,
+				.table_len = 6,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 999, .mem_freq = 547000 },
+					{ .cpu_freq = 1440, .mem_freq = 768000 },
+					{ .cpu_freq = 1671, .mem_freq = 1555000 },
+					{ .cpu_freq = 2189, .mem_freq = 2092000 },
+					{ .cpu_freq = 2516, .mem_freq = 3187000 },
+					{ .cpu_freq = 3860, .mem_freq = 4224000 },
+				}
+			},
+			{
+				.name = "mon_1",
+				.cpu_mask = 0xf0,
+				.ipm_ceil = 20000000,
+				.be_stall_floor = 1,
+				.table_len = 6,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 999, .mem_freq = 547000 },
+					{ .cpu_freq = 1440, .mem_freq = 768000 },
+					{ .cpu_freq = 1671, .mem_freq = 1555000 },
+					{ .cpu_freq = 2189, .mem_freq = 2092000 },
+					{ .cpu_freq = 2516, .mem_freq = 3187000 },
+					{ .cpu_freq = 3860, .mem_freq = 4224000 },
+				}
+			},
+			{
+				.name = "mon_2",
+				.cpu_mask = 0xf00,
+				.ipm_ceil = 20000000,
+				.be_stall_floor = 1,
+				.table_len = 6,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 999, .mem_freq = 547000 },
+					{ .cpu_freq = 1440, .mem_freq = 768000 },
+					{ .cpu_freq = 1671, .mem_freq = 1555000 },
+					{ .cpu_freq = 2189, .mem_freq = 2092000 },
+					{ .cpu_freq = 2516, .mem_freq = 3187000 },
+					{ .cpu_freq = 3860, .mem_freq = 4224000 },
+				}
+			},
+			{
+				.name = "mon_3",
+				.cpu_mask = 0xfff,
+				.table_len = 4,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 1440, .mem_freq = 547000 },
+					{ .cpu_freq = 2189, .mem_freq = 768000 },
+					{ .cpu_freq = 2516, .mem_freq = 1555000 },
+					{ .cpu_freq = 3860, .mem_freq = 2092000 },
+				}
+			},
+		},
+	},
+	{
+		.memory_type = 1,
+		.name = "llcc",
+		.mem_table = hamoa_llcc_table,
+		.num_opps = ARRAY_SIZE(hamoa_llcc_table),
+		.monitor_cnt = 3,
+		.memory_range = { .min_freq = 300000, .max_freq = 1067000},
+		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
+			{
+				.name = "mon_0",
+				.cpu_mask = 0xf,
+				.ipm_ceil = 20000000,
+				.be_stall_floor = 1,
+				.table_len = 6,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 999, .mem_freq = 300000 },
+					{ .cpu_freq = 1440, .mem_freq = 466000 },
+					{ .cpu_freq = 1671, .mem_freq = 600000 },
+					{ .cpu_freq = 2189, .mem_freq = 806000 },
+					{ .cpu_freq = 2516, .mem_freq = 933000 },
+					{ .cpu_freq = 3860, .mem_freq = 1066000 },
+				}
+			},
+			{
+				.name = "mon_1",
+				.cpu_mask = 0xf0,
+				.ipm_ceil = 20000000,
+				.be_stall_floor = 1,
+				.table_len = 6,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 999, .mem_freq = 300000 },
+					{ .cpu_freq = 1440, .mem_freq = 466000 },
+					{ .cpu_freq = 1671, .mem_freq = 600000 },
+					{ .cpu_freq = 2189, .mem_freq = 806000 },
+					{ .cpu_freq = 2516, .mem_freq = 933000 },
+					{ .cpu_freq = 3860, .mem_freq = 1066000 },
+				}
+			},
+			{
+				.name = "mon_2",
+				.cpu_mask = 0xf00,
+				.ipm_ceil = 20000000,
+				.be_stall_floor = 1,
+				.table_len = 6,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 999, .mem_freq = 300000 },
+					{ .cpu_freq = 1440, .mem_freq = 466000 },
+					{ .cpu_freq = 1671, .mem_freq = 600000 },
+					{ .cpu_freq = 2189, .mem_freq = 806000 },
+					{ .cpu_freq = 2516, .mem_freq = 933000 },
+					{ .cpu_freq = 3860, .mem_freq = 1066000 },
+				}
+			},
+		},
+	},
+	{
+		.memory_type = 2,
+		.name = "ddr-qos",
+		.monitor_cnt = 3,
+		.mem_table = glymur_ddr_qos_table,
+		.num_opps = ARRAY_SIZE(glymur_ddr_qos_table),
+		.memory_range = { .min_freq = 0, .max_freq = 1},
+		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
+			{
+				.name = "mon_0",
+				.cpu_mask = 0xf,
+				.ipm_ceil = 20000000,
+				.be_stall_floor = 1,
+				.table_len = 2,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 2189, .mem_freq = 0 },
+					{ .cpu_freq = 3860, .mem_freq = 1 },
+				}
+			},
+			{
+				.name = "mon_1",
+				.cpu_mask = 0xf0,
+				.ipm_ceil = 20000000,
+				.be_stall_floor = 1,
+				.table_len = 2,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 2189, .mem_freq = 0 },
+					{ .cpu_freq = 3860, .mem_freq = 1 },
+				}
+			},
+			{
+				.name = "mon_2",
+				.cpu_mask = 0xf00,
+				.ipm_ceil = 20000000,
+				.be_stall_floor = 1,
+				.table_len = 2,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 2189, .mem_freq = 0 },
+					{ .cpu_freq = 3860, .mem_freq = 1 },
+				}
+			},
+		},
+	},
+};
+
+static const struct scmi_qcom_memlat_cfg_data glymur_memlat_data = {
+	.memory_cfg = glymur_memory_cfg,
+	.cpucp_freq_method = CPUCP_EFFECTIVE_FREQ_CALC_METHOD_1,
+	.cpucp_sample_ms = 4,
+	.memory_cnt = ARRAY_SIZE(glymur_memory_cfg),
+};
+
+static const struct scmi_qcom_memlat_cfg_data hamoa_memlat_data = {
+	.memory_cfg = hamoa_memory_cfg,
+	.cpucp_freq_method = CPUCP_EFFECTIVE_FREQ_CALC_METHOD_1,
+	.cpucp_sample_ms = 4,
+	.memory_cnt = ARRAY_SIZE(hamoa_memory_cfg),
+};
+
+#endif
diff --git a/drivers/devfreq/scmi-qcom-memlat-devfreq.c b/drivers/devfreq/scmi-qcom-memlat-devfreq.c
new file mode 100644
index 000000000000..c75bfb16bb2b
--- /dev/null
+++ b/drivers/devfreq/scmi-qcom-memlat-devfreq.c
@@ -0,0 +1,582 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/cpu.h>
+#include <linux/devfreq.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_qcom_protocol.h>
+#include <linux/units.h>
+
+#define MAX_MEMORY_TYPES			4
+#define MAX_MONITOR_CNT				5
+#define MAX_NAME_LEN				20
+#define MAX_MAP_ENTRIES				10
+
+#include "scmi-qcom-memlat-cfg.h"
+
+/**
+ * enum scmi_memlat_protocol_cmd - parameter_ids supported by the "MEMLAT" algo_str hosted
+ *                                 by the Qualcomm Generic Vendor Protocol on the SCMI controller.
+ *
+ * MEMLAT (Memory Latency) monitors the counters to detect memory latency bound workloads
+ * and scales the frequency/levels of the memory buses accordingly.
+ *
+ * @MEMLAT_SET_MEM_GROUP: initializes the frequency/level scaling functions for the memory bus.
+ * @MEMLAT_SET_MONITOR: configures the monitor to work on a specific memory bus.
+ * @MEMLAT_SET_COMMON_EV_MAP: set up common counters used to monitor the cpu frequency.
+ * @MEMLAT_SET_GRP_EV_MAP: set up any specific counters used to monitor the memory bus.
+ * @MEMLAT_IPM_CEIL: set the IPM (Instruction Per Misses) ceiling per monitor.
+ * @MEMLAT_SAMPLE_MS: set the sampling period for all the monitors.
+ * @MEMLAT_MON_FREQ_MAP: setup the cpufreq to memfreq map.
+ * @MEMLAT_SET_MIN_FREQ: set the max frequency of the memory bus.
+ * @MEMLAT_SET_MAX_FREQ: set the min frequency of the memory bus.
+ * @MEMLAT_START_TIMER: start all the monitors with the requested sampling period.
+ * @MEMLAT_STOP_TIMER: stop all the running monitors.
+ * @MEMLAT_SET_EFFECTIVE_FREQ_METHOD: set the method used to determine cpu frequency.
+ */
+enum scmi_memlat_protocol_cmd {
+	MEMLAT_SET_MEM_GROUP = 16,
+	MEMLAT_SET_MONITOR,
+	MEMLAT_SET_COMMON_EV_MAP,
+	MEMLAT_SET_GRP_EV_MAP,
+	MEMLAT_IPM_CEIL = 23,
+	MEMLAT_BE_STALL_FLOOR = 25,
+	MEMLAT_SAMPLE_MS = 31,
+	MEMLAT_MON_FREQ_MAP,
+	MEMLAT_SET_MIN_FREQ,
+	MEMLAT_SET_MAX_FREQ,
+	MEMLAT_GET_CUR_FREQ,
+	MEMLAT_START_TIMER = 36,
+	MEMLAT_STOP_TIMER,
+	MEMLAT_SET_EFFECTIVE_FREQ_METHOD = 39,
+};
+
+struct cpucp_map_table {
+	u16 v1;
+	u16 v2;
+};
+
+struct map_param_msg {
+	u32 hw_type;
+	u32 mon_idx;
+	u32 nr_rows;
+	struct cpucp_map_table tbl[MAX_MAP_ENTRIES];
+} __packed;
+
+struct node_msg {
+	u32 cpumask;
+	u32 hw_type;
+	u32 mon_type;
+	u32 mon_idx;
+	char mon_name[MAX_NAME_LEN];
+};
+
+struct scalar_param_msg {
+	u32 hw_type;
+	u32 mon_idx;
+	u32 val;
+};
+
+enum common_ev_idx {
+	INST_IDX,
+	CYC_IDX,
+	CONST_CYC_IDX,
+	FE_STALL_IDX,
+	BE_STALL_IDX,
+	NUM_COMMON_EVS
+};
+
+enum grp_ev_idx {
+	MISS_IDX,
+	WB_IDX,
+	ACC_IDX,
+	NUM_GRP_EVS
+};
+
+struct ev_map_msg {
+	u32 num_evs;
+	u32 hw_type;
+	u32 cid[NUM_COMMON_EVS];
+};
+
+struct scmi_qcom_memlat_map {
+	unsigned int cpufreq_mhz;
+	unsigned int memfreq_khz;
+};
+
+struct scmi_qcom_monitor_info {
+	struct scmi_qcom_memlat_map *freq_map;
+	char name[MAX_NAME_LEN];
+	u32 mon_idx;
+	u32 mon_type;
+	u32 ipm_ceil;
+	u32 be_stall_floor;
+	u32 mask;
+	u32 freq_map_len;
+};
+
+struct scmi_qcom_memory_info {
+	struct scmi_qcom_monitor_info *monitor[MAX_MONITOR_CNT];
+	u32 hw_type;
+	int monitor_cnt;
+	u32 min_freq;
+	u32 max_freq;
+	struct devfreq_dev_profile profile;
+	struct devfreq *devfreq;
+	struct platform_device *pdev;
+	struct scmi_protocol_handle *ph;
+	const struct qcom_generic_ext_ops *ops;
+};
+
+struct scmi_qcom_memlat_info {
+	struct scmi_protocol_handle *ph;
+	const struct qcom_generic_ext_ops *ops;
+	struct scmi_qcom_memory_info *memory[MAX_MEMORY_TYPES];
+	u32 cpucp_freq_method;
+	u32 cpucp_sample_ms;
+	int memory_cnt;
+};
+
+static int configure_cpucp_common_events(struct scmi_qcom_memlat_info *info)
+{
+	const struct qcom_generic_ext_ops *ops = info->ops;
+	u8 ev_map[NUM_COMMON_EVS];
+	struct ev_map_msg msg;
+
+	memset(ev_map, 0xFF, NUM_COMMON_EVS);
+
+	msg.num_evs = NUM_COMMON_EVS;
+	msg.cid[INST_IDX] = EV_INST_RETIRED;
+	msg.cid[CYC_IDX] = EV_CPU_CYCLES;
+	msg.cid[CONST_CYC_IDX] = EV_CNT_CYCLES;
+	msg.cid[FE_STALL_IDX] = INVALID_IDX;
+	msg.cid[BE_STALL_IDX] = EV_STALL_BACKEND_MEM;
+
+	return ops->set_param(info->ph, &msg, sizeof(msg), MEMLAT_ALGO_STR,
+			      MEMLAT_SET_COMMON_EV_MAP);
+}
+
+static int configure_cpucp_grp(struct device *dev, struct scmi_qcom_memlat_info *info,
+			       int memory_index)
+{
+	struct scmi_qcom_memory_info *memory = info->memory[memory_index];
+	const struct qcom_generic_ext_ops *ops = info->ops;
+	struct ev_map_msg ev_msg;
+	u8 ev_map[NUM_GRP_EVS];
+	struct node_msg msg;
+	int ret;
+
+	msg.cpumask = 0;
+	msg.hw_type = memory->hw_type;
+	msg.mon_type = 0;
+	msg.mon_idx = 0;
+	ret = ops->set_param(info->ph, &msg, sizeof(msg), MEMLAT_ALGO_STR, MEMLAT_SET_MEM_GROUP);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to configure mem type %d\n",
+				     memory->hw_type);
+
+	memset(ev_map, 0xFF, NUM_GRP_EVS);
+	ev_msg.num_evs = NUM_GRP_EVS;
+	ev_msg.hw_type = memory->hw_type;
+	ev_msg.cid[MISS_IDX] = EV_L2_D_RFILL;
+	ev_msg.cid[WB_IDX] = INVALID_IDX;
+	ev_msg.cid[ACC_IDX] = INVALID_IDX;
+	ret = ops->set_param(info->ph, &ev_msg, sizeof(ev_msg), MEMLAT_ALGO_STR,
+			     MEMLAT_SET_GRP_EV_MAP);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to configure event map for mem type %d\n",
+				     memory->hw_type);
+
+	return ret;
+}
+
+static int configure_cpucp_mon(struct device *dev, struct scmi_qcom_memlat_info *info,
+			       int memory_index, int monitor_index)
+{
+	const struct qcom_generic_ext_ops *ops = info->ops;
+	struct scmi_qcom_memory_info *memory = info->memory[memory_index];
+	struct scmi_qcom_monitor_info *monitor = memory->monitor[monitor_index];
+	struct scalar_param_msg scalar_msg;
+	struct map_param_msg map_msg;
+	struct node_msg msg;
+	int ret;
+	int i;
+
+	msg.cpumask = monitor->mask;
+	msg.hw_type = memory->hw_type;
+	msg.mon_type = monitor->mon_type;
+	msg.mon_idx = monitor->mon_idx;
+	strscpy(msg.mon_name, monitor->name, sizeof(msg.mon_name));
+	ret = ops->set_param(info->ph, &msg, sizeof(msg), MEMLAT_ALGO_STR, MEMLAT_SET_MONITOR);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to configure monitor %s\n",
+				     monitor->name);
+
+	scalar_msg.hw_type = memory->hw_type;
+	scalar_msg.mon_idx = monitor->mon_idx;
+	scalar_msg.val = monitor->ipm_ceil;
+	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
+			     MEMLAT_IPM_CEIL);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to set ipm ceil for %s\n",
+				     monitor->name);
+
+	scalar_msg.hw_type = memory->hw_type;
+	scalar_msg.mon_idx = monitor->mon_idx;
+	scalar_msg.val = monitor->be_stall_floor;
+	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
+			     MEMLAT_BE_STALL_FLOOR);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to set ipm ceil for %s\n", monitor->name);
+
+	map_msg.hw_type = memory->hw_type;
+	map_msg.mon_idx = monitor->mon_idx;
+	map_msg.nr_rows = monitor->freq_map_len;
+	for (i = 0; i < monitor->freq_map_len; i++) {
+		map_msg.tbl[i].v1 = monitor->freq_map[i].cpufreq_mhz;
+
+		if (monitor->freq_map[i].memfreq_khz > 1)
+			map_msg.tbl[i].v2 = monitor->freq_map[i].memfreq_khz / 1000;
+		else
+			map_msg.tbl[i].v2 = monitor->freq_map[i].memfreq_khz;
+	}
+	ret = ops->set_param(info->ph, &map_msg, sizeof(map_msg), MEMLAT_ALGO_STR,
+			     MEMLAT_MON_FREQ_MAP);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to configure freq_map for %s\n",
+				     monitor->name);
+
+	scalar_msg.hw_type = memory->hw_type;
+	scalar_msg.mon_idx = monitor->mon_idx;
+	scalar_msg.val = memory->min_freq;
+	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
+			     MEMLAT_SET_MIN_FREQ);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to set min_freq for %s\n",
+				     monitor->name);
+
+	scalar_msg.hw_type = memory->hw_type;
+	scalar_msg.mon_idx = monitor->mon_idx;
+	scalar_msg.val = memory->max_freq;
+	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
+			     MEMLAT_SET_MAX_FREQ);
+	if (ret < 0)
+		dev_err_probe(dev, ret, "failed to set max_freq for %s\n", monitor->name);
+
+	return ret;
+}
+
+static int scmi_qcom_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
+{
+	struct scmi_qcom_memory_info *memory = dev_get_drvdata(dev);
+	const struct qcom_generic_ext_ops *ops;
+	struct scalar_param_msg scalar_msg;
+	int ret;
+
+	ops = memory->ops;
+
+	scalar_msg.hw_type = memory->hw_type;
+	scalar_msg.mon_idx = 0;
+	u32 cur_freq;
+
+	ret = ops->get_param(memory->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
+			     MEMLAT_GET_CUR_FREQ, sizeof(cur_freq));
+	if (ret < 0) {
+		pr_err("failed to get mon current frequency\n");
+		return ret;
+	}
+
+	memcpy(&cur_freq, (void *)&scalar_msg, sizeof(cur_freq));
+
+	if (memory->hw_type == 2)
+		*freq = le32_to_cpu(cur_freq) ? 100 : 1;
+	else
+		*freq = le32_to_cpu(cur_freq) * 1000UL;
+
+	return 0;
+}
+
+static int scmi_qcom_memlat_configure_events(struct scmi_device *sdev,
+					     struct scmi_qcom_memlat_info *info)
+{
+	const struct qcom_generic_ext_ops *ops = info->ops;
+	struct scmi_protocol_handle *ph = info->ph;
+	int i, j, ret;
+
+	/* Configure common events ids */
+	ret = configure_cpucp_common_events(info);
+	if (ret < 0)
+		return dev_err_probe(&sdev->dev, ret, "failed to configure common events\n");
+
+	for (i = 0; i < info->memory_cnt; i++) {
+		/* Configure per group parameters */
+		ret = configure_cpucp_grp(&sdev->dev, info, i);
+		if (ret < 0)
+			return ret;
+
+		for (j = 0; j < info->memory[i]->monitor_cnt; j++) {
+			/* Configure per monitor parameters */
+			ret = configure_cpucp_mon(&sdev->dev, info, i, j);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	/* Set loop sampling time */
+	ret = ops->set_param(ph, &info->cpucp_sample_ms, sizeof(info->cpucp_sample_ms),
+			     MEMLAT_ALGO_STR, MEMLAT_SAMPLE_MS);
+	if (ret < 0)
+		return dev_err_probe(&sdev->dev, ret, "failed to set sample_ms\n");
+
+	/* Set the effective cpu frequency calculation method */
+	ret = ops->set_param(ph, &info->cpucp_freq_method, sizeof(info->cpucp_freq_method),
+			     MEMLAT_ALGO_STR, MEMLAT_SET_EFFECTIVE_FREQ_METHOD);
+	if (ret < 0)
+		return dev_err_probe(&sdev->dev, ret,
+				     "failed to set effective frequency calc method\n");
+
+	/* Start sampling and voting timer */
+	ret = ops->start_activity(ph, NULL, 0, MEMLAT_ALGO_STR, MEMLAT_START_TIMER);
+	if (ret < 0)
+		dev_err_probe(&sdev->dev, ret, "failed to start memory group timer\n");
+
+	for (i = 0; i < info->memory_cnt; i++) {
+		struct scmi_qcom_memory_info *memory = info->memory[i];
+		struct platform_device *pdev = memory->pdev;
+		struct devfreq_dev_profile *profile = &memory->profile;
+
+		profile->polling_ms = info->cpucp_sample_ms;
+		profile->get_cur_freq = scmi_qcom_devfreq_get_cur_freq;
+		profile->initial_freq = memory->min_freq > 1 ?
+					(memory->min_freq * 1000UL) : memory->min_freq;
+
+		memory->ops = info->ops;
+		memory->ph = info->ph;
+
+		platform_set_drvdata(pdev, memory);
+
+		memory->devfreq = devm_devfreq_add_device(&pdev->dev, profile,
+							  DEVFREQ_GOV_REMOTE, NULL);
+		if (IS_ERR(memory->devfreq)) {
+			dev_err(&sdev->dev, "failed to add devfreq device\n");
+			/* Start sampling and voting timer */
+			ret = ops->start_activity(ph, NULL, 0, MEMLAT_ALGO_STR, MEMLAT_STOP_TIMER);
+			if (ret < 0)
+				dev_err_probe(&sdev->dev, ret,
+					      "failed to stop memory group timer\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static struct scmi_qcom_memlat_map *scmi_qcom_parse_memlat_map(struct device *dev,
+							       const struct scmi_qcom_monitor_cfg *mon_cfg)
+{
+	struct scmi_qcom_memlat_map *map_table;
+	const struct scmi_qcom_map_table *table;
+
+	map_table = devm_kzalloc(dev, MAX_MAP_ENTRIES * sizeof(struct scmi_qcom_memlat_map),
+				 GFP_KERNEL);
+	if (!map_table)
+		return ERR_PTR(-ENOMEM);
+
+	for (int i = 0; i < mon_cfg->table_len; i++) {
+		table = &mon_cfg->table[i];
+
+		map_table[i].cpufreq_mhz = table->cpu_freq;
+		map_table[i].memfreq_khz = table->mem_freq;
+	}
+
+	return map_table;
+}
+
+static const struct of_device_id scmi_qcom_memlat_configs[] __maybe_unused = {
+	{ .compatible = "qcom,glymur", .data = &glymur_memlat_data},
+	{ .compatible = "qcom,mahua", .data = &glymur_memlat_data},
+	{ .compatible = "qcom,x1e80100", .data = &hamoa_memlat_data},
+	{ .compatible = "qcom,x1p42100", .data = &hamoa_memlat_data},
+	{ }
+};
+
+static int scmi_qcom_memlat_parse_cfg(struct scmi_device *sdev, struct scmi_qcom_memlat_info *info)
+{
+	const struct scmi_qcom_memlat_cfg_data *cfg_data;
+	struct scmi_qcom_monitor_info *monitor;
+	struct scmi_qcom_memory_info *memory;
+	int ret, i, j;
+
+	cfg_data = of_machine_get_match_data(scmi_qcom_memlat_configs);
+	if (!cfg_data) {
+		return dev_err_probe(&sdev->dev, PTR_ERR(cfg_data),
+				     "Couldn't find config data for this platform\n");
+	}
+
+	for (i = 0; i < cfg_data->memory_cnt; i++) {
+		const struct scmi_qcom_memory_cfg *memory_cfg = &cfg_data->memory_cfg[i];
+		struct platform_device_info pdevinfo = { 0 };
+
+		pdevinfo.parent = &sdev->dev;
+		pdevinfo.name = memory_cfg->name;
+		pdevinfo.id = PLATFORM_DEVID_NONE;
+
+		memory = devm_kzalloc(&sdev->dev, sizeof(*memory), GFP_KERNEL);
+		if (!memory) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		memory->ops = info->ops;
+		memory->ph = info->ph;
+		memory->hw_type = memory_cfg->memory_type;
+		memory->monitor_cnt = memory_cfg->monitor_cnt;
+		memory->min_freq = memory_cfg->memory_range.min_freq;
+		memory->max_freq = memory_cfg->memory_range.max_freq;
+
+		memory->pdev = platform_device_register_full(&pdevinfo);
+		if (IS_ERR(memory->pdev)) {
+			dev_err_probe(&sdev->dev, PTR_ERR(memory->pdev),
+				      "failed to register platform device\n");
+			ret = PTR_ERR(memory->pdev);
+			goto out;
+		}
+
+		info->memory[i] = memory;
+
+		for (j = 0; j < memory_cfg->num_opps; j++) {
+			const struct scmi_qcom_opp_data *table = &memory_cfg->mem_table[j];
+			struct platform_device *pdev = memory->pdev;
+			struct dev_pm_opp_data data;
+
+			data.freq = table->freq;
+			data.level = table->level;
+
+			ret = dev_pm_opp_add_dynamic(&pdev->dev, &data);
+			if (ret) {
+				dev_err_probe(&sdev->dev, ret, "failed to add OPP\n");
+				dev_pm_opp_remove_all_dynamic(&pdev->dev);
+				goto out;
+			}
+		}
+
+		for (j = 0; j < memory_cfg->monitor_cnt; j++) {
+			const struct scmi_qcom_monitor_cfg *monitor_cfg = &memory_cfg->monitor_cfg[j];
+
+			monitor = devm_kzalloc(&sdev->dev, sizeof(*monitor), GFP_KERNEL);
+			if (!monitor)
+				return -ENOMEM;
+
+			monitor->ipm_ceil = monitor_cfg->ipm_ceil;
+			monitor->mon_type = monitor->ipm_ceil ? 0 : 1;
+			monitor->be_stall_floor = monitor_cfg->be_stall_floor;
+			monitor->mask = monitor_cfg->cpu_mask;
+			monitor->freq_map_len = monitor_cfg->table_len;
+
+			monitor->freq_map = scmi_qcom_parse_memlat_map(&sdev->dev, monitor_cfg);
+			if (IS_ERR(monitor->freq_map)) {
+				dev_err_probe(&sdev->dev, PTR_ERR(monitor->freq_map),
+					      "failed to populate cpufreq-memfreq map\n");
+				ret = -EINVAL;
+				goto out;
+			}
+
+			strscpy(monitor->name, monitor_cfg->name, sizeof(monitor->name));
+			monitor->mon_idx = j;
+			memory->monitor[j] = monitor;
+		}
+	}
+
+	info->cpucp_freq_method = cfg_data->cpucp_freq_method;
+	info->cpucp_sample_ms = cfg_data->cpucp_sample_ms;
+	info->memory_cnt = cfg_data->memory_cnt;
+
+	return 0;
+
+out:
+	for (i = 0; i < cfg_data->memory_cnt; i++) {
+		if (IS_ERR_OR_NULL(info->memory[i]))
+			break;
+
+		memory = info->memory[i];
+		if (!IS_ERR(memory->pdev))
+			platform_device_unregister(memory->pdev);
+	}
+
+	return ret;
+}
+
+static int scmi_qcom_devfreq_memlat_probe(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+	const struct qcom_generic_ext_ops *ops;
+	struct scmi_qcom_memlat_info *info;
+	struct scmi_protocol_handle *ph;
+	int ret;
+
+	if (!handle)
+		return -ENODEV;
+
+	info = devm_kzalloc(&sdev->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_QCOM_GENERIC, &ph);
+	if (IS_ERR(ops))
+		return PTR_ERR(ops);
+
+	info->ops = ops;
+	info->ph = ph;
+
+	ret = scmi_qcom_memlat_parse_cfg(sdev, info);
+	if (ret)
+		return ret;
+
+	ret = scmi_qcom_memlat_configure_events(sdev, info);
+	if (ret)
+		return ret;
+
+	dev_set_drvdata(&sdev->dev, info);
+
+	return ret;
+}
+
+static void scmi_qcom_devfreq_memlat_remove(struct scmi_device *sdev)
+{
+	struct scmi_qcom_memlat_info *info = dev_get_drvdata(&sdev->dev);
+
+	for (int i = 0; i < info->memory_cnt; i++) {
+		struct scmi_qcom_memory_info *memory = info->memory[i];
+
+		if (!IS_ERR(memory->pdev))
+			platform_device_unregister(memory->pdev);
+	}
+}
+
+static const struct scmi_device_id scmi_id_table[] = {
+	{ SCMI_PROTOCOL_QCOM_GENERIC, "qcom-generic-ext" },
+	{ },
+};
+MODULE_DEVICE_TABLE(scmi, scmi_id_table);
+
+static struct scmi_driver scmi_qcom_devfreq_memlat_driver = {
+	.name		= "scmi-qcom-devfreq-memlat",
+	.probe		= scmi_qcom_devfreq_memlat_probe,
+	.remove		= scmi_qcom_devfreq_memlat_remove,
+	.id_table	= scmi_id_table,
+};
+module_scmi_driver(scmi_qcom_devfreq_memlat_driver);
+
+MODULE_AUTHOR("Sibi Sankar <sibi.sankar@oss.qualcomm.com>");
+MODULE_DESCRIPTION("SCMI QCOM DEVFREQ MEMLAT driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


