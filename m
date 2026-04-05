Return-Path: <linux-arm-msm+bounces-101858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEGEHo9m0mnLXQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 15:41:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C890A39E973
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 15:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15EFF3021EBE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 13:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5595134678C;
	Sun,  5 Apr 2026 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bvuWGldL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRy19z3n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81D4347FCD
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775396404; cv=none; b=KHHUmKRVylhHWxiIMpBYtSZ9qn1R189j1RE2bsgOmI2uuRYBXhZm2Abi/xFmMkb23/ufrDmGIGRxgXwbI/jBR2jBVCvIQAXHnqDK9G2H0EYqoi9tm1+Ycsq4mVR1c2rs3kLES2Imj4BhFg8PUuQG8PlZ3bFFJA/cwDF9ssw5Rgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775396404; c=relaxed/simple;
	bh=0qHBlz96dMbZijLiRJ25M/gNyYB4jhLkJMDw+0SA5mM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o5kSRzqtcy2wSyRhxNmTV0goPhe6ip6IjHrxDd3kiFm1ktjHxKk1ksGj1R8jCv1s+srHnpWQ7asvQkCOSy6rntm73K6F0sW0LbC84SAUO1iqt5NqUZwNalxl2/EvDrA2N7V7183ZLsOMkkUtbAnRbMiBrNlfh09Pmv4UpkYLlwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bvuWGldL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRy19z3n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635CJ3kw3845519
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Apr 2026 13:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PxAgkDqM2czv4JuAy8kFYi4isBej1z+gshkQv9GVwJA=; b=bvuWGldL9VHDyibm
	HjFAZllLb8yw2liyHiDlycyrJb6SXivWmKO+JaCLyL6ouMWEJ/vMSzTbX+DR0OBv
	vqB6ucf1/Hq8IqjS0zvoW74FBROUhIOvuTnBJEFROwjrP/ECDsbc0rw9TuowQNNo
	foXZ4ca3jH1OdFsKSz4W5TYLgSEwul5g1Ic/1LS0MES1MQsqAVCXY0YNaWQeq+NM
	7Ui5ekujoNrUN2JYPssUAhLMiTaLDYupiT3JoDHkrt7uaBZ5/pBgya5kmxnJk1X9
	P5TFGOLn3b5QY0krlMQeVVdflj8C7ehJ3I6Q0BZogJ0qW1l8W6hBJSEmykNgomdA
	ezGShw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfjkv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 13:40:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b323c43fdso71027291cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 06:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775396401; x=1776001201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxAgkDqM2czv4JuAy8kFYi4isBej1z+gshkQv9GVwJA=;
        b=SRy19z3nUS+wipOTxVFEG0FG4vaAeHi+CnOgo3N064AtNT3xQcoMs1n5CcbqBRfHo1
         lbyYxtLJ35oUFXRGLyQakq9eH68Pl1VpaGDa3hupp41Meth4tM8WVKJpa46K4cIJGmvp
         R1qMec8Ln7FdjKzWJvHo1xLHpHkMCdZsFvDRCWoqbGb1C4+/tYf4sZ1D3cFCcVD5eSxF
         M9bZ+rmgXkFiUh545s7KEw5RH2AlJq+YClR/x4EUy/tYgbkylekiWaAE0ahaYqIvA1Fr
         2zjT0ZRrswf/+4omtyBbJw71B2m3yHucCZZhy1uqhDOYnorCJPCsI2MgHZ2qttfc1Mjn
         ccHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775396401; x=1776001201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PxAgkDqM2czv4JuAy8kFYi4isBej1z+gshkQv9GVwJA=;
        b=bbTCZ7RvuM3iJmBRzZgjVHP92FGBQ/5A5K/jpT8NonEPm9In/eaVMRIxg+FIq+4CVq
         OUr2bQcf5zIbYBGYfN7TPnVV4boWlWwkoiWCtXgm2MamoqSM+XPZrP4iN1ZlS+Zvz+Sa
         fOD5RTk3Hf6VPhtwFDfwtzFJwwgjB4o2Ssbw6d2rzjz1iu6gazWpFaY148zpo20DEFCS
         GBAo8/JzxGq3oVzMWNc5WP7GQUol1xE/9UrvRXIiK4hEqXCFJO9frdt35775KMR8Zz6X
         Ig8x2EybANP7ux7noPph9e5vLRCWkVwD61D8QdAPtrq8zuHlJJTXoOPncn/8IVu9+yo3
         P1JA==
X-Forwarded-Encrypted: i=1; AJvYcCVi701HJ20z44VfdrY4twPor3lFRZZmOHkOy3NzgDMq7ZHMcB4MihiUdwn+oHdOEUzZOrfdhL0hW0KlWa/v@vger.kernel.org
X-Gm-Message-State: AOJu0YxRm2mMj9pGbTFs5863TVzX5v02rbAZd4ChKwts2H4R6KcJzaH9
	45kkR/Hvyt5icLn0BgX4MLonPLHu20LFnsSWrdrI4m6IvVzJfPLBJQqiAC3CDEHwpSoLp9KJ4YJ
	dh7PXx2KeDJTDjpd+RGTIjQmX7NY7eQjQPbErQzihE0KIfPhEqzSBg4bkn20Ase06uWjE
X-Gm-Gg: AeBDiesZGgI0xMbht6cUUQJ0mDc92rTmoDuFa4JiniHWqayOXxKdrwM56GtpXaoG12r
	TuSEB82LVHkQXpqP2ZsJDjG5gy/0H1r2P8sN0uf9W2w6Tz3zVKAvFGMYTAVxD3jtJvC+k8vr9Xq
	IgBqmNj12JuLzM1kv3oa0zyYx9sXvsbwRkmIFEjvElAJ2E08KNRSE2vyrLB6CmFUMoW+/N9g62J
	sqiBjiy385MOHczzHmt4q0oKzFH8zkVXwdgCIbLVodGQTaSl8Aj5S9Bttt4DG5TNK09kdXxOiv1
	OvXwnCuNxiwCA/lpqxKIG1cf6yJqSPNPUAHEiTL+YLRILyAuwJd3XzAUxqBtLJ05sfZxWHR5Uve
	dJWLNShGg5o2hBoOv95Q1KZi5lCZZdtHVB3uA2QlDv7B9
X-Received: by 2002:ac8:7c47:0:b0:50d:7504:b719 with SMTP id d75a77b69052e-50d7504bb24mr91461141cf.52.1775396401135;
        Sun, 05 Apr 2026 06:40:01 -0700 (PDT)
X-Received: by 2002:ac8:7c47:0:b0:50d:7504:b719 with SMTP id d75a77b69052e-50d7504bb24mr91460611cf.52.1775396400721;
        Sun, 05 Apr 2026 06:40:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f1esm32188774f8f.2.2026.04.05.06.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 06:39:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 15:39:31 +0200
Subject: [PATCH v2 4/5] arm64: dts: qcom: sc8180x: Fix phy simple_bus_reg
 warning
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-w-1-fixes-v2-4-1f2c7b74a93f@oss.qualcomm.com>
References: <20260405-dts-qcom-w-1-fixes-v2-0-1f2c7b74a93f@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-w-1-fixes-v2-0-1f2c7b74a93f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0qHBlz96dMbZijLiRJ25M/gNyYB4jhLkJMDw+0SA5mM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0mYh1wNW9cBuTtKHE3nLrL/TovoT4R1BshSr6
 07or3RR1ImJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJmIQAKCRDBN2bmhouD
 1++mD/4k5s4VLD7yopf6ddNeEvCjYVY9bBj1kowl+xFqTkTQMViT3zoPsRZsya7VMyRXNw+Oeqp
 6nlMA0TGFZo8+4s8DICgdWVpaP1GWaQFOXjJsWtCL3coB5tgsYnDSVMtbngYzSjeFImckMonYcy
 mdkmHcu2hnUBBvhJLebJLD+MznFIfbzelCGXgGU27xp0NNvbMONdG64nmg2emOOSmJgvAME0J2h
 t+3EL7q04KDjuWGLOZAYVdUu3MesX+G7hTRbUtgex5JjXzDZpoVA+mKKyWEzR02fUsZOME4orWW
 tltpJoITAx0Dd+nsREOpqQU5BJOYrR+v6hRFoYm72eA2gdccL2Gge9e2WlqKgO8f8tjYCqaYTls
 UPG7zBaJxUUircWhIPXwkqvmWyi22xFzv2OqYjB6Z2blG9ee7Q2pDLtDFGPmUIfIMO2x0uEVnZe
 QS/QkNjtnnYdeiR8K5GHQPQGsec9xw9Vk5fALdkwaMzfY/EhPSzsFs3O0EiPY2WCqWNCrClzcAx
 95znRKMb+j4fkVq39exh05RPsUo2hIlwmv1WayfHFTJ55n8aOncYw6a7HrJ+3lwUAhoR0O+Hvux
 vsjstdRbTJIeFmc0dQX/KUdG0zv5F8qAMTdBIdSadCsy7IfFh6q1HobNcL0olb9ckHzowPNRHGG
 PfsW22ZpjvM/NaA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE0MCBTYWx0ZWRfX1W28lZZ5vxzn
 Z/f/gbIvbfeZjAopfi208w6pwM2nd0i0KTwTEHLZIUZtUXPHBtISGaZ738n4/8+YMiaIwv90WlU
 ofqs2GB9jVCl32svjF3pTwHsB2cziBKyKBsXqGR5XAi5MxJuAhchCbceXM5dI+X2Ttfg8QyCoax
 hlxv8IsbLxK9Mt+Qhzel3KWzUVHXsrzjMULbTAHcLzeLqh6rjFBOdiBuQZtV32ElQrbwefHzeHw
 G2yHOtgNpyhOOhRtkrW9w8mXfuC2byMGJXNOajP0eggTp5BHi8XdtXX8d40zNvJAvQ7W+PyUBEb
 GIP4eJ/ydDp4UXKW3WTjaRO7XNwnQjKp6XgO3Nv/IqocM+7ZMckYx6bmat2YJdEegVx0SUdovGg
 eVkwa5108DBmYFNUo7qyVzMrcAWs+iHY0jFosA1i7Dynyh9cImuH3iWk7Z10UbRh8WaqS8+iFW/
 dugOZ3S4xzffDHIlSbg==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d26631 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=LUrmTDEt64PL7dvcyrwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: q5T0gCwrnicA6QiXl1sxRHhU5Eq2Q1F6
X-Proofpoint-GUID: q5T0gCwrnicA6QiXl1sxRHhU5Eq2Q1F6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050140
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
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101858-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,88ec000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C890A39E973
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Correct the unit address of phy node in Qualcomm SC8180x SoC DTSI to fix
W=1 DTC warning:

  sc8180x.dtsi:2650.31-2695.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"

Fixes: 35e3a9c1afce ("arm64: dts: qcom: sc8180x: switch USB+DP QMP PHYs to new bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index f45deb188c6c..e87e82fa73e9 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2647,7 +2647,7 @@ usb_mp_qmpphy1: phy@88ec000 {
 			status = "disabled";
 		};
 
-		usb_sec_qmpphy: phy@88ee000 {
+		usb_sec_qmpphy: phy@88ed000 {
 			compatible = "qcom,sc8180x-qmp-usb3-dp-phy";
 			reg = <0 0x088ed000 0 0x3000>;
 

-- 
2.51.0


