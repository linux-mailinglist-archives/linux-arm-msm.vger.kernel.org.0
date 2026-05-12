Return-Path: <linux-arm-msm+bounces-107092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJYCHsQoA2qw1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 15:19:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC28520FD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 15:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B45530945F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7FF1448D5;
	Tue, 12 May 2026 13:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9JtV2wp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GyUc6BdK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999CB3E172F
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591147; cv=none; b=FijRYch1yLF7QAuTLHROFYCbRJ7fT401ZJx2wDTL1MZ1Xnc8ltsHI3W6i8H9JcL39AKPZqfZVoo58WFXTcMSXArKchAXmFA3+nnT+fyCgr5JoIH3k3lPQJu6r8HL03hWd/W59+b2R9kfX8uHYWkboh+avCTEy8hOjEWN9lsMOho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591147; c=relaxed/simple;
	bh=E6HTe7QhWugVTgCEx16GCBmY8B1fRy9ivVI2YY8eg8s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WOBZSqvZwF21Vp3SsK9JuvtP4deXW7MEqDpBRZL9m54/jpRxYrxu5SOPQ8Gi7QajQJb1DhPm4kV7tR8G6Rt28WBVIXc+S7WO8S4hEa0CSByBZL+qGzcMULoEkmoDDzdn4Te28aofNk2R/NlATfZuUTwcAvhwv7EXGze5QqnwkLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9JtV2wp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GyUc6BdK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB5MP5591851
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5rK6KbR466mqH0pAQLxyFa
	oUgNlu3VncNyO+h/5FL40=; b=P9JtV2wpam6BStfEJjDS32ktWUaQauosANpT/I
	raA/tO3Av7QuNTS6Chn5WMCAX6I37OvzKvLO66r3Wi87DtFR6nxJfzZBq7efhG5L
	RX1g5TvvwEMY5bvNuiDnoC7/uDsaOdPXy6EI7WISYDZFQhOc61Cpf8LbmV+VuGJx
	VA/1i4IWYZdJKkZYLI+jldwwVZPFjmYWX4yPbKUhK+eLugRhJbajiqjGRNSpRAh5
	Yz72Fv/xRk/PLQ9PZG4cWLwgSQi17DPjle5xt9OQD9JYdjah9FyEx5FAFgvlwcE4
	hVhAkNPnAA9gREdKbOMRApPT7llvgo+ANNU9bjRnKOA5r8CA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319rfr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:05:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc977e6aedso30086345ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591144; x=1779195944; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5rK6KbR466mqH0pAQLxyFaoUgNlu3VncNyO+h/5FL40=;
        b=GyUc6BdK6iO0FPe3wvDz+q22BJ5JRTS0aoDCd2lqOPw1HoS3TbovwEUcc8SM2IupzA
         9ddpaWMiTZL6VNBve4miMyHGabLmV90/6fP2o7KvyFBHUSuIUuA33HXfbNMUJzuMAgfd
         qOhMduqJDm4FrtkYGwCBtQuOhYfJD/b1VTpK6czgihvUPbKzb2Sdgcyd1+Ie1lUd148V
         U5K3bFi5otdSIZ8Wkcj/LZEUzSQrbIQiZqj8CyM0Ux3lmt8qhhlEHOVx+9mFEQgUV0Wc
         msgFK7ZWtoE4pKQ7fj+F6SWIvZhSYCmJr6ym3AMvzhBz+FdW0xEUhArjWAhFQoiuzN91
         vSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591144; x=1779195944;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rK6KbR466mqH0pAQLxyFaoUgNlu3VncNyO+h/5FL40=;
        b=gY3YDBvnTaraS5V0LKfX5pDYpRObNpFT55GOgZNY9vwutB/6dh8w68qGAyvTRfNVNH
         T4pIJOUXnnHOM5XMW1FIGmg6QqKZQbaarfRA5t88TooOOfRB/V2mr6BCOIeTqeCNJA6u
         VkyRLo8QDAuLnQDP1fEmUoVGN/zpaG0qikN0+8F6YyqJxWquf9JyoVbJx9o4ENJZBY1A
         P7LgSuYgyxH2EzglcOUVcy9tKB3KsApgNyXY0utK5lVWHQR0TZX0uf8zZEgBMeNT6Ay6
         dOUoIH1ndJvFs4o7gZqLx8fogkbLxaQLz1feuINHj/3FePU8MTEq/6pvlXrpZFCCyRfE
         QhZA==
X-Forwarded-Encrypted: i=1; AFNElJ+CAOTy6L8Rsvz+euduxu1AY81/ic5QqbVccOWTJKk9iBdEXoGsfY2xdJexGAIGxQhlDooWhR1x2mc8hkD9@vger.kernel.org
X-Gm-Message-State: AOJu0YzTxHQ0bakP3s5cCaXVw7SwQhUkbqeKuwWhLxIa0BrB5R1/DCdg
	ypXerZir2azUCcJa1TJEKZf8SA8DJAd/ApkUTGN/lotFu6XP3MKvoDiQ8WZo8T59Py+daxqCZA2
	PoVB/7Zi0qZqOVRfRGCuvLpK7AMgHE52x4X9aEy/0b3az1+qhSMiDiBOzMCDXi1IgULRe
X-Gm-Gg: Acq92OEJS/8StlTG8A7djZA5ScjMQcxpoLm+WMUya1EIejtJRXEpmJWG1jJvJowneWp
	8XG1eUcaHCI3/1UEj1wrJIVY0RoveeRo2OHXbTX6iGUBzche8e2mRc9Dn4/PUrk2b2uP7x0JXl1
	EPdLyy9Tm+viVmmmWw1Z0ShFRHLP03j+4GlnnV21z3N7PlRUtJoAw8x8r67EhdjTlf3LHZrqtsc
	OJc2/UkQ3ZNO/TpHTjYSe2UUj6QNTw08sdDZJTFWlRrqjc2eu1bzHsGhuk+vT+7BYRX9JAVGYWI
	TNA2uykn3ypxU4QIWuSzJt8bldwfCUTnHVvOy+y6agkp8Gmu/eLfCkKve8CieMfID2YO8hxHr9y
	SZUMJsevaAzJDTtyAJaK28Lb/un6wdLeDa6RRil3njNxFmcksdhtg
X-Received: by 2002:a17:903:3b45:b0:2bc:e299:4c9e with SMTP id d9443c01a7336-2bce299510fmr52780025ad.18.1778591143584;
        Tue, 12 May 2026 06:05:43 -0700 (PDT)
X-Received: by 2002:a17:903:3b45:b0:2bc:e299:4c9e with SMTP id d9443c01a7336-2bce299510fmr52779605ad.18.1778591143065;
        Tue, 12 May 2026 06:05:43 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e36c65sm137630785ad.40.2026.05.12.06.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:05:42 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add camera clock controller support on Glymur
 platform
Date: Tue, 12 May 2026 18:35:25 +0530
Message-Id: <20260512-glymur_camcc-v3-0-a7196fee2779@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJUlA2oC/23M3wqCMBTH8VeRXTfZjn+mXfUeETG3qQPnasuRi
 O/eFIKKbg58D/w+C/LKaeXRMVmQU0F7bccY2SFBoudjp7CWsREQKElOKO6G2UzuKrgRAksFlOW
 FbIqqQXFyc6rVz507X2L32j+sm3c90O37huAbChQTrCrJScGBSs5O1vv0PvFBWGPSeNDmBfgwo
 P4xIBpEZK2kNWNVWf8x1nV9AYHNHPTzAAAA
X-Change-ID: 20260401-glymur_camcc-de21745db58b
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNCBTYWx0ZWRfX13lr4XkncUBj
 Q8UZrnLqslOnNMy+axPD8bZZL1Jt++JIMV/3KrBWL7EfiEdKooIYWrjQdpaLFnRFOWCUxhb0kpn
 rpLBtyGLDKq/qGS4gE2puT3SCi6AT7zh7YzMpcYybKr5xC/TGyNz2zMgvNsgB+wuCWk7NI1bM6i
 2/IrRskTrC6LR773UJ036/jBi4N606KWxiHx838N11voItVlFKEKaIcLV++m+kpjQ2NloyJfwjZ
 3Behft+J4xtJhytxaS4QQ8kC3DNB2ulxq3icaW9Ye9SFM4ysjKR4z/rClMg3kik+Fh0EOkR2K4+
 O3Yj2dKl46uY72FwQtJURJ5EpCsigbH1DTI669CJbtnogWigdU/CJWzYCrcKpyeKhD+EooA6o0M
 8YEwb3m6JDBtnWklyzsVH4TBymEFn1I6ZzVnJE4rqFLJLqnMnSKq0QRYeV1iqUL3ATLSHourpA0
 XResPIUn06k/xhqf3XA==
X-Proofpoint-GUID: wOOdrldYmYQuVRamsj6bmZB9_ejH6M5s
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a0325a8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z_Sb7eu1-GLCsw485GQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: wOOdrldYmYQuVRamsj6bmZB9_ejH6M5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120134
X-Rspamd-Queue-Id: 0CC28520FD4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107092-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for camera clock controller on Glymur platform
for camera clients to be able to request for camcc clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v3:
- Dropped separate defconfig change[PATCH4] and included it in Kconfig
  itself [Krzysztof]
- Included glymur camcc header file in the DT patch
- Added R-By tags received on v2
- Link to v2: https://lore.kernel.org/r/20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com

Changes in v2:
- Updated DT node reg property to use hex for 0 also [Krzysztof]
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com

---
Jagadeesh Kona (3):
      dt-bindings: clock: qcom: Add Glymur camera clock controller
      clk: qcom: camcc-glymur: Add camera clock controller driver
      arm64: dts: qcom: glymur: Add camera clock controller support

 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    3 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   17 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-glymur.c                    | 2280 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-camcc.h      |  122 ++
 6 files changed, 2434 insertions(+)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260401-glymur_camcc-de21745db58b

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


