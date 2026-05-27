Return-Path: <linux-arm-msm+bounces-109960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMPKFtW9FmqPqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:48:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B215E20EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF1A130AA48B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5363EBF02;
	Wed, 27 May 2026 09:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ou2Pbz4P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XY9wH68G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1CE3EDE78
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875050; cv=none; b=NqkLzMdAgB/vygnU3y0K+t5tz64uFi84GlePMFp8CqJj39ECiuxss8wZeocMUXbuVpYW37P+n4GeplfD9xL7kyxRqoVm5RWzDVePMl7dwn8v6K55cy6vUy4OvybQTchF9AxzWvz4HrOJSRnorT9dsUsfQyOONSjpBeHRQCzTzU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875050; c=relaxed/simple;
	bh=0lbfIQ/sS1IJDIflAjCOMa0KrIJ68KeE2zOHCWMFvKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2ZlLM0IDFn/3mrfhzOrTO6SCYVWcy6G8wlCHAb2feFG5dupf9cYeOXm+b5WB7wPvumdX3TAkLAYPKk+WSSe/r2QX86QWo7eRd6JJ5u59o+tIYbwXZQw2LV3JwCXbnhbSb6VRVH5G5OtSNRnOuDHpdRnhg0yY+MY7DWdwX+8cuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ou2Pbz4P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XY9wH68G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mTvD3830802
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DY2swZ2DLQT
	EZ3j6+uSUdon+gDZZc3kODgPMaY4jOxM=; b=ou2Pbz4PJO+29XfbCTv7Tk6yF6G
	nP0YVSdOYSAwzK2jbnKPeMLV4ZpQNKgeCpDkj2muPAdLvNR3qDQMVTK/98mPR82w
	7/8QjltwxTynUVurFY8XJDHO2IIpWE2SWhHKJJMNfCu4Jhz3uZOGJr/Wj6j1N3Ui
	IfsNkNQPEmki2yOkO08g40JZjU/v458WKDVKmj44kqql26AZfQNMoCc/v4nyUcIB
	HP+ei3p6Q//oTLVe1zfG8QhsWrDXiBWlOYVGRKB0jCfMX/7SD+E1fqCHjwenMeUz
	T1rumizPnrevYMz01B5veoj7QDoJgWzen5kKBD+CGSWZGVInFjFRYTfCxHg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edn17hxmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baf7748d0aso117826185ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875046; x=1780479846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DY2swZ2DLQTEZ3j6+uSUdon+gDZZc3kODgPMaY4jOxM=;
        b=XY9wH68GHz/nbLbMLGemiO2tT4tK20VhGoTxIofdBkKoSFm3rjTZPDZL68F8xIEmWt
         2a7u9dGZGuzgN4ysSicDpqNGwvH4BGW06/H8XHZ+xmeYJYCak+1ZjRn1FzD9BIXMYcnC
         eassQTV078FizJ848uQQ8S1O4AHYCE3W5r9AwIoYAjOtz10sOaDJ0zZ5XUemslI9vWin
         6kFpa294i98kmqYcdQcmrnfq2vv5VvkDUX1plOr+yvCmLgsxZY/vrKQUGSSxJXP7iDi1
         FnPttmbLz+l9lAh/YY19dGv3hTyCTVJun4w1zzwdz6tei0k4n3u62H6BH0da4D/MS0vx
         ftwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875046; x=1780479846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DY2swZ2DLQTEZ3j6+uSUdon+gDZZc3kODgPMaY4jOxM=;
        b=MWkVEWPDHM91FK8HgPVYoIYx7oRrxrEcg/KtcIFRT/LYxZQbovLjufxmaAc4PxZvdC
         erEiwdZi/PPZFAPripppxTzqBTvGeFWWvVbi+uAzPeoAxagd2Pc5vaQRnVhlNT6+bF6r
         nTpfR2MV2V+NhhPa4HUUeVAFyyPqLPBPmJqkkRFbroW/4leXjF6KBDI6Cz65YBWH4H6J
         GHmmb3ePlmjxiHdK2WT1/FwEVFjwhQEImtdIwE+2ujJ1UwwjeEJa7ES9HIVewr45HK4A
         wninEFS0EBpSDWIrlh5QjAy4XFdr8pZH6K7Fb64H6sHbqeRcD6gdBekMJvpU+3PIfjTO
         MDCg==
X-Forwarded-Encrypted: i=1; AFNElJ/1kgM9SSfsIRygdxBtvdarfDDEJ4lT+LrckVwcm8lVzole58IPRJ/XoHN6hEmU1dY5zABjbCwL2hbjSGCw@vger.kernel.org
X-Gm-Message-State: AOJu0YyloZwAAGcaQk9cjeVtWIS/tyfLyaV2LjnhNSKIQ1ZupoXXgKEl
	xoJDGdUa7jjZ++LXubmZl42meCDsXRQZ2sVExrUZU2zDyb8jdsHHe74WSLxLclEMdqS9dv9zN+H
	pRtl1CAqE9ZyGOFg7cvxgCPIQkXrydHlao7MivNZ/ZMhMPtVoGlHeYhvZ1wackU6GE1yR8Pj6Oa
	mj
X-Gm-Gg: Acq92OFEBr+a8j/+jqSgUWPt/C+g3XENcEYVEPLtYyBfvcyuW1pFVNCijWzTbpd/65O
	Wy0w9CT9hfshNJmtNYNdgFHQySah+KmKCtHjdLTGbBjjTjOrQ+H1Y6ZfV/g4DnLR0zPvn+twd5Q
	pw0W9xgY30o2495XZEVk7S/kPQn6IynvVr5ioQg4nryO8qeiQ4UwZRv7DCCVfftxSV8JOspE0ph
	HJBWwUP0JT8Q0RfazDpYYI7ko1mKYes4Pxgh5pLZ8XARKb1u7+JCyUa3baNe4MDAKMgEp9RebN5
	9iMSlNij2ujgKiS64OnJmRiHzLhJ5cfnQMFJ8JELRt6ySgi6EV/OzXYw1bS1amS1NpR5U7x3shU
	VSkdNNojSBXTMnJhvGyBsbP5TTmWpao2OXksa7LWnWJ3Wrs+0tY2OnwWnlPA=
X-Received: by 2002:a17:902:fc50:b0:2bd:78d6:2a15 with SMTP id d9443c01a7336-2beb033f056mr251964405ad.7.1779875046513;
        Wed, 27 May 2026 02:44:06 -0700 (PDT)
X-Received: by 2002:a17:902:fc50:b0:2bd:78d6:2a15 with SMTP id d9443c01a7336-2beb033f056mr251964045ad.7.1779875046014;
        Wed, 27 May 2026 02:44:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 06/24] arm64: dts: qcom: sc8180x: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:11 +0530
Message-ID: <20260527094333.2311731-7-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX1T92jD8Yb+yx
 9coSlR+dM+SlbZaPCaMRz+26A09hEPZExWmBduwsSuXRsWXpe1dN3fRNNNlRa8fg9nSJYwM0RiC
 2zKOQKKfYj5MKC2djk6IOmBARE5A2pjlocDPFRU6ZHCG6c7DAcM8e7Jow3llykkYNOCClHiYkIi
 rGE/pQ8Ws1HrXMw1Izvw1hzfrSkb+EDKgr1rGvXzgIOJP6wG8dVSXrHJCwbeQFL/wqDz4/BKK6z
 pGsTUP9FIV8PjhRaqvVZoRbS06oxx+A18/MyB4XbC7ARYy7aZ9qiv4gdeVdpVu+OcpREFt0S7o1
 1BPR6/R/gPzE2Id9L9Gau8MO313U9znWr0sAyor8/mMAOwx/3i5guP2QIkduGHS94ff3uC+jxH7
 ovq+8bHvVdVR5laVIn15WszbFNjhMfeNeceIQ1N9Vs0BBakwkXKkJB+bx6rE+Gpheg5FUsYAERS
 hhtJ6OKdK0Dp5msSNQw==
X-Authority-Analysis: v=2.4 cv=R6Uz39RX c=1 sm=1 tr=0 ts=6a16bce7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=22gnxAikWBhxzIyZ53oA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: LlDaAkKDoovuVDRR9mwoZCjOyJzUz6nZ
X-Proofpoint-ORIG-GUID: LlDaAkKDoovuVDRR9mwoZCjOyJzUz6nZ
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109960-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,af00000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,b220000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.996];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C1B215E20EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on sc8180x spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index e87e82fa73e9..a7ea47f07be2 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3554,7 +3554,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc8180x-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>;
 			#interrupt-cells = <2>;
 			interrupt-parent = <&intc>;
-- 
2.53.0


