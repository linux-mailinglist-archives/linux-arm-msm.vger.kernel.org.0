Return-Path: <linux-arm-msm+bounces-89864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E0XO27Eb2lsMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:07:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DB0491C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B9A748A9193
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 17:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4007B40757B;
	Tue, 20 Jan 2026 17:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZ/zD1KE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNdcZi/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FD23469EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 17:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768929828; cv=none; b=aQb1X3v/KwlfGjKLlwcqhJjEvB5w5eI8H2rY+UmYwBBsfZZKyUa84UgePDFkCq9pOOkqlQy2BdXpwcCj9/XF6X/t+vLnnpl46VF1oJnHKwdyE+pkBUUSPhQknIX/TY1KZCkIhSpzT/j9CLzmVXG64kUBU7QHv0i0nAvOeakMQ5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768929828; c=relaxed/simple;
	bh=yVhF07VxzTW+N0dHjwRePyJygjk6zzmQEWTrMJtov1s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bkPbFW4Iz9Oll4cNsk+6FB7wLnx2lKRRSJRvA7SXIUq4cnd+hZSaiPnCeHhe7s27ZwqPAQX/3YF6kniyoRi8srWDnxUr5wPuxfGV/0De2qr0f54M2YwA5aKXa5IWCunl+JKt3u3QJ17vQPgCFHzredPvsOWPRjiJ12JtsXgsZoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZ/zD1KE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNdcZi/V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KH58A13256429
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 17:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LAoJ+q7g8QEGWaQNfDk7kF
	44veuqOX7O1cwfh6XDgwM=; b=OZ/zD1KEh6mFAVY4I0VqE1253EeZnEfami17LO
	OTeHOtxk1SWyfYNAGBf5XNKMbhAZDiLGi8peugx7sNpea6jJkYyG0fQGHTCfK5+F
	WzXZMVqh99829dNezxq0sHKwGelVr6jqRRhU0G2aviYj8ZSyhlKP6hE0dml9iRhM
	vo7hZAA5rsHiwwDhMAS76IvSMoNttj9EvZgCYUbMXezWd3v01s+CAepwF/gPiSiY
	FmrrSMh+nMSc+rz3ATfhKhO10i45upOjhSFEADMEaqYMExIxOQdolnozzo9slQrd
	YgLta9dON/2eoRldwDnUVUUm+hCqrksWKzXDkH2lwITmr3+A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt6u7sgqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 17:23:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-124627fc58dso4340451c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 09:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768929824; x=1769534624; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LAoJ+q7g8QEGWaQNfDk7kF44veuqOX7O1cwfh6XDgwM=;
        b=bNdcZi/VUY6W9Ln9tVwhsTPoK2MoJHTW2DslXRV4ur3A+qZjSwJq2Oqg6hCZZexiC2
         be4dfWTQFNb6sGK+MLWB6ao6F1xMiy/jxG64mHS2kpWWZ1T9PTudPHR+u3fIWV9rX1T8
         YlvODRnGZS6bdKZXGpIjHRVrk4hCkFVEv9KZMn/o4Jlc8x/bXxOaPxkiH8t8r3Db99OR
         cx3hVgn9CXt9qNQ6vp8XbpRYYLeEMYbvsX+pUg+ts/IQ4IJAGchZ2FwE5IKbFTlQmCgX
         7nbFN/bnCDDtU/wVCQ9Wje2Y+m4RQRfCeNZYMsGWBL66t1dLdK3xzPaIvOiDkqW+yb2T
         lexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768929824; x=1769534624;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAoJ+q7g8QEGWaQNfDk7kF44veuqOX7O1cwfh6XDgwM=;
        b=DDF2y4jonVlDNnlOHRYsXXp6cYGd8Gtm/C0AFnFgA2AU4vEFiRM2Umoh3/FdvDkjgx
         awXAvzYJPgDRdGs1+Fu4wcZjj4YnvrxBNxGS5Knz9EOWfNGPSl5BVx+CCVQMKRl/KeT7
         DFITVFW1ztbc1GHuUseUIdcyAcxbTRf8NmGFaeKrCndn8iLmkNgisVnGmc0PBEESo3ji
         0DUq3nOkK3myM6Jrb4NIKUR7FjUO+cTOV8cambEnolx3IDtUC9kHB+cpkYs96O6BaqWL
         AFJWqWaIxB22WCAb585PHqgaCL5EnUj0jtE/EAJwucuGAexqxaVSm2s3vrGeAxoM6K1T
         6WXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYDnFYMFbpn67xHvWQUYthHEc8fOEqlR+/TI1Hyu5zjmPwiFcX6XRGBdahTwZAIeQ+oDP/4dGB8CPQgPeq@vger.kernel.org
X-Gm-Message-State: AOJu0YxEiaEfwBVljlZoGeCHBJVwGWqp5cm3d3c01u2gTgHIBZLgEPev
	MMGCYhk6AVvaHvI8ZQsCadNZCQhnITbxPkPqHExO/waqa0ESR3pqe++1d4tCo44J3ESjTl+9vqB
	P0ZwC0jndNJ3GRPgouM2OHk6FxRC2WicT2LjNnF2jLou+N355jxK11CHQxMNSUFVctQdd
X-Gm-Gg: AY/fxX69SiVRgumszIx1fufi58MFpt5sh4R+OTQ6eufaliaq3LVxk9rPahg7fKtW+VK
	G7OjZ0K7e6gD5TYqKy0DEOtfDFHQ1aaPUSSseD1nJfM1N38ab488ngiyWrIilo1bIgj1XghHgHp
	PrDzrxxABv7wGTO/kyXAOSRkEkWZl9w8ALj/85u85hIUV6nC6fkIKRyT2PDaUNyxAekkf7c2uO6
	U23A7HlUPGFnrQLG39r5K3yiKq9KMmlomdLSrkbS8VjOJQ79R32nmEvjKnz0kjbPzuNQxxt080N
	rKdWT4I5fIPXOlaalb/juC/eQHtDbh+zju0f0L/hcFD1/fHr4ApI7tA6Bisoih3B8WrYQIjytoP
	tq7bz2T+Ld1Jkwq1KbQK99hL5IdDBqIPvrNYpHOiosv5fHClLxgGg1SwcfgDTlYhpG5488XD4rw
	==
X-Received: by 2002:a05:7022:b8f:b0:11b:65e:f2d with SMTP id a92af1059eb24-1246a958b7fmr1475257c88.10.1768929823535;
        Tue, 20 Jan 2026 09:23:43 -0800 (PST)
X-Received: by 2002:a05:7022:b8f:b0:11b:65e:f2d with SMTP id a92af1059eb24-1246a958b7fmr1475226c88.10.1768929822772;
        Tue, 20 Jan 2026 09:23:42 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af22aaasm18714842c88.17.2026.01.20.09.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 09:23:42 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v3 0/2] pinctrl: qcom: Add Mahua TLMM support
Date: Tue, 20 Jan 2026 09:22:49 -0800
Message-Id: <20260120-pinctrl-qcom-mahua-tlmm-v3-0-8809a09dc628@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOm5b2kC/4XNyw6CMBAF0F8xXTtk+rAYV/6HcVHaIk0ojxYaD
 eHfLaxcaNxMcid3ziwk2uBsJJfDQoJNLrq+y4EfD0Q3qntYcCZnwpBJpMhgcJ2eQguj7j141cw
 KptZ7EJxLISplpdAkXw/B1u65y7d7zo2LUx9e+6NEt+1/M1FAQGtMSVWN54pd+xiLcVZtLvoiD
 7LRiX1yp98cy1ypNHJZl4jGfuHWdX0DAvN8BRQBAAA=
X-Change-ID: 20260102-pinctrl-qcom-mahua-tlmm-433644bae64c
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768929822; l=1688;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=yVhF07VxzTW+N0dHjwRePyJygjk6zzmQEWTrMJtov1s=;
 b=FsSrT0lsNjNnSQpuUvhk17bWhZvcBDY7dzJZh7Teo0uVxkwysxis3lckzAqgOk3m0dGUffq6e
 0UEvKtjU3s/ClvMQhBY30kBisf0I5VtJeSlDt2houFzoXTKqd7sFrA8
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=P/w3RyAu c=1 sm=1 tr=0 ts=696fba20 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4Q-EQNNWwN3BBnYOq88A:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0NSBTYWx0ZWRfXwQpOqN/HreuE
 M8MWZAuZX4FC82hzUuAmL/P8oC2q/ac4I1qocGFfkgsVYZ8sAX0+XQNLM9FimfswudtWizyt3lU
 nrvWp7OMj5YGZwvJlB8kwNdHkKJnAhjSJ4nPLTSLR1c43Qudr2jkLK0TiKO6IViL6mX1Z541Yi3
 1jaMlwu/FI7n8YEvVujIkjQ755RdNq2ojf2imMPsoS3gpWWM5yGosSrChVCI7SFqzeeW9v/5sIx
 UsSk7c8IohEp4mxoQ7BJGZTAUpUcnAL7K4Sic6e9eKAo2zRfvQi5jixn4D/1dOqqs4tECVKY0lT
 8b+RUSK9R7z/7KcZfpE9nquRyr+xwOjBrR+tMoWXJYX2BLeDEavNMvBq6NkUMOE+MAPZinP7F0B
 eKoJvtgdJtr8LYMMClMQRUmJygDB/3z8C+B/NS/EcUvMevPY2GMBHJqHr6cq46pwesKlafWp7De
 hY4Y41opFY623SdrNow==
X-Proofpoint-ORIG-GUID: Vkktmoz16gqTJg8I3q7qwKIgqmj7bvQw
X-Proofpoint-GUID: Vkktmoz16gqTJg8I3q7qwKIgqmj7bvQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200145
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-89864-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69DB0491C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce Top Level Mode Multiplexer support for Mahua, a 12-core
variant of Qualcomm's Glymur compute SoC.

Mahua shares the same pin configuration and GPIO layout as Glymur 
but requires different PDC (Power Domain Controller) wake IRQ
mappings for proper wake-up functionality.

Changes:
- Add DeviceTree bindings for Mahua SoC TLMM block
- Add Mahua-specific GPIO to PDC IRQ mappings
- Add mahua tlmm soc data
- Enable probe time config selection based on the compatible string

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
Changes in v3:
- dt-bindings: updated commit message based on review feedback
- pinctrl: updated commit message based on review feedback
- pinctrl: Fix spacing to use single newline between structures
- Link to v2: https://lore.kernel.org/r/20260105-pinctrl-qcom-mahua-tlmm-v2-0-7ac036f700de@oss.qualcomm.com

Changes in v2:
- dt-bindings: updated commit message based on review feedback
- pinctrl: drop GPIO 155 from the PDC wakeirq map
- Link to v1: https://lore.kernel.org/r/20260102-pinctrl-qcom-mahua-tlmm-v1-0-0edd71af08b2@oss.qualcomm.com

---
Gopikrishna Garmidi (2):
      dt-bindings: pinctrl: qcom,glymur-tlmm: Document Mahua TLMM block
      pinctrl: qcom: glymur: Add Mahua TLMM support

 .../bindings/pinctrl/qcom,glymur-tlmm.yaml         |  6 ++-
 drivers/pinctrl/qcom/pinctrl-glymur.c              | 46 ++++++++++++++++++++--
 2 files changed, 47 insertions(+), 5 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20260102-pinctrl-qcom-mahua-tlmm-433644bae64c

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>


