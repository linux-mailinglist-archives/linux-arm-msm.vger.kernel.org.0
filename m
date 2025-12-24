Return-Path: <linux-arm-msm+bounces-86589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C2CCDCBF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 16:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C37913013C22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 15:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5CE230CD99;
	Wed, 24 Dec 2025 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jYfg8sD5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4svM+IL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D4D30B536
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766590962; cv=none; b=DHHz7oVU9gEuc5ur/pv9IhxSb0yXIQ2TGV2A8n+ixV4OFKW2mUX2e72pz7uDY1NVWwhITivXZb52+qagivOoje2M/SM9+Xz6FC4B8FklkjM+RoGYd3kgZM+8/Fl3cRSzpD1S2vFpMUIXpZCGe2/nQ86MCm/aIBTsL/3RkZfVXik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766590962; c=relaxed/simple;
	bh=ta/qYs32Jwfwx4ESth9/S8fiyMW+OEkbVDgftlKxaeM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NEUWavwsIIIO39czLVa9HBEdoxxDmGZ+E7NFr2FIeionr3Kr9IQcG1JpyDk3Cp4tLFsJyVHyzK1im1gnh2U39ebbkAf6Wu/wrkTxgJPISRfz1lULKzyDpJi/fN9nJyrJBCV3NFdqC+NzDHZXFeMDMRZIQnem8FVlJbS/OkMvt5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jYfg8sD5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4svM+IL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BODmboZ4134186
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9rZNuVa8CnntvIrXxV61Xq
	wtGpE082gcQ4QmaNOPH+g=; b=jYfg8sD5Ibj2ZDyYlUToEEvUn58NT+ISHl/PLw
	fMDQcgCW18hH4KBPNHOKK7fmruG8MtCBoPd4HIE44mFhl7tjyEptt60+e6lEVGjf
	M1psKMH5YBXS2WYY9rmwtqCTP85PIq4A8fr5YnAVg+DwFheNTKQu2fWz6lmWqxw9
	w+yKRpPQ/8a7jhQ8nsHTqAQw6fORC6UVhuFQiKYB3z+iY5TQynKH8wGBHpy1jIvY
	7LDGZQ5EZ/afw2uWpj0h+5ybv/lvy4XofZ6ORQKpKPSpaBSPVAOUjgUZBGeA9ZQ8
	rRfvtfRQk1WgfAnM5fFERdWSFubKVndiDnS/KAc1RtR5CESQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46uen2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:42:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edad69b4e8so127002481cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 07:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766590953; x=1767195753; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9rZNuVa8CnntvIrXxV61XqwtGpE082gcQ4QmaNOPH+g=;
        b=L4svM+IL+CqWQMk0BuS5aNxwnxbJ5AgPaB5gu8i+vqKt9sVsBYVqkoDfH6q7Kq5uAq
         50TVDg1yJV3ZzKmAy/1nB2XuzW5yTbf3e9hDfc1sMuTNzAr8NEPC+Y0sZrlriCcmMStY
         jimU9GwAVyc+u5LLSNrMia9gwhrWbzaGl2nFetOcdsVEzKuv+z7kOWF99r9L+IE9KUc5
         INp+0vuSu6EuITab/kw5y9C1/eKFW7wtl+wLF5FHnJI+C/FQJtJWcVcwW4TpTMjSrQMG
         o6LXgaqkS/3mncp1YZWa5CzKDzFTtgvTgX9aFwFb/8zalhmIAMIXFlVijda6SYn/SPr4
         jvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766590953; x=1767195753;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rZNuVa8CnntvIrXxV61XqwtGpE082gcQ4QmaNOPH+g=;
        b=sAOpavpw+FofqZ9edLiYtOPPEe3ut9Lo4xxsBTTW4t23YP7jAugXkgouqzgHExRm9b
         97WOhffzkXa+dpqu7OATq0rDHcN3jOP9g3h1RWWG32UICA1c2O5dNfIn7IL4anmQAmYS
         yE+uYZMU0cZSFEsw9Xo+UNH//Vk9Ar+Ijj6m4wbSyIbzBp/H5FOQHpSetWKopWsazhIW
         7VUovYbkY1FmGOofnhO0deJVO/YRT8Waa9AgmFmUNRrjwHGqx3mE0WK/hrwy1u5JJnRc
         w1Htf8q2LhABvgnPi4kmfbcWmpfVBfu/dlHoPv38K6vYUFZT0mUx/WDdMPhm2eUSnF7v
         NlFw==
X-Gm-Message-State: AOJu0YyGCa/VNYDiB97/0YJ2HXRH0Jm2XORKl/Iym0h8UNUIPO/V4Usd
	90XBaZDr+CcFizapzp1mea44VSgc7xVIPQ1oHd91EsxaMuKqvHVMAZ0nekBNnG4nQvDxWjMB7PV
	B2yuRunfkWneDmO8vrf0iZIVL54W/2M/qT/nxEa+lJ4Fcx5MomDOmbb04+/DaS0ymKCSG
X-Gm-Gg: AY/fxX4GFi9aPnMffEp/iKf3qzmeaSQMOQR6Q5iEVF3qo2QBC47kN4zbRuY9k5vyGIx
	SBrkEG+6ZznNEegARzpwf0/oShF66oAa5IwQ98VBLO1h46K0tf0FJxzpmjWTlMQTBsFycJRLlTr
	WsiChClxT8bsXGdLjEM8GgnKQ4W1mBwWavshs3fPE0iPntKZVn9MJbv/WAYaEmrUdbvfkm1nNl+
	fnLJafOBcf63AiuSe6cUKDSkhDYdfjeW6ik7bYHjNgGGjlN3iZSeAi9mB2PpET3K4L5olUDmIl7
	JMoCtmvBZBLQhlT6VuBRNJbL7OW7CItDCwNg+CIfb/uMLhmEk6PN68krGibqZNiU0C9kBg9TI57
	g/K/5cyV59yQkJivXWFohmoGzD9s/ko/qcW+RUea/AuxvPwxduuuav2IFLH6+UJqLwPuf/HtC3W
	zii2N7Ayn05higVsn2YigZGIg=
X-Received: by 2002:a05:622a:199d:b0:4ed:ae94:5f5b with SMTP id d75a77b69052e-4f35f3a046emr290626411cf.8.1766590953476;
        Wed, 24 Dec 2025 07:42:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9tUizjNjvN5kFwIndSIXJLx9sAh9ZAO5ojG0j4Kg2S8mfGTxGd1zM7LXKlT3ZP+d5kvRqoA==
X-Received: by 2002:a05:622a:199d:b0:4ed:ae94:5f5b with SMTP id d75a77b69052e-4f35f3a046emr290626051cf.8.1766590953047;
        Wed, 24 Dec 2025 07:42:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f2e6sm5071562e87.69.2025.12.24.07.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:42:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/3] drm/msm: drop DPU 3.x support from the MDP5 driver
Date: Wed, 24 Dec 2025 17:42:29 +0200
Message-Id: <20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOUJTGkC/23MTQ6CMBCG4auYrh3SmfJXV97DuEBapInQ2kqjI
 dzdwsqom0neSb5nZkF7owM77GbmdTTB2DGF2O9Y2zfjVYNRqRlxKrikEgblClDeOlBuEiDqS8t
 zlefIBUsj53Vnnht4OqfuTXhY/9r8iOt3o5AQv6mIgMAbjnWpJFVFdbQhZPepubV2GLJ02CpG+
 lTqH4WAAyJJ2aGUUtEfZVmWN7k2uxz5AAAA
X-Change-ID: 20250926-mdp5-drop-dpu3-38bc04d44103
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ta/qYs32Jwfwx4ESth9/S8fiyMW+OEkbVDgftlKxaeM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpTAnnJcVsXVPewZihIE79PolVWhyQTJgV7Uofv
 3a+G7DuZKaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUwJ5wAKCRCLPIo+Aiko
 1bYKB/9lkEHVrxnRw7uVQnqcVVNaqvUiHsIhfA9BC9YrGvHrRwkup9Tp6YbFZBeR4Fe7KUaNu2q
 e1JOapizAM10fdn5B3BlkOgciFQBbcuHlP1DoXq+OyUKpH2whijciN06mFOR1zmr2ZNIL4HOm6i
 /YkxrQNwWD/nl0UNnRmFkhpef2/ytgp82ArvkDQFrajhhOKWS5PPne5jBVdTj0XV1HDcwf+nfQa
 pcEnYKkG6GkXbv32l/cYneTqn/00Z/8fz75yLpQEGj5Z5+t9sLP19Gpw2KhNT07lNHt4I8wGftI
 FA3+5VrpTg+ZeNcwGtanHg7l9li7nJxNvL2jpu2ho4r95b+i
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: RkrogwuKkJg4mylaIKr3AAVtvDayZ5eD
X-Proofpoint-GUID: RkrogwuKkJg4mylaIKr3AAVtvDayZ5eD
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694c09ea cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mGs35Nl9CTEAThm_-rEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzOCBTYWx0ZWRfX6DTdR4p9h69x
 95XwTP4EL0GxONBvEekMBGcIIWcRAKwj0GZWDCXWdi1BJrNUE7WBtayJjNuHHl5yasnlDiiZsQD
 fd9uD4sUchoHNaow6DiNQRsp+yvYTkfZk8Tf5m/lsmqg6WICdJ5wfPpiUqC7yuncLfdzMZG0Qm9
 dtZJ0bNYYPE7+/mxXpjCd+q+fAVQQSdYcu3Y03XKnfLRlU0t8ySxftpuLbO34040m8TPdzP7V31
 MUDyJur/Bygb4yM4lqA6fo1HbecGMB1daaiyhMORQPwtQiGuWwPaahxOCPR8l4BWRzYplB6gho3
 aw3iaYEWdCWhxkMvYAcETJ6Kl1xo4YMLZXkspjxphXCkqwbaDrtL9LukIcazV2IXB/LIB4/qh+h
 qcVvtYCBiRxCq/aYhlPEf3LuGD0b8lTG6lLx06o1ztUYa+sM+0XUDMc3KzBkgjXuTXUlqpx+Nvj
 ly9imKQrG6pUsVM/RqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240138

Fix commands pannels support on DPU 3.x platforms and drop support for
those platforms (MSM8998, SDM660 / SDM636, SDM630) from the MDP5 driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Fixed commit message (Marijn)
- Reordered CTL_START checks to be more logical (Marijn)
- Link to v2: https://lore.kernel.org/r/20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com

Changes in v2:
- Fixed CTL_START interrupt handling on DPU 3.x
- Link to v1: https://lore.kernel.org/r/20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com

---
Dmitry Baryshkov (3):
      drm/msm/dpu: drop intr_start from DPU 3.x catalog files
      drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
      drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660

 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   5 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           | 314 ---------------------
 drivers/gpu/drm/msm/msm_drv.c                      |  16 +-
 6 files changed, 15 insertions(+), 333 deletions(-)
---
base-commit: 4ba14a6add891fe9b2564e3049b7447de3256399
change-id: 20250926-mdp5-drop-dpu3-38bc04d44103

Best regards,
-- 
With best wishes
Dmitry


