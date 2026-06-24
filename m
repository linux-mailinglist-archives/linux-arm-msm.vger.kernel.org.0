Return-Path: <linux-arm-msm+bounces-114392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wEApBBMsPGqekwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:12:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5908C6C0EA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:12:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V2RFJptY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f02I5PFV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114392-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114392-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 826D330FBEF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF913446BC;
	Wed, 24 Jun 2026 19:09:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C21333F590
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328147; cv=none; b=Ka7n1y2BFKQtqa2Do/yqVB4YqHqj0LekhgluSzZb23ux+Fubw9vLQg2RV2u5G4xxq2ulpiv5Ji9jmD31OSJwDd7nx9W27jDwSrBRRIFXyi6IDmBgo8cuYUPitICeXHh/PT1M4x6n/+7gX5aDHfnmIn8Tse+rg5+iZwLwdBz2W2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328147; c=relaxed/simple;
	bh=+r3KysheekadIOuDCr6W7bpqF34OIalE2onNcaSIjX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrl5oNg+GrAhdzWmeFoHqoEH4WPkxXm4K+zVOmK1JmX+LDARsGLDqN8pARmmFL8FlySoWeVKZgRmJPeCHqf5ZFtcC0tIGFf05W1irIJImi7Gq0wiH5T7fYRuggZqfgPWVm2Ne6gtOAkJ/WM8gSJbYBCG44r1790+WjEsKwI1AOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2RFJptY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f02I5PFV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj2tU2137469
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0z5HCobbwhs
	exx/3HNV8KkALT1HgOJGEJMf4RmetQVs=; b=V2RFJptYHNnusJcunO3meqoJpNM
	cB/0iJB66yw8mkZex72Sqk61zTzC7TzSIeJ1gSLuCQOHcmkEdvFTGhwiVVGRRDcM
	idcH37Am3rZLuzb/TVDapSyzJXHzatSKsvp37vFhr9IeJX3TJoHF96QGM3J6U57m
	diKv1+1rDqEPRwdji3l8KWeACq4vMNstIWYmfiDUEQdWk9HIz1z6Et7cMQnaw6Fv
	dDpKCDuklHF/lFMWOrN2Lx502V5PpQ8ItgiABIqyof9YMedcN6OmQRdyTB2p8oeS
	ZKSW8RoWcXSjMhQoWygpSJN+3Svlu0SyjmVa5YA4/D5VZrRvm3HmOkOLW7g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f06r33n0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so1131576a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328145; x=1782932945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0z5HCobbwhsexx/3HNV8KkALT1HgOJGEJMf4RmetQVs=;
        b=f02I5PFVGIHOz3eJIXgBt4peaFBvlamZHQHXncxwqHD8Rkr0Ihc7gpM2PdZsXgcxMh
         MXBUF3Due+ATQB48i7M2qmBVUb0ewSHvfznGiroEtU5APaTHeK42mB7JsNQw07qImLNA
         2oC/mT2swZDtlojVmJiyUdS4wQOHT3zXnDWHrv01FK/VXsaGtGjwwbJhecBA1u+T7vYf
         pPX62WMHIq/ETHDONrNbTVA4RWKauAIycTRUKImiVYlkYlupYpUhZenyEKHaU5ZtEdTv
         hvGDzbt63338h7nKLKVhaBF1mw12durM7ovtxvNV+DWsyTuHSMHvtfyxrFoR2I6YTnRD
         lmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328145; x=1782932945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0z5HCobbwhsexx/3HNV8KkALT1HgOJGEJMf4RmetQVs=;
        b=oN0cI1k6Z9VYQL2U0CUNHlx5wuZgVKuF1Vpr4l0IEKKRs+x5aH5X/X1HqzitDCnNpW
         RbPM3j5aIksaEpCVhw6JATp1UQ5n52KHVle7hHXgJdlcqkY7FvHYqmzp/T3TkuagS2LZ
         ThzF+Vw+cDCMwXAjNHC3EMr3JZXtlaHA9KoA3x0M0AcqYZ/31ak3rUxGzVVyjueIVxA4
         f2EAJV4ZCNmgH1tXB67Fodli+iUtfk4rjPLVnQnf921BpHX/wmMH7aXVmmpN2Zok36ES
         /Uu2ICbaTtUe+HQrK0tjL2gA4o3wRvhtatmYuRq+xJQMkIB7YA0ndYBHx8fyOVq9TELx
         M5dw==
X-Forwarded-Encrypted: i=1; AHgh+RquUKgB6FMvZTZoWoDN4icZPqb0SPZWV2Lvhh19ZlxQXYc2zsymcNyvpkhVwmwKo1vaWrOC7/mVexdNLps6@vger.kernel.org
X-Gm-Message-State: AOJu0YyC2ZQzy77aLpTh12gwhxIUGNi5tZ7/6XIAguEBj5+UEVZa8WZK
	hjFqE6wjT9x7aQ9iG8m8wRsyLGYF1lrzRkeiLP/7CgweX9oB/CxHKSarUoAwxlSLRnSf+p2LmkR
	IL/PA89NlmIs9pgc9t4FWUcSJnveIjCmcSXJNOcZ3jpCYl1feaOebOuE5akQ3bz/M9OdZ
X-Gm-Gg: AfdE7cl7lCK3sQITwGUaXL/VSzoHjD/fqOqlZRZZ7t75kNZspiu4TD4xDYoK1S9ZpY8
	xVNaQEPEQ8K295LB56qJuYvF4/AWwRCG+uKUN2siNcRwmqIcv8DLw7pShH+SikT7WWLmfPyovtc
	m0V5scF6lQmFTSm3mMLNbgfB5NIpnCBZhSvQpN5bfgIDsPorQ45xd7gT0dDCC+yGnHAcWWeKrIC
	05j4efBzr54zmw5QQMijFftRsxx4g8UDoDjRdJqoHZZvogfjKdqcBBko0Qm4KE5em/K7zApgiMd
	rG7u96IuhYlSMxOrymZXAI9Cubu8nkYT5wrsOe4vYN/9GoIUl9Y1WNpoX6XQVPJtx/Vhhd+lTbG
	TKwBdhZhIPyZ72a5wABnS3sD4ol/1BDMbCUKFJw==
X-Received: by 2002:a05:6a00:bc10:b0:841:dcb5:e6f9 with SMTP id d2e1a72fcca58-845a2abdademr6793014b3a.11.1782328144527;
        Wed, 24 Jun 2026 12:09:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:bc10:b0:841:dcb5:e6f9 with SMTP id d2e1a72fcca58-845a2abdademr6792965b3a.11.1782328143992;
        Wed, 24 Jun 2026 12:09:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:03 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 06/19] arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:17 +0530
Message-ID: <20260624190830.3131112-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX/Hx/zB+MZDWQ
 C+hAGLt1r9/MWlqTvIc1Qs9s3OqNeg+7UJHtayHSAztmFLqKuwThIltndR98kABFQLfYsz+GQV3
 Zhp1ailSR9fgBtNS4yCuJf6YDOiWxJPG7r4bn3NxPIaEImgSG3OareA+MgN0Y5YcUrbTt8JyfkD
 TM2pV7e/nTM9yS4eDr3kGVT27pIoH0CbUDEpGll03PvHC4AisOkS7EwnooqS6n5VUNhD+IHQzx5
 LafcNFHszri/WN9HwDS+sR5PIcigo6Klp6cWSvT7UzOpgOr47x0dD1DDywcOz1q/GFup+dMGwdg
 8Vq9WlSJiGfp8q/w7F1yNqSngauMY7kQcj36UcRZG221s7rSbz+4qBNnGWOi5/434ZL6rYA4LOG
 9zonoQSiFBazOoWR8pVo4rD6O5b/RLuSC4X8crCRrTq6wojvxn6NpN/JPpOccRA53VU19V/iwV8
 5Uoa20qLIKM4Qo0LF0Q==
X-Proofpoint-ORIG-GUID: xLU6DqYlYVd-Tl661Sv-Ko_orjVy5g0J
X-Authority-Analysis: v=2.4 cv=ZM7nX37b c=1 sm=1 tr=0 ts=6a3c2b51 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ZJQsJAtiAu0WCEyc7p8A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: xLU6DqYlYVd-Tl661Sv-Ko_orjVy5g0J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXwOk6zLGsGU/g
 D5CYaheVJ1iSn+PiIAmIz7Xi/F30jASF5WFHdUB50KWAwukwuzlhT2s5F92rsysmPHiaaQFMgy2
 Djn9qHX59muw2Gn1m9WhV7IbZyxotrk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114392-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5908C6C0EA3

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..0342fd28f9b9 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -224,6 +224,7 @@ scm: scm {
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			sram = <&minidump_config>;
 		};
 
 		scmi: scmi {
@@ -5452,6 +5453,10 @@ sram@14680000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-sram@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0


