Return-Path: <linux-arm-msm+bounces-93954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eD1HJpp6nWmAQAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 11:16:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 068A318533C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 11:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80790312F72C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 10:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B9D376BF6;
	Tue, 24 Feb 2026 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMsXfLAZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fC5iC1Cz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61539376BCD
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 10:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771927966; cv=none; b=Z7lxDEfGmpm3/sqbvhHl9qRXysp+som9qF4GprLxb/lxqTV+Z9KBKlYGu6M3qzqH7W+PAZZ4rN2v5jDniZ+2EPC/iadc+hfcjXkO3Yo+1Bl7BuherVQ9AQ35Q2jrnuu7XFV3jMBBBAh7hJFZV2lqQero5OqnwKukj9m6nJTHNkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771927966; c=relaxed/simple;
	bh=FCMRXZR8SAuy+rR/oG39tLfH/1KCNmdkdQtzyJsu8Vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JSCIrDXmXL4iuDpdP0MYXF7CvXXSHrT65lGHiv+ksb6Q197V9AgD98NXrgGQqshjiG/DCuNbb3MlFYzVYCfjH1JkCJVDmgmaMCDpySXuBUkugDaze23qcWUMuD9JFHVATlrBhOfltJalAzqIZe8X36oU95kagy6lZmrrxysjXm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMsXfLAZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fC5iC1Cz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O9sWfX3837338
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 10:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/zUFJH/jB3soteowiXuTedDU0sM6XkQn3T2X92OyF00=; b=MMsXfLAZE5ynACpp
	FWhZxfOch8YxVJDeYcSsHfthQw5oo/DhMEoqBTJwY99Pk8tMduRE+meYw5fTfkgo
	2w+Giycozlkcg1CeqPpjcBSqsNUlGHK4z/5as6cG3Z4CRgPKJ4KKK4h1Hs7qnRs9
	W+w358ncbTbBZnmstNNc7CzuqJ5i/jwrhgOEBwstJ0VETln0wmTIOEFY2N9+0CH4
	PvGUNYt12JFPTyIJKGVCR2tHeO3spDyFNDULWJNH/dQwl5cT44LMWpwCCcGqPTq0
	rfx9UFwvIB0MXJ04okXrCc4LEzvvNue20bY02TjRHE8lrszsfM2/eUvmhZVLJUvL
	trqH1Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8trtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 10:12:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89545f12461so51341636d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771927963; x=1772532763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/zUFJH/jB3soteowiXuTedDU0sM6XkQn3T2X92OyF00=;
        b=fC5iC1Cz7x8o+f1v7XbZ3EQqnt6fMApVqZjy1WLh8761owuNfXP9Dc9UGvBN6SktZL
         9j86EGlTwJniDSNbDLC5ju10k4yR8KqDMwlXJaNenKEW1kX03bz7Ymp/85JoiM5mqcHO
         bSAeYt6vG4+RUMC8PlGxraT8cG9WKq8RkB0XzIgcxF3h6IStPGeIbdfiux+pvbdxL4dZ
         EHoFCpRzA/LLvpWbcLCkNb2AirT2nfuC6jrkie5VnTcB0F/vEBr6M7tXDKL3yidTWyUO
         PEIPv3aNoLFiWwWaqOJmX1mg/wddDjTJEKsM2MB1tyDNF5J1wX/L47rzmTPZ/xlxouDK
         lWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771927963; x=1772532763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zUFJH/jB3soteowiXuTedDU0sM6XkQn3T2X92OyF00=;
        b=DMeo8V6kzHWX5RABhSSMfz6KWJln2U3AKkCaA5Etv64tOTHlhoMp1H4hFB09Aoqlsg
         7gE6Xo21awRjlnCgreqvqfbMkjC25/ITTGzBBO78yFp1aU+ajONo2K5RjbpomflrX9H0
         hreB88ONvzChJdTXToYHgVViB0MNsjSCuxI9GZRP5l/QI1afotNaV2WOJOWzKu3sNZwZ
         +orqBWEG4gmGQXssCH60+TvSEDlRq6ujJuVO/xSzc1Y3H7G9v5Gnr/kdwOChvCf/Z125
         N545VUGHM4CzwOXH0P8jXKRbY355c7EYVbQS4rQaV4RGsr82v2O2OAG+1tey9NURewZx
         9vXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd9z86MW00wenIuQ509LNPdrVAn6c5+SBibk7eqFaqQaM/Wpca4/BY/whhjxo04BlUdX+1suZtCBS4Rds3@vger.kernel.org
X-Gm-Message-State: AOJu0YwBlCCrNGYNrYlMcJSfNQ3Q4f61TckQcHTV644pMwq1LenPQFKn
	neJCCr7KlnwndcURtsz7gvC1feVdC5XHGMmbTGzCgL29jqFKtmNOcTTDLHtiTf9ug07plyFSOSo
	8I2kVfKgPf4VpCpYuX5VQ2ldUPDmqbm/cY22MuhNFjfj7DPo5ba4ulmr5p557vYhOGSa+
X-Gm-Gg: ATEYQzwx9aGgnD33dmqsTsM9kZc6bvBip/Yk724zpoWTcdMQkZAlCi6PzAEnBi5YHoM
	Db5bCEJsy623RiJlQQwPF2epdhNebeXZUZ0XtBtlxam0WSfYJs+5GnBaJDuyXGBco/Bu8lmJ2pq
	RbnE8b5NLq2Ye6/u1dWvdEpUZW3gLZa5MVuxaN/YK0N3o/29vxwTLISGqURCuYQmmbY3oXW97Oa
	O1QYoO/airIimosaQUfRGZQQ4qfLR4CGEk3Xnv/xLNrUxkzAImJwBCwfnI2yXngvOfIUYSG29LA
	EHiWVXRIYPRuIc2NlTFwDlqdHhURqVcaha5U/XLW+rvtJZrxBTUXcTptME2nH47kZL8EMqylLA4
	Zp+jbr2OT+z2mgUaXuURKsseagoqQAKpooe7CZ3nktn+Zr7vfVTTDbqDJYXs97G2T9ktcYEEp/O
	1NaZA=
X-Received: by 2002:a05:6214:8095:b0:895:4919:f536 with SMTP id 6a1803df08f44-89979dbc49bmr120768136d6.3.1771927963618;
        Tue, 24 Feb 2026 02:12:43 -0800 (PST)
X-Received: by 2002:a05:6214:8095:b0:895:4919:f536 with SMTP id 6a1803df08f44-89979dbc49bmr120767896d6.3.1771927963147;
        Tue, 24 Feb 2026 02:12:43 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084e4be53sm411811166b.31.2026.02.24.02.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 02:12:42 -0800 (PST)
Message-ID: <c6ceab84-899d-476a-b2d8-e57028cc91dd@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 11:12:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] ASoC: qcom: qdapm-lpass-dai: correct the error
 message
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223180740.444311-12-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260223180740.444311-12-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gJ2VBcV7PUIqfijluwAO7imGNN1tTqee
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4NCBTYWx0ZWRfXxVOj6dglD+ji
 NyTOlVXh5B/7oLcNU8maZxS4Xd3Kjgl61dwnKY8RgI9v4nXsnuqNFLmYBQRclVqq6B4w0SVUodP
 0cBPmF9+6UKPdOlEgFLySnRff6W31Ol9MszJRbJZLBGUvZ/J0/puAnBHh4xzPxousg1urYRgugs
 t/QoMIzIeIM8msMnHCygt2gwtSg8ntaf4Y9BaP68CzllOX10flJMd0W2DIF3GjmAor/2DInWCGw
 +bC0YL/qTFX1HJ+4DhOpF045dMQ7uIwgWU30q2sPyjPLtla5mUfU5sPYFteSUZ20Vfz/ehO+asM
 9VQr/DiK16oSAyYvBAuxwOu0BCRLUq0TXWHYQxbpB1SYWipueyVfX/zi3VzyjF9U0pKEglqYm8c
 +Y0woysI+d+WkA/d4A9BQGGH1uoKHApxAPuo+Kqo9zM3stqjILZ2rBBbiWDhOVzY+9YBft44XEs
 ENq3vEIvLddNqrh2b1g==
X-Proofpoint-GUID: gJ2VBcV7PUIqfijluwAO7imGNN1tTqee
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699d799c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gJfCF8_cG8V4FlLix1QA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-93954-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 068A318533C
X-Rspamd-Action: no action

On 2/23/26 7:07 PM, Srinivas Kandagatla wrote:
> Fix the error message to reflect the actual graph stop error
> instead of graph close error.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index f68d4b4974f3..fc246485e326 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -150,7 +150,7 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
>  		rc = q6apm_graph_stop(dai_data->graph[dai->id]);
>  		dai_data->is_port_started[dai->id] = false;
>  		if (rc < 0)
> -			dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
> +			dev_err(dai->dev, "fail to stop APM port (%d)\n", rc);

Might also make it "failed" while at it?

Konrad

