Return-Path: <linux-arm-msm+bounces-103731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2B0bEsj65WlwpwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:07:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D965B4292D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 207FF304E5FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7FB38B7D4;
	Mon, 20 Apr 2026 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deAFQQ7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B17pk1DW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40653939AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679482; cv=none; b=G6aMWhLrzTB+VGDGb5iMa+t22A8DmnjNcGR6U8HEBkXv9xaa7CeRJo/83Ub6EVtU65k6ld9oeiOJgTQykr5fTYGAUr4hmANmb6P8zMPjQGb7hViWAPmXzTzHHmx9Gdy5i69fQxgohLr3rOurdkL6SK/NTtH+9hQcNxSnyPM1qDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679482; c=relaxed/simple;
	bh=b3zzuY6TUS4lgqMPJCu3ADeR7Fg8Kb0+2YyrmLzQdpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dutTXZ0A1924dRcApyw4Z5uZ/Do1XzA5RSCs4tYwsmXbUJMVhpZciuelmzoizQVcvLXb/WvFuDNMbfrHm2z+VxiZV+2qMT6OquMOlkxVIKF5uD8gR0S411000ewp/lAdDUbq+cS0q7LQsGGnj6siGBeM6ET9ALDsABi8b0dQGSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deAFQQ7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B17pk1DW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97YJ3084729
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EIaCzSLbPIl
	cN9EEk5IcSefKG1COTkQ/kZY1zJv2364=; b=deAFQQ7YBJL9YY2S1NyUQaqbb3O
	T9raiknYhOqG4WgHnLFA+UkIbNvLu0JmMHwZnj74GglnVVZ5Ouue9kFU5Clpo2pU
	+K3u93EIAKKvmyx4G+Cta7iEXvdZPHwnsZbQvmZmSzYNf+D4LvVr2ZzpXphBDvgX
	JJ7H/FTF8mgthzvPvyfw635f1wt7iKuZ4ubRomItIMTzBL/4AWBgtOKORBkaHhjt
	n8iBuxkbIfQT3efCxVW3rFtenHl/9LRTiM+qzfbgqWcFSeRDBUqXPlWiZSf6stjy
	S8Co/GBgEkLZTkb0GzBp2TkpjJdhZhFNt28FgLE4R5NEMYIXHGFfc3rbUzg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh81g7fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:04:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso3136231eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776679479; x=1777284279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIaCzSLbPIlcN9EEk5IcSefKG1COTkQ/kZY1zJv2364=;
        b=B17pk1DW/PJcfgiAzv7U7sZElNO4m87M2sx1/4OIpWvNXw5QE91+kedrJbrXzrW8UV
         xub6HVYsJ0lyWYcUvCpI0eJSaR0hSW8sH1sAZ/jflAvO4aEnyDIhdtQ+Re6qX4cGyDB1
         y+Hit1/3eYaQ49GLYsWTuOh2W9jMFfcl0QxFWG6fYbDAB15aavFvi2l0p/seSVUxxo4a
         G+vQF8bypc1dFcKE7LrrSKktqtnVfM2HXN+2JNfUpCPS6Z7TF/w01ulnvnhQbhf9YWmR
         MyNCo4xqObeU4mM1gDHI9pc0xTNShhoZ96vDmAdIbMvZSH0wH5J+0wnzZ9OboZhS8vYN
         vZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776679479; x=1777284279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EIaCzSLbPIlcN9EEk5IcSefKG1COTkQ/kZY1zJv2364=;
        b=kWIKasKenaLpXzoPX9GnF7iQF5hGelPKFZZ//KuNZsLsVXHV3AnIm1oFzNEs/Fn3iS
         Q9EshrzBU9gJf0+p3RT2mjtRH6E5MRVV8A4jYxfHuOsRBITF42/5oAtM5IjDmwtw5sqL
         F3CJqr0Xz10cCQja1LElcmg8hyejIDQzccjjSsYTcLhc2OdE+7ia1WjENQSceqsemmC+
         Gi5SYVCy2mZEha2Ir99aFKhzUm+4SwNMrW11R8TL3sQNYK6uH5iOX0EBC/BKWBIvBP88
         nBuAAV5hvCDGEJnVKdHux0qcrc5UgKekMRi/kWZXZziByO2dijMCjLuJ/CfUASLQXOA7
         BQgw==
X-Forwarded-Encrypted: i=1; AFNElJ8yogSg4mFLyaDnsrcB8X7fWnVmlNLoaRYQJGGAhvxnVSwqs1Exd4AdKIcGcPRdhIqHxokO2DOe9m/Tw1HL@vger.kernel.org
X-Gm-Message-State: AOJu0YxlbUS4W6/1KKg8VWJRdA1Igrg2hJiS4KasLixgeTc1XKEznZed
	Tm/5ELj8KZyK3t+GzfQxvVNG7bkZAsoS6PYEGxdyZRoRnUrgc8AGIgmJqVMr1lvRf/If8ij58Tf
	n32YLNuE5On2JUltOOHOh1NFMOwZP6fDjDHs1ScowFBLH9weILBpKXYSjzE3EZXN+NfSx
X-Gm-Gg: AeBDiesnhZx9EMvkTLA/YItVLmCzPQ66cnhzMNVR6OPVhuWh7iV+Ii1oPfww7K+lURn
	kwG24BNsGz3o+wXlvcNwV3a/xQL6yVrXWPmrQ7bP7dmzpkB2UiR12vj+A6TTwTqVYPwgaLR2pHM
	rdOA8T1Iek4oeBSr3mDjjmMbDQTGtAIIibRpbdTe5t/IqAajjzS4iX9G3xyQkJbad4yqkhNZisc
	ka28lGsfFpq/wdqpFD/Pc+Wv69EiLnz297JYYJYwBKsDsWqeNz1Hw/P9ZBpZMBI9Q9Ha6+xAEDK
	USW3Sp1MqwW2ULUvOTiQxOLColE3Guxvx6o0datdDroWNeSe9/eDilO33wVWhOApgtzzWF90jU2
	shJDW4ssCDS8AyidRdAvY0Hru344s1rVVr0NZJMLProULp9MSonOIwgnMhY0XnlaHkDkGSC+2kI
	tlprWU0P9W7tWlABjn
X-Received: by 2002:a05:693c:3108:b0:2d8:df01:d9f6 with SMTP id 5a478bee46e88-2e478c20551mr6024808eec.23.1776679478998;
        Mon, 20 Apr 2026 03:04:38 -0700 (PDT)
X-Received: by 2002:a05:693c:3108:b0:2d8:df01:d9f6 with SMTP id 5a478bee46e88-2e478c20551mr6024778eec.23.1776679478382;
        Mon, 20 Apr 2026 03:04:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfef3sm13076436eec.24.2026.04.20.03.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:04:38 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] scsi: ufs: dt-bindings: Add compatible for SA8797P UFS Host Controller
Date: Mon, 20 Apr 2026 18:04:16 +0800
Message-ID: <20260420100416.1252983-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420100416.1252983-1-shengchao.guo@oss.qualcomm.com>
References: <20260420100416.1252983-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5NyBTYWx0ZWRfX+Kqlu8kOH07t
 bqMiI8V9voRzH4N3sjgc22I9WwpkI7WDJ1sLyNwGKFMAvhHsnpVEMGqXSzVsmithSRgSEePN+4t
 kx0Bn27hJZu7vCw8GMLHmXs/BRSdz+Po5i5EdYXhFSCmkImc+r7xEgx50ZHZHLihRMMiiNny1GH
 eiR1u0p2Djio1G1n0HterhXFTJ4V1Rz31nTPUBfn++ZEh8XCcCj5DETnYDZlxdw97GXLe0JD9NS
 EzB5/yiaCCr0xmIAkHGKDLrj86FzPuVtsjJVE9YzB4vS8YMevsIdYnq87iKJ1uOPzg268Myew+p
 ltUzpXDUx3cE7njLtwulOchegGAYrDfhB5gKFBscsdFsklK3BCAd//a0DJ7RWkqCC4rCTK/f9if
 b3nur7B6vd2tTPMo2KcD/dqZ0OhKSVKpg3T+t0pdAlqY0ybZvShwGe4tMTE8McfEJc+qdSrB/HO
 d36d8/VlD1r34Cj58AA==
X-Proofpoint-GUID: cpL38ThJvJ-2QOdTLcujNZ2Q5asktyOB
X-Proofpoint-ORIG-GUID: cpL38ThJvJ-2QOdTLcujNZ2Q5asktyOB
X-Authority-Analysis: v=2.4 cv=PsKjqQM3 c=1 sm=1 tr=0 ts=69e5fa37 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ld1VxiVWUvbaCiqNsT4A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200097
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103731-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D965B4292D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

SA8797P is the automotive variant of the Nord SoC.  Like SA8255P, its
platform firmware implements an SCMI server that manages UFS resources
such as the PHY, clocks, regulators and resets via the SCMI power
protocol. As a result, the OS-visible DT only describes the controller's
MMIO, interrupt, IOMMU and power-domain interfaces, making SA8255P the
appropriate fallback compatible.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml        | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
index 75fae9f1eba7..f2f3bfc73216 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
@@ -11,8 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,sa8255p-ufshc
-
+    oneOf:
+      - const: qcom,sa8255p-ufshc
+      - items:
+          - const: qcom,sa8797p-ufshc
+          - const: qcom,sa8255p-ufshc
   reg:
     maxItems: 1
 
-- 
2.43.0


