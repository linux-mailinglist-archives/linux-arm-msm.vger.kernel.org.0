Return-Path: <linux-arm-msm+bounces-109959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HFBM3G9FmqHqQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:46:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F7E5E2059
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9839F30273BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1143EDE77;
	Wed, 27 May 2026 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBs3LIry";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TovlTeBV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC083EDE71
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875046; cv=none; b=rc/RyrWp4DDJ6SZxm4MPtVhWJJ8/fW22BbW4rdv13Zlp0dUP37EJKGqtR/s4YQ5iqOPqQY8ZhPr7rmVa/3CvqeUcwcAEyNkXwaZZG2+a3S7kF1smrVTz+eNtbVs3Z8JOCd/jM3ecHdrifGAF6z1rQEXCOnwEhl6DwDuHNW0tgsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875046; c=relaxed/simple;
	bh=zyeeAFiWIV2SZDiQ3lya06lZ0bqH6GijFM2Pcmkq+U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LtNnHEJHjjxi0f7XE8T15x5uDLt4zMhBnkpq3HS4XSrgotNxmsRJcPmZkCyzUuqNggqx49pC85Tdo2cBch60RD5K8wrSRX64PYfQ4ZZIk5BJmX80HLOdjhXqkKutc4dL3SGvYPWlqtbIIbTuqJ4sqXov6cxNV+j2KU74Cieqd3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EBs3LIry; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TovlTeBV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mbgh1350798
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wocvYkuW1cd
	Z/F2KINwZL1vxXBWVvJPONMe3OqcQfdU=; b=EBs3LIrywc52GaGNiemv+yetfc3
	TFkpSFS+WT4ZMP8x9p2pp/ip9shWVQANONFv93zEttiv84fqSM83ahMUEmCF/mYl
	BEhLZ4i56Bs+6IyBhbwBviwW4BKPmSgIA21pPoOXxJqEos/+cctvhgeE35tKFt+u
	3FSpAv8gzmNESHOkFCmTuQxXDLVeJyrN6Nc2wv4aZMyfYjzS0Gc5XUXSV5u5O5hv
	dMht5LGDt+AAHu8PZ3Ib7cclFK4y1/nt4rokxlB1P7an+msub49mw/QVNIkpOGYM
	Byim11TL8PpqSQBZC/N9HeN8sWa2Z7Psmcv2PF3dFUm59uRUcDp47qTxlbQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edentkdr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4654f9bb6so127686505ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875043; x=1780479843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wocvYkuW1cdZ/F2KINwZL1vxXBWVvJPONMe3OqcQfdU=;
        b=TovlTeBV5GNnF3/ZT76O6JKPgolDQY2jF/X/ngztbwHuFXCBpZVJKzzpkjdO+ANdlh
         +OhPpH3PBBP7HLYqxjgC8rfY9P3ntdVmyj66yRK25HU+17qvMB5wMwAJTb/j70fBADyL
         Cr2mo4KH/MY7dyAsLr3U1QJZhBaRBowcxMq/+pyOTA0i38CcvhEoaN2/EesfVixekJ3H
         ng7jGEuKdoSYfiB+hQApWV4+p5NGwydS+fx0XSmbK0UDqQcaBi3fo8vC0Ja7heF0hr0H
         0RQmnmdseg+zD4jOKFhrEeSKd5OZjoYpRrp5ABzSp6zIPvljdI4ubt5u0qNodQPUYUnR
         6bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875043; x=1780479843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wocvYkuW1cdZ/F2KINwZL1vxXBWVvJPONMe3OqcQfdU=;
        b=MEbBqUrw/9wqHHvPXoPZGzKu6JfdjdpJtbW/ne/Kc1CiNKnP1Wxn/Z/Dx0XH43vVC1
         IQIpgMs1czpd+8J7iXhU/kay/4dq7K+s6tBv4LHL2mb3CikeYv5XoagH/yUWU48HLU5U
         4SQ08PJJp9kTYp68+0qPJTLLJefOb0VUQcxQfB2B/V6KGAWrZ8pmaEk4VxVncgfvYaeL
         0NBcLSyNqNL4h4sbOxK560TJ9hDxyV3YI76ruTgopMzKJN14wXl5HjJicZ2INC++wRbY
         9nD+9xSME+l5bKKy3NOwmYs6MhlwwL9fkmLEnb5YuQyWwZS41o5xwKQMUqWOga8jNEzg
         nfcg==
X-Forwarded-Encrypted: i=1; AFNElJ8CCBFOjK3w3WmjBGGEIS8AdZEmXK6SUen54GGdI+ihxJg8DVxBXdxj9OSIVbvvGWKrShfTSYLW0g3rv+Ds@vger.kernel.org
X-Gm-Message-State: AOJu0YzjN2Bl6J8YWJV5UR+v3gvqzM9LZSv898FIPWW6q6DmEV4SaNoG
	ffRsUFjyeR+47Y0EUL9IIi/1T8iBHJOulPXK5ihjLFj4aPR3EKb9fBFzJkH4+kfSYw1gc1BUx8Q
	YIQua4JVv0ajSHKcbdVE+qhTJbjOqiJmkNcfb767QBs3GNs3KQCyteiihMQdrSaa/dkQP
X-Gm-Gg: Acq92OH8MBgRkKuKsanMKl8INQfMQJzlKz0A+wrRm3b48pRGunzGh+yaNg22f2TSO/3
	B+3LobIw4fkpbhupgDM+NatnbDxpPmWv6nEPVr0pFVaiYW+YPv5XA7KxOCiBkBhqyVqtsoy1XVE
	8bkVJWgZQvJ1HHEFnRlm4oOBOCOLJTwc9dlXQx/TYGR3ajriqzSwj+/bg/wyxBdghL6mDa5AgP+
	nUcnqxcfK83WGHNGREVbd6ckSL9KTKqYF0uSlkhVUJIaKbbRGsI4KlBxxGAizDEIoPW0X44b/3M
	faiAbZ6n88+o3Lx995wYWeB+LnLpkuMT9cIZrFBSfi6IeCtQSV9LV7VinTvWymZsBR79g3BPfxv
	ZjW54V+5i8COrgZLGmpf3RovMZ0orfcECud2ZXx1tLlyuYYE5qe5HFGSolJc=
X-Received: by 2002:a17:903:1247:b0:2bc:8f9a:3642 with SMTP id d9443c01a7336-2beb0758d9emr241760805ad.16.1779875042546;
        Wed, 27 May 2026 02:44:02 -0700 (PDT)
X-Received: by 2002:a17:903:1247:b0:2bc:8f9a:3642 with SMTP id d9443c01a7336-2beb0758d9emr241760415ad.16.1779875041932;
        Wed, 27 May 2026 02:44:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:01 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 05/24] arm64: dts: qcom: sc7280: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:10 +0530
Message-ID: <20260527094333.2311731-6-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ja+Ma0KV c=1 sm=1 tr=0 ts=6a16bce3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=R877Y6Oy63PNjXPxTTEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: kFFTd8ZvdJbVkexGUEX4Pt0aCTQnNRSd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfXwNh31r6ZhCtf
 +8Q23wRdD9e04+JwL8E1zBruhi27vi8ddo39cMQb9sBTSwlaMaM+BKh44M0gioZ3iS79P7faZ7m
 8o0GgJtDwu1rsVP6YhhjN45Y54Md1lVDx85vHc4KGz4aNkXPNHR8qxZ/DZoMXw1RV4IyvQElHPX
 W0UTXiswV4Z1EMTGMfbcMiH+yEn9vIzMD9/7FdDMMiu126zDZWe2SfL6Yvs/JInJaaAd6+3KIr3
 WcWl2vgiVq6vndTYc6YEN5kGe2tnHzfewwhoV5huzWHik1Vw+sR9lTcpeQNl4vCfl2c/6F54yIY
 F9zA9EoQnmDwb4yJt7x90XIc5W4XXy8C+PTyEIanYueGj23jnWC/ZgYcpGki8a9YnVbmHYAPKh2
 nF5adnqGF6xjSFTZvrR+xQmaSJWRn5qeuiRCIiOwV+H964UncAAlHkEFx5zzgrkeepC3GYcnWjT
 EQ9EwSyrdTML23WJfAA==
X-Proofpoint-GUID: kFFTd8ZvdJbVkexGUEX4Pt0aCTQnNRSd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109959-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,b220000:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C6F7E5E2059
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on sc7280 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index c51beada8c7d..33050643e4e6 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5739,7 +5739,7 @@ opp-810000000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7280-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 40>, <40 140 14>, <54 263 1>,
 					  <55 306 4>, <59 312 3>, <62 374 2>,
 					  <64 434 2>, <66 438 3>, <69 86 1>,
-- 
2.53.0


