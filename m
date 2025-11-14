Return-Path: <linux-arm-msm+bounces-81789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 567CEC5BB52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 08:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DC4154F1024
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 07:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E232E0919;
	Fri, 14 Nov 2025 07:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rwus1PAF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGA7U8lR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846F72110
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 07:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763104291; cv=none; b=W634d8XgXB1pvj20Q1ZG+fneXI20YqDGnxMA39Ham9/VTtFQrb929Lx6MYpsgIxUAsqSjW6WdPYW/FO5koPsWFRgMcxGZ61WY16DH5aoHlRxs75YCv3Mrk+UFXB/jj9eQWHofOr0PZYfeQ7E+HDaStSOqWJ8/S2gMhb3dgfvX6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763104291; c=relaxed/simple;
	bh=NyGElt8WJNJoiwG6vhUR0dKnxrD0vuHyd7oq67dk2ek=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZLNVRNnpCnbjR2dtduS66tNoIuP7vtvgbR5k7nfas/QhqZ8FWAiumyruZlrLC4Xopoaqel1MxHcnXjzuQIa/JHkvzKupjj6T330devpG9m13eFmXok1mFG9ML2Fijxwx7sBgcrvdDLSWbpb1AehU0hwbUwHfMp5s67MtcY41POA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rwus1PAF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LGA7U8lR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMapJT1745344
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 07:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vP0KtREwSxFv2mZCu+bDXA
	tD84hbpmh5y5nO0KKI4Bw=; b=Rwus1PAF4SseJ/rWUpeqE6HfToUWw4SZHl9oFp
	Z8LLsjpPA+RK9+QlG4EiisRr3FZJlqrj4iACEPiT3rd9SgbcgAMCIG43xfvzM+mk
	AbZd453hsA1L03VXusGOETAJ50mRdNEPYnhi+KQvJxGIgzlteXTR++ZHrzNd9341
	Ecp1fREgR9m2sew8CIy7QAteTe8KpxPX0V886N/zBMRUqsBrZt/mhtkfEPg4fE+J
	HQjYfh1jbUkY5BALUyRJDbC7TbqQwQ1Cr1n38qLALPg064pMlfL+nh8JmrQqjAPK
	u6ZlxKZjXSGTlbczozA7cMjCWYbQz0G0ZysUtem6QBDLOjxw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9eh7ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 07:11:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6466f2baso48545091cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763104287; x=1763709087; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vP0KtREwSxFv2mZCu+bDXAtD84hbpmh5y5nO0KKI4Bw=;
        b=LGA7U8lRpk5MWSF1NYLI0w6f4c0Ho4FoGKJvZhsy+XbGYY3avDj6Zkhin5Rgf+hZsa
         R0Er3Mfjj9xpHd61HBH8t4lJoAditrMmuXIBg3/1uRBxOnIS/XpYIWc32Y6krnZGl8pj
         1XQpo5WZe0kCx5bU+/eFdSdACMz6ypT+2JSks26xMoUST6AglI3wUkoL67QHG/p/sntv
         cGfABSRp5hwMZFVOvWAQta2t9Ii0EALKE3ly1h+mGArtLDzYrLAHNaUEnncG9yqBFZY1
         4axQbE/rPJwPAbU6l+lseNCXjZ/3lYzHKh197axPVZccgbfSx6gIkX+Y2UsVB4gzoaXA
         5JbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763104287; x=1763709087;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vP0KtREwSxFv2mZCu+bDXAtD84hbpmh5y5nO0KKI4Bw=;
        b=RYn+Jbi2G+gEfu35b15eLwgE6fDAUnvHcUiAd63/jAHULKY7xenw6sIR2+CnlJZJUn
         EcessZBSxLBmopPeVM5kai3qHxXK/gX71oc5PqhKRqvUGDlF+FxHFo5ievUMqA++hQdw
         xXmsrEbHmIH42+2fwnXDCQfGP55KrCoUiKegHEkqbOo3NF5mBsV3yn4Lj9946DvvbRaw
         IpiTvTSGWmv8F1gjIMj+bwDfT44uTko2BlgmJnoPLiFCDwuxBv1ug5ZF17esTcriNZuE
         k8KFNjXf64Lsuu3/iXsShYERcOHykBwbchHx7tq++Q7jRGQOrkh2tUzEBS80Clzv7dqA
         J0jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVflcK8E8mecGVfkaXvCC8A11sO8qveXUsEOVaAwRzOqzX0leZsMe9eXTKbEOs2SLyMr1nbfSUzsTvYka58@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8X+Tpx5FmA41kM3vUBqeatEc4y15DwVaQ1wbD0i5YM+WiemSu
	MB99XSxdQyslHdizuH5P2G5Kz5l/ilHdfT+3nXgosdCVTJigsuZe63hWkCYXHM2H9QybOAtginC
	Q1x0VnWamDMY32jbYoynxh1aQXkBYz6nPavdvI+0W2WN9u7xdp4mluKmpf9A5HHMKXoZO
X-Gm-Gg: ASbGncv7wbULHhS+evzVjmFvkDJwDa3wNPVlHVnPGm51pLEcZXZoRscqnkeuR22s0TO
	rqVz2heReVXEFBaP1m9ekH2vpbZXugOQvKrgiP6oUYZcpGkaXFdl2MYzS/biX30HSxtTpeKBg1a
	uf5BVylUzA4j/ysdRILqCOR0CAfDLYy1ZFu33eCf5kV7t28mFwUoTwkD2e2YD07rFBvL4kqmDUX
	b35KEZkUwK7R4xAsrXCY1llaZ4n2pt0zOqxPW+EOPr+lzsOCYy3yRA2SPu2yVh5AsFgLJIefifG
	XGL1d0RYGcB88LdP52Gd057v0E6OgXKmUuZPxJomdldapOqg49oGYcxXqfW1oixxdDJBUaKpDj4
	qEwbaLMJ213f0DlSV/hQea87XtS/SblMqBAd45KWLYbVyMniIonjI7HZCQCQqTKcqzg==
X-Received: by 2002:a05:622a:10a:b0:4ed:a7ba:6a4 with SMTP id d75a77b69052e-4edf20883b8mr40601671cf.22.1763104287141;
        Thu, 13 Nov 2025 23:11:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD3Q6w6GFwZ1WPixcifpOQy8RDF9pjyr3Dlq4PlFOyPzaa6a9z/lPNrOJohRdnswuI0TY3zg==
X-Received: by 2002:a05:622a:10a:b0:4ed:a7ba:6a4 with SMTP id d75a77b69052e-4edf20883b8mr40601371cf.22.1763104286640;
        Thu, 13 Nov 2025 23:11:26 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-882862ce056sm26336666d6.6.2025.11.13.23.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:11:25 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v6 0/3] media: qcom: camss: Add LeMans and Monaco camss TPG
 support
Date: Fri, 14 Nov 2025 15:11:17 +0800
Message-Id: <20251114-camss_tpg-v6-0-38d3d9fbe339@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABbWFmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHQUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0MT3eTE3OLi+JKCdN0UI4sUc9NUcxPTJGMloPqCotS0zAqwWdGxtbU
 AWlMU1FsAAAA=
X-Change-ID: 20251114-camss_tpg-d28d75e745b3
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763104282; l=3204;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=NyGElt8WJNJoiwG6vhUR0dKnxrD0vuHyd7oq67dk2ek=;
 b=IFKYkWfiYE7tsNO78OaAL5GiPhohpUpaOf8kaeXsSwWBJC4NkYAKkzxp3D/Tb5M2xoRV3zx5K
 2lrTO9MgJaRDdqbUCC9u6iU4/TiH6BD46ZmR+eQ36C0Ihuev25DaHxF
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA1NSBTYWx0ZWRfXxPDYhAMlkMXO
 hc/1obAsgHaG1c/ddvTwLfMUgQJA7pQJVR6+79Mo10f7aaG1MlwdnFCQxA8ok+OZDtMtWTy5yCh
 mW3Pj+WhEMg4dAUKhfzQhN/UtsLHjKxdWpy64Z+XfDa0/Pp+djyaFzwdhSMQev3b7dYvWm/rVIL
 oX19XBQQqdjLNTUQY66U16df9eZ328CbBby/fSKdqonWcxlQ12mbkX1o8KqoCtnffVtQc7ZjNUD
 r5TmGj1ScL72UPz4j3MNU1yXAeQt5sVGsPgVIFM8/UjVEoem1FdYpUxyOLuA64zo4J9wLpS7uhA
 BuJSywZnwDiyRCRSG4puY4PypIlTM2SgoZOMyMivXaDKwfRBtFQbFIdP/mxWpPiNiKc2jo+PWGV
 fFwC08QF1npE6+8eVKHi+XnsEw7rEw==
X-Proofpoint-ORIG-GUID: jY5VQkZxVvx5QiGwLyKnwB_6jKERiVCC
X-Authority-Analysis: v=2.4 cv=Afu83nXG c=1 sm=1 tr=0 ts=6916d620 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=kOGcwOAPJYE99aWUTwcA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jY5VQkZxVvx5QiGwLyKnwB_6jKERiVCC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140055

This series adds driver changes to bring up the TPG interfaces 
in LeMans and Monaco.

We have tested this on LeMans EVK board and qcs8300-ride board with 
'Test Pattern Generator'. Unlike CSID TPG, this TPG can be seen as 
a combination of CSIPHY and sensor.

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
      media: qcom: camss: tpg: Add TPG support for LeMans and Monaco

 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  16 +
 drivers/media/platform/qcom/camss/camss-csid.c     |  43 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 235 +++++++
 drivers/media/platform/qcom/camss/camss-tpg.c      | 710 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h      | 126 ++++
 drivers/media/platform/qcom/camss/camss.c          | 122 ++++
 drivers/media/platform/qcom/camss/camss.h          |   5 +
 10 files changed, 1248 insertions(+), 14 deletions(-)
---
base-commit: 6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
change-id: 20251114-camss_tpg-d28d75e745b3

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


