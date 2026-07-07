Return-Path: <linux-arm-msm+bounces-117245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4nZED/fRTGr8qAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:16:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BFB71A303
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:16:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CzX72+0v;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ff08fnzh;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117245-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117245-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7294530D51FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FA63DB96B;
	Tue,  7 Jul 2026 10:13:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FE93DB324
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:13:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419187; cv=none; b=mYScB0Edl+ZWFY3FbRBaL4R1n8l7vB/CpYsJuHKZFekcvil+YQ7L/q8MDV/vHoS9bHDtdkSyH/c6Zw+1ao2kZfJ6HNlOpPXH7HH21UpkJt4VAnGpTHbkQERATf+l2tY210NWeEL5txW3Jqe4yIafW2ooihk4dCfYUTdr67cTJS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419187; c=relaxed/simple;
	bh=FfEUAF8+lLL4qL6LuVUgTiQ0Tb0HI4D89dvQdM2x170=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qZ+7/+9CDydCQAUlADYSBwRCdcS7QFW8Cu/sjLqqs1diEiJI2Kklp6NuRJ3UoxoDFLQPWzHuuNLfTpYoYZh9RAQxLNYlfPSEIkKxqrgfTiB8e0th9CdEJ6ZtC+mxy9lWW85Cq5MXxVbX1ta69DJim8TsAWX2GRGfRz+ypE5vsjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzX72+0v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ff08fnzh; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DaH63243054
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 10:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/wPM0DgYJmC6ld689rrHwMGcNHTJvtFW6fso4wq4mkw=; b=CzX72+0vG6Hqi+l7
	3g3b3eBHae7WSIloVcV9l+fPMBGprhYxnU2TmLRsxa6DGk28Z1QUIaRddEb5wJWS
	ugC3upVR6Va7Ii7JTUMGMRL3Ch/l7ZUwJ9lO5HzE6K3+wcY5khCGALGAX6nqcNxd
	mLtyAScIBObIne2YulkhZL2RThj6gCs2h+1JDqEpH8JbzVECaz0dKGU+u5TaYWmX
	U8nRyx0/IAyl+MP/28cbG+Gg8xC8Tu4Xveo7kzf0Hq5q1Y0nIPcQUMQKRKsx/Rcx
	iHr+JHW/INBptHWWd3oy1BlGAgNfS8DdoaRBHtY0XmvaiOp1odZye52qkmsS/2tS
	kj+sdg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11rp3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:13:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c891ed872ddso6658467a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419185; x=1784023985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wPM0DgYJmC6ld689rrHwMGcNHTJvtFW6fso4wq4mkw=;
        b=Ff08fnzhNSKHqb8g4NOwfrZq2dk34kPwI+ZGtFnRwBVzsREOSiHWqr81eUKkwfm7jf
         cElD/VvWhBwRC7z1XC/yaux0l4+7TIr8oic34vAqcnGtTXwo9Fm0vGhrY5xaO1VHgnZO
         xcorDU1KylZv0SGxGYB6UdAYuFHcrCANC+UspTwjMV85Um7d2L75B2sgCKSFJallqlHv
         hTG8NX0R75qrMV30ld2hv5upbii9P+QB86LxuQI0/pUB7xP4RMg6oMbLgzgmnkggkU7w
         UzWT1WfhOxdcy+jt1gWdEsb6lcQC/MRB4ZCdDeGJmWMmRPMOwV8llbX736ro7lPBErpY
         HGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419185; x=1784023985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/wPM0DgYJmC6ld689rrHwMGcNHTJvtFW6fso4wq4mkw=;
        b=XkU9nTk2zQXPNW2QXsiGvAW7co59jVUYsM0wYK0Q/+Lh5Dc6XtLB/2VkY78nNSmSvM
         2TnmNYpRo8sk4bEw8694zDtrKSsI4TsRmyq3Lp86wo6fy0fAZvG9xlUzVlb29EpAguXG
         48Y1QBhvTu2fmE5A1F00kTR+UZKxUyXxmdQoxhs4lSptJ5hYpQSYbCuBEeCHIx1spu75
         dRb/Q8XhxMbE4l+LyNnVEtZqazofM9LgzdPWfUR1eDJ/hKFa3gHhm9o7p5yi3LwOEjFn
         a4BDGaRhhqkCSdeqUj/oGAeYoYbye5rn7tmXGAtrwDHeuzwsY0SMx94U/sKbHcBWKyOp
         gDHA==
X-Gm-Message-State: AOJu0Yyro9B1yEHFjTBcb9+TutDzbny7KHNVliMBg4TYVwkNfq4imylg
	7YXa9lyp8w7JZo+q5xof3AlGMyJzt95vNmogW5V2Hcqdr2ToDx6vtGBPkTReu551qSopWmADOUe
	Yxy9PiE3iZ/bYCCzG9sgLIshRNAISORIAsIkw7/I7ahY3cHzQR6GNH+COUXnoElKIyVmz
X-Gm-Gg: AfdE7cmxAgHwyWec47W2ppJ++s4KueCAwb5cubk9gYr82y/qxSvzk+H/fd2t4PUu+7l
	dV8sfEQ4ageTlZ7vcvFXJcEj1TXpF99/LVCTtnHsehOazDMlnfNmAbaAI600Dqt09+olZKTjFGQ
	Q73PiPfnkT0XZIKW8JW7+ETL5h6ab2LSCVvKiUO8HVYK4uiJ+/j4+QhB0BhImzlWyC98un0+mlt
	H7VTzrx6GQcRzYE1aqNXOWXRN2kbGqi+k0rAG/XnEQxHKH5U/H7padwjiwFudvy3chb6RFOIRO5
	MzpHCEFz++4hOkb2AJNZYz65FzSCMyIbkD8OEgIEf238n8HG7WiZCpsZ3rd8FPnQ1NrBUrraRpi
	t89GLU0jn4BlbZjWW5nDhi9LhFMyAK2JH77GLn1hJ0DQqPk/pijqm4wNB17UM
X-Received: by 2002:a05:6a20:94ce:b0:3bf:e2f1:1b12 with SMTP id adf61e73a8af0-3c08ef69fc6mr5768639637.41.1783419184698;
        Tue, 07 Jul 2026 03:13:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:94ce:b0:3bf:e2f1:1b12 with SMTP id adf61e73a8af0-3c08ef69fc6mr5768592637.41.1783419184271;
        Tue, 07 Jul 2026 03:13:04 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8665sm7098929c88.10.2026.07.07.03.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:13:03 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:12:45 -0700
Subject: [PATCH v5 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
In-Reply-To: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783419181; l=1137;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=FfEUAF8+lLL4qL6LuVUgTiQ0Tb0HI4D89dvQdM2x170=;
 b=uYF/nYfRLSgTc/cFUMRsGFwrxFRV17pyXS1OGbme208txqsb7Hg0pgqkI6EXSOzp0eioz+guj
 l682MqKNvsfBO3e43gV6Q1xUrqz1B02gmBudRJliNk5vHmBq55H39oG
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4cd131 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PsRd9AHgjfBglgpcg1oA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: ViCGOJ4WQWU5T8T5wg-3UxL-pGPPmi0H
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX01NgoXispMuM
 f0qQstZY739mJoDYIvof2o8d3Wna9/O5jOuCnH5lA5G8nLtMWwBxf9PBSnDhZ+EGGOpcI8+tz6Y
 qOU5+60/6pZgXiPW/8XjE3/YyhrTAho=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfXwKfeuQLqOZn0
 oTA7v4whybdQWjRiWDjMsdTAlONmqjIb8kFOyrFkTdtJd6S+8PzZKuMooMarXefWcGBCMDEXFTe
 RAs4f+woWWMJ4vU05CWfpH2aRungXM6ygklyLJrBsd+E1xY+oxhDP8SqkIvDzN2CWPuDVSHA7+f
 W+k6ReIPS0P/Ws9ihAAdNkCZYfJWhbbss6VO/kfRu/wnJ2eLXW9Z35NOG4DujzmLUDlSyN66mWH
 sCCzw9xaG41HoHCTswDD1wA81PkjVEFJb4hw58yNAFw98gBfZoJA4rcLq5x49IxUYXTkI9VbW0y
 ZBs/yC1oRhHdreX+RobJNu2wmVomZ6iJawiiYyHI4EM+tTtMaabz5QfDmbYBJ2R1/i1JV0H6Z8g
 DBrnn/PmjW5VGAoSlwQ6LJwyeDS4TGJWDmVHXE15jBIP6GfHrtpnbiAGDfYzwqmoEsNdKA7RyYv
 qlrXDoQjAoyZaN9Q4ng==
X-Proofpoint-ORIG-GUID: ViCGOJ4WQWU5T8T5wg-3UxL-pGPPmi0H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117245-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92BFB71A303

The currently listed SoCCP and SoCCP DTB reserved memory regions
don't align with the memory requested by the SoCCP Firmware. Fix
this by updating the SoCCP/SoCCP DTB memory regions to reflect the
memory region requirements of the SoCCP firmware, as described in
the Glymur v21 memory map release.

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..9ec7c256b80a 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
 			no-map;
 		};
 
-		soccpdtb_mem: soccpdtb@892e0000 {
-			reg = <0x0 0x892e0000 0x0 0x20000>;
+		soccp_mem: soccp@88e00000 {
+			reg = <0x0 0x88e00000 0x0 0x400000>;
 			no-map;
 		};
 
-		soccp_mem: soccp@89300000 {
-			reg = <0x0 0x89300000 0x0 0x400000>;
+		soccpdtb_mem: soccpdtb@89200000 {
+			reg = <0x0 0x89200000 0x0 0x20000>;
 			no-map;
 		};
 

-- 
2.43.0


