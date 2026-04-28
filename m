Return-Path: <linux-arm-msm+bounces-105063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Bm7CuXv8Gn9bAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:35:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B05F648A0A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4257030ADF7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 17:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3932444D02F;
	Tue, 28 Apr 2026 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXO6su8t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WkS7/U+9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400C844D01D
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777397577; cv=none; b=ghb/bMRGyCvReOkmgxYD0+UdYW/rMUMw1xwC9ak8hABQ1bRZ6h0i7T17TmSxxNDNEJ3egYfNUddn+SE2i4jRWHrdCtj5FJ8DChbBJWbzDU6SQ3P72XXYfspl/9HPvvpBONNcbAPQ5gZfnp5JAAQekVOUmh8gTM23QNa8VBlKAU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777397577; c=relaxed/simple;
	bh=rfVFsqmmJPTNTZeEO/Qr6YN70g0iVkVM45qtvX9E22k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h97wQWxyqU/TeP668i0Wo708Z+Njhcx6i+ZWMQ0+TZN0woISAoaEVIAfIcfb6OwUV7qat8TIAUUzTeUASvbKK3cJB2Qv/cExw+2tnKAvIUZQXeHO3V0IVSyfqQVwjtrrjsZ9bKpPqf73INVc9NW5IMoTeUY8Ri10e/7j4N3duG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXO6su8t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkS7/U+9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsIx43713149
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZqMEze76X1xNuYacnRcVl1H8LJPptNWPWYC9Sfl7TqU=; b=cXO6su8tscFV66Zv
	9HpQrIGjUPgKemAm7AN+hy1OnacYkmXB9RA9jlKPE3A9AbDqkMPMRcX4tU7w3NXP
	9iYK4k27lbS9Xl382KxrAm18RiPJS/xo/LzYTaRVS8ye1GY0R1pSKH6cW+GYdEkj
	B246EY+94Hb63UaC+QfNlT1cJJicX+zYHklEXlhXE0TzoPtJQ8cYjpoRYLzqDkxF
	xw098wTNQ+5RP2As6WoEoK2iv/BMuYQn7l91BYFe+pUlOdvu4LzuK72RtIm4ZNcy
	BlEEweLM65DIWxvWn7Tr5yfMgbkKad87vFEQ7v359Onis4DU0IiuC/QA8vz2mqIZ
	E5/QNg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtxb50w2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:32:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50edf0245b0so66502451cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 10:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777397570; x=1778002370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqMEze76X1xNuYacnRcVl1H8LJPptNWPWYC9Sfl7TqU=;
        b=WkS7/U+9kkdMM+SL7MUa9ovBkPVMXjjAjVPimEPBj1i0lwZN8gfvuT6lFkAVqJBAHQ
         PWlP9u30l96FxFkdI87BekQwPaXP9TGgO49DhqXubwdTfBCZ+UbLqCE4yOvgyre1H9Ow
         td9NW6JqvCzifH70UPIHMiwQzHKDPFSXMu37CH0Yng/hliZxtpFQZ9HcOcj9cgEGNC+1
         sY8jKF6J3xUu91OAmo36AHvMDe4y+cytNQr5X71VlyENPKSRXknwozEhUyRdSEUSRodG
         8aWK8fqTKKu2glfjtxJoZSp2FTztTrs1uZUVTIXEhs9q8gGs0J4e9CNcBijymwzMCx/L
         tzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777397570; x=1778002370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZqMEze76X1xNuYacnRcVl1H8LJPptNWPWYC9Sfl7TqU=;
        b=VKbHVCYnrBjYGdoWk3Rd48sJFD0FqVAM14Now7U/wIYs7ATytTgg1Uam2X8I3BbN8u
         5RzaZ7lXH/D4Yhi707fLJGgefYlAFQziGtqzRupr+HZRbi9kA7erVMtMLYYiOgqBHIbu
         2KIpGxxkT9/IHElMkncJJ7S13QnDWwe1JxC4J+KsyYHa+U/SUqo1tSQIrL0pX3clxY2W
         XxYRHmTZ0y6slEslOhTdZXh4RsPEBQ38eoGk863tbydEP0CHhOr56PQ1goYXj6v4wqlA
         bB/h+c3XlITb61CSQWMIyZ4qYPlMJfDOO2BFRJYlbi1gLyhYBdaJ/5/HwakppZXyHyq0
         tlkg==
X-Gm-Message-State: AOJu0Yw+M5Qa2JMCSzTgqdQHMzhUbpwBdQnlGe2/7HR8zkP6RVR2T7is
	2darxYkxSy5oAPhBssw9J4rZHn3s/VbfMsqr/i6KR4RNOmgtq32V2d1VFKcaAAio/WjDynDycSC
	LSkRmmICBc9GAabCzI4LYAADlj4PHSd5F2SA9y1gLkRJc9a09q8j7b/D2JuPOgGQ3ioGn
X-Gm-Gg: AeBDiesoGSlQ2nr2SepcHAg47qLV2HcNL6Im4whnO7oBi9rnCWQTTiTPZFTnliCLoUl
	S/wGy5a+5s8mA3JaKerG55K9TZxiEJOrufFAy0sgVbXzDXz5x9Osh/y1uM7aKlwzj1RKuIjBbf6
	zof0XIyeJ0Wg80b/kFVDZ5jzrDMob9Oq7upE+QLiTYLcynJmPS2Rjp7RJ8gy6mRJUH58wPdZbE/
	7svdpLVOCJC3IZj/Muf3ciYbAuOBoxvi2am/QCcX8wCKvdjdIu5uuANyJKW5pJBW9WnJbH4JObR
	ls0tmFkf+dXPGUmz0TLFJcDfgmSYKvyOMN6U1iFR2uMbfRdNWBBs0lsbeaNkfhD18CMv+Ld70pG
	3JBtIAXiQZAR6jrytP+/woK9Goj1+FdKXoUf4HLIdWF5tvZkBCOP0W+M=
X-Received: by 2002:ac8:5912:0:b0:50f:b003:59d0 with SMTP id d75a77b69052e-5100e12587amr54650841cf.21.1777397570149;
        Tue, 28 Apr 2026 10:32:50 -0700 (PDT)
X-Received: by 2002:ac8:5912:0:b0:50f:b003:59d0 with SMTP id d75a77b69052e-5100e12587amr54650141cf.21.1777397569510;
        Tue, 28 Apr 2026 10:32:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b8ce444sm2089545e9.0.2026.04.28.10.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 10:32:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 19:32:39 +0200
Subject: [PATCH 3/3] interconnect: qcom: Make important drivers default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-interconnect-qcom-clean-arm64-v1-3-e6bc3f7832db@oss.qualcomm.com>
References: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
In-Reply-To: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14546;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rfVFsqmmJPTNTZeEO/Qr6YN70g0iVkVM45qtvX9E22k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8O858/RGFFrysltXJIcoNtgw9Yeq5SSSE7FxS
 KrN04rItF2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafDvOQAKCRDBN2bmhouD
 168kD/46dTvJsKUr6UB5XcieG/9c8sU17R7oGE25JL5vPWEko/mOOLyCJNtlwaYfGhF+qLuVg05
 ERpHd64hh5ZmZ0+JUWV2w5bXTXgq+SUlYKpfaF8dujuaHUwb1ROlfbF6vfjkTqp9XIr7QtbRbmE
 zlyssgwVc/QQ0Ub6txaJV3/E8gBi/7LAClJIXuMyeO5PwN+GDc8+IXO3TpOY3RmvAXg+2rviiID
 vbF/jvpyvvvKgm673SeOZMOXJRkHz+Y/26uhY2ZlafySQw0QaQebQImRlktLA6LYNE63+Mfz2GU
 TN3OHhdisN1Rz+PuHm7KwjJF9DPWJ8Z8EP826vUPqMKj+HaZjDxcDjYjeDVxGdj6+aOYniNV/h/
 OUaqJP+y33foVFskfme+Q37atsDOxIGKiyhTuP0q4bf71c1c/RROH8uv2RYWknQK1bZUsQyxdme
 SjPyMVZF5isVCo0bpF0eQFksvzKMrlhHmVWIT3si6reG2KYIcoyxhWc9wJ0iszvr7bfnIKE0C/K
 moVb5angwYzYXDG0/kk0rpljP4QTgqC1eCKPrAolyoOmNF3lUkmcowhh1Q2FUd17Aic0pl5QN3m
 geuq/VkpxO0cogI/4NEW5rFR43Uu1Lp4tAVFscUuw/1PCxfAxbZZs/nMPGGUhirmZQJISiLOqP/
 aBZYR4xOVffodbg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2OSBTYWx0ZWRfX0vidZ6r6t7ru
 5XMmrLSlDjm8EP76n0U8EFON80r5qp0+PpcknuWHbjPJKWrUj2RZNIW1nmD3/W1zuhTymI/mJOW
 N/Hgwrux5I3wjKY1ZzlbKeQpxLZ02/jdNfeLJMl7Ekr+Jn+UwCjdYTEKvXT3cPFo87oURVS51WL
 amF0nnsTpVcP9vWrYuEqOGKIthqzSTluEQwARRxQIwhHQ3ovnTSePjtIXhv5lG8Nt9Epp2J7ict
 gWVkSQ77SYcKI7xBBFJ8YHd3NqBAgy1qKGA7Xrx+pNUVNjRMARcuSsdIjKp05Jz7ygSbBW7/ChL
 km1V73m8749jMsw8pdmFtg8zIew18+GbPNihOE1eN8G1dd/XByqSGkbG8rhuecHmoEWCffEUGaa
 X5qJLBIG7NkVFl7pbthkv1TBFiWUaQ/IM1rqhly8nkNtySuBUTilxgeghqiEqtRc9mTHyzgh8/9
 Z/DHtjDeffOXIIPtqAw==
X-Proofpoint-ORIG-GUID: 2HeTQnOvO_2aOSTA_CAvoqXn6RN0v0-4
X-Proofpoint-GUID: 2HeTQnOvO_2aOSTA_CAvoqXn6RN0v0-4
X-Authority-Analysis: v=2.4 cv=A45c+aWG c=1 sm=1 tr=0 ts=69f0ef43 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rDSDKITe4z-rceAv86YA:9 a=-wcPzy_K7TQbbHLX:21
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280169
X-Rspamd-Queue-Id: B05F648A0A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105063-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
basic or fundamental SoC feature: bandwidth management between internal
SoC blocks.  SoC can boot without these, but power management or
performance will be affected.  These drivers do not represent any sort
of buses visible to the board designers/configurators, thus they should
be always enabled, regardless how SoC is used in the final board.

Kernel configuration should not ask users choice of drivers when that
choice is obvious and known to the developers that answer should be
'yes' or 'module'.

Switch all almost Qualcomm interconnect drivers to a default 'yes' for
ARCH_QCOM.  This has impact:

1. arm64 defconfig: enable as built-in INTERCONNECT_QCOM_SDM660,
   INTERCONNECT_QCOM_SDM670, INTERCONNECT_QCOM_SM7150 and
   INTERCONNECT_QCOM_SAR2130P, which were not selected before but should
   be, because these platforms need them anyway.

2. arm qcom_defconfig: no changes.

3. arm multi_v7 defconfig: enable as modules drivers necessary to boot
   ARM 32-bit platforms, which are already enabled on qcom_defconfig:
   QCOM_RPMH, INTERCONNECT_QCOM_BCM_VOTER, INTERCONNECT_QCOM_MSM8974 and
   INTERCONNECT_QCOM_SDX55.

4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
   builds, whenever ARCH_QCOM is selected.  This has impact on build
   time and feels logical, because if one selects ARCH_QCOM then
   probably by default wants to build test it entirely.  Kernels with
   COMPILE_TEST are not supposed to be used for booting.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I propose the change to go via interconnect tree.  It might conflict
around defconfigs, though.
---
 arch/arm/configs/qcom_defconfig   |  3 ---
 arch/arm64/configs/defconfig      | 31 -------------------------------
 drivers/interconnect/qcom/Kconfig | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 34 deletions(-)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 29a1dea500f0..21d225836393 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -286,9 +286,6 @@ CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
 CONFIG_PHY_QCOM_USB_HSIC=y
 CONFIG_NVMEM_QCOM_QFPROM=y
 CONFIG_INTERCONNECT=y
-CONFIG_INTERCONNECT_QCOM=y
-CONFIG_INTERCONNECT_QCOM_MSM8974=m
-CONFIG_INTERCONNECT_QCOM_SDX55=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT4_FS=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..3134e11da028 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1874,37 +1874,6 @@ CONFIG_INTERCONNECT_IMX8MM=m
 CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
-CONFIG_INTERCONNECT_QCOM=y
-CONFIG_INTERCONNECT_QCOM_ELIZA=y
-CONFIG_INTERCONNECT_QCOM_GLYMUR=y
-CONFIG_INTERCONNECT_QCOM_KAANAPALI=y
-CONFIG_INTERCONNECT_QCOM_MSM8916=m
-CONFIG_INTERCONNECT_QCOM_MSM8953=y
-CONFIG_INTERCONNECT_QCOM_MSM8996=y
-CONFIG_INTERCONNECT_QCOM_OSM_L3=m
-CONFIG_INTERCONNECT_QCOM_QCM2290=y
-CONFIG_INTERCONNECT_QCOM_QCS404=m
-CONFIG_INTERCONNECT_QCOM_QCS615=y
-CONFIG_INTERCONNECT_QCOM_QCS8300=y
-CONFIG_INTERCONNECT_QCOM_QDU1000=y
-CONFIG_INTERCONNECT_QCOM_SA8775P=y
-CONFIG_INTERCONNECT_QCOM_SC7180=y
-CONFIG_INTERCONNECT_QCOM_SC7280=y
-CONFIG_INTERCONNECT_QCOM_SC8180X=y
-CONFIG_INTERCONNECT_QCOM_SC8280XP=y
-CONFIG_INTERCONNECT_QCOM_SDM845=y
-CONFIG_INTERCONNECT_QCOM_SDX75=y
-CONFIG_INTERCONNECT_QCOM_SM6115=y
-CONFIG_INTERCONNECT_QCOM_SM6350=y
-CONFIG_INTERCONNECT_QCOM_MILOS=y
-CONFIG_INTERCONNECT_QCOM_SM8150=y
-CONFIG_INTERCONNECT_QCOM_SM8250=y
-CONFIG_INTERCONNECT_QCOM_SM8350=y
-CONFIG_INTERCONNECT_QCOM_SM8450=y
-CONFIG_INTERCONNECT_QCOM_SM8550=y
-CONFIG_INTERCONNECT_QCOM_SM8650=y
-CONFIG_INTERCONNECT_QCOM_SM8750=y
-CONFIG_INTERCONNECT_QCOM_X1E80100=y
 CONFIG_COUNTER=m
 CONFIG_TI_EQEP=m
 CONFIG_RZ_MTU3_CNT=m
diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index b2c4272ae48f..56abd679e8be 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -2,6 +2,7 @@
 config INTERCONNECT_QCOM
 	tristate "Qualcomm Network-on-Chip interconnect drivers"
 	depends on ARCH_QCOM
+	default ARCH_QCOM
 	help
 	  Support for Qualcomm's Network-on-Chip interconnect hardware.
 
@@ -14,6 +15,7 @@ config INTERCONNECT_QCOM_ELIZA
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on Eliza-based
 	  platforms.
@@ -24,6 +26,7 @@ config INTERCONNECT_QCOM_GLYMUR
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on glymur-based
 	  platforms.
@@ -34,6 +37,7 @@ config INTERCONNECT_QCOM_KAANAPALI
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on kaanapali-based
 	  platforms.
@@ -53,6 +57,7 @@ config INTERCONNECT_QCOM_MSM8916
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
 	select INTERCONNECT_QCOM_SMD_RPM
+	default m if ARCH_QCOM && ARM64
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8916-based
 	  platforms.
@@ -81,6 +86,7 @@ config INTERCONNECT_QCOM_MSM8953
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8953-based
 	  platforms.
@@ -91,6 +97,7 @@ config INTERCONNECT_QCOM_MSM8974
 	depends on QCOM_SMD_RPM
 	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default m if ARCH_QCOM
 	help
 	 This is a driver for the Qualcomm Network-on-Chip on msm8974-based
 	 platforms.
@@ -111,6 +118,7 @@ config INTERCONNECT_QCOM_MSM8996
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8996-based
 	  platforms.
@@ -119,6 +127,7 @@ config INTERCONNECT_QCOM_OSM_L3
 	tristate "Qualcomm OSM L3 interconnect driver"
 	depends on INTERCONNECT_QCOM || COMPILE_TEST
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Say y here to support the Operating State Manager (OSM) interconnect
 	  driver which controls the scaling of L3 caches on Qualcomm SoCs.
@@ -129,6 +138,7 @@ config INTERCONNECT_QCOM_QCM2290
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcm2290-based
 	  platforms.
@@ -139,6 +149,7 @@ config INTERCONNECT_QCOM_QCS404
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default m if ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcs404-based
 	  platforms.
@@ -149,6 +160,7 @@ config INTERCONNECT_QCOM_QCS615
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcs615-based
 	  platforms.
@@ -159,6 +171,7 @@ config INTERCONNECT_QCOM_QCS8300
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Technologies, Inc. Network-on-Chip
 	  on QCS8300-based platforms. The interconnect provider collects and
@@ -171,6 +184,7 @@ config INTERCONNECT_QCOM_QDU1000
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on QDU1000-based
 	  and QRU1000-based platforms.
@@ -195,6 +209,7 @@ config INTERCONNECT_QCOM_SA8775P
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sa8775p-based
 	  platforms.
@@ -205,6 +220,7 @@ config INTERCONNECT_QCOM_SAR2130P
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SAR2130P-based
 	  platforms.
@@ -215,6 +231,7 @@ config INTERCONNECT_QCOM_SC7180
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sc7180-based
 	  platforms.
@@ -225,6 +242,7 @@ config INTERCONNECT_QCOM_SC7280
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sc7280-based
 	  platforms.
@@ -235,6 +253,7 @@ config INTERCONNECT_QCOM_SC8180X
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sc8180x-based
 	  platforms.
@@ -245,6 +264,7 @@ config INTERCONNECT_QCOM_SC8280XP
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SC8280XP-based
 	  platforms.
@@ -255,6 +275,7 @@ config INTERCONNECT_QCOM_SDM660
 	depends on ARM64 || COMPILE_TEST
 	depends on QCOM_SMD_RPM
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdm660-based
 	  platforms.
@@ -265,6 +286,7 @@ config INTERCONNECT_QCOM_SDM670
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdm670-based
 	  platforms.
@@ -275,6 +297,7 @@ config INTERCONNECT_QCOM_SDM845
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdm845-based
 	  platforms.
@@ -285,6 +308,7 @@ config INTERCONNECT_QCOM_SDX55
 	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default m if ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdx55-based
 	  platforms.
@@ -305,6 +329,7 @@ config INTERCONNECT_QCOM_SDX75
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdx75-based
 	  platforms.
@@ -315,6 +340,7 @@ config INTERCONNECT_QCOM_SM6115
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm6115-based
 	  platforms.
@@ -325,6 +351,7 @@ config INTERCONNECT_QCOM_SM6350
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm6350-based
 	  platforms.
@@ -335,6 +362,7 @@ config INTERCONNECT_QCOM_SM7150
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm7150-based
 	  platforms.
@@ -345,6 +373,7 @@ config INTERCONNECT_QCOM_MILOS
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on Milos-based
 	  platforms.
@@ -355,6 +384,7 @@ config INTERCONNECT_QCOM_SM8150
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm8150-based
 	  platforms.
@@ -365,6 +395,7 @@ config INTERCONNECT_QCOM_SM8250
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm8250-based
 	  platforms.
@@ -375,6 +406,7 @@ config INTERCONNECT_QCOM_SM8350
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8350-based
 	  platforms.
@@ -385,6 +417,7 @@ config INTERCONNECT_QCOM_SM8450
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8450-based
 	  platforms.
@@ -395,6 +428,7 @@ config INTERCONNECT_QCOM_SM8550
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8550-based
 	  platforms.
@@ -405,6 +439,7 @@ config INTERCONNECT_QCOM_SM8650
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8650-based
 	  platforms.
@@ -415,6 +450,7 @@ config INTERCONNECT_QCOM_SM8750
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8750-based
 	  platforms.
@@ -425,6 +461,7 @@ config INTERCONNECT_QCOM_X1E80100
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on X1E80100-based
 	  platforms.

-- 
2.51.0


