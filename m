Return-Path: <linux-arm-msm+bounces-117907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jG+ALxJbT2pQfAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:25:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2406A72E3E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:25:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ld3gzjIR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GeaLJRWJ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117907-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117907-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3722307CA4A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC523EBF3D;
	Thu,  9 Jul 2026 08:20:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FCA3BB9EB
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:20:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585253; cv=none; b=abko+3dRs4i6WRLKkNxiSu4/sMgPmyHBgOelTQ2lyz2lWa2jtsGIfxCsKdo7nh/gNNaL/4wEQg7uF89d9JSXKAkl89K/nzXNgwC21KmzIC1YOlheO4P05M+NnTT/RTPTaf7BJh5D09GToIGGf5AQDGLL7no/tJuM5BtxJOZjid8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585253; c=relaxed/simple;
	bh=hy06WEp7lakBxT8oij2blpEsCOVJABmGTMRVXzweoy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jSSEuW4aTjZtyDkGinFqI53BNyvafSeMv6hYSyc+6jwC5Ii1guJ24VTIFEey9U90PBYwvZ/irQykIhPPbOpmEJGbjEtk8SALgUJKiN3booKAeXhoAihhgxvGqHwbZpfZeSXjLpeMtM0knScgy+4ta+S/HFYoLOZLfCj8mvd3+gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ld3gzjIR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GeaLJRWJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669618N4933309
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LVFbsmyElM/L+CCIqiuiSwvH0ilc0S1tpfB
	Fg/GiJt8=; b=ld3gzjIRPJ/0FJjIIR23GWKMMluSPa4y9e+oshZ+jyyN1Y1Ggyd
	0aqaUo4TOr5w1Iw+xAXDSVrosTR2EmhTfbyZULw9E+PoRmyy/dHIoFLmmygKhhEf
	qST3NFELIOKHWdQeyL9pT8NyxEEDvaJU3dR5/9+lk6raC9SSOfHJuhv6RXtPdwMk
	UcQdjSDhvF2OSb34I3G1/smSLI4deRFdxKuj4YQmEkPGM9wI4YEP1Ui9kddZpycx
	z15xEZQuBmED6Jh8CyxAHyF94z88rIto58AXro8DWKjlrMAsi7izyXS7aqQeMRwk
	YjZR8gO9kVlu0H8i52Ki2n9ihbHskHGD7rw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6jnyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:20:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so1256430a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783585249; x=1784190049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LVFbsmyElM/L+CCIqiuiSwvH0ilc0S1tpfBFg/GiJt8=;
        b=GeaLJRWJ6A7KIV4gMNTGDLlsIfNz0jQCM+P+HDUWJXwXMlCaXUy+NxOw2v384c9Xyf
         akJmbVl4p4zgImKVohT0BmaM7mnVgZ10W+cUkC8AX372/ZPH/GyG0Fx0N94VrL5FYcHx
         McPsz4i7OgMiCdI73QcGk//ThajIISyOjDNzEKa2FuCZNqb/We/mqdxJyT9RkI6Xu/nN
         0c0hItUu8aRkCX7HgDg6mGRpHSyo/1k8eb+7WcmgDls+nSGDx73/O4G87PXXIiTtePxi
         bD43RQ4aUNst5GIdSeOmLTjopY287WZQPAvFKhXIu6+Nhupl0JDAdJlP/X8X1lZl2seH
         kEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585249; x=1784190049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LVFbsmyElM/L+CCIqiuiSwvH0ilc0S1tpfBFg/GiJt8=;
        b=mA93mOEW12ju7RroKGXD7CWq68X4tcTSVSzXtyN3TJcZGkXBiN7aE8CnQ4jXIayuVj
         T38DWfLEteMU065tiobuy10+UkpA5JnslvhsKhWR0jrlxv3Wdb/gP9OYvOE+glqrKMc+
         vI0DbUvz4WrSCyobk5PX7x2LmnovJeMA4MDf85QV/y+SDxanbMEhYUhy+sQM90LMsMki
         atT31VJuLaqIooBF/VftvQumytFOtzxc3C/ikQCBmnra21M+TcvlTcvgFdPHE00SQYG6
         IzXc/Rci1ZAIsOLm5Nt+xedE7RyDhalHnjAfUyfJ7ie3xjbRHXydaoCK7ori4Zfh+uHV
         zsyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHmjs8kW2063uEAGRRBnsmlAcgfzv2xEEnbvZ9IFHTLNQQoaqUqvvjcqBae/YDNiDn2ecKMnUp6i4a42go@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk+Y8lD8SF4Xpg2TxedLo9JiQ6BmHPWb+6JgVUIHdYzQk2gBvP
	CcvDn/bhFi0DFPiUK8BYSjP2fOPTPZ3ITeR7TWrfdpsj5NP+TTFxmRM8hb+VXbLP6eFYo6GWZ+u
	ZIs4tIWlGLhrmgAqicLg5BUUr54Lrzecyft4KdpjXC4jJEjG8ER7pYizRdQWGpiOjgWdH
X-Gm-Gg: AfdE7cmWHhFa+MIqBmJpqSw6i404/de9p8Fn7IQCCJLjXWsI0ocyhnVIsBYLfALaY+N
	TuUseySgEkPdUl4JC44CRiY4RsLBbAfEx6VN+9/88svqdHPElx/KmVywIsYhl2xlQBPe2e0N77r
	qOvPXmwj7N7WXNPqpXku3yzySspaEuyd8AOjKoKXsFS+kqgOXlu+5D7PslLlT0C9i50rto94JYD
	3T6Pju0vjxbX6oS7Tol4gYP2ghRXaRuiRmhovhT4lVJOq+fh3rGp/3sP31Ztem21tbXAH8zlV2P
	r4I/YBe0OP0oVkGFXFuIlBIYn9JbvePR6bloZeJ2NUiXENX1vrXpEoN1kg26qKCPlfuWW/UPp2M
	lN7sex0QlPnQ0FF48GzAYguXdtp88GKwXrqa+1oxtZOYWP7dz+YaaIC2FmhtG3kvEq7HTTs8=
X-Received: by 2002:a05:6a00:399d:b0:848:31fb:43d9 with SMTP id d2e1a72fcca58-84842f9fe29mr6182871b3a.45.1783585249005;
        Thu, 09 Jul 2026 01:20:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:399d:b0:848:31fb:43d9 with SMTP id d2e1a72fcca58-84842f9fe29mr6182846b3a.45.1783585248485;
        Thu, 09 Jul 2026 01:20:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbfd41sm8323523b3a.57.2026.07.09.01.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:20:48 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: misc: qcom,fastrpc: Document Nord FastRPC
Date: Thu,  9 Jul 2026 16:20:40 +0800
Message-ID: <20260709082040.4070711-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3OCBTYWx0ZWRfXw7G73Vz8te+C
 YXcYZGr/NjjOY0p5YRzvSi81VWwsbeCqUSZJ5IB+YWo5Oz+lungm34xmdMVPwI/pIrFli80lRBB
 0ujISF5w17L8T8q6kCPv3s5paoFJhZQ=
X-Proofpoint-GUID: lLtt0-8wC0iKa5AajDClzXNOVwgDuSrm
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f59e2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=v9Ym3Pauzs3pF5Qw1NMA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: lLtt0-8wC0iKa5AajDClzXNOVwgDuSrm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3OCBTYWx0ZWRfX+NM11phAumhI
 4U3ZREsO7GUdbNvTBldIG//gdtI8mWy78nR5b09F24bt0DOl/VgpJwVo17C5FG/vUryLNDRhCrv
 GqSBrD0BQp76WsQ/r7PKfLWhjEVuBP7WhNvP1NXmdH72EIQJTsYdH8hinUNRcxmWx7f4bNJCENF
 n9bQ7GT2zF/mz3JOhnmDFZ094vgZ0Vp2r/x1LrjYzA6hqu5m2Fqbe1xwzFBVc0CbLGgomrwGc+M
 Yor5NRP295DSJbFK9Mvg3pzP9PUw1nEjdL/EUUx7fwDpL07N7TGYNn7fz5ydlVsKndsRYNCTk9v
 1jvTKbSNUMPfVvvjy+NXNnG/q2qi9oyhVGvoy9LZb00UJZradTkRFdoGiqW00ZGyNxz0sgpaxKY
 L80oSPr5vgFqYetyjNIoBYx9u4NJFN9+LFJNNds7ClCVruwl356tCLV+zHtkSdqkARZrd5CvI8o
 E5X1oghNf+cB8Wc/Kag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090078
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
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-117907-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:srini@kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shengchao.guo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2406A72E3E8

Add compatible for Qualcomm Nord FastRPC which is compatible with
Kaanapali FastRPC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 2876fdd7c6e6..24fc0752c11a 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -26,6 +26,7 @@ properties:
           - enum:
               - qcom,glymur-fastrpc
               - qcom,hawi-fastrpc
+              - qcom,nord-fastrpc
           - const: qcom,kaanapali-fastrpc
 
   label:
-- 
2.43.0


