Return-Path: <linux-arm-msm+bounces-92978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wETnMXApk2kI2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:28:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C428144A65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 715E2304AD9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC93311C05;
	Mon, 16 Feb 2026 14:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CeX53Jet";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ViAzEraL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60671311958
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251829; cv=none; b=oozIqUbM2+8ryd2n6qtp8vP+mV4CRrrNDA8ovYJ0CrtFXOE+NAwc5/q4//47Gd6SyJ6YJ+d4eEznfJtcTB2RUVGQYuon365BDaE48vXo+CJX3leRrMGa0Z/ZuiffDvI2lDxDUs9T3DujY5MVCkE/U+PwiV0eybldJJv8tpjA1Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251829; c=relaxed/simple;
	bh=Iiuil9S13HyvVze1LYPkhHu8cLgUNL75hWhkbEfEX34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFWmblykiiuu8t5zGiLeNQAHKu41Lhvv8lgvDhNxIMogEzoudl7PB1M6GIQoO2VZnETjWQBObAPyB5g/DFDM2FdZNlt3w9HRaauVxUyCH7I09PatK42xyGi8Ni1MNFk5XqdjEaP3E1m9kxfgHiMA30MglPI7kDpa+reu6RXl2uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CeX53Jet; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ViAzEraL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G7vpmc1657116
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdDAFqnGWX0ame6wpW0GALZ7J5cThgnLOFF85Nj4Z6o=; b=CeX53Jet/pIwCAGf
	K43dnQSUVp80XX+M4MlJd4EmaD1heyZT4mee2Ss3/LPoDOzHgAdgleCgPEQfBCzr
	m6W/FTKg+fOeqV46GAq+g4LOrbt6MkkUPef9RHGLhVv2Y2eMITqKSIa/JnXllHuX
	9w01csg9wZEV3i+8ZlCKYk7JOMutmuk6Y+s9buSqq/zUVgazIKF5k9EKjew5liyM
	oWzYmEkgaU5LGB7rzdFTGbN7ztQ1ZwUhvAXS3KBpSx00mfz1IEwh9P2zTmOgng0a
	DrcRgzLcRPa30oibFRITtf786x1fzIZi9hYRkLvlUOT4sPafV+uMPqm+dX3O0An4
	/797HA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbfuw2d3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:23:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4d191ef1so231346885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 06:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771251821; x=1771856621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdDAFqnGWX0ame6wpW0GALZ7J5cThgnLOFF85Nj4Z6o=;
        b=ViAzEraLSR1o/YGu4YtWRetaIO36FGQmWocfatOvx+6TZtDJarcPqxiZb8+vV+Ot2x
         k45T3hYfxuwg90yyPE5ExdexrhBqMlb61BwHS8qf3n306thYIV8deMb9juOFmo7M7UxB
         Z3G+Ji3HXZbBTk+ShP4ylMz6SLGx/JB+2JiXZZIkDgk2H7gm5vtPL7xsFhD5obZBvO6S
         0UY+QT74QzZnuVST1YT1o774ljIH1y9QOM+NsUP65C2AAam+Ha/QJ32IpfivNUGXeYOo
         hka8ubRH8AS10X0Kll7nGExSoqoL9g4bY8JLFT05aUu4NQK1gplRKiAV7Ovyc6KBlM8L
         +hMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771251821; x=1771856621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tdDAFqnGWX0ame6wpW0GALZ7J5cThgnLOFF85Nj4Z6o=;
        b=b1o3Nb7boG3Ax2ouW04ERqZ1k3e7zhrix/aDFsr0FcnxP5hoypHQeWg8OWbdsG1A+7
         ZrFQqIB13n3L6kLL4lvL3WuOHxdizE4GVkVcu58AnHNCsjNWlHyqKl+AGaRMH401z7e1
         +h1+Bk/r8AzO2msS+30XUcTj/qZVf6HjV12te9ZIgY5Q0G+PAg0ZK00B4ncpwcBL2RQD
         n71flumCuPLZY/yhI/7aocQwsJoKB6sIgxP3B6u3FYbbXEqxB6D0A+bB7T0/d2B6wL+A
         1TubCq2qeNjhWChIImIS8jmWgcpaD2tRObg7JuNDUS4JIgzVtnmiiGC5+k7B+1vayFKB
         GkWA==
X-Gm-Message-State: AOJu0Yw+6Pr50EihTHkxMAqGgljJozPagD+9WTetVWVFiZ9sOdjn0/oH
	XbUOz8G3vn/yJiTDorjhdJSHXOXRoYlykZK0QrzVZiqzzi3JgduN/42r9hHGgLYDKCSkdE8oMv8
	M9otOmLk/foHZrJcEFUHDDwJv5KMbcvK7GAK/aMI/v7owtEtP3lR1vEvgBAx/qzSFZjq4
X-Gm-Gg: AZuq6aIrzQaLpnsOvKTsDhX4NUkptbPPzdULMEkZQjC+IMXEr2Gg7UCeJm4U2nF3GD5
	XIUAt1lEMvN97EjriWyeOikKdXg7h/oCWY2MRpWGnQ1u4awAtpRSnJSG5YwV7uvD+wrUmtDmNhV
	YKSd1C7cjjudgrs8VGV+oYadwpZSJxzrjahiSZoYToq/TvDT/xeaQLu2K/zUplONlxfgMj5GMMD
	qyX+Jlnw8yXCJ0i70O+MeqGXc6S3/GDDs+k9G8yAGN3lsvNF6eFm673IXiHI6OTc6p/ybFbbyls
	d0Q6Hz6TgovJv5njvMJgIv+EO2c66BJRwJJCqypxjE+vPC5oOjpy3tVtIxWj4DA8d70Li6hHbSx
	JGvWPj+0c2Lf7F9HRi8h2c+0QyHIIQw==
X-Received: by 2002:a05:620a:458f:b0:8a2:e1db:f442 with SMTP id af79cd13be357-8cb422b2fa6mr1215568785a.30.1771251821117;
        Mon, 16 Feb 2026 06:23:41 -0800 (PST)
X-Received: by 2002:a05:620a:458f:b0:8a2:e1db:f442 with SMTP id af79cd13be357-8cb422b2fa6mr1215563585a.30.1771251820328;
        Mon, 16 Feb 2026 06:23:40 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a34d66sm101714975e9.20.2026.02.16.06.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 06:23:39 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 16:23:18 +0200
Subject: [PATCH 1/2] dt-bindings: power: qcom,rpmpd: document the Eliza
 RPMh Power Domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-eliza-pmdomain-v1-1-c51260a47d6d@oss.qualcomm.com>
References: <20260216-eliza-pmdomain-v1-0-c51260a47d6d@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-pmdomain-v1-0-c51260a47d6d@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=737;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Iiuil9S13HyvVze1LYPkhHu8cLgUNL75hWhkbEfEX34=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpkyhmm/jI6D+9HaAgvGPqytBk0tOaPzu9Y3Oza
 mJOeK1GLISJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZMoZgAKCRAbX0TJAJUV
 VjuOD/9vt++BzU4In0EtL0RIjHrXGRz62Z+uDBR+3e7oiXLjY0n9DAu4FXXUkifnfvEEH0cJ5zP
 8uQij488gmUsi3F0WZLp6mcPI5AwGL/SwXxqWDNMm8n3R4myRBVdGPx4F6eujU37Ik9rHpJBTX6
 oXucBAMvS6gZix+mzqOqWilOL6J1xR+dYMgN3dpNUzsF/Ii6BgOwhJEczBdIa44jV3X5LLKNYms
 4lAyIrMCHGUGTAF+BySKGyrB7VmFJfrVdOOcbLKw88PPZXAQTvAVpvMCP45rbD2iTi8ERxUF524
 wnojj/rCIaAo7ptsjE6rEMMYH1aSkQxqGmpqdHzXIj6nhS7bhzSVLo+w7wCEvle4p/oWckCrOjt
 WftpQt0ZqHwLQCXZDWZo/nUU7jsNRAQGGySqORkqcJ3daiuxVtKMPhGNjFIlV4KaMLw1nXePQ9q
 43GSuClmI4VBZCI+S7Lb1IbzcF48dgJnjDAjneYqcoJxf4X+2qsON8OTVg0Nd0crEFDBb7Uojcz
 iPMa4PYZJtlxxK9AFjHHXg+KfTlTQrN7jf7hDsZe50putr6Yp2BdeL/yy+uvQhV6ccaBXCUb0lI
 pke7RJHC4cX0mOisSUcOSdRMMXN6SMclgpRN7RvvGGE4aBWqrhNtCorzSUI+z9vyi+26eFs/ptw
 o/mXCpNM5eSbk0Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Jb+xbEKV c=1 sm=1 tr=0 ts=6993286e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=-qkovbBEdaU6HcigwZ0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: E_Va3uzCKNEhCICwHD8AFHCs6Cxmtn8P
X-Proofpoint-GUID: E_Va3uzCKNEhCICwHD8AFHCs6Cxmtn8P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEyMiBTYWx0ZWRfXyCTuvOeC+YCP
 pPc+WVxhd+FImZcLDDV8uyHcLAZBKYuei1Ycyeu4wpP852f3cPvr6a/NXKDkpwRzJK9q2OGq5OA
 0hI0F8v0JT/Xpwpcc+gp57kC5fIchmnBaniV1x94LkMKQe5UTEcbwjwJ3IFOdWlVkPLcyyqXtpg
 8dpV3FMGzWtkYYMTQiITUWOcZRSzcelGmyI1DEF4pNEXwu+QkYvf2A70iPqy0IRKqMz/bmkz9RX
 iKpe9E+OD0+VmVOwGovn5ctRHXs2CHIq5mqfRTO73uiXv+o9Cz3MDRQlX3A5+/QxynqNfPsn182
 Y/2C+eHfdt2ZgZ/iz16dAR8QLsW2AGlq/itrOUX2AwICrjOyDsYev5IHtV8ENKXpoNOvmZfN6j6
 puq4aGpb4CpQHsKM9mGrIoSelW9O6IPzccCdkXEtIGXio9bAG46D4ib5ZA7dSyeUH2rlA4DC809
 imTzO9iQUMMospZMRiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160122
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92978-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2C428144A65
X-Rspamd-Action: no action

Document the RPMh Power Domains on the Eliza Platform.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 27af5b8aa134..8174ceeab572 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,eliza-rpmhpd
           - qcom,glymur-rpmhpd
           - qcom,kaanapali-rpmhpd
           - qcom,mdm9607-rpmpd

-- 
2.48.1


