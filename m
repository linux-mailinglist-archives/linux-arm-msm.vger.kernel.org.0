Return-Path: <linux-arm-msm+bounces-119295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OB97CcaWV2o7XgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 16:18:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F26F575F46E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 16:18:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dCXW4hbx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b0kopuXM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119295-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119295-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F1C030658CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E5B477E4A;
	Wed, 15 Jul 2026 14:11:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CCD44D00A
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 14:11:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124707; cv=none; b=c/VQPDd96lY80ds5mBxDQyMpq+3xXArsQlg53gRzDmKVMeJ0DfCuEeBCPlZCt4jvWQsIoNIXk0J6oIM27BaXojKWK767P7zw557MZkvZPwbSsnM2o/UYAJUkvT6fIOevSkS6NVHKrZCfnl/QwcLuWPFeDqqXBWfr3ReDfP6gUmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124707; c=relaxed/simple;
	bh=HKovxLVfXVSwQAXngyNlJki7rLoRBolhkZVsnfCS6gI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ej53ati3CKUgt09Y/MV8sTStikWyubH0+5D2AGDFdHEIAL9aNGDGC1IRB5KB7+pxGiFi557EbvwtHs6vL2GNcDkKYaJTyPzlgVOWaR0g6FijXhoSeW/GobQ4v86OgeS4NiGsdV1zY4nK3aLhNLg0kt55Hnc5dJt4xlyWX21xHX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCXW4hbx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b0kopuXM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3VpE4006878
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 14:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQ47DDAfNPWgexHv1Ma19CgalnyaHgiZ1WcVnWQbsZw=; b=dCXW4hbxx4hC4ym3
	o2dppgNycVguLGhSpLiu8d4Th1o8MDTqko7B46IsiaQ2v3VxJj6p0Otj2oRbOZdt
	rYTKS0ZlbU9hOebV5QF49IlVgQBqKFIwio4vEgd7bg+QdkyvUBw51RlL83jAHfVC
	l6lOUhrivXTA2aqv2Nh2gj1B8/Jthmfk1w5lw/++zRwQtuZZsYioITf1piBBhKhN
	Op8sMZOrT2UfJwDD/82VMT/kYTSfFu5TnNihEGK6fQZmB6ATqPcZDjzdXRzJTv86
	InRyoyKnrkDE/cxtXd4SShaUqk2Ykae9LCwZmc8RYfoYXW0XX6KQ72XLgCq+1f3i
	sm6Dvg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe6529gjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 14:11:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce02cb769so28202555ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124704; x=1784729504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQ47DDAfNPWgexHv1Ma19CgalnyaHgiZ1WcVnWQbsZw=;
        b=b0kopuXMWh/qqcvsBMjkB94x4dGvZn8lYLxeT1Hqp/QeO+exz2K/Oczps2KwyE+C9v
         42Ert5wk9ZHDsYhr6bbZXfwGGtDlNgC1XiC0pzQyz56MokYgrZP9ucNQ1T5V41rNLIxL
         IQ82uVWXATwkcI9EZHs6gudxJdwHBjwniDf273J7tHdGLWqWiDKBafppovjh9Lj/W+4m
         uEMTT5TShkTEXtsDbhV2oVnMuDzHuvqhrXntpI0qf3jDKHKFtcXFZDSZ7RBuJt8dEzUB
         Iou5S9BFAjD9t0I+fYnHFz7GpXfTOqSLBeSMPNMa0vnsNJmkOHRGNU6I+rPoajylleCC
         1xPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124704; x=1784729504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQ47DDAfNPWgexHv1Ma19CgalnyaHgiZ1WcVnWQbsZw=;
        b=mUOtZicQFA5o/AkZozwgo5GH2U9siOljcylZpFn4auqVDOkRiYHgDDhnfIBxIc2QFZ
         N2Lnlt+uXNFMXm53s9TvWdin9Xr5rPWC3RIlaUMx68a5YqY6KwDuM2yup08PNaYTCMRp
         YGJuHazrU3v4LWCMsIOamAZkxj1NiO5UqXpBmd9xOIe5EFhgeUnBJqhSgWQ/h3VYU6ej
         wl+aa0H6thPCS1of0jF34FH4KZX94GvIEVVOQFcDwWLv0Kxp+/KAI1Y32nm5xCLhBr4M
         1eoHztQr11/5+kzKMFFSGGuCXj6ApHnHjL5Wi1c/HzqraJQHdFvtaKLpzhGxVUY6Od5j
         pQPA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6L0fe3TPtp5fRrfSkvd1WK+q5rXHpUHkRnxFLXyJzPaMk0KyKIvOTK/HE3BWZmyV19e9MePJsrW+CRkAO@vger.kernel.org
X-Gm-Message-State: AOJu0YwFmDZuPeQY8CRXtKrjfnoZuRs0OXjALJbv+eA/I+Vyra4XojoI
	SUka1oKe8hXflUqlXFQaXLd8GFYepiHKPHgjORhodLXpsUjjl0mLugL6YTyx6eXHNYUVOLujYHe
	3+BHeBdsPYbgXYUASnMt8UOFXL8V3Ibo1FKBhy/GlPyEfWx/KSVdYinEF2J0gqC2nHq0y
X-Gm-Gg: AfdE7ckgJx78v05eUUVD4rbjs0c7cmZ8jyBsuIX8ER7sPbT1ffKAP/WKw2YYBe/El7R
	YMKeYx6aNfYanc3MlLh4rfGXSA/3S7gPPqWTwShXtyRrJOBVMgyBxfsg4ADaRwYC8Cqz0LqD3oa
	MjkUirkfeQ1muTwta4TLV2HotA0jTfMqA8/WJHbpEvO8HxHr9B9v20pBfmZz4jDFWvqViNWnZ4t
	/rRxeQdHw8iXFOF0Z2x/K9pZ8zxuarFkuNcUU9n8SEhx4vCAOjIY5OzkGSAZ1UMA2H9X/ZD1nLu
	J9m6lMNEC4hpOHLe89UHFSW4q9EmabMhBVob1pJP56708NCB3ZnbbAsWEz20jqmSYifbLNDAfdj
	QJHlQraP45e7PCcQdG/ZoCyD38B0qvpQju6mlvUIuNrQo
X-Received: by 2002:a17:902:db0b:b0:2cc:6b7a:dfcb with SMTP id d9443c01a7336-2ce9f028b80mr162598935ad.33.1784124703951;
        Wed, 15 Jul 2026 07:11:43 -0700 (PDT)
X-Received: by 2002:a17:902:db0b:b0:2cc:6b7a:dfcb with SMTP id d9443c01a7336-2ce9f028b80mr162598645ad.33.1784124703496;
        Wed, 15 Jul 2026 07:11:43 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:11:43 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:40:08 +0530
Subject: [PATCH v9 14/14] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-14-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=1011;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=HKovxLVfXVSwQAXngyNlJki7rLoRBolhkZVsnfCS6gI=;
 b=Yj06tNo9W4Sz5F9Y8NffrAmj+GAbIKN79t2NNC+0Y4uOLP55xyUcSy6bwfJTvc7P1yLclr8us
 u1O80vjjnzBAU1bFxQc8ueCpHZwWR0/+xWybbd3MF9B/1V6E7Pb58UY
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfXx8YtbrTzDkyS
 wVQnuvq/Q+McxmcStO+hvLiaivqlXaL76sRMHOys8y5AKZBXuyf6If3ToCChCmFIQX+RR/UGD3i
 28GQsiQf/As0ni2t+jDQQchzsM+iQM+bzW3QSYaT+W+R4K/pi4olfAT/bcC8UEiZ0bus6wa/8Ml
 SuuCzUGxlMbGo5HZGtgGWQUGcD07nlO8y3YahKUu2YluZuK+QW/P45zKjV4pst8pedgTn0i4EPR
 NdRS7/iWmR7gVCsQHjDcocxrlA5Y4Qu58lf8jUGp5AQ/oquat0ir2YMj62MEXezNB2svEsPuKon
 76ZHYs8hm4WZ0boGukM47HvWWs1RkFOtLdbr+ddhKnez5pZ+YRoNTb9xurLXF6gFo0bufnBRMCN
 sOiLqLs149/IAsO2xIFJoJxFYJnRXJdsA0W02YbAYMCcn7zBIqXzUFMvP4MbwOBtxFh0J3ZKXHT
 yPzFP3ZvhKF2yN0s+Jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfXxsGGLqhFhRQM
 zg6Gx0GRES3gWb0Qd5QyFSdkPLewPBv9N3wKvcuig9ojZcs5ewTs3yoPVMVPSCRXBXD4ve/YLqO
 7pFnEONjswwzNWmRPjfO2VEvcLjn6qQ=
X-Authority-Analysis: v=2.4 cv=bKcm5v+Z c=1 sm=1 tr=0 ts=6a579520 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Dn0IJEph4XI5J7oltBAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: f8L7G2e-805JbqyRRrk5okS5ig7DHrlO
X-Proofpoint-GUID: f8L7G2e-805JbqyRRrk5okS5ig7DHrlO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150141
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119295-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: F26F575F46E
X-Rspamd-Action: no action

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index b314c6dd423c..3ade94220667 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -695,6 +695,16 @@ touchscreen@38 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+
+	firmware {
+		iommus = <&apps_smmu 0x19e2 0x0>;
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.34.1


