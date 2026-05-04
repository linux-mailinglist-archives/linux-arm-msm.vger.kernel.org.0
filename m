Return-Path: <linux-arm-msm+bounces-105673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOwWO8Zp+Gl4uQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 11:41:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 605B14BB215
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 11:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5ECDD3013874
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 09:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD04937F734;
	Mon,  4 May 2026 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JoKyRvud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jfj4XNRj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B96037F00D
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 09:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887682; cv=none; b=JAV04jyTrPityPLuJsXO2oKuRBMm4VLtn6BZBGybuKdHA7yoz8fQPblI1UDoW6KC99veEopK2DANRjNykm3ZYMjTDpTEnrHwtD8ZIDUgoWpNzQBoP5fbJBU891N/AcSO9HlYJtaki78XDI5DQ96vHDmsPZbhg/jL6aaGfegkEwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887682; c=relaxed/simple;
	bh=6yzycqaTd6zO7vWwqNnDn9oASp2oYwGYeee9ZCMKSYY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cZgutrRWq8mRgAz6yO9Q7/ke84Hg3+vZxdzTRIk5n/7CZ6tiz/t29lepQjPzpCevD+cekrB8UWv6ynf/UAPA6kWNJaCje+qlxA79KamO31muiLcpENYhTXa2lo2hUs7HvJMTNbVlCLazeueJxKZECSVg1Y/sXlnE9hG5xlG0ziA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JoKyRvud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jfj4XNRj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fcig2777487
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 09:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ufalV60YTG3i28AyLmavx3
	qMo2IMwPvj8r0M1rSF6Jc=; b=JoKyRvudM62w8TD2trJxtFcrdO3sBHHrkWHqMC
	U8ZwJ1J5C6xf4BEoVzxviZ8Qh8PE8iKgxqcLWxTp9WWj/R8qkARXZzoYgU6u2cXT
	paT5RpKAc7MpFrCL6+bqUyw0aqK4Q1pxGgrOlqHwv8He3JrhgW+08xo2/kNdTRMB
	olwEz4OYQEKtrwGAaCBRBv+5y6CMeB7nrcQvVjJGKr+lGMRJaJbSm4s3P9xwhfQR
	QTEc7K+ktrnoqCU79rWBbr1d05bHNbn6G5EcvvKD/zRBKv9xOBDSbDPxCAOAXihU
	bP+1bQPhKipD2TBzj0oNCdH+dusQvXsXvdHptxU2vtfLQ0Dw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaj7d3rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 09:41:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e6ee9444so35044915ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 02:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777887680; x=1778492480; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ufalV60YTG3i28AyLmavx3qMo2IMwPvj8r0M1rSF6Jc=;
        b=Jfj4XNRjH3zx8p1ubcvtmeI/hxWQLANkTFSf3lmK3QWSrz06Mw8ifsjSyWktVmV0pm
         vy32CWbuJD/mVDIhqeWkFhlOO2Wr7bbQ+qWNDdqdZJRMGmV452Z2C7nW9tWTOWDkUK6x
         9UQ95Q9PDf84szHWYfRF/a3rDmDbpDAN5jrcTEGRoFKt+l2YusTgg7hGcyWZUHMLTZRY
         2TiAbMF1FkhlpKStD0LZ3Tpk6wECO0Sz2pPkfkeB16AHRxD23S0SRGzsLBXGcMlHE7uA
         a1gbo+6tQi9u/hW6iYRQBnS50pqq9Ke1BzynAF8TkhGoC/U6P03MB6pM/S3km+giCD0X
         ysUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777887680; x=1778492480;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufalV60YTG3i28AyLmavx3qMo2IMwPvj8r0M1rSF6Jc=;
        b=G+gJbumadpXs6JU4xh7jUH3YW1oeA1FUbPpVMtU7P1Hae75LyVXYQg8vbOyWWrei9K
         7ExJsjQcam+29SCaSfRMx6VxWtuhBl+pfE1gfFLx05NriYz8y9kJ7UXLTGina9ai61fJ
         pIyWlBfjsqI46b431rfCAoTy1GWGNbPqagXcyrXdir8TxXJ3q9Seat/O8SaP2ul2kjIz
         +7oXvKUwJVHXj0cvVy3bHwz6YVf6RxRiVur2FgWSONHoSkOyjb1lTFOriMq1mB2VhRjo
         bhTMzgVpCPhkwyEJjZVNA3fFnffg6Y5f5fcr6Gu0BZxKi+Hivib3KI/+6ocnI+SHxyQl
         XdCg==
X-Gm-Message-State: AOJu0YzojTlZ78kpZpJAReEd0sJF3Ib1HwcOc6/TGNNhtMH716ZpCOW6
	5SB9l1EvOAFcB6zrmVhLq84mdd92S+VdccBTp5pruCRJ1xZbm5qxBpVFzWRpXc2YU5ojSy0cXfZ
	CbY8hXNjheAu/v9Qaa3TOftdlr6AOh8QfANnbgvf3GRODVmbMV9egQherd/5sxdZUNpxR
X-Gm-Gg: AeBDievgqenfXlyMRYio+DPPqDfOhIyQr/9rhq/VJmwZSNIQi2CZrHz7PuceIdmWTFc
	inRS/FMSujLIXj0uXNYd5q8JS3RIWuGTon9YPwXE/GXCNjFdB43Er/QZRU+4O28ioiEkh/LEs6u
	LE5jzH7ecbDvQ0XJohJkiS3CINEdQm3PQd0IlvW5rFMa49Dz2KtvA+G4SaTZYH71CIJEwaqQzu9
	dOYHHb1UoJeUL2STe+x9JVxZ/NAlgB+b56Z2hGlENF/8Tmh/ot1UONWdzMbPR56WU+PTPRQE1XO
	zwDaAZsyZaZ3Ukd0znZylU2ETZOaXk4ZGRn+9vwKZZsP4WIz7dfgHrONzvjIGpbEnqPVuXtD/aI
	fcViZJiZ5naCQEUFKhRlby++t1DJ/HvIYr204UNPdiVfFF/pHbzF391Q=
X-Received: by 2002:a17:903:2f0f:b0:2b4:64cf:e8f8 with SMTP id d9443c01a7336-2b9a42aae6dmr149433375ad.2.1777887679874;
        Mon, 04 May 2026 02:41:19 -0700 (PDT)
X-Received: by 2002:a17:903:2f0f:b0:2b4:64cf:e8f8 with SMTP id d9443c01a7336-2b9a42aae6dmr149433135ad.2.1777887679348;
        Mon, 04 May 2026 02:41:19 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba038ae95csm58985045ad.46.2026.05.04.02.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 02:41:18 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add interconnect support for Qualcomm Shikra SoC
Date: Mon, 04 May 2026 09:41:12 +0000
Message-Id: <20260504-shikra_icc-v2-0-81076171e010@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALhp+GkC/03MwQrCMAzG8VcZOdvRplOYJ99DhswudUG3zkaLM
 vbu1nnxEvgHvt8MQpFJYF/MECmxcBhz4KYA17fjhRR3uQE17rRFraTna2xP7Jw6G+/IV1uD2EE
 eTJE8v1bs2OTuWR4hvlc7me/3x1RY/zPJKK3IVrautaXOm0MQKe/P9ubCMJT5QLMsywcSyvAxq
 wAAAA==
X-Change-ID: 20260320-shikra_icc-b1fcef45122d
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: Cbe_p9ZHzNPC7HRzPyrBpkmI9CCyJ0l6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwMyBTYWx0ZWRfX8yRmIflNLrFb
 ConEeIg6J2Y/Kg8BQZaDU9/2lF0LPhSthF6sOuBBnIWlu4kmqRdD2mIhl+z5S0HLTqDv6ZcDlLA
 1Yi1JbdYY9wboJJblY9s46SAHSUxfnyKWXvdYXeqQLQeiAIFIYI7mVCDDOJY/vQitoGGDUR2Xn0
 oCARvmobUTCDcdz2dvaCnfTvTQ5guaNe9smNZMEZfi3N1+MMFK+gXf3LpiT5tuKrO8YmUV4pbTy
 WUp6qo60mX51cnda14kEFyofY+3I/K8/u4JzTXnuQQG1xowJSm+yA/2unjO+ZMuYRznB3cNLRwc
 /RO9BtbNcrz2U4sAiIEyw3cuLtL6+pItNtcJ/6ban3IzWqpI/C94QjVsK3kT8/xrRUPSkwKKv92
 1u6a3dYEeuS2glvJHJn198SXxIoiBOLts7i0vjr6lHlMw4BqFuHlmZn0WLRPnq957x47e1A88k7
 +oBhcl+MPxSD+PiM2VA==
X-Authority-Analysis: v=2.4 cv=csirVV4i c=1 sm=1 tr=0 ts=69f869c0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=OZudk8sDxFVV_aZhaj8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: Cbe_p9ZHzNPC7HRzPyrBpkmI9CCyJ0l6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040103
X-Rspamd-Queue-Id: 605B14BB215
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105673-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

Add interconnect dt-bindings and RPM-based interconnect driver support
for Qualcomm Shikra SoC.

Device tree changes aren't part of this series and will be posted
separately.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
Changes in v2:
 - dt-bindings update to disallow patternProperties for the NoCs
   which don't have children [Krzysztof].
 - Drop the redundant clock property checks for child NoCs at
   top-level allOf:if:then:properties: in dt-bindings [Krzysztof].
 - Link to v1: https://patch.msgid.link/20260429-shikra_icc-v1-0-e3439903edf1@oss.qualcomm.com

---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: document the RPM Network-On-Chip interconnect in Shikra SoC
      interconnect: qcom: add Shikra interconnect provider driver

 .../bindings/interconnect/qcom,shikra.yaml         |  134 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/shikra.c                 | 1837 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,shikra.h     |  121 ++
 5 files changed, 2103 insertions(+)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260320-shikra_icc-b1fcef45122d

Best regards,
--  
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>


