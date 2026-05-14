Return-Path: <linux-arm-msm+bounces-107604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YI4UG0LQBWoPbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:38:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA98354267B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE3353081A91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB02292918;
	Thu, 14 May 2026 13:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jN5uf7LU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hKZNdCe3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1083E2754
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778765805; cv=none; b=II+fjw9DbqKevitZwhepB/+z1p36f+daNSperlZ4pPUjdDWJc8mwgjjSZDXLesGkzwNeCeORSyNmu3LP+JbuFk+kbnpHMwo1I6LxJC7/aLRK0fDvUovd2gEk8ZkrHdx7MNuaPrjjgodaFVr9IsYb3om3w1j0dy+yutwZq/KOKow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778765805; c=relaxed/simple;
	bh=vW09mPGHEFBOAlpegnp8Dob8GfGLJ/tfxP4gmr3uAJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cKwNnRX9l24dRnR2dlDyf8PiDv1v9tNw235MNPHKH+mpAYwFQTVcABPN2oDx/UPHreU49p5vIuE4rgUjHbhxCtD+n8UomliHE2WhO85ceup+mEJ3h7/JPgip4+CAmnLSspKTLWhM4FiJKPHYxxxqBU4Crj6ELqxEEAMMOuStQ0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jN5uf7LU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hKZNdCe3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBel0u3952443
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bEgeuV426iIHfMfTY+CEsXsWDY04sg4kubwVqpryfwg=; b=jN5uf7LUZIQhYGXE
	qGJdpbP3s54nELpryQGdN+31BvCCDaaDw3FHQfeTmEtJ/mBkQv+Ga/g1+0bky49N
	+JqTBXByhROTsn1DP1UT9uW4XP7N+5yiX+wWBUl964sQa30RujUC3JbiRAyhb2D/
	px3QmP7eH1+PswRZbyf2lKuWczcKKdmsEiT9d2sIDSw6bVX76XL4sOHOt1APMc1i
	XYQgkOaP1z8PvHdr19ZqiKFEeHPCcbjHJrPxmAR5JXXzFyfUpEVXhYZe+YjsKNuT
	TRQEBw2zBClkhVfNuxLByPQp3a6DUpRmIV65gJgNni6R6D/xYoTF0NKXLC7PiSUO
	a1E/vA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57kssqhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:36:41 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95df04c5136so9558011241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778765800; x=1779370600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEgeuV426iIHfMfTY+CEsXsWDY04sg4kubwVqpryfwg=;
        b=hKZNdCe36qgZu4hy17pk+f9+lRO99IUl16KaZ9f5BV0Jwbeq1NxqJT9sxJWaDKcaUe
         Zx/rj5lwDQRDwZQrzIKZF97f0jEX7B1Bkp0AGXuN/yaMJG93O8of5t+hpdxyMeOcPlXR
         TUyycbXp9me7C/XdMUDCbJmd3KKz9FrWKjZpO9q5buBE5JKd51qI7yn4YVndGfnG++fP
         kv8BtOGu5PvJytowFqH95yKqDNvTzbdM1E1lu0dEYzvuBYtNwnC4F5a2P/Bu88S9AkT7
         zxhtRh++7XwK4svRc0V5qOPYDnZODeruwmDywxHyIW6wlYdMmHHdu2RppW6pOzaQqvkV
         YF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778765800; x=1779370600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bEgeuV426iIHfMfTY+CEsXsWDY04sg4kubwVqpryfwg=;
        b=CawKS9vO1vqSFyVsrzzZl2ycsmBDSHV+0GtZwWCyafgy88uHtSvUBLBsNBrG2PpToc
         qxlXAlatujEIybkJHcdfhUpIMNBPP/QU9fUbmdAfHR8UaIU/tEqfpSAIdIVRaHYfojT8
         uS11yMFuLpV/UDX2RMN07ZxmohL51i+nM2UltQaUQTu8NCI2ZbkLXiYEAprc34NqiGEa
         u5iU2PyWDMYHDfUPRMVdh2ruqhga52hXkGLxKryEDWifUElBUTC+HNa7x+Y+PudG6vJG
         XZn87gcsc2YwLm+gFsqq4tUz17ja4dRl4w0ItDg/NvQ4dNzWHpDKP9hMnKA5ZWNoerD1
         FgAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bGBL3xHrHR8Li02qCZ4yIDr6+feAsTqEg3QhovecWDDm4A87RwZaMc2r++tZfdJNY0SCNgdJPk+qN1c6Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzHGdG91miPCP0yu2OJCLD2uuQJ5A5gjyC8fMM13QGgmYeS25yr
	gAMY7q3IrcIHvCYxuw5UktalM/gEGUUiKC35ntUVbHBbQDGaeCNS7ADO+H58/D9UQ5IX7yzcyqt
	OPXUJrRIIYyYftz5Ftq/ijqrVCI4R6xgNDgX0ryXUPZpzwdlF7DBxq1sMOQWTI7L9wHsZ
X-Gm-Gg: Acq92OHXxfkG8HACCJU7OZT/0Qfy49Z1j2nOq+yEKE7dLjvNHqc3OLmLt4kR5OZJ3B3
	VwKt6waZoPiCfplSAAGuWDm8o6hSSDoozXc6+mxElmXydFQiAAQbQVpKXbvdvx4Xmi5p8yXpLgk
	eGrKaWgYotwsSnx1ABxCMRvG2eewrShRgUqczFr7axkFuSU4cOneYD/WnQ+UzYpVvPsovUpzIxM
	qL5FOZqPEX7IpKn7vkizendyzqUZYbD8ANnpYtimL7PdHuIn6Sk0ucY33jUgp+ij8cVmrij/cgq
	cFxvff/F61udGW6V56mMx14q3mrv5X12jEwb0q8/fTRBeq7VRBwOTEIj95pIkA2lBnnaw/po7po
	hg2l0RBoEpIP6I5tKMIne7kWm66CVhg==
X-Received: by 2002:a05:6102:441e:b0:62f:5908:648a with SMTP id ada2fe7eead31-63776679ab2mr4192924137.28.1778765800447;
        Thu, 14 May 2026 06:36:40 -0700 (PDT)
X-Received: by 2002:a05:6102:441e:b0:62f:5908:648a with SMTP id ada2fe7eead31-63776679ab2mr4192852137.28.1778765799664;
        Thu, 14 May 2026 06:36:39 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm7382462f8f.10.2026.05.14.06.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:36:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 14 May 2026 16:36:24 +0300
Subject: [PATCH v2 2/2] interconnect: qcom: eliza: Add SDCC1 slave node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-eliza-interconnect-add-missing-sdcc1-slave-node-v2-2-13c03bc890cb@oss.qualcomm.com>
References: <20260514-eliza-interconnect-add-missing-sdcc1-slave-node-v2-0-13c03bc890cb@oss.qualcomm.com>
In-Reply-To: <20260514-eliza-interconnect-add-missing-sdcc1-slave-node-v2-0-13c03bc890cb@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2579;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vW09mPGHEFBOAlpegnp8Dob8GfGLJ/tfxP4gmr3uAJg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBc/fbILFD886PPfxqzv9rNFi++dDLcxaNa88F
 wGC9cQ0XW2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagXP3wAKCRAbX0TJAJUV
 VgW5EACOQespkkkNWu0elWTq1T0z2g1q5iKgfco3K71Xvm6DX1ToJCJFFdtYdZFRylHDvBALjaT
 WxvaLeyS2pbwW85KYoj77dPlLGvIquKUYEipE3ry1Gkf6r19ti4rdJkhSRnNuA3Bz5hXXfqFkSc
 GTTBQ9lweq6P5ZZ6CA7PnflGZkIl5S4z/kZyhopuRYO805OoPPDdpbIMVqhcbYyP60eSSUF5yu+
 M2yP+1nXvaTjb7lZQHl141yKOCQ0tsWXiLVe1lSvUECDxHdE9UpJqjLkrDnO6IjxfzoxyvS0cj4
 ziy/BxMec5W0iJD/FuWIvgkMp/hoH1xbldSlXNqNR0StmiFJTtFmCNYiUYrs7zViWBXoMT3Kxlg
 2ZDlx7qgKrZdj8hM1xNy/HEwqh+pqWeItsQ4Vb+iX1hK0zSeaIQmGJ10tPaQ7n7uuHlgKS04wAG
 WHOTB55l5Ez8m9kZyjSS4+rxM98c1AoawvXdraApLIJFVxwYcN0LsRybmqWQWn+JMhN7UfglTUS
 1MixYK7/qcEmfWzntaQ0Ynv//iUxv5dSsm7ZDn9WVkakE5BUmKsWyceRuhxCZqaXlwrZE92fSo3
 lrDSi7vUjsBwHMjsbcfDoCiU+YzqLBU3rxM/SZc+M+YDVst+A7Pm15tLhdpp4Ug5YtESKUbPi20
 ybh6BuHmyJdXwfQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: CNI4fH6K3Ue83Hw53RRDo18iz1y1n1Ud
X-Authority-Analysis: v=2.4 cv=KZbidwYD c=1 sm=1 tr=0 ts=6a05cfe9 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bhY4RTjvg2rligDOO-YA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzNyBTYWx0ZWRfX8n4uRgEqOYff
 EpU75U/9ir6zofEOj0aGdoHdDePbD1/uzb1bjU9JlJ5eENOsDFhVx6irEEFji3TT3phg7DA5XrK
 77577sSAa2LT4QYFxWYfpdV+5v+Iigl+w/gpwdNo4WXHCJZWtvjyE5tIM212I5qkYQNPxbvLbTd
 npgPgAUrIQkdJooWN4FCWN82hPixIE7F50yW6P1rDB8qa/s0quZ0oOvWwvYrh1G01cGPe3TJlpt
 ol3DEmnZRcIrbH/4wJwFsoGgEib3aFjVubZSGauNehN3bTXiCysYl9qWzRwrbV/VRrvHpTfsrhU
 kHfQABrgXPwZgmhKvEUqaa+LWlf/UT0t43uXOjUphQi3DLSHS2rMn400sR+tXtOb/GAnUeWJqe0
 CD7E8loMX2Hl+TdxYVKdwXsHdJfmF4591GzUs4IMTVBHK4uvSiw/mx1rppZ0/9A++OBdGheQdTm
 XVdaibNWzA5TFoZC2UQ==
X-Proofpoint-ORIG-GUID: CNI4fH6K3Ue83Hw53RRDo18iz1y1n1Ud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140137
X-Rspamd-Queue-Id: BA98354267B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-107604-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Eliza interconnect provider is missing the SDCC1 CNOC CFG slave
node. Add qhs_sdc1 to the provider node table so SDCC1 interconnect
paths can resolve to a provider node.

Hook qhs_sdc1 up to qsm_cfg and CN0, and bump the corresponding
qsm_cfg.num_links and bcm_cn0.num_nodes counts.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/interconnect/qcom/eliza.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/interconnect/qcom/eliza.c b/drivers/interconnect/qcom/eliza.c
index a4f7903f0524..891e4e6e8ba8 100644
--- a/drivers/interconnect/qcom/eliza.c
+++ b/drivers/interconnect/qcom/eliza.c
@@ -127,6 +127,12 @@ static struct qcom_icc_node qhs_qup2 = {
 	.buswidth = 4,
 };
 
+static struct qcom_icc_node qhs_sdc1 = {
+	.name = "qhs_sdc1",
+	.channels = 1,
+	.buswidth = 4,
+};
+
 static struct qcom_icc_node qhs_sdc2 = {
 	.name = "qhs_sdc2",
 	.channels = 1,
@@ -383,7 +389,7 @@ static struct qcom_icc_node qsm_cfg = {
 	.name = "qsm_cfg",
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 29,
+	.num_links = 30,
 	.link_nodes = { &qhs_ahb2phy0, &qhs_ahb2phy1,
 			&qhs_camera_cfg, &qhs_clk_ctl,
 			&qhs_crypto0_cfg, &qhs_display_cfg,
@@ -392,7 +398,7 @@ static struct qcom_icc_node qsm_cfg = {
 			&qhs_mss_cfg, &qhs_pcie_0_cfg,
 			&qhs_prng, &qhs_qdss_cfg,
 			&qhs_qspi, &qhs_qup1,
-			&qhs_qup2, &qhs_sdc2,
+			&qhs_qup2, &qhs_sdc1, &qhs_sdc2,
 			&qhs_tcsr, &qhs_tlmm,
 			&qhs_ufs_mem_cfg, &qhs_usb3_0,
 			&qhs_venus_cfg, &qhs_vsense_ctrl_cfg,
@@ -1111,7 +1117,7 @@ static struct qcom_icc_bcm bcm_cn0 = {
 	.name = "CN0",
 	.enable_mask = BIT(0),
 	.keepalive = true,
-	.num_nodes = 43,
+	.num_nodes = 44,
 	.nodes = { &qsm_cfg, &qhs_ahb2phy0,
 		   &qhs_ahb2phy1, &qhs_camera_cfg,
 		   &qhs_clk_ctl, &qhs_crypto0_cfg,
@@ -1119,7 +1125,7 @@ static struct qcom_icc_bcm bcm_cn0 = {
 		   &qhs_i3c_ibi1_cfg, &qhs_imem_cfg,
 		   &qhs_mss_cfg, &qhs_pcie_0_cfg,
 		   &qhs_prng, &qhs_qdss_cfg,
-		   &qhs_qspi, &qhs_sdc2,
+		   &qhs_qspi, &qhs_sdc1, &qhs_sdc2,
 		   &qhs_tcsr, &qhs_tlmm,
 		   &qhs_ufs_mem_cfg, &qhs_usb3_0,
 		   &qhs_venus_cfg, &qhs_vsense_ctrl_cfg,
@@ -1321,6 +1327,7 @@ static struct qcom_icc_node * const cnoc_cfg_nodes[] = {
 	[SLAVE_QSPI_0] = &qhs_qspi,
 	[SLAVE_QUP_1] = &qhs_qup1,
 	[SLAVE_QUP_2] = &qhs_qup2,
+	[SLAVE_SDCC_1] = &qhs_sdc1,
 	[SLAVE_SDCC_2] = &qhs_sdc2,
 	[SLAVE_TCSR] = &qhs_tcsr,
 	[SLAVE_TLMM] = &qhs_tlmm,

-- 
2.54.0


