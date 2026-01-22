Return-Path: <linux-arm-msm+bounces-90166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPDYDLoAcmmvZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:49:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 976B3657E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AD9A3888FD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96E63EFD0F;
	Thu, 22 Jan 2026 10:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIC1eHgP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKLrc+eo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720AB3F23B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078469; cv=none; b=h3t2oR9dufpJaaS9a+XFxg++1m4AomMCASzgTFhVFgPqP6JmF+ph4CNcAH3STppgbQXLNVbG4VzD+BjQJ+pofv+9sG+6ozy+ZLb1XlaTC2jIBDXlfOYI267ajs9AdcWDXqPjYkCcUEJaZGpbR0kCEigiXzeUpUN+I6tHgesjlBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078469; c=relaxed/simple;
	bh=J9VHQJQwue+LfT3z9SbqGo6EQB54j2aREQ5dCXhFV5I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iRCXATrHLzDYHM3y3VfTSN5Zr5t4Sq8l8tSDMvLI43fWM9v5R8A54efIh2cOtDFSmzAVAUlTtvLodidyJb6E3D4IgAaR54WmPjLu0fX4RCIy6XOLc0bbHJ3eRbuv/ZL/H5qSjruxDay0x655muE3I+X4if20VVYCf3lLMkDsDi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIC1eHgP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKLrc+eo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M6rrnu725891
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LeFsxXU0vTUz3SkVxXpLyI
	coHY7U5CxMyBBnaUCUBTc=; b=eIC1eHgPYwDnnyccfnpKoNoemffF9htQcvn/qN
	+7GSaGkCk9YtwIX4TSv0Fng35FCeRg0QzecjMwQD+2PX6WuupzLTeECVy84E7f//
	nEq5JAo8VPDoW5IK49XO+BTM+HWV3jTAt4H7JUMmrrDaZ88b/oeL7JrgvgHCfbzj
	6JD1m52r0gSCjXpogCEwHqIJ3uwtGfBb9jgpas6TeUROnWR5BXV6dq4szMX56MAY
	BPd0rOACTBs4Fq2kaLJxD2VFYYZNwezhj2idwkAIe3v2SjsyvfA6aG/kMKcMcYbw
	7Ymh3A3nn5SS1BKugLtUhvrVpVLlC8FCphfErXe1xEiei8ug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buf1bgpqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:41:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a289856eso543481085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078462; x=1769683262; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LeFsxXU0vTUz3SkVxXpLyIcoHY7U5CxMyBBnaUCUBTc=;
        b=MKLrc+eo2XJbgyyvPV0Zror3O9yxHWreRhmXZhfCYezVwp8YL3YTQA7JMpGThTUcPd
         D0cVHkV0z/QA2JRYBPmwmVoSxMjj5fgxjBs98ZjUI+Ad88/sP6RJzgyR2DatY0Xu9RHN
         OFASaZ07TqR6wmICcT5/G0P8GLD/lvX3sGVUqauJoUQQrZM5ZDXGDPJ6E1nDBoA2GW1h
         RZzeEU7fKpBmcShBuesEhmgShB2viiZ4V4fnXn+037RvJkfYwbbtigaNeqAhX/i0m+7Y
         EdUzdVZUmksHeDDAH0dN3k/AamVwr7yRHGOj5yP7f3Bkfl1RZLw4CqGhZvpwl5fZVBhZ
         3EzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078462; x=1769683262;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeFsxXU0vTUz3SkVxXpLyIcoHY7U5CxMyBBnaUCUBTc=;
        b=bRKhoBoGrukulCFv7Uo6OJFBcT1IufGHP66BB4bRdGW5PZAtEdUKjQoRN/JBgQ4pPG
         WGDeK7OKTX0KdesSEP9aVXQlBxh7ewfS8hiAYfJyR7kMwqEvavaQ3UtLvafHo6pbC70L
         v6eV8pwHSn3ixzZTuqTuklWBkapQAVp7P3De225uZh0D+DcUq6b49dFZ/yAiVLaDGTjY
         KQmQQNuw/TU88eBEL0I5Z7FDlQqJnY3ulfdfNuyE8RlGyjCp4joGxcjFhqD9qpMvakLo
         4G+WfDE2nOKYfJMM7ugG3PulG4YvL+5OBpO9f8aijd0Za8iptx5x/lTQN7ab9U35Dg85
         5nbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo6GtmX0fQgo6KtaG2Mikss8eVgBelX0C1Cr/jSdcTiRj7hevMttoHpGRSTrGdFNyh7xYe16frljNKIh0D@vger.kernel.org
X-Gm-Message-State: AOJu0YwVxgS9trOQMqQi+8SLmMVdcPzIL7pKwIJR/BsooIzUrfbfxypZ
	sfb/uTQw73LdQ0uTD+Yy5WiqI9WZJ4JQcaay1DcVpgtGGBq8acKdOV4alvFDBuWuAInxUFNDF74
	pyBC9hUGNlqRhO946OR7Vy11AtdbiAU9HS+XiizfsrH9Ncydxb+100XhKqla+MMMosgbY
X-Gm-Gg: AZuq6aIXmjgKYAivaZmpiv24+m7C6Mt2BdLNY+CfLjG0/w+RSJST5LkOTVBZT2EF/EJ
	EjFqwKHJL+93GXmUCOWFyl4rJoCeRQkW/tBU6DUZkjiQg7SomabOzeb1TtcgZfZhyH/K//eg9xi
	mUPNxX7FDcAvAh3PTLQMbv5faZ3GmznOB4liC9b9YILeRDhRydthCwZyMKy7ulTbTckyqOPD7zu
	OvA16t/H0L4t3idfyLPpvZl7P+KZW3JLnI0a+Z+nak+78v8M1HXt7jL/B6LY0kvy/YdpDVT/tNA
	1ZpV6iEKDpgqEgH0Imk3FNk9YSQfjnl3qvHOWGjMxoF6BxGDFjpHUthcV6Ia7Q/xk1Hs8awQx82
	EC3vzIbPf35+KHfx2HIr23fQXzjr0dB3pIy1OVL+gfEkWuiSY9lQdYeq8ptZCdhRLqW8Kj8C98B
	E3
X-Received: by 2002:a05:620a:2954:b0:883:647b:6dec with SMTP id af79cd13be357-8c6da87eed6mr313576185a.3.1769078462462;
        Thu, 22 Jan 2026 02:41:02 -0800 (PST)
X-Received: by 2002:a05:620a:2954:b0:883:647b:6dec with SMTP id af79cd13be357-8c6da87eed6mr313572685a.3.1769078462005;
        Thu, 22 Jan 2026 02:41:02 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7260229sm1387868685a.42.2026.01.22.02.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:41:01 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v4 0/5] Add CCI and imx577 sensor support for Talos evk
Date: Thu, 22 Jan 2026 18:40:45 +0800
Message-Id: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK7+cWkC/23PzWrDMAwH8FcJPs/B8teSnPoeYxQ7UVuzuGmtx
 HSUvvucdIcOdhH8hf2TdGeEKSCxrrqzhDlQmM4l6LeK9Sd3PiIPQ8lMCmlASskpWjBij/mLN+h
 xaLE9KN+z8uGS8BBuG/bxWfIp0Dyl783Ocu2ujBUg7CuTJRfcewDZ+0YN73o3EdXXxY39FGNdC
 lu1rF4EMH8EVYQGjLTDAMZo9Y/weC6Y8LqUI+fnliwikduO7H5hDUIIrWpQIMBqDry8pWnMuFx
 oTuji7hhdGDe1mN4R8nVMmLsq2xpannpb5j1+APYBlOBcAQAA
X-Change-ID: 20251222-sm6150_evk-8ebed9e9f3bc
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078453; l=2958;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=J9VHQJQwue+LfT3z9SbqGo6EQB54j2aREQ5dCXhFV5I=;
 b=eOeg/peQAM3pR8Iz3aQql6aI9gbuvkoWl2HlGTz9wHB+2MJbTxOUur1dxebKnEFVznbSaQgYf
 DsSvKxOc7FiAS+aYFIkakwwgthxepnDDxquYQqApf3fe+ATJq1KQ1vp
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: WkI1MhCKFAnl6k7pRBbW1h4aqs2Gg4Jj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NiBTYWx0ZWRfX/hanwHNePh2r
 j29Kwu7L5DT3JYDrvbqkhOJBunJ5ffMGKj47wDgzSsU0hr2fLGOIzfdYGSeOoVFC2TROb4dTYyW
 iq0NTST6O41d5hEGnNygZvprxpBpp3MtgVhULcSTMFQCdR2NNWkfddYgzZIxn171BFEPBiNw9en
 Nf0vq7OCZ/wJv8Z9BsG16nHSy6BdlPprtSy+A74Prmi7vzErtfiYiLy9X4dpodh5qs7thMnCWS7
 xsdssgtknSLN9UUb5AP+LuQlGhnImdyiLNb3Uy9er+jrnbv7PJGsR5/usAbomOFhJ65XFel7gLY
 pk4vhkpEBr7JD/yUIpbsC6zlYAHkhfxOxUHESSkTuPTf/QYD9YwF2PggELDkdDt0zFJgElZeudd
 BdvGlAavFkfb5K67/sm3J1muSoqDWVEjwlfCw7PpAWAEw19prJDza4DIX78RbxbixCmwjBM9YGF
 TJ4QWU52T35CfGiCXAQ==
X-Authority-Analysis: v=2.4 cv=G+0R0tk5 c=1 sm=1 tr=0 ts=6971febf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=EncVXgJB8TypbGqEiwsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: WkI1MhCKFAnl6k7pRBbW1h4aqs2Gg4Jj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-90166-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 976B3657E9
X-Rspamd-Action: no action

Talos EVK is  based on the Qualcomm SM6150 SoC.
It lacks a camera sensor in its default configuration.
This series adds CCI support and enables the IMX577 sensor via CSIPHY1
through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

This patch series depends on patch series:
https://lore.kernel.org/lkml/20260114100043.1310164-1-tessolveupstream@gmail.com/

Changes in v4:
- Add CCI properties to the existing portfolio. -- Loic, Krzysztof
- Modify the incorrect dtb install configuration. -- Vladimir
- Link to v3: https://lore.kernel.org/r/20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com

Changes in v3:
- Add generic names for the CCI clock. -- Loic, Krzysztof
- Split cci node, removed double space. -- Dmitry
- Rename camera dtso name, add detailed description. -- Dmitry,
  Vladimir, Bryan
- Add dtbo-y for dtso. -- Rob
- Interrupts cell change adaptation.
- Delete cci sleep pinctrl state.
- Link to v2: https://lore.kernel.org/r/20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com

Changes in v2:
- Modify the CCI dts style and commit msg. - Konrad
- Split mclk change as a separate patch. - Vladimir
- Remove clock-lanes. - Vladimir
- Add mclk3(GPIO31). - Vladimir
- Link to v1:
  https://lore.kernel.org/all/20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com/

---
Wenmeng Liu (5):
      arm64: dts: qcom: talos: Add camss node
      dt-bindings: i2c: qcom-cci: Document sm6150 compatible
      arm64: dts: qcom: talos: Add CCI definitions
      arm64: dts: qcom: talos: Add camera MCLK pinctrl
      arm64: dts: qcom: talos-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     |  63 +++++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 279 +++++++++++++++++++++
 4 files changed, 347 insertions(+)
---
base-commit: c8a4a774a9b0d2c86593492625874e27e9cbc9a9
change-id: 20251222-sm6150_evk-8ebed9e9f3bc
prerequisite-message-id:20260114100043.1310164-1-tessolveupstream@gmail.com
prerequisite-patch-id: 065fda916d7faca61113e1230fcc0ce3916442fe
prerequisite-patch-id: eddd1b1714715707d386608e4f9b24396f51cd44
prerequisite-patch-id: ae777d7e17e32afc36fd1f741bb57ff0d3556841

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


