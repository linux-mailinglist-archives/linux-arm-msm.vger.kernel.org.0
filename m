Return-Path: <linux-arm-msm+bounces-101535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHqDJ/RXzmnrmwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:50:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3B73888FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B19C5302AE2E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 11:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBD43DEAFD;
	Thu,  2 Apr 2026 11:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VY3Uv9Wy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kHBGwzhH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C51F388391
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 11:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130338; cv=none; b=LBmGVd70Af/nMXgi3WgvCvHivdSmQCOjAqmT8+ig0EZUlwAYEKCiHb7TPWVmtheQg3tcr9XJ/wQTDB9K9LxK6nhtFWHwKSGyVQ7296+Nz1hFByumBkSR2IT5tqNSrXkKL7L02mLCJzF+DUECb4qheX5rOlaTC9r5niMrJ+Tla5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130338; c=relaxed/simple;
	bh=4RtJ3X9urLWVHamPANXERFdnBs08cDu+q9rF8QaPqJg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mU3lQ8g2FtWl+TibWoxFVFEVcESVbMeYbE5qJ/sfPib1ng/DYeaNnXB3MEDTdelymak7HgohhLle2fsrGFoY3lmKzcCS6j/imkXIWrtL1bVlkyDvSnulD5Ox3SCE5c7AC2FB3hWfNoPXLY9NYT8z+SJTYk4EQgBvM3Q7jWcBRv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VY3Uv9Wy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kHBGwzhH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632A5qnn1551326
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 11:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y5+v4Zjh95FklFgUEdPfXc
	2Y9wfc9QEHDJMzJQm9dmk=; b=VY3Uv9Wymapg/G+K2IVYsU9anyyvptSLK7qz1M
	NaL2N8ZIbsmTueS+6iSYDmLkhT5hZ6FoeeqkD2JWXSyHlC3Fg7mU9rejFgLC4/JQ
	v4TUEOaXTzXgs5dOBvjbocMs4LXB6O1YQXikC+B77Nmn89olin9OYryqThcehdgg
	HvJ0Z1fmLO/w3uRbk3EXORwXfl4cBJhTMdISzDR9fB+p+uLsPikb/3ulvP37P8qG
	r2lzAdFVkQMD5B5Jh8YOjtTuivo+ogZzxj/ZaK8eDZy8wIOw0+WP0YBuPRiP3Xib
	nJWOPQnwgqZJqs9JYiIQtznbV5XCyxKW60+N1ZMsNWARCjhg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heess7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 11:45:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509219f94b0so23539591cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 04:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775130325; x=1775735125; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y5+v4Zjh95FklFgUEdPfXc2Y9wfc9QEHDJMzJQm9dmk=;
        b=kHBGwzhHng97O1qcI0AyiVTxKmoUVo8fdqEqUGAtDz33giBKuOm5nY5bxj+i1zhPN2
         tdSn5tSk1+S2pcrCnAhUnyAjjw5xf+GRI73zdH/k0paoUjR0Ktjm7K4pvOR1SLSgWNut
         N/URn4vIlS+UnSpfu3V00DhErqwtpTtOcVv/sr1vdylPFGfNb4AJ2r6Q7CfPmyP/81yP
         A+5y2FyqnVgcHYXjseE8pPSm43nqeehqiVneuSb9V9bWrYJUDnV3wsMvY3viuOdyH2YB
         ZOljyuzHp31ZZykBKN7VS2Uh2m5aKiO1QUDVWDKV5ayQ0eAYh9H2ZmX4Inb4U6u04lez
         pmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130325; x=1775735125;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5+v4Zjh95FklFgUEdPfXc2Y9wfc9QEHDJMzJQm9dmk=;
        b=pVMse84cBfGNAcyhciUdHBDecszeNZc8T41HoKJyTQTS5kOJ4zcMelFWY3EKm3ebCd
         kE3D0NzBMAgsykbcKlb3HlSXCDil8a8ftx6b96HXSzPYi0e71VvhqGoT+Oo0V0kQoGkv
         0hTOIgECdRRowOyCZrhlIdaxQXYyKcj9fe8/f43PelSVd1iHze+XAW0QewKZND6sWU/1
         /D99adbaRdZG9IEEeI9gzqjS1dzI0vB+qT2P4NgiEamttjHTs9ziw/fiNbRW+hB+oMHa
         R2q5twVCfYbfef5WpUKSuYMrwtc0oPNff+dxagQUCELu/mbvMc7+JEPBEXmzIFKzt04x
         7X2w==
X-Gm-Message-State: AOJu0YzxhebOcte88EAc9MzmuQ45SMtcjeONDa6RsFGxgyemJo+zvYD0
	nOYQ9rmeCCC4lnoubsiLF60RmFBBPnPJr8Tet8njR1fZm5+ewZNczXJ2+8552G4eGJuoMNOl9ZO
	DEG6DGWmqp+bPYitaQMWbCj76XqvBnsHaEOlLYEz2vAsbKioo1BIoUTtrpsoOJlJYQqen
X-Gm-Gg: ATEYQzxD+n6phEaBzXKyI8A1amxZmgi/NztHelB/7b9yXZc9DygOpODw6kj/kHCu2rY
	xkTiAaRiHUMjB7dJiREDzE0U7olDzEWs3IdZwmiBo7Ii31rZP1qhB1OjhPsirDkg2+WSSvzdLVc
	S0nhGz0w4WQk0d7RFkgDnGvhZVOtSH7BnrdVd0O9oZ3ldaD//D3XGJhJsO+Ke6Pl1uhDq0yf4jq
	YmV+w6Uc+0BiMkeT/YlPOHjzNqqN/0CHQjcJY/Qqx9GSUa5Fuu74qrUKpYWFxG9cuzgl5o/6OJY
	US7Qn42kWjMuMwzMo8YcwVdz2y1tANwzLI98TBS9eZG5CzZU8eNb1l9paKBg3Pt0w1VOYppk0qj
	zT+9LFcRontecj2ckf9GQua8BFK5RVcbdY+8DjT//knia
X-Received: by 2002:a05:622a:9d7:20b0:509:1dc8:e9e6 with SMTP id d75a77b69052e-50d4ba33ffemr33804771cf.29.1775130324909;
        Thu, 02 Apr 2026 04:45:24 -0700 (PDT)
X-Received: by 2002:a05:622a:9d7:20b0:509:1dc8:e9e6 with SMTP id d75a77b69052e-50d4ba33ffemr33804351cf.29.1775130324469;
        Thu, 02 Apr 2026 04:45:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm141614635e9.0.2026.04.02.04.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:45:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/7] qcom: display / dts: Few corrections of address
 spaces.
Date: Thu, 02 Apr 2026 13:45:11 +0200
Message-Id: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMdWzmkC/yXMQQ6CMBBA0auQWTtJpzHFcBXjAtsBhyBgpxoI4
 e5UWL7F/ysoR2GFqlgh8k9UxiGDLgX4Vz20jBKywRrrzNVYDEnx48c3BtGprxeM3CoSBUc3cky
 lhdxOkRuZj+/9cVq/z459+s9g23bLsLYFeQAAAA==
X-Change-ID: 20260402-dts-qcom-display-regs-11d61816e172
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1457;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4RtJ3X9urLWVHamPANXERFdnBs08cDu+q9rF8QaPqJg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpzlbJXXW+K6dditLlEMovL9DdkbYs3z2C01oPp
 WeCIOPxPESJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCac5WyQAKCRDBN2bmhouD
 1zotD/sGZigVnivjw7TmGHtsengJ6zxMrySAYKWLRwprUUV965Sky1jj910WMb0Lg+VpsTVPNMv
 ulRb1hDT0VZ/4fiX76b+5DX0EMVOJI8HGu8PnGl2yhXK6yc/p4jCguctwovS5lOR68APakxHyRU
 6G5KXH0N/TKogzOe6IV4EOmKKXYd0XQmE0dUHFQ81F9XPgr1wklYuH1WclBjq9+prMIWdajeZW8
 xoUgXfSp0Jd4YN6EvvgRxTuDa2k78EdTHfpK9i6xHDG2IYCs3BI8z+cNwJMPIzJhz7tqoLRrO8N
 vMv0wkfsprhJEIwZwjJnzuffp0M6zwTXiwvrkgImSC5GVMC5XFjxgVBeaivryaLYd7XVIXqNIH5
 bkLUYobAgf6ORS5RoeIbnMaNzQpsf8hWtIT9CPtAY2wy/CvdTm2ij7NpOzE5kMisZAYT+qWcsYX
 yNyduI4FDfXkCVX7HZDMY5C2Na3LK1SNU8lmUmRPQHi/rmrgXclcKXny2U2zprZhx4UCo6x1E85
 9aulgzjSc/rSjH8cezL2BkAle6jJBxinJ6NrjLDT96sIepmSJuzG4vz3GecgNRn5lyuIB5VbqrY
 IoyBQ67gjS6i1zKNQQqa4uxoalqX6bCRXaMWI4IKMhkQ5HRERivuAAceX+fPXWmJlcRZvlMn0Vs
 E3Gfk4290VnP6FA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 2szoWk36ofWICFhF5eokgDKdKwnj_t5G
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce56d6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8PK1uE_par-WY5z1x_4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 2szoWk36ofWICFhF5eokgDKdKwnj_t5G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwNSBTYWx0ZWRfX7zuh3YhTixgI
 kTgTMUi5BQWPLdN2/POZ9Xs+317fcQ8hEggUgtwp5Dt0nnyHXUmdSvMajI/hfzEPAc31+iXvfG4
 3SnNP6r9dOHaVT8BTub6Z3yEjgFL9GczuQsNGQ6wCRo/doWTFV1yuQeDmb/u28Xpv9tmUEwh8iq
 Q+GJiRoOHFpBgjcs4Dc1srLb6tIf884XR+fE7fMc4o2cudcuQReAkzBwEEPyboWnQ7VW/H+EXpV
 EbK2EnFvEq5nvPxVVCTkabjna3+yttdmLy6BbGk3FtTx6UjU+oUdjik6690BRFBm5ZdLwpziWw1
 P7x+Ci4EfjdIf9udOZikjnpXd1yKbp20EptNWYMPR0u1i0mCBKiMaf8XoU5RE6dcmWsmpH+D6T6
 HXT6RuQxdvAX/lpYHioUYvUBDPeAjeL6kebs7AqhbUACVz0pad3dmb/6N2jZ0GYR/5oCKJR5hVz
 n65v5uLGd7gXvGFe4FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020105
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101535-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC3B73888FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These do not have practical impact currently, but make hardware
description correct.

Patchset can go via separate trees, but DTS should wait for bindings to
avoid new dtbs_check warnings.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      dt-bindings: display/msm: dp-controller: Correct SM8650 IO range
      dt-bindings: display/msm: dp-controller: Allow DAI on SM8650
      dt-bindings: display/msm: sm8650: Correct VBIF range in example
      dt-bindings: display/msm: qcom,sm8750-mdss: Correct DPU and DP ranges in example
      arm64: dts: qcom: sm8650: Correct and complete DP address spaces
      arm64: dts: qcom: sm8750: Correct and complete DP address spaces
      arm64: dts: qcom: sm8750: Correct DPU VBIF address space size

 .../bindings/display/msm/dp-controller.yaml          | 20 +++++++++++++++++++-
 .../bindings/display/msm/qcom,sm8650-dpu.yaml        |  2 +-
 .../bindings/display/msm/qcom,sm8650-mdss.yaml       |  2 +-
 .../bindings/display/msm/qcom,sm8750-mdss.yaml       | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sm8650.dtsi                 | 14 +++++++++-----
 arch/arm64/boot/dts/qcom/sm8750.dtsi                 | 16 ++++++++++------
 6 files changed, 50 insertions(+), 20 deletions(-)
---
base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
change-id: 20260402-dts-qcom-display-regs-11d61816e172

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


