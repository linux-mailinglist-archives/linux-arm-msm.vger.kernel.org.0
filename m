Return-Path: <linux-arm-msm+bounces-115528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /4xuMgwURGqIoAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:07:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2B46E76DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:07:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y6134SpF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=haa+EnNR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115528-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115528-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DCBF314FEB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D863DEAE0;
	Tue, 30 Jun 2026 19:03:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C6D3B388A
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:03:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846219; cv=none; b=ioeArs69nSzDGVakmhsQbiKo88ZDpYOQlfUgNi3HY5e4qDqlmYJVPMpMDEQG+AaN53Dvzg+49kLPo7j9nk7+0pux1bXyDh6ZRnILqp7LXztRz+GcMgdCmlGSLQdaLpIfa2zEkKdMlkP5S2WoqHTh+dFVp6H7rYKL9FxI6AlllFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846219; c=relaxed/simple;
	bh=G9NuEUCFVaxtY10oIrUXU0lQ2ELQ2IRw99bBy7IKbvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gClkqg15CpOrxY10Mftz1L7+JY1ZMTU9NqdR6/9dTOuiYVGcKijhbm/fmFtPSLG2x/+LxJcemwg/WpGaAbDu5od3jKaIRlaSUra0101RSA7vnzt7yVdTZN+8kcW2SZfUJjlDH/l2LYVkNNn4+VjAhGfKMfkmndLIw4A29Fcg1Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y6134SpF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=haa+EnNR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UISIGE2759723
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FV12mCo2AWWxRhbF4a82EfY6HMBsszJrd25mPZq5hTs=; b=Y6134SpF6Qu5ds8e
	ycmPM1I3ItOtsiuisnT600NgOocxPzStjEoleO9G00qfnKIZ4nifXQf8IGO1sSaE
	yRu4i94n27AyKOSwMdRKIzgje2UJ5Lv+9B6/jhOHPPaQpCUJQLCpaY3d+EFxCVRB
	CivxGrYcKJhLVuUqJz+Env3uqHWFwIj+4MnaqovUqL+VO6uTi9cYcU8l4xXg8hxd
	yd2Gy0a2B9NXHNjnN9Ww6L8urXi53GxDY4ExRUrZLEJxlz5tVXsGihgDa+e9ujuQ
	x+hBBtRqJ5zwqsXv7m1yyE2hoOF070udOnBa/qcBWD/hXPgDVsFgGRvA71l1RY49
	TcWVKQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sg5pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:03:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ed664e368so857312eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782846217; x=1783451017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FV12mCo2AWWxRhbF4a82EfY6HMBsszJrd25mPZq5hTs=;
        b=haa+EnNRvZzIrk/O7YlASG5jwvjG/2y4FjBR5lP/1m2Kd8RnAsqiWR6+DA488SGMIg
         BRsTkHYkDgUCdvXFQjBKxNmnyG8F3cVzQfaGtn3Z1ImfP6gmGUA+uElRceppj7DXFHqs
         HT3lcv4BPLz1dUVeUIpMRXPBkR1AnO5qulv0/FABnvOFdWHjQAJxSp4tRCGBEMHmyTJg
         KBr8o4YFtIIXR0tADK6fbTyACNYI3lmL+wIbYkcVQGl0AQ8w8C/e7iB7b/zWgApipg2Q
         lYLYMO+Js+dfB1tZ9p3Xsm83f0AxcHSple0aGKPD3B2ApgBhqnlOaccx6fQW4YDwtFEX
         oKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846217; x=1783451017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FV12mCo2AWWxRhbF4a82EfY6HMBsszJrd25mPZq5hTs=;
        b=dEonAc4k5Q8HJHhGtZ3D/2SMZRWod1TypRAlIzGMZO3hJadv9LPpLGS1+1DHGdj+C6
         EcfLYgpKc0GC2sT7j/kOvtpNQAASvCDJjBRDm6iDGM2CG8HCZr3QrOxZSYLm+zRQTOjg
         DY5Zanau+0mFd91QZ+y3sCdG1i6jJdAzCmyIk5HX0NI0ZxVAnbo68EQTPGLrDBdOzCtY
         QmCV6O4KnJmFgpTlV4HUmTWvBVVfjcFrKN7bL9ahtzHXshVL8J11hOrcVPziQnCCzWfW
         QKE3o3TAYKqWTLdVl/ryNGvTW5NnBQE0juyfHMJ+a28OJhP5QOsmquzM6qFNUrN/k51A
         F5Yw==
X-Gm-Message-State: AOJu0Yyb2kidRWcU4LTI1aSYVCxnSycixJEshA883k4vJEuDZWrER8t+
	AuMBTLzgBqJ7+GCw4gIENRItylb4HfAVga0mJrbiqmgpXTybsQh/GVZItxaAvTpqTMnN+P8h+1f
	Norcj2pNT85AOHwHqxDVIvy6FqAC1rhepLNh2vVNaPhd1Y8DCLMFjw4Lha4iLUAiaz5Hb
X-Gm-Gg: AfdE7cnPvr2atuuz2YaQURR5ExdSsR0FoWV6RFU9/tQnCyqtXEL6zK6gUrixS+uM/GL
	J1fjTXYk3QpAW6/VWgjQaZiQvY70Qmj3Cd6Z/kLKhcKKrW6gY+QVOkYb+toNCX3hd+zn7EpF9z8
	4PoI6hIGin+WSMAI0GpJvlxyRHHyvI2N1dqe3pFvtPjEzhgj2tTjGh98+QareyGNtiBrWHEw4g3
	7sXOVWhANyEAr95iKEf9/MWjKBnkx8ovvg3elROQPNTqmjv68OTAS1IyAr9MInZ9fF9q0o9t7dX
	rRX5HWIBVVVj6geniiFcbmbp142u+J8Q0UQmn3fK1K1Yu0b78Qx6un1lsg5cE5x6wOpIHXgCnzL
	BKXMoCS3GqNFUbUbLZQsl5oKHBH6aGZeCzs3qAA+fbM1IltQ=
X-Received: by 2002:a05:7301:46a0:b0:30e:d6b3:ba54 with SMTP id 5a478bee46e88-30eea0fc2bdmr1565933eec.17.1782846216852;
        Tue, 30 Jun 2026 12:03:36 -0700 (PDT)
X-Received: by 2002:a05:7301:46a0:b0:30e:d6b3:ba54 with SMTP id 5a478bee46e88-30eea0fc2bdmr1565901eec.17.1782846216246;
        Tue, 30 Jun 2026 12:03:36 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm14963815eec.15.2026.06.30.12.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 12:03:35 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 00:32:45 +0530
Subject: [PATCH 3/9] dt-bindings: PCI: Add bindings for endpoint gpios
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-shikra-upstream-v1-3-e1a721eb8943@oss.qualcomm.com>
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
In-Reply-To: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782846191; l=2200;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=G9NuEUCFVaxtY10oIrUXU0lQ2ELQ2IRw99bBy7IKbvQ=;
 b=3iFkILvz6Ich1wFw6kF6CgoiNAp7GPTE7OmP5ZgStMcDSZdBrMyhCoLHdByPX06m3hNHkFaHw
 ICdc5q3F3b2AFGJIuEe4GmSzWB1iOK7nu3PyCCLt5wJMZN8on9w5JNO
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-GUID: tIEgfjLKpDwzzozIwGr_JZ-dJEsNbKV7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfXzlFBun90j16c
 om+65AS3ky8yZCjRd1KkYTqBuW7Wc462s/rs7by1xRIAjMRleoKsHHM+qa74E+zdDJeVZBLYNzs
 99EhV9UKWhhecVcUi5Dr7hx+HFfUtvoZZ7eEPWZTWjPv7xO0n34lsNyRT5lBCNDaSvXlZ5uWm/y
 A+KUVf49Sgp6BgyhDxTx4/w+Thf+HePA/NjiKAxZeTno1BFnpWKqwi9jrYGaBvFl0s51JhM45Xn
 nxRGRHgTccFOqUpQPSYltCKmfCxjcOh0R0zwlt1SWZdA/iHFjF8RDFAFQUekRd+fsmQkomWa7CD
 J7e+XdCVLSIlKFFsiqsNWxaK4eQs1p3zZ7OvV9GFS3Qrth6QyUSTWOe136xE547FtfaU3n5zr4y
 xteyv5tS1bIHUQDb2iYY0eZRkx3NocPS8zwruPH8vqdcGO5BwmD9dYEmYJfMTosrHy6UdPnUtwq
 P0WaQ0lIGUQD0HjRjOQ==
X-Proofpoint-ORIG-GUID: tIEgfjLKpDwzzozIwGr_JZ-dJEsNbKV7
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a441309 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DMjCJHwfCTXkfbozVOcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX3VNbm97hxy8V
 7EZn+kYCfMFwbhlZ0lPQX+i6Tu6eoKJv/efMjoGvhstzZ6+nOgcCuhKJz1TpSHmzQyFSWYUSZNu
 3F0i2QsP2uqDG4A8zKbyOYW/xQYfbUA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300182
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
	TAGGED_FROM(0.00)[bounces-115528-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:sushrut.trivedi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E2B46E76DC

Add devicetree bindings for TC9563 GPIO's which are
used to control endpoint power and reset.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/toshiba,tc9563.yaml    | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
index b3ad05d90201..f9f71f28aa92 100644
--- a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
+++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
@@ -26,6 +26,11 @@ properties:
   reg:
     maxItems: 1
 
+  gpio-controller: true
+
+  '#gpio-cells':
+        const: 2
+
   resx-gpios:
     maxItems: 1
     description:
@@ -69,6 +74,17 @@ $defs:
     type: object
 
     properties:
+      reset-gpios:
+        description:
+          Specify the TC9563 GPIO used to reset the endpoint
+          connected to the particular TC9563 downstream port.
+
+      ep-pwr-en-gpios:
+        description:
+          Specify the TC9563 GPIO used for enabling power to
+          the endpoint connected to the particular TC9563
+          downstream port.
+
       toshiba,tx-amplitude-microvolt:
         description:
           Change Tx Margin setting for low power consumption.
@@ -104,7 +120,7 @@ examples:
         #address-cells = <3>;
         #size-cells = <2>;
 
-        pcie@0 {
+      tc9563: pcie@0 {
             device_type = "pci";
             reg = <0x0 0x0 0x0 0x0 0x0>;
 
@@ -120,6 +136,7 @@ examples:
                 device_type = "pci";
                 #address-cells = <3>;
                 #size-cells = <2>;
+                #gpio-cells = <2>;
                 ranges;
                 bus-range = <0x02 0xff>;
 
@@ -154,6 +171,9 @@ examples:
                     device_type = "pci";
                     ranges;
                     bus-range = <0x04 0xff>;
+
+                    ep-pwr-en-gpio = <&tc9563 2 GPIO_ACTIVE_HIGH>;
+                    reset-gpios = <&tc9563 5 GPIO_ACTIVE_LOW>;
                 };
 
                 pcie@3,0 {

-- 
2.43.0


