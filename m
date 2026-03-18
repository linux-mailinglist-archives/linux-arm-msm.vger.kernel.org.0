Return-Path: <linux-arm-msm+bounces-98314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFvTMeUkumk3SAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 05:07:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC8B2B5A98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 05:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3083D3045E15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 04:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8EF33BBCC;
	Wed, 18 Mar 2026 04:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EvE8nNUF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4ihK/oU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E6D333442
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773806819; cv=none; b=VUBuykRWRrdW5fu09jfURyS19I6I5AhzY75v4yvtqkFitDlsMfBXWxHtoJrtllALWMpvuk61Wz2NCyWTJq7CEa4VXFwUnPYhfPibI0stAYX7xapRO5a7RkKe9JKSqpmkdycd3AUZsKAAtcQOKp6BLhez+LCjlzhqeHGcbmJlyC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773806819; c=relaxed/simple;
	bh=DD5MIeQcIaMIsC0gy5QoMCiYF4eJYZdTP+CB/gE2a1c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=iENPspmKf/irOIRHtsCFz7oN7LFJUNrxEFXqiz3vlRbkWe6USAYl64lWHP2XTgMG5bo/CQ6MjSu3OGFLcvi2nh61FV3Papbsn5ba5YmLpIMnopBBTgxI7kPdSfRqVdHLEuKZOnqjoX9PFIcJEIF0DzrdN+u13vK09KohKS5lFlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EvE8nNUF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4ihK/oU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I2wO5U1370762
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YAuJcLEUhrbBSScCD/eZx5
	H+uAJobAE+1qvvG7F/0NM=; b=EvE8nNUF+Xd6y9w2Gf6HQIW+JP23oL2mPSwYFe
	4KtpGPP3A9gN2hNy6iYHCpGj16xB9FfjbdZlecrBJwV8xv6DPit5Rj4W9FpepB0U
	3nopGnyzIUDf0O9K80al8Byi+9LjaNFZLpvHRnSoJyalBu0IKhvPKSVOExXb8V0S
	yc6LouLCcuMT3qfTeA8R88RtnYVidCvN2OjIZv1ayC2v7d6YZQDz96LrJ/UzeyHY
	mGlPt5G8Rex0QsJdHT+tJzzndUsduSDN0sIoLC3rE+GhvqbtCT0LA5pXn70TAZ9c
	uTGPskCFl3EQyzm7KtA3SBZlLaOTh14G/+ddwjnyLSdkVmSw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy7he35gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:06:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b06395b7a7so4676415ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 21:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773806816; x=1774411616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YAuJcLEUhrbBSScCD/eZx5H+uAJobAE+1qvvG7F/0NM=;
        b=f4ihK/oUVHM3/8RCrNXPi1z+K0IALjJoH+qvsoINdZ8hys8x54tNsS3j7dU38H6ZbK
         NL5G9rIWGCLxl1XFPpjTAuBi/AnN6Z5mZKaiwss8MDj3XSt9qE9oXc7nywGsKP8V3QCZ
         3zH0K1bEWJYMLaPTJY+TNL7e1MbklodEcey/vcOzbEeGQ+GUO2fDpa5AyIFOQ01FWaR4
         86w5poVN0fysBqf9QJhncIRxmzQma85MLdHxEVHXUV5C5s88XFLBPKNI4a1Ysj35BNt0
         f/6PPVnOHyVXv6/0raVk2vjTjsuvFniWGoDpikpe65nwEYRUHa917+AOBcgHCuIVGeZS
         R7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773806816; x=1774411616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAuJcLEUhrbBSScCD/eZx5H+uAJobAE+1qvvG7F/0NM=;
        b=gCiA8w1Uy1uYvQsWaFRfNe4sa626Oos0wCYTHZPfI2yosYJyynHiGQJxuWIBPVSpEm
         Rel5iDxhGuYj/PkcSd3zcPPMvjBD+p8ZoRS/7HrbEjET/kJWgfLLm9zYJJLKBnhZVc6X
         WVIZLlQ6d4m0xTAxNum7ux14+iCJiry7gdIJeRoNaoP/Zv1X0+esTOsZnuHb/wSm803B
         8weAakkIINPkyI1ZbEfnY352mr+BwL1VEf/5c+SH57nTOVvpzFaL4093ZklcBMfyeEqQ
         xVTEMIfcqExHGkt0NnP2+WTIoSrtvJGGbPLOTReRurGU4hk0pUUfNtp0A+3oI+0KtoUc
         KpoA==
X-Forwarded-Encrypted: i=1; AJvYcCVDvujz/P/EnkxewcJ7emFjIvWjMf7Haw3WcW5knYp/hcE6wEQOKlgTkRd3t0YvcCxAfZIFqLyValmETmOl@vger.kernel.org
X-Gm-Message-State: AOJu0YxTe4Gnf+cjl0HCY4RPwKCKpY/gAr23MU5IMmf5n4yFsJHg8wF0
	ltg/iRrZgGE5vD5xb1EtYCvShyvXq1nJQ4/pnVROhP5t2mX06jFTJvZp81L/Z/vy5wdLVGwyLrw
	iqklU/Sctgvcz/KLdufTj3zJCmgPCDM9C9nnbn+mtDwNSpTyoJEKJ+pqOfJknMpNtLIQ3
X-Gm-Gg: ATEYQzyWzpaLm706hwYkK4DMdKaObk6WiOGoEQZTLsQ0Zr5wOldATtXDiNFnm7WkDVb
	EuwNb6s8ZRACJcqDGx7piJYRoJt9MH9jLFciCbREfElYueER0m6gg7NLU61epD1XXmI6t3zBwlG
	aJa0WExp4hbcRScXeIsiHZbvybaCkwtEkSY5Ay35JPOY1MAGkEQ6hVnLr2O9R5SmVaCztoLNURU
	cj95Vm41CGBk7v0MRLZRkM4YKvLjXdJYAD4E3y1WrwUVNYvaa2pmmHan+MoECap35X5JH/fwJ8p
	MbGjS5FkYFhY9cifd2BEOsiAI3COmhMOutzpqfM8xgtSjd0bY8+0GTNo9B+Ly3meo0tQc9GtwjN
	dDBC9cPkDcGrpoh/IbaxaiRoX0OG60dFZONevexcUGf0YX9mJxM5mao0=
X-Received: by 2002:a17:903:1b0f:b0:2ae:5426:da49 with SMTP id d9443c01a7336-2b06e3e106dmr21999715ad.34.1773806816112;
        Tue, 17 Mar 2026 21:06:56 -0700 (PDT)
X-Received: by 2002:a17:903:1b0f:b0:2ae:5426:da49 with SMTP id d9443c01a7336-2b06e3e106dmr21999295ad.34.1773806815638;
        Tue, 17 Mar 2026 21:06:55 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5f12cesm10243425ad.41.2026.03.17.21.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 21:06:54 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v6 0/4] Enable secondary USB controller in host mode
Date: Wed, 18 Mar 2026 09:36:40 +0530
Message-Id: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xNJASH4LqSiUUEyv4KkWHqpTnp5SkQLu
X-Proofpoint-ORIG-GUID: xNJASH4LqSiUUEyv4KkWHqpTnp5SkQLu
X-Authority-Analysis: v=2.4 cv=QsVTHFyd c=1 sm=1 tr=0 ts=69ba24e1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_g2_IpJpLE9v75ymYvMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAzMiBTYWx0ZWRfX0/ENtX/G/btc
 oWfMYnI7d+SDv7ZjaqjIZDNYM15j5qUxnX0/S6FhHK1tXps3zT52fC585pwEEEJJpcZHvaBPFjr
 TZd9VhPLFB4oxoMrohs5+5A6PuGXFGr89mLowqECX6gJmRQzQikPkX93Foa7SjCOK6YhXKFC6WW
 xSBKhqjSKhU2xe6vJ68fBi/LBqF3sgKJqlaOkedvLttA3YGEdKCRvsXFM0QvIhBLx3Qd7LI5ViM
 6LH+//oYxXVGvzyspc738PCJBVFpCJ+X5rT72Vryoc+ZWBvjMdvbhWlSpJ/mOEHe4Spy4HdkJC2
 DRuuzrGEzzf54E7JppS1XwUpCg+H+zSm6sdpgCvIGZJ/nUFgI5Hu0EdEYmIg9QrYvTyjDmwMZ/g
 XdBSNz5E6DHU/E1wFMNXg6YTTYglwO+4oq1HBOph+VVZjn8SD8dF2oZZgPwmJm64HlyOWSDTFPC
 5+L91ZJsbPQ0wLxNWZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180032
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-98314-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3FC8B2B5A98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable secondary USB controller in host mode.

This patch depends on:
https://lore.kernel.org/all/20260306091355.1178333-1-swati.agarwal@oss.qualcomm.com/

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

Swati Agarwal (4):
  dt-bindings: usb: Add binding for Genesys Logic GL3590 hub
  usb: misc: onboard_usb_hub: Add Genesys Logic GL3590 hub support
  arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary
    port controller
  arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host
    mode

 .../bindings/usb/genesys,gl850g.yaml          |  16 ++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 216 +++++++++++++++++-
 drivers/usb/misc/onboard_usb_dev.c            |   1 +
 drivers/usb/misc/onboard_usb_dev.h            |   8 +
 4 files changed, 237 insertions(+), 4 deletions(-)

-- 
2.34.1


