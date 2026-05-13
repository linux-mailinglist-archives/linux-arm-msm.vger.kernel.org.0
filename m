Return-Path: <linux-arm-msm+bounces-107385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLk9EqekBGogMQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:19:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D23536F11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6537631A348A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8774921A1;
	Wed, 13 May 2026 15:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f44m0/V4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ruk462S6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA0138B7A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686549; cv=none; b=IeIGdYAow1jYdwLpVkOr0yvQAxvLAwHV/V8SefHkedNgDNyFNCJI+DM51uJ2xessC+hz8ZPGH+AymsId3KXOLTv/iH3hd6GK8sEuxXeQHsiPHfEWEDIbwowW2vIPstxXbwk2Px1kPZcr1OO+WlhUlviFTTBIlfmIIuDNHwpapu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686549; c=relaxed/simple;
	bh=kMNSk39bNo30KB6WJu2vTf44IOSSIKHLbKFhKuRsR+M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZGgnMrsReT51QNkIbEwp2fqa7xg8eTg6/8gyF4pvIIsCmaH0Nv3B2mr7UWEhoqgSH5WyHx/lYVJcv/D37Ed6CSTy/JfMdAMV4RXat/jEPbaeNix4dZUdGKPYGVjDAJJ3CrkLvnazhfEhtsSgf9L4RrotEvm3Q566B43mDu3dSIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f44m0/V4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ruk462S6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jgOH3007391
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6AX50bGOYpZuXgoP20+PQy
	NY7VRPx6PEWPIE0dzplYw=; b=f44m0/V4a6Ms4JiVcPBEHQeUCOzZk1hCW4E3f2
	Zwpq4WEYPfVTUYpi4LHoxmfJHFq+WEbfwQy4h9iwTqq+z5GZNpMZFCr/kTmRlfcH
	DpiuUCa1eNyFs5DhVhQ4PJDNmKRWSquMCFNqhQFIf2vPqiKVRPPMFIa59SR1IwO/
	Ajp/Pz1wOPpoda7TfzKv4Z+AS+pwRkHODMB8XSpUELeK9aqxs/+Tc1eqRnMNNfWl
	SsXyzdAVvmmMyspCW85u1qcKyGKwVnYe8L9UILltizwW7U4LQiNtJ3L6V3dsZ2pE
	o2jR4an0KpRK/1cCuLKzc3f9h9clWBxptbB+EuADDLRfh95A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0hatg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:35:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6347ed78bfaso3001061137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686545; x=1779291345; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6AX50bGOYpZuXgoP20+PQyNY7VRPx6PEWPIE0dzplYw=;
        b=Ruk462S6U6cCnwOacdnMozkKZtG3LZzxRa8J82FJRRbQPlTVkopmXf7dV6aAd0qL1x
         oYblE5NV5cIdWByW3WBIiYpk/HhyQxmgdtF5qOs+54b70ZGR+8u5G5ye2jtNU613O3Rk
         s5P0WbWISFqRBAHkkcKCMeAi4YrUX6ES+2ZFhxZnfyK2khiAGiQXo6n1u5eLp7GYE4Hc
         2NBvsemBFbodV284MxqtiY9gnyyPl8UDYyODtk6NlgJfKM4r3RAQCn6Ag/GNqMgVAa5x
         w121v1RwuTBLrVRBfWXi3nK/MkcyUwGrShrXFHgz73RcKTzzAToBiSuwX2aGX0Jn3+7Q
         aylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686545; x=1779291345;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AX50bGOYpZuXgoP20+PQyNY7VRPx6PEWPIE0dzplYw=;
        b=IA9jwbhWm9llqYIP1J1WPoQsuvhNnQxRHLVLXSI+ZCjo+05JsCVwK/70xBdXn8JieT
         5lssxnRPx9T/M/69hs7747mvP/2H5PPgsRLKZx1CMQnWSG0Yzc1RbkSJ7Tdgfu34Fs0L
         YMH6BLMeglbmlv2iiVLFqM5nTzbwA9+z89Zpq2R/nfeVpvgTeKZMQH9PZsAum1y9HwWG
         ngjTBhCnN6X2gcOa+LA64gx4NZaGukbgZqtfXWy0GAAmckv8ANXoUUgGRCJD/zvA9jRY
         yI6w03MGdDgykgCIHcRC8Ppv2eitrQLkx+YMHUwajOuMDkpsHvXsZ9Fp8Xa/PXB5cNsE
         bp/g==
X-Forwarded-Encrypted: i=1; AFNElJ8eMNBfO3kJfXrpLHYEy78BJbJvNBV//Jv+FgmV0TeWQRzMcE9Poo7uG1UU7JB9J4YNgQff+eepLKutu/U4@vger.kernel.org
X-Gm-Message-State: AOJu0YzFFLglk5GZsmRqn0DhkasV7RE1Mgf1VFrmBTCKhYx5wtRJYhEt
	SSn1EdBENSKIpjx+6ZV72IfmQPxL2CjwKYMKw+ia5lHKw9EglN3kFnMFzHjqT2nrKiwHAPSOkdD
	XmLKwwe8L60P57fLxYDYxaP0qC9GKHuh1DcbuP8BQs/ZW4p+yKElOFT//zXCi9SjYf7qE8+dJJQ
	AK
X-Gm-Gg: Acq92OFgIaBVoJy4SiyHWvh8QpgQ/keaTX29EmWs/lSC4JtWKSMx5xuXGZ+QbH8Zpe9
	uHI1XZyIACv5Ftp2F7F5csdRdd7rgvaLqZbK+vUPThmenrtHBbUa0ONUnWpIzmuYYesB7alXhNg
	0umVuMHcdSIothaiP1PzPg1n9pJix9tanuI91JbGMMs/+ZfvAcbNtFoWDPaoF5irVt1njLrc4Ju
	3qoifbwKrlMKoVIi5wCLtRnUwxS4NWLhXyU3MAQBRLmUq+TWB+59WslcZHyo/2p+RmwiB8+Cpib
	FNw75EndJi07/QDPT/lf1qW2B+oEBM/Baxh9kkHMyB/ZcWMl2liIu6QVQkCD6vB82fJOJNLDLQS
	n1AkbP0SiTjK/1olRH4TU/veNWH3DbwA/bbPQIsGLU3DITes9kg==
X-Received: by 2002:a05:6102:84c6:20b0:638:944a:49a3 with SMTP id ada2fe7eead31-638944a4b17mr455788137.11.1778686544666;
        Wed, 13 May 2026 08:35:44 -0700 (PDT)
X-Received: by 2002:a05:6102:84c6:20b0:638:944a:49a3 with SMTP id ada2fe7eead31-638944a4b17mr455529137.11.1778686540123;
        Wed, 13 May 2026 08:35:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f446ec6sm43165835e9.32.2026.05.13.08.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:35:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: nord: add missing define for the USB2 PHY
 reset
Date: Wed, 13 May 2026 17:35:28 +0200
Message-Id: <20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAECaBGoC/x3MTQqAIBBA4avErBvwh1x0lWhROuZQaChFEd09a
 fkt3nugUGYq0DcPZDq5cIoVsm3AhikuhOyqQQllRCc1xpQd2m3Fo8wK93CjJiP8LKyWTkLt9ky
 er/85jO/7AVqBoYtjAAAA
X-Change-ID: 20260513-nord-clk-usb2-phy-3e60fb0c31d1
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: brgl@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=681;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kMNSk39bNo30KB6WJu2vTf44IOSSIKHLbKFhKuRsR+M=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJpDbEKrugiY1HaXa3Mgrvl6oSYX0qZDcaT8x
 YsUb7Oq0qOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSaQwAKCRAFnS7L/zaE
 w02VD/4jkfnBKF/itcTSEYinM861teAxQqad2iojoN092cfUl7K4tpOkwItU6oHq8ZbEoZRdCEY
 T8oFjikG/NTthRYMEKdBZZF68rMdvJdkhLA6xhPKDnLqfEyqyZckEmMTEEj4U3DGbhUvsxz2C1M
 Wu7LL+Wag22zYDMGjcpBUmM4cQR+pVNFMn3v1FU4PLarEMkVau07ELFkW7XziAK489wxDE1f+N+
 4QHsj1jtjboYhjgX2wb69qbBfkiJQnnuemYNKPPkb/ivNablcUuYAgwlPojY/qvU0sbflQH+UlV
 H0G69e7XbemRgpORdTE9PSFrloykr/OrAYPQ5DinbP7XnVuO/RKlfwLS4fbogxPOFeogKCw4PSa
 57OE0eeAGRW8aa0LcCZzn56Hu+IVBYlXClTSza7itAMlNMpY5SzjiqWanEpcgOH5oZKnWh69Mpi
 230VtmlMcrnKfwXkxI28ajHmImw3dxwYGDyOHUJaEPSla2JR+q5Yf3S6pJVX1BXILAG+iFqS111
 g/Vrjs8fmy4rKCU/Rk7P40JCbJpjUR/NYyjWF0Jxm2oqqjjOXCwRSJWSGAP8i5I28ALp1dK1sqy
 8GYDIC45ecUiPgp3oHDfdyQw0/WNL2NqpVcqilt9rE8IJ4nBSCYhLZ1fsy96rCCPfta48/xt2/K
 BvJo8uTI2TUTH1g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OSBTYWx0ZWRfX72y3vHNr0Jii
 S7V/LGEhYZV456ACYkNf7ytArefYFhQeRXj7jOuMrOQbeZPlwpTVgttlfNqYTEmlXDY1J5nH1xG
 Nfxfs0bM9ya7/KZPHtHHHl2aIBuAp06EkFJIZzmfNkN7DCeCVbno227y55rbwqpXljwKNz7pBWm
 9oWaTodqMHE6ufgbd6SodaXbvZWzptdUJ/jRjwE5mrHNN1fvnJ9QTd334qvT21WFboM2numaJGR
 bf0XsdeYBpLrhNQt1fPOXGmCH7hEt9p9o/3ZItWtlh45Q8fdLF9qAGPSB1dtjJJYC4weQEEUlu1
 F0h3WkVWYpCCo8FwhRELQN60ITLGULkrpoy0AMFnc6zKMZtxXKbpJ4z9OUMINlmAb+y3O+UmFfx
 zl3l9SNFgZr+mReteUuDz6E/Xk1pUmON2q7JQ0MxHR1QXxfKoXStbLSPpHvGHFW1215gw2mL0QI
 c49kv1w+c+T+Flie+pw==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a049a51 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=BGJgbtQK9DYxViS1Zj0A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: aE0vNZztGvoUa-eEBS9jtxbve-Gkotxg
X-Proofpoint-GUID: aE0vNZztGvoUa-eEBS9jtxbve-Gkotxg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130159
X-Rspamd-Queue-Id: 90D23536F11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107385-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Update the bindings and driver code with the definition for the USB2 PHY
reset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      dt-bindings: clock: qcom: add missing definition for the USB2 PHY reset
      clk: qcom: nord: negcc: add missing definition for the USB2 PHY reset

 drivers/clk/qcom/negcc-nord.c               | 1 +
 include/dt-bindings/clock/qcom,nord-negcc.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-nord-clk-usb2-phy-3e60fb0c31d1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


