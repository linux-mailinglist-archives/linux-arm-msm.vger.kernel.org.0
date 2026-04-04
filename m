Return-Path: <linux-arm-msm+bounces-101752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMF3Fo3J0GmfAAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 10:19:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6D239A62D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 10:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF4A330166CD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 08:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516C53A4F33;
	Sat,  4 Apr 2026 08:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWZawlGM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D2TnIY9j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA27337187C
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 08:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775290655; cv=none; b=a/h5FIMx+NpZUMsQniV66jCLGvm4NsGKnTOkDXLVcC56FloeH1ZHJUGE7sjwrsYFVvvBA1Ygh3PxIx18fw3yW3PmeDs15YgzQxW2b7ZgByiF95u8Qi8auqTaGutc5HoW0uwYlon1ygUmjfgpKkagNL8pfudKQhbmG58nlncPBds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775290655; c=relaxed/simple;
	bh=dN9KuR0kzkXGKzvIaarHHedGIsZ1F9GAhzyZs0HPCMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bZVtz5C8L3D5ZGX9amPfm7GaGhM4ssUWXjFce9lGPq/ED3NCGiBU5/+hirwWdO4X4pFufE0J8/iVeC1qk6HQ7Q8hz4n4uzygT+nWsIYJemkdUZCFJ9RL3Pem5lKIE5L4dDdUtXP4NOy+H6An4FgIN6xoP9Wx3HLccMETZA8q0a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWZawlGM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D2TnIY9j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63428mlZ2408458
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 08:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJUj5wDjCbISRf/zsTVoScRbxX787wYkVxELuxMLk/o=; b=hWZawlGMP3uWHyLA
	8jPEuUx5XYwqzDvCDAsjFsMtp9aKOFvyFawIn1V/zT7PgZBQvmaL0ycWSiUOuhRl
	kTRPJaUWLylWP7AIVUQgjTB9pmPythSviftz78yWre4uUWc057oh9Jnd6vB032fu
	U/hVYKP2xxkVXW+fbkSLOD7zeHiImfapY69omRCoUT2Obvh6hbM4qcPYGFav9fkj
	HKNUKeBgZ8sKWjZIkWk9aSvwhjbejz4yCNkc7s3QQQcZ6TCvqh3qlfnv3H0CuIoa
	KrbMhohkdT2559/xtywXbBPGgWYFNM5+MatH9rS1lScyhd1Ic008dU3Clo3R+uGM
	4qPcEA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrgkqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 08:17:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76b6db8bb2so1133678a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 01:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775290651; x=1775895451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJUj5wDjCbISRf/zsTVoScRbxX787wYkVxELuxMLk/o=;
        b=D2TnIY9j5DUurgwtCrkMXZiQN7LIjZwusoalD/vDkHOzYmqFzbQI+AYq0+mVRgIyGV
         czj0Qp+k4imWj/f5+p2Wr7LyyGQ85uzvwxfFaAfwTxmXFh2Fs8+UNGMWxBygA301RnCc
         vTVjvvlEBQct0V7o2oEC+NENIIK8ex4Nk++Enx1PrCgSzRiBzw6ma+JlLyqTNV6k516L
         Fjkyh7M8hKEomLZ32AQDBWcdMikKSdcLZUmzOjMpXXaKu6PTDNpEb4lpXUXqLHNfVRWt
         2hhlX5BOJyOB0kmWcrlLmNr28/Ql5ZOhOXk8pOXUsUwpY2ArS060124Eqq9yih2RhrcV
         +IiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775290651; x=1775895451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PJUj5wDjCbISRf/zsTVoScRbxX787wYkVxELuxMLk/o=;
        b=AvLikpp6NSpvG0o0ubiaQTArZKijLmaApjzbLoBt5pBpj0yL4dOwq0Ac3WSDrsmboZ
         xGJMhW0CK3OwTPMWJvrxxj8qO+dKNpYdaz7lE37dkQ+ziFRZxS41SDjiRE7Eg0nBN70w
         zzIjMOn47aCsCZqh37aLlwppCUz8Bj0Val63h2Q/VW3Cz+I2MkZwmyCTXEdgondn43Wu
         Y/ka6LUGFjZH/nNlFcq64N5kB6LBJEdV39Fr3s52T0M9qe5wWkATscfM80uzTEoGUS0r
         JooFtg/oenp2XhXwdLWyiMDqPM6eVK8kfSwQIwZWiK9F7EQvnSVksKDT4cBuHLi2LxcW
         OZiw==
X-Forwarded-Encrypted: i=1; AJvYcCV7r+gqZyINq7023Urr1rruFV/liMqOMYohEoCcyZlcLFnYpFMWud9pF6UpNf2Xp4iVvI9HJ2EY3q7zI4M9@vger.kernel.org
X-Gm-Message-State: AOJu0YwN1tQ8tx04xYlGz/G+GP3iu42P3NgQfEIm/YTppg288meBWFFk
	sNQSVZhJQX2bP5k4F9hXgVo/wCOm2ujSOZNyY5qKj6SPbD1fV3fefo+7La8H5qV0yw/GSyehIOE
	NXAtqxTpWgnxh5Jky0BBOOYvUwJwT+VqxIW3RLTapCXLku5Jf8VWFqvNIvh0OZGlGFsK8
X-Gm-Gg: AeBDievx4aaXl4FIEBpzlc6jI5UfzAr0vdqJY8rFcb0pJdHfpaNNhSl9AiEWCg9otdb
	xOG6Z2f9rh7laeoxyupwqURhs7oRQaOfVpp85ibPjQ77iDZ4pLFDyeY239HzZTWz4saKhn93edf
	WdRBIHPjiOCMha68WQggGuDR9pjCp2fmAEwNAdpqbAGkprzEhnJMNz/P1Ewhd8yWSR7sAKN7lpz
	s4RthEgWaQwPbUdZAhua9ATZ+Xhc3j/8q56NZ5SL59NNxLw8U4F35H/6Uv0wSfXf0J3iT1bWI3m
	YTEEEMA0VeOUCdZapQvVJbYjx9Vgee0LguSlpiSCmHAvgvLRWOTfkyfhguncQKiAUrE5JSdX+/j
	cFUpHra61hHBNxZnuWjsnFZEPdBjAcT1G03+yTfYGSDpYIgYW7Jt6vaBh
X-Received: by 2002:a05:6a20:a11d:b0:398:b346:b13 with SMTP id adf61e73a8af0-39f2ed81e9cmr5661647637.16.1775290650932;
        Sat, 04 Apr 2026 01:17:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11d:b0:398:b346:b13 with SMTP id adf61e73a8af0-39f2ed81e9cmr5661616637.16.1775290650438;
        Sat, 04 Apr 2026 01:17:30 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c657dfb7sm6786408a12.24.2026.04.04.01.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 01:17:30 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 04 Apr 2026 13:47:18 +0530
Subject: [PATCH v4 1/3] PCI/ASPM: Add helper to encode L1SS T_POWER_ON
 fields
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-t_power_on_fux-v4-1-2891391177f4@oss.qualcomm.com>
References: <20260404-t_power_on_fux-v4-0-2891391177f4@oss.qualcomm.com>
In-Reply-To: <20260404-t_power_on_fux-v4-0-2891391177f4@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Shawn Lin <shawn.lin@rock-chips.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775290641; l=3804;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=dN9KuR0kzkXGKzvIaarHHedGIsZ1F9GAhzyZs0HPCMY=;
 b=W2NXnHDHFweweqMbY5/CM39de3U6WWWxKMRBY3t7odo7sqwmMVkUW0GNJ+pJxjUMQF1yoEda2
 n4BYSzEGocmCl3uxvUy1zO029yix+lo9h4GYegcnkX1HNE3JJYe+WTh
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d0c91b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=j3416i00YO8nPnzCGbIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: ei4Qh1J-4NPqtNgs9rV2bXNb0eWqU98s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA3MiBTYWx0ZWRfXztYuUxm+cTyh
 rGRLIBJjXOQ6ko5lxRbGlQ/IDKTZp93I/tHiV11NzC/pvOE1u4PA8KQtMKJZTSeKEuEGvC0fO05
 GO1yGFrXHFcFXGYht/pqMwZkUfUp+/Y8Aq+rztlpf+N2q7fjj0q0USG7iN8Q1VmLzkCXd9HFyKB
 TERZvD48odqiKGRGoO+nNNIPfi5B60db/L0x4XLdoST1FcaXMaXbP2sXCouju9PL+cilydkVZMZ
 2Uh91woM22AR2JmKglaUryzTMtntlwcUY9bWTDcEjl/TLNcvLe0DG82/qWpUG3UIzIfNG5fclkj
 8PNGKVVP6VOwFYvfiYBmNf/h9iTgU1ynxqNehdSirk+AI0d1UNpE3hyEPSaSc1DQGGGsSip5BvA
 9Qsaawi/OEQtKRNPpJ0DZNgNrzBExa/RxxDjq43Z78nf79Zwtbsp3KUYyEh/8R63LYscJJ3ODxp
 cmgeeDsXHMiFka7fDcA==
X-Proofpoint-GUID: ei4Qh1J-4NPqtNgs9rV2bXNb0eWqU98s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101752-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rock-chips.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB6D239A62D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a shared helper to encode the PCIe L1 PM Substates T_POWER_ON
parameter into the T_POWER_ON Scale and T_POWER_ON Value fields.

This helper can be used by the controller drivers to change the
default/wrong value of T_POWER_ON in L1ss capability register to
avoid incorrect calculation of LTR_L1.2_THRESHOLD value.

The helper converts a T_POWER_ON time specified in microseconds into
the appropriate scale/value encoding defined by the PCIe spec r7.0,
sec 7.8.3.2. Values that exceed the maximum encodable range are clamped
to the largest representable encoding.

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pci.h       |  2 ++
 drivers/pci/pcie/aspm.c | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 13d998fbacce6698514d92500dfea03cc562cdc2..48964602d802e114a6a2481df3fb75d9e178a31b 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1105,6 +1105,7 @@ void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked);
 void pcie_aspm_powersave_config_link(struct pci_dev *pdev);
 void pci_configure_ltr(struct pci_dev *pdev);
 void pci_bridge_reconfigure_ltr(struct pci_dev *pdev);
+void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value);
 #else
 static inline void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap) { }
 static inline void pcie_aspm_init_link_state(struct pci_dev *pdev) { }
@@ -1113,6 +1114,7 @@ static inline void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked)
 static inline void pcie_aspm_powersave_config_link(struct pci_dev *pdev) { }
 static inline void pci_configure_ltr(struct pci_dev *pdev) { }
 static inline void pci_bridge_reconfigure_ltr(struct pci_dev *pdev) { }
+static inline void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value) { }
 #endif
 
 #ifdef CONFIG_PCIE_ECRC
diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 21f5d23e0b61bd7e1163cc869fe9356d1ab87b34..879d7ecddf8d6430c49f31c88a75d5c6e74015d6 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -525,6 +525,46 @@ static u32 calc_l12_pwron(struct pci_dev *pdev, u32 scale, u32 val)
 	return 0;
 }
 
+/**
+ * pcie_encode_t_power_on - Encode T_POWER_ON into scale and value fields
+ * @t_power_on_us: T_POWER_ON time in microseconds
+ * @scale: Encoded T_POWER_ON Scale (0..2)
+ * @value: Encoded T_POWER_ON Value
+ *
+ * T_POWER_ON is encoded as:
+ *   T_POWER_ON(us) = scale_unit(us) * value
+ *
+ * where scale_unit is selected by @scale:
+ *   0: 2us
+ *   1: 10us
+ *   2: 100us
+ *
+ * If @t_power_on_us exceeds the maximum representable value, the result
+ * is clamped to the largest encodable T_POWER_ON.
+ *
+ * See PCIe r7.0, sec 7.8.3.2.
+ */
+void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value)
+{
+	u8 maxv = FIELD_MAX(PCI_L1SS_CAP_P_PWR_ON_VALUE);
+
+	/* T_POWER_ON_Value ("value") is a 5-bit field with max value of 31. */
+	if (t_power_on_us <= 2 * maxv) {
+		*scale = 0; /* Value times 2us */
+		*value = DIV_ROUND_UP(t_power_on_us, 2);
+	} else if (t_power_on_us <= 10 * maxv) {
+		*scale = 1; /* Value times 10us */
+		*value = DIV_ROUND_UP(t_power_on_us, 10);
+	} else if (t_power_on_us <= 100 * maxv) {
+		*scale = 2; /* value times 100us */
+		*value = DIV_ROUND_UP(t_power_on_us, 100);
+	} else {
+		*scale = 2;
+		*value = maxv;
+	}
+}
+EXPORT_SYMBOL(pcie_encode_t_power_on);
+
 /*
  * Encode an LTR_L1.2_THRESHOLD value for the L1 PM Substates Control 1
  * register.  Ports enter L1.2 when the most recent LTR value is greater

-- 
2.34.1


