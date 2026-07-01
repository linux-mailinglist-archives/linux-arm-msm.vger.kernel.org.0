Return-Path: <linux-arm-msm+bounces-115720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tgXiLKgYRWqw6woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:39:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD2C6EE386
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:39:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jkMdHEz6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GbEdvpey;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115720-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115720-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED3DF3019113
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 13:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C077048BD54;
	Wed,  1 Jul 2026 13:39:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561EB481FBA
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 13:39:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913161; cv=none; b=WMmXAFq8C7tXaLCSW5W0415k0A/HXeOsih47i4maGUM23IwWQcmLE+driwx7MrnKki9HLHw9I5afL7HmQucuXqPSEXwK72rsUfk7VW1BV0dUxPpcmDB0UzimXXG6QcGy/jwF0wj33HEZDYPXO2JbvqnxZXdegYPDVVt/Mfmk2ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913161; c=relaxed/simple;
	bh=conRl8QOE21JFqocLekR3FtvDygycZzY3BQifICg5EY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nYJc/GT5qw5uyyAW3VPr/ZA5/eFtYcCQUJxmHGyzeXtAsjy0L1nHwR0H9l5QDPe9TZQSfJE+r6XwSIu83xhUmGrHlkfQGag0g8HO6sSSDtV9z8L0S2aloRelI6jDdfAsViTrwzTk5AjCsbQs1H/62emDZTXO/wfdCQrkvx1AH10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jkMdHEz6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbEdvpey; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AGL1b793871
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 13:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oSz9DdoE/gpZ6ZmSojjv2AvQz0YjZIPXtqJ+sSHVA2U=; b=jkMdHEz6wQNAZZUl
	2LKtVvOw3y1JPaEIBG9K1qW9/XAWN7fhwsGIhnxRWvyfVoh0FF6Xy4ZPYrkVTUkw
	VqaItFM4KiJJCVRxhxObBfozXeA9XSrNnSVf08OpJATaBPCID0ls3sA+IvaUTNcX
	G58abcae9AAvbA4i3TTnhVp5RQYpUR0gxlvGNptwAGuH/Sr5DDi1ZDTwvm7WYNH+
	IuYHJaEF8yAoCVxYk4nPD1znVFjOxnq8BjJhFhvvq+tQVyT+Xp4iCvixJKG7/ORm
	9H3958Na4p3rrOjHu8/GJhk4zAbv4Q2Us837oEAuyfGZhqobPNkdBO3M0MB781UN
	GMbh5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510agukd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:39:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6ed4fe99so126328985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 06:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782913159; x=1783517959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSz9DdoE/gpZ6ZmSojjv2AvQz0YjZIPXtqJ+sSHVA2U=;
        b=GbEdvpey2w/5Q6/MH8EzYZ11uA0npG3dIU5Bcq0ckOZivSsO+ILcpW54BMKKg3GBev
         +wV2qE9vpXKcsg2uGNbRcykBARUHafTu5ie80qfSLMpYqhkMfUT2ITbVDqHizxl0y8Ix
         rZ1ckunE052e4ZMBwr0nZRU/Zv2dCsz2lnXYxkCDAyXZQy/qlKwPigloilL40XyvLJsX
         HBbg59Loog3I0N3h+OTsrHYhXwuut8UAM24M+QeYxLg3E1WR5jURnU+e0dKjJEMOH7Am
         JiuzjZfcuXhXC+tW+rzl3a2+/d3veE9gnCriq1EGW1udSM12qRY2wieEnSWFuVq+Mvp5
         DyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782913159; x=1783517959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oSz9DdoE/gpZ6ZmSojjv2AvQz0YjZIPXtqJ+sSHVA2U=;
        b=tX6MqbVSXjzbA8zDTRe91pFFulrAPRh7y9Ipjl4eMq4eMSYolmIE7aPvlOg00f3nyl
         tQh0SmWZ7YJadT8ynbGBkb70qvdTfb3/GrIx7eWI3bdATZitXRRUzBQhpLHhUVcuvxoo
         MGJC1fCYy2ohNiFAf0YtyXkexQho4/miOt5OD8gUgiC2VVcPjI3L6aO2FwRMzgDzd6AO
         aXf/YTkSprMgqCo7cOsY7YVB/jSjP8nXYurB0UONpSCyeX7w3LMbnQeJV0xv6eILon4I
         MiZ7tp2CDcsaFRYhJP6QiHAgcMyCZVKGf2Nlt465fd5kpi0dptp8ZS6n0ASe5djRuZ8G
         /WoQ==
X-Gm-Message-State: AOJu0YxkRvNMkb6XY7MbcLuWLlH+kxGEeB4+JRz22wQ/okCthN8W+VLf
	RIj+H9YpMcHv3/slzLxmDYfJ+OvfZ0UBb9flKLgGOxM3qg87MCY8iyZ3IwwDkctbSm84Zk81qYv
	vareHh/Vr8+u4HCNeiPBjbTx5avXFF2rMzxHYP/WgiuhxT4CCtmFmuaX5+0bokny6FfaX
X-Gm-Gg: AfdE7cm7W5CqRK43mWDEprg83KLzdBiXMIy6o3C2yB3Ifw29S1F029WiVf6KxiOHbb5
	UdiNkwCi95u8rln98FcKd2sWbfK8j+tyEYMUWufb32thYWVZkG6v4XyU0NavofxcRDUIprJl9lE
	iaUclGwCyMyujJrQuownQhPLGdbhpuCecMtBcXXOgbUSsdcP1pTM3PU2psYNSFT6k9MGieXaroy
	o6LAFFu3nDlUcH7JzLePIInCQUiQKSoIKdS2K7DXuxAkWAgQu9JOgv7Rmxt0nVeUGdDaYraCPBw
	Ekibeta6OFrktbZmRBc97V8pJ3mAN46EraRPQi6GtTD6KQ5dahRKM0PBTx2qNtrCJaspLR0fouv
	tmJwlxaXDV2tLVGN1eas8NwtHMDcTZ9tONnd1xhlj
X-Received: by 2002:a05:620a:4587:b0:92b:3720:bc5d with SMTP id af79cd13be357-92e784cbb96mr219659685a.38.1782913158703;
        Wed, 01 Jul 2026 06:39:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4587:b0:92b:3720:bc5d with SMTP id af79cd13be357-92e784cbb96mr219650885a.38.1782913157879;
        Wed, 01 Jul 2026 06:39:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6619:ec60:6996:ac02])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c3874f62sm18349985e9.2.2026.07.01.06.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:39:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 15:38:56 +0200
Subject: [PATCH 2/4] firmware: qcom: scm: use __free(qcom_tzmem) to
 simplify cleanup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-qcom-scm-code-shrink-v1-2-02f5ce02c95a@oss.qualcomm.com>
References: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
In-Reply-To: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4463;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=conRl8QOE21JFqocLekR3FtvDygycZzY3BQifICg5EY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqRRh9m+6EhIGKqafSdgcun2Xj9sUAA3jLxsMfY
 0+aXv9K5qqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakUYfQAKCRAFnS7L/zaE
 w03yD/4i7LBsBPB/Aq+cfRZLCemBvaC22dt6aTNtYD3MrpFCpBmfxz2e8+U8PP8j/DZ2N/8p2jX
 GklOt7p4n3JZ3/mS2MQPQ11YKPf1nZ2DY/fCfIicHzO4w7qrqoTqFU/GU/xrNpgXLMJtOMSSQc2
 E47HtREMUZ5+u/FMT+7meldlJqUrpWc3EDuf9PJCnanV+/fHFYtx6EgE6jETbD7BCKnoEe3ILIV
 vaNkRHB6eofrTlLJdQeM99B468C4No+eBCYhZsSJvDC+3xzx1vU/AQ7hgqeqDPg5O0w7t+Jckcb
 kKFxItd/RJgRV33KDVC1MV5Xx8Hqwy9dRK0NcdGrI/aAOXI+7DGIQbT14g++X8VBvri8mE2B8uJ
 FK2T4Q7Qk+LbRWmBmC1AgouZNSgUbMFwX2Nvx6xhVUqCerT+hxNXphpIlQgAkUGZwToL6XQT2bV
 wSqpnlb8J5vvxFZ9fGoB7pokHEef+k+TPdIIwTggLpJeZwnNOyZ7sLGWWAFw2Z3F7o1CALwYG7F
 N6Gs4W3q3IDtuhXbYe2/ptPz3KUuU0ywhgpGXMKuNEz2XYHjl5bv1iZt4e3cJlKiBsr/btupYNo
 4JspmqcZ9BK0KLkYWMAL6Ri2dE4A+skeh8nC5CJ9zq5ees295ipN1I/jvk9XS/pSR7mK16CudPT
 vs2gKyY6LvCLuMQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: loXahmcbTlC2X0180H65rZiOuI-DOXT7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0MyBTYWx0ZWRfX6jgRDgjLN5vd
 fxqXCuzAZHHXYnsUQPpeiLF6vwKLA5wIVAeDyL0WJH40Fm0EmSEOYbiuzZO5AHKgYGQKZUmU3nn
 zfPi7EPAMXdY+w+ObjYBR8ZiXO3wqeB+JMzyd/ob7kJjXSU63sR8oxjYLiE1GFxpsi9P7ZFUDgK
 JrLkzyzqcaN2jYlT6+6ffqko++U303j3cZvtfFZspn4JVOar0vOB1lwQajVtYiAj5Zx3z3twoZI
 Sn3hhag5s2quy5QYaiVUJv+Yg1W1AJXe5FrRO6k8TJK2X/RdzzjPirSqDq4I2iHPgeFFKcAtTnN
 YopQCD22wQAC0/duHHbm4IIESpU3WdxbeZ3k/Bcb7bdx3J2rqpuYWh5c4CPMpsEXEOcBUL2Lixb
 /lkQcajcteA4ZP4UyuEs1r+1hDpEttJTX5+yuxg+TMPiBZ3XtaP0+8vI2qUT65PP4MxJ/++e9pe
 Xdigw5xFbOhLGV39eSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0MyBTYWx0ZWRfX1g0tY2Sc8i++
 NoO8atEPlEwVbBxHikaC50dcfMrpeMeDRXU6V3f8ZrRyj4+SNzaqWi0weo6xT+lXFgAn9Xpg3av
 l/iMbCcd1C+zAebvh1i5kQ0cHBuF8nw=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a451887 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=lzBMFA2zsglRjAhb4b0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: loXahmcbTlC2X0180H65rZiOuI-DOXT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115720-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CD2C6EE386

Use the __free(qcom_tzmem) cleanup attribute (together with no_free_ptr()
whenever ownership is transferred) to replace open-coded
qcom_tzmem_free() calls and their associated goto labels.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 48 +++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6b601a4b89dbf04322730aa22fc9590d180a383c..1684220617748e4890ecb45a1787a6798dafd5cc 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -640,10 +640,9 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
 {
 	struct qcom_scm_res res;
 	phys_addr_t mdata_phys;
-	void *mdata_buf;
 	int ret;
 
-	mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
+	void *mdata_buf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
 	if (!mdata_buf)
 		return -ENOMEM;
 
@@ -652,11 +651,10 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
 
 	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res);
 	if (ret < 0)
-		qcom_tzmem_free(mdata_buf);
-	else
-		ctx->ptr = mdata_buf;
+		return ret;
 
-	return ret ? : res.result[0];
+	ctx->ptr = no_free_ptr(mdata_buf);
+	return res.result[0];
 }
 
 /**
@@ -791,10 +789,11 @@ static void *__qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt_tzm,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
-	void *output_rt_tzm;
 	int ret;
 
-	output_rt_tzm = qcom_tzmem_alloc(__scm->mempool, *output_rt_size, GFP_KERNEL);
+	void *output_rt_tzm __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+								   *output_rt_size,
+								   GFP_KERNEL);
 	if (!output_rt_tzm)
 		return ERR_PTR(-ENOMEM);
 
@@ -814,20 +813,17 @@ static void *__qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt_tzm,
 	 * be of unresonable size.
 	 */
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
-	if (!ret && res.result[2] > SZ_1G) {
-		ret = -E2BIG;
-		goto free_output_rt;
-	}
+	if (!ret && res.result[2] > SZ_1G)
+		return ERR_PTR(-E2BIG);
 
 	*output_rt_size = res.result[2];
 	if (ret && res.result[1] == RSCTABLE_BUFFER_NOT_SUFFICIENT)
-		ret = -EOVERFLOW;
+		return ERR_PTR(-EOVERFLOW);
 
-free_output_rt:
 	if (ret)
-		qcom_tzmem_free(output_rt_tzm);
+		return ERR_PTR(ret);
 
-	return ret ? ERR_PTR(ret) : output_rt_tzm;
+	return no_free_ptr(output_rt_tzm);
 }
 
 /**
@@ -878,8 +874,6 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
 {
 	struct resource_table empty_rsc = {};
 	size_t size = SZ_16K;
-	void *output_rt_tzm;
-	void *input_rt_tzm;
 	void *tbl_ptr;
 	int ret;
 
@@ -901,7 +895,9 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
 		input_rt_size = sizeof(empty_rsc);
 	}
 
-	input_rt_tzm = qcom_tzmem_alloc(__scm->mempool, input_rt_size, GFP_KERNEL);
+	void *input_rt_tzm __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+								  input_rt_size,
+								  GFP_KERNEL);
 	if (!input_rt_tzm) {
 		ret = -ENOMEM;
 		goto disable_scm_bw;
@@ -909,8 +905,9 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
 
 	memcpy(input_rt_tzm, input_rt, input_rt_size);
 
-	output_rt_tzm = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt_tzm,
-						     input_rt_size, &size);
+	void *output_rt_tzm __free(qcom_tzmem) =
+		__qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt_tzm,
+					     input_rt_size, &size);
 	if (PTR_ERR(output_rt_tzm) == -EOVERFLOW)
 		/* Try again with the size requested by the TZ */
 		output_rt_tzm = __qcom_scm_pas_get_rsc_table(ctx->pas_id,
@@ -919,21 +916,16 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
 							     &size);
 	if (IS_ERR(output_rt_tzm)) {
 		ret = PTR_ERR(output_rt_tzm);
-		goto free_input_rt;
+		goto disable_scm_bw;
 	}
 
 	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
 	if (!tbl_ptr) {
-		qcom_tzmem_free(output_rt_tzm);
 		ret = -ENOMEM;
-		goto free_input_rt;
+		goto disable_scm_bw;
 	}
 
 	*output_rt_size = size;
-	qcom_tzmem_free(output_rt_tzm);
-
-free_input_rt:
-	qcom_tzmem_free(input_rt_tzm);
 
 disable_scm_bw:
 	qcom_scm_bw_disable();

-- 
2.47.3


