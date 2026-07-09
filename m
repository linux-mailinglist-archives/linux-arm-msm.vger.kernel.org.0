Return-Path: <linux-arm-msm+bounces-117918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GUlQK8hiT2q7fgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:58:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D3A72E947
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:58:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ekL/tUvM";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VKxtnu4l;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117918-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117918-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D7F9730E4FA6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6C840245A;
	Thu,  9 Jul 2026 08:52:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98DA402427
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:52:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587149; cv=none; b=QXIMwMMaXrCkgUIJeuFDS18jCGipsvOmCQGrVPPC31px41e9sSaWxRTFUZRyMmyyoXVGXHcpbLCVxcDAQrYqvDO6vh4GmrPizQobcNyL+sdeZ/gjWp7EmZsnGHPihvJNLXKExApO2nlyahXawwtfiyYZyXvijMZ90iYAkAdx/4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587149; c=relaxed/simple;
	bh=Ggf6gG2tQt871VFfdM6zsLoc9sXjGV1cYiDiBXb14ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dbm2/LUT85LbA2cpp6IpoWMZJ+uZqL/Qon7v2NhzZrljYOcqs/3Uy4qIqVKSk7E5kj1jXow8G7rvJCLFo7OfmbeZT2kBUPnfOpwnUduI8swXAJObC5YfCa3tIy40qHOcni389rv6Wk1BEG0jdc849j4//ABUAbf1kcNAY7m/K6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekL/tUvM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKxtnu4l; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960Fj4749628
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/eg0ufxySEh
	mH1BBdl6dlSLKBXD3YOmq78145ChoiRU=; b=ekL/tUvMegmhQqrgFxW5a6+pTab
	bcd2wHlHWlsI7AktLWoRsXPxoNg/YtaRq2n9zpifXQQ8oeDFLcOF2UULQLA4FrVs
	gCQeULVzEjil14PNQ0CAgwe6nL3olNykpTxyrRmbBo6DbJJx2UjyesuZszelApD3
	oQnaJPqLSWmzKbEPZ/OMdfHaW/u4xyLQjx+bpMDURCDG9juPZiRdhOLv8UJ/AiNZ
	DONQ8/DDj919IrnnGSk3d7zvRZPqq0KC9s7K+0lC9iPbdTvhMb8mtAoqZtqub9Nf
	jTckUKzvsw6h+9Nx0Spu5QupYAjMRUwgtOyqRRVNw9OJEdA0gSSKH2ActoQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwft87y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:52:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8952346bb9so1426642a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587146; x=1784191946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eg0ufxySEhmH1BBdl6dlSLKBXD3YOmq78145ChoiRU=;
        b=VKxtnu4lNGulkeFiCWy0s+5pqXIgydwt88rV3VUTQfAjRF9opa4P+ngfPMHvttlpNE
         levY+8VoOnyTQLK9wo4EZoZGsXTOl8RhFs3nLC8/Sfl9PJ1tDkLGaPWikKqgbCvf1PiM
         co6OpNh6iMvNAvCs08ZonGTMorNpkoMVbvSV0IBRzl9zSzg9uwWuyfLb9K+xZzOK8291
         W/KIebhNCSmBZ6mN0kxJ6rBbuzSWspwnfRb10MVZV8JRzC5u2rqHjQZRWxEI4FbOxEkh
         IaDuEGTsvI2c+36pG0p/YJnR7K97WKRf+X1t+0D2DZ+wZhKJj345VMOj3pc4h3hFzP4h
         bOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587146; x=1784191946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/eg0ufxySEhmH1BBdl6dlSLKBXD3YOmq78145ChoiRU=;
        b=dVoF+m+ojI0RqVtrUjeIwx5dssFgoaWwseGd43sTEAbM7K6eES0FyZG1OqUivvBuSw
         thI0bD199bbOT0ibLLcXQ3/jxNckFg+OU9frNS41rKg2A+lQvOirymZ0y79/MjbHjWKP
         7pvXOduhvcQAvIIcy+ApAtenRolHq0Tig7xtxofy8dwJOjOvIbi5EXMOEaFD7G2sD6xU
         PEPXnQ41uw5oTNp+M11LS2L9EnUqS4tcNvsEg9qx3QPB6tHlhi07p07+1wxYz/oPXv40
         91jsqKvWS2oC3jvrHcFzASfk5SbfpnE6pV6a47Lla6VHBXVMTYvPl9egbe9vrOQXpFun
         NTGw==
X-Forwarded-Encrypted: i=1; AHgh+RrACvaEKnlM2R3yJrWxXxyrcZpqMPvPNYyOC0CWk7t64V6wA6XdPqRnQpOrb9iyU7/VAvmmwAtJna2zi/fM@vger.kernel.org
X-Gm-Message-State: AOJu0YyIXr6DUZM/nXKbdbPWLaU3lTQ5TG4RjIEg6yiHLslJMzHLDxVv
	lxzkiSPSF/apKEPjNaw3V1MFoAy8tIM2zOYQjBXvJ7NmAbNCdu+d9LnLnYYhGAK6zmucs1RQIOB
	jToWGwVHyM8rpKOO1a466AThcnxruunJrTHqGVjN76Rnae0IVuYT1urrDozFejxjhYBbY
X-Gm-Gg: AfdE7clKit6NWHZSzx6JR3SfEjnN4xb2KT/GWzge2zS5J+QqtFtJKQhNCOJlLMwQIWw
	ARM88Gm1/XVgKH6AfF+Alp6tmE1FEHiFw0E3m2ZgV7wFlHhvqVSSlqB5/zEqYGCAWoUaxcV28HZ
	5ZthGVbofAjBS+PCh6b8UrxddL+6vTbv2XVxU3c7oAayAB5NgEs7/z09oR0vb4/QIrOP0lBvW15
	PvU75jabOArFzYEYed8TTi9NDVU5raEJNrVPA/4JpJ04yBMpc+YePmmvj0i3SnpU2ZyuBTnl6lA
	NtmgkMzJrd4Sa4W+tVRITTE2K9SNWO4ZWty85KQX5qmiPJjLo7s+vqausCPHoxW39S0DUkLCQXw
	efCsjlLAOO41izi8p3qclMGKXxdMI/ZhTrlMzwuOVn01u5i6CNZlUlGVPHHmz7WoVI9rqPbA=
X-Received: by 2002:a05:6a20:d499:b0:3c0:9c19:659b with SMTP id adf61e73a8af0-3c0bd1cbb60mr8351564637.67.1783587145855;
        Thu, 09 Jul 2026 01:52:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:d499:b0:3c0:9c19:659b with SMTP id adf61e73a8af0-3c0bd1cbb60mr8351531637.67.1783587145427;
        Thu, 09 Jul 2026 01:52:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b25204sm3460027a12.28.2026.07.09.01.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:52:25 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
Date: Thu,  9 Jul 2026 16:51:47 +0800
Message-ID: <20260709085149.4072181-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
References: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX7FMWNLCsXWso
 laD0+d8e9YqMCTc3AsFhgddnU4dS3kI52piIYtx7D7/0zbX/8njed4heOxb3qTTjuS8V3IOkpzR
 RUwqo8Os0xr8zIpCfOg8q+6ewODs3GZ5+PhCV+gj8SHKExq4WlbwuHnZRcLzRdRDgQOTwkh5UHk
 A6IE9eJA4hkdPcYaW2jCB0UgG7n7nrZBwC6d6bk0r3/Z7d9kpCUIWERm2tHP5Qa76l6mX8dp/XK
 iCLHYftbR0CVVbNqKwE5ZKSea/ENtyzbFpZdXUHLkwoGzNeU+uAxMT0c45Tj16YITAsn2w1Bq1R
 ZspcLO705tFrongobTImBK+LH4/7i+BZ46odh5k8LG63WkaO2fTzYVxjte/yDiGnajdVzWmbHL3
 /vXWW6BdaQKlFIsi20YD8KmKt5flTx73bvH/lvMwoMtHEyQ2GKN0eAhHYSXvV6ysSBGyEg35hZY
 5lJwH1pnlVcprqF423g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX8TTofpqVMdcy
 Euja2MBoD6mjOSXt3mdkn7e+1Hd2Yq1oEXzBu4FbvFn8YKiQSdlm9Cl5GEhWyUbgIQNz/NrJHzF
 iNAflkftV9eOVvhGgEoOu+oHHbiAXz0=
X-Proofpoint-ORIG-GUID: -eOE-6HiqcyAckImOf5XJe-9w7SOOwMS
X-Proofpoint-GUID: -eOE-6HiqcyAckImOf5XJe-9w7SOOwMS
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f614a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=L3lYWtOMLQTLw7epnDkA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-117918-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shengchao.guo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51D3A72E947

Document Always-on Subsystem side channel on Qualcomm Nord SoC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 8eaa04431d74..e778fa3a6c92 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,hawi-aoss-qmp
           - qcom,kaanapali-aoss-qmp
           - qcom,milos-aoss-qmp
+          - qcom,nord-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp
           - qcom,qdu1000-aoss-qmp
-- 
2.43.0


