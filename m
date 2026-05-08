Return-Path: <linux-arm-msm+bounces-106586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFMgNQuP/WnWfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 09:21:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 810BB4F2F01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 09:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 001AC302DA05
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 07:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EDB37DEA3;
	Fri,  8 May 2026 07:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h9g3breq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JD9pRm5d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E81C37C108
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 07:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224841; cv=none; b=NZ4DDBP2QEoWHkf/h/iLfoWkDsbJHA9LlIYb/fwz9gVpIBQ6HE5YLRQq2YHbertw5sj0TPQb8vOeQZ5nIO+xYZeLCiHKM2diypNXVv17td9zCHcLq/ZO1eMIWU1C+BGyK5VJr8FTdP5QlJc7CCn+96EMW7+yv2t5y0d8IMw7NoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224841; c=relaxed/simple;
	bh=FdSJT6D2xuJXBvgDlnbYS33t9DDGMH2c6pzndhSzc9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m6G+g+QYUEMjE1HeSQmA+ygDhqZpCohPuMaOxmFoOiet82li3qcjNc50g0r7sjcIMEM+VtDi+54JZ2z6QUjJqliOGe9+WiLK21oUQ1aQUYKmtgXxyb23DcxY2iA0++XaCpJbjoluYXz3is3ieRLJJV27ioywIVmlmhgAiKokJ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h9g3breq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JD9pRm5d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6487KahL317564
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 07:20:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hbge0dEv99gSEczZnlBtmLnL5tJ6c+VFnX/wLkDiWLI=; b=h9g3breqdgyMvDYD
	89yCZdvkjgDm0WOvxDhSAZx/BwFnJu3UfAAXCfvz0Dy+iz+4VY6lvep4DY6Dh4RX
	gK6AP25PKq0S1wk8cXKtAVxxmNGbxIJ6IZfHTlew3pE1btNSFH0IRjx19CkVVS7b
	DaDDwAOSgWKbbiWoW2WRFmYsH8Dr00SFECIbdwFNV62H1P3lftC8a3Qjn9EiWS12
	iNQ0iast461vYPwsa+BmgYUR4AiQCCl7gqiXCPCDzXBdqGwkKRhKCiTYkD5xW6vC
	CwavLjfmLDsJZMPCKJaaVI2yqCucEcM6vCol8S1nvEk87jfmOsVAqIB4DcgyX1rb
	xVOOCw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1bc0000c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 07:20:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83cecc22d5fso440802b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 00:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778224835; x=1778829635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hbge0dEv99gSEczZnlBtmLnL5tJ6c+VFnX/wLkDiWLI=;
        b=JD9pRm5dWIUY4comHByYNGJtELrML5oPVcRmSBOAaW7Z/16+LmxaBaVUQ8VRn9ypSy
         GQtLsnNXgzHwbXkrR+QIsAxx10t9ur8WQ7L4XUKmWiN3pyfZpPiYGr/ty7yAH3Rfx18b
         RLBriHjB+OpFQuPwa6M4NQfHZ9rl9LDbwDensFcAKxCd4lP1jIzrOLK9LFMlBAT9pmtb
         MKUy2VYt33cbAjV5s2v+qAaAxXvJvYXybMgIFCCPdelu6sJVmaOqTOze1ZdZ3jO/iN0B
         rXbiFmAf9hyGAJN9Egcns+NgIypIeQKkxcnH7E0D8Y0rLLSLg7yAD9HxsjTHDKOg92St
         CVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224835; x=1778829635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hbge0dEv99gSEczZnlBtmLnL5tJ6c+VFnX/wLkDiWLI=;
        b=TL2m3sItcmp+2Ij2nIP9vvanQljWxiq7ctVv+khcxZTK34vltxi7QwAYmB06t/QXIa
         VYMWk0bjmtIawAZpFKnl1WKufmyPeAM5kYC0SvzG/aFmTh0DIFYnUaJrZ9R4rGT9DeXR
         FRQIFr3K0ON3w25a8c8alwkExo/OWe4NIk6o5ibDA2/Kx0Wn5sCkILgGUa1shpJ25w/p
         5BNtCkxpEX8UTU/bZiAdKnvbRzxcT/0tZbUEk09Ps9tWzB2shuyO0M7igp4mAQ2UM6++
         b9oEnW4XInfn4S0dUTAEhXkCXciqBd5QPIKi++WmGRJK8BBH0FxIO7UjOmCWq8t83ToX
         tidQ==
X-Gm-Message-State: AOJu0YxHlC3rZ0pzXMsZFjfQPKE/k66goAs/ltpJpkK6tyKq6OiVFy7e
	7mYr3ZRj+5RmXL0r5d1uz7JkEHjruA6FzH11c6ZqGZVyOKGXdDpk8O+7YW3vUIkjPb/NXfAHLjP
	9MZtbEBlY3ap+f7EeATfwJQX1aYDvlCWNfIitovPjCLGfTrM6AJvBY2lR1cx6UQj3FF3l
X-Gm-Gg: AeBDieuA4PCe87Tj/EqykEaKEF/W1SddlqX7uKjg0PUJ/84D+juj7wZt32zQ8Z3ARBT
	AtnkmxvTKSg6IdUhNb2C7Zn6RfH9y2mUqV1fuqTjdlOM+QcMph0YJ1hcIeAos7fzWGWWny6D7F3
	6VPCsYwXCErT4MYPFTZbW4XOfwz1oriEEwwR4+/m/JzNMU2hgA2NaUshdM2ZF0cvukPM6eajd02
	YcZ6kzc2a5FfzC/O+i2J+8Bk1KL+gK2TdVN81NfDJWZAEvR4HWYLPNfjdC5ntg15qGqB/BgWEqX
	D2mUa1sdSUA5r76/emAX4jxFmpbOjcB5jO9qbtAZntXhckmtsFaUU6tTwpRBebUEcPOc6rmmWyI
	fC4k4wGeSwXTsp67V1VFH69Q/leGyTMz4Hen6vJu/nL3q5Y6CbKE=
X-Received: by 2002:a05:6a00:2e90:b0:831:7f71:c810 with SMTP id d2e1a72fcca58-83a5d96fa9dmr11411087b3a.35.1778224835327;
        Fri, 08 May 2026 00:20:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e90:b0:831:7f71:c810 with SMTP id d2e1a72fcca58-83a5d96fa9dmr11411046b3a.35.1778224834813;
        Fri, 08 May 2026 00:20:34 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659498f1sm14566685b3a.17.2026.05.08.00.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:20:34 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 08 May 2026 12:49:49 +0530
Subject: [PATCH v2 3/4] dt-bindings: mailbox: qcom: Add Shikra APCS
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v2-3-ab76fd9e71de@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778224815; l=1036;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=c8/SeVqVj0VIwMhz140zaO2lQ7IVuDyupHPGVMe/Wdk=;
 b=9cIywRriSkRDjLfTl4HF+wpZStxUSzoK9Lb1znw2nB3gvP8qJccxQ/FlWTszaOtreZIwWNge8
 pTk/HfQANSCBDZ3KtzxXI5StyRwMC32GmSD/R7uVC2xl1dRBItU67h2
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA3MSBTYWx0ZWRfX2GUG2JW4YQ/o
 nLIu6bQxninLLGw+9sjo5+5zJGpQvWNsu9OlkbO1SCPUeFpdgmyHy+EWNI/DxuVCjOwMhN33PMi
 71dK5279f+OP+GCuojISp1oib0fjLLMyOODDpatQXcnH3dXlDEI7KGoFdDTuZjvh9SnkoFfVh4A
 aH+Ab09x0ZrxgVbafkVPKpv+exmkw5J7aKBG0p7RArVOOPQUt8EZbkDHwxZFbDwLPwmkTweakOF
 x3SgZfYwNOzl+V9driNY2flSqvSKYmjW7DirP4Ef1ad3gM1a3MqmQlnG4Mds9D+PERNaEXb8acn
 jsH6mjOzyXZu28UpekCsVGyUAicLQf40VOtW+0JftKickhcL7Fq5GBJusB0TqLqTE7nLkXHMiCR
 0GZ0ytqza3h9GglNR9V8cdUofMzQQ8LcNavwRr+VYd7RIOq2B7vzVTq+aU8v1Xz1ytpazIiLsQe
 1FJ6P6XWK6o5knbvDCw==
X-Proofpoint-GUID: myHjCuXNtXa9yNjkdoN_jYFnGetofT_r
X-Authority-Analysis: v=2.4 cv=JJQLdcKb c=1 sm=1 tr=0 ts=69fd8ec4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QZub9Z3z2oi6Mc85LyMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: myHjCuXNtXa9yNjkdoN_jYFnGetofT_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080071
X-Rspamd-Queue-Id: 810BB4F2F01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106586-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra APCS block.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index f40dc9048327298c6e78d4327bbd5f530a013604..1b4ef0688ca79f92f579d9bf5ab2cfb2bf879392 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -49,6 +49,7 @@ properties:
               - qcom,qcs615-apss-shared
               - qcom,sc7180-apss-shared
               - qcom,sc8180x-apss-shared
+              - qcom,shikra-apss-shared
               - qcom,sm7150-apss-shared
               - qcom,sm8150-apss-shared
           - const: qcom,sdm845-apss-shared

-- 
2.34.1


