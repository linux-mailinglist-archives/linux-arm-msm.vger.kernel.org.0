Return-Path: <linux-arm-msm+bounces-85861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D38E4CCFAD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88AA830C6211
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F45332905;
	Fri, 19 Dec 2025 11:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MBqh7/dr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrlvyJOv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBBD3328F5
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144756; cv=none; b=SHNP2U/1dcmARXhxSOvBzVbhmJ0zp55BnLvKZrmWEMc/Lpl5zO5SKPtv8RXEwUE2/lyYNh8eyY3pRmc0t5F/13S/p3R1xWjoRypZDdhh0jCpw3BTb6/RHYGA+mYEaDG0TDalcChJM6LliSk8xJSwsKcHTJ4LtcHGWNreAo3EYz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144756; c=relaxed/simple;
	bh=lpV+b6RTMK2xAuBBkM80RLt98xkKBymln2pptCXiOAk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rtLE4bfaVM6+i20ufm9To00HAFZnsDUHqQDhP6NwYcjqZ4BWfbY/XH8lXZJMvEDBhfyObZCk/BtaiVihYF3vTw/g3C/sj0zi8yX7B64Zca5ZnQTgm0QHCTfLjt0KHWDZTFHAHuV9z0mb5NjkxacpC009igSOVPLUiDm5A8sLGao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBqh7/dr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrlvyJOv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cBAP4145506
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZAGF7cKxnFx78DTWYYuRlJ
	7aX6FL+Uo5SjUqoqD10H8=; b=MBqh7/drUtChb4+eSDnsX46nkmO7x8YwMJtOef
	peEdYcuya7QHGmAEBJVtEOlbPMnABi2fX5OGnGf4M3NBcNIsTmj/cg/AAeV5m5GS
	CXcGmC195bU7fz7cWSNS3DYCj0x8ryBNZed0FDcA9lKsIfqeMCKJ1wVQXf3+x6cH
	9P91z/GPH03fF2qr4fpzjoaiIiKeHZagbVtQdskLhumVFqhnanNW1wsw49S8PSU5
	5JTZX0FPgL1ocJPNrh+Zru+zMl2S8oWZwAxva3K2v7ZDPvOtm/DwNlmZ0HDXCsS3
	VRY+rPWTmF7PX/iKuiLGk24MPiaq1R4XsQAQCkDEkp9uE8Ag==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2dthjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:45:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed74e6c468so22443561cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144754; x=1766749554; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAGF7cKxnFx78DTWYYuRlJ7aX6FL+Uo5SjUqoqD10H8=;
        b=SrlvyJOvJ4LhL8lCnsX+cX1pQL77W0YJGJvI61qMec4DHdDq7JrEyVwQDMgw6YW0p4
         XfoxsunC/sH8Fo6xO5R5iJN3i0gUGsWKgpTkILCZh7S6nEeNlQwup5Pwiw4WnociBLN6
         NmAx+5+RVmooXQeNgNmIXfI9bYTgKMy8s09gw+0XWbBALW+9bj9thrWxazW3sZgqhsrC
         69C1QjXyvE9SBNcGTfnnjIx1UqM1KX//Wz6M43jm5fwmE2Mbw30XgEpg1aPJQVhX1nWe
         cYqRkyVjytDuC6PSiv7R8+cnCqAWa4YPTuKX29USyVm4MGoEdU/CmHteCSdiLZyZ0MoP
         /wiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144754; x=1766749554;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAGF7cKxnFx78DTWYYuRlJ7aX6FL+Uo5SjUqoqD10H8=;
        b=ESCLoZ5FrdGtLy5wFD6CLhfox4pteHl7aR/7aWPAMCwk+DjDQ8Nekc8zhmMuxm0iN6
         q+oD4AzxUZTYIk8+rXQZJHGVVp9OpoetU+E9/3kZ65nX8GjuGW9+9sChi+O+Q0T++QbR
         qjlciv2R2eC/0O3UdIwZoApsTSMN/OBObJ5oZCH9XJOG5qqwwjXdleBNOcVB0nSHExif
         wdQCiXRMi1k0Q0wCjYfhitEDFz1ZQ2WU0BZkcsSKQjSnTKg5pBu8o62vzWzTaJb+Nu28
         h+382cF1LW391LtIWCnM6MmZufiM06oFu0wrG6B4d/xMVgZb2G2QJCvj47DLaDc2Nspf
         zCnA==
X-Forwarded-Encrypted: i=1; AJvYcCXWnJUiP1bS058HXXG0UmXMGALawEZK+VMO2fwYSd0boFUuGzGxkOB8xVEJ2jtPW4TegTXwcB7tOnTSz+un@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6SLbrOyUpW4QpHBTBvcHFcN7FCusEt5gu4litAVl2EQWq1Igq
	oFiGhdvmTg2rfLw/WluMAwNO7y6MGxctrHPK4XyjflYkLRZ+Gy4M8b0aO6LU2xhnscqahbZImIj
	ZsXwGIsaunG/NcRU7M0WD36JkQF9p0k3vVXs6sLWhvJGPjIksfcZ9/13RECOJ0zGHzEnY
X-Gm-Gg: AY/fxX66HebImDwUl/HG0/NwsKD/M+cLqlEyV/LxS6Uk2fKRvMYFcJ3SSkbnk8nfFTn
	DtPiAKbny/stIwZp2Gh358EQH8GZvAlkQ3Sq/lHpToxVM4iBZ9DGv2F3sYUyHpjBOTPZ1nioAvI
	c4vTtXE27H6P7xk86qIvA9Pgb6oZLNlYBXVB34FHH7zqiDkdGyeRf6myylWMmVWtlmMWcZJhEsZ
	D/yP6aZYdL27X5DL2e6h0IbGHQ913MtWec3JgVSGsNZqFQpMkk68+HxjyaRF0wabn7fIH6JMKLL
	8oiCPtFb2rja3nVRuXHmGqxBUoRuEX5Tphpr3etFbg5uAg1JT9iSGTaxWNK4i4zadTeGBXlEGvu
	h1AQ8biDboNts8NAkh/MgPKTqxgJUXzPVRDZpu2RrKOEbMVcq3HqZxGPvtZ3x7MFA7eEe
X-Received: by 2002:a05:622a:99a:b0:4e7:2d8b:ce5f with SMTP id d75a77b69052e-4f4abcfd66cmr32639331cf.36.1766144753613;
        Fri, 19 Dec 2025 03:45:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECHjUQGSS+o9oeFzy4rNeKOQT9DaosE/I7NYz27StoHIujvDAzf/eBjfHpgo+cqMwM8854vw==
X-Received: by 2002:a05:622a:99a:b0:4e7:2d8b:ce5f with SMTP id d75a77b69052e-4f4abcfd66cmr32638931cf.36.1766144753118;
        Fri, 19 Dec 2025 03:45:53 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91599844sm1974465a12.25.2025.12.19.03.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:45:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/5] ASoC: qcom: Constify few things in audioreach and
 topology
Date: Fri, 19 Dec 2025 12:45:43 +0100
Message-Id: <20251219-b4-container-of-const-asoc-qcom-v2-0-05fd2ecc06fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOc6RWkC/4WNwQqDMBBEf0Vy7opJbMWe+h/FQxJjXahZzVppE
 f+9Uei5l4E3A29WwT6iZ3HNVhH9gowUEqhTJlxvwsMDtomFKtRZSlWBLcFRmA0GH4G6HXgGw+R
 gcjSA60prTV1bXUqRLGP0Hb6Ph3uTuEeeKX6Ow0Xu7c9d/3UvEgq4VEa3WqtCV/JGzPn0Ms+0D
 nkK0Wzb9gUuXH3Q1QAAAA==
X-Change-ID: 20251127-b4-container-of-const-asoc-qcom-cf4bba99b341
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lpV+b6RTMK2xAuBBkM80RLt98xkKBymln2pptCXiOAk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRTrqVpqvHbRzHHTwe1x/91aWK+fHF7leW0Obb
 UkSvKzgj1aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUU66gAKCRDBN2bmhouD
 1w53D/9LRbKSZcVHj/FYNsTCoEtI9GRvOJphUUpfMPIu0VhTFXCMvh6MOSNdGtop6xVVIRQ3Id0
 4Wr8RBhsA2SLTH+wgnWPUycEUgmbXSpYZ+ZGxpE95W4VE5sAyy9v0DBMuk+RgF4739nODcLdOc5
 WI5RY2i8N5NoGUikCFbUZRtzhoqukDsosiE+ZI+ReKVwPsO1A8MwDFQjoJueGwZ6tOwf6wn8JYZ
 rtoPn27tMUn65TNIF4f3CehXA0FoFy3rJSaAslLfYG4FXJLQoeqrjJRAKeG+/zodmE1N1pzvnyq
 MOTAqqin7QEG+LseXYtLxRKh8AQgQaRq28lnd8R4Ztvp9F/bgt+sPM62Vg3aODxvtAdUvQAeXSL
 /imdXmWc4MP9uSsupg7sFUL9tu1TDGDMabgwrR94TaPo9NhxNU5nIZNr8fTDhkyOI5SMBqPgbL8
 DklOyfkBKxlAKbDF+4bvphlzzaA1Z4wki3O2M8TnpKl4lTQzxHGpPxfep6vX02Tusf9PNVvA0dc
 NZLnQXgdD5nRnEcY2Pv2yKrX6sj+lx0VeSOsqSe+UeF2OmoX1Youe5oWFsxqU1+/HKHyGshINlD
 RvFxPgo9u9nctq0JTmV6xpw1CkjEgChHohzvcbfb+VwttArz0YzA3eRyTP1CpNF1sMjvSTkPUBl
 HJydv/x9usHWr0w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: jJu4EiSkpo2dys7wsSDsFPABD2j28okm
X-Authority-Analysis: v=2.4 cv=A7ph/qWG c=1 sm=1 tr=0 ts=69453af2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=bmr-yfkUNcxH5o9VECYA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: jJu4EiSkpo2dys7wsSDsFPABD2j28okm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NyBTYWx0ZWRfX95ldVt45DnlV
 eEB7Jl2tm/D+WinrKuWP+ArgSb7+sVoQIdyH09x8Vd98KZ3sL2pjKQ4VeIsHv9SNTp7iJSbjiE4
 tb/wRF7dKj25OQ9AhIHzIhvha8Qt33ZI4fN7gTdMNLYzd9kTocf+w0jfkGxJjFhrzBLSoZiRlEX
 hLKy3hEEiNMRRMqSJvq9ghacWabyKlAJOV9cvv0pEB5wWcQU8QBT1xNMNs+gEKZLbnRWoG9m981
 dn0MU93j9KfxtOharQIjzWIlamuFkWWG8s8Y2qOGwRpAqqbhc3nShC2e10e7wG+lPrg6JOnxylA
 cFEuRWzdUa6nyljnK7KczH7rBTdBYUJqVFgL0ofqqIcZ/kUaJ2qinQMKFjEgfa67Mml2XY/9J+G
 xkhEULKzTzLFClmxgQU9acVXs+USWvS2uzQp+oqZIgTUcfG2ELD2xMhEjI8+kFaawU6nBjZoLXy
 PCMig+qac2RH+2I+BOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190097

Changes in v2:
- Drop first patch (one removing unused arguments)
- Rebase (new speaker_protection functions appear)
- Link to v1: https://patch.msgid.link/20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com

Several functions do not modify the pointed memory they receive, so
marking them as pointers to const would serve as self-explanatory code.
Also safer a bit.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      ASoC: qcom: topology: Constify pointed topology and vendor structs
      ASoC: qcom: topology: Constify pointed ar control structs
      ASoC: qcom: topology: Constify pointed DAPM widget structs
      ASoC: qcom: topology: Constify pointed snd_soc_tplg_dapm_widget
      ASoC: qcom: audioreach: Constify function arguments

 sound/soc/qcom/qdsp6/audioreach.c |  87 +++++++++++++++-------------
 sound/soc/qcom/qdsp6/audioreach.h |  16 +++---
 sound/soc/qcom/qdsp6/topology.c   | 118 +++++++++++++++++++-------------------
 3 files changed, 116 insertions(+), 105 deletions(-)
---
base-commit: b6624535ece4221e67a90b06a373bbefd833c2d1
change-id: 20251127-b4-container-of-const-asoc-qcom-cf4bba99b341

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


