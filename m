Return-Path: <linux-arm-msm+bounces-103639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL+KFwmM5WlulQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:14:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 083B842628C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E692630115B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 02:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6FA2280338;
	Mon, 20 Apr 2026 02:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqMePNDl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xnxi7dzQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E3A1DF256
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776651265; cv=none; b=Rd4Tdhvbrr0gB+EuHa1NrLj8g9Eur7yGvY7YeKG7LgwIkxgG3rBjRZk9GLfxYZEYIOtX3fbc33s+iAG4JnU//071X9UbB/rAOTAsu5gkwe5mzoO72IUCIQMIY8psqhBYHL9H65AQ8kQSDezySV9Y5WRXek3Itcr4X2N82e7nRS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776651265; c=relaxed/simple;
	bh=qfd7iwFejapOwdqgA3gcHNnMcjbjqRylRGGeikBCzkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XcRz2p1qhWWN/XUXFpaIX2ssn/TYp2ALI+B4RI/f03ZwP5vMZABX0hf5HVGL7hIByL1+5rkpq4gCMKzsPYeCD2BmQpzLRSXNSrGlC5j7V9QJsvCNDvnvIItOzvf9oy5h0quP3i0eMyLJo0TPcEgWwYc7BoA8ClnAD/0Lonztlao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqMePNDl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xnxi7dzQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J1ni4r3978145
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WUzQyC7Uu/vAoTWoSFyqpH+tWUEuLq7L5Kq
	PZoVEBpc=; b=bqMePNDl3JXmbQrWg4+W1ziL2kXL+70Rp7w4JnDCl7jVKWjaOhr
	JHgCAvUKoWtETuEoX/xh0tG56KizgtncX/t8ybmQluX3ka35pFzSubbbeem1c0J9
	Cxe6pzLIiBn005eW3+aozx1GEVoQ62Gpu/2Avn1yiX0PUGmaxcqvC325b3lFF9dV
	ZNfBHEP277e2usXIn7BuAbiTBOt3css7OBr/UZhN4uzJFRqrbg75qz8jByoo0+/Q
	fxAooFQKgzPPBBpEbUI4TYN3QfOFl6aZ2C6BptA0AU74x6g26zt3j/CWzQrEnj12
	zivqDCgt171YVX0XWnVTkFNwD0yxqVVAGFg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2qakn63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:14:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso3140271eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 19:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776651262; x=1777256062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WUzQyC7Uu/vAoTWoSFyqpH+tWUEuLq7L5KqPZoVEBpc=;
        b=Xnxi7dzQ+eEUJ7ZQTv5svaO3N5UG9gb7OBhQe5Gjcf0H3eUVemMBhxeYtxiF0c/Iya
         YolnHeT0lyPO1tJWt+uSn9H4mwwYnM7/YINpvSNgVkyNAi1kLhrWjp33+R9xCAVaU9/9
         GSz3tvM8Y+LVQils5Bgob3Bxg+KQk6vLHwXNqeZcJrik/RwDiymXJSDdlqdbLBB3J3Eo
         8x0Rt+p2tXTXBbDWeXqUfg4FN2bCApJHpeMRJY8PVwVUdXDeul1shVzHO9JMhUkSjBzx
         EMKDo8q2QwujQPhCGC0CdTzfypZU/wL85SAp58DGln87QrpTXOMnOP5b+pSUnnQYiEUx
         i2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776651262; x=1777256062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUzQyC7Uu/vAoTWoSFyqpH+tWUEuLq7L5KqPZoVEBpc=;
        b=lhxUGl7ZueiUp2uqDgj+GaxLYMtRgLNyDHEA9muJYVTyIiUuGGVNLrQGFadc4QzYER
         AIImI4IwV8saM7MYAbXYZLU13PyAIT3nJZE063SYMzoi9HpOl5WyiCgg12y1IMq6V8OD
         s/MOUWGoNWgN8HYVai4Lq3mDZ/CQfq2woA/M6xpMgyUdt7FMI9+8c48CSdHMKfylVMS2
         IjytOOx1pkwfj+CyV1F6pSCsIzHlzbiAVi5fbhX/0Ybohn0OtZhhn/8n6+/kHuuTbADb
         SDJEbrBjFURuFUo+X9dpGxV0xzdIR4Z6W3ruB5TRlgQhHEkljNDth7vZUez5qprPX8Vn
         4AGA==
X-Forwarded-Encrypted: i=1; AFNElJ+W2bAKfWmuOTp+mgZ+vRXpK4m+0W2x9s660G4ycZlEU9kFIwFdceKlrdVRdgGcaTRTOl5AJFD7VLTZHQr9@vger.kernel.org
X-Gm-Message-State: AOJu0YzBaC9F5byPopPc+g86sVLA7s4KaGpKU4c8pYznMYbDU/06jTsM
	tAj1lBXcILnsvqhyiTu0ysoXQxEtC3qPiI6hl3i4la4HV51nFt8aQGWI7zbELm0O/1xp8+6Vbaf
	H4pksr42k1cpulseIw/99ntXAsnS1jDez1Q9aiKP5t9WthR5NemLr2Cztgroe5pgQzAQl
X-Gm-Gg: AeBDievqgWb/9UCJGyBlBRWyFftNJ9CZ5+q39ni9TfOREAox2nFnrSIHKDM/qKNhz0C
	nJsvD/E2NTc6rzjohiYWlD+mNN2QpdS/upmbUhKZdyFmo8JPPyWErfsRAQwoX5QT0WD3zZUCMrp
	cgo5QcrZRKWQFffeFGqmX96Uihd76175LMwe42S9WbBcFi4zvdoDWSpgK4vEP+osK8jqL2F2wPE
	aDnGOP3ZJFgKM1x+jyayPuoXUZYqG+A6BzkpzQg4u4lOHHqxBWg2RAcOVnGiqXuUMcg5Gct27mg
	j7B5x+VabmXg+XtASYlDObFOqvBB5GtVcPgQ6MxcSKMT7SIPeIVl+Nb8GQsISchw/X2aP+VJ3ks
	jd63+S/V2nWRXrZuVlWA0VqoQqY8ymtQ5FnUXcjnX0D7H7RCm+hw1PYh2btUhyhKAP1rM+kyyNK
	Dkwc67kvzoNYxSJL5V
X-Received: by 2002:a05:7300:4308:b0:2dd:8a02:e8bb with SMTP id 5a478bee46e88-2e479110945mr6195977eec.27.1776651262430;
        Sun, 19 Apr 2026 19:14:22 -0700 (PDT)
X-Received: by 2002:a05:7300:4308:b0:2dd:8a02:e8bb with SMTP id 5a478bee46e88-2e479110945mr6195951eec.27.1776651261881;
        Sun, 19 Apr 2026 19:14:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ab8b89csm12556600eec.12.2026.04.19.19.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:14:21 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] Add interconnect support for Qualcomm Nord SoC
Date: Mon, 20 Apr 2026 10:13:49 +0800
Message-ID: <20260420021351.1239355-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3F0y-7N6mmKvv4UBZCbzFYuIR742YeER
X-Authority-Analysis: v=2.4 cv=KdDidwYD c=1 sm=1 tr=0 ts=69e58bff cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=fJYZd5zOr1s3VisSgZEA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 3F0y-7N6mmKvv4UBZCbzFYuIR742YeER
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAxOSBTYWx0ZWRfX5cBv1V1gkoZn
 af1XxeBXR+unJW/8FoeXWt/E0hF8qB3vUaYjaXJz226xvmIFwjFM6O7Bc0u5wyoLFPdxnWClDFA
 rFRlsRu87hq5DFoK3M+IrPjg6xk5ksIrfQGjwCC4kBZm6LCRT0E0Rtt0k3lEFbZo6Iv3NmPsDCb
 4Wqb9ONdkL1x9Gh3/0URN0dUYUK5KDCBBLzs335amPaP+eoipzqI67R7En6XyReFdupTyDnGDtI
 aFG/IzXW9+AHn+kkUJgJXGqE0EiGl5iiDy4kp4r83JhPViLsLra2DPXaWLJ2yiEsC0sPXsxQe5i
 OaWkQBMxyd682raezJXKJXA+UEE5orLEHWEw9cMwmNUQYJ7HlaL61DMUVVVgplrbypgKczFGCy+
 7t2fBXzwv/wyotC2mgXn/qbRF/3roCoymi/k7nXCqiuNYiK5F7Tkxpkc47gFycUgKRGpTmyyxQ3
 7ONklPgb6tmZfhlMdGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200019
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103639-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 083B842628C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds RPMh-based interconnect support for the Qualcomm Nord SoC.

The Nord SoC features a rich Network-on-Chip topology comprising 19 NoCs
including aggregate NoCs, a high-speed configuration NoC (HSCNOC),
a multimedia NoC, four NSP data NoCs for AI/ML workloads, PCIe inbound and
outbound NoCs, a system NoC, and virtual clock/MC nodes. Bandwidth requests
are communicated to the RPMh hardware through Bus Clock Manager (BCM)
resources via the Resource State Coordinator (RSC).

Odelu Kukatla (2):
  dt-bindings: interconnect: Document RPMh Network-On-Chip for Qualcomm
    Nord SoC
  interconnect: qcom: Add interconnect provider driver for Nord SoC

 .../bindings/interconnect/qcom,nord-rpmh.yaml |  131 +
 drivers/interconnect/qcom/Kconfig             |   11 +
 drivers/interconnect/qcom/Makefile            |    2 +
 drivers/interconnect/qcom/nord.c              | 2682 +++++++++++++++++
 .../dt-bindings/interconnect/qcom,nord-rpmh.h |  217 ++
 5 files changed, 3043 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,nord-rpmh.yaml
 create mode 100644 drivers/interconnect/qcom/nord.c
 create mode 100644 include/dt-bindings/interconnect/qcom,nord-rpmh.h

-- 
2.43.0


