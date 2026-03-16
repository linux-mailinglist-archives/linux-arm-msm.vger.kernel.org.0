Return-Path: <linux-arm-msm+bounces-97927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJcIF2Hot2mzWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:24:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4682989DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 452B2301F499
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9685B2949E0;
	Mon, 16 Mar 2026 11:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KsgnRgHI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BvTedJ2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C011228B4FD
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660246; cv=none; b=lCA8pgRIXVvY95GP2/usZ0ycsVz1HujGG3izLKRVPW1Omlx6oc91IocoeMH9DsWOef+HSUoRvz+xHVw5+wn+XG9wryy9t1M1ivI02NzlaQBsWkr/BtcrJrRTj27nQMgS4vyxkg1z//9qiJUGP8/w8VaQFa92bDF6vIg/ohsN72k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660246; c=relaxed/simple;
	bh=WmY+mRGcoYbPTKWxkV8gKUISNn2xiS7FFXio9XD0Hao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cfcDLnGzMFZ24v15tu0v9mzB9aoNYOAS7aSMcOaweRgHGi5GoNR0sjrK+8DqbFmJkqCO7DKmL4QMcNWlFzE2npypKLFiIo183+xWW03YnaJIg0wqz6HVa0ccfTI8+eyuJ/NjCsV5M1AEec82G+vjhLhylvwGm6IUv51WxdnZz/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KsgnRgHI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BvTedJ2Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64kp32128597
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kTfT7e3KP7S3n3ARy32qJB
	RrujmXx/ucwVNuJc/u6YA=; b=KsgnRgHIS6FJKjp8rtyicPuA8fSOJc6AH09oaq
	JJKflkKRj/5S9dS2TdyRmWmwc1q38Vt66UJ5toOC3aW/i9KcJsmW429FcjFWOipl
	//OMylBYqEtYiGkC3FbAjNfLJGfzuVJ8YEpZp4bDeszLV3Ii7+WPgLEEBaajaNdC
	hAHIv35BHKCuH2nbwanWR2nePjYGDQWnfIFnvb0OPzj79AA3lwMHKaBGrmUPpi5G
	FmNoy4CC09vRq6n+SmPHIt3XvIWmmAyBj9iWYBW5wJKNVonssvwQUODzrjWxp5LG
	cj8Mq7U6KgE+rXZlZiWqAnGmegmyS2OmAGm0EveSqJjwDylg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00angkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:24:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd91c0262fso3296387785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 04:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773660243; x=1774265043; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kTfT7e3KP7S3n3ARy32qJBRrujmXx/ucwVNuJc/u6YA=;
        b=BvTedJ2ZoZpDg20/95NVTKqydvo0SS1k6fBt6Gm53b4v3QvUFM+T69HVfOAWUINEGx
         K12cxXSmkZcmf6UDLZxQ/J92OjH+xw8a2qAci7hhrzkc3ihKN7g+ydtRvKlsHOB03PoR
         zJUiO7/1ODIopiDaRUc6jldMlojk8P6+P7bv8KKucjU5xPFKeHw/2cJHby+bqEqh9a2W
         OekFa3SZFGPqJSv3xGiYDEEcniRn+Em771blnC+2QoGuqN4NTvhpD5sBVIEUYJNc+qBq
         fkb5r/+dKIRc3Diw/cnbhGHPPLuQO6uNopHqwx7In57omrn78ILButudF0eyNS4+Gtal
         W5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773660243; x=1774265043;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTfT7e3KP7S3n3ARy32qJBRrujmXx/ucwVNuJc/u6YA=;
        b=V1etT79OozVsIwhJaudZcxD4HJapJee24jDLWV/bHCYm21jvr/yd0yFTHXTMqvqwKk
         /aj9C7LG6i9CbQGHGi7QmTPv1WHpQiMRza6GOyF/6VD4Rg1IFVoCy2aZgLcQzpa8zMzr
         NdZzNj8BZ4JOP1ed7lS4ywX0vTeuN1z5SH6axpgrsB3i6bshug+H7nYTsccFt/gklj8u
         hw50njksXSO1MVF4++J8UcyYbd6N9MmT7aDsWM6Y95KYKJtYbeWNkgqjXysaPiY/nv73
         AeL6Ck1GSgcwa1vmEC1jiznyJLridp5gzRwu5P0Mvp+dVocx0yw56n5zxBh+QYVCXziD
         r6Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUp6HHo0dt8T/p5pqs5W8KfFUsm0qriUkDUuPv0WAvzK8LWu0gcKi4+N9I2uVbFVXXit3Uu+67kqUcofR3V@vger.kernel.org
X-Gm-Message-State: AOJu0YyoLeCK8o0dsnmsF5OMeO04ncVAYmdhvKmJuGHo42xPpkVIqmmr
	VW/BZNa47DJkl1OrkkUd4T84SDtxcTVpCCqvQjv+NUtzK0IT+UU7TCh7AfEi3PTMHQ3xihakrE4
	kfFnHRgQEAgfbqSchS20ygvVM+8DePNnW9sUZRv/ZrTXHc0NCPhA3QUN1PdkSYo2DDQON
X-Gm-Gg: ATEYQzzbDkeUIXqOHhQmqfvHyEHCih3b8HgBgdTUKTeJ4o0OzcGRlTCYboYkVTYQpU5
	vy4N/Es+3VqqByoGTUwONuW8O3cr5CxkMyynyYS4IhaqDohMKh0/YHqCD1HsK0Jpy36ZgQQ+pC4
	GIpjdi1HLpQzl/3b2TjVtCHF9NbEH5b4+MGD4tioIvZ+oWQggDfezwCdITXBLp+b9ILn1m7jPM3
	yCoT/oKrHVlD/Omwo+ySCplH0/R4GsWddttmqQwXuvJCHVYk7SRVAsiE+YACjry7m/qa4Ql/YZd
	dE30StiYSTEqpiBAlljHdGfcvBeSDW/gtJ3LqA86ReqyYCzd9WLdzCsH/tAuUp95N8WYSCToj7O
	fMRlG4SGKrxqVtLu//EBRzxtLZkU=
X-Received: by 2002:a05:620a:468d:b0:8cb:3b09:9ce7 with SMTP id af79cd13be357-8cdb5a0c917mr1587414685a.5.1773660242785;
        Mon, 16 Mar 2026 04:24:02 -0700 (PDT)
X-Received: by 2002:a05:620a:468d:b0:8cb:3b09:9ce7 with SMTP id af79cd13be357-8cdb5a0c917mr1587411085a.5.1773660242147;
        Mon, 16 Mar 2026 04:24:02 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b47145dsm420132405e9.0.2026.03.16.04.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 04:24:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:23:52 +0200
Subject: [PATCH] arm64: defconfig: Enable Qualcomm Eliza basic resource
 providers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-arm64-defconfig-enable-eliza-basic-providers-v1-1-7ae581670aa8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEfot2kC/yXNQQ7CIBBA0as0s3YSWihRr2K6GGCoYyo0oI2x6
 d2tunyb/1eoXIQrnJsVCi9SJacd7aEBf6U0MkrYDZ3qrNKtRip3azBw9DlFGZETuYmRJ3kTOqr
 icS55kcClojXHXhmnqT8Z2JNz4Siv3+4y/F2f7sb+8X3Atn0AgTxMypAAAAA=
X-Change-ID: 20260313-arm64-defconfig-enable-eliza-basic-providers-648504b3a594
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=1658;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=WmY+mRGcoYbPTKWxkV8gKUISNn2xiS7FFXio9XD0Hao=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpt+hLdbvJtI3Nn102tpaeqMLElgQRK1rJCY6ch
 MzdDczAC02JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabfoSwAKCRAbX0TJAJUV
 VqCxEADHD4qNX7nwfIT1z7Py7btHHTIxcrkKyfKGPmNCXbKvrInRuU8kMi7lcRrKEOm1qpv+O1a
 IENIqyxZpNfhlQ6HEuhQHp3k/pdO4K3qOk+IMYIgTE7ab6XdP/i8iY8jOIln5bJmunc8Yy5b/5e
 f4UJ5CkOwKXpt9BTByHDDr60poDb9MsJWas17iWTZrMdoptKXN34i2zAP3UZy2cKyZUHxT+F1Qk
 J/uD1afklTZApPy07q85O7WkDsYneMdI3grJlj/T097oHH8drRTy9Uoguj5LZj5jPF8i3nrbgW4
 h6KKE97o1+XsGIAkJNXhzXeKqhRA4iZ3un8WlH8sE1fM+lo6/zp9eYo12jUXtTnEQz4Q2PA1CNM
 IjqmlseUtZfte3Ojer5rShqsiC6a9WfC86Bb6Mg58As/o7zi+4SgcYTF6k7YpIPpJXLc6d6LqIk
 PicMoDrUZWq/pWlD6TdQduVzheq8Pdk3C1Zr4iyZSy3Y8FcrFHJKRkHfv0B9pOQlXIDePFmuQy3
 wxJEZw4IGc1qRjNbUu+yzjiyn2wBoWyh7WFkAemPOetTHSzaXnV8Fph2JGkE12uUBhCPksIsCHG
 DRwSFG4kfkhBEK8dEsRSLf19+A4KT5+n5bliD+d1NNtK74/CbGrgQlZ1HNlmz+e5tzU63A62+T9
 Ch1/RlsLWiJ65/w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: rVB41Sx4Iw814XpaTIX62VePTctDbJcd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4NyBTYWx0ZWRfX/5HmfecGqmLq
 hjc0Boie33ryyC0lziaoQW2fVtP5b9ksEPG+n9ct1IMaM/S3auyyGeYz0zbh8D466j5qPrYzuuD
 Z6adcwFl56fcggo7rF2oOaKyqmLavP4IuZ5dnlcgNwReI4j6uoBPG7xPOclfIIoaji02cKkX8DL
 3KM5jiY5iXgVtOEKtf5CDYyHFNJRf6Nxr7Ut5cN6h0eCFt+3CtK5eQl+gv3wNmW5l5XaVJ3z8wg
 7WKoPSHPHNlz9dA/Ic+cHTy9SwHCh9+EQsnnv1kUdn23GhMy8gatc0s1Ki6khTA5TdlQ14MK62U
 kAtNSw3r8zlhI7N5WLPbplxAUaz60FiswI9Bh5DEbarSvy71lStYkO4WoStjBzrYwaXas1D0Z9g
 hGHA/F6fUqjlMwVHxvsBtr1LP4O/o0t2OlhEdGKmjZzvkjC4sbGGuUTVyO/IWel9rTR9IwEYrd5
 hnBboV1cwoaybrLBoLA==
X-Proofpoint-ORIG-GUID: rVB41Sx4Iw814XpaTIX62VePTctDbJcd
X-Authority-Analysis: v=2.4 cv=ebIwvrEH c=1 sm=1 tr=0 ts=69b7e853 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=82xYBYoqfptwCDICCUcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-97927-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF4682989DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the interconnect, pinctrl and Global Clock Controller (GCC)
providers as built-in, and the Top Control and Status Register (TCSR)
clock provider as module, on the Qualcomm Eliza SoC.

These are all necessary in order to be able to boot up Eliza-based MTP
board with debug UART and rootfs on UFS storage.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1d967a81b82a..9eee4675edf5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -647,6 +647,7 @@ CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_IMX93=y
 CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_MSM=y
+CONFIG_PINCTRL_ELIZA=y
 CONFIG_PINCTRL_GLYMUR=y
 CONFIG_PINCTRL_IPQ5018=y
 CONFIG_PINCTRL_IPQ5332=y
@@ -1456,6 +1457,8 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_ELIZA_GCC=y
+CONFIG_CLK_ELIZA_TCSRCC=m
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
 CONFIG_CLK_GLYMUR_TCSRCC=m
@@ -1855,6 +1858,7 @@ CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
 CONFIG_INTERCONNECT_QCOM=y
+CONFIG_INTERCONNECT_QCOM_ELIZA=y
 CONFIG_INTERCONNECT_QCOM_GLYMUR=y
 CONFIG_INTERCONNECT_QCOM_KAANAPALI=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=m

---
base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
change-id: 20260313-arm64-defconfig-enable-eliza-basic-providers-648504b3a594

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


