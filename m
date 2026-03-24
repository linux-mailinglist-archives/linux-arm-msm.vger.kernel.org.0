Return-Path: <linux-arm-msm+bounces-99754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMCSOqcPw2lKnwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:26:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F014B31D517
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 06D35300E488
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0A13B47D6;
	Tue, 24 Mar 2026 22:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V4Pxtpj5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K45uAwWy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80923090D5
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774391191; cv=none; b=DJlapbhynlPhJU2uuHypy70GohZUBrhqjtp1jZ3LBFCwcoaSqllAI68VoM1sm42h4ufUF+/x9xDtwzu2K46a4Ap42wFvkpmgPimjzUgxnBTvOvMQUtpCw1FD6bdNH/kYyNIFId89GkpHQjZOT/HJTj/SmHJRy2HzlAout8VQjEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774391191; c=relaxed/simple;
	bh=72dJxfk3Uzm/Y/ymeeIctx5apTZdXzokW2KXJg3SFzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qufa6x9bNaRuvzCvTuQSPtMNX33RaVEgBRoCkaik5djxE0AHEjtpvKF4zalYOzRfH6Fp2glQarwW+9eLezbL9l7aKoZNBVG4S+uZkx2Y+gSpF5/W4154IZjusKx+3A+OxG9D0Y5T5QWTuNxz+gafgD7rLtIy3Wl4PvMozkc0KdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V4Pxtpj5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K45uAwWy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJD0Sf2340518
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D1KwBMD5pBl3gSLcJ8Ks252R
	u3i2i4xJaHHe0CS6qgU=; b=V4Pxtpj5MyRXBUGXV3dfKu2LzQlNj6u+j9YxAOQi
	vA5wmQ4OZ6PETXxpa6NBEA33nJEC3Ve8iVvRQYBHgPyE12eg0sOkPOPNvYLhoHO2
	yrZXwVzDH5/SxFgPASAy/Z7WeqTHh6OnTRhschPpdJKTXVQoeKNkHejE9SDhFdTx
	FGeyL5EWUhBN1FZzVJ8H8iR2KzWCIxfj634k9TeFhYmbP4KMTb98Zmjj7fEwEhlb
	deCPNWKolqVfXDi2y8G2b/RE0hIqyKoawCT17KhcYdcj+XzGq1TuTLx5NbvSImgl
	78ERhoeiG0XTg+asdnDkE3rO8R5eAucpGPUWx5ZnDezVZw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3sw42esy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:26:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509044f54aaso101425341cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774391189; x=1774995989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D1KwBMD5pBl3gSLcJ8Ks252Ru3i2i4xJaHHe0CS6qgU=;
        b=K45uAwWy1C0VvbMaK0j6Oo2trhDiV2BaCFRGUWr2+YtHKX7JIpadtuBCcNGymrtPjl
         WniBNuv5U0KJLgZCSbjPbE4a+giNeH+LqtPktBHPqH0mzWdz/NUxjZmWMmsBOltCa611
         Ye0khiNUBC1VCNgLjEJXy0uDc8e2gT97jPkwG7n+XUypyI5HyAsxwKgDFs8lW74tsTpJ
         R9t3HSjdIEiNgZp2/diLQObCMlD/tMiWwR0r+UhovF/IgXFQMuo0ro3ORa2K+izauwYY
         eCwwpc6k0oVayZOpa7KmWVXv4rS4NGkIfIG9kEce8ivaYlW6mEQvK7E+rVNi3Ht6Ng1i
         rWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774391189; x=1774995989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1KwBMD5pBl3gSLcJ8Ks252Ru3i2i4xJaHHe0CS6qgU=;
        b=N/1NV17P2vSH8xcWn5+Q2PVP589/Feg1zSLATqLoipdLXvUmLU2TVaaZXu618L/0Lo
         ma+Oc5UeHEYsOyRD32bDYGke0IDkM7gEblX5LmkGN5iBamlp/VHWWJU5RIdoyI0+jHub
         Ij8DmOYJKsL7F/kC3N3/+2N/boM3NWPNnx2OxcC16nv3sCVMk6uTJxl0sv1JlW0AFDl5
         F2JOhz6kxK+If0bVghpFh+udiKy0glIe3OrZqI7s1fXN5zY4k0CecU7iUCobEy2U+YxQ
         qzew2btsdFw/Gc+VCM7BZoKcSsjc+EZkr3dAcguBHH3Oy6hB/3LQ3xuFhWSsFbXrzR+e
         ayYA==
X-Forwarded-Encrypted: i=1; AJvYcCVf3YqVyuiYfqGvrjYmegULfxU7pPC7q4dSDfo5T2Lpj37KEaBF7qz3UJfW/w0lsn9PB8BwldGdnLwfg9d3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx4LHNNm+DQrIxxPreI3RC2rSpWIflxC8kbvuUNYiVVsI0f3XH
	tNdv5mYtVPnnbg/ZG9L5hF46AwU5vSIBi/ECnmguWhpSdbIXGK/ULBRoppLL5xu4EAoqzDZh8k1
	/9+yJPz7Cd04cxwFy/NRu5Y67TSIJh9LntjCu2V76P9vSpr2gN6LGVzzzBP3P46b7GaBk
X-Gm-Gg: ATEYQzwJpY8RPZUNMQ6yG5VFYVvvw95epjuelF8Yb/861VWim4VEY0/gnqU1915sEnU
	WOlZ3aGuP+FM9zTK8/HwpUVCwS41+WWLfPXp+JdBVCObeBNV6T+Yi25NPKltaKzeZyeeF0R0Tjk
	XLqBRzzd/Q+7o0lO4sTM85WlQcr79NZlWaUlPVtk9wlG1r81k2aptSEmpL4ldv9nnWcx8qi6TkO
	eeO0nsbtWrZW4VUwNUViciwPg2cN0kiUzGUh7d3Xm8I2UEJNTn5EnQvEXXCxcLrTL4eOdIMhKE3
	pu1HDi4xZ8+4F+zrglmZp0RxgcjlGmLdCUyBjIaaQQw1ZOt2iTou+WQv/LsFRq0+HV4J2/QIwvE
	K0edY0B6xJ0OHJuf/QBlf0cHAk/nwJuIl8skbMGmLbZW/pE/27FkgWHqcIp2sFEuLLS0DZKhQ1k
	QrpsmWg/CBrEDEamZxIUivNQ08d1TYS63QXzU=
X-Received: by 2002:ac8:5f95:0:b0:509:2ef7:7048 with SMTP id d75a77b69052e-50b80f0a38fmr20286041cf.66.1774391189120;
        Tue, 24 Mar 2026 15:26:29 -0700 (PDT)
X-Received: by 2002:ac8:5f95:0:b0:509:2ef7:7048 with SMTP id d75a77b69052e-50b80f0a38fmr20285631cf.66.1774391188688;
        Tue, 24 Mar 2026 15:26:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851a08dbsm3395670e87.24.2026.03.24.15.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:26:27 -0700 (PDT)
Date: Wed, 25 Mar 2026 00:26:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v6 14/15] arm64: dts: qcom: sdm845-lg-{judyln, judyp}:
 reference memory region in fb
Message-ID: <gikqqyhb5amajegkzqdsvxrpo2pjxji5d4cjbzukcwfhegnoez@lf5jucxtodcs>
References: <20260323-judyln-dts-v6-0-d89f07897283@postmarketos.org>
 <20260323-judyln-dts-v6-14-d89f07897283@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-judyln-dts-v6-14-d89f07897283@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3MyBTYWx0ZWRfX/eLAeuxLQIQB
 NlmonzXiDteewhDi6PlYRqwja3kjdoa2dBmWLAEnTdk+Zn93zBCHCVBlGH17UVFPzJ6psz7Kx9s
 qO9aJHCIpazl/qgOELq/hEN/3ArER94JGQQsMJtLmFnXTtG3vw9HKlVvQIyG7OeaS0Mh/Q/ewA6
 2No/Zaa+GGUKp8UG93W1nTqQxZCwovcG1HHRKkeug5K9zSLUv3/xGGkXNtP8KPgKJQijCMe6R67
 HqN+IL3Lualy9URzdO2+L/QJkeKA22AteAvdJg0HlLaDFKdcKcTu5Go3zhx29H5v0FfYIZa1Xju
 zSAJOcItuHeP0q7ubMfjZTAHvGVvNNVBaNCDS0UJNtGspQg2ZDi0oeE2UozK9fs3ZU1JUSvz4Fv
 J+wxH8870nNQ1PMOzawsMNSaB25KOYskGb2xgac7ye6IcN3HR++pCmqEbnGQXCTZ+OaFRG9Ib9k
 QGNp6hyuYFLBk9ouygQ==
X-Proofpoint-GUID: CYCEdst0t-SNgzb7sQ68sq8hFEuSBbLQ
X-Authority-Analysis: v=2.4 cv=bpVBxUai c=1 sm=1 tr=0 ts=69c30f95 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=Gbw9aFdXAAAA:8
 a=qTE7wAw9Fi2BWtdfG-AA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: CYCEdst0t-SNgzb7sQ68sq8hFEuSBbLQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240173
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	TAGGED_FROM(0.00)[bounces-99754-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[5.230.158.192:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F014B31D517
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 07:42:14PM -0700, Paul Sajna wrote:
> This cleans up the node a bit and prevents duplicating the region specs
> in the reg field

To prevent duplicating the framebuffer adress and size point out the
existing framebuffer memory region instead of specifying the address
manually.

> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 3 +--
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts   | 2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 51fc1735ff49..f42800dd25be 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -98,8 +98,7 @@ spss_mem: memory@99000000 {
>  			no-map;
>  		};
>  
> -		/* Framebuffer region */
> -		memory@9d400000 {
> +		framebuffer_mem: memory@9d400000 {
>  			reg = <0x0 0x9d400000 0x0 0x2400000>;
>  			no-map;
>  		};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index adf41aa0146a..83e392907244 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -16,7 +16,7 @@ / {
>  	chosen {
>  		framebuffer@9d400000 {
>  			compatible = "simple-framebuffer";
> -			reg = <0x0 0x9d400000 0x0 (1440 * 3120 * 4)>;
> +			memory-region = <&framebuffer_mem>;
>  			width = <1440>;
>  			height = <3120>;
>  			stride = <(1440 * 4)>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
> index ffe1da2227f0..ae6cbd132949 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
> @@ -16,7 +16,7 @@ / {
>  	chosen {
>  		framebuffer@9d400000 {
>  			compatible = "simple-framebuffer";
> -			reg = <0x0 0x9d400000 0x0 (1440 * 2880 * 4)>;
> +			memory-region = <&framebuffer_mem>;
>  			width = <1440>;
>  			height = <2880>;
>  			stride = <(1440 * 4)>;
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

