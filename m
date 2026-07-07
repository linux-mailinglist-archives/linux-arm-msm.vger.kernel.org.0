Return-Path: <linux-arm-msm+bounces-117413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dKaxG859TWoo1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:29:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 639EA720100
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:29:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S0ZxeO5E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f+xXrhda;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117413-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117413-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 72B2730055D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 22:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9B03D955B;
	Tue,  7 Jul 2026 22:29:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641F541B351
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 22:29:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463369; cv=none; b=SpH/fsO0jIuu3H6U3GFpy8Y08Vv01yU7d90BaJdSjgzwuFO2GI0XlImCXebDIKanuIBOXPf5/BLIkNsemjlxgca8cmm4SVojjh05z//P1YGVxO6pERLiWZJ1vXnp3x9naEsQv17n5qrPadUfmbF82LXyZ4wNaOzgTSp5xk8yZtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463369; c=relaxed/simple;
	bh=acnsSKVi2aqjcn7maAiEpfFJlJtCDzjZpY88Lh3Q2Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PNfXSH2va6i/ElW9FHCR11XkPWReduKYGSzzNpUoNt31hDlO99XzYS9pKcHWIhdnCyilu5Y1Vqk9I7ALvyArFSUxnMGnNdtyW73zrzszgIH+VPZx2e9JHnGz/Bz9yeHjl9/3QJrVL9XoOaH0E0jDtfh2SL268kqxEx15KNyvGOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0ZxeO5E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+xXrhda; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5EKj542038
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 22:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahPRS5ACQmds6jy0ulyWNZqZH4qS5C1qdXBV3RFWmSE=; b=S0ZxeO5ESh+IYmYd
	ebndsYR4vFL7FSGBqOy18kymau0Q5/8KBEdhJyzfBGGwNaDUQZyupxkdPIi6O3lD
	7f1R5JroS/SBbGJTb0OuZ+xEj3CuCqeR7j1oYq8OJz4v+8atkQiUFkRYhStB5oYq
	v2P5DfG6mJGOsVIIXUB7UnRRRqT04opB3/uGCbmSkyspETPQdD4WUMeoC5ZoKzar
	lEV/Rq3DBvUiHNzGNumfyATcSjdb9PkEYZixcqToEqe4ioMFKKB7QKEaEly0uRsA
	qvy3eTQsAqUxUVQKXGHr0YJ8MniTyzh5XBBKPWHEAS+EtV6rW7UAWh1nQhKKTAmj
	i0AJdg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11uprk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:29:23 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-969289fca9dso32419241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 15:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463362; x=1784068162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahPRS5ACQmds6jy0ulyWNZqZH4qS5C1qdXBV3RFWmSE=;
        b=f+xXrhdaScY5nQOZG3wWV1J7rkyO4sFgAffKgNHPQuLM8nv6YGf9zEUXX8W9n/CBE1
         4hdn14eeMNYVNrPsw/5aoiXxW0YR5ON639HXpyZgy5PcqD5eeH/GfR8mKoDvXXyuC4Ug
         xK7+5FMKdsH/B5ZNnNGH3ICjv/VldqhEQn8RoZq3KbBBJ2F1edopnlS+/Z/VGejKfBqQ
         2e9F60R2tJKfSQAPSjMK2BwP5LeOhgWiiSkRhZNMMsoUQEW7MWw0NhStNkDGemcWA9pX
         Q0bq0S/akAKKvJuTlA66cqGBH0Mfe94596biaOB9b513yXMG5LwCvXaLrx5A3zueBSV7
         q85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463362; x=1784068162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahPRS5ACQmds6jy0ulyWNZqZH4qS5C1qdXBV3RFWmSE=;
        b=h3oQylG2Vv+hZqR9SGh+vlreRSsYMfSAgVMF29Z23GMKGS+NXwlaleQhiVhWWykj+F
         PJI/XOVrCm4S1nGTQgdYijA1/cVNyxb7hK1Q5Y82zmSoEwMaLuMkosZti4+x7NVNMNAe
         v98f1+IMT7zH19uBTbLCOs3FrgSBtiJEOxe8kkzXQ2CfgknW8v6D/HBd+dJNf4iFbD/F
         5vLnu7A3dNBl2e8WLw6ZKRyZhFwMZaEvSMGGTBpk71LRQS3RZxipoqtmxq8oNgJNoloO
         AbTJmoFAsWu8FQAr1L/bYVsA8cNoyf7OClrHZF2Y/rndnzDRS2MCzXJiXU1fpcrUCsND
         0i1g==
X-Forwarded-Encrypted: i=1; AHgh+RqTgqur1r9/4peZW0gMWx481RUXnUmSmROmdzcvhfl4yUEbdvvbxEly4P8q2inyZFTxxqhTHl9HGlysA9dx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Mz1n/QL3QYeZ0lo1QKmB7NzEGsxrOxW3JFh1H61JOiCwVmaf
	SWG0OpJoe5h9ldIFRAZKIukDFNlDxUmcGCP520MxwrWBSwVqPfkRGfQOZlwFLor5wQbDXF0+SjC
	W9c4ZNJFRO/lNJrrBLQqF2rnFSGCExivmJlAsjmbd7Sm4r+sbf10W33mvPh4ECcA20EI0
X-Gm-Gg: AfdE7cm/x+0YTMa7cpuyXACFOC8Jsg7lQ2k+rl3juRAjNus72RXMXtia3flbWGYDx7c
	/AXZlHK4z+Zh61umxpxxZF146Qu1/3ITjUh/qurhHLGEOLQJE9cADOnA5NvgGriRqZxyLLDkwId
	gu0qoeKSeC5N2ACov5zpn5CrwkNKU1O1V2tkbfZoCvjT5c7sVgw74jZ5GWElDGwMrTmFBmXC64M
	nUDcEdKZSYknZsM+N2E1yGM4jNVNfroYqrA/PPId+rW7yRsNSxlL1nQLoWDZDcBFTyfmvebRTPn
	edJ69YqFwqzNzEBBEhzlG4WD7pBKc3HeBctb8C+BJWAUMiJjyN0hAPyQ4khYPY41qcY5JxclI0G
	sqharrETzMSRC4MRgoeKRq8p7nyycsB3VvD0iWby0A8ndUpZX6OoBOyv76ktTIg7DL+7JiMnayM
	+87SyOoAPEuKejbMNr5U48GVtk
X-Received: by 2002:a05:6102:3589:b0:729:65e:f08c with SMTP id ada2fe7eead31-744b76d9601mr3858992137.0.1783463362271;
        Tue, 07 Jul 2026 15:29:22 -0700 (PDT)
X-Received: by 2002:a05:6102:3589:b0:729:65e:f08c with SMTP id ada2fe7eead31-744b76d9601mr3858974137.0.1783463361755;
        Tue, 07 Jul 2026 15:29:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:47 +0300
Subject: [PATCH v6 04/18] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-4-374f0a46c23b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5132;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QN/GQkI9t2+DaweZ0uUnFoB7t+XgnQ7MgtUodJ5uTko=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2ojKjhpc7Mn1RilS1YROvN5jKC9Y8cKqhhe
 bG8arYYw/GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qAAKCRCLPIo+Aiko
 1V9rB/9STSCSCBKkSxslInLYoZung0yonFVg0rRRkhMjx9IPwkLFhHb7GrMX/sAZVxqZwiI4qYL
 U2mlYlvanIa5KbUOmciHNBEuJl0Vd+E8iCX/wZLmc7IZtA1cU57q8NSg6Dcx6klOWN/gHjflMDB
 woNntrfOQPiHE9Wh4kfIwXDj4fVxjyyXOQU1ZvFlJb7PAOA+aW5qgK/4oBxXxc7m9jn/a3YTD6j
 SQ1qh649oUyk7juoJ4CIQlwVcnw06fURP0tzbEIoWaHsvnJPxF5Qkx6Zv/9c0X8lv0Hs4E/K6Aj
 mLLQftbP64B3yxlryWXmhY8pzenTJ6R/LjbGPkVhDF4r4Foj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4d7dc3 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=gsa84qigJ8via7s57H0A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: KeH2-mhhr5AHqcaZGTfiWHKx-WgkEhgb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX0grXUaSA1hQg
 AqLyiOin6w4r2RnyWgJRpQ/zPI6sNBHOunbM4c2iRy/4mHmmbWESRwTC9SvKyWPNwkam9Wi7co2
 t7ubRgzQ0Ci406EdtX0WSh36v4gecFQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX0x4CmGhfu+Uo
 xMn1UNvGlOjrx6hLrs/n5OwEHahbUUOCINI39qVM/y2kEc5ZBpm6wqNAEj03iEr9AIjLZ8UHrOF
 s5VeYXwT5kwj6RMBCqAbvWbOs3y1xG3LeXb+muL9uQR31Ww+ImBrwKQX0lSBz/7iKOnCMfv4XgN
 HYA4RriM/syRIgK+I4PLuGgggHl5PzlWh0mXAdduNgXw3WAIfbL5sNphwzIvoWULwIgLCI7z9mh
 x1T9DYOM/9TXcBaLqf5m7UtQOFnDzDMr23byOd5dtzprX1fbgNbh80TjDINBcLcioRWdZNuw2Ez
 0IcLPz1JnqLb7gf54ImlSnAAjBTdy07jCeSHJDPp5nK8bh+P9FmqE9etpqeQt78s75ATg0sth5F
 kNQfYWmfhb7WZSV6ohy0Nk1eSkfuwulCp9ca2fWsjlZQ3qltbifY1MHVm4rFLocR1H0TIqBZj9T
 65EuT3CRxJBcA+beu8g==
X-Proofpoint-ORIG-GUID: KeH2-mhhr5AHqcaZGTfiWHKx-WgkEhgb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117413-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 639EA720100

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The raw formats supported by Iris were previously advertised
unconditionally, assuming UBWC support on all platforms. However, some
platforms do not support UBWC which results in incorrect format
capability exposure.

Use the UBWC configuration provided by the platform to dynamically
filter raw formats at runtime. If UBWC is not supported, UBWC-based
formats are omitted from the advertised capability list, while linear
formats remain available.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_venc.c | 25 +++++++++++++++++++++----
 2 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 4c8bc7aac135..9fee5f28097d 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
 	V4L2_PIX_FMT_QC10C,
 };
 
+static const u32 iris_vdec_formats_noubwc_cap[] = {
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_P010,
+};
+
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt = iris_vdec_formats_cap;
-		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_vdec_formats_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_cap);
+		} else {
+			fmt = iris_vdec_formats_noubwc_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
+		}
 		break;
 	default:
 		return false;
@@ -110,6 +122,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -119,8 +132,13 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt = iris_vdec_formats_cap;
-		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_vdec_formats_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_cap);
+		} else {
+			fmt = iris_vdec_formats_noubwc_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
+		}
 		break;
 	default:
 		return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 16c52ad07e2c..2f2c56bf9122 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -89,15 +90,25 @@ static const u32 iris_venc_formats_out[] = {
 	V4L2_PIX_FMT_QC08C,
 };
 
+static const u32 iris_venc_formats_noubwc_out[] = {
+	V4L2_PIX_FMT_NV12,
+};
+
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = iris_venc_formats_out;
-		size = ARRAY_SIZE(iris_venc_formats_out);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_venc_formats_out;
+			size = ARRAY_SIZE(iris_venc_formats_out);
+		} else {
+			fmt = iris_venc_formats_noubwc_out;
+			size = ARRAY_SIZE(iris_venc_formats_noubwc_out);
+		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;
@@ -117,13 +128,19 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = iris_venc_formats_out;
-		size = ARRAY_SIZE(iris_venc_formats_out);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_venc_formats_out;
+			size = ARRAY_SIZE(iris_venc_formats_out);
+		} else {
+			fmt = iris_venc_formats_noubwc_out;
+			size = ARRAY_SIZE(iris_venc_formats_noubwc_out);
+		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;

-- 
2.47.3


