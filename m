Return-Path: <linux-arm-msm+bounces-107951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNp+EIxFB2qgvwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 18:10:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABEB552C6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 18:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 67526308FE25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 16:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC153E0097;
	Fri, 15 May 2026 16:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8z7y96e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eUo/wofC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480183A961B
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778860905; cv=none; b=h+qDrEu1NtL4k75rPTsVn4s+4VAekIbGR2PYenPHbfV9IRrU/rjP1XE10xKv+03V2h+zY10dEtVw8OKFLSNcJGBWUcgNcUR2tjNml4MFFpqmPKPzShh5wZnHFvxXCQH83ckkVSTogn3vkFM14YwrOIjFbrCJ0lmaOgEySrtwp7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778860905; c=relaxed/simple;
	bh=CIm5gXzb2skW9QjvKlxQ7m0BVXXW1t3N5R8DqW8dTek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ypqy3QTvmq8QHMcaDNk3Fx81m4GjTPUxn5Sx3bOsLjM28n8lT6qebomfOVvSOgdnjaQzAuyA4uglNbsM1QXXXJNfW2zM4OfP8aNxpXqtO/jhEFQbVJLKM/pNZRZlvlcKhbpGD82zQBm5YtBGjK3UlWfblAFo0RNbN/sAXAK/pRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8z7y96e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUo/wofC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBVFpX4022529
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 16:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ps1K4Vop1/6bXHDrnKIgQxIG66H4m58UWsrlV2Ynf9c=; b=A8z7y96eDfADXV25
	iScircyWZmnyPITN9SzcNpiUdgv37THL7sxyYQdIM+5xd28iPMrIUEITIckP83E6
	MH4q0DKeZt5S7bIog7Cj9FGRpnZZOncK2HBjznYDn4igDDBg4UxTOnCB/TbjJd/c
	mLmjY4T+m7TI9nZmPfcoj+U88pz6TRdQUk8vvHr4gd+Yz5K6NW+b/4GUTaySf+cf
	EpQBaCRrQaiiyR2motJx0e8H97jbOBNjZKd22yBbqKO70U5NX6gwMZaRzAQ48nLi
	XbTjTVidZGL8sEj5g5V//QzJ0SI+wf09ylSX6T1682bCPBuQoB9WIRebxPHW+V8R
	pVXCZQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ruwxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 16:01:43 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-43a40a095c7so2265873fac.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778860903; x=1779465703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ps1K4Vop1/6bXHDrnKIgQxIG66H4m58UWsrlV2Ynf9c=;
        b=eUo/wofC/7nOkuXGEjvshZDWZANAxERkU3nsEh9lj7uyusJoX/j+GR0Gukn4NwKjIU
         w1wg4k9fQLHh3QoGn+SGueW/IeV18oZ8jOoNj38QgNT5dwwd9A7UoAu8i5Fd+g1DvrAH
         xPTK+EigkTkug0oDo1e1FdJxYJUFrs+sFV320mB6D2KqijByVufYZSRZOeJ37Ivhv5E3
         /AXP0pAWpC/zVThUhyxY8QXuRtIdB8fwsMOV6gEoFHXs4KYKbBCvA514bEbqBZU2MlwF
         364KEUxPitgEd4/HGDHViPM9aD+BKsYg8Eg8RvUUTCilDeaqNTHW7Ej36VLmEG9F7ZAA
         ipCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778860903; x=1779465703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ps1K4Vop1/6bXHDrnKIgQxIG66H4m58UWsrlV2Ynf9c=;
        b=ZVzBBZoKGwlvCZjKN5ryx47zEUEOQvV/DA3EOKh/WKYqTygwJzltmgRyv4xYRMRAwL
         LwX8Ts+Ml3OPwwxu6P9oOZO/5OJCgQGpv42GyOHxfrrSfSIzDHFpAiAn2/nLNlGp7o//
         Tk6lFExwdbPjOcjEpQtp/FR4EPegMjnjo1bdeXE4f+/eok5OZVxr7AACg7NlxJZtqc0z
         mkQI0P07/5zmnz9yal8fOzI7yXMt62EAbLgx7yhEXHqttH3mvThp7fk6XACzV+1JuoKp
         Y8VnLgDIn7y60fuv8Xp5zDcZIn/lQ4qQLzkkju0nKeCsxAsZMSsu2rnm8ctCYzNbaB8x
         k+ew==
X-Gm-Message-State: AOJu0YxQisCfcc3iGOfIpws2uDruwBSWUhnEEmpNaqjjTlmlgEnfNxze
	F6oCQ/wQegckP08LprXx0GR3QVGQ61nJnmrs5ESLDkClXMCjdxgY8RBTS+o6S0lCD6X+pRB2YZp
	QWsYCjIsDoyHSzAf5byQtoU93UaOeR5j/JFPaFUsSjqGxnIbyNFR0J2O2EsMl0++Q14c0RW0OMb
	DO
X-Gm-Gg: Acq92OFHwaTY1cm6c3keDoPE8zkrpcEoILGjhhYhjsCsy1Z3j3x/ZEvhdlsWE5361tI
	r/Ch5HKAwAqox2YM9xTZiUZ/ZblQMYfiKzcR5xQ/ytxA/mURwa0NKUrN79TlBMlQb58wftNduJt
	CZixGVNY79O1XIYZcZE1jDHebs5pPEzsmtFn1rF6HC7K6fmDYzgiDBYhWvubHcC9Ie2Hiq8fd3E
	NQRtmlrab/CTFXbkiL2SdceGXjYo9AoChwLQpgFM0czA9JFB0xTX9LCAsKhiCyMicj5oo4keA8F
	F3ePyi5XnPEYmgnzfC4q0YC1E7n5ycturf24pflDpVoqXBX76zulLlqQ5+Yz8WNx9AUx+0PUBRI
	0SeU2XIVETOoYC2yt0IScxn4jJZVtKi+eTk4JhgU=
X-Received: by 2002:a05:6820:4a01:b0:694:99de:9989 with SMTP id 006d021491bc7-69b884ac95dmr4425144eaf.32.1778860902419;
        Fri, 15 May 2026 09:01:42 -0700 (PDT)
X-Received: by 2002:a05:6820:4a01:b0:694:99de:9989 with SMTP id 006d021491bc7-69b884ac95dmr4424894eaf.32.1778860900284;
        Fri, 15 May 2026 09:01:40 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm15135743f8f.37.2026.05.15.09.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 09:01:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 15 May 2026 19:01:12 +0300
Subject: [PATCH 2/2] arm64: dts: qcom: Add Eliza CQS EVK board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-eliza-dts-qcs-evk-v1-2-7169d78a33e1@oss.qualcomm.com>
References: <20260515-eliza-dts-qcs-evk-v1-0-7169d78a33e1@oss.qualcomm.com>
In-Reply-To: <20260515-eliza-dts-qcs-evk-v1-0-7169d78a33e1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2558;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=CIm5gXzb2skW9QjvKlxQ7m0BVXXW1t3N5R8DqW8dTek=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqB0NdaYdOMwLXGfPFbhKkba/JDdltxzOwi1eDX
 zk4NYo2ifWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagdDXQAKCRAbX0TJAJUV
 Vm+ZD/9xkcYA7v0mriyvCdXrkIQI8jpXTzpzrp16EH/rS9HSP9FEr9Lr2J58FcINOzJHmJtFmVm
 iRgMFQ7utgxz8SG5oyVjmlCnocuGSykbDaYBqSMouGYhyv8As2B8A4q66unUsQ891uSLywxMTYW
 DiEUYvv8Gm/rmWp6jESLHBxeZ26GkRrbUke2gGufhXLPNd5UVWKb0sT5dTgSPnN8FJNga71z2cD
 QKfe/rG8uhzkR6EVJvS/WiAJ+a/q4NuqGJtguWD89t42aC+iI2JyaG4XCtsY/MzyMfEYoq7ySB/
 oNAow/0+kiyoi2jO+oL0w2jzNiqoTPjpBPkqffdvjcUIPzfUm2d9GSgXUFy0LgYAd6zBnqe8onE
 EzccIE1q+J+E+XLVDyYQ6O8rI7povheLGg6q5Lkc5pkvF2PciJiVi2tR9qgWuNrWVpy83ujhdCt
 fHlOVlLAK4H9Lc0LzwafD+X1m3k5B4Fzqj1OM1idp15ytLDELRUpyGT9EIhzMccDqVJRo7NpqHl
 g3pXdjeFNKqSyqvX0fETlTRCDycqjnSN+XUlDLpvmAhaIlAUQL9McFVwlvXug7fbBThqIi5ZLF3
 JYr8E7ACB7RU5SKyGkrRlXB2vaSkTEJjXjoEhWYBlp0FzNMt2tPBWS29Bfy2GC+dyrLV9uA9IQt
 ILPrBH8KYnDwYpg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: w0Q1Ctv_3kH2kc7NyUdLTJrF7NsBbtrr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE2NCBTYWx0ZWRfXxlUvZ2qg9pmk
 AeFykO9f2lRh9IgCZnJF/h/D5YGgdTcuyzYftf1hxcAI/2vOf6BY0SMHS/bVxeeGqOw09kZ9L93
 v+lXqFRvzYhNCFmP7zj9W6xq4rnjmrEpy16QZPfe+uw+KpvAsNYurEMhgn5JSlrU6SoYqWyh9oo
 oeJCpl5m42FchpxecAC561DpKMST6Er362w3TaN6+56TSqzH7li1ppuOcO1hozoOWV39+0Am7zg
 sRpLwBedwbrIV3mQzNTbugsHgB1Pwlpj7XgBpMWXWiJG09EGYbBmk6XvF7cDNjn2vaBiujS5lqS
 gCzxOIYQd+u9mSb9rGyU0Voe02RZlV+PXCgWBsVIchaEfpYevjMJZt0IyS5oqq21iojTcRVxZ5p
 oeaF1bINC5To/8TA+/AoU7gf3Ywl61oC+3sVMaOtpelJmGci/yNQ3lBanG6PJ6kOIWIwxxaTnft
 ALtJg1PAH5k34jNAcmQ==
X-Proofpoint-ORIG-GUID: w0Q1Ctv_3kH2kc7NyUdLTJrF7NsBbtrr
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a074367 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nfd1YeTbQLvsyS6wM0MA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150164
X-Rspamd-Queue-Id: 6ABEB552C6D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107951-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Eliza CQS EVK board combines the CQ7790S-based (Eliza) SoM with the
common Eliza EVK base board, which provides connectors for different
peripherals.

Add a common Eliza EVK dtsi for the base board bits that can be reused
alongside other Eliza SoM variants. Then, add the final Eliza CQS EVK dts,
including the CQS SoM and common EVK dtsi.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile          |  1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi    | 20 ++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index cc42829f92eb..7b452ed4e2f3 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
new file mode 100644
index 000000000000..fcf7d9232805
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
+	compatible = "qcom,eliza-cqs-evk", "qcom,eliza";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
+			       <111 2>,  /* WCN UART1 */
+			       <118 1>;  /* NFC Secure I/O */
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
new file mode 100644
index 000000000000..e47b24f8b827
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/ {
+	aliases {
+		serial0 = &uart13;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart13 {
+	compatible = "qcom,geni-debug-uart";
+
+	status = "okay";
+};

-- 
2.54.0


