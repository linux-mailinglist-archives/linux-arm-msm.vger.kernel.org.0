Return-Path: <linux-arm-msm+bounces-109957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOp4JHu9FmqHqQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:46:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 087AB5E2067
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B31B9301A7ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775213EDAB0;
	Wed, 27 May 2026 09:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIRy68N8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RKMAtl7d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15753EDAA6
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875040; cv=none; b=kpZEqX4/ESDn7Q/7SM5412YhvtYa355XnEpyLy2y5B0le0DlnfO7ygUyEMmxQn60BIJzD0dG0F4wNBOvfs5HdqKIURMCpj1fFV7KqEkm4BErzjZdmhPJsGU58SjRcNKI1koFgZ5CBKCC0be+MISmc0tteQMg4hc0qiAhik1B5Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875040; c=relaxed/simple;
	bh=S4MN5Lx+JgvX/76ZD0ZuUHOHxy2HF1SGKMrwcl1B3EM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FITo45ipzzsk3NUi/lMdZcarxXZDdmtIdsElyFbrRjJdfWvw1dPOrCsDacAqFvNvvquyj+6iRblbvuDhTDRY1EXHF6XOIRKhYqX5OScZa9quaT/lFpXLZuz9ZnTQdoL06aWr1tgtUQEqj6A9rcNGqLdArtgQDBerTuNbotNbDC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIRy68N8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RKMAtl7d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mVrE3830831
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bafDQcm3FyR
	GDTM1nVP96sfs88nvhyUJwVGPCaXqq+Q=; b=GIRy68N8sTizJne643nS3AkyXo5
	NubHC1AW2a5KdYXEoRUp1W/gXLn0v6tuSrNlFU4wXNWoxk2hrLaelEp7g9QYlf5d
	qEoxaKjt8EvRdMRgtW68Z0VeAkr9RNPb8/+ngFrtc8FFRwrnQVz8/842Al2XrtU6
	RFY7XdjgkI7flxoLBNpyzfjvEpSS+sX8wo6MZhmKStcEf8dPjapWlDZDdmEgaua/
	rniYeKiwGKmgZB9FrNTvmU5JIYsZ40X4iiqaUvYj/OP+Td1T6Gi2zT3mAay0NIub
	ZDtGvbKyBZg8YXuUQDUVBWgK6kuPjxd66fUUAlPVsrBhHZ1Lao6nC4LhoLA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edn17hxkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:43:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso117678425ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875035; x=1780479835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bafDQcm3FyRGDTM1nVP96sfs88nvhyUJwVGPCaXqq+Q=;
        b=RKMAtl7dkGdIlfbMjan3moGFydqOoKmD/K9KCpn65H+Pko4I4qGCo5GCqtoGjlYWDx
         EIODkJYony/WUfILsgyUFzEIAWPBH4U8yQ93hYJFSrjtCCsDy94Enf5KYEI2f0ZDP2RW
         hYTvXNsdegtjVNXoMktAmapXPIFrhPKf2sjqyAA0vHccP8hqLJU6i4KiIpkJHrndh9gx
         iwFbsLnJ8BzLOtvESxiQOUce+gsfHfgr5DUsYgFKdmRawHOE4IgRL1Rzr/9Rod4PwWUz
         /YEss7YuIGwgkWDstjdTVliv9noGhSGVTs/W8rzaVoYq/bPQWoebRU0SwgNThSqVA7bc
         nf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875035; x=1780479835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bafDQcm3FyRGDTM1nVP96sfs88nvhyUJwVGPCaXqq+Q=;
        b=i2d2XxaccCGXTpyhAOwoxABgg3q5j7h2EWOLpMMyisQIcdr0hngdaZToaHKL0CSM7v
         +ukE7BiOLpg97t8KAzHgVS7RJD45ilLq+QHf2+nFuV7tZuDPCPrBxMHNXwQRxCPefBP/
         1t1B52sydvKTMjfA/pkqoakwCQvJAmhlTHIR4qsMHkuYEu3kpRhPRk0JywQtRAiFWQrG
         ly//IHKx/zXxybjNr/kDEX1thy3JY0MGPHK+LVdELfKyr3cu0QQdGlVuCcE63ohAmObF
         7KtvJ7O8Dv/9osyZCz5EW5uNzqqJb1rIMt5zQmD/2G5VSBTgIsAERFF1RwvBAk9ikPyH
         bzhg==
X-Forwarded-Encrypted: i=1; AFNElJ8sWgk9ofBmnoL8tWc9N0GPTw3/Cq5sgsQkRDfaqq1L0XKZ/UoGgsmyo+maruDQn/jvUnwP8M5GBP5zftfv@vger.kernel.org
X-Gm-Message-State: AOJu0Yws+Ko9HZqDPJXP08ExCc3dF/BeBfTeeN70E5UaVT7XtdteEYBl
	9sMtzET6JCttjDkNjugxvnrV2O2dFd/4iYGHFxU99/g1b5ldnjrszhyhK4v9VAouvH1u6eJa5Tl
	qhgteqU10PbNvCgCv97F1GCeaANM1eLliSJ4fZlULNihTLL2ZIZCHp1zPxYtwSA2E8UAu
X-Gm-Gg: Acq92OG1dLHjh43Y+62qWBGg6dBxmbXqv0nEIKItSWAhB4wrCvk5O5xbpyJzvs6OQAG
	+3xSSZBbJu/vlkmeRHm+ihwhMwWrZlk+Cgi2WAENtvZXDDyVEIuARoBSP6BMo6rGxld7VKygEue
	4BeTdQrf18G0lq9P+BPi72qNPbtWGYeOaNuo7ybLhpB4Os323R6g162p+JbWiNl7HBvb0uIjyFV
	EDRvNtwdXBhooAMQMFjhacy0dLgJRdJg+1ytKWhou92+VVQOkwkx4jGZUxTHtV6IKxVc2rL9xcO
	EVjB/6XOlT9YUnKtrwuRJpeBOcLr7p2ZIs0rdVm4mfv6LVpdII5wAo0LE1EjHCWEvc5xdkqc4CD
	2AXjAOGbu4Y3aqv3TGJUk2/up3PvDjaP6KyHjalBpFI4re05D
X-Received: by 2002:a17:902:e845:b0:2ba:4f37:d3a7 with SMTP id d9443c01a7336-2beb06a63c6mr257304325ad.27.1779875034440;
        Wed, 27 May 2026 02:43:54 -0700 (PDT)
X-Received: by 2002:a17:902:e845:b0:2ba:4f37:d3a7 with SMTP id d9443c01a7336-2beb06a63c6mr257303985ad.27.1779875033932;
        Wed, 27 May 2026 02:43:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:43:53 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 03/24] arm64: dts: qcom: sdm670: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:08 +0530
Message-ID: <20260527094333.2311731-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX0XUQyoKL6rOi
 irPuZhOnkXfXIgcX4Yr62OInsEsGwv3VXwfR4ep8T/uGMOLalWG577mrql96NL36zKGP+zz+Te+
 rf4UQN2jdAJGK4pFu+83Y2ULFjcwePkNvxDlsbmX6EEsdt70TVSSixxnX04mNpRiolNpMBqqEgu
 s2zq+R+QWHulD53mEYPaq5sWBBDQS9F/3LVAtGFFGkw4wqAVMdtcgU+7xzJGHaSIY0Jxb2suC2+
 4FHTJNJa69+2YX/k74dpDMaHe6OnLzqPt+ckwhL1S3d6JCCDfrOFF+k6swhANH1PZ/73j/drgn+
 CTdO9kKN7ZZ1hntVgxv0b+dQZpsNKpVB28X2yj5iDdpln+GM1nR7+uBFRsNMY/YEQe3jPM3e1dA
 K3NRK9yGX0kw+tfoumZnskskgtNOY0n+Dc827qNoZadgubPJQBOyh1RqZTNQ/R7hSDGghQJcuRw
 KZW8XXe/LJ6ooump+1w==
X-Authority-Analysis: v=2.4 cv=R6Uz39RX c=1 sm=1 tr=0 ts=6a16bcdb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=E_KLwQBYGHgwXO2bnEEA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: d3CazwjGE7xVQZ-8soBS_wYxce0cRZDV
X-Proofpoint-ORIG-GUID: d3CazwjGE7xVQZ-8soBS_wYxce0cRZDV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109957-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,b220000:email,a600000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 087AB5E2067
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on sdm670 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 30844b150c80..5c60ea36f04a 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1646,7 +1646,7 @@ usb_1_dwc3: usb@a600000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sdm670-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 40>, <41 521 7>, <49 529 4>,
 					  <54 534 24>, <79 559 15>, <94 609 15>,
 					  <115 630 7>;
-- 
2.53.0


