Return-Path: <linux-arm-msm+bounces-104575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cX3qNmm27mlfxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:05:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2505546BCB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72C7030036C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 01:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB601E5B63;
	Mon, 27 Apr 2026 01:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qu3Rqlcy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIuvU41r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2359F175A94
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777251941; cv=none; b=REspQMWWeeu95EjTZrrat5+kI/iOYeCuiLEfn6FDfGpp+L2uGC9twHurgWTOHd9fyIj7GtrqcknLNgKh7GuiDpdtZkjFpU9jKUSfWag5lZJSsOhV64tloPJtpbDMD9WzFNDHci8X3HByGtrDEGZa66q7XusH8bhgKyz6HfGF/aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777251941; c=relaxed/simple;
	bh=271J0lZFHsgoJcX3dFlGjV17Kt4aHWOaGN8cZCfR5Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VQCNl5eHm0PAdWVuZqx4yP6/MVvqN0kx/2uWiwErViDDla21u3X4ypZeUOQO/av6W+qcQeWSbo7LzG9Da4CZGjQ791/jcB95uS6yauczaOCCxFdsr3CeFD1kk7yCoL1yVdHmrhUshvBMaARfA8t+3CLB9rPx9J+slnSYermGOOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qu3Rqlcy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIuvU41r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QNEpHG1589169
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=s7PxwMFZQggX2AK6HZIzTeEsYKNAeZcrWBZ
	TCXXOmCQ=; b=Qu3RqlcyHPELxHIxXjKFuxWyAr2utRwjrUyWbuZCgVWwBarCv1R
	S0C4YZKgr8kbG9hv/4fEZalBjdr5jT6PQqjzkaUl0f4loZJgi5w6BgApTnmp8O16
	Sbqi3MLOzDvBCuSsl9c4XTpGlZsYsBzlNlTGx3zVPVrcEj/HCWzowXg0+DWzkJaZ
	4KWR4jaPhjzpcnY9C2Y0cAUPSLVzd0gC7djzqhwbyW6adINFiD0mHxcP7ZSFdrMK
	Lp4bSDvc6QYPOPhMKc3chhCQJM67K867rkPoRUQ/Hna0/7LvYiIJa2EK7hwWPdVG
	AyB4xxNE+QggmTnxUlFvsybkoVTB650kvWg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4ussva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:05:39 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-126e8ee6227so10170247c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 18:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777251939; x=1777856739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s7PxwMFZQggX2AK6HZIzTeEsYKNAeZcrWBZTCXXOmCQ=;
        b=DIuvU41rKdMlv4f0pen7j3esfmHNpKK3gbs0Pn8I/KqrAij3E9xdq1gvzlX01yfI5z
         kKrCUdbk1TFX4zAONOObsBewk8cuasb/EKbFgxOswygDUvLleBSpMWejJujwg57qKejL
         +wt8XcIo6O0CsfyBrquBt2C7DCyoDilpTL2BcPNqpe+TBETK53j0bn9foLseWQgEGbQy
         xoTpSbxvgIFWp1uQsqkzZJBloSMZS4YOukL0EQ3Us+mETTMpPZhq0BXXTKGR6XIJ24XQ
         dWnlzV+xGy39KvugLuCI+fbYdfEFj2PSlfj52IqS41ONDs42SulxDuQsjIe0idEtrdLD
         Tyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777251939; x=1777856739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7PxwMFZQggX2AK6HZIzTeEsYKNAeZcrWBZTCXXOmCQ=;
        b=Gp6Knq+fOFAuiR7HafrT1OfG8u1w4ySw5rOmB6nbBLJ1CFeploq8z/KGGGnlmxrINp
         sXy7a1jDhXRG6uNppP+nty9MzTTJALPKpnOfLJ7d3AI2WQQfNNol2ijMETTrVpv7NbBq
         zRhGRFtugGhQgRAuge0IkvvVmSk4eiGQ9ILDodVOO7yPz2SlVdeDduIV5c8TwFzQJzQZ
         G6N6t2xzzQx2KpC7p7+mt3M5AGJ0mJ2XSJPvYgnn0m8SBj5wYN+c2HzTxnzBmqcZKuTT
         aip84l26ag7cy1CS4tHCM+R2x5vSlDmImC68WrxJhAhTt7NIpe41YopgxIPl9e1bp/XD
         CsPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OWQgul2uftjltQDMC8qXIyjzYJtackqCoHcJXqzilgAt0MY7pkR8CQGIYELsgm05zlV23dXKw0bT7M3vC@vger.kernel.org
X-Gm-Message-State: AOJu0YxmoOb/7Cv42G/cAeXD/hLJniX8PfcDHnRcsrAvBMDUzABoViUf
	yW/PHolyVaKQwm+1mb02ViNQ9BhgND6nH1BoRnqutr1Ng2pt7oBZFJlNz6Eifeu7xKwLK/BCDIG
	muEav2yez0DkVR6gTMI4XkUsgJnOMziexW338dBsRKxT0jr3FGRl12C0CziV3d+Fh68k5
X-Gm-Gg: AeBDieuS4fVm82zsAArTz/xMLX5hvCukkbR5p5H8/knXmpPEft26I680XudZgFkQ5Br
	hpewjO2W6CWriz+fYd9goh1RuWSjA2fQAnK7ghJSUi5FSxRewl4U7iJESrTEsllksrRPbg0f4ox
	28x3N5ycXwksy9JrlIP+cx50+POFynmWzCOlsf4YYz0azD54wH5n675+SUx5PVIP9EwVS3/nmHQ
	v4zx6aIgDVqCFekj42efraKRsxQ7cnDwdBPn3HXbKbK/ezpYRRj/b+PWJHend0p50WadaNh+oA5
	T9fHA0hMQDNdKHykNySVWHdDSg/7Jx8Vmj3xNI0vscnD6ZfoKBUzUxdD1CJ0zDgAaiw6ljg/Rcn
	a1ErgDBWgBF3z2cV/LorWJgAqAKRbuJlqVuZHULtluT5oNJSQmmyVuWWBF/lF4vqqNPsxwnNUoC
	sJYokSS7qAMUHfvXzu
X-Received: by 2002:a05:7022:4596:b0:128:d450:bc76 with SMTP id a92af1059eb24-12c73f978fcmr20066378c88.26.1777251938698;
        Sun, 26 Apr 2026 18:05:38 -0700 (PDT)
X-Received: by 2002:a05:7022:4596:b0:128:d450:bc76 with SMTP id a92af1059eb24-12c73f978fcmr20066363c88.26.1777251938194;
        Sun, 26 Apr 2026 18:05:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c837f7feasm49985745c88.0.2026.04.26.18.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:05:37 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: crypto: qcom,inline-crypto-engine: Document Nord ICE
Date: Mon, 27 Apr 2026 09:05:27 +0800
Message-ID: <20260427010527.230473-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 315kofbNQ5y7zpKgyGXCxcSSVJ4VFDPa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwOSBTYWx0ZWRfX0Znf8YxzJlo9
 RSbk33RZpGqwYwmkxEWE16ueqcj6jTg+Z0FjnRd734VLsEpSVBSND386mQ+nEtqn9pm1/hiuaO8
 n7/WYW/jMu6malBCAA4y8zD9F6yjQ1Ff6x4MDX6JapGpFmkL9JndtmmL/5HqUumOSvTRVkMTVx+
 9MB/EFhzxbc5fDlWcei1aJdS9iJHWZ4omeUUyCObrf/HIVZAAZugRzLC+/MOzWnF2fxTJVmTiM1
 C7jnrPzBfVswReb/Ons4QzZDIYC38Pk1Mf8gIT6FRqUoR7Ul+4hIzBYZduFoTemLQRGl5rFHIyI
 hXst06daUmQfmSHnUN/FBJgiz7FAkI2EETup6v2tuCI3Yejd6TkabJ0Dwr/9ERaaR0jz3V/4Lcp
 wOylXGsA54FBkJmA6B5SKK9TVB1Th+6Qb84ATG79P8wrUcDrCPztJ9ZwIisLqIgU5NADl8Koday
 uvg0QG9Sxjkq1zwKOdA==
X-Proofpoint-ORIG-GUID: 315kofbNQ5y7zpKgyGXCxcSSVJ4VFDPa
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69eeb663 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_7_cwL0RbDhQ0r_n38wA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270009
X-Rspamd-Queue-Id: 2505546BCB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104575-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC which is
compatible with 'qcom,inline-crypto-engine'.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420073301.1250197-1-shengchao.guo@oss.qualcomm.com/

 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 876bf90ed96e..9251db2b8fcd 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -16,6 +16,7 @@ properties:
           - qcom,eliza-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
+          - qcom,nord-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
-- 
2.43.0


