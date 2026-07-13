Return-Path: <linux-arm-msm+bounces-118678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HfJDGHGfVGpxoQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:18:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD72748940
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:18:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a9mlEDSR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L9SssQgy;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118678-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118678-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F9B8300BB86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9CE3ACA40;
	Mon, 13 Jul 2026 08:17:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A433AEF3B
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:17:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930637; cv=none; b=QYRbQXMJffA0mykOkUoRTHxARClp4SbU/Aqp0wWdwnY+VjybLpkq0hAhBTdXfgW5aAH7NwRYnm8bYbWq02CNs/uiASJwtLFr33AsN+0ZfAqYJMfejTu0yvUwUq5AE51dosFWe7gkppy6uGD1Nx30gVtIqu72YprHdSdHnKDFbjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930637; c=relaxed/simple;
	bh=jcihse7XknEeHdBahZIOmT1iE81AjYNGrMrlfd6oH1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oMZMy0dWxdm5qby8O68A1TtMr7q8IesAMXj2IPDkevp2LTZYzZmVSijXvrOpEw3FACLdzogWW5wIi6mhXbIsOVHCe+os4Ty5ZXj2fX1RuE43E6w7kwlXgaVnQXiPW2oIBCG97YJCdGFYIoQqW2cOzO7BLfn2Ngjz062H/FH2XZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a9mlEDSR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9SssQgy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7YmTm794265
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3E9wnYtQkQUVdlCALiZYvZk0M2bJge/N2ttVKzg1N0s=; b=a9mlEDSRik9plQR3
	9Klj4DEoBPqTfLiVx4TYQDKtZNknYkcQVFOHQK1vpZXa1UzpNWHx6BrHttuLO3gU
	b4PloGw4orUz/eOAyvmYmDwddpEDgYyBnpodOLyTzHE2UA6S3KpGWWLDP0xJCiQG
	BQsgo9vlSxCfjXCsYDHtlKVjtM2kuFfhIUCt/57suVQIP+WvJbaoMPB/WJwX2+57
	mfjHsREb2R3aTIp3INuCVzoNizVWrtO8hnBzBk2R2qgyu5HBF3/ZnkhX6Frb9YaO
	CJJCfMAgcDo6nuIGSloy/8Ays58QjwPWJv8YMLoTLwIqheoiqAN1YwbzIlZcYG0T
	ni5eaA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn04ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:17:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8482fd61e83so5874523b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 01:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930634; x=1784535434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3E9wnYtQkQUVdlCALiZYvZk0M2bJge/N2ttVKzg1N0s=;
        b=L9SssQgy+0kn8rZYM0kur2DR9cVZstfuKVkQR8oZRLGJ+Z4baEMTPowzwQN41pnXvm
         zBR0G/3a5HIbNdq3ZhQP4n25owiZ392G1nThIjYYU3UJv3ByLsGuJdkqw1k2G0/2D8+C
         ANp1IjAUX/aS052fwrypdeaUkvMHy+Muyo/qFCQR9xMwjnbcly0rOTbJgYy9sb46sQ/3
         IzNFCejb6kg7JfOnUaRTcMvgDynGeAE+Za0anmM2HzXMf1by1DeYJIVzyy786hdseVi0
         krYj59qjwIjaEiIfQ3/MpilATzVRFWCP+qrJh9uD/tek85A8tTXQ1cuIY2RMmoZU4puX
         GbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930634; x=1784535434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3E9wnYtQkQUVdlCALiZYvZk0M2bJge/N2ttVKzg1N0s=;
        b=jVqx57tfJAasU+h8P+uaaVVWE/lG2GnUN6utbIBrtXHkkMgadXLpE484AxZaBlhaGB
         6OGDDgCVAbbvC7chIY3Edr2CVw++v6Kh9wDVfMaCt+y0HxwEazrMzv3bFfX3HzlEyBcN
         VTPiOWXEbfU5/FhbYsLTv/sDqYEZrVrDPVnlB78Ev+UZ18C+rlVtSqF1ZojGBKaIuHaL
         F1oKWjOfUEgJ7qcBSMjAGEnc92D8t8du4J03bvOCxeQEltghlePs4hdN9gJwvcYv/qpA
         L7uM++C5EoH1+bKK2kWo4WjC15MOWW/CRwoPdfXsMWJKiUzXrjgYQlthkZl+GuVn5Lxj
         wtBg==
X-Gm-Message-State: AOJu0Yzwnllvs0MzzxtfRlU++/lB5JskslRkHs+stHtNKCLUT6vyWJbp
	KKZzAAs8edsNYzS4P0bmm80yrEQX7g8hUX80ZCetD/xjo3JIunx+SMe4I/yd7uOsDIVKbp4dKl8
	L6ey5qmzQKz/e9lDTu5kt8wWU6/FWImsC6ezQe3unwxVR5ZMNGxSYF4b69n7bCnC3mFGl
X-Gm-Gg: AfdE7ckFou8tgtU4XOpyszg7elIM7TN0xj4tDEEvJ15bsr/DeTu6jzoq5Otf6Nd7ivG
	FT5oLqtqNGIex2D/EiyWqgyuX/iKcwWqIpjfiZsyvrnxszeApi4MIYhI2Es/lMp+ZrjOqUkUzOT
	dN9DmOkSVBgBaELec8eqRWEFYjpX1S8tFTeDxqFebHFdNAS5YDA4ZtFgj88vhBlE+S2GHN7xWkK
	4OnFi4R57dXc/PzndLCsQr6sX1ian1zlDhzPA7X5+ABZS6MN7aBeMIJCzkDDEw+0+Kq4r6edrG4
	9D+e+5DipacwVc1H6mIMjsplYyg9gYdQm9bYEUBCtc16Rs2Au6s5fILY8nqGqBs5Imq7gO+ee4k
	JWfI82HXdCqb9X19ypvhLnmQF1T76/XrN8nH46j4+
X-Received: by 2002:a05:6a00:230a:b0:847:9367:e054 with SMTP id d2e1a72fcca58-8488976fd39mr6896238b3a.57.1783930634498;
        Mon, 13 Jul 2026 01:17:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:230a:b0:847:9367:e054 with SMTP id d2e1a72fcca58-8488976fd39mr6896208b3a.57.1783930633998;
        Mon, 13 Jul 2026 01:17:13 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca79aff904dsm6283954a12.6.2026.07.13.01.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:17:13 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:46:54 +0530
Subject: [PATCH v3 1/3] dt-bindings: soc: qcom: stats: Add compatible for
 Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra_stats-v3-1-4be17121729d@oss.qualcomm.com>
References: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
In-Reply-To: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783930626; l=1073;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=jcihse7XknEeHdBahZIOmT1iE81AjYNGrMrlfd6oH1A=;
 b=7jbz6NAlnIoVq22AYyzn7HPIw9lwBkkGm1ytbi12FTx92EOSqLamP6V4ue/8+LPNWwdAvx0Qa
 28tBx6T7eBDAZvmneS8MnT+pe/9uIQdZeoogfqjFDVkIcV10lYXRwQt
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: _VS0Fn0GTpzoE1kapCkWIu9WD8a__48l
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a549f0b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ejYHyDfMZPm78Zg7qAUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfX7dbmVW0v42Fc
 Z6EzwZVdBfukyCGAqwz9Apn5xoigH3iitO6O6vQRi+wl7xIeLneb1ZRTXPodep+2aHKNeTXK5k1
 rKhWl5rHBLoq3hBexwClQJZxuYycBaY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfX/N2QXKPuWJVd
 gsR1gXA8por0AFhSPUlFv/2GEmSCc1dzy7R/j1F2Oulh+lZ0KY92u+Hjt6u5fjzuTCIi4a5iIkH
 KkE8FqjpYu5IOJXhYNpZeHuA0twiKsPnolQBES07L802wQFCyjbEnBmjV6TWPrG0Z2yVe0wgZlZ
 BVlqz8zaQKbuuYOfteCZw1ro4iTkqgihVVvf9m5ihg24MGuKQYcjbI9g5ze8gPTDmru6SiYO72c
 4D5+o1UaRuA5RYgBCity8eYLLys2r0i8LzdfArDmpbMRsV19YMCO4szKyog7JmOLjBd7pVoUty3
 8fGLsdeGa8sfHeGoL4DFm4Ven3m0Lfm0hAg6npCGY7AWqL66qYyi/Aa9+Wp0vsUCBoN8unxlHkJ
 q7LgP7Av2Ewgfb/qakYkiXf3zyBLlFQApdJe4GIfXfSSAWmbyqLShTICWQAhoIJf/MiEBmFE4JZ
 nvLdeHMMLhf45fm5SVw==
X-Proofpoint-GUID: _VS0Fn0GTpzoE1kapCkWIu9WD8a__48l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118678-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0AD72748940

SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are present
in SMEM for Shikra.

A generic "qcom,rpm-stats" compatible only reads SoC LPM stats
like vmin and vlow.

Document shikra rpm compatible to read subsystem LPM stats too
along with SoC LPM stats.

Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
index 686a7ef2f48af11a0e63904ff979e40d7538de65..43751115c5b4e2943c93d37d3e27c839b4057529 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
@@ -27,6 +27,7 @@ properties:
       - qcom,msm8226-rpm-stats
       - qcom,msm8916-rpm-stats
       - qcom,msm8974-rpm-stats
+      - qcom,shikra-rpm-stats
 
   reg:
     maxItems: 1

-- 
2.34.1


