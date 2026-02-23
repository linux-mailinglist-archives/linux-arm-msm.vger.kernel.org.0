Return-Path: <linux-arm-msm+bounces-93661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULPMFqc4nGlCBgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:23:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B111756F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A8423038F66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D765535CB8F;
	Mon, 23 Feb 2026 11:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BWOzKElX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SvT/ykT2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9243634EF02
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771845644; cv=none; b=JDfpivSddjziK9Iz0jpk2VtwoA8GjCkjLZ9JBusSeRE2pi7zyJwnJdk8Pbksq6rLCXzpwWz+comXpZsamihH0bMcLzlgZ+B8Sm1+edh9n3KwJC7HPswAQRpEh4x4c/qMMFco+WjK8Eqfx7AuOacNC/Kxp2yPlBDxtdggssaYbYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771845644; c=relaxed/simple;
	bh=vR4GbE5tO0t7eMAiqDkRls4S2OCBvskL0+rRHRV0jaw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ir2PQqCjiIHDhLXW3+j9q/w5zpuwxfhIOSNEhXMxHkX1OU/Mq/xClhve3P4yivSoUy2FOZnVTIL99giOXsf/mAfkASQHgvKOMcHfxSI8QMEbpH9IpX7kTdYK6/JzsgS3YKZKjRox9i3+bLgQsmbw2kKViasbblzcmzPdswSPWEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BWOzKElX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SvT/ykT2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAWfb03733550
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vWZFhNaftSjOq2EUx2lrdP
	hoLMUbbWMLwGx3JjXujmo=; b=BWOzKElXVoIJpB+l0OZENCMAUZq/JHUZjdnzOp
	UmhNfbTNhz9eQbQW8DZr4lo4siNn2GSuVdI7dCw37jP3wbfLaWy8YzvCjxYBj5fL
	D7NFaI1mZojmYF+P+vYnvrDsCNqsaFh68FbItGtiJ3HxRYKlBHuIzvW+mv9MkvQc
	2hum5isFVQzHI2z1U+g8vAtqUhmq1UVjUDshz3YPXxV3Gne2okr8viEW2nOWIoBE
	299RX5zp9nOVnVYCPEDem5Rrjo/q7jnHUixrhyNijK+QLqDTpULFg7dDDd9gHIEH
	neAZnEMioN7RUftgu3fqcqiXXh191n1rMTY5ewSI5JMWxq3A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7t84kg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:20:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-824b6a68bc5so1573758b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 03:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771845642; x=1772450442; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vWZFhNaftSjOq2EUx2lrdPhoLMUbbWMLwGx3JjXujmo=;
        b=SvT/ykT2ReR8ISmC2NOpl/5Wj1brEdTc/KRaRpKbFOuw59kz+GsYPTseN/w+AOox2M
         Qksv+XKCiXVia4s4aohhl9mgUYsynfkClV6LeHKAGgt9mKErz7cmI7nRlU+w81hXC9N/
         /o0m4NmF2DCjuQeX2kAdlW+sCGbEXtw09cP+rYlQDOUoMrPi90wckFPBiBTlyI+Bvz7W
         JEUoRpB0c81jnsl0icUCvBrl+TgCOP64ligjezcmHMQSRZChgjiKLL84I/4n3L+bDtHr
         RVDdBLzrlz4h2sPj8zrPpF/b72q/shWLizk82AvTzWH3jg5nbru/H7yF7HBCYHd84ix5
         wN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845642; x=1772450442;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWZFhNaftSjOq2EUx2lrdPhoLMUbbWMLwGx3JjXujmo=;
        b=LnpwBsXhJSr5Yd9DlB13PJ6icd3a8T9KzjbKc/TB9EzbGAGEZ35BcuNyPV9SfHbZbP
         DMs7bI78KfgnWZGVxIZW7V106LRSmvcRSYqjigMAzCfc4BMo9rFLoPjGvkyN+307TDPt
         8GzTHjow2rG2eessr1e2MfknR4FDVIuvZRgjNMhn1NPbmtBA74PbdroQcaIH2ua3rpRe
         nCip+LJmhv7Z/jFX7UQy8D2Z9ewFl2EowYKzAWzT9wF0+IgwsG9U1RxSZLAggsTh5G4T
         MomYyiomR1m5KuaZ6QmU4fs1TGO48Jd+XQYBphv+ArvIqM6AptI2jrG6s8Q1uHZb3y++
         wpHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUAwrKi+934zJMSj96mdjjSels3LfVcl2ADoP1S76PgCWvl32ykgpLNzm6Ab3zI2S8V6mARwdhiI2VIOyI@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt+UDJn8M2bxokmGZgANvChF5jgwiG2zUhqMxie2fI6d6KcZp+
	db89uRZImAxDl7TXOzECq/9t/1kl9msPUFS68BS5zj8k+OamQ1Pf2m3TqXHtdIOsut7HucWaJBS
	5Skdy5SZWMxZHQalml4nI+41b1ypiXzUc14N4oCER3Elp0DzeavusSW9Eph9kjivJgBsF
X-Gm-Gg: AZuq6aLXWz6sOBYE/DFDAOxo+eY70DU+ny4oD49GJ6HROvKXSgG9o9c5IA7w61SYUQv
	47sT6aq6FoWKw0vERFYbk/ojgZSzUDgBQcpnXMTW5J3W8fSNbQFBMCJccpctMcEFthiVdCagCAm
	JUDrNwVl9oQ+v/ghhkl8uh4wmDXWWWNygD5TbyPtyUkcj/ZQ41ZEIrrCVpI6xonplBnro4ROmi2
	PIDSNBQ0uF7dHTpV1evMKTNwMmae0cnz01CfdPkv8GnRgP/5/Na9+ThFwS3pRUXXlFnPffjDwtR
	54h0OcIi72rjsbLr73ly4RNIj0txw06WzyPjiOFPFTt7s30qNz+NL+xH+Su0t5h2Dy9vn7jJ+RS
	4/LEO8P0MtNEZfQbVU4saXL0CeKDYkrLI4dU9A9LKqLupYUNAHVO5+Zf4
X-Received: by 2002:a05:6a00:6c81:b0:824:b304:2ce7 with SMTP id d2e1a72fcca58-826da906f7fmr7181460b3a.17.1771845641560;
        Mon, 23 Feb 2026 03:20:41 -0800 (PST)
X-Received: by 2002:a05:6a00:6c81:b0:824:b304:2ce7 with SMTP id d2e1a72fcca58-826da906f7fmr7181434b3a.17.1771845641085;
        Mon, 23 Feb 2026 03:20:41 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd899386sm6744057b3a.43.2026.02.23.03.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:20:40 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/3] PCI: qcom: Program T_POWER_ON value for L1.2 exit
 timing
Date: Mon, 23 Feb 2026 16:43:29 +0530
Message-Id: <20260223-t_power_on_fux-v2-0-20c921262709@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFk2nGkC/3WMwQ6CMBAFf4Xs2ZIuFiqc/A9DCNKtNJEWW0AM4
 d+t3L28ZF4ys0EgbyhAlWzgaTHBOBshOyXQ9a19EDMqMmQ8yxG5YFMzujf5xtlGzyuTXHXF5Sx
 lKRCiNHrSZj2Ctzpyb8Lk/OfoL/h7/6YWZMjonpdYkJBayasLIX3N7bNzw5DGgXrf9y+BZj28s
 wAAAA==
X-Change-ID: 20251104-t_power_on_fux-70dc68377941
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771845636; l=2048;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=vR4GbE5tO0t7eMAiqDkRls4S2OCBvskL0+rRHRV0jaw=;
 b=2zljMSIfVVuOWOyVO8iNsGgVjX5qYYHvu4cQLOgGWzSvCVf8O+rjn9akO5wPajSbEPhtug0sL
 71l9HfyiA1XCVT5Ab27GtDwQOtRSOhA8DGIDcxHQYq3iyTbZqZki12e
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699c380a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zkpMToBQJcapbifWyZsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Nh-WBHcl6h8IRv_MX-0q-9NvcdWZ-Wnf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5NyBTYWx0ZWRfXyPBmhbMdQBzg
 Yp0YXru/u19zkISgvLyKtP1+J26v+w3QD4XkBotHGlOKQOdafI4g+dveOayPza1WMIrd+w+fa3X
 +UzHF8P6uAygi2zt0SsJeYz2RRMIgtTKEyb5lPqtZb9rQnFATSo5sw2xLMrgq85ClKPYMf0ltC7
 BJ64bqJqsc6gxO2eAlFhHGorjOLrLkwasGFsmCwfqOEfRHYk8hgTEES7D7YmV+1fgccUDw7NkRF
 s2Frwg64EbZZflO6d0fMTuPNyUMroVGXYJTnX0Z2sTxCEdRaymgUmHS9ZpD9R/gKoOr9+1gz5CH
 vLlT1vRhq+Mj3vfhPI8Q8/KUL6DkGLuTb4gjFYK5ZHZ+CH1KREwcctN3K/5hfYZWfl73+XgtL3v
 wPjDjoqE+fDMGXVGYssh3WahcutLVIjgnwz4Y64oEZGixMMpd2IPEbGw+s7bi4rTKCMahXpAIi5
 VsJ05N40Iy+/19cJ5tQ==
X-Proofpoint-ORIG-GUID: Nh-WBHcl6h8IRv_MX-0q-9NvcdWZ-Wnf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93661-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B1B111756F2
X-Rspamd-Action: no action

The T_POWER_ON indicates the time (in μs) that a Port requires the port
on the opposite side of Link to wait in L1.2.Exit after sampling CLKREQ#
asserted before actively driving the interface. This value is used by
the ASPM driver to compute the LTR_L1.2_THRESHOLD.

Currently, qcom root port exposes T_POWER_ON value of zero in the L1SS
capability registers, leading to incorrect LTR_L1.2_THRESHOLD calculations,
which can result in improper L1.2 exit behavior and can trigger AER's.

In this series, qcom controller drivers read the devicetree property
"t-power-on" which got merged recently[1], and use that value to over
write default/wrong value.

To convert T_POWER_ON in to T_POWER_ON_SCALE & T_POWER_ON_VALUE created
a pcie_encode_t_power_on() helper in aspm.c and also created
dw_pcie_program_t_power_on() helper for other drivers to use these
helpers.

Link [1]: https://lore.kernel.org/all/20260205093346.667898-1-krishna.chundru@oss.qualcomm.com/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Instead of hard coding the values in the driver, created a devicetree
  property "t-power-on" to program it (Bjorn & Mani).
- Link to v1: https://lore.kernel.org/r/20251104-t_power_on_fux-v1-1-eb5916e47fd7@oss.qualcomm.com

---
Krishna Chaitanya Chundru (3):
      PCI/ASPM: Add helper to encode L1SS T_POWER_ON fields
      PCI: dwc: Add helper to Program T_POWER_ON
      PCI: qcom: Program T_POWER_ON

 drivers/pci/controller/dwc/pcie-designware.c | 27 +++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h |  1 +
 drivers/pci/controller/dwc/pcie-qcom.c       | 15 ++++++++++
 drivers/pci/pcie/aspm.c                      | 43 ++++++++++++++++++++++++++++
 include/linux/pci.h                          |  2 ++
 5 files changed, 88 insertions(+)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251104-t_power_on_fux-70dc68377941

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


