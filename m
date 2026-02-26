Return-Path: <linux-arm-msm+bounces-94210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MDVAp+9n2lOdgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:27:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 785091A0881
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AC0C3017BFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448E838758F;
	Thu, 26 Feb 2026 03:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ArhA+Ydu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QP8iRQH1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F1638757C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772076442; cv=none; b=INv1C58IDlBHgVjfCNHEbzreFUZtZHA0rqZm7heM7oG00bDE7+6nLGIg/gnum5+XjX/2LRQxubYZnND/79os82of46Pw/XQRyiW0iqnIBS4fhh4CGtkU5biRonVlwAvZ9T65YqgpMDroZsQdvS15YEChnohFIwUwpqQsEjZDGok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772076442; c=relaxed/simple;
	bh=7DwtVrB8tXXE4YHCekfqno27ymWeE7BSr7uv4mmPtQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyMPx1ZjexUJwPaU8G0aJNM9+o+DRPwrahQPiHhTVTSaWdMW8IMldVi1iWJnN11AN37mKRdQejeQXQyvrFfAd7vv4kLlCSU5b8IhIpKpAZaOyfN/X3Bbgp8A1mV7/YojrYi+05N40N3XGvbK7YwuMzB0n3e+nd8YxytGz7GjzBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ArhA+Ydu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QP8iRQH1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PH3pB31196101
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W7KGFT5i87PCOlERvfvGYanO
	5SD/jEf0Fx9uA50jjtI=; b=ArhA+YduBGJj0AJcz/kA5CZIL+FKwF9CQVen2lkW
	Z0H2qDqmaWN2Y5Edv8U9LT/PdP7K+5HCMR9yPvHrRGJ9reR6oqF3Yg1Pjx+aBivI
	EuJn1+xhGQGOP5eHIe+lOqfGUhv7qI6EfysLbXNIRw/xOp6+gzI6jkr6bNRIByEV
	6RNO4ToTZtvjAcbhUZ6wgFkKpfvRzGO90x8fjhdgWU54KhaqDip2w+xgU8OBG5CH
	J2aKHRZDRvSlVq1d+dQM0lx5dn2AoE/k6AnsDrbdxdz59vGjrYxy6Qmf4cvFF8zY
	Q/kEpRWGuNB2ouRYejvEFjJDPVdrnHIORdjt5okEsNt/TA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj559hjr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:27:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3ff05c73so289247085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772076439; x=1772681239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W7KGFT5i87PCOlERvfvGYanO5SD/jEf0Fx9uA50jjtI=;
        b=QP8iRQH1dxZqxjDtgI+YQL0M9tCNjN7I7Xwi/BWFB1nQ8Ge3hmu82qRCVrkN2jxbe2
         uiQOEgc4gSNa/MC+TMBRFF/n13BTcSyifadbuX5WUkzcqrSn2FvGXN/qNQE+QgcoVsKg
         7Jh48PwYAzOKXHGzyJTDg9g56rk+DN4N/aklztnqv7TAf66KuejOMMRx4h+bnmVoEUpU
         DlU6NhZzaFLOB8BVKGQqqqZwJD9logoXH1LBnAyhgImLJlAEgJXWqohxiSPz60yYSU7O
         fMQELWQgZ0LRRhcIN3zXNWDh70YydVHlzIhxBd5lb0+Zm29XmIvProq51J8sGUKnCQBI
         5tKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772076439; x=1772681239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7KGFT5i87PCOlERvfvGYanO5SD/jEf0Fx9uA50jjtI=;
        b=Lz7SMAR1jdGL19IWeJIenAgv1dIFSkdtewpUtb3mLd4NtmBDISGFZRYJenyJ23672F
         hDbsiV+igary88hPSd3/xXiOtfVTdWfnnX7TrvaHWW0g8NzDT6Dy1O8NWrIOncpYGA2J
         sg5tYMGpUUAPeIKmhG0scr6fAN3dldBCkrK1fI/aJHmqPoF1iFu0lnhmCUkv4dmXKtMo
         yQGTWeYyrlBkgOBifa32UMDl+X3r2Jquypeck37AJgHaQmKAm+8+PJ5LYd7s4TIbefu6
         EwppFVvFqiNsYBi7bR4bbLn1CakXW0DRG4AUY18L5qTeJIh0VcWWfUIlD9587uyQWtIr
         38NA==
X-Forwarded-Encrypted: i=1; AJvYcCWTCRTiFihxUgAFEEinpWS5qrDeVYjArjbV/DvkWxV+5N4+jbLAt+02ADsel2EfdSZmELqohSZiTF38XxIH@vger.kernel.org
X-Gm-Message-State: AOJu0YxuIJWVjlCt5lPlmDmS+W0EGehuoA9u1AgNWMrZbBQ7NUJ5hCE1
	xMTfDlstolOrM/BfT/Cha88sl0QOHZyWYWU/OYW4Q2E3HWoSoPqTg5Tb5p0UCleikILo/Wruz14
	U4tqI+E8niYLoTvEcfMpZMqyHqdnJTMu2nwCQEubqjsetiOUEOmYJeezsR1PWh78Vl882WBcgeF
	tZ
X-Gm-Gg: ATEYQzzmQG81NCFKu3epEinD17XmDGkC0IqDumdP9+L18Xa19n2uAV+QhXNpRUK5ZkJ
	ijNySdtVjYG3Qe7B2ML53ua9kAuWHcVLczg+4Tide349jNaXl4+DMSA9yX1JORHkdzJjpp14MLv
	ZbuyVcJ+13rY5AlfpKgzQdz2tKsgp2EL648+sxaEobzpm9UxdSlvYmEdNCOYgCdyyJpj+XH2MD/
	nej9OR9ie4CHzc1Ge5Ms9yyDtEtCfk4qbR6Dg52iPeXzI0afVsQrjnt3u0lDp2VZGkymg3FLffZ
	jELD122M+TD/JTeQ7+o6qIpBPMZQ+2BNlb9Pwcq0N51pyaCFfRgeaIhHe8j3oa0n/84ogXj0cnw
	dWcNsp7jOZHOBedluFIl1O6dfYZ9N+GWJ0sxaJ3MQZsYLx13f2MEJxY91t2FUr7VfOzZJIRmMWX
	wDyaPmMb/KdHfHwJP94Z6f6sGdFrwUxW3z9Fk=
X-Received: by 2002:a05:620a:40c6:b0:8cb:baea:89cb with SMTP id af79cd13be357-8cbc1141410mr65005785a.31.1772076439141;
        Wed, 25 Feb 2026 19:27:19 -0800 (PST)
X-Received: by 2002:a05:620a:40c6:b0:8cb:baea:89cb with SMTP id af79cd13be357-8cbc1141410mr65004485a.31.1772076438732;
        Wed, 25 Feb 2026 19:27:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a109df8498sm261553e87.62.2026.02.25.19.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 19:27:18 -0800 (PST)
Date: Thu, 26 Feb 2026 05:27:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v6 10/10] arm64: defconfig: Enable Kaanapali clock
 controllers
Message-ID: <xzdhzgthx6vamn2asacitlhlznu73cx3ijcmuqc6hhpvwq6adj@bx6tpyfudvys>
References: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
 <20260224-knp-dts-misc-v6-10-79d20dab8a60@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-knp-dts-misc-v6-10-79d20dab8a60@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: hwgc0AOEYJpVpEO9mzIG9GYrMv4rpHk_
X-Proofpoint-GUID: hwgc0AOEYJpVpEO9mzIG9GYrMv4rpHk_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAyOCBTYWx0ZWRfX4ulq4O7mneJR
 vWo9O/DP1Ch5yIKQPBM6xaZz474bSnGC6+FcJUg3UOm/Ytdtk3tWJAI/OLJyYvUBaIdvImYFoSs
 4XwAIp6bZ4IHGusRFNDn8EFjUUFmG6rONiZm1R98RYih1iBn+PgjlJfAj/XIlNaYuLI3Ja+nA7e
 MhIRNZPkmwbTFHGxNViR14cBwHECMevzpnywv6KAgCNxX8rXc5QAESt3bJisza+9XVgqtGX+HNx
 Bsw48y4xROIn/JVfXpCyX9Hn5G8i6KQdQT06rdF/rKItjQ9m3bOSwMtOPuU48r4GmQ6Z+dK3i2L
 SAnyHy2u+v9N7NJLTL01KgFYpyqus/nYB1kg54DRVOsqe/HWtjXKPhaJkyYcNy0AL8jFiy7Hq3a
 XDLHPoiz2LlHCk0Re9N4/u59jEhMjbZA2heqjXxdCDcBJoRTfnYcWE1vgYZs9OO4BqBq6Z0L797
 JNGC2bdCOZ2mEwGMHZg==
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=699fbd98 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=hHfo9KWc5dFt2d3eTEEA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260028
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94210-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 785091A0881
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 11:19:25PM -0800, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Enable the Kaanapali display, video, camera and gpu clock controller
> for their respective functionalities on the Qualcomm Kaanapali QRD and
> MTP boards.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

