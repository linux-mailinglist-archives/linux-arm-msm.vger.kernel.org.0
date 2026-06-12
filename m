Return-Path: <linux-arm-msm+bounces-112905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sSAyCPzQK2pYFgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:27:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 764666783F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:27:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CaJ22dBD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kPVfbzsK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112905-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112905-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 494A83223B74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA95239B486;
	Fri, 12 Jun 2026 09:25:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7BF36AB4D
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:25:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256345; cv=none; b=ZuxYhh4BnlvXCm1IBKO+xjKqSmuHLcu6AJYj1g/2DEVJDV3pkm6WMdzZQMJwGA9js5pGsnJz1H7yZzq2ql40Buo8f+fgctSzVqGJODIHzdiMrGJ+WJLZzHoeXsHUCMqRUYFbsJsvDGUNu8JAhZt8IGavcd9mjcdArJ8A6qQ6RSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256345; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YOO09+mEhou5hYsSet2/O9rdVuilDy1/gsrqt3Qq+ZuJlbRV5F1iByAq4AdeV4Gizqa5LWJqMwmp8/6ubRTWaqJtNL58yV7uKWxrbHsGCGd4zhW90F7EJYAcJi/auSF1uhZP9RfIUYkTP+h8izJA5pBiTz6+SX4PxUT4FIBYpGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CaJ22dBD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPVfbzsK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39cNY2411606
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=CaJ22dBDnOAlakLu
	rSvzu319rVXYBhf/HrEA78o/j9xUjL2Yqn6f0bgVjv20y12oppysceI+fBpjVCAM
	u/PKPj37Z5TFo6+l/JlBZ4J+XiaBtNnx2VPo3lHPRNwiHkeBHhE6m00yJUf5wMQh
	C4l1Zs8WHuqF1XFkLTNdwbGy4wKk1IruCuP8UbEuPYQSkfYL/W+d/fQ5VkLIrCL4
	LXv5F/g2kcB6w3lCfZFPHbW6+CLD0KO73n9k21YtwPfDaWTuxR0VCjaKEEwZUr3I
	FNOyIpnWr72nwE9QNAACHIlUW28BDMzs72d+FrPQIDG5qsTX0bhD/QiXQvsPjEaW
	A2qdTg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er165awc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:25:43 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5a94a743521so384625e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 02:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256343; x=1781861143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=kPVfbzsKVYWUKoYPTX+uH8yqviOmQlawn/zUTmwm0KIuOFH7F5CZvVT6zK21rMQt5x
         7UCaNoGZ9hf6xJYoBpE7rb1helNlwqblcgDshVWYHhW9h9/XZ0iMtQ+YFY6cSV85KM5a
         X6lV8jI1F1t/HJMw37UumVel+i7ZGJioVPd3/Ar9MbxPB0g/uFJ7SLJ2ND33GbDAHm2U
         gB67PEn6XLTH8Fhx6VTFQRydTMAS40c22TOhiS7ILsJgSvAiUI7HDaHO+cAPR+4DuuYe
         W3/mTvG6MRIHUf4LfuUfTtowBfMd3MAn+uhnte4OIONVNODEami9IzV+qyaWxHB7unxj
         SUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256343; x=1781861143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=H8STjzYZHb3zdTb4+Vcyyj0vGixcsEw1iJd+bx1E1I2PCTIcKPFxfFu3UIRav9En+5
         f1CnbW5q0TQuvj0EbhXUh/kS4f9LnPsbKJqhhu6ANeQk3MN0hlWzYZPC3XbxQ5wxkTx0
         1UMOphW/RXTUmamfRYO+90dJl+/MBzvbjuVGqAZuWgZ91dM8cDEgO3g+6T/LsvKijkTE
         u0uh1j2i8HJXIxvHAFyIDMeO727/sLW8uqVhuWmtGG8EE1+fYQVyP4VjhBD+8bkZL+kf
         G3896/5gzSRj01rn7DwkCw4v0cU7jeU5RHIyUtB/um72dgcYHQmxOzw62N5Wl48xEM9X
         63rQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yRmq3eAIFHl1me8zMWjoBTTVWYRlMg7sOi/plFMcpjiLz1heC3y23qIAa/qt7hffjLM39fR+kTuGeXfI3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9goLL7lSoDrPYiAf8ZvGlMgKnqz4SCfTpYjlWqZMH9/nicza8
	LMqSe56dAtPNywt+wsuLv631q6NotfYN+vh4hMw6qY9TurHenKWYF02ffzdfyuFFTu1JYKabHbS
	A9UeSvZWZqXvaiKqkMkj13AYeLH1/1XEhojyNYa4xnTbY4XLW79qB2twdPLIj2MTxT9Z7
X-Gm-Gg: Acq92OGqaBn6vAmcfSJE31eyLTh+P+3kAb1NyecP+gYS+R0oKLFse3kPUteEU0hp47M
	kMfNSDRxT+uGuXiKXCwg/Rhb6aF1fzK7huMId/70TTMPbOaPBErB83fDoYuBeDB1jwpouBT2m7R
	WD/q0Uh3K5BDtCOyhlu0cLccq6JMqSWyuFzBfPNSW5qarNj0n0ilwFidgZtXZIC0Rf+cP4poPW/
	qvCYGMkkV+Oj+xPY8xzTS+4bb2oyQbyHsfVIFaV2rqmrG0h3M7M1PrS69ABwlqi5dtOAWZraz4B
	n5suQY3n/enYTD8s/iWv3IKu8BB6x3Z59Uh7BsCG5BOLIMRpYiFR0nyAva8U8DwmPSMKXQk88TC
	YrBuy2lfuRNj2tYKnjixKCvIDrWJTEYDWH+uafF9n1eI8n5XNPL4mzDdff+Q2bUYUn34fyR/1Lx
	34Cl31LkSPGf55C3LV378WKmH0yxdY+GyHjeo=
X-Received: by 2002:a05:6102:2b98:b0:6a2:cf9a:a5f3 with SMTP id ada2fe7eead31-71e888c088amr738031137.0.1781256342839;
        Fri, 12 Jun 2026 02:25:42 -0700 (PDT)
X-Received: by 2002:a05:6102:2b98:b0:6a2:cf9a:a5f3 with SMTP id ada2fe7eead31-71e888c088amr738011137.0.1781256342448;
        Fri, 12 Jun 2026 02:25:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:33 +0300
Subject: [PATCH v4 01/16] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-1-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SkhEj21efbGwh1OhN+7NneptPnsqOcydi7iGjY56ptE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CPwZPO0cN0OQb8rKNsKDy2TPAKrkP/B2msY
 7r4j+VGLtOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQjwAKCRCLPIo+Aiko
 1b1rCACp504C40HruoVsq8k3/NZr3gQVKQigLmI44owZM/nGTYSGUmJisKxVkzKDlW9Wb25qa6A
 eMg81mELF0+bqqYnA/U1EtzLKzyxsXRbDntfUk1zGP1/D9W5xyPDopvmUh3peAb0oiRc4bfYPvn
 mPxCU4e/poV7QLQZAvcmTbw0rBqAEY0r5UC9Z0O0WVkA8vpxM+tUyXENbbOdONYJ6HDYMfx3tpk
 oG4ZJVRThQraaLfSWlRmjRF8Wlb+uPgCWgV8HYZXkS7VT62ZmcE7sntzkM+xHz0+4o0qie1yp17
 EOx1QYcVwYtuZeZxKLdtMJo7UUVkvifjW5jIBtaJOux5Kqc7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX7Rez5RvPtS+m
 Du8RriGnGxs3H2H+wgdQ75jtUtX4DijOVo8SlViVPjP8v7xeVdhiPub50OopGfC/ILXJ6YS0Pdu
 mSkXyk29bj6ZZ6aI6uamZlGIYexSquNxlwktXAMwphbj6tptpZbRjhXssAGsXNRY7rl7ivlghvm
 BjV8v/PaM0e+MnW1MXp5rZcNMnZDFh+XqKtKqPWKn1fpvOfZoJi5x9Z2rrsvjKqn+gCZAJmgHy8
 eA0V0H8i0CsK2zXwnUQday99pWwae8qXH/kHd/08B+MPDo4JQUxdAcfy0j4Xh2g0DxP45MxnSYF
 SmvAbIOTkqRnf6RngVOD5XZ3X37Qjnd7UYcxDtI2R4LgrcVTYSdeqmMh0H6Jn8hkuwmz4Gi3Vy+
 wCW73XdEA4BcRd9vZbH0KowiREcuBmujcmMei0DQFEeA6/0BGDvEGpJd5EaKA2YZ2a2cR4A/LK2
 Ej3lspT49fcbUi5u4VQ==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2bd097 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: wpZuWYq7381tcU6CuPFKfWryHHlDX_AL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX3JKn5D2fHxWQ
 mUirnVWfwh5YVaJnvquvGwdc3oX9R68ZMUZHm+Az+Te1WIIw016Z8ZseYr+PdGqNqhMhfXLCzFR
 92OGHMZYZCrSQElSQUqCrbQBOc8Za90=
X-Proofpoint-GUID: wpZuWYq7381tcU6CuPFKfWryHHlDX_AL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112905-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 764666783F8

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

UBWC configuration is not applicable to all SoCs. Add a check to avoid
configuring UBWC during sys init on unsupported platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07..6e04175eb904 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,6 +140,9 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
+	if (!ubwc->ubwc_enc_version)
+		return;
+
 	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,

-- 
2.47.3


