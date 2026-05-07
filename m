Return-Path: <linux-arm-msm+bounces-106397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJwVJIiW/GneRgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:41:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E65754E96BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FA523045AAB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2933B7779;
	Thu,  7 May 2026 13:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hc3iP69D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9j85HDY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4153F9F5E
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161202; cv=none; b=h5Nh770Y7XEsk6RxM9Tqi11ltO7qV26hixFG/CrmqwiVj2RGM5JqhyhhdKMgd3il833c5tgOQ/9uHRnGsrns0vGa/rnrmIqmwCDDVukXMfuVwknbaX0FJ7Cbt814keVU6Z2V5B5BF/46QSNsZ0g4BOC9BlMpJkX4EM245NEoMtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161202; c=relaxed/simple;
	bh=CPV5umvGU4gVipwcB9GO2qUnVfCFQxcnQokc3/cJiCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvJoH/P5dU4Vc+mJBAE44Xaru5+EitQVPG3wQ/PH4/ywn0ob79sEv3atpjGy33H67aJCHD6+b84dOQmL2beHn3FnurhTYfexeYcOSFNqY+dseoCxpVl/Eiczo7f2IbWmMRqBsiDGfI+XI16YrxU5wlRbsReO4eKXE9tcnpmnnTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hc3iP69D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9j85HDY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6477pU6i1424459
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k7zi0BI+dxwYHFk9GidFN8y/
	SPVtm/1LAmw8uTSSU+A=; b=Hc3iP69D26tiMxATAi9HPUMFDD6Z7HqOiYf2zEHW
	2tr7Yiq7MYD4voD9spB7aB0vVX08NQVwzJ/idjYp/Lg/9WN5i95D1fpzDXLTdhUZ
	BLwNM/iyG5mbel1K2V1z6spMhoOXlFfjClK3HYZEcCK5WheX6kMfyfXt5OUadNnB
	c2WIr5qi9UeviQwbBPRPH23uIbLNyxFNO3uQjOz7QMwTf4WOW7El+LNYbBpLP74d
	fjR3zqiuozqqLgKImrNyGSluCuMyh50xWPe99EBxyYI6ih69eqL0rn9ONtOqIzAP
	4TEt79feozB6Pgjxv4Zl+yrlRku5TS0DDknaVUpYWcVoeQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfs9ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:39:59 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-950bdef305bso1187730241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778161199; x=1778765999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k7zi0BI+dxwYHFk9GidFN8y/SPVtm/1LAmw8uTSSU+A=;
        b=B9j85HDYPxTXiHsR2PybIhtrdJijLTvtVC9F8N3v0A4SVvwL3uTK1ie0LHjmKS8HVm
         2e2EidPYD18XL6L2zJeAxG1CG2AhzlkHDdJQ0tBXshaphk6IrMsiCtQ009EzKcpqVCEt
         V22evvvMSl7mCaiKuzZQvdwCwx7eljFhb0wvhd00ajstyarP7YJxNdXp8Nkl7/aJuLdJ
         QPawko1b8gCQDCT7K7IaV6XmfFQujVW7pBoeWm8n+H1+CV2vaYdod4zUs1uggqKyZ3qu
         GeotkdHk2OD+lpvXj8f8LcPKl07xo/5UkU2tminIkpb1qvWT3T0ZxZ/sxpphKHXmazwv
         DDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778161199; x=1778765999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7zi0BI+dxwYHFk9GidFN8y/SPVtm/1LAmw8uTSSU+A=;
        b=XyIqZT+ql4/fom0tvSnc1idL4xN7GPrS4DWfLOaCyRMe/w8N4hq8o4adZASJgAZCsa
         jtVsj3haYCW4ze26lS3vUWUOBUjxlA4b+Hq3Ri5aIVrzSt+eRc1snzLVusdu7x2t4NUx
         HOiLiRk8IHUgVKxwx6XqJV2RQVTXjoRW3zIfiPc2O5aetoxjarQZyQrAnlIRgwAvrN1t
         2Hb+tcLUXL+yoHpN7SIgev85ecwQLqpLO71Je7L76e1X6pH8/XE28h1V84ZU1k5MwdqS
         tePX9XU/O2uEt0p5/PLj1FO8gaT+0EGEmwRLAaiTdboUH71REMps4CDGEd3OXE9tUCi0
         E8Fg==
X-Forwarded-Encrypted: i=1; AFNElJ/NbkuxtzO1xU/GYs2ZY2EgGhsbxLe5EXw/CZL5FiIykMEmNit51NL0exfIr3ksgBDcn9pu4NJzDKScjtK4@vger.kernel.org
X-Gm-Message-State: AOJu0YwMXGryQ7CKSzUpaTlQF2MrnXp0vxJ0TcIdSG4ef/BRvO1xGQhd
	3X+Yu8EXpcNavw29a9GZHQ0FcxT19ALup5Po3FTihZXoeG9NFQUC95ALuZZ28ysvLlXSYk+JKtc
	XknCklIlxJuOXBII3x7OAXJl0GMlHI/Q3+0ExmmM8GyFiWqMxcqUEUx8MZIYFAcZu6JeW
X-Gm-Gg: AeBDiete3L1rqdVkOUDaXEO3QtwUuCq3BqZzTk+osu64ogLulXVUOb64/g9QdN+tC/J
	WOFW9q/MHUVoaPabQ+vvxZI+ANgjEA4Txx/c7caOxQWiS8K/jimfzfIF0RrMfx+42dgATqLy9JD
	VH6FEEm0y96BSfkg6qcEm3jBnZ9tmDyUS9agcRggdnWRwQY/GMejjDYAjBQinTEXH2E3ezzKWDK
	EuMuSQ6NAKDfzKp3qGT6oy2Lsdzv96+AA8hJkdFxyOukpanhUmkMwXbt6Q4SekoBdqm5dlr1K/O
	uq4pwsognfcKA0ilL0cpt5jCG8hAsBwsI2oQMkt7rdDKPLH2VMteLcWH0c4hC4ljliJDWMh0ktY
	wL9/3yqGOxrGsF66VZH+TvlpH+pcr5uQcVSpGCVY/xknCjzCHT0InRxbbVUcuB/cVa3NnMPLUOJ
	Dai2cDiLAZ+vfUveaRJQ6ednTxmR4VCJKRinbPCBz7uNjMaA==
X-Received: by 2002:a05:6102:cce:b0:62f:3abe:907b with SMTP id ada2fe7eead31-630f8e78839mr4106429137.4.1778161199270;
        Thu, 07 May 2026 06:39:59 -0700 (PDT)
X-Received: by 2002:a05:6102:cce:b0:62f:3abe:907b with SMTP id ada2fe7eead31-630f8e78839mr4106396137.4.1778161198771;
        Thu, 07 May 2026 06:39:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c341848sm5626034e87.65.2026.05.07.06.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:39:57 -0700 (PDT)
Date: Thu, 7 May 2026 16:39:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] mailbox: qcom-apcs-ipc: Add Shikra APCS IPC support
Message-ID: <ybuup437mpu346fqhnmyuqkj6satxte47sxg25mipy6mn2yvdr@xcjlcbwf5gum>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
 <20260430-shikra_mailbox_and_rpm_changes-v1-4-61ad7c57ef27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430-shikra_mailbox_and_rpm_changes-v1-4-61ad7c57ef27@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fc962f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=GA4JE4aC73f7OREyLVIA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzNiBTYWx0ZWRfXx6VZEKafMiqL
 Ld6g1+ESEgnwL6sQi+Z3XG+FEyveTgCaDnwRqlVeKDfV/AIHmcM4RWqoC+3vgqbNigNPXszezFH
 rEHRl0TBcpUbk46uhhvbkh+ZWKorqTmzmxFpigF9CbjPhrC8YMWrlBFUzJluoSTZYmRSyeJRvK6
 d0KDp5GhaeXE+ZL6x0ksT3s5eqtT0d1m+rOMqSH5lcD8T2qgG7uIZiQ6W9RO0iivGeD8zMLAy69
 U/NlrUs2oHMHnqIyQCbF/GdkD0B/d+WuFkvBqnWu0GO/EnC1Z2ucGp0Sr2l6P39Eg/OjdQOEbU/
 MYJj5GT5qWWTGeg+7cJ88BwMSR8ZgeeiJlRAPp95M42qLnpA7R4VZjYOzEombSmz7XA/6LFCWu1
 A1IXQn12g21ldaZ2/Apuodne6OzeMKngsbcLPJM68UIujvXGaVGsI7pn2ydhJHSvMXNBH6ATDN6
 zBSkdDpvRqHkxu/qh6g==
X-Proofpoint-GUID: P0f5VOd2-zJlaF7B-MK0Et688BR4DXsl
X-Proofpoint-ORIG-GUID: P0f5VOd2-zJlaF7B-MK0Et688BR4DXsl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070136
X-Rspamd-Queue-Id: E65754E96BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106397-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, Apr 30, 2026 at 03:14:59PM +0530, Sneh Mankad wrote:
> From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 
> Enable Shikra APCS IPC support by adding the compatible.
> It reuses apps_shared_apcs_data.

This is obvious from the patch itself. Tell us something, which is not
written in the patch. For example, why it uses the same data structure.
Or why we need separate compat string and entry in the driver.

> 
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index d3a8f6b4a03b368821ef9a5b24fee78037104610..25f76965921ba695e3a1bf4df47ce643916a28cb 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -168,6 +168,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>  	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
>  	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
>  	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
> +	{ .compatible = "qcom,shikra-apss-shared", .data = &apps_shared_apcs_data },
>  	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
>  	{}
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

