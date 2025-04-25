Return-Path: <linux-arm-msm+bounces-55723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EF8A9D0D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 20:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EFDB18847E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 18:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCCD218EB4;
	Fri, 25 Apr 2025 18:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZoZMyAp3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D191E218AC4
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607076; cv=none; b=lRjF6zkEUpRzDnUbiBCr/xc0eLe59CcE3attTNxOwHo/0S0exjl5+mwGEqihMx29q3B1aAHBr/nd9QmppJOa3XWOYyGdkDWJWOPbZIPCL0Tjv1NL3rty6KIlq4upyWftWxfd44wYjlVsRail/UK66mD1sKog8fLY6Ov6udC8hKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607076; c=relaxed/simple;
	bh=Xk3Sp6BJoGmDDVZX1C8dwi3cwfy3wAIPSXdwpAs9Yhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JddSKJopzxeqp9KXnQFWEh8blGw+Fw+ntvpEqYJiQaHEn4pU1Rn5Hnw/uFZaG4G6RmVImP9AJTATeNEcnMoUMZ8yCesNEp8EbuXIdWCHB1fOigXWhTkcZ3m96smDIVTnA5SP2r6Xpt67AO6T72mnSJu6hTc7nEzTmEPSuhtcsrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZoZMyAp3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuko001345
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v9ycmtWdw1mtAhGHJSYcNQ5K
	fW5PbvOj2z5I1djYv/8=; b=ZoZMyAp3QbpTs1G2QNa5dWk+t0wtxLTj90QwHWzE
	Ah36hsnx/2wV6owXR4Ev7NebAXTosXxKxlut9mUxShTe4Nx6PAeEcgKG0tgOYSmw
	ViTgXURVp+NuvTeOYF4oDlqZTevuYTpAPL28fpVIxoQu6nzWP3ZSWEZ5t7d9puTT
	uvMc97BbPCMMctoKR1vxj+BcUXry4X+Re0Hp3xlWjeFww7XXjwBiJo8SsK7CdZDe
	BxgpSTl0PnFskC/guOAipes8sHkbZ7BpIXUDQGMDjajA66zsYKf4FxSJLFPkcS2q
	85gvO9tse5CJvOuIIsNTAZQyfBWkguiF7XLR8WwWCzV9Lw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3j1wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:51:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c7c30d8986so720797685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607073; x=1746211873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9ycmtWdw1mtAhGHJSYcNQ5KfW5PbvOj2z5I1djYv/8=;
        b=OyEeMSOgBsUmRlbQtVo55Vwpvf7ppRCVRytsRiA9ijSpmmXPkOd1ZTJwbbCXiCZtQX
         yURlzV5uYs/XpbD59aSpAvL8JJ5q2yltq4cXfR7znfwySQ4llPdoF5JAC92dVhvN8QYe
         y0ouLefo6EHA/wnXXO3MDShWbFSbtjd1Nx9H8UUhZh+xSOKsIZnsZQZ/Ekqyp68Mdo1q
         ZfrXlLzNn051Xfv8dFTf0qq2rMFNnKDRd9xbFX6mDtKitbO8wzT9o/sRT0ia491mCs0X
         ev5twLdmecJjly2n1vBOZZLSxFS505qsgnDYuJW3spPT6DWhHVNk/YLbfTTa2MFxsCtC
         D2KA==
X-Forwarded-Encrypted: i=1; AJvYcCUr1MHmEgkThyi2Scdq/kbrRffyFKGDdycY4FVjSUBLaZY8CsdcxeSCKo10GbwrNnsqPcwmeKqLrO+phojy@vger.kernel.org
X-Gm-Message-State: AOJu0YwWmTq6Yoj37dtHuYsoD/UeGp2MLnq31seWJ2a7yHAlugYYmnxu
	qZnU0OUzs8c32/zBfRL6K4cSyK2iS3WudekcleLkjNwvLqSeuOWaSK6akze0tc9EVdY9fnPTibB
	J+gtwpnW5+S0QTEWze21fhCZ/YO/jBSsnqRFfmX63UJeGYsQvfLqDmP6/GB6wcpb5
X-Gm-Gg: ASbGncvMSdPQ4KY/gUGXPGEoEZTOFnRUBldNLCObkvnL1Q/fTHe5VMjYS7Dk4EBBy+n
	r8+nML7J+FftpGVpa9mKpHDXUd5KcROc3W0wSNBdTLn6bF65F3hYKa0Ew1KnBCI5YG/SxGw2UoZ
	RUnapL/BW42suVwKEatFzYEpPa3DvVf0RZ4Rk7jPXgMuNazRcPRUw1VZmdsUpGYMpPwRHC0n1ZJ
	Oaof4T/Sgz9Zd3lFk4HyQ1QgYMDi5MHVUdsM35TTQlj7/SuiIVGgsPhfJfI8ii9NNG7034SMN56
	BcC93gsvgZBdHk+jwR9wXzVMBvYuTymIiKoxBl64gbJjYqpKl+yOR5S6DC5wKIUgtw5JA2cv6m0
	=
X-Received: by 2002:a05:620a:3914:b0:7c5:5f38:ba59 with SMTP id af79cd13be357-7c96684b108mr97521685a.3.1745607072864;
        Fri, 25 Apr 2025 11:51:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgCfAsOCyq06CGmOi0+/EEgnPyEjUIBFlLDUeeOlp0nhMgAvTxmeVrtGr4SRpqobWUin+HKQ==
X-Received: by 2002:a05:620a:3914:b0:7c5:5f38:ba59 with SMTP id af79cd13be357-7c96684b108mr97519085a.3.1745607072590;
        Fri, 25 Apr 2025 11:51:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb258c2sm706677e87.32.2025.04.25.11.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:51:11 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:51:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/11] arm64: dts: qcom: sm7325-nothing-spacewar: Use
 q6asm defines for reg
Message-ID: <hr3sg23xifgebofy64l2zsybelsbl446c5e63i5s3f4bhotae5@6tl35nmeqkx7>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-10-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-10-28308e2ce7d4@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzMyBTYWx0ZWRfX7xI+lFmgB0Q0 XLC1ZH9Sf1hnTJEYTXrKQCaCYw+lHHfTnlYaPQPrkMSsRB2+idr8s8rM2PjDhq8zQn7CTrER0S9 KuLAPcS07Tomw/wqaFa7JUMy0aU3Ok11eCdsevkZwd/kzo9oK0A+nAIm/AhMMSGgJCw3gV/Fg1F
 dThOoSgZjMDjO3qJ9wXreeMwRNMlCoZmd9M47vswpEKulsbbtet0vNl3X1WWRuRRtkgqH4Lnopn oi54pp08eCS6ivDiw12rfZL2l5ATQljCXMuy3RL2aWKiRlDUI2HJrrcQRRr0fqpTwoMhmCQt1kD vx+4MkovjGatpmj3jr9zSGENcfSWQ5UCYtJ5Y93gHIbfaGz94HdtjkB9xQqthLPBHENhAdux09p
 OAR761abVLWLZ+ndQth6rCRGmo3qvYh3oWWakzjKp9zTpz5ErqTyR1M61fQ0ID3qpAmF7Unk
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680bd9a2 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: jjU8295YjaQpYGYowMCD1wvJnGr_-dqF
X-Proofpoint-GUID: jjU8295YjaQpYGYowMCD1wvJnGr_-dqF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=557 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250133

On Fri, Apr 25, 2025 at 01:53:49PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

