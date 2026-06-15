Return-Path: <linux-arm-msm+bounces-113117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b//6Mgq6L2rMFAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:38:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 613E96849E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:38:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ItH0BGHk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GlmMJmg0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113117-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113117-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3ABAC3016D16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48143D34A6;
	Mon, 15 Jun 2026 08:35:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB3A37DE83
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:34:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512501; cv=none; b=HFHj3GoTruzCZm+LQR3NpokYG/CAm3/j8BIesXSnVIo+3aUcbVTGT9/DZnWflzeiBbURvUJfuW6i+ENlt7/+2WttE7CZlGqQ/946uDqjrG8RrU9R5rEbW++6/0nxC+sLtKTVUmbAYPanMruRn2mDIlEAz5Z08Pnwh7fI9U7B/Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512501; c=relaxed/simple;
	bh=86sXsUvCK/NB9tywTPkpmKSS/j4crBI4S0ZLvrfM82s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=evCmzRY++az6Wf98v0CSReoIXW4gIw58dNm1JhSeh49B00MZqGBMZJfzHwDrFY758x3IkM2YOb7Apps+GxD3re6Ht25ExDGFtAivHkvm5GJLznMoQKEXn1j7YyqPFq0q9gNRltSBUpFiinpykUmIJYKKtB1AQ635guZtSycUP3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItH0BGHk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GlmMJmg0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J9sp3250412
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oJgy3DNUy2GB+MmvGxEQQo/FlAt4h4kNu4Jgs7rdybA=; b=ItH0BGHkBKyR+U5m
	x3wQnYg0Z0NMz//fDUahmabf1yJfN9UNQHd+Uqi1Ob5MD7+OxcBP7pJ9ab17wwsN
	sgHuUPt7tmzX3Q1TYNBwHPPIBtUkxjSgFVfqFYhd9wsd8vSv4TfnPZSZdSzk98tS
	/WYub2QPRIoKjZF9W9o+Nnu4nF/px1yHSDhTkW0CprlKESgZQH7fvS6F3MFDxmPU
	AO72m3BfbGOnMADgsPWgTpIqKxY9Ac5kioHnC+2oAnZLAL5XZMecRsJSH/NxRiqj
	FuZi2h2BXvMkY15+yglgc747bgmvJT9rW0d6vQwguu1p6Q9yPKl23OdRnWGtf0KZ
	BamU/Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryybxb4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:34:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so52098415ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512492; x=1782117292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJgy3DNUy2GB+MmvGxEQQo/FlAt4h4kNu4Jgs7rdybA=;
        b=GlmMJmg0Rc6CyTiUjsuL/u9JBvBW687GcoVW7NqLjGJUZRQ6sEK1BW6hltOHW59X9Q
         I//joR2CwScZTeYBllIWQxTbWo3zTADpgjWTwn+y1q7im1gT78bcfPzZ1ZCp1MwP2Lc8
         /4aJLErlAHoexqqnhOHSmlpolJo+bBs23mc0CcMyeAmSoM6PiM0xOu332ELY+y9KLK4N
         /2Sik0QqDSHhvMBZlDevmIAOIypYW1UgqdVKUWlBoTs95wh+EKNBYRVTm4OhpPUBZC4e
         5Ovh0Rp3wexVRlp8bH6CxRLwpyppKjs4PmHquEWatSWIEbSyHCKR4wsAByD9WlZtYB0T
         l4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512492; x=1782117292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oJgy3DNUy2GB+MmvGxEQQo/FlAt4h4kNu4Jgs7rdybA=;
        b=TB5VObJfEV2pRAML8bVGZVZrXZo9Y1kKrfggwk2w54vbf/Ftv8WK/lWZ8npKQJHGJn
         nITfEuIOA30p0y1QO3w3bRG3FjacQJSbshQCcXt10pGqmxzk7WbFWJBa/awE5Pri3mu4
         cVoX9neuadQyXS7+9pC9dcpPasArdA4Wf02kVCZOoKpsw5mq4NlbOu4P0QxBa5lI0ykL
         lCcbnGqbCDVaZuxcvQULTq7ey5z3H0yficYlcudTNoSbz6c9wYXfsVfj/ARiroTZ/G/Z
         HbWAmcOL52I9BuuTJjs2ZHNIHFecwJfrir5l4+i1Eyy5ScK5ln1l3ntmJw+IHApmd9A9
         4BvA==
X-Gm-Message-State: AOJu0YySIcyLlkTLlH+kVGa/fSpDzlhxm4hPPdbaqL3PtZerpybbQ+Ou
	ZXLU8lhX7rhzemAlgsVp65bQyso2raVPZti4vxgpx5PXy8aHM41Ea49Jq2uxMVAxuCgTS3shzMJ
	mMhexx43IFffz8lN/96zB4m6L4SuHCPh7dy8mGXPazCqYnn4p3QVKgvytqk9i/mtVpr1R
X-Gm-Gg: Acq92OGbrmxcNLdf5jIw5NEc9KoWjbDFudhYqSjgL5ovpg5EjV3WGT8wk3Ar7FUgtiP
	Ream/OZBP84lfKnoXOwy5xVcMsMHhmuo7U/PUXrthYHb2GDmSUnoJVOoMDX9sefVMOdsWxEvGOb
	oqxBUrFyC03YS74gWuCrVKAh2uGanVcNqWx48LHBBfpIaVhTTEVsxWLoREJ4OITdvTeu2UJnU+a
	84kzqnrMRuAiDo3+9r8mWYKUf4COgBfDaPbcra00DaPz8LdGs8O0rYIFxZag5/FomGyxDcWvzyS
	IWjqRMd9dn2q/wlCLjPUZjome/6Piah66F2z6DDPx1cFJ1GbVPhmD5K6y0tskl+osMRx6oxRkLP
	lHH64MWK8e9QT/izTuqy4FkiJ099ye4jIl79tgbgl11LZbaa6zhEs
X-Received: by 2002:a17:903:2f0b:b0:2c6:9448:363a with SMTP id d9443c01a7336-2c694483867mr7693505ad.20.1781512491825;
        Mon, 15 Jun 2026 01:34:51 -0700 (PDT)
X-Received: by 2002:a17:903:2f0b:b0:2c6:9448:363a with SMTP id d9443c01a7336-2c694483867mr7693085ad.20.1781512491308;
        Mon, 15 Jun 2026 01:34:51 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:51 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:59 +0530
Subject: [PATCH v4 6/6] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-6-bcb51081735b@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=3663;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=86sXsUvCK/NB9tywTPkpmKSS/j4crBI4S0ZLvrfM82s=;
 b=AFevhZYVm8Sy6eMT0e5zugn9wRNuGPmB4Eb2NMT60RbAak8HDv5GHGmoVsN1fBNKodTiSyOya
 O3sH+ge32u1B7ZJY91uPTVO9Dt5/+Yx/hEqBlRJY7ICzkR+Jcbv/pGb
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: rEk33Bf4x3VsrW0ShS44akT5rUNOxn6J
X-Proofpoint-ORIG-GUID: rEk33Bf4x3VsrW0ShS44akT5rUNOxn6J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX+EHiuiv4/jHA
 o+kJi5CGuvEHOKENzASEyQkuRramuL6QBnma5UqkxpFsGyw+3YU3kkLswOOTC+Z+K100zc++UE8
 hc/w6hfZUasJlsqYIztxzds6kSp+vhM=
X-Authority-Analysis: v=2.4 cv=JLYLdcKb c=1 sm=1 tr=0 ts=6a2fb92c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfXykshA9CzKwt4
 aTS/PIGaL/lTqujq5kfLCBQg6Z0NPBcy3nfOb0YmaBiUgG3yIylwsfCV25LvD0vF6JQSgvOg5ma
 AYYubOLALAS5Pddpp3CuiXo5w6dcaIuNnTSzkHvfHRXW915B9ZqTdXvmvwC+9/OJUmB74kXuINR
 wK0VJLbRF3bIBuMrDnqS4HbvHQpQ3ZDBxZcdYgjBj0N/MJM1IVEWaUB4abLwvSEJQUNoZ/5qUyR
 ZFbBuWK4jv3MX/fHHFI0bkG3Eky9XBX9NHqu21YVCSMWQJuUuG86nb0YznVA2EY0TMpBUL7iH1v
 JEpjai2L63z4WryTbg6URleI4gYRdFw/yJittbdSuxECUwD26L/87DA32Xpd0ty9f5Gf6DgUFz9
 aK8kFWK5B2qATkPTR7ntCpjKMSJPfEcKyE4qNtf1GqOgHH7VGGLw/UiZJmFOXUFC8i35c+6tl5U
 48/hyc5h/xt/8keiA/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113117-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 613E96849E1

Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
different CSIPHY and sensor supply rails compared to the retail boards
(CQM and CQS) which use PM4125.

Add a dedicated overlay for optional IMX577 integration via CSIPHY1.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 79 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 76b8f144983827f4905a72935e8d5291a227dc97..09f2318d1c12c4239a6a7bac4ecbca38eb65ffa2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -340,9 +340,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..d8c968a918c67cdebc0e7c6fc14ef820c97ecb75
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&pm8150_l11>;
+	vdd-csiphy-1p8-supply = <&pm8150_l12>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		/*
+		 * avdd and dvdd are supplied by on-board regulators on the
+		 * IMX577 module from the connector's 3.3 V rail; they are
+		 * not SoC-controlled. dovdd (1.8 V) powers the carrier board
+		 * level-shifter that translates CCI I2C and reset lines
+		 * between the SoC and the connector.
+		 */
+		dovdd-supply = <&pm8150_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam1_reset_default: cam1-reset-default-state {
+		pins = "gpio33";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1


