Return-Path: <linux-arm-msm+bounces-101725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IFoM6Qc0GnN3QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:01:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3003A39802A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE2113074F34
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 19:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011053BD243;
	Fri,  3 Apr 2026 19:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOT6AuIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QQFC4qZo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F2C36E498
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 19:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775246286; cv=none; b=l1XJiRt9PPXwBGBlR9JqB2O5DkdfKl9NIgLYk86vZzid5n3Q2OVXLpQQyBrBnnbC2sPqwI7AQ4hK8VhIk3JjzjxBBjX1Ei3Cw6d9vrP8CFxjskTasPJhdeXnItvor2ZQdfB4oJOiLPaYTqM7dmR0j+e9vmgSCTV8nCwCfuhcSQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775246286; c=relaxed/simple;
	bh=ne4fQSPT/paZXhvg6/03ae9eXNBdUymFwbR5vEGWkC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0tKBGkjA9CGQGHK/UVROmU93XNIx7fjJUmT0GALJrJrLUGHjVBwFpGXIzuVTkxiyGwHzWBy0ZIGxkLE/cHzrLgT7NTyuKP7MwA0UoOUjJCO9NzZ89S2Ne5ylui/VE6S2KpnMYNGtl4+0S5v6D+IHaVy+AP+nQmAxYcR7piyLqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOT6AuIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QQFC4qZo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EhnG9140000
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 19:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zS4CaFvcO0wwdCdDWlSrrF2D
	SP+yryV8988QUupJBvk=; b=VOT6AuIfZMmf1pQW0PmAjCBny7p5vm2vhdNiGRWB
	bXE/LT7xEljmoGKaCnInduqOQ16gxR6WJj4ixTTNuL9d3a6k7bDK+6dnvkscDsGP
	I2BvVipFBMNZpvyheRaFLUqSU3ArwsEE05419+6Ep5ibDXtC962dm/DOYXtA8Vpi
	9wz6CbotesHg5840a8EKoxCrddJC5QMm6u61Ln91DQvxB+/qrhIXQT5Be5jH7PeN
	Av4/X6r6B05l/jhZOB62D5y6PvFhFvwSL5LQ6L9Xo3/HfTHdZLfDXeBZ+jXjiQ5G
	SzlDApzvzSYSQzHfgnZlKQ8QnsrIJd1Bg7JksOSkVpvNbA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y27fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 19:58:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091327215dso106521701cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 12:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775246284; x=1775851084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zS4CaFvcO0wwdCdDWlSrrF2DSP+yryV8988QUupJBvk=;
        b=QQFC4qZog31k/bCn3qE+j29bRo+h+jQs2I6+P2+K4RO/oO92iaLJYSAMIUUYOK4hJe
         xKJEGaPyBF0j6KdTt6nxJMhQBLmD6f2uq+XMczVCqLwLpxT0ntpiDk0n+mtCscNrSRuh
         1TvErycftsBX2gC68N7uRW7NIYSXoOMkFJnaUbGQerjc3opO3DUfiLdgWhypTUL5GW46
         s/SnqCWsuhupudUJueLrx6mSSb4DsbJSrixxepQ92gCs1bA+mDTIUEBvqj4XPdVx3rBW
         HAgCE0VNzMLJEBYEC/kmJM4Skr3PmHaNnhE4EolHWZV/fgMf8TzI5cDUAMxJRciPt13h
         Azrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775246284; x=1775851084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zS4CaFvcO0wwdCdDWlSrrF2DSP+yryV8988QUupJBvk=;
        b=YeVKyTyO3wD+cRMUKB0ozElqZl6IsRMOno//AFF3gxGedo+s7BJxk3U6naUBytFGJx
         VY+tLwHz+vnxdSuinch5rDwx2nAhKjn+5WyobB8WejG57CPCR8Z5upYJ4E4v0aIQwjAV
         ljKs+JNBmQaHYTQUm+61wAcnol/trzOcBgsKMwzxj/jSvQbnDj+njV/NlgxOOz4CpWIT
         Wz+eBey1IUTsAYsK1C1xkSLXWaoin1JKSp3yHYZfdm2SzaI6g3wozs2eFaZPjyk5OhzW
         lhkAr/iEbw2nV836pfLtjo2wJJAh8WYproTYBQdMunt6e8I8LxNn4xN3SzcVi0J9zWN4
         oxhw==
X-Forwarded-Encrypted: i=1; AJvYcCW5rp0S0npPkePL7ACA382YEqfe+7gd2kvep+Ujqxzc19r0pu3wd2ZYgJNBj0xHi7LSLk5mnXNOqOvA+kgE@vger.kernel.org
X-Gm-Message-State: AOJu0YwWRHJ4I9OzS4hfPQj0WbYMrYNqfOiPpI4xPs1oniOh4+pYZ9X0
	rjIiGtRN+9O4s49/phuJ0chPj1Q1CzOB5Kw1wPd+x32cZdOHIpLM4c4wgtLcPaPw+ALgOjlXpCE
	8VWuetCdVQ7Jn7qRwuX6E94UxhDA22utj78vDOqgvg2KjCGgDYAO+J5mKPB2v4GHB/bXb
X-Gm-Gg: ATEYQzypdfmQ0Dk3zX6zNnT63YKK29QL7H4RtZem/jnGDGBVDpxB662iUdV5kRFkbL5
	JOyjU5CD7Zl4P+iT7aJWWABvWnf4HXtLGfYspRQwpgFVNMYYselydFwf+2XLvNzNUK/Oq0D+kgX
	WcQhG1o66ZoGAyTQc9+MRBqiX+/wt16XhAFfr+MnQOlnDhvNfPsC+DaID7bOBo9LhIkDatoQmUD
	p7XHs0BGJFZDPo25JcI1WFBC3OcOYhgqppwWOxb87EYNtFtUOO97NOI6LHEOsTdD19pcCSnHvb7
	wYoftDtwrjxKVDXJ/FBEJ4PvngPlwe4G0aH0qiIutwj0X3eBvEmPJnbP9Mj+iK1/6twOyERkHvF
	MGoeSNXEKsWcKe55M2ew4f8Esp/EhswuslPzl/Q/ziB5VEqhlOyog2jq9Bt3w6BmhAX/1g5Ar5g
	rR4RqFBK1ePdXHdAVu3kpf2Z2mhcCSCa2/Jpc=
X-Received: by 2002:a05:622a:15:b0:509:1cf9:ea0e with SMTP id d75a77b69052e-50d62a80ddcmr68313941cf.41.1775246284144;
        Fri, 03 Apr 2026 12:58:04 -0700 (PDT)
X-Received: by 2002:a05:622a:15:b0:509:1cf9:ea0e with SMTP id d75a77b69052e-50d62a80ddcmr68313681cf.41.1775246283754;
        Fri, 03 Apr 2026 12:58:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fdff47sm14814641fa.13.2026.04.03.12.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:58:01 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:57:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: defconfig: enable the Qualcomm Nord TLMM
 driver
Message-ID: <wqleroawdmp56hiraefvc45snovzor26h5qdjcfxsr7w53nvnl@6snvw3qawzu2>
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
 <20260403-nord-tlmm-v1-3-4864f400c700@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-nord-tlmm-v1-3-4864f400c700@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69d01bcd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=jCnpw5DhNY9zVd-FB4MA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: kYl0D4HNC7qHWHZmLm95YNq3dCutccMB
X-Proofpoint-GUID: kYl0D4HNC7qHWHZmLm95YNq3dCutccMB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NyBTYWx0ZWRfXwa7ijmTEyyyR
 RmNNEosUoFR1WSjgAF5CR5ap0qavw/ngAfG4GpTZ8+GzTGmpGN2fMY8x/uwyxdq3CY5hi1PfPMY
 HufZ0025aU/wsByJYXgXsEEIqcgAinnfsR2QQQ816RL9CmCxvq+LoS6+CKsSb+2mE/epYmhZqHU
 GNAa7TnU/Peh53OQj+agxf0PcoqHMgxuotve6NiaCz93vOZLHkL/FYG7a+v7Az/+Qd1hOcus+th
 XY+0JbZyE4yvn59YP+GE2EJiVF3mtU/mjqBncv0Q0p3UQjRiWltpgmFUV7oP2lC3R+jgKTZkIwJ
 6GYA9I2E3qcxGTHCRM897SdKMzYfzl03B/m4eu/+lw1OlOuy8lTP2urWowzNhrzXGa43ZKwcLfg
 pY1ksozjaCjeSR9pXEbx6hKFnTZoVBrHSXWBIOvbjFHJPSSG9D0U41GO5IpHw67E7sssmqnW70m
 3P7WgW4r1rigAamx1Fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030177
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
	TAGGED_FROM(0.00)[bounces-101725-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 3003A39802A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 03:27:57PM +0200, Bartosz Golaszewski wrote:
> This is required to boot linux on the Nord platforms from Qualcomm.

No, we don't enable configs for 'platforms'. Please specify, which
device needs it.

> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 163b7f0314c90fc45eb6c4aa5e8faa549c60fdf7..31f8cd7cde6fcc8c8da8e69950dd4976ae04cfc4 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -675,6 +675,7 @@ CONFIG_PINCTRL_QDF2XXX=y
>  CONFIG_PINCTRL_QDU1000=y
>  CONFIG_PINCTRL_RP1=m
>  CONFIG_PINCTRL_SA8775P=y
> +CONFIG_PINCTRL_NORD=y
>  CONFIG_PINCTRL_SC7180=y
>  CONFIG_PINCTRL_SC7280=y
>  CONFIG_PINCTRL_SC8180X=y
> 
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry

