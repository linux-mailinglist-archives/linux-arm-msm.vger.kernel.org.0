Return-Path: <linux-arm-msm+bounces-106575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0C9YDO51/WmyegAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 07:34:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E526A4F1F02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 07:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69AE6300E604
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 05:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416AD2367B5;
	Fri,  8 May 2026 05:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LY9qr41r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kBkSvXDt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABC227B353
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 05:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778218472; cv=none; b=g+HGQMyMyx9OGke/vimq+v1ZTGQTo0B2WXBEJjrAMGJVfmr31/K2Rp6TFE5oIwzIi5jDm2JB1oGeUsjK84e4bo5WPsJir9q2399gWeH0H6Z39RKsjw94UUmkEKhvLJKf2InNV7+K0X/T+D3D759hVzn8gnMdUqb3tvgr6ktd894=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778218472; c=relaxed/simple;
	bh=EtK9N4+NFj6QWTPadZKysZybLT+fRdMIcJYSRMi39J8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IgLx1OP9tjZsPGRLt/oEx+FmPyoK5yoD6XspU+jejHMpIrB2FKCWn766eSz8mlRoawbAoFBkBCmqP6T5m5zjCL7vQxqnSfSh5iLgmULyc1irNYTsX20rxTW0TFtGK9wb9Rs4EWRW2EQisw4YH8P3oe/8fKMS47MJUnb2NRWebD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LY9qr41r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kBkSvXDt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647LsJsi1173958
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 05:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2i6vQY2zhkjKUePjVtxsVG
	kCMbPYzqKLTsKJLhPO/8Q=; b=LY9qr41r+CSRLTLBvL7Gkclx24MmzuYx4c8YP2
	/pUWtglS67Kovn7p2S/Q+BlaMo+Z48vrtwpWagTsfCBvtL9UXUqgJOGVEyKeS/u2
	C7WkdwcqpHoivEdvy7jPEAshG+by0P9ZS8RBnM1W++XNaFGWKraYUiAAh24ewmR8
	LB6wrtRMJwBDhtkIvrRVJJ5pAiFYNI6USVKulhVtLSXd9b4dr1Ibd1wAqQAXgwpr
	dTQ6QK7BPJUUBlvp3L38h0tyDewos7yZ7/dAsNEepMgiSHSbqRqdexz3wzeUDEaO
	xYR4BP7B8L14rMd7uuFokQ4oqCMsHeZNMHZS+4RkYxjEHFmg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132h9apc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 05:34:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c16233ee11so2476887eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 22:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778218469; x=1778823269; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2i6vQY2zhkjKUePjVtxsVGkCMbPYzqKLTsKJLhPO/8Q=;
        b=kBkSvXDtZ1vcFFOG0IDCNNxkjMGZEC2ixNdCFM5EJZ3/OA89wORWaQ/uB4AbxufOE0
         kRlwG5WAunAgf4Z3TuSQ84gilL7T7WhaTdxg5q4zyLGbBbGYPbSkN3hyNYQ/pQoSgh2u
         gmsacodFS+qitR+hC4snbPF8LhsYYfxXDNfLugllMRctjJ45tISuzNuAcy6S+Z9ykLGW
         5Ikuo5t2ApufC0Sgt9NT+QnL+cn3lPdNWn6lvJNvpFfjOeMxhNr1gV1BUmkNV8t0DVy+
         xZu2qNOVCMxrzfEBCns6Ej8yDbxWCz1jBQfwsglHhJnfO2BN+7K6jFySjcXWUfXN6+GS
         hMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778218469; x=1778823269;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2i6vQY2zhkjKUePjVtxsVGkCMbPYzqKLTsKJLhPO/8Q=;
        b=e5rcIaPQtoCAs18b7cp+7xTrUfcYCi8LTIYmqjwBZOANqaklo7u5ZKKIHz4OMs8pv7
         WZGuihxDco8jizI5MURUfSWSqMTktoglTHrYiM7ozLhbjXXIKgo71pMO3tzj9faq/QT/
         aAibFpl03hNXqfHXkSSGhGajl/lPRVkxT7+HzfHIXJ9ZexPLAIgQHwznBeyv1uYvVakf
         ripwsgwZctBbB0U141goUgzf7eelQA8JCSDq0rGannlYXz84mojzrX1sezw2VcOxsfXX
         lYyOwlME0pixREmASlfl88E9astfOCSiELcjN/xPh5VRGrMHKBnKtnvaQcw7xm/0olMa
         TdOw==
X-Gm-Message-State: AOJu0Yz16kxm6P7noWviXD8nuxJ7hFnUKq4rgzhFL0TiR2sVwbLHYvgq
	cIdJpbLRoa1t3d1ncJklbGLiQfWc+af6c9UVZ8D4oRELBAGafGjQLGTjLJXnZON+FeNpbvtuMXc
	RvmWbjE5KP/QjsCeTIrRfPGRaVoULaXqpPx9HUA77bo5VHaAHzD4jAiuPMJ7tPWNe2U8q
X-Gm-Gg: Acq92OF8XtkHNu1O0wOP7MIoh239pxGR/OUyqJYICVFsKyT4FsfGzG6KvM52mKis4c9
	DbM3OaEOWvW4hCl+nJk+QG0Pfdg6HKKfYYr2gUWmzT3NO3B1c8/dQ3qGVohRMp5K0XVlFffQivg
	f225oWf/nLt4gjhWAtVcBTNW3P7sRLBgPfNmBSNCi5xPssNDnGLUSscA97CPC4eNKTBNWF6s+gF
	o7kif36t9Vtopbx8V6ocq1Z1/QCmqWF6LE2fSllh6ebudVvKFWzKVMOZ51Dhmg319Qs6XH3MlAB
	MoO3HKLp9guDl2ElTZSce8tE4Cu2WRjdbLBYZWOVc6Avao9u02YRUL4cnrKKA+MrsmZ9gUjuV9j
	NfPXERxb0AI/VDkyEUEvZugq4he1JTtEm0Ge3lWMmwswmxNLc4n4FFVSpTv/MhzetE/hQURgCNQ
	==
X-Received: by 2002:a05:7300:a286:b0:2d9:3616:d897 with SMTP id 5a478bee46e88-2f54a77fa85mr6196578eec.22.1778218468704;
        Thu, 07 May 2026 22:34:28 -0700 (PDT)
X-Received: by 2002:a05:7300:a286:b0:2d9:3616:d897 with SMTP id 5a478bee46e88-2f54a77fa85mr6196556eec.22.1778218468092;
        Thu, 07 May 2026 22:34:28 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885be8esm847475eec.22.2026.05.07.22.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 22:34:27 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH 0/3] pinctrl: qcom: spmi-gpio: Add pm8010 GPIO support
Date: Thu, 07 May 2026 22:34:06 -0700
Message-Id: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM51/WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwNz3YJcCwNDg/j0gsx8Xctkc7PUpCRDEzOLVCWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgAwgdVUbwAAAA==
X-Change-ID: 20260507-pm8010_gpio-9c76ebb1468e
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Collins <david.collins@oss.qualcomm.com>,
        kamal.wadhwa@oss.qualcomm.com, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778218467; l=896;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=EtK9N4+NFj6QWTPadZKysZybLT+fRdMIcJYSRMi39J8=;
 b=hTL+S8J/RoJ1e5ujpIjmo3jJulQpBAtLGIfbaKsOvZ38XxqGNZSbS4TlsS2hvLqu2lSr23JWC
 Dcdqfq5D4iMCWfCuhGC1SsQakYd6sujwtuL05rHNr6XHKr87Er09kCA
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA1MiBTYWx0ZWRfXwGsGbQ2ruQFV
 pmgjxeeSJ+gGem4CYzqphWZuXZN13iKOORTbO6VpoViDK04eRSXtQXg3753tNZ62IkICV4wU7Qy
 uL16f4gCQ+6CF1yWUOOSwSQWLX7OePN4zH7TI0thd5Pyn/T56+VSJ1/P6UPsc4Jjwrs2mGzD7d7
 xvtKZSNqoluyrBCNeuxYio/e40VOwmyBJBNvrMFEPXWB9sqCEAMt3ljwCCbEGd2yp89zwwGGqTw
 GHGVC4qLnskuM5/X168KqXEa/4MeTnkoFKHlLDAY1/RIZxehhOj43hF573bsJtE9sInkOP4o/Le
 smdWgOLWUB3S8zyT7dllFtOhKsoljFwS+sZRpPy28DRhkkEbjxQA/uWGNmjPBelfUWZdUvr5sIF
 vQDmRjyLwSnoKcLVYQGo0vspodM8/Q/KtduN5cX6GnjHbZMRfB4nMT0bOEgr5qj4Nx2gELpJmAn
 9dee4D+Z1YNCdfwgsnA==
X-Proofpoint-ORIG-GUID: hGhrMFGbL7_l9OwnOeCB5YWGCiCGdYp2
X-Proofpoint-GUID: hGhrMFGbL7_l9OwnOeCB5YWGCiCGdYp2
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fd75e5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=78EXHlv9UA6XwD1DlFUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080052
X-Rspamd-Queue-Id: E526A4F1F02
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
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-106575-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add compatible string for pm8010 GPIO in the binding and driver. Also
add GPIO device nodes in the existing pm8010*.dtsi files.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Fenglin Wu (3):
      dt-bindings: pinctrl: qcom,pmic-gpio: Document PM8010 GPIO support
      pinctrl: qcom: spmi-gpio: Add PM8010 GPIO support
      arm64: dts: qcom: Add gpio device node for pm8010

 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml  |  3 +++
 arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi       | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8010.dtsi                 | 20 ++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c             |  1 +
 4 files changed, 44 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260507-pm8010_gpio-9c76ebb1468e

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


