Return-Path: <linux-arm-msm+bounces-90703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLKwDtOVeGn4rAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:39:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 914AA92EA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61D193011C7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA59A342505;
	Tue, 27 Jan 2026 10:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6UgH/qu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FXtuIZ3j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEA4341AC1
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510352; cv=none; b=i2aSVp8q6x1N4KDHNV2mSx4wofKbOy+RsCrW4UcBQSumfZ4f+pznzeRnb8qnzP4wEJ745wEsHc90yjqwywxvSuHLEl7CUXUguXbwRjtMvJm5TuEewmF4C85R9LCfO1zT++i3Cf8Dd0pnJNUM62JGrY2Trh59Dj/8y2QUrT9/MyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510352; c=relaxed/simple;
	bh=wP5Up7h8FPoojvpffyb88fLtySJ2TK1DZ09vgxeZucU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tcPr9EwovSOm1qch4PuU4WCtIkZqPjsGbWTrJm4ZqKBsbPhK9+88GLuAAAKnQuDWV2XTiHkWVonIkC99CprjRv91QyWWy4E15dWKydNrT5Q7HFkb4PK2FpIaIatkRmFBs8SYFpZCB/aIpyqou0LKdsGAErwYyHeCFFgG/y2z79o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6UgH/qu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FXtuIZ3j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAXuQ91268864
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8OqrkD7EH6hZmHf/8D2DYd
	YvEGdYfx2hSknKEAnhQ0U=; b=O6UgH/quca++KJUvEDlFxMxFLPo4CW750pE7SF
	GaVEJL3UpEIV3IhK1jibvuFXBjSDq/VUU0jX9svaaJZOvr1w3DEVf53zN3OOqQ+1
	mYGMdYfjsFKLzjsQe92ew7jC1Gpk1LK3QEogO+U2+GzeI7UyPgAizQhAiN7mZrV8
	SAdIxUpxcGUJEsxpiTpLMV0NjI5DFIlOCDJAS3Gzud1kIN3yMYKJ3zi26ZqT5IU+
	3algGO4b1EDpXPB0VNEi8w+1jbzRQdzGa/mnQMnYYyIdDedNHrZ9mRajtiTEYb+w
	z2tfli3lg/gI4aYujuGYFBjmW/Wezn0udnrsS4lpOyGmtLNg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyasbfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:39:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a76b0673dcso53007095ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769510349; x=1770115149; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8OqrkD7EH6hZmHf/8D2DYdYvEGdYfx2hSknKEAnhQ0U=;
        b=FXtuIZ3jq59rIxq70nIvn5lL65K0+ZlaRoOI2Qg4ExU+G+Eh5/+xaF8RxFsog5WNOL
         tq7AD7p1+XDM7nkMRcAXwKnwpRr49ER78dDxTBiM+4iEjHEm3hVRsBAG9jqM4RDRzGJ4
         kFPiCkjLd1PENJgCyld1AiqfoydtrFPR1ft9jSH116C4UoFk+aUk6i0GY1HzOggJbhuA
         jgx86ofkxi7r5O9sTDLEAzjzottFnCeVcI7P/QFbtpWDYtQrwgIiNRiQ3xKUanWSPoWU
         riDSLYyr/HpfuHcPwjGtmqfIuvxjKe+RFJWEbuYqGwuYDX3pB5ODxLB5arMguCRMSzPc
         ucnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769510349; x=1770115149;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OqrkD7EH6hZmHf/8D2DYdYvEGdYfx2hSknKEAnhQ0U=;
        b=IXdNLLES3qAyjyOYwWqPO9/xeqZi3dcYh20bkatPL6uEZufzlRwiQoWDKKMkaC2zDD
         UxMVAlg+Xf0SztRAXkOospLOHwfGYsYdvDgAk5dPXnHxP/Tysl1hcNa/Kdresxv0WxUb
         SJbeqoiVbr8fWzkAnq4QUUKNuFmss+CzeMj3oyqk4FR93PGLtx3OeOqbxDFaJD6i1RBt
         oRWu8ySWu/c3J36mdBGhnTeOiTPh5NIo3lO1cWxx3dOJiL0MvyO8XO3xxRCxPjKvcfQd
         q6pmWOvO/kiSFtvZOm07GmZ3n7lYP3yWneeNsMzGy/ZaaqinI6V3+DPqOqi7G6zmNZE1
         f6+g==
X-Gm-Message-State: AOJu0YyLlu16P1esVzMrAT7WXSny+jzw0cHMy2vra2eZN5mknxtjIJ/l
	DUo0KaQlrc0VxmI8YVYFHEEEj2kVpV9C6AeDGd3nZdhz3+G9Nq5j9zvXDP2XhrRleJzHeiKeVuI
	0AoCmTvl8JLIKdUwnlKe5i/Su1IQU6vAkhtPHiBYmACmb8Fc+XFhPkocv+S2jPDQInr9i
X-Gm-Gg: AZuq6aKbCPj8c7Rp8FWsRTZl2QOdeUNVda4mBppFcuF+w2+kTimpFQFXI6VR73SPF9L
	7cienhE0gOZhRHrqRr/6CTmP0PHuUdHoyguML5tAlK5Bzq5Tnoj64ZfeCobVkPF8E6fMnHZRU+u
	NnPm4rTmp56BgCMLpjdxpCHOCPwXbXdvbHpgxFR2h+8JzvoH3mex2qD6jHdRZohKHE7zGa3aIi/
	CNOsXbxzp9j2+QjR0beXOI7OrlTJvWJTUkvXvUvRVNCJfoEAh3dCk0cXlZAGwXH4pYmUHhNhE3i
	563AH+a32DIjLG3G5Bja1kBv0hCbxOUUU3stvXvSegGhYQ5kU6v7rHSHEobcXRv2I+C/viIP0xK
	bl84vdoIrb/pH0m6KNXJoXFU2J5vV7a6V/PJZXN4=
X-Received: by 2002:a17:902:d4cf:b0:2a7:dd37:6e20 with SMTP id d9443c01a7336-2a870e34d04mr14317835ad.30.1769510349166;
        Tue, 27 Jan 2026 02:39:09 -0800 (PST)
X-Received: by 2002:a17:902:d4cf:b0:2a7:dd37:6e20 with SMTP id d9443c01a7336-2a870e34d04mr14317685ad.30.1769510348687;
        Tue, 27 Jan 2026 02:39:08 -0800 (PST)
Received: from hu-deesin-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa782sm113957055ad.5.2026.01.27.02.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 02:39:08 -0800 (PST)
From: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: [PATCH v3 0/2] soc: qcom: smp2p: Add support for remoteproc early
 attach
Date: Tue, 27 Jan 2026 16:08:44 +0530
Message-Id: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALSVeGkC/03MwQ6CMBAE0F8he7YNu4CAJ//DeGhhgUZLa1eNC
 eHfbTx5meQlM7OBcHIscCo2SPx24sKaUR0KGBazzqzcmA1UUoNIrRIfKb5JWdt10xFb29gScjs
 mntzn93S5Zk8pePVcEpu/fVlhQz31muqq7hEVqpE5mpsWt87LOYjox8vch+C9zgH7/gXc6a82o
 gAAAA==
X-Change-ID: 20251127-smp2pv2-bb88f617b5b0
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-remoteproc@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769510346; l=1329;
 i=deepak.singh@oss.qualcomm.com; s=20260127; h=from:subject:message-id;
 bh=wP5Up7h8FPoojvpffyb88fLtySJ2TK1DZ09vgxeZucU=;
 b=XIXR5ZcICW7U41zyirU1OG5IYBTYCBImJueybTx1vqNlLO4LUogtPzp2gWWn4x3qWfRYqOvLp
 ckunCM9cpHOCw51lWzQq4byRCVduVh5Lt8tcdD8MkbmaSgAEgBfGzxl
X-Developer-Key: i=deepak.singh@oss.qualcomm.com; a=ed25519;
 pk=fVTLtknRa0voM2B2QT8dD1HmvNdAnw5PY0XmwOE0ldU=
X-Proofpoint-GUID: laDPk8zuW5yNmzrtyQGnm7WyUx_gf_VK
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=697895ce cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pU1neFI-2OEFmTL_48oA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: laDPk8zuW5yNmzrtyQGnm7WyUx_gf_VK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4NyBTYWx0ZWRfX1zGZkL1EQb1d
 XBcR7HYBiCzejxO0J6nQR2BckW+ts9D7bUh14uEo1Cu9VWYC3ybvxmIaQTO+5XSfOAeGp96SXwt
 hVj9SDlLk0OM8Q6xzkLQ5evGG1eCfJ0N/0K1SIwiCeP6H8LZQF62oI2MbDVO3BMru+qVf/Z/+cd
 CMLc5s29VsT298hCl1X656YuasoQHk7kb7If4ej7SKAHByFWFiNZvR+MCO2mAtK2wbZVSZCFM5z
 vUmC7DFnPqLpa6GF+P/J18KTOpzce3J32TJI22myqlygDVH/oLEXFPq5wnJO5HyvGVVmnBFZmbv
 Lh0oo5k6uVLF2GuVJmkg4PmGT9IrSZP2hnoeURFf4FnyRkq09JYsnoU1YeWcIApqvsNnZsVo9pL
 dCoZxWDXNqzuxB62AVJG26r/HoNh1zv9/aa7oiu3/hnNkN6luOQ+2tGII1CTLgYx8P/ZKA1Q/8N
 MC1lfeA4wEIa08F0G8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1011 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90703-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[deepak.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 914AA92EA7
X-Rspamd-Action: no action

Some remoteproc will boot during earlier boot stages, add callback
.irq_get_irqchip_state for remoteproc to check the states in smp2p
and mark the state "attached", also add smp2p v2 support.

Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
---
Changes in v3:
- Update commit message.
- Clean up macros for smp2p version.
- Update description for smp2p version 2.
- Update version negotiation to accomodate version 2.
- Address other minor comments from v2.
- Link to v2: https://lore.kernel.org/all/20251103152929.2434911-1-deepak.singh@oss.qualcomm.com

Changes in v2:
- Update condition to check version 2 in qcom_smp2p_start_in().
- Add more comment to describe above condition.
- Add description for version v1 and v2 of smp2p.
- Check validity of in_version.
- Link to v1: https://lore.kernel.org/all/20250923-smp2p-v1-0-2c045af73dac@oss.qualcomm.com

---
Chris Lew (2):
      soc: qcom: smp2p: Add irqchip state support
      soc: qcom: smp2p: Add support for smp2p v2

 drivers/soc/qcom/smp2p.c | 103 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 99 insertions(+), 4 deletions(-)
---
base-commit: fcb70a56f4d81450114034b2c61f48ce7444a0e2
change-id: 20251127-smp2pv2-bb88f617b5b0

Best regards,
-- 
Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>


