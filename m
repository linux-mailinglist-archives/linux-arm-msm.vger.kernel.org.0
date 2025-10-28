Return-Path: <linux-arm-msm+bounces-79282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87819C16D92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10BB91A28C85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 21:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B092C11EB;
	Tue, 28 Oct 2025 21:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrTLILI7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bx6Mc0Zn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B473354AC9
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761685216; cv=none; b=ftAHRqxbKvhi+ZyjNvhiM2OxhWoKCBeN/BEFMceHUm14VUStcFPBlIYhkYrt0ktmXIXocjtHKXlfDVbRoUFpzlMknoQcmXCD6gm/qogaYoM/aQT49c6EvbVDErVXajDnezr5YaYo/YW1whBU/r3egtRmg7NBUGEoEXtipGgEowE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761685216; c=relaxed/simple;
	bh=gNbzf2MPr+aBgX3mmP29VAz6QE1K5U58z9DMT83UfZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KGJtc6hgqtDIC08RLNZKtqb7b5vVGLT/Ce0GnpKtB4IU4U5TY9z2q8XqNNMCIJlR7AuGmfeRRn9Kfd5hKY4oC6WVGA76lDKwcDAgfUUSodiYCKTmZjGXMh2JsvE9/XDVdQGhHUmtwFMqj5mQWoWhZF0qwFYklMUHo4vWubwKWSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrTLILI7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bx6Mc0Zn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlN8V2502828
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NKcHfkgTZdnk410USJtHf5FZ+SnDF1WbC9y8f6X/XPg=; b=XrTLILI7wBZXwYgi
	/VUy+r5luFriKFS+e+4cQ8pTV+tGAnO7yKU4ukk/2pVBqF5f10jTXeNzUB8/R3x0
	TW7RTjeX79b/tWP7ufCXGFdLhFVDQFyQVChErGwD/uc+JnvQVX76J+paa64Q3kTK
	17gDhrojUA3KdLBaBqWDVK9I0jEvJ8uRZ9G4E1SjxIQbi8WbB88OZ1+msbnZiy7Q
	mo8+EzNDdbQgF1mRAhIzx1mTbb9ttjAHe+IVUSpvYlFh/71XXmsohFAu1YAJF4Wb
	bpjJzxSku4C4y0BT9lm32vayYEm6plvf6lMS55hMbUStOKgtKlqG4hIdBkVG4JvI
	Sq+p6w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1g5cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:00:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8a3d0fb09so97309681cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761685213; x=1762290013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKcHfkgTZdnk410USJtHf5FZ+SnDF1WbC9y8f6X/XPg=;
        b=Bx6Mc0ZnnzixFFa3Jx7wgZsYCfldHVBBIU64o9N+pnUHwG0UVHD5hlvyDqW8hV7ug6
         2wfvRDUiMh8GqpB5JxGCJ1OB8dntVhjKK51viVK/T+VRdeb6kRBn5BiRcXOD01bqWvL0
         gY+1rXm+7XA23ujGpJa5hMn3y/1HX+H9tqyGCYBXZvOLxx5wiQpQQdhJxkx704hfnyhw
         L5Vx75j/nSLLggQvPy8DiNQPi4kmmAds1DoBB7gYjaYLs1cxTb925W8zr+9igT8cXmfd
         sn94r6BXEm/JpDsad05ZWA0DCyaOSVK7HTBTxY3znhh0+v8CTmgEOgYUx0Nj6ezZ6623
         tA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761685213; x=1762290013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKcHfkgTZdnk410USJtHf5FZ+SnDF1WbC9y8f6X/XPg=;
        b=ZcuGBOOJ8x3PSpXMhuJ0fujDhKyP7E42BhjoC6QkPV5zGOzYoqIGvbA+8QXHEXFJef
         +bvgAMkwg2Owg+7l4bK6gC+M/f2wjMLOVNmJA5XDIL8uyh+T/9x4lO7ISEnZp+FXWTCc
         HojFFR7hNSXihKxW5jRyzozr98i70ROnZHErBTwwabTJejEDyrPqxKm7A8A4aNkhD9AT
         zjaSVkRvytlHz2nlvtFa0uEcGcHpHeywY6AucjSB0sDavHCB+SBiHk6eBsgz3JcCZ3/w
         UjiJIbcDq0EhTRgmmVu8Koyx6b+CqgiBWoZPFumR8V/orKRI4J5hOPPNCukmIcHvnDOa
         FspA==
X-Gm-Message-State: AOJu0YyGkcxHOGf/tyZis9y9bKO8ITb+YMQVhPBf+mIHgiCr6BueE2wR
	tvE2J3FFey4K/ok3xPtjCvkR3TN/Ehmf6L+BYmFH0ySjv+/d3PFC4xwzOvDkil1T73J2IA0RWmL
	g4Fvs9+DDPg/oAUiaSdCbcgRgjK401Qln+4THWr75DyD1lHKqFxvMQK7MNIrP1eixNgki
X-Gm-Gg: ASbGnctlIxyK9uT78mcXdP6kKQMhfAJQgE5msBM1369NHZ44SJJhpn7WuDmEn4LrqTi
	Wd0zB3DCjkTnMGFtNYkK5Sn+cFr6bwKcmvjDJrolEW79pIwjqYgBdCPSJDkrpArj4RzP7s2R7yn
	/xfV7HX4BTTycyVa+Sg4kp5atqJ+HDYpKkbTtD88pzGKxOm5iV4jPRIzxk0JYInRSj1iXyziTdf
	KY++dZxXXZhMUM+FgV40nR7DQ1j6WCar9ywIxIW5wplNsiIQXpBotIyuW2nmCdypg+1+fZeApIx
	Q5t3WvymruOVebfL7XwQVxYKcrPStaytiZRzaH+KoaFqfn6vqb1ETwNzklQhGo1GmObjpR1V2sz
	Gu9ytzpcGTI8Xk315vJV1J1NKPT5z5mIczpcpkkGgA37dimAYzpVuZngL4ZRWX9HzTARU7J/vK5
	okQafejrlRMU0z
X-Received: by 2002:a05:622a:5598:b0:4ec:f2a4:f27e with SMTP id d75a77b69052e-4ed15beb88fmr9739691cf.51.1761685213445;
        Tue, 28 Oct 2025 14:00:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEyhDF1HpOlX9VCBQo9hbkONm73nZjFChvahYmFfx/awPnktOZQYzI1cLFrJPwZv59XTkjbw==
X-Received: by 2002:a05:622a:5598:b0:4ec:f2a4:f27e with SMTP id d75a77b69052e-4ed15beb88fmr9739241cf.51.1761685212937;
        Tue, 28 Oct 2025 14:00:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f861f5sm3283594e87.107.2025.10.28.14.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 14:00:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 23:00:04 +0200
Subject: [PATCH 5/7] arm64: dts: qcom: sm8250: drop duplicate memory-region
 defs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-dt-zap-shader-v1-5-7eccb823b986@oss.qualcomm.com>
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
In-Reply-To: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2438;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gNbzf2MPr+aBgX3mmP29VAz6QE1K5U58z9DMT83UfZU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQyaj3hVehcPyJpo1Uub8BnF/dqbm568JPpN3eal50If06
 +X/wtI7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjARlkr2v4Ii2UtOCN0VXWDM
 eOi/WEtrvdUFQRF7TcXtvU4R0y0Dr7IZNsuz9/H93+Ja7740tHlu1YOpMkzVXP7y+pf/3hFo1Ih
 jO7vN4ujJbIGIWgPdkn5Ju9VPddwSX+zcc6NTNTJQkf3mQn8L4ex8H/1W23yxm1q3dm04zNH8uS
 frb35q0xLWg1qCMZp6uXXX7jBZGdz8ssP2Z37iqoM/mUyloh+UfpqldsRVxlDn+O4zB37sEsh54
 9xcfXxr1eGPlz3Zyv/4zI4qn/lD59ndi3NeTc1oU7py8+nzDWYbPNsWO34zt987OTNU7jr3PcMt
 EaZN1eZ/bPOv/VHcb19aMd99U+PN6QXhSz+lG5dsTqwGAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=69012ede cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-YGnug1cYvQUASFw60IA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 6GtOtrT1UapmyTsI60xwI_ErQBUnKNqj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE3NiBTYWx0ZWRfX6ssXYVjozeu2
 HL7+XXbdHGvqJFm0T421H3fVKb8bfwWdGcdWLNxjHxRG7fh46/qmjgPCvZngeJ9CpDIU0fF7yyX
 +qhH8wRyDL9HwilQxjweLUgCgfM7xPcj9Ue/s8/0BQwvP8zKk/KQLjZ9o2SrKhkPGzGF9QNKVaX
 ii8g29rRzO3e62pcXKer5dyHagdX9GG8qnYef5/TGK5f8ZGWsELwulbrfEUS7fvCUTGY/45uKvJ
 T9ZQGjnwbAA7ZLKmwj6nkve/lfLi7Kc5bVYwdcaCX0BC8xHBDujg0lRLtQ1lKi0+wRnpLjxi/hj
 0bQ/QabUoLtyhWa39ELjZWlRzV5dABk604A2GAJtZSxlLt8dRIDNxG+0qOZktBANFZRY2mXiSRD
 KUsOtAxL1eu373JgWl6UHsU0s+V5YQ==
X-Proofpoint-GUID: 6GtOtrT1UapmyTsI60xwI_ErQBUnKNqj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280176

The base file, sm8250.dtsi, alread includes memory-region under the
GPU's zap-shader node. Drop duplicates from the individual board files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                 | 1 -
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts                  | 1 -
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi | 1 -
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts          | 1 -
 4 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index d99448a0732d9d165be1b5a1b1e15b2424b98b55..964e33b6e74aee9582d8eba32f976c6998d36c68 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -596,7 +596,6 @@ &gpu {
 	status = "okay";
 
 	zap-shader {
-		memory-region = <&gpu_mem>;
 		firmware-name = "qcom/sm8250/a650_zap.mbn";
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index 7f592bd3024868c6ab4c9c61051d3f2cf5707a1a..5c40d4e869d354870828629238d6e14364f438aa 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -486,7 +486,6 @@ &gpu {
 	status = "okay";
 
 	zap-shader {
-		memory-region = <&gpu_mem>;
 		firmware-name = "qcom/sm8250/a650_zap.mbn";
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 465fd6e954a347acf15ef3199afd8d1a198f95e8..6c9bb993dc2a3d12b1c7972128e2a2f64fa8dfab 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -556,7 +556,6 @@ &gpu {
 	status = "okay";
 
 	zap-shader {
-		memory-region = <&gpu_mem>;
 		firmware-name = "qcom/sm8250/xiaomi/elish/a650_zap.mbn";
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
index 4ad24974c09f9bb75cc24e55bd4869b52a39ac7c..12565ad87890fea1cc6c25cc161072d75b793c1d 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
@@ -426,7 +426,6 @@ &gpu {
 	status = "okay";
 
 	zap-shader {
-		memory-region = <&gpu_mem>;
 		firmware-name = "qcom/sm8250/xiaomi/pipa/a650_zap.mbn";
 	};
 };

-- 
2.47.3


