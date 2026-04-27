Return-Path: <linux-arm-msm+bounces-104571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLGeMoOz7mmVwwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:53:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2F846BC0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59740300CE62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 00:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12341EB5E3;
	Mon, 27 Apr 2026 00:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWpsK1RR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkS1fBY2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE4A2264C7
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777251177; cv=none; b=JzedzRZkxeHBvjmotQsyRJSv81shETCFHgD76+oNmPNcsCIDiTzEl6Qf6jB9syvEUT5u8mYlRHedTsS5JrmOmTDW9Wa7DEkwgvKihAg4Nwj6Q+BgJIyeSEMm/ceY2An2JZ+0yUMn9AtrjTsKVOrslVRsYigDzwbFn7AVCIBqJZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777251177; c=relaxed/simple;
	bh=Fa0Wmb1B0Rd91BCmBH8iVForI/wfHKIoBy3LTF6XfzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cweJJZIUqp1ftz2aSYoTNQLHA3/9MLlQWQV6aBnLJc6yHVe/gFRCUA5eXPR+FeOWg4kRCe5Q6R7hxGSQ6Yqp0VcZF8tTSzvPwnFgfNEd1z0TwjKs0J9tTW7rtqOEBAGiXL21273BNG+8CCDvg587Zbtr9DcXSiBxe65yrSl6ivY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWpsK1RR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkS1fBY2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q1sZ3d4126202
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=plr1XEc5tQD
	hLDFdxbXSFAGAiC4BdlCU0+HKjFzAIPw=; b=lWpsK1RRdnfqz3U44Pz4s84txVb
	h1gB1FkMn8HAVLop256MsDOMW9ixd54jpjjlWcnJWBNn13TD/w3u5Le0d0VzG+00
	53iMWfynj3lq99SDquhvpOAolMto6smsncHNuHMeOn12kwz7mu3NasrNapEWPFXK
	bHU6WjGVzf8zBQzMjfef5SYy/wXJqhYLBCgMjSMRmLUG/r+CkrDordaFa+soF/PI
	boez1dJrGiLN+oFGJxQXS1bX5TEOSBA/OEEWCRNhZD+FsQmomKIHUsdZVRBg7E6s
	ryhZy+m31+V2LfKtVaZqx4IycYqhR3MWhEjin0aWR3i4rFLbMBWdGU1oUGw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpsguq5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:52:56 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c8ccc7593so11481861c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 17:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777251175; x=1777855975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plr1XEc5tQDhLDFdxbXSFAGAiC4BdlCU0+HKjFzAIPw=;
        b=hkS1fBY26/0pNP8SNB82AIJZknN21h4oIIGL2R25gf1Ksn0YaSwFZs1JMMF5f2vBf+
         ITQDlEcp4P8P/6OmzTKdJa1o45SfmMimCwrjUOgBarnu7GwfDetbzl/1HU687EzxirQv
         WN6hdxvKksJmq7o5+MYtTyL3wWdce9q7jbwzSvjDyy4UNXaM+wFHSme9ASOgrB0t2rTa
         9BjiY1BFiF04hJMkmFnWJlX79TlzpQdvluFZaoSZ/f2oXPQPqj6AjgpDc2vU9qnotKVu
         pFd6PDzpz++nsHvb+UwQdzWb40qu1V2IT2NeIg77MdDwzsGdkd80EdNAOFsoW4vU0Tjo
         UknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777251175; x=1777855975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=plr1XEc5tQDhLDFdxbXSFAGAiC4BdlCU0+HKjFzAIPw=;
        b=A3wpGcgqTuTLf1eHI0p+C9stqLD6lAnZTQMWGXZR3TB6WlmZk4IJQssy1azASqMO9J
         Bmi2PO0Kpm6zitc+HbJCkjPqA1ZvjDmXk5qQ3oVY5Dk/2by8QGdX2ysvT/wBNTYwUTtH
         HIT1qQeS5GTeR+q1ZhXUuv/kp7DaYi4W+07dOdc48vNGZx4W/pP8sYA2CRr2C+j8oMEf
         V4l0XOW++rMq+wlB0wqO6Z7slN/SbLW8FYnS11LZ9XHdwFXzVBOFvSHxJ/fa2mztak7m
         6+cV9PmPGQTnECte2LMWjWiQQakmN6UsdBk3cCMQlIYVBmPtjQYvTf+sBU5vx/JmJeKA
         XUyA==
X-Forwarded-Encrypted: i=1; AFNElJ/p4FotzBKG9+pBa9mkAsG6x4vJejN7l2iMMtsvQNysea/39gmsvVb+qfXBg6iC6priHnJqMs7iQRcZ78+B@vger.kernel.org
X-Gm-Message-State: AOJu0YwzPv5gQZryhNbmly491djvW0R62HLFxljlw9qwKzeaHlkhoN0b
	aXf+6GQHz12ABugwJDRMaoh2XglBfjKnep8A74l9CvniEmdDz5kGVl1jgQtf69vEulATqmMpn19
	N+KJqjAKOmleMWNcyWYaiGPgKNBjVaKSIL1XONx4R1elPQa+tpGRh0a/MqYvQSfhRIKcf
X-Gm-Gg: AeBDieu/Qlt+ZytMpW1zh+8I3LVQ8UyyMbmZtmri9z0Fdo1IZDVV6RWjHTeszPgdNNI
	MhdAOqHQ/X0QVMm2PR1vRxounAzIJ5dkM/zQfcx3EN+co7kuKxgWOHhcNb+IO3C8g6P8kTMedyV
	l40t4CDXD4enP2IpEe502AisXdAEdNyxSvHMNFd+i9q8sSb+TibghrL4OevOlJXBtj0G2TqJ5v5
	ybN/pu0ApPIpOemCmf/9z4Dbg9Kf+oFm110ggI2dVnf+hHFObfeIE5Yo1+1e0Yvd2poaxrr5+JK
	+7YhSg+eIWOWR2ehsJbw+oxJwJVtaPkiTG4mNI8qOBfUWeR68feg8ZxLmSPJCR/T5SP0jAobmZx
	eZxTbids25s+zpQ4XfxpfLixhTskwBoexhrnY1uYaF8uZQyJjmpSrrH3wptWl8xSil4i1vChlsy
	TZzFukwv5k3p1eZMrP
X-Received: by 2002:a05:7022:1e11:b0:12d:d27f:d817 with SMTP id a92af1059eb24-12dd27fd905mr1225988c88.19.1777251175275;
        Sun, 26 Apr 2026 17:52:55 -0700 (PDT)
X-Received: by 2002:a05:7022:1e11:b0:12d:d27f:d817 with SMTP id a92af1059eb24-12dd27fd905mr1225969c88.19.1777251174732;
        Sun, 26 Apr 2026 17:52:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dca2c1c16sm11449051c88.5.2026.04.26.17.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 17:52:54 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: mailbox: qcom: Document Nord CPUCP mailbox controller
Date: Mon, 27 Apr 2026 08:52:35 +0800
Message-ID: <20260427005236.230106-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427005236.230106-1-shengchao.guo@oss.qualcomm.com>
References: <20260427005236.230106-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 37Ft0rSY5Zieq6NTB322mvahSrqSqJCe
X-Proofpoint-ORIG-GUID: 37Ft0rSY5Zieq6NTB322mvahSrqSqJCe
X-Authority-Analysis: v=2.4 cv=Y+fIdBeN c=1 sm=1 tr=0 ts=69eeb368 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=SweKOXIDzLmhf61SmjgA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwNiBTYWx0ZWRfX/uBEh8591jKb
 dq5s0lAjZ0FOCo/c/J2MXVdvUSigCxizUcNUrHLTOBAgcFnNkXQxR6MQwsVkyeWLEQVNpTC8R8C
 lCCvD2qKEPDyfFC4iHEjBYXt6LRpvFxSMHwM0KHq0OqbAh0vKnCU4IY1Ppea2UsO0UYPhV3lfwM
 WsMeJLhhNBvsSavRwbDqKfEx+5/AlrdGo4/mV0KEUI7t5dFOtLY+ZXhmkvkej+Bna003hcQhRku
 9c6lHj9O28+aiKNjY0CtcQ9EEBMF3Mv3fcq/gNCc6QOCMd95EtlkmUy3n95ZPRPEp49BbNNQJ4g
 YXjx1+358chirmpMmjvSSb71MGDz0yXmlEuatHFPfDYa+X9mThYz8umSlNsm18yc8oKzY4JEj7F
 u3nL2qbPWKpoZXF04MJSc9Eb+sQcZGwWKi6M6NmZr2rnbcA8d7v2utc7fTyw+RxS6CP5nzhSRAY
 LhlSuU2VzuK3euRaJxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270006
X-Rspamd-Queue-Id: 7A2F846BC0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-104571-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document CPUSS Control Processor (CPUCP) mailbox controller for Qualcomm
Nord SoC, which is compatible with X1E80100 CPUCP, even though it supports
more IPC channels.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 90bfde66cc4a..c8107d58f3d5 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -20,6 +20,7 @@ properties:
           - enum:
               - qcom,glymur-cpucp-mbox
               - qcom,kaanapali-cpucp-mbox
+              - qcom,nord-cpucp-mbox
               - qcom,sm8750-cpucp-mbox
           - const: qcom,x1e80100-cpucp-mbox
       - enum:
-- 
2.43.0


