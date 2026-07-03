Return-Path: <linux-arm-msm+bounces-116155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hdgGObFDR2oCVAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:08:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C46FA6FE92D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:08:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RE8cVjv2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=U9AER9Gu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116155-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116155-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B58CC3040028
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 05:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D591E375F9C;
	Fri,  3 Jul 2026 05:04:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CA6353A8C
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 05:04:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055055; cv=none; b=tVlQ81+njk0G5SQCNJ5nzHmP0BeQuXTSJu7KkYAj/dlT8gxX7QwQHr0qPSYSVV5otp8rZll0h/UtxTbqbRaKOBDoOqMQ1ZChY+SCauGOeYjVtGdFNEbL3nyQM9Ruut/rUEW+8J7CCJiQ7S+OzgHkJjE3+5S6ORP1HLQ/OczRSJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055055; c=relaxed/simple;
	bh=6XedRWs0tAdQLU+ENS+Cwbaw+CbvhGUee8wliZmU0xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oxqevfI37nNmuf2PcE1Lo/yuMUuHBooPg5nyMPqfAn/4Tj9uIEQUCKhFD8yEbil2sqYNB0reYwDaO84l86SFLkef8sHzJseBi/ycgCtCo9/6uCUf4Q7ujyhqE+x2zQvvfIWTCsXSuvLmpOBzBOJ9f1pUz1mJd6Kc88Y7r3tUZKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RE8cVjv2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9AER9Gu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663431Y42824962
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 05:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=; b=RE8cVjv23JrCfpd7
	FIVRbDajUOZDh7MXaDvdG5eD04CcK4y+LGcZySUAp/E/ZW7gfhwM3m/Odk0Oq1MQ
	XNC3Sl2bjP9VdfpwDpUt4vHAu5R6uGixFq1aa1zx3O9T+Lxblp8Eu9cNWc+mBEb1
	zu5r2coNswYq5Uk7Z3fFLBE7vmZNCRAu58+Uq591oV0101lLHxZJgIlz27p8wirv
	Y/RdLrzmzPXkbhzclvxNJPFHgpBWaeVQxt9dmAzT1ox2mm08LUiV40kVwhwL4vrE
	wtZAyoCK3RvU07c0W/XFmyBGL9cV1DnLIAGrr5xnVXMRI1vCdWjmmFhLFfBXTtvw
	fM3+dA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcg8n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:04:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c892143db7fso201482a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 22:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055040; x=1783659840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=;
        b=U9AER9GurKy6kYCrz90axnzOPfFsn07w/KFN6QvU0nt3O94Zqg5Uw04kRcopH5lnVr
         aj4qVA1mv6BdOPISB6qjsX+Iw2DRWuAj2B1BDzFK7F0wxSvYjbldOTt82C47ilcuxzYd
         B677mgfmHAu0vWdrqoTGGV/ILQERJ6s7/WdL+mNuy4uEDa0rEpq82i5eE7A1hXLnpEkb
         C+vzVtQpaB+YrOySd0EGUQRZaYW0+5c0ZpkVsG03hiQ/Vw3I5Zbp9av+gtPTmZvXYCLR
         7rgJFyfsvBlllkfjfYP48i8VBcAdCg06WHWXKSLWZ0pfXdUMsEJ+MdAOzSTo4MKoA1Pw
         FXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055040; x=1783659840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=;
        b=dPgGdrgmlUIMQEPFMmQH7vULCCoKQBetGjB3AW6SHFdGefLRhxu50iz9ncOPpmtE3P
         nG0imSInIPcUpJDwwgREvBR7qHNr3oUGJO/CBovVVNUYdTE0sBEnw8jy4FjpUmXiY5Sb
         YQMsiOlAiRAfoKo6PhdtxG+kpr+Y6PEDbN1Cb53iBypMyStw1/drQJ5FyC2KTSW+f0bW
         oWECToe7pnRgiUSh/YDQoT6gS/WlHOCn+ml31AewK3pqqYw8C9h2B1FCcOE/stl/BLgr
         L7gHdBYPNW3xaXjZ5eC5k2DRdWdmxbWURgVRu0hO9eBaZ86S5SS5yGhDi9j2wzmmUEdu
         kd6w==
X-Gm-Message-State: AOJu0YwvGe9eakM7Fy3s6VmvIqjTaKKWKK9137xOGS7GonUtw6J4Vgd3
	39M4RV7P3ablBMWt0uavpHSnyKgBfQcznxhBqXNCpqS05DrbRVW3/421cVOr9f6z1gtsMEFv9LX
	n+Ha2F2/OtHt6muJIc9U3JV7tJv309txq9qqn0C4VcQDOQUIt2ASqN9JhMzPspS4B/+t7
X-Gm-Gg: AfdE7claKNJ2u1L+1MjzFM5ozVgZQspsYZF/TERY4vLi+nEWVmR3JNOO6udTMmIHy9W
	pV+3UDB3idtvGs/r/9k61C2xXTiT51qFNr4ZM2OtjR1kerkMNcEzJ295pYRGEwYPHcC3EBhhIJb
	w3hU37hhypYHvQZuePOmnRHhOteZ+jVpGSMX1piqTHt7nQnVHDVCnZoinhvDXrQF7SX+ANCljUV
	vynIsEQcByD+Tbbuj/esfrWy4MvYxHOlUrT+VkUQUfjG9g67xpQJRIZlKquZSiU59FalOonqvqQ
	7/IedfxTuStMFRaqUrhT5H/F6GD504yBVz933odorFoWE85uI4QOY1GcLGOb3i3j6iEQoTWO7sn
	98MSORwUOiIPVGVeUEdbfAo1ULK4g4/qzdA5/ent5AIpj3pYBu4rGa2hQEwIyWfcAnMhfU7mIGl
	95mZ3z4YGtnR0CdrTdqihnoTBju3PG5EhJ4Bz1Jg0Z
X-Received: by 2002:a05:6a21:a517:b0:3bf:6c07:b2f0 with SMTP id adf61e73a8af0-3bff4303b09mr9305618637.51.1783055039909;
        Thu, 02 Jul 2026 22:03:59 -0700 (PDT)
X-Received: by 2002:a05:6a21:a517:b0:3bf:6c07:b2f0 with SMTP id adf61e73a8af0-3bff4303b09mr9305587637.51.1783055039367;
        Thu, 02 Jul 2026 22:03:59 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9873sm16109674eec.4.2026.07.02.22.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:03:59 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:47 +0530
Subject: [PATCH v3 1/2] dt-bindings: clock: qcom,a53pll: Add IPQ5210
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-apss-clk-v3-1-4785e89a9c58@oss.qualcomm.com>
References: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
In-Reply-To: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 4M7uOH4lsYpmt1jnGTuEJ43Pjsmn8_bg
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a4742c0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5uBAxpE-56c2IjUQXdsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 4M7uOH4lsYpmt1jnGTuEJ43Pjsmn8_bg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX8klLoMjhTBd+
 ZcL/qHMQLjKtNFIjpF2bF3uAmGlX06FTcO8r96ktU0vU3qR50oV35NEnUehICPwGi99Esz3WwoF
 eaWfaC5a60oOXQPs6i3t/pus8om3mOaEPIU4nq9WpWzK+CvQ4/x8ZrSwuGn76FxCalqfM/2CTEH
 yUG0L7NkqGrntmL8CP5KBQv6soTpmFAMEumWI5H+p4N/0AiryJzRVRTMVwxWR6FxCTor1uPu9Gs
 IU6C/E4tNTEeEy92cQHdwm3Z+6bdznbcpTNwOeZPZuPCLDtDwhf1F0SzbB/wcBHxkyWMD28i6WT
 +2DpJeCYWC8olCH7WtWSI4Jj1XKve8jkmn6oUfc5Hqq2HV1GuXufOCAj1PHKTegNWzpMeG+9idk
 d7N3qO44a15hxMcMIIAIhBXX1xXIeyDEuvCH6r/TLaitbUUxQQ06RlBUQoHK9Nu6c/VsiPjSvfv
 Ot6hKfzPIlFRe1dwX5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX6AdRlXxx3vjx
 G0kQNQIr/XkMg/yQmzC9nBbuo8yURLYgszezb8S1CwqOunoXEwwKhjAges2VOcYrMEncEjEudz3
 CcTJJRes0cjcdzNVfOk89jg6UqjNpNY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116155-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C46FA6FE92D

Add the qcom,ipq5210-a53pll compatible for the A53 PLL found on IPQ5210
SoCs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,a53pll.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
index 47ceab641a4c..1eec77e75a0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5018-a53pll
+      - qcom,ipq5210-a53pll
       - qcom,ipq5332-a53pll
       - qcom,ipq6018-a53pll
       - qcom,ipq8074-a53pll

-- 
2.34.1


