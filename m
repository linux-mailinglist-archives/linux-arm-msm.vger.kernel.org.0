Return-Path: <linux-arm-msm+bounces-93230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BkGCvDblGmkIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 22:21:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7470150B49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 22:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF72B304047F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 21:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9006B29BDB4;
	Tue, 17 Feb 2026 21:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iJso5ds4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GxgXe+Yi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEBB27FB3C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 21:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771363271; cv=none; b=bZOxBW42+HcUXrcjAMd+WEyfdw4g7E/kARRw8Y/FaNm3HcHQwASBwfxWmiEaMVulzQz/pYQZU7OwpggeosdvQBFAlj/dT3992r0tzgc8JZrk8aFqz4Cj8s/gFYGHFYVMASriMzc4kcF6srn/uVF1e3SKI4VJ8K5JArA5pwh30qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771363271; c=relaxed/simple;
	bh=8EOzvFckDpsbM/ttEHapCkFpM4U16jSMWZzGm83YlWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rZdqfnBWL0Z02bIwMMPhMJSwZI3vGN9n+Sq93kaDCSIv2EOKFqqZ1N0sztpzkAP/fdXJU/sOebNUK9epLsiXZwHKAyDTUbpnuvMDPC6kLCwAprkxhMEZFRjKD3S57OE1DX5aKYD2GtKhsDfmZbWSIa0UNa2rzvfpCknxo7gZe6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJso5ds4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GxgXe+Yi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HH7n8S1545005
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 21:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IKiwnJcyjljwD6As+ZOVHTeDRLNk3mbNvoBiz6O/sLs=; b=iJso5ds4XBlJ+u2b
	Mr31rA8ZKYhpwMrAH5eaVqU0w+X7jbtVvmmWGIUxeq6GUZLQJq2vNMk9yVSC50gt
	Ch245ME/vRvCTeXot26hZ2EUmtMftI0IAaIgIR5y37kphsFW7zPv7vqOSh5KFdZP
	CiihwYgZHpy+9mgKUo8DJuCiULjSDJsfgFvZYXoyprNxJDdINk/j8UFD1TDKW1vz
	6eaISNzL/syrO6ClWXBa1/A0twNH4TriFyzt9g29ZSTV0txlX/fdkkD8f4g8i6vU
	r5KqSosEgFh+gS1ysL/UK/16PBYOqR00M0rtNb5hp8p75vWrVu9gUUSesRmuY/dL
	ESFc6A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ajuvwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 21:21:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3b0d938dso3111618185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771363269; x=1771968069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKiwnJcyjljwD6As+ZOVHTeDRLNk3mbNvoBiz6O/sLs=;
        b=GxgXe+YitzWYOTNcepI1YAh9rORT0dw7aqnoCajRWzcSPwOH1MHTm2WFzeFRQKVG7H
         4j+nmiyWWSpuMcw9gF6wesVKTeE8cGYE6n2TfdINfIZHm2KlugCeufFFrJGLwHFfgOXj
         vTNPgSoUqaDTX9k4RhHjp3UCvfOpIVYNYAKmKDbE9kGfjvt2mjUwXZktRmOLHnp8Pljj
         v8tnjiOMuwTqJXtZHRfLg1wfnE6FJUD6NYLpIKYjDgB1/NDZZatwonYp/oWPcFiJx9M+
         lCgMVb/bGbSZDTxxlqn40rcqyg1uNBuguXSafTmeWi1U9PAWypHpYZE4w8vQn40IIbhA
         A9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771363269; x=1771968069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IKiwnJcyjljwD6As+ZOVHTeDRLNk3mbNvoBiz6O/sLs=;
        b=SZKjErSMhaKX6jpJi8qTb8jZeDlpes9CkHIUYuXxZajpWikOYjfS4ZUI7+OAtruhI0
         ceNW/wiQss90fqpEGYYECJjdxRJqdgpc5NI/Cz3He7zGHMAtsVJvpBFfiLDkN1WAE5+G
         5cpRVVLMPGz/kq+j7OuJIrOjHowQF0F3BC/hnxktM88f9dXA5MKPl1/dzzN1re08/Pjt
         8mPVFdYnNXrHhHMlpP9Us9AHArOqG0Wsia2fclrt8ExRP/9Mp2VlTwTOwlRxfMJO1dWM
         U0I/M4CcbllDm4eVnF/AbJNJoiPyjSTGuV1nyVsOfi4N5npvZeuzk4hrsZegnC6uxIEZ
         NrHQ==
X-Gm-Message-State: AOJu0Yw4lk5jT+oJdJLQXXOosZXvk9CQFNdjWvpWN8Nt8mq0fMP1G2tx
	h5NCe6UxcE4+BDmuHmHnAql6tf0C3OtM5TBGjBsxXvGnwQtdcl0wqu+V20GaXpLBTLR44ZX37p4
	akgG4pV845kF+HQ2ZziMA6a7zF3Ju1pKH7F9imGkuJqyvCAlniElsSvn17tB1biqcjti5vSA3td
	1G
X-Gm-Gg: AZuq6aKRhYMMaovzJqJpAwFGViZvcUJvvTClBCDS1EpjO/t23wpFLw0p7kywv5dG7Jw
	0mzd4/CBMcEZlbyZzwSc86sjy6wzYPhvZtn/iXuOIIpapOfOM39DkexPVpiMBlmEr18K78RC5/x
	+AwSNQQrAk9liT+/2arACMgsOU32pmpc7A9KuBOfFGMDoHR5HoNGKQJX7cREncOYxDi3llEM3NH
	T5pkRCW2XNKklPw4X7IQibP8Do9HATs+6zbEPcdHkbPunP1zf/qH58YdNnZxvOh/tvS2iMT1poN
	uRPpkGHjygKCOqUzAX5UkayMVJTb5VaUW4BXFdJPtUXPCRUFQBzCohuQrW5G8c4hNRX78LVGM9U
	OQCAbG9aesbptjWXgJaFP3m49slTCGyy2pPqF88LAH4qAq2I2b7RdWRzQ9flQ+N5vA+cE51a49g
	1KlZ5fDn8vOOxKkd3XFhsfJO7sGQnlZw2+AaY=
X-Received: by 2002:a05:620a:3705:b0:8b2:7558:409c with SMTP id af79cd13be357-8cb422a6bc2mr1692159085a.36.1771363268785;
        Tue, 17 Feb 2026 13:21:08 -0800 (PST)
X-Received: by 2002:a05:620a:3705:b0:8b2:7558:409c with SMTP id af79cd13be357-8cb422a6bc2mr1692155685a.36.1771363268189;
        Tue, 17 Feb 2026 13:21:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068923c3sm39293311fa.5.2026.02.17.13.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 13:21:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 23:20:43 +0200
Subject: [PATCH 2/4] dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-sdm845-hdk-v1-2-866f1965fef7@oss.qualcomm.com>
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
In-Reply-To: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=771;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8EOzvFckDpsbM/ttEHapCkFpM4U16jSMWZzGm83YlWk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBplNu6wRTWV3Y5tQpAGHqTnKPAD5FWOG/yH8bnK
 bb1k3hj/x2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaZTbugAKCRCLPIo+Aiko
 1XXAB/9Zyu4pXCvjvMO5vv5LKugCBNa2m3Zu6/zpDYFDpyHX/emcdP8+wHkmFNq2CQXDhr1WxrP
 cZJNB4qCqpJlCfl2WhXp7mSANTmCd9vfEYF5IIMh8q3MLUQ/NzmmJstoWovXR/8WFZS2VO9jlCl
 NKhWIBRWIzFsFGLeNnWYGfC2HFj/QD6fHeWPq7ClyqlbINw6fvTZtUZ9e78jicTJsh0MMi5kA6N
 8qSnSRJrSvLC+V0yhiMZZo4R5FR0vMx/oGk+8Ng3Hm6F18txG5SrEAg3QUdMGhG1b1VWWfNUAPz
 p+78RWPjQFdFse3EuBkeWCBz6WyEXOHQrgXklNLVf0a9Fadq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE3NSBTYWx0ZWRfX/2N53VlgzUei
 4z9nsMoQxQTwjSyRMMAjga32wxzm7qP1kTRtzNvLHuJ0nVEAsK7MafQ/4oOSCkExRQgUkiza1fP
 mbmjmuZfp4gy7sDSL+UXqkatZSwZJZ35TOh7WUgseAwcvsn02Maj9BBb0VnHGdMwVq+GCo2RS53
 A1aMRgzwANgfVJtzgURbf+1Dxslb92BRb+SFnL3USGQmKUdDkz1MFg+bk/vi3xcPMTCcmkI2tvy
 dNWFGe5nT5IyZuvsL4c2HuVVlFVDMNgzvkfWz9+vKFq5VBtm1NOayC67nrMsPEUqm+NPbgdOJRN
 4C1kXZCw7TLi8mO3gN35848AiGYL+4MLBlMmCqCYDNEv5thkDIox7Lje7I3xxJqcytvOVVQ3CIj
 iMb5T/ey90KaGMSk887lfIoIbRZMVlBA3lEcq3xJB9Pp+nZ7mxuv6CeTWZzMPOb2e/wgaSbVu8U
 dnmpWhLPWp/SLaHsP7Q==
X-Proofpoint-ORIG-GUID: 6QD8lgByyLaeKlRiNStqwuQ0t94TeAcb
X-Authority-Analysis: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=6994dbc5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=9nMZPvWkDyzw5AdY2PIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 6QD8lgByyLaeKlRiNStqwuQ0t94TeAcb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170175
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93230-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7470150B49
X-Rspamd-Action: no action

Document the mobile HDK for the Qualcomm SDM845 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..80491aa994ec 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -921,6 +921,7 @@ properties:
               - lg,judyp
               - oneplus,enchilada
               - oneplus,fajita
+              - qcom,sdm845-hdk
               - qcom,sdm845-mtp
               - shift,axolotl
               - samsung,starqltechn

-- 
2.47.3


