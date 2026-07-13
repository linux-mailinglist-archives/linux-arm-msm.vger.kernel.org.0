Return-Path: <linux-arm-msm+bounces-118809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EYtXLCn9VGraiQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:58:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C1074CAF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:58:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VHHUK5eS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LPfBPxUg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118809-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118809-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A13530B1995
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB8C43B3E6;
	Mon, 13 Jul 2026 14:54:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D89C43B3E4
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:54:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954465; cv=none; b=Bp159n+vIG3H2o+TXLP08IiGuAFRA8ZInqS/Le1uIkhoXFYzF3RKrUoWKSOprsc5B7bfCTr7LBCVAEXLJa4+IS6d82o3bE9GP0Pihn1QRAp+E91Ga+dMwIumlVo6+sCzC2t/eM7l1elphLfYt8Jsw6+Fy5HMcGHEiPgVk0taW+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954465; c=relaxed/simple;
	bh=H2fkpda4QTDXLjTbUXq9Hwo6C3IDYqfckLGQqzPvBUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mm0Qt5e2GQ3ICHM0fluQwRl6wMIQSHqCwJe80N/xsASc1Sw5Q2aDaNyMTSff8s6mE+2GI6MTy0EYngys5P0Mvlqwfr+bs/MrWB1pzHkRZHAmUuLidrZSyBTCg7SSKhkhlBT+PhK1MZbEarOOCYP4cSbSPfVJC3HkqYHErtrU+FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHHUK5eS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPfBPxUg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDp4h1398890
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=; b=VHHUK5eSgjv53HjU
	FauSiO0Uf2cBnKOfqOfwfHQgCnafmqrF4uslpK1sB7OhyIESBcobZ2TeAYfx4l/t
	VKa5r2k6o4vYHbSl5ziExVOXRHvD6Viij7dJF/3hvBSwWhMG6XkMssmi06inMcLS
	fLP7q2SJNzh9ztW0GdAS1529q+/vLa+SiNHrQsfEjCfZBRMGAjZrXF/J+Urpb2ET
	j+6Ak22NMK7B4LGwcoQ3SEWZ46UkztdrQpbVWVETHXGP8u8DKvhgBRMALQZKnY3t
	HZSoVs3veJny0VL+sdYpUNH8b2SBGaFlFgdSlAJTsYacM/aCpIEXCyBAKL/hTp36
	hmqiXw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4s54y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:54:19 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a17baa4d18so4420765eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954459; x=1784559259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=;
        b=LPfBPxUgMyES6rQfPiIwrFatQK2CR+t7aMW3DkBE416G0CaiMoCNcImp7jAwUEUrT9
         dJJaS0RvvdMe6ShLrWfmogU199VgVVFU2RFJJZblCE7BZhYUWh0O3vNGIk4X9UQDHejj
         j5vzhTzTuw0nUBZ1cQMKB0vCQVa6igx0Xm9gm+Z9peq9PtFZFppdeXMl7coK7JVU71rp
         njcb4JZUKHTXbQClCOuyV7NK91BpzCwdmLDolQD/cfXWNGO01XrniE4K8VACpfRb0r4K
         ZvxptGXkz3e6ANGVenWohbEz/5JpDtzuSA8T7nByJGWvh/AngOQb1HYYNQnlVSkC0DCs
         0CkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954459; x=1784559259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=;
        b=Ek38pn/trAu8KHJPmoD+9ekRFxeBAOCV2kXBXe6fuut/aWhF1dXYAIXZUHoM7OZvzM
         9h93ugqkozLgcYh7lXxLDe4EF9DyLxoIJ5wrLvOKCJGbGv26bjC+IK753LKXm8gW+BiU
         /ZIQo1PW19JLsIXbljrfmcRAEXmReNjYekpoYyZPgrBhH8vgY/1DQLJc1T0meMrnQ4KW
         6rS7pZO0PH20/Gcxw6pQfpUZkeFKkbjI1KSjUHKyo4ONPJ/LX+RpzJkUIf68+0UwmHQX
         xnXb6okk97BUGHJD57U177pchEdLwBwg8oQaI01SdMe/ojGx8lI18KCmdYx0mlbHlBDI
         8hAg==
X-Forwarded-Encrypted: i=1; AFNElJ8Ptrj+reEYiZQWzniCsQyWSndVNtLcHpovxlU1QKimsO7aWXJ01ugK++nVCT+xF0AMmX+GQ0lzuEFTW7/J@vger.kernel.org
X-Gm-Message-State: AOJu0YzgnGLSf0JW9rqYKoluRXDO8dFFHD0IiH3us31yVy3t1FTQD5NN
	WwprZLXTVjDhuaPIcvZm/ekJqoFY5nZWlcfRGmkzwXfCSKiMO3IADbYN/Yn9JGaMdnFE+N015Zb
	Tbx0d7AEsL3a2palf3E3nzH9Oocd8cfWLk+CY2lZToRpIcRNN+rznNURHcWKPlDgrhbBI
X-Gm-Gg: AfdE7ckkBZZrrZxhYqBa3/QqmoNBj3/F2sZin/GLYgUACuwufoLMIQMP2hrBWp+ZuJ1
	5RtPPIIVCehqq78hZEKNd62uHg9QAHOO2m+PVOKtmCb4rKDzpEY2H4Ao/7JSKTpPu9pimQiZD4w
	OwaavNz6RsRVY8hkPKNUZ33oG65j6AjbpqF+ZBxto6zh15GeRGb7b3baoWXAfLKDKyrngXQZu+T
	xUILf/XXdiU4rWz4Lq50nP6AL2yqzHYhnEzXZMR5Nzz3D4IJuxfLBK6RcHEUHuSBs8vGJ/BfSln
	3h8YXHvWf8pZPStoFTnSw9Qnw2nw1mOpO+Y2+TTv5g5IY7FzgIJWgA5MXJxfqK1gKuU3rCHHMwt
	kRotTYV6uo+9MJdSX8evgvRwTUPxT7YailPo=
X-Received: by 2002:a05:6820:a08:b0:6a3:21bb:17b with SMTP id 006d021491bc7-6a39a8348e6mr5633449eaf.58.1783954459178;
        Mon, 13 Jul 2026 07:54:19 -0700 (PDT)
X-Received: by 2002:a05:6820:a08:b0:6a3:21bb:17b with SMTP id 006d021491bc7-6a39a8348e6mr5633426eaf.58.1783954458738;
        Mon, 13 Jul 2026 07:54:18 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:54:18 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:41 +0530
Subject: [PATCH v7 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-3-4d91bcef50eb@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a54fc1b cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zrNp7rCLQDew2w7GYOsA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX1xoSGjFXVimw
 NE8YghkHqpyOB3slRAY6XN0OFlX0uWRxRMzCn2PGqXpDR9meRmmyRa/cVEzWuuUqmdLUG93xr86
 /gbbTXTxYfgNMDWd6V2KL7qJ/PrCODI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfXysGFA1sqnrbL
 SP2/BQ0iVlq5N94g+UX3RB+5a1SpFE7FdJJJeQ8nKszuzQKq6sg3KImI54dol9MO3UaxcevDp5+
 EJkzrfCoFNGVczDpdSrOGvfNiXjqgKwQ72X/9olwqYRUE+hkZHYaR0C4A8IIPTx/sbM8NszBGiO
 xF9gYi6NDleEzg+UcEL9S5DqL7LtwfmCODe3DLJFGgDJ/a2EnZdxTXjx8T8uzEZ0woXEZ0w/1J1
 4vhrLeleAfkE6t8Ht4QbyoSX+6OjSkUxgvHcX9VrVjgbooPbI8mOD+C2w0JVqURmF9+HPDulKer
 onhOpiu3L3Di/uXfvbh6ahrcOeA96ARMw6G2c9cxB5JjRNkJLjDFl/edtFH9ml80Zo7WZM5E+gj
 /scYrseeHpwOuBrv/aGD7WtWIjCG0VyxvdwXj1eIIh/Z/T7/uhi+uvQpOrIsa5058xqMNEKESE4
 FfGXyyAQX/jGZoFdR3A==
X-Proofpoint-ORIG-GUID: FEzP2fLIUidVAeJVGppdPVu0Edu4ETq_
X-Proofpoint-GUID: FEzP2fLIUidVAeJVGppdPVu0Edu4ETq_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118809-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dmitry.baryshkov@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 07C1074CAF9

The Milos camera and video clock controllers operate on the CX and MX
power rails, and require these power domains along with their
associated performance state votes to be specified for accessing the
clock controller and its GDSC. Add the 'power-domains' and
'required-opps' properties to the camcc and videocc nodes.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 8c92329889538f0d79f7af436898e3ee278e361c..7c42d6c89829e4bf5a2ade64018623e49623462c 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1892,6 +1892,11 @@ videocc: clock-controller@aaf0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_VIDEO_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -1971,6 +1976,11 @@ camcc: clock-controller@adb0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_CAMERA_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1


