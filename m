Return-Path: <linux-arm-msm+bounces-82800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F24EC788AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 1C7C32A6B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 10:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EA2340A59;
	Fri, 21 Nov 2025 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAmPULLO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ACmc/9NA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BDB3370EE
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 10:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763721389; cv=none; b=Nu4p0+aWzhs901NWo7Cz1gv+Nkuyd7dcR5Az0O3avkfsd2bIUL/579DHn3/ss9iaNyuJlTzDvQw52QaT2LarpAgGMwMXCtJpeDI8B6ZhxhXZVAsUzyk2MQWV8oPndDtL56Am1pixvlg2udA2uEM3h9FWEAibvVHd7ILRLtbsG1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763721389; c=relaxed/simple;
	bh=0A3EpZQZ/3VF/riYcZPhzwUOYsocoTCYKiKNd4wGJ8o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A+we4x7i5GwL0AH6fgtsWrtcH1dw/lR35h/zwEnhMEPEncsKFaassg4t9JhfNz/phO4j39gLw5bwmr8G4qqPNNuKkE5eeZH+/T1roOYezmm+ScOA3yLn6bnggFoF/m1Zjh/H+Lc62s9FO82CHGjjFdHdWQT3cLaPa3lDZz8imxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAmPULLO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACmc/9NA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL6ffkG1989368
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 10:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c/YYXbS2yGm1NR91FtaYtc
	YdvhHxZruExaIiINfkI7Y=; b=TAmPULLO8kV2q2tmekrKQbL3cKekDGc+2HeZ3a
	73c4FraOgDdPg+JOKCu0tuGUZzSe/hdmnyiMfrYLsFl0Ye3TS7YyeKmQKyRj1XKG
	7/pYfvVg0o4fNtocGnuYbQ4FyzVD4HeNUdforEZHl7tBxapsyNMtv9UAWNm0W0ID
	yCYOzYqeIFU4wOdNRT1AK75l+GybzVFPTDvI2yuwJkYZIkaTXcCGG9H8fAd853KD
	vipo3XjsdJ5p+F9gXGTZjypD5wTAswGM6w1TrrxJQYRLwjT6VlnmMCaeaz7+qP9M
	nVd4q2AcTwYWEkZoJ0A7dkmb7jNpOK4yLaAw1cON7YL3mY8w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aj1vac3gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 10:36:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3438744f12fso5607113a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 02:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763721386; x=1764326186; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c/YYXbS2yGm1NR91FtaYtcYdvhHxZruExaIiINfkI7Y=;
        b=ACmc/9NAm1jOgfJA9nvjKJruyPX9Mv9OQCP3aXUnjv8RvsfAp67NwGyNlTazV3Pkee
         wKq69PUhCz2EwlOtDd6yZpxtfEHu+s68vT0T5fmrk6M7c3oOngtuaAspOEHe52NxbMH/
         7tOJ2Yr9hUKEr7Se3AKTMy7sAVCqj0s6dsDsRrw7W2DwXde04e/deEN3BWsNE13f4cm0
         FkC4UwbNVMCWi1RyQOHa7774geTF7SL/cO+MWKFioCVtn5UZRqESJF7Zs0pmZTdm1CBk
         cgrWf5iWgcPsETIQFdG1QTpy3K3Z7jwdOMlot+xsyZoGIiAUQLLkAFoyR1cgXaaquBXg
         TG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763721386; x=1764326186;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/YYXbS2yGm1NR91FtaYtcYdvhHxZruExaIiINfkI7Y=;
        b=DbZ9O3qk4Yo5sU6cKzD3AUvF9gfw5f9UE4ClHYEm8UBAzmG9qrqOwogT3rBQEKtc/Z
         7oGCZZAlA84M98Y9Ohx8+UX9TafnelXouPx3cCdrjCkhKO7jcI43PAxmsuVt+g9ZJeEi
         zwBYlJcwqeJz1qhjjCRql72kL2nxVB9rjsPaxivLCfqS7TvWdbGxTKruMNouMuDbfoNx
         3MWKeZGpSLZWx8ab7UWipGjInW+wkTz3nPqFkSeLqpvpvqNPDS+JYyP4tWmI9JAPI+HC
         5WH29oxoOGAYmDvEWAX7W4wUkB7SUgDyaBQBEy6pKF1SugvQz5IL8cmBJINnVbf5eBNi
         17tg==
X-Gm-Message-State: AOJu0YzymWqQ+4MM8Qbkbp00awy+q47cH5u0zQ+H1mTp4gH8L6q5O47z
	nDAWszkU+HVYFqhRQoN4CmUBPU2b3zgaKCYH9GsMb7/bzZ2+PqScNHrsvbRyF33Eud5YDMd/JXg
	j7kInUs67y4wsjOAp4KZgj44pFrmXZXn0XVFaCQfSdnopi8G8fWfhMeZX9lfPKFNZeDUQ
X-Gm-Gg: ASbGncsI55LUdcYMxZIjGKzSoJjFssGxjqzFItwQegzThFuQg4VeQAztQzWkjyyNZxU
	ceZO91rxpPE//g9oAldy/towRICXciaZtgrTpYP11GKu24aFsxw4CALcipsKe7HXxi8o2vEdaM1
	0ciFpwO+R2zblgLCxvjGNuI9V/xNmD5tMZMY43BjL24Br1KXZ+FpUdVjyspGVu74cQmaqRgEhkU
	SrTNM488wsjqWp8lEtEkAEktyf19e4lhhUNj6t4as7LlAouz/tmDxqgIp3XyRTMfYoc7jyQ6c3O
	yHNZK4RiB8XulpPZlPmn+f+bOJTSV7T1HsuayQuRNTVtp7jyDUAJ26Ks/WAo2hhuiTinNdYr8IU
	KZZgagAUZzWUOT+58S7EsWjk8m/gk3A/gOoJ3bl2fG2GGUTE=
X-Received: by 2002:a17:90a:ec8f:b0:32b:65e6:ec48 with SMTP id 98e67ed59e1d1-34733e55f77mr1982314a91.8.1763721385816;
        Fri, 21 Nov 2025 02:36:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGg8evWjT38FXSh1jkEtQIwGVf79CscEpqyYJEKPGjYCWgoSXZgj8E1m9FIY7vWbTnfb52CBQ==
X-Received: by 2002:a17:90a:ec8f:b0:32b:65e6:ec48 with SMTP id 98e67ed59e1d1-34733e55f77mr1982286a91.8.1763721385398;
        Fri, 21 Nov 2025 02:36:25 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727be2fa7sm5122890a91.6.2025.11.21.02.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 02:36:25 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Enable ICE clock scaling
Date: Fri, 21 Nov 2025 16:06:03 +0530
Message-Id: <20251121-enable-ufs-ice-clock-scaling-v2-0-66cb72998041@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJNAIGkC/32NQQ6CMBBFr2K6tqQtoQmuvIdhUcYpTCytdoRoC
 He34t7NT95fvLcKxkzI4nRYRcaFmFIsYI4HAaOLA0q6FhZGmUZroyRG1weUs2dJgBJCgptkcIH
 iIHtla3C+RutbURT3jJ5eu/7SFR6Jnym/99qiv+9PrJT+L160LGloG6ut6m1rz4m5eswuQJqmq
 ozotm37AO0PaO/PAAAA
X-Change-ID: 20251120-enable-ufs-ice-clock-scaling-b063caf3e6f9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4MSBTYWx0ZWRfX+LPH5b02yCg7
 5rKqQonWWrQFlU8gbGHvgZZ6Zseg/RUg2giXHVwYI8KBzwhwYeErmH7bxDphWmyghsg1i4IQTQQ
 iWjY7JrFOOmxAJ4WStA5ijJUb/mnp5eOn2D297ggOiJ23KaJVFutWZNDUYYhm+C+UVGl6ERidDD
 MxCiY0YDaiChNgjiCvgega0ue0rtFV8Pg7zxPaHRNjWQH+AT7R2j0vOP8Ba5LvbSZwr0PWpIs37
 jOR4JgFENOOJAu/PQelGdifymeVXNWys3UHD7pFebxW6GB7BrwtMe70sDWYYSR+2BzuJWcMRwYk
 Da/KPTkowcnC/hIBMNITb4O897lvtb8v/dX85cfqfIkQGeRsqQEetbFdskAApvMWqyqX/FH86oH
 pUzByU4aIYPTXetprkPZF+zMgKdv0w==
X-Authority-Analysis: v=2.4 cv=Vpwuwu2n c=1 sm=1 tr=0 ts=692040aa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QSgEqrcxAPkzhd_bmtkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: dtfX_MlId9n_xewmAFhFca3sKjxd6SLo
X-Proofpoint-GUID: dtfX_MlId9n_xewmAFhFca3sKjxd6SLo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210081

Introduce support for dynamic clock scaling of the ICE (Inline Crypto Engine)
using the OPP framework. During ICE device probe, the driver now attempts to
parse an optional OPP table from the ICE-specific device tree node to
determine minimum and maximum supported frequencies for DVFS-aware operations.
API qcom_ice_scale_clk is exposed by ICE driver and is invoked by UFS host
controller driver in response to clock scaling requests, ensuring coordination
between ICE and host controller.

For MMC controllers that do not support clock scaling, the ICE clock frequency
is kept aligned with the MMC controller’s clock rate (TURBO) to ensure
consistent operation.

For legacy targets where ICE is not represented as a separate DT node and is
integrated with the storage controller, the driver falls back to using the
storage controller’s OPP table to derive the min/max frequency range.

Dynamic clock scaling based on OPP tables enables better power-performance
trade-offs. By adjusting ICE clock frequencies according to workload and power
constraints, the system can achieve higher throughput when needed and
reduce power consumption during idle or low-load conditions.

The OPP table remains optional, absence of the table will not cause
probe failure. However, in the absence of an OPP table, ICE clocks will
remain at their default rates, which may limit performance under
high-load scenarios or prevent performance optimizations during idle periods.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
Changes in v2:
- Use OPP-table instead of freq-table-hz for clock scaling.
- Enable clock scaling for legacy targets as well, by fetching frequencies from storage opp-table.
- Introduce has_opp variable in qcom_ice structure to keep track, if ICE instance has dedicated OPP-table registered.
- Combined the changes for patch-series <20251001-set-ice-clock-to-turbo-v1-1-7b802cf61dda@oss.qualcomm.com> as suggested.
- Link to v1: https://lore.kernel.org/r/20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com

---
Abhinaba Rakshit (3):
      soc: qcom: ice: Add OPP-based clock scaling support for ICE
      ufs: host: Add ICE clock scaling during UFS clock changes
      soc: qcom: ice: Set ICE clk to TURBO on probe

 drivers/soc/qcom/ice.c      | 116 +++++++++++++++++++++++++++++++++++++++-----
 drivers/ufs/host/ufs-qcom.c |  15 ++++++
 include/soc/qcom/ice.h      |   1 +
 3 files changed, 121 insertions(+), 11 deletions(-)
---
base-commit: fe4d0dea039f2befb93f27569593ec209843b0f5
change-id: 20251120-enable-ufs-ice-clock-scaling-b063caf3e6f9

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>


