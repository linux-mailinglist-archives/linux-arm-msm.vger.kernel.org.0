Return-Path: <linux-arm-msm+bounces-117419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rdMQMil+TWpI1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:31:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AA8720142
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:31:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eh2VFirS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GeJAIYLH;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117419-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117419-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C66E73031B44
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 22:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD7F4963B0;
	Tue,  7 Jul 2026 22:29:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CCA492514
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 22:29:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463390; cv=none; b=SLePuRYutuiufSbECDTqGzYXu5tUcHSJPQ3FLd/kc3r+4lusDZoSrFtg8zTuqlhMiekCobTVQvIX2grCzQEHVkR4z7V0NkceRkZ+IwaYKt3pFKJZm+6dxWBQk4JcYutFt0IH/jzBzM/av8EGoKhdAS8KBHl7/Lbw5aW2Q1TH/KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463390; c=relaxed/simple;
	bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OKMviPv/vPjFxS0bWFmpFAVQMqTfT7VixGI+vZPNZHXtiij7kw60yVusYg7e6iecdALcpsyylJzNqTHw1H49jHYw4BzQkjAEZzSRISM5Pmj5EhRecixJkGauiBI0QoO2xuS3rkoQOcGEHTwvvKS53t6RsOj/J/4wJiqrt7TaI04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eh2VFirS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GeJAIYLH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5aQA370376
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 22:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=; b=eh2VFirSp8hsmcxN
	kzto/3rotun+g/QFxK8d7kohVfpw85C7xdbmXzOEblFacdX04JTBHcbQ69sl1xGa
	o2kEPRd4KpF62ioyQ6e4li9/k5Zl3Trnh8jr3Vl2rzokkt5oXMpi/XoMnR2jZwEQ
	9bIBOtWGnT9EVFLxEULDwH3vhfWaRDGbUrQrQSmeTZ+v8OzgsG+dcwJZwmZldN/S
	xcafBEbodTlLh+0MauUt5xRaaQRE0CP0yeVEaC9yb7rHNvAmgXJOYC+fwpQXEJcn
	yQmehrUE86gUk+lK7zwUKkoj79IVbcjp3mw2v0GYi3E9birhhdgRQzx2+YbDEah/
	+q1oLg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun3q65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:29:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737f1f1e1bbso10099137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 15:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463387; x=1784068187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=GeJAIYLH+5om5P4aqZGy1b3YPijYCTJbJdc1O4HOR2Cxjhj8n1V0AYGWfg6FPvYy2D
         27PrtHrlOJj5H6GcvQzswTWKW7TeeAkAvMzz2ZIz+S+6bNeRn85GZYnRbcE8UssdSXRA
         6d6UO9W79sR5qKWoGYGwyKTegTFRi9FUdWDZZUHXCVCx1EDZuvIK77AusoLNOQY9TNlD
         Ea/oXxHIXKqgGcGtrIHkBcAlDU5VznL5y7SuSWlLG/CxpTcUgmMhhceCfvxQFRb6KHh6
         Zw+cHZY33ZtPIErdMskNPCpFy8BugmeKtRKH0v8FwTECMrzWZ8iVLa57NNbTLYZudkNu
         FC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463387; x=1784068187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=SifJULgTXCut3XW0DuBeFQskwNByIT6IXoodP8SzWEOdT6ovaTP8raP+OX8TxrRvvO
         5OmObs9w8KbMgLEeKHo6k7c4ROo6okhVGmnRgMjWs1Q+vmHncH+HeFZbvyzTezw5acER
         IdIpMuxEd313mPCv0hUQ81bLX1kCx7DTCTjPwljO0P1QSbE9sTHSuysdC9CzsRQ/Ebmv
         RRENFxHhyhefe2SKuEKIqmG8ZAqTvdEFnSPFIDvtONeOIxZXebmF/iYopiJ5//C2MtkX
         URQODgdGOX+WX6hxB6wtFSplwd1phtDNArIzHA81XmBNXbRIyjYG3vD9faHoMc57oDwb
         mcGg==
X-Forwarded-Encrypted: i=1; AHgh+RrS65uN1rVyE8xvLzQnj5p0g8ek01Rj/gmEBDJ0T6IIx5EGEfZr55ytMFBN1raDP/oJAHDiJIvfzYDRk2aK@vger.kernel.org
X-Gm-Message-State: AOJu0YyrZvfg8VTGjf0gdsKJK8xAG122+/uyNvevQBCUdbiH+xrcEjcD
	xmD7X8MmNB7K+He6CJZpzCttZXSY4eteFJGrbUjWzPXZmxGlO4UceIL7Wn8CIwMFEXO+xe5fQ23
	0DjHm6OZC05qPERCFjp6dInq5yfhODcyqqhS474O0aHXAbvOhd5e2XPiXnJHrfi9EYzpj
X-Gm-Gg: AfdE7cngHQsZeyezX1jjPaLrpEbalNH5ETPBzZ7cnMPm1dp+l82mJuTKHo11im/ETHM
	WiP7DGINz5edLT4qklZoNYqXxMEDcjmBBuz3ULhtnbdVXaasHfLrDEykMJdyql7kS+JgD8cqpPI
	sUiWAqlHsuYL0Pcx5MqXG3V49CqQVd13PAZ2+oJCL1wM6K2En29lAcvU+NuNn9tP5a/w2MuDmje
	rEjcr9JJfS/CYbC5YeyntPgwYYlPmT5pwaZohuCNsGfWfk55pMaobPvCpndzuFPZBP0/Zn3MMK6
	L8ujZzAPYWa5ftOA3z9wUcKBL7vRNcmCQ2bWVrP8UiKfj3McUh6v2+eAlIc2Mn9Skx4/jtlnGC3
	OiiY3GiGikYJvXEWjq8I48lUP0Vry93M9w1rj/p+HUl3qYdEBDKIAOnUDDs4/D9ynf7CgduKm2q
	IWlfrl7yBGyUBBfvwGnIvgKHJZ
X-Received: by 2002:a05:6102:80a2:b0:6a2:b2a1:f16a with SMTP id ada2fe7eead31-744b79e73fdmr4142723137.2.1783463387218;
        Tue, 07 Jul 2026 15:29:47 -0700 (PDT)
X-Received: by 2002:a05:6102:80a2:b0:6a2:b2a1:f16a with SMTP id ada2fe7eead31-744b79e73fdmr4142708137.2.1783463386773;
        Tue, 07 Jul 2026 15:29:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:53 +0300
Subject: [PATCH v6 10/18] media: iris: skip PIPE if it is not supported by
 the platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-10-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2pL95t9jQq8lNOF/M+OkbJVqioBQ+JK2X/R
 IN4WGUw0YSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qQAKCRCLPIo+Aiko
 1bnnB/99M5CcOuO53dfh5VDAPsQE7i6gYXe90nCIaXeBv6uDxp+Al4Bhx6r0ca8RCoLzi58dvDm
 dXMyaDFuLUfbgFUp6ZDkI0a5LdKjvQU4snIDKC9TGc5lsONjzXy0xrx69am6ucmm3XemoOkZgo3
 ThJM+eZJIQlYB4zq84zA41/gi0rwMbS3XGXSGNy673OlSPdE8UYNEMnHWL+Nmn0mbZuF1GkbJcQ
 wLimCs/T/KuUCZ9lVViYpzpRx7c5yzjRhf9h5/IEiVxcTIEweygqAodcj/4/CV4OSdNXy/eTkEt
 MwLs28u5goB5hgMTwb9RxflEosHqdcp3eYmpIReNYk0WYhzk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX/2tLFu/KNYoS
 3bg6SY0WkOJvkZvbRcJJz9sVmk3lY4d4X5NXIn19Z/5y5oIgZL5kciVc/lLeBTrsyDLolQuRdLn
 C+DvBP3Sdu6zQX7co4YIlcem1sWmKDk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX3hIV3IZWS0er
 BzyqhnUbyrNCGn5XrxLcbgy0QXJgU2cQ0UioN8J/xW71rx0vNaQ2/fIrKlS/QWTf98K6n2clXT5
 9QM+WUnX47skGTolcOntzHjrOugHlyqKJeMBQRpvSJCKCNZbGohUx6Pkq5gwdPKD4W9cAqsjeRu
 RwSdnyrFglgc6GzUcwXynkXWYkViXZEY41K894O/t6ftpk9wmHYCJU2Cb4scHIw1K1vhYBaL2bI
 DTn/1k3hgKjp++O1F2Rvl+QVcpUvuGxaU6jUyp7390E7FaChledEl01JuzaUWHL9mfowyN0jeVF
 U4zvEvPpLWTP08iED4j74luga7Php2Ithn+FGgzVUTLwEhincMkaczNJII5k3hVOb7XMPP9pMSO
 s4k4iYu/ic5/e7dcxiO3XsqYimjzN8uab1Ob5VhiIZMkRIm3HawtXjNuYqi6o4li2ZVA/76sDF1
 lasquUdVtdL42/8/p/A==
X-Proofpoint-GUID: wFvpMkGylIMJQ-4XM8H6-snnmFGKZ_YX
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4d7ddc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: wFvpMkGylIMJQ-4XM8H6-snnmFGKZ_YX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117419-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77AA8720142

AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
won't have corresponding entry in the capability tables. Let
iris_set_pipe() silently skip propgramming the property if there is no
corresponding capability.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..33a34573391a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -534,6 +534,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
+	if (!hfi_id)
+		return 0;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.47.3


