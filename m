Return-Path: <linux-arm-msm+bounces-107929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J20OLkkB2oEsQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:50:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2CA550C41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8777300C814
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F93547279B;
	Fri, 15 May 2026 13:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ejnM0Lhu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdHObDIQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493E444D686
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852494; cv=none; b=AsrBJ6W9nwbvPlye5o86XKT5RfaCutRn3ry4ATuA/zX8Az7WwLk/0u5uGXzk3PARbZz7xPtSl1qOuyLiTfqH1cfcQwwXmXP2gNwSCnPeleiV6bY1uvkjXNQxjFLEb9fjI83LMl++fV6mVog3KhIgInIoPTGpbIbCQoC/JFqMBqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852494; c=relaxed/simple;
	bh=Xca3zTfFC+/L0b3Qs4KF3SoSlqcF3G78HMCT0x7AErQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6MEZpk6OMxYwb37D66Q7jr4C9VmqOtbEHEdvmIqDEkvBc2PgkuHmUfgGw2i918+ghEyBMPJDnXf0GvCN6EQpWKuXx9hit5r9qMJGDKva4Wm0RWrXYylv/GmIrGgxrCaNQDPSGvHrPmyalfq3nckVZrAFPv6304A7esFUKsuh0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ejnM0Lhu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdHObDIQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB3p4A2676218
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/lAJ3Gn4qJTi3DJUhsJ8KW4K
	gVduivDK93SE3yus+hQ=; b=ejnM0LhuJYAQ3IsN0AF3w6hpOBOEzEKs0brM1LTU
	R1vepMqPr/2v6CIynKZ4CL5TSMjaEq6PnSS/U6lVOBEDFTODU4ybkL8w6Q/VAoeY
	jH9wnhLAcnubOi4pMApLibJ/cPPrXiMYumYJ8mN7/cFWVprSc8LRLWo+aZdeoQA5
	g1tuUBlq6oJj8kzzrIKYEVQDDAo2720zFVgnWPdYcw46T0UMOLYoI75WGfeLveOB
	36jUTtUBt95c8SuwqKqwTuHusgjoiXCcE0nK1WjRpajt4qZknK1oiYb4r+DpEMSH
	mvpzLrEYp7jRJKfYj3BUY20wbks6Mg+vyEXBN5kr4ZQApA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vufef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:41:32 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6314220f28eso12705145137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 06:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778852491; x=1779457291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/lAJ3Gn4qJTi3DJUhsJ8KW4KgVduivDK93SE3yus+hQ=;
        b=BdHObDIQKZ3eqAu38FmWCQW6lzxzVYPG5yU1C7q1voZgUDUoWhiQ61ZY6FvfuMvjL/
         p52cLP0QvmtJRmpt7zuyWn8MgNq9/hboWgAhRziaN3m4miWNYNwlLpS8PzQlp/n/+AwF
         DjfEP281fYqilXBXZ0Vxo/XDVW++yGuVmMPj4hnW217GuCwkN91w8nkgBsu8ZN+rBo3a
         hFDDnqBrUA5UqYB2PKJihQB3xghEcW3bMNCvjRH4pJJPuvajQyDS8ZcIuWFpPlp1tBb7
         qcIN3bYlrebZMf+2ZBG9rpc5Yeeu8CSp8SoaN5ZSPEXsSC+0juiSap7H8yEp2sdEc2fW
         kxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778852491; x=1779457291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lAJ3Gn4qJTi3DJUhsJ8KW4KgVduivDK93SE3yus+hQ=;
        b=qXFR/uOuTsY49w0uM3cNtBWCilMROBmFjnQxfA/760ubwP3LHixPF+RqRbxerTheAL
         7t2+fVapsZFR1/Cl98V1HmZ+I31OLsg+a0ybBYU6oY5ZR33RZQBV9VE7tI6rMIE1Z8jM
         2wb/BFQsw7aofDVV5Ha0gQYvT08ETW9GE30Z/d4Vp3lOgay+UgPF4Swy7o/i6DHCr05A
         g9kNZ3Np9NPW7KA8orCVsheM2sgnj4OI9YH1bKpcsSHY2JmPdBL97elAjZIbCh+9e1ob
         S1GknCUzYoWnFvWdBbEPHnd+JO5t28LNrwInrj40yRjTr+kufppxlnqadi3CneaAAQQv
         C9iA==
X-Forwarded-Encrypted: i=1; AFNElJ/U0xbD0uZgvKepGneW8p8mIHmfrXHTpngFGwTWk5cJNCQFqsPSUsjeAqFVUUkbjbNMEmPReojZu8iThq8n@vger.kernel.org
X-Gm-Message-State: AOJu0YybrNXfycF0vcWtVW4pIQhyM+lXDkCAjTR8woY/1sxqzXD/OzBP
	lQSx4INwHyti1dyM4CupeExLkOgM/zxVfWfLxQ/pItu/MMsb+fzMhsfUj/hUb5FbBXJIqOEwMcn
	PIGgOtHySkUmecRyvVtVEGdfUnl/EC8Yy8ce9BDTCl9TDZPLD6uHEkf2XqbLNIOvK+TKRdrr4Pc
	zu
X-Gm-Gg: Acq92OG91lxsn+ILd3i4JI2k8DIaG2l3E8Dg0lpzX4dMdwvA3zpMLzNeKHst7jzmcKC
	dy4b4nYaG8vLVJxb1iBdVbkdhh9/IyIrtMKcILwBtQfzgNuhCSAbDpPGJz/gnCH/tJJfloeyo6P
	JRkb4Ff3ucgruMOtOcpEjhLt9eUzP8J+dgy9FomRLf67qruKgs8oVNOolwBd/mrEFaehosmMBdH
	aDH9JTZF9zQxEuvvPSGIxIBgLim+HBAtsA6wKT1MJBj04EkrbRySvPBLig4jm+mCeVAJxFUQgFd
	i7/wQS1NWKnm1iWaOyiWCqG+DK4efdk5a/A9Xrw9Y+qEEjTSQgZwf9oQqGgbq26JHARHZw8P3xH
	jlJ197m+kbcd76f2JSK9et9ucvSmPe/SGS1BwGDTlhgqKWjpobzQP3/ohpVb3qaXoVYUZV108+g
	S09zaSG/2BpV7tTF7bmB0Rxewe1K34Z+/+5fo=
X-Received: by 2002:a05:6102:201a:b0:643:80f1:350a with SMTP id ada2fe7eead31-643812e4b8fmr478039137.2.1778852491166;
        Fri, 15 May 2026 06:41:31 -0700 (PDT)
X-Received: by 2002:a05:6102:201a:b0:643:80f1:350a with SMTP id ada2fe7eead31-643812e4b8fmr478019137.2.1778852490735;
        Fri, 15 May 2026 06:41:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c8b2sm1334777e87.17.2026.05.15.06.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:41:29 -0700 (PDT)
Date: Fri, 15 May 2026 16:41:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: eliza: Add QUPv3, GPI DMA,
 SDHCI and LLCC nodes
Message-ID: <nns2xhjxhhmcxjgkqhizirae2u6ugwomux6zappebnoam5ocbo@dwaqqmjhjpab>
References: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-0-5ad3da81b9d3@oss.qualcomm.com>
 <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-2-5ad3da81b9d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-2-5ad3da81b9d3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a07228c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=3AismlQB8zWP_hVqSwIA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzOSBTYWx0ZWRfXxOtUFRweqxiW
 2bjM/YqRJFhWeuodqY+vfIFLH96x9QVt0NhMqhHTcI4yLezyIHeElvIbYRcnT9eWfwmEUXmmLDY
 mmupLu+nQMtUxMLyg5/DCryh1JtJo1SiXTc+jRco8TfDOsBkOj1hN7cawDzGv1NY1vdDneIHWb9
 olbLDGTQrCWsX5NRpsIk/BZSbHy/mQ6j2GWrcUyGwN+8hXggrNKY1DaqfV+/jMrJI0J9qboOr0V
 exi8Zud7MKoywbPNF8sdDgecTnEufCdCoVefhOBZDLVjCow9c6H0Nr3g53kQGGxGiuBn/7d6WpI
 uGYxc2D5keILcPYS+f29wN66ih3pxpAW+tjGlmUJnp4W/o8m1ogIsApT2qJtrfTtYtJWgAzg9mK
 f7IvSts8yd96zK+v/lxcsr4OqgC3qba4EpMbAarE2xVrYyExNNmqMAmbcVGkx1EpPf7m4U+xl2B
 0+u69BPi3Z6xk1t2KmA==
X-Proofpoint-ORIG-GUID: hDCS64xWdHtx1vQD8v1H8OquxZeLByFj
X-Proofpoint-GUID: hDCS64xWdHtx1vQD8v1H8OquxZeLByFj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150139
X-Rspamd-Queue-Id: 8F2CA550C41
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107929-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 04:22:39PM +0300, Abel Vesa wrote:
> Describe the missing Eliza SoC nodes for the QUPv3 WRAP1 and WRAP2 serial
> engines, add the matching GPI DMA controllers, the SDHCI controllers and
> the LLCC system cache controller.
> 
> Also add the TLMM pinctrl states for the QUPv3 serial engines and the
> SD card/eMMC interfaces, plus OPP tables for the SDHCI controllers.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 1527 +++++++++++++++++++++++++++++++++++
>  1 file changed, 1527 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

