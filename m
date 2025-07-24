Return-Path: <linux-arm-msm+bounces-66595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F31CB10DE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C553AA6B99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FFB2E2EF9;
	Thu, 24 Jul 2025 14:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UcZAcNcP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7025B2C15B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753368110; cv=none; b=oDpHH/XWQkv0TnrrIpyW9qxf9SWmZbeKe3pgHfmcdaGc2+nRqpNehJozW8Y80lNVObR6VBrQjcgg/5qrXEchZC1bWYdsC75RanzY5BrZQOwViVDY1QrLuqKVYUsyOGMdvZVaK/oI0DfZ7//JkVdoc9BfqKsxgBG3VYovb+A8Y+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753368110; c=relaxed/simple;
	bh=GDxIpn+HjBE/i7KQ8HLxbsTumEXzL1xxNJJZDvJblB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R73ZydEmB866KP0TgMQJv0QWiQnrGjl71YhtNnn7FMP13TrRpJo9Vs5C7+hyQcQntuT82vZWGNftGr1TyD8LpoLp7NmTLXs4BxtVxUHSLDaGHAE4PWYMXsuq5hrEMeFhvUhdafWCUch32o1wj5nh9/UVjQgco/iVJXRQ3fEgYPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UcZAcNcP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9gLCu018111
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KeXH5ykokOM57Pag681/Khsyjh3uAbBGZxE
	7rDNyeH4=; b=UcZAcNcPXKRwFMv5k5Ci3+bQMnLOFii5/HZRWEAirMqSxw9kc1i
	eGZuzqcpMQ5LwA+br5Yc1clC5rI83p6fb4E7/WSU+Ia4C3Zdh3fB2A24tpbGNrVg
	o74vpy0dFvCNkYM6Dtpptj4WBsy3fVdsxs+DIUUCjOt5sOZ7AgGMBq4WnZcbf+kP
	RJIkoXN7oWKzbVZ8o+fzvl3QxfsFzD79pWg6oT5zoW0Eqwd9FqMGA4wixBeLTNja
	btU1tyknKL4B+qeJcE5iM9rHYmX3wirrnDNsdrXSIjPqle2Olny1m3l2zI45EY5C
	RF1I3BHI8Um2J6P1T5z6GY90xuyLUdzU7Ew==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6u7t4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:41:48 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-87ecaf83467so16615241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 07:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753368107; x=1753972907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KeXH5ykokOM57Pag681/Khsyjh3uAbBGZxE7rDNyeH4=;
        b=GJsDXiSYGpKB/865t/E+GXXWybSPC5te6oACZlnI9uX5NtO1mszxcCd7oL2tlT3D8K
         PPopOagSmpS85rfHXOC9qka2589Q5eZOdUquPar0K77vI8afc1gXUGtDDUv5rxsBupqH
         Ij7aazNuxsLESL+iIW65QSTdl8SL3uou5Y/P9KNywilu73hXMzw2V3nRTRJm2USBhKuE
         hSctkU+3yizBt0Hw77GE/B6h+TaZqAE+xyFasP/5dIjvQUFp5tUDTwQpJEYI3n3AY8jz
         YxU/2ZmGjbrYJ0L2bSzaYeb0fcMp8j99nNsuu03v33aQ8dO4S7i1iwtvZgCRcqd+eqRi
         HySQ==
X-Gm-Message-State: AOJu0YwH6+ZEsAGlq6sL8KrRc3+D1bYLMl+LFG32qe9NSLhu37cS2Iyb
	tO2DaPHj4zA6TcfQC3065RV4HDDfl6BkFquFbVhWAOwxYPfbV/iHRDGM7YfypNS5jChqXd5POE/
	yHSMghbmsdI5X+l8P7VBh+J+sMnOUY7VTDRqQYCylWqYY4xiBkzXBrlAZA6HsaorxhGgiH2127b
	aS
X-Gm-Gg: ASbGncvtoZlb+JGyp9R3Jh53ATQj831txgiwq0U+9tdz/NUF59G1V33RsRf2tOWchbN
	L7FL3/b31/Ikt0HzNRN3YwiOHex7J9wfiSzeIVztYHu325lNVLBa/7OOqwSFh/VCXyRAhNP5Asw
	2QOzOWJIsDJ3ivTFxClTYLr4nldKw03If68FL1K5YGNuAufbJ+UITe2+18SAuWvCWjSoSKaW9eZ
	7RC9T2HOZ+dffSJ7vCFZhR1/m3fh1zJbZT2mZiltiWSi5iKKYuPcb+EySVwivF+nsS1BfcPbNZo
	Ru9eN6iGgm7vBHcxsn13nA3h+LjpvoW4wq4vv6bUDV5KRjj5tQVzMA==
X-Received: by 2002:a05:6102:8007:b0:4e5:9867:14fb with SMTP id ada2fe7eead31-4fa1521fa52mr4134452137.24.1753368106759;
        Thu, 24 Jul 2025 07:41:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6qBAi1QNrC53DVwX1YpypErqxTm8Id63ihlek/m4cP6hTLHXgkkHpe1W6HgIWVH/KotXkgw==
X-Received: by 2002:a05:6102:8007:b0:4e5:9867:14fb with SMTP id ada2fe7eead31-4fa1521fa52mr4134418137.24.1753368106328;
        Thu, 24 Jul 2025 07:41:46 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458704a77fasm24268285e9.0.2025.07.24.07.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 07:41:45 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: update status of ARM/QUALCOMM MAILING LIST
Date: Thu, 24 Jul 2025 15:41:40 +0100
Message-ID: <20250724144140.108251-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=6882462c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=YL6Xjd1eAAAA:8
 a=w5y3jCgQB0Bs7eq_IqwA:9 a=TD8TdBvy0hsOASGTdmB-:22 a=yLS1KB8ZbIgHeRWbGdJx:22
X-Proofpoint-ORIG-GUID: zTzdqbcxCuhEzr9CYmV32v78DJ12cRrb
X-Proofpoint-GUID: zTzdqbcxCuhEzr9CYmV32v78DJ12cRrb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDExMSBTYWx0ZWRfX7IG9mXC0M1Z1
 wsxRIXrNAHESrtyezS05pbgRKA1Q0E0U/BXKkNTD5GqSvMe5x3rGZQrgu+2meGc4Jb0IkGLV9RT
 xV0HECvMxxzQEtH28mzInleU6m8I8Sz3Na0EipnVD7ko0QbQFy7d/z4LE7jFcocQt9D/SgD16PC
 9Wa3rl6XI0F6z4mf2vjceSu1esmBae/hkdjoduR+BxkPu9dYw2DHlzihsLieaOn/PbnwZN73fMY
 IwY6HAjCVKVFmV16Li5bj8rHBr9wsEWoLP3VVZEYB/4cimvVG2AG/ggWp5O50fAVFz+8yCRwe8H
 f4wcIgYX2lbhdNDUhlyjwUQMniXFCgLoBWElYGvqiNTi0qqHNibprdfbriQOkQ3UDTXTt6XIZxq
 yKOgNciPNeCL4MSfIQCUV+XY9cJ1KHIdFoxmwWeB0O+gUXd12I25vYFdEjzVw81965EjEkj+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=683 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240111

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

get_maintainer.pl will reports:
ARM/QUALCOMM MAILING LIST status: Unknown

this is clearly not the state of the drivers under this list.
Updated it to reflect the state as Maintained.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a510e4aab9e..6c0ba1827fcd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3076,6 +3076,7 @@ F:	arch/arm64/boot/dts/qcom/sdm845-cheza*
 ARM/QUALCOMM MAILING LIST
 L:	linux-arm-msm@vger.kernel.org
 C:	irc://irc.oftc.net/linux-msm
+S:	Maintained
 F:	Documentation/devicetree/bindings/*/qcom*
 F:	Documentation/devicetree/bindings/soc/qcom/
 F:	arch/arm/boot/dts/qcom/
-- 
2.50.0


