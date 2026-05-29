Return-Path: <linux-arm-msm+bounces-110282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHftIo6gGWq7xwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:19:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B886036E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49219315716C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C728E3E172E;
	Fri, 29 May 2026 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1cj1uBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cMC15rsn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A9A349AE6
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063882; cv=none; b=LzGcHMFYgyveOVbVRhoMqrW97W+b2PNC8nSE7g3CoWDHwv/XCJymH6xKS6VJuMkP5XPMJz//sIKtkjTqj777jwLbR2+AsspGunEIssYYFMUdfdwkm6wieeAGAHTfqzlKuivLWrPizwlq1btt9vNnjiALtaMm3DZbcSpRnYqIUns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063882; c=relaxed/simple;
	bh=udBfKjlygn9xftyr0+PwOHEjL+q+Fomazsgn9DddlY8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f/Lytf3lO1mmZb3EBwm7IDfGwA1jP76tcdcPnWy5riDy9SiglVUF+kQTgnd4q6JAJrMeTi2jbHaD1zpoGPtVWO3CMxO9DvWhEhbs+E9FYgnr+87ozBnObg0nk5m2vUBC72GStsFvqdfASVnGEmBndgOdzY+LQOoSgoxCK5Xoik0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1cj1uBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMC15rsn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDaMYe1279281
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gLzSkiHHOFa32TGnLzHwSK
	oPGEUmVf4WzMNzq1f5vx8=; b=l1cj1uBf2okJh8Kidm4R5lwIOv/ibzJAVhZhiH
	Zp2NzVXjNFwas73pmWHfgbadxw5uq4gpFarbyZy3NaLxVbQQtrUveB3+dbnMOZDh
	B3qDq2igQaheksuHyYXygkZ8485HoKAnqyIegWT1yDM4//ulFb27Btg4E23eYycL
	KXAZdDaNd6y0qvhKTfSPrxKWFiMFyW4B5ZHIoyxgdzCsKFIU8mJgy4k5IPOR7E2y
	bcbMkWsso3JD81Nw0ayG/WQCj2in/GCF3FHr6Ob7RauwmWmNJak9jMgDSf6kARgc
	fVNDY19t43lfktoHnCib3tSbFQF/8fjDmT0n1S5xxu44cEtg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efbu504cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:11:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf0b7425bbso32399895ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780063876; x=1780668676; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gLzSkiHHOFa32TGnLzHwSKoPGEUmVf4WzMNzq1f5vx8=;
        b=cMC15rsnpbDYQRTQcpnDg/tyCAopV/5btJXfi/Qg9Ixd3QXKTn+RnnYWduN5TArhuE
         8eOF/wBQMVzeGr5Sl1WrniQ3/+/uK9z6e6SBRzFdgXLk1+I0zAyeqGIZMg/3gDfmECmP
         knyUXnQjwvaqpDF6AVy50A8tw6BqOjy545nPnjTabkms2NsQCZ/IFtQ9zDQycJcyMKwi
         noowHWleGlydVxdr9X/Ux0TlX+yUQAVPHw3BZ3BKFjKXuXEl3aPC78N2XDyWSb39I1wJ
         95gOdH9um/9LwB++AaSXro1xsxno1PrHjTpvs66uiFLYfeu29Q5m5SZVlT5O20uB7IC+
         JHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063876; x=1780668676;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLzSkiHHOFa32TGnLzHwSKoPGEUmVf4WzMNzq1f5vx8=;
        b=mZ1AKWk7dO74024nleskpGEBfp91WPxv8VdbJW/9ov89pobhO+9eqVavwOW957xTMH
         CR1bA5hpBHB6iTW4FVN2CPT2O4N/JvNlTsXK/7TQ72pFgb/zdy8ZyeWWoi3TJTQewCG9
         jqY0MTIHPwnEqsNxnVTw988RB1TiP2rP0YWoi60BXRP2wAlhw2dn5Wb4rLy3RwHLKZ8L
         +yVNsnLKfMSMS12xzZh6eZc8Ikuu0qIBhHt8zSpRxDweXI5VKvcD8XwScPvTZRUnH1zN
         lngZ+mUdoVURnKDuaVwbbpLoBVQ2rorg+yjk4rmOQ6bWbrtzmOdmdMNltbYXAK2IzxcL
         ZYvA==
X-Forwarded-Encrypted: i=1; AFNElJ/yWQIpVIXUn4MrDqAE+BJY2Ns2+44MuUU4ALspiq4ILmNIMR4WDpRwzM0g0ZkeTwVCmvK4Wlk+s2zv8fGT@vger.kernel.org
X-Gm-Message-State: AOJu0YyBfijMkQts9WhmDnyfNj5CxiUR4KliUPuSfXXSuyhgf4kuXTqS
	eX/j5leIFOP1cn03VTWxmxbHIZyUsnxdQCcfQENWq7IFL7elDzv2xOefXsKoHb2ovdhwoXIOTTL
	4qm+uPALxbTtpwbkLufHoXFROKcpwyg9ffd9aT6ew2NNd1DSvapcjVfPOjjKNY937VRTZ
X-Gm-Gg: Acq92OEllAoTHhcYaE69MyD0TdwTgyKt79w0+8K7sY3D+hlzlEgizb9HUR1cc4T9CWj
	jWnLLbypVkyuJewmGfjHRqLEX3OALiVfK+cWOpAjkeoe6WX88If8lfZ4S6gEWWaWXnbIyzel5Gf
	c2jj+D3ZIHjNMJA2RWBhCbK5ROyNS5FFediW2DnzbKw6R7z1OELQvYa7ws3wbtu5fZeup8R7Fe/
	1wcd6cw6xGN4C1bSboVQQGOhSDzs0QYiOplGYZ7V8lvBf60WL8J+QCCtj+Q9BDwR2W1WsaERWO+
	y9OprjzBz7PZZh6WN1FS+AulUOOdTn5Z04amREZ0tbATPyIuXxheCu0tVWMNjjInZAoJsPk+FjU
	/ThyZaOmzlKbRJP8mWBB2nRKXmRRj9KUyby4UsHmvGT8db+8PylfnqXN1KDCDZh9HLOyG
X-Received: by 2002:a17:902:ebcd:b0:2be:1b3e:3a1f with SMTP id d9443c01a7336-2bf36779d38mr194655ad.2.1780063876213;
        Fri, 29 May 2026 07:11:16 -0700 (PDT)
X-Received: by 2002:a17:902:ebcd:b0:2be:1b3e:3a1f with SMTP id d9443c01a7336-2bf36779d38mr194055ad.2.1780063875520;
        Fri, 29 May 2026 07:11:15 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a00a53sm30775215ad.27.2026.05.29.07.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:11:15 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH 0/2] Add psci_sys_reset2 reboot modes for Qualcomm boards
Date: Fri, 29 May 2026 19:41:09 +0530
Message-Id: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH2eGWoC/yWN0QqDMAwAf0XyvEBXUHS/MoaEmmpwaElEFPHfL
 fp4cNwdYKzCBp/iAOVVTOYpw/tVQBho6hmlywze+cqVvsFkQVrbrVU2XrBb8PEM46yYaKQ/Ibk
 mBseeaqohp5JylO3efH/neQFXf83JdgAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=SMRykuvH c=1 sm=1 tr=0 ts=6a199e85 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=duSgcVyVFfa5pOUly18A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: wuGz0OMnZnvt-yb3xtvZtqNKMDt4oe9J
X-Proofpoint-ORIG-GUID: wuGz0OMnZnvt-yb3xtvZtqNKMDt4oe9J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0MSBTYWx0ZWRfX7q6cLEqgGo7l
 ZJ+drTIAiS1YuXIpQsEt75C43aaZ1oEY7pJJ3ynVpCtncBOXhZvUMriVFWgB4y+rCEZD+eZQHLx
 cWfWsp5JWDz2+SyvIGxsK/THe/Dv7boKSRHUBhdhzOXl8ZVigI8aBzwdGVgjbLap+obvl/ZA22v
 MDnJlSXT7Lkd91Ig0sWk+dAvHBJ0Ie8WG7zOgQ4knFfqD+CNW4Df3XF4HtJ0/PTXjiEBwd+hxJ6
 yS3RblDo/2BbGzXcl+6f4HCKXEmT5wAX7mAFeTMP9n0zX8WtzHCnmQ1TIIbBK+oMKji5g75oW3R
 2SPL8/Vn6rA1lTYsxqWv+tpKtsynAWSKq22PXbvNfGLxKmNIlPMcCP53elVIlqai+JqoIi9qFSm
 QQYKQFSjtqy1swFXtm3PC215ovl3gOwN4Al7CfQW337cVLBLMmaoJM5+BxHcnpOk3hLGL5sjEw5
 W84iksduEzU/Ynph0rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1011
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290141
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-110282-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anurag.pateriya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11B886036E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adding PSCI SYSTEM_RESET2 reboot-modes for sm8750 and 
kaanapali based boards.

These DT patches depend on PSCI SYSTEM_RESET2 support introduced in: 
https://lore.kernel.org/all/20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Anurag Pateriya (1):
      PENDING: arm64: dts: qcom: sm8750: add reboot-mode support

Xin Liu (1):
      PENDING: arm64: dts: qcom: kaanapali: add reboot-mode support

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts    | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts    | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi       | 2 +-
 6 files changed, 30 insertions(+), 2 deletions(-)
---
base-commit: 6ee02bbf328be8a8586487e3af73b65a906cce58
change-id: 20260529-psci_sys_reset-dt-changes-for-pakala-a09fc0e2a8a8

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>


