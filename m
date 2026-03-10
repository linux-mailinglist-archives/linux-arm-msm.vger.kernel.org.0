Return-Path: <linux-arm-msm+bounces-96588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JSlEC/vr2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:15:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B05CB24937F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5120030BEC79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF8444CAE6;
	Tue, 10 Mar 2026 10:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oxb4U9Sd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZBf3Hz5G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20CC4508F9
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137422; cv=none; b=gE+HE/Rydtm/5K4+OqQQ4sCPL02rNU4pzQbqUhlsG6U4uvpDUcZQCerpI3YMXu977tEIk8teNFN2OL9MHGvYAUuqe4Sp20tLdJ4Qn49AJHGDfd/RBjczxyDVH+6eF0jgUo1d5bQzyrIPYW40V/QO24cP8V4poAt/n3vjy+xGfVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137422; c=relaxed/simple;
	bh=13Ln5KAyjwzlXk3qumLGUlUTsVNFJKldZv3D0K0nZF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rXCkSnM2W2BDY0LexSEV/N360wQtiv5b0F8+wKXmGPn3lGPjSVoQ2TMir72AEgePS132jYO0ZWGvxtk6g8Rln6u2cLLJSmL2hhcJiJ0Oc2Nw+DI3xKvABQl9wZ53rO96x0bBx2SypjdYkiqaGlOyX/upVU2VxBeidc9iGw7wotA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oxb4U9Sd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZBf3Hz5G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A7wJLL3124462
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rtqlM+pj78Xnxp5iKrVYKE03/0E6wwqbtHkM2kXx7Pc=; b=oxb4U9Sd8RMYVGoy
	BYiLO3S5fOHwet1SbvzCqgipWWT6G11zbHQ3l3VQ4vTBsJKLd9ufjn3U5ZfMU3As
	h8sME9c/f6X49ylpx21c/yNC1kdtZIqXHSRU8IWPZ+sJgX6mC9SGooIo4wsuU3qm
	5takXvk+6hi2Nb8LOxvcpdn9TOncS1IhaWrDlEZ1tC5uqudUEWVmnO7arvIvcWsk
	bVouwL+yZr5knRgSluoMheSkodG0XSuJGB7TDj2FaoEuOU22aQw+/YCQK7CyhBf0
	N0+jSWwM6pWUaRu/ktfnfaFBGEp14XXidq8ATIqTLBwjgZr51yAPZhlOuYmn+KWB
	6JcAZw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj0h79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:10:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509219f94b0so96423931cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137419; x=1773742219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rtqlM+pj78Xnxp5iKrVYKE03/0E6wwqbtHkM2kXx7Pc=;
        b=ZBf3Hz5GorY+Us4Q4AVjMsk8VTgecg5lCcZeLmvQvIJYb4k24J6gHKusPGa7TW0zJc
         bqKkgL4fSrb6/hGdyzD1yh5xFYF6R2LweFzFuUkewCOy391hA52gloPnniRzMmEMZ/ju
         +hEXa0ypZxZKM/tPcGPqSPQWn0OWM5DSrsoJvObMrUBGdDtGvEIj20mrL3C8Ed9iQ96f
         Zad8H/w2KXgKqECFsA9GeoR7b3cRRbqicm1w7pTyYaa6QURVONkyPYWk9LEzfUXfpchS
         jZuPu+k8HnvqaI3VBIE+3hqjDa3QeF0/t7J0QsBEBuOZVe5GTZ9zlfvYtz9NNVdrhSmm
         jk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137419; x=1773742219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rtqlM+pj78Xnxp5iKrVYKE03/0E6wwqbtHkM2kXx7Pc=;
        b=vOKI3GqUwRJh0xQaVUMZhQR2o9HLg7j7C1iQCklAwOQDRSsuDCbYGkePsZ/sA+bcK1
         VSLWcGN0Uz/kOVdh8BkxP3grFyct2S5pW7hW0l7++/vPRUNZzD3xSjSvab6lbpnX2ceX
         +seWetB82SBMFpQe6PcbO0uD3PQ9Vtbbe5U+1d/B9Ik8tgpuynr/Wdo8uuGYaIjSlcLU
         hCwUXfkQ2MPJ1ksYIm2Dq+j0LXDIGxOCQFw5BJ7X13m46f5HSE7Ip+TK3/kP8jLfnq8J
         iWjGjVotgTtLeG5X0fccXqxvI1aoYnV65UtNMYSn1ixD6/R+1DylY9DiDjRHRML9Ceqr
         zaVg==
X-Gm-Message-State: AOJu0YxGFERyEAoeK4WpVRzvRYtkTcBraENdK3tTEQkeNOogzPvh7V/M
	w1xCS/SYR+Txibw7ZmB9JMOCHQ4k2N8ZsOPmLSxwfq6cJxdjWlbo3LlAleCae2W2HkQl3P/zjoI
	o9bJO//hoV4IMNxIY8tjeubosB7BT/oZsqquy/3S3Pxc204j8+flbJY1Qb7uClzZJ1Nct
X-Gm-Gg: ATEYQzzEE6aKKBQc7EAZhd7VgIlW3Esuzk7BLYk44gbpoF/TYEgVmzfXfdXBEs6v7L+
	gPREVEVXzUSMsWrcRspGjoDt4OfC8S0XPhwJbWKW9Uqvx/ESnSei5lgUqE8MUqNJ9djSv9D6Qpa
	uywMEyyMXLNSMUmTVJASI2iQgrMy8UReRNTSxAZKpRSkQY8MVAaMGe9aWe2t0HUnau6EiqWb7ed
	/k+LIOaKA9sMChlqSQ2bkgFJMeicQM8dsJN2XEMvPbw82TPYKQr/6YhqO1JS+mSj9Fm8Q+d/3oO
	Hy4+7iwu9ZeGmlRIVAOVIb03i4A7nP13PSq4J4lkeUpH09EEniunyNe14Ubgflin5BsXQ3nXqH8
	SXUPBEU8H2pd8ShCVzpPHeovvIlEnnMl2sL4lAuc2Sqka
X-Received: by 2002:a05:620a:1726:b0:8c6:ed3d:be60 with SMTP id af79cd13be357-8cd6d4a14ccmr1780251885a.71.1773137419165;
        Tue, 10 Mar 2026 03:10:19 -0700 (PDT)
X-Received: by 2002:a05:620a:1726:b0:8c6:ed3d:be60 with SMTP id af79cd13be357-8cd6d4a14ccmr1780248485a.71.1773137418752;
        Tue, 10 Mar 2026 03:10:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a7f182sm87703575e9.5.2026.03.10.03.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:10:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 11:09:51 +0100
Subject: [PATCH RESEND v4 4/4] arm64: dts: qcom: sm8750-mtp: Enable
 DisplayPort over USB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sm8750-display-dts-v4-4-d571a786bb70@oss.qualcomm.com>
References: <20260310-sm8750-display-dts-v4-0-d571a786bb70@oss.qualcomm.com>
In-Reply-To: <20260310-sm8750-display-dts-v4-0-d571a786bb70@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=13Ln5KAyjwzlXk3qumLGUlUTsVNFJKldZv3D0K0nZF4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr+38rnDAtnq+EzDxaKySSouzTQSzjgiUiwKYC
 Khpu0c0mjGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa/t/AAKCRDBN2bmhouD
 1+SPD/0f3GvX4BheY9wiMDhtjHS88kplP17DKEr/FtFYyTzA/mkEDl1w0lehNi8Pi6knK44adt5
 2DK3WtERxnxO1duS42SorW4+/5vaKi3CD+KIviIrV1nHVDpWFaJ5t2yLzAkqRdqtmoNf7KYdu2r
 VuBgBQzOKPjbsR4v8/Mg17QcxjuCnm5v5QVtiNUdrnGsJxmThUw2IOYKU7b1VWYipmh2Glzm1x1
 K3eio7q9TcHoP/Tv6gjcsHbCkJ2Su4L8LI7LrNQl5LSO6NgC/MLHi3b6bTXPgobT1q4APRshwha
 fU6NI2AjkRI+OXOzdfSj3QI5gtoTbvXX/k496zaQmBbSlfEDby2i7DCAUCpuhyaPHLcq2hU+MC+
 aI993Pxp4hozIfpG1JjkspG/ul3xjCSBRIYRqyyEg3nwGpUePgM7irBjqOvl/UZmzNltxqwFOzy
 9eb/pxXdMzK/3Aa8/sIL3uXKLukS16rySjYjCg+o6gAobRLEFYKU7gO1iDT4J9jv5+ACk9rVHnG
 3vV9K7z6Rtvx5FDR2/BhoeWFjZuHDLandJvSyjyLJ3pBtQzB09pyw0EanwuHRmhONrTFbJhswQD
 C9ndiihNlO2WbY/5RbnTO+h//1m0pndDTb++8VdN82Dyw4bbTrYx8qkFFsTttDy8hjhN6pyUvR5
 VMfFKg8uUfJHusA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69afee0b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=geaBrObO2TRU0f7BpigA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8QDpuxE1Ls5Pv3E4lboAWI8t-97nBU0e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NyBTYWx0ZWRfX/Q1tGry208kh
 tSRJ36hamXZg/PbfYqUHEKnaeDpEt5ybPALD4+wHvz6cp+jooxYGcKLPPN3wQxfXJmsLL8lcvR+
 EIqQbqRYPRMMYbJXXFGgxoyJ9nOvs/RxrxBeAT7aTaS7iSDmFofUqU7JWMOTYDgHz3Z6ufXglGb
 Wuh2xgVRRNUm4OfllT8lqhC1SievHEE1jPuyNNTVOum6+73w5K5ucz3Ly60ARy9nRkvkQFeUgvk
 KoryUbKbH/uAywLj9MHKAQjJFltbWD0rwHFX2hd3ZfpCcA1LX+L44D7A5Jx2t02nVZEaNdkz2lY
 BpYu9o87Sgydc1uoJUk6OumPXrl5g3oK47XAkQ38P3Djrms0RbaxHk5RFTNBbHWlR7YCYy/s+ix
 BnHrAvmyz5zdmjbB2GQza7hAGVPylDbX2Rw7KXUv8771gX94YoPkuVZJRS5tDZRn9YWZZfuK/+1
 b7HucrD4MCIrGJKrHnA==
X-Proofpoint-ORIG-GUID: 8QDpuxE1Ls5Pv3E4lboAWI8t-97nBU0e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100087
X-Rspamd-Queue-Id: B05CB24937F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-96588-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.2:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hook up DisplayPort parts over Type-C USB on MTP8750.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 6107a4ed2c80..3837f6785320 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -987,6 +987,14 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l3g_1p2>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 82963f4a6a55..d2352f60f86b 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2789,6 +2789,7 @@ port@2 {
 					reg = <2>;
 
 					usb_dp_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp0_out>;
 					};
 				};
 			};
@@ -3403,6 +3404,7 @@ port@1 {
 
 						mdss_dp0_out: endpoint {
 							data-lanes = <0 1 2 3>;
+							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 						};
 					};
 				};

-- 
2.51.0


