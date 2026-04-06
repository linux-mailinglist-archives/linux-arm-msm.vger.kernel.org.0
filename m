Return-Path: <linux-arm-msm+bounces-101944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDF5B5SS02kDjQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 13:01:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E533A2F61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 13:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E383301A38D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 11:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E163E326D51;
	Mon,  6 Apr 2026 11:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8KU3rVf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ltf7EZWv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DF7328243
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775473284; cv=none; b=VjGDqn5e9i3B+F5JdR/v1qlvVmTuSSNLYwrH+RL3LPTA8XnDOrDEelg2SEcVMHM6pgnnc/zyPNKjl4XQ5ynapQ9Q34/m7d4Xdxz6dcewLThPcxbJjWm/Jgj72beypraOv/OTqkHRIiBRFKTaOhr+1ykTXK4GjCg55uLqDSkMT0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775473284; c=relaxed/simple;
	bh=Z+COagVtvSY7qScaAgv0I93kzs9zegEG5ZBNHqyJMsg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=bjF0c8PzbNeD1gsklImCD8MrqATZPTVT4t6EAz5YxshwAMH2RrZ0+JBpPUgT6yDEwrkG024ztxw6ltnupi+rYxJ93z2N9ZVzFQWcw//p0Yo1PMhmnpA5jMxbTRyKfoEVkMwX0+KNE+kCPfafFObBz6wdKf0EsUC8YrBMA1q6mLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8KU3rVf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ltf7EZWv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6366NUwi3674948
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 11:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lB2MUUqhiDElsj3sg2cUgJ
	y6vxYa8HLDpforxpI+QJA=; b=Q8KU3rVfrqa4eMr8RMl0wA0k3X18YhnCERpv7p
	lx23iXVaVtNpynO5aYNIsWcE2BCD0EvMTDsQmgU/BB3JboBPkPDo9WIA+4mVNewC
	6Fwz2hoDc5YINMjxpBe+B0mJP4buJCkXZc761scjkqEoFWkCBwa1dnUbDqcY+/cH
	FDA4WeciWv1J7l7O3E22nlpPyH8SqgVwkPnV+BktIv7RpylhlnjpJPE7vtznnhdV
	7ESwYRve3+NQdmsjTf6zfy9cjVjhzVoHfpHavSn/VipH5JUaKDI/wItK6sYeevze
	V+qRkl8FhnMTUfKYJJoB2+Nnbhl0Mk6aggk/G5dgLr1BSOIA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfmxg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 11:01:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2523e0299so99592095ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 04:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775473281; x=1776078081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lB2MUUqhiDElsj3sg2cUgJy6vxYa8HLDpforxpI+QJA=;
        b=Ltf7EZWvlcShQonTbmhtZrgArbzkRcryk/SArc940QqxDiB0XV2lAoCRk0trBMaY4X
         nfP0mCr2uz9CXvHSsPtqq+Q/rKO/nKVA9YlARcgCNzWyDFbO+WlDmd4BUXO42syMmn6O
         oydrw7m7Z9SYjbXoDp34A4ekjJOfuSLSHsEZENpjEe9cW+3Mg+prRb6jcdNqQOgRbHlK
         f3hvymHHJNA1Zjq7cJakGtGdfW8xJTPIuxIGMRdFvTDNXPs0f3gDaKAd9w3FhKs3Ttkb
         iLpZ/qXEHHtOMVHgzAvAybo9+SWN84tIth8aOrw8BamuFRznryiGcDs/ydJ6UgszpRNp
         smtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775473281; x=1776078081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lB2MUUqhiDElsj3sg2cUgJy6vxYa8HLDpforxpI+QJA=;
        b=p5LuRDqnB5+B1vPPQugdeXc3X+bNR7dmcgOvF8a+tBtR6ouvWp2tXGsoWOthzyqQ3F
         eXChygLevYEc6s3gaXfd3UgVTGfiKH0QN7+RBKgOa583MdbQHyyHcWIrTAAQz0SBWOCz
         5sjZNFPJB2tzczYDE23Hvqv0kl5pjOw/K8ImvLmeb6P65fksuq4iLlX/YIKLjXJBLS5u
         hYqJbDnuLUHqYrdqY4F4uoBeIlZMVxQ1S5i7AyQ8Jf21pduPyGAZARZlmnrgYV5cSZ+0
         EsmFqB6KYrCtk6c/lZd5GkgjmnawiI0CCbLRTnVU3SMQ5XejBFYwJ5CnwdQYasNLeT+q
         8Hkw==
X-Gm-Message-State: AOJu0YwTsOflu5jgWtq5+kDOq+3teoTTu5f+M8IfdwC5WV4YvVmVmb/q
	Yaql/4s3fA96BmubA2DTOglfPzYHcd6SRQYX9L2FaefIZVaLsAvwBksPwyKFSwgSUgta0x7igIY
	K3E/NtbDyUL7YsTTm4p+uaGZF30rRWcYv4EDbzssb1fOEbz/Qipl2BNV5FdVCufynxYyd
X-Gm-Gg: AeBDietyaaV7518xLm9/AL5PMHx7K21c97YPtNluldgdPn1ndcXcMUE5e9sURAaMBbC
	zSsDgVtC0HO1WUig+UeJtjGGKmq6oqnJxXxtN0tbEthxv0hNcj8etZf7xdP6gFDomtibqmT/7Ds
	pIJl1hnefX7rXQxd2F8VsvqZzbmd30QYKjoV2if8GvSg5tEfmwqzyqS2nmUHHT0sXd7boLZAkYz
	SK2GK6vTNJwuZbOcnmbzF3QTUkdOJbO6JdTCAK0HJichoU9ZI1K1G8wuLH/8jTC/IHcANfC//Zs
	7zuOlJqLo3LSmMmteHEvl4NCLcHLNtszo3Kyjnl0wi2WEfcq8ru/m8yvJ8n45v7pfdXEGoLrOQM
	91aXUw9ypt4AgfDPCTGumOhv2vjjLLNaQD+xliYc5qW9c0ub2eMfBu+U=
X-Received: by 2002:a17:903:3508:b0:2b2:50e1:f104 with SMTP id d9443c01a7336-2b281706efbmr134201995ad.3.1775473281071;
        Mon, 06 Apr 2026 04:01:21 -0700 (PDT)
X-Received: by 2002:a17:903:3508:b0:2b2:50e1:f104 with SMTP id d9443c01a7336-2b281706efbmr134201435ad.3.1775473280560;
        Mon, 06 Apr 2026 04:01:20 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27475bc2asm141696075ad.19.2026.04.06.04.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 04:01:20 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v8 0/2] Enable secondary USB controller in host mode
Date: Mon,  6 Apr 2026 16:31:11 +0530
Message-Id: <20260406110113.1709886-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDEwOCBTYWx0ZWRfXyMFZ0Gn0ksUj
 HTtjwUIpPY/jkhkzsesw924aQIQ1uuecolqLttr9OfRzxUzZf1nwQPZXK41WnWe4J81Rf53j2ra
 obUqK6F6vvbKLxO/qOACSnrsLnWJd3AXylxnuWwixWGniX7LCbnraMX922B0qrHrC1u863w2nvS
 0+8v8an62WA9NcJjs1x1bouTDUKlZXCjTSnMguHTPPg7gOaoMzLqBpvvIClXJ1Tw8dz3SoaECKS
 tfafRwehfjLDPazgJQUJrXYSHSSWodvJDZKwyZFeRRuSP+EKSZeZ3GSulPmVEb1W7Z3Z8z+6qyM
 3r7Y3/UPWpvEhPZeqlhk/pNK5rEoqvtuXTDz254PlPlAHQMWbT5VQxkWiFIrmqaxoOybpHUfdV2
 XrWvWoxj8iudkvA3cjzDvDxO/QyTvjuJrFm8KFs17l+j+vNMWI9GApTFo86reUGXYUOZrMjlbYf
 MGuYQ+2WFJdw8ENo1hQ==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d39282 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8zYQ9h4_9WEeR1vsXXYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: LztrTg6amj7M6C0706g_Y1MP82TF4Xw5
X-Proofpoint-GUID: LztrTg6amj7M6C0706g_Y1MP82TF4Xw5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060108
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101944-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 71E533A2F61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable secondary USB controller in host mode.

Changes in v8:
Removed unsed nodes.

Changes in v7:
Split Driver and DT patch for USB1 controller and USB1 HUB support

Changes in v6:
- Removed vdd12-supply property status for all hubs.
- Added connections between genesys hub, HD3 port controller and type-C
  connector as follows.

GL3590 USB     HD3SS3220 Type‑C  USB TYPE‑C
   HUB         Port Controller   Connector


HS HUB                           HS con

 |------------------------------------|

SS HUB          HD3-out          SBU con

 |--------------------|

                HD3-in           SS con
                |---------------------|

Changes in v5:
Updated comment description in DT.
Updated vdd-supply status for other hubs in bindings.

Changes in v4:
Updated power supply property for hub.
Updated details for all 4 ports of hub.

Changes in v3:
Updated binding properties for genesys hub.

Changes in v2:
Add Genesys Logic GL3590 hub support.
Rename hd3ss3220_ instance for primary port controller.

Link to v7:
https://lore.kernel.org/all/20260403100753.3477925-1-swati.agarwal@oss.qualcomm.com/

Link to v6:
https://lore.kernel.org/all/20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com/

Link to v5:
https://lore.kernel.org/all/20260122092852.887624-1-swati.agarwal@oss.qualcomm.com/

Link to v4:
https://lore.kernel.org/all/20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com/

Link to v3:
https://lore.kernel.org/all/20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com/

Link to v2:
https://lore.kernel.org/all/20251216120749.94007-1-swati.agarwal@oss.qualcomm.com/

Link to v1:
https://lore.kernel.org/all/20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm.com/

Swati Agarwal (2):
  arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary
    port controller
  arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host
    mode

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 176 +++++++++++++++++++++++-
 1 file changed, 172 insertions(+), 4 deletions(-)

-- 
2.34.1


