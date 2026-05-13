Return-Path: <linux-arm-msm+bounces-107288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGovLHZ0BGprIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:54:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 254B953363B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D59C531493B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE73E393DE8;
	Wed, 13 May 2026 12:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J4IB536+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dtVURKzZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F68E3F7A86
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676493; cv=none; b=PREy1jD4IyRGwew1udOhjgmSh8yMwYaPoF3uPHJTrk53LLsXpCDr+ULNF/66iEV3lNjsqSiGdMhDD7NwU0aXSrF2jZFcXQezrTrZ5DjhZfwo27EtwHrbByrVOnpG0nMGf3qiEvBQSA/GtrzlITx0/ljQqmMaXetNiIqRVJQg1EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676493; c=relaxed/simple;
	bh=lBAMXVaLRf7e+I3Mw5pkkrDPuoUt/kl0hayd1u6CLFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4mcCeBqLZpb/pC0jhdChXSBNyG+6AkeXhbaifCVykRUky20nK5qbLlaTNKlZzzPoNnIpNJ4rB0CQ1N6hBZ6aUhFtyruPbwlUuSkywVGYAzgb/v1hpW0WUbK/BBtTU/A5w8Mzv9yhjfrT05SB/7GySqY4RnfvJdK+Vm1HdAGyu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J4IB536+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dtVURKzZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAXBJ0978127
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t4ZT18AR1d3xU/HYEeVlSAcB
	cL6PN3VDRrten0+gzJ4=; b=J4IB536+2VcMaAM2wLLXXuDbTj3i/XkJj9b9ESKq
	MPOF6AG5u+MrARznnUJ3pJdKOHGzDsqCNciB30BiVz9wWSXPcbOJ2N4rwYlxp8yD
	cyCcN57oLx0NUlPS/8Mxs12l17ZefDrcpCnT4fjkTuHP0F8QXzUDPbp+TYTW2Gmu
	HaPwhpomacYYpzDU9iLGhI/t+WcH/pQ9AUrk+4BQ1MR6BVbpRZGiqSrN/2GmNDk9
	sANgSm2jfio47SZL5L3y0dosyItO5463TKC94JHVxkLeRhABD/Ep8g62JpAQPucj
	1jmENIHF9jX2J0dzsR78Ig+C1qB0474eocb2J4KLiPjvTA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9v9ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:48:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8e8c47a3so6302211cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676491; x=1779281291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t4ZT18AR1d3xU/HYEeVlSAcBcL6PN3VDRrten0+gzJ4=;
        b=dtVURKzZ+813228reO5BQj0FKiqHkALzpyPqSd03/44yfXA8gc4VRNd2O7tuCgdd7v
         bQao4yxfyYr1AkQXm7CX01RQHAGN9uet98bFDCxbbo3BRBTBQEY3aCpXy2u4rljKM/5k
         JCTbUUU02P02ZJmuRb2PCVK7IdoGW40t96Igk30wP4hAZb8CVmQvxQktl2k+tRfaoT6O
         76U786423FxtylyOcVElp2NGR2F02JYL84fjnbjepZtzi/mIWC2WrMZz7mc4f25L+cUG
         jCyKefXXtAxuC1X/yFPfxh0cWfK1eTh4aY5gpjyt4/fJXncUyXcTRQQAvj/gYELpT93q
         hCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676491; x=1779281291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4ZT18AR1d3xU/HYEeVlSAcBcL6PN3VDRrten0+gzJ4=;
        b=RpcgAKnZuOXRje8toehRakbMORHvUb0Z+1aIe+ZTdY8A0EcnchXhs3Tp26sqXpT4d7
         U159PttuFC5orO/UDUp9WTDE6ACk6/jVrk1hctYTkolXxC9luDy6TTlrG9fmjvBUlcDS
         e3jwmWBcZ0Kd75S711NqDjobe9d75PHcI02q/RhJDqTBjDG/OWWbldzwdZCkBJj6froc
         vBmlYTW2tNMu7yeDmStof6Uuhijh590/+LVm82wi9ioXlhsHo7dHmvVe+MP9e/yxF2iZ
         HSk6/w+bSyprB5X0ljKt/0kea322eiYXfDApO9FdpKQx/aSJ8uIElU6+PeCkSVLPcB0K
         60Ag==
X-Forwarded-Encrypted: i=1; AFNElJ+KNMI90lUIuWfOcbLhqy+N7Q+l5ejCHg4tqh8kawyeBfC+bdVlXdP5bwrQc7TIDdRvtHSdamxFNzSzOyG3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxihd/vP+Q6plUy+4DTqPGmf5EbQgAWfqGM5dk3UheZrxsSvTVQ
	FHYr8vioi9Wnh8IR8jglpkJ6M8Gz/V7rwV2ScotoMVtjvgYe8zpsoBvJ1Oo/vKYV/kQ0QFESGSt
	+4bufAwcp7vpqqTAo1Eg+Xas/XD8Sg36leOWKftVW39lRbvRobjtvWZ23woCyE6NesufT
X-Gm-Gg: Acq92OFRBMs8Srb3pgT2XNXVMVxAEfVTkFGwUfyY5qjX62XcbI48QeaznVNr+ZAdmtM
	+IrjpH/L1zo/Sd27tqbNWYXJO40f9bG0VI7eOaUwKmiDPQWKcd+BAhwIDs4KWgxyF0aRTusf8hw
	JymcqReNCkj42DpKv3ZhSc19S9mCCg3crXSdi1WHhTj62Gf5+vShx7ATCV2KC0OBXU09dfhjrGN
	qiJg6og8CB8ab9aRL8Y8X9svlsnu6I30bOnFMg2Kcqof+DwE2/qI2ICHyjUO4sLdd2dqFbizIrs
	AlIAEkx2HPxczhl2gvK3AazOZQ434BwlzqGXB6f1ofmAzY7xBdAxUrK3sLnEIhDpe/ukXEuxfLm
	QC1K0afYsoSbFZhX3GJe7E/4EMEc3nRNSx4/sMZUkqO5oNNqJYZv6hJmNeE0ARpWjX6tSjI52y2
	8vKsVidK2ednLYot6kQVK2UFZyw5Wk3Vik91M=
X-Received: by 2002:a05:622a:511:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-5162fe2d671mr37319361cf.19.1778676490722;
        Wed, 13 May 2026 05:48:10 -0700 (PDT)
X-Received: by 2002:a05:622a:511:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-5162fe2d671mr37318151cf.19.1778676489305;
        Wed, 13 May 2026 05:48:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c873fd59sm2444092e87.57.2026.05.13.05.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:48:07 -0700 (PDT)
Date: Wed, 13 May 2026 15:48:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] pinctrl: qcom: lpass-lpi: Enable runtime PM hooks
 on remaining SoCs
Message-ID: <gkgffuxfown5esdo6s6yg4povzskhean5hzd2yowsiyxrpkd2h@oa2fs63ijmym>
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
 <20260508113636.3561383-2-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508113636.3561383-2-ajay.nandam@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX6ml8yiMCqPND
 nm+wzj55WZRNKFJuxqbtIstny+Z7feXX07ii3coaa+pZYin3Z8i7oRnL5DmOb4aYPt898BOMsB+
 rprkbJjCDs+k6MO4kLzaLwk+CQgMoFjTOXgwzlDZO6h7y3/XDD9p2XT7cm6JjsxkA85KW7hgKQ4
 rRCY3PCukk5XyI9en1jhxLEUbm5Y/gZycibn2CHFVHI6VBN3imO7EhqMeTYcLU6mNTypv3sH6Er
 +U7wYeo/GPPAWnkDxOjHwwn6opRa+g3zJkP0DUz3MSNWhkNg8WXiJyFfAtRRpLsUFvk8li7GN05
 xIkqw0OpdJtCb0jlcTg3joMA3ix/fZ7mz82mtdThPA4bW2EOA6zX32NiVumEP+MUH9GDUmSBD5h
 UgIifa5meZjBevijB23iZQJQW+PdGOEbR6A6r+q3akoF6V7VS+azy/v6H7ANuSxdDH+wQwvNXwp
 wg8SoHDChiou41GThhw==
X-Proofpoint-GUID: 3d6uTE2coFUUUbOhezkU_bGDlR7Tr23c
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a04730b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ueq-J5Ao1-vnPzIKXa8A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 3d6uTE2coFUUUbOhezkU_bGDlR7Tr23c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132
X-Rspamd-Queue-Id: 254B953363B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107288-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 05:06:35PM +0530, Ajay Kumar Nandam wrote:
> The LPASS LPI core conversion to PM clock framework relies on variant
> drivers wiring runtime PM callbacks.
> 
> Hook up runtime PM callbacks for the remaining LPASS LPI variant
> drivers so all SoCs using the common core get consistent pm_clk based
> clock handling:
>   - milos
>   - sdm660
>   - sdm670
>   - sc8280xp
>   - sm4250
>   - sm6115
>   - sm8250
>   - sm8450
>   - sm8550
>   - sm8650
> 
> This is a mechanical per-variant driver update that relies on the
> same generic PM clock flow (of_pm_clk_add_clks() + pm_clk_suspend/
> pm_clk_resume()) and DT-provided clocks.
> 
> Runtime behavior was validated on Kodiak (sc7280).
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 11 +++++++++--
>  drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 11 +++++++++--
>  drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 11 +++++++++--
>  drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 11 +++++++++--
>  drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 11 +++++++++--
>  10 files changed, 80 insertions(+), 10 deletions(-)
> 
> @@ -173,10 +175,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>  
> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
>  static struct platform_driver lpi_pinctrl_driver = {
>  	.driver = {
> -		   .name = "qcom-sc8280xp-lpass-lpi-pinctrl",
> -		   .of_match_table = lpi_pinctrl_of_match,
> +			   .name = "qcom-sc8280xp-lpass-lpi-pinctrl",
> +			   .of_match_table = lpi_pinctrl_of_match,
> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),

Incorrect indentation

>  	},
>  	.probe = lpi_pinctrl_probe,
>  	.remove = lpi_pinctrl_remove,

> @@ -134,10 +136,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>  
> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
>  static struct platform_driver lpi_pinctrl_driver = {
>  	.driver = {
> -		   .name = "qcom-sm8250-lpass-lpi-pinctrl",
> -		   .of_match_table = lpi_pinctrl_of_match,
> +			   .name = "qcom-sm8250-lpass-lpi-pinctrl",
> +			   .of_match_table = lpi_pinctrl_of_match,
> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),

Incorrect indentation

>  	},
>  	.probe = lpi_pinctrl_probe,
>  	.remove = lpi_pinctrl_remove,
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
> index 439f6541622e..a79f99ec6df9 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
> @@ -6,6 +6,8 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "pinctrl-lpass-lpi.h"
>  
> @@ -202,10 +204,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>  
> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
>  static struct platform_driver lpi_pinctrl_driver = {
>  	.driver = {
> -		   .name = "qcom-sm8450-lpass-lpi-pinctrl",
> -		   .of_match_table = lpi_pinctrl_of_match,
> +			   .name = "qcom-sm8450-lpass-lpi-pinctrl",
> +			   .of_match_table = lpi_pinctrl_of_match,
> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),

Incorrect indentation

>  	},
>  	.probe = lpi_pinctrl_probe,
>  	.remove = lpi_pinctrl_remove,
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
> index 73065919c8c2..9037ef0020da 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
> @@ -6,6 +6,8 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "pinctrl-lpass-lpi.h"
>  
> @@ -210,10 +212,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>  
> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
>  static struct platform_driver lpi_pinctrl_driver = {
>  	.driver = {
> -		   .name = "qcom-sm8550-lpass-lpi-pinctrl",
> -		   .of_match_table = lpi_pinctrl_of_match,
> +			   .name = "qcom-sm8550-lpass-lpi-pinctrl",
> +			   .of_match_table = lpi_pinctrl_of_match,
> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),

Incorrect indentation

>  	},
>  	.probe = lpi_pinctrl_probe,
>  	.remove = lpi_pinctrl_remove,
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
> index f9fcedf5a65d..513ddc99dd37 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
> @@ -6,6 +6,8 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "pinctrl-lpass-lpi.h"
>  
> @@ -217,10 +219,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>  
> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
>  static struct platform_driver lpi_pinctrl_driver = {
>  	.driver = {
> -		   .name = "qcom-sm8650-lpass-lpi-pinctrl",
> -		   .of_match_table = lpi_pinctrl_of_match,
> +			   .name = "qcom-sm8650-lpass-lpi-pinctrl",
> +			   .of_match_table = lpi_pinctrl_of_match,
> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),

Incorrect indentation

>  	},
>  	.probe = lpi_pinctrl_probe,
>  	.remove = lpi_pinctrl_remove,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

