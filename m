Return-Path: <linux-arm-msm+bounces-86637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC1ECDE869
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 10:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A3B530072B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 09:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E0D284674;
	Fri, 26 Dec 2025 09:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S3eX0x6w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GAEgYB2d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E2213B7A3
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 09:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766740769; cv=none; b=qfXsGBc1TzkN8205PYwMFMLL5Q2DqS3BbgQoFDHwRf/idrbcB9a5X4UJI0DKwBK458TSROElSIoNFyBWdExy/QFMi2VXD6fkjaScnGXMHZ6P2tyfVIOp6XiZ3B3u63NsJg0RrasKG3sjWqWE+AgmMeJs+wf0rUGKp8/4BwYAvbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766740769; c=relaxed/simple;
	bh=GZMVRYhU+AUdWZVvCOHNJdwpKXiKPbdvJH1lXrSlMp0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DbEjr7IAwMEGZvOtRnAiBwbsBS141Sxjb6afdbkeffUv6W/dGzMm6BjL5Z87jRyx4xgFHM6IcbMm1IzZ4qBYGu4PEsQG345lYlDraGF5cupDjfTxvMns1p8MDbjWf6lFWpNf2BOTP09q9/Z016kwhQVYYgN7tqYE5agzsrh/z7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S3eX0x6w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GAEgYB2d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8bvmQ1098530
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 09:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kqi0TBYDTBmFyf+3+3KX9f
	iObtBvKkiX8I2/RVrc/qo=; b=S3eX0x6wGFWv3Yj+nZIZy821F1t9fbJCew6lSq
	nwzTQ1DTB9nBHGjSlfCubFOrmO/1enES8LlmkhjycLdJbYBQK20umZQ/bwex+tTf
	qfJeo7oUn6izm7oN4FLi3IVsITv4xwfJ/KtbZiSuFvjc/jRw4APKQinkw+cPyRCE
	XEVB1oTpX29ddsoBXvCrXnGr+BaC8SQf3WFfePF6Aokc4zhnIEckh8W4OiRPuaDk
	ZfAva886RxeGmQ19oX7onWIK+9A3RIqhV3ZJ7fXEmaGcs6pKeMq8vp6SE5zRcMBt
	uVsvzMiaeDPdayJFwEGcMBHkoNoSKCUsfE9KzrfMvhd2LCaw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8v9f2sm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 09:19:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8804b991a54so262622136d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 01:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766740764; x=1767345564; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kqi0TBYDTBmFyf+3+3KX9fiObtBvKkiX8I2/RVrc/qo=;
        b=GAEgYB2dC1Fy3liPB7zNy9jSNUNjU1xPOB/siLiKMe+v1S7q/ibMcLzbm2uvWLsf+j
         HuzlOOqAvR4ayRUyLtvfDSUlGgVobQUndPXTbn9AH8f+tIOcr8NPx/i83ElN1XZo+VqK
         UK1DsFSe4CiR0ALCUc5ZSAIiMFRr2zkovkKVNR/sROlSzrEzPOvx5tyQUaHO1QSxg+9o
         ZWjEx6RLNp1I6yLLYYW32PyofJ0jwcKNCTLyyZjQeZzd8V8KL+9H0WCJy+R1pXSa9WU5
         /+cMdxl1SDoeY+GbTnKqCSOzajAWqvqR84RF4V/yr4467Hu+oZy73afdC30mV49NP9qZ
         21bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766740764; x=1767345564;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqi0TBYDTBmFyf+3+3KX9fiObtBvKkiX8I2/RVrc/qo=;
        b=sVg19YZqF1ti5AkJwXJDlai99vbNZINSPgGpfSzjY/BGKND4Pra4iGm9LsNoVV3s36
         6QY+MIMoAF0/keu/sEKA4tvtqN881PRqH/amZWHtslFNI+eUODR5WIJsKoirYw61Yxaa
         0xnGSdpV061uBf8xY74JMzKUxyOBOeycpacM0jm+n//98FIXsFoY12lS71J3llaE8U4c
         D+XVy2qgTVu9dp3PFQYu74KoaybOccYeIVLcE2JqogJPZI3OIKgDq2v3T5ngt+3RYPRR
         Ct+r8eTpSVjh3hKviJRz2nyuCsMD2oEDziZ6zbrd9bSHBuhqID3Z24uxDEPqdrS7uZ6x
         y/FA==
X-Forwarded-Encrypted: i=1; AJvYcCWCqYTArr9QX0APBfPNQXyqVbLFzqp7ZGvil1swj35kXr14AIVuWTf3BWcodQm1xeYNvJhCUbOconGGSftu@vger.kernel.org
X-Gm-Message-State: AOJu0YwLmOnkQgbxQeol+N2u3nfXT7mRSQj3I2blBEJBFtHpguh78/FX
	zv7I3C3Go24sIYl9WKVkBycGe71bYn/9MbHYTlL5p9zmq+dLAcBiovHB2jn0/N+xnobBwSUmABD
	f8mgjr+ixH/isAzx1TirjSX40XFHAD/jUzGKsPM0B7MZ4kdiIT9SCV9rHT+32ZcW6hSH+
X-Gm-Gg: AY/fxX6haH6CPVjWR/j64KMuspq4fMehSNuzLKRDb9AJUszUJLeIJm2pwNx/pEac5Hi
	61UH6afBtnqMpyQkGPOzUVW8LUkVljsKaWDDthQ5YRJh7ewgZLihVJqAW5uRXpga4kspsE6tjLs
	QpjrUvT+dP76bkciUmapbDQ+lTj/InUIBhZpZIUl39/tcGkggGyuo/+tRpTE9A83TA+pcvvSYW1
	4fGr515oVLWAPjJYKLEp7T2wXyrLs95/ny2kamxDeVdSkj1loRb+jpl/uo78bsUC0TcG9iG2z2+
	EGbTbyiE3Ix/R+DUpqef6RAOZ276M784ZfXaA4whZQAd7OEnQSnjxTigAcRG5Z574V/b3QkINK8
	Agfzc9X8d2Xh964kkIA8OnmHWb5EBgK6Pc0hINitZauUxdjmiRIVVLMy/NqPG/Ki88OFnv88WPZ
	1u
X-Received: by 2002:a05:622a:4183:b0:4ee:4a3a:bcf5 with SMTP id d75a77b69052e-4f4abda1925mr289892671cf.67.1766740764337;
        Fri, 26 Dec 2025 01:19:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIgHP2FQZqe/Lh2igCUqW0yGJhmY/0wpG+31XpI0LMZEDm2jsnq9VeW+kfzOcxXq1JSby74A==
X-Received: by 2002:a05:622a:4183:b0:4ee:4a3a:bcf5 with SMTP id d75a77b69052e-4f4abda1925mr289892521cf.67.1766740763873;
        Fri, 26 Dec 2025 01:19:23 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac62d53dsm160612891cf.19.2025.12.26.01.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 01:19:23 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v7 0/3] media: qcom: camss: Add camss TPG support for
 multiple targets
Date: Fri, 26 Dec 2025 17:19:09 +0800
Message-Id: <20251226-camss_tpg-v7-0-ccb536734805@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA1TTmkC/02OQQqDMBBFryKzbsQk1WpXvUeRkuiogWo0E6VFv
 HtT7aKbgff5vD8rEDqDBNdoBYeLIWOHAJdTBFWnhhaZqQODSETKhchYpXqihx9bpoVUssi1zlI
 FoT86bMxrd93LwJ0hb917Vy/8mx4Wzs9/liVjCZN5Leui0ShlcbNE8TSrZ2X7Pg4Hyu2wO5zm8
 KD/TWzbBw2cEbK+AAAA
X-Change-ID: 20251226-camss_tpg-b23a398bb65a
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766740760; l=3606;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=GZMVRYhU+AUdWZVvCOHNJdwpKXiKPbdvJH1lXrSlMp0=;
 b=3u423GlczqEyRG72a1AJ1FG4zxwbxb6jQjMnM3p8pynXBwM+6zRy6tLnpBmGAKPmx/iL8G/au
 BuUCUWwUYWNClkVsy6/Z9gzpFgG+fFhAHYjfWIb/R6UsqBNRpzWBPjU
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: zZvRMuqQYLaq5XEEgltOfckybfsiPkrY
X-Proofpoint-ORIG-GUID: zZvRMuqQYLaq5XEEgltOfckybfsiPkrY
X-Authority-Analysis: v=2.4 cv=O8U0fR9W c=1 sm=1 tr=0 ts=694e531e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=GpE7naLpSaSh0VXB7mUA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDA4NiBTYWx0ZWRfX0CuikggXcXah
 7OCOWEYOfmxF64BnBiEVfukH/Dm0d7yUwwl4v9nBd0J7Bh2er2Q48RggCPGvhHXp+Xzyl3W5mFz
 ZorBBUFqiMRdFJwihG6OkSR5hlz4q7+d+FuUeRTNuCCDROb/3can0p6YBxtd4mHBdPDrpLk1hcp
 tDI/wGv8ZT44gzViRUJUdJDj/csg3vPD1BMPgR9wQ3dwtreTtMWF8STGvNZgazRSbPvayXLaB1K
 3EO4rqdHWUNCOQy0iSloXRjHFuN0m9UZRbo33h2Mj/eeI2ESEPEno5nk28ZkWw8YS/KNiC1dRkB
 6ebaK2DpJ4qmq6WjPgfaPT9v15vaD18tKApJiNNkaGDf7wWb1ujm2D3wX6Q+1fAKohDZLRAkNC6
 avRCYDZ6mTSXAe+QSQZTJSmhftTsOlbFtkFsX12h4e3aJ0k4FBCG3+1qhj9/EbMMhTlcnSJz1iG
 NgHzIce0aNIHtw+sl4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260086

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
- v4l2-ctl -d /dev/v4l-subdev4 -c test_pattern=9
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video2
  --capture=7

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
 drivers/media/platform/qcom/camss/camss-csid-680.c |  16 +
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  16 +
 drivers/media/platform/qcom/camss/camss-csid.c     |  43 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 257 ++++++++
 drivers/media/platform/qcom/camss/camss-tpg.c      | 710 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h      | 127 ++++
 drivers/media/platform/qcom/camss/camss.c          | 183 ++++++
 drivers/media/platform/qcom/camss/camss.h          |   5 +
 11 files changed, 1348 insertions(+), 14 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251226-camss_tpg-b23a398bb65a

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


