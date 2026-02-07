Return-Path: <linux-arm-msm+bounces-92118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKAwKkERh2lrTQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 11:17:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B6A10573D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 11:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 214F53011756
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 10:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971DA301465;
	Sat,  7 Feb 2026 10:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vaq/Zd5a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBRF2Ppb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5751329B8DB
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Feb 2026 10:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770459454; cv=none; b=Brio/XjsY6GoLjZivKa5t93TN4ZH5weFDUO5HuQCxL+lyo+Ycd7pGK18nGzYGKTCpCUWTJvOBkpOX0Aa6AhK00Adv8tPln86Le8HuOcDSZnpUQ8O4bqLrXgce8BF+6NhV7a0mEJRW33McewRi9dW+h8qzttl86UZX0X/4XKCLTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770459454; c=relaxed/simple;
	bh=6iY5R1x275sBlnPEw6/S5fJkvAn8lRYuYTqMr2/TVmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUPpb4r50wFXM3tpuyzWnCgpTPLtVtOgl3t4OCee0uKfcyFh3fd1TYsjohC7nvdcCIA7Cdwjt5NQbvaNkR5j7x8q9bJt+IL5VRmUjK0KmBizaEG/Orvp6Po3j4BWtYvgoi1FjV5hL0xE74830EHdocHylpIOoc+c0Z5maK2gPIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vaq/Zd5a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBRF2Ppb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174leII316932
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Feb 2026 10:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bUDIGIgfx6JHfOt1ZmnmTE3cE//s+7XfbWbMIrAf6D8=; b=Vaq/Zd5ayWAWr1lc
	TBRfZeWfSLVzVrZpjPNiwtwJfaqKfY4BZnxp1G4G7LMllvtAwQKyMSMskjNhVuWK
	ALv6lB0SpQ+CbuzKGHcq6aZfRSuvXLu3YpkbzdFXcizRlzsZly0YgA8UNMriz44m
	hmOB3WP+4EauCPNjmxY92MNlp0f08OMYE5d5PJj1TQ5IfNzWVymv+aXibwmlYxUx
	ugZpoK0B5rN7JOKcJXytbPCdvjF4nP7DOU0/UBoSSHcQC1K99jk30bRpbr8TznpG
	NZVU8IXeQNwsVRfvoljNSyyGz1C/kjno3s9tlbwv+iJf0Td0YuSsYNrQOIeP/SEC
	YqCdwQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xp7gfts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 10:17:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-503810dba87so76003981cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 02:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770459453; x=1771064253; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bUDIGIgfx6JHfOt1ZmnmTE3cE//s+7XfbWbMIrAf6D8=;
        b=MBRF2PpbIWsq944TFpccLwKFzBsZzX5uQibp0trLLeCJd1PDyc9YitZmplFYEy76Pj
         p8HoXl3UdRP+SHQABFJ4o/WNJIhvuRGKcfpTSs5sCsPCXukFgujTlxI78MG71MbK8Lhz
         Xy9X5ohypiYZaIc5koY+Wy7fWRH7eDakywHfX0Ei/hz8c8s6tTGWsvQAjh9svG1lkVoh
         8xOhdr2QVX1i6BiIGP1a4O7By7+0bYGcpGDoTSQL4rKGE8eXSKt3Em+TGnmzHpr0CZbH
         tqGqnVHy73UM1DWUP7o5LGGVRWHK3xM6Ji/JnXLfp4RyTsOqUD/nHCivZAYXFlkzq8VS
         G27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770459453; x=1771064253;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bUDIGIgfx6JHfOt1ZmnmTE3cE//s+7XfbWbMIrAf6D8=;
        b=gzcFnCarOTQ7J+UPD32Ie8u8X4j///YcJXISdpgcdNYKDwS9Wxz0CE1lSYAO9XGeTx
         G20GT+JWNMETvAXSN44d/QLQMFw8onIIoOrsOkFQ7nxt6d3PIiSLs6oe51xLEhP8T1RI
         nVITmQs04+dOTJ4Kke/wWMEKEAM6FOgB9AFgBJUxTraIavGYSEbj2aFFuazEQ/M4uoie
         s5PfPH+Q8S/jl3jO7/nz1VFTbkf0FztdFKXAIM8uFWJqb6wmkoYVAGqYTUEl2+5ato+Z
         a5KgBht2GaqpxERBsgg6xzHmYKPwegy6+jV9liROpwyAvInaGx852ZHzXzFJnVk0wD4L
         vxrw==
X-Forwarded-Encrypted: i=1; AJvYcCXWdbXG/o5qZo+pM2UEGetWLWBSS5ikej8KkRkGnBitjtQBMAZ1rKDOC/n5u3lLQeUQXwtlDkvqrUhdNT4D@vger.kernel.org
X-Gm-Message-State: AOJu0Yznl1BAvnmLIucWqbfQeb2hJNr6SVk9bAb9E26rZ7PJfRpADpi5
	puY2DdoYY80D3H49trZNNEG7PxfyZ7I9QeP9WlsqlNDydgQMFvuaHJCMNo3eC5bbdfFlUghWsV2
	9ELIgJ3siMhDH4vHf3YdSM+fPuDiaVe2MHkR752p/Q9X4V1Ed9XlOGKqIuz6S+TOZ44YB
X-Gm-Gg: AZuq6aI9whx5hpJHqiElb/b02YgIRGuPSY0xvZaHbwtgIK68m3clGKKjYFClab0LpDN
	8R8dj/YQAgqRX67oO8xlUP7BjS6DazyGDlEXb+QpJY0OUTjGeEziKTbF7DWQXZ2RuNOoPs7idmo
	/6UcHNUizISc8vE/F3kn9qt64i0BIHm3E6qiaJaMY8wr2t1XXYkBo7/BlGdyhKjaArXf/n8AE0m
	Pc/kuGNJT4d254jHjNII/hufoKQrc64gqVlnUZw2O94HabVJ+givHClgfejLRaJRVnN0g9tmAle
	0jaLCVymy+/lIAWaPjCnQ3c163C1P+LVXNYBaKnPpf6uhzzZyUFoID3rFtXe08DprWs338+hlO3
	DB9U4ynWYm3isxLYyKNAhxkbBI/RGSsv4hM+sTHo/lk1kJjRz5eHCQith5EoxPr/4F4ADDyxaYv
	PNv+Rg/tsbC+XFyG85iSmRHb8=
X-Received: by 2002:a05:620a:3f97:b0:8ca:305b:747e with SMTP id af79cd13be357-8caf1db90c3mr669151685a.88.1770459452541;
        Sat, 07 Feb 2026 02:17:32 -0800 (PST)
X-Received: by 2002:a05:620a:3f97:b0:8ca:305b:747e with SMTP id af79cd13be357-8caf1db90c3mr669149185a.88.1770459452009;
        Sat, 07 Feb 2026 02:17:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44e21c9fsm1214759e87.77.2026.02.07.02.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:17:31 -0800 (PST)
Date: Sat, 7 Feb 2026 12:17:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] phy: qcom: edp: Add per-version LDO configuration
 callback
Message-ID: <nxoukhntz3mn6m5qca2lk6wubhwlmxoldh6xpyxx63voseiw35@5rrwfryx6vww>
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-2-231882bbf3f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260205-edp_phy-v1-2-231882bbf3f1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3s3IGk4JNoDHuGNris3XhredQWDDmeAG
X-Proofpoint-GUID: 3s3IGk4JNoDHuGNris3XhredQWDDmeAG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA4MSBTYWx0ZWRfX9JArxt6d5iNy
 10jVnAKpVMDXIYcsEMq6e+b/MXjfpBbL3xIttznsIfMHQk5bqAqrNqDYyHA8Dm1pWz3iWc5li8b
 U778vKOy1JOhJHBxzrCeu2+llqrIe7Bg5zofUWBBRoUx1/rQbUe5WN93GoRW1JlTmLd9v0KEDGw
 UWK8AHsP1TlgLLiAqb6qzPCzEZ4UzIFB6SR/zrGlI3/rdNAvWRw/TkacOat+NuG1DdrC/mtD/c/
 0FnyJmJFzZxnHhvxdmeCzTqCLaX4f4kvTq+JaSlYAycUHtzZWFCZ/TgHZ0LOpL2u97BRIACKHfY
 ll//LICbk/k3Tdh+HAzNPOvSYym3sO4AEN09+WOndvtu7hlxbhpXM3+6q41HZ3qPveM0CDVC+Wx
 x7oJcsNFZg/mis8ZMCFXdFzrzZ6y6mAw+uo+dQ3PYbk5rdW0xMLNSgOIqsDqnDOmuSy1vTZ2bsH
 P7kYVpANmp41GUv4ihw==
X-Authority-Analysis: v=2.4 cv=LvafC3dc c=1 sm=1 tr=0 ts=6987113d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=ZHrqIDRvDTCMx_ORvVYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602070081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92118-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C2B6A10573D
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:20:54PM +0800, Yongxing Mou wrote:
> Introduce the com_ldo_config callback to support per‑PHY LDO
> configuration.

Missing the why part. Is the driver programming incorrect values, or is
it an optimisation? In the former case it needs Fixes, maybe cc:stable,
maybe Reported-by, etc.

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 86 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 76 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 10cbb7d9a8a0..388226dbad7f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -81,6 +81,7 @@ struct phy_ver_ops {
>  	int (*com_clk_fwd_cfg)(const struct qcom_edp *edp);
>  	int (*com_configure_pll)(const struct qcom_edp *edp);
>  	int (*com_configure_ssc)(const struct qcom_edp *edp);
> +	int (*com_ldo_config)(const struct qcom_edp *edp);
>  };
>  
>  struct qcom_edp_phy_cfg {
> @@ -273,7 +274,7 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
>  	const struct qcom_edp_swing_pre_emph_cfg *cfg = edp->cfg->swing_pre_emph_cfg;
>  	unsigned int v_level = 0;
>  	unsigned int p_level = 0;
> -	u8 ldo_config;
> +	int ret;
>  	u8 swing;
>  	u8 emph;
>  	int i;
> @@ -300,13 +301,13 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
>  	if (swing == 0xff || emph == 0xff)
>  		return -EINVAL;
>  
> -	ldo_config = edp->is_edp ? 0x0 : 0x1;
> +	ret = edp->cfg->ver_ops->com_ldo_config(edp);
> +	if (ret)
> +		return ret;
>  
> -	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
>  	writel(swing, edp->tx0 + TXn_TX_DRV_LVL);
>  	writel(emph, edp->tx0 + TXn_TX_EMP_POST1_LVL);
>  
> -	writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
>  	writel(swing, edp->tx1 + TXn_TX_DRV_LVL);
>  	writel(emph, edp->tx1 + TXn_TX_EMP_POST1_LVL);
>  
> @@ -530,6 +531,52 @@ static int qcom_edp_com_configure_pll_v4(const struct qcom_edp *edp)
>  	return 0;
>  }
>  
> +static int qcom_edp_ldo_config_v3(const struct qcom_edp *edp)
> +{
> +	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
> +	u32 ldo_config;
> +
> +	if (!edp->is_edp)
> +		ldo_config = 0x0;
> +	else if (dp_opts->link_rate <= 2700)
> +		ldo_config = 0x81;
> +	else
> +		ldo_config = 0x41;
> +
> +	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
> +	writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
> +
> +	return 0;
> +}
> +
> +static int qcom_edp_ldo_config_v4(const struct qcom_edp *edp)
> +{
> +	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
> +	u32 ldo_config;
> +
> +	if (!edp->is_edp)
> +		ldo_config = 0x0;
> +	else if (dp_opts->link_rate <= 2700)
> +		ldo_config = 0xC1;

Lowercase hex

> +	else
> +		ldo_config = 0x81;
> +
> +	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
> +	writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ver_ops qcom_edp_phy_ops_v3 = {
> +	.com_power_on		= qcom_edp_phy_power_on_v4,
> +	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v4,
> +	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_v4,
> +	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v4,
> +	.com_configure_pll	= qcom_edp_com_configure_pll_v4,
> +	.com_configure_ssc	= qcom_edp_com_configure_ssc_v4,
> +	.com_ldo_config		= qcom_edp_ldo_config_v3,
> +};
> +
>  static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
>  	.com_power_on		= qcom_edp_phy_power_on_v4,
>  	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v4,
> @@ -537,6 +584,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
>  	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v4,
>  	.com_configure_pll	= qcom_edp_com_configure_pll_v4,
>  	.com_configure_ssc	= qcom_edp_com_configure_ssc_v4,
> +	.com_ldo_config		= qcom_edp_ldo_config_v4,
>  };
>  
>  static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
> @@ -550,7 +598,7 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
>  static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
>  	.aux_cfg = edp_phy_aux_cfg_v4,
>  	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
> -	.ver_ops = &qcom_edp_phy_ops_v4,
> +	.ver_ops = &qcom_edp_phy_ops_v3,

This looks like an extra change. Is it intentional in this patch? If so,
mention it in the commit message.

>  };
>  
>  static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {

-- 
With best wishes
Dmitry

