Return-Path: <linux-arm-msm+bounces-85846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A7DCCF94E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 206B5302F683
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4118031771E;
	Fri, 19 Dec 2025 11:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbXEfmej";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eyE8D2wz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7265C2472A8
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766143996; cv=none; b=CLz04AfP1Pn4pD14QvUITtv7hH4jesjoCkQj+QDl/BAARSku2VBJiwDOLt3MVH/bSXP1LGpRDIqPzStZOZb+MvrXioH0JFZaJyw+5JjRCyBpLop87XJ1GnzD4w4MDNnRnJzqlkXtjRcPMiT/A3/QN9n8DKs2zPhfibSGwlB3gr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766143996; c=relaxed/simple;
	bh=Lm0f8RErCqjz6+ql1GNM3B7Xn2br6rvbDn2ROLQxwwk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eDovZbJZ9UO7GaOw95htowUcuJjpPZjrXFBk/Mm23bcXI3UOFnxFBVEk1Z/nk/0QBVya+ofZko5zs/jwx/Ib0CRZPeJz9mkpl04NTZXmkR5kVXEk2CMcK94wgE027AFwnvzJyKxdy81xTHoqViorrZLJclvW/T40iOQQkWnHM+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbXEfmej; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eyE8D2wz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBS7qJ3940629
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=md/ZGQF6rQ0IT5bJMM7kPs
	9vYGqTjFwQgP+DR7lrAQc=; b=kbXEfmejrsGCNnRkjEg+4DXfoJ9xTja5Gwbxku
	a9/OiQvU6/02cDxsEmOMTlc66FvDkWuOmvgHd1a2Bkc1YJj6uQdGOT84aCqY15rY
	sWRPyjwM8cKAhBIoDNOotR2altWMfzeESXGHdUaDdwgDFQPSHG4ecPT7loHPnAXB
	tIct7FvVu3+CzKKycM1xfKFVau7+GwPfuIM0VCYDxyBY5dXPK5OBgvr3Hbj2q7+7
	W57vJa24QD/+5pSWIoAYpUkjh7O0hf2rj3gdD3XonpDdXl9HN/jQEJnYmG/aw7z/
	ed/tlSuZGzn/aYxzvrzvf0lPVbyx7WNmRfTZmpNxFDJzDfeg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2gb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:33:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29e346c988aso4288205ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766143993; x=1766748793; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=md/ZGQF6rQ0IT5bJMM7kPs9vYGqTjFwQgP+DR7lrAQc=;
        b=eyE8D2wzpdW5d5pWZFCYO3uhhigk+aGHUMd08AOWN5oAjv3Y13AHzvShMAxZfCGBpx
         JdAz/TgW5AzTZCDKLKGwMrbWlpFXPinZ8qjXjTiDxRuy//hz76zA1rNV1W7YbIKiR62t
         TQdmfgZAxNxacVkoBdBYd0vJTLdRNz9/abndz6AgNE13euap/pAzpNjphQ2z1tAmA3sj
         jpgrATVf9No3ZPrlpgtm/jMgOmfZ/mXbvyX05MxQPqVgU9LK8oRRmqu9ZHhRqqls012b
         55QG4SDJoQe8/jNN+iadeCLUHA4/t8/GGALRN4+vfQx11S7Qo9OlCDh1ktA4Rf3zir9M
         67lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766143993; x=1766748793;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=md/ZGQF6rQ0IT5bJMM7kPs9vYGqTjFwQgP+DR7lrAQc=;
        b=idkxXN6/4iD69u2jFcbBnYRoBLdQNi/bujVxD2qg1tDWrS9BLryh7Pl4BmbU/Z7c9t
         kk21ggHaRk7PohGROrFLzu392UsQFB2QE+4Z05ddIlw7B7iG6ulHQ5OPMmy6FfNDZzG9
         ZSI+uPhheDdNkpD0OOrUCk+2Yeg8l0RP6lGxsFI37jChDGgZGp2JXJkBlT8olsG3mXWG
         ZjlZZ6GqPbF2+q4l43HN6PgbESCeTWgpslZ0I6tUmvsO9Cp+oHnyDt3Vyl6POnUkGtGK
         wdrnT0Xl6z81UniN7fbWs78F6MuHJRJ5PivOqhws1qFPnj4ZlVQFRzk9NaYXa9p3Dbxq
         LMDA==
X-Gm-Message-State: AOJu0YxZ3qysTKzyXZoNE3fzcyOYCQaTOQVZdxI1/0dBq7VeYhalIBr5
	/iqKcmwcUD7K8bipSdGJx3A3/1fbWd3bSPg4DQ8pP9+osYInI+WPXKNhWWBv7F53X9eetBQxgkJ
	WLJhy8NXLQmy5F3iiIvm49Fjsct8f3Ji6sBHKTE+5M0GUynVY/UN+ppVLrrqwQqgDJEJJ3OhjhM
	t2
X-Gm-Gg: AY/fxX4Y+jbZ9ILnr5P5XviYc7czurpKSP9T4BsZZhNopvuH//4vSxRdcu3c4mJEzQl
	yRJSDcRX3iSreFVoXNxoCkYgwOC29KQ9Iddn+9zgoBjM3iqwpDOL1w+kt5tJqVmSs9YUSZlXgR3
	JYHL8q4/h31dJ2STqBFbiVa8XPsJtjGnBEpVTlnNcennZYrfqY7+lZhwLp3Op0rx1fq3P94BYvv
	L0xAbhMTv1BhkDNYq0+DtuXVKypXiIfD3wKlxupLITpZzBUwkr20EhFsqbJN03tH/Ff7OXSS1ky
	NxzV+DwxwkRxdXMWVBtpYhSOWej6qGDK/Z52wcYYkVZV2dTKZQVV8cCFkkVKcMFSo8CkZ+U6FVW
	+bAHC4Xo5xWCx/uUT7Mfa3DlkCY+OfX8hDx2Sfv2vuWjZRnIoCCxhHpF78bmd3jSY19U1f2YBzs
	/o7G4hdatqrlJvKNrEewo/X9bbtq0Ekg==
X-Received: by 2002:a05:6a00:a89:b0:776:19f6:5d3d with SMTP id d2e1a72fcca58-7ff6430c36bmr1831845b3a.2.1766143992837;
        Fri, 19 Dec 2025 03:33:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNNPELfNPtT96jum1gT22jDqiT8wuXrO3dXGrrBJlBP/5A+P1hXe7NnO4lJQMZJtZ1nH+UHQ==
X-Received: by 2002:a05:6a00:a89:b0:776:19f6:5d3d with SMTP id d2e1a72fcca58-7ff6430c36bmr1831832b3a.2.1766143992308;
        Fri, 19 Dec 2025 03:33:12 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b423d86sm2181867b3a.26.2025.12.19.03.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:33:11 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Enable lt8713sx bridge with displayport for
 monaco-evk
Date: Fri, 19 Dec 2025 17:02:09 +0530
Message-Id: <20251219-lt8713sx-bridge-linux-for-next-v2-0-2e53f5490eb9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALo3RWkC/42QwWrDMBBEf8Xo3A3alRxJoZQc+hclFFmSG0Fix
 5JiXEL+vUpyKs2hl4XZhXk7c2E5pBgy2zQXlsIccxyHKuilYW5vh68A0VfNiFOLSBwORSsUeYE
 uRV/PhzicF+jHBENYCgiuhXatJYWGVZNTCn1c7oCP3UOnMJ0rpzyW7D2cwuAzjMOmeX1gUIEv+
 XNyWQvOYVbAoesleWGC0qS3Y86r6WwPbjweV3W83VDPjPSff32Kc0gwEyBQa700pLlFfO7Z2Rz
 gtoll0ziSa+Odkpz4WktHNniBUnH0xhjnhHKmVajYLeg+5jKm73uxM96T/rfDGWteqrDetX0nD
 d9OJf76je2u1+sPYejR1LwBAAA=
X-Change-ID: 20251120-lt8713sx-bridge-linux-for-next-30838c5a2719
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766143989; l=1008;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=Lm0f8RErCqjz6+ql1GNM3B7Xn2br6rvbDn2ROLQxwwk=;
 b=4fMdqnh3sktzTAezstC+lOvpj0HbDS8oR9qtYSevN2/aQzyjBh08Hy10QrZPuMU4zHOUWu6Fr
 4HvEe5oD4YNAmWDhnCzTWA2KyXAuEQ0n1eMhLdXnplPHIp4qRbkWBRz
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: 1aIs2XOys70EuEfxPMa8Tn2d97jZEnuq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NSBTYWx0ZWRfXxQhMf7b4FvHT
 tafeU6BTWm/BQ+AQrBcXZRpInxea/i1wfYWBcwm0VKRANgi7u/bjvsQV7IdBBTBTiwyxomhI7D5
 TLoWHNSjBAnCgbZZKwwKlOIgbMkleeiCeyaiASvlOeFhOPUSL+fpKQQ1Vs0KwEotbYbB697gP2m
 ZoI+poDudxHYtHJXaJ5BCm6Y+3FvlLoP2qHhI8ZbPi+VTZbpbb7ie1+KYT9jIFXg8MgDo7lQTFB
 oChA7mLMdp240vsJStPzxlrRZmHLTAHyvAzbKkI9F20avO4AKRrZU/MJHxtEXwtBY6QwajJjZ0z
 VMsnK299SgeAg3+P7p6PE7X7d4E//A2ENs9Ei4ZwFzBJdmUyS6IZR5dmNcodKnLLAUOIO2H3Mf6
 ywz++VK+24x+bhnlYuYpfDVnbYPO4C4uxfNxpK9kPnw/VvyJkml5Z79M7VZkz6PHT1mw1dAtfSJ
 /WLtsg/iSNhYBpfQaPQ==
X-Authority-Analysis: v=2.4 cv=feSgCkQF c=1 sm=1 tr=0 ts=694537f9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=JQEJCi2ktMuGxaRo7TQA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 1aIs2XOys70EuEfxPMa8Tn2d97jZEnuq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190095

This series enables lt8713sx bridge and displayport on Qualcomm
monaco-evk platform.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Changes in v2:
- Configure DP PHY supplies and DP pinctrl
- Configure in/out ports and connectors for lt8713sx bridge
- Use correct base commit and fixed build issues 
- Link to v1: https://lore.kernel.org/r/20251120-lt8713sx-bridge-linux-for-next-v1-0-2246fc5fb490@qti.qualcomm.com

---
Vishnu Saini (2):
      arm64: dts: qcom: monaco: add lt8713sx bridge with displayport
      arm64: defconfig: Enable Lontium LT8713sx driver

 arch/arm64/boot/dts/qcom/monaco-evk.dts | 94 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    |  6 +++
 arch/arm64/configs/defconfig            |  1 +
 3 files changed, 101 insertions(+)
---
base-commit: c2469dc74020684c2aed314701d999cc37c95717
change-id: 20251120-lt8713sx-bridge-linux-for-next-30838c5a2719

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>


