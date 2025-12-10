Return-Path: <linux-arm-msm+bounces-84864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CE5CB1DB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 05:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7618F30EA604
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 04:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D216630E0D9;
	Wed, 10 Dec 2025 04:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjcHBXKU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wb8AEiDA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3255C79DA
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 04:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765339301; cv=none; b=rENvndXOIuDG0khiTt9yy8clYrJYjuqrcWBtlhJ1U7LO/bkywvg66XrQwhivDVYSOlrEIt0uevTWrGPnuVha8H6e3DsgjsrTSmZERANP3yWS1ZHqUA47+3lwRBPOiCIlaj1mISIxC3ZkN2m/7uoHEkym/MhNVE/AbwfcV7Vm7Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765339301; c=relaxed/simple;
	bh=VtECjHUO3xGDK9B/G9gi6XQmOhondkiYl15lGVWWDj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtO0Ie9QSY4uluS4q+v0IsLEXfoXyngyB6Mn/kMlH7ITphQYiyByyzhi7SeNt/rr05wfiLyfTfk2D2OhydKi2rM5X04yUh04VldOQg1ExiIii+tTXBlwqWqGfcYv7LTpmQclRe1mUcqcuha/Di92FQogK9NztzyO8RFiTBJWG5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjcHBXKU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wb8AEiDA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3LN0c1810381
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 04:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MqiK2oV4ydfSYTKR7Zx8jO1z
	t60wSHlnWIxEEXBfXUM=; b=JjcHBXKU77FDyu/9srzsR2eJZHcVGnZAIAVSJvWU
	8iuzpG7i1SzOJhvPML7i27o94CyGCZwxUCIm02Bvq91Ux6XvfqqRMX+XB0bNHyHA
	CG+HY5f3MiIDUlDp701lzkPBa0RabAmiyNuhFe8mMEnNH1NqS9MBbyxGnFfKs9DW
	fLaRnL6EX9i5XfLdgrvIoqBI9eIk9ffLlbkoNB4IzfJ3Eag55Ywy7fS8qy4G1auN
	PIddMznblOcGAbWa0I7qLkBIqhx0iZ9btO+IChPDGsEpUaa/XbW5QJV3mwCknSOS
	WZcmmaqYTWL1HGtClSBBDa1dKZWjep18cmk1qpysenY4Yw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axm9cateb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 04:01:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee41b07099so78114461cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 20:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765339297; x=1765944097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MqiK2oV4ydfSYTKR7Zx8jO1zt60wSHlnWIxEEXBfXUM=;
        b=Wb8AEiDATruQhaYECrk0DWRN9XzUP2bl7k2UPD0UiYb0814CeN4t2iTHaB2I3GRIwA
         iCDcyy0w3aIOfjrVp58TulHKkRbaJ7ibBXTiL6vyyp3yfCUMAFJyT9Rp0jBM2ePSlVgb
         D8P3YameJ2/M0pdTp1FBA4LHxvcsMEGLO9ugMEFFUj6RZWZsfdgox6tGrZ7n3ipIVIat
         10n/XIKKuhBODke83pPEB6coICDRJekIJGecjyvxXmqdB5WFWnaztdQAu9sTwmPJJtI5
         PiUrCxyRAZlOB0iDcdFNXirmeBxe9ouNDprjdRjafGiuM4KIIK+xsoURyaviXRJRWz62
         JkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765339297; x=1765944097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqiK2oV4ydfSYTKR7Zx8jO1zt60wSHlnWIxEEXBfXUM=;
        b=O+5frNhZpusiK3lGW+Ao25M6cRnUpPDQ9veqYIxYzGxCbVBUsg3nzddCT2VXFXOdch
         PZV1McdDKF0Zsq91csJLevZbgfboA46feavFrPuder9fE/wk/0vemdlCW57lc4S2jtHW
         66K/F+fwfY1QJWDTYoTBXG6CIMEU+MqTP7IQWccwCSr+bw1wnFdnnHJi48iNwK5mHKus
         GRSZC3B6BIVdmoLhachq2mjLJvJt2jQnY6t40RkBug//3BSJDcZYkiNTkcdxn8obnCwW
         WKqf3xoht6stfbDdMTJTVeUgGL3rrv06bNmia46LNguPMdQegxN3ZvLtfXtgdkNzuz3N
         55yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxGGaZWN/X5ixens0iYKYE0Z0VduJCt5q0Xzmb1RO7zpObWYPPnvrwrAZpyeijmKDeet41/BBfXWD/Lp6y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd3iUaW3+mDH8gN9UFxOMkopiEjGT7Qx5z265rKkSBES4h4gey
	3cH2SpB8Ss8VSrjvfXwnZ1UTn23X0DqWMXzMvMQow/POuVMDYte8WiOY4mFYdOscK899j6B5VvI
	ePT8gN6+gUWXTnVSAWVaKU84vdapg35sjZPWZoTCtBz8vjIz8Glytm3+M9IijngbVGmUd
X-Gm-Gg: ASbGncuOb2Z0Ei9uVZyMTroaom0wioH0RMa0OuUbCU7EFhj1P+uUJufd21mnd/qWICT
	KjRmXCKetGYF3d8luX5/Pvg5YPBbJKDJYrJSSDBDuKYFBdfvAo4jhMhuOUgg/C66lqRHdfybE7Y
	w4w/a6gcacjvasIpMYHp/UnAhy9KdEhJJVX/ruWyVE0srDm8vcJr5NAYwW143ygYaDlmK7rlL9u
	Yc15UqiSZuZHW/b7UrQ6lTdKwC2ueqNBhtgaopKBvGbWeB3N6/RyrlMeLzaJnGm37BrDM4FjUH/
	5/Lckf0YYbCkzYIHxGNEL0A+pv8hmNu3Pj1m+rXBkRtEfYevWbn2GvcMaZdDqLM/In2WlrFTrW8
	zr1qIVAf2GybIPzSH2rCNQCOa1Ynts84MpNbxlqA3bDB+rMx9C0a6zZL4YTAzrU61cKtGYY+zbl
	vXsqr7mGJswNsV6TVY9ON4yXg=
X-Received: by 2002:a05:622a:188d:b0:4ee:2080:2597 with SMTP id d75a77b69052e-4f1b1a846cdmr13831351cf.38.1765339297541;
        Tue, 09 Dec 2025 20:01:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFR6q8iXUcqUwTpaJVE3qBT3yDxxuu4wFZVSU6r3pLHR6MDtUDQJs8YgKtaZD9Q1cInJatE+g==
X-Received: by 2002:a05:622a:188d:b0:4ee:2080:2597 with SMTP id d75a77b69052e-4f1b1a846cdmr13830901cf.38.1765339296829;
        Tue, 09 Dec 2025 20:01:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a7c5sm5946794e87.11.2025.12.09.20.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 20:01:35 -0800 (PST)
Date: Wed, 10 Dec 2025 06:01:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH v4 9/9] arm64: dts: qcom: Add The Fairphone (Gen. 6)
Message-ID: <ysncf5bdxklhcuvxunmzd3gudx3qt6oq4ihzip6afb3fg5z27s@eonocdzxxw6f>
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
 <20251210-sm7635-fp6-initial-v4-9-b05fddd8b45c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210-sm7635-fp6-initial-v4-9-b05fddd8b45c@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAzMiBTYWx0ZWRfX24gEOXkQMGFU
 nHfXWAXTeBlKGyRke3hFOMnTit1zK3V1QYxd1nZlnnPG8TJmRyIGAoYc5TiczjcJrSr/VLgO/pc
 q0bRSd12/7tMeuA0edShY7+w+JhMroNVs/+bi1slxG9cqxIejMHrgOu8TmZuLz8v52YoPLssfKS
 yQ5EUBGLpU/3Gb9s43A78RcNEh/7Po4u/reux+VtZToxIXQea4ymsOFRbNSc0sassReqaIEq2I9
 26Yog9ZpGtQMNuMvoJOhR0GcodKrxICtl5uZVL7Ydp0XFxPDmnG/Wa3LcVydUxp9b0P61WQ+ZUD
 TIDE7JmZaBjLzECAWqMJzZ/EhUBuUSZynuATAfCnB+iGTr34Mnxjglard25yX6NxBFQmpdISYT6
 BPnTCxGHuCRUok0aRbLxOJZj4XPVGQ==
X-Proofpoint-ORIG-GUID: HWzEIvDRlYJx5GcjcRTAXEVRI9PNMF1V
X-Authority-Analysis: v=2.4 cv=Vcj6/Vp9 c=1 sm=1 tr=0 ts=6938f0a2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=9_MgF4w4W-WW1lAcsO4A:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: HWzEIvDRlYJx5GcjcRTAXEVRI9PNMF1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100032

On Wed, Dec 10, 2025 at 10:43:33AM +0900, Luca Weiss wrote:
> Add a devicetree for The Fairphone (Gen. 6) smartphone, which is based
> on the Milos/SM7635 SoC.
> 
> Supported functionality as of this initial submission:
> * Debug UART
> * Regulators (PM7550, PM8550VS, PMR735B, PM8008)
> * Remoteprocs (ADSP, CDSP, MPSS, WPSS)
> * Power Button, Volume Keys, Switch
> * PMIC-GLINK (Charger, Fuel gauge, USB-C mode switching)
> * Camera flash/torch LED
> * SD card
> * USB
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                |   1 +
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 790 +++++++++++++++++++++++
>  2 files changed, 791 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

