Return-Path: <linux-arm-msm+bounces-96582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKh+J8vtr2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:09:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EEB24921C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0548D31B95B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B541D4611E8;
	Tue, 10 Mar 2026 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDCCa37J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIGjqIl3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A464B451056
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137045; cv=none; b=jhguJNXWm1U5w36H5Znj3DSR3zZqpbbP983ciXGuqFIcl7347CbX1HM88nRIi+QIlPFtRcXPmjDdG63Y/kjmaOk/+FOJVLWJumg1cMIXzH8bk8bY4g0jFGpulA5gwT1hHFZaLul/soAZvcpzaORF49AI9w7Rxzsza/sYwKXioPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137045; c=relaxed/simple;
	bh=Qki3/gbxeC0wNNfIOLYG0fdPkgVBFql/haBzvhMzN6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QKL/rLhUddFtAF8Bh6Neif4ebVYPV49X20xCU+ziDyOYGXYbxAlyOrMrVm1AvZuoCApXzcJjfA+tVj6DpgSPK2DnQ2TzkDiFUm5MwNHTnOC3jKADLoIdc2GMVRq9Gt8KCgBmi+GJXq2VR1fSVYv1Qh1npQyWbCiI4yxvgvWLU58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDCCa37J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIGjqIl3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8ke3a3587446
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vn8dFADlBLXUsARpMgo35Ilp2iUnE9H0E8H55YGOyzE=; b=LDCCa37JkWb3Dbt7
	x5HVkDN5nIcF74bDfkrRqK+xVIQH/guhpkkHSU5OvzKNM8eRW+Ylploo906t4bur
	IU0ME8nY6mYD1DjDCpINisA/AJ/i9ms9AItIdmRcgqNO+oUjzgcc1tDxEcz25/e+
	r0QOGpcm/hmpFIpSjjjillcDE4SO5NKfzx1Rw4a85/9D1AhYukP5P/caRwuN7SrR
	4VlXI6ez1JVJOctepaMCrNAoxTHzpmEH1YpUYtOm3tEO26wARvIxeb+i5O7cEBGN
	lZPTcyhQ/cGzMzO88V9fJIcNX01SRbl61XmlT00MTyTUQYNKMHQ7KsvW/zpysaq4
	p/cdZA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekua5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:04:02 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d73fd3b35cso20403259a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137042; x=1773741842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vn8dFADlBLXUsARpMgo35Ilp2iUnE9H0E8H55YGOyzE=;
        b=SIGjqIl3l6hJBE1oQrVHwnzoqPVdPwuMJACga+99lQBUU392cGbKylnGQU3ZPhsqYv
         iYeLxI8uNtx22id8NeOZ7GFMtCgKAK+n/zIny+TS5armua0T6rpeyUSnSquzAsdEMqj1
         AKxRws3hpoB7yqa2WgwYyHtgwvK55ZjO1gaPqZNXsAc7pRT3V2OkxZ98oMNkrFk7D7dw
         LnTvIPZo1KW00s0ttX+Fx3e81ovbCjxeKeutBHQcPL3H4IjNtyp2V+TqUsqGSL/kdJnN
         KxkgBEQBqbDS2MJheIr4Z2de9381Fhuqwk17G/21VSaa6eUwR775efKmHLwn5B4SpKgt
         xdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137042; x=1773741842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vn8dFADlBLXUsARpMgo35Ilp2iUnE9H0E8H55YGOyzE=;
        b=sukXUrDsTQLQ/HBNh5DvOSukis8Jou9/HCWuStBMFIQPzVtmE6gyPsQAJsjgidzL/2
         8qmdK4xhhBEc4LQarO9zHGLyYiIEKiUZUcqjiLdviqImzB/CT9esMvlgaKMmz/kV0CbX
         Es7Gs0IFSE4yk6rhXZdLSDgqfsgUpikXsqpMgUS3mm6JXVexe8aTBLvWiCfZ4sN91d5H
         jcnIpj1U2MTssrggDFXc8Cr8RrBOc0hMdwt2XNnwCE3/B8356Ox/FnlOCdFeBk6w8qMW
         di0cnkIEwEVaAl1apem1H1Vykvoj5VYpVIom/tiRYtExYBzHUW9M3+nQVVsM3A1L+pe2
         QABw==
X-Forwarded-Encrypted: i=1; AJvYcCXz+5rG5B3WyzcKQy+r+2MGiHtZmmpn4rUpz5SNYUo4naLixiaHBl+SV0iuywvLTFT9kgUiw2GjHfmu/f5+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+XDW+JYRk7sFHnca52LJOdabbczjDFyYxGM2uMzVuMnlPkAHq
	Yt1VgE5OvUFb6UCWEy+IoK+paj9wZF4uc4xsS9mybgChmjkRPwyBUmkRkpNeiSz2C0w763Nfe8U
	hA+84YT08Z3HldP3wwU2EKVLX6rTE/xyNxr4JzLxPhU+zu+TWQjcXlcGucn4lmrCmwuGp
X-Gm-Gg: ATEYQzxB+73PrMk6bSwse1hlRAIMQfJRdDnnLccWA8n/3+gw+Wrze9iHWsLttC0ofEu
	IDAjOb2zrXHyHoxz/FtkUdW6uln1O1nd9xc9J4j0+VSNuqc0f/U0vehKe9eV7W0ZIT+XJf4QnxS
	2pgZJdMeGe5oaCkhIfyhDJjIUPPeL7Nhfbnh+PmdIwSvLIl5pIV6e8CwvghqjSX+S5l8xbzoyXV
	SFoPey1zZF3m0DICypxDEraSEidZ5f567wA6hah8SU2VH7eUvQ+fcT/mGElg3cWHjcPeKf00QPD
	ybtzdCbRmaAQS7pfrthPEsNbfxwWW2/MKeSCnRynFpXW1bEASm3QpQMqyhvjy+lzOFcCfHod0PR
	4FTocO55T8kuguJO4UpJT/dWuWPcKYtW3RUIivkYUdT5EwUh8Me7Uu7RwSTDobJEFTGUVp7I9
X-Received: by 2002:a05:6830:2e05:b0:7d7:4666:69be with SMTP id 46e09a7af769-7d746666b8amr6009174a34.18.1773137042182;
        Tue, 10 Mar 2026 03:04:02 -0700 (PDT)
X-Received: by 2002:a05:6830:2e05:b0:7d7:4666:69be with SMTP id 46e09a7af769-7d746666b8amr6009157a34.18.1773137041827;
        Tue, 10 Mar 2026 03:04:01 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d746bdecbfsm4337611a34.10.2026.03.10.03.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:04:01 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 03:03:23 -0700
Subject: [PATCH v4 7/7] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-knp-soccp-v4-7-0a91575e0e7e@oss.qualcomm.com>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
In-Reply-To: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773137028; l=1647;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Qki3/gbxeC0wNNfIOLYG0fdPkgVBFql/haBzvhMzN6g=;
 b=63NZCz2HoyrpbgRCj7V1hnJNLOPV/aGp+Si/dIpCx9VFfD7tUReoPdHhbSHPgzO49FC93n0+E
 FifcvhdAN/5DmXlfeJSx/Whi6votTKz7x3NvddTOypIgi55iYyqZxQa
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: icVFfrlJDuezG2_cGjST4AuQsev6F5oC
X-Proofpoint-ORIG-GUID: icVFfrlJDuezG2_cGjST4AuQsev6F5oC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NiBTYWx0ZWRfX3iVtWs1kkgnS
 uRSIeHgkRf6JV2bpozDr/laG39yNErfxGBgAL9RWKZLy2uRrDAEEFWgBCzXSrQhiOj9mhXFvEOB
 pLuDc9dsnwPd6vv6TFxWQUBOg739LAcOkizYK9v0P4zcWDMOv2i7Lc+nxGaOVG9kDk0WRM2qVwV
 n//oOET3v3CdFfL4vlTeW7QQnSpne1DBQmlXTQ5xx9OhNdcZVXUxNN6iw53LbzesPR2k/4l0GOq
 lv+rL5/luQOo1EP+jN17eEj+oPlk7++rS8RnDlIzdEC9WW2dCcYJ/+nZndvPEmqaIF+igSSO/8I
 MjsP/UqiH23lQUKpF2QQhtWHLSB46xpkgo0zvKobPjIBpbKtMVhGLxbyjZT177HvoITQhfMrX+g
 J1bPfNX3tZYasUTzc9vpm2cl8QYmc9uhetVwdmNM9K3qMtPLDFyVYc5hdUKYk1Llk3110nwZ7uc
 WmwntRY0U4aZdD/sD6Q==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69afec92 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-54vo4t_4OUFHp6kYXwA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100086
X-Rspamd-Queue-Id: F3EEB24921C
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-96582-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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
index 4700d111e058..a5219dffcc7c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1625,7 +1625,25 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
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
+	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource},
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource},
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource},
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource},

-- 
2.25.1


