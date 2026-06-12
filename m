Return-Path: <linux-arm-msm+bounces-112935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BML9ER0ILGrlJwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:22:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF51B679BCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:22:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oaJQapJL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dJk7jie0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112935-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112935-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14A1831BE202
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 13:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782673EFD3D;
	Fri, 12 Jun 2026 13:21:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72943EDAA9
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:21:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270464; cv=none; b=Kf1rDvjus+Yg7w4oU5Ys0qoCRbhVB9SnSWl6mdODpRqmhhYKSWolNldzEJm6q2hzEwp2nc3eGhWnnVMPTNKpCGL/axLoT9nafTX4kTMYqbD5J1ZGkC8Os8YA9FWru9rWy9uXUoOd+QJNeXS8n0CEGaAckaIpO8brCVRLjZyVkAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270464; c=relaxed/simple;
	bh=GA2hcEO9oG1ygBpxn2AFU64V+84wXeyP6S4shCbyzro=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=etO5JfR0Awnc/ANXAtRtqELPWL7SsBRl0BWAaB7YQ7nkyniBm7IJKr055310beLgcX80HlxgtBNPcW+e3yEVh3mn/PAH1iRXmTqCOt26uGzf7L0ir6Uh0IcKd53FDo8Uyh4ZOt//71ppytfPD/rqxwVnPqr0ny4XWWWKGaUS2aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oaJQapJL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJk7jie0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj77x2160936
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N1CimfNGzeKqFKCWpq+lvs
	mNvHBjXLnVmVAB9wSi3oU=; b=oaJQapJLrzpwrAd1P0fqL/Enj+7GGiLmyyIkgE
	IpUoFqTTWP10vsWx/Xg1UOSE4POfkZYqAILg19xsc1JQHg08RGu0ckRWYak2OUMb
	nXwBOKdplLb8F/C7uPC7wofZZy3UwQprLAjDKUasFbS/qoo8VarphtlqwUrI2EWH
	pWOEBWoBfttfxYnl5pXNq7Bu49adNtN9J1QN5d7OhmM/jBmm+cMRQQGaMGP2OkbG
	1/WZp/f4Sf4GUJSB74sJnvoEAYS5Ln5sN+dUd+rZJhuJQeM6uqszs8vy1BTN8xvF
	mH7zIP2wlG4foxVhYPJ5lWR1nWv9+lx2FO8eN0CiR9UgHj9Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014kx6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:21:00 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-964172af027so846343241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270459; x=1781875259; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N1CimfNGzeKqFKCWpq+lvsmNvHBjXLnVmVAB9wSi3oU=;
        b=dJk7jie0ALcDuhuKmQRiZ8I8FdfOfQSIjY168uPfedE2WH7WAr1LVBMgNfjnehE+73
         SLNau3j0jcK77CBa2wJJ3VWyBlgK8y/a0QP1PecuK5Wm97duRo5O8+mlA5W4OIcEk76p
         Urxf3rPngq8wcGSvc5hnJRf79qPfC+dDPPcaUdgBktg/FfYMRAG47gA7Es/nSEo03+xN
         dnRewhXzwMGFBuiZMEiRZl74tmD2HZtItmJTG1/wCg//sNqBsJjAWGFfj25xig21D0f6
         epHCcnlooml8eMqdxkhiz4Fouf/lIxBibfTDAMDw72XR6ixipaMriovaAn8J7dZPQJzR
         J+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270459; x=1781875259;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1CimfNGzeKqFKCWpq+lvsmNvHBjXLnVmVAB9wSi3oU=;
        b=JDzb1sDY8bk69DvR2cV8aIcQYJqVdsMbEVMw3ishbEyLyzQd0S143XpUDQXcpJfT3l
         HKQCgA1TxKoCZoxMVYs+uNZo+tY9e0S3U2fODJ5O0Z2jqhuhq3ujkTs+hr6ToH2gCVVc
         z80fpuUZLCqL6yqJ6thsLEkjOlwdIuj9aNfKNvgQ5ho/W0+7Z0mHVuQfFBC2+Z299swO
         kWV+lDEabjLhVhcE/elqMVCmBN8ifLmFQ33Vb4BVU0fqJXO4iNRlu7931/8CCGjWvuWJ
         paJexo9KFIwp8RWwR85OhX2b/wj6m3u7CjKyxGlzpF2p+W9Uk++ow+mB/5j/reqnlIML
         5rJA==
X-Forwarded-Encrypted: i=1; AFNElJ89LdtuMZC1oJVQNfbB/YFQElwwhYvc9Dd3sEKMyvpg2+LcLFZmybzZFcsd2HeV7xTFZUb/IpEOodtLTIgl@vger.kernel.org
X-Gm-Message-State: AOJu0YxqEaHJl4mT/lkBQtWJU3X+ssYcd8piI3bCthhvpcE4aoXjqdYl
	Eilh7R7b64zeNIhfNzK4aTGXJmmi59adFYU6tADvJ9K6B837WRIjqSlw3bt6EY9lR4jalZcW05T
	XTXGYZza5Y9/AH+5E7nZn/b6C9+6tE48afNJ1Th8/MTqKovZhclHKKn3s76//KA+5EuF6
X-Gm-Gg: Acq92OHqVuvVr/tiok3MRubGTtxN25LSQq536301YU+Q6KztboPR4kefqosX3H9JyvI
	8P9cQFhM3jDQ6o1rmxIX5Zv+RpmkGE1wqi6TED/CiDt0u0P3MXrb2YexaCQwe4QCubxRcLqg+TI
	Y4DlMBJ6HpXrjieBqzIGfqt/LggzNFulyLczhqv3qr4P9FJ6tjSWawtrvHnkbmRhUwdpVZIKW7N
	NWOvDxfie7uYBbF567U7GZHqUL3EV/cHTHQptVddiEU3FrbYajcEJVQK9zHg0ipFrNZB7phmuH8
	ZMvF1HCq7klqHDdm0Omq09HMqOrUVuy4FOr4AxqNCBR5SQu3Qri3/drmZHPAcDk3s++dzjEcf0C
	jM+bHjKbpkg13iBVtImR4v32UlWn/1p/1jlvy1z1l2z8TX+M98y5p/YWdpL4jIsmXN5sXHOTp1f
	zfe5H4bOaigLHbCrN8EOZ9DHQVyqZ8Ck+nQ2e4lznvDc1P26LbzVrqViPUjTc5RaVE0EPI6e2a
X-Received: by 2002:a05:6102:580c:b0:6ef:dc8c:9367 with SMTP id ada2fe7eead31-71e88adcb08mr1374098137.5.1781270458882;
        Fri, 12 Jun 2026 06:20:58 -0700 (PDT)
X-Received: by 2002:a05:6102:580c:b0:6ef:dc8c:9367 with SMTP id ada2fe7eead31-71e88adcb08mr1374007137.5.1781270458425;
        Fri, 12 Jun 2026 06:20:58 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:3510:32cf:db6:13c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm59986866b.1.2026.06.12.06.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:20:57 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v5 0/9] Support for block device NVMEM providers
Date: Fri, 12 Jun 2026 15:20:52 +0200
Message-Id: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALUHLGoC/3XOzW7CMAzA8VdBOS8ocT6actp7IA5O40I02rAGo
 k2o777AhUmlF0t/S/7Jd5ZpipTZbnNnE5WYYxprmI8N6044HonHUJuBACs0OO7PqfvimPlYBhq
 49ko4cj5gi6weXSbq488T3B9qn2K+pun36Rf52K5SRXLBLQZQ1BjZCvxMOW+/b3ju0jBs62APs
 cBLMaJZKFAV38uGQjBSaVpR1EuxYvmLqooD62RvBKIyK4r+r7QLRVdFm0YCWQ/Q2TfKPM9/L61
 ZOoUBAAA=
X-Change-ID: 20260428-block-as-nvmem-4b308e8bda9a
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: gqY3XJe072O5IIhJ4o_tSTKWqVu4RoYP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfXzBQTvve2stHw
 Xw0ZMlxZ+hwWyjDXocVC2UUogodmTgJSr8rKOkj4e2XIUJLL80inBpdyqPEyuGaxOLk6LKb//MF
 jCV/pWJtVuPBEIg4TH9VXNzk0CAlJWk=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2c07bc cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=H1RoBJpM21yDxn_SvroA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX+BOn1o/qx48p
 27TAaIq7dm6IbY1nrvRbM7eWR9tpCjnRZwAV23V0K+lEN2LDudBnDrexIpyICoGy+7qoccwugiz
 y2TuA0/OSoQ8hsbUotvXiNMEcSh6B2jSAmRT+xDHsULfgEI2EpiiwqxzoQJfUuY2APUfm3kGHj0
 oTIaoOBz3iHUZ4kVZD8jGcNg/GGJe8i66GipVQGVCYfhyvEwvYSz75ttVlaW0AWpehvhn7fEI6A
 FmgvQPftxNDH2TjHM1lm9M2Zo93vOyhZ1ChdPISY796In3a9i6sNzYTbNudU0Hor14WJuWQNTzL
 MOcl+OdBW93rF+bpZrMjzKGpJdCnKS1rXVv/1DpIxIjg51AvsmR979gxVQ3DBesMGfVHwUnhG1v
 fFMJymJrEef2cI+XFuXBpUZT7lGomso8a7ioFd3JkGT/ohKsuvgupkq8cMWpisybWxLgcAEcwy4
 nBeoxgrS0dylr0QpHhw==
X-Proofpoint-ORIG-GUID: gqY3XJe072O5IIhJ4o_tSTKWqVu4RoYP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112935-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.or
 g,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: AF51B679BCB

On embedded devices, it is common for factory provisioning to store
device-specific information, such as Ethernet or WiFi MAC addresses,
in a dedicated area of an eMMC partition. This avoids the need for
and additional EEPROM/OTP and leverages the persistence of eMMC.

One example is the Arduino UNO-Q, where the WiFi MAC address and the
Bluetooth Device address are stored in the eMMC Boot1 partition.

Until now, accessing this information required a custom bootloader
to read the data and inject it into the Device Tree before handing
control over to the kernel. This approach is fragile and leads to
device-specific workarounds.

Rather than adding a new NVMEM provider specifically to the eMMC
subsystem, the new support operates at the block layer, allowing any
block device to behave like other non-volatile memories such as EEPROM
or OTP.

This series builds on earlier work by Daniel Golle that enables block
devices to act as NVMEM providers:
https://lore.kernel.org/all/6061aa4201030b9bb2f8d03ef32a564fdb786ed1.1709667858.git.daniel@makrotopia.org/

It also introduces an NVMEM layout description for the Arduino UNO-Q,
allowing device-specific data stored in the eMMC Boot1 partition to
be accessed in a standard way.

WiFi and Ethernet already support retrieving MAC addresses from NVMEM.
Bluetooth requires similar support, which is also addressed.

Note that this is currently limited to MMC-backed block devices, as
only the MMC core associates a firmware node with the block device
(add_disk_fwnode). This can be easily extended in the future to
support additional block drivers.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v5:
- Fixed ath10k binding issue + extended commit message (Krzysztof)
- Moved blk-nvmem handling to block core instead of a class_interface
  This allows correct/robust integration with block device life cycle (Bartosz).
- block: partitions: of: Skip child nodes without reg property (sashiko)
- Link to v4: https://lore.kernel.org/r/20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com

Changes in v4:
- Fix squash issue (dts commit incorrectly squashed) (Konrad)
- Use devres for nvmem resources (Bartosz)
- use __free() destructor helper when possible (Bartosz)
- Fix value return checking for bdev_file_open_by_dev
- Link to v3: https://lore.kernel.org/r/20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com

Changes in v3:
- Fixed missing 'fixed-partitions' compatible in partition (Rob)
- Fixed clashing nvmem cells, document calibration along mac (Sashiko)
- Remove workaround to handle dangling nvmem references after
  unregistering, this is a generic nvmem framework issue handled
  in Bartosz's series:
   https://lore.kernel.org/all/20260429-nvmem-unbind-v3-0-2a694f95395b@oss.qualcomm.com/
- Validate mac (is_valid_ether_addr) before copying to output buffer
- Link to v2: https://lore.kernel.org/r/20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com

Changes in v2:
- Fix example nvmem-layout cells to use compatible = "mac-base"
- Squash WiFi MAC and Bluetooth BD address consumer patches into the nvmem layout patch
- Fix possible use-after-free in blk-nvmem: bnv (nvmem priv) linked to nvmem lifetime
- Simplify nvmem-cell-names from items: - const: to plain const:
- Factor out common NVMEM EUI-48 retrieval logic
- Reorder changes
- Link to v1: https://lore.kernel.org/r/20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com

---
Daniel Golle (1):
      block: implement NVMEM provider

Loic Poulain (8):
      block: partitions: of: Skip child nodes without reg property
      dt-bindings: mmc: Document support for nvmem-layout
      dt-bindings: net: wireless: qcom,ath10k: Document NVMEM cells
      dt-bindings: bluetooth: qcom: Add NVMEM BD address cell
      net: of_net: Add of_get_nvmem_eui48() helper for EUI-48 lookup
      Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
      Bluetooth: qca: Set NVMEM BD address quirks when address is invalid
      arm64: dts: qcom: arduino-imola: Describe NVMEM layout for WiFi/BT addresses

 .../devicetree/bindings/mmc/mmc-card.yaml          |  29 ++++++
 .../net/bluetooth/qcom,bluetooth-common.yaml       |   9 ++
 .../bindings/net/wireless/qcom,ath10k.yaml         |  16 +++
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  39 ++++++++
 block/Kconfig                                      |   9 ++
 block/Makefile                                     |   1 +
 block/blk-nvmem.c                                  | 109 +++++++++++++++++++++
 block/blk.h                                        |   8 ++
 block/genhd.c                                      |   4 +
 block/partitions/of.c                              |  20 ++--
 drivers/bluetooth/btqca.c                          |   5 +-
 include/linux/blk_types.h                          |   3 +
 include/linux/blkdev.h                             |   1 +
 include/linux/of_net.h                             |   7 ++
 include/net/bluetooth/hci.h                        |  18 ++++
 net/bluetooth/hci_sync.c                           |  39 +++++++-
 net/core/of_net.c                                  |  49 ++++++---
 17 files changed, 345 insertions(+), 21 deletions(-)
---
base-commit: ccb7390d6cdb23b298a6e2a7028ec134dfc4db10
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


