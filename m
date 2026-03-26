Return-Path: <linux-arm-msm+bounces-100116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMBwA8E5xWkP8gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 14:50:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E17D336481
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 14:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98B7D301CEDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 13:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E871C2DECC6;
	Thu, 26 Mar 2026 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1/1DyYY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnZKbJjh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260DA29A32D
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774531932; cv=none; b=EAv/Cs/j6V7hgSXTb2HbZGQQW/c11oF11Lu5QrQYu6SD00BhZatmffJzCPX2hjPE3MvFyYdxBgfSCcdGHntAmwquWyPDzMxeWLMe0ag63BGf7109p7L5LCps9h6afwZLr1C20Y6sUC19u+UUvH4Ld22US0uI0a1GRvrRBC/zeCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774531932; c=relaxed/simple;
	bh=e2Y4kUvGQmv3yempSyUOwIYwIPOnZpWe7Gku6I1GxuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d3a/sF+jLy6AKr7g3WFcIEv6wcsxv6bT3phBde3VZWyR2xzEKf2TUAA1Xhyb8IdjUTO3v++rPQHLwSzi2rRTcpmLZjpN48uuayceegy/jvfjt8uUhWnIXju6uxEq29WwV0s1NiBiZy2/YN9WAWctbH7nmefEgFVwem1okmBfaC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1/1DyYY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnZKbJjh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QArQGm220370
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 13:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gvpfj3DOGxiEiy85LKlrP3RfkspNDgFSSE3+aeFG5pY=; b=f1/1DyYYNortjJW8
	c/SciHWSY/miKZlZFiM2Z/rtecDbCI85ycdHU3JJcHCllfQoDyFgXUr94TzWYeKs
	aMGvjbijQwFlyGXIar6EEnsSqBtylIGnw1PwCXf+4ZGaDE4l3SUJ6dpEKx3SKOvt
	JWYDcXo88V4ErDm9ch6SpvTXKbmBsCCgy8cMLE4nDvF6S+6WgjjQ4u07Tw3A66t5
	E7c82lx/9u+0dhgTyEn8cVrnpouX10W4EO8lG1meFmZHO99j1dcwuwE4XlcTmZyp
	5GeBiwrjQiAZqVhObSGl+JWarNyPhKDASRe24pRujpWDB32YBELG/w1NLlkH+rkK
	Iei4eA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqgfme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 13:32:10 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffd797184eso59440137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 06:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774531929; x=1775136729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvpfj3DOGxiEiy85LKlrP3RfkspNDgFSSE3+aeFG5pY=;
        b=RnZKbJjhN+A409sOdjdZ7NFNZJgr5ruv/tuTWETt+lXAcbNMwW2YrcEXCZb//797iR
         9bV8qkOpJLPvrxnBnuhnmxhmz2wUiNvMtVFmNguso84kmC1wSEq5/Gc6e1jERa2bOvOm
         HH059LPLIXJrUyRBIPpn7NbQq/Vh/iveEdEPdl33VQCUlHh6uw5L2H2Z6MvWGHmQQnvg
         TBqFQZVS4YKALKvDcPXnlwwn4x+33MrtjNVQRZiIe5ZUVukADKdDIkHQmqO6vfcd5GDX
         CJywxaDtpSNRtKzgvZZSZuSdNU4uEFB5uZQc7enUTAOEi+cAjKzmARU2Bqy5J4hZ2z/1
         4PIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774531929; x=1775136729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvpfj3DOGxiEiy85LKlrP3RfkspNDgFSSE3+aeFG5pY=;
        b=DA3sd4vZBvJZBvAxnbh+UJadgUE5JoR8+ceH9LYU/7Qy+VLNdIz8mbXuJGBiJCcmyN
         AhPapfKlGPE77Wvv6TcYnWpZUwnZe3SRKDr3TQN6pQmYiJIuATtLrpPTCEInYVlhoNyi
         naaoitny4vCyzYQl0+cjEPevmpf1WXIWLa92N8/uwhtUmfFwdJnu1FqntVmk4PfpB2ty
         76OV6dqLFQvpDfTagzEbn+PR/AG5Da4ACI2t5PTejiAoWilssKemxoVN//m0D6Rac7kL
         dGyjiLOGs7XmSfce4XS5qWp08BVdqCYV22PJFE0veAg3cUSOp/1iAu86sCvRnAGjl15+
         BcxQ==
X-Gm-Message-State: AOJu0Yy8o33k3WBz9O96ZL1QrSYg976UlRd9TJoIdkw+TG5XC2ZWmJs5
	guBxYuwdShgLE2+sD4HhCwQzxYfAGwTDRRy2i06J0GM3L8nZwaHK9tb3viQiPEGjqq1I7dtd2Pj
	3mcwRXUbckeFOu5+rQi6+mBxmQG/ifiJSGzk07AbvrJ4OvSMk2b/hWMQA+s5GLGNiDNi5
X-Gm-Gg: ATEYQzzKlA1JvG18NwKEDdqV1sgxZxtQLMLpl8fJ11Bu7xf3giiEVO1NxDlQTK2Z/nz
	6l5nIzOsczrDeh5qPXaKB2LQ4YceCx2DpGEvdIxVLv6F5rE84nlQImcYATslctJxEL3v4TYJM8I
	gYJYvEm35x+8MStuR5y/Izydrbeo6cOTwCClvmotCvX9gpqiauvKDFmQwvfXNPnT7/6tLBNsQxc
	/k1yAyZyofBF7zfut0/akuwci40sHnlbuUGj1i5UDjZQTCMYpQUWBVHTgBCakIc01G8K5noXdr9
	2Kwkl3nMghcqbQj4oasyGs3I7Jme1dM1dPEwQpOLTH30xCIJW2yc2eIj1lpaOTwLNLVDpK+U2zq
	nRbDOk1mLXza//U3l++IiAq76540NEiVzB2NhdEP9I3iEGNXaBB340Zy/Y/KBIdrNwBkL+3PiBb
	hnJ6Q=
X-Received: by 2002:a05:6102:2176:b0:604:f07b:efbd with SMTP id ada2fe7eead31-604f07bf4b9mr86948137.2.1774531929276;
        Thu, 26 Mar 2026 06:32:09 -0700 (PDT)
X-Received: by 2002:a05:6102:2176:b0:604:f07b:efbd with SMTP id ada2fe7eead31-604f07bf4b9mr86919137.2.1774531928865;
        Thu, 26 Mar 2026 06:32:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20218736sm120142066b.12.2026.03.26.06.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:32:07 -0700 (PDT)
Message-ID: <2ed4c65d-92f7-4451-89b7-1e49c0a1ac6f@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 14:32:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] remoteproc: qcom: pas: Fix the dtb PAS context
 creation
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA5NSBTYWx0ZWRfXwiIo6PgAx7JS
 Pp37BKeOEWvyC+/z9OWfpRlsTLX8gKowctMk/fw38kI+V7YBY6MOAPQwkcE6evn1uuhPa4A9pyU
 jPljl6wETz4LmC1YA9QXihUqfRCbKc/azDT9NUWIzluRxpa5Fucw6xEbKYmHair/OqrtJzvuOuW
 mDCO+bz7Y5+tHwiCBJ34L+uzX7rOW8GYpTUOJ9IVPy2mmLoY/88M6R04WrXhX9cJLppkptgenGB
 U/yyr2OerJThWFZOdL+OQvZS3Q/lDXBa8jPFbNHxdrVYJ2YEPW8+uTJ9I8S0++5xmws3dFbEQel
 Pc6CRbFMngiDZLeXCDcQBRRkK/k3+LH3egaliIxR3sffVipIppDk5OXEvxjgYrtsGBVEij4qt2l
 S5W0SncRMJ+4vtj83A61hCE5f13EESBu8vfy83nb2gRzQbS4Y1wdaVdsP83qnDsclms1FocybmY
 4d6TJ4U779l6h/zcfdQ==
X-Proofpoint-GUID: bFvCPLWvrFq8w4FLMAobUpHbczot4Kvr
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c5355a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NHyXfb6j7ZaXbkreoXwA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: bFvCPLWvrFq8w4FLMAobUpHbczot4Kvr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100116-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E17D336481
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 8:12 PM, Mukesh Ojha wrote:
> DTB PAS context creation should be done only for subsystems that support
> a DTB firmware binary; otherwise, memory is wasted. Move the context
> creation to the appropriate location and, while at it, fix the place
> where the DTB PAS context was being released unconditionally.
> 
> Fixes: b13d8baf5601 ("remoteproc: pas: Replace metadata context with PAS context structure")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2: https://lore.kernel.org/lkml/sxklpgc2rtr75maiu7lg4iukmaetvjyho7ytyyykmtdu2tov3k@gctoozxj7frl/
>  - No change.
> 
>  drivers/remoteproc/qcom_q6v5_pas.c | 36 +++++++++++++++---------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 46204da046fa..3bde37ac510c 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -250,7 +250,9 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>  	return 0;
>  
>  release_dtb_metadata:
> -	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> +	if (pas->dtb_pas_id)
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);

I suppose just checking for if (pas->dtb_pas_ctx) would be more obvious but
this is effectively equal and other places check for pas_id too

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

