Return-Path: <linux-arm-msm+bounces-91378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIQcBSs9fmkvWgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 18:34:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 757A0C341C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 18:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A32E3037F3E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 17:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4A735BDA9;
	Sat, 31 Jan 2026 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2XtvVoV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZJ0urW1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B63F35A936
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 17:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769880839; cv=none; b=OYISotDC/GRYi20f39vG07i9XP3vNnd9hGgeAwPmqNv4ufXFtyR9prss7t6D9B12y4WVYsIUmjicAuLihZHgnOGYbQW/QudIfCl8svFr7eul1MEynJS0Mmca5z1ocJCr8o0BamenCku9CubCvE49Bdpi5qWxuzBFq8NWXEDL9zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769880839; c=relaxed/simple;
	bh=32YQR180l4XuatpViT6nfN9ULShKtuaugvJ8/48mdxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jz6rfi1bNq+QWOVz2eGHtnDz1sWKwDl4aB+MMVL1spjk/BsvtCzxFUm5SBNE+wZvDSLPWS6C3nyIOe/AczWrhaGg8FafC6Xftm4vU93gPCrQd4i4qeipJ6gml11ItkpT79RWEsnhSIhPs6WsD+2Iiy2KsVWSb8RIer76uz0gE4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2XtvVoV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZJ0urW1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4eNwf393123
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 17:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1pl67zhaQRIlZ7r7pA0ZyoUVVuJsyuZALZX1rr0pn4=; b=N2XtvVoVvKtMGc7i
	P+w7xdZ33E3C/9tG02ncwqqO54NVvgQpQmcKtFt0hUXOcDShut4s7P9ZMNPhlaLK
	A4Z/QUg8u3lZHzvx8XVtW9kSWCmlPO55KLARzGvNwP59xNccnvJmnjC07kmKMLRN
	TE2sWwL+t1GtqWpYfOwCKytBcFtqChpOyvW62uTsr/bOzyZS0zhEZN6pUgMVadeu
	gOIOpw24yULbwloHhzGvklAtmh9yOL53fsc/ChsSegHhfd7If4o0PrvNSO1I/UaX
	Bcp9lK2v+/lxLuwVjK+utr6dN/4l9M+c/2r1ZwDLaorteBnJ4jvgI9NdQakeE0Kr
	NMYl+w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awns686-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 17:33:56 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9483c030e3bso10532309241.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 09:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769880836; x=1770485636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1pl67zhaQRIlZ7r7pA0ZyoUVVuJsyuZALZX1rr0pn4=;
        b=iZJ0urW1OGSXjxRCpNUGuQoFgsUhEZz++YQmEn+uah6IMl8MLzrxWqPi7vJADS0Cd8
         u0F0LfY2voeXBgSo//CL7yfe/Et8ibyLorMT5shuwQrZxhvRpMIkQiSqfo8pRqYmiQxe
         XmZEj1lfH1bseRWP9uuUtN+u86DwfPwbkf1q7xUj7X+0HrTGDrOdIhjI2r8tNfRlT0y9
         /pRLEHZMdT4ikWcjiQhCGnECSg6ZNiZLoLO+Fz7cX3QwGS/EQmSj4Ob99ZHlG/fV8YOl
         /PGlKI3W418A5NCYtGJ692IMOH11VKqMZxfPHOXQ4NEtuZyfxrcmcyWK/ANw1LXGy/Kk
         lrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769880836; x=1770485636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M1pl67zhaQRIlZ7r7pA0ZyoUVVuJsyuZALZX1rr0pn4=;
        b=dcss2ES/88EtdxxOksGtUF5Jotmq38Yzk3llLhcpnRwwYjUlsuOA42ZnXjtFwtYHEZ
         TmpvBVb7x7+DBSqhpuOvW9yY3yxSovJd4efSa9kxazeDtZKu6LUh5u3fGKsvkTqRAUUN
         vNIUUZzHW9f3jbe8Dl4BjCRpIP/OKX+zUoL6H2NVJr6BwC77RjwuF85O7raVavjWfvGr
         fefzJP1GiSaQB6vbhb/RODvzh3EG6X/h5DWf+z91leSjDuGAP9ZnAqApRxW4Cn/6zGiZ
         GSFuJgeZudDR2r46YSVJ9YP9g95O2WK96tbzPx1TA/MQeXbln94pjumfNVSpFJPHSgHc
         AT3Q==
X-Gm-Message-State: AOJu0YzDKTam1deay2XpwkQwC5fGWtjrg+spyjVvV4EkWNNMu1q45drq
	SHtdR7D3Bnp7U+08aHAvp9rDWUls7IZUaz3heFibbhvq891j7cVoQebcp7jZyOeRliKWCoTsFhE
	621g/dcyHnPgji1eusufAiokpvltWf/sI/43EMtWu38aHxk/AMYF+l7sBmK/tXszBlPvZ
X-Gm-Gg: AZuq6aJYJjT0ZbXkJOo0jcbXR0K3zivPyHUnUskOsVD76Rv7zDaVP28U0qcif52iBfV
	v5wBguMeBh2IvQpjfbt8M7K3RlnygZl9eW3VniPLPWaWMGilbT3Qu9ZK9s47vTnDdXlPbVo/T1/
	5YDqOr+toQYdwU4XdUjUc/TJ+FXYS49HwxbzJAsWGoLeT6L1UwctrAX46SukSpUI21hOLOUofe5
	5G9KFevP73zOEMraJzna5tE3OxEu13TBduIH7Fbz/nC5g9xdLYm3HPLVIe/OWWwgpbqw8yfV5KG
	x4jfI+ELr5/Fouajm4w8ORr1yk+VXZydha6sFhMNFJJW+UABB7Iydrhm4XMDReqKXMscgwcZo4i
	BMlRUfl/NtkEchdpDIyfID6oUscJmGBdUhlK1so0uGmvalW2vv5TCKLz/UQZgaTxDTd2/xr5W5x
	U6CPqO9/uorwFS7pZlGBDa29w=
X-Received: by 2002:a05:6102:2ac8:b0:5f5:259b:66e1 with SMTP id ada2fe7eead31-5f8cdaa2fc8mr3722615137.3.1769880835589;
        Sat, 31 Jan 2026 09:33:55 -0800 (PST)
X-Received: by 2002:a05:6102:2ac8:b0:5f5:259b:66e1 with SMTP id ada2fe7eead31-5f8cdaa2fc8mr3722605137.3.1769880835147;
        Sat, 31 Jan 2026 09:33:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074886f0sm2443236e87.24.2026.01.31.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:33:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 19:33:44 +0200
Subject: [PATCH 2/8] pmdomain: de-constify fields struct
 dev_pm_domain_attach_data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-iris-venus-fix-sm8250-v1-2-b635ee66284c@oss.qualcomm.com>
References: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
In-Reply-To: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=880;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=32YQR180l4XuatpViT6nfN9ULShKtuaugvJ8/48mdxQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfjz+kozKhJSLZXFwUNSKEuTT/hOBSPTm33d2S
 Fku3cGVJ2yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX48/gAKCRCLPIo+Aiko
 1SpGB/9+OyNZPfI4xAgU5372SEe75MiUrRaQNOjN0AV5lSPjuhkv/F97SIkLrKe8KRSJ77F3TWp
 yUIsOB246en8dBzWgeqSlUgVLg7y76H0oxGP7eqDshW+4kh1jHNvKO1L0YjmQEFmrQ4wf6/cmd3
 RhACkaf71ELUYZ0TmC/Ih8eYIIPtK5COv5vzeJriXSCeYbv0r5VEWzitnpVAX+KZ+nSoVOE6CUE
 p8WgyOflHMMlVQ/hrB9V7zi/Xg2jHwon/CWcrUcjK+spP8lxHKJJv/7nWpSEPNO9xQX7S/4N126
 SVOpQqQ+4SeQC97WJE0WQNMg2w1RMk99rJ/NoMCo+1i11Xsy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=697e3d04 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0MtQHd9Mo8yxAPGUVWwA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: JuyO9voQ87GIb7xGUgYDqx-p3IupFpJ-
X-Proofpoint-ORIG-GUID: JuyO9voQ87GIb7xGUgYDqx-p3IupFpJ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDE0NyBTYWx0ZWRfX2RQjuJIC5IEU
 VflSHp1ArCkNWaE1AKMMpImU07Ejkb5SFt0Lj4qxhnbu1YRi83zPudws5DcLA3LuW0YtzSILrpx
 i80CqAaK0uRCrsk8eZznNxfew38EGPqPyVXK/aPBRX4DooZUepWruVcrDmjy4ix9qrsCbgFKi7F
 Gyt1nF+WEXqWMn66rwDUDu+/NOvplbp5pgiQBBomjAigmpkXQ0sRIlHtlZV1oktJEu1lH2u7jnL
 LIpkRAdj3cSU8yJzA/mnsUBxMmcYy7yAoCgqojrhIzPrxJLNeTa8fpC44aADHTGwmvfhtbYMhcA
 VX29/I+rxVrKRoDqvV14IffPECwlaA9gUzlx/658vOO+xa9Q4C8lA6gCwNiJ1aUB3sQlg0GPaZE
 TjiZ7rXhT7LIHTxnoEa8/SsmcxCV4PQo/nJzp84N9OHxRjnHrWzP9q3pvdnRj9uPQstKoqSz0sT
 Yazfjt5itYj2aRGMHtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310147
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91378-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 757A0C341C
X-Rspamd-Action: no action

It doesn't really make sense to keep u32 fields to be marked as const.
Having the const fields prevents their modification in the driver.
Instead the whole struct can be defined as const (if it is constant).

Fixes: 161e16a5e50a ("PM: domains: Add helper functions to attach/detach multiple PM domains")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/pm_domain.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index f6f6d494f728..b299dc0128d6 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -49,8 +49,8 @@
 
 struct dev_pm_domain_attach_data {
 	const char * const *pd_names;
-	const u32 num_pd_names;
-	const u32 pd_flags;
+	u32 num_pd_names;
+	u32 pd_flags;
 };
 
 struct dev_pm_domain_list {

-- 
2.47.3


