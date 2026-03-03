Return-Path: <linux-arm-msm+bounces-95182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAsHHUogp2mYeQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 18:54:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C13AB1F4D25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 18:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E88D130BFA9C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 17:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F07370D4C;
	Tue,  3 Mar 2026 17:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ReRkO/0j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEeoKPct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8D32DF6F4
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 17:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772560385; cv=none; b=J02AwGp2if4IEGI5f3m3Y+CXUtuZtawFFGnlkvhF1ksMa9/GOvTqmMSBJpaFycfHPiIs9g1CZUOU6xsf9HQe61iwWrWt/6QanylzWVvSzGwHJB/LS0mmXtZnFrDRocIAcfgii+bGiC6r1i+OOUper3wGpUXTUBnfsD9TyY0L6dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772560385; c=relaxed/simple;
	bh=IVO8tYleod48wc5zjfL1DtUkiG2Vk5ZhZmQ4jXhWDr8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=itJdUZXuUKqfrrc76JFema2D29v4oFv4HqDGw55HLs5kihK2dg1HWdThZcAre4P5fyoe8Szn/54s17n4mxFw2cerSl9NWplEFxD6YvcpLQBFn3N8RZHb4By3q0upCUO7mhjlVI37HnV8mQO8cwKyOPFY6e9M76KUp9mPYb2ujlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ReRkO/0j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BEeoKPct; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0VOn3548595
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 17:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gbdJ08Yf80xNNKdC19Lu6C
	u7GesD7VmFhI+UYHuIDc8=; b=ReRkO/0jlqdyjQVrYaHK7W2qHTPSzCqdSViSit
	i1/JgmyCvm90ZgzqTr3rYkdXvGXgbZM54kL3wCsUrHf0iHxH+f2ZOI7JjMM6tYeK
	XPisTUFWhaSJFC39wXskpVwF04fw1JojJtIZTjmDkUIVKDCXWprWSK1o5y7MYHIF
	mogiBCFHKV11+o4UeGDm4HjZM3yyHzsYyM8TPMKP7uLbWTBn+XAZQEpfwT5mKIe8
	ikSc9JGaJKbdLAU2L+h9iAHoyDRhfTmekeyD5GRv7L+Pbh7fdKnu60WBkll4ZGDU
	72WGGtidAEjX2cinoZCUi1Vf7QohveAkyVUtFG1Pf/gYoKyQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxf9mf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 17:53:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adc527eaf5so29424835ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 09:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772560382; x=1773165182; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gbdJ08Yf80xNNKdC19Lu6Cu7GesD7VmFhI+UYHuIDc8=;
        b=BEeoKPctHZvnDKjPs4kapVCPJ7BDZgxeOcmB79GorITvBHaVd8EWRTwciVtghiI1+3
         VZD8PW88cS6m8kICFDVteF93lXekXhKw+sQLKpL+LdQOVXbUB+FYYdbr8/CKxEUj2EXV
         FZYR5Uv9vaNgLH3hooiP5m7aMbs3qdjcNyj3UBVKFfls/YE+svySZw9P2LUw8HXb9loN
         6xDcPp30gG17xd/c9swW9fo6+xsVjrliPLx3Ie3mNYLU0CeIC+btKue5V/fJjIUqoYuV
         5qlaNNGwvEZ7MYM8R2b1paV3f4kH+66g80FAcw/tiRxVhX412BK+BeDsQv+XVJoE/IL0
         tv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772560382; x=1773165182;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbdJ08Yf80xNNKdC19Lu6Cu7GesD7VmFhI+UYHuIDc8=;
        b=jQ22UVNoyvPAA4aO2r1F5FYTbREjgkcaTl/kZxMYbThRHpZ/y5XRg/4Ac4mJfHlC+K
         bBYuJD0E1B6dFhLDYQA38kg2ztjtyroiHGI5n4G+AWgX91+/gTL31qEYki/qnJn69kLF
         A2qUBznrK4q+CMa1oU65mntsD6wE4B12Jg6ES7rb3YEiINcBOLE0zafeSQBUPT6Go0hs
         CfZYdWTZw634JEg4VxUJFLdV9Oy2rBd+Xv0P0Z930F0nsO4DKql4yzLOTwOmzj6lxYZ1
         5OHv4UtiP/9+i/5xTgur5UY6xj42Ny9G/H7xWvmJGXYVJe/3y/9+iYoMNa0lYt4dBvEB
         HaWA==
X-Forwarded-Encrypted: i=1; AJvYcCUM8KoYlsGqop+pM2dBh79T4yRsCQO+X5lUD1qmWBt4oGlVpprkY2JRM4MNJP23gNVe3i8wi+9VLyvqdhEw@vger.kernel.org
X-Gm-Message-State: AOJu0YzIW9mTitmL6uFDJFwokgrwzy0a+mBgb5ElJA/NuFPt6ni5COhi
	FIvYVX9Jzp69BmjKW9meiJyIGbRJWNEQliOyS1MJL8oObXyvOd1uOa/6eoDv3yeJBMOkf1aO5z+
	5SAxJPUWIezWk0exzK2k/t4VBZxDZPQJfPFf4wV5sl7TedRqLqC/ZP470Drv3izo5Uud/
X-Gm-Gg: ATEYQzwMwmCA9QFuDty5Nu5YYj2BHGB/pn7IiI0rl8tLchZZbqbXqdss7f8HrMiSRn2
	PTBCUXeeNcV+b7zPA0j3ziqVyoLZ1sHF8gWjn8G7fXkh3MgYqG1gSA7gFTgTx/57OOyajJXuoNl
	F2RBuMcuZoQ5XkaLsVhw9a4w5YKXotSTJQ22SzJ8pi1gBbkdqDCC3gv3lwnmVJldkoZmgPHt4Ef
	I0XS4b6uw9ai5ucPoUnhge/C9D9GlZA23oZv8PCMqtCi+vW9wARel1SD5WIxvGFlycRjfTICFQs
	FRDuaakD9M0jjVuQCoUgLKRVG5GcKHSDPH6wKDzTxU4rEp1ErzNm08NmYcB0x2InSLCq0wLnFX5
	LOBfe1cfKz5B5JxTp7tpZ9+B5Yrv3GxzRYHubKslgJaUYyA==
X-Received: by 2002:a17:902:f745:b0:2ae:6779:c8c6 with SMTP id d9443c01a7336-2ae6779cb6emr6261025ad.33.1772560382392;
        Tue, 03 Mar 2026 09:53:02 -0800 (PST)
X-Received: by 2002:a17:902:f745:b0:2ae:6779:c8c6 with SMTP id d9443c01a7336-2ae6779cb6emr6260735ad.33.1772560381883;
        Tue, 03 Mar 2026 09:53:01 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3e4e34e6sm107140625ad.30.2026.03.03.09.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:53:01 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: Add clock controller device nodes and
 enable clocks for Glymur
Date: Tue, 03 Mar 2026 23:22:50 +0530
Message-Id: <20260303-glymur_mmcc_dt_config_v2-v2-0-da9ded08c26f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPIfp2kC/x3MQQqDMBBA0avIrBtIJ7RiryIlhMkYB0yUREUR7
 97Q5Vv8f0HhLFzg01yQeZcic6rARwM0uhRYia8G1PjWRhsVpjNu2cZIZP1qaU6DBLujcvTqEDW
 1xj+h5kvmQY7/uv/e9w81aYVCagAAAA==
X-Change-ID: 20260303-glymur_mmcc_dt_config_v2-ac59220c73d1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE0MyBTYWx0ZWRfX/FTEuJ8Sy6Ow
 +4fegS+Qvvlvs1NisxtT5W8qG5wVz/ciG595f0oFQzMvOxjmMzPkzc2zxnLCB+txkV7USwZTQhC
 ypeeOgwp5fi3t4TD5KmSPtAsTWDZd4DwkVzdJrz4LCzv5bBvgk+r28jz/IDT/Vyj862e3WmzHBP
 HKdq/mBdReLwHaVQtjcW2Ui1hfdWLIJ6fxN2WNnQy4fNFZDYopGWf8aTedrl40vCFnE2p01ND4L
 o1IuMits7W6WGE/dRMUmODEOnDD6mzjykkA254LtGkuQzZ7OqBpYFtVKMcN950nHcRkttjhcmbb
 I2H0BAJfkYQ+WYKy5Ge35QmbMe6qHIuJEtL6gwYrll8+b1jcwCJgSsYbv3OL+jwVRactE2igD82
 SBu7zvnt9NnTFQcQ1iVvfwnKTqvLInuamGoRV0uaLcSh4KNFad4jtcmmY6hyZJjP5Ax6lbUZoMR
 mj0WKCfkcUzTc8PWZCg==
X-Proofpoint-ORIG-GUID: H0k2G4Yu2IItJ81bqLwDfWNdNy06JSuu
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a71fff cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ObGMq8OY7gf8BbfD65QA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: H0k2G4Yu2IItJ81bqLwDfWNdNy06JSuu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030143
X-Rspamd-Queue-Id: C13AB1F4D25
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-95182-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the Video clock controller and GPU/GX clock controllers for Glymur.
Enable the clock controllers for Glymur CRD boards.

Changes in v2:
- Add RB-by [Konrad].
- Cleaning up stray 0, and add 0x0 for regs.
- Add "Qualcomm" for defconfig commit subject.
- Update the subject for the Cover Letter [Dmitry]
- Link to v1: https://lore.kernel.org/r/20260220-glymur_mmcc_dt_config-v1-0-e0e2f43a32af@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      arm64: dts: qcom: Add support for MM clock controllers for Glymur
      arm64: defconfig: Enable Qualcomm Glymur clock controllers

 arch/arm64/boot/dts/qcom/glymur.dtsi | 42 ++++++++++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig         |  2 ++
 2 files changed, 44 insertions(+)
---
base-commit: d517cb8cea012f43b069617fc8179b45404f8018
change-id: 20260303-glymur_mmcc_dt_config_v2-ac59220c73d1

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


