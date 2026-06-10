Return-Path: <linux-arm-msm+bounces-112297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LDqZI2wBKWrqOgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:17:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5061666248
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:17:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Eb5I5uQ7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Y4GtHupY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112297-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112297-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADE79300F944
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 06:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774A533F58B;
	Wed, 10 Jun 2026 06:17:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FC12D063E
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:17:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072234; cv=none; b=I/B2zamlezV74RX8KdIQEie6IdxrN3jgh/hzPyxtJ7VqHfHZ88i7fyt1z8kujBfvuIMmNUrh+e/hbqrpHlr7A12nfmjnk29Bj0rJVpDv32Ne1bY4t70+JCJn1A8JuYn6uLLPg2bvZ2UZ1TvMq+CdgX1TQV3+nE1Ry12uxWL7CXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072234; c=relaxed/simple;
	bh=hms2jLbPqmmXolnSZVmVHfmLcIODGbkUN2XWtu0ccNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dN50L6A+YHfes+HfCI/mQJV6sZ5D5ktyiaOjppge1Hvpq6k93V5wc71sl9uDu0sujTBgZI5pAZWXgeSGWQACkNAqDT8i3k5BYr2DsEv7kjsYye/fCosqcCtUa6GGc+Gsx8kGL5T26Ki8FoNxksiRfFIPHaR2eakmreEzP8eS2KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eb5I5uQ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y4GtHupY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A4Wixc571734
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VnlBPQxQ22pz6nk91Vnsrf
	uSTnck4MhnkVm/3m/qG/0=; b=Eb5I5uQ7WZmKdNGE16tcS9nuf87a7Qk6s2ncg6
	BhKt4MJOIUYSmMjHtZIr9m9QbzpklKlp84f8urXc22U2tFLiAYJXB8tq833Ry92S
	l2F7iZ89Xu14xAPrSilV72IkIOgFDq3BPeC8w3havARrlJp3rujMJGoWLX/K0D64
	Uy5KdR6S51AgaMF9I3xjxiF9QlkwAZjqPeY4sHdRNfkUIsa+HL3lYIzr8xeTBG6N
	b1kuddTUIQvaGdQ9TCW/AbYj6OF0tCJe6RnQCyprt2OZ/OiIaZbGC6h+IfJo9Hzi
	abhXSrmoAWixp9fZ3RF7HVKTc4Lv9gcPCwNmNSa5pf5aCa2g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a8b3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:17:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8428419982eso5594783b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 23:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781072231; x=1781677031; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VnlBPQxQ22pz6nk91VnsrfuSTnck4MhnkVm/3m/qG/0=;
        b=Y4GtHupYZ8bYq575Z+udkxYHY1Hr9uvJ4rYbYfFsusENb061xdu5vhNJ8PTLPXSU2g
         +bcWj+Epg5EohMqeb4NL0HW4z/efIsbZtBiM/ZsWUKkLpUUroZrU7HChN18tLO0sQCP6
         zbS56oMXCJvHqZS0mTxKd/RCtxnp4V3iWr2gCP7oW9/v9aJsMud/Gyc5ogKSDgbrAJrk
         6iwvNaeliVC+yv7dLGj8ZMHV31GJg8M1O74tN7OttyBUXWKuNm8jNER9HUBBSPAcojHH
         4ulSMuvJYi4UTjRy8w7AlR9suPUnPQKWvM528aQc7B+6jRngMYyCej6IrVBR7pj+42Gu
         LSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781072231; x=1781677031;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnlBPQxQ22pz6nk91VnsrfuSTnck4MhnkVm/3m/qG/0=;
        b=XdmPxvz6zDIEbsGSjcGmk7LW2wewrPd5l+iy1urIDkieWR2EBXerWZOO1jYjaQRXpC
         IwNAngsImRtKGj0EPKdJhhYwEcZeZkrgsoGXAZqJEYzAW2gjPGQaxjKY+DDQaHAVpFMH
         sZ7qwEqvKS2vMTWTyIUJ74WPhdxyrXWp8x1cx67ORF0PwwA1Gdi+o4G1a7/SPxBF0ozi
         i5BtSozet6CIl2VyJW4nQ2lcNgurZWvmg4JUGZRSoVC4VP2F/Y02XlUf5V23ZXtwHyhJ
         YE7zTO2bM28vQrGo9zEjdg6YdWRCvi+KQ4WdX3SK5uHR24PjsAZVF2oRHgFC46jLHPRz
         cFEA==
X-Gm-Message-State: AOJu0YytTaMKR6YPCZmOw5BqUj+bGa/3ZRlTKA+n+hpdr2Agp3s2v+Q3
	ms1o1AeGHFMh53QjMhK3HU5KYnCcJOA7GYdgD/Mwj5gaeAUshFO2n08YVfnNp+LO/Jlp44mpVdH
	9puGcjoab5OwdLoY/UOzKryYo4cKS886qAQehJVyfpBDuAX/GLeTKKpr+9c5SVaHnrbLtCUwsw4
	fv
X-Gm-Gg: Acq92OH8RNsIXMUyoGr9CqWnnQ4TdfZ4jLBZVI3DbnnL+TzlJmln7y56mLgHWQfVNUA
	ngyzpqYte0zd90bFJrfTHrdELEQlSYtsk+qsh6aiBbhEC+q89ZuPKQNJVM85gy29noyQQnhUXwq
	uZ7wIAYuDjqtzkiWO1KcxdOJiZqL40NdV5NQL876+fPrkOl3bw83KHFuvEeB+43WtV5yVNky2Gm
	85DeRJTNoeXZNoL1bpIF6O5348nWE7MiI8saGlbrg7moyuW3TRHUvbLskRfk6RXSi4hBLyJp2wx
	1W9gaMxVwIfB1MjZs2OeHRS4AC2u4jtqbj0kusiZmB2JmnvCj12q4h3qRYFkndQe3wcj0glaNii
	j8zsu0rmMR8s9Gh4OOtulpIU5HRz09/Pq0IcmOHWpPIwgPYJfKnA77urM1FHDCQ==
X-Received: by 2002:a05:6a00:194a:b0:842:7476:236e with SMTP id d2e1a72fcca58-842b0fd2828mr25433942b3a.41.1781072230679;
        Tue, 09 Jun 2026 23:17:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:194a:b0:842:7476:236e with SMTP id d2e1a72fcca58-842b0fd2828mr25433917b3a.41.1781072230283;
        Tue, 09 Jun 2026 23:17:10 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84300cb0a82sm6301361b3a.53.2026.06.09.23.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:17:09 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:46:58 +0530
Subject: [PATCH v2] pinctrl: qcom: Avoid assigning unused private context
 in test cases
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-tlmm_test_changes-v2-1-f34536da4717@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFkBKWoC/32NTQ6CMBSEr0Le2pK2SqWsvIchBPojTSjVvko0h
 Ltbce9mkm8mM7MCmugMQlOsEM3i0IU5Az8UoMZ+vhnidGbglAtacUnS5H2XDKbulyMRVDArK3W
 mg4bcu0dj3WvfvLaZR4cpxPd+sbCv+29tYYSSuh6sVmo4HYW8BMTy8ewnFbwvs0C7bdsH2ArK4
 bkAAAA=
X-Change-ID: 20260529-tlmm_test_changes-6061f95c70bd
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781072227; l=2335;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=hms2jLbPqmmXolnSZVmVHfmLcIODGbkUN2XWtu0ccNs=;
 b=BCbtoTO8ETdUbpCgHdfZDgy/d1nFjUlU+phcysbbUGrmCGUki+3qHZrk9mb5l2+WX6YrDMniR
 Dx7tL1hs4WKBTu0XJFUi5kP604LkH3SzfWrK6sv2UEf3SFlIJfTCkOL
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a290167 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_oooiXWqQgcqgp1T0oQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: jqkSpcL5XrmG_0xfbWhhdtaW7WiYBWWg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1NyBTYWx0ZWRfX1atozmZhOLrx
 lepFJk/zAmX7ohH5JwLqV9yad6QLbZrsJ2NfOMWyjqBZwpRYumHc8dUNnreIrjtvjndnaFAbTVJ
 GQfn0CM6OFqgwxgI9IrKJIAKm8KSUC2bgeBfm4nPt5xaL1U5rklTO8lW8T2in2NUhbwWUqSBct/
 hx4T/FU7SkRgOsCp2ShEUrV8j1xzNq+JPaSlB2LMHTSGzMxt7D7UAFumbnwGj4PaWvFFr9CopXw
 D9qD00dTzRo3O+i6WbZOKao3yicrTWgBhF4T6p5ewRda1/Gxf6jg5FF9LgQ00Wlo9Zay3jSNI+j
 QdvevCgaY2k1Bi4yoI4uaLYDaE6UV/Qpg2vQNKrSnESka+GwBIXYfR0kcGiuyE8mNRgrDnjwNe6
 mcJ4c+Qs5+xALEmVlvsTaTlJpAiV4jqplDnNsfO/S0e4XxFu8f/KFEuqx4jkGGWEWefIew8pUpp
 HR6yjMg+HXd0F4IrqPg==
X-Proofpoint-GUID: jqkSpcL5XrmG_0xfbWhhdtaW7WiYBWWg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112297-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:quic_yuanjiey@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5061666248

tlmm_test_rising_while_disabled() sets thread_op_remain to 10, but this
variable is only used by the threaded IRQ handler to control the number
of GPIO pin toggles. Since tlmm_test_rising_while_disabled() does not
register a threaded IRQ handler, the assignment is never used.

Similarly, tlmm_test_high() and tlmm_test_low() set intr_op_remain to 9,
but the variable is used to denote the IRQ handler the number of times
GPIO signal has to be toggled from the hard IRQ handler.

Since tlmm_test_high() and tlmm_test_low() themselves toggle the
signal and do not require the hard IRQ handler to do it, the assignment is
never used.

Remove the thread_op_remain assignment from
tlmm_test_rising_while_disabled() and intr_op_remain assignment from
tlmm_test_high() and tlmm_test_low() test cases.

This does not cause any change in functionality.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v2:
- Modify change to also avoid setting priv->intr_op_remain when not required
- Remove patches that are already merged.
- Link to v1: https://lore.kernel.org/r/20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com
---
 drivers/pinctrl/qcom/tlmm-test.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
index 007d6539ceced294e81cfbe93a00c75a98c858de..13c417731be7a4dd1c0b8a48044c0090b607e72f 100644
--- a/drivers/pinctrl/qcom/tlmm-test.c
+++ b/drivers/pinctrl/qcom/tlmm-test.c
@@ -273,7 +273,6 @@ static void tlmm_test_low(struct kunit *test)
 	int i;
 
 	priv->intr_op = TLMM_TEST_COUNT | TLMM_TEST_OUTPUT_HIGH;
-	atomic_set(&priv->intr_op_remain, 9);
 
 	tlmm_output_high();
 
@@ -298,7 +297,6 @@ static void tlmm_test_high(struct kunit *test)
 	int i;
 
 	priv->intr_op = TLMM_TEST_COUNT | TLMM_TEST_OUTPUT_LOW;
-	atomic_set(&priv->intr_op_remain, 9);
 
 	tlmm_output_low();
 
@@ -521,7 +519,6 @@ static void tlmm_test_rising_while_disabled(struct kunit *test)
 	unsigned int before_edge;
 
 	priv->intr_op = TLMM_TEST_COUNT;
-	atomic_set(&priv->thread_op_remain, 10);
 
 	tlmm_output_low();
 

---
base-commit: 95d73427242a1b8f4c06c39e7e93d83cb5779680
change-id: 20260529-tlmm_test_changes-6061f95c70bd

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


