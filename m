Return-Path: <linux-arm-msm+bounces-112081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EPO9AbHbJ2oF3gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:24:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB4A65E4A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:24:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cZqrWPjf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EkvjKYbR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112081-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112081-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E172B30207C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA0A37DEA9;
	Tue,  9 Jun 2026 09:17:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D69382373
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:17:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996647; cv=none; b=jYNVPe2KlhmGtwLbh6pOs70AIBO2LTelyybZ8ND+jU2BQaVFOo5uFQJw1oQUaePOjMmbS8hNIvk+J6tQlY3VMy2t9xiZhnJPSRLYvU7Xf6z0t4Fc03lH6LE6jrrtQDPon7Kb7/hYEgR9h2+H+IGL1TifQQGQl3NVQKQP/PDHDHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996647; c=relaxed/simple;
	bh=6y/y+o4RlL4KAaVKm4DbvYmOZUkmbOZpf+COAG6J6qM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u98H6GOxjLHYxkG8XBkwe3iPQth6M7mpRjjRFYeWLBVQr0YOGsfqvzggar2aj5JnH34H3KuN7n36wyLT112DFUJD/WwdV1LqxYeGRZC5RIl+Fj4RErUivMkVWCx75Sd0Q/BAvcSr2tdHbbZbtppDnn+CwxhtIcjEHd2KJmLzv4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZqrWPjf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkvjKYbR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65985Tt5006879
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3iQhHYNcO6wxAKlVH8u/ni
	r3axKCEi6MPIMEH9l9Dbk=; b=cZqrWPjfbLBQgwJoh5jNLPbjc9J5RhTxu3ekU4
	LVGwIRsD6LNlmoFQxH0snzDdw6a7Y8vStRGsM/VW4BB6Ti21Y6CdlF7/Nzcd/fOC
	SpF6y4/XJmhszWHTg3B4B9WxdGUhvngW/3BAcU2phi5KAvl1SFTaykleBHyxGZ8a
	mkaozH1yEDRcH1Vk9rsBv+CZOJxe5qBCSFK/ZFW0Z9oLaD2UAtG08zqyoDGvaC6U
	p5BhevyhotWfHWlDiYSaPxA+56EH+K+fxubb3lp3LWEf6OECZq3Tlwk8C8I8syDd
	VYBlbnz5TSIM6NAAz8D7Z89qukR161WYl2ENjXBomnWkl50Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0sr9qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:17:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8604fbe71eso6752832a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996645; x=1781601445; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3iQhHYNcO6wxAKlVH8u/nir3axKCEi6MPIMEH9l9Dbk=;
        b=EkvjKYbRGf98BaL12FfqAk8WG94OGqRfsEzZH2RkHEiNjpdlStxeTbzwdFed9sYJ2d
         MsG7eyEeJ7m+Dci8ukzTTL4v6PV6pnZ/YszQ0bZojhOrDfSLkjSial1SJxrDwWOhH57x
         VC+3yp/erJBU5vf+AZESdoOd8X8/N88lfbLNhs5fHd0vBRRbqxzvkwR3uccKynLZwakR
         H7ft+BtYnVFQ0i7ujp+JSyLKONLVQPQb03gRTf4admuJi/Brwj0ZsHK1ixXBM/ZY/gG2
         6i1UKwUBFWJyDwmbm4cQc8VIevaJ8vz2kpn3X0Pmi6stAcnUL7ODWKB+bl2ML/ywPzdf
         7LHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996645; x=1781601445;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3iQhHYNcO6wxAKlVH8u/nir3axKCEi6MPIMEH9l9Dbk=;
        b=jqiNSn12YH+GySF+4Akp+LsUOnVlnG7onvJfVctk8d/OeA8dwFVQALWDgYwaQDGayg
         MxqtOFqZ1Ejaj8z7yaKjcruji4XebcvV+KgFdiAjkIbsB6puWAHVvcaSIicERvz5CzrJ
         P82ofUyf0hSJr/to/dmwodiJWLWG8DdyP2Xxx71RkPDTcuWhsCE7MBE5tc1BX0HArGrv
         POEjQy/1lnkoDobB/xW6wTGrtWAjHoDlHuDYz87Rkov36EZF3ifHy2QgN1XJCU0DX+dR
         RRrZCuyvFelbQWT536JJ/RmfiuZb5YeFQuUTmMjVuTuf/RntHYncaMjOxh9cdooC6uUi
         tfLg==
X-Gm-Message-State: AOJu0YxjeD3vXueb5NCExQv0RqpUxfTlTYfQpQ5TZR1ASIAd3viAn3MI
	FE+L2ssUhoMj2iQqYmKSTWfmio52cmkRJFSZwhfUexFKVj/3ADjT6h2XcHlLu23Jo0GkR4TVqlV
	gtxgcPekx4s62zEJ5aLxv3gDBebdLAVf7M3iJNcRghi7bg5RU1wJziGItSt5Ljd8OJ0L2
X-Gm-Gg: Acq92OF6c+oJmFh23diqts8oEhhNOl1G5RbDKUe6tfeNrYhyP9SPGRwD/SaKMT07K2n
	KxptsOq5oPsTGVYFPefiDppKDmV7fVemKve590yrwvbO1j9PxD1hFRyx2FDThzimF7SxduaL/Ug
	gmqWL+VB9jqiAH1cNt9Po7nEks63arKmApqXcrv+Alpk8lbSIVs/HtgJMfhPFRYKDp5zY+p5Wot
	qm4x0fHfME9CG7MN2nfaYRELx0qhcmfm9tPHw7iP+jktdzFeUF0WqIOC22vWf6cOOcdkvEkpbLP
	ddhcN6LKTj0pX9OXWN7ltlJ+mAU1oeCduqIy6J72iM+XV7or6+NgSmxHDQ41Klkpr8lx2QElb9Q
	tv0ef2HBrqds1qx7mICwP23JIC2aKmHEIBy1E5iDoOeAeQBPu3rDVzlHtV3Ag29geACYd
X-Received: by 2002:a05:6a00:21cf:b0:83a:3135:edbd with SMTP id d2e1a72fcca58-842b0e1e1f7mr20190696b3a.7.1780996645074;
        Tue, 09 Jun 2026 02:17:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:21cf:b0:83a:3135:edbd with SMTP id d2e1a72fcca58-842b0e1e1f7mr20190663b3a.7.1780996644550;
        Tue, 09 Jun 2026 02:17:24 -0700 (PDT)
Received: from hu-drajpura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fa877sm20974879b3a.51.2026.06.09.02.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:17:23 -0700 (PDT)
From: DhruvinRajpura <dhruvin.rajpura@oss.qualcomm.com>
Subject: [PATCH 0/2] power: supply: qcom_battmgr: Add thermal mitigation
 support
Date: Tue, 09 Jun 2026 14:46:41 +0530
Message-Id: <20260609-cooling_device_reg-v1-0-e15bddcb0086@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPnZJ2oC/yXMUQqDMBCE4avIPhtIBSX2KiIS1zGulKQktgji3
 Rvr4wcz/0EJUZDoWRwU8ZUkwWc8yoJ4sd5ByZRNla4a3ehWcQgv8W6Y8pgxRDhl0NZsYO1oNOX
 jO2KW/R/t+tvpM67g7SrRef4ACws31XYAAAA=
X-Change-ID: 20260609-cooling_device_reg-8e95c8eaab80
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        dhruvin.rajpura@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        jishnu.prakash@oss.qualcomm.com,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Umang Chheda <quic_uchheda@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780996639; l=1877;
 i=drajpura@qti.qualcomm.com; h=from:subject:message-id;
 bh=6y/y+o4RlL4KAaVKm4DbvYmOZUkmbOZpf+COAG6J6qM=;
 b=3so38CBnoTEALhZAdXlyV4TjVPIXrpgmHSEVdpIintZcdr4wttuQ/JNsNLTk38uQXwJdmXklG
 GVoXQRgHEVdApnoC9qqwjVQkBX82/NI4UqjaarOnEMbFBEjHUaVuwsn
X-Developer-Key: i=drajpura@qti.qualcomm.com; a=ed25519;
 pk=955XCRKkDWtR3Z/wycEd5zolAQt3Q1z7vODzFB/Wn1g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NSBTYWx0ZWRfX8VjA2JHMcvpO
 h0YIMpqzE+XP2ZvIAwD2hw+tW78IM41DTQuHm05BGr/U4tvRWfRtj6a1gaRFwnJqo1CqQfKWpM7
 DW5H7wSIlSU7dBtISdbm+ihUdG1k33YM7SpnvlfB8FiT2aZhnSXlPQoYhM0NrT5jZ8WKj/gNXGe
 X9JtXNWk7XCR5Uk4vbS60l7a/sBVikorgHel7+iw/0i4NWtRGFjXLLt5zboyDVmUixKRFjvjMfZ
 6UygtlGg5ZV7AuR075aUgyem1L8yYoQFkY+WS/Th6tGVi713TB3toW6qo6OKZzcinUxMOPfbIEO
 EvEFUSSmws6Sl40F+fp/WngGMnMPg20IslPPJlt+sh7R1uhsJuZx5fAXMoVStNt/iTzXbQFzT5O
 B6vc6tbwCWaGAoUytY/3na916Qu0R52HNA/3Pg8WVfXL03m97/jFo1s3FIM5eNR2eLwlShC2DM4
 aKtWLit9gDqW+JdhGoQ==
X-Proofpoint-ORIG-GUID: ZVD03Ererhu9L2xyg_yePzfBc82RqGF3
X-Proofpoint-GUID: ZVD03Ererhu9L2xyg_yePzfBc82RqGF3
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a27da25 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=t4I1CaprmQ1JAsFGgRUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112081-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sre@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:dhruvin.rajpura@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:drajpura@qti.qualcomm.com,m:quic_subbaram@quicinc.com,m:quic_uchheda@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,qti.qualcomm.com:mid,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dhruvin.rajpura@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhruvin.rajpura@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FB4A65E4A8

Commit c85c191694cb ("power: supply: remove faulty cooling logic")
removed automatic cooling device registration from the power supply
framework. As a result, drivers requiring thermal mitigation must now
explicitly register their own cooling devices with correct semantics.

This series adds thermal mitigation support to the Qualcomm PMIC GLink
battery manager driver by registering a thermal cooling device that
controls the battery fast charge current (FCC) in response to thermal
events. The cooling states map to discrete current limits defined in
the qcom,thermal-mitigation DT property, with state 0 representing the
hardware maximum current queried from firmware and each subsequent state
reducing the current to the next DT-defined value.

The series is structured as follows:

  - Patch 1 documents the new qcom,thermal-mitigation DT property in
    the qcom,pmic-glink.yaml binding file.

  - Patch 2 implements the thermal cooling device registration in the
    qcom_battmgr driver, including FCC control via firmware, PDR
    restart resilience, and power supply property exposure.

The implementation has been validated on a target where setting the
cooling state via sysfs correctly reduces the observed battery charging
current as expected.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
---
Dhruvin Rajpura (2):
      bindings: power: supply: qcom,pmic-glink: Document thermal-mitigation
      power: supply: qcom_battmgr: Add thermal mitigation support

 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |  10 +
 drivers/power/supply/qcom_battmgr.c                | 256 +++++++++++++++++++++
 2 files changed, 266 insertions(+)
---
base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
change-id: 20260609-cooling_device_reg-8e95c8eaab80

Best regards,
--  
DhruvinRajpura <drajpura@qti.qualcomm.com>


