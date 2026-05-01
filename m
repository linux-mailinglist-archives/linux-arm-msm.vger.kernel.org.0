Return-Path: <linux-arm-msm+bounces-105544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO3cC7ro9GnJFgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 19:54:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ED84AEA6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 19:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 82B1E300751B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 17:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF673233ED;
	Fri,  1 May 2026 17:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AtL67hD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7H98VNR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836A530C34E
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 17:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777658039; cv=none; b=qIpdBbPsfJvTdJrmXd3a8S5K4jXA8ePRUBNgctuhqtYsbfVeopB+Ep9SETclgbox3E1UCkv8hyI6JZl4h2zyO9ZkXeYf1p2a2ZqdUGAIO9RUnEMUai3o+/HzjMFudg4QJgNaVJPojvaRJe/CH4XKZlUolDIdyucC/RWOQ0BOWVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777658039; c=relaxed/simple;
	bh=uAL1EfxrfVlX09u2nmbDjRo+dRHKDkxe67KZbFGbRYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vu8Lm3zZyuB8ljc3vnPbvIjA8Z0/4Wws6YSHqBEiWjuYnMpVPXZdGhat2b3GOZ36i0G8BnK00NFKKDRdoCJ1x4NFE1sEP5vBnNUSay2A6Ll3rAlApmvqEZOnhB1nhUkP4ieU/PoWN2Vzc2EF2KkGV8jbSBZgo65CMs2OAqGZkO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AtL67hD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7H98VNR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLWqV1000324
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 May 2026 17:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eOp/PZqCyssUEd09JiGzfA
	ZGtk4sWljfcpnYQVhTT04=; b=AtL67hD2ai82DNSPP1jfZp5V92ZY1bAaOI4pg6
	Cp/NdFy1bo9MxexURSkBRo6FJvWR+ysPEiJmOzo2AdqdZvYupng3VUbeaAoDDrf/
	Wrkh3wsJy52EPib4bQ7G3XLCicvhXxr+qBjX678CcXFfM067g8SRbfycs5zpJlbV
	kkhRMcDuNUIeDdyUd6hKv8lDLvNZ8TKC3CbDcnCFfAYgIyI/Ri4OZUldx1iyzUjy
	5F7fpq/sdvxU+i5Xn5B/vir7m+Jg6TBhVEZ0t667YPoJSAQRywuygINl1fCFjuXr
	M9fnuSQzaWjhLLqq2NAIkxGISNOcdLavV4YNee/CJ8JQk2SQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvag4v60p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 17:53:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso1563865b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 10:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777658036; x=1778262836; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eOp/PZqCyssUEd09JiGzfAZGtk4sWljfcpnYQVhTT04=;
        b=B7H98VNROEn0Cuxz8EoluaGfMSqUwY7nOV2eArjzCpqSkByMdb0/gab/tiWzRak65q
         2z8kNES5QszYz1FDpOM+3HPQMeQXv+ktrkV3EsB8/hvWdmVrxgMDug3ECyBs0Ow10wXE
         yBB0GKwObQTvYJrwLZNx2hBPz8aSJ7rfg4GHEfYsWGfHIbvhQ9iFV2ArY+oE576cdjBT
         5wOrw+3gmgUqZkNlAK0OUgL+n501JhGnTTPwKqcdXeXeMcwr4VTx1algiRnGKK3atGQL
         e2Ne5iu3F9NutptAVmRQxDEsMr9fDYdF9s+dXZT0fP99pk4bX0wtHZnvebEZEu7NsOfC
         +OqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777658036; x=1778262836;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOp/PZqCyssUEd09JiGzfAZGtk4sWljfcpnYQVhTT04=;
        b=KLnHBZ/hzGobcAjLBIaV7DwU/zSLjCxF8RYI2RFAtzvIWveXx8sikP/HmFRDJpOvQu
         UGZgCDVwnZwnZ68RH8hFO6chU14mVjB5cUUh9MyP22o2obLzK9J/6C0Be/oI3ZMvhttM
         OSXGAQMy47MM+bjVqbUq1YxGe47+EU2OnUE0pUIlxvtwmmKXgzy29GEtszEyF0Ma2cXb
         sr45192TeHv0525I8UHe1OoYvO7PJiYA2mGoeSSoYN5ZuumwKg2ttj53sXbbFqC2yOAp
         GkGaTQpdJpn9/UtEFc9Qsizh6Ak5RM40NtxgfYsCDC3ZAf33xwIUhqKOdgTEW1FFAEwR
         m60Q==
X-Gm-Message-State: AOJu0YxBv86xAR5eQo4bYMN9vLMkSxMbLGCFX51ElmQ2qL/4kMZzCO/c
	O1VnapVt+8H6jGC1jBrvRQD1FTfFDGYqUFmps4BDtSNf/7nKD9eVaLba8lbLY2gGG0zih4EP55p
	0JJSpxeV6DF1ZnkRzJR8dspyw3amSMMOUl2b2BYBGarg70T2CsnpNZideCmZ+zIhtrzfx
X-Gm-Gg: AeBDies8DBoMTStIt2s+yDO24w9X99yXs4B9K8D+q6XDciFv7frdElCC1V43piNOE6i
	SvdYocw8ICb/jz2AGDxQhc9r0iaWT9GavktHLIN67jaOyK7rQq8WggCsaSt5As8WA47i0Bm/bVW
	O6j7yne6lrI9LRvQjhmOi2bF4bODOqhgXdJPXJuTD9zSjq2IS50S5K07yVrZHxXq4es0ts/+BDI
	xw80c2Tii5aKNm+pT98Sm9uC9R1zi0ug0eLqFDFLzm80hSmPL7Yvb00lfxl7YVP9YL23PRfENF6
	cjQBUSiUySttzq76jVe9QoWcxOx+3wGeloGgu/IGRiFRxNaqamp19KNf47IJguPqp0eKtsAlrYW
	HPSRVRYaczhYSRDdsi0Qwj4evtTunK9FHClWSIh7AFmccYqc=
X-Received: by 2002:a05:6a00:1bc9:b0:82c:e1a0:3447 with SMTP id d2e1a72fcca58-8352d20b293mr202822b3a.23.1777658035844;
        Fri, 01 May 2026 10:53:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:1bc9:b0:82c:e1a0:3447 with SMTP id d2e1a72fcca58-8352d20b293mr202801b3a.23.1777658035378;
        Fri, 01 May 2026 10:53:55 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351582e193sm3988272b3a.2.2026.05.01.10.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:53:55 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 01 May 2026 23:23:46 +0530
Subject: [PATCH] dt-bindings: firmware: qcom,scm: Document SCM on Shikra
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-shikra-scm-binding-v1-1-93d7faf1b784@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKno9GkC/x3MMQqAMAxA0atIZgO1oIJXEYfaJjaIVRoQoXh3i
 +Mb/i+glIUUpqZApltUzlTRtQ346NJGKKEarLGD6U2HGmXPDtUfuEoKkjZ0I3PPbg2GLdTwysT
 y/NN5ed8PySOI2mQAAAA=
X-Change-ID: 20260501-shikra-scm-binding-a7ff5fabd0f2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777658031; l=1400;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=uAL1EfxrfVlX09u2nmbDjRo+dRHKDkxe67KZbFGbRYY=;
 b=6KORdQezQf4a/bcg/F0QkTIDPXeICvTHN21lgaIFRvWvdK8UDPTVyHvFYLj5KFIrVVAjVKK6v
 4M6jZyRFcZqDRW1bo5gQz/HshEJQegLl2slIWSdRmObfnnP4oVdXon7
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: DAvneSgSSRmWHF842RAJ8t3FmBU1W91a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE3NSBTYWx0ZWRfX/GeeKf1PF1vG
 xqC9pj64ViO2OjdJoNpM+QrfN7O+IRhXdMS7cJQC1+bQXiXw2MS9Ckm6EWAKv3nIo3fo2SNyN1e
 V/oMrdcZKbe2EwiwxpQZenqP51zhddfG/CcsH1wAGQajjytn2b8+0+B0WRaxtC/QNolCzez7KDa
 VFL/sgQsDq9ifoyyT1+0240GsAZCxskcczrbzBABrR4ZZ7y5VdR4q/486V0QZlUo9+R1dTND2yu
 dXLj7fdg4triFB/oI1bE7lu6bsWTJcVrTX6my4IGktBiJi/HHUHlw2G4W3n+diWeBic0NSGHGQK
 gI/L6ZllqQsaB6UaugVaDPLbHknGibWsVti8JGriDaPCHoBOmaq1mpLlXMMhVB/oVNi+Qj8u3P3
 5wIy9E4LHdiNkjrPvJqNiKlMNTuqZjv/bcydvfX/usDOE+u4QyVQXc2zcHdeK2+sMKdmUFtSKPN
 pcgqSCXvrDEbXVFOMHw==
X-Authority-Analysis: v=2.4 cv=UcxhjqSN c=1 sm=1 tr=0 ts=69f4e8b4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sLRx6kNOospvv7DVrAUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: DAvneSgSSRmWHF842RAJ8t3FmBU1W91a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010175
X-Rspamd-Queue-Id: B6ED84AEA6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	TAGGED_FROM(0.00)[bounces-105544-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the SCM compatible for the Shikra SoC.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 7918d31f58b4..bb1e0a0d1d3c 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -65,6 +65,7 @@ properties:
           - qcom,scm-sdx55
           - qcom,scm-sdx65
           - qcom,scm-sdx75
+          - qcom,scm-shikra
           - qcom,scm-sm6115
           - qcom,scm-sm6125
           - qcom,scm-sm6350
@@ -146,6 +147,7 @@ allOf:
               - qcom,scm-msm8974
               - qcom,scm-msm8976
               - qcom,scm-qcm2290
+              - qcom,scm-shikra
               - qcom,scm-sm6375
     then:
       required:
@@ -165,6 +167,7 @@ allOf:
               - qcom,scm-msm8660
               - qcom,scm-msm8960
               - qcom,scm-qcm2290
+              - qcom,scm-shikra
               - qcom,scm-sm6375
     then:
       properties:

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260501-shikra-scm-binding-a7ff5fabd0f2

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


