Return-Path: <linux-arm-msm+bounces-103411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH++Oo/f4GkEnAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:09:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C4040E860
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6075830E9D67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878DA3BAD90;
	Thu, 16 Apr 2026 13:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T6l/I7Kx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/tRKPuh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACEC3B9DA7
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776344860; cv=none; b=O1OECRwMZzz/XBvCtxciPh/QhbuKuPW1S7GJGcaLQAmNST8mxiW4AkZ2sw/Ib70NCtV6ifde7HRntLrPcPf8AtbOywIzrgQxQ8nh9jti+UCD1esFV6FuX+6yvPjG4OGcrFS561JlpgWu2uu6pMYNawd82GkgTmcGvgPlJCD2KA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776344860; c=relaxed/simple;
	bh=USGFQFEcD+gM/P5SRp/QkgAxj/RMUfNX49cvi6cpEO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Unk7/z9jrnqUmvcFky+xF8BeP04IJ6LSIDr8qe60xJ+8SOuLwG403PGh1ivRqXwMy7NoBP4srpnwntFyjzBESKMwtGyZ+QvGp0J++CSEtVRsECxHvZIx553vsB5L1RyL+HVOL2RJaUUqK2cYnal4dCxcQyOGizH4HS7t3+NztRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T6l/I7Kx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/tRKPuh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GD7FnD218777
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mOZA+vF6va/I+AEeOlV4JLF6hxgg41sdBF1yn1WdweU=; b=T6l/I7KxbbjBD3+6
	zTISIER1ejwJfGUXtjwMW68sFZL7XQBklt7VHxyjr2/UdXUS6E7z0280QsWLcYHg
	kWr1F0h88sy3sjwN4f4/0WZT0EGPJ56ZluxsK5YW0E45r+3POczgBvQi4LQe3HiK
	05yPBB5JgXFCnHCUTSf8acCs9k3lWZ13JwINvsWHZkJxKhtENVQLxMKZGz0pA6vY
	vJoFgVB/q2Zl0IkzlFRno8Dz/K8XLj8fW3u4B5VRpqttVZyYkMqa6t9l9jqAhz3l
	f5VNvkcPB0YMsS2nKB6PG4fCgcku6NvD6eFgWX/+Ke46sVIN8ZFg6qz9X7NEJX1E
	7qbn1Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtuyha54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:07:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f85179263so81052b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776344856; x=1776949656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOZA+vF6va/I+AEeOlV4JLF6hxgg41sdBF1yn1WdweU=;
        b=T/tRKPuhWWGdMzbR2JFH4Imtjt8AHYZXc5Z1k4+4k4+t9eGxD1P+5bBijy9Irko4mN
         ZMDN4hINjIacG6hodBVKX9UAI1bBGZao/brH3c88YsskjFRl0gkuNrqMfEH5XjwdpIX0
         hUhILLM06ZTVGJJXy8+Mf7iZgfkaYMFeSFWulaVmbEpjwUG00+c24S5iHdTuKSHZJf/b
         LWkP6ZSOP5MUmpjMFGRfME5j0FcrKHEkTIawnpz2RCYtRdl4nGwoAZqUfWnyW+ShiD82
         lkLuhUXXTT8YdtOglUmFs0mTvtcJ+K7qWKnKUY5jAxMI1flBGlC9YwP3hlY6Aa09WrhY
         znnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776344856; x=1776949656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mOZA+vF6va/I+AEeOlV4JLF6hxgg41sdBF1yn1WdweU=;
        b=oKldgUF0GoHywKodrPImvgl3AwikglkXOQHl6cbvwtCd/e7Aya2eUBjGs1uxzQsIPL
         TaxGz+AEiR9wcMzoTgAJxveoD3PrzJw1coA20bvg9AifBrLq8wd7s9LvZCGWHOyT5rwb
         4wo56HTueMXA5AHbQT+3hRTePijziev6GzkaMytOzmRk6qmK0EMG85dlZ4B82LEpKaeD
         jIZ7Q/HORl+QtfDe848k0MNxTcPKBBGN0gR00Vd8/oHFt+SCAGzfW9TcytSRXnE7Lpd0
         mHOOm51CGT18UuwixLTwpxDZ+DS19MVN+/aVmYNeH5+I9zLSA+t0G0Ec2yhdwXakzJAG
         lNuw==
X-Forwarded-Encrypted: i=1; AFNElJ91MUgFuF2VoR6xBiIQt/qM5RqunJQjNSSuDYDzbHG6F1YJ4v6WEjSgwYKQfEiXMBsesYOF28x8TC+ImG23@vger.kernel.org
X-Gm-Message-State: AOJu0YwKcYuydETCsxryqDJ+mwnklF7g8ZC64GEh4I4iGqZtEFHYSFQP
	FQRQ0rkZENhC9MO9O0BLmk+ndk3VhwUF8Uv3ARE2lu16HunwSaC0z+khniTnb2b3uKqPd6gac3T
	2bC+p5MDqRCE8b7RQy9dtXvLa905CPF/XN3NvcMoixH4C57Fcpa7qqZrv8YKSW/QK4Q5VLXPKgB
	5Y
X-Gm-Gg: AeBDieuQH0NCLBxtSSFnvsbwEgh2+jVHrB06CHnkaX7SOfZNLkEmiXkzIf+AnA1fEGj
	B32/MGesUaVrwONRbKZUOfZTgwATh2b0Z6wMQYNQsApgh4tMlbO3/XMpYB2ykvf5N9j9+4BAJBK
	PwPGh9LQ7/kzD0XBd+CkC3yeMo/zek1KtztSotOJnykBRzaisvnwRLIpqTEUA5RHlJ7fBTV5om1
	iUuD8UlEyvICvCCCB9V3vgegrsz3BY3YZkZwFUDhySk78XZ98G48FbC1Q4sysUvaHC2k42dsL44
	OYZ1WozmFq7Q4HWeS1Ce2R+tk9l9E0+FueHMC7xWo/xHQan6wy5/NIxUo1agRq1X3M7NjugfomR
	2ugdcZEwX4u1PjS+X3Zy0/t1vTndpdN5CFTRgm+hCjqsk9EskPS1wuh7zew==
X-Received: by 2002:a05:6a00:12e6:b0:824:93df:6d86 with SMTP id d2e1a72fcca58-82f0c2f0ee0mr26109463b3a.50.1776344856210;
        Thu, 16 Apr 2026 06:07:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:12e6:b0:824:93df:6d86 with SMTP id d2e1a72fcca58-82f0c2f0ee0mr26109419b3a.50.1776344855683;
        Thu, 16 Apr 2026 06:07:35 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f67449c3asm5383605b3a.53.2026.04.16.06.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:07:35 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 18:37:20 +0530
Subject: [PATCH 1/2] dt-bindings: crypto: qcom-qce: Document the Glymur
 crypto engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-glymur_crypto_enablement-v1-1-75e768c1417c@oss.qualcomm.com>
References: <20260416-glymur_crypto_enablement-v1-0-75e768c1417c@oss.qualcomm.com>
In-Reply-To: <20260416-glymur_crypto_enablement-v1-0-75e768c1417c@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776344844; l=729;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=USGFQFEcD+gM/P5SRp/QkgAxj/RMUfNX49cvi6cpEO8=;
 b=fJHQy+prvGjyHkO/FeFBFrx1rsdpxTFO3eWBG9sFWYDOZqVw3suXUQBeXBQBUy7kYT/Qp7UV+
 7l2aKMzjp3/A87xQtGtPVIQYu/8Eh1z+mYPVeKF3g8VN2iojaTPi2AH
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyNSBTYWx0ZWRfX0Q6+3bd5ch91
 xpceiQE4gOVADXToFIp5ddJHD5H93hYW7EAybFwb2FuUZo1Yitueh8l3vIUKIxd3iOSHwSYR47f
 GWWL+UnjoWvn3SiIg0DieeeyrfVNHt6jgAaHrR/n046pnQ/d1uLpdiJXCFqqwtN0sCHQ4/jzlNl
 r0tuJQOwiJOp2LVIk7q3OYml5eYOz4NWsRow5U2BBnbTjrCBD4Wy/wMqeQgJp0uPN1NApc68Zxq
 u1I3zbm2lif5XHRwK34WdCXOYID9PdyaddWlS33UvMYv8t87zxejj+GlBBYT20dQIU17DzzRQau
 whYkg51vwNnfu6vYEtD2+qPML/3g7w1ywv8Eews5H7dzGOuEysc9Xwaotza+1eG0me5TA/UYeeg
 AE7eXEVyA7XkBZV+5FvgYFolfIaXakqb9xIRGgOjkbj3KqS6SMFYxAYJNgTxqL16rOYM1SPRovw
 5SaHA5grlxeImOrtqLw==
X-Proofpoint-ORIG-GUID: PMvQ2xu6JlcZBJHqgyfIMagtrAMzq1UG
X-Authority-Analysis: v=2.4 cv=Ipgutr/g c=1 sm=1 tr=0 ts=69e0df19 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VuEBvGUfxVmeJGK4P-sA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: PMvQ2xu6JlcZBJHqgyfIMagtrAMzq1UG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160125
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103411-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57C4040E860
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the crypto engine on Glymur platform.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 79d5be2548bc..0b62271f8bfe 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -45,6 +45,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,glymur-qce
               - qcom,kaanapali-qce
               - qcom,qcs615-qce
               - qcom,qcs8300-qce

-- 
2.34.1


