Return-Path: <linux-arm-msm+bounces-113949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id maLKMAv0OGolkgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 10:36:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 486456ADC91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 10:36:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nLLf3mUw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=exbGW8Eu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113949-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113949-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D2603010384
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32360391834;
	Mon, 22 Jun 2026 08:35:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACA0352029
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 08:35:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782117343; cv=none; b=TJ1s2djgd77Su2uirbMeOO9hNtETS1RSeugEqtbECAK8lfBNNwZ/We54KVNd1bqERZc8fIod51HhBXevys8ZiWXVHEiK1Hkbk19jKy/xNz16LNO3tptMRyEaxMK3dSIVo/4MpDEde2H95KR3zIdzBdC6vXXMOk8eISAr3oTcf1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782117343; c=relaxed/simple;
	bh=UYAcFQsdl0wlVvELJYNvsPuhaeON1HGQVMHdb9Z1pck=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tYoZOyAgPoUmujAbdVij6tGc69xCyb7d/GZ0Zp3JJZXN3CtLnpu9YrwxweztZp/ZPNBsXU/FKjQiwNSXUD7NFBUuJDEzDKVXadSg8X8JGzZaPsj+73UCk7vEScI8MsZcfICd73LVUhHHrYUFl3yYwtoKCvEwbmAaYbl8uEkgbWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLLf3mUw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=exbGW8Eu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59Fut2427862
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 08:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sPdG0qXjeboBvQV9fnjcdY
	soHMrD/LzZsyptqg7/lmg=; b=nLLf3mUwhqT8dGr3EnipICBrtalP3AS5Uk3ukt
	YWiq55ii6cjPh/+Fz5Gqq3WySJmEAQaPVwxpAKfZGylza/T9ljqW3rPqhiXyc3A3
	dWU2qQQIUR0gPSYmpYyrpiyNj2f3AFYNKaqsj7brf6Rf22Xz6KibhNGHbL+jNyek
	VJKKjSIoI9htSmdGWDqGl1xcz+tFD27xbrLM8r4097We44SNPlxS6zCA2Fp27gSS
	1p4O+RV2KtoEMBWD12Tk2YQFbDNCimJ/m4hnUMQqREnepGDTFqRPYKMHfRNrMT6p
	xAkr9fnZyM2mRg08Celq1mwbBRnRSbRn6Ko5rrebe/bvPSmg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhtsdpex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 08:35:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c13bb8ca9so3986942eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 01:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782117339; x=1782722139; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sPdG0qXjeboBvQV9fnjcdYsoHMrD/LzZsyptqg7/lmg=;
        b=exbGW8EuRdXjks2uNHMMMjiJmjnxL9yTElIfttCNbre1XAetj7yBMZs2+eFGdwttB0
         gjidY5heK1cuBX5YGFozJM/IZIU6WFQW/VrLwLInNHIQxx8rR95DzoLZoHNce2Tp7hUx
         /lzyP2kUWrjEFXU6htqg00Lc3qA3yUnA0Ca/tRqsNMiys9bMPK87G/Iuuu+ZgixqS+eI
         Z2/j/gnRSQ6nnvUf2hwPTFJGXHqyIqN0Qw0fpzf9rnYjwyhgQb8PNaMRzKFcqY2Slq55
         T/rTYDh8m+z6xsGRHAR65Nur2xEMfBEpEeXk7ot1GArS/WXOVEeQ/6krTGwpVsY5q6FA
         n66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782117339; x=1782722139;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPdG0qXjeboBvQV9fnjcdYsoHMrD/LzZsyptqg7/lmg=;
        b=Yaw4n5yoIA7EmDOtwjURDTMExReQGaZfJluFQWeMHSgAqs8AvJ+8qkeB5b/1OB57Lh
         FD8lGIDs3zTd1Nbluu6rX7w0MymzUn/HUzLB9WfCJhW8l8P4AXZ6I11G28eG3RRKXpI8
         tSpQ7YGl26VaSrGFcxUjo0mR2PmoqGUjFxNh2Lm5pQIFw9UMxFB57H07SlbZZOliEz04
         Bs+dI8BagFP0O8ieWk3QrBsVnaOqvZOqCp/cq2M2q6UoniqE3ed2nHte61IVyus1Sk9z
         nbWjv9Ca3Q99u2lyfAUEzPUS3X5ypeyhvRH9csMLo2Om2UrT0kqUaVBfp0UcyWXMqfHx
         quBA==
X-Forwarded-Encrypted: i=1; AFNElJ8wnXTx5J/5Exuvq8NaH5JTVX9JSOnz6mLcTJ19iHEF6V7KUN+ohc/B0iLWUONKlj9D3+AIS9bC84G30sR8@vger.kernel.org
X-Gm-Message-State: AOJu0YwAhlcEegAr60Y2+4vKq1ILPXLIXtbWZh0dmWl1ib5l2r/xAjU1
	oY8sFLfOuCVIDrZ9/DboiUUgmgWVLMVR/ojxeiF3LFE9zRR2JDypMDaL/ZlIyB3dOE7MU3hLO0r
	/pnuFLbJ5HY2m7tJuVMN9ropwQo/UPNLt6Upos72BKh+s3rF29VEge4vwSQdrboO9Uwmi
X-Gm-Gg: AfdE7cmoFNt6cWZlADBXHnjx00PCbIKsv85L1Bkz5r0iE7MSj6sQcSO3wEzXv1LFtiZ
	MmrANDyErF/7zbSotvQtR37CXROFZG1As29rdW6vSveSBB26y+CabrR+fygH1/f3hycMKqLn7xo
	uqRfncfDl79C7SF6+6Okt7D0XSImMnfw2ZONxfJ+UBR7/sW+gmoANeEMBiy7gfmW6WMGcgcAQ2A
	006cUqg/Nu6n71c60bZOzJayt59WG8NavpZSKljQyn2j87D6q1Ca2vbFqUGS1O2vi1W8z8OxLto
	DmW186xSRVzGUONW6Nc4WSALuNbKcJV6LfcpBs9u6sddHP476Qn8TpXiW2Bnk8pnxghZafCJMH3
	JvyBovvTg6lWgEvDGYep2M9e/tzWeBmk95wgcFj9uuqP3VRoWzhN/xI24lckgzQ==
X-Received: by 2002:a05:7022:629:b0:138:30b1:4c00 with SMTP id a92af1059eb24-139a2035deemr7515167c88.3.1782117339023;
        Mon, 22 Jun 2026 01:35:39 -0700 (PDT)
X-Received: by 2002:a05:7022:629:b0:138:30b1:4c00 with SMTP id a92af1059eb24-139a2035deemr7515147c88.3.1782117338507;
        Mon, 22 Jun 2026 01:35:38 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139adca1b18sm6801967c88.3.2026.06.22.01.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:35:37 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/2] pinctrl: qcom: Introduce Pinctrl for the upcoming
 Maili SoC
Date: Mon, 22 Jun 2026 01:35:31 -0700
Message-Id: <20260622-maili-pinctrl-v3-0-9724e1000471@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANPzOGoC/22OQQ6CMBBFr0K6tqRMoagr72FctKXIJFCwxUZDu
 LstLkzUzSQ/+f+9WYg3Do0nx2whzgT0ONoY+C4jupP2aig2MRNgIJgoSjpI7JFOaPXsegqcyb0
 2B6Z0Q+JmcqbFx8Y7X2JW0huqnLS6S5RIgFTr0M+je27WUKTyW1ABfAlCQRllUggu2kpDXZ9G7
 /PbXfZ6HIY8HpI8AT6Q3y8DJEijKtVq4I0o/0DWdX0BisZ9pQ0BAAA=
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782117337; l=1257;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=UYAcFQsdl0wlVvELJYNvsPuhaeON1HGQVMHdb9Z1pck=;
 b=Z3SBQcWgGoqJXq1T3gxXIxl+q2t4tfHXo7kVzRNohfs7pPfe7kvg0Tp6TYZBAeqjGrs4RYNBv
 U19dZQ3WnU3C55WylYSmvUXKbUQKOjx1IQA4LVA/GfF6c+6tHdNezls
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: NdM5iYpkaumd1RDlzu9TVDlfL8M1HuQ2
X-Proofpoint-ORIG-GUID: NdM5iYpkaumd1RDlzu9TVDlfL8M1HuQ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA4MyBTYWx0ZWRfXzMqtYHE1AR5I
 5XQ66g96mo+K5vdlVLaYnahaAywYp3fwSAEnmdLE345CruQEcYzYiQTRzI5p+/h4Tx6Dqapqnwr
 jYIcpAZ/et7qveOe8pFsxtHxfY5w9Hin3tZ/o1rz22J7nCm31efKbyeugFGqF+8kM/kUcWZOGKq
 meFgedzZY46CyLDTk0Fy2YjVIV6W270EE+VhQaG4XiPW+VF7QHSzq6s4+jFoL5CnjCrcjAzOh8R
 rznB6yH1U/odWd5T3gkWkWt2OSDzyt3JMRyBG5mhrz2aUFSUviFPC8JcGFhVRH13ZprYbtyiVeQ
 OvEFV8idB/ejw5KIaASR/kT3q9W/hQSgAv5J66FEAF21q8zB3Tu9tBhCBMrp6vbDDdst876Gpdc
 xTOf8IO7jwZh6DWiZy/+nVZLk1F5rA1OJUEaypBR+y2Eu6Wy9sfRPDs4SwzUp9UXdO7u/lExhWI
 P/s8NuStiEJ9nqOwXDw==
X-Authority-Analysis: v=2.4 cv=bcRbluPB c=1 sm=1 tr=0 ts=6a38f3db cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=shj1PICiUaLHCvf5g4YA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA4MyBTYWx0ZWRfX4ikho9HAKuRc
 bqidvSCzJWugksPa9Jm4m3oNPfvWndIEIDWJk2WxCL1hY78RfgY7X5ic7fXNUW51QSVmtF2iUGu
 qZWtakTwCCCr/HKd6oz3aARHXTJnvWE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113949-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 486456ADC91

Introduce Top Level Mode Multiplexer dt-binding and driver for the
upcoming Qualcomm Maili SoC. Maili is the new mobile SoC, and its DTS
will be upstreamed later.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v3:
- add reviewed-by tag
- remove comments before msm_pingroup
- Link to v2: https://lore.kernel.org/r/20260614-maili-pinctrl-v2-0-0db5bfc23d64@oss.qualcomm.com

Changes in v2:
- Move MODULE_DEVICE_TABLE next to the table itself
- Update gpio function to MSM_GPIO_PIN_FUNCTION
- Link to v1: https://lore.kernel.org/r/20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com

---
Jingyi Wang (2):
      dt-bindings: pinctrl: qcom: Describe Maili TLMM block
      pinctrl: qcom: Add the tlmm driver for Maili platform

 .../bindings/pinctrl/qcom,maili-tlmm.yaml          |  120 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-maili.c               | 1625 ++++++++++++++++++++
 4 files changed, 1756 insertions(+)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260614-maili-pinctrl-230a8ce90bcd

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


