Return-Path: <linux-arm-msm+bounces-98557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJO0MkX4umlwdwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 20:08:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEBA2C1CED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 20:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C0534300B9D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 19:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E010E3EDABB;
	Wed, 18 Mar 2026 19:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNF6ex/7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3R+LAvk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB922DB7AE
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 19:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860929; cv=none; b=mpuz0mRYpD3JOsGPk8DtBkr2SLSiuYVk817omLqQuv7j8Pj0DK4iQO72quecyzB7zzlSxlp+F2OXvFC7eZ4NBlnvsffJxjmAj9oGrG9/lnpvNVp0OoEhKWecjnS2cwiUvF9MokTIRIZTTqM0N5Gmo/ApBlYNmZ3gw1dv94d6X4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860929; c=relaxed/simple;
	bh=93i+e2BH3Gl4gp98oifWXkOaTKXw9ZvyRnJjINsZCAk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oeW4xhh2mIwbdcy7h2YM21Ql17VHHIjve/kl8+hhS7RjwUzLb/nK5+nUusSEPksL3rG3U+zRM0YK/bFReceWh1xkVNooyj4WdDNmQN+ywzgxjZa10vdZ76p+mzGqPzoCXQ8TJyMNHnm9fKMRKlT2EoVz52ImVEE9oclmxA5CtS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNF6ex/7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3R+LAvk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IGNpH8005327
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 19:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZmoPvTsB3Hohjv4Pq/nIUD
	tnjrxJN9VwDj/n+56JCgk=; b=MNF6ex/7e63ovK3UJf8PxmRev76LdGwIgXrsTk
	3A+pe3AF52QxES48dBzydKfrc8/TKVF2BLvW01b98p93ud1ms8ltfacPCIJuoZi4
	G7Lau9+y2BzgcDo55ZyC/G+0x/F0054FgmqGl2CMz6IRV5zgKPk50p3tm0OGnVIP
	iUu+ig23xfmt+UgRBSXsaNTKTdQt9DEOwqBLa7yLBJg+FTQWoXD3HD6xFDBwn5x5
	Qbt3f3gWDVfywj8TCq9RH2jn7X+2gwpglA3G7/70nsVmahrRtlxtGzUbq+IG2AxR
	unMiwobG05Epf46TqDNGiPzB3uwEf6GRo90qzu36NNIOB/IA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhg8kj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 19:08:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aec532278eso905325ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773860927; x=1774465727; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmoPvTsB3Hohjv4Pq/nIUDtnjrxJN9VwDj/n+56JCgk=;
        b=N3R+LAvk9DNu9lvaXWnGqE0UNgtwQNd2nSMmtD/QRV+2tHvQirqHAxZrBbQxnM1CPs
         5C8thgnQZr3xfjxf20QC+3n6qtJyhm4u6G1p2eKiH5l9RHxzMCVX2wZnw73VbL2qU+PC
         mCVCmrDOCy/JNHVelVidCG424xUO+nQPlIqzOOuRsbt7Hblqf8x2VLkpEtXsDeNB2Bje
         kkLOnhmysumABY5IRC7c5ZFm4ip2pPj1lPWGzxqxrjMUa7YsH7QkutCM3U0aqDRVB+6w
         PtGTI6/8nnH5jFJJKCRjF9RrF7sBvXT/8rneD+z4VFEpMD1Gs5KI8P/AfRrXfvTv+1sH
         YFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860927; x=1774465727;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmoPvTsB3Hohjv4Pq/nIUDtnjrxJN9VwDj/n+56JCgk=;
        b=dbWud4GwrHLm8ybB0dobdW27sly+UJzrH0iHEte5NJq0ixRRqUBM1VMbdKsiY7JrXH
         AnG3rBOgGrxUs1ZshS9g/51ht8yn1Gchlel1EZV/nRzj6Js0Kq7xRA4NA82bJBMwK3wS
         j7iMsGQHmxVzlYJPBxQEjkzT1qXfbF0pk3ITO3+4DvOlc2/0BNzfaiDonG19E8pPhU+1
         WPm26Ayj8PZqDbX8Dw933ueIc9w2b9KvuPdAaxnZRo5981OHbr/f2Raf8c5NhKi1IkVg
         5YL/6+K4nbqePvX3KcgsT6PkDVMyZs4NFhRGXZRK0wGOXQjzlq/zCJnnyrqSgDhDjOpz
         6V5g==
X-Gm-Message-State: AOJu0Yy8WJx1ktcDr2IUyv516e8Ouv4LdSgcGi0PjUhAKRmyB5GoM7uT
	K+CB6y1uVEyh/6IUl2Y1VAtxuZBueKqyCyilgvU3YbigFMITtwVTDQxOgrLkIOhEV/lOvkfSlDa
	ty7EFU+5ng6bmo6+BU7f/QYb+aah2T6M+2oWwywo9A3yJeJ9z08lCcqrIHjvpt9OEAV8dwJ/org
	4e
X-Gm-Gg: ATEYQzyD00qNAi6b+m2GVy4/sUl/E5km2/uSbkouSeILav+uzleMzKaTATq3k4KCvjV
	ouSUkFd05VNuSwmzFiYzteuXSiXtQqbz5BSM3E2hU6RW0R3vJ0EzJCl1r5ssS8UqFQflwy0BPxL
	stKyGDRidzKh/y7ikWnD+a2f5JFNOfvsNNteQBw9N6DL1bj/WhUWpFA2fEgLUe2wrC2yFDTS226
	idFgxZfcJe0G6CKhMyN9f5/SjL9qXoCqXnkbikRAbYTQm9uV2xtnX/BvfjbJ9ZMbIIQ44K1AN82
	v+KPXzeBQacqWOnWNgtmSnf4KQthbkfeSHKfFPW1xz3DvezGB/0HB2Xne6Dy5VbzpapmIzNqFet
	hFmyvTarxHCH0r/NlbUypZiFvm+urLW5+pmWHXdTKNMORNKqBaIItGVEeJU6ubM+6IUPEN/qVJS
	qB7DCJtmphsCyXIxyIhHPkAr/qHhfQ0szU1VbrWwpqTA==
X-Received: by 2002:a17:902:e842:b0:2b0:4f82:74c6 with SMTP id d9443c01a7336-2b06e4ac4c4mr34247765ad.8.1773860927207;
        Wed, 18 Mar 2026 12:08:47 -0700 (PDT)
X-Received: by 2002:a17:902:e842:b0:2b0:4f82:74c6 with SMTP id d9443c01a7336-2b06e4ac4c4mr34247505ad.8.1773860926611;
        Wed, 18 Mar 2026 12:08:46 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5f1245sm42762805ad.46.2026.03.18.12.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:08:46 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Enable lt8713sx bridge with displayport for
 monaco-evk
Date: Thu, 19 Mar 2026 00:38:18 +0530
Message-Id: <20260319-lt8713sx-bridge-linux-for-next-v4-0-da886ec78fe3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACL4umkC/42Qy2rDMBBFf8VoXQU9rIdNKfmP0oUeo0YQ242kG
 JeQf6/sLNqSQroR3BGcc2cuKEOKkFHfXFCCOeY4jTW0Tw1yBzO+A46+ZsQIE5Qygo9FK8rzgm2
 Kvn4f43hecJgSHmEpmBPNtROGKdqhCvlIEOKyCV7fbjnB6Vw95TZEA+RsNk/fPFeNJJzwO41Pc
 YaEZ4EJls4xo4UwJpj9lPPudDZHNw3Drj4vq9WaDHidxNI3XvJOSGFl61ulqeWWyxCUtIo6oCC
 19UYRR9Da7xBzmdLndo+ZbgX/u/pMazfGWhmcCLbtyP5U4q9um2Fm31RGu4dUtlJB8CAqEmx3t
 /GNyn9QmX5I5ZXKg1LG69YrT/+gXq/XL1OpvJwfAgAA
X-Change-ID: 20251120-lt8713sx-bridge-linux-for-next-30838c5a2719
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773860922; l=1855;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=93i+e2BH3Gl4gp98oifWXkOaTKXw9ZvyRnJjINsZCAk=;
 b=mj76+x9827aUkAJRwV6qSO6ygbt9H4WTvtcEixZ/OeRoT3N473LPbKBOZuK5jvxNVRCZyPWvh
 TSQcOaYz2JYCsn9XqlF5d+CMIfKb3AZ961EzwPp8MXlWwdqE0x6EuZd
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE2NCBTYWx0ZWRfX+c1wBoG3K9hH
 gRqL4C24zkhYLM15nrYsP7f6Rffv2qBliQv9ru1NaoRSDLfQd9miihg8aw33OenIUEkkOj53Q9g
 /fI/f9WGmsd8o7Hk2yplaJcDjls/wHM2L/nJQtnqW9EgMQ4q59XltWIYFgQBuNViwjyclk06pVv
 KJVO0Lkf9kt+U7qCzvkTQ/ceIkkvRF4jUtu+cC3Rmh2d4zupZN2oZd9PxO1kcEMbHRm6U0b3Qmw
 acB0YPJD2XIv5Je2TsgnGkYgCcAwvgcjNImuLGc1uILX0YVgGMtxdPidxvc7bdnQk1qzH+u8YZQ
 ao0PIooYjfI5bFdhBabxNCNNQe4OXGzbs4X+lQ6rf/sxItZzYMk9VuDriXa34cT8FhHGtCxWviB
 0Id3a7vRoxCHSCoc1WQEONgf7nT2dZAlK0hDfAeiS+xqjeaBN5o7pXhrFULEQFIVhUttSSq8mYk
 6me61R9WuARcEcPReHA==
X-Proofpoint-ORIG-GUID: CIItcx9PFJbrsPK2zXWnyll62wiNkyk2
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69baf840 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FNfohRsh_S1gWZ89RWQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: CIItcx9PFJbrsPK2zXWnyll62wiNkyk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180164
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-98557-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6FEBA2C1CED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series enables lt8713sx bridge and displayport on Qualcomm
monaco-evk platform.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Changes in v4:
- Rebased on top of for-next branch.
- Renamed dp connector node and labels.
- Placed config as per savedefconfig
- Addressed review comments from: https://lore.kernel.org/r/20260317-lt8713sx_dt_for_next-v1-0-8195fa931ff1@oss.qualcomm.com
- Link to v3: https://lore.kernel.org/r/20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com

Changes in v3:
- Used  existing qup_i2c0_data_clk as default i2c0 pinctrl and provided it's drive-strength, bias-pull-up.
- Link to v2: https://lore.kernel.org/r/20251219-lt8713sx-bridge-linux-for-next-v2-0-2e53f5490eb9@oss.qualcomm.com

Changes in v2:
- Configure DP PHY supplies and DP pinctrl
- Configure in/out ports and connectors for lt8713sx bridge
- Use correct base commit and fixed build issues 
- Link to v1: https://lore.kernel.org/r/20251120-lt8713sx-bridge-linux-for-next-v1-0-2246fc5fb490@qti.qualcomm.com

---
Vishnu Saini (2):
      arm64: dts: qcom: monaco-evk: add lt8713sx bridge with displayport
      arm64: defconfig: Enable Lontium LT8713sx driver

 arch/arm64/boot/dts/qcom/monaco-evk.dts | 89 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    |  6 +++
 arch/arm64/configs/defconfig            |  1 +
 3 files changed, 96 insertions(+)
---
base-commit: d639565b64d4781b3b36ff76b71ce1e68bda70c0
change-id: 20251120-lt8713sx-bridge-linux-for-next-30838c5a2719
prerequisite-message-id: <20260303-lt8713sx-bridge-driver-v5-0-6cc2a855aafa@oss.qualcomm.com>
prerequisite-patch-id: c5155e9804a0e30aba47c54471cf6870482d0738
prerequisite-patch-id: 44e87c690845b24fb4dd88bba67e89fcfd18048a

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>


