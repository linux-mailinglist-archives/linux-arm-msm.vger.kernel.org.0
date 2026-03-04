Return-Path: <linux-arm-msm+bounces-95341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Pu9Jko8qGl6rQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:06:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB898200F3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AC7830191B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA554372EE5;
	Wed,  4 Mar 2026 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGCPAMpa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UHsjJz76"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855943368BA
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 13:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632743; cv=none; b=EfNJ8RPcmdPzaVyoOCxLWrooupis+tSQQ6mFz8EMh2QGgPOtB0SMvhVS0uCBRoG6lzJG5pRo8t0MPSxPoflqoXMjdSGUGcSB0bmpN+BXZdQ2DLLal4NcGHphvZ3ukFY4v2RbUzWKA3r+K75X8W8NZOo9+j7DLQRv5Nk1KauZwUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632743; c=relaxed/simple;
	bh=uzWE/ay6u2DvkLwX9A8pC7GUSE4AkJIfHhVvNoNtVwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tpj0oEQgHnGkNsSSbMZ8Jg7uvkNRZ7sVS68ggaLld2wYRAEusMSLBbJkKHe0rO1uTqwhy1BtimB/IuPkH3FfhYKuOUiJhnMYwGURBbzDT2wqOuKRyN1TzsCPE57FO+neMOAPuK69KibTSmsQPKq8QB2InyCz72yyBd+EP1xqiQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGCPAMpa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UHsjJz76; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CamgE1421862
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 13:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U7dURIckBm+11kzsdxwpPLsV
	Ye086yDRD1pOrWSULIY=; b=iGCPAMpaXPjjb7k+N9YtGTCdVuZiNv/OMMRQqYDq
	T8J8v816wGZmbgLB7Qru4bal1KfbqYvS1DdIMLcl8Y9AaoqdrbXE8rgWB/rWpWe3
	teto/vkpEKGj7TAyVpOSt6CRNPDDN7ghEj/5/x6nGvrvnAuBBN+davHcrS7PW0xl
	/JkDYAEuoGvgHVpRKcQl1loGCE7NXqOxWbZ1xtm8l86+p/s0Lf8ztE+CEnjxZmO6
	VlwD67kRH3Pnx7pohCtgxLcFm8HHbUkSFdUtARMrH6RqWO2buXQk1E+eBc3rxap3
	4NIBxsh1dBpu6aCl7HcmUfdjnQmmheUYavucrUFSPUgypw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u1ktg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 13:59:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb403842b6so4942422185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 05:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772632741; x=1773237541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U7dURIckBm+11kzsdxwpPLsVYe086yDRD1pOrWSULIY=;
        b=UHsjJz76urit18iPXzwgM9WeeDy5B+4GRokksk46y7LKswrAJ64ZYsRe8tTkFczozA
         wjuCj3ycZrS0zSNWS8OQPTMlbLWydUQBwZUfofanAEouKU1il/uzsLwB2PbJ5iRvvqNQ
         ZXnrY8/IByCFBd1tkcgyHBuajFowyKsv9D0BiaZqACDlc2jo8Avz1RMDof5d/YlYreCS
         giLcJZXCYJrontvkE1ByxVe0kyul7Qg1y1maqO1JavhotsxAHC1EXSB6c/KybdVJZt1q
         RXcV5Wn62l1A4iySD8aBCf1F+jphFHdsG9I2ZQFifRhnTpzAVUP2TgMF6jJBOq2/kNZD
         Z6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772632741; x=1773237541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7dURIckBm+11kzsdxwpPLsVYe086yDRD1pOrWSULIY=;
        b=TE1VqyokYruoMUh85/j7lD0fnvJifio4U7nBOOIr0V71AeWavjwnB7R12X4Jx2dQXd
         CdC+lelnXaVa6cbPgFX178SlxpmWl/yxdUzz7XdizJt1NNMhsaR6jkD7/+hu7w4+ofKI
         1q3SmMVYjMUdRgwtLHJtwi91/blioDbPX0GVWs/bXixBIPlNu8tGk8ODXDzeJSC51x6f
         Q1TA5VXEo9EGTdzBvFFfC2SGQq4fsHDAdmyfqseJBc2UzGkg+200IT8WsADSqfL5221r
         O2CR70sdCU5prln1PMfSc7bpx4WtAOLCWytYsDeztDSGFM/qEZmNC0CrRRa+H15rH049
         hjLw==
X-Forwarded-Encrypted: i=1; AJvYcCWcigqhdCyv8MQCTWZ80YthsHxlsxkUWPDtOdRo0ixATFOtVYOpF8WVL/q1TUx+7X6psnG5lhP8zKgNsfCh@vger.kernel.org
X-Gm-Message-State: AOJu0YwQtGRplB8M1zx7/4Z5CHQp7o3WjVSQCrAFJdGaFlMyO906W420
	1KrgbKjroGxS+HWXrZXYU9mwZdVVeWDHKMG2M+8/WJ/vBaYTjUfCEjbvFcDNIwN53USTtSbPLmQ
	XLqHMTxxr8bcK2LgRe4lX0PSz61s4jkK8QrrGreDvP8A8A3L6eVRYqwirdQpGv5D/kkta
X-Gm-Gg: ATEYQzzmPTTSfXGzG4yq0EF3MulpJTJOLkYMw90rDLnlPzPcZtPOqXw7thy4R8AhnCi
	z4+k2nzb/+All/ZbwDI7c/HTZQorGLIbvIs0k4htd9cGSPjqsG6d1nROJea+iGSWgYiBwoxCbrZ
	vwXbLoC6ByxMBLbvwUCFwxRyX7Oj8F6snj994NaCrYsq860g54koMRgw6XDvxiBS5EBaHcTOYQd
	cRTAeCb/fb7igO7sxA1TfHRSuM3acibOKFJzqJ/ro/xL6XMCXv34xbA6MbNpnlhUgSiLZxwq3hG
	msfs13EcZruC8tD2r2XgwRNrMApT5onZgC9tUaeKaACA81qK51ECCp+/fKUs34jbfFJTeAboFIL
	Y+PFoXb4QJdYC1vcrFyzqhFv7qJsRqrlxobSKhzKQcN4rHFnJDa3cfvVQOgmka8+O4yzL3eMTDQ
	LKUnu0KrCHBIgOYCYX18qmSRiyykiknC0SyNk=
X-Received: by 2002:a05:620a:318f:b0:8c7:1119:2994 with SMTP id af79cd13be357-8cd5afa9ecfmr237118885a.64.1772632740830;
        Wed, 04 Mar 2026 05:59:00 -0800 (PST)
X-Received: by 2002:a05:620a:318f:b0:8c7:1119:2994 with SMTP id af79cd13be357-8cd5afa9ecfmr237116585a.64.1772632740365;
        Wed, 04 Mar 2026 05:59:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123588ffcsm1318304e87.5.2026.03.04.05.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:58:59 -0800 (PST)
Date: Wed, 4 Mar 2026 15:58:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 6/8] soc: qcom: ubwc: Add configuration Eliza SoC
Message-ID: <n7xd4svnk377y3jidocyi6mtncqy3nvnym7vvmxv3v2wolumq7@daasfxggcbyl>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
 <20260304-drm-display-eliza-v2-6-ea0579f62358@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-drm-display-eliza-v2-6-ea0579f62358@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: i5HAZffwWah3quBa1zHf2F3ai6Ci1TBl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExMiBTYWx0ZWRfX+Mxui0Fbsyh4
 rBhbeMRqJInA7ZteUkqcdI77TKOL8pBTYD19CJYfiiUTvFmg4oct8v6VblqnMkcUysayweW8xdS
 k11++Qbu/URJE5RHsG3b0NpB3P68VZ+Gw2lTc5R7/Ps8rX/Hen3kO9OHYmq9kztdz3TGTgjzH0T
 Qau9HliQZA3I34rGUAo25wtg5dlQ2t3xfa7Tw3TkXQCrNgAiIICBAJREiwrduTWQXswMxdHrp30
 hosqvRQi6VWTPfXzxpX30LUidtncfp/C8VMroxEi0f1bJqcWTRIATzl/XbtShaHEWFqg7rTud1q
 JbD/OJPXlAV5PuMkJ2BHGWrZxCO5xDZnK4cIS1ksPe2ZNXTqXWBe9Fm6tvndUf3ibeijPPRQCQI
 eh4N8HrOQmxGFEMk/S1b1V8v2me47eRWeDJ6oTN12jwKs/sMs3S5ChkGaiWLng0Dgtt18GbUiS6
 HWNBznYwKOcdtJP/ojg==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a83aa5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ofcykXZfb13_7XvavCoA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: i5HAZffwWah3quBa1zHf2F3ai6Ci1TBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040112
X-Rspamd-Queue-Id: EB898200F3D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95341-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 01:58:48PM +0100, Krzysztof Kozlowski wrote:
> Add configuration data and an entry to OF table for matching the Eliza
> SoC.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Use data from manual (UBWC v5 as pointed out by Dmitry, but different

Why is it "but"?

>    highest bank bits).
> ---
>  drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 1c25aaf55e52..633d1efa0883 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -16,6 +16,16 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
>  	/* no UBWC, no HBB */
>  };
>  
> +static const struct qcom_ubwc_cfg_data eliza_data = {
> +	.ubwc_enc_version = UBWC_5_0,
> +	.ubwc_dec_version = UBWC_5_0,
> +	.ubwc_swizzle = 6,

Please use defines for swizzle levels as the rest of the file does.

> +	.ubwc_bank_spread = true,
> +	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
> +	.highest_bank_bit = 15,
> +	.macrotile_mode = true,
> +};
> +
>  static const struct qcom_ubwc_cfg_data kaanapali_data = {
>  	.ubwc_enc_version = UBWC_6_0,
>  	.ubwc_dec_version = UBWC_6_0,
> @@ -245,6 +255,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
>  	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
>  	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
> +	{ .compatible = "qcom,eliza", .data = &eliza_data, },
>  	{ .compatible = "qcom,glymur", .data = &glymur_data},
>  	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

