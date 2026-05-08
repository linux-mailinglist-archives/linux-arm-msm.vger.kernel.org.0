Return-Path: <linux-arm-msm+bounces-106744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIoCFaNW/mmupQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 23:33:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D094D4FBF31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 23:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E11323023534
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 21:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194D030F94B;
	Fri,  8 May 2026 21:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TnXIFhwv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ih63e48F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958DA279907
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 21:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275987; cv=none; b=RQjac2RsCv0NgN1qpOsKGTpCpDVopuKDpvvFSFGYJ+rviJjYFOSdzjpBoQtsTOkcQg1qDP2z2efld7Q2QsvJgpjaVmnIWVltht094c2EpiOxFeldh2bHOetLj8mV2JQc5r6jQiYF0SfShPKqwMWReNKzqPNlQSCH+3Tzk8FHlE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275987; c=relaxed/simple;
	bh=X7uEJptvwsV3/AC2xW64pXmoB3N2kAk1Hh22xuC50Dw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HjsaqrlCWOtQqvyhfuXqU3UOUMDR7MuZ+9/UVbQl9Ul4niNMDTawtml+5MCdLGITCzLgM3mOFz33D4Bo0Q/tP8FYKo240w+0ZMbzdd77duGpm6PiSZqbeKTvtAW7gerawkDBvSl62W/BezFo8EIwe7buP7gjC44szVd8AbEA0fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TnXIFhwv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ih63e48F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648KYk11852141
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 21:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P0+zhgaE3hW
	Bq02LPyDgy1/Pf5uTZKmDwz1w7Oq2yFM=; b=TnXIFhwvCFXHd3NzBoJOuqmulVI
	BsFegiBMN6lDhSECurXZLcl62T/xdKmB0p1j8my8jMFlCmEaq7KY2JTDXJK9Z7va
	TRufFBqVl0VNsRsBcutr5FS3yo2alYwzVItmMhwSMcXFM/2jgLqXDa9MdGg0YAIe
	jR4uY/UG3ZcfZ/C9Y/45OYG3NLIJKiqqt7ZrgcArvm0AkGtyQCNvinKM8L34ESMX
	TqsQ9WuohNxpSdtobFVLFEOkNqyjUVywE7K2uTExMfHylpD7ghjYgorgRvGQds36
	td8SDEGsaFbm0BN3d/TX8qQFgT6GzPPq6oA53P76XY8mJruvGExjt5LOA+w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1fptj0s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 21:33:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f485961555so6414410eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 14:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778275985; x=1778880785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0+zhgaE3hWBq02LPyDgy1/Pf5uTZKmDwz1w7Oq2yFM=;
        b=Ih63e48FFyaXwOpNZCQbnT+wYJ4D5A/wLcGN86ntSwUKTpiUm6TPv+gF8mvwiDyrZq
         qo0YRj75FXnsdPwXrb/3sg87ci8bh2Ar/OC0wibOtSsytBSUEFTtxl7MsFHi/UELJvOM
         Dd6/fyplMWTfM3U0gdXc5q7eZp8CxQuI8rYxfEjWSQ4Mf84RYQqAzAlNS2fEPP7s/Jfa
         V1zQPmCWbRMtZZNtUEuz4v+F1kKaGeJqA493WAwTWOzh5f9y8XT9SrLHAbJFD6QpvvbX
         N74KOwgXJ+DHIMIZvt4AsG5BjH0y5pbo6Ceo5F1QWwatwvaAi2dpK9gLwMr+rXyswStR
         r2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275985; x=1778880785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P0+zhgaE3hWBq02LPyDgy1/Pf5uTZKmDwz1w7Oq2yFM=;
        b=dSnWWrYXGxdcbhWYWN0VLKig06WauNA83WlSphsAYdqBlMNPSUZdfPjc6SXslKjd54
         UYX7q6a0kgKpzoTtOB/iAQkL8B6Z/aE5vUSv5YsGB11u8hihhTmj3+33DYkFKbSXe5Vi
         3A5ZkpqqbuZe/Mvi5Pv2fLESTAbbr0Ct7Lo39tAaH54Y8LQEcEaxCe+9BD0nGbOvDlAd
         vPCAB6oqD5IngQaOUGHoIwAQz6M9EIzV1SkcX9N/YMiRZF3R5s2v3Py6ioMpeuZ5ymGj
         dfrt025jwtm8bPepUCvN6uSp6w21vr9uLQRIE9Yz6Kh5/244+L0PdmC2AIpCOGaDIAIy
         PFaw==
X-Forwarded-Encrypted: i=1; AFNElJ/43MsORXv/mfIQF7mINRqah1BlgtMclTF3XRu/EWTqjcL7Bq11dvYy5P/scSZRdeK5POYfx8VUBoIcV1Wp@vger.kernel.org
X-Gm-Message-State: AOJu0YxjXff/jYzWoFad/vWb3GL6I9iXbsOPXAxeRlL73QWJREl7rBBH
	rmrFStMtp38KK8AFZxqQg4PhRf08JTwUTV4A97M+wNsUe6+cGCgcY2FzotrYQmdyrrUuUyxTy5x
	LyqUCfotN1GlhAvgkgCyaJiJp8XLmFdCjldkK1CsAUqJKX61AG1pDaewhbBWsNNCpLgp3
X-Gm-Gg: Acq92OHgVo1SqP9pYrLbvH1Psugz98hQD1vzIiaUF9VKcHPgrve85PBlmLOLWYC6rWJ
	PDP7YrMXdZTmsurkgFfJAJxXsUne6RhUqj2XS3i5HDjvvx55LxhviO0xme9ROHDgtno9ENQrdp+
	yJjd57ZecNjE0A/nVpk0cCHQrdeSeKE2F4itlNeCS0wbrrYIDVddWAyOF72MJlIR6QFX01kMqVA
	HD903xj3/YI+ZXfz6Cdihx3Qzwa+6R1PI9oEKYdAx1AaIDlZHZLZ7lShtiRM05M6vnjmGWG5ZLO
	01CFBEP6uEFuszpYKjVpXaY9YLh0Ak2RjuRnOCI7uwdoybIZAG3IH90I3gQotJolR5GMg8emkCB
	qfPmWaRk/TA2m8SYaurPezypZz7KeU/RsTMJkd6fs6E42e8pCUxDuRcy1ncl3BP+mpClj5HJWQo
	w=
X-Received: by 2002:a05:7301:e101:b0:2f5:5dd3:1fd8 with SMTP id 5a478bee46e88-2f55dd323c8mr5114666eec.8.1778275984595;
        Fri, 08 May 2026 14:33:04 -0700 (PDT)
X-Received: by 2002:a05:7301:e101:b0:2f5:5dd3:1fd8 with SMTP id 5a478bee46e88-2f55dd323c8mr5114649eec.8.1778275984035;
        Fri, 08 May 2026 14:33:04 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm4871285eec.27.2026.05.08.14.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:33:03 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com
Cc: wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
Date: Fri,  8 May 2026 14:32:31 -0700
Message-Id: <20260508213234.4643-2-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
References: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: poFvzM_wbGElgZQf1j96tNsrE_iUs0EA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIxMyBTYWx0ZWRfX6AGBC8/Ugnc+
 vS8i6P9IwqqAIPKLcFtScUVldMM5FwEs2Ytfh/2HKW8ju/QxoDGzIMKw6HhYKl7gK5QoZPooQSx
 NUMT6lNANMiqQong+HcSsUR2irQwl+0O5XA9gnAmowDgC6OlEfY5LCyAt9fnK3kp5B09FTythE2
 WyFe5Is5Ze0xfVDoBFmHH0BYTfl7qEBRMNg7YmsCtF8THB+AsppQRmUssHaJVpwQrT2sviE+2Gg
 zrQXtUNj1CFwGD5L/4/KVj+ozHrcw+1/XcHAmcQuBuu8yRkBy0Pi1H5RpCxfxEUU+/VQx9nHPSg
 H9OlD1dB9NZmRyzjDsoxGJ0vjLVcKvjGCJKB3dcqvfibtmMwtlpsgFqzpiTGRmNhRYClrzyLAot
 SXaYe1fyibnGL2eqpGdddEiC2UqlgOajlvvVpYp6e/lZUKEPGitgQcjmxND8kUwdNrIW/5gINH+
 rHq5J448srRQ71xPdSg==
X-Proofpoint-GUID: poFvzM_wbGElgZQf1j96tNsrE_iUs0EA
X-Authority-Analysis: v=2.4 cv=IYi3n2qa c=1 sm=1 tr=0 ts=69fe5691 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=8IMiPDtIn6OAJiDpRukA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080213
X-Rspamd-Queue-Id: D094D4FBF31
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106744-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the Hawi compatible string for the QMP combo PHY.

Hawi uses a new QSERDES V10 register layout with a new COM AON module
and hardware-specific PHY init sequences compared to previous targets,
requiring a dedicated compatible string.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 3d537b7f9985..7a7059c659be 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,sm8750-qmp-usb3-dp-phy
       - enum:
           - qcom,glymur-qmp-usb3-dp-phy
+          - qcom,hawi-qmp-usb3-dp-phy
           - qcom,sar2130p-qmp-usb3-dp-phy
           - qcom,sc7180-qmp-usb3-dp-phy
           - qcom,sc7280-qmp-usb3-dp-phy
@@ -205,6 +206,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-qmp-usb3-dp-phy
+              - qcom,hawi-qmp-usb3-dp-phy
               - qcom,sar2130p-qmp-usb3-dp-phy
               - qcom,sc8280xp-qmp-usb43dp-phy
               - qcom,sm6350-qmp-usb3-dp-phy
-- 
2.34.1


