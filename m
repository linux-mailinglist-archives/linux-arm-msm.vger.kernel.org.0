Return-Path: <linux-arm-msm+bounces-96968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G1tEERjsWnQugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:42:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED738263BE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 079773042968
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 12:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3575C3C5525;
	Wed, 11 Mar 2026 12:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdL8LUY7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmTXtqMA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D88372B57
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232959; cv=none; b=c8uaRkCP0BQtKY8MArpqMtjtmkzD8Vf81QEBx6CVG0ZOwZ0+lIF+fyX2kbTMWHZ+y18P5dsICXZFBppZ984MxCWfcCkBC9YvD7A8WI7nyUbRS8/xzVGRAp0b13+rilOgxcpOnoktBzgKiK8fhmtEce3u3Gr4V6M+ws3Bqlv6kto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232959; c=relaxed/simple;
	bh=rlq7fvan9HUZ5I9xzDjiddoC20LxtyPIec9v+E41haE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=svsEiWoI7Fkdyf3HqIKd4pk5MdfLb2Bd7XVZoZ1BcFzRRRSalAx1C9NjJ3G5e+kx2m+PZxVk0gT+tcqZZLFmymlyJ2i0Gwu9lOWDGakWNhbhWiFhTrOEjA7DoPVOhUOO+PIpMjY3CzQv9nGGmnU3EVnA0Vw0Dlx8hgzjbFWCk2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdL8LUY7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmTXtqMA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9Lj3N249197
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SP1EculYrMC
	8O9/adkFXZCXCwnTl6oBUq2s9R4Yjvsg=; b=cdL8LUY7LPNTf/hH5W9FuePb4i8
	JqidtlMdkxk/DxZ5U4noQeZ1F6Qiyc6Ene/5fMZ5GdlxhSK4KV+0FjwSBlotXHd3
	KHsZJIhGpeLHg7sscjNxCprHkkWz9braWG20QK42xhPsJDKvnyvYYnpi5IV8XxzQ
	nN6+hu/W7gLko6gkbgMx6kyIYvstaPFQesvr2hL4hinzS5oFIuWcFIcgrZ5sGcuT
	YLBKoYE242KwoNjpLFrm3eYIGvWIJ3pzt6Vo8pK5gwt6EAkPP/8fsaHjPbEbEFUw
	ECyxh1sPKCI0eDOWdY7rNGhnFgU3rlKcWXi0xjO0C30fqTr4GNvAEPe6HEg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv13jfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:42:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd849cd562so1975118585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773232956; x=1773837756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SP1EculYrMC8O9/adkFXZCXCwnTl6oBUq2s9R4Yjvsg=;
        b=NmTXtqMAAd3m72NZWDh1zSuhE1MPDLhGrQT5wuFEAHtVxUoeV6+sM8xr8qSn0B1zvb
         vV9UafdxNnL7qTere/JcPpSGdxLJlro427ZCN4pkEQedLJ/Fx9/0BpdU4jsBfhntZbfj
         WJr8OAjylZ2rjl1QqFD1NvSaJwSHbdcNOeq4/YGwA2Rdcz5+xqSf2TyN/3W+CCK8uyiJ
         YmYA94X9Om7Pw0DM/rUVk27INCs+GNEMo0XHEJ+vON8Pl7efbComsjKb+X0vsySKTSml
         dmlM5dQC6B2H14tna1XQW5nzyr8wFN85SiGiivTREFsDo1RQFRFv+GIOg/R/eQOb8ohz
         wR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773232956; x=1773837756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SP1EculYrMC8O9/adkFXZCXCwnTl6oBUq2s9R4Yjvsg=;
        b=bFMuH6YtyIicKwnZ+CdstVp/Juh+XpJXKAEfS07DvwQU40OXRWTQU0C5QT/CgrF5lI
         6uLsUIjWj8TTq1hUE81UFuPV+BSuxuVxZIA3FWOv7vxJZQHjID+yIzNIBRJjcZCSmH9Z
         qFSu2ZJaa1/gvlWnNAy6App7WEPNmt73z6xQSSK6ObCw+9iugCIJirp3tncF6qa6MtQl
         tTjXisvPxExNfcZIFKfieM8iFTys8wz9SypxEYRI0qJgSNbRnsls93TbDNB2UI4xfa3E
         3VLqX2BL4EMzgzO4+mKXHZf0ecZOjAxkS4fbB9SBES6C1xjbqacnmsA9OB19bDWyRexz
         jHnw==
X-Forwarded-Encrypted: i=1; AJvYcCWqjXS4l8Wdu5buhKflCObTP+gTQeF6TqaOZ5EHanwfbWPsRxmOFBFvXxHIVroWpL1ZQaVJiJkNIQK52xq3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9xdNSaAFrHfp3e/cNQoHv2XIpicmmtjInhonOFjQWQC5RNxsX
	zl2zqascwwHg6MPvcUsFsP6KVZSDZZ85lhDoYElmQPi321/GZoqytnnOVCzK7GM62S0wnf0gimr
	RiYe+8AJcfULlUdtnwg2H4BUyY/Dd4EkLLCr/JXwqcQKai6K/u5GXsf/zB9S17nBPEP3u
X-Gm-Gg: ATEYQzx9DRUygKeHpEigziiOPLVegWoTLC8XGv7mfn9a8Z8H4GiJ+jFWrsUPIm5Cat9
	HP3NBxG1QCEDMd8iTc1WWkHN8vapelyz0a8F8ZQuU9GFJ8+PVFfzyOy+XERf1WSZIJQWIfT3OBZ
	ODNJG/B/LOLEMwGtLR7cc7TJ3omU7YTQsgS85sJJv1VfdspsXkg42bGT8Gl1cLvv6bei2g2WLrz
	TTNxgEfK97NwZD6QKC4F0dPy2ZzBi7l3uCZsfJYO4YkcKgBJFNwanuM1S2clp9wfTGAysrbS2kL
	O3jpqXdzxyyzgDeOjkSt6cNZelnxbP86xDyfG3eD7G9qm20ZEFabGRgEWEqZSMycxcqRowgz4PP
	506QGIIHrFCvd4pyUY9A60MDCXchNXEohuxrKz+iKlxM2LOz6PgZgXo8=
X-Received: by 2002:a05:620a:bc6:b0:8cd:9020:f03d with SMTP id af79cd13be357-8cda1a6cd3fmr294653185a.73.1773232956285;
        Wed, 11 Mar 2026 05:42:36 -0700 (PDT)
X-Received: by 2002:a05:620a:bc6:b0:8cd:9020:f03d with SMTP id af79cd13be357-8cda1a6cd3fmr294649885a.73.1773232955845;
        Wed, 11 Mar 2026 05:42:35 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0caccasm39011365e9.6.2026.03.11.05.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:42:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, linusw@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: Add Glymur pinctrl
Date: Wed, 11 Mar 2026 12:42:28 +0000
Message-ID: <20260311124230.2241781-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEwNyBTYWx0ZWRfX9lhg9OrknB2/
 sfa6N5r5oyYRAKoVH9HWfvdTaiQzQDBsOIFvKfCEjDEI1cJgZKGoNDDfgUv5HXG+KeUKmylYGuk
 CZntiWCuPFbKJN6rU2dUtc1oBg/iiVCHTrt4EBZjhP2luPJwzgZoEckeO6oSnJ3xm3WixtLTEyg
 weogbnA9tW2Sh3qsB/KE0PPvkW0wc7SiByo4DCi/bSd9goyD3u6sgn8fQVrehD/8CFL0nLW0IV4
 OXiCVd9hvgq6pFjHN4gT1bz5ouTsNOgznCZV6DB5sCAYuwIkmiXAsiRADxbpsxijrJLAAanbJc7
 kc2ibRU7d9WgnoVr68/EpSeAW10fgtF3CtOPoZTG1LB25bmWni2SS0mnC8Vh91L/Xalat0XzroH
 qdLvlkCpPxHwGeueVecpvFhjvGZE87QeKMlvUsc96xfxrAYsugEXRS9QDO20oXrv+DVdF+6y18n
 p1XviGjgGtyNClCQjqw==
X-Proofpoint-GUID: 7MQXJrCQ7Pd6neklnbjXK08053eXOmq8
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b1633c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=PvKptOx2Yys6OZxUx_8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 7MQXJrCQ7Pd6neklnbjXK08053eXOmq8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110107
X-Rspamd-Queue-Id: ED738263BE8
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-96968-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document compatible for Qualcomm Glymur SoC LPASS TLMM pin controller,
fully compatible with previous SM8650 generation (same amount of pins
and functions).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
index 74df912e60ad..1bf08860a4ba 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
@@ -19,7 +19,9 @@ properties:
     oneOf:
       - const: qcom,sm8650-lpass-lpi-pinctrl
       - items:
-          - const: qcom,sm8750-lpass-lpi-pinctrl
+          - enum:
+              - qcom,glymur-lpass-lpi-pinctrl
+              - qcom,sm8750-lpass-lpi-pinctrl
           - const: qcom,sm8650-lpass-lpi-pinctrl
 
   reg:
-- 
2.47.3


