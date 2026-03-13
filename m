Return-Path: <linux-arm-msm+bounces-97522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNZFJqoYtGlkgwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:01:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D84284686
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95483304CA7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D151039B941;
	Fri, 13 Mar 2026 13:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kDT/+9YQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jpqh8kOY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29208399340
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410019; cv=none; b=mcRRUMzxs0HegER5KSOaameVtZGZDSPsX6uRWSSAQJzy371xPX1FeGp7A/VnXS0/HBRWLl1d0pkQ0HJTCBRC7mn2RIwQeqNGa+XZw9HUOam228I3OlSHBqMBDH/yPjv4hSuJ31DlVyP/dVUHshwiQzvQE9ZhAjWMG6iFHoRkukI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410019; c=relaxed/simple;
	bh=TrCdImSus03fQxnuCdhKZOvel6k0XW4oA6lvm5eRWDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Tc8ifwJGsvycErFCQDH2yrd8uV/FgU7ow9d2MKxuoVsbCTBXIcTC+LpD0JuTChhWmpFUYvEAa3g7xWeLjEGxZeq92PZOXXVkWDJSGKrozoz1XJhLKFvySAM5DmGFkAbL3YfNaroxH2Bbf+iRtMYbQBWLGInYmNZnpTxR48jKiAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDT/+9YQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jpqh8kOY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9B92w3906341
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xZKRgfOKHQVJGs25wrwwgK
	WUyR1Q+6l/FFjlEiaQ6PI=; b=kDT/+9YQxyZD92JD2tx2W0FVRUp3x2gvZMPdje
	tm3uz+Cx1sSXsD4vJEk3wPOJLgQMbJI1nhvGaqD8/TWDT4+4KK1DYPvHSSkcRnQ0
	/1N0b2XwlKJnPuqKHUcNDK2u0IFAWVcA129V0/9BqeqR1bWvANGwIUvys8iQMcZ0
	HNT2dqtbHym9oNx0b553zxLQI6TQJ8ASwhzY7k/jf6UFmXYcEYEBcj8Xu+dqfHsG
	RHp9g6mpxpkridUhN2/YFsS46c0I8iKavmW184rc8ylYqKE4TePFvaiMLeDsm+3D
	P8uUblrRE1xpsguD8nPs+CFQzkoXs7BMisqtReA29tWvra9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfqs8w2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:53:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cdae902bccso949490485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773410012; x=1774014812; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xZKRgfOKHQVJGs25wrwwgKWUyR1Q+6l/FFjlEiaQ6PI=;
        b=Jpqh8kOYUYEepzKaQyRoBtgLARVPDmMUSll8n9hymg/51fary8xUsluc+jxLMz14jM
         JAuZfI0J00+LNXvaDqin9Y83mydLmnhwGHY913wZ2vAEThP9eLByKDuKCgiMl2GF5yoE
         kli7v/qhl4NYDXXHQG07WTE/DTtyJAHYs4sicKYVPQRzwdBWeoW0uGWHzJU4MRa7Ujci
         JBP9mU6CpJAbkjEj98JBgPdERjWvT6kwKK/P95fiK69ZUdw0LUa1Nv6D46jTxPiXmFNb
         akh38tCYs1LeOVioL2fJVgUDJlKfca0FDVSjog7TTw+y7JueiELokGAYzuIOfnAdIYic
         5MDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773410012; x=1774014812;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZKRgfOKHQVJGs25wrwwgKWUyR1Q+6l/FFjlEiaQ6PI=;
        b=Qtum5g3JdHiC9DhRXK/IygCChVWBfL0L/tSzACoipg6CEZrVgN5nAjgWbcbDI2TsCA
         xGbKXLngEEaSqYA82wLVQuqIpqzPuGnVDJ/Whdu6G+X592Zr8i0pyNPKmvsNLKjpBhP4
         ypbvpCl6LRwme4qyWwRUYQNI9RO/CaNbJjgWOFMHoCwDdjmoXnxHOo6cAIepW/ZNhXwD
         bEowlH8E8tVCz3+VmdEiD9fQ/yYkzFxEupr0eDJyp2+noPVpc3y9MHfBKLSA328WvX9P
         0OxVT/mcdwxDSPOKtgtfytXN05F+Htk/ZwpCxQk8oQ7MDS6FuNja6xIA1yu35XvNx0bB
         wi0g==
X-Gm-Message-State: AOJu0Yz6qKBPfkUhszE8JeT75vJ9ZgpYHc8FeNRsrrLLy8aMgN4SE9mI
	yd3Q+su/d0m7WZ+lOahZewS46vmsI9j+8RmRqalQPdQxPybu7vgiFRUcKaeR/adx++JMGT6wHTb
	AwgctSacsaiA55yIj2BcdYnK4OO+BNWG3OCWNeVdPkLcjC5PK7CNs0jln+8nVlYo9PBgFUP1esS
	NR
X-Gm-Gg: ATEYQzyZS6QYAXhz3A6hf7+PyivQPP7AgwF/TtW6VjLh/9JrRh1TqDlZoTWhV9/CzvW
	moeAfKAhNHBU+pCC9MZJZu0/tkFkt9EBQr+6Mep4UttoX9KS3r+9IIbuvVQVghVE/7duuqRxxS2
	ebqnsbfIh6aQ9rwAiYEDTWBjqlhwlRmYpLq/aoAsb+pFQzms/WOK3g49xZQpYZXni/WsXT/PdtR
	mkzlPr3vCVffJkVME2EHl7RC5L0Zb47hfgQKpUb0hb6oS58itzO5sgTU3APWvsbvySKqfY7yM7e
	LoTWamk1L+i/kt4zWaIftRA88Sy19CmeetaccZOTbIHQQjI4lLzzl8TBIA8rYWjoNPcE9ktlYJI
	jaLHs0FtNaA2+2Po17D8Qa4zakng=
X-Received: by 2002:a05:620a:4095:b0:8cb:5176:ee5 with SMTP id af79cd13be357-8cdb5b71732mr446531085a.62.1773410011574;
        Fri, 13 Mar 2026 06:53:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4095:b0:8cb:5176:ee5 with SMTP id af79cd13be357-8cdb5b71732mr446526685a.62.1773410010974;
        Fri, 13 Mar 2026 06:53:30 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20c0b4sm19515600f8f.25.2026.03.13.06.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:53:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 15:53:22 +0200
Subject: [PATCH v3] arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad
 and touchscreen
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-glymur-dts-crd-enable-kbd-tp-ts-v3-1-66c5ddfee97d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANEWtGkC/42Py27DIBBFf8Vi3YkA2xB7lf+ouuAxTmjjF2CrU
 eR/LzitlEWldoO4aDj3zJ0E9A4DaYs78bi64MYhhfKlIOaihjOCsykTTrmgJW3gfL31iwcbAxh
 vAQelrwgf2kKcID8eqaFGy2NTUZIok8fOfe4Nr2+PHBb9jiZm7PeEx3lJ1fExRrQKCGbsexfbo
 muoUrZjRkhDnrXaYpdiSSrbzOnDj102UzbZ2Qlo2dF0x0bWtF0rkiUuLsTR3/atV7Z3/nvBlQG
 DWmDiStEoKU5jCId5UddsfEjHXrHyJyzjf2N5wnIupUasTC2qX7Dbtn0B8NvVuLEBAAA=
X-Change-ID: 20260309-glymur-dts-crd-enable-kbd-tp-ts-c80c0cb78940
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=5304;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=TrCdImSus03fQxnuCdhKZOvel6k0XW4oA6lvm5eRWDU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBptBbY/ceZJSOjdSurXNa3/pjQ/uEP9VaXbrVd+
 WdYFJHIpt6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabQW2AAKCRAbX0TJAJUV
 VtZ+D/938gX0reEP/1Rc7sQElhRzl6DGV5V/wn6PuUSouMAjdaWlFhDCRoPsZHcx98e/JtCxHTW
 9AgUzrtglgRz77jr77a9CaknbVSqR//c1F8VpYyiXoh5DBFLoNQcHV6/6xVNv3EyPn9mZgy2fB3
 AGSw9EDIcAzSOjORZHnarAY/MYvyfcFeGvAGc9M8h6tWT768cjnXqtYL1Y+UXyH+EqEoHyPXVyw
 D9bBomryQVuEKUn0nJ8k5ehqlAwR+b7HnGZMog5S0TseSYfbPca957rKf/EnQUmYZCnd/4eloBf
 0rIuW7F1rxzqgRWRZ9cIIeivozU96SAgQIDvUOGyAko8dA/Dt8rvmDdGqIdlGfY3Jpzk2rO2R3g
 nsBOq4K3+aG7l7olbmlC9wbP/B4KYm0Jlz6Pkji1s9lhA04wr4XEpL47ao+cVvNWSiJiOLyMYdX
 vpZBPQoXK8sMmg2nveEh67b0m54/heP8h6tbF9/CbvvGkBNQghqHzwCr22BekR0XgWiqYoJabtx
 9tupV77DIoImTWToOHrpw9TwtjZVe9GaNiEQOwqSDob7tSUgYJyN8w7Vj1Y8TqAZKCxyojwsf8H
 ZkAUKRo+qZWEpLHGQthZ6/xJ0BV1vvfx1GLKnDuyvWYRUtnU98MGv8qK/yRFD0LDb44FpqZjRyI
 gkefSGXjng6BEDA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 55GpKE9UjUAA5P1oGg1a4Z5gUvPLEWKK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExMCBTYWx0ZWRfX8da3JwUYNg0s
 //DKsZOuvMZlufl9J9WaddS4EWN/tjmIP+Xa0Ei7AtAgHhHFuYtPC7KBONtGOVJweGFH2mrR+r2
 9Cp2y3+0F5YlcvRXFLr/Lbwp1KWpvfdrzj26aMLsIQGFp3Dr94Kw0QdPd3u8oAFzIEl7tJKNU4n
 dAiJFY8ipZgLQcDLT4Ttxg9i3SiK72MkfRf86+Nrr3BHenphcbl+0Aw66VAwMvS/I7+Fd3snnwy
 f+BIq9FYmBnE1Df5A5pxmFha7w7tkmO3punrEtDjYkUewHZEi9cckiupwfIg4GMRNGi7K7DO01U
 FH415MP5TcvCg4NQdPh/fdISSpCwG9JjEOzlBChMLKEeP6y07YeVx2531WrTCpv59ZisYD/1xTP
 ON2co4iLpvIVOx6RFB3gIApDa835So5qZA0zEMB6oi1xjU8NngohtnSG3bCjOTuxcPmBSktAM4O
 x9Qka0zWANz8EEUrcaw==
X-Proofpoint-GUID: 55GpKE9UjUAA5P1oGg1a4Z5gUvPLEWKK
X-Authority-Analysis: v=2.4 cv=GoNPO01C c=1 sm=1 tr=0 ts=69b416dc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=-RH2vHZGa4pziAc3uSgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130110
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-97522-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,3a:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.38:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 23D84284686
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On CRD, the keyboard, trackpad and touchscreen are connected over I2C
and all share a 3.3V regulator.

So describe the regulator and each input device along with their
pinctrl states.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Picked up Dmitry's and Konrad's R-b tags.
- Drop the output-high and add bias-disable to the reset pin of the
  touchscreen default state.
- Link to v2: https://patch.msgid.link/20260312-glymur-dts-crd-enable-kbd-tp-ts-v2-1-2277bee4c564@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260311
- Re-ordered pinctrl properties in vreg_misc_3p3, as Konrad suggested.
- Dropped next level dependency patchset.
- Link to v1: https://patch.msgid.link/20260309-glymur-dts-crd-enable-kbd-tp-ts-v1-1-56e03f769a76@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 117 ++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 38cdcf662ba7..5089ff7cdca3 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -13,6 +13,8 @@
 #include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
 #include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
 
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
 / {
 	model = "Qualcomm Technologies, Inc. Glymur CRD";
 	compatible = "qcom,glymur-crd", "qcom,glymur";
@@ -139,6 +141,23 @@ vreg_edp_3p3: regulator-edp-3p3 {
 		regulator-boot-on;
 	};
 
+	vreg_misc_3p3: regulator-misc-3p3 {
+		 compatible = "regulator-fixed";
+
+		regulator-name = "VREG_MISC_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmh0110_f_e0_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&misc_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -446,6 +465,64 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		reg = <0x3a>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&kybd_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "hid-over-i2c";
+		reg = <0x38>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&ts0_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &i2c5 {
 	clock-frequency = <400000>;
 
@@ -626,6 +703,19 @@ key_vol_up_default: key-vol-up-default-state {
 	};
 };
 
+&pmh0110_f_e0_gpios {
+	misc_3p3_reg_en: misc-3p3-reg-en-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-disable;
+		input-disable;
+		output-enable;
+		drive-push-pull;
+		power-source = <1>; /* 1.8 V */
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+	};
+};
+
 &pmk8850_rtc {
 	qcom,no-alarm;
 };
@@ -664,6 +754,33 @@ edp_reg_en: edp-reg-en-state {
 		bias-disable;
 	};
 
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-disable;
+	};
+
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
+	ts0_default: ts0-default-state {
+		int-n-pins {
+			pins = "gpio51";
+			function = "gpio";
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio48";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";

---
base-commit: f90aadf1c67c8b4969d1e5e6d4fd7227adb6e4d7
change-id: 20260309-glymur-dts-crd-enable-kbd-tp-ts-c80c0cb78940
prerequisite-change-id: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750:v4
prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
prerequisite-patch-id: d986d8d948eaf7b80028b2244750dc7aff7de307
prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
prerequisite-patch-id: 8d9e016b49979fa817cf9eab70b809fdb9d4656f
prerequisite-patch-id: 6a291fd702870ca28d64439313d498593996b741
prerequisite-patch-id: c96958ab5c5605fb9577645ac5bfe5912cdfebfe
prerequisite-patch-id: bfa283218723a48e54fcd842484b004c877339b7
prerequisite-patch-id: 346f2db0933c551a039f63b945f989a5c8320657
prerequisite-patch-id: 919020405b70d588fa4356a5cbfb44e67006102e

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


