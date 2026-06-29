Return-Path: <linux-arm-msm+bounces-114855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kgUEKSMXQmok0AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:56:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B402B6D69F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:56:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OtG7Mic7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YzErfYek;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114855-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114855-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A64DD302B8B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91D73A1D02;
	Mon, 29 Jun 2026 06:45:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB5F3A63FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:45:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715526; cv=none; b=GUVaWurBSsAHUG7v7aAQ4ew0tPpQbGU3ONIQGo7xQYex+JehJYoFpF/bQbSNLJ4ktkj8MZwCZwWMRdaqnikOk8fcMybIo4BpWns9EvWN42vc7VUngH3zdBTflmkdid5Ii4C++2l1bLpdjgxh29tCfwDJr/Dv91wBvHI77DRQJZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715526; c=relaxed/simple;
	bh=ib5g92loksXZmXiRdLEH7dcCqaG6DfiNxrgUNVm///A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aMjRXXlIYSYMX99QtWSKuBruARkqyoKIRyoh/gLcFjvDSD24/luG4aV4em5aHH+I0FvNCbtCRlHe1Twr3Qq10HeqDoaEGS+4Ppx4p4kPVl4xCupXDMdh1e8qSp55bQQntOpwYCVcTklXmGHr5LTLMEIIIkofC3ZmrcCbuIr70GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OtG7Mic7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YzErfYek; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NJIX1771515
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2qwmS4F1HHI0MHwQbDiJ79yyIP1FA8QXvJV7bjonB8w=; b=OtG7Mic7nvxsywt2
	hNO3qiWD+4dHG/9l2Lgnu98w4P7hOLaI1HlVDL4TWQmnK/PTIhmUU2KZagpOX09M
	kX+0a8EIoSIYXdEXh5T4jetUNtKk8J7KaUJ5B+QxLhvj1Ct7D7NlRxKr3clZvVQY
	hb7aAQjsq8bnEy803Q+A1wxyyIWqi74bSr2FBsUYKYczsvyk4rp2RdslXUSh2fJN
	stUlS9PGYtjDjAkcK/Lne/MtXcAC2hprihRz5GjMQD02fh2t8h/M1TRqRpQswtu2
	JR0Ba7t9nBIR4cvbUpeEuNuaadYGdRS6TBL92nT0nmkeM7vLe+jSvIt2OF74GXle
	81q0Bg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tun013-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:45:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30cb5001ed8so2664773eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 23:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782715523; x=1783320323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2qwmS4F1HHI0MHwQbDiJ79yyIP1FA8QXvJV7bjonB8w=;
        b=YzErfYektzAQz6ZyPXybBnh5mbA8SGGZTFmID+mWFNsHqTKZTNWIiTT7dusE7jwJtf
         3d3h5u2XY6GvtgXRykwaEe8uljMzKEX9OpnSUSVptTqiAZWpw25KWfia4ii+mUf2RwA0
         8R6WSgiBhoW/Uu3/i37GmzsSx61XwqrYuJQ2o2ByzyXMEGx7UAqCq2XLGJDou86Oi7qO
         LKZMUtKcziWDsN1Mqvrh8SEXgd8CL5FcZxOdP9p6QypweZ9a9XVJZpTgb//3WBOfV/JU
         6+eLKEamk/J0pNfiwNIBhSjs93fAiXLJ5KgU39ug6KY2sxaVvK4Vz3NaNwBocWxXvoyv
         NPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715523; x=1783320323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2qwmS4F1HHI0MHwQbDiJ79yyIP1FA8QXvJV7bjonB8w=;
        b=YyDLTvmAhqMYwdp2Nh9Xe0bu47Oxj0i5XZT6Oh7WLFsF/w+fFgCg8KqRvYyZaV5O3q
         nNmhtjoJAUhchKt5Tvv0Y91uJDdJ47QSS2Ko4iscNlTU26YKbPSxbbaYHo9JoE6SrdE7
         8rxpi4ZWn2SOR4OBvyrjDSNtS0kSWaqdLPA1ebgw7znFdgC4VtgULI1+Id/bvZZcq0Cm
         G4G+ETGTs/sL3TUkULovV2VGaP8r7IX4AvVgQ04GE5Od3dpBXQJxPvojsmdaphzSyniM
         K8gluwv5fZQxiMrL+rWC0K+zYYjmr1+9CetJmcnpFFOtiNGxh6gVFNdGfxVWPFNXXRFz
         InTg==
X-Forwarded-Encrypted: i=1; AHgh+RqLelupB2pZ7r6tfDKsHiyupVO0svSHmCiYXZJH4wt4yEZ48Gtk7qycGT/isIDq4oC61Y+iS3TzhS4s8rX8@vger.kernel.org
X-Gm-Message-State: AOJu0YxeWUGJO3CcNBJmNg2F3Jbrg+BP1nLFgHUDSGkCcPsAMH6XmW57
	8VTHCnqsLE7ng/+ac0Qb9ZLcPz7LNP+R7Q3V7rvUTgUBUOdILkND4Y/npmSJbUHOm1xEdXM36gh
	B6TNn4HRP1jObkIrWMoYLzgr60Qmo0kVBeWXeGqSgUuOY7yCUddD7CRXet00LL15VeGTI
X-Gm-Gg: AfdE7ckaOCwZpmTLz6/J94Warf0juU2DwPv1n/rVZDfQ9eRDaHr+WpRra1Cqw1bgQm8
	Gp3V7nmcv+Dc6/xan12dDH3yKhlw8JnyzxIsTZoXDK+80isfv5kRzv6yIg7H3QxgGl+bI+8zVNm
	u0Et1X+65etGU1WlhmGnrPP7IkReUOxzs3pvrtMhGqBq+YX7WL5dOPCedCanVjvtiaacr/wh+wf
	g5edq3tCAD4dqh18do3rPF9x7yuiM3cP02FuTDQKSeafkdBfPqCofVuIOyd0BvugU3osDgp6GAB
	S0B28Pu1eetI9w/lWhrbthg+9P6huad7nFvofWijPq+MgJOZ0tdM+auoFdOmTaY2IRWA9YfHDnO
	nFXPEJvwQyUqKrJqve7l6Xq8aDoM3YYmeue8JQ+YvDnrWm8E/ZN5MUlJQa49I+g==
X-Received: by 2002:a05:7300:1896:b0:2c5:220c:5670 with SMTP id 5a478bee46e88-30c84b1f43cmr15065972eec.2.1782715523278;
        Sun, 28 Jun 2026 23:45:23 -0700 (PDT)
X-Received: by 2002:a05:7300:1896:b0:2c5:220c:5670 with SMTP id 5a478bee46e88-30c84b1f43cmr15065941eec.2.1782715522739;
        Sun, 28 Jun 2026 23:45:22 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52d669sm43580424eec.11.2026.06.28.23.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:45:22 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:44:37 -0700
Subject: [PATCH v2 3/3] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk on Hawi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-maili-crypto-v2-3-f8ce760f71d6@oss.qualcomm.com>
References: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
In-Reply-To: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715519; l=1048;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=ib5g92loksXZmXiRdLEH7dcCqaG6DfiNxrgUNVm///A=;
 b=73ag5aveZqYbsC6rIKjJX71ZqUJrCDqTTDn7NOXTdHKaBwY26TAzskfb7JnOoatjhLvX/7yA+
 hTus3MTGC4WCM7fqqn4dZxCKrrU0AUgeFCmLPB9CKvg1gsBtrcwDxcg
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: Ryl4CGqTRBCoAvLk5aVhGV94Lcv-ypQK
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a421484 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pbqL9iGvPPrSSTFfp4kA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Ryl4CGqTRBCoAvLk5aVhGV94Lcv-ypQK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX8kYVJBe1I7L+
 8YzEUHZPizX4wG88XsoaAfgxFmxXLELSQzg1fYs0FXAxmzSy0xYygQsudftricwv1jydQnyGUra
 /53pm7DnrzFNjucppdcwdp7CpGYRTkyfEaz3XWIbF0sZBwwTEW7hiQ2lAuMaSYvrVXOycY60vf1
 liHRlWWR0JMVXfNclpWYu5qLDuptvNiLPzNxNBmAqfqS2KGDLQM8gIqWYVZR0Acxk8d8Gw6TBhf
 Gj6O1CUdQ8776Ucra3m5ygBKVk/4HH/KPmozdHo6jsM1+afJOXEvClHdEFdf0KzCoRZ1MyQ5Hfz
 j6yzbnVT2eZwAUODbaZFyCIHo9HAdDycE9NZUskq8ZnfCLxllSdqk2n/1LA12sBTdDnRrh1uONj
 NIVhfNGE6oqtRLEf73e2tCGRZ/Ao5N0grAZ8ncq6aWJJJ0mB/G6dygrUuNtmoVuu8fIuWrdCbum
 J2n4H5ViJfykv/yahEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX9VdGR0+FvIhO
 Xsnma7faRZhvnPt+9bQy8Wdi8v4LbJsOrxg4PMcJ4rdX4hwMbonK2P0G+2k+LuWvSEiQhlEjEUj
 4n4nqjrZmuncqXsej7s0uJoSJ7UKyb4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114855-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B402B6D69F3

Fix the DT bindings for inline-crypto engine to require the UFS_PHY_GDSC
power-domain and iface clock on Qualcomm Hawi platform.

Fixes: d273b258d8d58 ("dt-bindings: crypto: qcom,inline-crypto-engine: Document Hawi ICE")
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index d80f8445393b..a67a4eb88007 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -63,6 +63,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-inline-crypto-engine
+              - qcom,hawi-inline-crypto-engine
               - qcom,maili-inline-crypto-engine
               - qcom,milos-inline-crypto-engine
 

-- 
2.34.1


