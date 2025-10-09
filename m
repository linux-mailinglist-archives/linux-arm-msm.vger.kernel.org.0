Return-Path: <linux-arm-msm+bounces-76686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D6ABC98DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 581A6188C7CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643432EAB6F;
	Thu,  9 Oct 2025 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bxo0bDRl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D577D1E47A3;
	Thu,  9 Oct 2025 14:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020776; cv=none; b=EmpI9qJ91kjtkGfL+MO+nLXR4eQ4oRI+2seBRqX/rIuITFXhEy/QPynr6cbGqaR0SYQx2aaSzh23tD1qIlr+4sJcMzeoaWG7QZRFFgJocpJtp5tqf1cC+Yl5PgyfZQbbCqKkgtgjoUTLmJgDmsvp7lU+DjuX6gSxyorE7G0wmRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020776; c=relaxed/simple;
	bh=HcFpPL2edF7Qu4G5WNV5ZNvvDhAChdGjqbqXXc3+KUc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r96sAj0G41hY8/Uk6LXmk3Tf0e8NmXunNCJpdbW02u9cM2sImKWZanQ+lST05WoKbQg5IsssHXs4MfcrEQbDZ5h8wIX7J5KUwvzfBiaxvYtaxc+YuQTewKzfDLQ6FQRvBzi3D50OfIu6zXqK5NjxyNcL86R+vRSAEeot8opGyqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bxo0bDRl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EJjj023279;
	Thu, 9 Oct 2025 14:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DrBGHi6PJvEpTTm4+vYNENOBicV0zI9MNmd
	k3uIxNLo=; b=Bxo0bDRl6xVfBainHXlCZBIPu9867lN0DSNOPKRZA/ejGlu5p2T
	PdqzK5CHADclnOn1Gv3KHw/R1BqTRm9TtMkdb5Wd8aYHAjoJ9yh1Flh0xGiLwhwK
	u7lWWyrRPPbUa0wE7cdqtgTLb5EQJ4UaVXAovEgelK1sw+l42OJFjC/pXQYOceJ+
	JFtzF4uWKD7W99h+R0gMbHnh4xYd03SzSloOhfC+AQn8tUTNJ0WHp/1eockh/6Cx
	0c6HJfy3IiTAGC00bmZ//HqJVwmIe2uenr0h3PzHbF9szrZr4aeJJC7n+6isBus+
	a+MavMMMLMrksjUcpvpfHdN2es9bmyzMvJw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m37th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 14:39:24 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 599EdK1j012506;
	Thu, 9 Oct 2025 14:39:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 49jvnmddpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 14:39:20 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 599EdKAY012479;
	Thu, 9 Oct 2025 14:39:20 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 599EdKGP012475
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 14:39:20 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 2E451570; Thu,  9 Oct 2025 20:09:19 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com, kernel@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v2 0/5] Add Audio Support for Kaanapali MTP Boards
Date: Thu,  9 Oct 2025 20:06:39 +0530
Message-Id: <20251009143644.3296208-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX7bfJcLToKL09
 tKVCVhkvpMpLpQA148yi8EbVJz8aPAf0J3ELummqvUz7ecmHwxNlhH3la6XA5517dPd5f13USdg
 +O+o3NuLFzhlad1mb+yI03mRKDcnMBd5qrjzIWnViH/0q4c7xqJv97nQ0msLLE56ErPV6NDCHRc
 w1LnitH/vg83WcGZXSDKJ/YdC+QuicNpVmc8mRxSRC2Lxjc84KoYpOGsEjyqRKVoeBLekP2iahQ
 +1AaW4yQA/wEwuNw3KdJtJNSEdWTqNtpjjPveESARSPS/rmeIiUMsb9SKScuzzpw5+DnV9bbBeb
 hWD0PVB7JjicRusEMAeNmEhZYdf/iC0eyssmdDp1kYSxhPV6iuMXAB7eYne+Yyy/x1qPWUKs8V8
 5k4iML4lNysq+rH1apaZVbs9Gj0KhA==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e7c91d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JQyddCt1Ae9KdOiSsPQA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: bc3ROGhv3oVS2zVNH04s7AXvYTTTaCWj
X-Proofpoint-ORIG-GUID: bc3ROGhv3oVS2zVNH04s7AXvYTTTaCWj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

Add audio support for Kaanapali MTP boards. Introduces supporting
dependencies required to enable audio functionality on MTP platforms. 
These changes have been validated on Kaanapali MTP hardware.

Changes in [v2]:
	- Addressed compilation issue for lpass version check patch.
	- Sorted compatible string in machine driver.
	- Link to v1: https://lore.kernel.org/linux-arm-msm/20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com/

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Konrad Dybcio (1):
  ASoC: codecs: va-macro: Rework version checking

Prasad Kumpatla (4):
  ASoC: dt-bindings: qcom,sm8250: Add kaanapali sound card
  ASoC: qcom: sc8280xp: Add support for Kaanapali
  dt-bindings: soundwire: qcom: Add SoundWire v2.2.0 compatible
  ASoC: dt-bindings: qcom: Add Kaanapali LPASS macro codecs

 .../bindings/sound/qcom,lpass-rx-macro.yaml   |  1 +
 .../bindings/sound/qcom,lpass-tx-macro.yaml   |  1 +
 .../bindings/sound/qcom,lpass-va-macro.yaml   |  1 +
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  |  1 +
 .../bindings/sound/qcom,sm8250.yaml           |  1 +
 .../bindings/soundwire/qcom,soundwire.yaml    |  1 +
 sound/soc/codecs/lpass-va-macro.c             | 90 +++++++++++++------
 sound/soc/qcom/sc8280xp.c                     |  1 +
 8 files changed, 70 insertions(+), 27 deletions(-)

-- 
2.34.1


