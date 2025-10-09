Return-Path: <linux-arm-msm+bounces-76521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 548BDBC733B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 04:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09F623B9457
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 02:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32461AF0B6;
	Thu,  9 Oct 2025 02:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBt5Tz1L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C55933993;
	Thu,  9 Oct 2025 02:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759977252; cv=none; b=o6n63s5rH1hhVSzrJbLA7qOwVGWJiwoQHEtpR+1pg/GIum3h/LXZ07vD2lvqx+dSg0ibNuHzWK5M4QBhC8jSf7JQ7NOrY60geiK6pon/6oNcCDOmBRlmirPue2b09g0GfEAGznFV8FUezvDailavA374BLwQYiDfdA+oc1YN2k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759977252; c=relaxed/simple;
	bh=G9fYDCK0biOIRA2siBGv9/9+6Q/sY5OYFaZEPGtZNxs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=opLDMG/GW0iw63nChah/q7rg99xLKOx2REZgzPodQ1VeKurIOgIjgXNQ4dC3YmxeSVpPktXAh2uRZ1xotM2Ft148/ykWDuCZCzss4EGLlXgHP7GWaemFuE39a5aJ+8kQuJ3DAo8o/GKux+fo3gKHwDafqYMaUpbXVBoHTQz1Zn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBt5Tz1L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5Pmp029339;
	Thu, 9 Oct 2025 02:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gp34WTyp3jQ5abLAaLIzt0wje4LOR2CSKNB
	Fn0QnMYQ=; b=gBt5Tz1Lq6GXwfUZH67zXoLL4p2W1KPXVUto7DAkaUD7R1DE0f4
	kzbML0KF15EDOZa7/3MGkrWSebo1WgcsWNDs/pnJ8iUnSLhfGwex7dEbkiyqmhtF
	wrXsm0TR1sc0TmFPgVUIy/LgJWQ1TPXFs4OgeAPnvZ2sEOIc7xsryOlCJixY9lWR
	cvxWOiawD3c2Gr2+8GC8HQ/M8zY+ALJDCITXARx3LNq0i8VV8tsd8BSAAnG3eVk0
	rKHk237loHaJQbSBUw3d/YNxGGrq+ImzggsNCu+b/jmJrU/PsYjOpvNbJgI6pj2c
	L2egqwc9R+g6e47eX0y78UY+lAWftO+NFbg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sh6nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 02:34:00 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5992Xvm2026686;
	Thu, 9 Oct 2025 02:33:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 49jvnmwgs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 02:33:56 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5992Xunf026680;
	Thu, 9 Oct 2025 02:33:56 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (cse-cd01-lnx.qualcomm.com [10.64.75.209])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5992Xu8g026678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 02:33:56 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 112F5210E9; Thu,  9 Oct 2025 10:33:55 +0800 (CST)
From: leqi <le.qi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, leqi <le.qi@oss.qualcomm.com>
Subject: [PATCH v1 0/2] ASoC: Add QCS615 sound card support
Date: Thu,  9 Oct 2025 10:33:39 +0800
Message-Id: <20251009023341.27277-1-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XTpbl_5uNTq5NsOS86yRABhk3vNWj1o6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX6l4N95VRtvK3
 AuxociwYcJURR/PuFvVCBwLidnRmKmbg4jjvua5S4wIyIuhtpdY1ojygLGTZS3KwOiYMvO33DwK
 LhnaGiY2qP4FEQEQZTA0wUzLyv33vrlpCSwyX9/TNpZHJFZEQSom9iJM6KXOPV5ee1dJGeYCJra
 DECkjWkXFNA0uXuBMfQgtgplI09pRZbWaY/j9xcO4dKtXxIetVkSmBemnixTQ6DMz3d73/+q5FG
 trJOUUEhrNfqEsC4d/r1nkrdwtPr4nfGa+jJZHg/WpBG5+uQCmaFZTq734Xkq3uC9GAKPxUPSYk
 BGkhsC06mvBxsIgNfEkUJqNcZTYGOgd6hIDTDs7sFVI7d5Lk79jUDgKGqId9rLvTPj/sReWQVVp
 eOxeMBuUhkx2K1deNBAdhnkMKAPaUQ==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e71f18 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=-LUE9sMnR5qqSz9F25gA:9 a=zgiPjhLxNE0A:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: XTpbl_5uNTq5NsOS86yRABhk3vNWj1o6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

This patch series adds support for the QCS615 sound card:
- Updates device tree bindings for SM8250 to include QCS615.
- Adds QCS615 support in the SC8280XP ASoC driver.

Tested on QCS615 platform with audio playback and record.

leqi (2):
  ASoC: dt-bindings: qcom,sm8250: Add QCS615 sound card
  ASoC: qcom: sc8280xp: Add support for QCS615

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 sound/soc/qcom/sc8280xp.c                                | 1 +
 2 files changed, 2 insertions(+)


base-commit: ce7f1a983b074f6cf8609068088ca3182c569ee4
-- 
2.34.1


