Return-Path: <linux-arm-msm+bounces-90468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBPhOvY4dmmTNgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 16:38:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2588147A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 16:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25D5D3069C55
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 15:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9131DDC3F;
	Sun, 25 Jan 2026 15:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iaUdImEA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PJ7W6IN8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99803254B9
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355209; cv=none; b=lfWRErs0Ik01SyI0P6ulheZLp43bbPplqktqHDR+CW84k4NoxFqiMH475xMqFAOICu0OEUe672zyhdmGUYXAqu5TtgOQ9Axzc+zrrYpXQIu/o75uSQejP54cpRll91vWfC5If9X+lTHap4HWi5P6enIuCXSDN5w9x9CRM8kv0uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355209; c=relaxed/simple;
	bh=eMPPp5QdHl6l2+RHuOJrKXZ3iHN1D0E9GpkssxyQIzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e52VMYtxhGCdpjp6+Y+Xvv1uxM3ShiruLxFQ2yoXZS79CimxdOotjSPIOQ8DCF1wnk3MU2IQrMjTTZQu0vz+o8c6A5TUXkAtcWk/2DZ3VpZOtZY1FM52wf6+tDWwDMe19+dyrKyS6rp87tQUq1jxjM/HVdri1Ws1JkO84+LOYH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaUdImEA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PJ7W6IN8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PCi2Ce2982065
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X/jnU1v8SbYVQvup/ww910IkEwyTZhceq3Rp0gE4nyQ=; b=iaUdImEANFZyKlgs
	ITdN1PPJ7wUi/Fv+BDQj24v6i2hUSLMbPs80c63l8f0ykce3iwrnUhPlfeLmFqU2
	9yczANGLi4GlWQIffpImjDqF8Sr1mvalfupxoxiddnOt2OpPXc2DLRkuKmW3GkNx
	zoRJmZ9qlBtwo7ROSJu+oWIxdDLNOgQ0x08/iFngB8Up8WIacQY5SRGCbgNo57ye
	3KHty1PLsVy5ObB1JLWtCrogvshY1aUiXvBkWZ63euXMkRT3gcUHnYzUtTnLMUPx
	ON/dQeRMKhfiKchPZDrOkeQRehUVK+d2MUp7OFgCEo+DeWve0vRUeN2+BSeYpSoF
	1aYwsg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq24jah2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:33:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a39993e5fso111861206d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 07:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769355192; x=1769959992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/jnU1v8SbYVQvup/ww910IkEwyTZhceq3Rp0gE4nyQ=;
        b=PJ7W6IN8OD//g8UuzaOISjUAxRgQQLeEzdkTL4s2iiB06sTcQu+RwYuxgs+Uxdr1xl
         25GCJ5zQLNyL1IozS7W/8lW/A9oQOpoRo0fi4lqyYD3UYRV0Yow+n0Al6fwbUAKL/ZB9
         vtzbDx019Z2wBy8PFzy/aeOyPG9zBMOOZTgL2/dAxvdmHOL9N0I8/4INKzhVtY2b0eIg
         9Ff/wtZoKvgS1eAI1f4v6H2QR5C7RqdEEuRVVdWFhQnpccdgt+ytklZsOOLGaZ4LXCeF
         13KKpkIoWpM0PfgO+Gd8Ii6iNfEmkyqB92i5sYKAryIeNDG6dqBauLkyQzw3GkUfB+Jn
         3uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769355192; x=1769959992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/jnU1v8SbYVQvup/ww910IkEwyTZhceq3Rp0gE4nyQ=;
        b=E68fpwG96KWg8bEc+iCwLVMZFE12X1lD1s4mwmhWFvAcd7N2R97fFWtxTiRIialZAQ
         1IITbfbWOh8YO6DCreZZDBvmFxvoePaWQVJ0AXlQ4tWGCneyVRh1A7zTx4kU/b0gCdK6
         PelMZMQQq4Phn6LHnrgvESfYdQIfAZOZPpJuNCJkQpT8lLz3aFiTW8xc9IjB6Mcs2fA/
         MKu/xhViPJXaWeTuhOC2gML9kITQaf+tmsqkNDXV8nq/I0nH8J22NKkY2D9ryNN3w/1u
         S7IHMW46JlHBRBP/jzwNbkfH+Q2tkWMbI3+gAFMmg+9ZJOKVo/PG82ptXRqI/WuVfXOi
         RCyg==
X-Forwarded-Encrypted: i=1; AJvYcCXzxuygQhHvSs5qWbD/FG7c5dNhhfdMwA/Q5LimA3IMxntBJgFU+J6jYCfs9bTfjixW2B6wTk1JZktAKodb@vger.kernel.org
X-Gm-Message-State: AOJu0YyrKnbTudEMgpJpUUNB7Pb31X2Die0KOKADyrKqQ6cS6vRfEe4u
	phynrCVl5W1WzT2K7uIg2mpmReotRpUrS6onmaWAv3FCAgHis9aen04NenyYUAd+jXz3M7JK0Ag
	btjSV9Dxb4zQVo/NOS/rjOo5sZHpwVc5/L2OuirnzUthPCKcGQwqjXJtULptoPuzkjIxslBy6Ck
	YV
X-Gm-Gg: AZuq6aL/4MHqAXmebfLT/K1o1nP2yOP21/ddPQT4IPfDDeLxUiEUyrK3hoC7dgA2NRB
	BtOBZ/0VLdyrdunl5Ud0fLdmAZERlC9Mj4ehnsJTT3dJLSrWhhPM269gjrWlkf7jGh0roAovWwK
	MKjYEEeftBJCJNYZmJ/pgFk6qnrsz8yp9hia7NvlJh6CvhkMWMtMlBxE6SWwgQKTT0bFS1stAdw
	OPIgnnUOEjw+1s32E5nvqmDReC+54/bUqxLBeec3HgEY2vvXyDknodLgXgricMKqTZFDZpAgf76
	GnaybjrnHsatZID/0ThPYFkHJxt4eoMsabdzbwDxVm/CsYPA7pAAdUCaUwRnex3uwZdVMTA1hg8
	VCkvXT0uPFlt2rc4MN2KIpCtrkOOyziNxntJUBIXxSByJl5uY6OsoOTw1saSmYAx1xPcXBVEnd3
	ELTxeAlc47atPzWbr32JA7hDA=
X-Received: by 2002:ad4:5ae2:0:b0:894:6e37:8faf with SMTP id 6a1803df08f44-894b07dcfe4mr23646656d6.68.1769355191959;
        Sun, 25 Jan 2026 07:33:11 -0800 (PST)
X-Received: by 2002:ad4:5ae2:0:b0:894:6e37:8faf with SMTP id 6a1803df08f44-894b07dcfe4mr23646236d6.68.1769355191476;
        Sun, 25 Jan 2026 07:33:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1a0a45sm19154661fa.34.2026.01.25.07.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 07:33:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 17:33:02 +0200
Subject: [PATCH v3 5/7] arm64: dts: qcom: sc8280xp-x13s: Enable Venus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v3-5-d21861a9ea33@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=951;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rkZGIV8zHoppbf8XaAIcqSxhBd4bGzlkBwNa40cVeqU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdjeselvbD3IzAKDJzG1RiO4y6kF6xxzWiuDvj
 zBSmhvLxBuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXY3rAAKCRCLPIo+Aiko
 1UMjCACGBvLH9b0yLfVX8O7VnSHpM386ticeeVHswOyiymVUaBXiCneUQFwdyn+O70Gh9dl++Dv
 XzF/BqouiFHec9HPGxKDFN88HeRsofasDkdHCX6ofpPJ3q9tOANhVTRF4u6CROSy6+GH2mkr7eA
 XNXGFEvs/lcmAlRNHMr5+gs7prYf1Ds1PdrP8MqS8yr9p7caJb9VqygPOrgBnN7rHjlDtJ6Evtx
 AYI23VIbU/L4mu4z4hlb43br2+GulRsx+/+W9MOK/y9KTIH47iQsdBy96jVJxWU46QrszpVdTOo
 4oALhQGHWXQ9l7ioiJPaG4/FNH2Hh8rpblt0k8q5G4/bm8N8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDEzMCBTYWx0ZWRfX+faI3Bx9LPeu
 5ZlTNVh3IDyJGTZwVEN6dU9vAiipSScMC7t9TCLTxOE3FrGUcb42gCNw+ytb2PHlufnGXs2VlR0
 32rxoGjfhaEIc3yOb2s0ZqJYBzWA+1y419strmqUej1YbwzNxB+ml4lmm+9Ci/yMqTyamzrSZXD
 SocyrZ7mjyY358Q4ZRThVLvjfEKcRCT2gLMooL6TFecvnzYSHTFdNNTwan9Jrw5baxfIV43FquK
 BwHMXwLlktuHfrohR92+1lakur2fLIPWTy8l3HB/P47oB/dRBTc4KAKPkHmcc4XbdlGxcRKCZlE
 rDkQI1XUcWh3SckU3YYGym5ld/b0uCnWD6ZbpDdSAKiPYQ4GZJlgNNwCqQ5BdYbNm20kIJluKYv
 gJW3qcW00o78MPwHb2IX7TnvDxlEqh7ybKgyjIsQobgnXgRihh+dGvrUGYwUB4vgwMq2U0E7Czx
 j0R8eYNQsrzymQKRgHg==
X-Authority-Analysis: v=2.4 cv=EsXfbCcA c=1 sm=1 tr=0 ts=697637b8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9kCQqHoLWY5iHRgZhBMA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rhoZyoFqLqq4uhFBQtMUj540Ztca8B5X
X-Proofpoint-ORIG-GUID: rhoZyoFqLqq4uhFBQtMUj540Ztca8B5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90468-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F2588147A
X-Rspamd-Action: no action

From: Konrad Dybcio <konradybcio@kernel.org>

Enable Venus and point the driver to the correct firmware file.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..62f4593958a8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1474,6 +1474,12 @@ &vamacro {
 	status = "okay";
 };
 
+&venus {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn";
+
+	status = "okay";
+};
+
 &wsamacro {
 	status = "okay";
 };

-- 
2.47.3


