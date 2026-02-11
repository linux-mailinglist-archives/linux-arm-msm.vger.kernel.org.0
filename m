Return-Path: <linux-arm-msm+bounces-92592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLIfCJhQjGmukgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 10:49:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEA1122F08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 10:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 348443006168
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 09:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9007C36657E;
	Wed, 11 Feb 2026 09:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbhCdtvg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LROTliUn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA886368287
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770803303; cv=none; b=SgrOFO8DU3xImC0RCfeKcuH7xnsGjQM+u5PJ8quyBfb/fCtvX+qlUK8nGMW3AU4PFeBVAHnMhcwhqiILpYnZRaeaLakkhPDKVE2e1jF7fRkvclfG3v6KAEKFlKggBVwLe0vLHnmSAjkL1w3Uh5EXVBL8A5zWPji7dL3//DE2J8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770803303; c=relaxed/simple;
	bh=dIso6CD1flNYkuHpVKNC3gO9e8xW8V5vdISkstjOSdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=feW7H+OoKSaQbdBUXDJhFv380gw19OAer0VM8DhETagJSHQy5oCkACAydDvWokxxW+VTAYhFuaBPGOTShLW4HA9rGl9PffkoiDeqvWY26i5HWQ38jn21n7P+5eXPYSskSxgAiSqRnFfz4j9MR0UY7k3pbklsOVBs8q9GiiTA2qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbhCdtvg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LROTliUn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B8iuos3320512
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7YzoQCJ8EA8SUK5OnoYqyU0eTduA7SL8L55krvl1XL4=; b=FbhCdtvg7aCdl3QO
	2IdL1fkF6AQ4liUxqwS+TLslLhH6FE7x6cdQWOSFPgK2uQPfWn4d0yJpPyVtZfgd
	0q7CgADuDI3Q4C0VGj5/Tk7pxWJQ8UkV2atriZ69vPk9iL3hnAVxAsGptB+1KEt9
	Dr3i+lbDX1OQgffGu3g+77wiLJsGxRo7EcR3cPUoKGJKcfI8SbJa8O0USaKHs2D7
	YI7d53NQ1VduLZ3xhQaaw4mFfvzWH6795osizpkTQbtqLT5SKFM7mOGmgUCZSoYW
	Ze1HNYjejVbJ90JaQPWY/jVyzEHCyAifoXdAmdW++YQ0E+n2J2sjmz9RwruhnSPv
	uy9q5g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8epshk07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:48:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3545dbb7f14so6416623a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 01:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770803300; x=1771408100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7YzoQCJ8EA8SUK5OnoYqyU0eTduA7SL8L55krvl1XL4=;
        b=LROTliUnIuD8emm+yo4Pu/Xd0IkdZpzDGpoOfWVQPw8NEC2WbppzfR/oNUN1LL62X2
         9nMWMqiTBHLRsBN13rGtZK2KPK24nsTD2ReTBvB5bzaHfJc+aH3vb9pVblIYIsZuLGpI
         nZtc/vbEloJyRJrWjHN59UTXBDU2ebfe3Gla+MBsTWhAkTYDhdGvgJjH6q2/ntYZFkkR
         fm++SZR77rnb7kgymJw4O0tPICm5qYGe1Cn5NkA2gJD3K+A4THj5Km1NIT5j9LjplUZc
         6J3hFdYvzFUzofiiHtx5nas11qu6kjhElHlmTLDt5JgCP3XvwNYoE5p453GabbqP49SY
         fnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770803300; x=1771408100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7YzoQCJ8EA8SUK5OnoYqyU0eTduA7SL8L55krvl1XL4=;
        b=kQLIDE3FBEbUKwjbWKB/aMwDYK8i9jIZ/0ixLB7nVAHCZD8ArA10HzDLVQFd9KqpXX
         xWM5rlKdgJnoK50X8ZrCXm8KbcypboITCQM/wa6q6ZTxAaoofuobNtTI9wgojaIQHw2i
         OxZPj0t2pR94S5MG5AEPHpm/5XQj4Y2jYO8N3B5u8vaOZjJnbMiYAV5TnQ3UYgtXpnqM
         EQ9Q/pd3K3GSGdgZt1WlGM+XLEAl6FP3AuVGKl2od19jNL8il5ZQ+a/jjI3GJy+xFtM6
         iOFGIX/WDUYjS5xwYOdWBKEtMW/PfVvJAmuB5NwGngS8WuhLjhKEkSAQwzWpfr+abr0F
         jxVw==
X-Gm-Message-State: AOJu0YzS3cXDIWPNA1y4AkqfMeT+4rm1CDkno4CuP3GkV02Z5YhVqqQW
	gmqZAQFRPMxryZ/Z0ic7JSFGfhw0s7CbFgRi7zCxrm268oT2vbRCECZF4rOIzmNuhwUgPKFwxVc
	mjT14/JBeW3nOn56B16qzpIBEJHzdjCGAR21nxwt4eg2YvnALNLGCxghHdnRRnZBlevDd
X-Gm-Gg: AZuq6aII1aQ7jCqrukwb4ptw8OETJ5cHFqpXn0FlZeksKD5YULfAAib5FiBgwkVNdOt
	pk27CQ+TDGwl5Mcu8k5VRN2XKA6+Q3fdrNPFomSCsQ08YTMhZNZvbMgsqOf2SL9sSI+RXwN087i
	Pbtp5kOQRFYFGR9yz2/JyFzn03APtTsQnIJBBPHXJ/kDVfWObszRKHysHtVxvHZ4dZr3KMy/YsV
	qWJ+ody9dB7L7dzNoVeAp68DVYbEZctFURwqSBUsmlEBtFcLXU4XYbh8VI1AkxPxVTeDnEFB4lF
	XFIQAO2Xo+1d6DNSgzTFThS7zbFAOyyspEp2ddYReE9zvJN7Akr8tZ9xFF9ucWWjEd5Mm+ANzck
	Vxw/9w1rcIqvmKYIKkdmf8HhOzSzbUchAD4nfmXPrTNKowKm3yiUb3nxA/t4=
X-Received: by 2002:a17:90b:2f0b:b0:354:7be4:a250 with SMTP id 98e67ed59e1d1-3567f7ab2f1mr1563853a91.12.1770803299919;
        Wed, 11 Feb 2026 01:48:19 -0800 (PST)
X-Received: by 2002:a17:90b:2f0b:b0:354:7be4:a250 with SMTP id 98e67ed59e1d1-3567f7ab2f1mr1563830a91.12.1770803299475;
        Wed, 11 Feb 2026 01:48:19 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662f6b84dsm7526640a91.10.2026.02.11.01.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 01:48:19 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 15:17:47 +0530
Subject: [PATCH v5 4/4] soc: qcom: ice: Set ICE clk to TURBO on probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-enable-ufs-ice-clock-scaling-v5-4-221c520a1f2e@oss.qualcomm.com>
References: <20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com>
In-Reply-To: <20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA3OSBTYWx0ZWRfXxB0ic/bDh+Nm
 6Cg6r2Qu+ONRVRwFZkzCSep+58E0Q2/rAS/CKVbxRAoQF9VXlcwxxcidUoTQIfHyU5sxBTUsjkS
 qZzn1eNho83lptQ6na3NI313OZ0O6teyJP5SBZXM0JIp2hDZmA9ekIl+XXh5IV1/Ft6u2dFtrJA
 VcbjilHRl7nJRVg9gSWE8nGQRvEgfrqhbmr+vVX5beBrFNgTviGQM71LOmfXa56wGUQafHnhbJa
 13R0h7u5O1iqGeP0u1ZvVAGOBBGtKwEEm1f2PB8+JB2Yvn3T2092ciz/XVm8g7e1m1+N7F2Oun9
 //5SD0uNBCc8hHR2fU3jjA9yEyF4kLaSv8h3Pzd1XOQIjWDIAnFBciKDA/tf5OWJY27N0SItE1q
 r0XxfFaK3NZIfbQ+VYl0UQqC7jVQGRBP3RjxlRit5IfGriw7rmXm5yg3Vtl/lGExtzxSWM3saFL
 y0rZTD+Y1pjBCPHLICw==
X-Proofpoint-ORIG-GUID: LXF442j2rSJbPdlxuCXvRdijwVo3s2SO
X-Proofpoint-GUID: LXF442j2rSJbPdlxuCXvRdijwVo3s2SO
X-Authority-Analysis: v=2.4 cv=I/Vohdgg c=1 sm=1 tr=0 ts=698c5064 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=u1bwIIJuvd_SIhYoViIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.56 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92592-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:~];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BBEA1122F08
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
index 0bdc64db414a7028653c0f3327988b1554788fcf..3b69b5673ea93fa927e62a7f4b5ae52878d564c8 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -707,6 +707,11 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 			engine->max_freq = rate;
 			dev_pm_opp_put(opp);
 		}
+
+		/* Vote for maximum clock rate for maximum performance */
+		err = dev_pm_opp_set_rate(dev, INT_MAX);
+		if (err)
+			dev_warn(dev, "Failed boosting the ICE clk to TURBO\n");
 	}
 
 	engine->core_clk_freq = clk_get_rate(engine->core_clk);

-- 
2.34.1


