Return-Path: <linux-arm-msm+bounces-118769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rk5/CQvhVGpFgQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:58:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B838374B2E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:58:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Xjx/+UrS";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TcS+whv8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118769-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118769-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 37E1B300F5FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08ABF409134;
	Mon, 13 Jul 2026 12:58:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D6D21773D
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:58:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947528; cv=none; b=K1jz4qwAMv5AMBg9Pqqqbp4ylrHPRB0WSdllDYWGiV0iuReXBdkmsz9WW1mhV4/Loi2WdQ44StHS/7T9bzds9DZDmzHuwCwetcIXXvxbStQ7bBWXkLNq5Gu4Ez2lXqiaiG1PYjqFUMATFKmqwRZJC9g9NQXcYoPFda54vHXqpBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947528; c=relaxed/simple;
	bh=I9VTQjdbXxDO981XUX/Vys8K+bp0aczFFonM+Xf8NjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CXjYUqjkOpv5mygx5D2HHjfNfGuB8FgzRaD8M/re2z2yIVzhmSZ7D90MHPgPJiSkvBYbIf4y3YfjL+EoKkcXheHxh6Kg5az+kqp0+Zy8eFl9iw2j04zA+bSp2Vh/vtAtovbkhpsu2+GZAj5npVumr7CayJg1kEaEQPeYam2Vke8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xjx/+UrS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TcS+whv8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDfOc1299430
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XdP6BiYreQ8KP5TA+jNeAWVZzVOnmZNP4id
	emgPGP/8=; b=Xjx/+UrSXnbaW6mdEbIFkNRnr9xSzxI9QrH2uNr9vqPlAQoIdG8
	mQ14s7v6Who6TEosWQ7JszNoXQLHK37YrPGoXgDJsQI+t118NCimskictbp70ClV
	qqsexcPoHyS0PaoRKibAbCsFShQKJPn9fNeKzoWlp4WEBimGq/MPkw6RloOLRY3+
	fo6Ds+P/9QyEvioGIEy/5TikvcybeY7WaiPf9AOzTEBnChe0Qzjw1H4kJPXyrGRA
	3GLIvWQIeQmq854VFPcX6i6h2PwC31n79fnD4dKCmCeSbQNb0CLOwBZ5/zY6nGmd
	9HLknabrOXr0XrX4KR84MKJ/8kjsiUhOoBQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3gpjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:58:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a87ef9713so44164521cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947526; x=1784552326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XdP6BiYreQ8KP5TA+jNeAWVZzVOnmZNP4idemgPGP/8=;
        b=TcS+whv8sdsvuNKE6e3RwXCmEn50HQUuBC6EK8vafPDb3yZztiXhdAh5aHD8oRIWzT
         O4Nq+PEYXTys2UCD0SUhBo5EWSFLN3/Z/0XeMd4H+er1bVswIQDcrVHbyivMzAwXZUnu
         luL1O4fsNb7e/5Tx1FWNj74FK0C9YeYmE/QHjBKw4+Q1SPzQEhJlMXZDhEnO2QkqDn8K
         k2Dl/NzJAEOrOq53t0ahMTk6tLcFER20/R+6M4IN0bSQQIvihkYWKouPj2/pdMrl0gCk
         6UR+EUFGTfOTKKUEFBcmxuDniLE4aMh2Suixa7wqXlJ/36Om2tOPfpmG0RYPMUoBJlGV
         RheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947526; x=1784552326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdP6BiYreQ8KP5TA+jNeAWVZzVOnmZNP4idemgPGP/8=;
        b=nfb6flDA8bIwY5LVsv2ZWtCx/uw1Ru66aTBNJE/QSkiyY3yNTlFES/bkHO0lPOu2DZ
         JpYGWhYuX45/xs7TOnKk1Xe9IZaf8v295+b1BYkd6xho3wbVDnP79AtNIkh1ppsciYiu
         U01YF+3NCzW5ph2ygyXiV1Jqd41M5ZvBvSePcp/YaWgh9OipEJ2MxEMvtxEgj/dx0u9W
         1oVX4gRJ2V4ME2eUBBGBDDEe1nLWBBZ8QP+w8omuprWVE3FZWuqBIwMDCySUUxVGwZ8f
         qy0+NE34ylu+dxBMjymfL08gFG4WveGPIlqdv9Kvh5IskzEEt3mkeuB/WKMnqHXvZHs0
         g+yg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/Gt1pBe3zuMTVp/K1BTJjHVrSMrWclHqmA1moyGLh/jv8Uo/5FIu45ZACxThDaEWy1QAvCyylQRnNPL6V@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8eikplMZ7iDS6WRTWd6cSmIUENxXV3KUOJtYLgxWdBxhVHzyh
	9qjBNBysC3lk1QRmwsq3BQKfZCaTCHp+eH3+yM//bKh+L02EAF+CxUAN2olcT2KvwbvOLSHaaqb
	Ma8jqm+ePH1mmuuCVx3tVMwJ9BKgUq/vbXSd+qQq+M7HgHPKuA6tfO+1jsLtHVBRXIv8l
X-Gm-Gg: AfdE7cm+tQXmhLIXT1Aoh1s+NsDqB9zM24Lbdb9gOKvbO6M7pDeo3y8gwEWIUHlmim5
	GRqIdaoBFpXNYSwthXcs+x5ww1Vl2kJ14FLgb2EEzSMkHxxAiFvr7zplmhsUIeAf0A7YHeFMsoB
	VRQ8hHW7DCQ+kZbz65VGmwhBla+rwOdp6TjXHyovE9PFSyGlR7K5deg+IXeKCpU5e+IVxr2bVuP
	dCX61ErJSbXPue8H+i3gYTVTba9HlDK+g0C0Ax7rBFnCJECaxZ7agLejC2zv82erRokxqdDSgYM
	wOQpERpG29F6DGb1N/MfcBUNCYUPjiXJWtLt5QXUUOpWhDLQSJBtkwhEZ/VsyvtLnL4Vp0/HWfE
	xquOciHlc2kOYfdKVA9wdHdH4mFA=
X-Received: by 2002:a05:622a:2511:b0:51b:fb5f:b263 with SMTP id d75a77b69052e-51caa02c6camr128177731cf.4.1783947526026;
        Mon, 13 Jul 2026 05:58:46 -0700 (PDT)
X-Received: by 2002:a05:622a:2511:b0:51b:fb5f:b263 with SMTP id d75a77b69052e-51caa02c6camr128177411cf.4.1783947525609;
        Mon, 13 Jul 2026 05:58:45 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a558easm87187471f8f.27.2026.07.13.05.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:58:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: eliza: Fix DSI1 phy reference clock rate
Date: Mon, 13 Jul 2026 14:58:38 +0200
Message-ID: <20260713125837.727632-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=I9VTQjdbXxDO981XUX/Vys8K+bp0aczFFonM+Xf8NjU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqVOD9pWsKtmKrXjOMzwkYBWFcHVEDnfAi5O+xs
 EayVvvesvWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCalTg/QAKCRDBN2bmhouD
 14wdD/9CEgHmwJbGoVVTL+gzeUxepciPlV64FTULj2sNIz+WMYIltmWuMgwlWt2g4vGX9OTry4Y
 3sSj9elEUjRY36+d6adkxx4VvNM0AooJG1rTsBvS96eWogK/nIAGIXs1F3piUpyCZUpL7Nkkn9R
 2JwiFXuDELBiYkWyFRKQn7HL2dl9Ui9LOg/UBdBgWQc+egBDk8xMXwpOAY582mjEjxRZDOeWDQC
 v/fuXK5I9e+0FqcvnaszK69f9xKnMgjq7lvowJPrcE56JswPqtMx8S4fn6/m6QoW78JfRceBnUO
 kt0INGwB9uMY85qXj4JvtWqIxp02LJCpnBT5xiCz3yfNJp6vqDWusxMYm90fZxFXGQn8idJYUMp
 1zk4Q8p2MRL2ae0V/+BcZOcWVI+Hu0obJL5rxGPW0EDQxRAW0toJqVAfA8JtTv1uiT2EU8LKh11
 TexU5ybDYJryYkSs4tbWZO9Nih9ppO7M1Xi5fR8+yfgMpFR2IaOselczg1dtVpDRpeqV2fWXn6p
 a2ySdGS+gsvWg/7A8M8gHa/UyayrZGUwYw/E3/RG8tWMELx+/VSktY9+IbLDN81gcC/9oGBQd4u
 NEI4KB1rx4CNmdlLcf3WG1kQ1pAOiFfgS2DtMVI9CUOfI0aohMqt1/oTfeBhu8jvbY00G7E2Vwt L9bcc/POsK4E3bQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 43llhlfqy_itKSvlK6a8atos9XnDiZel
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX6Mxfw8lxJFLl
 TJwpt0p8e/BxTkYn3MT88lP7Ij99b1gJ4yiyfMTgmPsY67Gb2QE2K26RjnWZ/ymM1+teizPcgoa
 XRnjqzoAzoqiPb3KoLILIKYh3Z0m5nk=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54e107 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=13iKjLuWfy0j0Tg89WsA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX7EttyMxmxpGP
 fbXB4OWSNBFVrJjdvuw2g7B/PkoLD4qeKqADtoaJcvQBKcNRZhe2oNox5Log48BQo1P7VTbEIBQ
 pkoAvYGWwRRrX6fMNdVJOOorOkI3RR1upxyqGovnHnahrLRDLJQfp1caankwZc/Ep6+UyzjAa7Y
 Y1zlEf/c9z8b4tA6QkoGKHDEyy5u1ealtM3gRiHYi1ZwVdrOs6KiRtJQWVMEkfbmPePQcRSwBzQ
 pmHLfDcBQtLOJIQAHEg0V77lJaIp3QXKN1wAomDV0Njrao7TDz0jRPqS3sW+5KKZL7V2CaDriCw
 uL8NioMgAU4l1xYH1IJ+Rro2RO2aWPL4mpk3WYCJJjpfXyFjfB0B847LAucqp4ddLAbOOpbO07k
 Y6zpbOeDiAf2XmBXAGJygPpc9dxBEn+0mDWEVtgOJ8P4XgDZJvsemwmJMnQMJcHGFGshsFl3D8o
 JglG9iy9hRvgTME5TKg==
X-Proofpoint-GUID: 43llhlfqy_itKSvlK6a8atos9XnDiZel
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118769-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B838374B2E1

The DSI PHY CXO clock input is the SoC CXO divided by two.  DSI0 already
uses correct one, but DSI1 got copy-paste from SM8750, which had same
problem and copy-pasted code from SM8650.  Wrong clock parent will cause
incorrect DSI1 PHY PLL frequencies to be used making the DSI panel
non-working, although there is no upstream user of DSI1.

Fixes: 159d252ed800 ("arm64: dts: qcom: eliza: Add display (MDSS) with Display CC")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Fix for current RC
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 357e8066c176..ecda1f448a1b 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -2557,7 +2557,7 @@ mdss_dsi1_phy: phy@ae97000 {
 					    "dsi_pll";
 
 				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-					 <&rpmhcc RPMH_CXO_CLK>;
+					 <&bi_tcxo_div2>;
 				clock-names = "iface",
 					      "ref";
 
-- 
2.53.0


