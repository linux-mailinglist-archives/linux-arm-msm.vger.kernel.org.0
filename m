Return-Path: <linux-arm-msm+bounces-113668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a/9xNxLGMmpr5QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 18:06:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FF569B40F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 18:06:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="N/HxbGBx";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W61lymsm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113668-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113668-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A760132D13A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A831E3FF1A3;
	Wed, 17 Jun 2026 15:50:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DBE44E052
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:50:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781711427; cv=none; b=tdQUbuMcnYNs+UAsRVCXTq+FPumsxptx9+ncTbp2NLz7Ahw+WF4rJk7ZVECOJLqLwf/nTpc2bKLkxDw5vH0VhC9QZUZZF+PEyJjjB7sPFAmk9V/PS7sxLKXXc7438eIRoSGzv+aU/pRhFjxDHsbSj75Jptk94oY280Gc6oOqUl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781711427; c=relaxed/simple;
	bh=+jSSnKBCewKu2gGq3nZqT1p+QKl0eV9583wFNZZdHdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SKgaJJKlP8rofKP4/Uev+H/K8N8OcqpUn4PtlyibreKq6P0AN2ePzpuF7yflkEThY+D/UOgEmlgGwPy7VnUOe3xCyrlJE8kpeAMUHZN8Uw7DJ2DxLlJ6qjograF9HpNJEGPPkzjXvhXQwa6Xesti4saqe8Tbj4dfyBMPneFv7U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/HxbGBx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W61lymsm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFOeVx2638881
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MqQoQ693d9+FFoh/y5iAKv5cizC/RsqLEfYPTEBH9Ps=; b=N/HxbGBxaZtXlncN
	V5Lo+6q2kYo3H/7NbfIUhXWwknGbz+itmlYIrsRr6Lmf71m/LzMh1IJNg1OCS66Q
	5+EitSgGZTZeqnzIqTkgB6VX7FKHjIbuose2Byyndy+ktVSuJyLpc6yPPkzs7duM
	Q0xo4nXhOxh4g0NK4CwbQiGwNLGfbiw90mD3QFE7TXv78fieX+x2p9oapeYLcgkY
	fetqd64Qa2l6tPuU/NJx/U4nxeLyXFmNTwCknRzKnhqvmzgnzt4pUPdaNKCAZKeJ
	ff3dGcrbryUjIMmWE24opK6UdcjmDaNUG12rF22luod6Jq7stz5KbupPu9Lqb/vm
	/50Ksw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet3xfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:50:09 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59ece6adf0cso4378768e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 08:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781711408; x=1782316208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqQoQ693d9+FFoh/y5iAKv5cizC/RsqLEfYPTEBH9Ps=;
        b=W61lymsmpNxwBkr1S0LIG75Lztf73FUTd+2lz7whiiALXlqu6pK0HZAX/l+ZIAOCHx
         eXkkhShWw4JamoSYCHHVvVyUnEemQRolwH0m9U+U+5/b1aAiWwm6BPGsIGPD/2x6MxAN
         Y2NDHwcE79iHhpKQb2VAn4iGJoIfRwtow03OSi83cvAJmDumdu5KV+q8tczWL89V4zU1
         Htu1UsFReL/QnMqcWB0UDLU84alX7cqOlfGXIg89ZABDoqzjRG2+4f63TkDi+9zqhjmD
         /DvItOAy1ZuKmk29Qr/TnboonAQDXH7tfuEVFrtB8nH6yK3C+tnWBOSJTkRLPVFW250M
         T3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781711408; x=1782316208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MqQoQ693d9+FFoh/y5iAKv5cizC/RsqLEfYPTEBH9Ps=;
        b=Q4Ktal10of3mZMhchs6TuXXCPpsMzYWvCDOnMjIfRpjxBnr8NQmcKLKPiCye8lTA/B
         rZNY2FWXw+MgCLZAIashsC3pgpfM7LPTo5liUvJ1jAm0WCMX+dDsl6HhiMM7CX57bVnP
         VsALgJkV8aGZQTXxNSwDH6YbIkSOguaSst3W0xTV1TZ5tiQh/Vy7mGehnIpomDRBX8Zx
         Z07yYRJKK5fXXQXa3R+iwRu+PoRkAg65sIBOumTlgCzTp7ILFNJcuXy93M/m7ceoBPkP
         SjRQ6Z1+chC2Z4QGxLno3mHGKjL3533iIvWEjwgpVbE30yTkzBXtxK47igEN2vy+LapS
         NCQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/sjGy3z1/DdkzwmDMmVPIjsg01BKJq0WU/6rpVkWdsjqXv9UWLPT9SvRu0Un4JkyjIPMZMTyAOG7Aqy1Sn@vger.kernel.org
X-Gm-Message-State: AOJu0YzImCeAnE2T+pdBbqc25wS01Ta/kj0PgOttAWA0qonAugqbPFaK
	MJAkVdctcZKwBaR3ov5PYoL8ijd/jklYxf0KbZMg0ZQ+WZW9xsvmoYi0yN/bKbbD8DUDxtDMiD+
	qa45T1pzsYRXBPd4cCiC7tKQhj8hwiB0uhrg7VKN8yF7/EvDSLltfGXRNBlOj0/sh1rEr
X-Gm-Gg: AfdE7cknowDEvoxKvceg/B7POhlk80keuVmr0wZhezUD+hpSoJ5O41f3zn38zgdGcXX
	SrY/SgbQItB/ERKnHSodt1LRPMifcXu3S3QPlVOsa43HfHtA7NOHArD4IF7O8FVW2uAtJ9tB5Ue
	/aYpKhqVadxp8/0A0HEch/c4VvBbDDs32HAKKkAUeRbaXplLIr5fMHB4DfblVMkXh5Inwum4Wk2
	VNqBguuqiTnZALKX41gobudHJoMCVMa5YDKGYwTdeoQ9qXgLeDmMjvWyQ+jfZcNBBc7COP7WjOk
	4ESCRRfYAhSbYh7FxbpV7uvgxtqLJmdNEnAcE9ZbgnblkWxhnp6G4orPQzPRUbYw6pS8KmkglT2
	GaUol2I872UeSYPQHX32FN6QTIc9jqkA31OlEXGlR
X-Received: by 2002:a05:6102:b05:b0:632:88f6:d6ae with SMTP id ada2fe7eead31-7246ced958emr2598270137.22.1781711408369;
        Wed, 17 Jun 2026 08:50:08 -0700 (PDT)
X-Received: by 2002:a05:6102:b05:b0:632:88f6:d6ae with SMTP id ada2fe7eead31-7246ced958emr2598231137.22.1781711407892;
        Wed, 17 Jun 2026 08:50:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c856:25e5:e249:5e0f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa8b423sm168913195e9.11.2026.06.17.08.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:50:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 17:49:36 +0200
Subject: [PATCH v3 7/8] crypto: qce - Use a fallback for CCM with a partial
 final block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-qce-fix-self-tests-v3-7-ecc2b4dedcfd@oss.qualcomm.com>
References: <20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com>
In-Reply-To: <20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+jSSnKBCewKu2gGq3nZqT1p+QKl0eV9583wFNZZdHdE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqMsIch8tpiBStthDAUU24QVMgye77JzbUAq5Op
 qWCBpfAnlmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajLCHAAKCRAFnS7L/zaE
 w+39D/wM+9RDENz4MqxtM2MPVmtn6p2LDKcYrIUoafXXJuRjUfaefZrg7OUwKEMkF4IZjJ5R8fR
 LjOJlT3RcYLFe58nFc0SiC10sTCXBuZzJ/6vYWkRFw8SUsvr8dyBTCbD+MiOpQWTx8zU8+3wjbe
 YhXZ4kCYcYSnRlnJMLGuP0U+0cczoJCTm+x9NxYo4+HifutPKIloCdlXJSedI1xX5PKkUWiivlF
 ggUJ7/haBIpR4/t1s8lFNLa/25Ony0gJwCojf2sK1i9/At68oNXYnEMBMteZCmU9WQeszMVc2dk
 PJxKiC12gy2bm/jrEA7i+zCxClqUlfLk5KGCutTRGu5dltmvol8xd73aEB5aqx5sSAOy9jYZnvM
 /9fj2aRLKSg4rFWeCxff9Y3gTLM0SwIYE0p2gOJ6KLU+1XXGSsIx0KCT2f2TJNhiCg13hbu9Tfx
 SS9OHW2jrBo+k/2RA9qXUIsiSTgbprvpE5SNupDBrUoVnjuLEVoGOeDZ6D0+rbHBdW6Rqw2KXoU
 atEUfQ426HPuaF76wThsq6uO/o4FNZbpLPJva+SfRz0N25iFG0RrvVyP6F8Y6PqibELUc23zbh7
 3I3OUmWR5K+NlT6C80VzOCoJG0/TP31QRdpg2zsqO/9Qrt0qt6moKK/WyJtLsaTq9bVivnTcBVB
 sKu4nxWFnmb7gbQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: WQKHOyQvlGXUIoHEF9NhF7-lQ6urJMhS
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a32c231 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dx2SfONCXZg6tt9xEGkA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: WQKHOyQvlGXUIoHEF9NhF7-lQ6urJMhS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE1MSBTYWx0ZWRfX9FvarSS3kQ86
 uDKlRKWbM2lHAomIumPBMsTX+eR6jpN+qJwvLRTjAtCXuDJ9Lk1HDRQJU711ZKkvN2dfb+bJIV0
 lPxm/mHCnrNmdOnG0WRMtqm7cdzeNDOMpabsAuNzGRJl9xK3Y5mxF706Mnk6UM9mNmp6HsU4FBv
 3ZwudN1NiIu3tSrSHb1ix2PrrZxhonMl3Omp7I106aJc5ZGAC0wDMvyYQi0Vio163PhqsBYBSQS
 5WR/mLe8F5uRDwmLCO0uqD3MepZDhQ3WINp1PXi23RrqS/wiAj6aydlYuB9K/sPkcNGlBHpnQsW
 fuC8AjR895QEaijtGLoVVTzAQ1ADzQ+GMTznM/oNQXbaGLw8upNj049V3HRFCLcxibjHproIGbz
 j3lN0RapBBqVTIawaH+yYxsXTa1keBd06jn8SgQbGmIUWwsBRs7nERNwdV8i84Bmi8C01bMPXG9
 re5uKAFLYIi9WZ9y6Lg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE1MSBTYWx0ZWRfXzuPVxR0MYu/p
 txpIRQ1xBB0jlHRSDDlaxUmJCEnmTDbYt3BEILI4EIToas21C6vX+ORuR6JOp7GScBhQ18gW4gN
 O6jvpq4Km/AiUBKirXCb5/71JyJq1RI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170151
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113668-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69FF569B40F

CCM builds on AES-CTR for encryption, and the crypto engine stalls on a
partial final block just as it does for plain ctr(aes): a payload whose
length is not a multiple of the AES block size leaves the operation
incomplete and fails with a hardware operation error. This was caught by
the ccm(aes) crypto self-tests.

Force the software fallback for CCM requests whose message length is not
block aligned, reusing the driver's existing need_fallback mechanism.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 336614a11377e0be246817da584296124f4de5d8..4fa018204cb628c112f64c45ff6c7407df73b945 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -514,6 +514,14 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 			ctx->need_fallback = true;
 	}
 
+	/*
+	 * CCM uses AES-CTR internally and the CE stalls on a partial final
+	 * block, so a payload that is not a multiple of the block size has to
+	 * be handled by the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
+		ctx->need_fallback = true;
+
 	/* If fallback is needed, schedule and exit */
 	if (ctx->need_fallback) {
 		/* Reset need_fallback in case the same ctx is used for another transaction */

-- 
2.47.3


