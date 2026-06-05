Return-Path: <linux-arm-msm+bounces-111389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t87kCjqxImrlcAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:21:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCBA647ADF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:21:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="On/QpE1s";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=T+mLT8wm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111389-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111389-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6DE1F3007220
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 11:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1650C4D90AD;
	Fri,  5 Jun 2026 11:19:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72264D8DB9
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 11:19:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658374; cv=none; b=aS1AwP0IeHdW2YxoVkZ/0Tzgqo66Ar3VV58/z2eGW0v/EJjwHW8RxTSGRXcjG7e4BdBjSbsB5/vjOz78P4X29z45sd2ScYVRCjT+mqeHOnuF2xoDPURixcGhG0L7XkixtpZe77qqE8SqHnXmt/yFNe7UJ75tydiWUo4Cr9Sjb0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658374; c=relaxed/simple;
	bh=Qt2kstaKGrB1yY49mZjobtR/4AMzw9aIfR3UkFARmBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jEiGDoOLWTZW0bkajW1EhthYhB/6ZvuE2uEzu6EN5SgPXC0SfIlB3VJzPpYahgr9wkOxJFeZ6npqRDH1FIsIyetAzVK09qvZvQEL2/DTSiPmNO/qSfCBYDaepNuAI507cnIwEdtwIFGtG4C3ti/ttIfTOis3jTS5+Oqy6YVIQgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=On/QpE1s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T+mLT8wm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655755mP3529046
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 11:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=; b=On/QpE1srplp2xgB
	wG+v/aGlx/kEuX7FIrhxrksDYhgE6MCUi0xWqqsPiyXHdOuoZWbdGkmpDNphfTOe
	Ty79pkqLQGcdwbr7yBA4gpCNAzmoimJfn+xkSUem7BUhjUaTKH+zT2nwlyg5S2J8
	1tVTMJIi4lNZA0eqb1yCNfY0ItDncf8UJj0k/qqiv1zJmQnwlnHV9RHBYpjM6vyS
	ro2X7T562Jkjr1PgPZevB92mGzX6ILAHRRJHQtX6hn7K/U4fUF3/RJucYYuw2xOn
	+rhWCXx248wi/xpU0oUY5eqq3+q+8g+/2EFsefZjXbbt32QvIfBJEkiJwkmwcxu+
	caY2Ig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eksrp8yh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 11:19:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf0b7425bbso36877085ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 04:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780658370; x=1781263170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=;
        b=T+mLT8wmwI/+L+xLhtSUKAmi7B2jwTuXAvEa5LwWEzNryy4m3vH9/N3NNuoqhLS9gN
         Sd+lkO8vx6er3BXRdTLjtOd4v/U3z40SNLP0tWYAgmGxHuNl8SFADcaYicZKNz2M8jgB
         TNcW5OS1p68QSQa1EPLynR4sV2Goetwv2OX76f2F21C9Az9L8/LphD3kLTvdoUIYKILb
         76DjwtqJOVNvKTRooYF52x2B6amOxkNtR6ZW2ERN66Mkw4Pqp8XZuJR8PyngE/9YQI59
         SLOXJmt0+kUAKPw+KHvteU+un/qcooIEwgybVo8sIN8LS2Q6W7jyBXUonoFllzHvTpFN
         zNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658370; x=1781263170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=;
        b=IOXmPBJ4M1PjJRRjfH4ghv5A/sKxRpkR2E+6DFMqCF71tTqi9Hof6ZeLrIL5vUIhxu
         BrevtZ3m4JAq0YwiaASpqpoyH6HCYqesuENEsJ4IvhpjGGWz98329UI93kAu6HGR2ZF9
         GEUmRDxN3oA4vOBNVN2LYJ4+DYMWleJKMwYSlDEiogqLLYOOCKKZE25foW1ptq02DIVi
         O00Owf91CUoXUWkWu9+VmGs51uZmGjdtx8DKToiZnOPZ3OHhlPbS1IQRDlcT6FAIzV+D
         FvnZty0Ettcr5TonhjMbep2c1QGTJMbTHncwrzM9eMjct2Po6j3gg2DgGM00MWmjWUKk
         jHHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3ov5c+Qn01Mti8R3+Fu569XXxo2FiPHJrI/Bo/cgR+gKc1abE9onMGMTDhxCf+rVjfYO+zbTWz9HtZMwH@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd6KxtozqOFpNRF6/yiBz0E91hAP+AfBkn35Zh3W52qxo6M+GB
	4WYi368iBGXxlGWOEMzWeGvwnblD1Zu31NZCdTB/GRn+7FKxZQiiY+E5/PVaiOI8Jiy739nomcw
	tIlzdwRKoQMRD256BiaAlGYnk28F16/Cm5RZn9B/908CO7UBsHvejHkCnIijjJQb52B9jKFycx+
	K+
X-Gm-Gg: Acq92OGEVWPRlJBH+1bBDTsdn+nwrZQ25MDXXRyJkMVGgB9pzig3LikAWvsTNLi1ye3
	2THem1HbEj1UKnH7sojIOpWBz3rhiyk4S+C4vc+TX3jgSXJ3+MDztYys5fiSj+jv8QFwv3aAvs2
	sf6c1HdDXfG52I8A4UNWj8MsrwrSJYK6qw7DKN5ryybUX8OoDflkr0fGGA9nOG1gqW/cPSQp2cp
	FqrSvyGgTly/D+HJzIr48CZlWwL5RZbx8n+5VxkhkG62QyapoC7wWNx8agtuGufqGE5Clfcg8iR
	tPu4oFvgd+k3mVY2/7zIiuUVqza2JNPx+MjzgTOxAPYzKdRengGwUqLJ9zXRfxVtRTQ2JSxZt4P
	dORVqYkEDLbzOvzU2BtqgrE+Fp3G0ilUa4pX05g/7/a7Fc7AYA5VMPr2n9M6W0Wc=
X-Received: by 2002:a17:902:f78d:b0:2bf:175a:db61 with SMTP id d9443c01a7336-2c1e7b35b28mr32635985ad.7.1780658370443;
        Fri, 05 Jun 2026 04:19:30 -0700 (PDT)
X-Received: by 2002:a17:902:f78d:b0:2bf:175a:db61 with SMTP id d9443c01a7336-2c1e7b35b28mr32635415ad.7.1780658370002;
        Fri, 05 Jun 2026 04:19:30 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm124551665ad.17.2026.06.05.04.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:19:29 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 16:49:11 +0530
Subject: [PATCH v4 1/4] dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra
 SoC RPMCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-gcc-rpmcc-clks-v4-1-a0a7bfb44455@oss.qualcomm.com>
References: <20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: kt4ds1ZERwIZQLB08jh6Eky_O-ObN_4f
X-Proofpoint-ORIG-GUID: kt4ds1ZERwIZQLB08jh6Eky_O-ObN_4f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDExMCBTYWx0ZWRfX+E+UUQ3F5xFc
 AuBPlTIuKF+3BNFYugJnik4/LFWQeEm/Cy5DLybOXYfJOrFmndl5PwoVlrPeWKPtfZYX1SiuwSk
 2yBQUxPwxXdWe2lq/dMyngd5weMTP/SFTLZmoEU3fML7l+d/ZvLg68XXUCT92lbKpOq9/ZFDDz/
 JcmvkV/vnp5YTvTGqKBSHrGNry2gwaA5v2P2on+kCkMBisG8CvCEhAK0WpLh0WcpJ4k40TmJ8N2
 +ZA8RDvNaZkafkzX/JSuZlMIX/a+OGOo1igsNT3CIFCOoilxnGGeIxvlsHo0lCAE/WQuGmunuOf
 JXlJCuROIuYt5PslYP/amAjAcxjFTzGrG8jMJC0bIPbvYgofOIaNPHJmqOs3ZyCM1aqDecAP9KE
 1erICsNYPe6xfBM6PkYiFMMgQl9aR3s9zUYf/oTIFj1OCgnRehSM9SHQ74EoWcHAIco3WKveyaV
 fiPcl3UiMtnndLW+6kg==
X-Authority-Analysis: v=2.4 cv=bJEm5v+Z c=1 sm=1 tr=0 ts=6a22b0c3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=5MG6tTDo7b5tcJehnegA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111389-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,redhat.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FCBA647ADF

Add bindings documentation for RPM clock controller on Qualcomm Shikra SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index ab97d4b7dba8bc8d38903b399d2bd4bda087db8a..b8aea98b00bc22c4ab6da1e6235ad676f200b44e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -46,6 +46,7 @@ properties:
           - qcom,rpmcc-qcs404
           - qcom,rpmcc-sdm429
           - qcom,rpmcc-sdm660
+          - qcom,rpmcc-shikra
           - qcom,rpmcc-sm6115
           - qcom,rpmcc-sm6125
           - qcom,rpmcc-sm6375
@@ -126,6 +127,7 @@ allOf:
               - qcom,rpmcc-qcs404
               - qcom,rpmcc-sdm429
               - qcom,rpmcc-sdm660
+              - qcom,rpmcc-shikra
               - qcom,rpmcc-sm6115
               - qcom,rpmcc-sm6125
 

-- 
2.34.1


