Return-Path: <linux-arm-msm+bounces-89980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHwUEKutcGkgZAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:42:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D27BF55650
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8A6F1645946
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154DF48AE06;
	Wed, 21 Jan 2026 10:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="axcVtbyH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FjwVR26X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B774F47ECFB
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990553; cv=none; b=u+ljzOjH/AIcpseww4GN7wQoFXdfCyFOCuyOVcUT1kIWUP8NRCrXA1Ib1tZjnxM0DYcJSYKBk3VfrZUAKyu0G+xkrtDwuTzestOsmPm6BfW8194hU1dyPdIgAeJ940EuEdxQ5EoYa1D+v4ePGXcePunzbwg+9/40wVlRjhQGz3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990553; c=relaxed/simple;
	bh=E9AitB4B6NLtjLJCY9zdPbtLBa3uHKEsQ+4XyMEuYiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m3TWLwgvICa3m8/WCpAyidcYoElihzugdff/87g2Z/IPUr98+0n4QmaJkSrBglmq5utX+IZXST3yK8e8qac9ID2N9IuKZ6uFFaDQXUfNENsz7hz9YjYGyRjd1ltIggs7SxXIo7+lzyizFSAmE+wlP1HZJUBBFgLmbonqJdTroyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=axcVtbyH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FjwVR26X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9h1dS3991357
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5E7FyFLcQYsfiEjFOC7/l23jwbbj7QRHouN7DDrmcBE=; b=axcVtbyHHVD+Dxs7
	tjslYkNyKv5bwpBIOzS+mPWtB13WRf5eog3e7x3i4QlEQ6UhG8H1qfyWaxm+pdQL
	o3LQXQzj0l3VAQoyknFqSDf15MWVuRgfJd7L0PytVWCTEkeGRdK8Zzq5DITZCKyY
	gaxiHlJydHQnKuQ57cJ72WjsWc53Gi3+6s9g2VwvpiW3FhW3I4BRa/DzJ6HSfCV/
	YDi1WnzWpqGAIdpkV5c5bhSYs++PA2Pge2BIfWNK6iNoM4Jqu3eIY7GmVNU7efdP
	kaI/IbEvGS7/P1+R9ptO/zbX3tRm55bd7RO2bBcMnv1/zkgHUKoVxuj28Gk25vPl
	IOVwZw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btpm41qjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:15:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52f89b415so376210585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 02:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768990549; x=1769595349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5E7FyFLcQYsfiEjFOC7/l23jwbbj7QRHouN7DDrmcBE=;
        b=FjwVR26X4JqOQrch/gkLt0BS877SHuEZbaJpe3U/wSjqVcBtZgjm8auGCNhTIrqRNV
         M2G0FLDI9MeCil8FhjjuOJffQX7NWu2aqMoU+oyF2KySOFJ60DkDTYTLsnJ/tIGgEWE8
         kFX2OEhJu6qFXt44j5HYvxQJd08vzJ+9sKPSi7ST20iTKxurrWTybGfZ5uF47fomp2gJ
         c/OW+PJYlg4pqTrS5z73pYav/w6w2W4MmVp9ILNF0dIBkNao9rL1prLJvoc8Ycbd0WMv
         2jcwwrRxUhIgQGJ1gUacpoY9y4E+506nq5pAZO4g8w7SdszoB6ALl7pNxW8pMl2/YZzN
         G5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768990549; x=1769595349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5E7FyFLcQYsfiEjFOC7/l23jwbbj7QRHouN7DDrmcBE=;
        b=EgiqYoZ6wf1dsy5WHuzCNMZEdfpFRu7mxmJZ0dkbrVEM8oQBlFtcahCChLtiTo90ut
         jsbrDR0WfmMFUJ0jTsrgBTSbgtb9w3QgbYP9t7/n34GigXQvMCacnnVhftdljX2P7KY4
         nsPcHDeMxu+Eq/oByf/TA+piWOsXFEi/oNvUwyHRYiVYko3QlIOpX5VAzSba7EQqzNIb
         6i8iILwkRFhiStv2l8FSLcRKnfdhvFk0AVT7qHYXTMwrnli5QU+kXAa0+oL0ZGULU51t
         Bf2b3TMZ78R04opidxYFY7p6hs1rb3fufTgWMIXaH7Zm05oiDklGj+DOGkEtZirVulHK
         4GBg==
X-Forwarded-Encrypted: i=1; AJvYcCWF+70NYa8Grp1m2IeyRIwDIug2WMyvpFwIocV7H6j3EwFJ1a9KJb83CbWRfDf1JXluwPDtGfbHrpB64ffd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+7HPkacT0x49Y5G6Db417F3MXFVGidDAvgtGv+LuEWUr15OQy
	9d29o/1bCXQIEpY5l/e8qh8DbyJNQAkis6bv6pQZCOXu1jepHNm0dJWI50sZc0lQWyDg7+wwolV
	+fssU4AqG9Iqt835JS4OPr23R6KvsIE8REL/1WLdHonucLUcYdCU6QX7pQpGaJnGgLXsf
X-Gm-Gg: AZuq6aKyz9Mb96TLZOSAgXTNNv3KJINGJggBzxCZf39vKUsIrX54lfHzs9g5zs6txmh
	sFJ39xdIfUF8j8FrUqzb8Q+CeCZn4WKdmjhl24Ph/191hw2uopbp78YPr1m4p7HszqtTTRMcRKU
	VXv+ve8fFlQaVKOrPPX6dPjuXMgquFi0srfKh59nKzvbNhDWXUYdJCmBqK495IXgaozzqo6LA2d
	6L1lw0vp4OgUiO20R0QcYrvMnFC4cX0pcy5f0KqgRjLQtN0lH4YhU43SVL9QzJf+oCn8m+WbfsH
	PqvJP4NCtu54cAE+4apJKzmx+qDCYR1j/l7UWe5mthnaHAhUWWiXNu0AXfIFiY5YeFLvHByORD3
	eVCTXoJCkjTboM4T5g/z8JZQSZ3WpUapxWA3HSmSeI8hAnpE6eE5EDvkjyFj7YwiovxrGJfG0ec
	NF3G/LXKqHC1ZP7b3Ymuqd6Vo=
X-Received: by 2002:a05:620a:4096:b0:8b2:e922:5297 with SMTP id af79cd13be357-8c6ccdb0f00mr580150585a.21.1768990548723;
        Wed, 21 Jan 2026 02:15:48 -0800 (PST)
X-Received: by 2002:a05:620a:4096:b0:8b2:e922:5297 with SMTP id af79cd13be357-8c6ccdb0f00mr580146685a.21.1768990548263;
        Wed, 21 Jan 2026 02:15:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397785sm4720733e87.51.2026.01.21.02.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 02:15:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 12:15:45 +0200
Subject: [PATCH v2 1/3] dt-bindings: drm/bridge: anx7625: describe Type-C
 connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-anx7625-typec-v2-1-d14f31256a17@oss.qualcomm.com>
References: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
In-Reply-To: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3884;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=E9AitB4B6NLtjLJCY9zdPbtLBa3uHKEsQ+4XyMEuYiI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpcKdR/ejMpTmJ1Ii9B7nFb+DoUyVnNhJtvIBxy
 e+anW50k9aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXCnUQAKCRCLPIo+Aiko
 1Sx+CACIfmjAyrt203QSMmiD8hfIkTu95GnmjD5nbF6QyuUVCgwl9fSLoJbbc3/+FdXqIDQVldO
 FaW9eZ2VYep17mC4c4sERdeIlo9G9rwCkL65IzOyag5u6s1OsTjUeO9cl4clbu5gtKqzGT8QKF1
 JH3SS6UW9TTeuBqFs2m+EdzkiMc/z5nedCQGxbQs3P8vZAV7Tze6K7i6g0xu3LQYN4+vE01n2fE
 bEHgl5j+srtrlLTP70MLajLFmcKUlk6SD1zigfexjghwIh+i9BSOlo06d5yLMKGTqCK8t6SbNT9
 Paxv6s3VUbpsLnZ4h4NcEuxzvqXJSB9NULnhregFYUhDwwI1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Jv38bc4C c=1 sm=1 tr=0 ts=6970a755 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eOiPeOEgsxahVY17qz8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Be-zTDLA7b6p7k5luyvcbJ7KeQSiMPvD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4NiBTYWx0ZWRfX2tCFWN40ribg
 /dk4UhKfz3MlsSeykl2U997en2itYnAl8gpr0end8NWg0UNv7bSlFrg4OWo8qhxXCrQ17EXnzch
 DXMrFqIXEwaj74LrP4PDWklonOZkYSeu2ybfm0K44M4SbK/uZPrx8CjudJHJcPm+TT9TUbQnsY3
 S/60YkEt2KC/sp1XhtieGouNV5LN+lnO3+OEkXOlLAlnLn8+sP9YrRh+CXAtZUP2XZPUAx92XPI
 6u4xlGoGxeZ0WpX0L9C+0aV/+d7N1SFdrSrDV36lFuaGxxOTYYo5TZMH0YMAdq9+O8p6sRIQzo3
 uYWlO0eT+DyWfKtitsVN4UvzkT5xRX63YXbU8gpG0klvouk41vNo45g79e7OxVE7+7c1k3yf0Qy
 krQwphj6/j2xwJHR9bzwL1Uka+fVnF0Vw09A763mSxu1vxH3JfiFaYYbjun1yyCTxj1eQXI5pFR
 R84Ju2ExIJheC8zDXBw==
X-Proofpoint-ORIG-GUID: Be-zTDLA7b6p7k5luyvcbJ7KeQSiMPvD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210086
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89980-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,0.0.0.58:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email,0.0.0.1:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,analogixsemi.com,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D27BF55650
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ANX7625 can be used to mux converted video stream with the USB signals
on a Type-C connector. Describe the optional connector subnode, make it
exclusive with the AUX bus and port@1 as it is impossible to have both
eDP panel and USB-C connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/bridge/analogix,anx7625.yaml  | 98 +++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index a1ed1004651b..6ad466952c02 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -85,6 +85,11 @@ properties:
   aux-bus:
     $ref: /schemas/display/dp-aux-bus.yaml#
 
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -117,7 +122,6 @@ properties:
 
     required:
       - port@0
-      - port@1
 
 required:
   - compatible
@@ -127,6 +131,28 @@ required:
   - vdd33-supply
   - ports
 
+allOf:
+  - if:
+      required:
+        - aux-bus
+        - connector
+    then:
+      false
+
+  - if:
+      required:
+        - connector
+    then:
+      properties:
+        ports:
+          properties:
+            port@1: false
+    else:
+      properties:
+        ports:
+          required:
+            - port@1
+
 additionalProperties: false
 
 examples:
@@ -185,3 +211,73 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        encoder@58 {
+            compatible = "analogix,anx7625";
+            reg = <0x58>;
+            enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
+            vdd10-supply = <&pp1000_mipibrdg>;
+            vdd18-supply = <&pp1800_mipibrdg>;
+            vdd33-supply = <&pp3300_mipibrdg>;
+            analogix,audio-enable;
+            analogix,lane0-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
+            analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
+
+            connector {
+                compatible = "usb-c-connector";
+                power-role = "dual";
+                data-role = "dual";
+                vbus-supply = <&vbus_reg>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_hs>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_ss>;
+                        };
+                    };
+
+                    port@2 {
+                        reg = <2>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_sbu>;
+                        };
+                    };
+                };
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                        remote-endpoint = <&mipi_dsi>;
+                        bus-type = <7>;
+                        data-lanes = <0 1 2 3>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.47.3


