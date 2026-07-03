Return-Path: <linux-arm-msm+bounces-116269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /oPGKCmMR2qoawAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:17:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ED2701185
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:17:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hvj1BaCQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VyyUPRSN;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116269-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116269-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CA3883078DB1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 10:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3EB43C6A39;
	Fri,  3 Jul 2026 10:04:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103BB2FFF81
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 10:04:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073072; cv=none; b=EDoNZIAgVYn7nC//YDKJRT73xB0BmnvFwx3LPCMTps7e6f7o+Uv4uZSUJ+T/bxq/8GE8I0XuP9bmGr0saasrajF+Fq16RmqrThG8bTwBKRpuB/zmbtQkALr7u2uO+TrPBFpOYK8Pk2ZagYNC8saZo9cY4Djz+aQ1OVd3+5GmYM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073072; c=relaxed/simple;
	bh=zA6cdXEqKEPOin3IZ/z1rObQl5aN9D979wp6ZUZ5hKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a+zoINoGqZt9OOiQQuDtRFrAroNs1x/1Yi64N2lo9F9Jz7hxkP1MAYDI08Nd1na0P1U7yjLU0cfoVYIMYLbBYTO4jZ/zS3kjwXbN7hy0n3XWwVO5PKvfFkQgCRloCIKYHaxK0gRMy1zVMDPFLlgCn0/WmqNQDB8TGsjqNEbzZkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvj1BaCQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VyyUPRSN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rvkN3126357
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 10:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mJ8DecuGtEyt+75WTjvPr7MLItStZWjZ6SABeaOraiU=; b=hvj1BaCQvnLXxzaC
	TRB5ORRgBFZMABYenPUKLs45gQa0NHKBeNYfoMb3y+UEahSKDl4IZiIeVviPRWS0
	05cnTLf7yFH1BcPngb8rB7roCZzEbCbFBvE8cHh61v+fatsqNT9AbQtRXvQOXaV/
	7aX72u7+CkfBLDcola3fhemPQ/yPZRWWSRao9/I7IufxZcCbwA1+Gypfzo92ZE/f
	hUoKP3NgbllQnltg6EC9EHh/Rf3oaRmSKB44cD4gEvkg0EJHFfP9LuwwVUkpDKXr
	3KMriaXkNH1PvKSTcdLozHLk4t0oZ3SVIHXEYBR/blSJq0UXKtiaQZc3KhgKL94n
	plcRFA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnkw0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 10:04:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e68cb7a3eso73353085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 03:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073068; x=1783677868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJ8DecuGtEyt+75WTjvPr7MLItStZWjZ6SABeaOraiU=;
        b=VyyUPRSNYqLdgnh1mB6rFZ6jnmlIAjhwhuJKecUDRlJUgZx18UpaNdftwBXar2MOhS
         ozxgDKG/xc/+9gerBznZHC6L6OiRYlYvr9Oh+i+5r87NCcbcJpadLv14tv7rV+sAGyA1
         HWBB4FY934q1p7bdpnf2RwoS0VbQY63XTWI+yTzTZvdn856Ltf6vaPUBZlxtBfSsk19N
         KEgPNJiAeYQxJmYpDlquGfifNvaA1h5b7SAI9zLp4krdNINPvYLwWqtSLswi0VuVAt2V
         IOPzBp0vBVDFUCGzelUMaPgqbfEpWwj/jslnj2LThPLf/5UBH0lFeG8Im1k9tJhKoxTm
         nXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073068; x=1783677868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mJ8DecuGtEyt+75WTjvPr7MLItStZWjZ6SABeaOraiU=;
        b=MfnQzs42ZqMpjv5dpa+AMCsKWvwhTQL8mrE4c8+NMdbL/eWz5Qt/rHrnYbJk6pDYF1
         l0tmEVhjiM7thFiN2fmRnYnceJ4W3ZfPlzSvmbIet9fPkzpgkH2fcZF+0zL7eN3aKYBR
         WTS1itU6zV73CrtxCWF3uErUt9FLNZfp7whATTwge/omSDuvZIyNTtoV7zCfdbciG0pt
         DLu3c7MBLGJC1QOhfjRRh4J6zBKddt42ukbRDf3jk+bfLUybybuiCcj6lMEsP/iFMiUk
         x//yrtkAX6Xyq4OGHArV5m1V1CysySckRHsraHgKRWdj9ew95alVVxNCqUxMRZ2AQUgW
         MtxA==
X-Gm-Message-State: AOJu0YyIVysKgj2vZcP9BYnHh3/TiCrjoRyyXJTG+lsZMEpKFRZg41dG
	kCcpEVXDHnOvFUu9p+I1FMrzPXVOLw5XB0U3CypDvVG7LGmd61S37FmQjQ14IHEme8UsIZUbAFu
	Ei19aFmZo0Gi2DXxgTRwR9hHh1utGONyrZtGgY5xTOyKmwroIAUh1+7gviYyFzBxOdjdd
X-Gm-Gg: AfdE7ck3JqsRmWKJxDxTDUJPY+71rOL3ykdOYMoberY3jYhMnNj8Zx3Rp9Ctb0b8DY+
	0p1i9Ed4tqOLXliW6HT6hpTKKnCnQACBJIXbNhPvwceuy46MBcCuUASl57ZBq+pxYDFBKwDiKEU
	TBWRT17VMT6TWgOJB+9T93idaH4Qib41mzg0G805tOsSDkKyqfQjWjF4Q4t/rLb5pJOz/8zNyDy
	PUiGQs/4vL2C5SJmZA2MXlfPeiPd7zF6H4DyLWS75x+dFJDfdWe6H6eU017TAA0IQ0n2VxNQvxF
	3FLcoi4MIq9W8pkfJBwKhOoQ+0BWOp/XC5H2lA26VbjCQ1qFbE49O+wcpm/dvis+xfBwbK/LZ4M
	l389FABRlBn24YAHS5u3geZV0t4eZd5mlY+Y=
X-Received: by 2002:a05:620a:2b97:b0:92a:3ceb:9cf1 with SMTP id af79cd13be357-92e784cba2emr1276643485a.37.1783073067447;
        Fri, 03 Jul 2026 03:04:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2b97:b0:92a:3ceb:9cf1 with SMTP id af79cd13be357-92e784cba2emr1276630885a.37.1783073066287;
        Fri, 03 Jul 2026 03:04:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 12:04:01 +0200
Subject: [PATCH v3 3/7] clk: qcom: Make important ARM64 drivers default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-clk-qcom-defaults-v3-3-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=38047;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zA6cdXEqKEPOin3IZ/z1rObQl5aN9D979wp6ZUZ5hKE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kWXt3KGKUgRLfDZyA2pn6Qg6bE0oFGFUROQ
 F8i5PIrlMOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJFgAKCRDBN2bmhouD
 19hOD/9e6W9O3ZXLP9eQ6aoWyMTpieRwnV25oIq/SLrR4O6CGHrsQd+OYKwJrv7vnwaXCESEhpB
 qSmMH9+iHAyVMnhqjHdFtdLsQlv4y+36jpjxJf0G4d6D2KX760NdA1grG2QHjZH9jHfk24A7onm
 9eqFCium0FrL5ZmPsRpZrc97r2jFzBdvs0Hl0Fcl0pR7hJ8SQRcuMeRnUp1zEQPhCkAcBv99o8V
 jy7+zUCGTwES5+Mja4ysue7QsSSuqSay7tovei7hgRZo3Unp7RnGEGFU1YBK8sdVsb0zD2nuxMG
 mQkEfxDHG4CzMKhuXfGAhLQS3DwkgvsSMcuOGF6pcJcqhoIKq11y7WXWWqAR7YiScVV+/ry1OjO
 BtxSrs3xR/ef8QG9hJksM6sBN/fBwhxxvylG7VcbX79iVTnDd0dy15hWjKK9J/hOPhFAqLTA7Nw
 xR6V0Avlfcr3DQM3b+1SovHKPZlzX/euC+qTxMb8N/rMF7tO0WEPliOVAu72vl6GBbYDFNOGiEl
 oz9b4VAW0j5x02eB42kACj/FGH7YNZty4/u6X/g7wNfVQwyY9PTHNlVJ0JwNycxVf227+c1HV0P
 0q4Wx27WOGBR+RECxICHBBsyzelHa8mh7QuNA5b6OpHs81uhQVpKI/M0xZBvsjfq+X+2zfedqsX
 Np4pkzesSDcaSkw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: ljz09Vebdi5O9eAjNq5K3ofKgcBp7kzy
X-Proofpoint-ORIG-GUID: ljz09Vebdi5O9eAjNq5K3ofKgcBp7kzy
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a47892c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9Dxpa-rY4IXQayR6V58A:9 a=91Ohj-z5vtWLULLE:21
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX6AzwmvZLsV27
 2FIs2AKDP195MTpxX+vNA+tdbuDkGahGYcQeCS6jAQlhnmN0LJGNVMVcBRbk4aYI5mRhqJCyPsO
 RHztA2bR3ImlgvKWgBEloFC+UjxwPik=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX8XDeTRIN2Ucs
 8tCSne0nPsslUYbraYmZNaE2OWxrCGBIUjk65vW2Jh7jsXDnBewF+3a/h8d42XMjorApozTXSL3
 apWdcjnGz/YHyNmQnvmuxynb8zUMZvzMVRhh2W7u4lnzgrtNZpUbNAByr/NKn/Kp/ycvbqtUMsJ
 a279L7xz8lPnGeFiEI5bIlC6imN5yoq4M8QfYikVLPw+TUy2gErWDW3Y9o3d2935841uHXPwAcp
 CH2nPpTpMFT0ihx22wdvJwjiEP4jJV2H9kmPT5PsxYHBFXahw9Z3DbkNyVnReJAwtXJ2u2gFi80
 gDUeadhgxAE0f+6bAvaYXqmyT94Eh/hf4gBWWv/qo9jg7iaVH2kmQOgbarkn3ycSwqmQQh7oztQ
 IcNk3kMNnJKa2YU8A2otw4uxzC3Yx+DdD6wvvqZUFzd5NTQ4nARRBa2ZD1nu4XBbj02MLr/8zHk
 k9KlHhuTma7y8DnbVIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116269-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30ED2701185

Clock controller drivers are essential for booting up SoCs and are not
really optional for a given platform.  Kernel should not ask users
choice of drivers when that choice is obvious and known to the
developers that answer should be 'yes' or 'module'.

Switch all Qualcomm clock controller drivers which are chosen in
defconfig to respective default 'yes' or 'module'.

This has no impact on ARM64 defconfig include/generated/autoconf.h,
however changes few drivers for ARM 32-bit:

1. multi_v7_defconfig: Enable QCOM_CLK_RPMH as module, because SDX55
   (ARM 32-bit) uses it.

2. qcom_defconfig: Enable QCOM_A53PLL, QCOM_CLK_APCS_MSM8916 and
   MSM_GCC_8916 as built-in, because MSM8916 is also used ARM 32-bit.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
1. Add defaults for msm8994-8996-8998.
2. Move defconfig change to separate commit.
3. Drop Rb tag becauase of above.
---
 drivers/clk/qcom/Kconfig | 122 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index f07455328e5c..db3b67fafbc3 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -23,6 +23,7 @@ config CLK_ELIZA_DISPCC
 	tristate "Eliza Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_ELIZA_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controllers on Eliza SoCs.
 	  Say Y if you want to support display devices and functionality such as
@@ -32,6 +33,7 @@ config CLK_ELIZA_GCC
 	tristate "Eliza Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Eliza devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -41,6 +43,7 @@ config CLK_ELIZA_TCSRCC
 	tristate "Eliza TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on Eliza devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
@@ -49,6 +52,7 @@ config CLK_GLYMUR_DISPCC
 	tristate "Glymur Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controllers on Qualcomm
 	  Technologies, Inc. Glymur devices.
@@ -59,6 +63,7 @@ config CLK_GLYMUR_GCC
 	tristate "Glymur Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Glymur devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -77,6 +82,7 @@ config CLK_GLYMUR_TCSRCC
 	tristate "Glymur TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on Glymur devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
@@ -94,6 +100,7 @@ config CLK_KAANAPALI_CAMCC
 	tristate "Kaanapali Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_KAANAPALI_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  Kaanapali devices.
@@ -104,6 +111,7 @@ config CLK_KAANAPALI_DISPCC
 	tristate "Kaanapali Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_KAANAPALI_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  Kaanapali devices.
@@ -114,6 +122,7 @@ config CLK_KAANAPALI_GCC
 	tristate "Kaanapali Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Kaanapali devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -123,6 +132,7 @@ config CLK_KAANAPALI_GPUCC
 	tristate "Kaanapali Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_KAANAPALI_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on Kaanapali devices.
 	  Say Y if you want to support graphics controller devices and
@@ -132,6 +142,7 @@ config CLK_KAANAPALI_TCSRCC
 	tristate "Kaanapali TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on Kaanapali devices.
 	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS.
@@ -140,6 +151,7 @@ config CLK_KAANAPALI_VIDEOCC
 	tristate "Kaanapali Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_KAANAPALI_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Kaanapali devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -159,6 +171,7 @@ config CLK_X1E80100_CAMCC
 	tristate "X1E80100 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_X1E80100_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on X1E80100 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -167,6 +180,7 @@ config CLK_X1E80100_DISPCC
 	tristate "X1E80100 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_X1E80100_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the two display clock controllers on Qualcomm
 	  Technologies, Inc. X1E80100 devices.
@@ -177,6 +191,7 @@ config CLK_X1E80100_GCC
 	tristate "X1E80100 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Qualcomm Technologies, Inc
 	  X1E80100 devices.
@@ -187,6 +202,7 @@ config CLK_X1E80100_GPUCC
 	tristate "X1E80100 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_X1E80100_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on X1E80100 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -196,6 +212,7 @@ config CLK_X1E80100_TCSRCC
 	tristate "X1E80100 TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on X1E80100 devices.
 	  Say Y if you want to use peripheral devices such as SD/UFS.
@@ -215,6 +232,7 @@ config CLK_X1P42100_GPUCC
 	tristate "X1P42100 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_X1E80100_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on X1P42100 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -235,6 +253,7 @@ config CLK_QCM2290_GPUCC
 	tristate "QCM2290 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCM_GCC_2290
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on QCM2290 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -242,6 +261,7 @@ config CLK_QCM2290_GPUCC
 
 config QCOM_A53PLL
 	tristate "MSM8916 A53 PLL"
+	default ARCH_QCOM
 	help
 	  Support for the A53 PLL on MSM8916 devices. It provides
 	  the CPU with frequencies above 1GHz.
@@ -260,6 +280,7 @@ config QCOM_A7PLL
 config QCOM_CLK_APCS_MSM8916
 	tristate "MSM8916 APCS Clock Controller"
 	depends on QCOM_APCS_IPC || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the APCS Clock Controller on msm8916 devices. The
 	  APCS is managing the mux and divider which feeds the CPUs.
@@ -271,6 +292,7 @@ config QCOM_CLK_APCC_MSM8996
 	select QCOM_KRYO_L2_ACCESSORS
 	select INTERCONNECT_CLK if INTERCONNECT
 	depends on ARM64
+	default ARCH_QCOM
 	help
 	  Support for the CPU clock controller on msm8996 devices.
 	  Say Y if you want to support CPU clock scaling using CPUfreq
@@ -301,6 +323,7 @@ config QCOM_CLK_RPM
 config QCOM_CLK_SMD_RPM
 	tristate "RPM over SMD based Clock Controller"
 	depends on QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  The RPM (Resource Power Manager) is a dedicated hardware engine for
 	  managing the shared SoC resources in order to keep the lowest power
@@ -313,6 +336,7 @@ config QCOM_CLK_SMD_RPM
 config QCOM_CLK_RPMH
 	tristate "RPMh Clock Driver"
 	depends on QCOM_RPMH
+	default ARCH_QCOM
 	help
 	 RPMh manages shared resources on some Qualcomm Technologies, Inc.
 	 SoCs. It accepts requests from other hardware subsystems via RSC.
@@ -378,6 +402,7 @@ config IPQ_APSS_6018
 	depends on ARM64 || COMPILE_TEST
 	depends on QCOM_APCS_IPC || COMPILE_TEST
 	depends on QCOM_SMEM
+	default ARCH_QCOM
 	help
 	  Support for APSS clock controller on IPQ platforms. The
 	  APSS clock controller manages the Mux and enable block that feeds the
@@ -388,6 +413,7 @@ config IPQ_APSS_6018
 config IPQ_CMN_PLL
 	tristate "IPQ CMN PLL Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for CMN PLL clock controller on IPQ platform. The
 	  CMN PLL consumes the AHB/SYS clocks from GCC and supplies
@@ -406,6 +432,7 @@ config IPQ_GCC_4019
 config IPQ_GCC_5018
 	tristate "IPQ5018 Global Clock Controller"
 	depends on ARM || ARM64 || COMPILE_TEST
+	default ARCH_QCOM && ARM64
 	help
 	  Support for global clock controller on ipq5018 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -414,6 +441,7 @@ config IPQ_GCC_5018
 config IPQ_GCC_5210
 	tristate "IPQ5210 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq5210 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -422,6 +450,7 @@ config IPQ_GCC_5210
 config IPQ_GCC_5332
 	tristate "IPQ5332 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq5332 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -430,6 +459,7 @@ config IPQ_GCC_5332
 config IPQ_GCC_5424
 	tristate "IPQ5424 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq5424 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -438,6 +468,7 @@ config IPQ_GCC_5424
 config IPQ_GCC_6018
 	tristate "IPQ6018 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for global clock controller on ipq6018 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -465,6 +496,7 @@ config IPQ_GCC_8074
 	tristate "IPQ8074 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for global clock controller on ipq8074 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -474,6 +506,7 @@ config IPQ_GCC_8074
 config IPQ_GCC_9574
 	tristate "IPQ9574 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for global clock controller on ipq9574 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -494,6 +527,7 @@ config IPQ_NSSCC_5424
 	tristate "IPQ5424 NSS Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on IPQ_GCC_5424
+	default m if ARCH_QCOM
 	help
 	  Support for NSS clock controller on ipq5424 devices.
 	  NSSCC receives the clock sources from GCC, CMN PLL and UNIPHY (PCS).
@@ -505,6 +539,7 @@ config IPQ_NSSCC_9574
         tristate "IPQ9574 NSS Clock Controller"
         depends on ARM64 || COMPILE_TEST
         depends on IPQ_GCC_9574
+	default m if ARCH_QCOM
         help
           Support for NSS clock controller on ipq9574 devices.
 
@@ -537,6 +572,7 @@ config MSM_GCC_8909
 config MSM_GCC_8916
 	tristate "MSM8916 Global Clock Controller"
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on msm8916 devices.
 	  Say Y if you want to use devices such as UART, SPI i2c, USB,
@@ -605,6 +641,7 @@ config MSM_MMCC_8960
 config MSM_GCC_8953
 	tristate "MSM8953 Global Clock Controller"
 	select QCOM_GDSC
+	default ARCH_QCOM if ARM64
 	help
 	  Support for the global clock controller on msm8953 devices.
 	  Say Y if you want to use devices such as UART, SPI i2c, USB,
@@ -641,6 +678,7 @@ config MSM_MMCC_8994
 	tristate "MSM8994 Multimedia Clock Controller"
 	select MSM_GCC_8994
 	select QCOM_GDSC
+	default m if ARCH_QCOM && ARM64
 	help
 	  Support for the multimedia clock controller on msm8994 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -648,6 +686,7 @@ config MSM_MMCC_8994
 
 config MSM_GCC_8994
 	tristate "MSM8994 Global Clock Controller"
+	default ARCH_QCOM if ARM64
 	help
 	  Support for the global clock controller on msm8994 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -656,6 +695,7 @@ config MSM_GCC_8994
 config MSM_GCC_8996
 	tristate "MSM8996 Global Clock Controller"
 	select QCOM_GDSC
+	default ARCH_QCOM if ARM64
 	help
 	  Support for the global clock controller on msm8996 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -665,6 +705,7 @@ config MSM_MMCC_8996
 	tristate "MSM8996 Multimedia Clock Controller"
 	select MSM_GCC_8996
 	select QCOM_GDSC
+	default m if ARCH_QCOM && ARM64
 	help
 	  Support for the multimedia clock controller on msm8996 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -673,6 +714,7 @@ config MSM_MMCC_8996
 config MSM_GCC_8998
 	tristate "MSM8998 Global Clock Controller"
 	select QCOM_GDSC
+	default ARCH_QCOM if ARM64
 	help
 	  Support for the global clock controller on msm8998 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -691,6 +733,7 @@ config MSM_MMCC_8998
 	tristate "MSM8998 Multimedia Clock Controller"
 	select MSM_GCC_8998
 	select QCOM_GDSC
+	default m if ARCH_QCOM && ARM64
 	help
 	  Support for the multimedia clock controller on msm8998 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -700,6 +743,7 @@ config QCM_GCC_2290
 	tristate "QCM2290 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on QCM2290 devices.
 	  Say Y if you want to use multimedia devices or peripheral
@@ -709,6 +753,7 @@ config QCM_DISPCC_2290
 	tristate "QCM2290 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCM_GCC_2290
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  QCM2290 devices.
@@ -719,6 +764,7 @@ config QCS_DISPCC_615
 	tristate "QCS615 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCS_GCC_615
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  QCS615 devices.
@@ -729,6 +775,7 @@ config QCS_CAMCC_615
 	tristate "QCS615 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCS_GCC_615
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  QCS615 devices.
@@ -737,6 +784,7 @@ config QCS_CAMCC_615
 
 config QCS_GCC_404
 	tristate "QCS404 Global Clock Controller"
+	default y if ARCH_QCOM && ARM64
 	help
 	  Support for the global clock controller on QCS404 devices.
 	  Say Y if you want to use multimedia devices or peripheral
@@ -753,6 +801,7 @@ config SA_CAMCC_8775P
 	tristate "SA8775P Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SA_GCC_8775P
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SA8775P devices.
@@ -763,6 +812,7 @@ config QCS_GCC_8300
 	tristate "QCS8300 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Qualcomm Technologies, Inc
 	  QCS8300 devices.
@@ -773,6 +823,7 @@ config QCS_GCC_615
 	tristate "QCS615 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on QCS615 devices.
 	  Say Y if you want to use multimedia devices or peripheral
@@ -782,6 +833,7 @@ config QCS_GPUCC_615
 	tristate "QCS615 Graphics clock controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCS_GCC_615
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on QCS615 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -791,6 +843,7 @@ config QCS_VIDEOCC_615
 	tristate "QCS615 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCS_GCC_615
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on QCS615 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -810,6 +863,7 @@ config SC_CAMCC_7280
 	tristate "SC7280 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SC7280 devices.
@@ -830,6 +884,7 @@ config SC_CAMCC_8280XP
 	tristate "SC8280XP Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_8280XP
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SC8280XP devices.
@@ -840,6 +895,7 @@ config SA_DISPCC_8775P
 	tristate "SA8775P Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SA_GCC_8775P
+	default m if ARCH_QCOM
 	help
 	  Support for the two display clock controllers on Qualcomm
 	  Technologies, Inc. SA8775P devices.
@@ -860,6 +916,7 @@ config SC_DISPCC_7280
 	tristate "SC7280 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc.
 	  SC7280 devices.
@@ -870,6 +927,7 @@ config SC_DISPCC_8280XP
 	tristate "SC8280XP Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_8280XP
+	default m if ARCH_QCOM
 	help
 	  Support for the two display clock controllers on Qualcomm
 	  Technologies, Inc. SC8280XP devices.
@@ -881,6 +939,7 @@ config SA_GCC_8775P
 	select QCOM_GDSC
 	depends on ARM64 || COMPILE_TEST
 	depends on COMMON_CLK_QCOM
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SA8775 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -891,6 +950,7 @@ config SA_GPUCC_8775P
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	select SA_GCC_8775P
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SA8775P devices.
 	  Say Y if you want to support graphics controller devices and
@@ -919,6 +979,7 @@ config SC_GCC_7180
 	select QCOM_GDSC
 	depends on COMMON_CLK_QCOM
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SC7180 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -929,6 +990,7 @@ config SC_GCC_7280
 	select QCOM_GDSC
 	depends on COMMON_CLK_QCOM
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SC7280 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -939,6 +1001,7 @@ config SC_GCC_8180X
 	select QCOM_GDSC
 	depends on COMMON_CLK_QCOM
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SC8180X devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -949,6 +1012,7 @@ config SC_GCC_8280XP
 	select QCOM_GDSC
 	depends on COMMON_CLK_QCOM
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SC8280XP devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -967,6 +1031,7 @@ config SC_GPUCC_7280
 	tristate "SC7280 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SC7280 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -976,6 +1041,7 @@ config SC_GPUCC_8280XP
 	tristate "SC8280XP Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_8280XP
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SC8280XP devices.
 	  Say Y if you want to support graphics controller devices and
@@ -994,6 +1060,7 @@ config SC_LPASSCC_8280XP
 	tristate "SC8280 Low Power Audio Subsystem (LPASS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_8280XP
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on SC8280XP devices.
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
@@ -1014,6 +1081,7 @@ config SC_LPASS_CORECC_7280
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS(Low Power Audio Subsystem) core and audio clock
 	  controller on SC7280 devices.
@@ -1033,6 +1101,7 @@ config SC_VIDEOCC_7280
 	tristate "SC7280 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SC7280 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1042,6 +1111,7 @@ config SDM_CAMCC_845
 	tristate "SDM845 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_845
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SDM845 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1093,6 +1163,7 @@ config QDU_GCC_1000
 	tristate "QDU1000/QRU1000 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on QDU1000 and
 	  QRU1000 devices. Say Y if you want to use peripheral
@@ -1111,6 +1182,7 @@ config SDM_GCC_845
 	tristate "SDM845/SDM670 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SDM845 and SDM670 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -1120,6 +1192,7 @@ config SDM_GPUCC_845
 	tristate "SDM845 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_845
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SDM845 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1130,6 +1203,7 @@ config SDM_VIDEOCC_845
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_845
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SDM845 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1139,6 +1213,7 @@ config SDM_DISPCC_845
 	tristate "SDM845 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_845
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SDM845 devices.
@@ -1149,6 +1224,7 @@ config SDM_LPASSCC_845
 	tristate "SDM845 Low Power Audio Subsystem (LPAAS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_845
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on SDM845 devices.
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
@@ -1175,6 +1251,7 @@ config SDX_GCC_65
 config SDX_GCC_75
 	tristate "SDX75 Global Clock Controller"
 	select QCOM_GDSC
+	default ARCH_QCOM if ARM64
 	help
 	  Support for the global clock controller on SDX75 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1192,6 +1269,7 @@ config SM_CAMCC_6350
 	tristate "SM6350 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_6350
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM6350 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1208,6 +1286,7 @@ config SM_CAMCC_MILOS
 	tristate "Milos Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_MILOS
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Milos devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1226,6 +1305,7 @@ config SM_CAMCC_8250
 	tristate "SM8250 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8250
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM8250 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1242,6 +1322,7 @@ config SM_CAMCC_8550
 	tristate "SM8550 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8550
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM8550 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1250,6 +1331,7 @@ config SM_CAMCC_8650
 	tristate "SM8650 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8650
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM8650 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1258,6 +1340,7 @@ config SM_CAMCC_8750
 	tristate "SM8750 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8750
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM8750 devices.
 	  The camera clock controller has a separate cambist controller which
@@ -1278,6 +1361,7 @@ config SM_DISPCC_6115
 	tristate "SM6115 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_6115
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM6115/SM4250 devices.
@@ -1308,6 +1392,7 @@ config SM_DISPCC_8250
 	tristate "SM8150/SM8250/SM8350 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_8150 || SM_GCC_8250 || SM_GCC_8350
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM8150/SM8250/SM8350 devices.
@@ -1318,6 +1403,7 @@ config SM_DISPCC_6350
 	tristate "SM6350 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_6350
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM6350 devices.
@@ -1338,6 +1424,7 @@ config SM_DISPCC_MILOS
 	tristate "Milos Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_MILOS
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  Milos devices.
@@ -1348,6 +1435,7 @@ config SM_DISPCC_8450
 	tristate "SM8450 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_8450
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM8450 or SM8475 devices.
@@ -1358,6 +1446,7 @@ config SM_DISPCC_8550
 	tristate "SM8550 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_8550 || SM_GCC_8650 || SAR_GCC_2130P
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SAR2130P, SM8550 or SM8650 devices.
@@ -1369,6 +1458,7 @@ config SM_DISPCC_8750
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_8750
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM8750 devices.
@@ -1379,6 +1469,7 @@ config SM_GCC_4450
 	tristate "SM4450 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM4450 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -1388,6 +1479,7 @@ config SM_GCC_6115
 	tristate "SM6115 and SM4250 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM6115 and SM4250 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -1406,6 +1498,7 @@ config SM_GCC_6350
 	tristate "SM6350 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM6350 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1433,6 +1526,7 @@ config SM_GCC_MILOS
 	tristate "Milos Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Milos devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1442,6 +1536,7 @@ config SM_GCC_8150
 	tristate "SM8150 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8150 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1451,6 +1546,7 @@ config SM_GCC_8250
 	tristate "SM8250 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8250 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1460,6 +1556,7 @@ config SM_GCC_8350
 	tristate "SM8350 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8350 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1469,6 +1566,7 @@ config SM_GCC_8450
 	tristate "SM8450 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8450 or SM8475
 	  devices.
@@ -1479,6 +1577,7 @@ config SM_GCC_8550
 	tristate "SM8550 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8550 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1488,6 +1587,7 @@ config SM_GCC_8650
 	tristate "SM8650 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8650 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1497,6 +1597,7 @@ config SM_GCC_8750
 	tristate "SM8750 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8750 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1515,6 +1616,7 @@ config SM_GPUCC_6115
 	tristate "SM6115 Graphics Clock Controller"
 	select SM_GCC_6115
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM6115 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1542,6 +1644,7 @@ config SM_GPUCC_6350
 	tristate "SM6350 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_6350
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM6350 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1551,6 +1654,7 @@ config SM_GPUCC_MILOS
 	tristate "Milos Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_MILOS
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on Milos devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1560,6 +1664,7 @@ config SM_GPUCC_8150
 	tristate "SM8150 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8150
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8150 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1569,6 +1674,7 @@ config SM_GPUCC_8250
 	tristate "SM8250 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8250
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8250 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1578,6 +1684,7 @@ config SM_GPUCC_8350
 	tristate "SM8350 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8350
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8350 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1587,6 +1694,7 @@ config SM_GPUCC_8450
 	tristate "SM8450 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8450
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8450 or SM8475
 	  devices.
@@ -1597,6 +1705,7 @@ config SM_GPUCC_8550
 	tristate "SM8550 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8550
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8550 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1606,6 +1715,7 @@ config SM_GPUCC_8650
 	tristate "SM8650 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8650
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8650 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1615,6 +1725,7 @@ config SM_GPUCC_8750
 	tristate "SM8750 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8750
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8750 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1633,6 +1744,7 @@ config SM_TCSRCC_8550
 	tristate "SM8550 TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on SM8550 devices.
 	  Say Y if you want to use peripheral devices such as SD/UFS.
@@ -1641,6 +1753,7 @@ config SM_TCSRCC_8650
 	tristate "SM8650 TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on SM8650 devices.
 	  Say Y if you want to use peripheral devices such as SD/UFS.
@@ -1649,6 +1762,7 @@ config SM_TCSRCC_8750
 	tristate "SM8750 TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on SM8750 devices.
 	  Say Y if you want to use peripheral devices such as UFS/USB/PCIe.
@@ -1658,6 +1772,7 @@ config SA_VIDEOCC_8775P
 	depends on ARM64 || COMPILE_TEST
 	select SA_GCC_8775P
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
 	  SA8775P devices.
@@ -1669,6 +1784,7 @@ config SM_VIDEOCC_6350
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_6350
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM6350 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1689,6 +1805,7 @@ config SM_VIDEOCC_MILOS
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_MILOS
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
 	  Milos devices.
@@ -1710,6 +1827,7 @@ config SM_VIDEOCC_8250
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8250
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM8250 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1729,6 +1847,7 @@ config SM_VIDEOCC_8550
 	tristate "SM8550 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
 	  SM8550 or SM8650 or X1E80100 devices.
@@ -1740,6 +1859,7 @@ config SM_VIDEOCC_8750
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8750
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
 	  SM8750 devices.
@@ -1780,6 +1900,7 @@ config KRAITCC
 config CLK_GFM_LPASS_SM8250
 	tristate "SM8250 GFM LPASS Clocks"
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the Glitch Free Mux (GFM) Low power audio
           subsystem (LPASS) clocks found on SM8250 SoCs.
@@ -1789,6 +1910,7 @@ config SM_VIDEOCC_8450
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8450
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
 	  SM8450 or SM8475 devices.

-- 
2.53.0


