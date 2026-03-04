Return-Path: <linux-arm-msm+bounces-95474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 87ZiFzfHqGnLxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 00:58:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1D22094AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 00:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA8833049506
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 23:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEE636309F;
	Wed,  4 Mar 2026 23:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ex55ksIk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVoEzLZj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C568C389E06
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 23:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668723; cv=none; b=n1gfTkOe/HN9KrNppC3plZXsjQdGGOvXVOrEvpuaAsSvdwsyXBEFAnkNMuWSDmgxGquV1a4g7KJRzG9WPIv5EAU58ok+ILqxUcHgH0ihSwjgNKnozEVOmmb7mJfHhZThjoCrl7KLXINzkAx6bqraN+MWt3oM+DjKQCuTrllcctE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668723; c=relaxed/simple;
	bh=P4oP2BoT9kPzoFilezeHRuA+xKsFEwEWaFZPuYLOjI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWTEZU3FBpneNAY0UzUy5KYv6pG4idaSVncEpTCLf2HOzxDPU95hPaT+W1rAKrrej90Kw5bUwU8A8eTxr3j/66mGFaTZnDuP5VfszE07XG1uNRNAXVf2RkVBZqlhpH3BzWW2hCc5cgS9ZSNS/VG8SRxOj4TeMaG6b2G4UTJLY4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ex55ksIk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVoEzLZj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624LrU6N029291
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 23:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9eFNoKK53YStLQziS59y7gpu
	WFx4LBYo9LfBMrzSB+8=; b=Ex55ksIk/C6F380U+3HqWaC5SXE8FbYvjC93K8xK
	pyk0tl0II7MLqUyJHwgrsZOgJOL1po7fTH0r82KS7fDIkphRqvAYU7BZ5gIwDnSQ
	bgcRx6OdMhugEs6bZnKwlLZrVG7BBDXbz1ceWOCaLUymJFX81EL0qTd/167YwCgY
	4jVTjm/UwsXNfPfVDgo04FTdh62Scp6bQu4P94d3ILZF91XVMtm2aAsCbEhoEk+r
	XwK0X+60G4RPN5C1iDq0B30EERksSkXG9Hial0/KrdPEz8uJOu8tzM+XthLqhgC5
	L7XFnxPdyaiGzMuv3lD67GQ2UtRVWZ/Mof5NCHoxkz10lw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpp4fhr7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 23:58:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ed6c849so1244496985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 15:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668718; x=1773273518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9eFNoKK53YStLQziS59y7gpuWFx4LBYo9LfBMrzSB+8=;
        b=EVoEzLZjXBJRcscFjO619PJi9o9ekNt6nTLAI7XqisIQ7pfZI1YB/i7pBcCYZP9tYl
         qL2WulWQ9/TNO726GLR16aveTo/cnfmFHu9TmCJBI/XglROU8IHNq7RKmNyriXm7wzF3
         vIyaNAyiZQA5ZVM5Ah0tXvmt+uifSWJVrc1rYC+HH1hlXLk0xuoF1G0Fd2w+EBcj7eq8
         5PZDYQjg2H7K67MZ76h8a7SeW8nhEwTjChXs2d0Ik/PlX7qAs46hAzW/O6CAr51OPuU+
         tv9t9TG1AQp1EKgqiUbx75ljbh9Phw9MGReNVGssmu3SddIDBlE5qWGFI0cqr9JaMVqX
         +wMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668718; x=1773273518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9eFNoKK53YStLQziS59y7gpuWFx4LBYo9LfBMrzSB+8=;
        b=jx9HueApMraSCBnsuVYfCZpiFfwxAM1rVu1cflMubMU9lBqGCOq42axh1GF1dpkvS0
         ht8nawh5kf6QTirva4nsjYdiFl0VIJJEIiOZi7mx/KUcss9+Mwb8BkHMnWAB7p52H1Gz
         Xab+tYbArgiqZ5kar6VX3249SkKb6joB7VvjC/zMbiFi0V33f6qTXE8Lzcy0VkExWZ0c
         GT9tvU+dnUjYiG7WGjDKt8eJCBKwVeVUYrJeuA5KQKNVAnB8iSAFW0YfXlzKpgG9WoF0
         TRHvsjKzn2CZ+0PJhcgh5Zdz9BDLW+uXP1BQv87clirkeo1p/2o7/ee20ZMDvofT2RYU
         NIbg==
X-Forwarded-Encrypted: i=1; AJvYcCUYqq8mDPS/TdKFYpr7uAcvf9tBvtV/baaIuyqQA/PFXgDwnJVOnlk6S1fi/gQka1kmHdtVIGmXgLvZKkx0@vger.kernel.org
X-Gm-Message-State: AOJu0YzwT1WIFx8Va5dhd0IAxKRXnzqSCbJqVOloAMhK+aFsnmjDNvgL
	lVuuiJ5sP6pQXYB8DSgz0y81Y4TWMc0w2ez0570elNns3memae8sH/2DKkTGhvokp5iZwgmvD6O
	jOmojHR5ZahPdK33btyWrdiOEMYhTiGW9Cq59bTl+rLeq/9Il2sBSDwkiGdKhtxEYGPXr
X-Gm-Gg: ATEYQzxkJQ0Z8tXprR0LPjhhRwE240QXfDjUrK7IysWjSWE80NvJqdaSd5xqCv/6i4p
	O2NMWrPfQpwZn7iEQT6q/TCz1DMaVeKl6iJQEkfvmDXyfUG0+U1klphMAdKePjMOWu3Te/wqMDZ
	YrFjlNfz+DYazq49P2dFEuXoHRqIEgavxYH/x5w9giO7WKZZYVyx2gW+SclV+7Nh1QhT0blmyRe
	gUuv63qV0YTc7Eibk9mec0FmqT/p/ZLlT4JCBIcPmnwUiJmbBMNZAhE7Ksz6mfoeCl8ql+euk1m
	cHaah8R6uP63Y2FuTo7ue1lvqjoPhvTwBOGLwgn07ct96w2yide15rnlR4leMzABQrlXo1LmlYZ
	9vtJ9dAE0Ph3rK987zvVdy+kdNS5CD+vwMZCBB21toyHh0nSW6rH2hpsganFj2lwljHgvg30xgY
	WzmLAOsleEmA5V61BMELt+rOlC4fKqMmOxwuA=
X-Received: by 2002:a05:620a:280c:b0:8c6:6e2b:ac1a with SMTP id af79cd13be357-8cd5af0b8d7mr460989185a.28.1772668717858;
        Wed, 04 Mar 2026 15:58:37 -0800 (PST)
X-Received: by 2002:a05:620a:280c:b0:8c6:6e2b:ac1a with SMTP id af79cd13be357-8cd5af0b8d7mr460986785a.28.1772668717384;
        Wed, 04 Mar 2026 15:58:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12f4a5b03sm339308e87.87.2026.03.04.15.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:58:36 -0800 (PST)
Date: Thu, 5 Mar 2026 01:58:34 +0200
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
Subject: Re: [PATCH 2/5] phy: qcom: qmp-pcie: Add multiple power-domains
 support
Message-ID: <duny3mu3vx75m5ik7xkqotdajomkpj5udg7x2gcyj6pho2ybv7@w3q3pru35p45>
References: <20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com>
 <20260304-glymur_gen5x8_phy-v1-2-849e9a72e125@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-glymur_gen5x8_phy-v1-2-849e9a72e125@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 0DO4qnDqgNjIGNY7dUpEt00k2xtu_ljd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5OCBTYWx0ZWRfXzmm2HigF2JQC
 sFTkIGfZ3MAYcbxYD6+lhalYt0aJwe7rfO4lhjJ3ei8h7kKa15j83SRHq0C2Xey3jiBdzZH0qaK
 5T41hNXMzleMuZG6Wyh4S/pjevEkbBnVxDPMhsgMeNMfRwhxz3MCRZbOAVtbRILwaY04lcqBYGy
 EmHl61KSX3ReCCsekblwbAyMc2pHUcEdj/sUSPrh85TNFhoqsSDKRzxcyIhDJH6hprEoB/GJITl
 /D5fQL6aXCdEHQJV+V/EhZKmRbhhY2mejhBMqwSuNhMrUrfXrQHsTYcEWtbs2Y7GiLEiOld19JN
 2hnSuLhGOMvPCzlBW/hN1TVpwlcE8L3qSVOGpSl4dJakf11g9mYJLkrahS/u68vNzdX4pcuR8RZ
 PCU2i1OtaU9hK9YqmdnOux/Lrtm2QBlIZCTBwK86kUJQzIAGcB06ohUHw59NBlCQthGzK5sawrD
 AhUQwau/CgK3mq1AFng==
X-Authority-Analysis: v=2.4 cv=CdMFJbrl c=1 sm=1 tr=0 ts=69a8c72e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=hdDXuQ6OdnqjrmqFUSsA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 0DO4qnDqgNjIGNY7dUpEt00k2xtu_ljd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040198
X-Rspamd-Queue-Id: CE1D22094AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95474-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 12:21:56AM -0800, Qiang Yu wrote:
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
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index fed2fc9bb31108d51f88d34f3379c7744681f485..7369c291be51aa1ad7a330459dcb857f5a1988f6 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -17,6 +17,7 @@
>  #include <linux/phy/pcie.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
> @@ -3334,6 +3335,8 @@ struct qmp_pcie {
>  
>  	struct clk_fixed_rate pipe_clk_fixed;
>  	struct clk_fixed_rate aux_clk_fixed;
> +
> +	struct dev_pm_domain_list *pd_list;
>  };
>  
>  static bool qphy_checkbits(const void __iomem *base, u32 offset, u32 val)
> @@ -5348,6 +5351,16 @@ static int qmp_pcie_probe(struct platform_device *pdev)
>  	WARN_ON_ONCE(!qmp->cfg->pwrdn_ctrl);
>  	WARN_ON_ONCE(!qmp->cfg->phy_status);
>  
> +	ret = devm_pm_domain_attach_list(dev, NULL, &qmp->pd_list);
> +	if (ret < 0 && ret != -EEXIST) {
> +		dev_err(dev, "Failed to attach power domain\n");
> +		return ret;
> +	}
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;

These two should be separate commits.

> +
>  	ret = qmp_pcie_clk_init(qmp);
>  	if (ret)
>  		return ret;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

