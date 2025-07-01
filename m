Return-Path: <linux-arm-msm+bounces-63190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BB0AEF518
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00A741683A4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C023A270579;
	Tue,  1 Jul 2025 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TkIcy4rw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4813425BF00;
	Tue,  1 Jul 2025 10:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365789; cv=none; b=uqYbx4vkqTWXiGGaAFj87KMrhx0NxwzgKqAq6qJ8huFzEagN8oFQBiy7VTmteL/4zsz7A+/R4h8CBZbIABwVeZbfP/dORXBlmWjr5c/02/kxiO/goO67qAPq/Pn9gmFuN8iFXDHR8pirAOu6B/r0DVKhneQTRc/Zy0QGyGVWrLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365789; c=relaxed/simple;
	bh=kPFXJCr9D+md/YcVAVbgP4zMlnt8rlaUuwr4oT7O/7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JhRsob82MM1tksyUro+07GJR03VMlooPvxvARqQ6nW8+yY+CySZ1etZboLjU0GAnsOCiUO01/RMgyQKF3ExY8DuRSFtkpepfpD5Klwu7E8qug/KV9WS/j+RUqQXSOzbI9R3UIjTYFjBJhTYgAuzq8LDJ5vLSdVx3B5zD/ehKi+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TkIcy4rw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619pU3g007048;
	Tue, 1 Jul 2025 10:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vO7Vr7MxHIfmpgfRREt3nzlagvjPa9eneFB
	SDbg6Gxc=; b=TkIcy4rwIFkFVW3myIJIA5Uj/hoiNruUXaFNPHSK1PWfuPQq6wT
	277hJm/MfL436ixW6JqXsPWrYE+XcgysjcNfNQkde/gqIfh5InFbbRyH7z623VQT
	nDVzfAwfcLXOA9zQqQ5F69B6z7k0B5P0Q8sxJIeLctamcgOtr4yHUAC7izMIPNqy
	JIcyF6o4rkiWUT+PrBjTAvS9sdRq5xP44Cm25V8dX9l55ep9NyVgtKfIXZgcEVLm
	x37hiE25XyrdgmXaxOjmxnST9wjUWUE8CnyJI0pCXPfkgTbvUqttmrOC65FlsrkA
	diBbXSX+U9DcdnCfWQDP6Wk6Tl1folavFug==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jct8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:29:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 561ATWLm030927;
	Tue, 1 Jul 2025 10:29:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 47m1bxafd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:29:32 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 561ATWR2030912;
	Tue, 1 Jul 2025 10:29:32 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 561ATWd0030907
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:29:32 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 40D2A5BE; Tue,  1 Jul 2025 15:59:31 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
Subject: [PATCH v1 0/2] Add sound card support for QCS8275
Date: Tue,  1 Jul 2025 15:59:13 +0530
Message-Id: <20250701102915.4016108-1-quic_pkumpatl@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6863b891 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=FlgLVNPGBAFpXXl924kA:9 a=zgiPjhLxNE0A:10
X-Proofpoint-ORIG-GUID: 8ZCXsYrzddB2B6GF-WyjzxDwcqsQ_8DC
X-Proofpoint-GUID: 8ZCXsYrzddB2B6GF-WyjzxDwcqsQ_8DC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2MyBTYWx0ZWRfX03V9vNUgwcqf
 rrrmOHFxowaNzfunXKFY7Abuvm38y8j8NlxJft3zf5jdGqRIpauz37gq52InkVUKbhzD3ZZWrxE
 +QL+Sz3hqwTTG8mRlmqtIA1br4NjEyBLqgSJ7wl9GLNiUyYQ5odZE4bQhYAzlTEQDdGpdLSBBQ9
 walx0xGfgf5RBjiL4DrVPn13dN6OJFVfPXU1eKHCfBi6Kv2VdTLsJRsMfiuMvmSm1Qn/DJ1+OZo
 XfV7gd6L9wOAvBV+4mWDGHQVZKzbkZAF0JU8+CZAgdQH8+VPVXkLYqETCjLx9YMth9C+ua67iuo
 lpphlmAvUBISd6rHiMGjTnKVhgahMg6h+C3wS4TEWQqdc11Pj9fwFpINk7lbjG3pKVKW92dNR+k
 YMVUWAQdSlzwhg5QkUPvMf8Z6PAHl/NCZNy2O/w8y729aVoxvnTrgMP5ESYdkpbVUS1jQteO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1011 mlxlogscore=720 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010063

This patchset adds support for sound card on Qualcomm QCS8275 boards.

Prasad Kumpatla (2):
  ASoC: dt-bindings: qcom,qcs8275-snd: Add QCS8275 sound card
  ASoC: qcom: sc8280xp: Add support for QCS8275

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 sound/soc/qcom/sc8280xp.c                                | 1 +
 2 files changed, 2 insertions(+)


base-commit: 2b53f08bc950fe271c6adde86f3b3332b48d2077
-- 
2.34.1


