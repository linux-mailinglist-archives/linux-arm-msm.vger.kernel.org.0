Return-Path: <linux-arm-msm+bounces-87047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A882CEB3F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 05:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E221301DE10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 04:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7938030FC03;
	Wed, 31 Dec 2025 04:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4oYp9q/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FOAewJjW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A67C30F81B
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767156985; cv=none; b=RF62UHZdXMcueOJLYgPHL0kvRD58nY5m7Ry/oP3oSjSIgjgNAfnZzjzNwoSuTVGWhGnxsOndcKaddK2lLoAvGCKblLyl3MoJw5qdZEfDy7GuuosVNsmf3H5M8cOGxvyzwSN9+thIDDIqhLRCiRxmTQm0Zqar6l/qWLaEhmI0Vpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767156985; c=relaxed/simple;
	bh=n/olLfZ4nDPE0Fc/nYoIgrhjqAFOMhm0RkBbmAj4e+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vo6bMHFjZfO4d5LX9wpLuF7RhJaGTGv+G0+FIwj8A2NF8FVuo+yXtYk2HmBbch43Sl/wtZ2g97e0T7DyoSt5fRTf++3ouKrEl0OavvzQhOOgzr8jioOcM70lteWSEt5nbddomPSdfjTZl9SPoKOUnB0fjsmizAhUy/4o//zBiv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4oYp9q/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FOAewJjW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUFjhF3899357
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YaxEWXLeS4I
	QAnQ85ZZDFxXJrHCM2rSQp1hb6FjV+/I=; b=d4oYp9q/uUWbk9VaKQyOeCV5tI2
	PUZbuY9d7qDLGGnYFF/vu3UKASyntZSxiRLUkZsV9Ouna2y1PMBG+FuUx3DqN3Cn
	3fdUwO77APDOaOsUV4tM2T1jCCCcUTb7IqWDXCvP+1uKT2GVgmaaLn0OEWulcb6A
	myHqNDzFVwe3U678KNHwp/pAyLeqKPlG3bzb2TQhK8gJcanXVzz0+VRuzjRpwdUc
	pbZBESK/e9rA2EsGKe2W1WhOYUKdzc2sFa4OjFe1tAfNy9XFBSLGgcp2MiOu8anm
	27/H0e2GevC9rmmznaZPRwVRsg2Zisio1ouzPnfR0oIc3uBxacvujBZ557A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky2psp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:56:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso29246865a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 20:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767156982; x=1767761782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaxEWXLeS4IQAnQ85ZZDFxXJrHCM2rSQp1hb6FjV+/I=;
        b=FOAewJjW+9vG1cHDery4qRljWODsKYkdVsA2GtdT9H4q4x7rnQy79t+gil9kUbvJvX
         q9oHQePBhlc9JEzX83b70L/+WmsUq+U2m5MIIHWdOPysKARYVXsnGxsgPY485yFj5Ck7
         dlUATneCBWUwegkLj3ly8GnCEJECEFCNXPG+1JmINRGNiroj31n7Cg8ax45CodipBsAw
         RukZdxwFwuuyQQuoWfo3ddzSd1tdsRVWe6rFDA+9E4cIPBqs4VtIk6UBnG/03b8uWj2z
         2r7cX2RQBSleOdKIVErcZNwoGPZQ6TPJifYPq7bEQub2O9wwE6dMIrlCvxUbf2N7dBUn
         Tjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767156982; x=1767761782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YaxEWXLeS4IQAnQ85ZZDFxXJrHCM2rSQp1hb6FjV+/I=;
        b=k69HCndRGmCNamUSvZs4E+TKSXHEs7WslRmqlLJ5gaG/MKWeKNj1tdUJBFQPsS/ji4
         qvlWMA3Pa612fQ+cHR08iMMHo19nAs1xEgNU1WSi0WIx6atvpdLZUICh36YXfspjziCU
         ZP+/BW/pXMmirb7mVg1TPKHVwtGa/3tPknHBJ6MH5zTKXvlrLZajtrU5hHw8VzI1pkhJ
         DVwMPC+lKaYLrqVHY8hDjZJAqA+j2shTMGbaMMcEFpfGibdUTwVUJmwpxgVTTk4Y9Mzw
         wPCe2pWJntHalBHnCAPFaqWXtOJjR0rPuPjjGMintxWGmzQQoyZIVFHI0BLZTTntLUhw
         RiNA==
X-Gm-Message-State: AOJu0YzqW2BFp1paka3NtwYaj7Emc0DV+YjtklD1YS6tmhs8pDcBeAPG
	LyY+3bjXmiDAgDSRm6rJHoZ7wYyuyO7KjmYngBUU8EFEKIdiOuadz6WFVUvlu15Y70itLFotKuQ
	v9dByXJnS/TYlYEvbfk148USEaSWJxmyzz+4oakUfthFDwNuqlcl5UQbYEoLpizZtftoy
X-Gm-Gg: AY/fxX4/s5Er/kd7ddxEugg05u/zxxRAxAA/phyIzyIVzTRGo9bkhjY0Vop6eAxt/P/
	npSx+bsGW5Y4SDE1ow5pLiOLrNsEHJoNC3qnMf+UlRF07lCTc2TKvhaEh6QrTZ946Qg7Vh6HcCx
	YrsG3KvmrkHxbJbAAurnhZTSd/8DoRn98Tp3xw9bXGJXYRaLcFGBG9KeF9oeE3kDI7BjscLkFIc
	ZeslyNbJTgolTEgMYT73bkxvvcZ7VaNXKllnSUAm+UjRQQxfYlyjFwBI8oznP21fyAnhwqhjN22
	bh0LRhw9fN0ipJhlO5rlnuztKGSRtCJrrqext+7y2fU22E4XqE4k4rw609t7i11jrYEVF09hE9R
	IGmcY78CTN5x9PGKT4qSWHCgwL3O32O1aKajI2CqN
X-Received: by 2002:a17:90a:dfd0:b0:34c:253d:581d with SMTP id 98e67ed59e1d1-34e92139ac9mr28297977a91.9.1767156981833;
        Tue, 30 Dec 2025 20:56:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1Cw52gEmn3J+jHIF5EeK4gMmpZSxVOepfaWx2DOsUmuRGWiYQiMvdTve6e3AkMOg8HCyXbA==
X-Received: by 2002:a17:90a:dfd0:b0:34c:253d:581d with SMTP id 98e67ed59e1d1-34e92139ac9mr28297961a91.9.1767156981415;
        Tue, 30 Dec 2025 20:56:21 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d4f7d3sm34547697a91.4.2025.12.30.20.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 20:56:21 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com,
        anjana.hari@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH V3 1/4] MAINTAINERS: broaden UFS Qualcomm binding file pattern
Date: Wed, 31 Dec 2025 10:25:50 +0530
Message-Id: <20251231045553.622611-2-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231045553.622611-1-ram.dwivedi@oss.qualcomm.com>
References: <20251231045553.622611-1-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDAzOSBTYWx0ZWRfX4IPL6nuX9qZb
 BtSFwz/3pX8ik7kly06G7rM7dCDhyTWKqorY2MnWMzT+KkPgzfCU1RIG7zJv/5YignzFGKsaIks
 bk2xKiX2AflN8d5NFdBFDdz8opS1fRLYBie40OPh2wYpyAJfm77iDp/AI0ztF+E3V0KOMa5I1MJ
 9kw0WzuMRFSB62Ip1a1zzmNZq10Qn47bisZ8ZoJDnBqGHj0rs7RIPg3rXwln2VtGeNg00KY8oOY
 XNy2z8R4YzBszKo53jwmG9OUpG4SAmdyy2kLKCP6v7yc48Yq/PHYPEFjhEeXqDdNmsBdAwouu8s
 u1JqwzuZUGh1UWv72292T5HwdGTvEVdI0BbsLOj+h214lsaWuONgEvDrluZAIXGsrPDPwYmM9fA
 9hP9pwPmJCba3e1kmov6KJIGDn6saMO4k+Ng/4NfxLBJ/kVSn9Y/x4//G6UZDpw51eS59sWvUCO
 jzNcXJCcH9R1xjU6zsg==
X-Proofpoint-ORIG-GUID: V9_wDeVkczH1k17ssU27uQzwqpHUUW4G
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=6954acf6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=52jqHT57hFt4fz_33zkA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: V9_wDeVkczH1k17ssU27uQzwqpHUUW4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310039

Update the file pattern for UFS Qualcomm devicetree bindings to match
all files under `Documentation/devicetree/bindings/ufs/qcom*` instead
of only `qcom,ufs.yaml`. This ensures maintainers are correctly
notified for any related binding changes.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0dbf349fc1ed..70c43fc74401 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26842,7 +26842,7 @@ M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 L:	linux-scsi@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+F:	Documentation/devicetree/bindings/ufs/qcom*
 F:	drivers/ufs/host/ufs-qcom*
 
 UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER RENESAS HOOKS
-- 
2.34.1


