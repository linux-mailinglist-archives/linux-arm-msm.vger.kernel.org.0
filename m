Return-Path: <linux-arm-msm+bounces-111244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xuIUO5ytIWp2LAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:53:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDE9642143
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:53:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="h/2s9QTB";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FFqJRNNq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111244-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111244-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D84633138CE2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 16:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B8D48A2D8;
	Thu,  4 Jun 2026 16:22:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132EC48097D
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 16:22:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590158; cv=none; b=X7Ma/8xYEbNpKRsiWya96MImL3VYzmB8tNq1+eVphAZVpvez91azWRgnZ+TQ0f3CQwZZ9J8k4X0SiM4EKnDRwOpj9CR9q12djig+yfSuk7izlWVCgn9zj4K35EDRjWUvDHdWhM49k7vedxceWWCnuuyz1na0y5Fcg+esqQLsyxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590158; c=relaxed/simple;
	bh=tAf0rKBBwkXyRwND2BGMfyJ4D0SH0mmO19xN28c3anE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VQwgL4khIX2TuxEPOX8HPACE9H+6eo9leLo03xofvU+9WJatTdc2JWV0pgAzp9e1E3B8n4hfYeRLVCFuIB+Hrtu7hCpFK/sWrOv4ZIU+j2wnU05r3wD4C3hSUe0X3c/xwJVZQEjRQuXd1At1ecrNpyMWVkPSw8zgffW2KUz7Lwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/2s9QTB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFqJRNNq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654EkCCO1135908
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 16:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aSiRYIrO26+BjUsf10ick3Aw4wDwsjDETXDiupofQVs=; b=h/2s9QTBH1KDJOPb
	s3Pnj45qUf4ulrCdQETtUEalncY2iwnYA7r6x8RVGrp7LoSL0KjOeZwhbQppSRQO
	mn52Tsr3HPlJgtKGQtBLNqpflxwjaM2sqjJaSdr1xxTnqW29mSv6+tafwyrL7mki
	+ouiyWxmvmZMMrKV1ujHto/cdhfyZb2EzfHGM8Lyx1orxR5dRgEBvHEiqHOi2nA+
	ESsimG2j6niz7EuFFjkXafxx7nP5uM6xMItISUY9MLyLR+pqDaaZKdqCqXiMbX+b
	1V60JtXllc7PE/+kdy3pqCrqdzaHsrYavwpGHFSxq25DorPdcZdqel6SxhgWO26H
	GYGCOQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wshyjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 16:22:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfd441619aso446209137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 09:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780590152; x=1781194952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSiRYIrO26+BjUsf10ick3Aw4wDwsjDETXDiupofQVs=;
        b=FFqJRNNqZ8A1Pnjw3h+6K46JUyutLUQCB7AxGfDRQy+6HWOqLynybOUMo1cjxSRg8X
         rJOpsgjz4X1wY9GHGvfW6+HM/K0yBdZi97zTpXTeqYzG+TakBYLjIVe7rh5Gj6EjQPit
         9RqErhLWCoNs2PJjSum5DX57s2IEz2FLCPX+2GTlnTTdSW4vVL55wmLTtAqp1po9Wq04
         LeV8uDnrP5Z+QBTC83ons/xvQmex3vdS6OFVoYEnaJ8WuxSZ3Dx+6GAHzBetDajodeCz
         FkDTPYwO7pkmzNLVtChqdi5JYNn+/5SoN8MvCfPNMUgGphfzgJRp6KAEDqz0sjbcGSE0
         xWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780590152; x=1781194952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aSiRYIrO26+BjUsf10ick3Aw4wDwsjDETXDiupofQVs=;
        b=IwSOibtjOH3Da9FH2TuG04HPFsFn/fWeeVCUVx7aJ7dbHws9vO7KOl1T4IMTK+mSbR
         SjGgp6H3aPV3yV4klLe7BbTcb3Isbh9kIAiSR77GTCC9R5u2EJzPOjv9gWf0E4w1YJZo
         mVcQopV6xRqvtLEKRDDtLlUx7WbeT7ZRyT1q68pYLd7x4+pIVVGd6vSIaE1eJDIFQ2eg
         CyLnTLiuY/a3DghcpSWWHFJbWtT5J1kLcrawRhaWsQ0IVZDMJn3UIa41TVoAhNAxX3xo
         nRLc8fcNyyJm1p0RMxKcfoCpbwB64D9wF7HPjCVybd7ZS8E+PnloU7HGY4fCzELh3KjF
         tWYg==
X-Gm-Message-State: AOJu0Yw3CxWOqtUfzA4Yxp+L3V2b0KXVcCAOV3I/Xr+4ssewUrll/7tb
	Qrai3IRrd/1dkqv1hxwjxM5DmX9xA2YRtRybScPCubwKOfRMg8ghYNp8g3+5pr57ciwAtSCZUXV
	CdRhG8E5RU3PfsPfLFbZE7Ku8TECpAG0DjbAKoFlI60z1gKgkjbyMfQ5+ubUuOPWhLl91
X-Gm-Gg: Acq92OFGaztphVwMCjIYlXRzl2yyjV5ptaVEISgPLgrWQmxRktp7l4HdjyRpGApsus3
	h7A3r2KVp/R0qqYaw02PSesUiOqHfRNRKbQ9LknB5vhQSGADWMOFDkO3W+CZ4VYbgdF0DBbE5S5
	vcfzrqTRdERZ6TNd4vDoWfuuGSB7U+cW8gj9GUR7OHZmv9/3esSvqzZSGs552cjPqQsa8MgwZz4
	E+NzCY7IR+huvX25DL2A1vTq6QG+eJgNq0h72mTC7j2LNStx6d/CWUeT7+JUD+7AluAGL5gWRmX
	mIWPpWa9NaPeAm/zZieV1KaR1S3EUxc/LnkMJ7ghs7g2L7DXxXCfLK3pnDzpZNu2aS5qZYCe71D
	WkEyt3FEApBj68nxQsprFpYas4He0hU7rsZgO9qIWc3RrDmoomW0Zw9oO0ZKNvRlMp71wjrJq8P
	9+jRwFuItJMyqR/Hzmzcykqsg5wDafWcdrp6axGMx/N57YLA==
X-Received: by 2002:a05:6102:511e:b0:6d3:9409:d1b6 with SMTP id ada2fe7eead31-6ec2a7e2fa2mr5261852137.6.1780590151630;
        Thu, 04 Jun 2026 09:22:31 -0700 (PDT)
X-Received: by 2002:a05:6102:511e:b0:6d3:9409:d1b6 with SMTP id ada2fe7eead31-6ec2a7e2fa2mr5261811137.6.1780590151171;
        Thu, 04 Jun 2026 09:22:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5034sm17591591fa.29.2026.06.04.09.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:22:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 19:22:23 +0300
Subject: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
In-Reply-To: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2180;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tAf0rKBBwkXyRwND2BGMfyJ4D0SH0mmO19xN28c3anE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqIaZBK6EmOt15zGsa7CbGu/21Vfd8Op5b+pOY7
 lguo+qKNTyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiGmQQAKCRCLPIo+Aiko
 1TcMB/wMY2JZA6XcGclZFriqAELGFsj0qR+EpLlX4rJwIi2GQIs7nGYmJPmIJcCCHQ0GHDcaYiD
 GaCpQRA60Ayvm7gfASpec456uvD+ujDD3mAdR8CKJwHwoDf582I+Q0Gqu9QmlKeZOi/8W9FQ/Tq
 vhLFq0rFXj05Rv0QxC5750kS8ug7YJPFWvDmiFC/oNsKScZGW00E4Xc9V6X3ygIIwt7h2SGCfWE
 LCOLrFq3OAmYEgsSyQqzcOSGXT8tTUo8n4dn64LeeUWQUSNmbo87g4IreUZR90rnWmkjglNsfzX
 RyRJGkkoglNtBb47m+jMZEJ9R97Gh5E52s7YNZy7qCahce7o
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 2BIdVDealNqC5IIST68DQxNCUPVv9o9b
X-Proofpoint-ORIG-GUID: 2BIdVDealNqC5IIST68DQxNCUPVv9o9b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE2MCBTYWx0ZWRfX7N7xEb8dCAVN
 xdyU4qNN4uWeax7jjHd6Tsss4KKiW2tQrrPXMPFC3WA43PlC0BcLLAl5RE9d8FfivvIXoolFqrx
 ChL5Q5CKr/5CZVh1qzdcPYHjr+ImEA3oCfhp0TYJP8N1KtiSHZDPhsz5ywT3ckexsGyf/b2VLz0
 brH/Rs86Mmsb0p+2F63DRITiWuUudsQwpHfh6Beg8+992Xu9CLBk6ED19j9rAf0TgutpOG4XZgC
 cdSgbJBFaGqDdAOWKVZnF7SvqoXwi6XBIChn5V3eKZmKYJrxRfMP/1pn5+ptWN24T+Vr9GIaDOz
 fUE5Kh0KEhJqQlzjWN5Q361m+Q3cVX+of24ycmjl1Zf6DBVg5RCQIPiyck6I4z+DqldZHoV2RAD
 9VF5f76T/RoRbCA3Kd95XbcNHmD1gB3M/F17y+kmIi59tgv/EBMpbSSBpgT+JuKK406KmqKhxgG
 adTNJ9V3+qeMwPyTdlw==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a21a648 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=rGr7YpdD5vYbGY1z0rMA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111244-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_tdas@quicinc.com,m:jonathan@marek.ca,m:rafael@kernel.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:stanimir.varbanov@linaro.org,m:abhinav.kumar@linux.dev,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:konradybcio@kernel.org,m:bryan.odonoghue@linaro.org,m:dikshita@qti.qualcomm.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab+huawei@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBDE9642143

On SM8250 Iris core requires two power rails to function, MX (for PLLs)
and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
MMCX voltage levels.

Add MMCX domain to the Iris device node.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..6150380795b8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4326,8 +4326,12 @@ venus: video-codec@aa00000 {
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&videocc MVS0C_GDSC>,
 					<&videocc MVS0_GDSC>,
-					<&rpmhpd RPMHPD_MX>;
-			power-domain-names = "venus", "vcodec0", "mx";
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
 			operating-points-v2 = <&venus_opp_table>;
 
 			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
@@ -4353,22 +4357,26 @@ venus_opp_table: opp-table {
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
-					required-opps = <&rpmhpd_opp_low_svs>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
 				};
 
 				opp-1014000000 {
 					opp-hz = /bits/ 64 <1014000000>;
-					required-opps = <&rpmhpd_opp_svs>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
 				};
 
 				opp-1098000000 {
 					opp-hz = /bits/ 64 <1098000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
 				};
 
 				opp-1332000000 {
 					opp-hz = /bits/ 64 <1332000000>;
-					required-opps = <&rpmhpd_opp_nom>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
 				};
 			};
 		};

-- 
2.47.3


