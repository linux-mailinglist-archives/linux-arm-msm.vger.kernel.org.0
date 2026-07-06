Return-Path: <linux-arm-msm+bounces-116702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pVtnJddyS2p2RgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:18:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6EB70E86A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:18:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dAwi0tDU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QXKD90ze;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116702-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116702-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5EBD30C2F99
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F8D26E710;
	Mon,  6 Jul 2026 08:57:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A2639DBC0
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:57:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328252; cv=none; b=jMk4y5Fd3YfMVSy8ac31SVMYv5kU9kyzEY3lgjAcjCecBmyN+x99CXC9Fcm0px74cVyvfYUMbhA8hDIpk7Y7o69Zb5JoFSUZKMKK8kCrY7ffhALiu0B5gCZaLUAKTQ3J/yBP+Z/ImFU+rhOWLrIlcEfvesDcibQ/cgU+hG4l2yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328252; c=relaxed/simple;
	bh=ertaPo2KfN6+JLmWIpS69H7gAWNTbsx8xyo0q5AQDO4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=spAtR1BZ01EjK/NHJIIfg1gwInZ6jsK0x5gygOGkfBVRb85rC4cG4dEvoY3PPZrBZDo8Hq0VJQwhYazo3Cd/QXXgbn7LoWIQg54XXyDXaAjFw02gWVWlPTNknTZKJdal7Cg+pcMPI1mXs8YJ+pP/vEjid+xsx7cs3ZKgQigIG3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAwi0tDU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXKD90ze; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641c9a3470529
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hr7s0DYUE79Y/NJ7lVZGxq
	+zF8JIOLk+qWxVTt/UsDs=; b=dAwi0tDUh4fMOkvGvPfEhPUHCGxzGUWFpUfHnT
	jpWZ72bvEc7el762ivyml8+7LTXD2fRbpDFx/uv4swPPR9RHO029Kq7+Z1BsCG6A
	Ji71WEJpDfzmYHo7asA6Eu+xSHAi+3BtyZjJ5UgMOC8Pl3PWVmEy0SGDURzbk97+
	u4ZXsPe3QjP2rNz4Vwia7RAt/sA0xmLnOtrP+Icl1DBl0sk+NJjUsdzevGWdSyBi
	23k8fWpX3Zzl5wUNgSCEedrzyxcNo4x6nxjvNFZCBuXDegKwkIeeTdH3r2bc6Ecx
	opu6JzgMlxCGsqdHwW/QrcfojqeNOYCfhMUcPblNZ+UzogPA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txen941-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:57:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c9a700dc0eso22264725ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328243; x=1783933043; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hr7s0DYUE79Y/NJ7lVZGxq+zF8JIOLk+qWxVTt/UsDs=;
        b=QXKD90zeO0ESzrUuQ982g93S2OvsciREJceeKQeM0khfn4auJmTXMHB47aVKppoJrs
         geYZlBSdo34mWeqP/sDdaTEtkcm17gCkLN2GMCWqZ6QndKo+JUGJ1CBqb+7M4GvJwqJI
         e46GWIUotpdpgqvS1gwZ2EvxY8mpEIq0Scs+AxHQNGGNPhHqRt0RB3RknfycLBeeKnOT
         oyhTifE9YnR7yHGEBO1UVdb65tVhtfYZ3sfzX+eWkpietAW/Fm0PAW7jWsrg/LU1468m
         +frFEwFXumyX8C8pAlgpyGx3EGJE4AIWNec9txsIPKSkmo7D7GtIZ74PuWHx/ojOmaDM
         eAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328243; x=1783933043;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hr7s0DYUE79Y/NJ7lVZGxq+zF8JIOLk+qWxVTt/UsDs=;
        b=Yh/PlLZNONwCErH/CChsWXz+7FOqdjv3IHD9GkchURs3Pg/+wLYxHVhxgNbuhi7NU8
         7/siMOYwVquGLrPtjf/2rNco9MhsPQmOV9owLgR7gTg6ZJt1gQReDwrTHjDdPw7Hn14/
         7Isk8Xri5zz26nD9GMtUemqwvfwNeLofHetANcALMotqNBcJzAGw2bqDpzeLP0msfOKW
         LsUMJc7kvUF5VAT9RTTtYHmDqkpifFm/7iOYmyxn2ICIoutOHMeGQUzi0zo7Uvf7G4VO
         A8oZv7Mn722jV+VMinqW4ixPhUHA95shFM7kHLSRfnQykUrpOcjfFR8uEEwhTchVJM84
         PQ3w==
X-Forwarded-Encrypted: i=1; AHgh+RpGzNesESpvG/OHhUGXIzjQ0f5B+bZTj7yeJPdSXNpo4G3LeusAWT05zrr3nhPR3c0B7o0oHO1QdQceBEZj@vger.kernel.org
X-Gm-Message-State: AOJu0YxegnLrpPa0HdIaPRgWZyasjKNab4IGpbgyy+Nj4i8XTtzReRNA
	yKsp3c9m+lggxnv3Qa4Fr9AWg1U2/outXGiRqkgZCZdZ0YZIm4fmcf4UAeBl6ZarLQddAurcA3n
	CUobgOCYpZehwPq/4LkriX3cBVlxEIw1AaUBH0vEuD38lSpC3Z6aY7Eb3QBAtBeCyBjwI
X-Gm-Gg: AfdE7ckFxG5u7UzodunJk6nKrMBtPDxM9mo8X/q6j8srs/CbXJJjKLBk9C26P6woaDO
	40NfdWOF+nXj55M/z3j5pCvtclb+FzD/cyg3OswV+5SSlon5L4NtHTJ7uDBRVXFd2ZvNul/oaRn
	2U+WkcGxoP7pVE9KFSJ2EtuRRqsOLXr5rV3bdI9U5LxuphzR8gUksRFpNPvjL0WgZi+kz4s5PUv
	hbXttODGIXrXf21mzcgYT/rSfeDenAMiGk7lDQa8atJqVKydLPzqYsb4croPXEqFGyKBJyUqVIM
	7csDgpYeqxtkcSSzNHepWpMH66knbPfr3Ad5/3LUMSn2zItwPdAK6TAE8pnZrQ9lqHHrKYOOdP2
	IBMwsKg3LzbRuO833QjHyKQe5LMcVXCDJUoE=
X-Received: by 2002:a17:903:2344:b0:2c9:e86e:a9f3 with SMTP id d9443c01a7336-2cbb1e32c78mr86505185ad.10.1783328242992;
        Mon, 06 Jul 2026 01:57:22 -0700 (PDT)
X-Received: by 2002:a17:903:2344:b0:2c9:e86e:a9f3 with SMTP id d9443c01a7336-2cbb1e32c78mr86504885ad.10.1783328242550;
        Mon, 06 Jul 2026 01:57:22 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25f87sm46463665ad.3.2026.07.06.01.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:57:22 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add video and camera clock controller
 support for Nord
Date: Mon, 06 Jul 2026 14:27:12 +0530
Message-Id: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOhtS2oC/x3MSwqAMAwA0atI1hZi1fq5iohoGjULW2lBBPHuF
 pdvMfNA5CAcoc8eCHxJFO8SijwD2me3sRKbDBq1wQaNcj7Y6RLLnmii+SBSbd0uRaXLDtFACs/
 Aq9z/dBjf9wOUpPVFZAAAAA==
X-Change-ID: 20260706-nord_videocc_camcc-858b14239006
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX+52R5mYL7xVG
 pz2wSk4c9yyU+RKFoLjLGC9RdlqLo98BdI7Acyehb95CVE161YS16rxrrZRnyjabbBsfPrXq8Om
 Rgd0q+XcxSQ4MoGnYswcRSvhkRXZ1lQ=
X-Proofpoint-GUID: L4DnyQwf1xCYmiXxvRgwVkS8lqymMIfe
X-Proofpoint-ORIG-GUID: L4DnyQwf1xCYmiXxvRgwVkS8lqymMIfe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX7Pel7UoiacLU
 xUM9gBHyTfaU7ZXZILho8nASb7U8/hscIAaNBMVxSW4VM77IcuZWMKAPZFu2KjdK42c61rVS/ID
 l+oLzYdP+uUaNQ8VJk/bPQXIzLef4E46N13YGTJD1sc76T9oUNQF0GrRjf4+t7hKB/K1GkvBZCd
 qU87TSZWpQemJkkNye9Qc9RxJNj5ZmbfwtpNL8m8YcESUbELOQxTDce1NDRL3w3IdWuvmUPvzhr
 bUvHrpUtIrBdcivPU5lo6kzpBkWA+AyC3OYUI3pSGnoPDuJLLEKbXl/bB/P8YPFUuPBBsW5KabF
 MUTKP99/UToHRjez0vClztQAAMS+hZ+cMACAelurjDgpxYb5eVg6yVOkwM/dDX6VE0yy6/nKvBL
 THLP/iwsV8GhA7Owf6Psah9zu1aAS+h62FBQ0rSwBF83gIZigknjpHasZ9+9ll2fH7qOWwtmNCo
 GBs6YEMIG9n3jyG646Q==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b6df3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=I6YkWGfIfrbP7rSzwlsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060089
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
	TAGGED_FROM(0.00)[bounces-116702-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_jkona@quicinc.com,m:vladimir.zapolskiy@linaro.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A6EB70E86A

Add the DT bindings and clock drivers for the Video Clock Controller
(VIDEOCC) and Camera Clock Controller (CAMCC) on the Qualcomm
Technologies, Inc. Nord SoC.

The VIDEOCC driver enables video clients to request clocks required
for video encode/decode, and the CAMCC driver enables camera clients
to request clocks required for image capture and camera processing
on Nord.

The series has the following:
  - dt-bindings: clock: qcom: Add video clock controller on Nord SoC
  - dt-bindings: clock: qcom: Add support for Camera Clock Controller
    for Nord
  - clk: qcom: videocc-nord: Add video clock controller driver for
    Nord
  - clk: qcom: camcc: Add support for camera clock controller for
    Nord

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (4):
      dt-bindings: clock: qcom: Add video clock controller on Nord SoC
      dt-bindings: clock: qcom: Add support for Camera Clock Controller for Nord
      clk: qcom: videocc-nord: Add video clock controller driver for Nord
      clk: qcom: camcc: Add support for camera clock controller for Nord

 .../bindings/clock/qcom,sm8450-camcc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    2 +
 drivers/clk/qcom/Kconfig                           |   22 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/camcc-nord.c                      | 2941 ++++++++++++++++++++
 drivers/clk/qcom/videocc-nord.c                    |  507 ++++
 include/dt-bindings/clock/qcom,nord-camcc.h        |  167 ++
 include/dt-bindings/clock/qcom,nord-videocc.h      |   40 +
 8 files changed, 3683 insertions(+)
---
base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
change-id: 20260706-nord_videocc_camcc-858b14239006

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


