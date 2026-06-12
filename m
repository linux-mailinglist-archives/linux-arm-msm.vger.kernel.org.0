Return-Path: <linux-arm-msm+bounces-112860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HAR4CkO4K2qzCwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:41:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C3B67756A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:41:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=O5vdU+JN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KizRvwH5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112860-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112860-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38E5F318D7AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C77D3D8901;
	Fri, 12 Jun 2026 07:34:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5E62F6931
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:34:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249696; cv=none; b=Tu5Y5tYCQsk/SbXDTYjSgvFkKcU5Oqfd1R95nWx61uIbEAc3P7iQ/VNImX7UUyoXbgxOpbegIc4DhqmD3eGWvByVvfTdbCETJp8BKjRcWDIfpKVxGATnK90MOPEhjAH21NXkzb6/xv3SeO0UKEGJVARoNgF0rbDJx9pTdCkW9YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249696; c=relaxed/simple;
	bh=auxYFFm0YZwfQ8iSi8+voeCbuSxD6uWCPsxB0cLVS2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lek2V7C79c7pN3itDlPxk2T9+WzvToeIz5aV3A2SdsI7yQSvH7tMRfApyhFU6Ars68DF8UXeQBlofD4CEX0IOrit3bhCHF+q5UhBJLmqpzQnvMKd4Bpec0z8cP1k0Z0PMys2KJwfegOEM3Y0mwvakuUWvob1xeYbrvTxN7eTAmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5vdU+JN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KizRvwH5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39cBl2411606
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TUdmAAe4YiTTXewaVynOkiOU
	7f2S+o+K603g5ty7GQs=; b=O5vdU+JNjHx8xSXpzaIlx8NEJ+7HWOZnA6UR9WIu
	JCY08tbOrGETOPUNJ//zALR6k+plFDaq1hxYq0B28/PqHoRSBSkq+744VXBlqiPW
	3q7dodnVraIS/vfGjoMEUVP1Gd4H1mzqnq2JDTbfduoyX0rJWiPbuZC/FkzAqRSJ
	yA/YOELuQ9LaBYULtAtbhWiKHUyqbMQ2LOsiHu+q6f0uinHOOVqaSnsekHiWnU6W
	Di1+EgIqow0Vo1uCX+tmtgLC0P1NYj+ZeogRQHopOhf4JyXj/FqFvHSmX65hRbNs
	84pxWPCNvSR+yPVh5UglVVQHThD7OnP4AVJszTp9aaXnIg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er165ajm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:34:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5177f07eb05so13209161cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781249693; x=1781854493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TUdmAAe4YiTTXewaVynOkiOU7f2S+o+K603g5ty7GQs=;
        b=KizRvwH5B+IDeVTXfaH+vgeVHAzsgN8OCMcbCx0O+pYU7fbn6BmqMTZPM+3etggH1z
         ISjM1QnYEDvA3fU6KIW108lVWruVnNPh8TFodud/r+zv4Z0E8NKcYthYqlV/JVtrtPKm
         t3nAz+Bz1iDcubS6PRAzyXcM4zd1z9RYjIfSthDgrvTG9tAi8c7W370re1sltaKCp5w3
         HEK9HOWXAXx7HybEuy7u35Q4zIi/QMhr4/sigoPRKwE9BRtv2AXU1DrMFv8PTIPZETsZ
         KD4MeA2lxmb26SOjUrQL/woJ4tQPPdgyISFiYPqGwOd4nnO8enSvjvXEDGy+cQa+/NSt
         tTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249693; x=1781854493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUdmAAe4YiTTXewaVynOkiOU7f2S+o+K603g5ty7GQs=;
        b=qC4TACZPBgeHD2DdFvfqGH7x4ozAI1x4xb/96DbZHEIST+hmVyTXeceBhSMSdJ+n8S
         BwUjpHdH0HvCobvE+nSRoc8Co3/pwGrfSzGiuaSbxvNqBWFsCmRoy7gorsH+YCuE6blv
         MGrb54cZoeyO+XnfBdRBl4VXQgU9fD201S1TJUyYEBMhurMsC/6TByJQ0CwKhDRviWmi
         Kmifc6Wl6zYdQS/v8zSm0U+HQ+Moco0YGuOKDuXjufYFKPVmqoqwcMGdWxhzb5MsM79a
         lgivMk7VSkeJxsn9OwZ/UCJQsLfUToUJJC0HCoPXrOXrilt2IIdprdRU49xrAeQ3TSRO
         fkLw==
X-Forwarded-Encrypted: i=1; AFNElJ8095zQUURIWHYGHjx90BM5eQg5cBRW1CNNjeAjjBoMGbYgHXZDg8jcoeZaqaoWnjB8fFDkeG1y/MgRCNls@vger.kernel.org
X-Gm-Message-State: AOJu0YybqgEIEc7nDn9myzm4DQum1/1V6cjRMqoTHjazbq0JlxjXpk2c
	5dKcWt2FhRF1CjPwMJrFKFAmcVHu/U0+Qn2WJ+DV41Biq2JTpyCMN9rNipz8xBOZbVHZWtlWinH
	nJJzicSfp1tB4GniGUF3PcuQuHeARpsc1v4+oniJ2G6+i+4lk4HEjx7sx1/mkSu+3Gpo9
X-Gm-Gg: Acq92OElXko8ZMJ2Eo/7wh9btaUuDdmTTrnKGyeEBDlPg5JdDWNG2vOnkufexV8pYHq
	8qfDOSh7XnMIHxI8rlTEwaRpKo+6ilh7x/mpZLOqqvPjOrTvgzHifSzDKa/uEHPEtAmKwxDRbw9
	SPYP7WAqAXheK0kQm4PE8EDY6XawB4f3+5FOcSTiv2YMq04opm5zUEsF28EnCCqbrtLSFCTjWEW
	RCH/cRtFmYiXA1v7aPyivmbUXvs6o6L2axa66dJHJdNPaSPPA1rzuA8Ev+609Bx6POijjGFte0Z
	AJ1bBTcLlu2uqIkUs63tgjuuqT0msYJ6jgvlqNLRriaxuMirURhn5xsvr+LIZn9negT8+4bnBgk
	ZnjOBnVL44dKUW1kaDTVt9KoxgNJ8fuxI4xw2joX59F3p5Bx7liqTAPGbYCF69QhS1TR16AUetZ
	0hh0Frbg9zJ/LfMCEQoYSTddNUOfXjh+1MuUM=
X-Received: by 2002:a05:622a:8d12:b0:50e:60d7:b272 with SMTP id d75a77b69052e-517fe52f2damr18313451cf.41.1781249693197;
        Fri, 12 Jun 2026 00:34:53 -0700 (PDT)
X-Received: by 2002:a05:622a:8d12:b0:50e:60d7:b272 with SMTP id d75a77b69052e-517fe52f2damr18313211cf.41.1781249692747;
        Fri, 12 Jun 2026 00:34:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e170386sm306918e87.30.2026.06.12.00.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:34:51 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:34:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: smsm: Increase SMSM_DEFAULT_NUM_HOSTS to 5
Message-ID: <mr2staswedevbpbawd466ml2jhfzzjlubm3t54iv7d2jhlansx@on6dpsbkyltj>
References: <20260611-qcom-smsm-default-num-hosts-v1-1-423b8a25945a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-qcom-smsm-default-num-hosts-v1-1-423b8a25945a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2NyBTYWx0ZWRfX/Wcr1iX/Xi6w
 TcT//D9dnzHhbEue0PagxQbDV5G81R0NkZORtkJr2rQHNe4H7J3JoMTQwxZR40gPwY2pa5H9SQf
 +bjZRi5BWho5tS/FAl/lIaMuFiVmdmjtvuS9i+fwBcsSRCtF90KIc3Ou3a9xGcLcTfNoAzoVckP
 fDQHaHhltGDZKihGusqrXgLR/5bpjaAnygGvvU6GoS3MdcHF8hLjB2Wi8a/VZJ5rrVshyScPCpy
 I0yQhJeNQUzNTS8whtlqWM61t++S84mzQ9XgMZG1k51BC2aM9Fsg4shgWKGYSWRrxAIDR9HNEJP
 SOGCHQy8M6hEW/iavarO/e47Pvj0SPm/blCW35HMnq0i9zTjoVv2CSd3jSKmzkbdFAGBxwzcIgs
 ZVw8vxx3r9oH/JtcixfDLAbPjYrHPXy00ZeoQp7QzTJ3yRFwLGFbrQRr2RSt2jxzQoFJvRZ5N9T
 eqbwi5pEyyA1xH2hWig==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2bb69e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=OpKmcOjKY_n9-fDy4IMA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: SibOUYj7hu2xEa6_dDeweYFsIt7ESdJF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2NyBTYWx0ZWRfX4wwg8EHgBXAh
 vGf0u11BUGGJ3gUOMNgl/CfM9YQfYYzM2cSJACwTMyYUsVzfpxq6dnQfrb2oJzBGRUuszly81r/
 ruY6ETaC0VxqsFOnTeVwTcWeoPT7Hq8=
X-Proofpoint-GUID: SibOUYj7hu2xEa6_dDeweYFsIt7ESdJF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112860-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,on6dpsbkyltj:mid];
	FORGED_RECIPIENTS(0.00)[m:vishnu.santhosh@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74C3B67756A

On Thu, Jun 11, 2026 at 11:26:34AM +0530, Vishnu Santhosh wrote:
> SMEM_SMSM_SIZE_INFO (id 419) is not populated by the boot firmware on
> Qualcomm Shikra SoC.

Can we fix the firmware instead of hacking the driver?

> The SMSM driver falls back to
> SMSM_DEFAULT_NUM_HOSTS when this segment is absent, which causes
> SMEM_SMSM_CPU_INTR_MASK (id 333) to be allocated with the wrong size.
> 
> SMEM_SMSM_CPU_INTR_MASK is sized as SMSM_DEFAULT_NUM_ENTRIES *
> SMSM_DEFAULT_NUM_HOSTS * sizeof(u32). With SMSM_DEFAULT_NUM_ENTRIES
> fixed at 8, the current SMSM_DEFAULT_NUM_HOSTS of 3 allocates 96
> bytes. Qualcomm Shikra SoC modem firmware expects 160 bytes,
> requiring SMSM_DEFAULT_NUM_HOSTS to be 5. The size mismatch causes
> the modem to crash on boot with "smsm.c: Bad pointer from smem_alloc".
> 
> Increase SMSM_DEFAULT_NUM_HOSTS to 5 to match the modem firmware
> expectation and prevent the boot crash.

What about the older platforms which might expect to have 3 hosts only?

> 
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/smsm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/smsm.c b/drivers/soc/qcom/smsm.c
> index 021e9d1f61dc5200514c5a239d52be97f7e82825..7d1823ab4198bbfa01cd1cf9c33999b32e2490a3 100644
> --- a/drivers/soc/qcom/smsm.c
> +++ b/drivers/soc/qcom/smsm.c
> @@ -54,7 +54,7 @@
>   * Default sizes, in case SMEM_SMSM_SIZE_INFO is not found.
>   */
>  #define SMSM_DEFAULT_NUM_ENTRIES	8
> -#define SMSM_DEFAULT_NUM_HOSTS		3
> +#define SMSM_DEFAULT_NUM_HOSTS		5
>  
>  struct smsm_entry;
>  struct smsm_host;
> 
> ---
> base-commit: 9716c086c8e8b141d35aa61f2e96a2e83de212a7
> change-id: 20260527-qcom-smsm-default-num-hosts-c471f9c4311a
> 
> Best regards,
> -- 
> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

