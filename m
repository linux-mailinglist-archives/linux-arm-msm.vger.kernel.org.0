Return-Path: <linux-arm-msm+bounces-72328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 076D1B45CCB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E957188443A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F0030215F;
	Fri,  5 Sep 2025 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkIyLf2S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC5A2FB0B2
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087081; cv=none; b=K4ZdvrQlX93rOtL+l3KEGd8SuwE8VTDd53qTeOSGKoKVf0eKy0f+sfNoOGm2vQy3sINQLYNg444RSERPlH4LWAp4bLhBwaseNcjfbojLMymxUObB014lR2qcLwirg5Rn2HGSH99pD4kq4w3zrGcg0VRsqWTwzUW8JyRgPreRvi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087081; c=relaxed/simple;
	bh=ROujn7dp7bppBLnxm3K3XpMOBDn2+OlyLJK69FjVksk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EaRdJ+Nwxzr6qvSDMxoCOrHbuam+7eqyP0aXkVkddITM2HG/tbsbhQ35WRriMYMOF0p92szRyfb4Wo8NNouOL2pK0ZNiBRcLVVEEgVfW7Ky5Sgmk6DdpmBj3K7Ajn0DVG2x7THGQQ59MGgV64QhBb6OwmCkLvRq/0kezZqRbeWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UkIyLf2S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857LlQY008288
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 15:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6cVRx3cmyc19pzQ+jRbWLtqnyxCx5rv9VK6
	F+T36Woo=; b=UkIyLf2SqWOVDk6RRYf48FjlRlPTyQYcuQRN+TO+HgA1XYCR2la
	miKLWd+CPXkmJhoDgVrkT7niK0h+0dUlp4RwxXaL+FXpiRG5UhWxxdIwLsy9Vgab
	CzNdtNWoqcoLPxxuRrQPwkY8B/JLBBkv1ibEEq7oa3r7+ZH0fhBJv6cdMmfTOkrS
	cRGXG45Riom12aJn2hv7L6BEfbpNYw7XxS9r2mgjmUIcwVjqC37YNK1MPcA86V9N
	VcDga3niudp0ULmRr5qlCCxVPhKHZvehREoUwvJ8ksurC9uhgcutlO8KaOO4lBu3
	fiidoSForJqgGAWVr/ZC+aMBEDluyCisJww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjujas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 15:44:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5e5f80723so32244961cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 08:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087077; x=1757691877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cVRx3cmyc19pzQ+jRbWLtqnyxCx5rv9VK6F+T36Woo=;
        b=BVQBTbUnMqcMGZg/64UCzBhu0I+/pd4ke1lnjnPjX9JxMDgCgzJFp/V7i4sY51REhr
         Zey1BnhnNXlJJdtAi/fWxTYbjGbah0mFRVSY6YWXVOARdgw9hc+ZeewbixXgJfA85ZkC
         SaBm4stKhtiLT5CXss/YXZkNAWWe8E3skJLnf1Q/kSNwjwx0X1gOhZ+vG3c0Po7DeTVQ
         +u7sr1qMQlsxTXrpawu2I3X56PCqnx4+JBb3hyHrC2e323XcOtIChSI1hB8FRpIs98RW
         BTXGXmtwHjWEh/8+q6wYtIpsMZFqGytOIE6Gq/UhgNKMvtbMH/lgmJeSb7NSGk+ARUEM
         bukw==
X-Forwarded-Encrypted: i=1; AJvYcCVNsRts6jhjIqb8aiTFKxq7MRo7QBHVYooimKCKpMINaxLQ6KZi1zt+jtyEt6bBr9TB5c4dQharNmgBx1hH@vger.kernel.org
X-Gm-Message-State: AOJu0YwcMJMYeHNXkVwO7H8ofnr+Qvsk0fPPm04zScUWBRUdT52mcAUu
	u8YxpWobTWz1FCKT+l7ma0uIN52Xi88Fu548oEVZaqVOZ5lNXaM0kAVSEmtwAYADxwV8LTFRFfT
	gAP4RWwIbm89Gnb64HBCpkX5EjU6bW6/CsDdbSm9PLRblP072ZH7ptjETcs2BtGn7voSp
X-Gm-Gg: ASbGnctIt+t9iNGEt5AVea0chHmQ/iBBosWEUqjT/5b4/zuriTrqkMSR5+MyTUu6iTz
	ZIlz4t2ispr4K2wJha9tclR1Bpjo1AtzGC7JZsAfLK0+uTv8KwHqeEhtxRgxvqrXYDARRMBwNob
	QDUEigeITtAvAZDQilwFvpd7DnRjA5q5uzl9280TpDWkg7EMgmXu/ogtS2h/Hew+3PUKQsBLMmG
	1a076Wzf8a4XRtVSds9rf8QXMjJOeDFbFLyixUOeRuF8KN1a7xaxg9jRsypMMMDfQW+bMknjiGD
	lOEnpVdV6DD+wNN1rBQj5yHcNmC8x4ytSl15OaKYhkSt06e+VKMHcQ==
X-Received: by 2002:a05:622a:1e90:b0:4b5:e925:fc6a with SMTP id d75a77b69052e-4b5e925fe0fmr37081091cf.29.1757087076930;
        Fri, 05 Sep 2025 08:44:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhaW+hRQN4a/2r+1WyMzrpI5xdfa8nBO9Xth74jDeBbJjGeyj1Ucclcx/fmglFqSr7/onWHA==
X-Received: by 2002:a05:622a:1e90:b0:4b5:e925:fc6a with SMTP id d75a77b69052e-4b5e925fe0fmr37080411cf.29.1757087075841;
        Fri, 05 Sep 2025 08:44:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9bcda91dsm165716585e9.6.2025.09.05.08.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:44:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 00/12] ASoC: codecs: wcd93xxx: remove code duplication
Date: Fri,  5 Sep 2025 16:44:18 +0100
Message-ID: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68bb0566 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=OLL_FvSJAAAA:8 a=NNk1almXngzNn2I0ufIA:9 a=sPFwb3Qtu_UA:10
 a=kl_IBrakYWIA:10 a=dawVfQjAaf238kedN5IG:22 a=oIrB72frpwYPwTMnlWqB:22
X-Proofpoint-GUID: PuOuMSRFaS0jehZYg9-k23U31w-6uu64
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXw3oudTN2xads
 buINYLuZv++dRxsBhUoY73Y0cDKBQ6HHtx4nNep0WYjX6eE7zKYbV2NcMzQ+no8vjKDLm6MHiri
 Qzz+ANHQYn+fLvNeEnHdTmWlTCUd34WSmHNfgpBgxOT43hz0Dem/uNDKFlhP3a6XyWr/owy3Phc
 TPA76oolKkUWsVtoXSFSaUF17odi2DBBamU5diGpm2xKs8cf2jXUf9LYI9exS6uXEW115EUtq2l
 j3ssitfTCSXUwju3nGx0U5mqXPRjEvmXjk5wLCMP5Ny2bK1Qn2/e8RP1dgpAoI5AgGbp+EsywxC
 OOyEiLcOoG7OdUNG2yQmrmhgLaLH9uv1duF3kM8FbsUoZFtuMCkm0Hg3hcMhXXgEKT3Najs52X6
 wo1wV5q9
X-Proofpoint-ORIG-GUID: PuOuMSRFaS0jehZYg9-k23U31w-6uu64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

All the Qualcomm WCD codecs and WCD based codecs have lots of code in
common, resulting in lot of duplicate code.
This series is an attempt to clean some of this by moving the common
code to wcd-common library or to soundwire helper functions.

Currently I have done cleanups for 4 codecs wcd934x, wcd937x, wcd938x
and wcd939x, however any new Qualcomm codecs can avoid this duplication
by using the wcd-common library.

I have also added two helpers of_sdw_find_device_by_node() and
sdw_slave_get_current_bank() in soundwire layer for the codecs to use them,
this series was already acked by Soundwire maintainer Vinod.

As original cleanup series was depending on the new soundwire interfaces
I have combined both the series as they are cleaning up code
duplications.

As am touching the same codec drivers, a bug fix is also added at the
start of the series.

There is still lot of code that is duplicate, but this is just a
starting point for such cleanups.

I have tested this on T14s, any testing is appreciated.

Changes since v2:
	-combined other cleanup patch series 
	("[PATCH v2 0/4] ASoC: codecs: wcd937x/8x/9x: cleanup")
	https://www.spinics.net/linux/fedora/linux-sound/msg25202.html
	into this series to make it easy to apply.
	- fixed copyright text.
	- fixed few empty spaces and re-arrage header inclusion into
	  source file.

Changes since v1:
	- add new patches to remove usage of dev_get_regmap
	- add fix to wcd937x for comp soundwire ports


Srinivas Kandagatla (12):
  ASoC: codecs: wcd937x: set the comp soundwire port correctly
  soundwire: bus: add of_sdw_find_device_by_node helper
  soundwire: bus: add sdw_slave_get_current_bank helper
  ASoC: codecs: wcdxxxx: use of_sdw_find_device_by_node helper
  ASoC: codecs: wcdxxxx: use sdw_slave_get_current_bank helper
  ASoC: codecs: wcd: add common helper for wcd codecs
  ASoC: codecs: wcd-common: move WCD_SDW_CH to common
  ASoC: codecs: wcd-common: move component ops to common
  ASoC: codecs: wcd939x: get regmap directly
  ASoC: codecs: wcd-common: move status_update callback to common
  ASoC: codecs: wcd938x: get regmap directly
  ASoC: codecs: wcd937x: get regmap directly

 drivers/soundwire/bus.c        |  12 +++
 drivers/soundwire/slave.c      |   6 ++
 include/linux/soundwire/sdw.h  |  17 ++++
 sound/soc/codecs/Kconfig       |   8 ++
 sound/soc/codecs/Makefile      |   2 +
 sound/soc/codecs/wcd-common.c  | 143 +++++++++++++++++++++++++++++++++
 sound/soc/codecs/wcd-common.h  |  44 ++++++++++
 sound/soc/codecs/wcd934x.c     |  82 ++++++-------------
 sound/soc/codecs/wcd937x-sdw.c |  67 ++-------------
 sound/soc/codecs/wcd937x.c     |  85 +++++---------------
 sound/soc/codecs/wcd937x.h     |  24 ++----
 sound/soc/codecs/wcd938x-sdw.c |  83 +++----------------
 sound/soc/codecs/wcd938x.c     |  99 +++++------------------
 sound/soc/codecs/wcd938x.h     |  26 +-----
 sound/soc/codecs/wcd939x-sdw.c |  98 +++-------------------
 sound/soc/codecs/wcd939x.c     | 104 ++++++------------------
 sound/soc/codecs/wcd939x.h     |  32 +-------
 17 files changed, 354 insertions(+), 578 deletions(-)
 create mode 100644 sound/soc/codecs/wcd-common.c
 create mode 100644 sound/soc/codecs/wcd-common.h

-- 
2.50.0


