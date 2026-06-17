Return-Path: <linux-arm-msm+bounces-113666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kVtLA+DFMmpe5QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 18:05:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B1C69B3FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 18:05:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=i+xhhRdA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d65cGpZB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113666-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113666-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C835A3081A55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC624B8DEB;
	Wed, 17 Jun 2026 15:50:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5884A2E14
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:50:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781711421; cv=none; b=LL/kPg8TDJQJ0zLiquNm1nGr2j32POUcQkiUEcxOwfdbeJbO6y/lgCrxylIXo/hPyrEEtGQ2KOFK0x+mzyn5Ci7fIrKSlgH6XxrCMeIWol3TTrzzLpQZXlfULLd4D+rjFbZZuk1O0srvXigrv9yFprg6v5mVIeN7FTcdT6t27os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781711421; c=relaxed/simple;
	bh=RtzndF624GK+B1S5N/LG4zxmfgm+M6mFqK4xoHMGFj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cUjiMgm9w+g1kSG29XAdundM/gBKSRto5F5QMESnABLStHLn0lMUW4t26eQ+nx48E/dpwoTntq9RZnyqMix8X/bZJZN8+UKQcETlGUaKMbe8CMK64SCUq+DaWzjDcbpQsYyW9tKLID4Xys4yWjcfiu0uWfEhJ5QtMjU6uZZGt/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i+xhhRdA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d65cGpZB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFOj6T1177851
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w2vCsXE7toL/jfvcCxsJrt+2J0x/Uao7L2OQT7fWmzQ=; b=i+xhhRdAYPkkQAU9
	WG2eCb5VOGbuYaY8USadBosJi2ajcilPeWARonxUWPCJyDmOqt+ktVp/Oz1SmtyK
	I5j0xwzLA/ZEcp56u0agydX5sD8KAAO1kzo2mojzER/jQ9HsErvCS9EXQCchARVq
	fZfW7C915E734aD8MplB5bth9BMfHhy9YxhLWNgA1XKQs7LP8poM4ywl3xORYTpr
	0FxDEDICkNQPdhdEJjMmi9oud+iCmcHxAqt25+ViggF16AnGtOhkRXZVxaBevzDj
	vO0zh+QHXLyarTo85HwEHU+ngJmo8xbusnD1nLBMBF5kGLCYy5HlvTGQ4bDcLOeI
	gdsS7g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueepkxhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:50:05 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963d24c3886so4911747241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 08:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781711403; x=1782316203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2vCsXE7toL/jfvcCxsJrt+2J0x/Uao7L2OQT7fWmzQ=;
        b=d65cGpZBzo5HV2AV8VcOdXhgaog2Ijimh58Kh/8dTBE3fLWO48QSxnya8ve2qGKCQ0
         eo4hpEpGxv6eRP9Kr336oHz73burZbL55nOs3At7YiVz9wzNZG3mHk79KEXhnGV3UH1o
         P2EUnVogMqcU5pBccdSynUEolj4OofuLcOrrGdBUiAaEXM0mrAPkI9C3eLX+wWLF99dD
         AslJ8kQlmL4qH5hZbz2ta5Z+K5eJeItAJknwB8ppOhHEePDp48sdtDl0PRJxbLG+BEOj
         7IGFEdfOwGXMDIyIzGdbxsyK0Q3hPNqHAxt2pbQZFa0yswt3mWMW3Q1TwcpXHnVzZZtP
         5bbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781711403; x=1782316203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w2vCsXE7toL/jfvcCxsJrt+2J0x/Uao7L2OQT7fWmzQ=;
        b=e6WyhYWJMIm31VaZLZ7eqNpN3i9AmNqT3FXWgp6UAX59nm959lt2O982S7LLYEcAGy
         T9Q94N/JG4/FlgLGYUzkntc6swTYMi969bmrO//aFlRUisfQaU3mhE4fxoo18DXuUZVs
         KqaX6bjjao7twxADYgI/Mae84HL0Htwg0he7KmL59/V7iU+swMbgBSo40YkJXo8Ci+9S
         HViZUvixgUeKjI5JfcGyhicsGVJ6efAvCIGP26+ASJyDlt6rIyyFY4LvQBe1RrsCUGYc
         NH9WBHao4M1+O15eYvAPmJXXr4M9al8USLfxG1QSJD/DJ8mhNb+3suCQLqJMeRKJU3qc
         0VSA==
X-Forwarded-Encrypted: i=1; AFNElJ8NJcW126asqeQpPI2Zoq8PLI+RKuLTWPcHk2ED3o4Y1zMgLEaxajPGK/DHaHDoWzDMGqwBIv1JVzMAbVly@vger.kernel.org
X-Gm-Message-State: AOJu0YyC8jQTvigxt+plW4OWO7l/kowWZkwGCTqvUEOWT/jwX0VRDLdY
	hbvBzpc9G9en7pwoeq258WjyYDAHOCKdJDciNA5PF1U+J2p4/Oe2SoU62BwTBtZmPjxtihscLA0
	gxuBVaPHC+uQOUvRoVaXXiSlTMdSHnkWeMMnDhSh23f0IL9WI5cdW7hqZPz9+sabE5DCY
X-Gm-Gg: AfdE7clWomWkERGjMMD7KPdwUfirHYMahV3P48Quoqk1gwprdpBX7SVRV210duiiI9t
	g5m9QrtJp6mPWxl6wgICHXf5OMVuJJJCd4kWm/ZY4nXQv5XFVkPReeSxgxdWIznWqfCBa5lCcuE
	4lL1KWAlWcQInWKec+jh/xVSQJNRCAhHLG6LM6l02PyHsKkdXZtBUfPL6A9dXFkAf+O/tWbjS9A
	/xzfHQ5jcroSgMnuMslootfev/ed5uFYG2M7W1iq63w7PfTfn7fzvUsKsVTnkfjuxYldnZzIB3g
	wVUwe8UoSsFuOmOHRC1wCJsHMzACqcA9bJMYFMxZzz3qSWqWDtN5RET40hMytEENOj7H7xyRiJx
	pQClwBVC9xBx0Ln1fLZiThDz1Aka5cHahpui1Qy4l
X-Received: by 2002:a05:6102:5107:b0:6da:1341:1147 with SMTP id ada2fe7eead31-7245d3134cdmr2866763137.1.1781711403457;
        Wed, 17 Jun 2026 08:50:03 -0700 (PDT)
X-Received: by 2002:a05:6102:5107:b0:6da:1341:1147 with SMTP id ada2fe7eead31-7245d3134cdmr2866724137.1.1781711403050;
        Wed, 17 Jun 2026 08:50:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c856:25e5:e249:5e0f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa8b423sm168913195e9.11.2026.06.17.08.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:50:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 17:49:34 +0200
Subject: [PATCH v3 5/8] crypto: qce - Use a fallback for AES-CTR with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-qce-fix-self-tests-v3-5-ecc2b4dedcfd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RtzndF624GK+B1S5N/LG4zxmfgm+M6mFqK4xoHMGFj0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqMsIaPVBmp005T8Z6Gxz9EUFgfWYYjDjjnKYdd
 QEoLL7hEcmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajLCGgAKCRAFnS7L/zaE
 w+dHD/4iKa04kAs924QQRpb1Ju6pOTQcRxikg3+yXMkHl/VlM4I+k0OJiAc5LHjHkXKPFLR1fDA
 K8rBBZGXX9ygIFAdXpT5gZgAtlGKF6xOpL1+VuGX1bSluY9Oyr99LaWemhQR18Wrtv5weV4jkzH
 ikogG021RyFeVR0ddfvZq7haTKiRVn1gmXizUK1cznSA9qC+CRt2gjn0hNILgiOnsSLFNX0y3a4
 1lEzeaZGrlxnQ7KY9XgFG1tMqBbYQqPew+CWvN47XRS9oNh688IqwmVkRTUnYzatxUaRYTBrFSE
 9Mt3ankwBv9VvE7ucR3oVMBUaYxmTixRSnglvONpfMThBCDPOlVI0irM0nwrQllrJbJwUJlEx+c
 pXJDum6E5SB+KCYF1TxHqo4cU+tSG7y2uFgJGHgCY9y2ZcfoYgzuZtdbTxtmmktqEDxZ1YRfuIE
 lxCZiIWdMph9R0B0RpYxnRyW0+8kC6g/NExx7X8qyhQIgt8RbuAX6T40siHbrEy524M2f7mvKnT
 wYyxoyaB71HpybLvV28W/IPA/b0UZ+HlthEN/UNr6PafkJb3fqGuy94t4LgVXcy1xQrx9O7D3GY
 uPfDEbfoEz0eYMzI6KAO288JefLr9K2qcSMgivegaRu/51rrT8jjbBY/rH+gFiho7NM+EUlSB5I
 hAJw/DpBDbQbsug==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=AY+B2XXG c=1 sm=1 tr=0 ts=6a32c22d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vUpbTSJP45I4i0_vGVUA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: H_u3Bcmuu5ypl6aNrHjmeu5G9W6i-DQD
X-Proofpoint-ORIG-GUID: H_u3Bcmuu5ypl6aNrHjmeu5G9W6i-DQD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE1MSBTYWx0ZWRfX+z3WfwLrdni6
 gJibkWpmE0qGa8Y/WNThT6p8wZeaTWBfnJHEhK3cInq3JkA5cCgOYBaVVekch1Ugn+ILoZnXtUx
 EU6Kxsl6c6hRyxWODz5KJaKtU/CKeCjEOfJ/YwqTX1tE6yF8RZ5IDMXbPmyIKko0LVUSyHd1LvY
 dg7KoUVoYLrayNgWf/Cn9pmH1MpqeEYJlY7+Ilotb8CoW71pjoIxFHhpE1+H0+FDC3A1aA1/A6J
 a9yWU9DCYJf04P8UnhIvES2CgfuVZ66/tRCU7SzlCpcvnv39uij/SlGYeVWIo4v61aBS8mrNplE
 /+N4QGUtxGw2irk6zW3dWn5Njtrf08gAGffu1cqSfQ+9cx7Zv1+XRL5NrsvCoKnYxUcG5bnsBQ2
 sHdjE8KAdNkXzouJpDtNZoePPTBhB9LcZ7jibxSByZ3nvgJTBTbby1BoAIdsZfAP+8TfYFkUJpz
 RlDvPT8jjWFcbRdBe0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE1MSBTYWx0ZWRfX9FWP2h81wFcq
 vXxZMayNlVJmyDpVvZvwQdmuNjfaXUzfYqRMZBTquMiw0Uib7ElkPdMJ4DBjqLVZNKFDLTleuCZ
 7H9JlVrsDnOiTQZU6IV/04cEdj8nSTY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170151
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113666-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 57B1C69B3FA

ctr(aes) is registered with a block size of 1, so the crypto API hands
the driver requests whose length is not a multiple of the AES block
size. The crypto engine, however, stalls waiting for a full block of
input in that case, leaving the operation incomplete and failing the
request (and the crypto self-tests) with a hardware operation error.

Route AES-CTR requests with a partial final block to the software
fallback, which already handles the other cases the engine cannot.

Cc: stable@vger.kernel.org
Fixes: bb5c863b3d3c ("crypto: qce - fix ctr-aes-qce block, chunk sizes")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index ace64a651f56ff478bb4966d74c9e762ade37ba3..118a6878a76b1e86534f60e5d2058b99a689302e 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -260,9 +260,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * AES-XTS request with len > QCE_SECTOR_SIZE and
 	 * is not a multiple of it.(Revisit this condition to check if it is
 	 * needed in all versions of CE)
+	 * AES-CTR with a partial final block (the CE stalls waiting for a full
+	 * block of input).
 	 */
 	if (IS_AES(rctx->flags) &&
 	    ((keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_256) ||
+	    (IS_CTR(rctx->flags) && !IS_ALIGNED(req->cryptlen, AES_BLOCK_SIZE)) ||
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
 	    req->cryptlen % QCE_SECTOR_SIZE))))) {

-- 
2.47.3


