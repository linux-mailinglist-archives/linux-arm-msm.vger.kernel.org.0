Return-Path: <linux-arm-msm+bounces-116097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 02whNFWxRmoAbwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:43:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D566FC3D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:43:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SpR4mmMm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eDwnpVpG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116097-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116097-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F5B2319023D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3CC369D5D;
	Thu,  2 Jul 2026 18:33:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCF3369D59
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:33:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017192; cv=none; b=kIgKNlj00ycB5svRM6S3ergM9mSXQjvXo/sbQL6xDmQUfjDCPEghUgbb+31SK/xlWg/XEewqHdD9jh2ExnSgpg5103hQYX2a64T2gobcLekIXSKJP1DLKMC0uaHY/lDgO0KOLiNMRRnTGsptyTVypwXr/V9Vm5C67pljD/boEK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017192; c=relaxed/simple;
	bh=f/MBvLSlvOrVtcOCNXoZMzdxKSBrPIpKBpESta4zVZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VwxV9eSSRo7/nCVwA/Avhhu53Rqt3MvsR9Npe1iyq8nCkI7m+f44Ly/WU4Ec73VbP9zOGZCEpHrVzsuVboWAXKBI6kfOfQYmSDcWKiPDpK4uizecm7nPMByU4PGFyB/vlvX3YGzf9dCtqj+iVaV3HTK2fluqjikeZxq/y2LjVZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SpR4mmMm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eDwnpVpG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3gWb560655
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HuvHWPMyyWNa3Iqhcyt1Ymrb8278ll+uGvKMDjBJNv8=; b=SpR4mmMmmLI5i5oi
	2pg3TvJLaD0htgJ62aD8UjAk4CQNpDTlq++/oJ3hIYFFkUuy1U8QLiLIRzUXFjYo
	3ufOVgdyz1VC3w/UC3/ELTcVGDcSmjVCfJN4yxoyH+l2/C4qa1+sUKKYxahhOu8m
	c5RJUBLLRq+b4V+QQOu7J+HwdLp7OZUPyXnYrOMqSLWZmYmBDFSHSMJ7x/puvobO
	cPms3GkRY7XK7TWWH/pzZOh0LZFG/ehlF7aobDNYYhlb5oBLgT5sSdt07m1NOYNN
	Vf7PWcfJu6FEp74ikUN3lPkVOaH/1OVWZxg8pxTnglMWimvAyhEfnQYKjzlxFZCn
	Zk5dfQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bjbhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:33:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c81c7421abso48507765ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017190; x=1783621990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HuvHWPMyyWNa3Iqhcyt1Ymrb8278ll+uGvKMDjBJNv8=;
        b=eDwnpVpGd53zW1SZ5tJCV0yffPZW0U7VyVW0O4OEsgUgJzQ5CrJcMk3M5UcVCeu1Nh
         3mjzdn0JjjhdR1eOUdiLLjiqjGcm0igwhvanqN+LcvF9yAj+8KTWhbrhwxbfRW3gynYs
         +tFyGb8gA5sPNjvm0hfTovz69WUTBVXatIujYvs5qj0hm0yU2WdDq0v9ypVTEjZynFxs
         Z+mPPC4U69/ILlo9xFzNcD/pL84hqLkz7dCT3oB0uBcl7zwAmMLznszm9djkdEq3pe1b
         c0OVa1vm8euq5Md81CBUQ5WeJhz9LWKhOLzIhrYWQtS/H2dJE2X2QKdeHDyhhmEdvIAC
         iRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017190; x=1783621990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HuvHWPMyyWNa3Iqhcyt1Ymrb8278ll+uGvKMDjBJNv8=;
        b=j6yJA32MlviNfxGbWPyWqfB1X61jO5yfhoEmbCXyhe+rDVLalHt2EavPn79DuJpNnn
         Q483bxcSIDqMG1CqiV2vptbamaJhhnHcAqREdPU1ktT8uEwPIuGSyeemYzITc/gi7/Xw
         5LuWLyfExz2EJq4cHzrAs4+FQIMIkuZWYfdOhloaoNQ2CC8NW4OZjkU3kr6Ogx7KkEA3
         hf9+MltQ36rXW3kG+o6Euyp63Dz4Ddf26XQMYJV+xzhlKUmUTi4lVSOEGfxScLojsKux
         kddq5mEbLgm5xZpYDSVOV5+5SnZHzeIUXk1lrExoSWagcl90RpXp3j9xQ7EotXpFhsgj
         4+cQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5kIfUvlkeaHILVz3IlEgcZY/zo3rlzo2AVJRZR0xDefRjasI7GLyEuBImINn5s3a1vloCre88JzYZLna+@vger.kernel.org
X-Gm-Message-State: AOJu0YxrziAuPmGg7s5YmHQPjQpoETqXZiYsRJ0TRcxKwfw/Zd9y7iXA
	7aGEHlFYvDHwz3OD+ZgMj50QyspfYgRi2kkoRDn/1hYWb3PyP6ZVPiFjPMVvH0pRHwLhydJ/4DX
	8hXKb3awkvdESvzdyGLSqvtx0LssSCn2yMZNWIQqz1NciJ3xJkCIP/2BDE16TDDaXX9Nh
X-Gm-Gg: AfdE7ck3Wv6qFgoTktXB+WnlX23ni8qVQmZogI/LKourId8VtKm+8NTmZz0iS/dbnoR
	ac647jpl7YJHIHOULs7BitrSnoM1Hahq0ZkvDPc8J2ZjF04wIFbe2EY0NoIIoK5EhKD62Exjkh6
	cdHlXxmhb/omeW3GJhFzF0r+bnC3Mv5lGbuh4+V1MgvmeEYzA9forCB7IyqfbHLk1gvqPZFaSNB
	3Hn55jKI2EQRadZDtAjbsfKPy+95GAOE3vdhj808N1fR0Ob8hby2omu0mfkHRJGD+gJ/wHdVfW7
	rCb3KN/bBimgMWrzOuFq9MtvobPj4Bc77iD7eThXwMJ7ATnA67A4ALLLj52Tw7+x6UaMRaq6OMD
	qK4qZnpx4HeBcca7MZXDaSByC4i0ST2AubxVS0w0fBQ==
X-Received: by 2002:a17:903:40c9:b0:2ca:5d9a:ecc6 with SMTP id d9443c01a7336-2ca911de617mr65967535ad.28.1783017189841;
        Thu, 02 Jul 2026 11:33:09 -0700 (PDT)
X-Received: by 2002:a17:903:40c9:b0:2ca:5d9a:ecc6 with SMTP id d9443c01a7336-2ca911de617mr65966995ad.28.1783017189353;
        Thu, 02 Jul 2026 11:33:09 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:09 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:25 +0530
Subject: [PATCH v5 03/19] dt-bindings: clock: qcom,qcm2290-dispcc: Add
 missing power-domains property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-3-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: nnnNeGMAX-fKSIvUXLz2XyPDVJc6z0zC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX9YLizIS+k+Pv
 XjOmPxBjUwbk/QiMVeee1d7TtOgTfUkXqwQpESIJPX4dcCCCkLPizxraSgRrsHgjBgPWJ557qx6
 cW8UCH5zp5S3xDT/w2CjVZRdpXnP68E=
X-Proofpoint-GUID: nnnNeGMAX-fKSIvUXLz2XyPDVJc6z0zC
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a46aee6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0_3QScb3BezPbPigK3gA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXyTjE0Bc0N6IG
 F3wretuHpuQmbMBT65/Q479w3o1AscIze1ZHiTw9kDYACPRiNhoPlQrEv8DIkv6adOQwRCuKUfi
 K/38wvXRToeVvy8nc0OZIQMMGedKFOWj2QuQHytIJjXrv9C5pNtD40AtFaGVs8oCbl9IyZd0BuY
 k0sReJZ/Ql/0tk5UN0raM+lg9Re+0Ee1NpQGN/dX0Xc1HIHifY4iL5cyc0yuk0rL+ZoqYwJAtz2
 fsgwt6dKBuLWO1gpU4VXg4VENR4LbzImQoay5k8WODISiEpNI3O/zuODkkltBSngXASzwrsLeJd
 qDL1JPsgd1gzexAQ2cMqAdCRVz9t6oIYg2nkTS4toj1BMnDb4UBnfsAs+TqWgaX/nt9K8O0elQV
 F4Cfx9Ea4cy01nFaIpzn9b8y8vPSwAF8ovpqlx78peXXgOf2WVpMmXTbrWmyUjUO9wHo/TPCVsx
 KC3NDshuCrYkCr2f85A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116097-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46D566FC3D4

Add the missing power-domains property to associate DISPCC with RPMPD_CX.
This is to ensure the genpd performance state votes on the GDSC to get
propagated to the CX rail and to avoid the rail under-voltage conditions.
This change breaks ABI, as the power-domains property is maked as required.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 24f2cce033f6e109b65a79553fba5295eb9adf3a..fe49d7fcbd4985adf340945c4b907758abf7ea10 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -43,10 +43,15 @@ properties:
       - const: dsi1_phy_pll_out_dsiclk
       - const: sleep_clk
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -59,6 +64,7 @@ examples:
     #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
     #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
     #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@5f00000 {
             compatible = "qcom,qcm2290-dispcc";
             reg = <0x5f00000 0x20000>;
@@ -80,6 +86,7 @@ examples:
                           "dsi1_phy_pll_out_byteclk",
                           "dsi1_phy_pll_out_dsiclk",
                           "sleep_clk";
+            power-domains = <&rpmpd RPMPD_VDDCX>;
             #clock-cells = <1>;
             #reset-cells = <1>;
             #power-domain-cells = <1>;

-- 
2.34.1


