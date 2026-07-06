Return-Path: <linux-arm-msm+bounces-116897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vdz7CA/AS2qZZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:47:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4357122AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:47:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A2dUz9US;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZLCCjbOt;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116897-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116897-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 951E03096D66
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DAF540A944;
	Mon,  6 Jul 2026 14:29:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CC93FA5E7
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:29:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348193; cv=none; b=sr6qpTH+XISrHHfyYCQ7Un7VpBCriqa6Tpv+pCpXsMnbQmy6m+htPDO63leYX8PZsrbq1PnGzLB/V6uAZN4wyfSt/70UtNmnTQNBUk6io4fMMEbxsvfLJr8hzAMU+AhlatPlqbZ+pIwuMvkTiW4Zt4DAuy4aE0T8ymal42f8+9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348193; c=relaxed/simple;
	bh=8vEnHRGenzBdSJTnGUYW/EidTO23K++uWyMCCMhRIrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqSxuS/DY/tIWLDRurEt62rYawzRzr4JLZ1tvr2oZdLtFgNKQc7t1oPk0+luMWB7v2QXelrbmZbDZ0qT/R2uysZvOx2RvDmUTmIyhI+R/R6bxg0uTPIR+OB+ZJyaMNdvJ3YPmpZO+gAVdqceReq5PATvAUitsam42ed+5TgSNVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A2dUz9US; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZLCCjbOt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EEIVA828641
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 14:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0E9exI+cddKw0j6jRULMOf3c
	bU7Gt39SEkbobqxG5po=; b=A2dUz9USbo/UDb31TV2VTXtUJScDqsXlYz9IrPPw
	DiMAj/YTVCxm9EYoJ+NDgYUnrNZQGYCQhl3iNJUyo5zO9kicU35ipP91x+5hJaRO
	35yVVtVlK/k0RqWmm+ZodgYxLjItV1J+lJeva6ex9AgNIPFxO2Z1AA7s/tsgpD9/
	QjR3EoLdCtrDdrJRyyHgi5inTeFHCEk8CH55eaO8lVejF4KKkAW4uzgKGhAITTdf
	IfjbDsC3rj2P/PCG25ZAp58XjOWKNTgg7RxSFee2hoSfocWdwIUITClYGiUP6aNy
	5/0/DIlhCzKRWAd0GhAwWM8olztsKpabsOPXTIz+NoJWYw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r14uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:29:49 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5be0de8bf7cso246239e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783348189; x=1783952989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0E9exI+cddKw0j6jRULMOf3cbU7Gt39SEkbobqxG5po=;
        b=ZLCCjbOteS2m1RmXRl/VItGeVPbEA0vx2yTJUF087Djr/WNrIJlPw0m/ajow0vHMgz
         VV9xwgNY2+/6okf6lyKcqWF28sl3YG6EE78VPD4hb2EhiEWzM7ZyPbsk+B1NyCp8FACk
         FBqXtDREkeMuvU3oXLp7XEH0BZ/6NHRnvVrUSzTScjP4nusiebsYOA7gqCkPhWr/rX6I
         CvbaT4uTk+YiaN0sQwQpmxwNN3WbYlBldCD75Lr+EQAueMfoTR29p8n3aiR3ifL5y6jz
         z/bEblGvb2TrC67UobiC0WkU8I6okPFGXPuCG87Z8MwKEC6JKQGxOOQKUEKHIev+ojSV
         NzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348189; x=1783952989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0E9exI+cddKw0j6jRULMOf3cbU7Gt39SEkbobqxG5po=;
        b=TzdlcP6luCc6VcOmWD7EndbhfShvXJutQEh2mQxrd8DMvzQ9xwh9RjJ4LRMYJKPftu
         CYR0i4nNqgQijPE02PSG4ocYx6PJLDmdVhrlv30e+tRGKZ42MNkp4XeKAMGmW9ryMBJS
         SFiXgo7f3tAj/MgyLFnpV8pldZXQfydOiT3CdJiAlh/tvk0jOVHu0wMgb6WJ1PoSqxn5
         ntV+kEXPX+lZUDQWZHOgpsaioxl2KlWfNKCGh/5yWEdzJKurLYFWsldxOFyW0P8QyLAE
         Fg5U+VTplayr4je5QYb3a7oMOMTBSq6mo+zHrhlN/kiKNjexLk3vBVdKpHgQuzVv7FJj
         Ywag==
X-Forwarded-Encrypted: i=1; AHgh+Rrw7fpT7VKs8Fv4BvnFIsJIZ1lmqoUvHNRsIQ86bOwAEJG9UVFRkRYXuYG95MhUA4B0ctRIvMAF8702qzHq@vger.kernel.org
X-Gm-Message-State: AOJu0YwJdEqtWXuCEnrsYteD+NMK5IS2LxgTEOs93IsvPU7wp0/gH0Ih
	60YHTSeJjdAJlIKrUmFyImTJk6ZBeQeGP8WTG6udyj5yUAe98+uIUvwW9j3R7iHSrgZUqGYBreZ
	VV9G42qlEhrH3ypzsBxu3VF7sptzeUPWT3Fa0hTnceBGHPip7s4ZTAk1N6UCVJYJV/3fo
X-Gm-Gg: AfdE7cnvPZf6M6qJ6SNIIYPzBSEedgtmC41v7fSFaGYjTMxrOtm5u6Vo3JsE6P/Y7+Y
	+ZxF5iCsUVQh21qbBDh26cAZB1+N/sZPxnprTeahL7FMRs0hOxbo7xjjjJKCHqkxjmMIhxayi1r
	URAH78hDWu1wN92WSz7lSa3zVLJOX0nWb928H251mB0cv1HJIs1UhZe2v91OUDhwC4BLnjFwKEr
	fShUeL0JKOPrv4Tjn7AB7cSc7sxGLXs/bxSoE1OePrJzfVWpiml817M+mCYL41NnH5DFAb0A5Ut
	3IgV4ghrMDu/RmnL9gEQBG5jcTao/E6obpqyb5GtPNPCcp2f9HWQ2cUPiMxsgSgdA0SmBTZ76wj
	Yq419yLDgOdqr32zuftIInwyeYcu1vOy1+tlhJtbVNJXe7q8GiIlcIT54RTZkIhTRwfcjxqM037
	me71lCHDZNMN6QnL8nFgXUJe/y
X-Received: by 2002:a05:6122:a15:b0:56a:fff5:b4d6 with SMTP id 71dfb90a1353d-5be907435fbmr421001e0c.4.1783348188839;
        Mon, 06 Jul 2026 07:29:48 -0700 (PDT)
X-Received: by 2002:a05:6122:a15:b0:56a:fff5:b4d6 with SMTP id 71dfb90a1353d-5be907435fbmr420979e0c.4.1783348188369;
        Mon, 06 Jul 2026 07:29:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8c2dsm2887085e87.83.2026.07.06.07.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:29:47 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:29:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 3/4] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
Message-ID: <amitzgw3327pz53msqnicbd5c5zw3jbnwbcxoi6tyzb6fy377a@kopxxlllqw5c>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
 <20260706-add_pm4125-vbus-reg-v3-3-999d78a87b81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-3-999d78a87b81@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NyBTYWx0ZWRfX2DUoSzL02S8T
 ev5shR3otBya4caL/476C824Vv/jfzoiUDgRdpBWWbMGoZoPOmBQ3VkCdfN6/2gWD+gaWzWwY2F
 3VgIA3YSZ+ImPE1wIjAYv5T+vIkOfozOE/eadSLeMBWuinwM4A7qs2zTe2O77i1UojiiuQEzqpw
 Eg7k9iKMWfdzoF4vuDemLw5ZQpUJhjzwjbvxc+B8snaH/4frpJkj8sCKZ5s7ESe7CFO35ph7mJq
 u/OzY9ylsq+X+qQWFi20rmU7Tr0XNl4+u8QtUX+VkSkz9ywDdI/gKwLBiPgwhBoExXzSWfMrW/T
 xSe06/bXzRW/wXaliO41UQYHlx75VJgqC9PYjq1QWS0lWP73BmXMcQN/9JgfPvQiHZ4oezAi79y
 A6L0FR4oUEgwSMheugcUqatav+j5CW/aEP7ERlZ8yZh8WXyOmRi8OgCaalhwMvhDeHDd/Zz9iQa
 oFw5Q07RjSdadJ0569Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NyBTYWx0ZWRfX8ob/vIq9f9Tb
 2qFzWUfwk/2z7JKeSkcGzd8LHy4CakhTe2hH5JEt/Br830NToQMfCUFwza+HE0qCzQGfFBZHcBs
 lseG2R213xoxEibVxOgdrvQicFWlBi8=
X-Proofpoint-GUID: wuwz9VWKtoPueXC9cTTS_vNFHVA6doou
X-Proofpoint-ORIG-GUID: wuwz9VWKtoPueXC9cTTS_vNFHVA6doou
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bbbdd cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=eoxlGDcgPB-HuCwanXQA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116897-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rakesh.kota@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C4357122AB

On Mon, Jul 06, 2026 at 06:01:07PM +0530, Rakesh Kota wrote:
> The PM4125 PMIC uses a different register layout for USB VBUS control
> compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
> at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
> a current-limit selector.
> 
> Add pm4125_data using the abstraction introduced for PM8150B, along with
> dedicated voltage-selector ops and the pm4125_vboost_table covering the
> four supported boost voltages: 4.25 V, 4.5 V, 4.75 V, and 5.0 V.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom_usb_vbus-regulator.c | 31 +++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

