Return-Path: <linux-arm-msm+bounces-95868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHoGB+n6qmmcZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:03:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF98224807
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E0BE307A9D4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26AD3E95B5;
	Fri,  6 Mar 2026 16:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llP3PUQY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QThzhMCf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A28136C0D3
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812815; cv=none; b=Nf78OJQjv2mZRMiOzGS05tzgLN61LAEfvKPRdyODisvjY352vLakhdw2zig8E/JTMWPfAIGZ1ZkMroIIFZZe5vqrLkFQp8fJL0BsW0q41YohVCY3XtTG0ffbWBfCzX1t6ACNCJe+LbF2JSl8MAY0Pbn+ulhh+BhhUm6nKNjL3t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812815; c=relaxed/simple;
	bh=Z3rpO6kQrWE+j2L3gm8Z9r1IXg9iMCiLAKvkCTYIHoM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=axkFiNfiJFOdUwq7FKbL37+SupfJBNEartAUCSU9OzCnh3mooG8MZgKT43wpFve4jnjvhhdmb22D1u5cgdKs379QsZrbeSl0rXVlJHQtwg4GSysmq37pEOK6leNtNFNIQ+0tqYgtRvg6LRpRNrzuwfDezIjxDLnkLVLBZPo2JwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llP3PUQY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QThzhMCf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FrIKY1743495
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OCgt4IYdoKnOpIB7dLO8DyHP94BzVSQjMXA
	yHByoHZ8=; b=llP3PUQYmNagNXMmRLPUdWsuks+p0bUgWJGJFE5UAwO/79dGbH5
	vIVqVe2v/2VFW9/o1t+yXQDAPfvoGm7DHwfOlC74XZbuLts2+xtHcz8VCRwLKl4P
	chOeyLzIm+dwEDm8gkNrPZUCZpHbbmSL/mcpeRNgke9jOghuFALzmu3BWaKBT/Wm
	kKVPAysJku9md6XKtABVqY+6u61+KXrtyU22pFp+qbpyPT24kirLLi71t0xNAKFJ
	Zq0Jakq77P+KwPnoHz10agtFZ2xG4Zxs8/Srrn5ryulV8RbqhKGNLw5NYZ2ZgZKq
	xekglgY47H2iVzO3033ox457OWrEZ3ouUAA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqx14gtx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:00:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506b3fb32a1so219848301cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812812; x=1773417612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OCgt4IYdoKnOpIB7dLO8DyHP94BzVSQjMXAyHByoHZ8=;
        b=QThzhMCf4tSVBIoqLQCTowGugNy7GdyyQB2OSurVYWQXCYyYWMj3u1ki1DoPgElgrc
         qDdwoM6myzrPFOkm/XLKzLhLpY/Odf0KSQebebhz7G4v5zeuuniuDddtwsqeBXQ3wzl1
         KRu/tQkPoFm5s48IzM/Sz4bnRzroCIFAB1UmCF0gyo6DKny0Y1Wdbzw/7uxfxHiSF/Xb
         JfN3homKpiIECk89+ruODVq6d0i7Pclwy4hRnl2JMCtCGJaaQEUlnozcE5bCDFS5T8aw
         56pdBcyVJ6v7S1a4x3nYcq/DyKje7O/ysxOFtqzCHIy+sShZMgbyQvsRX1oVq+/k1QWt
         cnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812812; x=1773417612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCgt4IYdoKnOpIB7dLO8DyHP94BzVSQjMXAyHByoHZ8=;
        b=DQOHV6OMFv+k58+Cw+kX1Z6GDgF42liXw83y4/T6bN2V6QMubzP4LKUGiiT5SxhucW
         eK4OINKkAF45BLuT3yYIh86t/a3SAMGAzO2SOiGiN06Uw+xKhAdQrQW9WtXU/0keNTz6
         KblLJ7F2aKc8jUUdT2lODxAOHvd86Q6l5Wj5QBl9lDTFNwu2kCSKZtz4RDEMPLqoEBr/
         66AceNlAY8zjKLXUdC5tQTtD/Ig53zSAHxxfw4Aff84LUBh0Kxfwo7+XWow938zPW8U4
         zTICzPgVzM/gY19kf8WQROZc3gFVC3zFetJVCDfK1gwB5XCCKysKXy8izdPV7W99gMeU
         /eGw==
X-Forwarded-Encrypted: i=1; AJvYcCU5mqY5PfIcC4HFlmsLXnlwC4+3CyjCFoHPo3O6Qdxn4+p7+eiZjcICvqJ6UwgLv11hRZwHDBmuey8yO1jZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwXy+JICeplBeYAEcb29qI+2BTLejOLZ5r1UZvhJmcoTCVYrzhS
	wY0IDNUwyqdZoJ1NSjHSsNSBn/lC4kit8Nq1NUGM5OT+BQYS6GFGazDhaIAb6wdSneBk77pnA9Y
	eUJduvdtBrepPyEp2mUz7WwZMjueX9rwnmFdpQjj9OoLObAyivMoMvLYnLQa2JxEgsS8UguOx/b
	JPz4A=
X-Gm-Gg: ATEYQzz30jqH9qBI98dfmBQ3nFcXZKQyRH+N7Sv/g3YJbviuQDrF8NxCdWAyW9PVhxr
	7Ue0gRSUmo/XBy+yZiDPAP+IeImoSh3z8FT6yVZqGjK0fRoDFNyiBD17fSUB5qP78dUlmHoUx+M
	A8rgH+3lee7IyrhaRg1LDKPZEhkAa8FMNUfd33IuhYAKAuseRq4fHkIrTJqfQWZ+FYBh4c4JVNL
	u4d8SWTHaqsgQzjMvSI91BJaQpYi+ey/8XI5XOpJaB6cjzQN0TbMVjJFcp+8bi1uLCtTreDN63Q
	7odbvANjCl+IKcGjYEugr+QYM+mdWpF6MpPdZpBHg9T9L7J/V1joCgTxwPEKMuyjE8WCw3iX+qZ
	iSa0cHvHC1+QwqvfFEMEsTvZ+fg16H6lSaaIzGfRKieivnKQm3YInSu3J/rslWmCw+b6CmRufc8
	82rKmOzlTaHmQFTJvbbfllVlaLrzJBYvzLZzz4nMozwQ==
X-Received: by 2002:a05:620a:4407:b0:8cb:4c67:349b with SMTP id af79cd13be357-8cd6d43ce21mr323864285a.31.1772812811725;
        Fri, 06 Mar 2026 08:00:11 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:8cb:4c67:349b with SMTP id af79cd13be357-8cd6d43ce21mr323850285a.31.1772812810864;
        Fri, 06 Mar 2026 08:00:10 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada9116sm4695983f8f.14.2026.03.06.08.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:00:10 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/3] media: camss: Fix PIX BPL alignment handling in CAMSS
Date: Fri,  6 Mar 2026 17:00:03 +0100
Message-Id: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0OCBTYWx0ZWRfX3NqRrMlwriNe
 BJNDel+WR05fMShAJMM0gQg7aM30sC/pgcdlpwaWSBsMqnEL9+Fd3r3vzBIdo1Onm3A9YTdKfFy
 9lKvGLPrRp1XRiRHycxHO0BV/ctqg9vGZD8ZFXNPKFnumm7tV+PpyW7gE6d+tpAMX8YhbGlpMUw
 qevdXqzjan0kZQJpWS50caeeFqbSbfo6R7/RgTiqY7r7wzd/ZCb06tN18B4cUKueCyEfw5nxPtj
 fVq9LmmI4W/g2r+lUZ/THDUXQB3FzCCnk1W7VDDtOWQGub9aVwp448evetyu/5b7LvR2AxYbnO+
 8066V54OGMMHmPh5Xuj6bE1an2r/tXkRVO8dAg4fX2w+bW98P2SoOJcO2tZ1GTKT6z9EpGeusC5
 A+yAKNWiM3Oy0UzjmZqcLgSX7eXekIXIAntVKhK/8AhhFBkMdliZFmOMMlM1JH5ZrlhptnZ2bi5
 94+JJ1RcbAvCPkLA2Gg==
X-Proofpoint-GUID: 8DOyXXhqeqezf-1f5LLVkVlEHZV7l7UI
X-Proofpoint-ORIG-GUID: 8DOyXXhqeqezf-1f5LLVkVlEHZV7l7UI
X-Authority-Analysis: v=2.4 cv=e/MLiKp/ c=1 sm=1 tr=0 ts=69aafa0d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=4T-m2v83tDMdnpPZlosA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060148
X-Rspamd-Queue-Id: CCF98224807
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95868-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.987];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series refines the bytes-per-line (BPL) alignment logic across the
CAMSS pipeline. The current implementation relies on ALIGN(), which
only works for power-of-two alignment values. This is fine for RDI
interfaces, which typically use 64-bit or 128-bit alignment, but it
fails for PIX interfaces with Bayer formats such as RAW10 or RAW12
that require non-power-of-two byte alignment, causing hardware config
violations.

The series introduces a per-format alignment helper, updates the VFE
code to use proper rounding for non-power-of-two cases, and makes the
PIX BPL alignment logic format-based on CAMSS_2290.

Loic Poulain (3):
  media: camss: Add per-format BPL alignment helper
  media: camss: Use proper BPL alignment helper and non-power-of-two
    rounding
  media: camss: vfe: Make PIX BPL alignment format-based on CAMSS_2290

 .../media/platform/qcom/camss/camss-format.c  | 28 +++++++++++++++++++
 .../media/platform/qcom/camss/camss-format.h  |  1 +
 drivers/media/platform/qcom/camss/camss-vfe.c | 28 ++++++++++++++++---
 .../media/platform/qcom/camss/camss-video.c   | 13 +++++++--
 4 files changed, 63 insertions(+), 7 deletions(-)

-- 
2.34.1


