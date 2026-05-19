Return-Path: <linux-arm-msm+bounces-108359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIDtCrIFDGojTwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:39:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B90578399
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CFD430826CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 06:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD2B390C86;
	Tue, 19 May 2026 06:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzKooqrg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hass4uOd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4137D38E124
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172565; cv=none; b=LQkIVCpyddQ7twE/Rgzh9oAzgXmO52Vlb24EQ6+lWFgoT9nQo6Z37NYKw04k9B8kBCssyTwNqAET6ONHFlPavQUeZagW7/Fr7sc33T1zydppn//6YB7gtfDEvDf/pUFdHO6uqQMVhfooYe8/LGaZ9Ui0amFjHpdngHeluNx4Z10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172565; c=relaxed/simple;
	bh=k0yJ7kV4O+e0EI+PQKgXwEgwWi4xO0n751Z9YELXbZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u84NNogHLKlBAtRP/TlafAjB8Rv/5Vo23oT4wsHJl0f14ioTQ2QR7te13HJ0AVKb0ErnYXS/Ih7JyMWZGjKmTQ5O3w50kR2pUYdvzQUiUfydxJirfYeNrCgin3OsPVBosVUpxqFXlaZRWqwIiSk7pkfFBeY0bzE5O8zj/KSgKlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DzKooqrg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hass4uOd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5Vr6x4130457
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CgfER8liylYO61nBS/gqDAH26Ms9Ra0JpIjNJstF0B8=; b=DzKooqrgiWhJ7jvN
	U7d1yf2FADSiG5TqfZC7B7DqXkSN7iJaAorH+tZdr5JbWg8+RH2il8kOP+4rcFhX
	eEHYyQm5K7ANY/Jeyh70RBibw5DPkc/kAe20o097cxE2LUZ6N3lL4G+R2BMT6y/s
	xXdm+d8Zw6ZPOLEPJbI7d+TsnhKFh7EnnAuE98japsiYnCnrVTk/spgplzrh1SCz
	antUIbmGM4v+I1+DSDFyIyhyXRwJz8gFpE63GXogQGRZY617JIvkiE3IucThXd3J
	TcBdNWjBJjZxVF1wy+T6DIyZwv/Ac8bmxS8yP+n59DF4m5DoGbv6/92qhHkvjay9
	F8GvxQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1g8bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:36:03 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-13536592ebeso15267016c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 23:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779172563; x=1779777363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgfER8liylYO61nBS/gqDAH26Ms9Ra0JpIjNJstF0B8=;
        b=hass4uOdgGQR1sqjBXecf5yQ94lRltEQbNGiFvIreIDPqCT2W1ej6O4xVwgHS3y3Un
         CoX9qQaI5t1oNG6AwHXU11pNUPhhRT97HDFXBeP9lRC5DOE3ZteOibJBfomG4WsstYZT
         MgcvSF4T+lSItTRlN+1kOKEk5g4bjbPfLizVB5tdRZ1FxBf8mZToHqmb9lVVtT26HCUX
         7Nj5YhwCowFeJr8mLdozXoPwrfyolIga2h2iQOUNjsagsLteomVOv0UzJPxyBtl+prqx
         0tKsvxPS6+UDS+2b3VQkVUn6sG1IH/K1gEzUDzU6c1V3ax8Sdr4H+E6rjZrdkRdwCBsY
         JfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779172563; x=1779777363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CgfER8liylYO61nBS/gqDAH26Ms9Ra0JpIjNJstF0B8=;
        b=eKVS/C0hgK/vwWvMIUCbbWz2ZC58X0S9cn1xb5irG3mo1Jy395m1a1AXkxX9H/UknF
         0YW5oBKTapFKYbkxLa+bTH2+XLnWV192Qt+70oWHQJZ9kdP8sTaDp+YVq+NiTZmJoEqb
         YjuKJHj8pPUfbktk/7+ieOmgCa/KIHwo9W/9+0qbKkg3hBPZ5niHxiK86PApuntoL2hE
         Sr1H1rnwt/D6lCVZvi8HZEwJ27MIQPJTwI/RWURyJkkaZY7/Uu5PP72Cb1/Tlte8bv0V
         LI63uGRNL50aJuy8p++BOaY7inkkjXWPSBhnkgGFrGfs69CIALCde1hKSHmlbcDrYC6+
         inmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0sjvA5ndKE2hYU2+eZk6VZUdpM0Eyj2acozZtyiSZ86L5b5chGe2k2LeZ8t1/GWeqYF+l4ekwDfOdU0Xg@vger.kernel.org
X-Gm-Message-State: AOJu0YwXSfrPVS109GBJjg29NTBJxeoHokxC17BEJW1a7DLrwX2ZGN27
	D9Y5PDeEDhaRNZbaOLy48gSsX2/JJyq/MDl8n9KsGmGMvAgvJe7vf1PYYzlAKodP3sHQXn6X2J4
	ZCxPGiaSnRHJ8cywXscGhaczXa/lWwPr9H2xqtc0M4G863QZ593qXjF3wQO4XpcX/4HVb
X-Gm-Gg: Acq92OFcEixKn6DdUbI54l333QIkgF5DsiVcDOvpYd4t4ImwMhc2LjRBt20zuOuMb1N
	0EvbNLZLNnTy873sBPsdXeU/ofxKYQUqd6TN0lcPpqKHY1gYXw0qNxgJmTV70NDc4GVUTJaYnPD
	ydbLBykukpz4btypB7EfXJjWrEinoAAHymeWY3NALSPde/W6xAilvzkXr2AJ3egJ2L/SHQXY7xC
	ynVuMhfw70rUYQymWoRlAz17x/y+p4K2/N3vFHleKvlCdAaC//d1V+VYjJGZKAkqCn472RdOBhU
	WTNuJkuPxHqcpRsKLf2Sa0EZsLXR1orcLvOfx0nla6qgWvvKb5NbLsUAc+hcXpFKIvmyKQ1athO
	GN2Bipx7d3vSzfjPedGA229/YYwZx1CSA4C0qdcX/aG3IAaYt/v/oa8j/8KKutSTmVdUNaVlfn/
	+WDNSjrA==
X-Received: by 2002:a05:7022:6729:b0:12a:7165:7405 with SMTP id a92af1059eb24-13504b5c8d3mr8397181c88.8.1779172563024;
        Mon, 18 May 2026 23:36:03 -0700 (PDT)
X-Received: by 2002:a05:7022:6729:b0:12a:7165:7405 with SMTP id a92af1059eb24-13504b5c8d3mr8397164c88.8.1779172562471;
        Mon, 18 May 2026 23:36:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm22614537c88.5.2026.05.18.23.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:36:02 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 7/8] dt-bindings: arm: qcom: Document SA8797P Ride board
Date: Tue, 19 May 2026 14:35:04 +0800
Message-ID: <20260519063505.883379-8-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
References: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0c04d3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Ukdo0q4ZjtfF09RWrFwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: UPbjNXoRf_Srd-Yzj4mdyq2XtYSYZTm6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2MiBTYWx0ZWRfX32F5jOc3ccAI
 iVnHxldko83MMZN7k5dt6cElcO5gghZkRR69JI7qCULKkRXfWFRyqVo0ksSJbcLxOjLrmhxhSIE
 AnSDtvf8Fu6Z3PHVYRLoljiY1t68F+kU/KvHGg6oIXQgDDODl8lEWcIfstbEpbhlG+WGsw3zB5Q
 Q94rqBXsig5e6XpBDUdwvq9TsGd8UJvdWikdeYcbAsxW7Wwa9hutpXfSKu6fXwgoUjLoaBefuM6
 S/I1loMr3hv1sOkhpSiKYE9m05yqurHY/4RJ8WcKsjXoRJYHoOwCsUiU6bGlInPF/P/KAnen3/4
 KIqCi5pm8NX5P2b+4Z8chtxG6Mm36WsOske86yll05VY1qq13gjx+OiVgD2bHHmHMsIUKRg66Tz
 OMTvzsTBBRlBO7SALHiLNp6u7CJGzp9lyqr5HfP2ISfJHrPuYrmUwOw/qngWhOwHFvmPIUnnPxN
 DiaPd7+jEJLEB89FFNg==
X-Proofpoint-ORIG-GUID: UPbjNXoRf_Srd-Yzj4mdyq2XtYSYZTm6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190062
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-108359-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97B90578399
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Nord is a new generation of SoC series from Qualcomm, and SA8797P
is the automotive variant of Nord. SA8797P Ride is the automotive‑grade
development board built on SA8797P SoC. Document the board with a fallback
on SA8797P and Nord compatible.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index af266d584fae..ab25323c3581 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -303,6 +303,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,sa8797p-ride
+          - const: qcom,sa8797p
+          - const: qcom,nord
+
       - items:
           - enum:
               - 8dev,jalapeno
-- 
2.43.0


