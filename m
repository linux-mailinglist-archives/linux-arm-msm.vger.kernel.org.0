Return-Path: <linux-arm-msm+bounces-109966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP7eF1e9FmqHqQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:45:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 104D55E202E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DBB543021279
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2873EDE49;
	Wed, 27 May 2026 09:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JDgQblpG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUkoK6Oi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5E43EEAF4
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875079; cv=none; b=jHfncmOKCPH39fIWpukTWI5XfwJ9L6n7tNdz10oIatAWTybyYwy8h+WXW4+gCR0ahxqUUAUad+2zRJqoa+vnEkE+3CQc0w8vprel0deK9z1/+Kfsuo8+/tmfKiOToFMlqR08FtTF1KeXhvEzsL9KuJpSWJN6A/hisHSATu1bnvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875079; c=relaxed/simple;
	bh=D8dZQ0cRhjIZIwtx/KLbMuwbchPMPJBrdYeWaG5A3i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p6iU3sqfyYquzM+O3J1iFMxtZiTUoQB3NEdZFUlnN1ysnGXzizoJQmNQ+9k1WjlWWstGLW7iAJjuAcuNdEofcDV4CTCqsUbP97xDdHNlLXDKZeiypV12iBGXHIouYYbDc1hGc16glUVtFVWatu3FmLSlAcO0suwPI66Qh06OOJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDgQblpG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUkoK6Oi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mY8f1350612
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X39KgCcEgfC
	h/1MSxV2FqKmE2KONNv3U9+fv7NnqdfU=; b=JDgQblpGdZIg1X/+uqL6sbPyYWk
	tzggqAqAoJvEFQJoWNe6I5zXbra7EomlKSsp6sbtYwNbJWhXi2XihfSpP8aBzXVA
	c8DPSmnwFqGlBjflez0Qk8ZJaGKiWdhd/jv0L1tiMM+zNMd0F+tHrcts8X6Luu4Q
	/a0Kad5Ugb/xZdYeTTjmMb4xF3ebDPscLISLHBXMxr8sdff+J99g8DjQvQXwMzHM
	nSbZmOcnGhagbQlPL/9rJXE4QiooUZMiN1dawm+KnK6eYdmVb+KXqGnZ9LmS4dfS
	pXZdfLvFshwnbtuYFL6FkLjLT5rnIftaIG9qwmrJstVuFcX6FLwcwQLsT8A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edentkdtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba15e384c7so81056415ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875071; x=1780479871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X39KgCcEgfCh/1MSxV2FqKmE2KONNv3U9+fv7NnqdfU=;
        b=hUkoK6Oi7lP4BsNO+yzFE1kaOVR4/7D9wZ95JInIWJG82TcbOpDNxGQ7M0dbX8lpw6
         h2zqu9NKq5hKHPGz19LhwzyDyCTGZi5KNcCMJj2v0sNMa4C9f7qAU3fpPkSdp0afBENY
         YVTDdFg/3sVtxM8ln0DmAIUGrsii80kfIbNri2jqUBhM8FmSB1KFNgEVg0WVJuOcFwLJ
         /FzQNOh9zCn+hQWmwBA15sUvqlRuLzPyyccy4mxKgnymBdpARpm1/pWSXVOX+4i4Hj1/
         BUREKE+aspeL6y27BP69h+hXAYk4MAeqKC2x2MM+mG+i1m+7HV59vE06GNZee7RbYv1y
         xTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875071; x=1780479871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X39KgCcEgfCh/1MSxV2FqKmE2KONNv3U9+fv7NnqdfU=;
        b=ctvPiMnUldj1/QzGlp++fuzZSoG57QApUtSUxgR8dlb4IeCerNpEGTPJ39xt2sUnyM
         +GlhEGMor1FctTKIspu/hoo2072sRVxXOVB7aGO4Hm0jOqCVukZRc4Hb0udsoC3qhsXJ
         HtRexsO6Bo7sIzNZLGVDDa2ZSuZGrVwD5vrHyK2yhY2ebA+F5anEloXqd3qiTOF/U745
         wVviM6dZUdCsyhzGnn1iNxq7xjquBLiNTonim700vnBPEFNOF+bPCioUs1rBuqRYCYrJ
         BdZ/AujcEfNUekw+wcwUgXugDKS6M0iCf1Q4zdaLdpLLuhzo5MFGNxCPfeyiG5eJwVqo
         6JpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CP67qrKYG9CroP5wwlsgA8dOSaXQrL85jnLV0w4LXAIpchn/spsNJtoetGio70p8IVjHsg11+uy3kJLpW@vger.kernel.org
X-Gm-Message-State: AOJu0YxZbyg1f4ABRzKyTVXU4reFsw3VuM8atRfZymyoOogdLhk+mITd
	iBOStZg5+EmU5YDBsNs2MTB4Wue6L/2Sh3oEwF0QqQ66oNncmqB88qWibTfZN11l90abkGBjZR1
	m/ydRv8xfNlioGbTn3IIwEAoy+O4Acn586arVlTJz/W9136sqM+0C6PV3IAjwstUpAZRPrnFQQV
	xW
X-Gm-Gg: Acq92OHdQKVJxoZpJ5MpoJL34KP0m/zUteSWQEUWhxmF2X/oZ0BY8EnHJ1zyMPGVuta
	EkETizSOKPOckTl/2EwrVjpqFWRxm1X6bU7jylFlgIC5PPwnd4cfUYM10u35zbo95bqxPbNNoKx
	YqOjeQ4ucOWNmAq86b/wayTZwAXm4qKXrzI/fpQ6FDy8xc4NMpUiETW926APJqy7Wqha8HFjeVn
	xq7CRswLhJmVPfn9Yd85zMNN9OZNohfOcyoNL2bkFp9Iv6aR77kGBU2RPb2FzvEAaps/RXjm/gt
	+DsD9qhJ27E6tsu1/CVS5sCkZS18HffnAXtntmA4zoHHOvwQTM7fMf9IrtQUYMQMM4NPUtgt0nT
	1UKHMMEec117RPCyZsqbBENCKFBVNr819oIGEyFVjk+pF5kxI
X-Received: by 2002:a17:903:2f4c:b0:2ba:9e1c:7cbb with SMTP id d9443c01a7336-2beb063361dmr245176555ad.34.1779875070726;
        Wed, 27 May 2026 02:44:30 -0700 (PDT)
X-Received: by 2002:a17:903:2f4c:b0:2ba:9e1c:7cbb with SMTP id d9443c01a7336-2beb063361dmr245176155ad.34.1779875070192;
        Wed, 27 May 2026 02:44:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 12/24] arm64: dts: qcom: sm8550: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:17 +0530
Message-ID: <20260527094333.2311731-13-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ja+Ma0KV c=1 sm=1 tr=0 ts=6a16bcff cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=pCbxfLNB7wN4dPi-li8A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: zifllU1Q3TuKkk9qWLcYIHDtoNwO9ZSr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX+JfZEjbCVSWo
 sya1WlS6NPsxfe5FtFoWqSB3AehllA29wk+vHRAQTSQXD6wXxMHyL2ODHI2Zh9BSkTDv+AsbfQD
 l66NR4Mr5wGdw/mp56q/jEMNeTxu0XpE3pKLUnK7xg+UYEcYbXG6Wq74RmhKpyIi19iXSy7b0IT
 O2CLbyxvyZofpqwOPGguxMVnp+726il2X7ISNeEt3/Ft5Q+TIJEVX0xyTQhB6DPi0/yYSAwi+KD
 OB7MBTM9c6A9fdkllmtZzvna5Qo6JeY2/F8i8WB+sdTjokKFjqfUMzspVRWsdG3CyfK2JMuXYT+
 OtmUAy0nNpDHaydJLGwONNWUfz/WTTAw7Z19Uc3k/pgzW8JtuLjXYUyJPOSCAPJBTJOVldsuJpL
 efJOfxysqVyGP2SDeWJBme3fmuScNdxDLS/FnA1ILl9iHOxjXzUw+feEy411NzSIhvLgX0/pgoF
 Lgsoysd2oHgp3hNpUsg==
X-Proofpoint-GUID: zifllU1Q3TuKkk9qWLcYIHDtoNwO9ZSr
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109966-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,b220000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 104D55E202E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on sm8550 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index b7a7c49db077..7805a6a08a2f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -4602,7 +4602,7 @@ usb_1_dwc3_ss: endpoint {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8550-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>, <126 716 12>,
 					  <138 251 5>;
-- 
2.53.0


