Return-Path: <linux-arm-msm+bounces-113291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ++OxLQSUMGqkUgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:08:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 449E168ACE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:08:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="AVrVNFy/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=df6Zx6od;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113291-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113291-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27FCC302A406
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2163027057D;
	Tue, 16 Jun 2026 00:05:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEC4267B07
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:05:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568346; cv=none; b=SMeSjhyqzyGzu7zWIv/ZzSdZwz5YJqXQUkABa83F9/wc4tJF0MQd2VLa+GpieGrZjcLnb9IVxfDNashehE6HaWQ5ebn+NcNqXGTvTcefVlLL7z82ToAOtKSbNnACg1NgoXdVpRdNDbcrJQGSVUXp1LPVyCj7OOqQyOEH0cht79I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568346; c=relaxed/simple;
	bh=RfGmISJ4Tg+rlJIDtM2rxs9yeQZR7HuRyIw8EI1Vrgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QqZoihdTbmNXDvYuFrRJTDpsQNQWt4iGSRVKT/J/z6G8Oue8LdRUb6Mz9qy940gV3xSVLON1yZvQ4GidiBxMJF68pUqZ1XtR+r1I5wc7EDYcsTOAK6EJSNajLfxt2cdL88MpK54qqUQOzeEmCMLJxa/ikGwpNA1VRAQmhRDsuCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVrVNFy/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=df6Zx6od; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ2Jtl1245725
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lsgrKk9p/S2kXHtUz8qoicwfhLPPm3xQs1fSPkm5/g=; b=AVrVNFy/q5uNNgMD
	y+1pVvyChCIaRBhxOlMYvyHRzVjEiJOkrOvEhrfpkOvGM4vh9spCMKsINc8Slmma
	fYo6LfatAaJXHbLYa6Dsbu0kB46w6eaozRnZ3kHztDsKn/qD1BYKaaal9uP7DnCg
	E1KOFT3dRH6GBcIpdf7e3MWTV2IkMIqW+yq3gAF2pLV9yXOBjxbgQlsEJ5yruVck
	60o93tfbN2W8+3EAvBXyTgCPjzVjqeftAJhDJRj74yS1uCrd+4gRgz7ANfYv2+zo
	Q7Y3wG5I1BZKXhHPMFXhNOinPDo0gVxUEo7bFFXczSS8awGm5SVddoeL/Fh6svi1
	azuocg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf3myp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:05:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91565f8c589so691857285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568343; x=1782173143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lsgrKk9p/S2kXHtUz8qoicwfhLPPm3xQs1fSPkm5/g=;
        b=df6Zx6odEloYDWzu5So+EupvddhRe3+CZc1ptotHO05KGfTkbmaYZm+vXf/TxyJ8oe
         gvGU/aUT40zt3Ma2Nqb+BEuOmqpU2pukcC4hWnUlRlE/92nlVuKSFnzxtib17DQwvYTG
         p9kGo2aIGSmTnOFOk9YH7QrthCcgiSu3E6Q+EKKED/DO96oSpKB0J18q8tke2vtig5F2
         9HyWHQyarJZEvckJFv+sPhh599mXpYMlCwRGVI2nquErCp+wkvDR0KGMrFG20kf6yquJ
         d7GqjcmdGLRAiTbUMzr6tl5MCqHsYlohTUUKvZM77zlnzBSsfgCUOlYZdv0fkJuA7axZ
         ibVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568343; x=1782173143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+lsgrKk9p/S2kXHtUz8qoicwfhLPPm3xQs1fSPkm5/g=;
        b=gI1jDyKHPpBSTN2d+IhBSlJOZK9P6ZCqYYF5+5mB9i19qIBBaUjWFnRCN/LDMWYmqQ
         oY2b0Ije7B7bIymDPryMtjAUNGP+whpU/dG+OpEW/bi+IrJTSfmW5PxSk3XR4kbQ+kxN
         T+VVQNG9mUlkIMcwZ1KI9BJn19S/toy34Ru9UmnhP6B78OaMweCjU7VMkZSC9dsP7fbe
         pKz4LxvFG82bnFXI+TtihdKWAhr6feJv0Xhk1BeuV0+77unvF6K2BvP1ux4I/ccYDM1e
         1SjPmSQqodJOLZuR+LamDF8OY+UNt/c0r8J0l47EcBrELP9BP1+U1ajHF+zIVFpf9FTf
         d0Gw==
X-Forwarded-Encrypted: i=1; AFNElJ81MasE06EfIyywDFG9tbIlHhbLuUfSsbvX/Eg6Oqo5x2l/KJ7rQ7AKXlwcJSBhQRou/FHjR4v4e9HMYrMK@vger.kernel.org
X-Gm-Message-State: AOJu0YymMrdIc1+IGDPbF9ls8ZZUrLfmpF85Hj3FA9QZ4dJmozzGVBqm
	6t6+/0TziybJonSNcn67UeTtHUg4zsLG1FSy5GcTovydipsNCyCHnYbhIDipAL8gtIG0pmAfBE4
	l9mcR9IgodUJWDU+HgQZqj836e1KNFNpw5rAZ2lV07R0VQEbR3d7iQOweG3a0RhKmsMLi
X-Gm-Gg: Acq92OER8K32Me0Ngzm/oqy3A1yvHZ3g9Z2P4pXnQCc90HLb9uyHxBpdgVrfX2ZoKLx
	tSwHhNjNabMBXWljPOhcwpoeDreyQfynNTndkikZUTioJiM0aZ0O5Cc5Ih3URNwty+E8oPp8Cpf
	vqziCwKd+ArFi4QEN04fqKAlgou73MJ0LX+u3BTs75ziU5ACs4tgGtJbIRrI0GDz2wnS1hn0+db
	Zne1SosYw0ojGx94mxOr+AWQOcz7kS/EYnVrFsabaK49lT6bgWIFSo3fxRg0mrAzMoPIoETj44B
	uKZWJ2CpjmGo/YdqaHrCmjE0j67R/1cn+xSTxTolEQrvRMXGXsAf3smCHseQ171PqH5fo1YE4vg
	mzw9tdl0HGkQ/GLMJWyR9Qp0du3iYT79vxtpf+DcUnZu7wWv8YywPBV04Pt54piwbv2W59Gpy4a
	cvtV+bLvMlRx1kunOHKYTO3i/M/Ds6jueNLh8=
X-Received: by 2002:a05:620a:25cd:b0:915:4c9b:4120 with SMTP id af79cd13be357-91c2f8a532fmr237278885a.37.1781568342753;
        Mon, 15 Jun 2026 17:05:42 -0700 (PDT)
X-Received: by 2002:a05:620a:25cd:b0:915:4c9b:4120 with SMTP id af79cd13be357-91c2f8a532fmr237272885a.37.1781568342274;
        Mon, 15 Jun 2026 17:05:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:05:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:43 +0300
Subject: [PATCH v5 16/16] media: iris: constify inst_fw_cap_sm8250_dec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-16-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=901;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RfGmISJ4Tg+rlJIDtM2rxs9yeQZR7HuRyIw8EI1Vrgc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMQ+9/MTBoo8zy5/Eect8ALxjYmFFWBT0NOa
 kTUllzxVvOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTEAAKCRCLPIo+Aiko
 1TY4CACSG/THyXnQ7tfqFwmQG82iyICvVWfIUH3JWjZhxBfxF7EDwfjQQEjMniu8MtUQH/mY5Ku
 IJxujjZ28QvOViF4qQA+7BBrvJBTmmbcHLbKuDMSkPmqSoyOk9ytPtTikyoeSU7IxBXq9iIdc3x
 UYswZ7tFZYj4YCca6WCKCdcIEawOCZoW34B+gh8V1k4upHSnp0Py70UTrTxwKiPnC75D0RaBllT
 dkCZOIoShVBp1bsjVKgjEFp68N3aCxrt37gS6IS4r+P3lWsa2Epdxedbp8Fspl8w7haGYx8bYgx
 Zvo5oyv4fJ0x5CpV4r+iNteciGNZ4uriKalKVmObd80sYGMJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a309357 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: LZSp3hj5DdX4797hRxGsUzBO6anW-5B9
X-Proofpoint-ORIG-GUID: LZSp3hj5DdX4797hRxGsUzBO6anW-5B9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX0OzTHNGY1UY6
 9ZJemeoSlZlLf88QvfTat6x/0JawuDElp+FQEtsS0zOKijLwmyTsEa06etyUsEuHF+MSZb8PNjy
 F6nqt+RlMLgOlkuXvPdAI2wHLmm1VFM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX5MfLwieXnJRI
 lpvjYNiM3imQdCVEcAybwxPZISeQACMP56OFnVzYnYmb6dwnloGRYCAaQVBT+Zx8GcXJJFGfp67
 qD8hoNo5srzEHmFjwTk3ZYdekJtJluhqPd1/6l0kw2cWvv8p/JJjlvmd64KfoMD45+kiz0ytV9G
 Qq9XB4bWDbgOr83O8Nm4XF1t1s2oPwPtQRgH06H6RDHLd0l+OISIejfgKNkKxD3ct99c1rk4Jfr
 LYKS60D+rK7u72f5CX8usNzlWLgNw8tlty8PfiwT+FWphI0Z6Gf71KQ8lZF9KkkktnUhhTVtwiz
 cnlPWbpQZNUjLIvphbwsmohmpffp+yTgo2lboyrQGHq4nNcaTVOUC5X/0o2ePgu8/DoLusHiHfc
 35BM2b5iyBI64uEKD2cogzGHFx7LJgYY791iI0Wu8EDXvW3KtRZt9hbUHXJPEzzhsoHKYI6RF4b
 8F9ZTxrY6bkFRrlXxnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150254
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113291-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 449E168ACE4

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index f57af31dbd9f..a8819470f703 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -13,7 +13,7 @@
 #define BITRATE_MAX		160000000
 #define BITRATE_STEP		100
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		/* .max, .min and .value are set via platform data */

-- 
2.47.3


