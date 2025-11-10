Return-Path: <linux-arm-msm+bounces-81062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EADF6C47CEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 17:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6845034A177
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC0E273810;
	Mon, 10 Nov 2025 16:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OIehK0CL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XoDgTgGW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C882773C1
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762791119; cv=none; b=nj76XTZWq4vjRZApsNJBP5CEpKDmtIUUwhOJ+jIU3UT5oeMwk72BOQoaAkBbiHsGYTwcjMhYukYsZCdCywiFyXmJqVaaqOO6Fe4Ox9cCgjsSkgHGpat++sSTwvQQ7lCV7Rb820ZHBRDwUlHUg8Oyd41tQzqFLMmBQEqFSJde+ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762791119; c=relaxed/simple;
	bh=MRx0liLxwwjdaqyTRdesnQ7CY2LbmOfssXBSH9YMeyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZLk5tocl1xLoX5+lwcVmjSPKJPrpkwJ7NEZ5SLfBLt9/+KVKSSr3KgAeF7VNhDimyECp06At0wEt4wtQlk7j3V1F55SOuu0fmq4eFhVC1aGWefsH2gSgaDQFQNejl9soyoTFAlWXL1ZJ2e+cPc9c5l5tRSoIRF73bi8Sj3seag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OIehK0CL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XoDgTgGW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAFPwRf4071288
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t44ZoX+OCNSqApq3I3ABJHbi
	eiUu0iSqHG34zLANGOQ=; b=OIehK0CLRG0uaZdEa2h0EyqOKPKYYgur28MTqYFv
	DLIMJaq9w0RsEFJgw3qYbBWRdtkMfm6ta6+sd0KG1kSQnKdXe4iKatb8hz78uFbI
	kqgS7KiYf62njySyApWs1mJlFLI85dUXG7exAnUjkSBPfVcHVXdS4vhhz2fP1F2w
	A2yoGRR1HgX+5UJm6cH+Mw2ZkZI5YnpaFDmKJZFBqd0hFv9CjLIDTdjPwlSaCmQp
	l2hwzM3aFNhsutHpBM1HnBh/xpsIL2+YEH2XmodANjOuNQVqgeMsUB9/9ZdgxY78
	xz9ZOEkhn3H5V2XjmgEhse9LBo4EnixiNLQUY1gKaXVebA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjpgr5e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:11:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-882376d91beso79722596d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762791115; x=1763395915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t44ZoX+OCNSqApq3I3ABJHbieiUu0iSqHG34zLANGOQ=;
        b=XoDgTgGWa71q4S881nX5edjQw6JqIEN2luUfNNRSUtGNN+nECzg3DYXhbMtehD1nkt
         REFm3Q1grGpIqSKwb7vY8+XN+rYDUwfBR9937DfnA74R5WbOWBIf2yinsYWfKGQpl+Kc
         0A8XLff3DXun5c5fI11N10cxtYw9fLHQdREO7rrxGVyPbDhoENhVJimxeo+jO2w/F7W0
         Es5PHyLE8R7Hu5Lhs8q7a8SHlaYeaqS3jEkOkGh+XiDmop9PcpeTa7+Lcx7iNqRrSP31
         nFtQcRoD1hmNjs6xTy2e5Npc8DGPnEHszUNttqH3tEFVEj7qK1gsI3tmIZx8JdTUsZM3
         HRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762791115; x=1763395915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t44ZoX+OCNSqApq3I3ABJHbieiUu0iSqHG34zLANGOQ=;
        b=gMnmqRVKm6Zs0tRQ/sxJNGOAJG3PK4ExcVxJxXZAMZiqknpo3yv7QWlRnX8Yk5ZhXX
         dvl0ZlHO//7YrgEnYHDlwSbV26STDCTxy/HOlEsqT10hkTn5xaUhw4GwNnACl7CGclov
         SmZAjc+z+ffKqBmVyZZLHrKz1CfMDVMO5s3SDD0fKs/ZmypVTtjuuFAyPQgvcKmgVwXX
         xjhExhtcqxLEsrIy857eDYnxMg6GJcxi7jxnefNcgIhUWhUpGNwpZkR7zHJ2DjUUBP0h
         JkLfWLmh8hZuwf5EobQT3gq8HbZGIYEInOg97vmSiUizuJ71QYrM7nPFuszVUrqJbeJQ
         hA1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXN6O3yTUC7aq7XIZGW+FO9A/Ltmht8/40yGrTJPjiXAKH5bt4oL8rFenJUNO5zogLwu8enqYklV8IXzhTM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj0ZLTtpVdOlDrlzYkqSE24JLwzOkp63iOh8K9HOjDlIxoBfnB
	txLQpfVe/TQj4snDfdUKY2GjP8M+uGC/ECZgVnD41kVvuxgCFdKBrKWA+bYxEo+T7IUC4KXk4U1
	ZJ/a8tKZC2Ab3ll/q9ISiU25JiP93n2z0/0tcby8pMJxKAe0sRZpbLrhYMqYeTHGwOBP3
X-Gm-Gg: ASbGncuBW0iT8Yu/1Wdn2XXGlxBAqNTGwwXr2dcytO+VS0v/wvwEH7QuaIkh0bvLizz
	J2C+cPg8JnuNnZRk9QbtmrQVbKS3xGt/2MlQ5S88bMsp8JY74RcbdK+L88QW150vBuqyeT4ezvh
	mb/GM+QSoMcDbHkrtkJHdD+RB+Yl8ERzfT8kzWO22UMF85Tq670BYsXJinNjm/7SOSNKx0AJE/D
	vSj1d9FhrOdnGZsdqjG2lcEd0hgsmJKoi/FDixqsniRICJFWzWMPeIetbCBdQJkVoTbnIkDfm10
	bYUXlIKKRddsy9WDfjeXpBujnexDZ4BF6ErX2FY2elfKpTWlEf+ELD5G0nW/ek5juUljidtd2/B
	O07VTcFYLSCTi+GcVNZotd3Jajl6skpOa2XuIcMWE8GLXKBX4DcY0x4mFYNwf59onrCvrRIc9GV
	+5D1+m+Z9mRezN
X-Received: by 2002:ac8:7fd3:0:b0:4ed:635c:17dd with SMTP id d75a77b69052e-4eda4e9fae0mr109401511cf.21.1762790349674;
        Mon, 10 Nov 2025 07:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyG1JLLeUFIOUuxfZXg9+JKwbDXX/NfxH3k4+DgtgJPW110VLxhoWxeZqyBAiRTf2OAuPWlw==
X-Received: by 2002:ac8:7fd3:0:b0:4ed:635c:17dd with SMTP id d75a77b69052e-4eda4e9fae0mr109401161cf.21.1762790349240;
        Mon, 10 Nov 2025 07:59:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a5930edsm4080456e87.94.2025.11.10.07.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 07:59:07 -0800 (PST)
Date: Mon, 10 Nov 2025 17:59:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dylan Van Assche <me@dylanvanassche.be>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Add ath10k
 calibration variant
Message-ID: <wbe6z6z4q6xnbw4otq3vy62iepgsb6rf42sldkrsap3n547abk@ako6cd4tzryu>
References: <20251110-sdm845-calibration-variants-v1-0-2c536ada77c2@ixit.cz>
 <20251110-sdm845-calibration-variants-v1-3-2c536ada77c2@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110-sdm845-calibration-variants-v1-3-2c536ada77c2@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEzNyBTYWx0ZWRfX/TeVAGtICmeY
 heaiQYWFf6nGs7y0Fqfo1L+aYgOqOc7Z+1HR3AmG45PJqeULwONqSGB/NpbGz312OT6r7B3EWiu
 EWC7RsnbcPC0uMzPZ3GoG86hDaJ20zlJfmfcfAY4z/V7llBkTXAjOHvdA7G66Q/2SM/CDOvWdbQ
 JIktD/TRhaXsDplsMyul62/UxdNZZTILvOUtamkIqAYpUE/sEH8nTzbB5/TLQTQKSLnlvo2UX9v
 xiCMf/Clg/DxVrwp/slp9jO6SJGaahrvV5Udzq4VJQrM4UjEsf1oFEl1O+T9cjLX40JHeeMx+t4
 XC52tqt4dIY3VfHqLBKGPBD6UEDKIRK1MlfCwr6Oroe3CxGOSTzVaEfwG+gciOndBX/F6e8j3Z8
 mB2pP35qZgB22H6LPXBeVOwJwYw8oA==
X-Authority-Analysis: v=2.4 cv=br5BxUai c=1 sm=1 tr=0 ts=69120ecc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VnAOb1fkWFh9DQKIKVgA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: AzhZzNtw4W6pdIKm-9P5lNQVRffz5GVu
X-Proofpoint-ORIG-GUID: AzhZzNtw4W6pdIKm-9P5lNQVRffz5GVu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100137

On Mon, Nov 10, 2025 at 04:37:48PM +0100, David Heidelberg via B4 Relay wrote:
> From: Dylan Van Assche <me@dylanvanassche.be>
> 
> SDM845-based SHIFTPHONES SHIFT6mq has its own calibration files
> for the WCN3990 WiFi/Bluetooth radio with the ath10k driver.
> Add the calibration variant name to the DTS to reflect this to
> allow using the calibration files from linux-firmware.
> 
> [David] Adjust the compatible as ath10k-calibration-variant is deprecated
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

