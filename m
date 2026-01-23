Return-Path: <linux-arm-msm+bounces-90350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHnyNK95c2kfwAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 14:37:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 887FB7659C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 14:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77DE2301CDA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66411322749;
	Fri, 23 Jan 2026 13:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKA4vml2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGyR8lBT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662AE2C21DC
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 13:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175453; cv=none; b=Sh7/F/GJpX5az21ytYWaPyOQdYiKiMJ/p3n4mBiTwLx0qWU4PhAo9g1mNalwxcynZ4W4vwuXWXaxmjExP5DgkWtnVfKLtuJ3da3Ia745RZ4kwGDa/7p9aZpfSLVOTWpBe+f/lSt/ss+kUWr/3Nlo0s27+oxyi7oZ66nPXw+5VAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175453; c=relaxed/simple;
	bh=8PZjtwCE74zlt56WmLIGgDcsh+itaMCXKEAloYDRiJU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GWoX8iHR1AlZEBZ8dqd92wU3ai288+hybCyG8AFTU/aFJLrU49rW4dv7jEDmncefYam5rxTDjLLINX+DbeDsD0IDd+BtGRCiAxLxlQPmGcqWCOjgX4w+kn7jyVviCFjN7aP9KwNbE/cVRyznRYLgxYvgivi4e1I5LY54kC6dEZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKA4vml2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGyR8lBT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NCUbO3324419
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 13:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6ho5Ky5QdPw80jp6iOPH/I
	8edNUckcYBGFFXot+7RG4=; b=AKA4vml2gKrDb8Mh5tq9MR0iYouPCM4DDTeuzO
	j4g2bCECi2IuLGMLReqKcQ0qFFBes+MLEmS91n2Pepi5WVMlJHUr7gHmsnButkGd
	ejU1Flv2XcVXhw3TcVn8mJRgaz7WwgJkeLWlfglT5wXD6pGGATqxXvO7EOGquoCu
	UWdCEbtMXLgnHTC5ABfo6yl+6BBPyKWdzRnwmK1oubwHz6OiJcSZWD6HuDiPCbM7
	viV4d4PXsTqImdh7ESClBf8FmoGrCo3KS2/dmyX1zI6NMvQqhcgCJAXL8z8KQKk9
	R55vQhMdo9XBhrDiYZ1H9swrFDv1hXFtWHB+x/LZVpRLFFLg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv3mq9geu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 13:37:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52af6855fso290008385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 05:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769175449; x=1769780249; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ho5Ky5QdPw80jp6iOPH/I8edNUckcYBGFFXot+7RG4=;
        b=gGyR8lBTR20Sl5BN8yda6tVGmPIi6fK/86rVjlEFqXFwpaPIYCK+HbfCX5fAW99wwo
         EH+zGLRiubXgBxLerb/AoR15RL6iEhncQLLrnFNVQFX6l/fYQ44b71gRg3b9hkXZBL29
         IVQqxd32xwdLM03D//XhtltrGe/jXiRcpkfRTp64LLKTKuozldTwkIva4WaOF8/9ezHu
         6YruhN/5cMUl7B3JKfIefto2TiAWLN6FC9NMC2fSS0CNZj2X0BY67dbxVrHaX+5C5fNc
         AsdDjEFW3Gf8uptTdMttTZGVD14gro6zxeqEDiL90MrYqEnGidTdw/bSTcKTs1Xyggqq
         8uYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175449; x=1769780249;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ho5Ky5QdPw80jp6iOPH/I8edNUckcYBGFFXot+7RG4=;
        b=EDqQvTcxGchhUPmPgJvvw7QTB7IuvUJR6DGVXOeVqFbtVu7urRIvQllJ/cLffrGqIp
         hUQwhO9UBTGRZkeJUVoPMln8rV6q0+ky8vTv6NOcb1NbSMCvPOvO8dcykMl3VLz7rkqO
         X6fQcUybOigvg3RYmqqivNYRv8sFsmsVY9Wolf3/Egv+6NkgFrMWA68R9mI5iSAgvDqo
         HyWxzT8pg6FoBr1ltm0lz8jGlH3U7jcvU20vVTmUuqPlNX3XUQ5oabWHEe6ZPy2eS+ye
         3PAiXSAHD14iZ6oeBLAmlmmn6rRopUU7gu8tQyKkF9MJqDkHE7sJH7DBFaNlyBaBKKP6
         DU2A==
X-Gm-Message-State: AOJu0YxfAruH3aRNr2oUcEbGxA9VugnZbXetLvoCQ2cPCwd27dv8l6Du
	bInkguUPch085+dUVKl93/qOZ+REpO1NstzDZR8A0L0FAGl9OpEEgRbj6EPAzUFBRbhm2tK7oDX
	O7O4FCCe5kDhWwMT3gGZzUBfLkGEVJ0TOograCmEHe+dpa0wrhrHHsTaUZxJKzKl8MLlH
X-Gm-Gg: AZuq6aJ61fDOmwrF6+uU8KsdC6tNKfy/IMgOc+DMRBI7uFoO02eIx0CMBe8e+adgmje
	U+1kg9ZNuODuz8GWKUXZ99oWPb5rWn05LzyWSs1J0YrDuz1ompTQZPczHRkhkiiAK7fwzn0EiWG
	abqp5/3xzu/LkorHdDHoq3TMdVCF3udwcTsNsuoC3/ANYvCxVUUoV7hIXggBk2anKtJQxDg7U4I
	436qNxhAL2Wlkzk9d3dYds5GpWmi2kTjs6spzLxj6qwd0HYskojf2vvzfJY7JHDKnhiJL1xeGos
	HGY3bpJ4NjrtO699sQeQSNrycNLa/ZPABhVWU0WmlEq99z9c/8PKrYji63zEpKmUN501nVs7oqi
	D9iKqBxoKGDhd78T09w==
X-Received: by 2002:a05:620a:4154:b0:8c6:a22b:e12e with SMTP id af79cd13be357-8c6e2d837f9mr343338185a.2.1769175448653;
        Fri, 23 Jan 2026 05:37:28 -0800 (PST)
X-Received: by 2002:a05:620a:4154:b0:8c6:a22b:e12e with SMTP id af79cd13be357-8c6e2d837f9mr343333485a.2.1769175447903;
        Fri, 23 Jan 2026 05:37:27 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e7156dsm6649882f8f.20.2026.01.23.05.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 05:37:27 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add support for basic clocks providers on
 Eliza SoC
Date: Fri, 23 Jan 2026 15:37:12 +0200
Message-Id: <20260123-eliza-clocks-v1-0-664f1931f8c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIh5c2kC/yXMQQqDMBBG4avIrA3EQCv2KsWFTv7qqGjJqBTFu
 5vq8lu8t5MiCJReyU4Bq6hMY0SWJsRtNTYw4qPJWfe0mbMGg2yV4WHiXs0DyMGFt8gLisk34CO
 /a/cub+tSd+D5/6DjOAGFVuh8cAAAAA==
X-Change-ID: 20260120-eliza-clocks-5ee7ec9d0e79
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1397;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8PZjtwCE74zlt56WmLIGgDcsh+itaMCXKEAloYDRiJU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpc3mQPhR/1QpguvzVD3DuqG/0YITvQnoXi57eM
 6IYz9U7oQ2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaXN5kAAKCRAbX0TJAJUV
 VqdOD/9CrbHiPslEUGvKacKsEsYTiwXNF9pL7r+UEIpxhPrcIf1TBBEyczqwzm8deNux5yJj7X1
 00gCR4MbiG0PhtBNYZeaaQ93KbagTxV/0Hnr/UbQoyGfupLQI8EJqgwpH4Lwn9LqcCnIO7Umht3
 Aq0zKXY15NDL8ccdUssFbvuNmau43MTyz6bMTXfCbyX1i+qrEpdRQvJjSm/IQBNMQm6xgH70B97
 dDtkq6r+XBoG9im6NROzFYMTcBlnU+P2vxgJ/dil8gDRDMNqc/gUcTVKurusJGFXHXY1RY8UQqH
 ULaULP0o+bOpCwLloq1dX6CwJZxozbufoJlrUrqRiJ2l2/UEyba9wmEdTRQSMI4I/8bAaTfOwdi
 BT+42l3XCHduNolStwGoIifpSy/PrIFW7+ghBQ2JPBbMcnSINYyE3PpzNfMiEPDrWoxCCTF3AY9
 Wr+yNKzKl1PesMjDT33HKt7MqiNC5p94dlEFBPwhST3MNNIyBTqFdQ2vQEWxEBysOEq4fZ15Dn4
 Nmy42UZPtO/itJ6bPtJfP4AJD/seVJf8QEXoDTvrl/AMTePhJoULMg2pWxchTP/CiOWxmpSUqph
 oDv0+Fmf+wxD/Zvdo0NA/1jDB1E+fTZ+AZDvJJ0QIwBF1McfsPf4HAOHYsY0PBDUcUTpnwF6vpg
 rBofnpN/We0Zgag==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: BlWIiGp8zPdzOf1vbnEpG2cD4KvUrSHt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDExMiBTYWx0ZWRfXzSE1rmGXcClL
 J+cAPghfNoVNsDzIwHm21EeQ1VLuzgypB2MhgwFWqB+nPLwIAPLA8jRyxbXcCBU4RtepSoKiwDv
 ybLapC6ghKHpjVc+nNQxmb3X8E5uOg5JdX/z5fys9pyaPS30zqJHcNRah7cW87wNyKQOLgM9Bju
 Bp6qI4eLQTREReVm4SnXcR3ZeGvBPbDZFzLq7FO81yE+L4sQQ3ggUp9IrAhVTg95K/+Vt4oC5fy
 Ha+717+7L1JUULZm7QPyW2k1tteAXTzHLdEsM9SRBeC9DuyBZP6e8DBi+KI9k1amw4ddjniPgUy
 mBO+zFazJ8b2xlb/bWUSSiO6P/cff0VrM1BwjTt0gQD6DRnnSO7BIehJ6cGJGYp0Bl0zT3BxZG2
 oUfHgrldZza6cI3ZpVk73lsvxp+K/dm6K7b4CV5ntemhvhEWSX/478hRXDrZ1vRfbosylpQwCht
 N0dpDaBMh/GiUlJaDAA==
X-Authority-Analysis: v=2.4 cv=SMpPlevH c=1 sm=1 tr=0 ts=69737999 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_s2lmL9ZJNBb6SD5BL8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: BlWIiGp8zPdzOf1vbnEpG2cD4KvUrSHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90350-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 887FB7659C
X-Rspamd-Action: no action

These are the bare minimum clock providers needed in order to
be able to boot to shell and have the rootfs on UFS.

The multimedia-specific clock providers will come later on.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Taniya Das (4):
      dt-bindings: clock: qcom: document the Eliza Global Clock Controller
      dt-bindings: clock: qcom: Document the Eliza TCSR Clock Controller
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Eliza
      clk: qcom: Add base clock controllers for Eliza SoC

 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |    9 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-rpmh.c                        |   20 +
 drivers/clk/qcom/gcc-eliza.c                       | 3160 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-eliza.c                    |  131 +
 include/dt-bindings/clock/qcom,eliza-gcc.h         |  218 ++
 include/dt-bindings/clock/qcom,eliza-tcsr.h        |   15 +
 10 files changed, 3573 insertions(+), 2 deletions(-)
---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20260120-eliza-clocks-5ee7ec9d0e79

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


