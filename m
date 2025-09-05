Return-Path: <linux-arm-msm+bounces-72303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B359CB45A6E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 16:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D28F21CC4878
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 14:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E5F371EA6;
	Fri,  5 Sep 2025 14:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWu1qiX7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC87B370589
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 14:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082435; cv=none; b=iSQf7B5l+PfXJkqhinR9O+sTLMDHSycZXu9X7m/9a//JR6UFCMnj5kAVMdZxrz5gY3xmlEnU8lc+flEEk1NzESQPsnUauyxvtQEMt0oggHgIkZrVFtjHrcl0zziJ6NbkpuDTcIUOV39fOa31R7BbntAFoypFoTOavOCus0wAUwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082435; c=relaxed/simple;
	bh=0mrJk6zYNya7zNruWFwjYDMwVqqDhslfcndoay6BTWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pvEDrwlkeTBf8iDOnG1TIpwGt3KCFdDZLLQDYLjGaIXCwMgIvdEez0VyJqATkijXDuzbQuShDsfEgv+34mZWd0KH5A+Yduo81aX6niVcawVYgeT86wkqjU7cRbcIZYghWEw58dj48H8eLUJqqY04YmWlBboW0F83HnEGoETw/4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWu1qiX7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856xLXJ022166
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 14:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pN4s5Jsp6Mg
	beINTKiydsrxJyktG0zAYiE2Vu5bV4zg=; b=XWu1qiX7fsu6kSjhvUA5rJwu2fo
	mtOMYmhzVXK29zsms4jRb+qmPei7tnqruP4MmX4s0cpC+N31svND7iCYUAGlVHiw
	yiFJLbs/xeMVkq4hDYaxS1yf1yKrkl3mAK4qi77apuZcOlHyUe//JglHfRFzwb0x
	9A15sV+R2WwdnQXJh6cIslHZoqL94pCdnjKKarTYLb8GnfQLzPPLXW4IRldyKEn7
	weDFlwsdw1SvI1a4Q7QNpJt8TBYpNn3P8ez4vSk/L4F9lT5fhV9psJKQBS1vtVnC
	v1zeS/wxiBm7/H7J4C++s1IqQAE+9SzJkEyBJUYQ+EVWayp14+MWTIfyJ8g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk9b8f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 14:27:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7724bca103dso1863925b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 07:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082432; x=1757687232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pN4s5Jsp6MgbeINTKiydsrxJyktG0zAYiE2Vu5bV4zg=;
        b=sMwKk/kJ0gnifPnlwVJ/lwF+/dL6UxnNfnS8yOCiTRCKkSRAgSFQ/119RFK9zbcdV5
         uE3SzhechlAAiXW2CnJZ78N8pbNjWN5vB2WoosiRiUs02u7XxWpFTr10HSGDWn7vdtsY
         SoFWGteo90S2dTV5R5UlDFqh1A85dh8l+qlgvoLri5uKgEc49RcqxCSsEZF4cIA2BEfo
         wW+8Iyr1gIYX8zq9FP3z/69VnMrs8fiOlxgLeeJJBUyFcltxF76lIqhTX5tMVXWBz8Ns
         q2Pmlh5+u8p63t8XMADyfN37GViR+yoExYVd2HLTn+mP0Djk77XBNn0oFi/SRHtTvHpT
         YAaQ==
X-Gm-Message-State: AOJu0YxPBpHGW4v8JzkM3dXIhmjFeaxOyB6UEfQeFgFzm7FFfvGLoJri
	tsWNedk9875Yg2yIceDLMalg36sFC4Qba9gG8OFzOyXBIsBiHVqUSbPc4WKjPwXopszBP+7JoyM
	SDCcQvP9cnA/ypth9Ovy5tp533KbtGp7upzb99HeVZLyLhO67dGbxHmqp1MREWEt494J4
X-Gm-Gg: ASbGncsH4z/Zqr+NTTrAvKLBfLAQb1V+/PnaeCB7sOLCUozC+NBdCyABaMR3Ftj/Pqa
	DNv1PSaNBuAIy1R++gwVqaU+Nazdyl4wW34YKZkzUfc2NKQ0vvpMzSxdatnj/Z7iKI1Rkq81rVx
	GxBGx1whgup9N3oPzyRdKiAebb3pHn/Vtrxx+QACAkPtdzn05GNyP0A0pJRwjcaZT9ip0Q+Z4Qo
	eGASR9BEIR1Y4gEFBzab9UOHr7ejUXN+qmvxpeXYLZNsTGMWKFoHZfeNZf7EmOh+ibtA2rrh2SA
	66dOwPHy+0bL9ee7QfMaD+w5/RWFm8HmjgIieEfu0HWFTv+S2LiPuUNWoDSGrjTHWMtRkxL3Na1
	i
X-Received: by 2002:a05:6a00:4f81:b0:772:60b5:957b with SMTP id d2e1a72fcca58-77260b598a8mr24282244b3a.32.1757082431966;
        Fri, 05 Sep 2025 07:27:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFQKIMJndn5bwcU6MyFm5v/inGRI3uo/dgTXqP/UDOrNbxCF1ZR4FqzrLYTPamp8Ieukwasw==
X-Received: by 2002:a05:6a00:4f81:b0:772:60b5:957b with SMTP id d2e1a72fcca58-77260b598a8mr24282190b3a.32.1757082431468;
        Fri, 05 Sep 2025 07:27:11 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26a601sm21930824b3a.3.2025.09.05.07.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:27:11 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS8300 sound card
Date: Fri,  5 Sep 2025 19:56:46 +0530
Message-Id: <20250905142647.2566951-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905142647.2566951-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250905142647.2566951-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wMlNuo1jI0K0QW6-iQNzJi19GhOLNhqL
X-Proofpoint-ORIG-GUID: wMlNuo1jI0K0QW6-iQNzJi19GhOLNhqL
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68baf340 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=zZQLtTUG7XCfRDSkAgYA:9 a=zgiPjhLxNE0A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX6kPeXmkb12jD
 NEmZEobVd6IgPKsCdK/a1dk/bObVk/W8IzzDokQGy4p0Q/A2pZRak4ufMmgx3QEoSKiuZ+ETqQ+
 F3zwEHmyBnQ/P3bLqP3Gqiz9XRt7AfhlY3KSd07bfdrjGYQQWIjE2kBjiMn1zxNXfUgqRUDST57
 kBSbIKXHG2LLNeBtWxep7sS7acenXSS5CTNfEtsL/vfdbH4bJRqa8VDI+wP6iOE8AcuKw/lJ0n2
 SEBzNCYm5TycS34AODyGnFV133trZHRBuwx7mZQXgSg1sy+srsypTQNgK36s/qCEV+UNOSDsJd+
 4rlZr3s975Syt021uqkmjZs6AYYV3g390Odmqyl8BXA+t2w0QJaFkJTd6qJFio+hEZ4pvGSYOZw
 y+PKQQEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

Add bindings for QCS8300 sound card, which looks fully
compatible with existing SM8250.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 8ac91625dce5..eebf80c1d79a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -35,6 +35,7 @@ properties:
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
           - qcom,qcs8275-sndcard
+          - qcom,qcs8300-sndcard
           - qcom,qcs9075-sndcard
           - qcom,qcs9100-sndcard
           - qcom,qrb4210-rb2-sndcard
-- 
2.34.1


