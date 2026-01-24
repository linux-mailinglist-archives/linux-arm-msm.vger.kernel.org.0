Return-Path: <linux-arm-msm+bounces-90417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kD86KO8CdWmy/wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 18:35:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A64737E520
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 18:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 880C4300405C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 17:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B952266565;
	Sat, 24 Jan 2026 17:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l6uNS83t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtGYccin"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D181EB19B
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 17:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769276133; cv=none; b=Zl4lxU1uYR1cdGsS/3IV7FeZ9ktCIyEhyITrlFA0Son6THSi9iIjju787T9XBEEIRk2C/jMKgHWSTYEeyiVVCj8YTFk5EJBLa0pNda2Ws6/83tldtydxionfiKnMXwIS4qOu6s6Dsro9Ay5+clQGd2v4p1Y+0hdHhxHaDeRX/x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769276133; c=relaxed/simple;
	bh=Fu1xoi9CBY9eiBtnRip104Q3DZqU8QVcRYaJcdPLYj0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eGjQTxm7C6yxCDPB3GlyvVI54XYwCirfty/EQUqbDuRwGcEjqpUY4fv+X1QSLcrzpWcFlZIRvvCd9xjotVyywRQ1eismg0SWhOasqRChm0S1dWwdzd2mh7Ki/zPdgEL+7sISHdvi6TZxwzJUW+0jYfzKybf3HVnUVz74e5jdBIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l6uNS83t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtGYccin; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60O4Q5oR3379840
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 17:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=16G89u6+BhHcoNsBKlpFOb
	IQxZvkHd3dDl4LIKtGP1A=; b=l6uNS83tdTvdTXEv2QkEq0ryQLoLpbw0debpAP
	KaGewFsLfbY4SFznpANcmDVEkIn+sW0m0kyc4IJJKO4BnPDhYTscCGPSjF4wd63o
	o5mlZwyLtGwCG/H1vJG4aNg10crkKp8KB/3kMPb1vbDA1rpG2AEL5Me5aHyALfyx
	JcjINehOFrYUiKBa1zAOrJjBkcBlQ9qR9lTPCUv3Hd0sD64m9K2VqjMSGt/Ie7JP
	9kDn9H6UvD1fewNRRH9NSBSmMq7mcN43EtQp/SNU+fz90jU9twcch78xDvl0mbKy
	nvXRXNdUoZJJNXrqjLeQzrb7RXekZgkJYqEuFKActMwygCkQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq24gyae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 17:35:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f2381ea85so66780875ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 09:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769276130; x=1769880930; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=16G89u6+BhHcoNsBKlpFObIQxZvkHd3dDl4LIKtGP1A=;
        b=YtGYccinozWv8T1/IqoPUpZJ296Hgv1I1/DwaBqX8L/r+ulvPQQVkOjtWI/zEXZDyE
         HLIz0D9cmqYlZwaJGVJ+VPq+OJOc1KJ9+7ejNOfLNwdlU+2SdHBNQRe79X6U2xdQIQtD
         UFmS4nBzfBRtUJUSpRgXuA+fyqczCLpDaemWuyPpyyr0lq2PjG6qhW4rfzInCn3Vp7mP
         XfM4howcQl1dpNj7pIt4gazL/Gd/46P95zxIz/gOICl+7gwJRF03feaxZIKXvTZp11g9
         hMPtgjRX6AjQoasnyzVLD0i3AWRBDh9Q7dR8wQdm/CbA6xZ2IA5Y0A+gxsqY4d6Y+s2S
         GE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769276130; x=1769880930;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16G89u6+BhHcoNsBKlpFObIQxZvkHd3dDl4LIKtGP1A=;
        b=XPxVsnZh6pH0YH2yAmJKqSPYN2+g3Fhg724cKChCGB3r073PaXCcMFb2SInxdlTrQ/
         /PYKsK7DP7CZu+CjL57pS9P9klxiX/w2oaxRdacn6SoymG8Apz4kvBVoW1qpZfzQoDOR
         1qjUcL0qsXv4bbMEKX7x/sjuD+aedCPbr6Udri1kjwAe7AnIcMDrEyqn1F5MYywTDRob
         sUYhbldA8guGdoxwx3YIWNAwn/DN8qu2x/103qsd2nGYvmzk/i7n6OOwQOUYuak9ta8n
         ttQO7HLuzUHpN3+IHHO9kN8oJNQ3865mnTnCl95SWviGViK9wVsYX4gxA40Zj6LiKXTi
         qcgA==
X-Forwarded-Encrypted: i=1; AJvYcCW2NE/tgZkaIQobtJBFkBOD0KHhna9amV2dzaNW06Sdnq/5RoZdvea4Hd9gg5W8j5WHD4P/3tuV9dvhy3mR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3UtI2hSDRt+3s5SoOiGnI6fDJW+XxmD11OO1gnnH4WwBE2Vn7
	FXhKknpoWL+EUPM5g0glsqdi9OeMYPK386BXLiunFCTUmuGz6c7rVVu4ZHudUm+8/3aB+cLPHeT
	+jtttVAd+PCaUExUgVpIhrHjV//IP3Pexw27AvJ8Y7dEZs8GK9gOlEA/mXsD3OwVff25O
X-Gm-Gg: AZuq6aJpP5x5HGPbOGHdlf7Nn+dVcYp5OwpRgL5cS+46JBLAVVfx+4PoW5zeRIdv5iE
	mi4ghOUNcE1wIOgPzKuug/6C5oCpTF9EdCfosFG9CFwNzMjLGbWaJ5gUFbaMeMFgSshXUpYduIk
	C40AtakAoVAgBYWz1kCm2GzHbHWpc0DAJLrR1gqDF6YhVcIDOxktsMCylklF9cBHm2HWlBxNOCq
	K5vhEJS6GrKGZBrTXVvuQX15ycsJbevDxvuiTpOeDZIVIhMe9hfKzLM75WZmmFJSfwehzJV/NXM
	An0hTESwkOHWIK2BO4B9cyGjMeOdhQiJn4Uab4RCyHLaIeF0sHLb6+O5V/TDQVWw8BlinBSUCgP
	nND/n26WOTdvBCk3CPrmCzPwE7rNPrEUNJg==
X-Received: by 2002:a17:902:ce09:b0:2a0:d629:9035 with SMTP id d9443c01a7336-2a7fe43f2damr68765595ad.3.1769276128741;
        Sat, 24 Jan 2026 09:35:28 -0800 (PST)
X-Received: by 2002:a17:902:ce09:b0:2a0:d629:9035 with SMTP id d9443c01a7336-2a7fe43f2damr68764875ad.3.1769276126739;
        Sat, 24 Jan 2026 09:35:26 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa79dsm49036765ad.3.2026.01.24.09.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:35:26 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] Add the support for Glymur Video clock controller
Date: Sat, 24 Jan 2026 23:05:01 +0530
Message-Id: <20260124-glymur_videocc-v1-0-668f8b9c63be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMUCdWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNj3fScytzSoviyzJTU/ORkXcMkUxMLs7QkQzNzMyWgpoKi1LTMCrC
 B0bG1tQBbZM0tYAAAAA==
X-Change-ID: 20260123-glymur_videocc-1b5486fb1676
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDE0MSBTYWx0ZWRfX38LXlu6c15Hg
 KrjPCEHOcW86aQALk+BVIw1b8njL+XehncXjpvVJq7PlkG5yHJY13VX5Fesww0OjdfrHa4e/YFy
 oWazAYmrIt5TgTOC2qcgWL5i+APt5G1cUk0/VscFy3ZV2qYSDMPWTo8iIE/KcInw1XsYLQQDDuE
 bS3ihLslEHV7js+fnmk+gQoaoGRUiOoD4+ndnzpi9TU92pkAOTKuVVoSK5fGa3Aj6fERAWy7Dgo
 PIR6RoK4QVtNNJ/6Xj5/+61mmlMPlYUmHfQneLjOIAONbhrZYuVmcbFag+UNGw95J541d3G1Gh/
 gKK3OQRZJiPY0vvZa88tg8ODxHj9VwvodwrhnE1xvdvAN3OxY+JYetkGQgYOs4z41qt12dI/fYP
 uGFFG4cNdbKidYVSUeDKrA6kJzcD5ydRU9bziPXpp0ZWTs3/CW0sb/oxVv3GAJtr8qHc7Rq/Xjr
 3nyCvz8U50ZBteT5M+g==
X-Authority-Analysis: v=2.4 cv=EsXfbCcA c=1 sm=1 tr=0 ts=697502e3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yGsrVBdmsvV_QCB3mFIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: BSJai9Fj4Zlo7DK1Dpuev9Tk2J8mJ_0a
X-Proofpoint-ORIG-GUID: BSJai9Fj4Zlo7DK1Dpuev9Tk2J8mJ_0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240141
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90417-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A64737E520
X-Rspamd-Action: no action

Support the Video clock controller for Glymur Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: Add video clock controller on Glymur SoC
      clk: qcom: videocc-glymur: Add video clock controller driver for Glymur

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   3 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gcc-glymur.c                      |   1 +
 drivers/clk/qcom/videocc-glymur.c                  | 526 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-gcc.h        |   1 +
 include/dt-bindings/clock/qcom,glymur-videocc.h    |  45 ++
 7 files changed, 586 insertions(+)
---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20260123-glymur_videocc-1b5486fb1676

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


