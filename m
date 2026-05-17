Return-Path: <linux-arm-msm+bounces-108071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PXeHFMOCmqPwQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:52:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12342563609
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 445AA3006940
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 18:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5937033121F;
	Sun, 17 May 2026 18:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpdXZoZX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kd1S4csk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ED4221DB3
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779043872; cv=none; b=lqYpsKQfDf82O2mXzUGOPc4CEeXmYCeqZ88iWFunVVG+Id4BLGZ20JIp8KbPqjwoW/RjPgAvCP6eMSGnhb7bSiLHENqqg4udTtOZ/8QUZb4XfYhHELF2++t/HuEjKom1GNhjbb3Ru4AU/HxO9d8bqB70BNuJvxgKkvcnEtG8Gxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779043872; c=relaxed/simple;
	bh=nCWFE4LWzC6+Oah4EmkPSev5ETPTLOEYYLJ/3xk6mEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tQ1G4zY/xqP7tMFpSO8ox029N01L8uRvkHJj0Ch8+GJCRIe3LaRdq57a/2GDwWWQP+exFn55TwUK70VA6WHh016/4WM+jQLQ2hMMoRQpTbUIQOqVdDiQEWjw83s06Zj0AihBak4Gobfkpg1puzKpnrz8YaChqb3Ta31Rx+Kx324=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpdXZoZX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kd1S4csk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HFSJRC4140086
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GDzUCB0R01yGJ9xA53BA46
	ickPsFjub9nOUlBXxPECQ=; b=CpdXZoZXiUCXCLT5SyAc4mpI/qvryC7XhYPCbv
	MgGda1zgnPXKivT0hw1SaivkW9YTwj8A5qbDU9sv2uAlsSHTgJBfk4jQEs5ImKZa
	utrqTHlNzUtTLgWA6SZNUCLdPQYvNS7eH8AKJMAgzILexpaLREy4/mZplM+8r0Yz
	CxdZOe4Rtew1StxcTEhNRcufhDz6ZY0hxc2W7wfok4YPNVavHBAMSnhxZZ1D9H2S
	inVhPbChMZRzFnfR7MsaRuXukyqra/ESXICa3RsGXZIVQLXlegGucNLi2t1jkorO
	Okcxkn1CGpr4SKGlWqNgErtyRLXJV0WhJ61nZ3pRj63ZyjNg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h01kdr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:51:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b49424ad88so56414756d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 11:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779043869; x=1779648669; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GDzUCB0R01yGJ9xA53BA46ickPsFjub9nOUlBXxPECQ=;
        b=Kd1S4cskn4XeXS3Kd1ZO7QLZVJ1F2C8746Zux6WNnZLPCMjGCteD8+2gfx8NJW2TfF
         +2fAGrscdC9z3P2pWwDoIPCquwLOplG+eagEObvlH1E7LnWYlSqnQgjoCAAZANcfiMtf
         9kwD2x9RTtlA5ZVXtAg76166nYPU32ERz+wxF3y0/hknaHkdFv3HN7IDymv1nvpTLAJa
         qDfPOdxYXETvWm2ZPeJ1vbjAwx80gWEEmz5Yhh5CmRJv38FtWD7ObCKHkI/I/dHU3nNr
         c8hxdCPDVJ+e8tD/bDisoSDZK0g0urMKZIAZEjSdwaclQgMIUBv0dA2TMarvdpjd5Gor
         pNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779043869; x=1779648669;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDzUCB0R01yGJ9xA53BA46ickPsFjub9nOUlBXxPECQ=;
        b=nVsoNa1XX5m4WlJCAKcOFeBvOg3zzh6unUcybTB2qbHAMZbTyEtx6li17cQ4fthTpe
         mP27petoFDvE5ebqNG45CY02zUHruZsq64Z4MZN6Ne7vFniZp2q3orXxZqqOFP2nBBU2
         ah9Fj1j0ujZSCLIfx90fH6JKH5dUBa72FslqyPBvb4Av0Jd22RBTJ88I9I1oK+GkmQE9
         ZmYSGdYDXnTs+II/QCvopeDUHbUWBN2Nca/RMIiF/mjC3huvUJO/p8RyuUlMIGS1SpQz
         zgTTM+2FE0nL0U75dcZm3uIVYL/7pFewJVj7KLjJW0iG6bzFWXQnRfLgLG9PT14/AbOM
         LgnQ==
X-Gm-Message-State: AOJu0Yzj3blC1/jwCDkEj8c0uqBRUhXh5sF/gyUYu2oIraF2RNxmprYH
	BXsWM/mYaoJDLJKJ+o+YddPx2EfJ0JXuoVpNqCtmEBCD+3WQgE/yffYMQsp/kdHhch3pYopZNU6
	zGAgl+u/BzMCxXyFY/NiCmjhfJjejti2HRVzciZ0r2bWormUXqx3PHC4MGHqWK3yTwSSbB/OBR7
	U+
X-Gm-Gg: Acq92OHv+tegACPnMBSlA5ab5sY21xgoOjG1KwwPmmM7HFaa9oTNy8qhK4bqAsIf+UO
	Qsnbcz8h/0jmszippi69PlzgO6e81v44yh6dYSaaGdWrsh4qc3V9z/+MHr0/LgSZ0GmLbZgHC+/
	0nrfWcp2Yr/iyzOY/xynGcrXWpW4HLiyPlkX1KUvbkFAF2q+Go6+E8H/MnYfhDdgBMoN//dhgd0
	LzXz8qMHF2+gHMBY76zBelrZoOnI515TtTe2d4gRn2O8JIpFv1U65ec4LyHPNRQzSXZssGhTiTB
	S0AQTd2d4g3blFFaBW/ZWHzKHBYg0xVah+zt/2UDs8Jwz8XhhipytKk0KTPntts5sYKdjyIy63q
	m+fqWW3rBQMCvrvl58oT25lwhn1WpzpGKcJWNHDDmoS6OnW1PK/6GbWqYTp9sqX+33m+mZc8aKh
	3waZvfBvZ7L17wfQ+/QEU18ATjcfo7JvVIb28=
X-Received: by 2002:a05:622a:d1:b0:509:1b76:e9b2 with SMTP id d75a77b69052e-5165a276812mr176979491cf.55.1779043869084;
        Sun, 17 May 2026 11:51:09 -0700 (PDT)
X-Received: by 2002:a05:622a:d1:b0:509:1b76:e9b2 with SMTP id d75a77b69052e-5165a276812mr176979181cf.55.1779043868649;
        Sun, 17 May 2026 11:51:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cf803sm2890502e87.76.2026.05.17.11.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:51:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 17 May 2026 21:51:04 +0300
Subject: [PATCH] clk: qcom: stop enforcing INTERCONNECT_CLK dependency for
 everybody
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABcOCmoC/yXMTQqDQAxA4atI1gacFKfgVcSFE6NN6++MFkG8e
 8e6/BbvHRDEqwQokgO8fDXoNEaYNAF+1WMnqE00UEY2y80TF54G5P6DyowtW0NEDyu5g5jMXlr
 d/7uyuh029xZerwec5w/giDE5cAAAAA==
X-Change-ID: 20260517-qcom-clk-icc-fc6122236e5b
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4889;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nCWFE4LWzC6+Oah4EmkPSev5ETPTLOEYYLJ/3xk6mEc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxYXn8SLbJXMlRdPq7gKl3WpfpaVE5u0fE/Tqnv9FcYzU
 19OTLfpZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEzG+y/5WU2fTn1d5LTHXF
 RRn6T4x134eezQ5YmBIm3HatOdyr5t3XQIXOU3sEnS1fX98TVNy+++2NzuOfmPQKXSf3uJ0o+8f
 o9XnfLW1zS5vHh1Ycy5oo/qWjfb/SAgvBRIucUL9PbHoX93ntKNjp1fNUOTjHuM5N77HoLRal7l
 S+3QVT8nd/dp1n7cPywzA8hedHdcNSjg3qPm+ivN9xfrrgm/bedvFPDt6POunXzrUkvD2vbJzan
 yY6S++JcNTHUrb/Cc/uhprVXmqXuZy4dWZrtNg/afZTCdaCHEoTTCwOf5L5/W89Q61WdDPrmYKo
 G+7L8qconOxdXCQoopuafzxt39trm45LzP4x//oXrrVHAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: r87BI4M15gErDKABkpwt5nGyEDQmpL5E
X-Authority-Analysis: v=2.4 cv=XbG5Co55 c=1 sm=1 tr=0 ts=6a0a0e1d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=PKtRt_AHGqzKJ450pQMA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: r87BI4M15gErDKABkpwt5nGyEDQmpL5E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIwMyBTYWx0ZWRfX0TsE6rg6v96E
 QtrzfFEcx+OjM6v8bKibD1HgSuSWCNfcibg/F1QHDw+VvPbi55kepLerq/jIxXjjk+ccj+fkQuA
 /gkLW+2Ejlw5e1GLV/sugfHiEfFtl3goJST5JEcgAW4x6kpqAIFsmrlR7hzauouSJGVXVrFA5eN
 Y3SZk8fOlvmquhJemNm7ug+aXvHoBHPRMGZefb+YGqBzxk4VHXO4vYj4zLqQbUeNRvVoV91/nNF
 yqP8CbTlDwJ0aTufbV6RNMx1AvOXR93ZjHkFxFEMloiZ1jkv1GW73RYDZ3s58JH1K0xYbgsT3w2
 wLQWzzBfkoBg5RCT2UzVl/l0EF+ZGaZWlyKoH8bScmy2aRgkF7Xu4ZHMkx6FCHOCGqm9DsM+eBN
 E7lMs2i03AjBCb4LdHraaPAKXAzcnZxLc9xFHNVFNNKoaas1LnWB0o+1vwNksSKqdm9sOIFzVSN
 QkeWZKC00iIGQwrQvKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170203
X-Rspamd-Queue-Id: 12342563609
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108071-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Only several (typically IPQ) platforms use INTERCONNECT_CLK to turn
clocks into the interconnect providers. Stop inferring this dependency
on everybody and set it only when required. As a safety measure, make
sure that the coresponding clock description fields are not available if
corresponding Kconfig option isn't enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig  | 13 +++++++++++--
 drivers/clk/qcom/common.c | 11 ++++++++---
 drivers/clk/qcom/common.h |  2 ++
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d9cff5b0281d..de8485b5ed9e 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -7,6 +7,9 @@ config QCOM_GDSC
 	bool
 	select PM_GENERIC_DOMAINS if PM
 
+config QCOM_NEED_INTERCONNECT_CLK
+	bool
+
 menuconfig COMMON_CLK_QCOM
 	tristate "Support for Qualcomm's clock controllers"
 	depends on OF
@@ -14,8 +17,8 @@ menuconfig COMMON_CLK_QCOM
 	select RATIONAL
 	select REGMAP_MMIO
 	select RESET_CONTROLLER
-	select INTERCONNECT
-	select INTERCONNECT_CLK
+	select INTERCONNECT if QCOM_NEED_INTERCONNECT_CLK
+	select INTERCONNECT_CLK if QCOM_NEED_INTERCONNECT_CLK
 
 if COMMON_CLK_QCOM
 
@@ -342,6 +345,7 @@ config IPQ_APSS_PLL
 config IPQ_APSS_5424
 	tristate "IPQ5424 APSS Clock Controller"
 	select IPQ_APSS_PLL
+	select QCOM_NEED_INTERCONNECT_CLK
 	default y if IPQ_GCC_5424
 	help
 	  Support for APSS Clock controller on Qualcomm IPQ5424 platform.
@@ -395,6 +399,7 @@ config IPQ_GCC_5210
 config IPQ_GCC_5332
 	tristate "IPQ5332 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	select QCOM_NEED_INTERCONNECT_CLK
 	help
 	  Support for the global clock controller on ipq5332 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -403,6 +408,7 @@ config IPQ_GCC_5332
 config IPQ_GCC_5424
 	tristate "IPQ5424 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	select QCOM_NEED_INTERCONNECT_CLK
 	help
 	  Support for the global clock controller on ipq5424 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -444,6 +450,7 @@ config IPQ_GCC_8074
 
 config IPQ_GCC_9574
 	tristate "IPQ9574 Global Clock Controller"
+	select QCOM_NEED_INTERCONNECT_CLK
 	help
 	  Support for global clock controller on ipq9574 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -464,6 +471,7 @@ config IPQ_NSSCC_5424
 	tristate "IPQ5424 NSS Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on IPQ_GCC_5424
+	select QCOM_NEED_INTERCONNECT_CLK
 	help
 	  Support for NSS clock controller on ipq5424 devices.
 	  NSSCC receives the clock sources from GCC, CMN PLL and UNIPHY (PCS).
@@ -475,6 +483,7 @@ config IPQ_NSSCC_9574
         tristate "IPQ9574 NSS Clock Controller"
         depends on ARM64 || COMPILE_TEST
         depends on IPQ_GCC_9574
+	select QCOM_NEED_INTERCONNECT_CLK
         help
           Support for NSS clock controller on ipq9574 devices.
 
diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b..2bac581efa02 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -255,6 +255,7 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
 	return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
 }
 
+#if IS_REACHABLE(CONFIG_INTERCONNECT_CLK)
 static int qcom_cc_icc_register(struct device *dev,
 				const struct qcom_cc_desc *desc)
 {
@@ -262,9 +263,6 @@ static int qcom_cc_icc_register(struct device *dev,
 	struct clk_hw *hws;
 	int i;
 
-	if (!IS_ENABLED(CONFIG_INTERCONNECT_CLK))
-		return 0;
-
 	if (!desc->icc_hws)
 		return 0;
 
@@ -286,6 +284,13 @@ static int qcom_cc_icc_register(struct device *dev,
 	return devm_icc_clk_register(dev, desc->icc_first_node_id,
 						     desc->num_icc_hws, icd);
 }
+#else
+static int qcom_cc_icc_register(struct device *dev,
+				const struct qcom_cc_desc *desc)
+{
+	return 0;
+}
+#endif
 
 static int qcom_cc_clk_pll_configure(const struct qcom_cc_driver_data *data,
 				     struct regmap *regmap)
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 6f2406f8839e..1ebdfe831ac8 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -45,8 +45,10 @@ struct qcom_cc_desc {
 	size_t num_gdscs;
 	struct clk_hw **clk_hws;
 	size_t num_clk_hws;
+#if IS_REACHABLE(CONFIG_INTERCONNECT_CLK)
 	const struct qcom_icc_hws_data *icc_hws;
 	size_t num_icc_hws;
+#endif
 	unsigned int icc_first_node_id;
 	bool use_rpm;
 	const struct qcom_cc_driver_data *driver_data;

---
base-commit: 230cbc83bec52234e456f33a01f400f78bfac0f9
change-id: 20260517-qcom-clk-icc-fc6122236e5b

Best regards,
--  
With best wishes
Dmitry


