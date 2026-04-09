Return-Path: <linux-arm-msm+bounces-102449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CS7OTZq12myNggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:58:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AB13C81EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D73F430B2D42
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 08:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F0737EFFE;
	Thu,  9 Apr 2026 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k++b5xHh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTZNyK4N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23D738656C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724762; cv=none; b=WiK3F7ji/UmAWgXk00+usxzN9iXcqG1+PXoEO+5GqBlVK1vZ4RkzesMj8ppSTkCINedwrKygHyd3Bi03bb3ejIHQI+N8dqKeQjCKVBoCtC2VvA0Cl8fFXAwEF3X+xPVeGnw8YPKAu0a9mtyaPJ97HHBy8NgHDqQ8lAieW5W3UIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724762; c=relaxed/simple;
	bh=X8apncHELkQiQFOopfO/eJAliJCDt9IbYR6LW9EKidE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h8h3rW9ul2FN9PWoKnsYyFfTZFfecOGIIiz5ufX8usyv268WbBlMe55xq7Tv52J87mFLaYx976win345FueWFvT4RhXfWIbA0zM8CJX4UlAYSm1qGsN4S5IJ32d40qpy2JdhNr/48FmcEBZQONu+uYauErIibfQ7UrpWA0r1EKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k++b5xHh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTZNyK4N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395kTmG1613662
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 08:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ic5IEtyYAYRznxrQ2uPKemOuJzm0Ampz76bnyiqpntU=; b=k++b5xHhfIpIOtX6
	A/hnnYE0ZAvo6ZFKA7JuK565pF24f4GA2mihpp9ohLeQuGXT06phwPxwSCnCPr1u
	rLa7KZW73yHtpdQ5noZocDz5Y56DbWmiL6hsN9kDshqHGlbAt+Uxble84FOxLZ0a
	z8jtQGJ9W1zB40/ikihWAj9cECfQtXJ9B/HVhM/8bZ6Eiohh33lv6M62hS/jXAFI
	WzkmgUasgMXRzA269Kyv6RZHVJmWmsNuITLzesCsCUN0ce7DIK75JAK7ATzdW3TZ
	8bJV5wgda/L47CwHORTRFkZhNHb8VZfcyf0E22dYSD+YxfnAOrY4cTMAoeMu0eWP
	8km8bw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4de68v8n2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 08:52:40 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c20a91932so4076544c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775724759; x=1776329559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ic5IEtyYAYRznxrQ2uPKemOuJzm0Ampz76bnyiqpntU=;
        b=PTZNyK4NRd6/YsPKj+azlADk7SE8TghCMY8qWobtudA5fIp1+2FcrRBxBYrp8asY1Y
         6zoB5YD1jR4NLzWwHaPAiycU4NuivT7uRWNkPigSVqA/MILFt7Fh3h6Qmw+MNcxvI20e
         Qnb3xYRxMxDyvZk1ksFx0Upzofou4b6vynkTLIHBfx8R0B22KyIxUoalGVICUOr/ZSMg
         v4aaRxKwdoGtLW3Vb06Pz8qk+8LV6UovdAkas7/mwtDgle2Bf0ruN/TnrG7bV+Zv9QZs
         eaPAps6arBWlwfSooW383PxZZz30lIXiFRvZbUxHTUnJN/a0/tZl6pubQbPAQ5emkDOI
         kDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724759; x=1776329559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ic5IEtyYAYRznxrQ2uPKemOuJzm0Ampz76bnyiqpntU=;
        b=Wh0DMkk/jFKLpqSh3tAK2n49UnT2Smk96F7H9YWEjhs2fEryDATBq2qiF75QBOOK9I
         ex3Q/SLgowtuuPfx9k9cH47lUFaiEtxa0naHACX6XfsXgwEr2LiL6eoh77wRX1sr5gxq
         9vr15RYHX8HhpX82K3t0HBnPBvpiTXk7KILI/2kTz4SYwoWfHUHBU3dGbfCRP2u+65Z8
         TgdDAD24pQVPP9iCP4tZEwo6da/sCRZXu4F7EbjvL8CNOS+kW+edtnWENmvkMKd2fALb
         vo8jXudO+rz4bcJNyVpMuX8WbSy5tSTeRq3++p2xFSfujVhawOITfevXBvDWY8oufdel
         EwDA==
X-Forwarded-Encrypted: i=1; AJvYcCV535jd32fvb0a7OzARM4JBxgpz5BZLkLAAF6WSDK3AOq8glzfkOBYCgtoqJMrZRqn3TMwjnjYaCWDp4U8i@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm6rqcvb0eDZj7vcAQTj6P9sIN39hCQAVQ93rz87PFzFHQ3Ztp
	6p4jrR+0/FOb9v5EuCHIKkzC4ekfXZoBJDyrZXVevUSuW7BZDq4rZIbikOvUM94EI4Y1u51MCdc
	S+JaZ2EQlYhkARQt2McD/WtrfP/MSM4b8trfA3yFCHHatdcAkwy+dQeFTXhIKtlR7Zcnl
X-Gm-Gg: AeBDieu4TAgFIsv4jbN3Ht9d1f4h1n5zHmEBysqzpXb/NT2K7IH94mJE5B1d6YOYmor
	vdveclrYUYIKNyhCBcKNRwnt/XHbkQDsfzDwNNVp3m+SC0mPk0My15YZ56J87jgzEIkkwFj4xdm
	TxaV2fxtaaOi2GJIVm8v+4iL6TUJVZJ8JcTrvcT7rXL2TTOhXEoSEOZNXq+vwOWEuLk1KpUFjB+
	uaaaIuEl71nyyBFhvDQenX+J84DnEj/MdPvhzMOm0cAxjMZNjEW4FXCaFWSEqo7ygHem7yxQZTk
	8nCsh1htojurNuNw4PTgokapOnMD4zjTR0miNIXKI1q7LpeSwUk34LhpYmzQBl3N8LHqdoV07kJ
	TslGF1U4A/kEjhSJ1teAufxWpnhZH0K4Ou9g2bp26yEnYLj9XYHgshh4IUZM9/3bwY04qijxl
X-Received: by 2002:a05:7300:dc8b:b0:2c6:31f0:a018 with SMTP id 5a478bee46e88-2cbfb98f39amr12705002eec.22.1775724759344;
        Thu, 09 Apr 2026 01:52:39 -0700 (PDT)
X-Received: by 2002:a05:7300:dc8b:b0:2c6:31f0:a018 with SMTP id 5a478bee46e88-2cbfb98f39amr12704978eec.22.1775724758815;
        Thu, 09 Apr 2026 01:52:38 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d460c8e9a5sm2312889eec.17.2026.04.09.01.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:52:38 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 01:52:28 -0700
Subject: [PATCH v5 5/5] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-knp-soccp-v5-5-805a492124da@oss.qualcomm.com>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
In-Reply-To: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775724750; l=1726;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=X8apncHELkQiQFOopfO/eJAliJCDt9IbYR6LW9EKidE=;
 b=BUkecBlsTbhEGuiBVfrl3qtTaWPHKGZSAMf5zyiNKsi0G/oTkgic3K61pr5FoLQtt47z2qpVN
 9XWklRMggQMDM+IHRBZ3CHLxH9+dm63lvHcsgQzhcUBca0GAK8w5xr2
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: RzbWEJAhsdqzyfvQcPYEn0fUSEMP8s6X
X-Authority-Analysis: v=2.4 cv=b7OCJNGx c=1 sm=1 tr=0 ts=69d768d8 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-54vo4t_4OUFHp6kYXwA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: RzbWEJAhsdqzyfvQcPYEn0fUSEMP8s6X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NiBTYWx0ZWRfX73XwiJ/ATwmb
 zhunnw0wUzpzfzKojRGGXyhJSdBO+pAJJuE1b1Uo7hHvd/bqUskuM6rRq3TEibJa5wFwF0PMQa1
 JaQcWie3Q2gvaH6qOSOKQ7vzi5CVKyDssEo+gu6S5VEk5XmT0iNG4o13YdTJtEQzHxd7L7OoaM+
 YdP3TkLaM/ALPoR+kVTt74J21+wAtuQSR3JWBAwOadag6Bk8lWI+aUj3IHHt9Av30R6vug7B2Vz
 Qc54hV1/zKL3HvgxNRJaSnbgVuKpMyfd0gp5YA+OUgMSx7tcFu+zSUbLt5piwZXCy2xSvqnRPoL
 PEyKn+jw5jIL0O2tymmzcQGpRgj3M4uiL3JH5xFrb3CgKxpXkNZ6DMjww6zGf7PzEmxirnF2bQt
 pqa9hHfHi41kJ8efxQtvrhZjXOAPFCuy2ATQNAAXFm1MMRvK4HEaHDxlDsmeMSE7X0N9suCcJ7U
 JuI7PGOGIEMn421wjYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102449-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 65AB13C81EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
It provides a solution for control-plane processing, reducing per-subsystem
microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 34b54cf832d0..1c81f22438cc 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1604,8 +1604,26 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
+static const struct qcom_pas_data kaanapali_soccp_resource = {
+	.crash_reason_smem = 656,
+	.firmware_name = "soccp.mbn",
+	.dtb_firmware_name = "soccp_dtb.mbn",
+	.pas_id = 51,
+	.dtb_pas_id = 0x41,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "soccp",
+	.sysmon_name = "soccp",
+	.auto_boot = true,
+	.early_boot = true,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },

-- 
2.34.1


