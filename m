Return-Path: <linux-arm-msm+bounces-101668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEGvEMjKz2mr0gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:12:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FE4395047
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0BA7304DA6C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 14:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411E93C5523;
	Fri,  3 Apr 2026 14:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jnkaYIEI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M52m5a46"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D45397E9E
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225484; cv=none; b=Vt+NO7IHABViGDGfalIjpOz/ZBqwVtewuozlJ2k2TaijCCBqc37wvTfTnzta4CzB6FCdz28JZfatuZFq8YfBy/jHYkDGYVSIwLF5E7Vh7J8c+9SdLHuFn9NdNv+EY1LBTZJBFUo8r9merQrfPU5EMqa0aQOZE7cXPzVe9IX38nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225484; c=relaxed/simple;
	bh=8maw/fT027cS6ut1qfM0lsSbHc5qNfPqtdXoI+E29ws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I0NYz9crssS2UAZoIuCTXjP3vrbrzGNeLhG9hKKtD9Vud9YsHAL85OwsFyGnx3v+zsnjBjJ21MF4JRdV6TYHA3ZuDfrAxtGwjTpXecDuJvA4w6CfZYK6wFmrpKqrVeZFc/jVtEo6dgPTJMY02/O+rUhS+FPGIfdsRjnYOAsPgo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jnkaYIEI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M52m5a46; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633BT4tb981428
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 14:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RtrpVGaG/qb5UuHyLBRD0j7N4RxW1mJWpsqy1LkkOFc=; b=jnkaYIEIYrka/5FR
	t2FkELDxuyM+POozKlqfLxDYzoxLzDd8B6gJrFnn0vsZztR6eFyffwwC0KaEI25S
	eE/SC5p/EAsqLDXbfcXafbxnc1mzY4ftohEhcJmhJyNEs2QMViv4JMGysvgqDExT
	rQE1/SGdyOfHeB2mGC1eZttffd0U/3WJqzUYndEPogbCYSlQLOrZqObDRCMrtsby
	naa9wieNvrhyWL/OdyXvOSnB/o5MJcIsJ5Nra1pmnwmO9/Tfd22iGNvmV0A9P2h8
	qCx6siUoZn+DbmoFuobLsHzaJhoQ5OX0/Odhb+xP0Uw88/ULVQfS8/xqTiwuZcmA
	/6UwhA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9tupusqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 14:11:21 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9484dbd65a7so691226241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 07:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775225481; x=1775830281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RtrpVGaG/qb5UuHyLBRD0j7N4RxW1mJWpsqy1LkkOFc=;
        b=M52m5a46JDSZ2xVJhxDz3ee3OmkGGXKf5sgziwWSXuaPgeMQoK0OvPmbknXYszIgha
         QnYgi76OYqLMcJsRtkbaxNM6wq9clJ5YbUqEYTd1HiokOa/r3TYyHLaoD/9IUA7Vnb/Q
         ekao7OocdrcrpYW34t80Z0De6qGQZ7j72VRshMfFN8XyZrZEggZJpMhX8fiHUv7UIQ+p
         z2/+mCuWnQSp0hh+VwTj7bTFSUFZe/7gItBv9HFR0BupovXABQZdRBSHwcmXC6WSFJt2
         K1hKQghMWUmRIcZXTtWYua8Ybpf1IioBwsuoC5Jg7qJzRjXGLMMb88//7yUs6GmLm5Nu
         t41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225481; x=1775830281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RtrpVGaG/qb5UuHyLBRD0j7N4RxW1mJWpsqy1LkkOFc=;
        b=nvdsvwyuD+TnXYstwryzywKXnB27/EcEpRK5kF2Uy3NHaQ3vOmCENd/OehxErVEPoP
         gbG5kKB8ngSjGuiT2J+kQTBisj28dfxrIqI2GIewM3oiFZGFiZGCAoBDWJh4u6BQ+6yA
         I9qVCCqNF41eJV3LUwBERfEVvrsHj803lVxb5asRbBhxsmB/MbIgraF8BoRRzGF5wngW
         enx4GN38o2ju9bBjcgaKiO5faAGAAqd5xOySn4X1OzTLaiu1cKuCvEq3Hek9M3lVVrMv
         ICpEqQBHbGdjUK4lGN3WzPS4PdQHauJpJJI5ZCEWc+oTVJa1KlepmPC2oKrirzGUcC5b
         Ll1w==
X-Gm-Message-State: AOJu0Yy1ksyGILZIGegrpUjyiuuCx821zZai254e8DcVGNQMSnlcDAvX
	6tGGW7Spk8jPNFe5bzgvhU2iHQNKGDrqZcfzlxX7GDStUkLkJRUqAiENtnl3BRPnqOnhN0FVMrI
	xiiOkVtiWOkHboNZr6DKn9D4G8sSFhVBhJlJ7TTCFRwSFI2FBJmqbtfqk8JXBWQVbqAOz
X-Gm-Gg: AeBDietgwfeAA3rWk12rnS0o59mKm6yalS8GS76TjcJHx7kuTIg8Jv37YZQKWxYsEpl
	QSxRMbo0zxHRx9MujOGasee7eo8Iw2B4cCAljNJ4m7zYYayZx9VDY4oOfJipUDOxTcLNVgsgAmX
	+ArsBTQWllbN/T9QSoaR5xNZBwpuUDhMLVIBZJEHLWMR5oMkFiCz412kP1lEZgdoHucsfAnwH92
	oUXTXo+9wOLeaDzOq/f6+reLV+TT0Ao24cclMFfk/CpH+h4sj7d47ejO0tJWMF+7F/zSb9swfzB
	sEcXlxAMaiRTnH25hcPj4PAZA9xsqAI/woiwFT61232FUEjiDvf3SAUjHkY2VWGcCasl8UF7tzB
	03qIUKqiMKL81tumU2A0K1+KMZGvQFOEcU/aDdy4rs79VZAimaQs=
X-Received: by 2002:a05:6102:808e:b0:5f5:3638:776f with SMTP id ada2fe7eead31-605a50fcd2fmr912862137.25.1775225480722;
        Fri, 03 Apr 2026 07:11:20 -0700 (PDT)
X-Received: by 2002:a05:6102:808e:b0:5f5:3638:776f with SMTP id ada2fe7eead31-605a50fcd2fmr912852137.25.1775225480293;
        Fri, 03 Apr 2026 07:11:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d1b19esm30127315e9.6.2026.04.03.07.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:11:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 16:10:50 +0200
Subject: [PATCH 2/7] dt-bindings: clock: qcom-rpmhcc: Add support for Nord
 SoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-nord-clks-v1-2-018af14979fd@oss.qualcomm.com>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
In-Reply-To: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=949;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=E590LE2bCnYKbTU4d7bl5dBbInnMd8BSX7Wam2pIke0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8p72uFD24m82FANm6XZZZegbUNOEe/0YrDvs
 VhKjb4cY1mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/KewAKCRAFnS7L/zaE
 w0VVD/9GDKhPhvnhDiq3vo3PXj3epOUdglhyQWXlujODHh/+pIVGYPujuhEdW3D41FmFs0duqaN
 8Ir/3CuvjbcKPXL4YzN+F5HL1KwIo0N+EtXxPhlTH0T1Ycoz1D1ZgGcYwn8c5Rlj1nWecAGQZLG
 CpMU7ZG7OKuoYwYrkZYM+4qEB3+JhnaKgud4ad3q43XKjVlCDu2zcu2bcmiWVOiXuZNVam6Hgrb
 ZOyDKRGtSDDudoH8Uiz8BFsk/CyKeI1h7GIh4WV44Qrz9ei7UMvDAc9TJxne3pnM6S9zAcvzMbg
 PdidAbqvXjk7hC9i3wDm7I786kDFTWPIbpMbuFlhybCJ9u/a2fOi3tRoNbQm3JnWYroe9JWtabr
 jzf+24Lw/wOEddPDCbw57TIm1mn8sPaqG5wqzJmFHU4nMr3pAaObXyS/fhWQ+SAyP14r7EVGiGA
 L944olxkv2RYQSn/FltrAufcIgHzHtxO2Z10epXxGWu730DLsGBGzEZUOSNzKTmK1QqX7Ew1tIc
 V+8GbeiYwNcfcaT70Jqv4huK2watI2UC+gwpUzgZYXZwt5HX83SbLFcnCAsUlqgZ6vUBlC7OTBB
 Sys4/lmU/U/bV6bXuVXvFWt9Yto5/oUHt4jpOABPAOOhnDPEuHaT8eiQvyId6rbJpXTjPOX6IYd
 AZnFqbL9EPRHkng==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyNiBTYWx0ZWRfX1cVbjg7+OflN
 BEl6RAStQldGV65tmI8B3WKohL+0VsItl5usvzboq/YbtxlKN3XwBCD3H8uuWgDsfY77zibbnF8
 OD5adv8EoKVWDpbuAZ5bxu8oND2jaIRhPC31lsRSg1mGhKkbrYKXn91zioIR7F/CPknc3K67juY
 KxKJo1w+Xycw7r7Qgbn9Nfymg8700giuhwvCI72A/hg40m83JmBOd+BKzhpREkatreqr8tSIyly
 +QIHBcFFaOJxz1yqLa/TCu8DHQNeP1Rj7cqxOGuzje2Vh2dOJEgzAtnAuBLizB1K6oDqqEVI/lw
 yp+QFHf3jy95/2sw0hkFz1D5/jzev3rTa298mOa7mNQVgybiazGO7LgrORAt0cinSTGkf2tc+M0
 z9byFFjRgCYtFvBducF9Q8tGmHLvuBbdmvY5/Mxz4eC2IznUs99JoIj9RYaws3xb3PNFqUdAFV6
 RvNLtnXMTWURKdP4g4w==
X-Proofpoint-ORIG-GUID: DgpNFtYeEEDChve24KrrlkTks96RDHnt
X-Proofpoint-GUID: DgpNFtYeEEDChve24KrrlkTks96RDHnt
X-Authority-Analysis: v=2.4 cv=DZ0aa/tW c=1 sm=1 tr=0 ts=69cfca89 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=fWd7RFOGuVLGcsxqf9cA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101668-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,quicinc.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88FE4395047
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add bindings and update documentation compatible for RPMh clock
controller on Nord SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 9690169baa4697bbd3ab9197f9661368a0827bf7..a2c404a579812dae073241ea71b63e55e798e80e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -21,6 +21,7 @@ properties:
       - qcom,glymur-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk
+      - qcom,nord-rpmh-clk
       - qcom,qcs615-rpmh-clk
       - qcom,qdu1000-rpmh-clk
       - qcom,sa8775p-rpmh-clk

-- 
2.47.3


