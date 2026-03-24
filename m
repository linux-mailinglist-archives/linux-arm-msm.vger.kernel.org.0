Return-Path: <linux-arm-msm+bounces-99570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LE2LPw/wmmCagQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 08:40:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B076530415C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 08:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 966F430095C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 07:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F115F33D6F8;
	Tue, 24 Mar 2026 07:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A9956lnN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SihwLEcD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D261E33F5B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 07:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774337990; cv=none; b=VR2Wo8/th5sTQVm9//HunaG1kwNGQ2DJvU5J3jvyMF4rCc96dzlqQ0YZ2ljFhk5bdgGcYIZKD5dqxcjwlx7vBEc47wZKPYprdUhbRypuYFs1KMzCno3sZO+xepSax3m/kEFaK54TqpyY5XPJM8N9gh/eg2tbCwfJ8/Kty+FKkko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774337990; c=relaxed/simple;
	bh=JfHnR0kRrE0+9OVj0vyCRPCYRhHUFBZaxZNqpWOcug4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jv1MJahfrDxEBDOMuyxbmFDBH79YAoDXq0Qb0vqEWtbztbVED7Yw3UGnaBUiHRLUVTLZnQ+Q86wugkvpo3H0ZDPBW0DPTppU0f+Eu59ZnJpjT/+HGVRhi/nRLEsBVeh5080Hbjs8MTVtpHXsXlo9s5FEcsJU8G8LOhihYLV8VBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A9956lnN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SihwLEcD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3nfBo890467
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 07:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=S/SLGvCH+VZJTWYERgmhUz7ZfJe8c83/NgV
	b81UtaXU=; b=A9956lnNlxZFeNn8sOySHKWOuWLFj4ueEsB4p0bLnzGMFuPHtUh
	AAIUcVc83J5VHPhTetBiaqQQ9yRanBnuWyD3bUnSmSDGiYnLO7p4SVV03nJhMwK+
	bRPwkIM9IT5CLq5QzBEoIfu6PJ91hB3gjTqAkbmMJZu9diQnf1pgu2pw8WCOhbkK
	C5a6j1sBQrepF6YwOZS4+SaMKT/UDRTHcUH1WkmQjqAt9Iik3zHUcnR/IoGUIg0O
	Cgfhbj5/VXEGyYSJiGNlBN1zQukt8myHv3BJvLWZaLk/HvmragcpfJULdZj9nBou
	5x1XFC5SZdzBieuXjCn0uiDX/i60iLRlnFA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3k1x8rj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 07:39:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b04db6c138so70042755ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774337978; x=1774942778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S/SLGvCH+VZJTWYERgmhUz7ZfJe8c83/NgVb81UtaXU=;
        b=SihwLEcD5ikRzEkoZ0W1aB2KzKRIhfSgWtBSMi+mgB0WosLg+xsPmY90mjkjF89kZv
         KtpUv3z2L4waE3x0FhYL07SviKiGo73Hj99IwQrBDjx9VelEQvRxcXMMdcqSAK6lzcfv
         +dDOYymmSeAW+LszURHQyNeXQ6kqlMNTs3rdRQalZ4k71KyqrUeZLilBX/t3Ipt+doMI
         tDdCgglA7mBv07XrV9xWY8uXINZ6iWLNRQvzjjEMeEnSeFgET2McwrcMXgNcRZj1IDDi
         qce5vkvtncORmxl8yFZ5O6bqy3XkWPrI5Y5CpEKhSunwHIjc7+k2lLosdDpeqwY/c1C8
         ON4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774337978; x=1774942778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/SLGvCH+VZJTWYERgmhUz7ZfJe8c83/NgVb81UtaXU=;
        b=UmvA+jb/tkPxz/wglGXVCgJAQICPSYX/IxonrpK8K7GDfcSivmwXfvJEBgsO3PuiZU
         J0B0B0GPCbgISiSPOWk0yT+l3H4+AhRbN3vgV14QFbDn2gBcfRDwwU/8BGsZmAncUdTA
         sZYWC1mA+jb/Y123bFefzXQQNPLO4uYExPVW39ddVPf7wAuojEPMBJ6CFyWaJ3kvpOCs
         qqXKs5RM1XnMblxUMy15PtRMRrjCJup1FGO2goAYQ6vikTqmHzPi0Mkwlk7pE7k02RlI
         Qb2eFmveFYLdJ4Aa/QeDtmfF6O7BmFZxV8MaiFdASnC3bvYKtHTQwCMaVOPh6TC4G9Wz
         BrfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNYPFXPeDU6xo20pfknO4OcNUoGBA0mKBHzWr8wHmOqVgVQkc7I1Ri7Mu3O5zzAEIDS0khG3eGrF7hN/mO@vger.kernel.org
X-Gm-Message-State: AOJu0YxnnESGZjXWsfFxpY6fqmQb3T8wqcOdc5vNbZCiRZLlKlZiF7ww
	tYdAoNilShUS5DrwgJNDCPJ7t1c8YtJeGiTQGtGfaToAiKdHyLOcX6WZcZBLwFYc0h2qjCjoSwy
	iIdOKLEjDhS0wl4eXSFEorPSkzkQWm+iDl15F9T5TtJnq2C7g5/P7Fs7ImQk9fyl8ORgn
X-Gm-Gg: ATEYQzyFK6BRJaZ6vyAIaQZf6BotlVapCmeG4SOY3KmoVyAeBGwl2Zxe7EilYYWaDG2
	6Use0WHD+DR63RD7WZXVeqgUAIRHcAv8uOYK0Yxucafv+G1bvFkX/QXFbHqNftNrKr9B3KGT3M6
	LJvVhut2hQHrV8oAMlzXBKSscG+MxDY6DIRpc01Vi1/p6Aip4JMu2cH+IbKwms9w9K8hUKZSo1e
	qYukDlWZhs4Wccs5QWug3W4STzrahgPABOoZ94F8BsLUxFiU2fzOBXkHGsHHD/Je5TzNh557lMj
	kFwNIPP+ViRiikxprd7AJ2MkhjT7k7ZSGdgNJ9xfTeo8sjVny9N0+BwPZmKPZwHehAkFeB3EbOg
	EU6muLl2XetmMokhJtygDitqN52bkMzS5MBZMOLA=
X-Received: by 2002:a17:902:e802:b0:2b0:4a57:e480 with SMTP id d9443c01a7336-2b0827ff69dmr139327095ad.45.1774337978537;
        Tue, 24 Mar 2026 00:39:38 -0700 (PDT)
X-Received: by 2002:a17:902:e802:b0:2b0:4a57:e480 with SMTP id d9443c01a7336-2b0827ff69dmr139326825ad.45.1774337978049;
        Tue, 24 Mar 2026 00:39:38 -0700 (PDT)
Received: from work ([117.193.214.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083549f63sm132738835ad.30.2026.03.24.00.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:39:37 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: bjorn.andersson@oss.qualcomm.com, konradybcio@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, wenst@chromium.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH] arm64: defconfig: Enable Pwrctrl and Pwrseq drivers for PCI
Date: Tue, 24 Mar 2026 13:09:31 +0530
Message-ID: <20260324073931.23739-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA2MCBTYWx0ZWRfX7iOerp1PfgBo
 ie6kcs7UUItv2T+bTNm5mQ7O3z/KPpED6e+Ue7RGEuWftEs8IfHARmfLjbZwwzaq5p1JkTKSqKx
 Gbr/4qjRjx1AQ/Nu29Y6Kqv0x0hMo5eZu2O7VPyz4+nEFEfA5tJ14i83iTYTqLW8DtYlHxCEeVY
 F9A2fO9a1DRboSy7lMYz1TFEYXQl1YUKlGOusJFNq1766WiiUBHdqGhFdWBdr+72TZPVR+bcs7N
 MoxwWpQ67IcUVEt1rLSAvjHLJKfw0U7LrPexNy/Fmpf4ZvV/ONx9XGiVfnwIjECAQGTLYRxLSmc
 y/UPP4mnz/1KPOrWAMQLM9j/AMOxkiUUq60ipzJWSi78Zbztw9R5lpkEia0USxwaxIb2drZ5VHg
 c/M1NH3MdnUYcGbvPplOytRSI9Se13AL+thxlxMxAU3yzow+8JJkWICiLF9Gz2WJw6Jbx2nhfw3
 mDKIlf7KQDZyGaZ6wnQ==
X-Proofpoint-ORIG-GUID: 0srEeZYv2XhZUXmFqBnkTQyUZt02GWp2
X-Authority-Analysis: v=2.4 cv=O880fR9W c=1 sm=1 tr=0 ts=69c23fbb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=13ILl30Z8QjaXWZz8Pan+w==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=L_M1a_yadS0eYkiDDjUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 0srEeZYv2XhZUXmFqBnkTQyUZt02GWp2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240060
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99570-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B076530415C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PWRCTRL_GENERIC driver handles the power supply to the PCI slots and simple
endpoint devices and POWER_SEQUENCING_PCIE_M2 handles the power supply to
the PCIe M.2 connectors.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---

Note that CONFIG_PCI_PWRCTRL_SLOT is renamed to CONFIG_PCI_PWRCTRL_GENERIC in
pci tree. But I presume no conflict since the PCI controller drivers themselves
select this symbol as of now. I plan to drop those selections from controller
drivers after v7.1-rc1.

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8a5309bb2029..597e013f709d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -259,6 +259,8 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
+CONFIG_PCI_PWRCTRL_GENERIC=m
+CONFIG_POWER_SEQUENCING_PCIE_M2=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y
-- 
2.51.0


