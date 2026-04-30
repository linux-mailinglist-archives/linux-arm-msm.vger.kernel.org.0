Return-Path: <linux-arm-msm+bounces-105359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFE3Ld5C82nMywEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:54:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 712434A26AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E6D83028375
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10DB40243D;
	Thu, 30 Apr 2026 11:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0At4fTd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CCk+8HFJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B27040149D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 11:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550003; cv=none; b=Zk9qXxQhrZSV/56iWREBY6LdUr/Vvi1ymkgqrfr7dcdcfpuuBqBDy78zDJReL0paPH9/R+xuXQpCA37f36WfOCsj73LWgL9cw75SpsfieI/sscGtCwDeSrq17WR1o5cuMmN+kjMebvow/pkK9L3+Tst+d3KNKKvJiGCPZZpSlLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550003; c=relaxed/simple;
	bh=QxPMMGXUXD0goR22AbWNuT7RO7qnAyoersKff1sz5dY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oObhbP3S7bC/ogv5q+EjOkVIaAXQZfMg5p0pEGM7UAu7oJ/KbqTYRbLQXP8W9OtRpkDy+Fez4QJ5U3rng/9mwWR9M/XLb+3ZzD9phpuy09Gr1TRTcBp4MwRVjSbA1cdjrIRWgjxOc3ooH8ppNOm5KMhhchoNy0ibMWyk4FW+DF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0At4fTd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CCk+8HFJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UBkDfF1820572
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 11:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VvMdomiGHeP87qTT+uqosOoO7iddjbAchHskXLUFUTA=; b=U0At4fTdrfl8QdP9
	JQsKIphtRxGzsjY27YXJu5B9VF4ru5zEPv8S5HvjrN5TjZs0G3L17HcKX3DBzseH
	vSHF9/N/T7lFiASwUOJSOs6QfrG3L0nwheGTMw2uzmKw2BOlPnmX4X9Viw8fTYQE
	cRhzhPYWB4OYo672bQKUcr1oIXNkRsfctKpBrkftKQUOdq0sf3ls3WS95OvBHiCo
	mgf+kpNzS6rkJH8cQJt3L0WLu/vQSuv60BPrsPzJdpvCV+t5CfH7ZQ7PmsHbNpax
	+axDM3qdYPJ5iwS7ufLyRmJguhR1b2mNXiLTE8PXJRn3dsdLV7XSNl1fiUwpNusI
	TP9/Xw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv6ger0q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 11:53:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a90510a6d1so7262925ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 04:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777549998; x=1778154798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvMdomiGHeP87qTT+uqosOoO7iddjbAchHskXLUFUTA=;
        b=CCk+8HFJCwEs1Iw0VsLwuKUaMKe4sGGl9RF1+ba+HbjGAkGc5ZUkKGBJqZ+wy23ysG
         beLWPt3mgiko8VuNesIyb9mwiyp9mupkUK3YUYtlNBgMzJqjsQxGwVT2EQXUQ+MkZu/R
         T9CmgziN3YaebIAXm16BTvxZX0Bpqmt+IqogG1kU6KIPqsoKe7l8GwpneLjWwyWkTyGB
         2xumrXf1HqANo6v8KWpNHLzxv7LettNRO7j5aDafkI2NdLilp5FqVEWgprQ8bSZl3sEL
         k1viFKuX9NQnub/Xf6pEiKnD8AYRzVOTM+nh+wk8fp2ybKdpDSN0m806/gbWXPKN9Q9I
         c9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549998; x=1778154798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VvMdomiGHeP87qTT+uqosOoO7iddjbAchHskXLUFUTA=;
        b=tWPJsvcaZ93Nups8r1sxTWF3BtDGWpkpHRQmnKGkXfEFFb1Rp8NkbHjcRfHkQrUHri
         qS1pxYrJuuH6Rbg8Alj5b+o6z3OyTWLpJM5xRa7vRzwaxXkAdgozg+eVEv7NVO9rYLYZ
         eO5hz2CfAQSwo7/79MtlDS4K9wIFivV4xLh513iQ3Bwvm3NQREjZm+RQS43Lhel75nSi
         UXrlrHb8S0u/CmOSxv5Zes/boqhKIhxpTiuideyby04RJrUDaKWUSTOcCbt5LrMUXOlh
         TfJh+UjPvUFsJLmTorbDJdUK3sN9RdaPNl6g6/bksCilI3iaEsvitmRhPW7+IM5e/PJ/
         BKow==
X-Gm-Message-State: AOJu0YyZkHQ5PWr09UdZoSu9pHWTDxgj/TmoNfEq5m7j5sah2S325+Rz
	NSnyuk6ndTxSjuTqT/excJGX5DpKzxPWCzqFEbau6jHzEIUU3sgwwT6AAep6MS9nEc4dwFWY/A5
	+Ei63C+aJtMUo0FfoLc3Ec+ZvgTAQJecb96vxBrLaY1NTLPSNMzjco5F9yHCl7bZkGteT
X-Gm-Gg: AeBDiesZnDBqqoYJh9uwgJ/W/eYgKg7NzUE9sK83TVg9DQGX5fwUfsJxJmjqbDzeaTS
	bfuYlLVpWWJRJYx3u3dzX9Y4XSicoe1lCNfUWQBdAfe+6a+qLKeS6UBClJ+8MPsEVwyaUVw37Bz
	7joj5Nu4x2AI7orE8PRYRfyels5vmgu7SJE/ueRLjXwl+umnotL14dbFfV9mBhaU27Du4oN8fSk
	faIMvmh9IjsXJq89Tj6JdvuRdstG2VqO9jgakDbm8C5trQYF7gz+TsUtZQ/DKWtJ2bJdyAQKlrd
	IwkoHKhaLwl76A8JekrKn3ACTzLxAwQ544zzUwBJObWAIwnJVd3msuIxXnA5KZbaJdrryQ+sYEC
	04ml0/YRGz8RiNzvLbGXxPcEl9aMVjS0m1tW8c3i7ptnnask=
X-Received: by 2002:a17:903:7d0:b0:2ae:cd8c:bd04 with SMTP id d9443c01a7336-2b9a43103ecmr13838055ad.10.1777549997908;
        Thu, 30 Apr 2026 04:53:17 -0700 (PDT)
X-Received: by 2002:a17:903:7d0:b0:2ae:cd8c:bd04 with SMTP id d9443c01a7336-2b9a43103ecmr13837835ad.10.1777549997476;
        Thu, 30 Apr 2026 04:53:17 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988971138sm53834955ad.70.2026.04.30.04.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:53:16 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:20:27 +0530
Subject: [PATCH 2/5] dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for
 Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra-usb-v1-2-c9c108536fdc@oss.qualcomm.com>
References: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
In-Reply-To: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777549983; l=837;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jPWQHE6KxD1TKLInNu/I4iHlxuYT8OtLcKrqMYmEjfk=;
 b=ovx88w9T+mcFNC7WEAoQn6UBWfH20QIo458COMnNSXaqu+iBLyiJBQHt5LLUDfEzb2MVWXzVW
 Xb0LKnj8h0dCcpEu0CkyF0hf8oXDBgKjNdD2FPA1scb5SmsFZPjM4Gp
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=f6V4wuyM c=1 sm=1 tr=0 ts=69f342ae cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bYrxjfJhQvMAygBm0bIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: iHj9eNuIxvw15Rw0C1KibRp5N1VuV62z
X-Proofpoint-ORIG-GUID: iHj9eNuIxvw15Rw0C1KibRp5N1VuV62z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMCBTYWx0ZWRfXzutmuqb3mGZ6
 r5n7LZz0IQd6JPMZwVgajkVOfOMphb705wM6OlN7jXn5RxuCu9HkyyhuWsobg/qw5zlET3Dcu6S
 BRDblB12PQQ+dN9qI9E5o4SR1L/Mf3/C6Fge7H3qzp9rO1oLsZ8gqkjMPo9iR/9czIPWPOX4tLr
 2nJkoRcFq80/09ae/QRpQTobdHwECRTo4ND1SxoEU3BNjNhqAO9ZMuTp0InTKuqfH4f+M5cN/8t
 SJiaPgqEOOrOYVyeyk5Q0cEmCjIHFYR9y6TID6NxR3KisxvLZQ4DqMTwlHWmqxozPvio1YjRfRv
 q3d6LrBhxkVgVxkyiFPFNuiF26Tz8OqcW+let5wH+xXeJv4+sO5ohhYOfpODmAWBJ7QVBv9gHNb
 uhiK+Or6pQoGdJ5F6hY+xXe8Fvew73PGY6KCP37O5N3lDsTdkvX7+OCUSpZtwFXiM3/UjXaNbBJ
 LH7RpKXNUHSZGeLL9lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300120
X-Rspamd-Queue-Id: 712434A26AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105359-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Update dt-bindings to add Shikra to QUSB2 Phy list.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 39851ba9de43..ddbddeec6fb1 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,qcm2290-qusb2-phy
               - qcom,qcs615-qusb2-phy
               - qcom,sdm660-qusb2-phy
+              - qcom,shikra-qusb2-phy
               - qcom,sm4250-qusb2-phy
               - qcom,sm6115-qusb2-phy
       - items:

-- 
2.34.1


