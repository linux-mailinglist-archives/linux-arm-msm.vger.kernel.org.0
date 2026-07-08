Return-Path: <linux-arm-msm+bounces-117568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OaHGJ+EhTmpIDwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:09:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC192724122
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:09:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Nph7W2GH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ayjFEeqz;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117568-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117568-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89EBA300EAAC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 10:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368DB38837B;
	Wed,  8 Jul 2026 10:02:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9538634753B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 10:02:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504967; cv=none; b=RjnqHS7+sal0piB/RLy2QaTmErSHOW/+NTGzVTNwUDt7XY1nYaJmWC7T69ITrXnLmNuBIJAa/YTVIlILF2dm2lOa+5pP9cWFUrKIUQg8rUQwK5d3aqHEQEil20KQaCUcK2KCywblGBaSol9Jc8TS2eSvEuHSC69I1wHa9GFwMxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504967; c=relaxed/simple;
	bh=kLPAtgBR2B9n0/tWDeaqoBhx/cWXwoNhZjVj+IFDhso=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a2DEvUUh7C6C3BmpEf2PsKuRFDEC72eD8PFmvnV3iyM/X3CDe709tALyyKca/IfcO0Gkyws12Y6mswv4NY9FRtvbwt6mnkzsLGqzTfS6CBY0nImYNszglfc81Puw1O99k0Yo0gPBHCswaHPmfgU1jLvMSugfKk1T8kWG4o58dcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nph7W2GH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayjFEeqz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889Eo12007710
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 10:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2r+hMVsWqtKsqmd4HAjb0p
	75kMs47h2LOovg2koAXzw=; b=Nph7W2GHCwmxZXjEzMtow348148coXiq5n68dL
	YwhLj7p1lx93+DcFLl1tjUa85PaRHg5TknrEaJfJ+8OIMRy+Pcn0RHJ7rti9m5Zr
	0GrwTvF6RR+q8FhTSgYX4nHftpV/rq23ZQdGqzArvLRJIwQWIq7nBfxqxAfR0j8F
	GuNwXDQUgn5lnOcOXSOLBK9EjOl29tfG/jkr90Dm3CgioOnwqA/WuHXcjJZjAd2x
	bInB2pou+427N+MXVImAm3xhQ9o2DRtH4T9+bhZ2rYRlAqZq90lbp3Gj9RQcByX1
	kun7yvCM4+mdeBZy4CoutFDUXUw5TxRgjEuuRpJXtWszY4EA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u12ve1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 10:02:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37e24235ce1so1134653a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 03:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504964; x=1784109764; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2r+hMVsWqtKsqmd4HAjb0p75kMs47h2LOovg2koAXzw=;
        b=ayjFEeqzbUnh9eLlBSNHRd8CVVVbln00Pt9FgS474WmODwckDoQcbS8FmBK5TWqAP8
         MYA40hfEAPh/CcwOtFZMpqAGAM7yWSjXH9NMBvma+FdCZvMMuXwboo4s+l7Zt+CER8a6
         H5Y3Xpqa3SFXaacmaQ9VD91J4ooDUAk0oaW9XcDSzqBP/dpwXyTdwuLy5v1HZPZ38pUb
         rGfqzl+Dd/eoCrV5Y1sTrHXxyBe9bixJFxhkC+MNS3TfCCuVngVnNTGB0v/jZN4sgoe6
         eeP53/5oeyGoivx6c4BKrTdqnHcrqTI+QK6HTrX+DqWtJ/beCepvRdivn84KN6rs4UTH
         w1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504964; x=1784109764;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2r+hMVsWqtKsqmd4HAjb0p75kMs47h2LOovg2koAXzw=;
        b=HuaAtCV4As09PuklGFhI1fVFG9aJ34soRniYRPPbmYxW/61clAE2CWRP32cRjD7JGX
         RZaJ/ZyXauQeuu8LQ1UO8zOiLms1bwo9zR3usIsbNSUlRAUBeCkrs3Ly9uYmvrh4gAul
         dih7jyRXTKe1DQ7soN5gQdPddh0qIHRzLGlWdkG9HPSuxqPlGdG5EiK5fIZSkwOe80U1
         xrlIgUhORynHWK1ceM5EWEY6WDxhjAOxNOX9FwwfpSyE/45jy2LP30W87XmYnpTZfP6f
         GVWBa1w1PT2sIzVy1GAR5ITLn1ii8eVrwkt9F1D+tJAxMgKA3H0JxIMBHnmi7bfsvt6e
         B2uQ==
X-Gm-Message-State: AOJu0YyQZqJWA+GJ4plFWe73UiITIV8Km7qJSo/bZy3mNXyfaF7tj36X
	rV61ac0f+xIFizm/nYu5yNRezA20r9Zz+r/3gs5bXRiEV0HcNZePNRz8qTzrRz0e5ElujrFePBV
	qVL/ljIwUyVssNfBTXiWZ09x071jwnd/ZkahLILI74HZPaYIKURNeG1obCP+uspne9Bi8
X-Gm-Gg: AfdE7cmjJNAStxGB+2fKSmjMi5cezRntBb3JoWA6ZRXkkwN8ysorPRkTPzNu9fjAyJg
	P2IIrnuF/lRbySZKKyycRA+ChR4cT5Txm8d00cw/6GX3dDTiERHBUDL1nJOYsqls1SLmTUwZ8mr
	xNGuNYRRtUhETfQRiCYtS3m1d5XL942aCfNeQRUen5KYPDc68zTHI3VRocpJwNhm9ct7K6Vh2pE
	nOO93j+zLFnC7kiklL3hE5VHFv8h/Hi9TKIO0wTAUIU6r++3lSXptpQMd3v78C00fp00XJXlxyD
	ULpdYNHipkMZ9F0pfAZBjVw8l+mUlccHdqQMQR7B4qt32aQT6cmYT59znMkBcw/L2CKE29os71M
	/5GPq+7rH8YIVwcZIkJNKrXwUV/rAs4Sm4YnMmh78xqXtef+gZZ0Chc1Svw==
X-Received: by 2002:a17:90b:2e8e:b0:387:df8f:1401 with SMTP id 98e67ed59e1d1-38942b81d57mr1877706a91.34.1783504963981;
        Wed, 08 Jul 2026 03:02:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2e8e:b0:387:df8f:1401 with SMTP id 98e67ed59e1d1-38942b81d57mr1877653a91.34.1783504963481;
        Wed, 08 Jul 2026 03:02:43 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-389098609c9sm875741a91.13.2026.07.08.03.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:02:43 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v8 0/7] clk: qcom: Add common clkref support and migrate
 Glymur and Mahua
Date: Wed, 08 Jul 2026 03:02:37 -0700
Message-Id: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD0gTmoC/yXMyw5AMBCF4VeRWZM0SFteRURoB2Ph0kEk4t1VL
 b+cnP8GRkfIUEY3ODyJaZk9dByBGdt5wISsN6QilUIJneyGXbM57JvArBBWGqmsyhX40+oXukK
 wqn/z0U1o9q8Cz/MCPAUuYnIAAAA=
X-Change-ID: 20260708-tcsr_qref_0708-390d6c67d747
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783504962; l=5886;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=kLPAtgBR2B9n0/tWDeaqoBhx/cWXwoNhZjVj+IFDhso=;
 b=+lwYvNIQtslePr+gUJPGEnJhsdN9NSKeWNKwFj+A1H1IiBmVRaYP1lHkwZwe3A4o2ubPAGqH9
 HUBWEikOQSODJceOcNYxWQJJasHP9ziG968hdlla+kQfCHuixxyDerB
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: GKkcAUWWjyMNlwRYngWKp3WiYep_k6pv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfX46XlUJb8Lm+5
 NbkBF1jyinbfLU+ACT99a0wqkz7u0xG0C9EKZAHmw6HFxrcn/5Fha67JLuOHNBBY86rmTTaUfQ7
 SnsNMsoaZTLbUzRIpr/3IhnyWbEc0yU=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4e2044 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=VBF_zcjmYl_iqrD6TbIA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=xwnAI6pc5liRhupp6brZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: GKkcAUWWjyMNlwRYngWKp3WiYep_k6pv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfXz22liwjy+f6g
 apjtHlwqYfaLToDQjoljsKOz81UZ4/OJkehsJgwOOIqF7Xf+GC7G5nRXZxVK7gOHqfaFE1J7aNr
 +mSxp4n4tuY41cwHPZeoe+L5/BBfrx1BAYvDcm6yXrDkiBXuyg/daCmpNorcFwggvaawQTwMyoC
 5ijofMNaj4HieQMfnWSCZQKJGvZTwib+a6H1RFVzhbvtCiEs8sEEezd34oYwnceQcHLTqSk/hPM
 gIVr74NaweVQhyN/PBTL9DTSlp0GPA6dQFQAUFQ46BbHTGxzMkZwdSW/XtslO/KhPHJ0eJ40s4q
 WYrU8evZrpN6FgrlkinoXdKDSKWsrPF4ST3c+kaGrXIBkckLcVh16emybbvjPyjLqaerHc8YZTD
 9eKokpqTRClbctanJGEdR9yjzh0/bHc8XYXLrrqu5X2lWm/tDtHZERsqyNGgVE02juQ/ISD4wMx
 KY+GWoWrFESxPg2f8MQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117568-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,msgid.link:url,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC192724122

This series adds a common clkref_en implementation and converts glymur
and mahua to use it, along with the related binding and DTS updates.

The PCIe clkref clocks on Glymur and Mahua gate the QREF block which
provides reference clocks to the PCIe PHYs. QREF requires LDO supplies
and a reference voltage from the refgen block to operate. The refgen
block itself requires vdda-refgen_0p9 and vdda-refgen_1p2 LDOs to
function.

Previously, these QREF votes were done in PHY drivers. In earlier
discussion [1], the feedback was that this is the wrong ownership point:
those supplies are for the QREF controlled by clkref registers, not for
the PHY directly. Based on that feedback, this series keeps the
regulator handling with the clkref control path.

Another reason for this series is reuse. clkref_en registers may live in
different blocks across platforms (for example TCSR on Glymur, TLMM on
SM8750 [2]), while the behavior is the same. The common helper lets each
driver provide simple descriptors (name, offset, optional supplies) and
reuse shared registration and runtime logic.

Glymur and Mahua share the same QREF TX/RPT/RX component naming but
have different PCIe QREF topologies. Both are handled in tcsrcc-glymur.c
via match_data to select the correct descriptor table per compatible.

[1] https://lore.kernel.org/lkml/aEBfV2M-ZqDF7aRz@hovoldconsulting.com/
[2] https://lore.kernel.org/linux-arm-msm/20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com/

Changes in v8:
  - Define refs with __counted_by(num_refs) and make provider a single allocation
  - Use mahua_tcsr_tx1_rpt012_rx2_regulators for PCIe6.
  - Link to v7: https://lore.kernel.org/all/20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com/

Changes in v7:
  - Define compatible as an enum and add the per-compatible allOf/if/then block upfront for glymur. Reword commit msg for patch1
  - Drop Krzysztof's Reviewed-by since the patch changed substantially from what he reviewed.
  - Added a comment noting that on Mahua the REFGEN4 block is supplied by the vdda-refgen3-* regulators, and mentioned this in the commit message for patch2.
  - Change the descriptor array to an array of pointers (const struct qcom_clk_ref_desc * const *). Skip unpopulated indices with if (!desc)
  - Convert tcsr_cc_glymur_clk_descs[] and tcsr_cc_mahua_clk_descs[] to a pointer array.
  - Add regulator lists for clkref_en on Mahua.
  - Null-check device_get_match_data() result in probe.
  - Add rx0 regulator in mahua tcsr node
  - Squashed the former patch 8 (switch pcie5_phy ref clock to RPMH_CXO_CLK) into patch7, so Mahua PCIe probes at every commit.
 - Link to v6: https://lore.kernel.org/all/20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com/

Changes in v6:
- Split dt-bindings patch into two: one to move glymur-tcsr to its own
  binding file, and one to add mahua support
- Use regmap_set_bits()/regmap_clear_bits() instead of regmap_update_bits()
  in clk-ref.c
- Move clk_init_data from struct qcom_clk_ref to a stack variable in
  qcom_clk_ref_register()
- Add Co-developed-by/Reviewed-by tags from Konrad Dybcio
- Add missing regulator supplies for EDP and USB clkref_en on glymur
- Link to v5: https://patch.msgid.link/20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com

Changes in v5:
- Return 0 if regmap_read fail
- Add a separate file for glymur-tcsr and mahua-tcsr
- Link to v4: https://patch.msgid.link/20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com

Changes in v4:
- Add mahua QREF support (binding, driver, DTS) to avoid dtb check error
- Override pcie5_phy ref clock to RPMH_CXO_CLK on mahua since
  TCSR_PCIE_1_CLKREF_EN is not available
- Rename regulator arrays to topology-based names and merge duplicates
- Remove else: false blocks from binding
- Sort supply properties alphabetically in binding and DTS
- Link to v3: https://lore.kernel.org/all/20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com/

Changes in v3:
- Fix dtb check error: allOf:0: 'then' is a dependency of 'if'.
- Link to v2: https://lore.kernel.org/all/20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com/

Changes in v2:
- RFC tag dropped
- Changed back to additionalProperties: false
- Moved all Glymur supply properties into top-level properties so they are explicitly defined.
- Link to v1: https://lore.kernel.org/all/20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (7):
      dt-bindings: clock: qcom: Move glymur TCSR to own binding
      dt-bindings: clock: qcom,glymur-tcsr: Add mahua support
      clk: qcom: Add generic clkref_en support
      clk: qcom: tcsrcc-glymur: Add regulator supplies and migrate to clk_ref helper
      clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator support
      arm64: dts: qcom: glymur: Add QREF regulator supplies to TCSR
      arm64: dts: qcom: mahua: Add QREF regulator supplies to TCSR

 .../bindings/clock/qcom,glymur-tcsr.yaml           | 146 +++++++
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  20 +
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |  16 +
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  13 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-ref.c                         | 205 +++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   | 471 +++++++++++----------
 include/linux/clk/qcom.h                           |  67 +++
 9 files changed, 704 insertions(+), 237 deletions(-)
---
base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
change-id: 20260708-tcsr_qref_0708-390d6c67d747

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>


