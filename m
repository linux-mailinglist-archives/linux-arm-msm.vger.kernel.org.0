Return-Path: <linux-arm-msm+bounces-118170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JdyQO8+TUGqQ1wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:40:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CCE737C4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:40:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fy163lwy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="HtJ//J/D";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118170-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118170-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F197C3025147
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 06:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0BE3B42E5;
	Fri, 10 Jul 2026 06:39:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F5F3B2D1F
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:39:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665595; cv=none; b=V31JiEoiT/g6nIXYQDDAztyC41HuzJFy05oFyst6ItUE3jtkkOapbzQwOk/8OKNAA0zWZBZWoWESK8Gn6d2Ajk5U4zAXglJUHQaokakVUXtgcuhcOdhnN7m/inx7FNA4ei4r9EYlARk3tWnGm3lbqYoK0PuftfMsVG7DjvCGTfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665595; c=relaxed/simple;
	bh=uIKuN2DhESGYYTSnWLEE+bvH28nd60e+rRXXW3rLDZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IDzmkBBOpl9i+TUoTl92vSf4BEmJRjhcJ1HyXz0+f+rdA1wGihDS8SH+kxDnFpgTjrxoeB1La8MNwcQslv8/36U1EWKqgSVSg8ym+R4NT/vlQ7WI33B+RVlJVDcDb35OVaBnyIp9+CfmWezkKoSVNk0U7yp2tisUs89rzpILhIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fy163lwy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HtJ//J/D; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3moh33629759
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tpTDJUt/VZMP2HnF71tbN+Re+WLiYWZrbfb4/qMHWNc=; b=fy163lwy+GS4k5xh
	bYymREjX7aaH5R37PxuPYMS+/Ki/jtCWFJ6AIo7y5vP71DOZ8i/eJRe9ot/bqHcW
	a8xdeu7YpFkaYAK7lSjvIvvYmct/a06PaeRsf5bOOuzCc1CvRE1esHq+21IOUMN1
	z3EZvzAZsu5kcgJbjU5eXYVhPDDin1DKG12BisJH1UNw1Y8irRA0DRntVc2wGII9
	devdoLZFCCHCtS58uK/7V7lzhBijIvN6ZNn2xFyzXEhu1dAUbgngoIV1uR6GWPPN
	V6+57SAZkIIUdt9XD+buvfqWadEzNo3tNeMaqNTYScZUizpF3tnO7/jcQliImxAp
	TuKBFA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8j0f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:39:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so960680a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 23:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783665592; x=1784270392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpTDJUt/VZMP2HnF71tbN+Re+WLiYWZrbfb4/qMHWNc=;
        b=HtJ//J/DCPvMyog7Lwg/4NDAH6TMuUpfwMQrOP1Bo8mKdarxUnxzCM01TzWQdCHhcQ
         sngLA4L772sRlXRn1WKx1cYt948WpzaGoUrmdfqTqlT6l5+0Jj2GRArMO2oR9VAOlT90
         yrO8Rlo6wyXDvtbsPXZJvDqfjvvNk4OlAN19D84y1D2/hQ+O1oTznQjO5fUjl57SKxC6
         ho9fkDLIyFmKEwWTWP81dOFQXjmUHoNHiZOPQCJXcfY8KkfkgTgnSXGDO82dm9N4o3XO
         9tKXgaHpRXucQgpFNc2pWDB6JpxdpRfFJIj2yXbhNLMxPpwEPYrYMuFnKTGQb2MJW5y2
         dyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665592; x=1784270392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpTDJUt/VZMP2HnF71tbN+Re+WLiYWZrbfb4/qMHWNc=;
        b=n/12lgUu+1b4k4Ly+pXDMCyK9HgAJypf2JAIxP4T8+dONzzhXa9bskwbgP1Ua566ru
         gwgH+TV4gkztfvEUnmscwy4C/BCnEfyILE61o4gQo0Q64fA6jlKag7/j/I8Im/0Zg8GR
         V+SvuVpRg5OzMgZOMVVNg+dKTswdmyUIbFVoWUxHJP3g4NmdOv8Gu7QTEnEcZ0tGPtd/
         8+2FuounMwZF6ntd4EP6sdB9f7cQ36+1hmsj2R7iz7nYbxnNQ+V+A/eGBDfYM4zMgT4/
         tA1/Bt5eLALxoddC/nfiIiSLugO5Sc7iZupRqjYUJuGpTDVUJZJuPJYXugQAKssVdUxe
         cnFQ==
X-Gm-Message-State: AOJu0YzpcF46P79LNDZJFF/yehbcQJwZ9tsNk3SgOrvstgFaZLrQu5sr
	M++pOLYFTKMN+7h/fd2gz8vcaY3ik7Qoi6t1wwGitivSRp9XU99QWhZBTTgfOD6agYzPOEGi7pN
	yXySPOme9iCRXWKn97JNgKTuYrk30b2Q28EcNKxbQ0w0EAdRRHTUXpVZw0ufmxzb5xS+n
X-Gm-Gg: AfdE7ckzppK63CRXJjuLdiWo1IwlNZX9Ir/PB0/rf0CZN2o29jG9gC5CLJN2NLh5zIh
	4CdGYljl1aH6RyP4WXib1LtURk6QnF9k+2VUbOhDl+x0M90nN1YeRARySIbgiUGd/vAIG5wV9u/
	bz+1cyr9Ug9B2Ls0xCYODq4jY+qb+KPKYzeh6SK0Xi67FWSByv+PGp/gEUu2TgjFqvLalBLeV/6
	Zhe6ZHwMV02p89D3MVuyjWsbbVtW+VCA3sAME8KWVVPzRyZ2/OM3c1hfrEG7q9/Gs/rl2JCouTf
	l/A57NBe7WDPzdx1ylOxX0m+yTyfddTeEIvDmte0jPbyROFK0XVr640FMaejhIOJ5Xu4Ah09wvY
	BFgwHv8PCyiVWkdCJmbK5oTjGMNHN+1XIRP8tVArlf8kKsU1057YaBZ+8VfuQ
X-Received: by 2002:a05:6a20:a123:b0:3bf:97e8:a026 with SMTP id adf61e73a8af0-3c0bced45eamr12612791637.25.1783665591638;
        Thu, 09 Jul 2026 23:39:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:a123:b0:3bf:97e8:a026 with SMTP id adf61e73a8af0-3c0bced45eamr12612757637.25.1783665591150;
        Thu, 09 Jul 2026 23:39:51 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313af819732sm3578090eec.16.2026.07.09.23.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:39:50 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 23:39:45 -0700
Subject: [PATCH v6 4/4] arm64: dts: qcom: add SoCCP DT node for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-glymur-soccp-v6-4-16f70227547d@oss.qualcomm.com>
References: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
In-Reply-To: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783665586; l=2804;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=GuTuG7Z8xppC3L/Jo0WpEG16+Uij7ANSxrp2vi6Xp50=;
 b=DgflpKW8sSQw++S91xTR8dJ8xziNWrOytCBtRhTUOMKYtoAZUUt89aJQZvQbAgYQXqYUgx+aE
 3lpEyPqYx76BGFs0ETy1spU+EcQ+ozcxosFViUau+tq+l7J1WnCm1a6
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-GUID: FPgd-6ebqW5XPVZ9b-VMKsayC8pagrdP
X-Proofpoint-ORIG-GUID: FPgd-6ebqW5XPVZ9b-VMKsayC8pagrdP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfX4kIHf7vi7CKL
 u5Pq6UwBaX9ZRSp0yp2jw/f80DKg7EfvaqdbgLuF813ykdrL9wKFGMGkCrmO3E2S/FIad/rMFym
 VD6hpudkNXX8bpJBb47qMB727WrWXpE=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a5093b8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VnJQUHybGrZeNF6u4BcA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfX69E1LuaKSK09
 qTb4WUsei1nWOaQRkePxOmKVqz0zweKNho+ABBqyJmkw1NjppLNl1PNJhvxxQs1Fb4TTd3MyXzH
 gV+FMcrge4rhXyLfZfdICc/ucRK07mnclq6NCqf3A4x0g82nx+aa3Yqb82n0CBEpTe5hYW55K7T
 QZQ1sMQ8dyQuWN6H+55VOUzNz0H0+cZYt+RCu4MpXSOlXZ4vP9KY0Egq9qKfTB31JRVvqkRkt+I
 3zNBQVvATHBaFcNgmD/PyRmxYZYTBbnXyAwlyn0eBv3aKyatgUoze2tb7mXI0X9gteuOne1cs+n
 rArSlTImjJGi6LnzJ/RqrDDBEjG7diTGjbTlU0VMYfj402iQ5H6VFdE0tCRjpLBS8rQPxAHF9lG
 kEhoj1aLECXDe8cfKdMR1mtFRK89LKRKkjWQAkFmMmpX0mhgSi1yHHA6UfVudGLvOkDAL2Kt443
 DRnpsrtTcsXvgoX+b1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118170-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:jingyi.wang@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:abelvesa@kernel.org,m:qiang.yu@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5CCE737C4B

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
USB Type-C, battery charging, and various other functions on Qualcomm SoCs.

Add the nodes required to enable SoCCP on Glymur/Mahua SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  5 ++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 44 ++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..d728478f0a11 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -585,6 +585,11 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/glymur/soccp.mbn",
+			"qcom/glymur/soccp_dtb.mbn";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 9ec7c256b80a..f4569d49dedc 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2297,6 +2297,50 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		remoteproc_soccp: remoteproc@d00000 {
+			compatible = "qcom,glymur-soccp-pas";
+			reg = <0x0 0x00d00000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "pong";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "cx",
+					     "mx";
+
+			memory-region = <&soccp_mem>,
+					<&soccpdtb_mem>;
+
+			qcom,smem-states = <&soccp_smp2p_out 0>,
+					   <&soccp_smp2p_out 8>;
+			qcom,smem-state-names = "stop",
+						"ping";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_MPROC_SOCCP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+			};
+		};
+
 		usb_hs_phy: phy@fa0000 {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";

-- 
2.43.0


