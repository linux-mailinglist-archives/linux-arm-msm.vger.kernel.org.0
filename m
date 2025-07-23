Return-Path: <linux-arm-msm+bounces-66392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F635B0FCE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D2CB3A684E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F4D283C83;
	Wed, 23 Jul 2025 22:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBTVc/pY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5891827FD54
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309699; cv=none; b=a2ogZeRlNu2Jk0BBz9ibp0UdgEbrdDq66BR4aE6uOpztLDxPlIlIpaf+K7cOutRHMr5SGJNjVkBvJYr9zT3PBAwB09TDW3dyj50pqW8ihzGicvrCqwk0r3RmdBghSsj69WPOW5uz5a7VOJMUfqZ/x8AkcxSf2uoc81hOd52vSBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309699; c=relaxed/simple;
	bh=zYF2GQzOX7UoU9RcPjJT84Ey9Vp+O+mZOIRzMyW3cr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OdCrDC7XX6eqW52myUXDaKIa2X8CprX1fPFqd+wzLW7cuHIm02t0zlda8GNwN9gBKbyJ35oQpgu0/z0AIiIoyqUXuL+nRwcY7WCH0AtVPnPBnJscLa/q4U6CrBhbZS8vetNmFZTSLGm7o45uUqjDB3Qt4bFB4Ex7XNTE+WishRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBTVc/pY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH9E1Y020004
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XkLhLpw/zbA
	8rKihC+Ls2PIVo2hpg7LCRAqY62Ywf5U=; b=RBTVc/pYQAVNIU28sOIJafv7RVA
	dZUd33X+yYnNyNDoLf5/MqTGXz5EpsSH7Ep7VivvuOLHNRfmGOmWuCTcSnEHCBbz
	fJq0p96UQCbv7COH8uA5SHZNIVvm6aE8MXlZwbOwJ2DkP5uU18vYfUdU5g+r+pho
	toT3exT1WiIdy6o7f43ZcVI01ycTpH+pMCPa/7uqytCH9Yq9XnxBhhUwc0NPENDK
	T1LV4ml9elndit28cGieoNmwRnaGSE7jqL7RXSpWKGusGdJoCfGPdWNo2RqKESru
	/+5qgy2tk0OC8iezFN/ux79cQEvRbDtKJBADNsi7yGdS2CqTSe4jMmcjcyQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3esgx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fafc9f3e1bso5377276d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309694; x=1753914494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkLhLpw/zbA8rKihC+Ls2PIVo2hpg7LCRAqY62Ywf5U=;
        b=D5Bml8p1fyGvPoqpU7ojU+jo50OuvpQzxkXpwAyjtxmrj67jPxTiRSZazCrD+6Td72
         IYops8cY7CsXAY5q8iI3gcKtR7Z6pN/1rZ0rcNMmhjSS2nuWP1JYHF7tt7DgwMY8ms3n
         tg2XKdMAO7ZaAZ13rquwcmnijS5OXv/9K2BD0ljkfIX0cg7Gr2bqbthPSrl/woJ1flpl
         r959zQXUy1cOPg7eEIfzUbtxsiybDHGTvy/uLJpbFL2PKCOrUsOwgRI0uonfk1vvhImO
         v9upLwgqsDcQgW3Koi7mJhxSKnGo5krBmc7TGe1+K8ebKoAvECYLfUchqMUW6Y3x8+8v
         GdRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFQHh5OwZAY8GDjK7MQrkjLUsgMdYD8e4U/Zv6qjdmPZ0A7U/Vp9SU5zA4RO+edICBEBP1uqtum2FA3WbI@vger.kernel.org
X-Gm-Message-State: AOJu0YwM50O994WxaBqnVdcoLBHL0G/VOwyA1sDvs1hNZdSPM0czHT7m
	NPeBo2qEjVmpLYNKqTIqqiiXEPNgWNs68JhZZIVW0LnhC10DIefD2N+I6eBwwACuinjFqkPd3rW
	cretdkMnVw99IBqM5/rfMG/Y+MOm89yjxG1hSz19p0fKd3wenzhZpIi7//5/LY/BZaGO1
X-Gm-Gg: ASbGncvJ2B+3sX+kEN1cxnWId4nnOkEoOPmnkfgLtvggXwAIb8c6ppONpGxnXpFvRTt
	iX4MrLkbEZGQCKX+gp0jzOdMlg6oMDbiX2bx91gPYo/FYWbm3PABNBWw0wvPDs4lxPl6uAztIFK
	gFOCP8e8J+Auk0d77Ldc8a1o1meoYYTkW/oaTpbw5QJBwFcvy4LANY0bdYL/KyuuvwsZLM2xH88
	sTu+f3KcODtvlDQu+sWQkilcBXiO58ZHvjC5JuUGdJmakf9YEcqynFd7LxA4HjXCtfzWvAt4OKi
	GMsZgzZadmfQtdkC0ZVsGdHZM/Mg5hWu1t5cr7XftxN/2pOi0kEg6Q==
X-Received: by 2002:a05:6214:e41:b0:704:f7d8:edf9 with SMTP id 6a1803df08f44-707007104a1mr76741546d6.46.1753309694057;
        Wed, 23 Jul 2025 15:28:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA+u9kqKlJeKjA99+wEjnn/wxztrEfMRykSn0vSNeVKYrs1jCV1RC5Qvq6ovGlFrpAVJTfdA==
X-Received: by 2002:a05:6214:e41:b0:704:f7d8:edf9 with SMTP id 6a1803df08f44-707007104a1mr76740976d6.46.1753309693475;
        Wed, 23 Jul 2025 15:28:13 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:28:13 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 21/23] arm64: dts: qcom: sm8550: add sound prefix for wsa2
Date: Wed, 23 Jul 2025 23:27:35 +0100
Message-ID: <20250723222737.35561-22-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CrqBPyrYjPEuDojfeCLXkxq5jHebSotf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MyBTYWx0ZWRfXwdPpcVS5Ruft
 PtR0baJUyoEa3N0EWdxZvmwbANiEnK8qN6WULKKpfIq+iNnrdXbsqOzKECvQl9M+YyNviRv6afg
 Yq1Q95nAHBQsriDZqo46uOSvbxQrmBz/jbdqXp1joarMVutGjsLSnjFMITkvkcUjFs2+WX+Qvb1
 6iDYkjBBV/4wWpVrbDr515ymnbd4LGJD0Dosnw8xA4E4PTTJ4LcswnU1j0WVfQlQ3j1dm41F858
 kC6O4nHZgP8pe1VJVmtzycLfNysa/TL2HkWjwvCuFBB9NoSvtcmEKezzlG6Y9IR4ktYgMmUy2X1
 lSosmqifBBNacxS0cnr2X62/qCBRGuGW5mx14Oq9WZILEe0PBZIGlODRb2SQwqJvsoG9oNH6Hu2
 DA9t8nQm3T4JhXZVob/7a2nnrpWWPM0c7mehJ97d+oyuzSXXSSUioe8u4SwHYipVf0vqwWBL
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=688161ff cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Nfxnn_ge1f9Pje3RmyYA:9 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: CrqBPyrYjPEuDojfeCLXkxq5jHebSotf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=795 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230193

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

WSA and WSA2 are two instances of WSA codec macro, this can lead
dupicate dapm widgets and mixers resulting in failing to probe
soundcard if both of these instances are part of the dai-link.

Correct way to address this is to add sound-name-prefix to WSA2
instances to avoid such confilcting mixers and dapm widgets.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index d35d2b9b438d..5f748f6eb27a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2811,6 +2811,7 @@ lpass_wsa2macro: codec@6aa0000 {
 			#clock-cells = <0>;
 			clock-output-names = "wsa2-mclk";
 			#sound-dai-cells = <1>;
+			sound-name-prefix = "WSA2";
 		};
 
 		swr3: soundwire@6ab0000 {
-- 
2.50.0


