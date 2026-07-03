Return-Path: <linux-arm-msm+bounces-116273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tVYRC+WKR2rfagAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:11:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BCF701087
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:11:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KCQ6i5m+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TV6nyw85;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116273-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116273-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1627D3050BC7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 10:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029BB3CAA50;
	Fri,  3 Jul 2026 10:04:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAEA3C9EE5
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 10:04:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073080; cv=none; b=K3cWu9CNNekfeU+m/u6pqiWDAW+J0+NXUkjRJWIQdOMnjoFyA2EJmox3DEgLdfWRiQqlGKBibePc3VqkkmHUmca7jyPCcnYWcRoOvXkhTPUQWy1v/HWr+TRzngfLZ8SiuG7cgdCycOEDq6uyxUm2toubi8iuuSEARTSKDyaEHRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073080; c=relaxed/simple;
	bh=JfjK7thpXbrrPhwyCS15MQlU8HtjezPzY6FlkiPWkv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkIqv+ekiZXiFYpDjJ/9tvwSO73OTZQOOsCHxh0ujCZX3QDdcvjLNPa/3LcFAELwVuvkx+HVMkyx1/PrhtsR4pNI6BlCSTaN8OMv9bODwhpZBACgHsTG8+OU3MEn9PhDbA7R7YiupBf0N0CJMZdVWy368BpamQd2eKr10Ujnfrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCQ6i5m+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TV6nyw85; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rs9T3123880
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 10:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rKjHG4tTd9LIUQ+3fOPrSQ/CBSJcIEba4Q8qoWmuJ8g=; b=KCQ6i5m+buD11unu
	UL2krd/oCWG08il24JR7usMCmWEkPqS2ouzmfGuxwLfYPdpudBgeKqKXezuE1yhh
	3UZ5Q/SG3HKOIrcfGikuFsVovyy7Qe8W+k8u+IcKEIKlmrAgz7LuU4KEf3xOYJGH
	il8VsTslWdv6uAp236kY3JVt5SRUnoD1cFJxuR+ZJ+0ix4fhzOYQ46qrSKIa3cgq
	Sv1FOcU8vKzAuAs04NsSIOWrs/q5h47J14qmJTyJ4K13SbXB1tpSL3jXxBethlZT
	CAYfAPjD0pB2bKS6xeyi7V0U9nly0D7lZ8OQBc0hvvzVmiebRaScc0RFbMcLAzAA
	DE8oXw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpcsg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 10:04:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e606e8f3eso25866385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073078; x=1783677878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKjHG4tTd9LIUQ+3fOPrSQ/CBSJcIEba4Q8qoWmuJ8g=;
        b=TV6nyw85Dlp2uKJpJBioHg8scNtb7647hWbJ+2ubzkIy/U8ng7iVXG6krSryWOjwoU
         wHYNATifGkzBrP+DP9hyIjiW7uX1fbu+tmlxsAy0fwIu491CXikqLnfOYmXvFG0uSX3a
         hT5SzJURtYTx7+K8rDcJrw0dyCtokpzXiYqPSwM6KJg/nN/GAHe0EkbCKuXvSYwrv19U
         GJkXErA91cIBm7/qKwkgJXzNpp4/Kj+w7qzYWfQeoWC3AMa8Ll4dbocyITPF2kDWSj2q
         e0jrcamV9JqKoWcLetUwvACPk8TqRzCR2ijMs3QaD+JqewpFsIkFhIsTDM5rBRV/4Epz
         q5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073078; x=1783677878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKjHG4tTd9LIUQ+3fOPrSQ/CBSJcIEba4Q8qoWmuJ8g=;
        b=sjOnvwa2q7LMJ+sLU5r3T6nygx13RbxSoeu/9xRv+yN6iy7z2ZSVNTLlCtTWHaY5S9
         7iI2i9Lw87TFY+cN81O+GN3Tu/TRV0PEnieiJYS+y1gyUplHu8fxwgFTfQM5ZjA6kR/w
         9oKa8q2sQ8PzZ8s0HnR7HVsyDG7JyvAHU2PKhKbprZcapiPN0oPKdZxuY/TYC+lYV5RB
         siL1MqnLkz0i8enHdfFfjEByVIw+xZFJXFRSrsB8wcjXN2iUZeq76lAfTV4reiaLs8HQ
         tJ9f+/vbjozGJTx3xSpKs7ZXuoZQuDFs7o85yigY21ryEXeppz0HaSRCyKWFsDF90n67
         6P4Q==
X-Gm-Message-State: AOJu0Ywq6kRK7IQThfiBrMeUO/TwBAE5GNE+IPDKLeYmdoDKuLidZIet
	Ri+rq49Bi9xywFKX3GIu4TxUWTCk+1oSaIfuFADSmZNVDNqgOGv8m9BE4EMYs5YbKPfjMTA5Es9
	Fr7SVTF1TZZjasUXJLLWQPqx2tD6x9CjoFFmIIt3J4E5DzK1/ngHSjfdsy6HOJ6lx2qNX
X-Gm-Gg: AfdE7ck/naMf9lNETdJr9AjABfTPfJfTtnklVHAVcsCRhSGrnM0vOvDNSdzETiaEUcQ
	W6W9CnGPKeTzNr7XKzobmU6KMxn8aX1+Xte8qFYoKwyhaNdcH/GL8h6UDLvTI0lasZSLJcQaen9
	EWFENGsx/hpjvxC6M2EeFNNacJ5Oq0iizHcfMEX1lwn7FMAyuXtXeSmniFsd9mIcW/nOGzUtC/S
	RD3GAbu5B76KztioO87WvOS1NPj/pUDZkvH9knc7KmvGWitpwPR9HsibJObH0bLcnln3VzWIYCo
	rqx1jeaBzkVlAhLo0RaeqM1HbFELOuSjiPMuiuatA1CIpAzWmFtBe1ZEoYZknkSsHa22BNFd8ja
	BVKtuwUlFK3vWUyvFoy5k64ieVlNrYQD2rQc=
X-Received: by 2002:a05:620a:3728:b0:92e:535b:e08b with SMTP id af79cd13be357-92e7825c3a1mr1371755885a.33.1783073077836;
        Fri, 03 Jul 2026 03:04:37 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:92e:535b:e08b with SMTP id af79cd13be357-92e7825c3a1mr1371751185a.33.1783073077438;
        Fri, 03 Jul 2026 03:04:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 12:04:05 +0200
Subject: [PATCH v3 7/7] arm64: defconfig: Switch Qualcomm SDM845, SM8150
 and SM8250 drivers to modules
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-clk-qcom-defaults-v3-7-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JfjK7thpXbrrPhwyCS15MQlU8HtjezPzY6FlkiPWkv4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kZMt7jLn4o66w5NIeZk9JVoDYmTxObv1FAE
 9FEmur20fWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJGQAKCRDBN2bmhouD
 1+3/D/4xnT7HVH26U7JwHKu+DT6nNexpYNUtlzH+mx3TnUlFPIe1OBu3TpsqcEOsByGOvpK1Dxe
 Gz+T+5aBYdIdWa8ow/4Zc1qUjdimRlD1LO8bOF7my2IuLgMOGOsPMehV7gq1NNKHJxAGqSXd/eT
 vT+zplbSzspOs9JoENz5QIqEoO50JmVPt1OPilNo8hOeUlTNoVSvnpAm7zC90mqTvtHkHayW2Ze
 5rEJaCi/fx2el3PscSDQ0xp1U13GcOWUUkD1RCiTVE5aDo4Ti10/0Cfdon1UTsnRavq6tWLgmDJ
 yrVrr+xvgJHyo8AgIrpBqArueHLVDhawsmNfVSveYUAtf0w7OB5FFDCo+dUSIDng9iOu+TuxUao
 7+leGAV475j+1u3NiR5CdCZBeDXynl7lU4F+yeTq60naTTQR7CPNIkL4eMDCQZPHVNCyy40Ns5v
 JARP1b+CbjkwqM5ObTVZGfWcBEZESVtlgR7fQUApEN7zg4r5iR40xXzgl7yxE3XbzZVGEeW3vnh
 Q9aOmH3hmtJdorGojX0NB2+hGe8jOjiXuSEtuwq0be/fYg5BbMATlEJf+ChvW4y37jDp2d8LKOK
 7mpHEkS1/wz46axUNwISWXCwnybWUh80cEZOjDpgFpTI+sC0BamdEclbPNPN4ZQCw6SWLz4FaGq
 XmO2PISvBrOJGsw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX6HFNluMJG4z7
 N1zvv03PVUT4mp6QR1llLs0gcaplXFuVXbUTDtTEa03qnrQKga2ABywfNhNrqn0VU2oHLmNv3BV
 lRfdtAoEBSiBIt5qbw2zXyLZer8PxFg=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a478936 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Qd1XWP2DvpO_7if9oiIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX0m+igqNzyC6n
 wgwyB6TyEHF98wMUiYqWy1nO+3TWkpSpSitWhRPZlwdKQ5mmDX0wQ9uFe/JCLQB530VNL2ZxBJO
 1HuXLyLFb79g+sPwD83vH6u9P/HcicnjSdXigCr0Tn2S2Rl1AW5SATvKYGfXfX2e0JnxMAS8X2U
 meVcTWFg9rIEr4SN0uU716vh+Uu2EDrYLz8Schj65ds3qAYwd/LVjQCWMpyogK5xHqPAgepraU6
 mJjnd8f5LPQd/cO6rRG1q7ErbcEE7QXRn8doYwonuWcmMptcl5z0oxG1EiF59V27nCH9d89ojwq
 QYrrixUkgOBlUaEc6Wr8KpKzAKJx8LUWn6xwcBv1KWiKQj0rfcIvgi/MgHztOLcbYXapFblML8z
 i1U+allk7jp3xKgE0Cock6RMsEO78vsPpDcPVR/3078+tC3h+6TRd27cTcTBDkUCy/J0LpUrtQB
 Evzb7zCCU+8MzmxkAtw==
X-Proofpoint-ORIG-GUID: fGvhJiXVgUJN_A4mXQuwT3PfogTNg8cr
X-Proofpoint-GUID: fGvhJiXVgUJN_A4mXQuwT3PfogTNg8cr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116273-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7BCF701087

Display, GPU and video clock controllers on Qualcomm SDM845, SM8150 and
SM8250 SoCs should not be built-in because they are not necessary for
platform bring-up to shell or even mounting rootfs.  Drop their explicit
selection in defconfig, relying on defaults which makes them modules.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Depends on previous patches.

Changes in v2:
1. Rebase
---
 arch/arm64/configs/defconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c9560f0851b2..386a0ad3fe3d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1462,13 +1462,6 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
-CONFIG_SDM_GPUCC_845=y
-CONFIG_SDM_VIDEOCC_845=y
-CONFIG_SDM_DISPCC_845=y
-CONFIG_SM_DISPCC_8250=y
-CONFIG_SM_GPUCC_8150=y
-CONFIG_SM_GPUCC_8250=y
-CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m

-- 
2.53.0


