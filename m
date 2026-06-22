Return-Path: <linux-arm-msm+bounces-114059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uS32LZDFOWr/xAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 01:30:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E456B2D35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 01:30:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jNelJsDg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ISiB83HP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114059-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114059-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EECDA30409EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 23:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97A4372665;
	Mon, 22 Jun 2026 23:30:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26BF363C7F
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 23:29:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782171000; cv=none; b=mT7UlNWdSqcMMf7Xwyf0Dh/vO1DHMQtenyW+2HiEeX7CddrlbhY+k6q6ZsA2yddJrHYN5qFYZiDHZRJNS0DeVVoFCEwBi3qmUuJCK1UVwys7oUbA8pbegE1W1JB1hsS6THb8EW3qv/djdtxvdU/9C1Sswexb1gSwYLRPIdu1y34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782171000; c=relaxed/simple;
	bh=xEdhdweP9/D/8BRQtRt4Q0QhNc0Omxcj7qBCNRG+KyA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=etXFB8+UfK/nBewwrmz/bihSlQTZ6rlGEqS5YBWI6nJu34b9zCnflbovBZTwxAuxndEbrHSvRMp0pnFTC/M4lBqc7pIK26k9Rthi80QxeYwE6mQVW3B3+EzghLbtK2McxIFt8gn3Axysc5LNnQswGNzL9/u3Ut2nYOofUNcyOoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNelJsDg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ISiB83HP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MJceXG1938783
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 23:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=euBB+DSsuvbU95CYN+XIxM
	5Maw52qyc2lYtpfvGy8oA=; b=jNelJsDgYeCo/18MLbxBAGpRxoviV8j1aL9bZf
	sCbbb5TSgNG6tgP1AgQiM0WNNfJb6dqFhItqeVXeUjCflX6YiFXiDozNl/8OidK0
	FiCoEVLRphNXfmLAo6vR8yUhG8uQ9HJz2UVLNiZbjdmzIGiznl7QSwuLULsPCXK1
	01A04GBFrQaaM8u23gyCicZtpaOy9mHi9MRmgCHAz1nHpsimWrRwPr3j6/92H7xj
	9X/4zE6EyRX4fIzLlgdp0hZ6LY4ThtF6/UUML7Fnwcxb2IDQ6ozlHc7SVDec1aab
	YgTLhBToL7ucZcJCX5Vz9tlcRZVHT2coduIt0vYQxlyWYSlw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5yea26j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 23:29:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so6900376eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 16:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782170993; x=1782775793; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=euBB+DSsuvbU95CYN+XIxM5Maw52qyc2lYtpfvGy8oA=;
        b=ISiB83HPBij0I9zxXExYuNRSWM7kTXSE4ZcD4XdCS9J+/YKiPaSGsWJWEMLFrFfyQX
         9ot62fPvkr44vzlwrZGCDqFVFhabnzbIMRFPuZ53gNgts4xXoKczz8bobGuLNdD4/uFy
         rOqXGn0rizZZ881gjBzq5tXaz2AJ88X2jOvQc6J5xZyRoYa3fzJlQiNeCDWlk3/jjuce
         G3aZSdMOvOtLBhlbtlEeZrg3A50iSwqnKACUbMZ97g1pWgCih925JAD94MTdsoIDLazd
         KKNIB1A270LXBg7pBgilhvmx7dE47ioxAUTXsvb1MWoeMKXPCvEKZ9T6Rwi+8C0sOO3b
         baLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782170993; x=1782775793;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euBB+DSsuvbU95CYN+XIxM5Maw52qyc2lYtpfvGy8oA=;
        b=HLv1CL71GIUtyVCCI1MPx2sTbmDBNFnySVLrQkOeK7BA4/Lu7emWKz9Qk3ktZLcYND
         pqhyqCa5hIvOsJP61hfxbS3wA7pJL5mtL+6J3WuPHHpxL+/m9A2Vv0OJTavhvCooHkoS
         w7jhaq5G9FDjsqVsv0AOzeF1DjNY5vdVWF3+upsmlDph6BGLE6VoXsKpQLI9mtGiNOYU
         6dL25XkSfk0PgKKvgDcviUIo+7X1Ve7w4bwX52XT+d4JuMA+LtojnJ4iKEhWQa3ABDoq
         UuMtUajt0Ha3rgLis0Y/behh4phj2M1tXXJ8cTLfZ9AbDl9tMCU0zWjMu14vHPZIvsuJ
         GXuQ==
X-Gm-Message-State: AOJu0Yyj14JQBNeQ4E+McUlaPdaHpElkzmERsFTSG34+Q39Us8tjFTdz
	dRgiwm2g19PPcNH/ANyz0/MLxhWlXIGH75Wx/P5BOXgFtGvtLfPkeohDHAyUSh5rdlIyZqn/0FT
	GmVDxKUEHcogi4nGTWrF8n63rIQAYo/SssE3t2l2LKF3ROivrUD4G0uhMXYq+KjaxsDzQ
X-Gm-Gg: AfdE7cnW3hviNUKiSvradbWeJumWi81TkiPrIrzi783YcH5E0099swO7kSiyCo5i7Tj
	377MOohPrOnNk37B2h8NpNIc0l6ezNLNt8ml+J1H5vF8HkV7mFTUicEgVjkZlUWjK4vdiz3O5lw
	IwEY7JJGf2iAPdNAktL/GmzfFHEufowRNP3AWCSQNAAcPAmoAe+2vQe851AlzP6sdznBEmiwSnt
	2o12OhBFKHGIGyWMAPqiE1fdZK2GRhYbwLvoxccRavTUZsjAr2bkyrcMkuvLNmvSXyZFR7fvjnJ
	gxaRm3obAnwL8skbOAdBDlcaL9KjILJuxMimehcOPexkrhHGMrgZb0916Lsgbo4cbSbIvP2gUcP
	cBkFDtfuThiqXWnHpQRzAa7565GFIzFIN94/ewaddw+Joq2UdoE4=
X-Received: by 2002:a05:693c:25c8:b0:2fc:9ae6:e5a8 with SMTP id 5a478bee46e88-30c58b5e602mr486649eec.20.1782170992739;
        Mon, 22 Jun 2026 16:29:52 -0700 (PDT)
X-Received: by 2002:a05:693c:25c8:b0:2fc:9ae6:e5a8 with SMTP id 5a478bee46e88-30c58b5e602mr486629eec.20.1782170992202;
        Mon, 22 Jun 2026 16:29:52 -0700 (PDT)
Received: from [169.254.0.2] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba8fb35sm15339727eec.12.2026.06.22.16.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 16:29:51 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/2] phy: qcom: edp: Update v8 programming sequence
Date: Mon, 22 Jun 2026 23:29:48 +0000
Message-Id: <20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGzFOWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyMj3fScytzSIt3UlALdgoxKXZM0c9M0UwtL8ySDJCWgpoKi1LTMCrC
 B0bEQfnFpUlZqcgnIFKXaWgBZy5pJcgAAAA==
X-Change-ID: 20260622-glymur-edp-phy-4f75f5897b0b
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782170991; l=884;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=xEdhdweP9/D/8BRQtRt4Q0QhNc0Omxcj7qBCNRG+KyA=;
 b=UVo4EildyTo8cIZd1ChTCoMuHKuDkKqfJvlkbmjywjHbjlNZ2aCNKBe2pVRqZNuzJmvRWXifL
 5wZWxDbUG1NB5kVQsowJJ2pEdW1cfskCZnnw5vgrqBgTqE0yZ08gXN7
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-ORIG-GUID: 5N-1Sqp5pF77vE_33d9izZfMyV_i2SNc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIyNSBTYWx0ZWRfXyatPK3M+pItx
 PU76FD4cFYn1pP71bt1DEwtasb87eQq5xuP40NCCdyM4HZVEBxrCELrBdJUG9Af7kky0gbHPVzL
 TWD+qqCQQ2F1pmwjxrO6AjkIh7L1oUo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIyNSBTYWx0ZWRfXxklMFXKDStcK
 tpIRYLVsDvWxAyLKJrmCJdkN0/0pir+SoMwXGc+e9WWvDQ3HPWheFZAOsMZ3lnYldUj38PzqrXN
 hAJSjG2GwHL0RM2J6rAwZiYkXf4nuY+NCHz8frRFTIFXUq2vJcJomgi6eOYujVnIYOuqg+VsJPB
 Rda8s8w06g26c9hMen2fJCXuLJcmyTY6mJ2lpIr/0zeAW6AlWF9Bn8Zs/InzoGHMWTLhNIrIKa6
 cz/5YvbkNXOCHXvL47ZfvmcX+qC/8XpDkclEd0mC7gGGbp9HumyWsozPVWofLByKjs9OqZpqgBt
 2ZV55Zr66VJ7Dxe9b3wFDdjOqTDY76oYSkeOBdn2ZtqZpf0QBtEtZcgVF+RotHJvAHy5Gab1Uqh
 jx7l6jDdd3Xp6WdxKe9KYZWQUl6mvhs3Iu4VDEuskPNhLCNFcBjVeri1GX1buxAeIePyfSoUrT4
 C6lLj/tw/BMwF67MUgw==
X-Proofpoint-GUID: 5N-1Sqp5pF77vE_33d9izZfMyV_i2SNc
X-Authority-Analysis: v=2.4 cv=YpI/gYYX c=1 sm=1 tr=0 ts=6a39c571 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SSnYddtK9NkD3JaiHHAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220225
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114059-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75E456B2D35

The programming sequences introduced for v8 doesn't work other than for
4-lane 8.1Gbps. For 2-lane 5.4Gbps link training fails and for 2.7 and
1.62Gbps PLL lock isn't reached.

Update the driver to match the documentation (and Windows driver for the
1.62Gbps PLL settings), to get past the link training on lower
resolution monitors.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (2):
      phy: qcom: edp: split power-on sequencing by PHY version
      phy: qcom: edp: update v8 power-on programming sequence

 drivers/phy/qualcomm/phy-qcom-edp.c | 575 +++++++++++++++++++++++++++++++-----
 1 file changed, 507 insertions(+), 68 deletions(-)
---
base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
change-id: 20260622-glymur-edp-phy-4f75f5897b0b

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


