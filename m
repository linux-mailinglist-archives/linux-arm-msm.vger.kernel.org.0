Return-Path: <linux-arm-msm+bounces-100817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NNcELSLymn09gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:41:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9C535D0F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A2903024976
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 14:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920CD279792;
	Mon, 30 Mar 2026 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mX2clmjv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bGT8ckyW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AF0282F20
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881066; cv=none; b=ssHnP0dWVOyN9O7Wh0peEY90qOsmjUvX3lJ02hr76OibSKdp5bx9+yU8WDPtQaQm4tL9f+FsMk59WKXqbNbPSxrhyKRTmlPBdEztK6Mg4E0Txduz6pexDRFetEVrsVBiIntXVWYgiH1HAY/cmRp2KKjjRxT+ytqFhY6jCZxRoP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881066; c=relaxed/simple;
	bh=QNnthAbGyfiMp+Odo54pfn+TEgb5VoHLJlJcp3Y7J84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G4b6NM+vkEMvrvUuRbZfIeGumxvddcRmAZyGoSRivtMhtS48VEWyktjvmvUkJRRAM2cfRk5fswu7qmQHCztK8PC0C6qgmlmTSjxzjzhVEajby1k4n0wCp5P9F1nf8HPGBk+6GZgE4NmHFoTZq4FdmzW0ENlNK4wJ1E3fYP57U80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mX2clmjv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGT8ckyW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UDi9hP2458373
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NItTm+O7bKUuX2ueoJWvOi
	7quumA4MGcXMvGHvK1sGA=; b=mX2clmjvXNU7tLZOHR1Smmmtn4DyQ1AlclyW3u
	RG9VTodI8Mls3BfcPAD5fM3Aj1LImo+YxvubUjo4EdfFDo6xeHP59Rwr9BpswKrE
	4Qhw0PpWj6ta32avIqBL8RQGPvHPYgMlp/6e8u8NSP/aIse1f9u7/CYOTH/4N2ya
	Rv+Qvzx0RGZhiZtH6JYTYKAS+0LJUK1yPSO9T5sSSAbsmxk0vEPp518l9t4OewHI
	k8Wlbc5lIPbZhoKA0v/0uS8eWshJjZ8ocowRph/s8CJUT/+n3zCkb2lP8fNThgR1
	ZQCEsjx7aNKIL6fi+fDSYYYT9UTFqdj1w1cOXq2DFwRykdEA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmsgnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:31:04 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-604e9bdda95so7064433137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774881063; x=1775485863; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NItTm+O7bKUuX2ueoJWvOi7quumA4MGcXMvGHvK1sGA=;
        b=bGT8ckyWy3vNa94bwLE0kTQ0aSdKIDBLaQj/oMZipTBjijnRa44Q7ym7tCF+hywxzp
         ciENvhG0umSoXGMe6zTWN5iMavib1HhhALlk0HOthvJQsi+R/DXLhtY3wnZyCbDAp9Lg
         95VjAqblbKhgE4qES1Yreemp44Ceq/UjjnPWILii+yXVgRbcnVd6EMaaqu2FU+qvNZiZ
         cZfeIhYlqZrlYsUyiS+zxpYd+13L/eDQu/IiV+0oCCdWIcbCaT14I+hAiSrGQ+uXvMGU
         UVzkf0qTnyhoiM+TRhX17H3eTa0JZVJxnVENj3BgNNCaRFDEuter1Gdg16pQVWZ0kryF
         5Mpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774881063; x=1775485863;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NItTm+O7bKUuX2ueoJWvOi7quumA4MGcXMvGHvK1sGA=;
        b=M4KmtSKghowX/hem90U/8khDrr2tOG9qH7A7euEdrusiX3Ug2THVafJgc4nRM0TMTZ
         1I95yX625eWKnExiuW8FDd+WR5SluICXYzmT8mChdN0aiar9W65DYFkoQ5VXo1BsW+ox
         rikF3AndyQYyUx7XQEZnDpd7teuv3pnAytGFN0h5qJEhDr/4eTkTUMIhn5H1AZq/cZio
         Y+mxkj86PNQLiSmV5vpcTFHD+P38Lv58hUj4uF/YKVc6v+4mzkXnk7OTslA5c61C0sMg
         sWYx4CBBTmiTa50s4ErZCs/krleYvlqd5SETlOGb0y5CzW4P6mV7+D9GNawSRjjD+CaR
         GXgQ==
X-Gm-Message-State: AOJu0Yw6Hvn5b2qXEwmfnrvoTcVgPX0I9/AbD6Bm+3uM5XW0PQD2dQf7
	KdCl0y+fG1BYZhR1Ur2lGZujKUjkXUQ7XG38C7Tbv4P5Rt3e8yYwPd/Djj6IZrZOqrgjbxjQLqE
	HU+EqlCTsqK2A2eMsRaWZhxs10PmfyoIR59ma+eeJG8riobGKoHwtL1IL9cc29sGWG/0U86hh/Q
	5X
X-Gm-Gg: ATEYQzzwpHOCJizqQKuXwNR55ulr9jppxl4Edk5Fom+hobXBo/P7ydFCiaW2VGO/m2W
	QgH3o3NwnphjldXrn53SGCuAOTciDRx7IwgPKEyQhGWd/HtcRBn0tvJ+s3QZIs11HvIavb8O3lV
	GFYaVfcpw/QSJvscKBfWNUfCfksqBwDuQ2OwUyYdBN8qJRdtOGTdva6ab1wdfYcBK+PDdmbJGDD
	LH0dvX5MU6Srfb+ZZOUcjWPXcl/5s3cONlWycmpECaHy9RaIg47psHH7pMKvUmoSPOV1wSNSXIx
	bbUQQSZfZ74LtcHLkuk+p6aNbxy62XtFLcWA6y/Y+jBp3uy7+VfS6a0boOiVms/ARYEBvu4sWnJ
	ahylPrNXFNIStlhPQ0oIw/o+hv6oSmA==
X-Received: by 2002:a05:6102:5091:b0:5ff:fbe4:8ac with SMTP id ada2fe7eead31-604f9278bc8mr4922533137.21.1774881062961;
        Mon, 30 Mar 2026 07:31:02 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:5ff:fbe4:8ac with SMTP id ada2fe7eead31-604f9278bc8mr4922502137.21.1774881062398;
        Mon, 30 Mar 2026 07:31:02 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e9e24sm18248584f8f.10.2026.03.30.07.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:31:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:30:56 +0300
Subject: [PATCH v2] soc: qcom: pd-mapper: Add support for Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-eliza-soc-pd-mapper-v2-1-5f10880a2b66@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB+JymkC/32NTQ6CMBCFr0JmbQkMWogr72FYlHaUGqC1A0Ql3
 N2Ce/OSl3zJ+1mAKVhiOCcLBJotWzdEwEMCulXDnYQ1kQEzlFmBpaDOfpRgp4U3olfeUxB4kqo
 qjckwlxCbPtDNvvbVa/1jnpoH6XGb2hKt5dGF934751vu/8Oci6iyKI5GqqZCc3HM6XNSnXZ9n
 0aDel3XLyKPdRfPAAAA
X-Change-ID: 20260327-eliza-soc-pd-mapper-256a87dd0216
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=QNnthAbGyfiMp+Odo54pfn+TEgb5VoHLJlJcp3Y7J84=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpyokjmaNxsA1o33AIQfMPmrYtD8nXkZIgRXFQY
 C/JXOO7dtuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacqJIwAKCRAbX0TJAJUV
 VidSEACSfJ5iUT3AaqYQNcZvj2EQ2Zkbxs2jKczXMPgZNDqY1DOLdL8U16A4jXhlIPJG7EHWdeE
 VTBPzab3JNWqNxZYrsYcnKWscXCcuKXU93dyHl/bO6+dN8L5xT7brkEiFB40/TkkBp3Bf2thBg1
 YY8fRpF3cHtTS9GYlzuwoJBG4RqXfw76jxtdeaSw13senKsG/7VVwO101WnK1XvhPI3xm28K/G6
 3HYdI3l+uYTAD0g6jELzdZSwbZNHCJsl+/ymYm3mXfeELx5lrmmWQjdkRyJ3OL8oZSTAeUfBH1Y
 pQXax9BNc9JSaUcu1gB3RWt4KQeq39FTqbPNCaxiF610Q+0sfoS6umG+nGLk51W5xDONX0OKAGN
 eypfQXDriLHCanVbtLQoOA9mLPTMZ9wHJPg4Ch/q4L1KuHIygkD6CqV5WvWd730j10iu89QI1sV
 nfryXoJwbkv/Oq2KdrzuJ1+v7HsnD32X9q81N9tEtLJ1yJllx1tnGkI8T2dj6svm7MKCYn+l4Qu
 1XAJFZmdpiECXOjOJm/nt0wMnYZ23K/xbMG2L24UzwNKsMgTp/AYBIYDb+kTY2dT1bNm0+D9mlB
 wo3CXFwH19h2rovrW/CtR3y/i7shAwBpR7cjAMSHJldWToFvGX/zTfHXIBIJ/kSzA850Lc1GERq
 NCUnYds5W/nMXIw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDExMyBTYWx0ZWRfXxl2/YA0SIGkO
 icunci/81ibaQWU4D1n/9J1ZRH74Sne7oWJSSs7AlCxrSk4gcSLyxMivsTP11wFdx8SbP2eKL6I
 fLgtl/ntGofHbO9aO99w5Ttu2vBU6QXKlZheQNRZXnzHCQjZ24N7nkUDsirzITDdKMPMWw9ADbS
 LWu/FH4NisrG3FKInM7+SoTK2OPnNjnwxTzRfq+qZcnRIghdO5tkO/paNPL47zg4FtfITKp0MOD
 c+P9QG4hqiQQYs/NotUjsBmTmCdvjNyijcT4gFsecGA20oHryFZ9/7711t13r9MYJSJ+P13XyaU
 nj12EPLaAipSGceTKcHRWg4HY5zCs7JeOVtus1Az4BgveMDQHHfRwArRLcNndG6Cj7HwR2N6PLb
 bQcILC6ZZRFtxmu/x0tG9wZCL1eBAn1lAWpfaI3Rv8+ZUJ0wJQJYMEH3GcxWHGOpF6xyYWHyO1Q
 /f3o4jR5tBk5IDjgmNQ==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69ca8928 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=1UCgTMz9MQc3icybWezSFQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_Vp8daA6xblnDlQXL5oA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: qz6SbRoWTX2_4VvfgeAur2UBgs-E1JU9
X-Proofpoint-ORIG-GUID: qz6SbRoWTX2_4VvfgeAur2UBgs-E1JU9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300113
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-100817-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D9C535D0F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the Qualcomm Eliza SoC to the protection domain mapper.

It has the same exact protection domain configuration as SM8550 SoC,
so reuse that.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260327.
- Picked up Dmitry's R-b tag.
- Fixed the order by the entry under qcom,apq8096.
- Link to v1: https://patch.msgid.link/20260327-eliza-soc-pd-mapper-v1-1-17334d6ab82d@oss.qualcomm.com
---
 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index a18cb56de579..185145522a96 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -579,6 +579,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,apq8074", .data = NULL, },
 	{ .compatible = "qcom,apq8084", .data = NULL, },
 	{ .compatible = "qcom,apq8096", .data = msm8996_domains, },
+	{ .compatible = "qcom,eliza", .data = sm8550_domains, },
 	{ .compatible = "qcom,glymur", .data = glymur_domains, },
 	{ .compatible = "qcom,kaanapali", .data = kaanapali_domains, },
 	{ .compatible = "qcom,mahua", .data = glymur_domains, },

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260327-eliza-soc-pd-mapper-256a87dd0216

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


