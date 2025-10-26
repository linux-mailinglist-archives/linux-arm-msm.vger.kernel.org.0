Return-Path: <linux-arm-msm+bounces-78803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A8BC0A678
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 12:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C28E23AE986
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 11:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5866424C66F;
	Sun, 26 Oct 2025 11:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WAy3N3PX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522751E0DE8
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 11:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761477490; cv=none; b=gMnOaCFtoFWzdFugms5fFKh/bPyi3JlhuNseW6tjpae2nA3RF8v1hHwvU7p5avauzgECOrY8E2vHadiixnYtG+kKuHWq54EBoW/fhyTZ90K7rxpPLWCdCBPKtMRL85vR+G7Qj7OV5AZEHMxa4H4KOABmkAQKQdHRriNEpY29MD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761477490; c=relaxed/simple;
	bh=AFar811F9iCO3PW/bUYkCvTbMI/jIlhhcC3tuFxatKo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cpAKHcgCG/e+egQevZrzR+abqHdIp5oMbgUPmf//m/2CtdIkG+OrxTrC7/hT9QAKCtIUmBCw7vZpB911HRWxXk2m5nF5sxskQLY/hEcSjdoHvLwQB403/1EjUxkc8oweYx1N8T7036+I4eKkZH7A4lYBiFVnsKShB1jbinLo9J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WAy3N3PX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59Q3tn9I2946040
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 11:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PP4ZLZZk5lXfWJld/o73iVfzszWgXXw0Xp/
	OfYD7kEE=; b=WAy3N3PXBNBKdNFk4Rxa1whB1VCIEWua4IvyKx9nEvM25T5ZsiX
	oj1jrHjHo7nUyHfJjToelvgr+qos2aVn8w7Xmhm1ioJc5vKJeU9HYs/nlIgIPRCC
	dnnCiTPVaqUmPJrk17Qe8GYvQr1CA8e4FowX22NPey9kbXbLqTR7aqpnLHdMstMS
	Jhh3V9y/xu9/N4Y+f3hxm2LeOlT9vpvWk6lm7qPUhryP6rBt4ncRmS7i9+4BzCEm
	gvzozPKCb1dwY3KXv4BPkTfx041cCsqiyKX3fnLl5t7tCS/y7USMW5qAAN6Eg3KV
	RGLmt0sauKWIO3zalEULyn/Pbe+/tkqTa3A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p4w9ycv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 11:18:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33820f67d7dso1260554a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 04:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761477484; x=1762082284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PP4ZLZZk5lXfWJld/o73iVfzszWgXXw0Xp/OfYD7kEE=;
        b=wEVFsPxeYAdJPdlzYVZDiDMYeHfZlB7fCsjFRSSNrVqhzoSK8XtuGVLsQyLTGb7uuF
         VqFBhHXP7InUV1UhtOiuttVQxy5hNMQRBrCBimDwk0UYiVh/GMg2YVFcv4YGj1O/sKhl
         9y1OaY1vh1g3HH+K0zWtUIt2bB2Ijk0XP2lb+tDtEMnHXnKNm3MLQI0hUEqIeat4iEWJ
         08cE4989uLUMyLYvCn6HSuX90WXxYj3uwTnBUD5iPXaKTaV6SRqkkdJSZ8PqsQfxMPcF
         Cn0OBrLwz49rUUtezNdZoQCs34osYff/YSaCDzgl2rj3u8KBWsxRVC61z5zKiHjGFZH7
         9Jlg==
X-Forwarded-Encrypted: i=1; AJvYcCVJSgvFu2pgCn/sh026h7p+cSmjECfHVinAC5Rm2Cf7cwcCbVq76xnoZLPssQIUgEeUmjyFF1CEOx29/gap@vger.kernel.org
X-Gm-Message-State: AOJu0YxESJ/lF0XoiKI1BVUGDyvH/K401KZxSpeWenYlYJp16EP+qT7K
	keA+6eH/3i3WNO0Zm5O/mH8PjEiq/t7UPCzdRKPTCPlP8Daj7UaUeqpUl0otJtjIrFZH9mRgCSQ
	fBlM7Tg85NAh1XD5BVpjw8WN1PFfbSpRGvgPo2kFkpHR4fDaeWj9Bm1LQuGJsieDA4yg=
X-Gm-Gg: ASbGnctNeKyWaAswVIuqn7nL/uYHn4Tygh503s2nLK2x1FBdOml4sxze0zMPSwSwQzl
	hfJ6cESoVipWemrQBJXxDCPl2RC+UtgEAc16lNgNuXle4YKcAqjeLqZ2+9zX6s4DD8fGwL/SjAP
	JDj2eF09bCYoEv0H+uK68++Dc896l6YxD1Y9ndUaj2eAzPc3ybcJmLc5+F+uRa+WgYVm1TczvwS
	yWcEtYC4fmAn80UPvq/Uq4jxRxemWQefxfBSQ8gJSyB2+w/oa68k12R5TXfWIMiYypcgCcw349z
	nVkR4MAE0QZ9cB3lyet55uB+JQ5p5p7c1sip2rJO0+gfTXSu51DkDwkwAF5L7Ykccmu4B8nuzl6
	a/z5X9k4QXnIkbFiLowIxSHgP8eF86A==
X-Received: by 2002:a17:90b:1b09:b0:33d:55b1:e336 with SMTP id 98e67ed59e1d1-33dfabe6c8emr13999416a91.6.1761477484372;
        Sun, 26 Oct 2025 04:18:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSo0JH7nP8ynm5o4I7Lm3GCE8tlnKfzC4jpWmfkVLIzkCK8S3DvUDI2E8nIlJhjI/sdz/55Q==
X-Received: by 2002:a17:90b:1b09:b0:33d:55b1:e336 with SMTP id 98e67ed59e1d1-33dfabe6c8emr13999397a91.6.1761477483755;
        Sun, 26 Oct 2025 04:18:03 -0700 (PDT)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140301f7sm4707829b3a.19.2025.10.26.04.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 04:18:03 -0700 (PDT)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V3 0/4] Add SD Card support for sm8750 SoC and boards
Date: Sun, 26 Oct 2025 16:47:42 +0530
Message-Id: <20251026111746.3195861-1-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZkgiKfzEPt5iLsF34zPYhg3oF2gtcX1m
X-Proofpoint-GUID: ZkgiKfzEPt5iLsF34zPYhg3oF2gtcX1m
X-Authority-Analysis: v=2.4 cv=NobcssdJ c=1 sm=1 tr=0 ts=68fe036e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=8g3-L627ePlETrSfAJsA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI2MDEwNyBTYWx0ZWRfX3bKnIIOARbrk
 +SYzvSD3+NE++jA14UMgrUbSI4rb6EfaSO6CtKHWsQWh6VwBVfjHoe5MO0uPySj9e7K78DUNVAF
 /NydgC+rxWJxvSvzts4VSXpSjEr0+/jJ85rCzK66KDh9JGIEFKZg5LvgmY+uxEb2p9S1z4LyUxo
 iNJIEloU6wcx6rJsenM1B3Me1HNbPArXnZCQvmeNGUtEhTqbzTzj/oOMid5wDcLtWRaPqIhsFWr
 FwTGRomYQ1+MjpWlgBvrVHXxgU7w8+fWuTbZy2NOrGceO6F7SLOZK+DJBUV5zj6siU95FKYj4fH
 5K7asPu21x2MEJ57eY7siHqvKWgJDLaWsBgJiychadqAiTT3pX7fj8YPDqlalU4txGch2MYkhYJ
 7NfU7Aki5JpTl9HEZl9coZp97NTQHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-26_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510260107

Add SD Card support for sm8750 SoC, including MTP and QRD boards.

- Changed from v2
    - As suggested by Abel Vesa move the GPIO configuration for SD card
      detection (specifically the pin settings for gpio55) from the
      SoC-level device tree (sm8750.dtsi) to the board-specific device
      tree files.

- Changed from v1
    - As suggested by Konrad Dybcio the patch into separate commits per
      board and did formatting improvements (e.g. aligning < symbols,
      placing each item on a new line).
    - Addressed Konrad Dybcio comment to use SVS_L1 for opp-202000000.

Sarthak Garg (4):
  dt-bindings: mmc: sdhci-msm: Add sm8750 compatible
  arm64: dts: qcom: sm8750: Add SDC2 nodes for sm8750 soc
  arm64: dts: qcom: sm8750-mtp: Add SDC2 node for sm8750 mtp board
  arm64: dts: qcom: sm8750-qrd: Add SDC2 node for sm8750 qrd board

 .../devicetree/bindings/mmc/sdhci-msm.yaml    |  1 +
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts       | 23 ++++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts       | 23 ++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi          | 54 +++++++++++++++++++
 4 files changed, 101 insertions(+)

-- 
2.34.1


