Return-Path: <linux-arm-msm+bounces-100820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aICWCBuOymn09gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:52:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9DD35D30A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66026308872D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 14:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D6428371;
	Mon, 30 Mar 2026 14:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkfLKjgi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TEpRK6w2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337EB2E11DC
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881593; cv=none; b=cGqUg3lhqnoMWVrJSwImsk/HXqwjdcVgiM3Uc8ulCqzMRw64hJd1ydxg2QxqR4QBcnp/bk+o9OZjNGhrFtI8j+SQlASQDvKDYBnnTwzJD876EdVk1CgOmtwRCZpmxBhxCUF9+E/nYt7fR9NcMY6aRFaUdZyJYESxxBbPZZe744s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881593; c=relaxed/simple;
	bh=Ou2un0q+kwVxdytMbnTt7jxc25K1CsHTVOD4kpr9iKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LyxnIKT9PqF4npxad2XEydou8RJcEFQ1P9mqn5mfGBr52nimOGq5C3khqfywcYwSU7DDsyJ7XnUgt/zIYw/rpt7I2o2FIj8UfWOtBcKj7Z4xV/n0SREZHBp8dPk906Hsa4zuBVc48J8cx9wavYTEGSxEysN1D/MjxQs2aBhg1d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkfLKjgi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TEpRK6w2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UAGmKf3175937
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wzMonzrP2PHDXqseDefwSdvKf++DvWGpSTXQTEc+mlI=; b=LkfLKjgibVq5muow
	9xQdN1AZ/I4a/RBs1+pS28soJB1/lHTItXmX1wvnklzhTIg+8hCuWKO0+hS/SUEv
	DhkGYDPP99ss9CmzhvY426VDIEuK1816Dd/MTVaDjbMh3LdvQp8xvA3coJN6zxph
	s1bjOXgLVq/oYiLVQoXc12bHnikuMzwRO2+HdE++5Jyj+9Zd/cHjxqUO2+FYbiq/
	vtiRIdwIcUTOGaTgAHc00Su7crWG3xYOYSkpttlO8qw9jr+DOidswWpCFL/JJU+u
	TgteKpcsUm6zL8+SysRe9by/7qMfu3O2azB8NbVIC20cQLf9IxW1ZLLn8EVnu0Rv
	RWIZIA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h0yv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:39:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d99c2908cso2172028a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 07:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774881590; x=1775486390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wzMonzrP2PHDXqseDefwSdvKf++DvWGpSTXQTEc+mlI=;
        b=TEpRK6w2SFWyuGwmtEPiUwhFWujeAvFnv87wZ0Q6ULSJeAyC1/Jtutwnrw3HtxT/RT
         uqAL0FYOh/b/7P+9qyYh5FTdwNqTDAh1bca2wt0Iu7zKQVvaEtnyzKOoz4MsAQXOCuN7
         aBSi3XScf3MCLWduE5O9FKuw0Gtdfh05EKy5AsqbKC1kca24ckI/0ZKSwr7pczYsBfTt
         Cq/1X+3zKAk3eIiOxnvL8MYBQKmDCdXIMjue3PbOMjwaIHOyvDAe6lnEdXlRiGHJYwFz
         lbujng2QqEMMDT4yWFK2jDqXupdrkmLmhcufPt2DBZazOPKcsi+rTqVRReOTX0OSMxWY
         TRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774881590; x=1775486390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzMonzrP2PHDXqseDefwSdvKf++DvWGpSTXQTEc+mlI=;
        b=cB+iPnVKvgU2/jRDKiEV2AcIpa4Bd7pLQMoa0kPwQdCehmEZV/Onw3kVXsm6BdwIa6
         VxTqJ/l1l8GSYnQ3t95S16l9s55KAt5+lzOxQR6Nz0PYsacSdr++mljcKXEoiIvlQ7PF
         RVyGIpj1vxCM6pga/FfkADecuKUXsHPGqxlAI60mT6Id8s/z1UvfriROAPRiMunqvxoO
         MGsxOdBQuQXbigdoAwbMDDVVJQTBcr0A3ShwbgjVZ+PJBvH8hq12qxAtVafl4t/PSFRB
         0QHMU3PrTCSb2BDhwvx2udBo4qEVTPbHPTUqDaEXp0LePa+NOKtp1hOpeGUZi1WFVxN/
         6PTQ==
X-Gm-Message-State: AOJu0YzP3lNv9+umJy1ePMx7i5O0D0/tD2g0IeSHWVaxS+Q1/XPB6ekN
	MgsKVzndkWeIdIWIOqIn1RNq0Cx33cK4J/fuGrm+j2bZN2u1nkvYfriqWWiHMdbyhZps+R5YGc9
	A/NS8rPyQxKSEFnUxadUhKIYoLI+t7PZ9J9+ZxodZl6tTe9UBe/f+Eo6vn31f8Dd7Svfb
X-Gm-Gg: ATEYQzy/3CA0TCv2/KRfz2azhVXV9lwB3WOR7d1c5kqDkARoKMbl/m09kKESgePjdLO
	/r4kZliPvU2FoPZbaXmdJXweyfDnqzsZ562PNO20L+5gfjFS7N+4mb+veyn0SqOkmJDArtgu5rG
	9PfLcwVcilRkpToiKM/3YnI82RyVuICoUygq5ce8GdA7C5j4kVOr+BJqxVMBnlhrE4uUeXkLJkD
	w1GdNcK+ZbOHs/OOz+wYfzOUIYnTNMuW9lwC7u3rU4LTVIkHgqYj6pU/sYL8DUf+kVUVMz6O6a3
	II8k4vkJzmIq4Kce2iTnTz2yRQwzejcPJdLPg1fyLiKRiMVGtGXISjdeC2jl5PKi3QqQQIk4STl
	SBHczY40IeYToggHpdOl+tz8TyPxbX8uYvKzDvh4ywjV4AnmNsAY=
X-Received: by 2002:a17:90b:2ccb:b0:354:bfb7:db1a with SMTP id 98e67ed59e1d1-35c30145afdmr11403843a91.31.1774881589943;
        Mon, 30 Mar 2026 07:39:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccb:b0:354:bfb7:db1a with SMTP id 98e67ed59e1d1-35c30145afdmr11403509a91.31.1774881582117;
        Mon, 30 Mar 2026 07:39:42 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916d26dbsm7219239a12.13.2026.03.30.07.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 07:39:41 -0700 (PDT)
Message-ID: <a616c056-f9aa-420c-a543-7f1539e9e886@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 20:09:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com>
 <20260302-enable-ufs-ice-clock-scaling-v7-1-669b96ecadd8@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260302-enable-ufs-ice-clock-scaling-v7-1-669b96ecadd8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDExNCBTYWx0ZWRfX2jVPu5XYcBae
 XOfpLg6L3iEX7V+Wt/pk0LuHozTX7Cvu/CJcufi9H7bvxLg23m0EbV+37xRn2KHQBv8NeGs+4FE
 IMdNMMxJlO0uA88CnkA2dx/8oEXnrzgzIJ6I3hJoPrQzoZr84Oj1sz8OmnOxP8u3as0jnD3o6k3
 +mof7fsCkdOZqFlxFx/lvb+g2Tyh19a349CwziC3PuR5NwcFDhOcaGSFsqKjgDSz6kI0cTbc1b4
 4Ku0YEEzwRX2FrYp+XEXqcTyxN3JjW6FmxwKdCEwS4U80ICmzKcM9VqkOnilvGxrquSvArsp1Vf
 2bxhmbApfyp6NvokMvrJtW58K0v5ilKaNFQ00PxRODty6wKfgHXg0YEPWVFK3ccpEHOrosl4VgN
 vxjwyd8acECpnFtQJ76BMm7V387li5DujtfGN36r9iE8YSCyVQjuRgtc2/HNqKikVAbG8vbeayJ
 djxiJ0kNGjWeMvVo9EQ==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69ca8b37 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BG8uRRCXphxkixnqWPcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Ri3G3SXqXAyVEkSSsnL9B627E-LINx3D
X-Proofpoint-ORIG-GUID: Ri3G3SXqXAyVEkSSsnL9B627E-LINx3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300114
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100820-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C9DD35D30A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Abhinaba,

On 3/2/2026 4:19 PM, Abhinaba Rakshit wrote:
> Register optional operation-points-v2 table for ICE device
> during device probe.
> 
> Introduce clock scaling API qcom_ice_scale_clk which scale ICE
> core clock based on the target frequency provided and if a valid
> OPP-table is registered. Use round_ceil passed to decide on the
> rounding of the clock freq against OPP-table. Disable clock scaling
> if OPP-table is not registered.
> 
> When an ICE-device specific OPP table is available, use the PM OPP
> framework to manage frequency scaling and maintain proper power-domain
> constraints.
> 
> Also, ensure to drop the votes in suspend to prevent power/thermal
> retention. Subsequently restore the frequency in resume from
> core_clk_freq which stores the last ICE core clock operating frequency.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ice.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++--
>  include/soc/qcom/ice.h |  2 ++
>  2 files changed, 81 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index b203bc685cadd21d6f96eb1799963a13db4b2b72..7976a18d9a4cda1ad6b62b66ce011e244d0f6856 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
>  
>  #include <linux/firmware/qcom/qcom_scm.h>
>  
> @@ -111,6 +112,8 @@ struct qcom_ice {
>  	bool use_hwkm;
>  	bool hwkm_init_complete;
>  	u8 hwkm_version;
> +	unsigned long core_clk_freq;
> +	bool has_opp;
>  };
>  
>  static bool qcom_ice_check_supported(struct qcom_ice *ice)
> @@ -310,6 +313,10 @@ int qcom_ice_resume(struct qcom_ice *ice)
>  	struct device *dev = ice->dev;
>  	int err;
>  
> +	/* Restore the ICE core clk freq */
> +	if (ice->has_opp && ice->core_clk_freq)
> +		dev_pm_opp_set_rate(ice->dev, ice->core_clk_freq);
> +
>  	err = clk_prepare_enable(ice->core_clk);
>  	if (err) {
>  		dev_err(dev, "failed to enable core clock (%d)\n",
> @@ -324,6 +331,11 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
>  int qcom_ice_suspend(struct qcom_ice *ice)
>  {
>  	clk_disable_unprepare(ice->core_clk);
> +
> +	/* Drop the clock votes while suspend */
> +	if (ice->has_opp)
> +		dev_pm_opp_set_rate(ice->dev, 0);
> +
>  	ice->hwkm_init_complete = false;
>  
>  	return 0;
> @@ -549,10 +561,54 @@ int qcom_ice_import_key(struct qcom_ice *ice,
>  }
>  EXPORT_SYMBOL_GPL(qcom_ice_import_key);
>  
> +/**
> + * qcom_ice_scale_clk() - Scale ICE clock for DVFS-aware operations
> + * @ice: ICE driver data
> + * @target_freq: requested frequency in Hz
> + * @round_ceil: when true, selects nearest freq >= @target_freq;
> + *              otherwise, selects nearest freq <= @target_freq
> + *
> + * Selects an OPP frequency based on @target_freq and the rounding direction
> + * specified by @round_ceil, then programs it using dev_pm_opp_set_rate(),
> + * including any voltage or power-domain transitions handled by the OPP
> + * framework. Updates ice->core_clk_freq on success.
> + *
> + * Return: 0 on success; -EOPNOTSUPP if no OPP table; -EINVAL in-case of
> + *         incorrect flags; or error from dev_pm_opp_set_rate()/OPP lookup.
> + */
> +int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
> +		       bool round_ceil)

Any particular reason for choosing round_ceil? Using round_floor would have
saved the need for caller to pass negation of scale_up.

> +{
> +	unsigned long ice_freq = target_freq;
> +	struct dev_pm_opp *opp;
> +	int ret;
> +
> +	if (!ice->has_opp)
> +		return -EOPNOTSUPP;
> +
> +	if (round_ceil)
> +		opp = dev_pm_opp_find_freq_ceil(ice->dev, &ice_freq);
> +	else
> +		opp = dev_pm_opp_find_freq_floor(ice->dev, &ice_freq);
> +
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +	dev_pm_opp_put(opp);
> +
> +	ret = dev_pm_opp_set_rate(ice->dev, ice_freq);
> +	if (!ret)
> +		ice->core_clk_freq = ice_freq;

Nit: Follow same error handling pattern everywhere in the driver.
	if (ret) {
		dev_err(dev, "error");
		return ret;
	}

> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_ice_scale_clk);
> +
>  static struct qcom_ice *qcom_ice_create(struct device *dev,
> -					void __iomem *base)
> +					void __iomem *base,
> +					bool is_legacy_binding)

You don't need to introduce is_legacy_binding.

Since you only need to add the OPP table when this function gets called from ICE probe,
you should not touch this function. Instead, you should call devm_pm_opp_of_add_table()
in ICE probe before calling qcom_ice_create() then once qcom_ice_create() is success, you
can store the clk rate in the returned qcom_ice *engine ptr by calling clk_get_rate().

>  {
>  	struct qcom_ice *engine;
> +	int err;
>  
>  	if (!qcom_scm_is_available())
>  		return ERR_PTR(-EPROBE_DEFER);
> @@ -584,6 +640,26 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  	if (IS_ERR(engine->core_clk))
>  		return ERR_CAST(engine->core_clk);
>  
> +	/*
> +	 * Register the OPP table only when ICE is described as a standalone
> +	 * device node. Older platforms place ICE inside the storage controller
> +	 * node, so they don't need an OPP table here, as they are handled in
> +	 * storage controller.
> +	 */
> +	if (!is_legacy_binding) {
> +		/* OPP table is optional */
> +		err = devm_pm_opp_of_add_table(dev);
> +		if (err && err != -ENODEV) {
> +			dev_err(dev, "Invalid OPP table in Device tree\n");
> +			return ERR_PTR(err);
> +		}
> +		engine->has_opp = (err == 0);

Let's keep it readable and simple. engine->has_opps = true; here and false in error handle above.

> +
> +		if (!engine->has_opp)
> +			dev_info(dev, "ICE OPP table is not registered, please update your DT\n");

Since OPP table is optional, I don't understand the reason for requesting the user to add one.

> +	}
> +
> +	engine->core_clk_freq = clk_get_rate(engine->core_clk);
>  	if (!qcom_ice_check_supported(engine))
>  		return ERR_PTR(-EOPNOTSUPP);
>  
> @@ -628,7 +704,7 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>  			return ERR_CAST(base);
>  
>  		/* create ICE instance using consumer dev */
> -		return qcom_ice_create(&pdev->dev, base);
> +		return qcom_ice_create(&pdev->dev, base, true);
>  	}
>  
>  	/*
> @@ -725,7 +801,7 @@ static int qcom_ice_probe(struct platform_device *pdev)
>  		return PTR_ERR(base);
>  	}
>  
> -	engine = qcom_ice_create(&pdev->dev, base);
> +	engine = qcom_ice_create(&pdev->dev, base, false);

Change not needed as per above comment.

Regards,
Harshal

>  	if (IS_ERR(engine))
>  		return PTR_ERR(engine);
>  
> diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
> index 4bee553f0a59d86ec6ce20f7c7b4bce28a706415..4eb58a264d416e71228ed4b13e7f53c549261fdc 100644
> --- a/include/soc/qcom/ice.h
> +++ b/include/soc/qcom/ice.h
> @@ -30,5 +30,7 @@ int qcom_ice_import_key(struct qcom_ice *ice,
>  			const u8 *raw_key, size_t raw_key_size,
>  			u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE]);
>  struct qcom_ice *devm_of_qcom_ice_get(struct device *dev);
> +int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
> +		       bool round_ceil);
>  
>  #endif /* __QCOM_ICE_H__ */
> 


