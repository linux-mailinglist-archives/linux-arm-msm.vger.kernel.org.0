Return-Path: <linux-arm-msm+bounces-94520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEwOCb/1oWlpxwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:51:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 934C61BD1AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C92C3083E37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536363A1E9A;
	Fri, 27 Feb 2026 19:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEXTWPID";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DxasuhdM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2457B466B4A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 19:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772221655; cv=none; b=D6NbCgqvX13Wi298elRBZrlPHHsFXsyxSqk79PPR/tjohcrW3q7hFyEvFmbe9Cs7o87IBBBU/E+LIedVLvrHE52b1E2qYqzJWRYAswaRgZ2f9OzOB59SICUWRGhLQN29WXxzGWeK9cEMnb+zfhtGebrkyWON001kLpyUvXVIGhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772221655; c=relaxed/simple;
	bh=SnUL9GTNV2+FoDzrn1Npu2O/A7jIQFDQlI2S9X5xC1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwoeTw0jQ9j5dwD7Nzww/8bwqNvu75fZTY31Aypej+OdbRcFvWHZY5LYLRDZCVSdk6qgg8+PmS4hUa5mabxixzXSTQLB153czg2+YtyBcTFRukUTcVNVmCkCPZ1lwI0ixEdFgSSFXUuPmXzRLF7sCbZFTi9wxI0sNkzjFulX6Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEXTWPID; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxasuhdM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0Gbx702145
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 19:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fjKIrtvFgR9DYYTQ0bwG9aYI
	Dg7y4qtppBgWi1AlR6w=; b=pEXTWPIDLKxrtsWVUAnUS07wvgPhnNuOFYu8nVmB
	i6gjSdvzFQ1IPMsbXsaMNKCBO/ugGovL/dhCzEaZDO8hMgL5a2ZSVBjCZgELhi2i
	3rBZyVnriP+lEe506J/2uGo4Lctl11woSUzmnZU5m7KNDsHEvnTMFTqHcCxJpfcY
	Gxdqt1M4H/c72uQUz9L3xsPRe3KkO1sWw982+QHVpYQup60Zbtsw8fWSEAEqD8LD
	Af65V8AU21jvB6kNHkUB50+E8ymThapyjogajQsgujHwIzku5AqhZ9OmeFE+Gaxs
	flxism9yc6E+LVWgmYQ0j0AFvVKwwnpAIi+j99iBNve8xw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck8x89xxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 19:47:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb706313beso302096885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772221652; x=1772826452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fjKIrtvFgR9DYYTQ0bwG9aYIDg7y4qtppBgWi1AlR6w=;
        b=DxasuhdMRwMi/+s3/NxkU2zM4cQ9xAlIvSsM1e3/AKktopxbMT/sLvPEIQd4NXmJ9Z
         6kl/4F3WJ9G1C/Oq+9eYpczdctEJChavfcftmYNmRp5YRrGVYuyYWfZJDOu4pf/ddxnr
         abAaAheJd1wUxuABnT2tlyugfW/SmMUS5H1yJDMhRCcojF+klmjHn1dV1ZhMLVzyAtDX
         KoQ2e0TAquQ34TxsFWsVrZ61gs6GbZIsxwlBq/ovnZkI6L+WcA1qN3FUQlHHCN4/++fd
         Cl5wTgcSeUYKohQDbQAoo5lLb7EVTcaZru1g+jvD5w+e7lGqyEHOn/OLjCcHw4JpkBBO
         E/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772221652; x=1772826452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjKIrtvFgR9DYYTQ0bwG9aYIDg7y4qtppBgWi1AlR6w=;
        b=xRkg3NfkxQ6RaWbHPyv4tWNxD/+0/FdFulhWbtxblEBVRamOYvTUbPeCUwSNzaqHx0
         qVrLcySEhrknPeJcKuuJvcg5qQBsP17FXMrdbySYTUAOOtl7QgI4u8z3PZKycRU5+pwt
         BKAUu75yh3ZQRRR70Fq6Q4zKEx+lnpUtMzLBEkvoSECCJ4QaQ40v0HOnzooU3mOOYnYH
         GdhCA5m0wy5jpdXCkOoTQb7FN5rQVFLCFFy53++7CyngdgEqGx8bZfkCJwTbeHk8RoaE
         BscajSU6lxvL0qoVvNrJr4kBJRubzDUvBzZhrKpPJ4gcPvF3OKleGlfpTloKKc+3Fwmu
         oRzg==
X-Forwarded-Encrypted: i=1; AJvYcCXHv4cX2BqGTMBLtUXNEMejokc060tJkMasiQh/OVpFb9+AJD2AE1fn6pPXzD5IkVaLRtV+bGVyIpFzNXff@vger.kernel.org
X-Gm-Message-State: AOJu0Yya/d5/TfUoFi51r7DCCuNeMCWcaKT+vJfOUldxbm3J2+nOLxcs
	KH63Y1t+fKZUH6DBXApxyB3lbcE8aPlzxhBhKQXpjKzdKemXBItfUPhBoDgxBO0CWcKshIAnYHS
	OK3LY1cwxLrv+LAKtNWV20u+HUHEFDZxg2UGFkxNh3OO+9rOEb+VRgWzR58eq2ctawYf7
X-Gm-Gg: ATEYQzzuoeHmgYOAH6ttjQtMvL/gAuBCT7uLvJGmF7WB7ufDojNQb/MUlmw6pRjfaQ6
	vZ2IAizXy+1lcWOAnjknMOjxlnRtwPnwrUHCQmKNDPl0oB4x5gMK5EbDK3pBpR8Cjw+NyifXjVT
	sFfTnbWN0gIbf6y+FOkBlFNozMSxNlc3Q4FkU5/O/A3ppULshv/qREHdZjwnWVJsMpmihq9VOtZ
	Su3nVS4eu/HVHEUatwSU+vCWgoX4KjY5VbieMRLDfBcfO6GthAuktS8M7n0b3VJ66tmN/8bwKWD
	bms3V1F8uKSDZxon2SFXY3MiITIOx05WoGz6cYORw+qrRot/CA6WUYYWyKXkUPGQvT7LPRMeGem
	AJNDMDYCJjbAbaaf00Y7biFK/DCWvVEX8KgXTbVklIwdVxXH7SmJ7r0rnOKvyKRyp8/3aXBZD+G
	Ve+mB3jS5QpY2DPxeEQikoAqn13xD9JL4IlY4=
X-Received: by 2002:a05:620a:4502:b0:8ca:2cf9:81a3 with SMTP id af79cd13be357-8cbc8f15172mr503266885a.40.1772221652129;
        Fri, 27 Feb 2026 11:47:32 -0800 (PST)
X-Received: by 2002:a05:620a:4502:b0:8ca:2cf9:81a3 with SMTP id af79cd13be357-8cbc8f15172mr503263385a.40.1772221651605;
        Fri, 27 Feb 2026 11:47:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a109e05948sm2080762e87.42.2026.02.27.11.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 11:47:30 -0800 (PST)
Date: Fri, 27 Feb 2026 21:47:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: ubwc: Remove redundant glymur_data
Message-ID: <pb4cfoibnc3dzkavhtaauqvucqfqf75knpx5moacmrfpqmiubi@b2dqxqu4xri6>
References: <20260227175613.164637-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260227175613.164637-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227175613.164637-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WZwBqkhX c=1 sm=1 tr=0 ts=69a1f4d5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=6k0scYfZnCyBalrTIyIA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3MyBTYWx0ZWRfXyPOFHvJTvJ4v
 x1Ain+rhWuxX1pBO5Ifh1XghDSyzp1kv4nDyBxAo/oonpHUL6Q77S+mA7DKmFUyK1AOoreKX4G5
 odZ/VwYyNptQ2YjxsHmg1QUofDlxJWXgMyDrw7US1Jdrl9UuK57/OQ5b9eghKWOJATuMKYm62G9
 L0ihISpYrVvDFjNoylS93Fk0ua7vMkcfH0te5b2BHI0AQ5AGDDo6EpQwhha3d77tKMqDE+FiXVl
 FE2L+Xmc5DvnukV/wf2IAmz3lROVRsha3ROJuqNuM/EMCHetyPnmaywKCgWIz29SG+7Lp+XyHJC
 Lc0rCRW4JjKTgS0s8EDSjaXr3GISa2LdYTGMw6z+oF62yCoQ3LiB/t8LQDS4qntk+KAmk563urA
 ieVJw3koC9TKnaFYwWUsXyZwvHQ4N0hsHc9Yi7oH+xBdeKFqqjKS+ebxoCRJ5gWBU9izJzdeXTm
 vkHRloMLAlMmm5/FizQ==
X-Proofpoint-ORIG-GUID: zy7wD_5SGP6gFPLbz-K5W24Q2wwV25yD
X-Proofpoint-GUID: zy7wD_5SGP6gFPLbz-K5W24Q2wwV25yD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270173
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
	TAGGED_FROM(0.00)[bounces-94520-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 934C61BD1AE
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 06:56:15PM +0100, Krzysztof Kozlowski wrote:
> UBWC data for Glymur is exactly the same as one for SM8750, except
> representing same ubwc_swizzle with value instead of defines, so reduce
> code duplication by reusing older entry.

I'm sorry, I'd like to ask to defer this patch, we are discussing
whether this data is correct or not.

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 63e77fceb6b8..eb71b2356c75 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -208,16 +208,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
>  };
>  
>  static const struct qcom_ubwc_cfg_data sm8750_data = {
> -	.ubwc_enc_version = UBWC_5_0,
> -	.ubwc_dec_version = UBWC_5_0,
> -	.ubwc_swizzle = 6,
> -	.ubwc_bank_spread = true,
> -	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
> -	.highest_bank_bit = 16,
> -	.macrotile_mode = true,
> -};
> -
> -static const struct qcom_ubwc_cfg_data glymur_data = {
>  	.ubwc_enc_version = UBWC_5_0,
>  	.ubwc_dec_version = UBWC_5_0,
>  	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> @@ -234,7 +224,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
>  	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
>  	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
> -	{ .compatible = "qcom,glymur", .data = &glymur_data},
> +	{ .compatible = "qcom,glymur", .data = &sm8750_data},
>  	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

