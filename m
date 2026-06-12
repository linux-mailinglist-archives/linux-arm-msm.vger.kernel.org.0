Return-Path: <linux-arm-msm+bounces-112910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MOOGIhjRK2prFgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:27:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 863F467841B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:27:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lUUqjXkw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hKZEjSBw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112910-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112910-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 79761301DA44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8FF2DB791;
	Fri, 12 Jun 2026 09:26:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568BC3A48E6
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:26:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256365; cv=none; b=Fy5h0jsBpR2nusKlJC9hFimEj7kvv8MjUDnpgm3zo1xxlR78Z+y5g8SuQVah8pQ9FLw4v9AZTyNLDhjjwaymB8VkN1/xoeSLrNeh7Da2yUqL02uU9qigY6Qv1lxRTOmkr1D1iJEq54ee0ruAzAqw2E5UaWjebfoHay9tZOSnT9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256365; c=relaxed/simple;
	bh=xNsqm+B3LOE10tLNQts5eunxNV5RsjVx0kaWEOCN+lE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jA+ulVqiyO1eMoJUi9flVDvOgtwnIWINF9SfKdDvPCIJw5PliJ46JBEQTEQ3FZbqRYJQlJ5C9KzlF3xtILSw3ytSzvJWqLv5u9fAIGdjDI+eNT+K+XxRRAg6npkxf2ol3JMD4hiSkuWnTHEQYUdTWVF6nw2+8Y1NCPGShWqB+EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lUUqjXkw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hKZEjSBw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3BrO42451842
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9Ew5+SW+kC22+WMmYtdad6wVyhCdPtwJDrWQBFGf2w=; b=lUUqjXkwQsvvukaF
	plRq6OE5C7UNH3QrMFAOxxVJcK/Ty/0R4tKEWduwxn6ksGUKqvp570UfMhiwiMF+
	IXDJ/sqZYHOwcdio+TVb1e6gpAHG2fTgm1/DwNo3P3/G8V2D3/MedAVdUq2xpZtR
	lIuxSZETv9lXSImVrkMzstmlFobLWxFG9ocaMI6rowHu0sWlHETH7xqoEfBXUscf
	UbsTdQAtHNudNvpaCv2Vdomv9p/UAV9vG4lRoNraqBgQ3tlXzIrnaoi1iPHwTdJJ
	D4mqR0PnOvoAPfizgxm5HrYsz1NT4/3tWVca2m11HY+wq+9uSpHXQNTgL1AjjirM
	wGw/qQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcjn9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:26:00 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6e907a982f5so2003619137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 02:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256360; x=1781861160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9Ew5+SW+kC22+WMmYtdad6wVyhCdPtwJDrWQBFGf2w=;
        b=hKZEjSBwM6h1ryKs8S1D1Pnrk2zBQdgtXpmK6KxEwc7f5dO47sHrmbT0B1ivzcENZC
         ICoONjoLvrCpwmrQwQZ3acCV3TFZVoY83wffbhzx+QGnW7+x+2MftbHMZnis7Ntk52uc
         6OadZ9DxcdLzqHSXYrrcoJpFqHnm9vtmbH6h1YqFobdJO1VoGrM2RCv/2nFlDip8GLbG
         e4hUuDOHtLCz5tKsQ2BhfvQ+xQkjUES4AKEcKrtl5ajep70ddLz/yaUx0NYpIV4XuXJ/
         NhV4L60BJpI7QHqPJcd0+clxARYJaebIkRumtuK6yD4qDH0sZEcSMiCDRWEhzuEGQmWe
         2UGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256360; x=1781861160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L9Ew5+SW+kC22+WMmYtdad6wVyhCdPtwJDrWQBFGf2w=;
        b=lohmMpkKXzsau3U8w2qWVdiCM1t86w5J6lciIuL61mqjGv6wkOzZ6zkAzx58jCrbAN
         dDLkgYu+r18rI5FyJ14ERLiwBGpcAfBS7BbGC2mNcJ+LmJzD8tCkbLmqLErRsi/kpiGY
         rio1zF+H4y+uHbo9YJYP8Ewfjjy1c7oR0/SRHnoI1gCN1KqphxyY1YhEepz4Je2C+4X+
         ufu0AcCmLN1nWK82VLpEMgbmZY5N5XO+ugmNgnUCBmiuqRdC6wu1LrJdDuQutC/SbfQm
         UZp9lt3GSAz8hj1DveKyj9abrYX/8tM4jxX/DKni1KYt4FKyTTHhqSfObadJX/sck8m9
         /ZEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/XFx/w1RzpWKEQD1gK1FcyF2+w5XqnMo42If48iKR1x/aWFKC/0CW7Nizv+sY8UkGpVT2rhTClY3gx2Rfj@vger.kernel.org
X-Gm-Message-State: AOJu0YyuLmmZaKQfukC0FKGUORaYqp0P/QZ2GlrF3jyjo7bkiIgTU5Bz
	GiOyMUMDmWxZTAkOYbCvrDsYwojpuEv5FnjV8DT5FroSo14jsl19T4Kyl3mB1L424x9y3po/HHX
	T5LlfG3LJyEY+1L95qC1Z9AbRpfsl1IO3itJtDXR1sQX+/YD2XqF0zAdFTjZnEDpAp2Ro
X-Gm-Gg: Acq92OEa4YKoarqLknkJANHedHV9p29d2/z4NNvm4XbvK6W3SLoV/0uUtgmc0ICdZjy
	K+/UPII/P1pohms4m1uIsqorQUrQGaml245bizTUa31viXdegq7vPcUkTHraA0UnpekMETxJuoV
	1FrM/rYFwWzkXSK92IBaoKt3ab2RlP8LsPkTsmlzNnKP+7B1Hks1FcL67gUOOMIVKZUSNlHey7n
	TeQHGrEasGfge3+psBkIF61361/WG/NUy1bqsJeZszkWoXkzYcrsEvYMMmq55CcEljMHaU30iAi
	Cqj8LSfntznXwYD062gIsoU7MqiSdBvTREZjiGeQYC6MaVfQv+No8WZmgvtxWmdrpMGmYQvtXN2
	Y/UqDCnHWE9PAJghpj+cw7+EndLj1+gI1nFuKnlf96P7MeW09TgwE+CcF0425z8o4U9mXU7Q/y+
	Jw217PjEEcLxSSvuXIdO2oxd1kSYERmr4QY10=
X-Received: by 2002:a05:6102:61ca:20b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-71e61ef611fmr671926137.0.1781256359632;
        Fri, 12 Jun 2026 02:25:59 -0700 (PDT)
X-Received: by 2002:a05:6102:61ca:20b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-71e61ef611fmr671913137.0.1781256359166;
        Fri, 12 Jun 2026 02:25:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:39 +0300
Subject: [PATCH v4 07/16] media: iris: Add platform flag for instantaneous
 bandwidth voting
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-7-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4991;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RnwWFAaJcZbGFM4BPtgb/HiyJNOnSGTgdllJ6NoVDw0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CQnqHoBieSia91XFs5XPA/VfkeCtH7g+3B5
 wUSJpPKYtKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkAAKCRCLPIo+Aiko
 1St4CACEU1jg9eaZaKESXwgnhYwNZvjNIOSi+O1BL4emf9VdQ4dFvv0JS7KXW21XyNidiI2e+Nk
 VNWjNWVzbCKNKe1XwzI0kB5LZ05eBbrMfOQJ+cKyIxpHqp6uUhLtmwX8MMYdP5NuKdiB5UHpyph
 6Ru2asYwv67IjAbkjap+q06Cq6vfCzapKH3r/Yf79WKlZ/8uRgJRsVkulWdHCxJrPnXsTlrZ1ej
 nioAXXqeMASTNOWAae9cbZzemmdbBDlJOoxk/VRxwTnFJPePE29/BuiI7PRDRs0gbzpIBiWFnxX
 ig0e8B6M7bHrA+5virOIXEzJDZV5Hu6sWsWDKxhIMPKKK87l
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX6bludBDjy/7C
 lHS++bSJnrvwHCpQjgNxUW317daMD7C9wHgGdzdZQ7Zs8vKu9sLx059A2aYZJadNnesoZjo28NS
 PiW0qmJUMoItNTIOgejTyAkUqIlEs9uuyJu8Z81gG1Vi9nOa88IoITp5q29Kzr3609XnOcwhvXv
 1u1Q2/xLqLX1+TxINmdnVcGsrDTNECCVuLSfbif8CPnK89QRXqjhaqbJRp9+LdQFwcql3gT5X6Q
 3jX7C30QFzwn4Dc3zVCGtc6RhWGfeQFmZBE5POGkUEl/YEdhbA2/QLiMOt3FZeO+uU8vvuXgoZ8
 ZHARYYuhiy6qyb3RtSKD66bQ61wSx3sSMhPrKELmdY3305J23PT7TjYhZTdvoGghBiIxZq2MxhQ
 unFgP+DFARM9a2uK69m6XBjawRA8/h3Q7ew6Vd49TSCPJhYeXqKKMKrMd+C04KB5jll31BZtwue
 SVUDqT6eaj4TuY4EPAw==
X-Proofpoint-GUID: x0-D4xqVHPJbpo4OlkVbQoKEUvncR590
X-Proofpoint-ORIG-GUID: x0-D4xqVHPJbpo4OlkVbQoKEUvncR590
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2bd0a8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=hZPXDZ8rEFHKWOVG6IQA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX6NF/JbnN16q/
 ZKLIA51VgbS4CNmkhJelTwQPHU/FZH/mHHcWSibhYuvo3R3Hoo0ylgnig0dFEsFnaZVtUadiicB
 FDJfqy/Tc8m6+97CqKp1APKf8u+mWpg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112910-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 863F467841B

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

AR50LT require explicit instantaneous bandwidth (IB) voting in addition
to average bandwidth (AB) when configuring interconnect QoS. This
requirement is due to QSB (Qualcomm System Bus) 128b to
QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
which is not needed for other IRIS cores.

In preparation of adding support for AR50LT core, introduce
platform-configurable IB multiplier and enable IB voting for all SoCs.
Existing platforms default to IB == AB, while AR50LT requires 2x peak
bandwidth.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 4 ++++
 drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
 4 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 81fcb2854772..accc1627defd 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -316,6 +316,7 @@ struct iris_platform_data {
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 wd_intr_mask;
+	u32 icc_ib_multiplier;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index eeef453c583f..e2fddc29abc7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -97,6 +97,7 @@ const struct iris_platform_data sc7280_data = {
 	.num_vpp_pipe = 1,
 	.no_aon = true,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -128,6 +129,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 261db38a013b..64cf182d67cc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -116,6 +116,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -146,6 +147,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -184,6 +186,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -214,6 +217,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..caeaf199cef7 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -18,6 +18,7 @@
 
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 {
+	u32 icc_ib_multiplier = core->iris_platform_data->icc_ib_multiplier;
 	unsigned long bw_kbps = 0, bw_prev = 0;
 	const struct icc_info *icc_tbl;
 	int ret = 0, i;
@@ -36,6 +37,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 				return ret;
 
 			core->icc_tbl[i].avg_bw = bw_kbps;
+			core->icc_tbl[i].peak_bw = bw_kbps * icc_ib_multiplier;
 
 			core->power.icc_bw = bw_kbps;
 			break;

-- 
2.47.3


