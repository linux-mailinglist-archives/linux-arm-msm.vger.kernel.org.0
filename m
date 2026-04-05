Return-Path: <linux-arm-msm+bounces-101867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GTcD9Bz0mkVYAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 16:38:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D646239EB87
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 16:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDB3B303A85D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 14:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367DC2DF6F6;
	Sun,  5 Apr 2026 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C46ZUBnV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="enAeRl/Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034A02FF160
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 14:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775399669; cv=none; b=csnX6z5dq7tBUrfE2fAm+SSZtR2izx/q+V1XsvteJjK9Y+v7WPWuDWGiiUe/r3RoyIgan8jTrVhCcgaU8yBKfbFKnlgZuvS0LlMy4E31912cgUG+A7pmSaCmSETmX2XZr3NRAloQfY1W5nZUDzE0bjfOvMWaj/7hMaZp/B2dy6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775399669; c=relaxed/simple;
	bh=D++Wl73hTbYfSyRKuH5nKLaK34f/XYn1VQrydlWt6hM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FhKr73Cb8YGo6VrDGxFm5JUq2GT7mOCP4yw7a0uZEEuAeKMe91y9x/lT7qzypiS6LTC8NG9MGf6IY8u8prBHU9Fm5bQ3U/eZ/cfFyghBbuFqQ1RJYpyoaPKf35GIchXvtz0fNJlsofO4csX3hy2rv23JC6edmhKzfc12a2BQxM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C46ZUBnV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=enAeRl/Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6353oLWg421912
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Apr 2026 14:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vAMWoWte2Tjn4Jl81QLiLfqRU3eA8YP3AzsfgymsFwM=; b=C46ZUBnV+WbMPMdH
	E3EdMBCY0rKBrdbYYQayBKHjVkXouOZHJcvOY6C6TI3bZzgJR7OdhFDtRO/h1t2c
	zyDMZlNKOf+0eRGY1iIxYxxwX5G5YI6FErDDIX71ygzIrBYlEyAU2mJi14wPBM15
	kMDwfo09Vpq8T5/i2Z+LBT/Sedt3pZ3mRglsioSWm4V8A5dOZ0Gqvf7A7PQ0oeWM
	ykyc10mWXf+SSHa2DtWmgmYXyETE0QoQk/mx+I6EoHAojU46GfA561NJBqxRAiYV
	zIaSCeuHJ/rZm/431rMd6XJBt541VfKJuRYxLS4DM77HtO81S0ZMyQ/SWnw66Yzu
	q688Nw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mjun9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 14:34:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4076dc16so152065851cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 07:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775399664; x=1776004464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAMWoWte2Tjn4Jl81QLiLfqRU3eA8YP3AzsfgymsFwM=;
        b=enAeRl/ZEuUd3FVYIYmWZLNwbnJSXSSKBhBeZtgYF9g3FAh/f3Y9SrzHrxVKSxhNju
         ubjUidelj9ujsQVi4S9lO0wT0J0GI5jH/SDtQ4OuV3ircUBUtp3wKlQfn/BkhYUkjd9B
         6br6nwJVsHTEAjHa0NcdNfsS3HlsKGoAn7+I1jNlJSRyAf/VxNldiPn8MI+3eNWWnec9
         sVzYJ1tWNWakWBB4uXJNlHh1qcSgsEuMIIQEOicXUCXK7AuFTklFsnyUAxBCwWSBUtHF
         ev1oXGGfNyX0yMzTq4o0Hxj/63uNYCKXET5lXjrgVW82f3ENfC/u1txxuovysNcrfoSy
         cG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775399664; x=1776004464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vAMWoWte2Tjn4Jl81QLiLfqRU3eA8YP3AzsfgymsFwM=;
        b=PqIia+UXyyR2L12S1eCIH/80ht+UvN6ppYwVQoR6PZKgqqdZFZ7f8huu5cpJw/kANs
         Ig494Kkp9uyDbadson0jKdtHMfUVBFvGB5ciP36C3cd+INWTW2b4YNVTK1SrAEu4cD81
         MhWspsEfOC9EMVwTadKdA3EuYkyuNIuL/kqgGnU9lZTdl7Aq70/SLNYjq1/JtB7inyog
         doxUfZD55tB8OpZYivDaqVpMiFceohGfxhEAXhJkbkn8Rn8jU9bxKruIC1yLaUTXrP2w
         knnifInYoCVCgM8kcp0QK9WJ/l9siBz8sqQNb9Rwn55NPHeaLv6xh1cE+xReThJVD5Zu
         qGgg==
X-Gm-Message-State: AOJu0YxQCdeKUkS8aNV9maaHOk10PmnRnUvNEsiS61GYCC7LIFT9a2cl
	wMJtgUcu196q3Qnl9WDJGouAW5ZxQ6hQ+aVDGYP0Rllg88fr2FpBrRZl0FYk8+PN0rPqtLsB5TE
	7KEROp6ravlKfVocNIrjeKmZwj/ZbY0lY7oxqhjEPoheRk5gjhYA3F2U/lsZocOFROOX8
X-Gm-Gg: AeBDieuE1BKnnFiEZ2SRsarVv94t68xlV5va726E3tm8eOWDeFbX63EJUJyhQCiuZSp
	yXjS0reevs6fBAlS48HDUf7AuHJi7NHeF2vBFQ7/4F6OyQEg8xOPCxu9WdpNdYfkHH4/h0T5T3z
	BtPJo+At4BMoxo9X+Y0YW+DKp4ppL2PjPUeb+qt4Rf2H6dtwhztob2gNpuUB1M4AcuJHWLHvgdt
	1BJjAXA18B73bElDLipEp+IQzRMZ67jjM8BfqomhslQSEbx3WQ3buOxdM/+nnquKVO4KMHiI5Vb
	zLKpb647H4kwL7cmhIgIW7PniIUQmbJTEMI+dWMtqFacqQ5c1ICxN/omXykNsWmx02G45sm5bCh
	XyfNx9QYAfYgl0QAhclsQasU8DbBxDrQ3D9pgJmMYqRXq
X-Received: by 2002:a05:622a:44d:b0:50b:6b21:2bf7 with SMTP id d75a77b69052e-50d6209d94emr162547091cf.0.1775399664567;
        Sun, 05 Apr 2026 07:34:24 -0700 (PDT)
X-Received: by 2002:a05:622a:44d:b0:50b:6b21:2bf7 with SMTP id d75a77b69052e-50d6209d94emr162546621cf.0.1775399664148;
        Sun, 05 Apr 2026 07:34:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm713934755e9.2.2026.04.05.07.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:34:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 16:34:03 +0200
Subject: [PATCH v2 7/8] arm64: dts: qcom: sm8750: Correct and complete DP
 address spaces
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-display-regs-v2-7-34f4024c65dc@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=D++Wl73hTbYfSyRKuH5nKLaK34f/XYn1VQrydlWt6hM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0nLd9mCeRR/2R5Hwx+8lfcB+uXg4NX1Li12LS
 GBvIY5NX5KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJy3QAKCRDBN2bmhouD
 19LmD/9C/CNpAsJJ6szXCf/YpgJ5fuVnArSTkVVf+5ue8ZCbZHAHBnmF+r2No7DQxXXgQxiiKeA
 FdAto7dL70qr6eubHNtcPR8f+i2tqzAWdbiaEhdXGHSMg0xJCgSseQ5B0lVKSlEFlosYAVdJ9p1
 VHgA6DAAwvu1dwGVXdNWrvUcBzwmATDM3gbnOF0sULgyV7BklXrXlm7ARdzCaa8dZ5ljpuwC6jq
 6nBOijC54/NzscmQ7ezxME8F1L+fwdwgiYYnaM6R2goKQUQQVGHXmLFZgKZKclB2RCYsJhJPXGn
 D0vm3n//0Equ/8UivYmC5PpIReRPEnBifRl0T00Tg0NmnosmGYOTfSXDTRWTps/eVPNQPAMDER2
 ZSUKJodX65nWsgj1Lum1ZTLP3appBWHQtiUs4UcHsUIU3hcljDJnw7Bb8j/l7aog0uyH+94oJUc
 GmLmNxYq1VmHSK0tkExiE7t7sFo7n6IQ1t5wufqUT1EO7iYWv+liII8WUV85a/sSs7jNmQfEJqO
 2xqb2zUzQkkqfuXiioK30Gy1Du0lgtlExdTRrelOgrTW5K07PZPB5CC5dt9tJwak+a3O3QCxCs5
 QfQQiJFco1JUBcM+eG+OMQTZdocamKTh/+hJf/f59UDJdoluJPbRjkVxNpJ41Ilzz3wsawHdMl8
 h+b0hOHzEfDHizA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 8zzF1rCACeKdlbUu08rasKmSiE9z0fme
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE1MSBTYWx0ZWRfX46c5eHw5hmwt
 FNGsaATsPnHdaBilSlRbz8G/VxmmqQ8Ydfn8nRAizoVxaZ9P2ngcV1+5H1RD7fr3oAp7n0XdB15
 ECjMGTjmjqkiZ6Bab63qZiFmmZYjOIERVcIReyWAFyEfRth4ssaXdcLzEskU/7fC/OIt1tITDD3
 ncTblYSIJnrJ+Acb/0EPDtaYBKyPanjIWLgmMjSI+ZyikXTjUUhv/E2YfPQwADl5md49y/6yNBH
 04ZtkjQPIJ119Z/x1bOrcOaFbmIyRvgu175/4Pm9O6wAAnh/lYWG8WijhFrOmOL+qXtVkd4glk2
 QFvhRoGerBYWy3MMKqPhQCDFYQK0OlNiExpvtmtmcmn6fDAdkLD11vhCU9tH2mxxz3WM4BTLIm3
 GFOwyBx9l+wfvYqhnjYUpx4N2hL5zr4TtwPv+3wDUNtR5Ta7YHV2KV5wrQ6S/Jesig+TmvBS/XU
 yVZOZnSdBcO2Gkeubhg==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d272f1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9LIhnIfllzZggS0j5EYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 8zzF1rCACeKdlbUu08rasKmSiE9z0fme
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050151
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101867-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,ae97000:email,af54000:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D646239EB87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DisplayPort block on Qualcomm SM8750 has few too short address space
ranges and misses four more spaces.  Complete the hardware description,
which in the future might be important for full feature support.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
dtbs_check success depends on the binding change (first commit).
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..aefe517e0669 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3325,11 +3325,15 @@ mdss_dsi1_phy: phy@ae97000 {
 
 			mdss_dp0: displayport-controller@af54000 {
 				compatible = "qcom,sm8750-dp", "qcom,sm8650-dp";
-				reg = <0x0 0xaf54000 0x0 0x104>,
-				      <0x0 0xaf54200 0x0 0xc0>,
-				      <0x0 0xaf55000 0x0 0x770>,
-				      <0x0 0xaf56000 0x0 0x9c>,
-				      <0x0 0xaf57000 0x0 0x9c>;
+				reg = <0x0 0x0af54000 0x0 0x200>,
+				      <0x0 0x0af54200 0x0 0x200>,
+				      <0x0 0x0af55000 0x0 0xc00>,
+				      <0x0 0x0af56000 0x0 0x400>,
+				      <0x0 0x0af57000 0x0 0x400>,
+				      <0x0 0x0af58000 0x0 0x400>,
+				      <0x0 0x0af59000 0x0 0x400>,
+				      <0x0 0x0af5a000 0x0 0x600>,
+				      <0x0 0x0af5b000 0x0 0x600>;
 
 				interrupts-extended = <&mdss 12>;
 

-- 
2.51.0


