Return-Path: <linux-arm-msm+bounces-105148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePcWKfLH8Wn+kQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:57:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 172E84916EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DCDF303B5E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5BD3BA25F;
	Wed, 29 Apr 2026 08:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mHwQ5rx1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0LlCaWr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010433BA221
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453013; cv=none; b=KMNjdrNaNpKS24HJngYe7+aiovG9GeHAs7gLEZy8hfS2AWJVWk7ZYpCglPyKLpI0YY0CeurXkIMTuWGWV/ehtc0nLGBmNZ7+qpz4D7rmNKEsbxtIKK6H/DYTqBcfAnZjO2RieyJOd9TIW0/T7gMwNaaJLoU/0X9vCCjDrLXWlR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453013; c=relaxed/simple;
	bh=kCFaJ9eSOwfCJspvpeiV4isWT15Ur7PyJ+qAwNxeg7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=blYCOeR3H9YNgsK8c3Xkj22J0hdrc63n6nLsgg8AJIOQ5o4bGZsy/yHR2ahoBr9bEHXQunNPDT6VNi5DIaIZGO2jrHiUWWUfOKmusixBogjK8rradzq8RUOqM+jGjVKaAONkWQlBlSnCks1nD8EjudEffS7qjcjqFO4nO17HZPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mHwQ5rx1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0LlCaWr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pvTu4001917
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WAQJ6Bo+z8bUyBHCREDVDrdzdRGXxBuxIXP1dQ7QduY=; b=mHwQ5rx1OAbMhJ8e
	nibwtNB1mk5AviwZu6+bwiR+c8ciaIIbCC7wTn9nFWdvFExRmhCbxY8d+/ULnbCX
	V27hSzbPjigZBI8x26oFPwirsYWPthUPAMKA6CNtrXehL42Vr/qMa4ZGCLtVsFb9
	HoEoZgllTv9rFXL4c5JnJlxFKFUT6ZfP54L+j24qfJRlLBTJQ2hRYQ2OcJAhh/xc
	15qVsJM3+C5fxcqM2VBP3L3aDOnXhZwRCAMYX1fwNZUqLskPfAMSQPOgn/tXENeM
	tzFS7mwh0Ayadz2pJhI1Sd0GjEjPLt9W4cGmI5osEZoaNQKTnGdDIB4CO26Oexon
	OhFedQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du9em1bmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:56:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d812c898cso328161501cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 01:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777453010; x=1778057810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAQJ6Bo+z8bUyBHCREDVDrdzdRGXxBuxIXP1dQ7QduY=;
        b=j0LlCaWr0RYJFyrTi2+4ZGixvbFvyhKWaEtpJ6PTEdOYeKt0TGDSmlXrtH9na+cLZU
         vk3SidhAoUiicEE1D6iJ+SoYCxfqxwRBtU1j35ZTxaS8OqEc+6p72tDQWtz5sPXxqj8i
         vho8+G0Z48dnOubgNNGA+xgJFPkVkghk5IdiIu3DucJQqPkCpQWaq/cZjxENXMdeWYKT
         fo8KDS7v+ey5EdMQhD2eZjoABc3U3jK0GW0In0vuzflAkf7LlFGMNAph74zES66U3f4H
         RJ+fyykB32Y/tGe6ec68n7caDqws0ZTTfq2WJBETR0J9Bh1r6mOdxMkoEDdaSrVT/Tuv
         eKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453010; x=1778057810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WAQJ6Bo+z8bUyBHCREDVDrdzdRGXxBuxIXP1dQ7QduY=;
        b=Fg1uSCvcI9jTa082eltKNeokW9DFs3htPZgbcQuPRpOynGS97wTHuJLDYEWFVg2hkJ
         A69zqFUINfAimPROb2LPVt27xh+VmPx3kjfLQ35VrnT8V2jA2f+QJTIkerrUixF3JOYH
         55/0Dm8OhBGPFJ0t0C3n8YhpdZ6hnhL4TrAepCHUr+NNnLX3RgI3D/AYywGHIcRNejxu
         m9EHa5Ocv1rRVdCzsQUZhpals61GNdyz0PzFwvEVWNpS8v36iDD2zt3xeAHYm7zk6BmR
         6ooPiiL1DJp2wJgz6+8AZ8NDcJ1+30bCfO3Vh8XxaUUrKZ7yWseYyEQ3k242g1Q+g/zT
         tUVw==
X-Gm-Message-State: AOJu0YxFGPMiJRJzpeYYj+MYeFw4KctQ262KPO1NXxr3oVkKrhpKUlns
	BwWc8VI/hgDHGj+hClcB4mLGSQIgrVz1xevLE88ProWdGAdxVAR8SBMVgS9IVP/9VjcTPwnoCWo
	EVhw0dOtgcec5Ce3VGgP1CE709IF4oGfxf4022wRXjrptKGY9AF7GEk441NfmY0twohVpDMZ+w4
	Tm
X-Gm-Gg: AeBDiesvLq9sMTW5Ky1U66CXgZTIy4FgN+L4p3XME55tr32mnPoIUQwaB3wmwsm7j1h
	SFW0y2phfghj4uwkDMfTrQlETJsNiLvNXGdAjmX9CWKnhIRJfMMmQCF+sbo/ILq8D/KkOPngxQh
	7wjCtBVKJWf6GnmH4Wcvh0lgMEKxBDgRzBnKGwwtiYuNjeVgni5iJ+Ii98bZKlNsAxWgPbu9pIw
	v5kN4bzrHsD6b9SIHvHS+6EM3o6ixZudd2MbP9gaOr2+eAiI3xnTyMkioTFKgtzby2JB6HP6iyC
	XZuycNJiLkemwvRnTfGxTGcX+1aTQFbVRDf8KKyDyjRJ4sdLbF27xcrh+r5GToAkljaxTyI0UZg
	j+nsVlZUTuCcX0RwighCCLqCX0ePuXyz1tuLWN6lgR17F/eGOFACzd9E=
X-Received: by 2002:ac8:7dcf:0:b0:50e:5a87:6c0c with SMTP id d75a77b69052e-510189a8378mr43062151cf.24.1777453009840;
        Wed, 29 Apr 2026 01:56:49 -0700 (PDT)
X-Received: by 2002:ac8:7dcf:0:b0:50e:5a87:6c0c with SMTP id d75a77b69052e-510189a8378mr43061931cf.24.1777453009360;
        Wed, 29 Apr 2026 01:56:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216ed6sm4950689f8f.16.2026.04.29.01.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:56:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 10:56:33 +0200
Subject: [PATCH 2/4] soc: qcom: Restrict drivers per ARM/ARM64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-qcom-soc-kconfig-v1-2-69ba540b3fe9@oss.qualcomm.com>
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
In-Reply-To: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2794;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kCFaJ9eSOwfCJspvpeiV4isWT15Ur7PyJ+qAwNxeg7M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8cfKY+gHFV59bZsQt7cEaKelWeKpcnrSb2IJf
 AD8VFYkfb2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafHHygAKCRDBN2bmhouD
 16KzD/4i55M1Jqi/DIMHeGYksDXIERPcZ5ZCNNFkm86AVTFbHvMxl1QAg9cfaTFdmvQEW8gn7Tf
 1jIIwPOigBYBnsuZcrata4LiGLJ6Nw0Clrx7XTNx2ytgBkltZ3WhaYsS8YrvILb/zC1WZGgUqyP
 6PKl8j9oujBnzxeaM6elE4gD+CmWCLL4h7z3GIqkoUfY6pUPcBYqL5thXZ7XIQNRjmAR9v4IlmH
 s/9sSA4L/A2n/x4whpfT9On42xkwdgJP6xVldebhWhw36rAKaxxtejv0WHOUqXGmbqAG9SUK1xv
 yOzcyMpwZt4W3YsgvtTTuS7B1dAZkaZYGpwT348EiKvhCZ4Ncii7hiPIJRZGEsT66fYKMF9Hpom
 PaNJsHbre4IuFXif2APn4xCZjAYuWuXA++5G65v3SjDA4Dk5tpAa4ZPIgw25u/heK/U0W42Rnke
 iSXjE44KLKjvpBSN0iwTrGZ+wjT2I8Mt+N9j8ofDzg1Z7B9NIgtdgHHj40s1+dXvuPgA1RaAaFm
 woVhdwfwIe3sYkABh/CaIPlR4RBAAznFnYsB3waSMHvunusS0KiJ0gxiDsXE5XPvlEDGokHPmSI
 3rhX9eJbGIfp/C3yNYKn9OjuflTXQ9TJSLrtDfB7q4zwchsmZpy0vn/RJiGPyUhQ4estGoDsJGA
 dY3PGkBYlU4Q0Lg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=bvd8wkai c=1 sm=1 tr=0 ts=69f1c7d3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=J14JCQuVvOChFIw0wjgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 0ZdR_MQpvLRGubzMx5ETafEMhZTA_AGi
X-Proofpoint-GUID: 0ZdR_MQpvLRGubzMx5ETafEMhZTA_AGi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4OSBTYWx0ZWRfXxHIgAfAWGFVi
 olTvp6LXX6ZuczJ0YR+Jlflb/+np57iXbDNMK3WiT9l9SetagxID49UC9+tZ8ZdQ04Knr8uiGlx
 fMmXGifFPSZ1VJ3zHOgbvt4PdiZfvX4M3tRSbdEMe5nuGZd6Ut8XjDKXi2Wa6IObs16eHUAQIZ9
 MsuhWPxI2RiuflNgwsYLnRGlf7MKzjQ5B6+9N3yWh3MfWfiPIWlNn05COJc4t1Kx7w7klSzSFfD
 tlQSwHcZaEFKGttzQDhqqHvSRP5qmZLSgdMQphm25Bt5dD1xuyubaaKrYw6q9VZ2qZSEafUQalY
 8nHpN9nbfQXEcRkXqJTkbNPgMc4EtXul84L4GWAZNshZjxXcGiG1LBMTPCGeh21HStI39n9vVbd
 3Rm91M0UGG97GlYGAU/KamLmf2ZSQEucjxSs+g3q3Q55ScJUo/JXl6KCLHg1UzIqVVIdg8MzBZJ
 wIO1tDhvvUZnpYZJTcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290089
X-Rspamd-Queue-Id: 172E84916EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-105148-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

There is no point to allow selecting core SoC drivers for Qualcomm ARMv7
SoCs when building ARM64 kernel, and vice versa.

This makes kernel configuration more difficult as many do not remember
the Qualcomm SoCs model names/numbers and their properties like
architecture.  No features should be lost because:
1. There won't be a single image for ARMv7 and ARMv8/9 SoCs.
2. Newer ARMv8/9 SoCs won't be running in arm32 emulation mode.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 62ce1c67d684..9a050ba1dbcb 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -19,6 +19,7 @@ config QCOM_AOSS_QMP
 	tristate "Qualcomm AOSS Driver"
 	depends on MAILBOX
 	depends on COMMON_CLK && PM
+	depends on ARM64 || COMPILE_TEST
 	select PM_GENERIC_DOMAINS
 	help
 	  This driver provides the means of communicating with and controlling
@@ -37,6 +38,7 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "QCOM GENI Serial Engine Driver"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based
 	  Qualcomm Technologies, Inc. Universal Peripheral (QUP) Wrapper. This
@@ -45,6 +47,7 @@ config QCOM_GENI_SE
 
 config QCOM_GSBI
 	tristate "QCOM General Serial Bus Interface"
+	depends on ARM || COMPILE_TEST
 	select MFD_SYSCON
 	help
 	  Say y here to enable GSBI support.  The GSBI provides control
@@ -53,6 +56,7 @@ config QCOM_GSBI
 
 config QCOM_LLCC
 	tristate "Qualcomm Technologies, Inc. LLCC driver"
+	depends on ARM64 || COMPILE_TEST
 	select REGMAP_MMIO
 	help
 	  Qualcomm Technologies, Inc. platform specific
@@ -108,6 +112,7 @@ config QCOM_PMIC_GLINK
 	depends on DRM
 	depends on NET
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	select AUXILIARY_BUS
 	select QCOM_PDR_HELPERS
 	select DRM_AUX_HPD_BRIDGE
@@ -242,6 +247,7 @@ config QCOM_APR
 	tristate "Qualcomm APR/GPR Bus (Asynchronous/Generic Packet Router)"
 	depends on RPMSG
 	depends on NET
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_PDR_HELPERS
 	help
 	  Enable APR IPC protocol support between
@@ -251,6 +257,7 @@ config QCOM_APR
 
 config QCOM_ICC_BWMON
 	tristate "QCOM Interconnect Bandwidth Monitor driver"
+	depends on ARM64 || COMPILE_TEST
 	select PM_OPP
 	select REGMAP_MMIO
 	help
@@ -265,6 +272,7 @@ config QCOM_ICC_BWMON
 
 config QCOM_PBS
 	tristate "PBS trigger support for Qualcomm Technologies, Inc. PMICS"
+	depends on ARM64 || COMPILE_TEST
 	depends on SPMI
 	help
 	  This driver supports configuring software programmable boot sequencer (PBS)

-- 
2.51.0


