Return-Path: <linux-arm-msm+bounces-107774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMuNNSP0BmohpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:23:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 824DB54D416
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B8673004934
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDBE3AA9E8;
	Fri, 15 May 2026 10:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/wuunIa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d3kQ8EPl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5834E3BF696
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840290; cv=none; b=edh53TOvKjzQdqJbYm+a3I60fOC4NQ7O+4rDw+tDTcCjtKTi2VE3pw+Y/ujkrLIoe9tdD7fm2mwOaCPfXV8yC7DHkCESq3diiRxclmDUtR8cLaPy0G/miIHvPYwQPM5HvKfCVim+dNpBZCY+uaCpZoRyLu4LRZKcNeLNqAxjQoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840290; c=relaxed/simple;
	bh=fp4rXDHMI+TsCqseevlNwiYIftUlifpkg75ssIkoF7A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C8kRfP0LZUCcIQ92mNmY/7jGca2bHc68QuC/Tpj7w5GNbuuybBL9KuK1UJHhCoCY4+D3dI14nsveOEts5O5AdQzEUnwB4jCPhZkMT4XUnsp4UMx0uBDisu2GUm/F+0D1J33/h1Rqv+oIzdER0H2+R0tNzZ987/SRohoY6s181d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/wuunIa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d3kQ8EPl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F55HKd4008388
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kWY90ZN64g/mMK51PCkI1c
	YOEZZNPa5iD/EZWSO5kuI=; b=o/wuunIaL7O+ytDQFD7b2WH4fIs5Sb6i2ZHHZD
	RAaDhBw5Ylj7zO1nzpQnGS9xtABFBtDFyMlpgeyFqsy86hYJ8yj7Lz4/JRQbA/L6
	baCt/qybSLoD8/V4DyxY+u69WadZj8g9cTAUdT5CnjRuZzfHfTaDP0p7NVI/79Ga
	GQoEWPQfeW5Gtt6BO1JSCn4Sd5lyutnBFeqsdYF5MRnh4riJin1B514CQ55vsIk2
	STidMay38ur9Fjc9xIrR8TCgCpuSI0LRtxzxfBQXNmnO4U6Jyd/PnPuhwgH9Dkdf
	bORm0mQsGigPABPWRW7G0xRZrFPUBFlzecRb/XtTEw95vdsw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1sttjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:18:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c82894155ceso7208804a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840287; x=1779445087; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kWY90ZN64g/mMK51PCkI1cYOEZZNPa5iD/EZWSO5kuI=;
        b=d3kQ8EPlv+q3W2VyUdLpdoYVrsvmyIGp/IDb2BxGPXzkAS+uP89wfpNiSlx25lGRGa
         jUOHd10gYsiUE94HingTXoag+h+jUPOT8nmuvZVBaNAzgjgPBoeH0o0cx6BGKOsNFEt6
         Y/t6DA6EtTfcUYFFrgqL8iaX77JAzUAqQ/D8juX4mtp7ebM3O403ypOP+QJl4VzzT4sM
         EIGxzxfsE32kq3mW/hwZmRL0HrjZMaeIAPK0IzRnSZqCeYq1cArZOp/Jy2NolTwvo2V5
         xEvb4bt/+gMzJ6LGJY65k78tXB1dP7c3Zxes/oI8fv8sv4PRuMVqGrggVi8xxKcl0Gbs
         Ha9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840287; x=1779445087;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWY90ZN64g/mMK51PCkI1cYOEZZNPa5iD/EZWSO5kuI=;
        b=YPqBQDAQ0iQOUvBqgCZF49WmWn3pk7TMC/cWpiDs7ZKZCJetS8+Tc8hcUYIZxWsZCV
         cbKz2AbSrv+VmWUkuzhqITBE1U/i5/cV4TgkBlZD287EtLQCtDIpE5E8jVVlr9NzriQT
         d8C8irA++hwVzywwJFCSdXqlFRavmj/a1rP0T2U1eyCu9ZGwk31lu8mcDvTrUv3bCQ9b
         eurWCVHHVWEgx2xRO0AUv3G4KvwiQLXnxoOoUcrcPS9GmVsw5ezWR6dj3HV3Phy8pkrP
         osOwt83tJIKcGiPHqcNOx0qx0tVYUyLJFAfXQbI5cc/9WFiesBhYMjF0Nuq9AYRsPsz4
         L+aQ==
X-Gm-Message-State: AOJu0Yxsi04UrVhqpJ3dAvJjijQOZjGO9eTgGZQNn2pp0O7CgKfXP+UO
	Tk3WcxW9kUnnfStlgXl0WWXF55vPgV5EL9WFD+p/11ApdLmWOxrKG62c4mCusPeQ6Mk8sViAJqq
	qadd0RTxt7lXQNdCpu8zjYJ/1gdAbnZGuMdFpj2GgJTSfG1PtUEtN6HxfnyfiA3xUN9hU
X-Gm-Gg: Acq92OGmxXdwt+RVzfENttKmcmSzPu4DWL6WdBxb0P6ZNUhtw9vQ/bxL7Lv2lE+dunE
	8R/RKv3pu+6sWqgnjR0ifAh1h5XWYJJUShEeIMq4SAhf2m3xyhaFVjE902K3B9Hi5UybN1f5XPJ
	XdOvmd0ZN47eXUlC0LoVj3FHUcvhVPsMUVzQXafufSLp0QN7dd+XHnDszGi6Hf+Y2sHpCsF+D0x
	LIfAWl2Y0p08nsmRnovYyinUzVBKAjVsvHS+poKb00ZzslvuB+cDFhw13RvomXDNyNdvAgtrNMj
	w4iHgRXK0swcZZUChAxG0g7+L91VSlCrdOcXUWO040OXQoXjurnNK6SdgjlhDxkov/K+0AlInaS
	UgbIk7CDn/r/SD72ZrHSrPcu14hbFzJQ1FSU97+SuYkGVSOjSoui65GIdgnjxI8y8OpSmoHlu/e
	0wTSNWdBgIOT4BsaFM3KYkCk/SFZob+ZgNDWjEkncu7aJ6M4cROSM=
X-Received: by 2002:a05:6a00:a203:b0:83e:e897:a394 with SMTP id d2e1a72fcca58-83f33c34a8bmr3944003b3a.7.1778840287035;
        Fri, 15 May 2026 03:18:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:a203:b0:83e:e897:a394 with SMTP id d2e1a72fcca58-83f33c34a8bmr3943973b3a.7.1778840286542;
        Fri, 15 May 2026 03:18:06 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7c74fsm6878482b3a.49.2026.05.15.03.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:18:06 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support tsens in ipq5210 & ipq9650
Date: Fri, 15 May 2026 15:47:58 +0530
Message-Id: <20260515-tsens-driver-v1-0-015ca76f1418@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANbyBmoC/13MSw7CIBSF4a00jCXhQqHAVkwHPC5KYqtCbTRN9
 261AxOH/0nOt5CKJWMltllIwTnXfB23gENDwtmNJ6Q5bk0444pJkHSqOFYaS56x0K4zHlKrotO
 SbJdbwZSfX+7Y713w/tjUaR9/qG3+yJcbLlQmCV0wrfba2Bk+pncVabgOQ55sg0ZHDgE65hnEi
 EkolRgX3qeQlBcgmUlOC9Kv6xsKVx0U3AAAAA==
X-Change-ID: 20260515-tsens-driver-779b1f46da85
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: IOStX7L73oh4BjZUIryi7P8s4HwC0Cem
X-Proofpoint-GUID: IOStX7L73oh4BjZUIryi7P8s4HwC0Cem
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a06f2e0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DOJe6fkaggpdGCZYqIUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwMyBTYWx0ZWRfX+/T3wa23mlKk
 RBvghhFNfKLS1629Z2Dz2mzDtvXhlnn3R/tn4q6PLPyEPqqccodpam4w9oZvhIMTJenBotO1jeV
 YRVfIP2K2TplJ/KzxI/wzRUdXlXGHynOOYuz+HeI3jh12xa+Rbjs2dGdq7dMhhb+jYTum3AkYB/
 //H+t/Iv/Wo8EVDqMAR4RRl8AqsXfQW3Av5LjgJyrqTbHVUkCPtWxOuxr6XSlPOTYJuObB96j9X
 yA9UffM6ZngjU/QRNdSx1yK5FGIDRg1LuHtOebGNFheiexTixS3YnLudgxEfRfXV9qf6tLTADzd
 PPdEd4Ft0To788SKVK7G6v3OoAIFzS0Xlw/510ACphyHh95kcF0PDsPMo4xWV129ORXOuCNLwg5
 2NqF63Y54QzWGVlsuYLIBK+mR10faBUhkAMyBN4VI12hOT7xI4MOl+lBiJ7Md96qhuy2a+/VlPe
 4QbUpePubGitIZ9DFCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150103
X-Rspamd-Queue-Id: 824DB54D416
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107774-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

ipq5210 and ipq9560 have the Qualcomm tsens-v2 IP. The tsens framework
in these two SoCs are similar to the one found in ipq5332. This series
adds the sensor data to the tsens-v2 driver.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      thermal/drivers/qcom/tsens: Add support for ipq5210 tsens
      thermal/drivers/qcom/tsens: Add support for ipq9650 tsens

 drivers/thermal/qcom/tsens-v2.c | 8 ++++++++
 drivers/thermal/qcom/tsens.c    | 6 ++++++
 drivers/thermal/qcom/tsens.h    | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260515-tsens-driver-779b1f46da85
prerequisite-change-id: 20260515-tsens-yaml-5f517c948b89:v1
prerequisite-patch-id: 23a443cf15da9852d647ceb75a1b7ca98078a1e3

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


