Return-Path: <linux-arm-msm+bounces-117599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CD8wBSE3TmqgJAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:40:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BC7725F35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:40:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bXBE6Bvp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="W/dZDhbU";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117599-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117599-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 609F83002D43
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 11:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256FD42EEA2;
	Wed,  8 Jul 2026 11:38:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63123BE16F
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 11:38:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510728; cv=none; b=nMQ+dXLSh0q/DLmpAw3RKei0GMWFVSZ3H+qZCRG27UbRfHB2wPg91GblaWW6PZwuoabdoI/UB8DGArG9x3v07w7EXrgnDthaj5qIqyzUX3YL/tHiPKV8PJm26HFDqrW8wYE/TlAi/YLF28GvZD0ZolDD4sCcYRgw79stV7G1rqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510728; c=relaxed/simple;
	bh=RP90qGDqSky/CUkebrhEdDl8nT1yIbocQhu1kVNkt8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCxnQxZdYSuGC9xBp82VtsXMAFMHU2A7gE4hm88tMrd5g7l95nvCk13z3Dk+S2HwcJd2PRStZ9LTwSudz/C2SU99/O2xeEnVA+BxG1EqDHsUWIXjf9VDrScsxswYVqeLK1drufSsqTPSv7nK8HJcTqR0/wkJiGIkC2YfnH+pbfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bXBE6Bvp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/dZDhbU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BSuIV2459790
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 11:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l1NE81Ewdlfj5M5xJR2l+Mbp
	tJKnZUesnJ2Vfrpi/UA=; b=bXBE6BvpQHfa6Skp7zjliaZMDl6YuAMezNKSzBAk
	ZNh2g6WGUyVw9NI1pFtu7XVBuWLy03KvIVSHX6lAghLdZeORIuvbzfnGKs1Kbdzk
	jx5asKac62QdtUKaScxjsixjZ0Tb13pyxjneVa48iooyHu8kaZC7eVRlfZDMBO8F
	gmriLIT/Ai9UhlnZpusCM/Lk0jIh1IsBzgFOF35LvCVfiOoj4EwEUeVS9BhUI8WV
	L7q3rGZbTa11N7nrR4PW2lsLDizs7DHi2iROFH3XXeevel5eaqKxUQsLJLpkQNPT
	Y2MlBVUKKGOYD1MKZ7C8Fy458lzHWJEdy5gGHSYAdjARxA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u1378a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:38:45 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73a8aba30a4so586281137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 04:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783510724; x=1784115524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l1NE81Ewdlfj5M5xJR2l+MbptJKnZUesnJ2Vfrpi/UA=;
        b=W/dZDhbUZSw32gaJonEX6c2rJTwOpuLC8jmrnomY0v7OjbPGbn3Ge4h/tQnewf7X1e
         M66+EMpFjkgbSaXoykL49pMuNGPXHO9RG4On1xDJfO2QoCLGoIoStR/LV9QDSgKSG+rj
         XxJZqvpoJhqWdK3mYn9MucJnmUk7IP+nM34zOy2YzaxnvV8YNYR6oZxElHBokIUqEu/x
         KkSGnT2hKTQ/2cITwfgSl3Y67cdlQeYaBm1d4ZGZ8opulK8uIaH2t8OQV3F0/y1cqcNu
         mneeRlLTB7nEz279nvpjLYm2+4T83IFaok6K8jyRpbauOkHrY4Xf0e6lniX/EavBcxZK
         2PVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510724; x=1784115524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1NE81Ewdlfj5M5xJR2l+MbptJKnZUesnJ2Vfrpi/UA=;
        b=gRMceEKpTFDlPaRm66zFGqElXFMq2aPEiRBLXQAjm5v5nyoBIWJf1RxxTGlH0UCBq7
         llh72Q/v3jeH77RePgF5a3m85AWsxthiUpVD+FRjXqPSQodWxMRUibgHKLg65RwaCSVN
         bEbwiXiLpekrwZkQAQYaPNuktIIT9TYbqYgYGGcXar594IdMsYO6giwWmWwOq4dc9T+q
         dJguMAfnFxClwGLUdZ5B5iOQZWAnmDELQVGFpbY6K28+xkMugp3XswxzbVlDU0UJtLBF
         Ezf3Q5yBQS4KvAvdHBcj/uR+UIahPLzjQ5lhor64hLa21lcPqCMU+kopwrTeh96hW2Mn
         v+wA==
X-Forwarded-Encrypted: i=1; AHgh+RorQMsRdmJbD5tW5FqiknF9tknVT56P4asmw6tm9/glVOybGFIVyCUTz9n8+sv3CEoL1G66/np2vXG9HH/D@vger.kernel.org
X-Gm-Message-State: AOJu0YzWM7sIKlQA1n64/zmVxLad87/DQGnb8T+fyT+mI6GJ+QkNihGj
	VHn91cj2BEdvBAtqFh8Z8/H3OGFZTQ7pNq5CksONAvRx/Ql2QlJFrRB94XzSnlEZOpThgX7tXO+
	skR8s7OIvbys2pmWSuAyRPZY0UEgik4itolGoYSf8EaV22Z7oNfE9W1KgjBLMqoASVxZz
X-Gm-Gg: AfdE7cniX/4ADfKTagUrSAx/qoYqkXgV6XI3RB6KQdhP4hbLvX7yoWLS1FC0Yj8nRb5
	8+mXxzavBlQLzGRhz+JoV3RtekEYHtXUKByA1EAbXKmquzb+56IJY/RnSxCAkedpkWin5bvEgFE
	BHLxIgxoupovN3MUTlIDnqTYLehIEoSUCbQRyBNom+fn1UKTFP3PtMycqQh/WTwF248JnR36A+q
	9Refs/SB5DC49Iu1f9bRKXN6eJK6pYM2vtt+XstLceNNH1tjmanQQqBum0LpeNPcwxk9afYkrBX
	PaobJGWvjJmAtbtsA0bxHb59QbjmJJbjXAR980w+oIMg4Y/Tk4lKK42wOIa4ZYjx2VjICFk57Nx
	ohEMi04skFzazoXX743JofS0ojV2lHt+80ufwfCOeV1lMJT5ydlv4bOgeZQeQCm0LvjMbbBqkR7
	HwGABRZGSrEqzekdAL/aw7Vpc2
X-Received: by 2002:a05:6102:6045:b0:734:13c9:5ed3 with SMTP id ada2fe7eead31-744c214b646mr3977462137.3.1783510723963;
        Wed, 08 Jul 2026 04:38:43 -0700 (PDT)
X-Received: by 2002:a05:6102:6045:b0:734:13c9:5ed3 with SMTP id ada2fe7eead31-744c214b646mr3977449137.3.1783510723572;
        Wed, 08 Jul 2026 04:38:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13839ccsm4426586e87.37.2026.07.08.04.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:38:42 -0700 (PDT)
Date: Wed, 8 Jul 2026 14:38:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tiwai@suse.com, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] ASoC: pm4125: Switch to irq_domain_create_linear()
Message-ID: <3dquznicr6jh2k7h75mwe3dm3y5ud6r4o3bay4bttuehltqqem@wojfvyzfwnrx>
References: <20260708095840.385526-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708095840.385526-1-jirislaby@kernel.org>
X-Proofpoint-ORIG-GUID: -WxrETaNA5nqiih1TWH4eJDWy4PfQzwg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMyBTYWx0ZWRfX23TqrLFV4hsr
 V5oYwmf6CnujGJh0+5b0N/CXI710+6mth0t24juyOGFvt5Rs3hZco8i3r2eAxjDVV7TW8Im638M
 7trm8MLlINd624ZmAPLK9CnpvdZwiwo=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4e36c5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=iox4zFpeAAAA:8 a=EUspDBNiAAAA:8 a=bAM_E-XXpzh7hRjyRewA:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: -WxrETaNA5nqiih1TWH4eJDWy4PfQzwg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMyBTYWx0ZWRfX8tTOTG61eebf
 C4BDgnUfUXWY6ajb7Hk+ioxRc0nNhHpBgemJbIzms4LVIQjvcfqvvugfVuRWvrXoBlKs87tPLO6
 QgafgpXfsBCZX5M7cguFwmIEUXOWAGvI27kEHl+pOveEM0E6ENY877w0k15ZtTm5cIopvVcnmjg
 fhbi/chkH6BrkhCouQRNWQ/3Sp2CbtkyGgkMXDkKWDJsZdfykAS9iFWOtka9G8xxhgDv7eCVHSg
 2zvGF7GI6rRCTPjBSUXC/r9XGbOYkJBEzlYJlJsC21P8Y47PyLM9phb6pNOlX8+xKukFeEWH5fC
 u2mo6VTSIDJ1MIXT7PM9IRNBuOkEArbUNSC7kCzbj6zBpMfcvgSVSRiEHvvosrM7Fmuf+en8xAX
 CwK4hzrsOS2rUm9Mr6LGoIhL6GysOkKM0KV8kmN++lD9Risf/jHdowJbA5QgCNGXDHFDFA7d+6s
 QeTV5lb7mecORfV4oew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080113
X-Rspamd-Action: no action
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
	FREEMAIL_CC(0.00)[suse.com,vger.kernel.org,kernel.org,gmail.com,perex.cz];
	TAGGED_FROM(0.00)[bounces-117599-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jirislaby@kernel.org,m:tiwai@suse.com,m:linux-kernel@vger.kernel.org,m:tglx@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77BC7725F35

On Wed, Jul 08, 2026 at 11:58:40AM +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_add_linear() is going away as being obsolete now. Switch to
> the preferred irq_domain_create_linear(). That differs in the first
> parameter: It takes more generic struct fwnode_handle instead of struct
> device_node. Therefore, of_fwnode_handle() is added around the
> parameter.
> 
> Note some of the users can likely use dev->fwnode directly instead of
> indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
> guaranteed to be set for all, so this has to be investigated on case to
> case basis (by people who can actually test with the HW).
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> ---
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: linux-sound@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> ---
>  sound/soc/codecs/pm4125.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

