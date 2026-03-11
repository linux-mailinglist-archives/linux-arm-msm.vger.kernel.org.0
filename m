Return-Path: <linux-arm-msm+bounces-96963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHAbJOhisWnQugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:41:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6A2263B6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EC55302336C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 12:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2034217A586;
	Wed, 11 Mar 2026 12:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5bSeG1n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R5xV6hCn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1B42E7BB6
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232848; cv=none; b=pXhFsjCNO4ou50AqQBwcts4NTGhT9Kw5MJUqQhm7h09i39NrO7KNiQeoAtyEn8UwhoLgxbCowV+Fu4GPvO5kZEW49hwoeuCTBCWqcFmv6Kcp0ETlcIDYbg+vlczqlpumkISQl8vLz+wxkw1TxkYJaGizdGwKGtSZGe/VRIKoSJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232848; c=relaxed/simple;
	bh=yeNLhpwlGrnJbUWstvtgsoL3I1MN2Q+qCaW4VvGmYX0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZD3T8FkD+0S+ZTum/X9R5A/0dUxKOE8BdfvZNXTKcfRjK3hx8VW+dK8gmgcrbimMHOgYgr5JZNVWgomD8qAMs/GHyfBLdmygLCBjfGiTbscbUBcxZ+Edb3F5Nte8rej+3PtsOdtcxgxy4YULUypxmNJBcWhVdaqxtTlROgvnH3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5bSeG1n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R5xV6hCn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B7QIYq2031208
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1yBMq/jTKLHJJXy3GsinWi
	QWvtQ/crKeIbCkXbKmlHg=; b=p5bSeG1nGeBMQn9HG1XObivj8yO6+CChfscbkt
	habmsQdfyc/kBMmX1ZTANuEZzTsiicvZXNT6pKa7oTHH0GroxwqcSiex2CiWU7wW
	sG2LAciLCKVqePx8NXMqigqIFwhocWEw1vvXXo2j7rHrox6PK2EexI+3XQ6jWZsF
	snfyAGzF2jJzZaL0HkPmkyixx2lbs3YZDfNsmAih9zZXCaNpBGdFnmKtQhv5OIIS
	HJNM3246AjFaBPlc2RhUlDUkaAF81BFjX19lkdp3sJdufejV5bAj9CfdHS3sU0jq
	DzMt4pBNzIfM5KRbDTb8O9mFReHriSV2M6O4nUvQSo4Z/x5Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu40h15p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:40:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae3f446ccfso106067665ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773232846; x=1773837646; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1yBMq/jTKLHJJXy3GsinWiQWvtQ/crKeIbCkXbKmlHg=;
        b=R5xV6hCnIYkPC9zj1+u0Cr1ZrolDcdWrRgKZHmEZ8hov5LRBF8wvHoav33UPEo3087
         I63hryI3+6IVvxSUxDGB23slTVy78O01Cd1xGG9FohoVBegNGi78c6jz6JrVbKIBL5b+
         9mMWnSQwyxRhzQYo1Vf1rivGtzJuzzIl3cm1yB1rRDLtrHrP0ljn3FutnFvPOP0ChKsX
         kvSQKT6F0xIK0xzwZo5wYcBILxHkkcjCQKu+iMvA3K0zYZHFpuA8ZNHR8GmSJWlLH3PX
         NJVV9FEK/g2tG/T5A2MV7rHju4QQtEJDWrFhJK4mkpfUJr0fHSKk71QdDEISb3CzLgAs
         +4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773232846; x=1773837646;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yBMq/jTKLHJJXy3GsinWiQWvtQ/crKeIbCkXbKmlHg=;
        b=Yni15oa4igdW9/2kFA159hstoP3uCNAG4vVMSuCRIazzG+8TLiQLEcuR/yfjw6/0LU
         8nhid8MCojKN6yrJEcvObKkhO4hE4me/VOWfLeTmlf8YCS+EGp26T1taNrsPdimifx3M
         1Ti7tQ5UmdUs/N+s/aerW14incqqx8K0vd3/X4WKIke3XSGSC4BrI3BezyG1qTESvNnW
         DHNDYmtIAvIw6XKbQQxe9wJxLUOLc9nmSLpPOJWz3WwODqECXARdeZBqXNq5L/p0++ER
         fkVPapo8hRHqLVDAHypu7wipOggBu7HWZ45if7FEwlJa46vktqG/+6U1f141qPc2xsbH
         gWsA==
X-Forwarded-Encrypted: i=1; AJvYcCUC1rZjfd0roosh4Shp03mTe/157yGXUDvhnPCP3nh1N8xmoTmdNE0cftSN86yF9pPIN+UoTkGVN9qs5E1C@vger.kernel.org
X-Gm-Message-State: AOJu0YyqXttwNUDM7RdJd3YiJl7OvA9hj0/K+dm85Es1lOfl/wZsYWpX
	mqIhu30H4gikB/GYljhpCaOU3PzsJEFbTTvMaHMGR45y4ROnPVWpAMP9Ugmlt8ofyuoIdktBYMu
	y9MpbTFjgU28FivYVlbpi0r0I1rjL5nzPUR9Wp02kwvpjhG75W+JTu6zDd/o9WizQffMf
X-Gm-Gg: ATEYQzxro/rVXD54Fgo8K6meqqbFeWY5leYYIB3wPtNgd2JQa42/H0m7+ojfYXaBRMU
	aYMZFgejj8wMmvRF+guCaCkCDLNZA52qvymUX86muIeCP4Ar38A8Dy9FQBTPex+pv5KdZTBVsqh
	fJecUo4XP53ZUDl2euwNL9mFeqbXq1wKjQtXyd2mAzTibigrOibv9ctPpnYsuwTyfSzaS8xuGM6
	5I8XbYFKHP+2AXg5q+Dt0h3OT3/V/OJJ9+/aD2Rz2FuiPJ9sa51HesQrpVC1yvHmhjmvCj7y+yb
	vqJiyAa2gyN40c8FM7dW3qcWR9N6Ld/dge8iVuJcdHGZmG6AiEHvQcqw51IQgl7Sx5U3Sp+hM1L
	ITYCzfb7jnX5g60DQCnxWB7Z3ZJd3Kmie/SU0hA8PGefVgoHp/MEpYlzS
X-Received: by 2002:a17:902:e84b:b0:2ae:54b2:27d1 with SMTP id d9443c01a7336-2aeae8eb5f1mr23906575ad.44.1773232845530;
        Wed, 11 Mar 2026 05:40:45 -0700 (PDT)
X-Received: by 2002:a17:902:e84b:b0:2ae:54b2:27d1 with SMTP id d9443c01a7336-2aeae8eb5f1mr23906215ad.44.1773232845015;
        Wed, 11 Mar 2026 05:40:45 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae2466a7sm23304385ad.20.2026.03.11.05.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:40:44 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v3 0/3] PCI: qcom: Program T_POWER_ON value for L1.2 exit
 timing
Date: Wed, 11 Mar 2026 18:10:37 +0530
Message-Id: <20260311-t_power_on_fux-v3-0-9b1f1d09c6f3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMVisWkC/3XM0QqCMBTG8VeRXTfZOerWuuo9IsTmzEE523QZ4
 rs3ha6qmwP/A99vJl47oz05JDNxOhhvbBcj2yVEtVV31dTUsQkyLABYToeyt0/tStuVzThRwWr
 F95kQMgcSR73TjZk28HSO3Ro/WPfa/ADr9y8VgALVl0IC17loanG03qePsbope7+n8ZBVDPhRO
 EPMvhSkjCJTEgE5CiZ/KMuyvAFKupLI+QAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773232841; l=2442;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=yeNLhpwlGrnJbUWstvtgsoL3I1MN2Q+qCaW4VvGmYX0=;
 b=12G+fhC8nr09Onw0LGr2UzL2F1j81HO9yguUWiYoDN0IDdcWzZxQUXtFY9zG0SiR1qUdElYJF
 UXdxUva+L9qCrzSMtR8vWc5zuNEYBZBOclZCcHHGifi/ShOQ/FcYs1X
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEwNyBTYWx0ZWRfX4ynFAhbko8Kk
 i/Mv8eqhnyVNL9u+K20m5INwxVyT4X2u0+VE1hUvffM9wUnCxtpnNxYiyfv20qEEqZhp6pI8kji
 /0gMeqVZ9TdGR+jGkO3dBgAOyn8whrQCSjA7L2dZmewCbCKQChiV56RRM7slG4u09RkVIAFlB8f
 B/lXsdI483r8+eB/mtsr7EcXSn8ULBuNHiCtLGIAuFV28bHDMNHr587skDJjTPCij8zQdKu2Aki
 uPcIU9ABZPcTfOa51e0eymzhVLSDHPetDX+Zcv4C6TnmsOXGm1K2/pqdqUSDAw1fxVkPe1b2ZfA
 PsKRqQCPoOI1ypU9aD7hwmn8TZjTXseRHl4UPRlcNNA9IpsA2v3KecmwoT78IQqlGgEDN0JGWl3
 tufYjegcf39qkWF2HT45GFNuaEzrKZBw/6OHGf5rE4EHG1eHYuMTlX8iE91YwxVcL2RRF7NJDc3
 kiyciiwDKuZkumLCBag==
X-Proofpoint-ORIG-GUID: MYpfjDZfoZPMuRxw__7KLFgW_tliz7jl
X-Authority-Analysis: v=2.4 cv=YJ+SCBGx c=1 sm=1 tr=0 ts=69b162ce cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=l8mvWsQ0dvX29tmygDoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: MYpfjDZfoZPMuRxw__7KLFgW_tliz7jl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110107
X-Rspamd-Queue-Id: DD6A2263B6E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96963-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
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
Changes in v3:
- move pcie_encode_t_power_on() include/linux/pci.h to
  drivers/pci/pci.h (Bjorn).
- couple of changes in commit text and variable name like t_power_on (Bjorn).
- remove return 0 from qcom_pcie_configure_ports (Bjorn).
- used FIELD_MODIFY instead of FIELD_PREP (Bjorn).
- Link to v2: https://lore.kernel.org/r/20260223-t_power_on_fux-v2-0-20c921262709@oss.qualcomm.com

Changes in v2:
- Instead of hard coding the values in the driver, created a devicetree
  property "t-power-on" to program it (Bjorn & Mani).
- Link to v1: https://lore.kernel.org/r/20251104-t_power_on_fux-v1-1-eb5916e47fd7@oss.qualcomm.com

---
Krishna Chaitanya Chundru (3):
      PCI/ASPM: Add helper to encode L1SS T_POWER_ON fields
      PCI: dwc: Add helper to Program T_POWER_ON
      PCI: qcom: Program T_POWER_ON

 drivers/pci/controller/dwc/pcie-designware.c | 28 ++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h |  1 +
 drivers/pci/controller/dwc/pcie-qcom.c       | 13 +++++++++
 drivers/pci/pci.h                            |  2 ++
 drivers/pci/pcie/aspm.c                      | 43 ++++++++++++++++++++++++++++
 5 files changed, 87 insertions(+)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251104-t_power_on_fux-70dc68377941

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


