Return-Path: <linux-arm-msm+bounces-117143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aHpOFvuYTGpkmwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:13:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 482EB717D35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:13:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Io0+6HEh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eJBUnFND;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117143-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117143-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 101663016AFA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106CB389E07;
	Tue,  7 Jul 2026 06:12:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F413E388862
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 06:12:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404738; cv=none; b=XVrLiryJSapzXmvTNFbIcg1swezx6Bze9S3kCf/6zUxtszWDJX2/Q05yHolMiJjlJiqOKtuoyQYF37Jre5uTzLdpaPkILJnP+NUHqwsgqqX6O7+opHCHIxHFWMxVdzTdQ3665Iw/JMOxIdSSMrqY0XMuZn/DaIS8jyUdM1a9YC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404738; c=relaxed/simple;
	bh=0eTjauZPn8IfSkvMdjZwIW90QvTg8s8dczcYNWpKwRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pcMdhRprtpmJUqW3j36tQw2iwW+HEOQu00+i3PlZNLSv0mr7Yxy7sV3DX1DMMNakVxeJvHhoGrbZt9jtprmEgmDIOfO58sl3zZu2/h1fEBM598peEkWasLMYLlgBqIhcSweFdUfsnhuQ2e3gCrU7vuovKyP3GveIZKV9sccokXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Io0+6HEh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eJBUnFND; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749W7k2646404
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 06:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NNAd+TMb+3/aBq6GaRC6LydMmMiUk++N4aKr66RpLb8=; b=Io0+6HEhzqlLeXEw
	lfSVfE3QhcSXHUiGH8HhktWjbfgnkH/OOEXNR+w3eDv59Gur2OdikO5l/GULVukl
	l4vDkmH7LjMADd/7DiivL2rURDpYezJYMzopHTtRxNIKQr0DOSmy03ucZWpITfLy
	FsABkLx/sIaEZxdeanTAHa5kcWIkh3LD6CRoe2z3HUctBWttulbkwXrGakJnNW69
	D9ghJmXWJFSbqwuyjWZcB8IRPQA+Lml+wj1S//l3KQZpsVc1dm6CiFG3Rc+9L3UP
	kTqiMEXrk/G05FG3U7nLMgge+3SLAdwcQLfTQjx0shwyGg+BGFaQ1ZH+vjCTpof0
	RmwGwg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9cw9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:12:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847e32ef4caso6187426b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 23:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783404733; x=1784009533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNAd+TMb+3/aBq6GaRC6LydMmMiUk++N4aKr66RpLb8=;
        b=eJBUnFNDHv5GDqcr6v5agHNgVbyV7Qu35Ke2n6DTknhpjKZB1b8GxqddetS6g3Zcne
         yRqI1zMQSqPMZmX1RcwRfiP5TRsRYBCEIwTS06sNTTdflqvV0X5lgKdtketHFyMdVA2k
         oRAF8GRH/ZEq96JGIixCuWq4U1BZenD1WqLUHhBMFiQw/1+mSEFB368iuT9uLUyaqwdu
         UejCjQK54YPoQsOQFX/MBh6oqqRXuUyQwJbr9fkGZHGxhE971L/LGrhPH9SKPnsX24+r
         cPNLGIWmn+kqHQ+q1/I9r2fpn7MbBaEsr4TTzLwo2d2FRo3RYuIwORjxtEGJD7fvBcX5
         MJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783404733; x=1784009533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NNAd+TMb+3/aBq6GaRC6LydMmMiUk++N4aKr66RpLb8=;
        b=Zm2PjIlLuJSALP50Qf42CzXmM+BAjPhZ1FbsQ0wVwWSIbOYC4VM6mcJQQrPjP46zs6
         XQScaEqSps1y9WBC7pv/Sr6JlQ6yvhO5iAy7OHr9yMtZctvTuGmLFa+S9iK1hTaAZouG
         HIdBYnKnFZn/ScRiC6FNineqwZsGdaZnvoK9Dzlq6rY2ZQgCFfXMFRJjwbn93E4fm3XV
         0cIiwtKfUroE7OLrM7cX5seCOmVGuaLMdfMmTyiQzLo2gC/v/VUG/4CFWKDAt/FZGdsw
         VGbF+tV42Fu+ae267m6lvuEA/aW+/HaJaG0Aqio4IFH6fPckByO0JcrDbaezY9dpcuTI
         K47w==
X-Forwarded-Encrypted: i=1; AHgh+RpQMm++pOmv8uu/xzvy06r15l8BQ45qje898pOkOe8pFvXrCMLe1zJqzGOUJlT09yQbFUYzkfB8YCPvMGd5@vger.kernel.org
X-Gm-Message-State: AOJu0YziPkpLM+R85HAVO+d2mbIvpkmVWQ3vBFWe7CHlgiTLIqwrYmI8
	McCz9Yes6W1cgUcQpUnzDtojJPkgNPSm8rJNiTD2hCM/zbyV490sUqRt5ez6m/6LgrF4uAPXLrK
	NqNnivTFpIFPm76YdE8QnmddRHW071P1OuVa323hAt6lNFf10nirPLqr/hs+UDU9pkm4Z
X-Gm-Gg: AfdE7cn6A3ZYiTo3BgYKEjZPucYUGcmNpJUjRjaGhc7DewbfH3zfK/h3aLf5RriuEOH
	GsT2eeCtyxVWqNpp0W6INdCSgqg8yiES8YQXnb72mJBspAQxMnyrEZU0TdgaI8OycMhxB5t2vjv
	UmCTId0e6YRdM7paN87x1O3HGckiaar/XWnv1z3oYI2sqnalaUrqAi2maRTmDuHh9w9yM681sGo
	RcG//5/fnPU93diNxsp/xZLAk77Zn+Yaf4RBT4pCs/UUT1ui3EppfnwDb1eZkekhJhqBcZx3XOR
	eW83mvxpuokbuJNOU8sYM1ZWkS4Uosi8IuearX7j9FFLxePWn6Ne0t8R9XSG8T4JBdaJFeD/r1r
	eZ/Q//7MEVh6CEGclXA9AkXVPfaCuPTjg2B13
X-Received: by 2002:a05:6a00:4b15:b0:845:e41f:9696 with SMTP id d2e1a72fcca58-84826bea1c7mr3416685b3a.25.1783404732592;
        Mon, 06 Jul 2026 23:12:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b15:b0:845:e41f:9696 with SMTP id d2e1a72fcca58-84826bea1c7mr3416647b3a.25.1783404732003;
        Mon, 06 Jul 2026 23:12:12 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8480da8bab0sm3299321b3a.8.2026.07.06.23.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:12:11 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 11:41:29 +0530
Subject: [PATCH 3/6] tee: qcomtee: Allow object invokes from kernel clients
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-3-f659cbd5d04c@oss.qualcomm.com>
References: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com>
In-Reply-To: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783404715; l=6471;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=/owlBkDPCA2vuWSbsJZD4eHZ9HPwNyiIkP0LxaPIwKA=;
 b=qVSk5YQzILNpzM0ym015Ib8Zv8kzB0ZSfQxbEOWG+KWwAhnIrI0UCTiT8HniolJ+5J3peNh0L
 Nc7cIFaLke2DeX7eI1/LDP0l1lNSmgebtPzhcxrZXgAduWzkonPhTim
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: OSCs2nZ7XATmmOk3WLXBs6J3hyVLepdk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1NiBTYWx0ZWRfXxPJQyU8oc6fA
 lPGXs/p2+ICckxa3zmVM67/QmcJ0Ba0WIxuiYeltPaMwcgBzv5SSJfBWfZBtj0yteynOtr3Lg3t
 MqKY2lQ/rW0QelURT1WDHdAbKVDWRxs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1NiBTYWx0ZWRfXzmBhfGv1rF3k
 hXTbOvdliQqkWGvYrtmlN/SdTplU9NSrtnOq1ZKQ6fl2x+PqKweC+DQvFXe2pSzLuvRDyMmv6Gw
 v9Jsrh4PhzQE5N24BIDX57+yXAHUfApIMIT4ObwlAay10AA/pbz8hg9KEI46nQwvubSaXISeRp7
 g9jjyVhspZa1dNf9lQrLapvt3VzTA0iPlKc2TxvDM/LHyDEnO5RZrj1riaQoNqjbqwbc7nbf4fn
 c5FPwu1gFM6XvTtqQzLxIbR1JaiUyapG46yRjzCxh8p2D5UrJYrwon0wTfVh/ZltNNW5e4CawjT
 YY786NwvWiKfw6LM5HisTa549tdxHjF+l8ZLPX+HHRJQLGC5KW+KmL6ol/dHwvI3j7lLkKh5prS
 CGpYBhXUhzAVsC594M5iWbXsX35exucHd7RIAsmRCf+MdujWfgg3Pr+NuxqCegt4sJ2Tfe7gjZY
 V4LHju80893kRXPK90g==
X-Proofpoint-GUID: OSCs2nZ7XATmmOk3WLXBs6J3hyVLepdk
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4c98bd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XyePUiwmHbEyLJ1dZiEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117143-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:sumit.garg@kernel.org,m:amirreza.zarrabi@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:basantk@qti.qualcomm.com,m:apurupa@qti.qualcomm.com,m:aneelaka@qti.qualcomm.com,m:op-tee@lists.trustedfirmware.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:harshal.dev@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 482EB717D35

From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

QCOMTEE currently treats UBUF parameters as userspace addresses and
applies userspace restrictions when invoking the root object. This is
not suitable for object invocation requests issued by kernel clients.

Use the kernel_ctx flag to distinguish kernel client requests from
userspace requests. For kernel contexts, do not mark UBUF parameters as
user addresses, and allow permitted root-object operations to proceed
without applying the userspace-only checks.

This allows in-kernel users of tee_client_object_invoke_func() to issue
object invocation requests through the qcomtee backend.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/tee/qcomtee/call.c           | 34 +++++++++++++++++++++++-----------
 drivers/tee/qcomtee/qcomtee_object.h |  5 +++--
 include/linux/tee_drv.h              |  5 ++++-
 3 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index a74a54d67b06..e12c1a6e72d8 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -202,7 +202,7 @@ int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
  */
 static int qcomtee_params_to_args(struct qcomtee_arg *u,
 				  struct tee_param *params, int num_params,
-				  struct tee_context *ctx)
+				  struct qcomtee_object_invoke_ctx *oic)
 {
 	int i;
 
@@ -210,8 +210,14 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
 		switch (params[i].attr) {
 		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
-			u[i].flags = QCOMTEE_ARG_FLAGS_UADDR;
-			u[i].b.uaddr = params[i].u.ubuf.uaddr;
+			u[i].flags = oic->kernel_ctx ? 0 :
+				QCOMTEE_ARG_FLAGS_UADDR;
+
+			if (u[i].flags && QCOMTEE_ARG_FLAGS_UADDR)
+				u[i].b.uaddr = params[i].u.ubuf.uaddr;
+			else
+				u[i].b.addr = params[i].u.ubuf.addr;
+
 			u[i].b.size = params[i].u.ubuf.size;
 
 			if (params[i].attr ==
@@ -223,7 +229,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
 			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
 			u[i].type = QCOMTEE_ARG_TYPE_IO;
-			if (qcomtee_objref_to_arg(&u[i], &params[i], ctx))
+			if (qcomtee_objref_to_arg(&u[i], &params[i], oic->ctx))
 				goto out_failed;
 
 			break;
@@ -270,7 +276,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
  */
 static int qcomtee_params_from_args(struct tee_param *params,
 				    struct qcomtee_arg *u, int num_params,
-				    struct tee_context *ctx)
+				    struct qcomtee_object_invoke_ctx *oic)
 {
 	int i, np;
 
@@ -288,7 +294,8 @@ static int qcomtee_params_from_args(struct tee_param *params,
 			break;
 		case QCOMTEE_ARG_TYPE_OO:
 			/* TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT */
-			if (qcomtee_objref_from_arg(&params[np], &u[np], ctx))
+			if (qcomtee_objref_from_arg(&params[np], &u[np],
+						    oic->ctx))
 				goto out_failed;
 
 			break;
@@ -304,7 +311,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
 	/* Undo qcomtee_objref_from_arg(). */
 	for (i = 0; i < np; i++) {
 		if (params[i].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT)
-			qcomtee_context_del_qtee_object(&params[i], ctx);
+			qcomtee_context_del_qtee_object(&params[i], oic->ctx);
 	}
 
 	/* Release any IO and OO objects not processed. */
@@ -357,7 +364,8 @@ static int qcomtee_params_check(struct tee_param *params, int num_params)
 }
 
 /* Check if an operation on ROOT_QCOMTEE_OBJECT from userspace is permitted. */
-static int qcomtee_root_object_check(u32 op, struct tee_param *params,
+static int qcomtee_root_object_check(struct qcomtee_object_invoke_ctx *oic,
+				     u32 op, struct tee_param *params,
 				     int num_params)
 {
 	/* Some privileged operations recognized by QTEE. */
@@ -366,6 +374,9 @@ static int qcomtee_root_object_check(u32 op, struct tee_param *params,
 	    op == QCOMTEE_ROOT_OP_ADCI_SHUTDOWN)
 		return -EINVAL;
 
+	if (oic->kernel_ctx)
+		return 0;
+
 	/*
 	 * QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS is to register with QTEE
 	 * by passing a credential object as input OBJREF. TEE_OBJREF_NULL as a
@@ -444,7 +455,8 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 	/* Get an object to invoke. */
 	if (arg->id == TEE_OBJREF_NULL) {
 		/* Use ROOT if TEE_OBJREF_NULL is invoked. */
-		if (qcomtee_root_object_check(arg->op, params, arg->num_params))
+		if (qcomtee_root_object_check(oic, arg->op, params,
+					      arg->num_params))
 			return -EINVAL;
 
 		object = ROOT_QCOMTEE_OBJECT;
@@ -452,7 +464,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 		return -EINVAL;
 	}
 
-	ret = qcomtee_params_to_args(u, params, arg->num_params, ctx);
+	ret = qcomtee_params_to_args(u, params, arg->num_params, oic);
 	if (ret)
 		goto out;
 
@@ -470,7 +482,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 
 	if (!result) {
 		/* Assume service is UNAVAIL if unable to process the result. */
-		if (qcomtee_params_from_args(params, u, arg->num_params, ctx))
+		if (qcomtee_params_from_args(params, u, arg->num_params, oic))
 			result = QCOMTEE_MSG_ERROR_UNAVAIL;
 	} else {
 		/*
diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
index 2528d07e4576..7bd6e23b038c 100644
--- a/drivers/tee/qcomtee/qcomtee_object.h
+++ b/drivers/tee/qcomtee/qcomtee_object.h
@@ -112,8 +112,9 @@ struct qcomtee_buffer {
  * @b: address and size if the type of argument is a buffer.
  * @o: object instance if the type of argument is an object.
  *
- * &qcomtee_arg.flags only accepts %QCOMTEE_ARG_FLAGS_UADDR for now, which
- * states that &qcomtee_arg.b contains a userspace address in uaddr.
++ * If %QCOMTEE_ARG_FLAGS_UADDR is set in &qcomtee_arg.flags then it implies
++ * that &qcomtee_arg.b contains a userspace address in uaddr.
++ * Otherwise, &qcomtee_arg.b contains a kernel address in addr.
  */
 struct qcomtee_arg {
 	enum qcomtee_arg_type type;
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index ca99c6b747a8..71d0536db60e 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -83,7 +83,10 @@ struct tee_param_memref {
 };
 
 struct tee_param_ubuf {
-	void __user *uaddr;
+	union {
+		void *addr;
+		void __user *uaddr;
+	};
 	size_t size;
 };
 

-- 
2.34.1


