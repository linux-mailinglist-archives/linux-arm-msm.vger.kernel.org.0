Return-Path: <linux-arm-msm+bounces-99740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMG2DhAAw2nRngQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:20:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 931E731CC0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A366D30107D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFDD35AC3D;
	Tue, 24 Mar 2026 21:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGBmDx2x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkOWX0ZP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C81248F6F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774387102; cv=none; b=sE4b6LogYzN6wj42Zo44p8g+EZgxB0puv52W/CBLBSZNqKvREghulsZel+GDHzTNxq8UVYm4LRi3O3Yit6Nf7l7Zuh9LmxNeRPNeBcDP2tjHcCvV4IaygGiIngnnNo+0L0cLct0ZjVlke62rMGcLGSWcufV0dO8WwTcT+60vMkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774387102; c=relaxed/simple;
	bh=FbBiC5kYbtWw3HIEa9U4D9+672ahcUyieVw1uGVwS+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQ1DvFqCvjEzkFf9gZKh5Car4FTdptbNaFJNh9VZBkxz4p7AHf+IzA2TAMN8I31OWQT+lkVpkx3kUUJln1pB+zzAtJLlmsUFnSuD0aNKYo16xBsutxuNLXqECFg1N/6JL77BKUAj6V0J7iyCzTtSzp0LHVig4dKN/Qp0TuxuZt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGBmDx2x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkOWX0ZP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCxZx2340446
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YrCV1DuC+DUKUpaudcfeawnP
	IR42YDvtoWCg9bXP6oQ=; b=dGBmDx2xb1nKpC6XWlY6gN6UaOSRCVOcD4w9Evwv
	f77sy4TLvoSfUZDiHPqvHUITxBZXOhMUrMsc69a6cZS5NRoaC9KSgv5Mmbt7nCM3
	WC3+sSv7qZN6TSHxTtXkI5WfjmXwdAje5Mpay3NSKsl1bNDhw44hVHpCDhfybvV3
	UHxf2rUXGqIzzsBT1NW1DIsCxnyuDNfenf05yWZD/X3po0gFakVp2Zr1tcKHbGNf
	j9EJ0Xn+D5lMR0G4uJ19L0+1vgQMtIdka1a3COk1ex7wYDApMG9AzNdOgxMQsy53
	TQMjc64TBvLleX/0U86Hj/yZuhh75AwMzKkKtcYjAiwoEQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3sw4298p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:18:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091782ab06so270991501cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 14:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774387100; x=1774991900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YrCV1DuC+DUKUpaudcfeawnPIR42YDvtoWCg9bXP6oQ=;
        b=NkOWX0ZPkqgsR0dyd8aDFvdwPgL9ix5h8V1XeZhd+4p9izAUX2mrmYM68fz4QxiPhD
         EsKrb4zTk5Os56yape5jvhgnth1FhqYdhu67c4Jn+fZHxLsGdGnZev97G60cFE0nzLsJ
         NcdZQ8jSgDgk8IaPs6AnN6ypKDtFV6YBhXZ+UDoeXhDuFPpZ7So/yhnvEEEPHNL/6mjC
         gVrtyW9T3x+VSItg9+OSEtDvMW2PGDe9WFq607A+OoRzSV78tQPw52WDdvJw8buKooa5
         IVbw69Rnjyw9S7OAWZtHjSM6yRwgXt+a5vxHmfDwBAZ930867yD0Ala1mtudb//cCHDk
         OnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774387100; x=1774991900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrCV1DuC+DUKUpaudcfeawnPIR42YDvtoWCg9bXP6oQ=;
        b=n1y2DhhtR2y74zILEw+INBve3VCzfKy1h+1rfUSwVS/ZpnlPRQKBESKyqcsg2beURa
         JJiLXT6nKsUS1wVR80QyFbznqbjZEarn54jHw42drfRCDE7hT0+9ymtQVnpdzXblpTOU
         YCYod/iN7geVbfdH1VbQl/vBSu7eZXlnoTNy2tJtd6L9/Nr3uxXpGgV1JgvyjcKXlQ1w
         XEc5dTCT3UHZKwOey+wPutGJgtj8oJxIrzwwBknjcwXK+MsrUw4j2eRqTMUdH8TWJWXK
         lfMrS+6k9TVOf8GgP2Lqrg9y/9KzFXiJgYT7qx7sJH0X0/MKyfdMBB2YPM/iDilid0lr
         2E1w==
X-Forwarded-Encrypted: i=1; AJvYcCUwd5xET2EhztkBAWNOnOiO/Rve8sIIl5fNDjLCSzAXn9kjnwU+59/ML3k6Hlsyp1NiCoNY8YwDOQxZ3XnH@vger.kernel.org
X-Gm-Message-State: AOJu0YyjlYy5KQWnV7KrcDevltAEMcT9A6ChNecMMS7VpTZrNYfm9cFu
	TebLEUYBXPpdUX4kQa+VobrzUCQI3K35wvWQlazWtxleauzJ+A7C2C00i+YFPr47lOBxWL/nbPq
	+d0TUp3bOP6dseSeLNcLbHridNIA+DhrwnJMSoAfzBnORD6nyFkrC0M31t9TjggQTvKRa
X-Gm-Gg: ATEYQzxMGuFqi5XFXDaSbGtu5/ISjTY9IPO0XrHH0MA26jFzajX9UGcIsC+aPRfKk+X
	A74DqoOUNtqP12L70tuJdFxhL0iESDOPOZkH8ONJmMiIhLQMoB/BFbI+DNCLho11+u7M68bSgme
	P/i0Ch6DK9SDXGL5sT3gDKXnOcXFNw0Vto+qMd/E4RvB7vXeEQqz9dQt76tWIhWu1gsG3hQ3r3E
	y9LPusF+vONZ1aw54k0QYWjfDnzq1NW9GGBJ187sXQlaYHy3rszoHf0XVJc5l21ADrNCTs+hA25
	bQ4dDiYHGSyC/xgAljUM/cNb3WLxs1D3DnNhUvdPeiamPs3r/qzlGxmtj26jr9hXqoimYIalBkJ
	8Txc30rhWGe3jKs/42+0+coCXMVjjCD4cJT9/0fCxQNEKBrx+moEnDk4qER/IljL8u3GnIeyEco
	oPJKxPSdgkeLsvfoxvgS96vEvBpxhxrdn5Tvs=
X-Received: by 2002:a05:622a:1c0f:b0:50b:50e4:f31e with SMTP id d75a77b69052e-50b80eaa071mr19162341cf.69.1774387099774;
        Tue, 24 Mar 2026 14:18:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0f:b0:50b:50e4:f31e with SMTP id d75a77b69052e-50b80eaa071mr19161861cf.69.1774387099301;
        Tue, 24 Mar 2026 14:18:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28519f2afsm3387355e87.18.2026.03.24.14.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:18:17 -0700 (PDT)
Date: Tue, 24 Mar 2026 23:18:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] phy: qcom: qmp-pcie: Add multiple power-domains
 support
Message-ID: <cqdeth56egg4xbcrfjmtea2jhrvjvwsebtemsqvcr4fkokuxte@a3agz6bcxneq>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
 <20260323-glymur_gen5x8_phy_0323-v2-2-ce0fc07f0e52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-glymur_gen5x8_phy_0323-v2-2-ce0fc07f0e52@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2NCBTYWx0ZWRfX4/FWtFH8m7cq
 YjWcQ0HAyt3lhbnujBMb267FMHfb3wmAmu5CoJsK4uE2mxZGI0ZQ+zU4xGHpGh6zjCemCpLwDbg
 ucFidQCTY54eqBGDxwV5xQe0b8NJDnQO8OVIQeILq9LdFBKMxRT4rAuxPVITejMHbbweclopA2k
 HYWITHIKgWvCBJ9yuqrlPTUXR7KuVWI4QncphY0LSMDQP5pB1fa0EIcKKh4Qvko/BhmiHHXttJ6
 1CZ2VAVqcoc7vrRxsj2DwAey7U2p7sN1Z0tgpgstTJGSF5pUW3BVMOS90GFAHLw8UUTGwSqjBA7
 e7QV2SFdpYz2M3oxCjueXoEaKc+060smmAAFzB4JrfuU1W2SP7o9Xl6zPvvmOYCpeTt6sdw/j7o
 3M3q1hwfDOdMwU2RvuVoKPS7+pWkwWIfOEDweQ2vQWx1cdol30nOwA4zfIrgLuINVtGDCT96cnA
 uVYCUeSOHlaFy3K59Ew==
X-Proofpoint-GUID: wGN0K7riBjqX_-l5G0USkKrRyaTIbByS
X-Authority-Analysis: v=2.4 cv=bpVBxUai c=1 sm=1 tr=0 ts=69c2ff9c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=wdSbvLVn6sL2kMGTBGMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: wGN0K7riBjqX_-l5G0USkKrRyaTIbByS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240164
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99740-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 931E731CC0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 12:15:29AM -0700, Qiang Yu wrote:
> The Glymur SoC's 3rd PCIe instance supports 8-lane mode using two PHYs in
> a bifurcated configuration. Each PHY has its own power domain (phy_gdsc)
> that must be powered on before initialization per hardware requirements.
> 
> Current PHY power management assumes a single power domain per PHY,
> preventing proper setup for this dual-PHY scenario. Add support for
> multiple power domains by using devm_pm_domain_attach_list() to attach
> power domains manually, while maintaining compatibility with single
> power domain PHYs.
> 
> Enable runtime PM to allow power domain control when the PCIe driver
> calls phy_power_on/phy_power_off:
> 
> - Single power domain: QMP PHY platform device directly attaches to
>   power domain and controls it during runtime resume/suspend
> - Multiple power domains: devm_pm_domain_attach_list() creates virtual
>   devices as power domain suppliers, linked to the QMP PHY platform
>   device as consumer
> 
> This ensures power domains are properly attached and turned on/off
> for both single and multiple power domain configurations.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

