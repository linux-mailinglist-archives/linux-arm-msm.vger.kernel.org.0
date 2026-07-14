Return-Path: <linux-arm-msm+bounces-119029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7xouDKcqVmoh0gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:25:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C453E7547E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:25:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nozmJ6Ev;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dHVYUAzX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119029-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119029-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04D1F300E298
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 12:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A445444B67D;
	Tue, 14 Jul 2026 12:24:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36B1445AD8
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:24:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031877; cv=none; b=rR/dZOWEzbwXXVhzwDPR8VsyJ153EzkZ3Q54pBzAF7VYEAC8BdanqE08X/70UfvJU8FMyozO53Si7Cv0kxtKhds/xTUcKv8raFANBhpAbqrpmYislgTXDQRi0cp1aLyAj+OEEU3m2k+cttoI9YXEze/HlNfV0lpM2OuZMqfmJGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031877; c=relaxed/simple;
	bh=Sn39nASDOcdWm18LnDCxP8IPtZOVGBBqWB9HUJARVzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ubTBdB/IshtRam+Pz51nr0NEFVNcEww+PhQ4sqhJXm4i0qYbe57mZXoq1ABr5g4VUmIJWUB7AfNaIJkjAtIOAzPZIqK6oGjVgop9A4ZWAAsCuDC698pAvMXWz1ii5fJ/iVoru2g8AWVY7J9RGd5dLdEeA/RszuIR1qhIjTVUujU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nozmJ6Ev; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHVYUAzX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBNrVT328467
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+NO4UWz4w4jtTkeYxujP9Ux7n5NsoAtX1Qkh4gu9Lk=; b=nozmJ6Ev5vj77I6j
	av1Oq0ujJbt0K1rYntjh+tJEeth0fYEpiBmuMU1oVmAhy7vUWc2+OKD42ejSa9ZV
	KjlHaNjIUidYTw4P9JWxVvf2TQ+u6zlbO9XJkf4FYZd5gwayViEz4NZgnPXn1c7i
	A3Wvbdvp86bQuynnfkXZAewsBL7MA4Rt/Wvg/yciIN7no6lt+ZDumt35+fMu/Zxl
	LJZSVCyOEKc2qoIfyOgjzk/kXeGr02wz9cMlimdqlkCRNKkq3Clbf9QWmfqktma1
	XHiU2A+/NOC5u7RZG07ZX5QEuqiEYaH9TDmRi5W4Ko5mn6zhdarScwEvsbmjIp/a
	w1liXg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgeq14ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:24:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8b0a08d2so55196791cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784031857; x=1784636657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+NO4UWz4w4jtTkeYxujP9Ux7n5NsoAtX1Qkh4gu9Lk=;
        b=dHVYUAzXoxm16sgx/ZZZ63YjWoIVvrnSvg2ED2isZj1L/T5UdRQNgpHruR4+v+M/np
         6h0fIo9/VW50HVA8NlOph18drjG1eV6rklCr5QRNAwvtC4zVdjCPX4IdSP2wtc/+ZcW1
         AEK/H6D/5JlYHNkuK6YUnhQMStjXZUu8mCUbSj93V3ZUBEPYRQT/KX39Rz2XDHM2/JB9
         pszVBrkSZz1HPdnYmQy3p8Tbjxr0zizeNI0kVODj0d/5JkDja41N6v9+8IxtwJaGGlte
         JS5U/TECdfVal1i+fdFkR3SGZJwl40LolKQ805eHTuxIhEkbevKlW1EUhe3XUm/okCpd
         hNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031857; x=1784636657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+NO4UWz4w4jtTkeYxujP9Ux7n5NsoAtX1Qkh4gu9Lk=;
        b=adD2121EXL9y92x2QB1kOjXhc0Qv/hRpyUwQxNPOV1ijB3CIJzjhayLRO6Mt4uvJeI
         au8djqHDT0Hd/ddN1/OCFbJEEvD8lGev1UVAN4hHgHsoU+1wg/Qcu+FRAyKTbOgvHW99
         5wFDyBk9KLDR/a4RPJUEMLYbJd1nl7tzNYJ/uCrZi5dm0KKUIxeH8+zbiUV8FUg5vDGd
         5rDBZM62HUmCmMrn+WyslfqLvp65iXrsYsF2l5qznwG613f+oqwIWd4RNWNyraTL0VPj
         UQ4h5PUJYd6CA+ER12puJjcHlFpJtKTMN0QAmyTcBm0veVQDETWAdrFgWO641VzL6rma
         ZWJg==
X-Gm-Message-State: AOJu0YzMbJblaNMYZzmiUK81LMHzz37wk6e8/zHNjxKu4LQS1IZ+06b7
	MWTGPT2pndg7pU8kQAeZFPm4rtAOP+pMvQpPvVn9VhaMAJX+pmySew63cw/wKlmrYVHkBHQ/5vs
	eVl7e3LAZo7iN2sWrHLOZbi8dhckU4iVPLKs9B+JyW9yfaYqJKL/40dlzdI/r08uQTYUJ
X-Gm-Gg: AfdE7cmi7JAR4/z5s3tcYscW8UXIruz3QBgso+VmyipE0byM0Ny87GSYqPrWMwesSh3
	7/veQvFFKfFxRqqvEn1Xov5E7Okp0V3rkvWBdhbfNn6AUztuw98rg1XvdjDIjL81MVTvZvBho7r
	6Kxlkux06OPHNEDA41teuEEaR6omVphucqz1RTNn48INg/9r7nrPBuATmXs0jUZ7Rd+9cOZzVUF
	fHG/HnUA0EUZtzQ4FjbYKLZ4eAvfNcAOnsxedjt1LvTlXGaNbtS5BGI+s37x9DoxsME4pUY3AoU
	5aCBhv+UTjkHlZRQ5rPjIXEF3goN7lAQTBy9QL6DZ69yJPghr1cTkMAf9ET2lpiGh/WDzMxmOqj
	hHcZI5dmkYvDOLM4=
X-Received: by 2002:a05:622a:22a4:b0:51c:241f:a6ef with SMTP id d75a77b69052e-51e3c33bda6mr32276401cf.70.1784031857462;
        Tue, 14 Jul 2026 05:24:17 -0700 (PDT)
X-Received: by 2002:a05:622a:22a4:b0:51c:241f:a6ef with SMTP id d75a77b69052e-51e3c33bda6mr32276041cf.70.1784031856856;
        Tue, 14 Jul 2026 05:24:16 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm77031845e9.14.2026.07.14.05.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:24:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:24:02 +0300
Subject: [PATCH 2/2] remoteproc: qcom: pas: Add Eliza CDSP support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-remoteproc-eliza-cdsp-v1-2-32eb7a1f2c59@oss.qualcomm.com>
References: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
In-Reply-To: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Sn39nASDOcdWm18LnDCxP8IPtZOVGBBqWB9HUJARVzQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqVipoYq1P6o3aQNAnpMdgHCQ7V+8ecxfIkoeDA
 /7Pk1M5hHSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalYqaAAKCRAbX0TJAJUV
 Vvm+EACGcF0d44c+WyqiJLE7Zw3TAj/WFCxjg04TRKwznwyLomnBhcq+2Q41KBGzs+afiH+Cf2y
 MFroc0GFNvYFA+ojzawX556jI7TSBlQVKasb9CgsxsQ8jj5sh5vcX7G18zzUWW/UjP5CytS2qtH
 rcShZpJhHqQbCHaJSgcafsG8JfpBkVnK2FdiSu+anyQez9xo4J7AFkPyFxrtOnTeGLfF03mZziR
 pXGJ/0inkPlZb1eQixJ0qmflir1P74k61NupGtAkHF+AVbJlwmtSQFjvpNLBF7lFfZXRYUo7rsu
 9LvDCHT7z/5o49Ns33F8QuUM60sh5UvJ7hWgsPuYyJ2QOGMTo+ABUcbjowY54bC6eyZAlOxUFJB
 cNnvzQl7O7s/dvV7XmMipyMlINgT/9h78O1pnTH4Ex5WQVPtKg7IoRgMZU3QrhgM8XeoyUVX10f
 Y/G1PA8vN4N5sjJ2s0bvm1HfArY9rRN4XZe4oBVixiuj4BmpESuSss7iXWnRgYC+vV0X4guulQj
 llvqm5JgA2ToSjAFOmiLaC2fxdLsw8tdcXYKlKrMhm+yimsfAtLnYR6iUfl8rKU3kh1kwtEyK+c
 6/BrxmHHAw5Ze+XeJSIDYX605rKbpgfWnNEIxFLkNJ4gYbfd/uEAoaejHGUAL+elVN0ju++uztV
 WnwK7i6Mz5jiOWQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyOSBTYWx0ZWRfX8G9rcTsM+KRx
 ir0BY3JxU23TWt6Rph46CjVOntVx4XOv0yIw7wb92FaSIfhU0BdwihCUxU8paEwMjfXG6ORQ4aN
 7F3JAaYj69/3lGEbXshbV1sin7WGEiP4vEfmq4dwPWUe+XBznKlqJ3POlHSt4+1LdOr6SNqHXNR
 W5BQNAC8HKc3ZK0rGlKRt/kdtScQ7EFnaRiiDiPSKWZlzgwNYdhnrMaIbW7Uml33a8E/zasoPYU
 +s27s9CdMi1A2oIlG75UiMwxZVhTNfTMDNG3fa0oheykGCSNufkNlijOTDvHlkOYDEKy1WA5Ddz
 g5Eq4zte/IGxWS1oKU0MwGbJORIgcq9StyfXJ8nzEl/Bur6tuZ/jP9cuvMvX4M1yGuvDoUspc0J
 q7YTm/Sr5IzDt1C3eCNXvQybxopzH0cooaAefEzgDPgA4dqp637wLaQ/jdx2b36V1l89s+YNiqT
 dkRmxhqKX1k9T0Yr9cg==
X-Proofpoint-GUID: 0Y48V8IF1x1SqEgwmui520xXMBwqAXn8
X-Proofpoint-ORIG-GUID: 0Y48V8IF1x1SqEgwmui520xXMBwqAXn8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyOSBTYWx0ZWRfX8QuHmk9b2M4Z
 MURI85pLFZrqnFBJRTc4N4hkQyHobWw3cU8vwrdRcBkt+Dn4VAV3BDuzOkKRctM7whbs50DEQp3
 gHsc2zjRoL71uUhQnu20rbn3F3D66Mw=
X-Authority-Analysis: v=2.4 cv=V9VNF+ni c=1 sm=1 tr=0 ts=6a562a72 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=yW1A7ns81NOMPIjzjlIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119029-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C453E7547E5

Add dedicated driver data for the Eliza CDSP remote processor. It looks
almost the same as for Milos, except Eliza needs region assign.
Tie the new driver data to the Eliza specific compatible.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 25599d728208..c8313c61da94 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1687,8 +1687,34 @@ static const struct qcom_pas_data glymur_soccp_resource = {
 	.needs_tzmem = true,
 };
 
+static const struct qcom_pas_data eliza_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mbn",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+	.region_assign_idx = 2,
+	.region_assign_count = 1,
+	.region_assign_shared = true,
+	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },

-- 
2.54.0


