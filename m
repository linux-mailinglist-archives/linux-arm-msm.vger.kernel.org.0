Return-Path: <linux-arm-msm+bounces-109070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFgVIUIPD2rFEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:57:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C54F55A689D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17BD43228297
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7553D810C;
	Thu, 21 May 2026 13:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K5wK71sA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9dy+FUO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3700D86334
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368821; cv=none; b=dYdxQ0v5UCDeDhm4CWkmYcHFmO8Os868Dhs/AmVDvtoGNM2diqmEayGaIf/NVi/uUBc26zBx9yDAWYaOmKKpuv8Tq81QzrM3isoliDl38tgq3Ned5CBhuw+KwYgOIvm6NpaaGWh1vRloI6rueE/RoT0Z9Zqmo/YJkoCA8TdM/U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368821; c=relaxed/simple;
	bh=A1erdMljftPzXLhP761c4LquhX2IG3TsIQ4FnVrpWLA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y5/n7n/ZAKQXmqIZdUICw0fB4dZhKNcdAsIBwKemBPiBi4Q0hcexuMjLQ2cUwI86btCKHN+ZWfCT7uDioZYEW6HOkju6+HVaXLAJM46xtLJwTFMI9nfv0BfYOfo7wqQ6muRQAMypXAFK7OKiKPOBj4RP8QwysMkhumr4Nedbk+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K5wK71sA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9dy+FUO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99o843009530
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WqpQ5DH7AnGW9TfLUP84bM
	GaHd/GMC9yfpeTxEpheNI=; b=K5wK71sA+6xFkk1IRqcbXLekj2W7W+PdA1N2g9
	dhTUocLGMw21nwoH6Mj48kbJCUJqatEIOOj94wRyuBmNWimIBvsciPVowgRarBpv
	VJzwwWRjbh7RetwobUcmlv7HusQFf8U3XMNpQ5127pvFsqDS+KqDIsh7JcyMLqZS
	TciRm3fSTJ6Ux9ZKUJorEnKkze6bIxjpyf5w/qW2NGpjaWrAqFKntb45F4Ia3xyf
	KoZgWP4PJYZxt1QWk5R6vFugzINGgANkohpCXDVQQyB7BFfPqL22boinvvl4Mndd
	mQDTj58WqIBFJ0FOgS8zFFtp9PBeD7zDNSIG96hAbURDHDUw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9sr329nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:06:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so3214993a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368818; x=1779973618; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WqpQ5DH7AnGW9TfLUP84bMGaHd/GMC9yfpeTxEpheNI=;
        b=B9dy+FUOsTfUZREs+euQmXdVcdxywXoD/+2nIgFzIljGXKhy/yhSHu+OhvdSB7x0j0
         jOPlBvMMR5BP+fM2CCCBZhR/YP9O0fExWsOIArBA1N1MhArXll7k9Tomfnigk1oWQd9q
         d0APegxagflHCYNmEkig/0lD0gUrzww5xDBwXwSVfR8uY1DSDTtwc7ijlKuxlxlhlNXT
         yQ5Sau+YSrCx4/05E+qJ3yaYLbCmffOmJLMxqVyxGfbJPds4z4WCwIszM8UdG/DdiFGR
         0QEdRR521yliPEJJrWG2rLcOoqLM2yAhi9LIQaUsdJhANdH2FzU4zt/imUH6w7ZfWhEb
         AB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368818; x=1779973618;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqpQ5DH7AnGW9TfLUP84bMGaHd/GMC9yfpeTxEpheNI=;
        b=kZJA19GuQrVuZRzVhDY0TwqocMJtVmDP3JcV42icRtxpSqFw59FX8UY0QB7ojRMd/u
         3ZUgIO/RWL4zBETAsqhEV1Z3nzftV7KjwcvFElvv+8n9UhwdIPV2VVf5Rt++/D2Ya3kp
         f92NNBcNTOQm5UEn1g/zbck4PDOipjJZXH+XPPvskBqFop1IdTsx0vNlwxCnv7B2buT/
         JsWXsR6/SRWrO55cCUluwH61AeqFHhs7VnFd3u4peQw1CaNhn+ZV/6V1JcnVcpWLjbmS
         yIph/wTjJuMZOHiFjGTC1K983Yt3kPaOxohL47uFmkOjxHxVjnrm6Q4VoQ39pFT1CEiz
         16CQ==
X-Gm-Message-State: AOJu0YwMYYo5xHfTu9c27N2AEywdVSgn0l5DFs8LBRZA12B3woRNqH+q
	fuX1xhuVsPQ1cJEPUWK2gKRZOhuSBFojbCaOf0pB3I15xSmipz50XQL7OEWwmF6436QH2Yp73Mv
	T5tsGgjcZUJe+1HMVs1/OKkf3Wv9rNyB+lZzslFFq+KySqUWeq3grW/cUYx8Vbe0m4YyI
X-Gm-Gg: Acq92OE2d0VHPFq+RWwCXtr6rjoOg1wH61IIEryWClCQa2jafVxEZ5qHwwv7pAYlt3s
	d2d4TWGkZaBnV8E78s2x0Fg6VtrCOzxvCH+f7XfxVg2euI4DGHnanXETPDUgIRAa1Sw1Wvscr3p
	0JWdYh5sxeeNck4c06Z3Z2tg63UsVnmeS9xbDY1Xx4tLjXtePhlj2ogHcVYa4K5JO7NhJ1ZiwIG
	SiR9qDmuMCj9bwVLBOmzJdX5PoQM7Vspm3zpAJgS/Ga8Udt0+zA0rLXUyr/jhBwUau5c97BApTo
	MP6DKrg/kz50gCB1PxCQPHk/vL3XKnG8Y6LoDP7cDmTzJ9dtnYaxnIec4BLJ1RFFEq9C/5y10d9
	DrGLCHGopKCtEGuM1eBQLzARbP40kkGbBIkFmZmfUAA3vBbPVUcN4gC/KIsGnBg7sS6o=
X-Received: by 2002:a05:6a20:9153:b0:39f:7183:b1ee with SMTP id adf61e73a8af0-3b307c39a73mr2869407637.15.1779368817770;
        Thu, 21 May 2026 06:06:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:9153:b0:39f:7183:b1ee with SMTP id adf61e73a8af0-3b307c39a73mr2869359637.15.1779368817141;
        Thu, 21 May 2026 06:06:57 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:06:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 00/18] arm64: dts: qcom: Fix PCIe wake GPIO polarity
Date: Thu, 21 May 2026 18:36:33 +0530
Message-Id: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFkDD2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0MT3fLE7FRdw5S0pJTUlOQUQ3NjJaDSgqLUtMwKsDHRsRB+cWlSVmp
 yCUivUm0tADuf+ehoAAAA
X-Change-ID: 20260514-wake-1dfbdedcd173
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=4245;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=A1erdMljftPzXLhP761c4LquhX2IG3TsIQ4FnVrpWLA=;
 b=UrI+qSHz8vT1QW0OUcxoE57oAXfp6aIeoN58p+91V9UxF1IP1b/3XzCjSKsNgLJp8Y+QxkkJO
 hMj/CvgTlQRBNoOBJiK3MY0wMsY9gLcP070eH44gD5aExq1aH5QAgrG
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: j1V_plATbzP6DbbQkGcs6LXIObsJM6aa
X-Proofpoint-ORIG-GUID: j1V_plATbzP6DbbQkGcs6LXIObsJM6aa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX8cUJq+I+nSQt
 Em0i9TCajHSBD86gGo60S64hdppCou6I8FB+UzHMWemQuGVoeWtPtsNHISW0pwAfihL+LyYA5JS
 c0jjIZcNQkaev7kpAuiAlVhTM9qrFUdEny6+OGCl4GWyWp0xvlJh815XjNrXmBaddyXgyw0encl
 06jLMpVfbXvqhEoaBK33xyJbT1uCZxHDK+8vz7IuynvTmnSA/imsfmbtWGEtcOFTzB4of51o+bv
 b+8nYWa607aPzwaRCtzpBYsBbW/kvBTo9L7j5hfpTKririSnZFXGazCjiDypHUglW/JyivUR+fA
 wv7nym9JMaVupb06IOYLyyxjyLAfM1gYo7S9ki23DkFZAGdWYQ25O26RWzq8+zsnQPLh6qoCJ+e
 LdXee2wZ0hn3zKxew4ot24isVy3fujI8lX8NJzL2Mm8FhWP+8dV1otyEtXJMOn8TtKep++hvekn
 b/xWBpzLEeHA3PeAAQA==
X-Authority-Analysis: v=2.4 cv=L+YtheT8 c=1 sm=1 tr=0 ts=6a0f0372 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=f8wifmFjKP8xEeO4lJ4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109070-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C54F55A689D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PCIe wake is active low signal as per the PCIe base spec, Several Qualcomm
platform devicetrees incorrectly describe wake-gpios as GPIO_ACTIVE_HIGH.

No Fixes tag is added as no functional issue has been observed.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
Krishna Chaitanya Chundru (18):
      ARM: dts: qcom: sdx55: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: msm8996: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sdm845: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sc8180x: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8150: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8250: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8350: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8450: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8550: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8650: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8750: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: kaanapali: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sar2130p: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: monaco: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: lemans: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sa8540p-ride: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: kodiak: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: talos: Fix PCIe wake GPIO polarity

 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts                     | 2 +-
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts                    | 2 +-
 arch/arm64/boot/dts/qcom/lemans-evk.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi              | 4 ++--
 arch/arm64/boot/dts/qcom/monaco-evk.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi        | 2 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi           | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 2 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts                      | 2 +-
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts         | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi                  | 4 ++--
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts                | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts           | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts                   | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                    | 2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi                          | 2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi                          | 6 +++---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/sm8450.dtsi                          | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                       | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts               | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts   | 2 +-
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts          | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts                       | 2 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts                       | 2 +-
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi                   | 2 +-
 34 files changed, 51 insertions(+), 51 deletions(-)
---
base-commit: e1914add2799225a87502051415fc5c32aeb02ae
change-id: 20260514-wake-1dfbdedcd173

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


