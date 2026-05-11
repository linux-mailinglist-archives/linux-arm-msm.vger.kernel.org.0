Return-Path: <linux-arm-msm+bounces-107013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIhZEMJZAmosrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 00:35:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FCA516FA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 00:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 472BE306150B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 22:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF99738330A;
	Mon, 11 May 2026 22:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iFX0tL1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="enWV83hM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5365A383307
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538265; cv=none; b=QEuWRo5L3WHF/6KwmWMyVN60bwlemg+Xhu86BL5WGSBaAzXFTg44tweC9JUPO3Y8OWgCHdJIhecelJsHuwt21ZefYgvelSnZqQwBWa03yyAv94SPcFT55uhpoa8dev88dpP9fblei9QKYOtndBhYjuGecSv8b/rxKv8pecvOaIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538265; c=relaxed/simple;
	bh=+uTlY75+A8jGzIB/N4/xiE+azL9XNqkhu9GBlCp8/ko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fz7UUqIusEdJPuVxZLVw19bi60zE0MMOXhYJipXo+EZrMM1wyZv78KqUP3y3IpAp97yC2V2IxFWNdZd5tobydXk5YScFYotzZsJ/pAm+SofkLozEnmfBQYuR7c6kS/WO9LY9uZzgSUhn9jEFNJNjBvWMcC/y5ZZaW7LNTur7KIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iFX0tL1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=enWV83hM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6cSr3444270
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	57sKeh8lL4FkccDNyKYVDaGV++c0dT2p9qWmYiR1PEs=; b=iFX0tL1JwxTdVnpl
	FH2njcSk6DdK2fIRndW8l+GZvPaNPKNCDf9bhXCT3aJp0V3s+BjTkzfYvoSudep8
	s7T37BLi+w1GpiVu1bsR6L0bglurLgO25nwUBj9iQuAWppwEdOTQ2G81NEkB1EUk
	3iWEHaACG/ixFmip/w2m5F760FO6s6KqGtulq37Sd/f0T8r2o0rnWNHKNM9K3RoZ
	aJPWFvIerAUp+xD4/ngdjgpOn5qYkw4K3qN5hJ4Zu8ykTQF741lwvFZtX6y96RoD
	CxMTlB92XG8ESXNUzpEV8lZP+n3yE60mMRzBhJZlH92yyZHmEryoIzdiLtF6OxLo
	wwAZKw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0gfde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:24:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so2469812b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 15:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538263; x=1779143063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57sKeh8lL4FkccDNyKYVDaGV++c0dT2p9qWmYiR1PEs=;
        b=enWV83hMU+GluCWIW2irUXdZxIB9GxlxpY1i7rbSfLCzcxschpAfM/LPpbKcaeq/6S
         tr/tLGyacw6tsv+SLamACe+QUJ0Mme8ukGKusaz1bvGXOpGQB/C/ch8+uKCqVrIwvZYX
         QIXzyRLMVAcQTPFnlMNOphbNDkH6TKGoRaDf+5ilzu6VHTlfnkCjBFM4op9ewU0/r8bW
         xT14qm09l3Rg5Xy29rVjFnCW/uOcleNc2Fk0ORRmN+lZzJvv2vHNX9mvDQ3Zcz902frq
         gowjHm/bWttHJ4ALf++uaq7TwEZbzwu5aaWU+yfLSWO8tETABGhbJtie+LoCq+Z7efKQ
         0Plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538263; x=1779143063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=57sKeh8lL4FkccDNyKYVDaGV++c0dT2p9qWmYiR1PEs=;
        b=hF2xhwXCploN5IgX5KtKY6uBfyTFb4RKn93hlegiGdRlyfXgFNBlqXh/4BPsCi7OkG
         +AZi5rheoDXG3ixGcefeY49WEuGuTm8yBPoE4qV4JgqoTZ3tUCUyJMETr1ZOvIp1VVXc
         G0DmtX54elZe6t/6m5MLQLOUal/MvtXWyjNdBwGRlh1CFaFiG5EZGGBIFWZnKvIXkZ5U
         Vla3oI1im8/uoEZ/oo930TF0b2RIGuEZHoCDbqyJjEAo8ibyQ3Y/ZbANSrQd1j0yr7KZ
         6vDyJ3qkEsou8XdkQWqSU58ryZPETT392cYDvpUWsEtWodSsrgzpyQ3LUd0IpHWoXDMo
         1fyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+Jc4o6ghXOMpjuPdnW9u4I+e8kITCcsNZuzhn/K2vh1nhbxSkeai853rAw9mHO9eWkYFcsgPTVIB4P76e@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2wtco8CwL8WlNwg3qX/+ntdbIJeaN0G0QCfx5++czAhAIurxl
	9jI/9C2RyX/jlRcFL3x4QSGY+2UqfGKwZVx0WQXyFRAKveTyDMfxcnFrJMkIUsFOdX/OZpUyhtW
	DJ5h3TjPegHoUejNMugTLny5Z0LZCr5owpz7JNjQDRIvhWdB1esBygRty7frKHLu4kC24
X-Gm-Gg: Acq92OF+r/ODW5dX2fRayMSUSBKVjA3wj+8lu4CoMZ6bl/IwVE2IHGv1ifPOzJFIXUr
	juVLfAAAzxZCmQYA/XRyTdp0VGjsgB1lWgN3+jw1XSr6JKYUIlQRpFJTLjZRqpGYXUvDjrjZ24O
	CdKTVbbJWrGvGWU3zW8EEgAP1mQm58dP4s+VrgcwmnDsGYwvaDugptS8pdKbrJ7ub/I4injWrsm
	HuBltAtFK/cTo48bP6h/vkOBgH+8TEKHEDWD6NAZlfsL8a6wcIE9x9HESo/7d8MZKsiuCnnDv25
	DjggXgH1F2gy7SnzIaBatHYdiwx8Dji5rP+rmnJS11MaZdzkuhduCWb7VIzGxVk+PvHxEOxxLAY
	AkTSlNqABjdB80SudZgHoHyWC/D04m/moRQDmHWKHAR26rA==
X-Received: by 2002:a05:6a00:4b10:b0:837:80a:5ac7 with SMTP id d2e1a72fcca58-83eebf9e24dmr308839b3a.45.1778538262966;
        Mon, 11 May 2026 15:24:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b10:b0:837:80a:5ac7 with SMTP id d2e1a72fcca58-83eebf9e24dmr308788b3a.45.1778538262422;
        Mon, 11 May 2026 15:24:22 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:24:22 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:20 +0530
Subject: [PATCH 6/8] arm64: dts: qcom: kaanapali: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260512-kaana-gpu-dt-v1-6-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=7515;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ag86/kr8s9/wNu8KURJAXOYQ6Bs1j+iLqYPusIeA6fI=;
 b=wM8Owlud/s2u1nqMO3HiUFxdka2NfMzsv82KKylH8Ys+RapuHT1nTFY+UvTkFBsMlWzoxSROh
 bY62uNfVaVvBZFPfMENypFO/HWOelmtCw6Rc+QImvshXpSSNFRR5WwK
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=V+xNF+ni c=1 sm=1 tr=0 ts=6a025717 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qhQHLv6gl62QQ5NPC2EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: KF9NboeHKOInIssCptl64rmWlrnABI2g
X-Proofpoint-ORIG-GUID: KF9NboeHKOInIssCptl64rmWlrnABI2g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfXwJer2i5m1vcM
 xNUt+raj5xtDKMuTC8dm601pWVBfKImdph8qF5XpZ4jeMAAlUcKwFVo9tOJcWRzJ+3L2XIVxx6I
 05S5HeNq5PjaArr7uQ7oNYWUF2rjsb8unGHhXoUYNqUIn8kttyhtigilV/SEM5UVg/yz2vq7OTV
 fEzsRh7h9YAgE6/jc6oimzHQE/wgUhuAL0y4KTc5Li9FuXn6QM7gzf2tR+1ZR4LSa13sqjCdq0U
 LzugWYnKzAn5FDKru+6EITF+B5F8/HSVvUJzdjdoNYZpdb2Aj1GhRikPjKqRW5g2FrypPLkfdWI
 zB2T/N3IHAx3aOmv2A9BGfu4MuaLn0pB0AaNXFBjSu98+DxVceHpeiUzma8BQ0aA9JvdVVpJdgv
 M6lXL23lg/jwu4CMamW5ixEs7DNKpq4AQPxOagUPprgpPpkDMAxAnNkHDeaRuh3kHVbi7ltx3UX
 FW9QjeLjT9XSvs+9s4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605110236
X-Rspamd-Queue-Id: 91FCA516FA5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107013-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed
when reaching 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 165 ++++++++++++++++++++++++++------
 1 file changed, 135 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index c57aea44218e..5089416ec32c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -26,6 +26,7 @@
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "kaanapali-ipcc.h"
 
@@ -7045,13 +7046,15 @@ nsphmx-3-critical {
 		};
 
 		gpuss-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 0>;
 
 			trips {
-				gpuss-0-hot {
-					temperature = <120000>;
+				gpuss_0_alert0: gpuss-0-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-0-critical {
@@ -7060,16 +7063,25 @@ gpuss-0-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 1>;
 
 			trips {
-				gpuss-1-hot {
-					temperature = <120000>;
+				gpuss_1_alert0: gpuss-1-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-1-critical {
@@ -7078,16 +7090,25 @@ gpuss-1-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-2-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 2>;
 
 			trips {
-				gpuss-2-hot {
-					temperature = <120000>;
+				gpuss_2_alert0: gpuss-2-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-2-critical {
@@ -7096,16 +7117,25 @@ gpuss-2-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_2_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-3-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 3>;
 
 			trips {
-				gpuss-3-hot {
-					temperature = <120000>;
+				gpuss_3_alert0: gpuss-3-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-3-critical {
@@ -7114,16 +7144,25 @@ gpuss-3-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_3_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-4-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 4>;
 
 			trips {
-				gpuss-4-hot {
-					temperature = <120000>;
+				gpuss_4_alert0: gpuss-4-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-4-critical {
@@ -7132,16 +7171,25 @@ gpuss-4-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_4_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-5-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 5>;
 
 			trips {
-				gpuss-5-hot {
-					temperature = <120000>;
+				gpuss_5_alert0: gpuss-5-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-5-critical {
@@ -7150,16 +7198,25 @@ gpuss-5-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_5_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-6-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 6>;
 
 			trips {
-				gpuss-6-hot {
-					temperature = <120000>;
+				gpuss_6_alert0: gpuss-6-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-6-critical {
@@ -7168,16 +7225,25 @@ gpuss-6-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_6_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-7-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 7>;
 
 			trips {
-				gpuss-7-hot {
-					temperature = <120000>;
+				gpuss_7_alert0: gpuss-7-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-7-critical {
@@ -7186,16 +7252,25 @@ gpuss-7-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_7_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-8-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 8>;
 
 			trips {
-				gpuss-8-hot {
-					temperature = <120000>;
+				gpuss_8_alert0: gpuss-8-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-8-critical {
@@ -7204,16 +7279,25 @@ gpuss-8-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_8_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-9-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 9>;
 
 			trips {
-				gpuss-9-hot {
-					temperature = <120000>;
+				gpuss_9_alert0: gpuss-9-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-9-critical {
@@ -7222,12 +7306,26 @@ gpuss-9-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_9_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-10-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 10>;
 
 			trips {
+				gpuss_10_alert0: gpuss-10-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
 				gpuss-10-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7240,6 +7338,13 @@ gpuss-10-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_10_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddr-thermal {

-- 
2.51.0


