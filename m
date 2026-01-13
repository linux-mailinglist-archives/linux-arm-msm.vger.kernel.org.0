Return-Path: <linux-arm-msm+bounces-88707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A71D17771
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C61DE300500D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A373128AE;
	Tue, 13 Jan 2026 09:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VhlVsbkl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KgqBz76j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5012ECEAE
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295017; cv=none; b=GgyhM1QlQ0UGgglkPMvjTNqf8wszOI2jNFt0UfFECOPdqlYSoMFKi9pZIunUvwwQQntiwuJiKRKlWKo/jKRweWkoFEEb5z4d0YwzW0f4RL8q394OwutGKdJD+WvLm7vrwlVIMCRopBJ2Dc/c1chVmAoX7cPBofonjk6TNmNXmwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295017; c=relaxed/simple;
	bh=CCrBPfDUHXCLF+sAKdTxaOUPPDGpDxTX/YaIVUXDBP0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Apzl0AR0/i2JtkEP1o41d1DaFtKBCQlWEu9OKAlAPsDQigZSaEWGdPdbK71TmwL036husEjVn0MTnm1eTGT9fG13qiSxElr1Qjvn9kEeNJkCB4j5lS/kp28HK61fZoSS8yo59RM900GUDfJii6idc0DPdRiTkg6mJ3LzAH3sQOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VhlVsbkl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KgqBz76j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5956n2835060
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cXuRG8HdAcGJj40Bzvm3fE
	n/FAs+C8rYmBIErtB+Ask=; b=VhlVsbklC3V1o8k6IgeF+ujpl5QDrP4P0fQFcV
	x5wn/CmPdC34pnd98kXKuPiLxYwcKtSKBdY9NTykBs0faSNk/JpSkXgI5+jOalQO
	7LLrbGpBybOFNeJeA7ierXSDWJPKZ1aMi1lHJO/95HZr+kuhGH888JrEcGlhUDek
	+WM5cgpbRuu5DiYhExL0B9jDxy+A8kBd7EBOmTKD3uAMlhQKV3Uc/CwLVnGGTTmg
	Z5WVv67P3HSXnYLfoil5l3YLTDJivi3+XeTZYtklTYTX5rSzCUHy7ds86sNHh3OK
	426vBD+if86Difz3rLcC6Tn7ff5VnoE5DSuKinm1ElvkvEKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfn9rn4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:03:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6ff3de05so220240851cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768295013; x=1768899813; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cXuRG8HdAcGJj40Bzvm3fEn/FAs+C8rYmBIErtB+Ask=;
        b=KgqBz76jypeNyX6ggiEqVlCgig7mrCsIwIDUWMzAfmwQlXYAAfzSIiRXFt3asarcm1
         6HoeVhzvj7xjhPdfo8fAWU7c2I6K6NFB92VKOJUBHnQijIfFyi0ALDScF93COcg7Cjt5
         VmZtgiD24ey+VlC7C+R7YrHl3PhwedkCglX4+UhtBllIsMB12Ms2/RCHeCRqnXe1b2Y6
         7k4lNaRAA92mtb9afUPOBgS2v16hfVkNRkFkkIlOwlnGQNzZnTJshp641WjdmMHtPaE+
         ui+3VdjOxZh7r9TQClfb6Gg8QxlOcSxjojnFi1kftaycRKA6FuL00/Xeho8NHD3cwJHn
         K00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295013; x=1768899813;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXuRG8HdAcGJj40Bzvm3fEn/FAs+C8rYmBIErtB+Ask=;
        b=UG5cij3PP5Sw0AYlFf2tvI6jTFaqrL4SRLFmzQpsGpoOKlbbQTt13zv9M0bZeLkvV7
         Yi20kIgky4X/4zX4SXOLQ17nh5L6g7zkEfOYUIfPzc4D9D+hOl6Vk7Qc9IPZ/UqSqJpQ
         LKyJ1xK61uTo54X3ElLmTmgR7bFMapbS2PRjkDDFsIMo5DpQH5kZBySpJuV2blApUZer
         ltTdrAqH7Kah06ofn/L8B2V8qu5z56x5to7VAD/+Tuj2hSfyUuaTOLclktcYf7YWfWTo
         Ujs6aZtmObKaZR3UOAd1IIK22+eGdL7Gh4DAPfZfT3xkQ5vRGUV/H6EvFUOmk2nz2ytM
         y1xg==
X-Forwarded-Encrypted: i=1; AJvYcCV9mZgwcNYKebtmDOM5LQfjXMorP11jF95xO0FeTkLRIdTOyXB48Jtf/A1+gin+dH9lFCvb3if8Et6jgYFJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjy7tmARMv9NQ1F5NDDu/g1TGvaqf4D9/URUubx4BBQdqUKr2/
	R+SJwBI0lD71Vd7X2azHHG4Pu+RpBHNF9tpevvr1t1p4IgLT8mj8E4Chf9YHTsUwaAbKZmWyCFd
	oX5H0GAJBq504weaQ9LQMME+hde7h1FJNZJxAuPNgtM6FXIWJDQvzYn44IZ0gz0tCapSc
X-Gm-Gg: AY/fxX5n73rY0s/ZF0vo7F4QhfDdVqxODTWgp2ASIzuD5PsHl20f7ywMUmBk5Eh+ZDa
	IqAcWwqkRUWEBlTuxyTuNAZHrScIJoJ1rUrYJ2w/5XHmGUueYFivZ9ikcnCyzaPuKSwedyRruQw
	VwqEx37+usyKeQ0Z9ZveOWUXkHp71kS0PTnaqkEPEMhpUcXEGKKbO9vThZJ2phZqxdqYeWHw23b
	tpIWbCNLypq0YrK43Br6OhplJzTbuXjmTlxzQvFZSr0H5Y17N8G620SJiSNndB4yhnqKX0lHQMc
	hpgfdlDlD2yZxtRLwWBMkjOSircl2Hx3dgQfTRlY4ZsUJuJ+feDushv85AH4GAez8ufv0KQbpFG
	T+0Pxd6eWRd/+f1nGOJ68KKIRB0Xb3fiphJ1vMOq0VtLi1r5ydpeNfdHw2tgKXWza90+5jNlDXZ
	T0
X-Received: by 2002:ac8:7dc8:0:b0:4f1:e284:d42a with SMTP id d75a77b69052e-4ffb49e6a63mr269174161cf.43.1768295013418;
        Tue, 13 Jan 2026 01:03:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOeHMzJUmr6BiFWhpv0+C6YitdnE91LicHOFZU9OazCjsnxlnjcFa9txQZlVC7PFNEtI5PYg==
X-Received: by 2002:ac8:7dc8:0:b0:4f1:e284:d42a with SMTP id d75a77b69052e-4ffb49e6a63mr269173811cf.43.1768295012934;
        Tue, 13 Jan 2026 01:03:32 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce298sm154352586d6.8.2026.01.13.01.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:03:32 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v8 0/3] media: qcom: camss: Add camss TPG support for
 multiple targets
Date: Tue, 13 Jan 2026 17:03:25 +0800
Message-Id: <20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF0KZmkC/23P0QqDIBQG4FcZXs9ITbNd7T3GGGpWwsrSko3o3
 Wc12Aa7OfAfDh//mYHXzmgPTocZOB2MN7aLgR8PQDWiqzU0ZcwAp5gijBlUovX+NvY1lJgIUnA
 pGRUg3vdOV+axWZdrzI3xo3XPjQ5o3e4KQtmXEhhMIeElKYtKakKKs/U+GSZxV7ZtkzjAioX8A
 /zWCHkElJKUsJxkPKV/gGWv5/QwxQ/Hd8dleQH5I3Gr/wAAAA==
X-Change-ID: 20251226-camss_tpg-b23a398bb65a
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768295009; l=3885;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=CCrBPfDUHXCLF+sAKdTxaOUPPDGpDxTX/YaIVUXDBP0=;
 b=C9WgBLYSzGKYlzXRqPhwYWEFVyNcUgfgB+78jhqWDx3+HZoHu73kCtXgD9q7XGm+56NSod/lL
 HO5aRKHuwuHCBK3yr9JD9mh99ZWGX4h0PcYSL3xkNpy1rOd6f/Qkd5w
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: afZaKjrcAuatxgqSNZ2cDcpn6xMn9bWj
X-Proofpoint-ORIG-GUID: afZaKjrcAuatxgqSNZ2cDcpn6xMn9bWj
X-Authority-Analysis: v=2.4 cv=HN/O14tv c=1 sm=1 tr=0 ts=69660a67 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=GpE7naLpSaSh0VXB7mUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NCBTYWx0ZWRfX3PAMPAJlWIKF
 y7MwAMUqhkuqCst+Mq7L/mCVt+9pd/LDw/GJugdlN7+JP5qjnC5ySC9bbUu0LX56giRXXe+5ytw
 BKbaMLEK4B1T4E7PO+ZcrTSzZQi6X/aFIMb2g0NWvTemUAzJiRWamVnXWMOMCmi5MhhY2akpeq1
 yvd/7WtJ7kRecD9QvBX9Y8plLtKg64N0q37t15cTAXfbuNHYy+Fe1m1vRdNq0v7KoylTHIneFPg
 uBJV/yQyPbyp04GpHeDXosgeUVpIg/2oDcqRtV4TZ6btKcgBqfrJ+EZJj4r4F3zTSFuMDb+vJ2u
 uhE6hqVrvVtw7vmH/svOz2zR83XaHgaBAtthJZWx88EQdQ5AF19NL2pK1+KoLxJjooUgx9BdSn8
 CSSqAgR7HMfwBJv0REvd8HcvaSbNMzjWTZTg/4VYJy5qI2o+ARY3mab3pt6mNRvwbOxyt/UE0gO
 wyChTL1fIs7q2JD8lyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130074

This series adds driver changes to bring up the TPG interfaces
in LeMans, Monaco, Hamoa.

We have tested this on LeMans EVK board and qcs8300-ride board and
Hamoa EVK board with 'Test Pattern Generator'.
Unlike CSID TPG, this TPG can be seen as a combination of CSIPHY
and sensor.

Tested with following commands:
- media-ctl --reset
- media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- v4l2-ctl -d /dev/v4l-subdev1 -c test_pattern=9
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video2
  --capture=7

Changes in v8:
- Fix error bit operation. -- Bryan
- Add tpg link check for tpg enable/disable in csid node stream on.
- Link to v7: https://lore.kernel.org/r/20251226-camss_tpg-v7-0-ccb536734805@oss.qualcomm.com

Changes in V7:
- Add TPG support for Hamoa
- Add differentiation of register bitfields based on hardware version number.
- Fix the null pointer issue when TPG clock is 0.
- Correct the clock dependency for TPG.
- Link to V6: https://lore.kernel.org/all/20251114-camss_tpg-v6-0-38d3d9fbe339@oss.qualcomm.com/

Changes in V6:
- Addressed comments from Bryan and Konrad.
- Add exception handling for the streamon format.
- Link to V5: https://lore.kernel.org/all/20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com/

Changes in V5:
- Modify the commit message and change the chip names to LeMans and Monaco.
- Add the header file to resolve the compilation error.
- Remove the definition where tpg_num is 0.
- Link to v4: https://lore.kernel.org/all/20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com/

Changes in V4:
- Rebase changes
- Use GENMASK to define bit fields and avoid using tabs. Use FIELD_PREP and FIELD_GET uniformly to access bit fields.
- Link to V3: https://lore.kernel.org/all/20250822-camss_tpg-v3-0-c7833a5f10d0@quicinc.com/

Changes in V3:
- Change the payload mode string
- Change the method for setting the TPG clock rate
- Remove the TPG IRQ
- Format correction
- Remove unused variables
- Merge functions and eliminate redundancy
- Modify the register write method
- Change TPG matching method to use grp_id
- Encapsulate magic numbers as macros
- Link to V2: https://lore.kernel.org/all/20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com/

Changes in V2:
- rebase tpg changes based on new versions of sa8775p and qcs8300 camss patches
- Link to V1: https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com/

---
Wenmeng Liu (3):
      media: qcom: camss: Add common TPG support
      media: qcom: camss: Add link support for TPG
      media: qcom: camss: tpg: Add TPG support for multiple targets

 drivers/media/platform/qcom/camss/Makefile         |   2 +
 drivers/media/platform/qcom/camss/camss-csid-680.c |  14 +
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  14 +
 drivers/media/platform/qcom/camss/camss-csid.c     |  45 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 257 ++++++++
 drivers/media/platform/qcom/camss/camss-tpg.c      | 710 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h      | 127 ++++
 drivers/media/platform/qcom/camss/camss.c          | 183 ++++++
 drivers/media/platform/qcom/camss/camss.h          |   5 +
 12 files changed, 1347 insertions(+), 14 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20251226-camss_tpg-b23a398bb65a

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


