Return-Path: <linux-arm-msm+bounces-96350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8E5WH3kpr2mzOgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:11:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9338240AFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A8313030B29
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 20:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F7B2749E6;
	Mon,  9 Mar 2026 20:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJz/iZeo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WF64A9IZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B172A36920D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 20:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773087063; cv=none; b=pa5KfrAW7JxE5fOIhdBbzx+KiRV5X5cTvPpkoU4hPrqskpyC5VggkaT08+ZwkZfnJHAs2C7nwCApHNBmwfWjBv9al5aSYL6bNlVD+MSFELDmYmoktll/bSxWrSWN3plb9+KxMXoLaaXmQRQAOiEcoLfZxstrmcbFrrLuojzPfRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773087063; c=relaxed/simple;
	bh=77+W6onGKr3yuXE1owevKxD1xkJ1Q2aKB0TyV8zk4Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxK6D7jYDjv0nRUWjYdoRmG+clMzHhXoYbpjVn8Yjd8ymaqFhulU55dYfgamUd8GJcgV7xe1F+KIS3KrKaRtx/FytC7eEPCbxnYepQzQGx9HtD2IXi2qvw4b9dupkP2DxlO/JbaKISpuyieUGowhy/NlCyevkA34xm5O0O9xa7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJz/iZeo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WF64A9IZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBoM91920926
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 20:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yx3kj67JSPg0Ng3B0+9c2PZz
	NqeOQez707sJJN1qWJw=; b=ZJz/iZeoy8S2QxQ6UKTlLhimwELnrW07Yi4l9MEg
	TwUj9pTwgW5PgGKpqBnXtr6GbXuJOd9gDZT+kJ+FPJVLCs+M6Z5ImePaT5utT0f3
	juhUkvboyWgS7d1zGh3fCVkLJrR0xJIwmxY4+Ef8/bHSoLG13lq1bb0TKM+HwmCx
	X68GIMrWUsz8RJG+VRjTDt+UtGqXiBEJUPNEzIff8cw0ympV3T78paa6gWiJPg/f
	hBVTy8DLqjjKm6GM7ak5b5hPfOmf5JGTW1Kg8bBCSfEbG47oTnHo+i586EhKJwzF
	FSbRtbvc0LkVg4GC0jyz379q9c/g9KtPxo/NA+Svtl1GZw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy81ejc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:10:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090bc4823cso21521281cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 13:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773087059; x=1773691859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yx3kj67JSPg0Ng3B0+9c2PZzNqeOQez707sJJN1qWJw=;
        b=WF64A9IZIieYvo8dg5ox4+Nc2PPnnO4gm2EU+FE1pHUlPV00XajhtyOBRHYzt+PSPs
         lyxX49RR8WdLhcjwyNfesgTfnDVewA0JsOMBUS31YLF4fVavTd9FkFCIocpBN6CpOcNV
         ycLEr/gRlN3hnvoMuX627iwv/qKe0BQCE61HJGxd2z/hDQEfhXdwKhpVq3PqhnuCUZLz
         VEx7Cx48Xba7FfHkHhOIiFsV0oF46L9JiO0FbEMy+0rILJmx22UjTFgz7p4ubxtC21Qf
         ZjeYY/BJVDm/XYLFjlnIKZY+eiVGIBo/AxF3hRGcMh0tOhqU4D5Exe/IlKzufCAlY8dY
         gAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773087059; x=1773691859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yx3kj67JSPg0Ng3B0+9c2PZzNqeOQez707sJJN1qWJw=;
        b=XcxA5Jb1Mxugbj6k16CuKHewBktVFNQWaK9M8Ls5OMxGM3gRUYKhcG1MLeZ0H2syFr
         jmd4gQQi3Me+aztH6bnWfReRdG6h1jWvkq0fgnp5AOX8i+MM94TqsTMm40Yz5fm+jx8O
         0k5iTCer3B5lC7wV4UHKxX+qsnwWkB+9ShxzPRw1HEVCXvZq+MqO9J4D/SO3YgK9gTTI
         hUnGi1Giq2OQ+FJ86ro70W9kUaZ2P7RRSUFiN17XWS5WFNi9YTKjgT1winZ+1Ly8NRV6
         BOOrbFzaJbyXFTS0vpDfbGSnU/TEi3fAqWRB2mT5CK1JiJ8M6f6oJRVqxcos7KSO5rF3
         Jpww==
X-Forwarded-Encrypted: i=1; AJvYcCVweDMm5vL7GlR6xBKpBQbeVwRuAKyT3yQP2QRXFD/rneNTRwIHG7KyS2GjiThfpZFKhBoGLwekqyjUUoPA@vger.kernel.org
X-Gm-Message-State: AOJu0YwUy04rW/jnAgZcAdZRye50HQxqiRvnAOzbSy4UOrpe+1VoKHXW
	Jj3fscq+3t9KoxLoz283NGW3Qqwk/2DO5r1WuIeyjUUsXfzij3UZQCxEDZWVrKiYD0JEGbQIUQ5
	OF88TMESqv7e/cx7qDwBOa/mZg1Z4RXnuX80ggUGn8hZ45ZK3tm1V9KS8H9qV4mGYdV8e
X-Gm-Gg: ATEYQzwS4UW4ufuwXd7jHubZGkGan7GSh6bmzd8TDK6LJ/1HnC24PEcF1Gdq0ZTPfLq
	+mmhbA6tXu+eCoJDKFVi4bXhIoZd8NB24DbLzcY8oXv151gUAUoiaCFpIaFoAsoKI85aAMFfsVQ
	m86RhUR6tqy5d7aq+glufWP5fManhO/dZUcm/2+jCEqy6JXupuSADIsSZKh8bGNeVBXIwBKuFXs
	nbAODWDr/oVFu9gd/5DJ53PiWektgc5lFJflVkAeiNl6o4LvMDcxDBv7PFSbsssGxjrSE/L5JKw
	oNNGtzI6a2p2VlDj6ymiE+kuOBfDkM6P3r3YHNavusdieqrQzURCKiiM8tOXmF3pZiJbXenkaV4
	EI6aiNMzrCJjMstjHYQktJgu9bx8LxeN9d1btRnObJR5nmsddtJZGKUwJDy07OQyUfNVyie7uei
	UptMv0dwU0lIRJ/fj2/4n0m5mdTMPD1PhWJDA=
X-Received: by 2002:a05:620a:4407:b0:8cd:8f66:c9c9 with SMTP id af79cd13be357-8cd8f66cdb2mr334872085a.64.1773087058596;
        Mon, 09 Mar 2026 13:10:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4407:b0:8cd:8f66:c9c9 with SMTP id af79cd13be357-8cd8f66cdb2mr334868285a.64.1773087058074;
        Mon, 09 Mar 2026 13:10:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d086079sm2277245e87.69.2026.03.09.13.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:10:57 -0700 (PDT)
Date: Mon, 9 Mar 2026 22:10:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] clk: qcom: gcc-sc8180x: Add runtime PM
Message-ID: <jk3rcbl4eissj6ss76qubyo7dka5723isa3nmlmo3ekamogufc@oekatddqylwc>
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010653.4266-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309010653.4266-1-val@packett.cool>
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69af2953 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=sO3YEv06Sa-1lvpmPvUA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: _n4AOlyxJwgVrc4jEeSJPK38L0lF_wlX
X-Proofpoint-ORIG-GUID: _n4AOlyxJwgVrc4jEeSJPK38L0lF_wlX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3OSBTYWx0ZWRfX2Q04/bHzH0vX
 q7HN8Yg2o4lqTip4j6x6x44T33T6jewLIYvOPo7izGiqKtivv1t28vC4IoIyWjRb70mnUppBJqr
 WIpcdupwF0XGAzzV3R+hBe6vrJofPYnSRIAl6O9cz0Ll40qoR2HWt3KaELWjxgyfVJEhjm7AzPL
 WTrTh7KuRq86y18JdTFyF+4jbiWD5WJ07oCD740LlNuFJYL61frJ5ey0CqvD+S4aPC7DFyjt0o8
 /ZTR5AF4vdEpTd8TKLcCPS4xSG/pxhc3sS8cLFqMSSHrc3mLY4BQgQHVpgGBhbeahHnxvaxactH
 94bjgDEeGNaqCPwhdcidaqBlDdUqln9uln48yoA6wz6I7VEQTJ9ZvgCfxFtOhcVr5R/cOHw8guK
 KEP0kP/VE+csWVxZz2zvWuDKhY90+6CHSiggQv5tPPI8OFHkQ2OTgEjEslVZKfGfqcD0qB37xtR
 ET7Bok16CvvOaJClQbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090179
X-Rspamd-Queue-Id: D9338240AFF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96350-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,packett.cool:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 10:06:03PM -0300, Val Packett wrote:
> The GCC block on SC8180X is powered by the CX rail. We need to ensure
> that it's enabled to prevent unwanted power collapse.
> 
> Enable runtime PM to keep the power flowing only when necessary.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
> index 365943cd5278..073fb1e2b302 100644
> --- a/drivers/clk/qcom/gcc-sc8180x.c
> +++ b/drivers/clk/qcom/gcc-sc8180x.c
> @@ -9,6 +9,7 @@
>  #include <linux/err.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> @@ -4676,9 +4677,19 @@ static int gcc_sc8180x_probe(struct platform_device *pdev)
>  	struct regmap *regmap;
>  	int ret;
>  
> +	ret = devm_pm_runtime_enable(&pdev->dev);

Please don't hardcode this. There is a .use_rpm nowadays.

> +	if (ret)
> +		return ret;
> +

-- 
With best wishes
Dmitry

