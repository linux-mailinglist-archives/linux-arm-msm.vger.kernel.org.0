Return-Path: <linux-arm-msm+bounces-96795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CPKI8rFsGnTmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:30:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 339CD25A585
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45ECF31505BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1D3367F47;
	Wed, 11 Mar 2026 01:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IP7ttoWV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBotim0g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B90612B94
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773192641; cv=none; b=epspqNTbjDu1llLv/zQFsOnG2iXt9A9XiAqyxX66SxfJBDkQcUFmTNvJsyuy1M5T+/Ha7AKm6RprvI232VGi4hkcRDsHFFwAen+vlL5aPlJiW6IzfgvzlLIizIwqEX2n+10gKSO4EMWpqXY5ZReR0LS2FbjwcFtDDclNN3htHZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773192641; c=relaxed/simple;
	bh=ihJwfkzCs6BdMROR1EIEVe2OLNg0Qq7mc331gjk2O1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oeqlqrhNwzLWh2XLEeogGuJhHx+r9iiLP5cj+B5JpjdpEaDlJQquIwV98UZLdLxbP5wsewn2wYyos6xxk8O9YQK+QXsoAk4iqfqj0nz+EUfjge/RySKk7gsKgZmpwaYVJtSpuOKNmuhZnQefPle1YLMNkXAYJUu84T2oWCsxMKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IP7ttoWV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBotim0g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHd1oB2179858
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sT5IPYC4UnHqleGHP2h0UMI6
	i8sGmw3mElFsaqMjQfE=; b=IP7ttoWVPFDuYr7uWvQibNLDhF0OpKAYEs8F1ucj
	z0stsDmpJgQG3JAEpH8F7LB9ZTxyoi8KRwXr8lbn99roqmQAFvVpFpkOAInKe7Be
	AnuXPQqI7hT9Gi9ElBA35BhMa3zWEEIV7o9K4mhskk2w1HbGM5PsGUZTX+8vnCvY
	GczdHEO7IhL6y2L1N6HcP2r+Dw9TYiYQG53es8Xg8dJaurEaOX9JYP9NoINrO6Xb
	T1d+dWIkiT5H7lsYNxCKxslAwuUcwyRoMurB+PM3U2lmW9uxZoLIW7bLM8geUQKW
	vnVGoX5YnOdXNj9Q9c3g3B8sVef6ici/cVQdJYBAzGcS8A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqvssc5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:30:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091782ab06so83352001cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 18:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773192638; x=1773797438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sT5IPYC4UnHqleGHP2h0UMI6i8sGmw3mElFsaqMjQfE=;
        b=LBotim0giWLeTfkWW4/uAZ0Vdal68I/2W6FPSUpm+HamIlxhXqgWmRFn83wrRFWX1f
         0bC03GhzSDD7I1I2DFxpae/L0w/oYlNYOwUx/zioeBXN1eMRwzDSkvycYyTVADgLY4ea
         bpnxmByeM75vNzLluArKJcslS3fGLPL0J0GTSaG6xojW0rckw2rHB9SntOPrRHPHP6Uu
         n8cmvcPwb03f/8x9GlAtm851ehj1WZBzaFxkTRONihDZYxZIs+TwvGX934W7ut8DnRO0
         EGU7a7NMjOu7D1MfyklgeRePTSLy2aTmgiDfLnzAghsCiA2taC+Xx/nKcMOkn0zLcDmG
         D6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773192638; x=1773797438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sT5IPYC4UnHqleGHP2h0UMI6i8sGmw3mElFsaqMjQfE=;
        b=iBz86a7tkUpUrPXxSQIIT9xtQih92PZ3du0IWLMt3IAYO+srUiDER0nfDL20LHEHH3
         3X9wyI+JlZIOXbonh37EPNysdPulGramGh4GoUND/VYhWjKZudlqILKO7sAIJlG3/wyo
         k2OP+HYiRte25ZqbmYQcsfnsSdfIppBQvUgKCRNvK1IiJz9lgCvuUPoXnxfpDuU2feUU
         4yLI7ClGtPh28GgvDA0Ze1LKTmvmwZS1bnc4Yw9AcUUbQCnAFkB0rtBdtgk/W3Ba/qNk
         0FXM+zADYOolmOXogAC3ji1eIq5HtzkNOpconsG5JDhlhkdR6KkfsyH0YwGvPs3ZLNxP
         Hh8g==
X-Forwarded-Encrypted: i=1; AJvYcCUMJOY1E/jpFnvqMxxaqqwZjS4g1yCfw+5TojxcCVXmJoLItbt1KQvRh9VTvI8RbZ/+7wLN4nfK54mLILO/@vger.kernel.org
X-Gm-Message-State: AOJu0YwtHmZqiwu5vn2JMuYllUB2AzIOkayMidWcBqdxURuxCr573aSz
	zswj1GP0stDJISnsBGdIvxcDFj98rm1wjOfxBEL4ALArhsvUpkTlnccTg3GU6p6dCPglk+pwOfe
	Q/S2FaqaVBh9WK+FPwx3crZzt9JNBn/OdN4xlkU8jH9J44lD4ReslA+HyYSAKDnOOVxq/
X-Gm-Gg: ATEYQzw/xK/iB3tQwA3BjDqyLJmh91kDlMkm7EfZRpJvKXTWvNP7MVS+4dgD9niznyk
	ODDN59cwaMxkonTDFJIsQrSIXsq9K4eEOqCHfsA8jgGl4oei3oGH5n3avLGLsgb94/3146oEyxq
	GPV4SKHYogygskJQXmA+VWZvAPIJta7y33dR4LeZTGJpR7mxVLpiiuyC+gXlhUW3YNB2mBOdUu1
	dZQNdIvC48u/Oj2uIh3sllh6iA2NwC+RE+ieKQzDQL4FN8twFYXbB3Bi0tJLhDdTeOfxprRsz+6
	Zkyhxgt1ZU+dLwJagp4JaHMQmJuxXy5RQZcrNVI7BXXHRsi7WyklxFJgT2aJQN83OMAN7pqp3nS
	RWWyGPI0Ah2p/bU6uJD4/RXRKyENhhkkD3u81HDW9T2+fVdxpoC2TlI9/VK+KR/CSKYzOPj7/Or
	CWfKyzNc3Rp7wbwxQRf5PML5gw6jaguwBLCtk=
X-Received: by 2002:a05:622a:64b:b0:509:23c5:3298 with SMTP id d75a77b69052e-5093a1cafcemr10426901cf.57.1773192638393;
        Tue, 10 Mar 2026 18:30:38 -0700 (PDT)
X-Received: by 2002:a05:622a:64b:b0:509:23c5:3298 with SMTP id d75a77b69052e-5093a1cafcemr10426521cf.57.1773192637985;
        Tue, 10 Mar 2026 18:30:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15603487bsm134034e87.41.2026.03.10.18.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:30:35 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:30:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/7] slimbus: qcom-ngd-ctrl: Fix probe error path ordering
Message-ID: <mliitly6dwqxvm5oz34ipnigjlqddbq3tjlzplq6z53zptxbyq@jcftal2n3u6z>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-2-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-2-5843e3ed62a3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxMCBTYWx0ZWRfX0BM6ZOkrDjJ6
 trgMauUmJlyXHVpKGWwHrD1pDLL/VvrAWklXEpjk6poinoLMwxMgT3VvHEttzYZ0+mkU6oeNPKh
 fijtl+cbdomZi8R4GDt3Y4snRAbcJqeFYX6tQObYln2AkL4ZAds6vVHMcJz0chwgGvYUpiJDWH/
 F+uunTx9CbpmC4KKVz75R8Fixduct2ahCXPML7ACFpTplzrRS21qlHX9AL9inmtzDBmkq3SBnoi
 CGV6eeRvF9iBfe/1eAesYz0k47aWLvIhaiyTF+Ms2hMaRhEOPcMHW2tEW12OQzNghExdR0rLe8S
 iEM/084/AOGetYWlnufC3PeJxfFP8/tejNsOFtessn4HGFo3sQxB7mTAUqdf8Qa3QGJYWVTtk8D
 sNPN6dnx6HS5c6CMygKFM94DZcmEswulhTqN66OkRaeW+Dn+htbRxQeyj5mctKXakLbmwNLpwha
 MxhS8u2oiHg1SZEsXaA==
X-Proofpoint-ORIG-GUID: BOjsWsGinpZCb11LHfgDBykaYw2YTd6D
X-Authority-Analysis: v=2.4 cv=Lo2fC3dc c=1 sm=1 tr=0 ts=69b0c5bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vcyf5Ab826s2KLMX7cAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: BOjsWsGinpZCb11LHfgDBykaYw2YTd6D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110010
X-Rspamd-Queue-Id: 339CD25A585
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96795-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:09:03PM -0500, Bjorn Andersson wrote:
> qcom_slim_ngd_ctrl_probe() first registers the SSR callback then
> allocates the PDR context, as such the error path needs to come in
> opposite order to allow us to unroll each step.
> 
> Fixes: 16f14551d0df ("slimbus: qcom-ngd: cleanup in probe error path")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

