Return-Path: <linux-arm-msm+bounces-115602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id igFsGtnKRGoJ1AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:07:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E21D36EAF22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:07:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HYdYnit4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="iPfLDi/c";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115602-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115602-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 020B73045018
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 08:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9573BED1F;
	Wed,  1 Jul 2026 08:05:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525C33CC303
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 08:05:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893129; cv=none; b=Ng11kmN/YN+fxRNW6I2lswx2d18KXjBu2grrKy28NakacM8PzdpuXdq2u7sTbHZbJHlJjveWgFkj8ZFMLhxW+MJgRbgsuNmxbFGdzqzHF1WDLw0PoGsIi2M5pvPT52bBVONiZ/QGQwo9lZnTDjppgDxHMLpdRhCyp0vNoRzRp+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893129; c=relaxed/simple;
	bh=fHoo/o0pniNxgxflVwP5KWxULHzHkdqwFQBUWy6yCl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bKucyTrwvL5rYva/XQr3SEt7qXNkFH4eXKAPLk47GKuRjUhNyWv93wVZAHkw8MC6+Fv0Trz5vsUEdCnGWzk6rEA9TrqTFa6yNzF3qN5CsRpFaWcDV5HCLC8J12SrP2TKGgSvDhAja1jBFJdLHFw/TwFmSO8raOzTM+ieOdsho2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYdYnit4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPfLDi/c; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lOaD133217
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 08:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ligDrNzbMK44kHcADmWs08
	4Nup9UVQ++TW5zXTdqAGw=; b=HYdYnit4KQmLcRSQWJzlu9Xj2jKHKHGnsFDsXL
	zzTDLdOm0xiqh6U5Mx4Ycxv1fblkSMTcsqU35IEeBwZxWWEzQyBvhq9T7LVSwXG4
	NFWpeMBdKXu9MjEYNS89SbWFnkiVRFJ1Xe6RB2xkhjv7uar2Fd/vuVP61YnWYNYO
	l0s4k/D9kwSLBlyDh9zhfdcjJA0/zNsk8VZdoja6ugbXMPk5NfgFVePVsWtSL3ap
	dWHdlpZWkb2hf7CHcmP/220jHwD4lRIEcNDgghsIDLIzCOHP5xRc9N2+O0lI1r2E
	OjJKtDuYkUmkRCEy+7UhetpzmxBsMheIp4w3C1MviGUkMgGQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy1jdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:05:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c42d96713so450359eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782893124; x=1783497924; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ligDrNzbMK44kHcADmWs084Nup9UVQ++TW5zXTdqAGw=;
        b=iPfLDi/chncbdi+V+Yq3NE7p6BQkYiIf+N0gIAcCsmdK/1fcT+/Tr9jUfZAwTgbUOQ
         Ie5l09xCiakpzpIbVQx9SsD4lwkzLoDsZcskxTfg0+wV5ff8ujp2ol5+4eq7bxIBQIXa
         veMlaDi9Of5t6s9WbeW4ZWITQDAKuETPbpHXd+IzmDOUgcTLPQuywh5q1Puyo4ctP8Yz
         boO+7cl2V+nx6yf70LuzmwkwX93YNQzyReCMksHU1gUgijbBCis9M2ow/0mvo/PeDM/y
         YD+redpRR1bUdcrkw6+fXHI3W7pVb8bq+CiFkzGmuraLBBkU2AHHOsUgbV2YQrGdivKn
         1PvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782893124; x=1783497924;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ligDrNzbMK44kHcADmWs084Nup9UVQ++TW5zXTdqAGw=;
        b=VF7iELnSAeVoaqvt7BNdksfhOQun1ocTq25BRPbedC8/zPXVmcBBZOSdJ8bU2tj1C/
         a9qIiMn0BVBk1vphLJwyPwrRI/dOVdaq5wonTEM2x7ZO7vPit3JZYAxzYd0HjAlsZ01Y
         BTTq/Jq5TzmMsc7aUltzR0Pl4ikvaT4Kq+mtyIv2gILP7o8EGje5kQ4KOy7QH84PuzNu
         0HbcDgJlDVECgMouquIc9VraKwFhiKJ8xBZDWcbxN9CdwujV9kPOEFdc+1LLUz91EtHm
         0x1/+54N/ibdKtyWzbW37tdloYYOV5Vqi9vMka2uFSQKUeCLleYfPnjgCDCkfmVaRDlr
         V3qA==
X-Gm-Message-State: AOJu0YzBV4I9h3Et+t8+Q6aZ3kiCXOOnl+5tuwaua89/ojYG8Nz+svu3
	JoOR4pAPkSqBGAEPZBMYiAnvy7rPru2Oz5unngjfNMq1swR49add33lV9k8c6+Wb9Wbq8b9zNod
	KQNwYZU8grO5/hSyzIqlLBWMaOqGWZdbrPmZr2keh1V4BAQj0vrhf3IzfEJ0u1F9zroiW
X-Gm-Gg: AfdE7clCDlBngRRgGMPdGKibVUsusfkFq2bJ9rH52uMgHBnYgRseBtUXjsGfL0FfS+w
	+OGodLVXCS5UfYtab9YdA1t3+/+sT6FxPvr5wRgjysbZym9i9vC2aK35gUAA+yYeO4H7+hffZbz
	ZLnz4UxXvHKzDbjQL9SSuRtzm2raSBep9Lb8ZS5P/sMl3rVn0rPCv2cH9eefwPzWNbKDJrzf1/D
	dy+4NOqccdupx0nTmzWJAPCvtGT45+7FMyCyo4Ge3rAmtxxF0vMX+3psDrVRBFAKDYt3pB1a4/G
	vPZXu4zie4i03t3Zx7ssocxNQZWjiPDRzPqyhygrLcVfKlDTDdbS4pCR0ox+fZMZZrLtfkGQzN/
	SUIeRRotFMzeJRF0ecUnJKww0ZgliCvU6g9UjoByjQQSS7JXwKppk5lPCC6YRH99aZGVmzCyWs8
	rmV/3g+Py+d9qWdVBY6wgWYz1FIS3iUWD63FWy80+0
X-Received: by 2002:a05:7301:607:b0:2f7:d419:dee0 with SMTP id 5a478bee46e88-30eff034c70mr727380eec.6.1782893123655;
        Wed, 01 Jul 2026 01:05:23 -0700 (PDT)
X-Received: by 2002:a05:7301:607:b0:2f7:d419:dee0 with SMTP id 5a478bee46e88-30eff034c70mr727342eec.6.1782893122945;
        Wed, 01 Jul 2026 01:05:22 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2fc12e7sm16519480eec.8.2026.07.01.01.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:05:21 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 13:35:14 +0530
Subject: [PATCH v2] dt-bindings: mailbox: qcom: Add IPQ5210 APCS compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-mailbox-v2-1-5e6ebc874e4e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADrKRGoC/z2O3Q6CMAxGX4X02hEYwpQr38Nwsc0iTYDJNgiG8
 O6On3jT5LT9TruAQ0vooIwWsDiRI9MH4JcIdCP7NzJ6BQae8CIpeM46Sa0yM0vS+i6E0hpRQ9j
 +WKxp3k3P6mCLwxiE/miCkg6ZNl1Hvox6nD07pRlsgYacN/a7fzKle+Kc3/9Hp5SlLFMil3gT+
 qryh3EuHkbZbt44FKjWdf0Bq0dlwtYAAAA=
X-Change-ID: 20260625-mailbox-01f977bcceec
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Far2o29yu_UF95HQOca162xzptSoRrkT
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44ca44 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oC3GMwBEtLq7gvGfhnoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4MSBTYWx0ZWRfXyRu53C6IopLV
 sjWRYgOgOrDk2ytIgmueFbYkgWTL//gyceP2D2KGltyDKAkMpMfpHrd0VlQtR1lfvO0PpXDOHpy
 V02nMPqlX64yf3U75rCmf/lzWqnUuPNaesofaIfTbsNbZKzDo7fnVK6sVmmgesUKZWqyry75TPo
 MDzrtst9AiADzZQ6U8OrQpZrs1G+i6GL4Qc6nwn9PKPqGcUHLhRthyh9/It52B3mK4JFircHJzF
 k1qQa9Rf53ww9iEocp1WKgD7NfItcdYdi7IW84JIVQRJWXHIdXTpHf15tQ8b3qGlD0loi1dgRBE
 9iVDGyTS0InnmaGgBoq4o3JEIHXsNyTT6GzAs789ghu5s9iJ+Esr0MMIVzb8vydX4GxzH0YfvgW
 2W8e9MdYXk5ZD+q25sOu0DMous0Mua46pIpNUF1UXGFzSIgMFoEqotjgBENClYvXD9AaRV5KYZO
 pD+9dUYMkFw50NoSGPQ==
X-Proofpoint-ORIG-GUID: Far2o29yu_UF95HQOca162xzptSoRrkT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4MSBTYWx0ZWRfX6tG+T0shhC6u
 lFzH37Wa5yBfZxD4k3YkdxqSnmQmhSkvRfkSIW0RA+MhR/kHecCVB7HlWVbOFvbmAZ54Nrts2WG
 HLXuSQzFvKZeeJYRoFxZJhZxCHLrPYk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010081
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
	TAGGED_FROM(0.00)[bounces-115602-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jassisinghbrar@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E21D36EAF22

Add the APCS mailbox compatible for the IPQ5210 SoC. It uses the IPQ6018
APCS mailbox compatible as a fallback, so document the valid compatible
string combination in the binding.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
no cover letter contents, it is a single patch
---
Changes in v2:
- Remove incorrect dependency
- No other change
- Link to v1: https://lore.kernel.org/r/20260629-mailbox-v1-1-3b75ae87c4b5@oss.qualcomm.com
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 1b4ef0688ca7..39bc374300c3 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - qcom,ipq5018-apcs-apps-global
+              - qcom,ipq5210-apcs-apps-global
               - qcom,ipq5332-apcs-apps-global
               - qcom,ipq5424-apcs-apps-global
               - qcom,ipq8074-apcs-apps-global

---
base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
change-id: 20260625-mailbox-01f977bcceec

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


