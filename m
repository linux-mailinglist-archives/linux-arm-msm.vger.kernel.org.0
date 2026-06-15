Return-Path: <linux-arm-msm+bounces-113132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gIaDAaW+L2quFgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:58:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A148684CC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:58:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aP0eayDV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IDimv7S6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113132-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113132-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82B443063399
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E74A3CF97F;
	Mon, 15 Jun 2026 08:52:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4DB3DA7F2
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:52:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513557; cv=none; b=d/pZyFcXey1aglawipcxn2FxBUB3efwvTbmo/FbqIfhWO4thkZKd0jn80uPzhlBvQM2W9uR5Qi6lcnjw7u/+/aMH3Q0riLSJiVqJBH6fabT3/wkPd+DBiReQ7D//sPc/f4JoQkznpbOz1HPhmeKBwVFhdnC2wvgAWZWl5sAYZlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513557; c=relaxed/simple;
	bh=STku0i5TtYmUEEpeQwXvpNR0khl4OJn9mGwqJJMHjDA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q6BugQd4M+1qP7Rfb0hmgcNHi689mntyiKA+0ZHjbTRYCpE2eOp+/zxpIz+eqV/QxkeoY0nYPG5OyCaGh6SH/8YHkA78t7NNCKWZd5zP365Wfyvb2AouSTsPE9Zcg6IuQILYfiYp/z6yJv7Oc132W0p+Xd5CyFi0YXQ+un055QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aP0eayDV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDimv7S6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6LSZI3889547
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2JSXreH0Ef/
	woXc4rcsCrGvqXy3i53dhdVhB3MtcL/c=; b=aP0eayDVR9rBkE2kk1eHhW+MIFX
	3p+XgnEkHEMPHsoQqzXxM2DMBxJluFsXRbH/hqCkb38RoL3EBw104eyQd+z9Au2e
	N3r794Looeo7pqt3WS97sXITDUoCDOU8nQ86ck3XK/48cLSdrDiQmgeGT3SMi3qp
	sJM82BxMPTy8RIMdlAdzm1+3vxcmyV7VvIpCRbISlLQ+vF1gk07HTe9Mr2ez2TTw
	UaySHNHpmwgeuqVkyiDXcwwwD9F6PKX+8rq8hvYTYzkhBdS/gtXiEX2Dj1mt973S
	IH9Z8kiF2NaqErU7LmCYr2el7+r6eE2L2uwcPSDn3ljZasdvVv7Cd8IVeag==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wxhbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:52:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso3054352a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513552; x=1782118352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JSXreH0Ef/woXc4rcsCrGvqXy3i53dhdVhB3MtcL/c=;
        b=IDimv7S6TDrIBwxk8UW/+Bb0qywXIoxaSYyWKRIHc9ocKMw+eJwUaxSP/i37TkRVI5
         yrlcMpI1mtAkIX0B/81Ie4zDKDLej95Gww1k4GZjkZQ2RHodS77wj0IE9Dlm+NRwQbKs
         /KD/rTlyjNCVhwxXyyHOxSLp1hyENcD+nH6mfQoozALtEZtemHerxzHp9hkBX5E8Mb6/
         92xu2EgcqUyxIEUd3jr2awOelf+RZ1SPzZ7VZqBxYKKziDbyZrwE+EtCaL4E+BBC7s+Z
         d1jY4pHe3u4laSb51E3XwbglD644zTYmCfi4zePVfKV2XInYq3ia1uPVr3gDxT4NUsDq
         JZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513552; x=1782118352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2JSXreH0Ef/woXc4rcsCrGvqXy3i53dhdVhB3MtcL/c=;
        b=AAgsgclSQMQG51aeRi7lEIP+XxblHjZ4IAvD/bAC1GR6N7Id3EZqMuSnHXi+KwlhIV
         0xDjokQ1UAViRyX63lARUfki0m9ynOItTK2Uwr7QWSdZZDO0unOV9TCTvhayXaReIID5
         ZrYJJPJdEpGdwiwsVcjq6YxmjcTMhkW2RBzR6sBOVVSoAOWmIX2PYKnkf27mevq43ihL
         vkPlsga1coQkyegzx/MgFWr/V0SB37K4lA08Fa1UI9rbRHkRmuy1A/ytAKZoZdyJcUaq
         rbBUdjpGBMZhZuJVg8Adqoo7XI3Hg5lKYetebHxAO8i0MdXZOI9RSHx6kBdzS2P54Khj
         Wjlw==
X-Forwarded-Encrypted: i=1; AFNElJ+tWFWXra8+ZtcXcNSd13o7xvwvw/Ed77HaPObLSr2JAbZCqtDIItoltIEIKlNVczi/4ofTeXO2YhKiQQNq@vger.kernel.org
X-Gm-Message-State: AOJu0YzEDmVFQrG2GCqVuB+sjOzbZNhwp9ed4rBl0NWFF1ZmU7UB2SdM
	/eZ3N36Kf7Wnt0UPjsdoM5q8J4X96Pex4gCK5oPuWys0ss35cB22t/7IFGd9cBd58VcYHcJt11h
	QXMdm9BjqM9+pA1zsyOkF/B3+Tv+9JR50lg8ncvELjM0HUrfzw7jRQdbTWX6CYX6/N+hb
X-Gm-Gg: Acq92OFUIppjhmfN1H7lQmE2qRfBBB9SNfiOeCJzK912YnEwL2orwLnFbp7M/aSoT/C
	GUOTzYn52BMLkxt6yRd/Uz9S/2BE3KJnuje5iLlYlzhiLIRL1un92jB1Yq71PthrXzCpQq8sZu2
	aLNrmhogJ3L0GKsu4ZBjKeVX9Azk0M11zy8+Rr/6KoKIA3MM+BGFmweA1o0pG6mBi/1Epg5ucSH
	c+2zc4UUICE+TRE5CckzOSe+Q4WmEfDoHL4fcfr+YZRaq6/JKMiJCNOkrRl6Zds7ov8OnOvIC8u
	UYMswpSKCTVaho7p93zWniHtavzBWain3iuR+9pqkAxQR+G9tGx0XILe9Lm2M9C1K0TUSDwiNgS
	5n8wolbe2HBv+IhRTY7YUuDBBCyoLhXI47D018JTNPGZftLdMuNv89/AUYD9GRpek2Aeh5OBX1n
	BkprW6Dk07a+BEOSgHIxnNYq0XrCF7giHSX3W9yCWb60YkFbtkBw8=
X-Received: by 2002:a17:90b:3f50:b0:36a:7c8f:1423 with SMTP id 98e67ed59e1d1-37c2bc73e4dmr9733599a91.9.1781513551935;
        Mon, 15 Jun 2026 01:52:31 -0700 (PDT)
X-Received: by 2002:a17:90b:3f50:b0:36a:7c8f:1423 with SMTP id 98e67ed59e1d1-37c2bc73e4dmr9733570a91.9.1781513551532;
        Mon, 15 Jun 2026 01:52:31 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a25ecd5e9sm9539723a91.10.2026.06.15.01.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:52:31 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: thermal: tsens: add ipq5210 & ipq9650 compatible
Date: Mon, 15 Jun 2026 14:22:17 +0530
Message-Id: <20260615085218.1421347-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: O89d4vNf0uwpKyk2yf7QgXlg_s8VSj-t
X-Proofpoint-GUID: O89d4vNf0uwpKyk2yf7QgXlg_s8VSj-t
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MiBTYWx0ZWRfXw7rVx8AonEqg
 R9P4kw+K9N/M0R+68+u5FiK48K/+BcMJBOsrTKXi46uFM9f8YLNkGu2oGraykn/QgEv/eNjrYZ0
 SebbnK5dLW+sWe+54udgfDgD4z59NOc=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2fbd50 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Cj70nMFs6DzugLwqs6cA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MiBTYWx0ZWRfXxaUlgZLoVNzz
 WBPOJeeinAroKkThNZBnLBQKRMHvVY0L1vSsyQvFbvn3RbpSkGDncQR5LDSAh+PV5fVBLRuByEv
 rUu6a9MMkUNY1pbDZg9UV2CupxohSbkexjQ+V8q9fgiP8x0cYucogO42eZFmPaoQuXJ0dHq0kLi
 WWWUmfLFcQGybKwqQ1CyQBUtUhedXm9B3GvNPXxA1BHjx8ovqtmpR9C8z6ysB6f/d7Vzqn7G/57
 Xxw2Mh5MQ4L45sHSTLJaoKDYlMcxRKwc+QCBVlOa9pQc5P4UTqoLCY0mYKkLf5UKyHB2qYjP79y
 LMbKsa6bBgeEQ7Q5BLRzzUOjfxLAjGISpa4mgaDQ+SXdqK8mG/vCLram2dABM+Ix/zC+3cXZTBh
 JlERvEDeixBqPBxWIHHnYufp0lHfB6Lyo8V1smy6CAStSI2TqNwIKAdLAcieYsdmVtu2QsrvAFT
 jeYs5P9pkVCA3X8AdDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113132-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:tharagopinath@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A148684CC6

Add the compatible for the thermal sensors on the ipq5210 and ipq9650. The
ipq5210 uses ipq5332-tsens as a fallback, while ipq9650 is added as a
standalone v2 TSENS compatible with combined interrupt.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v4: Fix version number

v3: patch version no. mixup
    Include ipq9650 to all applicable constraints
    https://lore.kernel.org/linux-arm-msm/20260610081241.1468507-1-varadarajan.narayanan@oss.qualcomm.com/

v2: Fix fallback definition
    https://lore.kernel.org/linux-arm-msm/20260609065447.4024695-1-varadarajan.narayanan@oss.qualcomm.com/
---
 .../devicetree/bindings/thermal/qcom-tsens.yaml          | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index f0efaa8349ee..bcec314e0532 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -95,6 +95,13 @@ properties:
           - qcom,ipq5332-tsens
           - qcom,ipq5424-tsens
           - qcom,ipq8074-tsens
+          - qcom,ipq9650-tsens
+
+      - description: v2 of TSENS with combined interrupt
+        items:
+          - enum:
+              - qcom,ipq5210-tsens
+          - const: qcom,ipq5332-tsens
 
       - description: v2 of TSENS with combined interrupt
         items:
@@ -306,6 +313,7 @@ allOf:
               - qcom,ipq5332-tsens
               - qcom,ipq5424-tsens
               - qcom,ipq8074-tsens
+              - qcom,ipq9650-tsens
     then:
       properties:
         interrupts:
@@ -323,6 +331,7 @@ allOf:
               - qcom,ipq5332-tsens
               - qcom,ipq5424-tsens
               - qcom,ipq8074-tsens
+              - qcom,ipq9650-tsens
               - qcom,tsens-v0_1
               - qcom,tsens-v1
               - qcom,tsens-v2
-- 
2.34.1


