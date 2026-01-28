Return-Path: <linux-arm-msm+bounces-90924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPBdFcLNeWnfzgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:50:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C21F99E6AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9814306E2F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 08:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B87B33A9E9;
	Wed, 28 Jan 2026 08:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkaihsyy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LD3FMtPz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3B133B6F5
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590032; cv=none; b=S/Q3nuMX631vXC+p1ncH+q0AruKU5WjHUI6TecxMnoGLQrAPCwoVp5dH5nUPzWkPhRhYiq4UvDV1+SuR75vghKMkZyNuBPaUBDA60ws8ut0wgW27zlMZ6LkGzx3sDkygIFv2o/Bv7XzKmMdQR4VVJuqDDxKSnRAM9lDdPlsjOQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590032; c=relaxed/simple;
	bh=ylcz5FSDejXLscrAzKaX9+cbwcLqyVwvsZ++Oq1bUtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iSQwZzkaGYbO2KSlHg9JJ7Jx0ze+oaholuW0Av16DfdkqNhyBp0Nhu4qFWB1HYaAmSWmLHp7pclU8bhJpJMnj5VR+1pa/cBMhlNYfHQ32kX1RSiSA2HhChapHnp4UBlHlkuvLmhZmHG2qcAwsNYmaw4r7AFrztJ/+W4M7umQp1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkaihsyy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LD3FMtPz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S6TovL2953452
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MPGRifHCQwcqLRDHjnRCAFVn4y3dD4oL+zZhUOGVvhI=; b=fkaihsyyXn6cSOWg
	HvofXbDd8+zxLp+NKwQRTAI51shtN1eoItzJpU9+a1Eja53xJButEQu3iAG4PB3M
	C3+eqsFTy1hMTkHwqDpF88GmEeD+UFEd8Qd9/UuqDxRADwVNOZnqsTcTcKnM6bdV
	GbOahVf27EFYvJLp7wSd1gqJ35gcCiqi88Khs93lEHnNvXCaTH0r29MVqgcI2ai0
	3scenD0ISffObqO0ZPW22s2m/tYFbPtiNKRGKxdjboIY3rsbOhTs1sU9Wn/vxZMR
	gwfc5lJTQpZxDbr0fzXvdgwMwBZxXaOk9Nob4ciCDu/Sj0ulUjWDCJCe3t0LLapq
	SF7EqQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjsxj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:47:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a79164b686so72651965ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 00:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769590028; x=1770194828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPGRifHCQwcqLRDHjnRCAFVn4y3dD4oL+zZhUOGVvhI=;
        b=LD3FMtPzabhyrp6UW/o1Vmhp0n1+SuQl3cx/x13Ww4KxzUq/I56yyRbRYLdcUV6GFK
         3D5agtmk6LXZ9lCZj8Jnk/0JcmvhlnCu/Q9SXq+GEXas9djQJcm+w1NnCPtFg9rvY2Oz
         sDLKUasadGN+MTZJoDiT/ZedpV5r4sv1rsz7PA/3xDXcYgPO9S62z4LL6o9OP5Up7ojL
         iFvwEbVocKqv+W82wNqNk+bEshl4zj6hCY5FcvMSeQ5KcqPmCxkO4i3Ttik4kKToBEn+
         s7YXmfcTB/WrY6WOCDiUQMTktxEayuYuvIysP02tjhGJtONvhH2u7Ndd/MaylegoiSXX
         I+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769590028; x=1770194828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MPGRifHCQwcqLRDHjnRCAFVn4y3dD4oL+zZhUOGVvhI=;
        b=oCMMS5rD6o6J7tD9UANoUC8Kz68kjKJlP+wAfo76r8W+sCERa3t+CvxpWDFxaIupX4
         2P7iaseEeMqakFxfWv8moxj2vS4F6xHTH7SyhPX347CnZTtcGRgiylzPdbWUGlHwni42
         L382l10vlvFfvDONg4E59Kq2oDIcKu4UEeXnZOLXC9M8iyGJH/IQ82N/NMAt6F8VRVTp
         /LCJNmONPhxsDTfIgAftIgeQLhrT8mgnNWIuHSCdwgmiX9LwiN55M8wpKBQH+i5qfxQa
         R/z3bN1s5GvAZDzMUVbJErE5bSA1xp74akpZ7JUpmTfbwo+S1mej1A/oCm92Q5SeKC+K
         aUxQ==
X-Gm-Message-State: AOJu0Ywf0Db82QSJA78/9yQiSG0MIhyOlSrD6sLETUgTOYtESwnftCK6
	mPdQLzI/HLSEgI10EjDS4O5G4T0f6U6etq/YtB4IWlakLYCVjmfASd43Z2sockEt2vzIiCn+HXx
	6Dr634NvKxe+4OTE3l/glwGHH7YuFYI7BDfwJj++h/QDZGbXcX5wpybnqLh9Cx0R6BQ63
X-Gm-Gg: AZuq6aLOnI3o1oaZ2j2CX87k1nISAS/gYo4bTt0zei1MzahvjqdOhpmJFP5yVuwCaW2
	UOSxgZ+VIvi9rMmd7FtqjlsdbZoNwrXwsS/64i1SK8WE0PePOXBF2Cex835mssdlolBon7klOjZ
	gEr5wNNdG6X7aa/UH7GEeNm+bN1Q53lsW5kJ1ETMRIM+aGag8VvXuwTHbzNNujOlGLvId1CjUR5
	IBMKI8nEv8XG+xIHTBSSVCT02qQWHpFbqEs7tvAcERFVLXdO0UwkeT0/QWR8pe+0m63Yt4fPFqM
	PFl/CdrS7HuuovFr8SYCCGGpsW3gPstENbRfgkHZA5AuEBvQ3q8LLi2wgvUNOQIc+FGJa2BPBE1
	Ns/+cL+jf9JrmHvtSPy79I+8kHnWXQ4y6mO2+mjQ2C2Q7c90=
X-Received: by 2002:a17:903:2f87:b0:2a7:ca82:c198 with SMTP id d9443c01a7336-2a870d2cf70mr42149155ad.6.1769590028054;
        Wed, 28 Jan 2026 00:47:08 -0800 (PST)
X-Received: by 2002:a17:903:2f87:b0:2a7:ca82:c198 with SMTP id d9443c01a7336-2a870d2cf70mr42148815ad.6.1769590027578;
        Wed, 28 Jan 2026 00:47:07 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b1esm16263075ad.63.2026.01.28.00.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 00:47:07 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 14:16:43 +0530
Subject: [PATCH v4 4/4] soc: qcom: ice: Set ICE clk to TURBO on probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-enable-ufs-ice-clock-scaling-v4-4-260141e8fce6@oss.qualcomm.com>
References: <20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com>
In-Reply-To: <20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA3MCBTYWx0ZWRfX/vMNDIm02nQm
 Je+WR2Q70wTxKCE7xKUbNxf1/wRYn+RoCCcTly2ehXJV004VsC0RoQKgQgI9GZDVh4ucdmPBwYo
 OnVymgG+t5XOVWzVmOmz8eg0o6XkzsUYXo7OzLh9aw+tC/ZFulGnWlZvL2vVBg9vLgafxZhmbQ7
 RYfjIsgkKZD3EwnjUbwcUuKspm0TsAwlNKhgru2goODxrFrLma+2UO/GbpZXVyqya3ZI6aQhUYn
 KElx/GPMhLlyjyR/HZn35MXu2gAuodKHav0vXON1MMYq0j6Gc/2OLLWc2FDqqz7/O6rh2txhOmE
 AG3Ywps1IerI5yqCCunq22+fitDXuGM0SvkwAAzusogwXiq0vUgQyUbCJjVAmZO7iQkQPl8t0XB
 xeQJ3l2LkZTCpjWSmkHTgWpIxcZad+11zYccXE3d7POrEvHYgjCVpO6k5w3ZWHirZE0+miP6BiX
 Wc+6uMOaIKRqHZ4lGkg==
X-Proofpoint-ORIG-GUID: dkeb0RTx7ECK7tij3OSO3h-vSVel9Bc4
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=6979cd0d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=u1bwIIJuvd_SIhYoViIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: dkeb0RTx7ECK7tij3OSO3h-vSVel9Bc4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.56 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90924-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:~];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C21F99E6AF
X-Rspamd-Action: no action

MMC controller lacks a clock scaling mechanism, unlike the UFS
controller. By default, the MMC controller is set to TURBO mode
during probe, but the ICE clock remains at XO frequency,
leading to read/write performance degradation on eMMC.

To address this, set the ICE clock to TURBO during probe to
align it with the controller clock. This ensures consistent
performance and avoids mismatches between the controller
and ICE clock frequencies.

For platforms where ICE is represented as a separate device,
use the OPP framework to vote for TURBO mode, maintaining
proper voltage and power domain constraints.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 90106186c15e644527fdf75a186a2e8adeb299a3..2b0e577fb4c9ed9b746fe70ebccb45da9c52b006 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -689,6 +689,11 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 			engine->max_freq = rate;
 			dev_pm_opp_put(opp);
 		}
+
+		/* Vote for maximum clock rate for maximum performance */
+		err = dev_pm_opp_set_rate(dev, INT_MAX);
+		if (err)
+			dev_warn(dev, "Failed boosting the ICE clk to TURBO\n");
 	}
 
 	if (!qcom_ice_check_supported(engine))

-- 
2.34.1


