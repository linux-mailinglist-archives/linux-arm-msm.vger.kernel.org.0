Return-Path: <linux-arm-msm+bounces-115587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ff1oMVu9RGq7zwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 09:10:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A23F6EA801
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 09:10:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N3FAgpF6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AiM3JTm0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115587-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115587-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3AB8D30074A1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 07:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645DA3AFCE5;
	Wed,  1 Jul 2026 07:10:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF598F49
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 07:10:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889809; cv=none; b=cS7HXr6brrn+ms6NrZgyGOrMoD/4Ko922rSHzOqHY5151maZdnOfK9G3HaVPLHaEgkyuP+2atf5KnqS0NxtJuhvJ7olPWGLtZKJQAF990IAhqqIIdHOzwb8sNfn68WPaCAaHPEQ+WjPQzUMv2/wOTs4/G238caOnKu6rGCdo63o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889809; c=relaxed/simple;
	bh=6XedRWs0tAdQLU+ENS+Cwbaw+CbvhGUee8wliZmU0xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xf9dHvCVOSrMeRO6cvUC9R0waW30gttqJYj3butMx8/LMHZZnIcXBRTPrGhmJEyDJr4D8Gv7pRbgwePVbsEaLAKjP172lbqs8ecfOXMbtDcOjxuZnFhl/giwVV2uIjjBgTk25gad1qMfOcKp41FpzE0IAPPSRXDXwNhxUHBbbys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3FAgpF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AiM3JTm0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lYpt137168
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 07:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=; b=N3FAgpF640eEDRtz
	W9Y6GKck/p7tNPP6W20/0d7qAV377UyEqWwBX2uicUbx8OxpSujX66dkPxoFO4Rt
	LtIltSofIQEP8lYzcYTa3xoI+l16LMtKg3VlzHu4es3HAhp7IClsXA7O+LW4Run/
	16e52/x/P2whpqNqWBN9yKhS4V8fKUnYUgYGzj2j9/Qf9DzoMvxYX+2wnHhfGpXl
	3uQ4YLUmC1QucJXhCOtSFbqjRuTcUpcYoemSSQVMpTQuhfd/MmzTDvAJaltKjXsE
	IGBe6gmgURF1KveOldNb/QhGyyrXG3f4jMb3SQq3OcdnExkTqzvg5FNXylHcWO2G
	4p7S/A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0aubyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 07:10:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30ecfc5dea0so605650eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 00:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782889803; x=1783494603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=;
        b=AiM3JTm0WZ6bZ82IZ39Gm2HB1mA35RrCP7/jFHsPbYiistU/fjoo1cO36EO3KiFLfs
         MqDoUKw5KnsKzqGpXJVKm/bYKFjO0G2sW7ST885G/Aj+Qx66ku6+ggzCQZm7Gv5oUCWb
         VzBLGr7JZ/JtjKYYrrr56y373gNM1Yrgy6N8EzHRKtsBFdqNMfgzdlfVagvZV4ATQCZf
         DTY/9VJgfpzt9bmJtfoO7ryO28Amxez3anOicgsr681V+3L2esZAXE3P2KaAC+KFwp6o
         Ok70jTIWnpUMcsbd/IzI7rJgC/d0XOOoOyN3opr6QfeseLqCno8woJi2GgrDtVhiViwX
         7CsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782889803; x=1783494603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=;
        b=NoGzT1LN2eSzrYUCN5vZDC9xyi2hmpgo6P+xNuSEwCqFSvx6faZirEyTuOMRaIanIW
         vR6uEILXOUbVmKnYdkdDcVo2kACDLKqXbzL2tTOTM02q7H4vQZvMKZR0F5Ov8nzV0prR
         mt9JJIpV0eqvp5jQ5xbm7WcpJCXaSDtWv27VSQ4Lm0J9y5HgnH6iY8/WxY1UfRLb04ZZ
         6QT4FtPy3+vJ8BZRnpysc3VbrwURZgskTQ0hgcIOXSaSbaY7NUX/3coiRN7QitS9xG/b
         NUwAjqPZ1RSVRJQL91lp5GXZPkZ9XFoE4t1Y+Ph4pGtsAU3XhCBJIQuZ1QK0S1Fc6Zkl
         bv5A==
X-Gm-Message-State: AOJu0YxjTtJrhy9u3Iurz53XpHXGiwwXZbWBlBZC8hSPBX84BqXI99NG
	x8hzBbDGnOz6Hh1KTf9taHchrHaAjV7IPZn1/9D3eLNK90PgpPFqbgf8XgmoUgxcVmoNtWqbwL4
	4UVPTBP7FNIX6EZMMtFel4lClfyTBFkK16NGeS9hfwDZeuS6BC69Ynfg28y0b1h3mVZeK
X-Gm-Gg: AfdE7cmaEtHZL1YEHVmQ+JMKv7ihP0x6YQ4I9A9rPx9aON97ISx5o6CV4mS27PIQ9cB
	hQ04AHTcQ0vKAnwFu1CE5GB6TWJyV21S+sk3A6j97F+q5Ra+smacW6Op/Oyl9p18kXypjvNGtkk
	Oqk2hTpiwPWWptVO5/cmmazJhnW4U3SojXsxRo2aXD2ylWnV4K1HxBIbzDU6aQIaxHs/LuFOAlg
	HKedH2WKSfi86WBmRyfRFBuc+9FhP6cLWT2mlmgd8QdOUdl90JBcl6Xqnx9PxEki7U/JeHs/o9R
	+AIgAxWrjI54LSQlhYTURMreBr2T/JqCnkSS7NXJaGyGRQQr7iNRrQ0DQuNgP1ZfnIcYB6ELLoB
	PKvYlZ4rgT274yB0GjqKUTE9bOxYk3PlynqCe/wbZAiNtCasgXSu7+gpTmK/aWnf6IIjW1n8txb
	S6uLLsuQCrbddPgL/L2dfX7eGez1DyD0D9OgFyEFZu
X-Received: by 2002:a05:7022:4595:b0:138:407c:1d17 with SMTP id a92af1059eb24-13b36e031d7mr527226c88.33.1782889802969;
        Wed, 01 Jul 2026 00:10:02 -0700 (PDT)
X-Received: by 2002:a05:7022:4595:b0:138:407c:1d17 with SMTP id a92af1059eb24-13b36e031d7mr527185c88.33.1782889802426;
        Wed, 01 Jul 2026 00:10:02 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab2dc1fsm14426709c88.6.2026.07.01.00.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:10:02 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 12:39:41 +0530
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom,a53pll: Add IPQ5210
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-apss-clk-v2-1-776d054ab8c3@oss.qualcomm.com>
References: <20260701-apss-clk-v2-0-776d054ab8c3@oss.qualcomm.com>
In-Reply-To: <20260701-apss-clk-v2-0-776d054ab8c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a44bd4c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5uBAxpE-56c2IjUQXdsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: awUohxGQR3jw9UooqWQJXL4mcACFcMAn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3MiBTYWx0ZWRfX44eYsqBgZ9hJ
 yeWMPMh5FaROxBaW0voRDYO7azxhoaCL1C1W/gar2sCnlQkpEqf4LA/IQStEkdeAUn65i2zGFwj
 ymVupSMzWjjLLzCfvaOcxYa6q/iEK2c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3MiBTYWx0ZWRfXxA5F2RXHQKqo
 LFWEJ1RTiKm/peu70Yp0y7Bj6DsezGGoLgTbaOYeHu46Yr99l0hIDJDcYlCM2i4UP60P+D0YxkW
 WZAJxXoe5JUjUhuvztXazxPtYzoPmVmR3amhKfGYEV17aBk4a/0Hp6Z6QA6rssR9mhtFLoy2QzG
 dAbGCp/VuzzhKqo08mmhAy5/Pn0LuFdV7PdYnWfqjqiVfmcdSwd2xlp/IilFXjJ3M3j9NhRAwxA
 qaTJwkLsRHQBzpeOL+/kcDHw+1GNcGslKO+98XXpVovjjkOPHIWrvqXD4LIs/7JXNPUDmboYkGF
 v4LqocnR0x+UKxDNb3WkrvR9PYD6p8RJs28XGyhZSb193uQXCu4NAjBkRHVnfo9wftKDFDVN6Bj
 QQCTPSOYH2D2iDZqU7Tmh+skO9JrlU8G0WYr3owocc7UfcL7khSmr3plTam3XD5a4j+AjrU0uL6
 RCk4JpfP3A3Wxoosorw==
X-Proofpoint-GUID: awUohxGQR3jw9UooqWQJXL4mcACFcMAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010072
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
	TAGGED_FROM(0.00)[bounces-115587-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A23F6EA801

Add the qcom,ipq5210-a53pll compatible for the A53 PLL found on IPQ5210
SoCs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,a53pll.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
index 47ceab641a4c..1eec77e75a0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5018-a53pll
+      - qcom,ipq5210-a53pll
       - qcom,ipq5332-a53pll
       - qcom,ipq6018-a53pll
       - qcom,ipq8074-a53pll

-- 
2.34.1


