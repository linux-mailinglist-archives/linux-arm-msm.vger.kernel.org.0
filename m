Return-Path: <linux-arm-msm+bounces-92557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIxILFbli2kVcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:11:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 305C8120B60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93B5A3020EC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B29F2EC56D;
	Wed, 11 Feb 2026 02:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNi4s4HY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eHgHBjLY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4132F2FC011
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775892; cv=none; b=AxLTozC6ap2gWCK6MwleFdZLLZk/5gWRHTKV6tXIQNU9rQZqgUJQPzRxKZwBl5rxx8KimweJEdWgKOHoU/6WdUshPGUP3H+LE+3eRsObGK21gejMjiV4FA8lzpHFO2m15lOVb9XAUuiZDwIPujwPeUxlPP8GdOyHotJIVBKiAGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775892; c=relaxed/simple;
	bh=8KmGqu10I2UcckwyPpRC8tNe/8eY+hosqLQUnpOWz2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHNkok4WYz9QLDGlnIudmsG2q6cppb7z/RHbYthmduQGNlOC3R4SMWNanfnYC66NNlQx3xgi/ZoliUWch4kO+cM8HqjlYu5KEqngvh0yPSNmtvFI9izYHO9WRDbMfG017NWr9dodNBcYdcVlSwDxf+/8WoO+6Fio6poWk6gJN78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNi4s4HY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eHgHBjLY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AHFLV72396794
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rwAUFN3fNP8Oixckb9rh2aw5
	H+/4LllRHz6cpH0F5RM=; b=JNi4s4HYu9+2mYBSTf+/RQnDhUPEtIlvSpaxQomj
	QMBZYa+9aVvAGYAA41QxvFj88VYf5JMOT5Nqp0z6OsB12T0DXoh4wOsL3t9ctsWt
	n1ukx9BUdNLsQClg6n42y4XK8ntSFpShdPtQLGOFHgXQTUr38inOufus0hYDuGLb
	2gk30O9O046TDYehLoTZSgey9QsySrjAoY0sX3INtaMvUXftv4Ha95Evo7YL3JIM
	v85zhT6Pwek7Tc7OSgFjaMm7XrpAGmn/JNzamEhGdv9JmNq+Ve0lyfQwJvrmERTs
	QTqtUv6q+I4tbWedmmH3DtZL6RpQ6SyQl8sbbkeQlwj7Rg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c88wqhhx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:11:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ef98116so1579682585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 18:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770775889; x=1771380689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rwAUFN3fNP8Oixckb9rh2aw5H+/4LllRHz6cpH0F5RM=;
        b=eHgHBjLYb4PdT9/kKcLUI1TEPbieVJPutH2oeNcp4eJ17RIfxSAzARUIpo+XMYpg/D
         vBD5h6MyL1WyQM2nnWIhxynRcyJYNCK6Dxvo34BgX4GP3VIfT/wpSGHg/Q/N6mZX4dUE
         anjxyepWKi913F+uFItUc7aU1QaCOFlxaiiDver5E9YsTY5DdHB6nswfKZkCLrqm/IjU
         Z+opL8N2ztc/Y0FGVQCJmT5PbA2uyAaD32iW8IcRptUu140n/oXEEPOBCmgQTp4yurcN
         d9kWD9fchYZQEBgdjey0Ye1KejWG/64j3NI3jDPhjxmiBlWapDiI0O7Lau2WVLbk1ob5
         4cXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775889; x=1771380689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwAUFN3fNP8Oixckb9rh2aw5H+/4LllRHz6cpH0F5RM=;
        b=o/Pn8fHFN9U+w69BKSFAZJ7pl30aySLXwSCaEa3WLvZd0c32DnYOzizrmhHy+Yk4Bg
         hAgr+LgNoQuXN33ocBYWO6pPPsCj6PAILUM98DGXMulRXCOgpIuQQv7FV3vzKB34S6MG
         jbJz+SGu44z+EuJ1FvHPYeuBZvN+IE5fndHAjY8+pA8fA5g86pITy9zjf1hqEobJ2kTa
         GISKHhha6N/w0lajnkxytxrApDIcT5nO9SgSQX9qMZyy0YmUv6oFy5XcydiP9KCGFT23
         GamRtOxm5Rn4fbZEizA+Y87b9hhccQWxoRdO8K9DnZbwTPTt+sRTaZS6DdR67klNScdb
         s17A==
X-Forwarded-Encrypted: i=1; AJvYcCUwQV96B3TJclA52OgCZwbit7tbx7K7dadezZE540bxMBtW7RCN1tMd+KmLqqJJqQnDpIxp4Chrrxs9mlyn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/lW0aEVl4zRVN9v4zJZAfE3PIo19vvbq5tzlf2wX05yVKo5uf
	NroGFWi7/jqa2Hd/K+YSvuGuqetWk4odUGxuJWIUlWS8MbCpV944m8SCNEUJY3gLF593mQ9Bab0
	PUEOUDQSQcfOf8J7gxmNThCms9Llm0exWcDLY/sEw4j8diAY6AdqKg6Q1cK2NHJKVJy8W
X-Gm-Gg: AZuq6aKAIH9/W6CMQfIeRHnPfHKPMmA1yNqjwhnJJQrZgBB/mLqBTbUvqg3zkzf/9Q6
	+reoeojDqr3y+LBqeF+b8n6eSDgcl/Or/CJSJ84p005ggf/vKEWJFrdrsugJM3bp3snuTlyTbZ/
	96q5+odLgIAGlNNGvlJjcs0W1ambgAcdLfOC8S72zfqwmZhuXFsdNFVP5QquF2QVhdGF8D19Moz
	oy5zq+tAbhlU2qoQG08d/8KgVmMDGh5xEOBWSualeppwxjHDfUAnpOGd9meE+mrv5Ss0zpCkHng
	PCy7SexXfqzsF5e22tWm7KBWVgN/3/2idZh/a665lfU1xgBlXghVX/J5W+GSjuwPUIaSLya0767
	4NqTloT5L/0ox15BkQRMwUjQD7WUgPcxBMj71tdokKg8GuaN4luJPQ9MLhb39+HzHqJDjWkWFi2
	Rxhyj0OmsRNdYRlJ87HuWA8NUlu7UdjqOvsjA=
X-Received: by 2002:a05:620a:190d:b0:8cb:104b:bef with SMTP id af79cd13be357-8cb2ad54a5amr28602285a.88.1770775888576;
        Tue, 10 Feb 2026 18:11:28 -0800 (PST)
X-Received: by 2002:a05:620a:190d:b0:8cb:104b:bef with SMTP id af79cd13be357-8cb2ad54a5amr28598285a.88.1770775888057;
        Tue, 10 Feb 2026 18:11:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068e5f35sm565761fa.22.2026.02.10.18.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:11:27 -0800 (PST)
Date: Wed, 11 Feb 2026 04:11:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        Nickolay Goppen <setotau@mainlining.org>
Subject: Re: [PATCH 01/10] ASoC: dt-bindings: qcom,sm8250: add compatible for
 sdm660-internal
Message-ID: <yxrhmblavwkuhfrfgskujs7tz7cykojnqnl2mfrf365lhdem35@bgqwiaft67b3>
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211020302.2674-2-mailingradian@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAxNyBTYWx0ZWRfXz0q6DF+2YeFO
 w9KCmlA2vvaxVcl7izcLlwsq9/fvQN0KiCYO42+Pee8j2A8qnZXCvx2K13lRe0/H7STgeJnsKuq
 EaaQdNjrqy3IP8cs2eK6Xu7cp2TJzdx0KOhmL4643qkggy/lMxqdUWIXuL6NapSaMSPF/8vdTo7
 6nN9S0YUZdx2fP9IT/GA+a8hLinD/aiOYsLWDZdDN0CzbzPl49UCCu32sx28eVqG3tOwiT5l4MM
 TZkjOnswUKdnWycj5uHLgMLVXSypiAWd1BCwkhnz9HcxVSSx0mlc47BWxOaMgB9jT0QEcd7QcGG
 yhqVVrZLYZUcdUhHAMhkzs7SA4TfLlpDcqQrwCN9x4SRBlMfhzWHrHk0wfWE4xY+I7vRNGNNkto
 uS7es6WkudIrHLXZ773LNuXsmrxW9U6gI8CaJ9XyZkL+TVJiNvWhtKkY1P9z2ksY83fzTUKd/b/
 qJxz09HJGoqaCVVPn6A==
X-Proofpoint-GUID: q3p7XztUCLgtk7nbvIEYLTSg3W_F0ULK
X-Authority-Analysis: v=2.4 cv=W7Q1lBWk c=1 sm=1 tr=0 ts=698be551 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=OuZLqq7tAAAA:8
 a=pGLkceISAAAA:8 a=Nn-6Z7DYh3BI_mgflx0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: q3p7XztUCLgtk7nbvIEYLTSg3W_F0ULK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110017
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92557-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mainlining.org:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linuxfoundation.org,quicinc.com,vger.kernel.org,mainlining.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 305C8120B60
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 09:02:53PM -0500, Richard Acayan wrote:
> From: Nickolay Goppen <setotau@mainlining.org>
> 
> Add compatibles for sdm660-internal based soundcards.

Why is it called "internal"?

> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 15f38622b98b..ad5add422c4d 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -44,6 +44,7 @@ properties:
>            - qcom,qrb5165-rb5-sndcard
>            - qcom,sc7180-qdsp6-sndcard
>            - qcom,sc8280xp-sndcard
> +          - qcom,sdm660-internal-sndcard
>            - qcom,sdm845-sndcard
>            - qcom,sm8250-sndcard
>            - qcom,sm8450-sndcard
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

