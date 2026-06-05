Return-Path: <linux-arm-msm+bounces-111314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IHyTLSVkImpHWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 07:52:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E8D6454DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 07:52:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="b/DgsCUB";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Dydbz47r;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111314-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111314-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72559307C61F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 05:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077E23FE376;
	Fri,  5 Jun 2026 05:45:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48833F6C48
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 05:45:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780638353; cv=none; b=fL2VsCrRKfy6Pb9uO9m948/oZbBoHFu4BFiV5n35dXAwJpZkdh+WMb2jjBd7QaDa/+SeXOe6mk0sYJPaCyc0q6WtjLdfmdCSkb+iSGAuZOqtHV0NlDm6mjf/RBxJqlpbjtAcH2GpDztEqIiWSkCJmdJ/4f656cCTHoLNk/KFWRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780638353; c=relaxed/simple;
	bh=Tva/THzHBTqT2ONF1mJDs2pzgPcet8fzDuKUep33HZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=neou2IufzcNPSXQokBKgNGeFeqWjTENGGYa7rwbpvEfgFBMdd50ytTbCKJJAR/Zk8BuwIVZ+JPT4SPbvO3E17uD5il5+MGe12B3aVLrUj5FaoIuptl8oqUK7RkA2XfiiWW3x6pv5aRiwnqbN9+PwJIdGg/jtNCSkyYDG9/fU/CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/DgsCUB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dydbz47r; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654JnwBw3111646
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 05:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J+gMWLEMj8dIYBFuFbm1S4Zeb9oR0rkjHmKZnsKAxvI=; b=b/DgsCUBdXv+I1j2
	v5kZaz79NTF7WWVQJ+LrTLAbb8Hv4mJhR7wQKA4juevX2IuJ8g29GZSilCSi28ZN
	o/Dh1XKw0VCB6a31mThd2RPX3FZlYkSnU/3GavpSBMqQyFRvRibTph9XYHex3weL
	HUgatdHy9VSIHt10P96xll5733oXwScXH0Ylu3OWoDs7ycYc9Y70NPXML7Ws1KzN
	lVoDUJGkxovD7T1G06yetSzVqI28YJIMeybeYBCMvOjIAI2QE1zn+4+cGkukwv8M
	NykZ4OJwFSiq0HV0neyYW95uMyWGDqQ3jAtPytMG99Fr7YoTaEjZp1r4p/LJHFTE
	qGBopQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekfv71x1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 05:45:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3075fa5a407so4906105eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 22:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780638352; x=1781243152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+gMWLEMj8dIYBFuFbm1S4Zeb9oR0rkjHmKZnsKAxvI=;
        b=Dydbz47r5YIcDgrGDHsV+zsFjUkamJjMGciX0PMNrOYl2qCIl28InsqC5f2istoom/
         TTaQATsVdEVpLSfcidqDkeudRBw6sMwrwfXNBN6KpNhqNexiFwNfPJKqkb2UX86dbRuP
         dHdJ/ahBPQvZRxlyPCoSrmvsi2m1bPXkR14ZyPdmyx97xkDEZbtSIdLfEb7yEsMP8f41
         HuD7u1f0xI0137Wayunjg1Qts/d87UOWBYsbxUP9Yx+MUo8StjUZreFTjye/1l/S8whr
         64UGSeo1WsUrWSSMjIesZRzxXaSxaqVx2L1H/Gby6K4AiIX17dih7SQW/ALJOFkX24Il
         qUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780638352; x=1781243152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J+gMWLEMj8dIYBFuFbm1S4Zeb9oR0rkjHmKZnsKAxvI=;
        b=DMz8MPytWkjAYVoi2nDDrBK8q5vY+eZyThgzbIIYyc8l8ab9PeRYnPG19VeEQzcijH
         EdblvDVd0sC46T4pe5ZltEo6BZu8yrt+7bn8ih2RZNpxXdeQkxmJtvTK/3o1falUlU3C
         lDWEVJRW5aCOiV2Z/1ivAd31Tbj081aHS/0y+CVH8IHgmPf4YUbOg10cdBKgpJVjj2oN
         Eduvjy2ujqeLi02tY8Q+F6SsUTmpQJYnUJ+Fahqm7kBrr163LogA6a5rJhH9A+QXuz0T
         SZwSUCOrL6p+vMjmzqAMHpZn0mDpO29P5OmNrdgo9G+FUACIGC98QlJJKXP4b9GjgOsB
         oX1g==
X-Forwarded-Encrypted: i=1; AFNElJ8Dorm47AvqZ8dxNoXw1ivnwe9gGQ+VZ76i2mT9mjIwrkWvkRUN2klU2Ok/rMxdy6E1IMt+sGcku3CKsGrK@vger.kernel.org
X-Gm-Message-State: AOJu0YzbphOa6o5aQHZ5MXiG9IQzRQQVzssr3yeAGKZMi/Y/CB9YqeeW
	TjW6Hx1z7/10K4SccbASVFqTgSV83wHadTRE1xhWlvTBxw80yYzQYqL2DQBtw1F+IJX8+QMcro8
	2o0NyLxZaq+/NhnQJVI1XDlSjIia1p5vLIVdUi2TG/wcDer5TtAadCV958igSAbE2rkpl
X-Gm-Gg: Acq92OFgdqWffZZhA6Yl4eluVNGW720tCCgtgMGFyCLMC6bIdk3JJ/M3Voh7he3YSu/
	KE5JRxd3xwH+BQ81SgSV2b/j3n1ndnSNgRWkQW/jKA91FjkkgYODxgjN7bSEMlnhhUYzF9iZd5o
	qbJB0RjSQp+E0ugZ7jOjVq7TpaP77P9PLRmTHebD1HzT5bSTJLtvVN1U8ch5WJktHcphiF2rgHp
	uCi5i131LhIEU/5bowoH3qlpfkFKRts4NT3QQ8XN80Chd+97MzayZvHIRZMvq74iB1di35I5ncb
	krv0O9Ues5T5++qhlIMgQ7Ze+yRcbXbBuLS5ls9u4tQbYLOUPoAWZKt72iLzr5KerwBId+Uo7ba
	AHp63hIlvREWQnK33wA9qn0M4UhiWQDp/JygV0vIPK/z63Pt7cZYQdfxNsDD4Z4nlZdcWr/UiTj
	u30iXCqT8=
X-Received: by 2002:a05:7300:f193:b0:304:d8cb:8413 with SMTP id 5a478bee46e88-3077b7c60bemr922934eec.24.1780638351592;
        Thu, 04 Jun 2026 22:45:51 -0700 (PDT)
X-Received: by 2002:a05:7300:f193:b0:304:d8cb:8413 with SMTP id 5a478bee46e88-3077b7c60bemr922913eec.24.1780638351092;
        Thu, 04 Jun 2026 22:45:51 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm9480955eec.5.2026.06.04.22.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 22:45:50 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 22:45:44 -0700
Subject: [PATCH v2 1/3] dt-bindings: firmware: qcom,scm: Document SCM on
 Maili SOC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-maili-soc-binding-v2-1-21b5e9bd1aa5@oss.qualcomm.com>
References: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
In-Reply-To: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780638348; l=1059;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Tva/THzHBTqT2ONF1mJDs2pzgPcet8fzDuKUep33HZE=;
 b=NNIxbmnyRBCS8OoVeR3G46l9aY6s7cmMGPZboc557Bv30diZv4Ywo6M/+AMcQpxJKpJc8QvPw
 PQh9ZZB+92ZCihTeaOHtLJ7iIQnEQNKpwCgXDzxLK0QVQ/0e8gv8jUW
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: FK4SfVc-AEwtDDpHfeNALI51uCJt9o4f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA1MiBTYWx0ZWRfX/+CgnytCw4k4
 3FsTSCcJi2foj/8QiTEu+QcwqLmItA5b3pB8ZpD9IkCgToUEbQBe89OQiC+3T0C4LQfuCXVXa+j
 V5TlAF6KH5mjHhHa15wwE8R9xO2ODYg9AgR6CsTFT4UWe/u9ZGcLgj6Kfl6U9coYYzdvK+shzUq
 Pz1VL5HrAhM3TBud9Vvx/pmo4SHquCLF/JP+DaN9orkNuVMpQUvZgfbuAGTCm3vORcl2BjBlziE
 skzfmuQrrNyXOf9dcM42uI3RrPI6H+gEB8+pV2+Xhs4Fl74D62lYu7bCk7pEqEK3MhynHIZpDLx
 19fivyDFiYrsJ6yDvW+WOg1lL3+l4tTGnK+gGfKrIQtvxkxzRXSpKiZLk0TzHkcVPD+u1pHtRnI
 MY6KwTXNY9mnHQiZ5vD6lWbjYlu7NomJFWa1/b1VDJuYml8PUlbkrNcjEXorX9UR477sDDna2GT
 /fBygO6Z4/9Ld2lbj6Q==
X-Authority-Analysis: v=2.4 cv=JNULdcKb c=1 sm=1 tr=0 ts=6a226290 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ffYJIid-Q94gFHaen9MA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: FK4SfVc-AEwtDDpHfeNALI51uCJt9o4f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050052
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111314-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26E8D6454DA

Document SCM compatible for the Qualcomm Maili SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 25f62bacbc91..f344d1390b1b 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos
           - qcom,scm-msm8226
@@ -212,6 +213,7 @@ allOf:
                 - qcom,scm-eliza
                 - qcom,scm-hawi
                 - qcom,scm-kaanapali
+                - qcom,scm-maili
                 - qcom,scm-milos
                 - qcom,scm-sm8450
                 - qcom,scm-sm8550

-- 
2.34.1


