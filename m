Return-Path: <linux-arm-msm+bounces-110772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC7zDaqfHmquDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:17:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C30FB62B3C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97A7730CEEB8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8853CBE7A;
	Tue,  2 Jun 2026 09:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvz2MR0G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NeMOy3V7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296533CA4BD
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391426; cv=none; b=jTCxj1w8SaxZZvwa7BsxSNmRB+cDvdNEP/F3rf7d9EMnAKhILE/YJSsKCIVUETsLilmcjtnjRvUu7SHg1jh9tIYr5PgLan6b/aash5oQ9QRis/LhZhuW/O4lj0QmbqbvQb8K5kjWZxnNv8hsO9QHu47BIkXgvD9LpMSXxf1pIag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391426; c=relaxed/simple;
	bh=CJcm3mLRtrsEwDNBubTWAbHHzv1ZNb/7wqlbzNrAMQw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Rj2c0oy6Jp87eMxrbKeZDFh/cnlnp1PQnD045kqN+uwl5221ZXwmoe7hIfvqBNwSmzDypy3xC2aO4MIN2qKnui9KSRnqsgaCsMd6e5kTw+zWkEciffCAVLXoMlVfRKGuk6+lSF8J6hUYWbmvp8VJwcT5umkBaEleIfIhMdxM8KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvz2MR0G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NeMOy3V7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6526Moq02767712
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FQAFb4GmUnX9anlV/m24uh
	yxYJQgrndhwAGHk534GYI=; b=lvz2MR0G1GOxoq5WxeLsyC0w4xiezwmzkfJ3io
	Su6wBc7tsdpKooHqOwoYnV18Z4ISxArPyu0BUTW3YOitDAvtUg5MYbjZjaWgJ/tf
	6/NplR5QOa0pTNgFgIk2ii+RtQrJI/YUefGTFV2RT4BIlf4Bwvad8awRMpq5UEdj
	BbGyliTKGMtNgbTckuCDjLoM7CSsxbgHYxhXaKni+4L2g1h124gUmEfUox1pmSo9
	Sui1W7eyR5VIz9kRsKdZJNjUZDVXRR42kxxJ0n9ES3dtdwloQHF9i5wV76H/Vnpk
	aqSqltrm5lj0t3JiM8iy02m2ETK567nzxmQPXT0oUMcbWFoQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsus0pen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:10:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so52686225ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391424; x=1780996224; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQAFb4GmUnX9anlV/m24uhyxYJQgrndhwAGHk534GYI=;
        b=NeMOy3V7Mw1AAHSFI5rlZVwCnAxQw5xyM7STfSZmZuAepzyzgrHiu+s2XQLLczjJVE
         6xFlYSb8i2ZMXA262YtLSWMtfDMHhxX/VDGQ0Mcu5iFHIsrGSQ2/JgyVQx28/IIajm+K
         MdeIF8hOO97FRVY0zf43Rl/vhPuZaC8t+scVmBPhPxgQ8am8aACe7MG9WKVPRSxEyg40
         z5BSJMyyicmdOdSvY3noyJQuKpq40bhhFryGGvjQKouJ8qTu/oFY4clPtjFnZB8wYq7q
         bwuTXghCnErMdYGSsUiKc+jKx8bAep5r2CKwiwy/65HMaosZICRSB+SWl4xPNBtLfNiL
         Fh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391424; x=1780996224;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQAFb4GmUnX9anlV/m24uhyxYJQgrndhwAGHk534GYI=;
        b=irMCSe33RFHWi89qAa62T5ul54wvqGxCO6/Givz/wGRGSnTepru85O5YJ9A02riiDR
         iIROeryOoLiaCh3laxB+YkJIiE65DDbieqagkWeWJRrXLzVvxHqu514u6rdjv05juxsu
         Y6N3z0HWQYnWgrJC08DSWyexHVK35hA4RZFClEybBJrtA/fSvnzxVd03GTPYR6/OaZH5
         aUF/hsMfQfgeqYpDTJ3hI7V+YiWZekFARJSsGFvTKl0b/CIUw/qfpewBiqJ8sDqEXhVH
         VPRhUPYLz77AxGltkPQ1X/nSWppjwpIFkML/2Pvb0x0yY8J/uyrG/MqDW5D5RG3Q4q0F
         gg8A==
X-Gm-Message-State: AOJu0YwPn6JvnjXl3/kL+kR8lGqsDjmxZ7eXEMcGsAeKy233sEtVBRnN
	X/KniWQtHmMksqBQsA4EPZuvMlHAcukRZG1lU+oFWTnfVNmb83L5ty0XXH9fsOn34bxL5qal3T9
	bkIkbRNUAmSZXC14JNk8fLacH4xPDc+uJ8YYc8HEdD2lUyX41q6u5MKZ2EbOTFQfawg6W
X-Gm-Gg: Acq92OGjRMauRhsQEN9GHAsDGnldqvq5xKRFU+ZDkHh0UgnQBZ22Z7fqM4s58oy98WM
	eq4jg+XATwQHzvyNx6iceiN1lsNx+NCgYbX7VAlbYernyDeS9yi80oQHwlya5x4y0+ISpJLKtzG
	+qAvphDIBPKSiq6Ki3jgiSxSA7LCUWtAHokFFo4RRJFlCz8Kvhh1b7bqe4OvS9D27bhbPb09rF2
	8LZP1MW7H24f7UZNN9XCedvfTh4flJvqmrhgOrU2smUuwdk2AkWXSjqY4Qgx9mP7urqVttAzc+N
	5aZgnSayYVpJRWX9h4WmvQSAEyYu00IeSgARlV02eOMsk3w1H6LrJ/apwD+BzfcpQNqJz5N+P8f
	9uB9/doBWS6n3T9ixtdcbMr75ie3C9O3gYeHiJn4n+gJXHZeOkm+rMjo12N3b4yf6okOnve9VtI
	EgFZfvysBv8R/riFWDHh1Pu5rtDY+YqVdDAFpk7Lq2zkcUaDouu55HHM1Oc4FwX3ZFAMk=
X-Received: by 2002:a17:903:1905:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2bf367e4391mr174961115ad.15.1780391423847;
        Tue, 02 Jun 2026 02:10:23 -0700 (PDT)
X-Received: by 2002:a17:903:1905:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2bf367e4391mr174960725ad.15.1780391423415;
        Tue, 02 Jun 2026 02:10:23 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e6ff5sm173007765ad.7.2026.06.02.02.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:10:22 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support for the QMP PCIe PHYs in Qualcomm IPQ9650
Date: Tue, 02 Jun 2026 14:40:16 +0530
Message-Id: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPidHmoC/yXMQQ6DIBBA0auYWUsCGND2KsYQC4OOC0uhNTaEu
 5e2y7f4P0PCSJjg2mSIeFCi+14h2gbsOu8LMnLVILnUXEnBKDwuWnETLKEJ65tp7nrnO6kGYaF
 mIaKn87ccp7/T67ahfX4/UMoH/Ple23QAAAA=
X-Change-ID: 20260521-ipq9650_pcie_phy-60d7df32581c
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: lW2uPoq97xQafurlx6_I2WHK2KjQJ6SV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NSBTYWx0ZWRfX8YYhO/rHD1wx
 wEVmldIShvAtEFl9WGvLCigzbBTHlUxz6E5OMMI++Iif7dpZ+vVgphdwAreUFXD/G88p2JI6omI
 VGeS1+ULO9D1/XGqFjOrexl0YVz9jW5efCCeZ9o7gYOFgJ+iSCiiKQ5kE0VXiLZpByuVZOIN3vS
 2+wMiJ5uqqiHCw9Y7Ib9HxpdyzHYhpbhtbk1Dn5LQP98fdZ4nJCTyym73GIKGDEQO9WFZPNMKJk
 cTgnw6TGSMKdhd93K0zFMEwzYk8Fl25nscTcRZt2n984FoW6GHdwngCosdWgGoX8v4kNzwXvpkK
 KG4I2TKn5bCCnCFebLaWSF0iTWLDQGXysTuO8D3O3/CH2OoHah7QQBIwo50OR8KvI7uoCmGk3AN
 inAE0jChFEjUdSsjU7dEWjk6i1wtMHI97eGcPPpEk9JB6nB1nTlMDtXKDxyr662Q86Uu7kHLHqy
 I6kn1eR5uBt5OHzZfNg==
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a1e9e00 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=q3mB9QRo1V_sjKeEMVIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: lW2uPoq97xQafurlx6_I2WHK2KjQJ6SV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020085
X-Rspamd-Queue-Id: C30FB62B3C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110772-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Qualcomm's IPQ9650 SoC has 3 Gen3 dual lane and 2 Gen3 single lane
controllers with the QMP PHYs. Unlike the PHYs in the other IPQ SoC,
refgen supply is needed to bringup the PHYs. Both single and dual lane
shares the same HW init sequence. So reuse the tables.

Document the compatible along with refgen supply and add the phy driver
support for it.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      dt-bindings: phy: qcom,ipq8074-qmp-pcie: document IPQ9650 QMP PCIe PHYs
      phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support

 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml    |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 220 +++++++++++++++++++++
 2 files changed, 239 insertions(+)
---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260521-ipq9650_pcie_phy-60d7df32581c

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


