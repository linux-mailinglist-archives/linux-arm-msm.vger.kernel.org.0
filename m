Return-Path: <linux-arm-msm+bounces-106583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNMkOsiO/WnWfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 09:20:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 716C44F2EBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 09:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4EBC3020ABF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 07:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6416937C914;
	Fri,  8 May 2026 07:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBSzj8iM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqvFME7e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793F135E95A
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 07:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224828; cv=none; b=N7jz3GSEHDGqm09fqwEuDyIUFTBo4vA+XnkvoO8oUvfr/oLVY9TRTcoMfBfJisWuhHxYO9IhJgNG3D6nDP9hYehEgCpjZm0DAe4Op9LHSB/86Gp47b+oi6qVAlXGyt0lgihEi0jC9L64kaZR9V7yXhabiaSF8fJJ7WDjEZFFkBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224828; c=relaxed/simple;
	bh=5YGi/w9G417QgIMrEKDmoqpGG4WU/TVnoOtCqviIoKE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZgpwpukfHEn8B2j4ogSxFJbl/PWJPXtALVyDr5svQwxqzcqKPPcRjKm1JYgXxA2poKkshbccywjZQiXr5ryBady//DLxhDpAe3lBMW25PHrOpRkBTeaz7g8BVu8GTz2IjdyM3dCYYzPYzDzP1lPIZWFmJkRN8j79eO0SOVJ/crU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBSzj8iM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aqvFME7e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486K65P1174056
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 07:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VZTVQNI8Fg2HrJNibJiJpT
	ZcKrWapAljoowoTqLwyVk=; b=bBSzj8iMgjXW0EiHkfKXmsopCqKSKKaZIX2OGg
	Rg7nYLlnH+TVsakOd2a+Kgs+Aw7xtertW29xwi2IJbA4jHI14tS6ivxWbcD8u9+A
	PPmT/nuJwH3alcNpo1C6Jaq48i3QMsHRu03llGr5UXSVwM1kju1mFIZPE6TyX0dT
	Szrteqi4rf4SMXsg7a0O1hTMWUAqta+XdSE871ekhIBzi0xuUujhcFXoXlrZ58YB
	RuA8UdovTVe5N1CXzX6y6Yl6jz/aAn3KtB3IQH5V+zr4ljlkRMaMUYFAHaMXltGI
	CD7GBz3mis1kAc8PGJLpxNlbL1Sa9ofE5eCWAEkyngkKf53w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132h9qhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 07:20:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-83536dc3be5so1750589b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 00:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778224821; x=1778829621; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VZTVQNI8Fg2HrJNibJiJpTZcKrWapAljoowoTqLwyVk=;
        b=aqvFME7eOFYaHOrFIPEbZUYbjjwB9J6qP+KKlLugfuJfcHKZX2HB29GtZ3LDj9+/K7
         kMbbSHIKVm3Vh89IjhEpacb7hTqKcGXaNjDsExrrXW9IxsP8Ox8/vOCAEFccPyC4gwwP
         VMe0mtx+sCqDsWxF1pQKolCllncQw6UOkbggUvAgceJ11/1382QKrrf6tyz9R6gkMNpq
         WjtqB8zOdDrRj54Lvy/wqHXG2TAOehiVhkVLOXA+uatlAk6zzEn94wXbvVitOCK0HW5r
         XkJqNuwrVi0ryk6qZNsUP2DIa285H0A861E9xoDZXxQZZ04ZiECnL2yx9tNkDOpEu2gW
         WY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224821; x=1778829621;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZTVQNI8Fg2HrJNibJiJpTZcKrWapAljoowoTqLwyVk=;
        b=GBuLGL9/ON6bXzk11li8Q13djtz7lSB6rlsDTFZL2gv6PEzMs530pShE4HW+gjR2iH
         oUb03310OBA/mdHGoiYohDvXz3D2myicue0iByfdVWo0df313fIQh77ay4QgRzrZY4pQ
         yv9yrG01vKxa1IMD/TzrUnLcpyX5ai5YuMSwsaUxq//p72w3IQkV0vDxo7QduGVqrNXs
         1pCir+MvELu98wLFhfKTrJe6zxXbdr/k/zeEAch/LHdXsjXzxDjNrLgAj7SaK1I1jGBe
         WcBCS91Lu88Z37+QGb2/RZuNLtBj7R97LvYMAQco/1qrf/Zygk7xBMH0ycs6SzMpRNCk
         p7zA==
X-Gm-Message-State: AOJu0Yz7A2NS2oIoilqA2DtPWwLOFb4TUhzj9azJBISLMb7C9IWs5Lt9
	bo9Djb8ZEFKGte3JfhCnOV8a1rEn76pnTjP/2YIbWjC9b3ogpIwqrLGie8YbGVOaFxwxCEa+JTX
	IBHdguISJARQDxsBM6tW5FAHBEe1tXN22zCPv4P4nIdkGemkB5yLHBNHeY7JsNZ9QCTCo
X-Gm-Gg: AeBDietr0lPJKMYMIb6WB1yDNLvi/6s+g4yGwt9xnJyh56SoMh4XI7MpQ2e2qABjxgs
	KTJD/qJlyd8K3ZVqz8ACbNyEOBpAP6u/ZtEqjVnbHVt83tWl/GjlOp2RekPe8RdSM1iZpJ+XPAf
	sBucLoox52ayNw2444hCN5mxm46NPnWRz7rs3J7at/8qLyqB1OCQ0YuZNCRzdD62wcOOfY40Mtn
	7bX/j8zwWmPhQ2CzlU0owZ+iqrKvi5Opszl5QkD3LdQFLHmMZ6Rdms7ciWK1yrI6aQTcvhiWFEw
	w6ayi0yv+R9i3IF3O0tCl9Ss6j3zlY9CdOGilrg9ghVempqXr5EM1r9VBKzsSz4JYYT9zsa4uiM
	0RLSdIw7BQCUxgzAIshSYkdbenuArKEJJEbP9QSWW/8ds9SoSnmw=
X-Received: by 2002:a05:6a00:4c13:b0:83a:4846:90bf with SMTP id d2e1a72fcca58-83a5e34869amr11326791b3a.43.1778224821037;
        Fri, 08 May 2026 00:20:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c13:b0:83a:4846:90bf with SMTP id d2e1a72fcca58-83a5e34869amr11326746b3a.43.1778224820457;
        Fri, 08 May 2026 00:20:20 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659498f1sm14566685b3a.17.2026.05.08.00.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:20:20 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add compatible strings for RPM and mailbox devices
 for Shikra
Date: Fri, 08 May 2026 12:49:46 +0530
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJOO/WkC/42NQQ6CMBREr0K6tqRUpMrKexjSVPorP1KK/Uowh
 Ltb8QJuJnmTyZuFEUQEYnW2sAgTEoYhgdxlrO3McAOONjGTQlai3AtOHd6j0d5gfw2zNoPVcfT
 6NyYuLSgHRzhVpWNJMkZwOG8HlyZxh/QM8b39TcW3/Vs9FVzwqjBWtQcFTqpzIMofL9O3wfs8B
 WvWdf0Ab1Z6EtMAAAA=
X-Change-ID: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778224815; l=1285;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=5YGi/w9G417QgIMrEKDmoqpGG4WU/TVnoOtCqviIoKE=;
 b=K9WKiTtZFiHq8TsZcfqkDVqbEkZW6uvWJd24SY8hC+qHmgJ/eMcYQYEzqBfOv3ZKZ5L6SPYBT
 xYP8e7pHLmsCiYrOa1yVvhpnWI0ThUEGSsqgDY29T8oYWbGcTuoiy8S
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA3MSBTYWx0ZWRfXy9qNPjRUav2l
 oUmHwR/tSkaCSlZdFwHYtppJe+KNOwTbY/7td09fotEHman+jIL4Zb+JNb7T0qE4xeYhKEQ3w+n
 u+YQg9NNG5my9JC7+iKK1YlWOPNB0ujcOKQYmghD8iER5FzU9BaAxwBevP71fZBj4imTd0WYeNa
 Y15QMG/Y3SgYVrf1bMfWMkl0dNdBPkJ2rF0NFOLaOxgGmS/MUGIS0gFoOIaGLAqHYwA6boUp22k
 pw+CaQCq/9X1ZUK3CLnA2Zkd0TBpPUdRJkGupZTwnilY4DCURAr6WareJbBHzq+IUn1TKN4ZgAW
 W8auk+hoJEZzEdQ7eFlMIfngg0++glK3Pe/Gm9bTuzUXWfZeN3BP+xaF5MXo/E709e00kn1/eB8
 T9Tl1gqURE5qrvaDxzJhQDH5cPg5OFClj7P7YucVh2dDiLZP+tZ+QL3sHAgY9wnmKFy+OKpMrgs
 cCFB21APrbRyb3WLigw==
X-Proofpoint-ORIG-GUID: uLjezAW2FNFIjmYix4mOxdASfXqo0qsH
X-Proofpoint-GUID: uLjezAW2FNFIjmYix4mOxdASfXqo0qsH
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fd8eb6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MCz6-0gsceDSkw-wabkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080071
X-Rspamd-Queue-Id: 716C44F2EBD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106583-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for RPM processor, rpm-smd device and APCS IPC device
for Shikra by adding appropriate compatibles.
Also add APCS IPC driver support for Shikra.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v2:
- Require "qcom,shikra-apss-shared" to use "qcom,sdm845-apss-shared" as fallback.
- Link to v1: https://lore.kernel.org/r/20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com

---
Komal Bajaj (3):
      dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd compatible
      dt-bindings: remoteproc: Add Shikra RPM processor compatible
      dt-bindings: mailbox: qcom: Add Shikra APCS compatible

Vishnu Santhosh (1):
      mailbox: qcom-apcs-ipc: Add Shikra APCS IPC support

 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml      | 1 +
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml         | 1 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c                              | 1 +
 4 files changed, 4 insertions(+)
---
base-commit: e75a43c7cec459a07d91ed17de4de13ede2b7758
change-id: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


