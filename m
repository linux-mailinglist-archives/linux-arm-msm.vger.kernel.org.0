Return-Path: <linux-arm-msm+bounces-101062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BN8J1nUy2mILwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:04:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2458636AA09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AC5D30F3BE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E553F6616;
	Tue, 31 Mar 2026 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AwPzFJcx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fkLk8ybC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCBD3F65FB
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965281; cv=none; b=YowX6Hr+8GZ/djkw3ZQweWih9K9mu8vwYQlMr33UKVBYBQ6N61LxxOCd58tpLXarVXFlTz8DgycUD1u0HDBGWsmNUqdevJOYUUmOVvhkRt23cMaybAZqF5rxrloIv1aQS1FIffeoaSscqsZiRkaj0AXpub+zMatetVZNaq9Kv1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965281; c=relaxed/simple;
	bh=8QcsFttIAmH0U2+jjqOm0hxfq4I9TVAlj59w8AMZfSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LJ46zo1uDSzDGwVtU4+xdr51wxS6eQMzlTnJ//52UKfsAcJDp0SDFHNjS3FSYVj220gFgzPET3aNZPj9L3U5YlW4sYGCvXCnpw/VH0MFR4V3NMh4UL2INS42ZgVaSk735OQa6JiOjPFBNgI5C4qEfIq05MNCitwO6zPjE5W2b08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AwPzFJcx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fkLk8ybC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VA3XID4053489
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fGVwXnII8r4GYq3YMLLcnIXHAW1BotIg1657HyxyihA=; b=AwPzFJcxIfHv+VOf
	mehltL0o8laCOvNICzkhvTKgHAN7xuA8TNt/qAUIHmB+XFolHlw8aVM60F5+a+dp
	T47OL95UzVshFWcmtMOnYm9+JY9E+EhdGN7gpS/0lO2JhRGxQvYmMz6QXeXdreUJ
	VldP3vBleVTHwkAjeJ6aCfPOo66pLHahXxfvoVKD/5JInwIj69RHfMoJ9mqOfND3
	2MAfQN9ULVZYzjDOP0xhv6ukU/DwovwdJVYURBFXqZcmy79zxd+4P1VuPwz8wIFz
	vPAwJYV6QfBhCaG3xpY4Uaq+ps92LPAtVgwAmcUCiZWYkngUj0eAlH47AlcyFSwu
	ynKe9Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx3bysn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:54:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b242062308so98535795ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 06:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774965279; x=1775570079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGVwXnII8r4GYq3YMLLcnIXHAW1BotIg1657HyxyihA=;
        b=fkLk8ybCr+1l2/Q2uf6564tEIEOtXrumv7TQmVPDKXllH/znrruHe8b+2v/La+Jl5G
         0fGtVRJ/jwiX6LugoRWK59d8fUxrpnxvRE2qOP0QATuOG84VTKzCvQJhFZZiJY6RM/Vv
         lC90uq1EVc+in2f677e7oGXfNpW2WOdQ0TvKSVFwZXabJcSqDQOlhN0tgA49KZBa7pZx
         cYPWRh6q2F3XxlTlXaKU8ENIqrCdaOiVF0J5fjTmTbrGJazYBjoL6MILWnt8p84Xw3Ua
         CeK9MoSJ47pkv6VZ2QOr0HlskiEhTRy2lopKV4a6WK+Mg6upx4S/bWyUZe4z+/UDQojg
         aJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965279; x=1775570079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fGVwXnII8r4GYq3YMLLcnIXHAW1BotIg1657HyxyihA=;
        b=B482Mg8r/bpO8yaopTLc7xkCUk5I9TsyHhKipKIRYsLpb30ts9xQFSy93aHSxsPoCE
         uum53SuSvznWlChXpVaWD4c4jslDvVWxls64tuT/q0LAYXja9k9mXaXSX62kXXU8fd2d
         SvXtt2MhssA5GTfaW6H3VM3gclz6gh2I02aKMaVGO5NfIACdCCbzGaroUmuNhcCYVV8O
         uhVY/VZlhdQ0UoBN1Jkg0vc67zO2BH/23nrf7c7bQxL/x08Kr5Asb5cnQ1QbvruMz2qd
         im1iuccBMR9jQMRvMkUDYpTeAE5lMJmaZA/nGuBm7ee9F784PLMoVZS52HYFQu7Xx92m
         /LtQ==
X-Gm-Message-State: AOJu0YwYexeXntIN45rIfiEiEsG9hEhUwEwZylmx9TYjjhY/pzi+XsT0
	XkLCpsRrY84xXWtBWlfZQcJWON614eRp9VQsrFQU+SE5HNJ9cspvrtVZKAOtfq7oOoWPC5FDfJT
	qNKVqczVYMxVf4FpmVkAJ3fQVAy9WSVE9YvMwSGe1su1OE7W4v5LrssdrqBN8IySuc+Ns
X-Gm-Gg: ATEYQzw57/lP/oYozmsgN1veSzcZLRQZz2nvHGHbu4+au6rSsgfgkDcgO9RNhtk8YwU
	1ednyKCvBC+PV0JMYnDWMPluWlHlccCuCOyBty2buhV4WS8ma34pD0YR3iNGcZfHYKO9FfhGlhz
	oKaNUgDnOYcNt0wtCuhZyPt4GP7Ce4kcJzg/P+Lbo0ttKy2rT9HyimEjzqOl77OSLTtxvoAVJ/7
	83gpQ7ad0VMDNkimDYP+wWGDxSBDL4pi8OQtxWtMGIlKckn9Rh1d14GMOBEKeVJ/3HP2vl3pPo2
	I7Osj+CBRgBw6cwfF9wMxbucJoTBIkKWQm5HocGol5pu7ummGboAU4o7ycWGzR3WhAZ9eCtX4Bb
	7+r6BAunwcDf5qc7SIXXj95lv42LGZJFt0XOcB9GEjnzd4yDRREgILMUM0x5FIUmGsy+SRrF39+
	Hy1O+0t42eFPhXbPdJTQyYx17XaYQIHza/nqWHJcF3sQ==
X-Received: by 2002:a17:902:da8c:b0:2b2:5857:601c with SMTP id d9443c01a7336-2b258576d74mr66811065ad.18.1774965279317;
        Tue, 31 Mar 2026 06:54:39 -0700 (PDT)
X-Received: by 2002:a17:902:da8c:b0:2b2:5857:601c with SMTP id d9443c01a7336-2b258576d74mr66810615ad.18.1774965278808;
        Tue, 31 Mar 2026 06:54:38 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24268e7f5sm112748945ad.35.2026.03.31.06.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 06:54:38 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 19:24:20 +0530
Subject: [PATCH 1/2] dt-bindings: nvmem: qfprom: Add glymur compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-glymur-qfprom-v1-1-5b4284d23c80@oss.qualcomm.com>
References: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
In-Reply-To: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774965271; l=795;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=8QcsFttIAmH0U2+jjqOm0hxfq4I9TVAlj59w8AMZfSM=;
 b=iu3Ky0nuPedLmmvBCdUs7fwCRXSVWnUSXCDANCmB+p06WenSYX1iCQPdPVahDDejnRuht9KgO
 28+6tgIJC/xCRBYqD6YCGZUOCBvhltkdgexXX4vBDEIvBMexG/wLfDv
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cbd21f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vUZDLOBKDjOr5eVc11cA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Zw2p1BDOgJ8IrmLn0X1p2jaGwFLupDf2
X-Proofpoint-GUID: Zw2p1BDOgJ8IrmLn0X1p2jaGwFLupDf2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzNCBTYWx0ZWRfX93Ms6DbQf+nd
 35nrVmPq2ubBginjlpxVeR2zontOZ8qi5AdmMSWA35MePVqX7nXbzSxEWoKuUnNpOuoMC9YU/lW
 qYtqVQ8EtUK+Bk1xzYr86z0lVJUh1VVLKh+fJWAKrBmJswZlCGy0k3HwS7BlbKXaKhr/cQCS9U1
 Wz3idBidNEoNiTMZpCYcbs0leePFrex4tNiBcMhtOnw7b/DM0VeJoFRf3C8t37z59Zp22Ys4KGG
 rKmdrlnfsGyvpBpSffI4RKTo+gD4Y9KoTQJr+5+6MCziEjwWk7Vaj0ALJSqGqSnTcDzsUsTy6dB
 K309t8mxIBSkJw4PmK6K/+ZL0Q8l+HuNM0Xm8qv/5gA9fCn2Yn87Of4KIiO9mh5t+zql+NT5Ye0
 8+rk+lT0iTayOfM046sqX2Jbbg0TY4ORXtVbjChkWz67UuzW0Se0EYw99rDwxNYCfkIC8PBDrrW
 5NTNwt7W6DGC185DfKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101062-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2458636AA09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document compatible string for the QFPROM on Glymur platform.

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 2ab047f2bb69..aad8f5ea6fff 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,apq8064-qfprom
           - qcom,apq8084-qfprom
+          - qcom,glymur-qfprom
           - qcom,ipq5018-qfprom
           - qcom,ipq5332-qfprom
           - qcom,ipq5424-qfprom

-- 
2.34.1


