Return-Path: <linux-arm-msm+bounces-115719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pdwPAXwgRWrr7QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:13:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9D36EE92C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:13:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bJoJiUFL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KMcEDzab;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115719-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115719-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 439BD32DBF7A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 13:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87B9367B88;
	Wed,  1 Jul 2026 13:39:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BDC3F86EE
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 13:39:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913159; cv=none; b=egLQTx9pZMlVqhl3y9Eui7pwcjEpMC4ITKyKUEZYzhhhjqTyt8icGLErYxjm9AgudqS3PgsB/6nCqpdWt8iRiU6/KVm9fPmSCjeRSMSX8tQCuHvCZGR2tl4O4sI6oU62KWvoMvXPT4Ud195rk/c+RH8jnZp721kRva+PsrGM1QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913159; c=relaxed/simple;
	bh=KzDYfcp9GnoGvcZEBjshMGcErl+HkiJ8eraZlbOE1Rs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ea8ZwJ6zuBDsJ9YIKDWRPIU24lmEtiv36r/bJ8DmtbkOvbCzL7hjTWYjEi3gFM1acKv6z0FitnmpW70FOTrVUmVby3mp3aYvYPjAXhe87FPI9YQ0beN9awrxbK7o6AWbXJYZQit7M77AVEXfi8I0Ds1cWtyVix4U8DbGK8LhB3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJoJiUFL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMcEDzab; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8ntM683610
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 13:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nJrOhR7snJODHa4LeONjJItuEyxiz/64Tp9ZjkYxfaA=; b=bJoJiUFLxUO0cT29
	5voRtmptf3xHEXNlVr0pphqSepVmukfmiAWUGOqAilF+8rq0OckfUOdEh1ftZpXo
	Edf9x9XA1FuEjt0NGNTHyxJpjCXH4NZt+pWWIKze9+XoQTeRSp3HV8hsZRuFy0MS
	kVfw/gI0g6v/p+MrmpUf/c0ic32lxXcL8QX97W0jNI9rcXA5EQHPb/W8bRP3QydE
	bu3cZAsUG4Y+/xii04TfvnHe9jRcsvFVZKfKLc3ylPPbcmgTO++gDEuCeSN3k/y+
	UdybbYTVr6cW9pIeZCGVvfe3RvAmYhylujQlU/R8G1lgtpUP7Sn6aaxDJHlYCIDV
	UADSsw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqmh58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:39:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ac0a54110so93304285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 06:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782913157; x=1783517957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJrOhR7snJODHa4LeONjJItuEyxiz/64Tp9ZjkYxfaA=;
        b=KMcEDzabkb3BvjySozyv6DknZ//v+RNMKEQ/bZd7O0QZ9UGcICqwx19QWjVdsdcWZl
         wkYe5f71hoRc5fjK+FI4Yixxl6MibG7gtkU228PHTGvMVZejoAVlwLj8qPWynnvdDLjI
         yvR9r88fGD93G5tB6LYsadUgJhUFHcIShL3fYEes0qGQBmjRT+zARB3VipH2jYGgBt/E
         4izNBT3dIk8aw+vAeMlg9pneuHAvAd63U1/tMMay/NYx0eFh/2k40VKDCFJi4WZX3ktl
         6+2UaXKBRHyBP7HMf8sVetkAIodceeoGGweaB0d1P7KVa15HjA/6jzRFrFlviRn9ARh7
         VRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782913157; x=1783517957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nJrOhR7snJODHa4LeONjJItuEyxiz/64Tp9ZjkYxfaA=;
        b=jPy8BI/mQjacnqTGMS98n3oSzKdaAATbNh1Phs2iN2PlCBY5KeYY4IuGgU+XEtIBdX
         /v1YnulmDpGDuOw7koKcFjrNMYRlYM9t3U6XHCkLv0cK4xcBl9BVX/wWbwQgugrG9TIB
         3vgUL7mV8VMJEqlRkgPdwaJPr1iuEyg9H0UuFZdqUeJ3gAyRfDHCj+Sb78uQ4lNiPODG
         /jzq3GFr7ZLBxlM4wAsGw06BoFJxJyDhP7QoEQA2rwTaspx/Un0cDLtr6UpcJ6BUOycP
         eEdTiez2H74Jy3CQporIjF0RPoBn9G3N+RQS9pKPdGHTIM2bX7dSJJ0CY5s3zLOA5Rt9
         0Uxw==
X-Gm-Message-State: AOJu0YysZEnRlbVGYj1hoX/+R/FA31r2m85jYHDxcvSXAdoRkwTQCpqI
	8SrVond544MkigzSCJk1/Mh2DE1XUELyQRVvMBpqEya0mTXDYsdmAcgywdAY1Ll/Tp79LJLLzJf
	oaVA7/DfQ6HmvIo9EJi/+JhvrmyUZQekN52M/j2Xc8FEvUFqwkAWzf6DRPTzpiAXn0uIa
X-Gm-Gg: AfdE7cn2ThOlcg6dKeGFfdRtiuOeUa9QR4VvxvF2I/S/G6LA9xH/B/Nev9FLYdrRPkd
	V1GFriKkfjsNT8HOh16dOVEC8I0Is/OKx1KU+Fk46dUW8KolC7eqypgoFadByrJb8JWNomgJHAV
	YuPDmgBWRpJX/VVzhs3goRMWjuHY9pMkMCNAGJsuxtckf/DlnKnADEeMtOutEROLhuaoiO/JyfY
	IYUOqRBRIujlpXNzEyEDRZKMXor/SX53LWlxxFlVtpBOM3c0xoAkpD7asZP4bp1Th0kpJGFRYNc
	SYMgLDkqudbQlpPhgFCAn2et2lqSCWheLDutr7ETN3IiZj7KqxO+qC0ytWRnOkereQtgOV1NTa6
	556TOHNzh/4XR9u4Yx646t4Myd5QUDrUKW0Gujixw
X-Received: by 2002:a05:620a:1722:b0:92e:5d19:bf82 with SMTP id af79cd13be357-92e78217191mr242032885a.17.1782913156726;
        Wed, 01 Jul 2026 06:39:16 -0700 (PDT)
X-Received: by 2002:a05:620a:1722:b0:92e:5d19:bf82 with SMTP id af79cd13be357-92e78217191mr242028585a.17.1782913156275;
        Wed, 01 Jul 2026 06:39:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6619:ec60:6996:ac02])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c3874f62sm18349985e9.2.2026.07.01.06.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:39:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 15:38:55 +0200
Subject: [PATCH 1/4] firmware: qcom: tzmem: guard against IS_ERR() in the
 cleanup handler
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-qcom-scm-code-shrink-v1-1-02f5ce02c95a@oss.qualcomm.com>
References: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
In-Reply-To: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KzDYfcp9GnoGvcZEBjshMGcErl+HkiJ8eraZlbOE1Rs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqRRh8O2M7m5URuKEsukFih39DWmQflnZYkqiW9
 TX2hxbY77mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakUYfAAKCRAFnS7L/zaE
 w/pPEACXsOEVrhmVbL9j2ZtxZvEe+SQQ4mLOUsVicUc6r2+of2twoWmT44ZrFJe2QzGo+IdL4qx
 PfnIHEVGatH+un1qwHsCmTt61ADzycZNar++w2QJPb/vf80AjgyZkUNSDQmcnKKLqzlMjYI3g7d
 9pAsTC4tS/Ba6p5I3rADRg3qQU5Hhs8Ud7fYsZguuBZMmH5lrWQDk7y4tPBUwMzDk7b8oodAcM1
 iNEL0vdsbrEKGNcw1hju34nlVYPAHdMmdbXLXm6sLZkffkXR6Ox721uip0C/WxATCuRbZ59WrON
 pOJs8oNvul5uaOD0HGdkNJy0ZekYAnA+Zww//aC/9gbnrxUg8A68NwXJNQlHXkFjPGBrYQoPOub
 Xc9R7Yt8LtZGqOn0QVfabYVckj2PaCcvC0uyP62wGVaKgMySNecRbNS57Nz134TkTHL8D44Co9s
 4UUV5NwsD6eGcFsnOL44LClaTs1ijelrpg4rTzK0h868ZmHEKL4HTRvIPbdTIPz+7ACSuUkM3S/
 XJVQrP4T0W+76VYNks/6jrxHHcz1AzpXCa9pgWgtBZDIHEKcpikP+wd6ORnBiuWWW+fcQvkC2Io
 wxydIbal0u4raqxL11Bb+2cBOqUu4Ua2BtOFTdYNqnY4vOXKxSk+nwqlew6mYonM380gGlWa63/
 emiqw92XTX0xs8g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: JYEZy80TXne_liT45TGUESX7FnUwROKs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0MyBTYWx0ZWRfX1zCwR3E6/eQz
 R02ZzyQem7gAjZTYbdhva70yaVpkxkMpcfGhYRxhrK6o6GuqQxqx+A6sVeootV4U5nLEQVBCRLk
 VtReILBpAtiWVehKebO+pDPXRFHDPSlC1dS4WtDD4vGKNma9DQ9zLMhvQye+v5Y5i/yecULp9Ew
 yMDs2DCtOpMMJJ8PFN/x7EWyH54pqDn+p/rQV1WdJR8gWFcykoBKyPgMYF5pIKHNG4EJkXLlWHe
 PrRkmjiCpapn9G3CCzG2GcjE5QHnSnxvxepFJ3M7PSVFAZzsKWbujcNWTXkXB/pgwoNd6OL+hHT
 Ic9YYqkQ/BKl0aRAW1/ISUg0cGcGSZpH4keaM5UJHmQ5etpdF21BciLUGMlo1Bjj9YKKFpKBTDJ
 tErWgo1w6jJYU0YhGQVUHCtvo2B+hxyAuWFgghXNaYfSR04wOWUSlym9G5mbTlED/TTplyRbPE9
 BqVLbPuPiSpang/dzAw==
X-Proofpoint-GUID: JYEZy80TXne_liT45TGUESX7FnUwROKs
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a451885 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=PGwebHSm6yYtckILb5AA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0MyBTYWx0ZWRfX5n8uty7pRqRa
 gTPD9Ngk/olrPJpROC1jd0Mv45NrAXjeDgV0NwYBfuKBObXPg9IZMNwaNyoegFzjZcycl0ozU5E
 tWE3h2vwjIixUxc4pXu9N3JoBapXv8Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115719-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A9D36EE92C

We currently only silently skip NULL-pointers in the cleanup handler for
tzmem. It's possible that we get passed a pointer holding an ERR_PTR()
value so skip it too.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/firmware/qcom/qcom_tzmem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/firmware/qcom/qcom_tzmem.h b/include/linux/firmware/qcom/qcom_tzmem.h
index 23173e0c3dddd154dd56dc3dcb56bd20ada0520a..b5520178bf6f53b86b530571a3be9f302225f022 100644
--- a/include/linux/firmware/qcom/qcom_tzmem.h
+++ b/include/linux/firmware/qcom/qcom_tzmem.h
@@ -58,7 +58,7 @@ devm_qcom_tzmem_pool_new(struct device *dev,
 void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp);
 void qcom_tzmem_free(void *ptr);
 
-DEFINE_FREE(qcom_tzmem, void *, if (_T) qcom_tzmem_free(_T))
+DEFINE_FREE(qcom_tzmem, void *, if (!IS_ERR_OR_NULL(_T)) qcom_tzmem_free(_T))
 
 phys_addr_t qcom_tzmem_to_phys(void *ptr);
 

-- 
2.47.3


