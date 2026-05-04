Return-Path: <linux-arm-msm+bounces-105811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI9GH530+Gk73gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:33:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE964C34B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 840483003ED2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 19:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3333FA5D6;
	Mon,  4 May 2026 19:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwX0c7LQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEdTVmz6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01AF3EFD24
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 19:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777922886; cv=none; b=TCXxiIIEO6mBQbYri3frkQBdqS7leCLWfgPXMC3uEHEePaSXutObnlz/Z9KkZtZxAVBysm4jq+BR3WsIOF6Y/kaag0gpBW7agcjB0lgMBNz3iM+Y0TitgmnGWlyx/J5WH4Rx6hdg8BOMPtKyGrveMRHEnyHLf3L+mJyHc7pXAYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777922886; c=relaxed/simple;
	bh=qpFFSBikNZWQwG+bBK6lsQ4HVH/DkLdsUpUbtTsIUZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4P6s/qJgTjhx3IrGJnDm2kbVftroWb4IZJPfSQVvHsnurcKu+6jUhHhxvdzzkTGbVuqaP7kqZumfEiHtbW2CggM69cOoa36f+FLTfgp8T97IHqCcmLXIomjosxrtzcb+aAGT+8TXBJ84VxpO8yHq3cgiTHuPAoyySKO7Jl8fwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UwX0c7LQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEdTVmz6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644DlB0m366340
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 19:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PMC7EZxzEAp7VqfI8gWRBXZL
	5WK6FzBLWaPqyYA6xkQ=; b=UwX0c7LQkrmiglS99RbSq7UN/mYW1a6bvPn7ANKW
	wooYmGB0LPfzmlj+GGXuKl8NmthUq8WML/mCKZGXBubfJuby9iiLlkb8xb0uk5UW
	jdLVbbpYhKF5LZVN60dw9wiK2PDQoKvFYp92V2QookogJgx0NceI5xJmEIDEyxES
	hVii3ZuYeEKXuveF06OXuVYYBPs1+XO3RmE+BoGhB0NytXEgGnrG//EBkQFmOQce
	/btZm5rrh1hEaUzyCLqPSp4L5ujimLlHqWIVF0Jm55D5ZaWFp8G0Bb4zbVkiaGYz
	quTk7NAccovy85v2OEXHbuvHNF23ylO1uUOST/X+2s9tlA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvn6sbt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 19:28:04 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7dce1e67fccso6657359a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 12:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777922884; x=1778527684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PMC7EZxzEAp7VqfI8gWRBXZL5WK6FzBLWaPqyYA6xkQ=;
        b=DEdTVmz6hrL6iTru2Oue+1lTUJnvcQNlWIO8+3o3DONv5evYgv2od/r4rj06zZL2EF
         j25ahx6DXk86ENKDE/9zsFbNbLApMOq+laYpmBfM331krlCz7zESYW7Edu35Y0SIXhy1
         B40JeWVaPOtqNVOqudbbafYw+15x4YGZqszn6GUSmHJgKFrpBG3sAvi959R2MteN8fHI
         7uA3IXT22KvEQquc+/uoAvMJgjhxXNfPU0mtAqDY8lIqDalEdzZ2JfmNkqUL8Ul6Swy1
         muicV+xxsdICFtJ2FWi928NhZeG2BzhKcVh4xJv4jo+Pg+PN7fqZ4sqTmoQMfaWe+N5t
         GWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777922884; x=1778527684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMC7EZxzEAp7VqfI8gWRBXZL5WK6FzBLWaPqyYA6xkQ=;
        b=UrkvonqbkUbBPwHzCZHzr+3AQN2Mms/OSMJcUdhB21Cpa32IUzhhmRw4obj3M71lS6
         +FVypal7tjtl3BFuk77ptmxFZfGCk67tN/xXj/TgSMjlYe8VFcZIcIzkECAS5pW7XX3h
         hlYPQQDusO19AaVelSd9BczuatEZKVqc954HkhpYUafWA1TbErj08DXACKki1ywCRxFt
         NibrkZTtDrAzKwV9PNT96VQPctnrEkHl8kX7MuyTtU5IhemHuqzo0/3laIRZATMWM51O
         tJXUIjJl4dKIuk8m5643eLF8SWnOhkp1s66e0uZYhhF94vVRt68CY5ye/FnYVPU2vZi5
         f5EQ==
X-Forwarded-Encrypted: i=1; AFNElJ93JpuVFIfmy7mJiZbxxaQGoRZRoam4IiYOEg9C1SylEUnPfisGjMqDJLWg5B1Am1504/iZU84nXnPQd0+T@vger.kernel.org
X-Gm-Message-State: AOJu0YyX7XGSXjYVkE0P49qO3yMJBHKwJKyL/UFyDeD5AeovzRaN1kWe
	SBd7sjaswUeV2ITKvQ7O6mkfgCAJbZ7CDqr5oNA8eqYkDMedCEHxKyGkugDEatbHNAI51lu13B0
	kRzKXBUgTuucMXhtI6o6IUFGO/en/3MtQt12dGa/BuS68WzGtebsW8qJW1Am529a066sO
X-Gm-Gg: AeBDiesI3crdf+yNk21z9SXRSVUpNuveF16oApPNJX63tcNC9WinRpRJ64cPRLSL2ln
	a0et3obGv/djFbn+549OQVEcvOzYQ0k1SoVzXzPOIvNiAWEarTprS03fSPS/X9qDyUaUbyYUrGu
	hmlkd5HIvX8NhY0RV+7aXhWxe4oTPM0lvCWkidg+14JiW9rxCHTCJCPB77gR61N6UgtTCG65Kl9
	/auGfsmq9GhdtoKke9lon/uT01k3QY2rdVirlORK19M79Vs1aCD87r+XDeNiCUT3k8lkr5JdlJc
	55+rtctS7/G+9AD+gqPSFvHI2/DLxw/T9wsyKdidoY/FRbW6CVvPYEOFCFuoAMacKX1OtW5oljn
	WqgWo0cdjypEOsxXbzyO5ZF62pTIIeNXSxDbNe+4nUPeg6yQC1y4qqVQb/3ghKKLQhLb353LXCd
	cXSOyoxSckXqx79qSYB+L31Ffa3S4Gpt35F4s8FTMJ5jSlhA==
X-Received: by 2002:a05:6820:6aca:b0:694:852a:28aa with SMTP id 006d021491bc7-69697dfa518mr4590457eaf.60.1777922883727;
        Mon, 04 May 2026 12:28:03 -0700 (PDT)
X-Received: by 2002:a05:6820:6aca:b0:694:852a:28aa with SMTP id 006d021491bc7-69697dfa518mr4590426eaf.60.1777922883095;
        Mon, 04 May 2026 12:28:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393610ba631sm34733671fa.12.2026.05.04.12.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:28:01 -0700 (PDT)
Date: Mon, 4 May 2026 22:28:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] phy: qcom: qmp-usbc: Add qmp configuration for
 Shikra
Message-ID: <gb46nv455vfkldkhvlo7c26amuonrlzvstirdpbzictbqgyxox@6vypar3byxhs>
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
 <20260504170659.282532-5-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504170659.282532-5-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: B9V9iP-GaBjH_Yy-D3OS1AyYxFR7EWv2
X-Authority-Analysis: v=2.4 cv=Z+vc2nRA c=1 sm=1 tr=0 ts=69f8f344 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=fS6AiMJiFTYgNuFnBekA:9 a=CjuIK1q_8ugA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: B9V9iP-GaBjH_Yy-D3OS1AyYxFR7EWv2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3OCBTYWx0ZWRfX3EPTEIqrXCns
 mq12nY6twtScee6CXalyM+Pbx0oyY4TD0K4hwBMvlDpGpXK4ccpmCx+YBxMpqNnhTnVeLu/65c6
 imnw/752GASiqvWCCFh9XUPmzeerP0DYW4Vs3YA5ug5N+3uu0nKvaFdhcnOWSVBDBiW4VgNKBw/
 cVjuENBQ/mhvPZgy82JAzNH/XdG+qXb0pysPHz1RCJaRjQDBNaj4W+evwMIl0Evy+rfsKmGkgTU
 aqATRBub1J6+GfLurcOgujZ1+CQTrBoO6f1XDB/rfASGNTrd7gSkCQ3Qb07FsQWU8y+xjxc3wDH
 HdahDf6krR19RGSFKFDmViVfxgNEzKBv4qXZnw4LktrL3aSIukVKwYtdUUdxjlS0fBfdY+x/Kvq
 wzPhRM2uWydZ0QLe7A/fYtsNl1LpbePxEexLjv3C6ds3pTdPEWPfw5ON/vx1cmViYEPNCsf0LqQ
 aI6/IV6FlHzZUlhH3hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040178
X-Rspamd-Queue-Id: 1DE964C34B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105811-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, May 04, 2026 at 10:36:59PM +0530, Krishna Kurapati wrote:
> Add init sequence and phy configuration for the Super Speed port
> on Shikra SoC.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index c342479a3798..400dcebf8222 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -2019,6 +2019,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
>  	}, {
>  		.compatible = "qcom,sdm660-qmp-usb3-phy",
>  		.data = &sdm660_usb3phy_cfg,
> +	}, {
> +		.compatible = "qcom,shikra-qmp-usb3-phy",
> +		.data = &qcs615_usb3phy_cfg,

If we are reusing Talos configuration, should Talos also be used for the
fallback compat instead of modifying the driver?

>  	}, {
>  		.compatible = "qcom,sm6115-qmp-usb3-phy",
>  		.data = &qcm2290_usb3phy_cfg,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

