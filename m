Return-Path: <linux-arm-msm+bounces-117569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kGYPKUogTmrXDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:02:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39306723FC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:02:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QZf50PFf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jY8byurw;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117569-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117569-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3D323013461
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 10:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4813815F1;
	Wed,  8 Jul 2026 10:02:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A15388E74
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 10:02:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504969; cv=none; b=Es5dpmBf1Hgag855302x2XIgHBqmfS/tmkJF48+G/GzcYJKl5YCvM9es1sN9uFIZmUZ/ryNTYyjkrrwUz4LsAFdQ0879QdsvP8LTJ3tvFZj1561c+T0+GliwgPvZUsd/Jb/0xyLb4xYWH1XWzkSB8rnmSQ2mrO6yNdkoZqnFfuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504969; c=relaxed/simple;
	bh=eaBbOLzTd1NRZfmmVkcPAVA1GiZLMJ+ycXX4tsfppRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=frrDwc4uQ9wwIKZCP/ozvxd3RUxP/szdMUWHVd42AdtuQQVMsqjmxZ3b3BRHV/NzsoWdhNook42u2BDdAlNUU1hOaaEb3wajjlXhbDl8hBDeZyMadCmeTsOtBnhuXCzTkzA95loqa6/qxSZNVjdBQ4cbDd9Yz4yJPIQHbYeF67s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZf50PFf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jY8byurw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668898Qj2258593
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 10:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H4o0HZduDvBsZGq+Uz+XOOu8qcBxQJSd+TFpft7ScI8=; b=QZf50PFfcv5+GRG7
	ERh7kSN8SNcYRkqDl67f2/HvO2Nx5lVuLOvmFPlIJ3pglCAAJW1JC4ydCK46Matl
	M1mLIf3qM2Hy/Du94eOYKOsZ+YRMr5KQf7YcinqMbqhXx4hxCkoPY1d1cSDcC6Mo
	WbKP24sADx6PNaw1EQks7NZ/GwEDKVLGvJGom84G9LpU7YAzx5PhX20o2RrRaBeU
	qDnxRbLqopOwjMujUCEtsHYmrOp9ItZBSXnfDpGmQNtR8XFAFHjIvWTJXumZV3ct
	Oxe5/QcHQzc8reKAuX4rV7gHlCdgH/PhckJ+AicFWGrVKufVsTwXR32znKNcj8pz
	kot8LQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csw9uhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 10:02:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811ae55313so576148a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 03:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504966; x=1784109766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4o0HZduDvBsZGq+Uz+XOOu8qcBxQJSd+TFpft7ScI8=;
        b=jY8byurwyfvxbs1BLjxcBns8BnIOiq1Kq/ti7o0VyxE/62reHD6FgsXw9b2QobLgOT
         1zvlWaj6rnRWn5m+kuDqQaEc9eBPlcNvEnEUu/7BPiHuKL1izCDJoSgtK92VA5eFOu9Z
         J37U5Dbfig8h44QJFO8BTz2lUV4CkLjc3jgleeomC0PCyny1uc1B8bvvnDvPuDIkAxNV
         NDFQtFoaGbB+C/qUFZ23fkrLWo2nZJxBhMlNYb02YCMEssOOJ5YEQ+3iEoakXvixM+zB
         c7DTApVPYzmdS3VoaRgpvTymAoiFzzjcAXjqhDIFWwn9I0+lV+aCXZD8fiUhyTcWMGPC
         zQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504966; x=1784109766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4o0HZduDvBsZGq+Uz+XOOu8qcBxQJSd+TFpft7ScI8=;
        b=B7LlrPHOvNn++4VlpKBem7i67FfdPhXtLlWe7TFVki2BUF8qHN2e4H6HtdW58rODKF
         fcQKZr7QbeNaQ2R0FNqHh8aPdurGL+gqhWQTIE7qj2AogFqBt955kXHmmfqk8qLk7AUs
         oW/A8TCjBzzHvFZOjbxg+uRuUAWQ9sq465MAfPNGZ+AcleeyGysmKvnNrCddPC61ePBC
         D8QKDGYu/TGZ3z83a80V4Wp19k6CdCocWo9TNz6oGWZIzVT9GxZ7ynjhFLxhNZy5Vihi
         jLe4mvcJ3E17WdKZBqIEq8J5RfQkDp4rrqmQUEdIbbBJUICgIk7e2/zYTHxwuSZpL3LS
         T9Ww==
X-Gm-Message-State: AOJu0YzIafXUb+dmwlshie28RkN06sHPhnIdJc66nd9vTlmXnJeeNAhb
	4EO79g9EGoaQNRkqNumrfefU1d4L0IlwPhq2w/9j3Hwi8P731BRVYDXx3o6kmSXb+UuSt5bcs/L
	rfY0qP76UEnjSNYrKUJ9nOs2nBx720XLFOPBSu/W8/tvkIOW6TkTJHFAdkZLQTF4BTk7S
X-Gm-Gg: AfdE7cndMY5+/moCSBVDQNtwb5oqiU2bE8r2h8fmVG69x7A87LIVg0C+xzpk+0pjSsU
	K9+zR9cHHqm+e47TSip8/D+XOY6XjtV0p8Q993rBB5iAPTZMs5G1ix2fnxohZhi9TcLljnZfJG6
	iF5Fl8ZBUo//8bXDplvqjzm6V8Vq9LZ+7+wYFm1uCl3s/zfCFXJK3pusBEeske4M7QghGV8/2Z0
	o2KFvDkOsicNl4ZQabbrZKUKcXoRyYKIliitAMp0Py/vZCTH4bxsttR5lD5J6C80cgtpgKLLxuo
	0du7FWx76cNqrQFmbXU5LCvk2iTNu3NT9t+XJgE+R0Ega4gwLmk9qv4KbDGz8+wuNJ61f/rC1zP
	/gJkvG1aORxS3ZQ97UuQp9wtDcjygqo60K+lAV4P9UwSIEMxIrkFkM4Cv1w==
X-Received: by 2002:a17:90b:4a48:b0:37d:ac5b:392f with SMTP id 98e67ed59e1d1-3893f97dbf1mr1732918a91.8.1783504965442;
        Wed, 08 Jul 2026 03:02:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4a48:b0:37d:ac5b:392f with SMTP id 98e67ed59e1d1-3893f97dbf1mr1732867a91.8.1783504964694;
        Wed, 08 Jul 2026 03:02:44 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-389098609c9sm875741a91.13.2026.07.08.03.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:02:44 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 03:02:38 -0700
Subject: [PATCH v8 1/7] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260708-tcsr_qref_0708-v8-1-62c42b5fa269@oss.qualcomm.com>
References: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
In-Reply-To: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783504962; l=5848;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=eaBbOLzTd1NRZfmmVkcPAVA1GiZLMJ+ycXX4tsfppRo=;
 b=7/xZ/xCVc0r9NEfTCsXrijlahP/DMeQkSoe7X+ALVXyPKtXlgxqV/Xc+JsFl9p3MQA91yYF5j
 UlEZtK89/jTAiJDX+/YKVVzLnWSA7fUIktiNNeDONkQYhAvdbPWDqrK
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: Ovmf7WOY4rqp6pooRpGc4uJHit-xqpkx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfX/DP8XDBnMjPV
 MWtC+oz+azXcIzYssKrbMEi66hN+Vn6+0gZdO06J92Usuc7oPm7qjjPnlSN8LZhy2A5a5q1s8cX
 IVwa2SVY9iLy8pIiN593S/L0sfNdV6Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfX4y8LygIrmIn4
 Pmvz8dcdrq2HT5ntFdV6mVzKBpdAEN0ashPMBWVlq7PXXILiA5E9ZvJ2cIY4YkuGSOHnWFSYrct
 0kREXAlO63jQiYZvE+xIQn4DqRZpJrsor0vgXVbtmyRr1lva4q6HvVu6lx50ffqf+vfFx/E1dY0
 ye2LLSkUmGBm3bMCtUkcYY9IjIvn74z/MNUP4TLlYty3DPGFIm3dj+A0lA0dzgeEYgbCVbBf6V0
 dQI0ns0iEen4r2pg3NZs9fXu1IITylK9/mzRk23409a2+nUckMQkoWI5x+SWQLyUl7dUH0erznO
 boLP/YnIscjHgsTRdH/vHRboKAVNtnqXVLiECdAUq7CGNEM2DS/wVuLTrkkxYKPqOYfI4nNGvwm
 QTPJKUtxcuWriA33xIg0fxpSmOqX7urVL7iDeuo8/k15J17crM0ZtQzGeUYU4MwEHNLNBy6hhTq
 rlB45HDdFSL+YDVcd6Q==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4e2046 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=12nZpKSYVJl7DlM_WUUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: Ovmf7WOY4rqp6pooRpGc4uJHit-xqpkx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117569-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39306723FC7

The QREF block supplies reference clocks to PCIe PHYs and requires
dedicated LDO supplies to operate. The digital control interface for QREF
(clkref_en registers) resides in TCSR on glymur. Since QREF has no
dedicated DT node of its own, these supply properties are placed in the
TCSR node which acts as the control interface for QREF.

Add a dedicated binding file for qcom,glymur-tcsr and document the supply
properties. As this binding will grow to cover more SoCs, mark the
required supplies per compatible using an allOf/if/then conditional.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Krzysztof's Reviewed-by (given on v6) was dropped in v7, since the
compatible was changed from const to an enum and the allOf/if/then
block was moved into this patch, per his v6 comments on patch 2 — the
diff changed substantially from what he reviewed. No code changes in
v8.
---
 .../bindings/clock/qcom,glymur-tcsr.yaml           | 126 +++++++++++++++++++++
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
 2 files changed, 126 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
new file mode 100644
index 000000000000..ec89feff89e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,glymur-tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TCSR Clock Controller on Glymur
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and
+  power domains on Glymur
+
+  See also:
+  - include/dt-bindings/clock/qcom,glymur-tcsr.h
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,glymur-tcsr
+      - const: syscon
+
+  clocks:
+    items:
+      - description: TCXO pad clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+  vdda-qrefrpt5-0p9-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx3-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qrefrx5-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-refgen3-0p9-supply: true
+  vdda-refgen3-1p2-supply: true
+  vdda-refgen4-0p9-supply: true
+  vdda-refgen4-1p2-supply: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrx0-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx4-0p9-supply
+        - vdda-qrefrx5-0p9-supply
+        - vdda-qreftx0-0p9-supply
+        - vdda-qreftx0-1p2-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
+        - vdda-refgen4-0p9-supply
+        - vdda-refgen4-1p2-supply
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clock-controller@1fd5000 {
+        compatible = "qcom,glymur-tcsr", "syscon";
+        reg = <0x0 0x1fd5000 0x0 0x21000>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        vdda-qrefrpt0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt3-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx5-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-1p2-supply = <&vreg_l2a>;
+        vdda-qreftx1-0p9-supply = <&vreg_l1a>;
+        vdda-refgen3-0p9-supply = <&vreg_l1a>;
+        vdda-refgen3-1p2-supply = <&vreg_l2a>;
+        vdda-refgen4-0p9-supply = <&vreg_l1a>;
+        vdda-refgen4-1p2-supply = <&vreg_l2a>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 08824f848973..19ae0634b922 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -16,7 +16,6 @@ description: |
 
   See also:
   - include/dt-bindings/clock/qcom,eliza-tcsr.h
-  - include/dt-bindings/clock/qcom,glymur-tcsr.h
   - include/dt-bindings/clock/qcom,hawi-tcsrcc.h
   - include/dt-bindings/clock/qcom,nord-tcsrcc.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
@@ -28,7 +27,6 @@ properties:
     items:
       - enum:
           - qcom,eliza-tcsr
-          - qcom,glymur-tcsr
           - qcom,hawi-tcsrcc
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr

-- 
2.34.1


