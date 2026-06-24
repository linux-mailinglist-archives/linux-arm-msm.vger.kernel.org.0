Return-Path: <linux-arm-msm+bounces-114316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kXA0IISoO2qvawgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 11:51:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A31D6BD114
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 11:51:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kaFnbRwM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h9eAD40f;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114316-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114316-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 409BE3018D61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB31A29C35A;
	Wed, 24 Jun 2026 09:49:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591413955EC
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 09:49:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782294595; cv=none; b=O9BA7c0Jr9biFiapFCuwm5qqvp1x8o+Qc1pR5vkcmZ7ufskYBHe/zDliwOKfqzmWDioCZ9oSh2GR+MzJZqq9V5HWtS9UzNTdYmpDaFMiI2kvza8gPskxEdv/vl40Q59k4V4Dff/btzYo/hOG/BfzbSVkYheVTMEudqbOIQWJ+uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782294595; c=relaxed/simple;
	bh=9fLJ6pohfE4ua8gQm+s3osBjzHmnBIXYoZ7LvHwHEU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kjHIeYwFCTUv2Gk0myciWEUZi3lG6I361uNQJM3B+nDPk1eGODK4WUVASMm8VkflQ2L/oygjCYcoixoewGf1YnVXyqveEM7jRqCEc3PtVAK0lOR84EVpjrMM9fAC4Q22bBwU6xBz5eWF2a5wvL7SQ3/W12vaJG2v08IR/aiWijg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kaFnbRwM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h9eAD40f; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5twx72237361
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 09:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T7bOFXZVwlQEkn2VS3KF1SyH0v0aXor2LlSePWOjJIE=; b=kaFnbRwM6fH4hEQJ
	vBqRqFDk302eKJJhBka2JLv35VeCMjvGgx95OmerNEqfTxW++1Oxliuo/kt+BS4G
	mj0eyxPwKC/2Ehqn0OuGQj8r0Op7VYuU9w3apWUOfkqlP4TXLfmkdhCo/CRETvCF
	ROdhO7gGFM1QHuIGCsbUgZN5yNyC4tUM1JoPXqto4kDERQX1MHwRxlIch1mrK+QO
	+9i75Pq48ZF6xLXzp5mpFvT6eXJA6wTfarTdQby6y4dUSlxvJVNyJaGELOPDhCZg
	frEaljHHvnT66BL4gz/eKU6QLZ/LD2Ipd78oBb00QxtnqLWtKb2kqaBt6MWCsMaU
	1xJATQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f004p2hmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 09:49:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423efbfb61so715013b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 02:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782294591; x=1782899391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7bOFXZVwlQEkn2VS3KF1SyH0v0aXor2LlSePWOjJIE=;
        b=h9eAD40fjuhrryySDrx3QCGIASyLFdIeDRAMZnd6TzwOyZcU7vFt/ajYT6VuHbuyiX
         VIdFa1+kl8W1p8zIEsUrrZ+/cAJsXptkszwfzcnYVmlVEpTaxFmHdAWw3AKQkc2iSQqj
         ZaAfLReda9yakiBvWwTFMiuZonCWAsS0CHZTH0anboPhBayyfy90qU7Ffp5SYZ5fOP2D
         Rn6ZV5zh2xyshvlqrrltM5k4x6PpG1BAmhcj36hzP2Be9i0QahvkxRFmO8FPefhv//m9
         of/MyBoU9Vfw86mpkWx2w8NXdai5oPIvF6itCW9wU2iFwBXicjlBMAXSubn2IsSTrkym
         mVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782294591; x=1782899391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T7bOFXZVwlQEkn2VS3KF1SyH0v0aXor2LlSePWOjJIE=;
        b=SgorcX1KT0RAjSKczb/6to6dxBjrxrLH+FxGjT0s2Pw8EMebJgilWIS4U4Lt2j+IXd
         GcNCisR52qBbgGZUXnjdhGS1psSdFMTZooIGO68OVPhuHLsn380wAfVMQM58cA92Dckc
         byG4t/2VziMzJNY/EvdL2REV91kxMI1NVgJ+agf4RKbiZHsdZOr/RCPikz1W8A1gu0xA
         Uspe3rdQjxmgzs/nFcS1f+IfpcAg8rTAXA/mAmhyKmDhB4WyTeKA8wvW3U47vEiJgtj1
         TC+cjVlChDNzu0vOUsgxL8rEFIqsvEvhTOBKDXu97d9iNNHK6eQ1bjCuw6XKt+iNdGBI
         OCVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3LXQcns9A8G4DbW/nYrl3SWB6xaz07SLhJ3lms9pAi6CasQur4wHp4xdHxtNmzCCFc1M0dMSLfVaJgdhi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdq6Ax72LfYLrwwtVnTR+HuMk7Ti8aZDPtrpQMg5aNcM68Pm/c
	IY68L71b7YkkbMDGr4C0XM0NiZ7rV4AV/kjUQLAfp7Hvds8bqfg89Edab+CF4utQv5gIqBPsf+W
	xWII+HZhBFn/1mv/h/nYHzGOirdiyM39Bis56xcshFxkase1HgyEuE8XJECwO4lKkoyvS
X-Gm-Gg: AfdE7cnq+OQMLWHfYTgu2kFGn6nEJi5UM6p3ONDNYQk68M15OesFGItsrhGGSV5AWQH
	bJIUPlA+yCUQgcu7G4PB/24CUOKe9PoV1Qf9lwk7X8LEqk0+4lWaZzzKz0MqNtCrlKf7tjOk+Lt
	iF74+ccxm5pWjoOI4eneP81e5p8karkoJ6S6AaRNSUOX4ot2Z1ANJ5cbQwhUG/4kaHBEKHxtYNY
	dHE8Y6RWv3Tt8wi5WnZsNqnczI2URj3ogh2hH0Qhgj4XVoDo0Av7Ydv0WzFocWKWFLtBtcXXuz4
	ZmkklASAiGH/EArJmqK/W3/U5IBxB6NMEJXkVWkICvAQrZ7ojPtS9auo7a0TGij1uaMol0OxXrI
	RERvtRq1hToZFD/pl36+9NV47JZaNqvQLSniaxEO3jRyFDlym+F8O7/iE4JsWs4m/HELCITeSVw
	==
X-Received: by 2002:a05:6a00:3697:b0:842:6fec:1296 with SMTP id d2e1a72fcca58-845a26dbe9cmr3498753b3a.4.1782294591282;
        Wed, 24 Jun 2026 02:49:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:3697:b0:842:6fec:1296 with SMTP id d2e1a72fcca58-845a26dbe9cmr3498715b3a.4.1782294590828;
        Wed, 24 Jun 2026 02:49:50 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3feb7b3sm2161302b3a.13.2026.06.24.02.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 02:49:50 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 17:49:25 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom,coresight-tnoc: allow
 arm,primecell-periphid
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-fix-tracenoc-probe-issue-v2-1-786520f62f21@oss.qualcomm.com>
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
In-Reply-To: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782294579; l=1201;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=9fLJ6pohfE4ua8gQm+s3osBjzHmnBIXYoZ7LvHwHEU0=;
 b=mGk9CEe6vF0CIKtanKdcmqLnLG+miKmjeIkw7yFjpXCGIMYnRRRCb5BAo0RXtksf9cR5Ymdzi
 hCkh5FUOOSkAfhl4D2GLa+9m2EIf4Ba4AMjuPUAmLvpwKXDrJuMxMvi
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA4MSBTYWx0ZWRfX1IAQl08jKGPX
 4O66NWGpTvXfdyEo6LuqglfpuMIVDz1H+e5B8V5jCb1/hiH40u9Kkr41WN7R+eFEcOKJmM/PjIx
 R14zDuPiOtZE8eMmJeMcfoAw/IyF0bQ=
X-Proofpoint-ORIG-GUID: VkifTL1uxmzRx_JHy3PW4lSUw4rd_A9y
X-Proofpoint-GUID: VkifTL1uxmzRx_JHy3PW4lSUw4rd_A9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA4MSBTYWx0ZWRfX1ScI5lyv48Az
 BD6qgu/hQSdZ9ROvy/tdNt42XmTojlmthbM903vHkSoPULYZG+Jn71GGjTmyI2+wNOcn3cB54pY
 tH2CS/3SWmWCqIJigYbXhdc3SntBlvLwLwtCLhOKaVpK03ZRNBZGSW4UXGZ1Voadn2LcZpJDjaI
 4ptDQaOx3GdFYLRHrMIbQf2wT9wCwoZ/eLAqCir6VTkc5KHlba5XbtMv4Y5pZ26VOXf6ZI94woA
 fD3/RRvVZ+o5uiR9OgJ9pCBt74hr52xaWs6v2zwh7NOYbOFJPOqQC1L/7qvXtiuwmJHnqmPMW2c
 k0KqotvmH0maKpeB6ZbjzIgVAFNKJrR8uXPY7qIymO56EkD8bAb8pkchmW/DH974jtsdz0llrul
 17Rg1PKqynYkgRYSI6D2Ovfs9RHqgg==
X-Authority-Analysis: v=2.4 cv=Q9TiJY2a c=1 sm=1 tr=0 ts=6a3ba840 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GsJ7H8QTZ5zs3khndVcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114316-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A31D6BD114

The TNOC device is an AMBA primecell and may carry the standard
arm,primecell-periphid property, which is used to supply the
peripheral ID when it cannot be read from the device registers.

Reference primecell.yaml and set additionalProperties to true so the
binding accepts arm,primecell-periphid along with the other common
primecell properties.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index ef648a15b806..9624fc0adfdc 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -32,6 +32,9 @@ select:
   required:
     - compatible
 
+allOf:
+  - $ref: /schemas/arm/primecell.yaml#
+
 properties:
   $nodename:
     pattern: "^tn(@[0-9a-f]+)$"
@@ -78,7 +81,7 @@ required:
   - in-ports
   - out-ports
 
-additionalProperties: false
+additionalProperties: true
 
 examples:
   - |

-- 
2.34.1


