Return-Path: <linux-arm-msm+bounces-93663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EoNN+s4nGnhBgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:24:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 349B8175771
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E713306B081
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1D935C190;
	Mon, 23 Feb 2026 11:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2JAvrDd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDezdD5v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E989334D922
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771845654; cv=none; b=HaBIuFGSeFec6s138PlkHReEVDQvEtl2bmZHQvNrFrncSOA3DxrBYnr3x06W7gE7z41kQp0dNo4xZyPP89a+EAQVt0Eqrxaf90dOdmMxSg3BaZAdqLyelSh+e5dlN1CgOoDK6e+EuYDXTJs2pOu4sPqC9C3HFu7rhA4TdZObQEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771845654; c=relaxed/simple;
	bh=US5ky/eaGr7/zjLC3Ki0xuzmQaTtw9+WSJMCH40IvBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aKQYn6SomUzfOuV69zQAUSUzlBNHTcqqxU5nWhphQnv/bGlSoD2wyPfLw3t2p6ii4cLEWwaCSb0BD2Q9YLlXhekoaQEVGcYd+YZfs46aIpxXQ7u16+yE8dAw9U9BJHx7IdhXeXvzWxfkK8iHxyvCbt0NU584LndR9OzI2l5a578=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2JAvrDd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDezdD5v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAWeTL3698102
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7R6wERXgtgmbnWJq0JgIZgsNLnA/7M/DJRTsX0zPuJc=; b=Y2JAvrDd8VT4A+Pk
	BzxVDJRHsMoyWFTlI79cH5rTjjWInszzrs1X45Tbqo8qG42uvlOKJemCydxPAgbc
	/vbidiS76eB3/BoXZhSSzLw3jow3yvOnj4naQJ1O537FI3b2Fn7VDuyQR6dpkbW0
	XmtIZd+e1Df/HohMtqwNLmUcqMho5KJrEMI2zoUYBG5e3nsjVENWl1FWFlL/WHdP
	n8IXJLHl8OEfSoNKuSz28kM9ejOasLsJ19uulxtPg0/8sIguesiyyqKfu253ewhu
	QReNnnPHzTKT4bslUV5bnQ1Fv3R+hTCJxDIEfiq2V3CT0Xh0WTqOmHLqDS/hwTix
	h28DHQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8184kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:20:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6e1d32a128so2676055a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 03:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771845650; x=1772450450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7R6wERXgtgmbnWJq0JgIZgsNLnA/7M/DJRTsX0zPuJc=;
        b=DDezdD5vhErIZgC8ufXf+HzOJFXjoDqIdUBYLlVls/mAiLzB0IlGvNdq6lWyfEWRmH
         jVPQfSlHs4oU2lvlPfqAFe7RtXhUJjv6ryZcMwOs1FkVdHWHVSOPsizSp2PrmFjaXMS8
         h0e+Oo+rO+O7QfqM1UUbP37AZGOhBcRljGc0KFZJoAjvvIjLjAoZbWxx0exybDfjDbAE
         kWB4ozzH/S0V/2TeL4CcFBfkmE87rJXkvf3Yx3JJmPwCTVaAZW9QNJsUfPehYYcxjVmQ
         0WURitszRWghbWUDeS83avs2BYBOIeHN3St2AMNbxdN4hKPncKS75N+N/DZ/BEdgy1LI
         8l2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845650; x=1772450450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7R6wERXgtgmbnWJq0JgIZgsNLnA/7M/DJRTsX0zPuJc=;
        b=baguFeWqt1BMZsZ+DnjFoiKPewpUgdBYM5ppPdvESFIfRragM20joToYz0ghRQQGeB
         St2C8c2PPmjZIcEPm1qYKbO6V0lzjsnuJV4HGV6wOimdsrd5R3I5SQPPiZktwLvcpZ/8
         P3I8OidzwnH+kijUR3UHrnOQkXVYAO1bWpilTXz81E7aeElRt22VqascIAB2e+JRpgEX
         vhPhOW536qOby02KZr4RcoDN1A5SmZde1/SSnAFHFwVJTKLfUvGVXQMd3pvxn0HFiycj
         ChVfhfFMJ10Mq9kqWuTyB68uCW7yJ99JIheZOuqQIKs7cJyPXbGGMoVKevlvdpioPxma
         SUkw==
X-Forwarded-Encrypted: i=1; AJvYcCXPPl+PHEqFtP3BM7eErM+EpLTllIqb1HtVI1w7p7yv8nRA7fIADVI0bMHCkX7G4U3U7DiYUmozNdT1jKXX@vger.kernel.org
X-Gm-Message-State: AOJu0Yydlt/xZgkISigTJ4cOJLcTF3wuHjZ6Vonb/6I0emJaGX4B1Cn/
	g5V0EcbstDXf8UqZ7arQbX/a5PJVnwzlPxX4A6xCJDtYvJrCTMbVotdYBQbeURj9ftji/bMELD/
	HifD6/ZqSyIAHZiIkIfpxuUtEZwsAWEo5POp+aMoDzCbSDch2r+0j3/mAhYJ5aLrvmC/K
X-Gm-Gg: AZuq6aJRRYBtiFtjLlnkiTYKTyEbqEB2CW82eoTAELI7tg5dJXF2EJkk2nDsX+sO+6M
	nYgZ94EEIp9GQklnmGPNcl8GfHjozfHzT4UlEM2D2fT3jsZbhC/bl/7BIULnAMgupQWLbg9l+18
	vbiRKzUP8rgVhednNU1vMrRaw4WwMAuzfRlqpfyhODUsons5O6fHwS59VVqPWVmEqNfwbnjWRws
	bwEt0QnTvqlF739Rd/msA/HHI9BRGzRT4Fw/mEc65U17nHsuLmsnnh20k4xWGudTg9b7fpOklpI
	ifik5ZUO7qn5xrCGSpZn5QTNoLOtj1LUeS9Coy389CcL9vT2uDSUqawRtMTQf0bttmPHgk8U5Yz
	kMQEs4S762dmH7KFyjGBcMwAKST8pWr9SUa2hzpjOtnz8zGdWBhzOPKZ7
X-Received: by 2002:a05:6a00:2d9b:b0:7fc:da5:f85c with SMTP id d2e1a72fcca58-826da9f05bamr6675818b3a.38.1771845650479;
        Mon, 23 Feb 2026 03:20:50 -0800 (PST)
X-Received: by 2002:a05:6a00:2d9b:b0:7fc:da5:f85c with SMTP id d2e1a72fcca58-826da9f05bamr6675795b3a.38.1771845649975;
        Mon, 23 Feb 2026 03:20:49 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd899386sm6744057b3a.43.2026.02.23.03.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:20:49 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 16:43:31 +0530
Subject: [PATCH v2 2/3] PCI: dwc: Add helper to Program T_POWER_ON
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260223-t_power_on_fux-v2-2-20c921262709@oss.qualcomm.com>
References: <20260223-t_power_on_fux-v2-0-20c921262709@oss.qualcomm.com>
In-Reply-To: <20260223-t_power_on_fux-v2-0-20c921262709@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771845636; l=2863;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=US5ky/eaGr7/zjLC3Ki0xuzmQaTtw9+WSJMCH40IvBw=;
 b=LBjbnwz6E1dINdav/+PKkrP9Hl6PG7F0q2GXDRhnkg1LcRHU2rTVkTvMhD+REz0ROi7hnNBUR
 VcD3rRZudS9AhZeQYm4wwtDd/a7hk3zsRiuLoZ6NHqbWaG1SvfoADUs
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: YVaa2jC-BUiqRRfzDUf_0YKT3PK9D1LZ
X-Proofpoint-ORIG-GUID: YVaa2jC-BUiqRRfzDUf_0YKT3PK9D1LZ
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699c3813 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5NyBTYWx0ZWRfX4KFcqbsNOpGX
 tgcu4HjwjqLeyX7FkCO7gumspOsLMVSS3GehLNaLNTkVskn8KzI3/dhHjUK4NTPrRn3TXUwMahB
 O3ZCruWf5iMVQsF0It5BiV7hkKjr1Y/oMa1It/K0MkbgQCxD9OZgrUDEjaQEpG2+xfu5nD+A6Em
 XI2gDveYFy7aVlRZJCLLNhZa1fGCM3Ex6dbD7FvnFvXN8U7kVGKDv9TTH2MSnF8wDkf8tnfch+o
 1N8f70dwdOcdm1dzeQp4QK9qKmMxH4vhwL7ClxbOFVmHI6x1XTFrUhrMZcAHSDm9KjB7S6+Zkhh
 LqbXT7beiEPmSufBUCwYu9T4KXEdZsMQwBdkwT7+PCq7l205pv7kwYkrqgiDt00qpCycB5+Nekk
 rbyILJIxCKXZunviSf5UR7PB1dTK6HXHHU5LQ8r+PL30WOP0NGbbUw7hOkwXNCe2z5H0oLHttNa
 OAdLlLtYA04fza3OkgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93663-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 349B8175771
X-Rspamd-Action: no action

The T_POWER_ON indicates the time (in μs) that a Port requires the port
on the opposite side of Link to wait in L1.2.Exit after sampling CLKREQ#
asserted before actively driving the interface. This value is used by
the ASPM driver to compute the LTR_L1.2_THRESHOLD.

Currently, some controllers exposes T_POWER_ON value of zero in the L1SS
capability registers, leading to incorrect LTR_L1.2_THRESHOLD calculations,
which  can result in improper L1.2 exit behavior and can trigger AER's.

Add a helper to override T_POWER_ON value by the DWC controller drivers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware.c | 27 +++++++++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 5741c09dde7f40487c6da6dfd66f7c8d96a74259..f56e2c07ddc57bd84882c14bebc7d4b4961f601a 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -1249,6 +1249,33 @@ void dw_pcie_hide_unsupported_l1ss(struct dw_pcie *pci)
 	dw_pcie_writel_dbi(pci, l1ss + PCI_L1SS_CAP, l1ss_cap);
 }
 
+/* TODO: Need to handle multi root ports */
+void dw_pcie_program_t_power_on(struct dw_pcie *pci, u16 t_power_on)
+{
+	u8 scale, value;
+	u16 offset;
+	u32 val;
+
+	if (!t_power_on)
+		return;
+
+	offset = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
+	if (offset) {
+		pcie_encode_t_power_on(t_power_on, &scale, &value);
+
+		dw_pcie_dbi_ro_wr_en(pci);
+
+		val = readl(pci->dbi_base + offset + PCI_L1SS_CAP);
+		val &= ~(PCI_L1SS_CAP_P_PWR_ON_SCALE | PCI_L1SS_CAP_P_PWR_ON_VALUE);
+		val |= FIELD_PREP(PCI_L1SS_CAP_P_PWR_ON_SCALE, scale);
+		val |= FIELD_PREP(PCI_L1SS_CAP_P_PWR_ON_VALUE, value);
+
+		writel(val, pci->dbi_base + offset + PCI_L1SS_CAP);
+
+		dw_pcie_dbi_ro_wr_dis(pci);
+	}
+}
+
 void dw_pcie_setup(struct dw_pcie *pci)
 {
 	u32 val;
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index ae6389dd9caa5c27690f998d58729130ea863984..da67beece3f11e33d9a1937fa23d443feea3bbc7 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -602,6 +602,7 @@ int dw_pcie_prog_ep_inbound_atu(struct dw_pcie *pci, u8 func_no, int index,
 				u8 bar, size_t size);
 void dw_pcie_disable_atu(struct dw_pcie *pci, u32 dir, int index);
 void dw_pcie_hide_unsupported_l1ss(struct dw_pcie *pci);
+void dw_pcie_program_t_power_on(struct dw_pcie *pci, u16 t_power_on);
 void dw_pcie_setup(struct dw_pcie *pci);
 void dw_pcie_iatu_detect(struct dw_pcie *pci);
 int dw_pcie_edma_detect(struct dw_pcie *pci);

-- 
2.34.1


