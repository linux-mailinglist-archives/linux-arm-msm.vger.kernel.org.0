Return-Path: <linux-arm-msm+bounces-91919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KSkN1mMhGl43QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 13:26:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ADAF270E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 13:26:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8886308B564
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 12:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8272283FE2;
	Thu,  5 Feb 2026 12:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItKJJEqQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPFcrj0U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850463ACA44
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 12:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770294078; cv=none; b=aGrtpXmAJl8OE3MGDdzZMbiAa3p2NzJKfCULtO45Jt4n1BrfVat/jfBVJsDCC73lBmaFCUfLiy5xuPf1I2OyLYj5fm9yYnuDlrSoiWwCU0EjkwI7B8qnuMSA3v8FfLqnsG7JlCXCrZ1InipXWZ3rSqTD5hhjdBiQa7PQyL4j8Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770294078; c=relaxed/simple;
	bh=gLk7nejOp+ivzohe2LI/rhMsW9vFp6TIWkWuGYjlBww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G+G4cVH5/syZ1b86UmmTWERCyjoJ2asCaCRBbxWBYj+CYxFp0EFtKttRhBDZtMirdKie8fBh6SixXRemwG9ztb5z9efbsGe4Wr/+FEAUVFsy7u+twOaA1R3ekiUG1z7utRFAchtYhAFCab4LDzGwFbl1krrV4AhotYYzcCLBYO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItKJJEqQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPFcrj0U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615BFDm83237223
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 12:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5QXxndAGlyTM6af1ruiTFGOTcz7G9p/TwioW2Gs5DJ8=; b=ItKJJEqQzuJTqTeW
	bvaBK9IhojJgQ1bJZth+vihQMcXepZnSQR4o/Ov93/LOQeN4ayEXUImB8PPIXPll
	ibOFTuA0FnI17sz5fgC3RUWpEC8db6uuoO6in1CoBTcy3rOu5N+D2N6mmAnip8eL
	NiDZp1f2OhLZr8RaaoSBHqcSif7WwRVelJx+enx5ZcygulC/SrJLoD8ro8aYl8kt
	ZUS1fqtw51jzRxTI+lnh0YV2uqZzDQ4yaGVn0NO0HgrLprHdQwVgIlRLXKr6bXLE
	iIWqvfiEr2apHGoTckg6+iwsR+vRsWSOmfonT/1ujUCnPh+apwp+F4rMzLDsV/+7
	lMgyIg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4cp52jk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 12:21:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8232bde979bso548882b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 04:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770294077; x=1770898877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5QXxndAGlyTM6af1ruiTFGOTcz7G9p/TwioW2Gs5DJ8=;
        b=PPFcrj0UNH1cquYmo2JXcxrWdZXkBZ1/oawx7tzGEnJSTSzkCZ1tLljOKAFhI4Mf2R
         usPTorSQBflPzdKYceZCZ0VhEGvE2voqOuP6hWwtskUZRaRrdL9HGLy9ZzrMzqy1WTKZ
         3iNjY+IelRdffolKJXsi/11Ly+XfYLYcSoWktjFwDI8s1FYr/uf5GySuwCv219XXOFvB
         Oj988qoZuHsmpfffcyPy+pA+PK8EBsKAENmge8/JKkgpSNOPOefDbzuVYaijYkH5pzTP
         ceWGkyiI9PrUiCUvuaAlwm938Xn+vxFRyCweoukgG1oY8ygI3XWSxEaOsrRrWoJ5yUS0
         qObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770294077; x=1770898877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5QXxndAGlyTM6af1ruiTFGOTcz7G9p/TwioW2Gs5DJ8=;
        b=qqH7tkytx8x6NndhEd+qKiz5CpGHBUrbrx9nd9NAcRsRwl9qPXvU3hoO1tVItMKXTK
         VWQwwbuKwbaLNruMM34b+rrThW/mLOPiqtOFjvG0AlDeKBQIihFsRsLmoy8l6LTVCyap
         tytqY5r6yn6F05G7zCn8J7XtJIQXKKNVK2BJDCdpLspbYkudsVBsGw2BtM3O9rv4R1Nz
         SGubStwZPg4HCsgfDldNqX24XPh4DAhHTwJeGI4Hyj7uIxLLoyl8s9kOit1hilb+9iqt
         /3nlFzfAeXCnrc8vGU/4/+yPP54TYcE6G6W3fZ4OlmXizAHyTWb0rDvxFNudDHtYfqVY
         JNYw==
X-Gm-Message-State: AOJu0YyXrcaaa35iHRqAYVuOKqe032roMCoM+phElnrA+vDQBqysCqzP
	VlxQJ2TI7SwYHO840rsmWzfBMMd7StZjPNOaxzL8AAL1XGUmHIWVL/kRsnKJ2la2ge6oA0sFJM9
	BnxbK9EPYiVX4v6SpVGVOFyvLtcjFhNTQGwrUikyVzHNNELDOOG7SCEbAhsZjea8fI6nK
X-Gm-Gg: AZuq6aJ3xzR0aRIbcixMybJfcS0bvX9mllAv1+uWP5tHAHtCycZrAAALYme5aSzvXdU
	g79K4a4W3kAht1+FqCUdODIYiRfAF9SsC0//EOPbqydlpy75XDYuVI42ll2W6wNC5UkxnDQ/FMJ
	B95T8wlTGoWzqu/+0RmIaS+B2pI/pY+BoUDucj8W4SfhnWHT/3/vT0S9T44TMX4Sw1ZfcjfJ7EN
	w0Hu0XG4Sd5oeo2KMGQxUCSqYlsSfKK57XIaog3XX/7cFVODgypOvBN7W6h5x/4dTzteRsII5x7
	rXEls++dID7OsSrZC/fV6+IumJkL3fL6lDdgNz2ShJqR8yg9vc27JglTx2QwUMIs8cQDjQDC1vu
	/woPndVvg1aTYTscASBRM09K1EPL7HkY86XM4zf1MlN/ZManWzWYqIGW7J9N7wWM811qPBczLp8
	858XN5/FVQ/O7y80OBPSOOdN7gMExUDQ==
X-Received: by 2002:a05:6a00:a226:b0:81f:9b4c:81c0 with SMTP id d2e1a72fcca58-8241c4e9843mr5516385b3a.41.1770294077167;
        Thu, 05 Feb 2026 04:21:17 -0800 (PST)
X-Received: by 2002:a05:6a00:a226:b0:81f:9b4c:81c0 with SMTP id d2e1a72fcca58-8241c4e9843mr5516358b3a.41.1770294076657;
        Thu, 05 Feb 2026 04:21:16 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1c8c55sm6262715b3a.24.2026.02.05.04.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 04:21:16 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 05 Feb 2026 17:50:42 +0530
Subject: [PATCH v7 2/4] arm64: defconfig: Enable Glymur configs for boot to
 shell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-upstream_v3_glymur_introduction-v7-2-849e7a9e6888@oss.qualcomm.com>
References: <20260205-upstream_v3_glymur_introduction-v7-0-849e7a9e6888@oss.qualcomm.com>
In-Reply-To: <20260205-upstream_v3_glymur_introduction-v7-0-849e7a9e6888@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770294063; l=1615;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=gLk7nejOp+ivzohe2LI/rhMsW9vFp6TIWkWuGYjlBww=;
 b=bO6PNqNYzGM2ZJDHCv0Vqekz6TlyyeS4APInc/iNzx4jZGHM6JBTA4e04UU1+N/x5ExCptdMJ
 6uAfo9v9sqeAySql31ewaMr1Mu3crP5mgC79g2aTUs2/vZaiAJ335Jx
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Authority-Analysis: v=2.4 cv=Oc2VzxTY c=1 sm=1 tr=0 ts=69848b3d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=G4s3PgB1coGp2Q1p4bUA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: vmHw6mWT0jDegyPLbAK7Z29MzRX7k9g4
X-Proofpoint-GUID: vmHw6mWT0jDegyPLbAK7Z29MzRX7k9g4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA5MiBTYWx0ZWRfX5cvwucGp7C78
 GwuSaBK1hIdEPkB8/iPdNAR2j1swwecBh988Qb0T5n1zM1/JljTF9WmkFHh8recwQlPUtObXeRH
 aCLyaht8hrCNH6kebBTGX9ZKu9hMTidCUK1J6JVV6Ce6Ol2YVFxaggVH7UYkdgElSvM3rcId3K1
 ajww0LC/1M5IB4H107Sg6ecZ5ojI+s9I6UdcUmNVGpp0iwEVtfd68zB1MHz9/i8bfSbM0/gqvdu
 06mV6Dbp0H5L5P6aRK5FrAsZMaNQ0JKV2uONZ+2rkdmuJrc/2IY5o93HEKh4i4itByLEIoQR8KO
 xh90/kBvCYiuxuEmZ2kb8YpSiLUlPWqd1jeBtuB7oyZCkVlGUX4L7N0JTJi6kqiM3Eq8B3gf9O4
 DNQLShaa7eRn29NDKvt6kpfNA4Ugzqp1fqXF88f9lVqg2HXrProGeyApbVhRUCr3dJubIAvgU/X
 7wH2rnmpqBybsWthMUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91919-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 44ADAF270E
X-Rspamd-Action: no action

The serial engine must be properly setup before kernel reaches
"init", so UART driver and its dependencies needs to be built in.
Enable its dependency clocks,interconnect and pinctrl as built-in
to boot Qualcomm's dev platform - Glymur CRD board to UART console with
rootfs on nvme storage.
DISPCC enabled as module, used for display.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..d3ed35d3e6a4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -647,6 +647,7 @@ CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_IMX93=y
 CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_MSM=y
+CONFIG_PINCTRL_GLYMUR=y
 CONFIG_PINCTRL_IPQ5018=y
 CONFIG_PINCTRL_IPQ5332=y
 CONFIG_PINCTRL_IPQ5424=y
@@ -1454,6 +1455,9 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_GLYMUR_DISPCC=m
+CONFIG_CLK_GLYMUR_GCC=y
+CONFIG_CLK_GLYMUR_TCSRCC=m
 CONFIG_CLK_KAANAPALI_GCC=y
 CONFIG_CLK_KAANAPALI_TCSRCC=m
 CONFIG_CLK_X1E80100_CAMCC=m
@@ -1846,6 +1850,7 @@ CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
 CONFIG_INTERCONNECT_QCOM=y
+CONFIG_INTERCONNECT_QCOM_GLYMUR=y
 CONFIG_INTERCONNECT_QCOM_KAANAPALI=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=m
 CONFIG_INTERCONNECT_QCOM_MSM8953=y

-- 
2.34.1


