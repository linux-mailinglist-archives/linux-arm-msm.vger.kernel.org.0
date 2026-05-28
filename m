Return-Path: <linux-arm-msm+bounces-110054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCXgMA3cF2phTQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 08:09:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 661645ED22C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 08:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D66783026C12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 06:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F053290DB;
	Thu, 28 May 2026 06:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCuXretJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/2BR/OB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC000314D07
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779948270; cv=none; b=eluTTwZsOuBRzQXsDWqV/oRnsBWrabvnY+rHlA2kAcPA89j8K6BvgSl47/Sx2I8jkC85lMTsU0iMkudCMWPxWCk/hulfMwXniq4PZeXDsq7nAptxs4NxFSvnNSxxPLRxtH/ZkluDfBAW9TnzkLye9iwLDB1IwazN3NfrsBg5TsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779948270; c=relaxed/simple;
	bh=qyL34sxEoMuBXeSfDHG+RvyR+Jjoy5L8ACobH5tEfaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOnZ6PZgj/xjYL7CnqE7qMfB/Iu+re/AuYD2jRwAg/SteM/SVP1h+5as+hdePFG6n3WP3VS07FRLWrQ4nFlho1Pu0NcNUwrE7aMcBDEmbxIXohIiUVoXHO/PVMWqnkj5aTpI0hjibbcIcSBd2rGJFHafz1Cw90V5ejVmBtUiGRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCuXretJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/2BR/OB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKlitF2931476
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q38iL/Kl5bsfH6U6c4BfPkvl
	nIA5GnSzXnuKo9Th4mA=; b=bCuXretJEbIsNR9VHFuRbflh+3V4Enl1z8jdX4ZN
	GpvInthwhIbtfc/0200eCrRGdEd/1DxP01G6a45JHL7yvwYMuubfC23JVGMrFryS
	2yzh8YsVFOBrClJHZEWWjXvT+LXT/gyKtK9qh0nftoElDC9a5PnsRRcXCH/Yo4m9
	KlKxfgs8JtMB6VIawLrYUaA6IVQr8udAIyPJwZaizauSFx/Edv7pwa35u0bR1uUb
	zNiLChVbPQhOHw6gdoBXn31i54cwWnbG+Br1u/6nQEbep5MLp27mDixyTj2bKJaq
	sOAGg7UvjZO46d9guC0EctuASXGido321IdQSlVTaZOYzg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yahh72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:04:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516d09e77e6so138293541cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 23:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779948267; x=1780553067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q38iL/Kl5bsfH6U6c4BfPkvlnIA5GnSzXnuKo9Th4mA=;
        b=P/2BR/OBPdP9nRV2lFI8ChYt1welVm3zyp68WD4un7P/dPd1qCm0aRIG+uOD7QvwiI
         TIuTmLo3ftOTzRFN0cAcGwrXzMpX8xhf+Bg1tLdu7GvRnFFlN2j3UHpodX7Yt16Hgdg+
         IpH3LodXRMmbPdl5Eb5pT7JPqxRSikGbvAqpmLSKN/LAPLV9E3VS0nyZoMU90KWqlRpV
         GlvSHV3IkvyrSzGH7mio3FpEeXctOpbbBgRZsPpUUY4/3scVa9VdvBV1YHz1oMPhJoW5
         F5l1BqyG2bWlcu4/xrSrK6C91+hdm59sZ1wGTIAtPH7X/ZG0YxLR+fnMrYXl/qx8M3tR
         36GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779948267; x=1780553067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q38iL/Kl5bsfH6U6c4BfPkvlnIA5GnSzXnuKo9Th4mA=;
        b=EwXPjUHfnWo297NrYYoKzPNOEcwchRw0jUi+DCtahgJW+tU3MJOe742VyC6LFhdUTs
         npnpJuppLKWR4ho395DSZ3C37+l4PYV7qeWxqOiATzWhtpP3qAwnJbA+xb47GGdaRw/W
         xbpzlkag6j3d1nJp97e3zrH6KCLxCqCvtSiAnt/1JnqypDmS40IK/WoKrbRFBUvCyhr0
         c8e1UV+mhi0H0o26IKC0KG0hvuarf8Zb3lU8HXJokKcE+mPPR2IBqCprfYjzjTOOQeRH
         4Q38FB3MFocIHjvDtG38T1Gx/dag0yDlmSH/394BXdH92sRSyMPvI6MXz1UlKKpccGHY
         Zm7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8CNw5YXZ7PosSAYq/KMQzsBI130MBqVtcuhfUXzgt+EY1N8C2X7u2JDe7HC0Z0ZG5Dv6Mb55C3cGxdWWjC@vger.kernel.org
X-Gm-Message-State: AOJu0YxIbm9C+4p3x3xpHnRyhccfCN1vz8rEvp+bbu8tOWo4nFt/XFUC
	tsAi3qXJkKwZI1aCvfXeTX8bVNi++vnKzZX8Etr/LY0DOyNxTonkYQrJKzogp6u4G4JaKmKCoeL
	O7H4n2j5x1UN2zhf45WLeQ3Ih3C2GVXBJzFi0mPLd88kIW3zYkHKhc8KoSfzLCKqfwHoR3c8D9V
	bVFlo=
X-Gm-Gg: Acq92OHD3lxTI0yiHayjmsdLlI3v17zY2jiFXIEWxn23c8ARnoZ3NZg+XMpg8Fr8UNd
	rpoGhZw5KCBThTPwkCpue/0FA+c9srhWruQgx8ZLucahydGYgD1L/Q1uYYRfanzb8UxTVRq5aXF
	szTxC8vTArQjUG/kEp+Gsa/AsQKLqN7rFvxXwx2p8g9M5shRCdZ+hW2nZT7KVfeotA1Njgzp0qD
	pI/zJseycLrcQwdba4oeOMz5PyNsr0jfV69C+bdYy4D204hod9dcpFMo+wFI3fpFGB9y5YDwrZz
	BEFW4TJ04gyovU2/TDhrXUNlkO8tn4zqqOiiG7C8UA4ILejwRoO6igmgjaY9XXlhRIEL7faNYZ8
	LJQr5osb/UOpJNRskxiBaIi5ZyB+jzPgUts1Iic+5RRdBmGN3SUE8M7biZ53RyxnhnUzYBO4+hn
	il1/iYN6F9Bml2O9RTIoFDb0mj7k+QiFAfqebCxw8hCl6jQw==
X-Received: by 2002:a05:622a:494:b0:516:eaf9:f6f1 with SMTP id d75a77b69052e-516eaf9fb0cmr258205871cf.13.1779948267096;
        Wed, 27 May 2026 23:04:27 -0700 (PDT)
X-Received: by 2002:a05:622a:494:b0:516:eaf9:f6f1 with SMTP id d75a77b69052e-516eaf9fb0cmr258205281cf.13.1779948266455;
        Wed, 27 May 2026 23:04:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4632282dsm1710822e87.41.2026.05.27.23.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:04:25 -0700 (PDT)
Date: Thu, 28 May 2026 09:04:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: guptarud@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 2/3] soc: qcom: spm: Add MSM8960 SAW2 CPU support
Message-ID: <iqydzm64gmzqei6sya6p7ntonrswpjcphubfnqyvabaaaiufif@ts7iuvol6o43>
References: <20260527-expressatt_cpufreq-v2-0-b9b7726ccb6d@gmail.com>
 <20260527-expressatt_cpufreq-v2-2-b9b7726ccb6d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527-expressatt_cpufreq-v2-2-b9b7726ccb6d@gmail.com>
X-Proofpoint-GUID: 7Ry_8pA44gsIU9PJ4-MGckQE_gjen540
X-Proofpoint-ORIG-GUID: 7Ry_8pA44gsIU9PJ4-MGckQE_gjen540
X-Authority-Analysis: v=2.4 cv=CaE4Irrl c=1 sm=1 tr=0 ts=6a17daeb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=oA5LrNwOAAAA:20
 a=pGLkceISAAAA:8 a=uAGLYOZ0FLdk90Ey5qUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA1NyBTYWx0ZWRfX7Ul3TDTi75E+
 +hcIpG/GEOppUWRoSR/YepxTFtGf/RY/caMmxPOGTT1rx/j2B6+OINNSvEtHr/+yAeXd8shyClq
 waIvZyV3Nsj0lQJD5uVfZl5DRusk7b6Jz4ELanoukyDstLmVo9FQ04hKdFQTWd5vMVnih1hKunW
 ASjCe7xB52qpfqTqyegEgF4V4lYHO8EJS3l5U6+csAF4Sk7t/1bw38P1AkVvR+oWcVEmAdrlvwg
 a18SvVHLqH7HkA/GfrKLJWK2q/w8mxhnpdKaZLppJp5+mS4y9CXAuoyZ+pqUhQ0haUJjIhJ5yaK
 1bbL2uGbU03cOe4oQm6CUP+EAKlxyKJlky8GwIcUZWmeuu4vT8a4IWRsobbRZ8Xw5DWPI436A6f
 SwPIqldsr8z1okkREgLpjx9vrKSiQptVLLSj4NyzwdItN/PYzQv/tBccsWxruCTCo7bJ9yZlpgv
 vstLu8GGGzQNq4aRhpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280057
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110054-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 661645ED22C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 08:39:29PM -0700, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> The MSM8960 uses SAW2 v1.1, the same hardware version as the APQ8064.
> Add SPM register data so that the SAW2 driver can program the correct
> SPM sequences and PMIC parameters for MSM8960 CPUs.
> 
> Link: https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L3265-L3285
> Link: https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L3353-L3381
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  drivers/soc/qcom/spm.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
> index f75659fff287..fb3ec8aa42b0 100644
> --- a/drivers/soc/qcom/spm.c
> +++ b/drivers/soc/qcom/spm.c
> @@ -233,7 +233,7 @@ static const u16 spm_reg_offset_v1_1[SPM_REG_NR] = {
>  
>  static void smp_set_vdd_v1_1(void *data);
>  
> -/* SPM register data for 8064 */
> +/* SPM register data for 8064, 8960 */
>  static struct linear_range spm_v1_1_regulator_range =
>  	REGULATOR_LINEAR_RANGE(700000, 0, 56, 12500);
>  
> @@ -253,6 +253,22 @@ static const struct spm_reg_data spm_reg_8064_cpu = {
>  	.ramp_delay = 1250,
>  };
>  
> +static const struct spm_reg_data spm_reg_8960_cpu = {
> +	.reg_offset = spm_reg_offset_v1_1,
> +	.spm_cfg = 0x1f,
> +	.pmic_dly = 0x03020004,

Except for this value, the programming is the same as the existing
APQ8064. But, APQ8064 seems to have an error there, it also should be
using this pmic_dly.

But#2, both APQ8064 and MSM8960 should only be using this table for the
SAW2 of the first CPU core. The rest should be using a slightly
different config (at least according to msm-3.4 tree I'm looking at).
Would you please fix that?

Please make existing APQ8064 entry use pmic_dly of 0x03020004, use it
for 8960 too. Then add new compat (something like
qcom,apq8064-saw2-v1.1-secondary) and use it for the CPU 1-3 on APQ8064
and similarly qcom,msm8960-saw2-secondary for CPU1 on MSM8960. Feel free
to propose a better name.

> +	.pmic_data[0] = 0x0084009c,
> +	.pmic_data[1] = 0x00a4001c,
> +	.seq = { 0x03, 0x0f, 0x00, 0x24, 0x54, 0x10, 0x09, 0x03, 0x01,
> +		0x10, 0x54, 0x30, 0x0c, 0x24, 0x30, 0x0f },
> +	.start_index[PM_SLEEP_MODE_STBY] = 0,
> +	.start_index[PM_SLEEP_MODE_SPC] = 2,
> +	.set_vdd = smp_set_vdd_v1_1,
> +	.range = &spm_v1_1_regulator_range,
> +	.init_uV = 1300000,
> +	.ramp_delay = 1250,
> +};
> +
>  static inline void spm_register_write(struct spm_driver_data *drv,
>  					enum spm_reg reg, u32 val)
>  {
> @@ -501,6 +517,8 @@ static const struct of_device_id spm_match_table[] = {
>  	  .data = &spm_reg_8974_8084_cpu },
>  	{ .compatible = "qcom,apq8064-saw2-v1.1-cpu",
>  	  .data = &spm_reg_8064_cpu },
> +	{ .compatible = "qcom,msm8960-saw2-cpu",
> +	  .data = &spm_reg_8960_cpu },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, spm_match_table);
> 
> -- 
> 2.54.0
> 
> 

-- 
With best wishes
Dmitry

