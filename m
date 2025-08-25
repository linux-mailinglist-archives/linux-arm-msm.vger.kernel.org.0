Return-Path: <linux-arm-msm+bounces-70615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81467B33C75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A25F16975D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81D2221726;
	Mon, 25 Aug 2025 10:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="loDKuZEW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945AB2DAFA1
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756117216; cv=none; b=djHjJncgyY2eqQx6wIhaC/VGkb1OgBdxywEy2m7S55/OcF3Fx9npyGRBfV24c3Lg+LxXNwfdf16e+Bwj9lam/+jSp1IqxVG1euIbQIpEjBlza0hMZACFctZuCaNRBwdN8OS+a38spJ7mHKuSngOYHxfgeW+hjdwNLKZXfALgxZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756117216; c=relaxed/simple;
	bh=RLZYqqi//5RnWAMeN6nxa715wGlha7uD63TVE3Pynno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q+nz1rlZM4Aj7P0+VH0L7yIoDdjJjEjM5RDbNFuN3inCfSi80kyk+LhFwaWKhQ4oswQ1v5loTooUt10jaSSTKGRMhjjfAriQEzT0ZA/Ts5oF3aHjyC8ndDatJZ97duxDF06cosUte0F8XPlBruKlEbPpvAwakHwFc40K7yBB4Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=loDKuZEW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8rXen017085
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yztCHRXhFHT
	zplQctRRReRNHrRO5Blb68p3E5GRPtSU=; b=loDKuZEWs53U7X6/F1VVz00fCSi
	j3niDyvwpf+c3XxikCdQN09NIstCbai2PK/xTeZodRMCSoJecZmmk9dJWlwsY/9x
	ZW/48wzJYlXQRJ9sdeB1orffKsIfHarOoPV2ReI9Doth94V+CclbYRYAvnphx/m8
	vk3QPHov5qfWeHlRdFX5GBXnj9zDi10rUfDujfwaOI6MSbGBYscRFP1dY6xocfa7
	iJhJR22o2zqnvNYbMLN4VEYiRyJ3vgVg3++9EnO/JvPV3inKgL9hoeDy5d4Z0DLe
	5JZzwhyJuKy8r7P/c+1+rm44TL4FfJQvDnvPPM6R3Ko1FngXXhfNTWphNVQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uc4mk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:20:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24636484391so31011725ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756117206; x=1756722006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yztCHRXhFHTzplQctRRReRNHrRO5Blb68p3E5GRPtSU=;
        b=AxJhmeGvRhXnW3iUeFULV/e7+SXYrzL4tEdly3ErVyfPMuwShTEATKkhzrB11kJ/Fy
         d8KdBFDQANYP56pnhpMB1+AukyV6cG9hVRM77TV8o5bk+7tbpOGGVOlO7YLJs4fFuWV4
         iO2g5/ulg5bZAZeP7x/gjTV4Bx+MTjnXzS0yDtf9aDo8/21x0fdEEDRskyXbTuPslFvr
         XvJ0MvSDbovs4hbL2FpkPvbZXwJl/yDP8KDseKjhYA4dqH400JiNqnp4+yltqVhwtHjJ
         0vt5MmDZOvE/LDjG1WhBkmtJrBFknVKZiMX4qHdKoN2vF8mbuqM3vJ4rywvRUQihi+NM
         CP1g==
X-Forwarded-Encrypted: i=1; AJvYcCXDQgVyDzXZWXttjUwZxS5xXxHlSOf8FnrqDqFkxLZboZ6EzgZl8CmOGnwgWC1x8XoXGfl8IaG8RH/B9pLT@vger.kernel.org
X-Gm-Message-State: AOJu0YxVrsyF3VITk/kCZZLl3jg84tn5MY0dSH1LzKf89KzEx6GHfufC
	+RZHhTMKbek8VKf0tybZIeRzQ2v8M2XbiglIhu7Uw3dXM+XMeeYciWjPBQ/pIUiJMAshhzhleWo
	OyNUZej38+9qjeS+AqXyOfObMVHcCy5WrcpUNJOBHT5/czDpY92I5cjdFnG2PE27zhNJ8
X-Gm-Gg: ASbGncvGkb1yEEu6kY2pbFIdiIKuzI9lZBRoxbjWSSHvk6zHjxKk+T/zWRjlqmTQkNR
	oRszMX4JmNLuxF4fjwOL9oLzWXDiyGkNWzHf2ZpfhMV2aC+/UjQ6MOm7g9KuayNMZSDoo2THMKt
	wD04UrwnYUWwr4byH2ghjl6mcp+vF2d+bnaDg+dw6zqvJAabeTKPzkNshibVEwrucBkWhyo5Y8H
	zjzRk9UOpXESje8+Kgh20yg9K+R8488TGOqluBI+UgWW7mBCKBjMAf3+z+4mAqNxT8GV4thW7VS
	PcOPbMTAweMKYd3H24WsDAoVS+wghel8GXFOgVxv6FpOU8vq9XgLOtpzBmB8xh5lfmqCvQ==
X-Received: by 2002:a17:903:943:b0:234:c8ec:51b5 with SMTP id d9443c01a7336-2462efab368mr151708985ad.53.1756117206143;
        Mon, 25 Aug 2025 03:20:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtk5KZnDl53rbNcM3EbALNYQ/4b7DIGbdt0GMbEPE3xaw95AIiSZG2DkDcc4QdxpiJl1oaUg==
X-Received: by 2002:a17:903:943:b0:234:c8ec:51b5 with SMTP id d9443c01a7336-2462efab368mr151708805ad.53.1756117205664;
        Mon, 25 Aug 2025 03:20:05 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687cedb2sm64540585ad.68.2025.08.25.03.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:20:05 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 12/12] Add sysfs ABI documentation for DDR training data node.
Date: Mon, 25 Aug 2025 15:49:26 +0530
Message-Id: <20250825101926.2160554-13-kishore.batta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfXxC2uM4pEaHge
 ENIb6ekRBkXSB1qS72g/l3vlCr1KRNH30WH8ntYpgxT/9ee96cS1ZrwHQkHvGVsDIy592e0YPk3
 7+2zzwKy2cuZtjvoN7sP1huI5S+OTP/5YP3LyPvBt12Kb7SnjA//oW+K7neRSth7WxphuvYnmEI
 AGXrU8mN6A0cShuWpshVL2fS7n42uvYZOS5tie0fMgGSMomNb3kE1G7wEsHotUuBPviyMlKJNtf
 n2MyAO4O6IBM3Sbyutv09hJycTtZsQcRqNN863mSDyPdUwu0n5bBVWhiZtOyK7aYPgSBq/W6Yzo
 d73UBIMzNnsXPegqgoHdLo9fAfSaoKvH/+uQDrtWMD3sDup7mvoX5h7D/ujwwcldeOx88wtmo0x
 k+78lNVQ
X-Proofpoint-ORIG-GUID: uRuQOrIiMl0mxx-ejNEBZEAhJEQvGIbb
X-Authority-Analysis: v=2.4 cv=I85lRMgg c=1 sm=1 tr=0 ts=68ac38d7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=v0jzxZJEQF5VuvYxU7EA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: uRuQOrIiMl0mxx-ejNEBZEAhJEQvGIbb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230032

Add sysfs attribute documentation for the DDR training data node.
Userspace service reads the training data and then stores the card
specific data in the firmware image filesystem.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 .../testing/sysfs-bus-mhi-ddr_training_data   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
new file mode 100644
index 000000000000..30fdcd383a01
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
@@ -0,0 +1,19 @@
+What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
+
+Date:                   August 2025
+
+Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
+
+Description:            Contains the DDR training data for the Qualcomm device
+                        connected. MHI driver populates different controller
+                        nodes for each device. The DDR training data is exposed
+                        to userspace to read and save the training data file to
+                        the filesystem. In the subsequent boot up of the device,
+                        the training data is restored from host to device
+                        optimizing the boot up time of the device.
+
+Usage:                  Example for reading DDR training data:
+                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
+
+Permissions:            The file permissions are set to 0444 allowing read
+                        access.
-- 
2.34.1


