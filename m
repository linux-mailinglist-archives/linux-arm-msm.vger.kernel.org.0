Return-Path: <linux-arm-msm+bounces-55698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 613F0A9CFE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5DF87A84D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7302036E2;
	Fri, 25 Apr 2025 17:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGgkr6G9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455782F2A
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745603233; cv=none; b=Nt6n/l/igOIi3ipWh3H34MOXp5zSr0rm2xQN0jCuSLJ+9FWYgCMmBHSyRnsuSnv48lxOpm9QWt09jE27EMkI3vwz/BG+zEXCgRieog/i45bO8Yjk7IQNx/8fpMwp/2FhLyZgNr0xSnseKjJHoaXwXB5fegX1crNgL4vV2XxZlYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745603233; c=relaxed/simple;
	bh=T3PpYspLOO+gT+LsL4Ms6+Mv85P8reL4+qw0w1irQnk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ja9m+TYntkdxyY+JOiqUzuiwnxqRJdm77vKhSFpEcQTFIFX4S2JpBBnZJWaZQecX7G7cLTfTxL6KibO6ulquVowMDyfvegie0J4dZhNTaMDfamI9iwGhiEf3g21BFrwdUEpE8UnWTG1Xg/NgAQ+D7G7HUazwCIcGXWrHGUh+/pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGgkr6G9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJut8024751
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CH95xQAqSCeyDTf7jFn+5A
	MbqHYnxLYxquumYsB1TvQ=; b=jGgkr6G9WmX/yF0wtGLJ3mEgidTrPdQ5DpaxaQ
	dZ5Qcr5t82EJgzKt9s60gJ9aUi8t2Klvopg8HNuCZteUKGWUb4ONh5ky1AlaGi0t
	SLwE1TgcghzPO0XZY5aW6+UbwhS+6/CbvhmD0bRH9onROAAxtpxywgrzrhzjiWcI
	yVoI9kmWYXBtwoD3aCjQE9NWoEHNiQgPj1ZbZxwymOo8TfFvK7KUDXCVpXxaiNeh
	ctRkHIzavqAmae6vTZUwszcxqL+dEOJN1lU3e3B+aW4ThREKy0PvInbZRKgi/Rdt
	H1aY1PdWKLrYfH9hFNf2Z/Xc4Zjp2It6zo6egvPPUyDcbmww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0srcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c790dc38b4so454792285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603229; x=1746208029;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CH95xQAqSCeyDTf7jFn+5AMbqHYnxLYxquumYsB1TvQ=;
        b=Q06GqhkX9QCtlzg93Bvi9goWatq+VlTrUTCL03zbZ+jjDXd//onoB93b6WfHmDv90h
         jQcReLhcbWv0DRnbNFQc7kjwJxPz5lo+HKniJSA1CtNga1fpxkFxvAut+kmHA96DUchp
         ns6Oy7gxyEknvmiU59EEcW9+D9BSegebvCk9wGa9Yn5sC89A7d3yZpTLCgvqPDWrQWRt
         QI5mIgrgezZhH3pFlxmlY9Gqod20fQuibWzscRxv1CDxzczcLzNsxWkAGd0Vka05x/FP
         ZiJyHefhKGHYp2Irlp9dLX2jDhQmQgTNkvc5U/nnUmeyp3n+SgL5i71PDdsDxwn3/Yb3
         koow==
X-Gm-Message-State: AOJu0YzcTEApRrMh7MhwzfxKC5PbQTYcNQfqEPU9VojAfNG68RElWk0p
	aeZYsW8z9PF4lAZ+NEWizkBStqdCu2aloP3HfNVwb+Ssm+DJaT6A6lycFXscLqbi9Hda1HYAXYG
	oxLgg9Ty7AF0yg/65btcr6rhjxtRcGWzFthEzqgFgFU/aerh7FlEp+tyIo3dD0HJ4
X-Gm-Gg: ASbGncupUYHLazfbs8hAJLZunpUQfqLvx+4kDheQSY6emjdBNa5KwUySKHY5/eKY2u+
	Wq9QZArWkcICrQSXRW7XPj5HGF47fnvwzKmCA3ZsI+YJ80E7Vj8Wd4vCRHNBNWxHS0ygNZy/bd2
	38W0NfOJHpdq/lvI84OBoyX+serPyqeKKjYckRqahOt3uplWWIAWnLq1sIiPqzlJrBL0MmzAfhZ
	csQo7CGX3ZnH0LyZnbbK7azD1GPTeDzXDXnEHx7rvB4amjeXhhjrfiCYkdzk6ZXxG48H9Vxupc7
	4w1Zf1l/nTYqCDkAg8PGXnjGiPucEpf8xnmRSrNYlrqWDGdCw1CsMgxQvdSWXOVKAWlE3SAFpSv
	P3t271fbWYel3l9vN4TH/jhnk
X-Received: by 2002:a05:620a:1793:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7c95863f91bmr1072973285a.23.1745603229131;
        Fri, 25 Apr 2025 10:47:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVoKASQtAFdaM3BZ5YWILcNcxkR0JbHKgAzwDJdCK8quRqLkR7yRgn8/w/k+RPF1+LxPzr7g==
X-Received: by 2002:a05:620a:1793:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7c95863f91bmr1072968185a.23.1745603228787;
        Fri, 25 Apr 2025 10:47:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/11] ARM: qcom: fix APQ8064 schema warnings
Date: Fri, 25 Apr 2025 20:47:00 +0300
Message-Id: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJTKC2gC/23MwQ6DIAyA4VcxnFcDKKI77T2WHRDqJJmywSQux
 ncfetoSL03+Nv0WEtBbDOScLcRjtMG6MUVxyoju1XhHsCY14ZQLWjAJnZ1hxHkKUIIxtMOi1aq
 pJUkfT4/pvGvXW+rehrfznx2PbNseO5EBhUoILThyZRp5cSHkr0k9tBuGPA2ycZH/EvU/wRPRa
 jSGlbSSDT0g1nX9Ag1LQnbwAAAA
X-Change-ID: 20250317-fix-nexus-4-dd0fe3bca987
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2452;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T3PpYspLOO+gT+LsL4Ms6+Mv85P8reL4+qw0w1irQnk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qZb/QjJ4A38LuGB9rUu7bpDvQn1Ad99K3Wx
 ElrSdzYSK+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmQAKCRCLPIo+Aiko
 1aR0CACKoI3FN28qpYlVRdoR4wC+aqqa7liobPj4ayZWItPIjXlpB3kbPyA5rJaenggn0EgxqQd
 NDu+6h8UL8Lv5fvW3OGDDOzDSJuW1eQ57fRu0PPiXnufRvLQ3gkUbj/cED4q9YCHZGoaMHiWasa
 7fYWspPdqZGeAA9ZfbtUguz6Nj60BMc8Rx6L3sHPOzYfA2T9DbMvdOPm+fgzZ1mvbqqMmXD2iAz
 kKMv7l9Pvrdpo0mtqBjEpZH1rqO8wCK/I28oPmUiJL7AeiS/KnyDUMuu6DjYUIQBvH1XTYUqWRi
 HQcQVG77P6tkpznGkl5PPSxsncUSeRgXoXIi3dfsdDLyQaA8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: iEvBvtg4wM7D3HdQFZDlhzLtS4yz9U3C
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680bca9d cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rWM0Ewedwwy8-PIQtLIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: iEvBvtg4wM7D3HdQFZDlhzLtS4yz9U3C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfX/67Uzf5nrJAs JpXB75k/iuJR98pzYhCMitM62GMzE3hIvwrpsuND1/vVWk9nn6VkjR/szXRD9B+IuI2p/JPl0hu 2fjmtzdvq74PEocWaLAoLxtvMCHHUPffxmYjOv7MWjb19TCmtrRAEOpAzHpi/KYHEcV0xC61FUX
 NnSnVAZgD+xbIdxT3vqBu6feC8pTcGIs6b9CWpBj+x8tDEaD/FqlIcx7slkT1fZQZY7Kfx3NyCa C4VqPAHg5GjsozrdJluTs0Bzfb8bdemAbLB8JwJT8oA438cwBBFHRU/ASuXX8xisvMVzEpSGYUT cHy7qmkylbWruTFtbKdBBTfp0LEE4jaEb5CgPkvOZEjh7gKp/Iur4PMaJqnozDXZgVTRn+hobKz
 BsefS4oZ/5MTycti9BBrtgztLlb8rX2QkKkdmEkAu2QjpaNmfl9+8DQx8Q0BDNovLgaucMLT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126

Rob's bot has reported [1] several warnings for Nexus 4 submisson,
however none of those warnings are specific to that device. Fix all
those warnings for all APQ8064 platforms by extending existing schemas,
adding missing schemas and making APQ8064 DT follow all the schema
files.

[1]: https://lore.kernel.org/linux-arm-msm/174221818190.3957236.3364090534153729086.robh@kernel.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Rebase on top of linux-next, fixing mis-squashed MFD commits.
- Link to v2: https://lore.kernel.org/r/20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com

Changes in v2:
- Corrected Fixes tag for the clock-controller patch to point to the
  commit which introduced qcom,rpmcc schema for APQ8064 (Krzysztof)
- Switched to syscon.yaml (Krzysztof)
- Reordered ports in the static replicator node (Konrad)
- Fixed hwmutex node address (Konrad)
- Fixed clocks in arm,coresight-static-replicator.yaml (Rob)
- Documented clocks /clock-names in qcom,rpm node (Rob)
- Link to v1: https://lore.kernel.org/r/20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com

---
Dmitry Baryshkov (11):
      Revert "dt-bindings: mfd: syscon: Add qcom,apq8064-mmss-sfpb"
      dt-bindings: mfd: syscon: add qcom,apq8064-mmss-sfpb
      dt-bindings: mfd: syscon: add qcom,apq8064-sps-sic
      dt-bindings: soc: qcom,rpm: add missing clock-controller node
      dt-bindings: soc: qcom: qcom,rpm: add missing clock/-names properties
      dt-bindings: arm: arm,coresight-static-replicator: add optional clocks
      ARM: dts: qcom: apq8064: add missing clocks to the timer node
      ARM: dts: qcom: apq8064 merge hw splinlock into corresponding syscon device
      ARM: dts: qcom: apq8064: use new compatible for SFPB device
      ARM: dts: qcom: apq8064: use new compatible for SPS SIC device
      ARM: dts: qcom: apq8064: move replicator out of soc node

 .../arm/arm,coresight-static-replicator.yaml       | 13 ++++
 Documentation/devicetree/bindings/mfd/syscon.yaml  |  2 +
 .../devicetree/bindings/soc/qcom/qcom,rpm.yaml     | 15 ++++
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           | 88 +++++++++++-----------
 4 files changed, 73 insertions(+), 45 deletions(-)
---
base-commit: 6ac908f24cd7ddae52c496bbc888e97ee7b033ac
change-id: 20250317-fix-nexus-4-dd0fe3bca987

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


