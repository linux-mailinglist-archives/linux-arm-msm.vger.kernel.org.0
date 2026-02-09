Return-Path: <linux-arm-msm+bounces-92220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIRqNP6ViWlj/AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 09:08:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A68710CC38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 09:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08433302DF65
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 08:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B90A33CE8F;
	Mon,  9 Feb 2026 08:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AjBEhDw8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="btGUeLOW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2765B33A6FB
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 08:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770624389; cv=none; b=W73GWrbwyPBMSIZssM0XoATecVubAmLIOLzyy9dLN5cIMnW3LYJWHL8umjMVAKGOvHTYB50Vqm6tMWdXNhM2iqn8BxiaDMXBsMlUT4xE+zX0lf590iDCPsVNxiEI9LmC+gaJQ+O4jIsQ9/Cc7Sx3NUvsO/Pw8Um7NzY6UA9ipKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770624389; c=relaxed/simple;
	bh=NwZkZd3x0F6Rk9OACyZ+Tb3Qv9NN+TnPmiBEq0ZzE30=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dQQNH8XYoPt0xGQjtCZD+6JC7me+ooGyE9dItTI+vstbSBreFz3iHHZ0FJCtIbjeE/BnNLXl5tzUJr/IG2Y+FMMUESOKvw8vy5AK5qUgBnw3w1YyYmQdP9ad9yMpYf7QMEN61/Mlx4qAcOp7bKsWFovmWfn7co/suS6HYaS2D6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AjBEhDw8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=btGUeLOW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6194MPHs2381167
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 08:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sNI3lzVkEBQ
	S+BoxTw7c+JVyJ4uoevI1lC1p3lobflc=; b=AjBEhDw8gkFmKF5EhDr6IDBn1xq
	+sODPuFOkHoRV5yjuwnQvzrJ78yPDM5jo991zIJqBIwTffCQOhqe5AuEa85ujajm
	nQ5/W6LKNxpmydFWgSvHZOyUNg38fZdDJSPCIs6qMZd6UEbYKXEC0bjEIqISzJLz
	ru3oFC5joVClOlHYhXox8X7kW4wc6GGuM7uktHWzs0alzIcj1XoWRpMTPcSl6TSk
	diGhBTSCCj/ad1undKGO0cR5OpKD7h2HLWVOf7bTipDpQyy1+2F21Yh5askXEMZx
	sewrzs4H3wUs1Z0X7U1tFAq+wtrRnCB85qCTxuryalMIxbzwePHZSRl6LCg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c78gdrnh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 08:06:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c551e6fe4b4so2921618a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 00:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770624388; x=1771229188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNI3lzVkEBQS+BoxTw7c+JVyJ4uoevI1lC1p3lobflc=;
        b=btGUeLOWItOUFMhEDsnw7CNKRBHU74rEcaiDkTYlUlmiICt2pVJLaMnowgqGlSVFhJ
         Ll2J/sacyuXgY5JB839WyXXcCKOKj3H9tImUK6juHF595+aFxbYYOgM4LXksWwx9RTgd
         B8EL2B2pSr8KjgMDrqT/CmdoOsOJbd/f103Ks3lK/Vi/3hkFv7F1RAdjnEEfDUtHrVde
         o4SAXsQviG9GOZAfsxx0gqtej6Sho0K81xvtABeLauEEiLAv7dS5XQ9IA4oaKaZ4o54q
         5rFJNxuCZ4ZpbV+I9Xc2Fq6JpHOCuZjMmA8U9GJIzA7Y4nm6gc6l7by5a5cNUSpPfEPz
         k3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770624388; x=1771229188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sNI3lzVkEBQS+BoxTw7c+JVyJ4uoevI1lC1p3lobflc=;
        b=JPebfd/e3qaQplb6fX46Hf8lMMI0A9Rymk2MVYjzfzxL08o9lGXX8KqRL2V6tF3+Ys
         2T8o5S51cA3aWnD2s3htWMHHA/PHP1Cpwj9Oe2P0caME4o62ddxAlvpdpl/tNjHl9p8y
         TbxAnHlhDR2mtOdBGViwLCTW1qmM9euhzOgVf/tbC4lixHJPnwEYeTfhEuBYK4tajSze
         gs+VzD+Pg6f0bMR92gQVE6LmqjeRbrJPtKA3iHZ0ZWaSR6jsI9C8BkXjlZVzgsfxjaDA
         V9fP8PSkKqTZg3a/1lj2xIaYcLCnkspQIr0Oev6kzhg2wI9xbnbNrGGE/bo0C4zuamIK
         MGSw==
X-Forwarded-Encrypted: i=1; AJvYcCW6WHlVnbg1B1Mwtkgf1MY4OtKQaSWKDrfZ+sRXz+6x/C+uJ7qRHRmMEJPJz7PTVE1v4bD77/uAYGid+JIB@vger.kernel.org
X-Gm-Message-State: AOJu0YyHz4ZZYpI5y6J3/8Y+YfJ56CenMpAWrSTMh5d34SDh7CAqB9Em
	xK9wi/okw679h+gfwyM1mbmQ2fdKJ1KRNPSqyuDj85cUqe4c+f82v73iJ6JX6B292OXj0RiU2Ut
	a/MRFeTb8c1ICDWZi1ZHNwhjeikzmJwJoRS+jnwucDblIk7xG3KaO31ZEGbyXUYvCcjIX
X-Gm-Gg: AZuq6aK3NkPCLW7oS8dKuCdQUWRwGEgLvLMMzWogyMLsb4FE0u10SqLFXKYzATYxvCl
	qZC2Ro4mLjS/5rUXm9nf3ClOaKr+e1MH+FuSMLxyG97pXJcEsN89/yH0n23kvnSRggcvR3ESF8i
	WLe7ZulwoiFpfwRl/kyL/QTQsRjIIRzqDYqSI3JTlH7F9yJkfaqd0TCO+hjOZe1lcH7xIAfywgt
	CWe77e+uuDCNiSrowMgQ4PFUDgksDn/4Zuk22bojUxWLzo4iSBBoo50TlJoqvExWIIr5JD0Nj1c
	mjUPaccm0Rh0O2tk4oKVaXPybiWqs3ZglMPoYvz6sDX3X3rrtXZMI2PKUbX8WXatHWWN4h2/wsJ
	JLTg0DubJ008jktwZY+q4w4dTwO6EpTc4zmVc3cQ=
X-Received: by 2002:a05:6a20:d524:b0:2bf:183c:ac86 with SMTP id adf61e73a8af0-393ad00062amr9948225637.25.1770624387676;
        Mon, 09 Feb 2026 00:06:27 -0800 (PST)
X-Received: by 2002:a05:6a20:d524:b0:2bf:183c:ac86 with SMTP id adf61e73a8af0-393ad00062amr9948193637.25.1770624387136;
        Mon, 09 Feb 2026 00:06:27 -0800 (PST)
Received: from hu-vivesahu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb4fb713sm9202221a12.3.2026.02.09.00.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 00:06:26 -0800 (PST)
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: net: bluetooth: qualcomm: add bindings for QCC2072
Date: Mon,  9 Feb 2026 13:36:12 +0530
Message-Id: <20260209080613.217578-2-vivek.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209080613.217578-1-vivek.sahu@oss.qualcomm.com>
References: <20260209080613.217578-1-vivek.sahu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA2NSBTYWx0ZWRfXwaBaXW0W4hko
 pWpw4RoSvZvc7l4u1ILrF9ao6auLpSMv6lipwxJIGm4CtISa3L9+DgWPKJsSN+mVcPUbnHWM+XD
 Rcz9GxFbpmCZ3MZGsLt7jl+zuwtGjh24HJnJyImrt+lKrCFhRPd9cwEH7tmVP+6Ex3rZgoU4rps
 DLKl30jgZSir+SRA11ezJAliEQy5jyle0baBqYz3rWI7vzPkl2A/KgyqZmhQCHn8Lco/+liRKr4
 ZklXrwSVByvlH3gIyES/Aiu7QHhJtgZXKuULlmxehRveYO2SjuflTICKaWNB5V2xWYR51Ii9Xw7
 irRvm4jh6+qyhR5+ZpoXErMECZ4x6fnyIvaS9XSMVGg+IXAKocMW07/7DZeVz6WHCdumsSpE97e
 QCun4RuZUkR0HwJUSr1Jb9tpw7gIU3P+ofs12J4kGevHsvmYxJo6uWffpHUWH/LlytfDpWlrx2H
 IFCPkOx6lOVxeAZREFQ==
X-Authority-Analysis: v=2.4 cv=Fv0IPmrq c=1 sm=1 tr=0 ts=69899584 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=VxM-c8O0AL3WG2ldIhIA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 57Fn1st1QJUlRpEMpI5TUJScyCasdLtC
X-Proofpoint-GUID: 57Fn1st1QJUlRpEMpI5TUJScyCasdLtC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,kernel.org,quicinc.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92220-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.sahu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.989];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A68710CC38
X-Rspamd-Action: no action

QCC2072 is a WiFi/BT connectivity chip.
It requires different firmware, so document it as a new compat string.

Correct the sorting of other chipsets for better readability.

Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 6353a336f382..85cf65efca92 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -18,13 +18,14 @@ properties:
     enum:
       - qcom,qca2066-bt
       - qcom,qca6174-bt
+      - qcom,qca6390-bt
       - qcom,qca9377-bt
+      - qcom,qcc2072-bt
       - qcom,wcn3950-bt
       - qcom,wcn3988-bt
       - qcom,wcn3990-bt
       - qcom,wcn3991-bt
       - qcom,wcn3998-bt
-      - qcom,qca6390-bt
       - qcom,wcn6750-bt
       - qcom,wcn6855-bt
       - qcom,wcn7850-bt
-- 
2.34.1


