Return-Path: <linux-arm-msm+bounces-108163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEzoHCXzCmpv+AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:08:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7393856B40F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D08A330D38F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679A13EFFD2;
	Mon, 18 May 2026 10:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inGa/gUd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQwvdoW1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0053F0752
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100522; cv=none; b=kQ7oHm19RcT8zIE5rHxKzL343u3lZgOHi/zeBXvKRxoTSxUNInJiVFAQlOtE6UlrmfgKYGZRCzw/wkglfL+0d005Rf3JXojPIIAwUmdWVm5mrHBymEriw8T3DDDtoxceGZkt7Uq+52z2Taqlxn8q0aWA7Jxu63uT4pF6OJ4yIHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100522; c=relaxed/simple;
	bh=u8v8CNSfX49ylyxzKrYVQag0107VfDC8fMtgShe9hkk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BDAhylJXhYlaOURpEQR1YWG0d7QtaoZXqNRvzgLayctkkw1P+Tld4XLLZkyd1ZFJlvi9mR9dL6eZBhEDkSrRhxw+uSwf331kcQyVxrqfLjPlIpC8K5cyXZbMUdMnAuUBlCBObZDwEm7nj4gz9zx8VwMQFHF/kfHlo8DxnGX2SCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inGa/gUd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQwvdoW1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5YrVN2685319
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fDwKWlwQGOochU4nwJPd+3
	5tl+JrVx7kQH2npiXLb6g=; b=inGa/gUdIRmxKU11dDaXcNQDN6nxOvTlvzT001
	ckorbJAimcW68YG/JGsT6Tw83TcqRNlEAT7O11v39yedq+/LEsyNzFB9WgVHmhTI
	3nLdMkdicf1ruPNfUkCgx85wuZREQJld2NmtOULPU7pSzVOfF31tZgNbOv8jijRR
	1Vq5KctRjvXsrKKTBl+vk+ICNh3ENM8LbI3CXV1hFL+GqtcmUXWO4GpYruDIAaDk
	5WYutDQ1jNA2USphLZTxVWD1F0f+kRvhF95gqkC/efWK3R6M2p1AGkzJTkVFT5re
	FakM0EQE898ktLA3tTfh6cBMfQs9cmdwVZCM3jVV8QB49KjQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7vrbsa33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:34:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d9a6a853bso63679191cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 03:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779100484; x=1779705284; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fDwKWlwQGOochU4nwJPd+35tl+JrVx7kQH2npiXLb6g=;
        b=fQwvdoW1s+pQkfAvOq31XrgY3E9+gj0iobYhnSn1JW/V31sI1O51HCc5yBXuGciydl
         o0HSoDzeRnkzwyaopefPpRp2wunJuN3XIW37+kTBkkjfLSQLLtDX1fndh8R3TZc5iC2M
         mKCIgVzzMAcXhkGfDb4OiA2vrqwowgPtU89L9bLOP9IdI7Y8Ik8iRMLGb1yygZMz4KMR
         17qiYj0FMAgeM5bkP0WQSBHfDXUVCeI3aEpWiaFQX3zqr573rGx6dJBtg/QzXJKTSx3H
         qQOCEsncgiR9VTAFFcpzM+X6lCwB/4kYuQeyFeTIM7xOYRXPkF2sTwokeivQ7kSNVgyq
         ZwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100484; x=1779705284;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDwKWlwQGOochU4nwJPd+35tl+JrVx7kQH2npiXLb6g=;
        b=Myx381rfsqBztGCuq4bQdqxaUULoouV5tJ17MkDcToijGyM2Ps/DQMjONDBYTy/A7l
         7Wz5q0EvayBa4H8iNBTSIkzEYJTHkPg8kFZECXN0+mE6jG7XM4prJm3M2vkQaW9BLVUH
         +ggnTbAfnWqCPcQA07MOT1VgGYXoAehavMAVlBUkbippCPiSTnZPh/Oh6tDtzr4/A3Qm
         spfpmulDWQOHpi4d2iOHPVqtkeLrl46N1T555FFe1JibyHzuKh3y3bnl2vAVPGJBiWhv
         6y94Q8qxnqkqXeCLtZFywqNVak6C/pHDsOm1Gp0AGb608OGSznb39nJIPm9oAQp6GWEQ
         Cdtg==
X-Forwarded-Encrypted: i=1; AFNElJ/ZLiY0rzsZsiez7GBtKEKO8pWM+LF44vI/XyxHS6DPRAGzDuSjsLeYpJwHXllqX1AijNXCQlNcXNSJHlY4@vger.kernel.org
X-Gm-Message-State: AOJu0YzJNpJNCpyzn8GD5BHc7y5kmOHHixvZbcyVx5jZAlTlCLPwQTGG
	1Rs/09nrVq4KbNxEy02eOLFnSOPPVlg/wSr2E1TSj3YoaouACj4NxBBQvs3TbkY6KAkkvv466d4
	eAPedkeBHJ+bu2a9KfdUxWaO46pJ9L9B6Z7fy/GkTHwWtI4wRPYKlPlq/vxbxlc1WQFR2
X-Gm-Gg: Acq92OFbncovRN6adeUQa6YqIBgXgnqcZ69njHTpaXo62mhFBl1XF4owqFRrT/ozNUD
	DzWSGIRkgNt2FAvK0Ig1vE98hOyDoOlqwQhyp3a2k1b9J1e9Blv6MIKu1xinniCG6UG7jk8sYQ4
	a0P7CPbNZ4cPKIy1NQeZjUM5F983gtOcTyPGMZ15RBFg8AD4uPzqYbm5X4BnaFQ7P5J7EruQ5y+
	3hXZ6JMRgkV0Vu+bejwiIP1E3IbXE6JaRSsSMJfoBHGL6UuJurOOHv+Qsyk5h01FNbPPPOM/opI
	NRhYDbaRQzqWAWrnGoigQEJLqDO2xZm4xYF6y7D419w8s6Qq3sfUjRLBUdzEdMHSrWHCRBw1Ks7
	vk8if0shRUkwZluhEtYXMfvsbHCDGl1KcdxrmbHNdJQXsu5O91A==
X-Received: by 2002:a05:622a:1b90:b0:50f:ba44:ce5f with SMTP id d75a77b69052e-5165a059af7mr198117331cf.22.1779100483692;
        Mon, 18 May 2026 03:34:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1b90:b0:50f:ba44:ce5f with SMTP id d75a77b69052e-5165a059af7mr198116941cf.22.1779100483243;
        Mon, 18 May 2026 03:34:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm35654171f8f.5.2026.05.18.03.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:34:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: nord: add defines for the USB2 PHY reset
Date: Mon, 18 May 2026 12:34:31 +0200
Message-Id: <20260518-nord-clk-usb2-phy-v2-0-17a86cb307c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADfrCmoC/32NTQ6CMBCFr0Jm7ZC2BKKuvIdh0Z+pNALFjhAJ4
 e5WDuDmJd9L3vc2YEqBGK7FBomWwCGOGdSpANvp8UEYXGZQQjWilhWOMTm0/RNnNgqnbsWKGuG
 NsJV0EvJuSuTD53De28xd4HdM63GxyF/7z7ZIFHgm7a1RrpbqcovM5WvWvY3DUOaAdt/3L45Gx
 dS5AAAA
X-Change-ID: 20260513-nord-clk-usb2-phy-3e60fb0c31d1
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: brgl@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=927;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u8v8CNSfX49ylyxzKrYVQag0107VfDC8fMtgShe9hkk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqCus7TwWaBT0ofaGoWaOHpLesP1f3TPV0zgwDO
 y5fCRTeSzyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagrrOwAKCRAFnS7L/zaE
 w7noD/4rz5WbbBWapkqcAYFdjgbnoSECtjcwNw0NRfeEsLn96Prwq2nO3nYA6QsLyjHaBJHCZJK
 BqZcB6PF+p8WKOrZshe+FFAn/tC0CLQ1JcLV04eaaUIIlPLC6NFzanNVszVF3nFIMw58pCrjEQ0
 1XlxW2T0gXfbrdaAMzeNnsLomc5EQ/OvOLKn6/Uld776KH0C3pcRQ0ge2kETpmfgJmAMM6XxtEb
 Xk2QZADyzUCJz3ChE9dGQG6jnAy97ECRNfq6UrPrpGHPbLdXXHz5iEWOchhqiKGU8rnrVMBxAup
 JnIm0Q6yyrYTMXrghjltXhWwX18CBGp6NrseMVxo2qND3rq84j24nggB/WzCqqPp9TSBICIDqRy
 MdUbA9u4zZz8scG74M+zy8epDmBN4tkX2LbNPgd4QBiiU7C5ZFAno1jh2YKUhrjTc2W1JcASief
 IGM1dUkQzItv6R6UGz+AY2ZLQKXAHjEisnb7/8OEjJ06dKwOMrVXoe9l209VptHYoSmkV6my1Tw
 TlIz4XU7FePSlOBlUqNBjm4Dupj0FVHtOVoO99ZM58AJ8vAW1190wPqr0xy4y2/UxsVcNYHTSKb
 xyBYvpBnKsAJJPh3IDrstEwkWjD4fxuc9FN9jaL9TIg2sp+656DTTWCaO1WVExeGTMl3VjECYLW
 6u60w3pQjVHFsFw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: XCW4DU0fD-L48ncFvqSM_oa17YEo7rFQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMSBTYWx0ZWRfX25F7EZKAHB22
 iR98JXtToMw/VGo3hzx7AY0ZblJRpN9exR2SuxG31zy6FuwHco2tX//lWFCe/yPYib2TqNm9Dxc
 18wTU4aJkbBzXAvd/sdzcYh3u53mQ0twZJGS9ObhjrzDEeqxPQZqOatR4QTtxvuFY6kJAzBiboo
 cNwSxEEOmdWeXq9A3SBZMoK5arf5eqfNWfTGtKDjnbQcP27peuMYFyFaltj66OuvxgijLetM6ap
 X+L0nMJOoOcQXQC28qnxa9FaJeO0pDLY7+YxPnF1nQiyxbBbfMi2UfaTkFIUiRjrGPzf6mEmC1k
 8/fjD0FOxdaoNDnCkzx05tVTlQK0VwiNzf4s0f0ANtUS7WhQqMzcf7YtHW1PhEFpKiKbhtXg9XK
 42QDJn56iUxxiLsbeX60mV62kbQWOTOhA7LSEtzZaU4iK4mVpaEJE2n2TW35n6AGB7+RArJAzL+
 ALfDN1XvyFmuGi9FMgQ==
X-Authority-Analysis: v=2.4 cv=KZ3idwYD c=1 sm=1 tr=0 ts=6a0aeb44 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=BGJgbtQK9DYxViS1Zj0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: XCW4DU0fD-L48ncFvqSM_oa17YEo7rFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180101
X-Rspamd-Queue-Id: 7393856B40F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108163-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Update the bindings and driver code with the definition for the USB2 PHY
reset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Fix the name: QUSB2PHY not QUSB3PHY
- This is not a fix but a new feature so drop the Fixes tag and rephrase
  the commit messages
- Link to v1: https://patch.msgid.link/20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      dt-bindings: clock: qcom: add the definition for the USB2 PHY reset
      clk: qcom: nord: negcc: add support for the USB2 PHY reset

 drivers/clk/qcom/negcc-nord.c               | 1 +
 include/dt-bindings/clock/qcom,nord-negcc.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-nord-clk-usb2-phy-3e60fb0c31d1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


