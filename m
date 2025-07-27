Return-Path: <linux-arm-msm+bounces-66784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C2552B12F2F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 12:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6CFA7AB6CE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 10:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A761FBE80;
	Sun, 27 Jul 2025 10:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkTASEIu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EAF1E25FA
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753611785; cv=none; b=TSVPOxO5qnpynUuhd1eRc3aIOmSdXeH+HikBDYk0ii+ZHGtwvbAXpOFE7tFIezt9cHLtzXGEElpayu1OWTYupDD0r7dIC2dqfxNlPvLmZBJsPJwexnZ7ee9vOE1tKwXY4toELSnTkcoPiuHTFKKSRVPmnmD6B8aa2fQGkmLTqLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753611785; c=relaxed/simple;
	bh=8DwKT04rjXh7gfbZDcGLfNPPJTn3YtOLy32/XEy6SVs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lil8UIcGeV3hbjmJ3U1cO54Um9W5rN69MHKDRAb1yyUSejEhV05XeGGlyTW0xZchFIn17WWHHjspdUPigoNVODcS1dMPa/RhjBawqqWaWyIoEJ3TojjOtSg68+D84xo17OrWY96FJ0ZwB78kBcm+HyXfYwikqf5dNtwXL/JqahY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkTASEIu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56R8hp2N022350
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 10:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e2o60zCqNZTINfuz6mdS8i
	U8eywS1k6uOxBKlOKGowY=; b=kkTASEIudwePFUObEUNg3oURWma+py6sDGWbg0
	bRuXgf2QwuvWWA4bPw8OOarSaEP/uSlLb8g3/OsmER4Z9p+q/LeX8wXNPhEl7qzT
	9yG9jRgGg/OlKlRtC4xXZ6yFe4FelvmmANkC6mIMFW5Jdu8lvsHMQWoZFyec5f1A
	4aISrbtN1qG3+3fHycpvo0QdeqCO0I5NGoDEcfLkKXrkVVAtX9+1Jv3sOM1J7Zs5
	IBhp2CdFaq1NWSz7egqqrasVTPA9jKPrEZ/880nHP2hoA2ypz49l+M02xSPuAIXk
	9Xys1TOKK5m+/lJuTMdzLtUg6SfYll966mYrVYy3X/JBGFIw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qhvsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 10:23:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2356ce66d7cso57858395ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 03:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753611783; x=1754216583;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2o60zCqNZTINfuz6mdS8iU8eywS1k6uOxBKlOKGowY=;
        b=LqYz8X50gk7aalV1Zm5oGwGi8CyDX+assz4Nz0iZdVionXUr+uA4BNrs/zud4puEFk
         xqfZM+pE7fHMvOhVhoLRxV+CSues1+lKaXb/ONGY61DjXZbnnaaq57YmJ8YAAceHLBWx
         8StnsMwuyBq5+kH6VPxNP5mB1YLeugY6OzdTUEwJTBPLamqhTgpcR1eVgPAoTT9uAyLf
         KVvWvURIHwiyM9BwhqDSdljWKcNKx02DjcbboObIss79AkosX4VrCMuWDrLc6IK/AEjw
         0FBhElupXhNuvW8ainDdHEI4JUFYOnL7+/tQphTxuRmnYmmprxOiT5n34hy0+MVPg08a
         59Tg==
X-Gm-Message-State: AOJu0Yyk57WJ1btFLRZUy1I6AbpE+UQmMQuKw+FN6rnalalHEOMaH8bD
	hkQYzlTEkJ9HttiJZYuEf36XWaYarZDpROBmwtWb6fL1CoaYUcDL9/TmhLmFbcmVJQm6Wk+1JrH
	e3WmeZsz1Wovi2JVBLuAntOcflKqXbDw9C274BZqwxw0CqdlyhTzi2KTrbRtJ6jRMm5+6
X-Gm-Gg: ASbGncsHuP12kAvYxZ9XZJLJOAX2+6pdFYr0xrcwxN4/Viht5oaflC8RZCkqExYbmSo
	eBuPN0uvOCCEkFcr7LToR98wifwYUcqjne3/xckIPAlbH9urjlI3s2Iq/IuiELWr4zho3F0HZ2b
	Guqlhu7Jg0AWh0jMGX+11vosl2izAqurQLQ85LAd4tk/TNX8Z1TUWrG4ZyBXA4SKjWVSmXmEFlm
	N4wcoxaNH31WL1b6pw4MSCQ0isG4VdGTj1opGuZTnHkqxFo1ntwQb+u7XC94+QhLcqqNI7JNWNv
	7wJxnhJN2OoPl8BtYfN461O3hLkLzb5nphALpsv1K6MYjFYs9KQMfS0MzDmCbl5k+1DbXaM23Fo
	dpH+zubbaXOEcHQjNC9hogW+tcJ0=
X-Received: by 2002:a17:903:32d1:b0:234:b44c:d3c8 with SMTP id d9443c01a7336-23fb31b3056mr100413945ad.37.1753611782664;
        Sun, 27 Jul 2025 03:23:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzXHfyaoToeve/vbtpWJhmmneI3J3cmISb1enYYBovamI61z3WMPaTMwxyqWBWEQwGnYNVeQ==
X-Received: by 2002:a17:903:32d1:b0:234:b44c:d3c8 with SMTP id d9443c01a7336-23fb31b3056mr100413755ad.37.1753611782216;
        Sun, 27 Jul 2025 03:23:02 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe533b1esm31869715ad.158.2025.07.27.03.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 03:23:01 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Subject: [PATCH v7 0/2] Enable WiFi/BT node for qcs615 ride board
Date: Sun, 27 Jul 2025 18:22:35 +0800
Message-Id: <20250727-615-v7-0-2adb6233bbb9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOz9hWgC/3XQzU7DMAwH8FepciZVPu10Qoj3QBzSxGWR2Mqar
 WKb9u6kLYch1kskR/n9befKMg2JMttUVzbQmHLq96XAp4qFrd9/EE+x1EwJZQUKw0FarmRQVkp
 HjWxYefk1UJe+55S396Ue6HAqYcflku0oZz+Hbarn3ywtGgta1ACNMIZLfknnE9WXqe1rn3N9O
 PnP0O92dTlepj6tz8Snm3TcVC5CsE5rFdC71pfMLnQewTnXQtAY20ANaM2mibYpH/vhPK85ynm
 kPxuNsvQPTSNNY0xHqP8NMMeM6gFVhZbPiAgiWK/kCtUPqOaCl1mdIWFQdGqFmnuKCzWFSq86N
 FECRlyh9o4qtVBbqAFEQkHKelqhcE9hoTBR1TppRRtihAf0drv9AOqXpOFWAgAA
X-Change-ID: 20250704-615-21c25118e919
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753611779; l=2003;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=8DwKT04rjXh7gfbZDcGLfNPPJTn3YtOLy32/XEy6SVs=;
 b=xpeZg8CmWgMk2/1bVi6yUmqLdhepGb6dgMgTlIOC+JN9hBoDCIIrR2iNJLoB35xllsr8AutA6
 bQfte9oDGmhBOQ3/CLh/QFCc96U0g9+8wwz8L/gd9yHN/VEmppEmMGj
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDA5MCBTYWx0ZWRfX/MJaQ8+tPTsL
 p46hgRnuojv1NGr16OZ2zZvPXEu3XAJL4fMxN+QXj2EsAq002czzijVY0zVcNkul6MfK88QDb7L
 VAhGmzCj7uXPp13ddeutvGVuJ8IDOssWvAc+7uX1u9nJeyPPdEJBSxDuqfBOlc5ka4ZZUb7RDSA
 DZcoSR+5v45X0q58Uia9K3RoDzIVHAF2k+DETsyZboTMZIXDML8YUUcTNy7/6EdtwDXlwwYa5gB
 eSEysMY+W2uf5e3WuG3NVRa1FdGr5lSfKW96BztlTHp3Mwninyak1XWOjxkbIx+r+YimDPqPzYe
 c9XhwAmsredIKHB8coZNLj4zAayIdocOUEGgaAO2QBd5nEewgVYqzZi23cunFh7rpcXxrYGf6O6
 LMfgnbvB/Gi05VB0SWhahlYtnHFhIlPM7fJmvTCEfno6X0GbHO4LBavbHZicazBs2AwKUwDM
X-Proofpoint-ORIG-GUID: GywWGdvBKnMP94XOtLRxW6dzyT7f0Nrx
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=6885fe07 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=TmzUbGvDyKMaPb01JRcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GywWGdvBKnMP94XOtLRxW6dzyT7f0Nrx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270090

This patch series depends on:
- PCIe
https://lore.kernel.org/all/20250703095630.669044-1-ziyue.zhang@oss.qualcomm.com/

Changes in v7:
- Fix DT node order.
- Link to v6: https://lore.kernel.org/r/20250726-615-v6-0-42b8150bcdd6@oss.qualcomm.com

Changes in v6:
- Fix regulator pattern.
- Link to v5: https://lore.kernel.org/r/20250722-615-v5-0-4677e70e25ae@oss.qualcomm.com

Changes in v5:
- Fix DT format.
- Link to v4: https://lore.kernel.org/r/20250707-615-v4-0-1a2f74d167d7@oss.qualcomm.com

Changes in v4:
- Fix node placement issue.
- Link to v3: https://lore.kernel.org/r/20250704-615-v3-0-6c384e0470f2@oss.qualcomm.com

Changes in v3:
- Formatting: adjust layout based on reviewer feedback.
- Fix DT checking warnings.
- Link to v2:
  https://lore.kernel.org/r/20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com

Changes in V2:
- Correct the version metadata of the previous patch.
- Separate the modifications to the DTS and DTSI files into different
  commits.
- Formatting: adjust layout based on reviewer feedback.
- Updated the email address.
- Link to v1:
  https://lore.kernel.org/all/20241203060318.1750927-1-quic_yuzha@quicinc.com/

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
---
Yu Zhang(Yuriy) (2):
      arm64: dts: qcom: qcs615: add a PCIe port for WLAN
      arm64: dts: qcom: qcs615-ride: Enable WiFi/BT nodes

 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 135 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     |   9 +++
 2 files changed, 144 insertions(+)
---
base-commit: 8d6c58332c7a8ba025fcfa76888b6c37dbce9633
change-id: 20250704-615-21c25118e919
prerequisite-message-id: <20250703095630.669044-1-ziyue.zhang@oss.qualcomm.com>
prerequisite-patch-id: 37d5ab98a6918dba98ef8fd7e6c91ab98aace170
prerequisite-patch-id: 1693faa1e23bbb0a37d4fb9cbe13e5dd43148ce8
prerequisite-patch-id: efa688b2ddd5744df7aef40182787ee4ceb90c98

Best regards,
-- 
Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>


