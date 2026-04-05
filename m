Return-Path: <linux-arm-msm+bounces-101854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZBDyHS1m0mnMXQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 15:39:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AAA39E903
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 15:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7EBA230022FB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 13:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E72125783A;
	Sun,  5 Apr 2026 13:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LSl7b1Wy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WDa0dKoE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2311B424F
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 13:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775396394; cv=none; b=desgLtvjG7SGQopZfZZ3l/FfUTa2Olue0XcgPdPcht/tcTS2eHolixsAcbR4RomDYNf/Qzt5c+coBx4d2vTaNCQ30F89HIO72tV8liY+yBb7g4X/Os6hCTCI/+fAwAUFOwdUeWQGuKo7pY57sNMTUtQZYUhyS9lvMtRx5DoeMD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775396394; c=relaxed/simple;
	bh=c7rY3U0BLMnd4dYyq/r2WxlPYv4rpgM+0iuLRQlkkBo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u7AFxgk/omHidBXC1qQfutnsmV8Pi8FyWciWZh9S76w1pV9T3I7Uq3rhrnm8nJFKDp+NwdUEECn0dCIEMAsYLdaDF/hhzykQIXKVV6AwnCVS4evN2TUByqZHYWR1f8IZAdGzwkpv+r5ICQO1hDdBwUVvpvhLSULz7/no7+wGjag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LSl7b1Wy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WDa0dKoE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6350wioc970459
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Apr 2026 13:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SfXQph7flkBlqH3cFKFOPf
	2eupXzaAVvoBnn0RCc2/k=; b=LSl7b1Wy0l7YxfzyS4vutwx3yZVwtAXkvpnc2r
	A8yEiHgVk+eVlt1Tb2nK9bg0mgUsS3+zU04zKm7QYM0ukjz+pdE6TLQ1ymflmJmZ
	CVUAz/ss9AnhE62LZpDiJQbxNQTQopfdUdzU92zBZx0oV+e0bZieRIM2bFyLIH/x
	KDD7WEIx4kzGXeuh4T3xZSfRlj1b8CW7aEIIxgd4KIqyZfxnGljIWim5QbUxubM4
	rEIs8ivjHpsx29Dd8Dqm4oYgfwPETjj8Z3ZPeRdeKx8Q/rySXXxHeg3zXTJmSw8Q
	NcnUZVL2YGyh6keInNhhlykT0zYBvtIWRVrKwMVc/8STougA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrjp8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 13:39:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b44f7b7bbso101676621cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 06:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775396391; x=1776001191; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SfXQph7flkBlqH3cFKFOPf2eupXzaAVvoBnn0RCc2/k=;
        b=WDa0dKoEQeVT30lqRFootWObhkz/OY158J8PHdUhTc45Kek/XPSy41+ZAecAq1uDRB
         SCzll1cTJc4zYqKuJUsyeRUQ6VN6VeKnSmKhKaAjirIKAs3Ww3p8xGZkdKuCNgz55zeD
         QoG2kZGwysILMCAWri435u8xw8VALh+vhDMC0bsgPzbIcDaXn/iRO4kmtG06ExX4Sk6D
         jZbZtxOqbYKxzKXhbAe45uTRDpc0Gl07plVV2HJ/9qAFj9pQ/73rWlNYfvVAdKalPKCH
         PyD0uaE3sQpsDgaSbZyOLP3NQRZpYL5lEO4s0FazQjX1b61xFNw1c2t+GM+5ygqnbFx5
         G1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775396391; x=1776001191;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfXQph7flkBlqH3cFKFOPf2eupXzaAVvoBnn0RCc2/k=;
        b=rdsUz95Xc2RAg2PB72WMiOzErqNJLz16a93SjP7Mbvz6khG0nOdb4nJ/NnNIoWbGUr
         eYX2dMgJAVXfW/RuHqSw4RW3Pb+vGeJtfZ/L/2c8jzZk2nceas/ejGSrKwB7agBQDLc9
         WH0U0fNyTi77Xs7nt8vLa/SWIMGz0d0EQiszTmMobFHhFi76K3cE685sK/iObeZVhZp8
         ny/5lMe+NrB4t2z8T5qlCuA5RjIyPIxCQYRfckr8FejjHNMIvedaPcDY68Zn/SU0XFbp
         pwScAZ2tl/Zv2GY7TLAkgQTFvx3Y4xa7gY0Cl1h2rkxNwCRMQL7eA+jm4QhMRNMk8/od
         y4Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVu4BAd0Wropkh+jjqXovjPedtvmaXlYjU0V6NOoMMFPc4aowpTT5YuQo9cL3xwSSyz01dunkuDWYpIXiY9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1BSP1SZQM2PD2rOfPLIUaoFdHYZxfeuYkzWWM2bYag/scj3D+
	3eMs054XYBSmiQ98nUn35eyFrcDELKOpUyd+Pywqb4ObIP3bgyRVyV9CwmF7+guT/YVFFWSKIB7
	ifGnHhXnqhhghXfpqSPBja5xQB5I/BIdwxTlPUFZC3q1GiBVncy4h4XuJ7BdZHmFFymiH
X-Gm-Gg: AeBDievbY9jdp47Sm9tCv7D/psEdBBV9WOsr2FDrTf+pjDOrpr1SeeFAXUtpoO2buBe
	691sbrqmbJZ0zLxwVFLQQbkVlSI5iouIlntYzN+Sk02/gPae3ohHRz7z+IDXllUDflGNnYF3KFT
	CKm9RgC2GR/TeCPwERcWI9Tq8Ekz2Q/5tSlXXX3/kMPQ+KsRfzPWUuG0TyuD7VmJI8MZnU6v7bK
	mQprt/MRo9jsRsUVZDrhWRKXtscmhCoWiiL0/5LO8enEwL1RHB6KdPIocWpDiZPIgNRUSK7Dup1
	oyExThaZNadFIBLgIQ2czfaOsFa9p8yxGCUCTVp8V6I/D0g3BDaXwtnlkkghOI4afBffBLS6NaR
	UgNxH0Yr875Mvlz6G4jjSgJIPFxVjoljSZPVvKQ2sTZVK
X-Received: by 2002:a05:622a:259b:b0:50b:37a6:e497 with SMTP id d75a77b69052e-50d62aa22b0mr151399091cf.44.1775396391048;
        Sun, 05 Apr 2026 06:39:51 -0700 (PDT)
X-Received: by 2002:a05:622a:259b:b0:50b:37a6:e497 with SMTP id d75a77b69052e-50d62aa22b0mr151398741cf.44.1775396390574;
        Sun, 05 Apr 2026 06:39:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f1esm32188774f8f.2.2026.04.05.06.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 06:39:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: dts: qcom: Few dtc W=1 warning fixes
Date: Sun, 05 Apr 2026 15:39:27 +0200
Message-Id: <20260405-dts-qcom-w-1-fixes-v2-0-1f2c7b74a93f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA9m0mkC/32NQQ6CMBBFr0Jm7ZBpAwRceQ/DooVRasRKB1BDu
 LsF924meZn3/19AODgWOCYLBJ6dOP+IoA8JNJ15XBldGxk06YIyyrAdBYfG9/hChRf3ZkFldG5
 tS7mqDMTgM/D+iLlz/WOZ7I2bcWvajM7J6MNnX53V5v0dmBUS2tJUXJRUMJmTF0mHydyj16fxQ
 L2u6xfj0/spzQAAAA==
X-Change-ID: 20260404-dts-qcom-w-1-fixes-1a25bbd0519a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=c7rY3U0BLMnd4dYyq/r2WxlPYv4rpgM+0iuLRQlkkBo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0mYcr/gMSmPXWvGNRol16mu0NseH2ycxyQc3Q
 NIJOYq59P6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJmHAAKCRDBN2bmhouD
 1y5aD/4uMr7AK7fVazPh6mrwtm+vO8gjZasCphAKvvVNim6d+YS1nW4XCPF2Rrl8nR4TcCyx2u4
 ZlDwkgFQFnMngSv3cienDmWPpc+d56xZJUbwvFXJb9ytsGnUUT3clQJZdVYTf7Eo+UTCNLE/I3h
 fMuWzMvWt9AyfCUrDHT64wuLK/pszRDTosGInHUjlsngx6MsWaHWXJBaXuujDkzRnscyTgALz9c
 +Hyfd1Rd0uXJOjHJH8vkIP4FMeQg44mPvf9mRPPKFEYD+0bbMYknxrKZsI27RUVXoCy9nZnUe91
 JPnvG+Fl1dnHm1RPCS3g4HfIpk0ErwHijEoof8LMLU8zKpauGrZhfaUpe7CpcuSrtWfhY7mQKyW
 Hwa9PJXbKWTqS9IuSP9AbrMDDOQ8d7CYKpRoFxeV5J5fFdEyqSGZH279gYXI/N5/w5fZi25y41v
 r6OWETfCAnvZiL9uVbrpLF2KW6j2BOd9xLgmqdsD8M6rTD9x1/eU13ZrT9jFkE+xocfuoD7AtGk
 +RuPZsP8sU552F6MWbN12Owb09MD5ZvDA23n4VFteVX42Rre26ZdR81SL6vSIeTPSeExok1HrkX
 934uMbtkMvtojWRgEh5z0N3QEMlzy2DbKbuXEsuCIc//6CkmuHmEyJUH/N6zi+J7o7KU0O6aFU+
 /SUW5fhIZGFEJJw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d26628 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=KhWeNy8F5nQL820tRQsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: MRbbuUmL_mXaIxnTCkEAoQbMVFSJXGmV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE0MCBTYWx0ZWRfX8wUmwqt8gP+0
 1bKn6ry56WVU6gkztcnhONybvDHZ2PO1B56vzi275YKBJWFNI229Nm7PGX4CRun6LLE8YDar2Bk
 hr3R2tILQW9Fb0JXxmeUpabztGNbedYv4EgMnqYgEy+AEAVn//+MS/v3yxHtWIlweZ3URsj3MGK
 XTjm/hGscJIn9oiebL1MFfNz5j0AfWSlKbBkiqCZ9JS2SOXTv8ueyhsh69d2+Uo+c9xLPHRlQPp
 oFhChg12v3UIuhjZc7XMiRxRuBSOXFDh2tDaf274HEDPji4BktckOfnYIeeDsFWed2hVmLRpqA1
 tlrerIwB9B5YyPChMY5x0914nKrGUUhq/r46jrVkK/4p9BjpRfX56vwE6Ztl09tk0YYSYx08wDM
 nOI8PKao8EDA9d2ekJiFRXRhQHXic8dVWaH1F54yCcHoYy/cfGIl7nzf1jgwYFcYpy0+xl4D8BS
 2VjcY+OjIVo2YtmrTaw==
X-Proofpoint-GUID: MRbbuUmL_mXaIxnTCkEAoQbMVFSJXGmV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050140
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101854-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,msgid.link:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F1AAA39E903
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes in v2:
- Fix patch #3 subject prefix
- Tags
- Link to v1: https://patch.msgid.link/20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com

Not marking stable as these do not have actual impact on user, but still
warnings are not desired.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      arm64: dts: qcom: glymur: Fix USB simple_bus_reg warning
      arm64: dts: qcom: glymur: Fix cache and SRAM simple_bus_reg warnings
      arm64: dts: qcom: ipq5424: Fix USB simple_bus_reg warnings
      arm64: dts: qcom: sc8180x: Fix phy simple_bus_reg warning
      arm64: dts: qcom: sdm845-mezzanine: Fix camss ports unit_address_vs_reg warning

 arch/arm64/boot/dts/qcom/glymur.dtsi                             | 6 +++---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi                            | 4 ++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 5 +++++
 4 files changed, 11 insertions(+), 6 deletions(-)
---
base-commit: d0d19917748b2611266a311841231bf635e6d80d
change-id: 20260404-dts-qcom-w-1-fixes-1a25bbd0519a

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


