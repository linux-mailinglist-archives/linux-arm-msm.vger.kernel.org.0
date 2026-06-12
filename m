Return-Path: <linux-arm-msm+bounces-112913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mMUmJjLRK2p2FgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:28:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7DC678439
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:28:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Z0/EKFiG";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dFTglExS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112913-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112913-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 339CB31A9A94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F823A6EE5;
	Fri, 12 Jun 2026 09:26:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73B639C657
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:26:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256367; cv=none; b=P6l1aFUkJumhRpnh3nGcmSKohvqe5NvaAWZXUXZnM2t2iGLhL0Po987NEC7mKPDDmN6wkbMNQ46G9IbPwEE1tRmkHsrPkVnSBk6Is4nGOJTCAqCVCQmuBudoMEGbJ9hHuEUzSYPJkaV0qjwsvRXWjc5Ugeu7OZ8ZNOobyOIP0uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256367; c=relaxed/simple;
	bh=I3Z0NYX6XDBZkxlAm3drfNsOlkrf/TDMZOXvVbZv+aU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZAgWdD408xqesxmOlzuDJaVyeNcK8QYVqM7xg3HneY0mwCUwnJ46kpme8QwG2Igkie/F5m1LT3rKlCowM5VkN5aSouoX0r4TQS58mT5Zol9DwjLzl6szJC1lyP0Rn/agcJstfj2kPVl96Ut4iFxAe0RAN6BZghuLNPRd3oTjIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0/EKFiG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFTglExS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39bnt2516205
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1eIf0xp5hZBEBNH7WRO9eVs/5PtTegLcmrXxMejWeX4=; b=Z0/EKFiG7dxFxpNJ
	DKGG2WUqH9YjYwDMKDEpndJhwLHWSeZZzThRCBVFrlIv+2aXG/rFa2fadpX+fyZ7
	8IFO/zi2N2266GfDC5VmbxsUO9zyVXhDG8se8D25bN5wuJR9dg94DWmLUhxcAewT
	eR+ycG9W0/PxxUGV6jiJC1Qw5pJaUUiTndpI0SX8y08JKaxlkINNLIhm6LScY3QM
	C6/xgNqFzJbrndKufSkY7KAXKv1S6oDrd7lAm6EKorvREFkVauuKrRcBa22/KKvQ
	GQKh0p/BdTqWQtOBJfUiOoMcg3DizH1+CxoAEqzxES0FptvYacgIEPrj1Dvnf3fs
	15NhZA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r72cgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:26:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c33d75153dso286445137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256364; x=1781861164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1eIf0xp5hZBEBNH7WRO9eVs/5PtTegLcmrXxMejWeX4=;
        b=dFTglExS8HxkTJwpg8T8ZaLM1Nw/HTFxx+OHOvi2rZ4KdkP+A2EgVDX3jpLS4mu1nY
         KyjF1c1VhGIkF6z4AU8f3z+WpQAAn2c6mp0WCiPpyJpZ6AR98RqZ/8BneVfexlnlGu20
         hiMckHgmWuLSHBz/WHWToY19FCuihwzQJl53R4hlAqNajTOOftLxMsnCwQWcqMbN3qYB
         J1TnW9dJVkm485BZJvQT+c6lwTrQgwXhbUI9GJv2ww26WoCdwVrsbeANcDckL+zzt+0q
         BsPJY+vp7IcdadwGy8qIya+GmWrVjiSZQsJI7vSyoNsf9oKh7QeZWxvQUmHUgazGSlai
         wbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256364; x=1781861164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1eIf0xp5hZBEBNH7WRO9eVs/5PtTegLcmrXxMejWeX4=;
        b=lRgMaiGPE5Sw4PoJplXWbN0ty9wu8ZOyGgpPqtUXdFDDRdapo5MrB33RAdBEt4E9y/
         1av2KbysKgNALspcmAqheGekqntVjg+sGAyAI8DgZlfdb1F/HjbD6XfSGQx/79lmQOR/
         purWIaXfABhNWabulr7rBcFLRFkkleFH5p4TbfvLqJYua1IkMOhSoZHz2aEjm2WNaV6w
         +AfliQ4LKlmORLfK3Dii91G7Qru6BfoUnAuPJU2QJL1Bzurc7wan23d3jWFZD/Is/cRK
         1GlVC3PcA1278A3tEeYHvMe+3/d+o5B7I34uIL6BGXTFa9q0+nmfoiAHWP4vvamCZmr+
         /7wg==
X-Forwarded-Encrypted: i=1; AFNElJ8S3iR1h6gYtscm+qsaZq3YEq4Q7G8oeC6fJMkux86u0VO48mAX9vRjlae+C+Z/t6BZ5dMK09Ve5wIHQT8d@vger.kernel.org
X-Gm-Message-State: AOJu0YxLB4fz92QwwJPJQggssQ19WcHI59lLQ1svTZCENwvHy7KoF81Y
	R/rN5oGi5Zl0hu62xF2FV56KOJtqOTDegEthLULCx9+iAXR48UzvVxSODqUzgx90k3OodcC7y40
	leE8//2GEZ38NuH7lz/nAJnMhrMJjGwrHc32kLmnxeMUcdJBWbyZigU9QPIZTaHpy/QWx
X-Gm-Gg: Acq92OG85J+TR1zmrhqJE9+727ohETA4Ml8rKTfQOZX4DtCIL7j3U9lFB2zMqoIrntY
	vQu5/dWkG+fXJS064oUYlJTxWgxtU0CEvwHMI657ShxoBozVCIjYz4Yw2yz0GnLjweMpjDtQfIZ
	ijFp/1YPS/nswolMr3ScbCQVApmzyiriZ+uoMEPGqWIcTBiOXMCENsMQPHfbkdc3xOW+Qwxou4z
	h6DgnYR4bHyp8NxqkyN8VxNvTBqkschjPrw/2mUfnOc0EydU2EYp3SyTBCGS29MrHWWseKL7Cwl
	R1n9Q9lWTw7g21lloMKR09WxX+ihTH/3FdAuBLinPIRxISVZOzK2fEU610c4dQKjCX2cXKGzLde
	Wa4/jxKeC9qJVyx336yWLjVi8knz7/T+sWzPNFjxi+BJYwUVZW+hyycxznWi8knADgMd82Y+cR/
	CCC72kLl5bCwnzJWLGldI3+v8cErIxY2nkHxU=
X-Received: by 2002:a05:6102:41ac:b0:631:81d6:e15c with SMTP id ada2fe7eead31-71e88ac3b40mr713864137.4.1781256364083;
        Fri, 12 Jun 2026 02:26:04 -0700 (PDT)
X-Received: by 2002:a05:6102:41ac:b0:631:81d6:e15c with SMTP id ada2fe7eead31-71e88ac3b40mr713847137.4.1781256363589;
        Fri, 12 Jun 2026 02:26:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:26:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:41 +0300
Subject: [PATCH v4 09/16] media: iris: Add framework support for AR50_LITE
 video core
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-9-0abfb74d5b3c@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8118;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9DQMCHqkqZR4kYnFSm/8VmYUprdVpc9QpDcgMlyKNYs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CQupY9yh4YharMq5EC4OLtbjyDaTe8H0oDb
 oVVu0bF9faJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkAAKCRCLPIo+Aiko
 1V9MB/wMffLpSbLfZ3/uGyEvhyXO86pEtPgyw8se9UuoKk3+3dl1SgqeO5fWoKAitujoOQhXHZI
 z+VZpKraQyz7Ek3R0SZ7yvnOcwgZef0vjbFVWTCJybvc2OfiwTpFu0Fk2CzxrmxTBQL6CgKCwTO
 lAiFGaKh0qikqV2I+wpI5N9Yf8NG5zXaX9kZeJcm0Hu8luMpG+XhtQntV5h5CpPejBXwV26xYqP
 yTbRh77KIHLJmf0IkvQHHn0AQ9QSaou7ixc4+Ta6vCrw7wYFCsUynBwAhe02WWEvSQfwvPDwIe2
 WZvwExOyWxtLB/Qs2fZeLJ5WXZ4RWOzasS2tEzcy5ORoykpE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: PqNdDVa5l2TRFJSB2JHzngqrqq2rRAyM
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2bd0ad cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=x0nZcyIE9sK-8O7Lov0A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: PqNdDVa5l2TRFJSB2JHzngqrqq2rRAyM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX+YGPjPq4VtXf
 y53DWix7s/hUyOM4jTviYQPopLjuWkEWIa3RDEofNCEe6X8PsgB7Am+7sFu31+9ruoq0eDVwSLr
 BXcJLmcsXam/9KfA7tZzNTPwkSegpil7bAZEbH0ltmkpAVBlrCxxj5YM7OGT57lFL4vRA4C0dtN
 Mk7LevOGY7E/Lp9pJRGMTS71pKJ69nEFlKPrWFWkoXEEuFxnnVv6GZYdfpdksIWeCcs3Z9ue1Q6
 HFWWTfxn6VldG0rgrWd0l5M9ycpPKH4SIoPI8BBir76c5O7i7OV/hK2siu4NxLU88oe02DLj3X/
 HQAwWK55VGV9dQsyJLqnD+FKvl3h/jyK9UzcxFrlUHZ+R7eSAeJ6pberXFJ0j2kkloAILeYR6r6
 VL6m8XwGEtKFTVczjVu3EDLKbIDf5fNQZv6ii7Qgp/gUgV6Y6niR0kmniEaIIutp/5z4cvl2pm/
 q5BZ+mqZyLltCa/fmmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX88za/VmjjjC0
 ZYZTJ/P9OefDntnjUxPtm0wLVCDve8Y+9EMDNiGcGEbSlfZhv+EtOy0S7fTO32zRrYhDmCDBJ3x
 t69r9TfjeMvKGfWV2ybO3/73HKOogi0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112913-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: 0D7DC678439

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Add power sequence for ar5lt core.
Add register handling for ar50lt by hooking up vpu op with ar50lt
specific implemtation or resue from earlier generation wherever
feasible.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c | 156 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   3 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 5 files changed, 162 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc439..f1b204b95694 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -26,6 +26,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu2.o \
              iris_vpu3x.o \
              iris_vpu4x.o \
+             iris_vpu_ar50lt.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index accc1627defd..6a189489369f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -74,6 +74,7 @@ enum platform_clk_type {
 	IRIS_VPP0_HW_CLK,
 	IRIS_VPP1_HW_CLK,
 	IRIS_APV_HW_CLK,
+	IRIS_THROTTLE_CLK,
 };
 
 struct platform_clk_data {
@@ -315,6 +316,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	bool no_rpmh;
 	u32 wd_intr_mask;
 	u32 icc_ib_multiplier;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
new file mode 100644
index 000000000000..1af20b067c03
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/iopoll.h>
+#include <linux/reset.h>
+
+#include "iris_instance.h"
+#include "iris_vpu_common.h"
+
+#include "iris_vpu_register_defines.h"
+
+#define WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT BIT(3)
+
+#define WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT		0xb0080
+
+#define CPU_CS_VCICMD					0xa0020
+#define CPU_CS_VCICMD_ARP_OFF			0x1
+
+static void iris_vpu_ar50lt_set_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT);
+}
+
+static void iris_vpu_ar50lt_interrupt_init(struct iris_core *core)
+{
+	writel(WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT, core->reg_base + WRAPPER_INTR_MASK);
+}
+
+static void iris_vpu_ar50lt_disable_arp(struct iris_core *core)
+{
+	writel(CPU_CS_VCICMD_ARP_OFF, core->reg_base + CPU_CS_VCICMD);
+}
+
+static int iris_vpu_ar50lt_power_off_controller(struct iris_core *core)
+{
+	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return 0;
+}
+
+static void iris_vpu_ar50lt_power_off_hw(struct iris_core *core)
+{
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
+	iris_disable_unprepare_clock(core, IRIS_THROTTLE_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+}
+
+static int iris_vpu_ar50lt_power_on_controller(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_ctrl_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
+	if (ret)
+		goto err_disable_axi_clock;
+
+	return 0;
+
+err_disable_axi_clock:
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+err_disable_ctrl_clock:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static int iris_vpu_ar50lt_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
+	if (ret)
+		goto err_disable_hw_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_THROTTLE_CLK);
+	if (ret)
+		goto err_disable_hw_ahb_clock;
+
+	return 0;
+
+err_disable_hw_ahb_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+err_disable_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static u64 iris_vpu_ar50lt_calc_freq(struct iris_inst *inst, size_t data_size)
+{
+	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	struct v4l2_format *inp_f = inst->fmt_src;
+	u32 mbs_per_second, mbpf, height, width;
+	unsigned long vpp_freq, vsp_freq;
+	u32 fps = DEFAULT_FPS;
+
+	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
+	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
+
+	mbpf = NUM_MBS_PER_FRAME(height, width);
+	mbs_per_second = mbpf * fps;
+
+	vpp_freq = mbs_per_second * caps->mb_cycles_vpp;
+
+	/* 21 / 20 is overhead factor */
+	vpp_freq += vpp_freq / 20;
+	vsp_freq = mbs_per_second * caps->mb_cycles_vsp;
+
+	/* 10 / 7 is overhead factor */
+	vsp_freq += ((fps * data_size * 8) * 10) / 7;
+
+	return max(vpp_freq, vsp_freq);
+}
+
+const struct vpu_ops iris_vpu_ar50lt_ops = {
+	.power_off_hw = iris_vpu_ar50lt_power_off_hw,
+	.power_on_hw = iris_vpu_ar50lt_power_on_hw,
+	.power_off_controller = iris_vpu_ar50lt_power_off_controller,
+	.power_on_controller = iris_vpu_ar50lt_power_on_controller,
+	.calc_freq = iris_vpu_ar50lt_calc_freq,
+	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_ar50lt_set_preset_registers,
+	.interrupt_init = iris_vpu_ar50lt_interrupt_init,
+	.disable_arp = iris_vpu_ar50lt_disable_arp,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 41498f94480e..75dc051cc6cb 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -97,7 +97,8 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	}
 
 	writel(HOST2XTENSA_INTR_ENABLE, core->reg_base + CPU_CS_H2XSOFTINTEN);
-	writel(0x0, core->reg_base + CPU_CS_X2RPMH);
+	if (!core->iris_platform_data->no_rpmh)
+		writel(0x0, core->reg_base + CPU_CS_X2RPMH);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 71d96921ed37..f00e2de5fa53 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
 extern const struct vpu_ops iris_vpu4x_ops;
+extern const struct vpu_ops iris_vpu_ar50lt_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);

-- 
2.47.3


