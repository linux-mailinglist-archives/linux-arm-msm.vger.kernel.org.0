Return-Path: <linux-arm-msm+bounces-101763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHygEHXg0GklBgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 11:57:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B50839AAB2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 11:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B1653096615
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 09:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6843AE19E;
	Sat,  4 Apr 2026 09:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+LpTHKh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YY9jX4vZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF58A3AA19B
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775296279; cv=none; b=YkKHRYAM6OJrdkedxrsji9rTc0gDAAUYXarOmMCIYTt9kuAsTEmNyOaZuXniof4e6YwCHJyo2y8jUbcOMEM+uMpA33USaluvqCpplz808DB3cbxwDCjgEwaEUVzeBuwnow8dwkeKZw6t1vIHc0UxJ/+XlzYnoYuJMddumfZX+I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775296279; c=relaxed/simple;
	bh=ICECY/f2NzjoVnynzXY3eFvLPxrhhSvWZsoedFzuz9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F8dOvuMrcolgoi0SM9DwvYhE/ZGoTh6PK0XDI9lpwFK7mQEftIn/jLZsz+QVc4V3wuhC7lf9HMlGACRLGp8yR3NIpSlsw7VL9mbES2XLE38bLQNO2WeL8h998T37CBdLJsphE9s79OxI0fA88x6BpjAGTK26dGQc7H3IyStx1rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+LpTHKh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YY9jX4vZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342s1hS2202155
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 09:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZlyCXDNEqi/rs0VxBJa3wAzVaeSGZoFUpBcp4EZFxxU=; b=B+LpTHKht7MCp2QF
	6jR1OEuFQpXhBtAlEn4piXlIjKTpe6Ef6hQL/naBdBmDFVgwQBEgu+eTNuuytVh+
	cvLDI22k++/TqYEsLclTPNMD2dMl7Zoq9q50AZhPN7842AZ0Ktok4PF1rp7ZNiRX
	ZZokmPNkKqjs4lo9ezg7PblhsZ2kEh4tcjV/PazHyALEIugxudUGNhn+eYyYC7Xr
	+1VWzhZuvdSRqu5tjHbr71k/eXZ7nOTz8AY5yBpjmhwH1sgM0PYcg48R04AHkdSw
	WteQzpgWH6JomGbgCEi1q5xahB0wUKGWW8sj5Ak8pxIbpo2BhR3EwMPIyuWP91gv
	8KEYsg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7u8n1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 09:51:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4987c698so64202781cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 02:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775296276; x=1775901076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZlyCXDNEqi/rs0VxBJa3wAzVaeSGZoFUpBcp4EZFxxU=;
        b=YY9jX4vZzu58h8BuvyUOBLB5/NDEFBauTYLsuw1Mmb/gFXqL8UMtohQotm5Oeeo2wC
         PT6fhPi80Pyo2EuXQMnnDAqWdxscvZ70B12ZrTq6Vr6pMPaCHkqIusAPDdS5LF3IWRTV
         s1YbLTx1lCU4u8GIJqaStM2C65IddmhKeZLyq8rgnveYzXYgMrIjlDEo5QRSOXJQKtrE
         7iwqNf4w9+2CBJzMN5zEx2T3SLGsPA1PlNZ/VIMCnAlajNxGk3UKVdypidM+EwoWwtH4
         WjlUdMZwZTlwbsRn13flI/BmczJENRnt/XTxGEFA4tfAxs86yFL65WcZa2JPrTJbEhIC
         6+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775296276; x=1775901076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZlyCXDNEqi/rs0VxBJa3wAzVaeSGZoFUpBcp4EZFxxU=;
        b=GTujXWslJ1u0HdyPN9NNXMV8n7Mb61eiIDOovwtOgIxoiPEf1VeLRbUty7+EC/RVtm
         BxFr8wHWmqATtGGMsJPyRKxqbKVvxE5TcdLuyEwwmuX/w7F48KIwij4u+VbBATp6AXp7
         aZoqsdydOViFW9cuyhZyKn/PGIhdOzVnqCwSjwuQ9YDtyAqTraxSzM/+6tTslDEkTrBY
         8M+wpM3iwVnwv47XMcpgmlw271jPZi9nO2MWwGnPA/iiS36i7cm5exyVpmlpSrk9XDu3
         b4/leqKxlBK5YnTrsT8zOQ6tEgGNFbI+ufTkdaqHRsNh36BJHOKyfrahPl5Kp/FuMqDx
         uhCg==
X-Forwarded-Encrypted: i=1; AJvYcCUwforeSox7mStVJmkwCgcVSPQV+UgMlJZL8E3QoaBZqblx5sVy+PJ+JKa7Z2wkKQ2adj8cJgWgJwBGacRf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4jnCLB4VrfCV5jPxds8uZStzNPkqiQUpTQqYq2gHXGpNyrBne
	fr2WoT6PA7cWJwPcAUeHHtVPNiZF6FkOa6UUNG/fRbBaQReOzNgFRKxCkZO+wQlXRoY3snBAnL+
	PZw8uH0Fw3U+nZfh9YGN6/8CRYRZvO49WV47L7Z9CF+w+lhxqU/CZpEixz40mz9gLEs4a
X-Gm-Gg: AeBDieuMy+XnkywhpWsN2AYkDXFHynunde3Bro3NkeLi175x/E1R8p7TwWLQ0JOc6oe
	pvzd7qgoZIurSKxPY3svyX9jvWjIX8l0MquC61cyuLY0xsOC1Eydq4ds2+8HpsLSjhLY0dajxjC
	OZY7Yxk6ZE8ztGtRQklJUJf60lIgr7AJq1xZx0Tl2xw1INnR4E7ecB1ng1ppTLvCOvd6RRhb79H
	6K2jWL/OvuLJmK3QmG9hi0TgiBD6X/YJKsFqe5IP3WZcEiXMaUwbmaCxW4jACIKT7beKeruZ+S8
	qHVENFlGaBRiLH8jroVWVXBIUgOEGMZAKox9416zq7e44FMOUgfBi+/He6EhXDeHmQuji9JY/Q7
	wekEAfk23tmu959M4Eb4PtgiEfj3VE93l3FTHI2x5hFis
X-Received: by 2002:ac8:5e14:0:b0:50b:8d12:358e with SMTP id d75a77b69052e-50d4fc1802cmr125027261cf.19.1775296275989;
        Sat, 04 Apr 2026 02:51:15 -0700 (PDT)
X-Received: by 2002:ac8:5e14:0:b0:50b:8d12:358e with SMTP id d75a77b69052e-50d4fc1802cmr125026941cf.19.1775296275561;
        Sat, 04 Apr 2026 02:51:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c50a7sm24098466f8f.15.2026.04.04.02.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 02:51:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 04 Apr 2026 11:51:01 +0200
Subject: [PATCH 2/5] arm64: dts: qcom: glymur: Fix cache and SRAM
 simple_bus_reg warnings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-dts-qcom-w-1-fixes-v1-2-b8a9e6806e0a@oss.qualcomm.com>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1421;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ICECY/f2NzjoVnynzXY3eFvLPxrhhSvWZsoedFzuz9c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0N8JXgwQ0f3OjJpTDtnpUNZ0qM3OWHE2MhGS4
 kODD8ObSgCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadDfCQAKCRDBN2bmhouD
 1yu6D/92UK1bpPWMR2OPJmATkSckCJzZEOylH6mqQ8FQ6Q8zQozdiyIJ+BfVKAanR4sWAahEd6v
 MPBog9XeH4xlHmsacBx1ms1UhAikdn8wc6DaNyza+R6VzT+QzwoImIP+D8JjGBUHe4Vf3nuAyRl
 5iRnOUeWTbudakhUFag/NNQZG+1bqfoAMHk18ZJfuZHMIYmnGg2Lnkjvl8iRW8CEk8eCbJT73uW
 nrd3qQsLkLulrWQ/+bp8ebfppevQWJcz6nUpfZU9cIzeLN97mA6+LYJcSY3cw2YB+3t/8AiYwMk
 e0LXR2k6fopPGCJyN0QB3JOJJCiUJ/0t4MHgM1TL/CzXjnnBkzU5jCgJd/7/qdFQV7uqPZq/Psg
 iIgsiM47exD85lzgLS3rz+wpGy7A+TYRn0MMlk0/Xurg6d67vpFgebLxJ53pOluMbjztFZb/DTQ
 CoP4dYPq1n1+mZKVoIUv6A8VUZHo4jE4oZKMbkRPUH2ReinBpZua2xg3ENyxvyDbHHJ2Yd99ISE
 YgfBkY6oRL7owaUqx0foSMzpeKFvtRoP4qWKoA15Wck3+mReyzFAZTerd9NtQSlLtT9BGs/hLMd
 SDvcMFTNjgmZFR2Wqr5FBjDYw+4PuymrpcnBf7JPxk1e2FAXW5rtrtxW8fMUbewuaDe3t+xpLCm
 3sohW+lDlhKAGnA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA4OCBTYWx0ZWRfX8sB8ajay9Tbr
 J/1IxK2N1Vl40MkRLp7ul1Y/lXom+iPBrhDMNa56oqmJ0/bOnduKLNpUJK0iMmj+CvYOSyakMju
 oO8B5W8jsM+mQX4+au/wMBRLDUB+NNtPOcaIkLQijXg3vW8sQ+QBovhiEErcFmAR8WDqtFd9T6Z
 ptKChfgpkXyaXZxdEMZtgXu67k/jwOYmOYVWUxbWWH6n3ZFJXmVCKsDNiGNBun6ZSnrzsT2dvdN
 R5FGzwLRrgSWsrSACxKyV43qfez9CnPTLVdbQZCQnWzDpUzUybRsLIMMF48zdigLuou0nA5gp21
 nZ8UdlhUvDO49F7uLMIm6OPwcgn67X1J3b5dK/rh67mlVAmLV7g5+blywZLx66V5VMNvEv5qKYc
 byW1bqZ56qkaeUDUXdSlTKZA/bSj+NLXwVstp6/heM2N/JPTklKJEUo2LSr92C92G8RCkQc2GO9
 0lp1Vxz1gx+UPFAUXYQ==
X-Proofpoint-GUID: EBn31SCyCHZyOsDW-cuQqDPNJWxAxaKI
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d0df14 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=whlQpUbcimcIkjChax8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: EBn31SCyCHZyOsDW-cuQqDPNJWxAxaKI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101763-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1f300000:email,81e08000:email,1.55.71.128:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9B50839AAB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Correct the unit address of cache controller and SRAM nodes in Qualcomm
Glymur SoC DTSI to fix W=1 DTC warnings:

  glymur.dtsi:5876.36-5908.5: Warning (simple_bus_reg): /soc@0/system-cache-controller@20400000: simple-bus unit address format error, expected "21800000"
  glymur.dtsi:5917.23-5934.5: Warning (simple_bus_reg): /soc@0/sram@81e08000: simple-bus unit address format error, expected "81e08600"

Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 3389103408b6..0c5cb8532b20 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5873,7 +5873,7 @@ oobm_ss_noc: interconnect@1f300000 {
 			#interconnect-cells = <2>;
 		};
 
-		system-cache-controller@20400000 {
+		system-cache-controller@21800000 {
 			compatible = "qcom,glymur-llcc";
 			reg = <0x0 0x21800000 0x0 0x100000>,
 			      <0x0 0x21a00000 0x0 0x100000>,
@@ -5914,7 +5914,7 @@ nsp_noc: interconnect@320c0000 {
 			#interconnect-cells = <2>;
 		};
 
-		imem: sram@81e08000 {
+		imem: sram@81e08600 {
 			compatible = "mmio-sram";
 			reg = <0x0 0x81e08600 0x0 0x300>;
 

-- 
2.51.0


