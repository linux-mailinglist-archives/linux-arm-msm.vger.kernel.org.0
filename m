Return-Path: <linux-arm-msm+bounces-107950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNmkC8VFB2qgvwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 18:11:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 399D9552CE5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 18:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 96FFF308DFD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 16:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFCA3E0091;
	Fri, 15 May 2026 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QAVrw+iI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FoFBCFVb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DDB3C819C
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778860904; cv=none; b=EZs/bGbGS5ceEJk4WIec95u5ZH0fX8Y7Mb2SvoVf0c5kQ8cGf1FEFbWWVkE4PEp5sbOuKXGk525AFfphw+2aKL3CE0DS2p9kO1WXkrW/tBYo2tJJKKAZo2EHJrZrrvZkLzPu+BCXo5jsUcm73GyMnk4dRFrurd/0VRDkGsXVs2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778860904; c=relaxed/simple;
	bh=qHQiyeq3zWEjZvB3X4nGiyc67vuVPOFRQHj9rmnRUTw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d4xnv/kXqlLvIuH6A5BY83G3LNtfw0v4vth5KHf80iRLoOmcDHoUDR+9LK483vlpU1cyg9DZprJeKNkF6diZ02eBufF1G3m+a1pNVRbIs1oXMmKS6br6KcKaLorKSWM/zkPBkQc9eRpFuyBJXYPetncZf0+WDQLKjmnFQgEyrX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QAVrw+iI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FoFBCFVb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F9Hqae1715145
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 16:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KmP8Lyg9y8/mru9ixQizRn
	WZXXyQFe2wq5aSUGD9ynw=; b=QAVrw+iIH05xByV2DLBor/H0rZ9OFNGkWk/gp8
	Q7Te/Gtvzh78gl526AXFxdgoqupwEst1QsCu02s2Sue01YRKO9Aig/Hb21rR33XX
	wbDv1lWcueUx2gQSSiFKQN68BsCHYR+cQmbTIO6rP1qAlPKEX4EkDkt/EvNdBZ7p
	iRJtT7hjPQ/7/06yudVCTikhCxrXkI6JeVkTbbZC7iGyI0/efR13QjgBS7UR72on
	McFm/x0FzGJXHECt9l1Cfs5Agf6o2eCV5KZfKVyLGpYkm6TCMNEudumqtggWn29C
	PchsJrRqaBMFsMU7cUfZbVSiDrIb7GKrQoaM/yu6icxzqumQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxtpgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 16:01:42 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-439bc8a6ce4so5255126fac.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778860901; x=1779465701; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KmP8Lyg9y8/mru9ixQizRnWZXXyQFe2wq5aSUGD9ynw=;
        b=FoFBCFVbNJAx1yj8jHUMB2GNRRx6PHKWrOaBKnIlk98Tcb8YIHEguzavC37SoODcxQ
         rxaqRWVQsk4NGI6pGzanRNjskD5QlGcfvngIOA5ofFb6TOJUSbb75mUyiL1cQaYozqxd
         2egl0tXLa+pDRSyAf31+3bqbxw2/M5PcA4gDPxW/fNS9U5PiuwIKC17jrNracBRlifGu
         j8C1TZnykNl0kfQLp9AUwqOeyZGCkQUqy5Bul5qB3u7m8oQAve1Xwt5KAZmsh/OpwoyO
         SjziGnRQdBoqHurMPVwgyocq4oYgwOS9C/tSqf/dr/GAZLhcyTJeU80FQH6x5yaGLRqq
         WuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778860901; x=1779465701;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmP8Lyg9y8/mru9ixQizRnWZXXyQFe2wq5aSUGD9ynw=;
        b=rHen0+cEgjIC4e+8KJfEldJJe7gvppjHehazYyRD63mM7H69LNAZP6MXMa6pANAqFs
         RWXP+k74Ok7AOteeQwHd6G4rEDUH2zbD35JOw3HL1tXvhc8RGgDBKx67PipyfXYfUcQB
         rTX0B8MVWp8MQkWD+3z5Qgu294cCNVbiXFbiRRQfFB5Gt1ZAH4taO4s8aKnYZanm2q+E
         QkgrJhJ/jXIXO1BpBCRpYLwfkK4LZKAafJBB+6lRFCkWHF8z16TzkS8Ke5f+0IEAMw3J
         qBk/EynM06u8XjNofZYjfRn5Hw/al23go6DZ09NKkYAh1ktQY6HMCejQ70bgxDsEFz2u
         qiDw==
X-Gm-Message-State: AOJu0Yz75KmI5zJFzZ8zQVCU9tJqirEKfxcc4BO5vlasp0BoAiPbQ6l5
	PsS8GwvEIa9Ha0tgmrYxh1EV1bTeKJmoKskl5SmjWtUGICBgGd3/VZkdzeEupS/+I/if4NZgib0
	1jyLAdVqy0xOI2hRC2jZOnVs9UU7i4mtNBXpiCHZoUYv0bM6J1KoqDbFznOKonl6zFlxRlpsq7w
	hh
X-Gm-Gg: Acq92OHHRhW3Jmwnp0dMUexbuKyYqxR4vBCHFeRySPpsHUpoJwqC1/ugqBRZs1TnSJs
	S6wNmJleIyU+sxVy65ErIvoztyIpjlBywaNsW2EvMziblv6xYu+IwUHGqj/hI42E9wViqdvDGun
	AnmJFWSRvSa1C8ojbCIgDdFvGLhh+nQTEr3uPMbX1rnOi0pv9seXWpZRTyBIvuM1avXSnJ7G9yH
	vO4BuXSaISU1XKMmLrkojrDyCZAHPQP+SFHu3CEUVrkFTIIppo92MboOuQLdWUvf62KWZQqcLts
	C/R2WJ8k21UdRLyNyF9sc0OXVDf1QA0FljqTyRNsPLUxnV/rsX5C1LfD5CVdxG3YQ5VqtXjBF7l
	DbdHnb0HGvpdBg7/kYhQxL3Nv
X-Received: by 2002:a05:6820:20e:b0:694:9bdb:596b with SMTP id 006d021491bc7-69c942e59f3mr3268098eaf.17.1778860897289;
        Fri, 15 May 2026 09:01:37 -0700 (PDT)
X-Received: by 2002:a05:6820:20e:b0:694:9bdb:596b with SMTP id 006d021491bc7-69c942e59f3mr3267996eaf.17.1778860896410;
        Fri, 15 May 2026 09:01:36 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm15135743f8f.37.2026.05.15.09.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 09:01:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Add Eliza CQS EVK support
Date: Fri, 15 May 2026 19:01:10 +0300
Message-Id: <20260515-eliza-dts-qcs-evk-v1-0-7169d78a33e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEZDB2oC/22QzW6DMBCEXwX53JX8A4TwKlUO/lmnboNNvIDSR
 nn3uoRKOXCc1c63M3tnhDkgsb66s4xLoJBiEeKtYvZDxzNCcEUzyWXLG1EDXsKPBjcRXC0BLl9
 w8KIWx07Itjmy4hsz+nBbme+np6bZfKKd/kDbRsbrXI5NzzVmNCHYNAxh6quItwmeB3nHXpP01
 TpWim85tKMRZjLQoZdGGO6tUP3S7LrkYcudhv8agcaL/oa2dqist51ueL+oPXcj5GYKccJsU4y
 lUQngYAhEIZ6BnLUC6KIXhJgcQttwybUyEq3tF7mPVS8vLX8Dh2Y+w6xzgccCTxmB5nFMZeC1Q
 a+crK1bgafH4xe+mkaiwgEAAA==
X-Change-ID: 20260514-eliza-dts-qcs-evk-7f1419812659
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qHQiyeq3zWEjZvB3X4nGiyc67vuVPOFRQHj9rmnRUTw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqB0NWKLJwv9LFnz6Tn7UvZ/IbmdmJa0G3kJZpV
 1dbTW7oKl2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagdDVgAKCRAbX0TJAJUV
 VqrqD/0cuYuhrx6MEzgHf18ckO0XFRCvqfOQaylKiXIYxc0/pbDeGhgvp1eoch9Px0+oRL1KrWa
 eiLrzFF3vd6wb9v5YjYHLxhNR5uqo5h66thDCumgLGsUFfXtGQ+GqtG5TEnFL9AIGY3ryd8mKHQ
 ZMcIkep29jU+LrHtpIwbai0TpZXHpdr4TZCHv+O3ba2/SNf445C5cPNHNgnwCQzg2/JAqapeWc4
 zWsbHmBwu6vhTVNc8L8VIqsLuytFMsxqebXyQHGxrxAuyZhzsCsTF8mvifRrhDJWDYOPizccmMf
 A8MCdPLActT9nM0akqzqD6DfQO3MgnMP6omTdBqRrVN1npf/XJR7Z5BBew4KprVXj+YF11uxrtP
 8P4iiyfIuemeOl+CiORWPRU1wsaaQx4GXafffFttfmna6LqYoObU7x1Ulypu32QX/Clg3dBn3Z9
 /m/h1z5jb3T7nlbYUnGW56DfbPpQbpQQmEeQ2uwOqDaHqQNEGMZOMFWTzSCCGnI4Dv0LRepII/9
 9jD2I6zp0n6Ln3GNygLgF9K7Imj10J/EdOK6ZbzSdlhpeEdA8/bsf1B2SjMD/Cqed7ymiFuavFy
 TSmU4JWE3wiuX2wmnmiY0xKSQOmhMvjAfDiDfg9vHxeuULOKTgpo13juBjsYa1qpLOMufHQ/OBd
 iiPO1sFbaqidigw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a074366 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g0EI524gLSW0X4iSaSoA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: MAX1ZuHTvMIvZOYGg9royZ_QFOJy5cZd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE2NCBTYWx0ZWRfX7nvqqwyRI63M
 /YlYJKIPPhE+v7w5RWAQcJihKZZPUIndUTz7elZF5lFMFPbvbSIejNA1IagM2ii4s/Kfuzx8TrG
 eGE3ZaGcprF+zY2xNv9t3iO83ramYuUScX6V6wH7bzYvqe2rh6Xz/JHL6q//IksIl6sGnAuUclO
 pY/l6FBxnR4y+E0t7nmLzXd8Kg9NHF0X1aBI5fiFbgldhlaHlT8a8d77PXwDhkOI7J2YrPS/15I
 eZYWgLEdDPrOckRkvK1S/+rFzANw4s8d9j2OjX3ILYXFQnj7qDLrVUsX6y9iADjHV9iAFUkNSU7
 0ngpgfEqD0y8DfWL5KMdohIJGZQioWpeOhIGMybB4LsBig8aLLxk4SwIFy+ZbfXQ1D3W6IweClv
 +hzOA4WIxxaG53XP8cs9Aaj15G6rWYMgmUQgrCdOJRWiLAu/6A4LbtI1jTx27ffgsVlcEVnHUU8
 HJ4NU/S83ROh1vPg5Kw==
X-Proofpoint-GUID: MAX1ZuHTvMIvZOYGg9royZ_QFOJy5cZd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150164
X-Rspamd-Queue-Id: 399D9552CE5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107950-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Eliza EVK platform is built from a reusable base board and an
Eliza System-on-Module. The base board provides connectors for external
peripherals, while each SoM variant provides the SoC, PMICs, LPDDR, and
eMMC.

Add support for the CQ7790S-based Eliza CQS EVK. The series introduces a
CQS SoM DTSI with the board clocks, PMIC regulator supplies, ADSP
firmware and eMMC wiring, then adds a common Eliza EVK DTSI and the final
Eliza CQS EVK DTS that combines both pieces.

Do this in order to be able to boot to shell with rootfs on eMMC, on the
Eliza CQS EVK board.

The board compatible strings are documented by the prerequisite binding
patch:

https://lore.kernel.org/all/20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      arm64: dts: qcom: Add Eliza CQS SoM platform
      arm64: dts: qcom: Add Eliza CQS EVK board

 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts  |  20 ++
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 388 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi     |  20 ++
 4 files changed, 429 insertions(+)
---
base-commit: b462608de92a7cac450781f9d8d4c7cf3ccf82db
change-id: 20260514-eliza-dts-qcs-evk-7f1419812659
prerequisite-change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13:v5
prerequisite-patch-id: a457d339aa64967766ea88eb05aa65a4747e1022
prerequisite-patch-id: 04af1479b04d515ced835504144cf09381471b85
prerequisite-patch-id: 480c23fcf537d5ae69214f0aabfcef11418d37fb
prerequisite-change-id: 20260327-dts-qcom-eliza-display-64de3cfc8a50:v3
prerequisite-patch-id: 827ce662558e6c9669425d70c563a44f0f89675a
prerequisite-patch-id: 9c102d9b419548ec7805fe87bfa0ec52272166a7
prerequisite-patch-id: 9190eb29bb9822ac57b9f3a2d6ca20200f8fc9ee
prerequisite-change-id: 20260512-eliza-interconnect-add-missing-sdcc1-slave-node-65020a3b2ecc:v2
prerequisite-patch-id: 2ba90a6d131ef9f0065aa7d4e855cc93d1e97fce
prerequisite-patch-id: 38ec6b086b5d9e602865adb1c0ab30d12304a5d4
prerequisite-change-id: 20260513-eliza-dts-fix-debug-uart-and-more-support-fabef3d24cdc:v2
prerequisite-patch-id: a5535fbaa3699a133dfd13cfa9a2a74b18b46dd0
prerequisite-patch-id: 1b4e40eb33adf28c8b6105f25f6636f82239a962
prerequisite-patch-id: 480c23fcf537d5ae69214f0aabfcef11418d37fb
prerequisite-patch-id: 827ce662558e6c9669425d70c563a44f0f89675a
prerequisite-patch-id: 9c102d9b419548ec7805fe87bfa0ec52272166a7
prerequisite-patch-id: 9190eb29bb9822ac57b9f3a2d6ca20200f8fc9ee
prerequisite-patch-id: 2ba90a6d131ef9f0065aa7d4e855cc93d1e97fce
prerequisite-patch-id: 7dd9c4f27c461e52a096ceca08427a724c8faa6d
prerequisite-patch-id: 91a4f29e0cf69b9cbaf243ac312b9b2f34596c78
prerequisite-patch-id: 4792ea10ca0ced5dc906080f571d54d6f4cac526

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


