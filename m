Return-Path: <linux-arm-msm+bounces-114865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mOHMJDQaQmoB0QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:09:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EE46D6C9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:09:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MOdx6e2E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cSPiG2QO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114865-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114865-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 749E0301809B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D202E3B1EC0;
	Mon, 29 Jun 2026 07:09:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E5A39281D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:09:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716954; cv=none; b=fxOZSjPnPVfZPJu3IlsulHhRVXD8XJ3W58LgNCeDy498P5LvHjgQlGLoUeg/vw8ntQ85rzqKDzDNX7w6O+4MiVl5w6O9BDPXrpyM9cIiSzsdEY6/n71gCDJVBTKXHvj6vddQqfcC0cdQqsgebPFvJJIcdG7QREj1WHUNt9BEK+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716954; c=relaxed/simple;
	bh=4ABz6wJPYJ1ehhzrRhbxP1bfJwHwHvAK6ZKFqk437qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=s8gCLJvEaCgTn2p5rsm/Nq1/VOtfuSVlKL6GAzCkD681XChQewsUc+lBcOXycdO0NVbtJ/7pn1TEOm+NPa0yC1O4noZP73byRC+SPyCB/4GOk1ZXYpoywPWfJb2SKBjb+aG5BzRCOiacKHURpVoze5Ls+bQ0Y32U7n7cKEN8CoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOdx6e2E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSPiG2QO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6r4A32088844
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YbkP/92NDSre5wnTH84JFq
	wEsaY8UPj+553PsJZAyzY=; b=MOdx6e2EgBt00w5dKummkTmcsdE6Yhc8LrQR/2
	lPSlZKuoLlf6ckH1eZE7Gs2Irj8KyDdZ/XmGSNPKHUMtMGjG/HJiPaRlHI4MCwKJ
	E+7PSQ9v5kQjEqmPbx3UqXLVMyG47wDjuRrIRmWFASoPVkxMKJakxbN9ZXSz/Xti
	qXnVp6JEGBDbN3lFSmJ/TK8zJr0hq+Oh63Cf4rWMnEae5oAkg8w+da2s3bW3Cgoz
	6e8IeRF04WcNxGywxsmiBgXpyeKfgR4w2eV34myEr+qJb4Lhn3r7w0Y7mJVkgQ4s
	aP+AtYmkRrj2+9ptGDjC0wC0h01xxlK9cpJrchok9VyFCycg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vgchs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:09:11 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c9bd8b9c7so3570004eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 00:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782716951; x=1783321751; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YbkP/92NDSre5wnTH84JFqwEsaY8UPj+553PsJZAyzY=;
        b=cSPiG2QOiOy3XSWNVCt2ZOofPaHQHnOWmh4NmwkyqU3O3dywMsN0EVqQcKtatPqAeo
         p+PgSKHEBtDf+5RilJW99xpt/Hdu4jud7n03PjdNnv4qgV560zWZRxDrtClldDjaokCc
         4tbfC0bwdCCOF3eUd3KhtJjeZyfBAIeOZEutBCtW9xNF4FX8qzd4ww2orIq73L1T6wZq
         8O51+3uQyq8b9HPCe3pXtuHuixUjwVyf+sC5fRMBaRuaiaSlOO+dwdIxgRSe78nqPJve
         /iXUaGMxcXErFs7cavMx/w4Io0CKFrou/0FTVdFSdMYq9lWxJKULEjj/lnpRLHjyqLGk
         m6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716951; x=1783321751;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbkP/92NDSre5wnTH84JFqwEsaY8UPj+553PsJZAyzY=;
        b=BImGGH7qiHq/maqCUIFK7C4AuQQeTr70Fot+ynaBipjxKdYFVaTlhbRXxX7AQ+uERv
         FXFrdV1rFDuHf8Opvp845D8z9LdqDpPTTWkQ1TJRH+mIVeXKdaQbd1JWmyBhgbRbDCY3
         kfHTtBYs5rHVeMuw9qi96LduUAl4Nwqk94Y7Zv5KUzcyPq9DILYNjnTV7ZnIS9/64hHC
         LMc6bT0qjMakV7y5+W8c0vmSxvF5U9RWzWAyl3mYGIa/VEscStK48+ZJ/Fr4ozj5ZaPu
         y7dN2X4+UfST5KMBQQ4W7WPRz+X6lJt+04hwgoYtYAmaIk05ZQJVqIjdHEBX1BZlAg8B
         Ab2A==
X-Forwarded-Encrypted: i=1; AHgh+Rotsshmkl5wRxlpvsWpg/sVC2+0rHu3votsEV43MD/LRp5OfQizqQnPvBY+uWnPSRrh+bENyBHNs9MFW0oP@vger.kernel.org
X-Gm-Message-State: AOJu0YyySclCnH5KgRT35tkbOad2iUkZy5SFN8rYc9difdxnNZcfEbBH
	nbH2F/5O8hNBdZWiFQX3AnjZpqrb4VRuFUDPJM7DSuKXSA7wYd6oFga6L6hkuZh28zyFasIlC2u
	AeHpyGNv8Zl32A9dUtZmCEgUo8/CBLVXIqKk5CfEvc7Bmxz+tJ/er/NnWJqfwWK832cDN
X-Gm-Gg: AfdE7cn7WWjIB8rszbRWhdTnJphbYsYyxSLFl5XlOhdSws2dTkIIbfYgJhdAJV92xYY
	17OksbxchatH0an+QE/XTurbgwS4RdQZG3xeBCqXvWSAnsKHn0wiSLRQwb9cgMT5sSvVaJsUipY
	9tBucsafpdnqpk5wWpGTJDLIaRRHw2QzKZN3Sz03AM75PtdCbE2MVPNK7E5y3s/fuVWSHuM+Fab
	mr/+gNI5T+2Axx55TU11shyltREO3QFJ+A61Ya1Q+3WuYX3f4BIA6Xichh60zWI+2Un4eh5GZVg
	2SYmwmCJJndZawHcblwIHLjYQhjK8BcUrcfeGIaoFIknRxvuPwnFlmV0oHSzvGcGJ/Bp3bcCdNB
	eVOIXYNeQBQR5xAhCF4tT5Ibbfdaza2CNBFSYqsnRcFwp1odUXrnr1hvBrz6llQ==
X-Received: by 2002:a05:7300:e790:b0:30c:ab4f:9ba3 with SMTP id 5a478bee46e88-30cab4f9f4fmr8669239eec.43.1782716950582;
        Mon, 29 Jun 2026 00:09:10 -0700 (PDT)
X-Received: by 2002:a05:7300:e790:b0:30c:ab4f:9ba3 with SMTP id 5a478bee46e88-30cab4f9f4fmr8669209eec.43.1782716950061;
        Mon, 29 Jun 2026 00:09:10 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm14519280eec.31.2026.06.29.00.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:09:09 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 00:09:05 -0700
Subject: [PATCH v2] dt-bindings: watchdog: Document Qualcomm Maili watchdog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-maili-watchdog-v2-1-5cb9c83a581c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABAaQmoC/12NQQ6CMBBFr0K6tqQdpBBX3sOwKGVKJwGqLaKGc
 HcL7txM8pI/760sYiCM7JKtLOBCkfyUAE4ZM05PPXLqEjMQoISCmo+aBuIvPRvX+Z6LWpVQgCx
 KlCw93QNaeh/CW5O41RF5G/Rk3K5JCrXPHMXZh8+RXeQ+/hVKOP8XFskltxVatFUtKyGvPsb88
 dSD8eOYp8Oabdu+yGlUx8oAAAA=
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782716949; l=1158;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=4ABz6wJPYJ1ehhzrRhbxP1bfJwHwHvAK6ZKFqk437qg=;
 b=74cp4mhkT9eiMa+4wjLbFiQX3XHgCURSPKcBw05GNH/2Fe6354++2zTgjFtYOWiPXa1wURIrs
 Xet9ncxNAR/BRitOteCitTRue8+A4hT/Pi+QUm6PyrRuhqfZzO0z+Gc
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: D6Z5FfJX2jG-mDfBgbn7VPW6_E5kq_9E
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a421a17 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lHQ9vJlm6CZYuNRvArUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1OSBTYWx0ZWRfX/QX+vHNSv6X7
 7yqDjH7r3G9/Mlhn5niOZ9+TPOxXI54KOnFEcJ1dBfEWZWYMdNCpmnz51jiNEPwYl2K3h7cd96C
 k8VnprMIoQSIg8jdHSNSqzzfZorgvKk=
X-Proofpoint-ORIG-GUID: D6Z5FfJX2jG-mDfBgbn7VPW6_E5kq_9E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1OSBTYWx0ZWRfX+8gHQPbJ00Ya
 sWdx9XZ1svKWD+NBypwApZilsexZ8UO+pfhpT2awHbl+xGhbGxOPZlFTGCXovmWY1JrKVPO3gU0
 U6cBPu29Wp3jqd2GLKOe4klmP5e7JHF4aPErqEluQxF7o0YxWJKsMRK1XjaQZI5VfrMB+LQ6Yxl
 WkC0+LnZk4EJR+amTjrIiiLkLAJVuvstUnDYqqtKQwUbxF2262L5SbVyHwOH0wDOBDW7oPr6HQt
 vwT0qga7Hx1NZJg4BYncJqocZvo9u214kncPITRTa0ANNeayXWrVYNMwDlbPUzYY6AE6PvIooIJ
 aEJCigJOnuCtuupRguLB+bREOu1H5xnaopg0mRmHsTLIn8EqVGdBLOrQpQBnFxpTTtvKIQVDxXD
 Q6M87OZ/oRwt8qPoDO5FGgKZbRef61ZT6AlVGt05Kn+l3VaydBd52cAFc99ZVqz5PsJ1lze9g2E
 sOfIQ3EE/pu5ELv1g6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290059
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
	TAGGED_FROM(0.00)[bounces-114865-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_rjendra@quicinc.com,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28EE46D6C9F

Add devicetree binding for watchdog present on Qualcomm Maili SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- patch resend
- Link to v1: https://lore.kernel.org/r/20260524-maili-watchdog-v1-1-f7efef781701@oss.qualcomm.com
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 74117f5726a7..4ff61102e407 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,apss-wdt-ipq9574
               - qcom,apss-wdt-ipq9650
               - qcom,apss-wdt-kaanapali
+              - qcom,apss-wdt-maili
               - qcom,apss-wdt-msm8226
               - qcom,apss-wdt-msm8974
               - qcom,apss-wdt-msm8994

---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260628-maili-watchdog-0865232135e1

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


