Return-Path: <linux-arm-msm+bounces-117563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DjQmHiEdTmrzDQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 11:49:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34998723E04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 11:49:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hOKXoLEK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SCkUyAJp;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117563-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117563-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C52083025E6F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 09:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE18367B8B;
	Wed,  8 Jul 2026 09:48:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5BE332EBC
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 09:48:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504135; cv=none; b=O4O974lP8vU6ABF+e+KO3Mp7BfokfHYjeVATtqn1fbE4qR/Ib6k2r4oggbAz2jyBY3sLxIQViOg6Gk03AWieKYUvGEJ/Fx2oiSyWb6iIlI8ofKLBKM/Kh2W6krC4T6F1RpFie6kya1hh1e+zz2hOuA6tOlccJusEDR/TIm9zSFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504135; c=relaxed/simple;
	bh=+vT/E+tWHZB4AciEso/RRvrs6oCrmcZom56e4NXWz3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JuKnrCTqU4beVUInMMWf8cp7nsd2zEjryNd6VZq2Ql9nZlmHO0BOJ+FH1s6va3WuQt1f8IiLmzyKk5LzL7S/tLilKvBbZXjmTMVBtdiOOktMy4Bq3EWd1CeAnpJJj3YowuhFM2WUht9dgtTa1kjFLTCn8U9G7v4rrpA2beYgC8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOKXoLEK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCkUyAJp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889D412007668
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 09:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBT/T4Ffy31Ybn+2PA6r3ScLjie7ihMoXzSbe2k22bo=; b=hOKXoLEKO9srQd24
	IbH6CRWjcKhMIKVLxQXlXughE0ppcdUwEdCiLcHUY9I+CJsRMPqfYmYDP8OWidVR
	ZtIzRT8nv4KT/a/79MJGIof1F+c5y0LXKHj/4fJ2SMhRvICD61jLRQATWvVd0P8f
	IooJv6OMz+rIquKkwG+dDlMzn72gcJZfCWbCUyOPJwUz8KBW/H48a45jmK4Ga2pI
	ZMin0OTTqc+GkVgfoFTkG7CvkJhOFUayc5ySIwOFlcEXZWwNo3iqA/MJo6m3qEx2
	u9Z0z3NJSGHx6kvPMdPwJA3j20LbCSGNxoAbV7YYPV5v50Cc5zgsxiuWOmaS6C56
	32BcDQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u12tkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 09:48:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef8249f871so7515236d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 02:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504132; x=1784108932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBT/T4Ffy31Ybn+2PA6r3ScLjie7ihMoXzSbe2k22bo=;
        b=SCkUyAJp0heJmVnq9AD1XnYUZEWxX0lSrrRP2ehoVjFnZqVvqjrt8GPcfstwJe69tz
         n1cS2/haQ4/Ccx7zz9ORuSE+GatLTtoHXi+sjDNopBm1cAwEnX0R2ltr3zk6uSgv0yQL
         KneA3+EK2aDbUek5nU+yAxMWTnXidp+sHNSPFkk1UNnBRCdhVfJZlN63Cm7zxa9wa+Gz
         OSZVblRpM5EykvzTubP8ujSmNCnOVSyof5z6qLzwKAfvHG2XRleRSIInQmiMdQtgdi+l
         Zwz2bgSKSZ6IV9nuEgq0pVZbxEAGaUCTkdgjfMjXxl7si+4+hiAFiq8HxjI4Uj3L7gas
         sMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504132; x=1784108932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KBT/T4Ffy31Ybn+2PA6r3ScLjie7ihMoXzSbe2k22bo=;
        b=AIjfGpZWzr5vYQAoi7409NbeB+FKgpioYOEWoi9Mt5ZPLq4fXcrVZ2kZTfNVhdltzx
         Hrwgdoaqr/Oiz1LJeaH2qWTqeb5xFhKWm3Sa5hGTnRkA7++M/bK0x8qqRv6OhVNq5ezB
         39aBA0G+MVOP65wjxykjL76VfsIv4qMbIWOzunoIH2Zwtst/JQTyECkY36M/jSpO63gf
         /xT/hQZQMGjdXLOujhSqvbIU955wbbtTUcBmfRCAdkfBX9CSpSwp1OuFKxm59z+8rG8D
         Ei7mQY7TjhLwSKk3k9llb0ogFIhhFkHknJqjK9/Ls0Ii0Fes8sz6QvUm3tZeAPNRsrM8
         UX9Q==
X-Gm-Message-State: AOJu0YxLREparsfJDlDN60MpqHUIifRS0OSwsQTvLOH+xTOycj0Jb9zE
	vFgfvU49d/gs+OqcXP9FgicIKi/jrvfe35MM4R5dQA2g2FUPmSyCzDQ9PFEzN/6rqbr1VtCDyUJ
	70k0Z4YiyMXCVbqB5xE0SLpO+5qS4rHokU+R/zRddtV67dViHcjPu8RYaJR+izbG8fpHU
X-Gm-Gg: AfdE7cm502QLvyz2zbWkvHfF6KSaiFt8PtwfrBDGmkXOt8gntGiW+PCFKaz0j2xjO1E
	jw6qFm1uCAwt9emnWUbnruX1JwgitSXQvdaqkilpbY3lGGSWnGe4T0mjSPwh+YMkyM7jPSlnfcH
	59WNNuufnxIweFC/ojF2CYGfM3yH1D+cvMo2P/z6ubijR4CnJQqHqzQP9NkTuhfyUyK//S+kG9X
	Gq+WesYV47ODHYfkg+xHGMi7Zb3qIsFK7FjMbTxSvgMtQ0MxAzU3V1tq/A2Xygm8aFatA0GqWl+
	7q7zINAYRl+Y5/S4EHjMJRaWid0zE6HNuTC6qrwSnN4YVXrXD/gantXmRof0wNpUzGGmupNMcs7
	oT5t4sBU1cbbrNRXCJ8BqUSocg8heNHjgw0Q=
X-Received: by 2002:a05:622a:13d0:b0:51c:4fba:5b12 with SMTP id d75a77b69052e-51c8b549328mr18157231cf.46.1783504132524;
        Wed, 08 Jul 2026 02:48:52 -0700 (PDT)
X-Received: by 2002:a05:622a:13d0:b0:51c:4fba:5b12 with SMTP id d75a77b69052e-51c8b549328mr18157051cf.46.1783504132121;
        Wed, 08 Jul 2026 02:48:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3318dsm114258085e9.3.2026.07.08.02.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:48:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:48:39 +0200
Subject: [PATCH 1/3] dt-bindings: clock: qcom,sm8450-camcc: Drop
 qcom,sc8280xp-camcc from "if" block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dt-bindings-camcc-required-opps-v1-1-ae0871774210@oss.qualcomm.com>
References: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
In-Reply-To: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=996;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+vT/E+tWHZB4AciEso/RRvrs6oCrmcZom56e4NXWz3Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqThz8RE5I/GM5fk9P5eI/NN3vbRInOctpDPd+Y
 BN87M+WWHOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak4c/AAKCRDBN2bmhouD
 11bDEACGZnNsy8R0OzBuKqblRiDFn+wbKnVMm5IPUlTBLbwhPIqpCHkGLZBi2okQ9Rq4u0rUATK
 LCKTw3B2wallVFSHWnV1PFC++TIJ5+XeV/fvgfb9GnjbeVSTCn1zKxQ48bGSb+trITflbfo+/pa
 67PsVRKqUmC2ociNhlDfTRngvXWMsquEY8xxCawbAsIHj0ZO1SWEGHE1s8LLt+3iakAPUmLhaTP
 RGcAVV32s8qr5JX3MjyhgvOVIch/IJlp/ICwWOQEKpUXZnOd1Zj1VKfOiMXhWUxZntTyng4mQy1
 4+eRCG/yvY3TOQhLoFAm6pmWWIEhKj3cOp13s3xuHoXVC6MLx8yNmBWaEquzNRuJwYrLFJFho1x
 OnL7Amd7AcXqNo0ldIm+PZhGSK3a4nt4+0vl/J2fXv5jm8Nn3xBE4V1O8N6hP1og8SAhTE2OMcu
 tOAKtuUBKnAr6bhCKIe/b7Hst4GP2JpIUO2MXI9WrTxZ/WCA0MK+arBKoWKucCDFQSZ+9QLAlDS
 C72dpFgZ8pBJAbWeq0oURDt8s9Ui3Gz956FaVQKOYwQ8CY22dpN1MJWypgshzrHWU/zBMXzbt5J
 kv7+oGV6xlXucL/6ZY76CaoO+NqyHD9Z2VatEAcgh20dr+N+G13O9WYQ8iSIu4HHNaNSXeruIxC
 T2Rv9tbxbN3e6VQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: zowTwojcZbi3a3kyVVLI_QiNpdOBlD5y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX7uJUqCiLU9q3
 oBLHOhVaojs6SwPKc92ylmlVGw68I17kzFR9Uthhikh6A7veaXIeyXvZfjhLF5qXOwt66fdCLX7
 ZhdK7MoVNwY7Wh4JBmm6SRjuEWcTTzw=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4e1d05 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gQe7VDfzUBWdSbS88OMA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: zowTwojcZbi3a3kyVVLI_QiNpdOBlD5y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX0osrlnAKLxw7
 SuPLG9tTXphSCzZMdU7qsSYG+9x328JyoCEgw5IK7nkoNLA0DB7Su9lEG3TuShF3rKrr9d237mi
 Z72cFjIKcDiTpsSSOpn1d0ooTzHMGsEzJNMnrb4VqpMRz2HTVlPYfSd+OrGBW3kpYUneIbQCmVO
 3DXIgkDJStF8g0s9ycCA36IMtURSvGWktLxMqf7tudl0MmhK6will9C9fRT8E1YNslz3LTlxGHn
 7h5+NanrdeZeRt5ckKctjRneZd6cfeODxgawqRghIK2D3H4WznKmPyGOGTvFBVbhh1UI5ifGGL/
 Zdus+HTOmRxCvGfUuImYtWyK36tnlZba+FSMWmZ3nbDcJVSbiTcdwwlP3KE55MUXmgBfsla/Bfq
 tKxm30e95i28n+4au008JHoPZCiW/2D+UvNonvrFl5y0jflvY6SaUpYTMrq5jUZQyS37L6HaSXw
 nSgOxf4t5641SrjSUqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117563-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vladimir.zapolskiy@linaro.org,m:quic_jkona@quicinc.com,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34998723E04

qcom,sc8280xp-camcc compatible was moved to own binding file in
commit 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move
sc8280xp camcc to sa8775p camcc"), so cleanup redundant entry in
"if:then:" block.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 8492a7ef7324..e6ffacc81d0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -74,7 +74,6 @@ allOf:
             enum:
               - qcom,kaanapali-cambistmclkcc
               - qcom,kaanapali-camcc
-              - qcom,sc8280xp-camcc
               - qcom,sm8450-camcc
               - qcom,sm8550-camcc
     then:

-- 
2.53.0


