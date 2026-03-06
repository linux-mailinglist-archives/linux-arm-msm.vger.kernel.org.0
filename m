Return-Path: <linux-arm-msm+bounces-95855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCVUJ+zwqmncYwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 16:21:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CB9223AC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 16:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C4D130D06AC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 15:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88A3341AB6;
	Fri,  6 Mar 2026 15:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GAY7zNgT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CqfFH1Na"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F71CA5A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772810140; cv=none; b=bzdRv5rA2bRzKelBJlp1+bNGHgF3tSEIRB0wMIU3yjdzkZzDWv+bSHKe7fbtFNFdcsjV41vw94kPqCvj9OKtxyZka+nTVo+75iriE1fRpoXDR8LroGJCKnX3zoEbwOtg8esFk9eg+7ebU8tOX5kyAgZ6fywS6hrjOXX7UXQk7Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772810140; c=relaxed/simple;
	bh=XVzwNiLldSsdhhqRvyRYaMXIOCMcyeNGsfNXBaUkUiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbPt+f0y6xhmX1ieixwO7P+n9IxLsvUTB3guqj2bISg6bny2ubG39dEjTEVENd/1GrPRhBCr0xGYsVzk6kHWTGdBZdJugRO9nFyFATN07lkCCRKtWKkQbmo9n8d/rMzic+2OF+vrjw/xFtSIuYeqSEkYHsn3HDi4oiCH8uJV8hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GAY7zNgT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqfFH1Na; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BaveI864953
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 15:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X681yIOo+qqbID65Ise1Fd3p
	CUSG08nHfyy9jdVNmWQ=; b=GAY7zNgT5kpFebJgM8Nr6Iww3gfQB0jWdBY0tq5R
	LEvUCcmLTiOoIGfnWS6wrP0YgluWOMUlRbHcIywuDpJjExUyGDZOoj3xm/UCMnjF
	9qUdtk18mhXV3cTDJ3lmB9EVHWIgPE0bY8bu2Nn9RflhKid3wjZ41tr9NQkNv/Qo
	wWsPIzgNkk56v8L0cbIpxgccykTfdhyfR0+fhHkoFS//lW1m0NujUJWpdSnNZwQ7
	WBYnyHNTsDN4Wcn309+N/Wl7qCx6C4twDaJpIz5ZKmX+7bRZwLHpie1s8bFOxrS6
	dmhFv+SNKtx7BJonSMauIM/Shptpzqyz3mCR92bTNISf1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5swjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 15:15:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cff1da5so4901293385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 07:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772810137; x=1773414937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X681yIOo+qqbID65Ise1Fd3pCUSG08nHfyy9jdVNmWQ=;
        b=CqfFH1NaqxWbpf77CLzDBw9wV1/imE4jhWJnjgcztYiAMMb+t32EFz+gDXQjEB4CjG
         GS6OC5bZ0vB/CnqAqlsC5v0F1PHF2Mh+GhMCoG39ejkYknsim6LKiMdGOThT/hEb2mPt
         EEOIPBUy1PmSfA7gBren7AdvrN0aZ91KpjO3cGGJYB1Ld0d708yBsjepUPoUYbFjHK30
         F9CpLtNFrLAJ9fc8q38LT5lad8r47yryHo4PWJqCphD7FLpB6Y9vvFM70sDJQOVm80Yf
         jfbro5Yf31TShfGD4RtHIQnewcQXmsHFLNXE7nVMzMmxoEqt7Bh/8CaReXjrOJRInJTy
         6tbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772810137; x=1773414937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X681yIOo+qqbID65Ise1Fd3pCUSG08nHfyy9jdVNmWQ=;
        b=YfI0UJMxUUFv9HZRg3JJNx25+FqaOaDrK3M8bExcrZn4mwUZ1HrYZEo+s4k+8OJCMl
         k/7uZl/PKmDGFU3lwtOt2GAiJE9BJGknxEkHyHnX83uzhW8zvLPpIgII4xJclybB2peo
         MHr/FdtLG5v6Yp+nU4+ympYtvt0UzK3m7GDXxmkyv829CALoZD/9D9TlJofSG3Rr/0rz
         MG5GE4WcIjibvmEKAKlUaTFQK6qH3HrUL7aT9vEJPoQwNDgLsCvnG9lWZMOcfAnTo45d
         rwYmrbsSngS6vcwCaJAvn5YNrUmbijBbn8RlqEi/zQvLKDzkYEIdBHIYOvyoaML03MC+
         UF3A==
X-Gm-Message-State: AOJu0YyDk8pv3VbXRPwB2tcTDlXYY7Sw/RxLQTmTgTM9iH+bmRX20KQu
	QRevSQDyKXtwyehsc48YFwqHx+DWLU64XQsRZTyIT7CPVGAcdRzjGJ64lWfUMikXMHFU0bTQCQF
	iNdQ7wbW6KkGB50tEvaFBQGZWZad6iIJoOth9OEHKw5MQSsZJQTozbJqGH73LjSHpVmcv
X-Gm-Gg: ATEYQzydtuIx6Fr5RnkxCHLdTVn7f/Mx4KlpB/01kPxxqtTO3IEJ0B0pEEI6NFCboYQ
	MeRKfM6PpplNOok0aEpgnNBxIcbiS+H046SKYvht7280N5QUh63kGRZoabuDweZ97VC7NHB5Xpn
	sE6kapUzr5ztDFdETeybEq6u3neWT2ZhysHkgYQD2W2BpwMSLYJbviYBZqJsKr8zEd90vMf4GrL
	76f0Fh9HNDWANIv53Qv+Ucq8A/nmZIPrFtijS62wUSGapJEKKf5RBCBnolVIjFIMpU1JJ0F6zhH
	4C9rubYpTqil+yGJjsW+KAL9UafRSfWqRPkT7TpvgCc4SpYldwwUjp594yPlXVJRkSQBny9r3aQ
	+Ku8DtmfvBGYFeZtMfD8kP7Qainn+4RK7Zsg5yjw1CpJtdEZwrJnFTOuqf5q9F8EdYnbychdFod
	R079SUOOAA8el+lDmBKQUDiIicyVtCldZ3UVM=
X-Received: by 2002:a05:620a:480c:b0:8cd:6175:9b17 with SMTP id af79cd13be357-8cd6d324d9cmr302259085a.3.1772810137320;
        Fri, 06 Mar 2026 07:15:37 -0800 (PST)
X-Received: by 2002:a05:620a:480c:b0:8cd:6175:9b17 with SMTP id af79cd13be357-8cd6d324d9cmr302248285a.3.1772810136654;
        Fri, 06 Mar 2026 07:15:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a41f9907fsm2821861fa.4.2026.03.06.07.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:15:35 -0800 (PST)
Date: Fri, 6 Mar 2026 17:15:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: ubwc: disable bank swizzling for Glymur
 platform
Message-ID: <guisclar3eonn22vpjbdnzwbztwkrbbmvous7q757lihne4zbb@jtnnmune4uit>
References: <20260228-fix-glymur-ubwc-v2-1-70819bd6a6b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228-fix-glymur-ubwc-v2-1-70819bd6a6b4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: iNpGAQ4LXi-LtHplERKOBF1v2TOmI05N
X-Proofpoint-GUID: iNpGAQ4LXi-LtHplERKOBF1v2TOmI05N
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69aaef9a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=IkhWcgckFE4J5cQLOdQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfX0nEABNXHaP3q
 9CsleLsNsnJFlChzzdOcz0rUCcmWqgYKgsOnaw4H8GcVWR2Yi8HXRLKFtQrcV8yjww2t7XW4hKb
 v8I0o91YU/bih5y1ZX4EI1/0iLZrIe3m8CzEHTwYeAf1u1RN0dFxe5S1myXujEMpkOLMStB7b3x
 AlZKF+UZxNoxyaN4hepZfoZhmeB/Z5HGEsQF8ZikFR45f/DzS8cDyZVdcCcJZGN/ljpCavijlnQ
 2WSSUd0HHToBDh1vDghrV5O2mdYS3lbZSuBZaG+Jk0Z2NFnTZEwcKtFhBlEjWnvEyngaVRKdUMe
 +KFNoosgdAPUS+vzmHuNezO1VXsBsc7lwpdDa7+iCdwA68qF3DA1RlnFP3eHwz3QdAvDO6JKM95
 f0FAbrbPxEOiD7cxxIj7HagjrICF1Voj19Rxawm+s9KSZNBDMYzBSxcwWJsuSLxgzJu/3zpP81H
 nNtFXTX1DEUStKPbqig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146
X-Rspamd-Queue-Id: F1CB9223AC0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95855-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.951];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 08:34:27PM +0200, Dmitry Baryshkov wrote:
> Due to the way the DDR controller is organized on Glymur, hardware
> engineers strongly recommended disabling UBWC bank swizzling on Glymur.
> Follow that recommendation.
> 
> Fixes: 9b21c3bd2480 ("soc: qcom: ubwc: Add configuration Glymur platform")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix the syntax error...
> - Link to v1: https://lore.kernel.org/r/20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7@oss.qualcomm.com
> ---
>  drivers/soc/qcom/ubwc_config.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 1c25aaf55e52..8304463f238a 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -231,8 +231,7 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
>  static const struct qcom_ubwc_cfg_data glymur_data = {
>  	.ubwc_enc_version = UBWC_5_0,
>  	.ubwc_dec_version = UBWC_5_0,
> -	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> -			UBWC_SWIZZLE_ENABLE_LVL3,
> +	.ubwc_swizzle = 0,
>  	.ubwc_bank_spread = true,
>  	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
>  	.highest_bank_bit = 16,

Carrying over from v1 discussion.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

It depends on the fix which is currently a part of msm-fixes for the
device to function correctly. Raised the question on IRC regarding the
immutable tag or any other proper way to merge it.

> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260228-fix-glymur-ubwc-f673d5ca0581
> 
> Best regards,
> -- 
> With best wishes
> Dmitry
> 

-- 
With best wishes
Dmitry

