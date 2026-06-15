Return-Path: <linux-arm-msm+bounces-113131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id izIFNJq+L2qoFgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:58:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DDB684CB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:58:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MRd69Dk4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bXi18KYk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113131-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113131-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48400305918E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BAD3DA7CD;
	Mon, 15 Jun 2026 08:52:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBB73DB30B
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:52:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513553; cv=none; b=IRKRVH8wq0y43kkBajGx0QoHne/WvW2DLrO0tO5CYyLanv/B6F86Avg6+OFFs4WErdGB6bIroxChsG119gIvUDAn6tWBobnjvYFk2rLlJd4syHORAMnuUdpPuj6YOrCD3ni1dMfacK7f3FOJfPpm/WFuDcyCW3CU+2V9TRWstGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513553; c=relaxed/simple;
	bh=mbwlfM9f8JkMFEZKo552TxUFu+q8ow/grm1fVavB8lo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bNQ/YUEAo3euRUuJOThNONhdyiQPF3UcFCSitiOZLqvzXEuNRtB3X/61EpVQB5fqQgEeIrq2hU/L2fJqGNSRpRcmk7gUKQ5IOY7/LX8y6QGJl98SygNgMRwEeJLvn/gRN3BGJnO5vwSYQCGv6Ut1B1pxCsMJrOHe4Z2GS33Tyd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MRd69Dk4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bXi18KYk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F7TtIj4091187
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=V1VT0vv2A+CP8MZxDjPyML1xsjKqRELxbIn
	3mtIHAHo=; b=MRd69Dk4YxEbyrUkk3+FZPWLSZYMli6HZYDmpjuUL/qq9v3Jb1r
	6U+o1zCLhoF6jBQUALL/Q0PmzRKX/aX4tulsk1lvt83WpcIvUzzYG8kyQ9HO8ic7
	4kkijf8ilFZXHUNP9d9+pwTg8UWvRuWACXdlZf5OwRrMyg5eTwnt4LiBmejonYOU
	EePhf0kPIOAhAS2CjMrnOaAGTBAXD9oXktL5bq9yvCJW+bzLVk58LRFK/RKtsbNf
	hKdJj1L0L4vhVCNewqazzeW5s6v7wQQj6k/SlKHRaoFqUKCEy1Qdyk+8hjM1URkg
	PfmpnZ+4OPZaU+9E7BS7pEJbPXiY41dk5Mg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2c8auv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:52:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b808bedfaso4405288a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513547; x=1782118347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V1VT0vv2A+CP8MZxDjPyML1xsjKqRELxbIn3mtIHAHo=;
        b=bXi18KYkpV9131CVwvIVfoYfq3KxqxKqb7cO4HKx2mtpshZQjz+xHIMSTze/ceqqph
         K12XNHj1YC1yaZTa1v1FQd+N9gKye0bTGrkPPzN/2C08uf6yOprFHBM20aHSxbR4sjb5
         KbhspN+ofRLjJigC7fwtiGZ2toVrFC1KHp1XX/EL4uDKlseTPIOKiPgqz/k3c2QA7n2w
         dnfDXek8qjrtnOvDUeWswyHOwPTY75xMLpyDGlvKqt3z65Db2Z/auDgnsuy6Ea/WYqKf
         EX3/fXDAjtrYqUyfh2JSGShSWuRfVQVVIfALlg4oBglGrcHqSre8Qe7h280AJLBXLPD2
         EokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513547; x=1782118347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1VT0vv2A+CP8MZxDjPyML1xsjKqRELxbIn3mtIHAHo=;
        b=OnHf2FBgTuyYneWuZAOM4axQIb6U6RItq2jZBuXdn6rDmWljCu6ecpqlZyP9Plpx9C
         PwN0U8Q898xJTzcsXAbk0+DhB65DgEyNpzTL7Fn6qJwzNc/M9cu1P2MZHGJSGW4ugQkV
         NG0Up4w5bzaQUUNbtBIl19gSFSTe9IsQdfKS59Jmw0mgFu4nMQmwiEcoXVThGC/k3mxj
         VXRFO95ZwGUAgxD65LLJCCWVL15aWl3/sYzGkx4kw6fp2NTEMZZmgEjFDz5/YhJjMsLm
         BMAc02Ru36IVdCrAwHS95EI5+KEvMH/QXu+reLOfLMLZwX58gakhFpZrCWGLQ5J3emZo
         T25w==
X-Forwarded-Encrypted: i=1; AFNElJ9X1hzJkwWe2fXx/1JydO5sfNZPnwh7jP3AXMLDIPjIed2sY5Wra4MGi4eSwt6gcEAPs4s+5yPadF39sfuX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu0ocot9TLhm8rcVKoz6e0Sq5ZwQ+1wXsuQKHXu8Gydo2Ot+41
	0AzAJhjrfl7IGEp3Fxyxv7J1XlSpwlRRYTBdjT5eXK6WubF+551fJXwAevcGYqpM90si+q9aFFm
	RWB43w7Ko2gEcPMGdz2IF9Fs/0Co2WoaBwUCVb9VgfVRCRh5IU0MXgN+Tq2RiEUE4+V4S
X-Gm-Gg: Acq92OECSJwN8tHgjBUk4YxK9wN1zpVlDDwcsu0Q+pyo72kU7DE3AtCF90LIiz5Tv0p
	t8Ob0MV0ahYKQLD+sREcQDYBVMBNjxV1wJt2OUJAJQj04QIY1/LtAsymwJHjslTecSc1k9nbSvV
	zb120cHevJX/mWmG5ZMpa/KYCbYSs4BWfQMg82Wd8YaH4/qjBKH33UDjYjMjzQatvfLRXuAQ7Tt
	YLOVULGokBE5M5mFMXMIvb1r5HWzrQFaMyJ4Y53pkc6yWYec7RnOcmSKU81m6oVcMRckF+bCObv
	GtD/Do7BdoH98mU4/gE2fJz1eREA6tSmiVPykZwQEGSrNgEYTdBtBq6Z1JhSbxfrujHK8kE6kyd
	PCP3hNSCMHr3tm4LOHulO6OZu8nom67K3ZQqFxA68mD4MT2K4SOeH0iCg+3lubiq6JQxh6+qFIn
	IuaevwMasFVgp61jkupvwcnsW1wp8/nVGVuv9hiGK7JDN4qWrvYSg=
X-Received: by 2002:a17:90b:3a48:b0:368:341a:a925 with SMTP id 98e67ed59e1d1-37c2bd758d3mr11117543a91.23.1781513547223;
        Mon, 15 Jun 2026 01:52:27 -0700 (PDT)
X-Received: by 2002:a17:90b:3a48:b0:368:341a:a925 with SMTP id 98e67ed59e1d1-37c2bd758d3mr11117517a91.23.1781513546802;
        Mon, 15 Jun 2026 01:52:26 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a25ecd5e9sm9539723a91.10.2026.06.15.01.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:52:26 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add support tsens in ipq5210 & ipq9650
Date: Mon, 15 Jun 2026 14:22:16 +0530
Message-Id: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MiBTYWx0ZWRfXzQQGDwvrRbfL
 V4dah50KB0VgPazChxbEfNSuHoEmhzrKL/x7/Bx0Vz20IEeoR1FTZkpOnvYBNCOjn6Nwi3zdmoJ
 p8Q9vNFmpYxkHTmePgjxWGjzCMYtb1zn038eaZsKG0BstnjZhhwWEiYnZWgHvwH/6KTsdHzXXk5
 4HhJLPqzdIqudETWEudLNsFTtyOaFvOLbeRfTOPbMUeJbH7A87kjvoKkfBSXjyhoCRk9S2o30xQ
 o91c4PPCOs/TfgfMIla7i1ATn3BjXwS5tYSmgKDoVRVfP2RYhX0OP3ygCbJTBwz80EIUwif1dt3
 7Tlo+92v6MNUP5w12r2pw0ryzTCFCHZuUDikBBl7cmaWAA1K5+5yPAdmQ1vjA0TCj305lJcyLBd
 GzrrIWzH8L+5iAHsj7vgJgcxl9zR+Kh4McWjUH44mrJWjKZJIa0MVavRpYCyJwDAin4f8YPVsRa
 bD/By+a85GlZoXrX5wA==
X-Proofpoint-ORIG-GUID: BZ4fInHql0VqUAgPP7fMsNxa74ZD4_4J
X-Proofpoint-GUID: BZ4fInHql0VqUAgPP7fMsNxa74ZD4_4J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MiBTYWx0ZWRfXxv8cqTTS1yMA
 91ke7jx1XAVnxjwsN1qZNDRbgHd+D28UuWSPlbeZDlRsU+rrX+h8GjsDzOT2JkgimDq/eSxryJT
 L0z1g40IvyFXiPGHlfRngEOcsgOrGuA=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a2fbd4c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3VMRAj0lm1uwpsZbwXoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113131-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:tharagopinath@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86DDB684CB3

ipq5210 and ipq9560 have the Qualcomm tsens-v2 IP. The tsens framework
in these two SoCs are similar to the one found in ipq5332. This series
adds the sensor data to the tsens-v2 driver.

v4: Fix version number

v3: (incorrect version number)
    Add additional constraints for ipq9650
    https://lore.kernel.org/linux-arm-msm/20260610081241.1468507-1-varadarajan.narayanan@oss.qualcomm.com/

v2: Combine bindings and driver patches
    Use fallback for ipq5210 and dropped the driver changes
    https://lore.kernel.org/linux-arm-msm/20260609065447.4024695-1-varadarajan.narayanan@oss.qualcomm.com/

v1: bindings - https://lore.kernel.org/linux-arm-msm/20260515-tsens-yaml-v1-1-8039c62cc249@oss.qualcomm.com/
    driver - https://lore.kernel.org/linux-arm-msm/20260515-tsens-driver-v1-0-015ca76f1418@oss.qualcomm.com/

Varadarajan Narayanan (2):
  dt-bindings: thermal: tsens: add ipq5210 & ipq9650 compatible
  thermal/drivers/qcom/tsens: Add support for ipq9650 tsens

 .../devicetree/bindings/thermal/qcom-tsens.yaml          | 9 +++++++++
 drivers/thermal/qcom/tsens-v2.c                          | 8 ++++++++
 drivers/thermal/qcom/tsens.c                             | 3 +++
 drivers/thermal/qcom/tsens.h                             | 2 +-
 4 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.34.1


