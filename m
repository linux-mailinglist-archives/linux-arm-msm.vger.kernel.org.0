Return-Path: <linux-arm-msm+bounces-97579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLtGECg3tGnTiwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:11:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D5074286BE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BEA22300F10B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C00A3BE164;
	Fri, 13 Mar 2026 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+7OT9Nc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PMOv7rdk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D58535F5EC
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418224; cv=none; b=Fy+lTTKCL4754dSLYMyMIMkDMF9124QO9GeQKZuCfeSlEgqoh9UPtbFMexIQwoSxLVgARlz1yB5n+kpkOh0UJliNyCZJJX+PWsjgXyuWHuK9qXHBHnvtz+tKsOR4zKF1eZ+ttZyp+kGtbRPyB5HC/sf/IybDNpDk13PUtBmKSpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418224; c=relaxed/simple;
	bh=OQa25WQLrFipN8xkaSAC4gE9e+qUwSPzMMMzf7EKKCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRd+/HTZR5F5A31TqCWCCTDZA/hx5fmkZgLwuaMg2qf5j5B6a7waeJTUfLJKsXS9nJLQBnHc09PqJjc/HMhTUA7ehkcRYfD8GaH7mvR/ydfrGE1UwQegqi7237hvtiiWjG4VNVsItRwRJmaYDPtuhgFyhiaGSv8rc3s7U3hMHcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+7OT9Nc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PMOv7rdk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DC02el4140725
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lm56OVWQc1lPPtQs9j/ASkAL
	ta+ZK00UwWi5EH1vPMA=; b=C+7OT9NcWNSj2JZ8Bu7Wj4DG+JlhzfoLfT2JrM+Q
	W25Kh5UcMEte33lba4QJMTsboAyVm8NCBrHHytE50KpNwzkV3q/XG1UKYfcUK8nK
	3TmJUxqebrjNE+2ubHcywhnOTLZAMd2hhzACcd1PNh1JGwgMPl0mdSYHbOcROn3d
	CUx7tC2Kbm064tvz3nHlV9CyDyqv/RYx8mpQxD60DOgHTBk8Ao32nLa6h6tOX3CT
	0MrKr8yfdZg/ltx7Jp1/aMEBUPfsugZKWTU/xjxbEMM67TAcpnHr19b2ph13DMPs
	mdePu/cwkPa8W7SeQugE7I8zl+WpImWyhlwe5/GZRB7Ikw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn2aakh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:10:22 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffaa85b95bso18129405137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773418221; x=1774023021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lm56OVWQc1lPPtQs9j/ASkALta+ZK00UwWi5EH1vPMA=;
        b=PMOv7rdk0HYwStY58uXdVInl+rZcob3vtyLXSLq3A4ucJiCqoMlAxYi+YlVpV6xLZG
         QyUe01EHPQb0jtsFgCPjgv8A+aFVv43UTThKGLpWgygTpJ96KMlb92jjFKAwldsq4eeM
         hQF4oEbnyGgdPpXvtSS/rH/MiOEbdqt+vgN88aI9YKNLOv1Dr1Sg18IlLLWfanneS2Ec
         zjAyRw/IdfbwPD8lvaT0F+hXqhN3L+toEuRlsDjNGEqcJfiMsDaMctxTy1xtvOyRsUAh
         4eL4Y13Z6x894sU6LGGuhUfcl3Rx5mYxi1o4SfyEFHZaFW4u/URmW08o401ECk22VvJO
         zY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773418221; x=1774023021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lm56OVWQc1lPPtQs9j/ASkALta+ZK00UwWi5EH1vPMA=;
        b=CjRU7/Zjg6RAuqseSZWLaJ8gLSI1m6sk9d8fVWxx/hvoHz/1WYcQqwti8yanccZ0n+
         kM+Slk9AO7y1OdfhLRy6t2Lx12QZKH+I8Nq8ZqX2jjBl+kCuBiYR8jRz+vGGC9lKx5Gn
         6gLKD4tNJUWx6qWCgqQ1G3NXQzQW9NVY6M138fKCoi9kaRa8x9dwKtX97Zm2nyK5cMHs
         NAvqN4PGdCHT0XWhieR8wP7psHSnP2OSsk6BdAAjLdpSTLRzsQ7gOrqTyyk+3Hu5ySQH
         zUHpdFSwn5lBpVSB3krl7FKtc7J0zcIrGnTRgLZzsKlykdm0dpfC2aqGqqLNu8E3gMeW
         YgPg==
X-Forwarded-Encrypted: i=1; AJvYcCU/0dvizpDJPHz7KWS0Tt6iv15NWNFXc/T6Pgowe36JSrvHIM1P5P4RfyPt0XqLTNn/v3JoxnLpLVjwwI5G@vger.kernel.org
X-Gm-Message-State: AOJu0YxMiFi2gbWF9fyNdZubLssGCna2f0PfMAZEFOoJl+aIR2QsU125
	q5PbZYTv/jkU6xF8TenxXTITpk8aopZhhlXoJv/bvzdFwI8pkUgEid8kF+q8HwefqOvvQND9Vmz
	dByOhrUltj2ctELKyvcX7VOOfY0bd7RDpjD6BkrWeTJHpPsqA4sCyEMgzAG/aVN/wLEKi
X-Gm-Gg: ATEYQzziUSgef28Q+J+kENmsvtClUr9i78zmsp++IjCJ37MU1FOlbYd17rF0RGC0/e4
	AY2lQyvOriTtrh7Hz4xyWe1g/w75Qo0O1MP7q3pVQ/kGMUq3VzRxYEN6khJ74B2GbfpT4ZNJl/q
	lRCf8NC5trhTnLt8DdyYFmt5hV98YpUTDmphujdXIVmnRO+/iKV4qO9UEqm2/wkI2zqGPcX7MnV
	YbjM0abNg0af4wfLwsozlTMkZPi9i+CPMUJPi95kFIhgT3gKxV8/RNbEsfCeKsqTrFHVPSmhG1O
	f95mY5rQw+YOu3qMtKShm5FMgqGUoc5bvG94wAlKNEFeGl/4LQV433K5Q9OpcrBtFH/tHqSH41g
	S2S6V2Dq1VZTtoPL0Qqa08bbxr7vlXnNnchYU/6U6CVk3o6SnxXOUl7TkHYHPClRE7HWDUYmHzA
	TknFn2eeQFdKC/OYf57WCm6uzx208krJVPrJE=
X-Received: by 2002:a05:6102:a4f:b0:5ff:a606:3cfc with SMTP id ada2fe7eead31-6020e8b0a9amr1866166137.21.1773418221411;
        Fri, 13 Mar 2026 09:10:21 -0700 (PDT)
X-Received: by 2002:a05:6102:a4f:b0:5ff:a606:3cfc with SMTP id ada2fe7eead31-6020e8b0a9amr1866152137.21.1773418220974;
        Fri, 13 Mar 2026 09:10:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5f0e0sm16976981fa.28.2026.03.13.09.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:10:19 -0700 (PDT)
Date: Fri, 13 Mar 2026 18:10:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/11] clk: qcom: camcc-sc8180x: Remove wait_val for
 Titan GDSC
Message-ID: <2ncpk6egdhfq7nkgtrluzxv5iryupv5lbh3jgcmn3zuvd5om7a@h3os5hj6uwfa>
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-10-val@packett.cool>
 <ac0fc154-b41c-4273-ac5f-408428c360ad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac0fc154-b41c-4273-ac5f-408428c360ad@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: d1ZLfEl1z6BVyxovdIMFsiooT-DDdxhr
X-Proofpoint-GUID: d1ZLfEl1z6BVyxovdIMFsiooT-DDdxhr
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b436ee cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=jiBLetKTOZokdF3zhskA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyOSBTYWx0ZWRfX3VN1nHRpngos
 F2NwPB7+yxwahYxJcIesRbI02i5Us05iKH117njE4tyBpHOW0NCVeDsx7pFkMl5LxXorAlgGjmI
 CowLbSksX9uBNU/RbZS7hYonLkcU+QUYiJXb2JH5cxwb3Dn/zl7svC53rBBWDCLpFbBA4uXVD6a
 kJzQUDF+WahArD5S/r71WQG7SiSEXChyhUufaZhVByiLKwLkQsgQ49/fge77C1FpUTkwjzfmWaH
 knPEbYfnMmfg+ZjNPnXYPQQ5Wj/ucQWjlgdqGPlolgl/tG3wD75vDPkoxdpgENevQg4HgzzJ4CN
 pYBUtowo3VuMnQsMOFOrqMcdo3oblFVQe3Tt30tyelXtVo9oFCm0qJrWC3J7oYstxDF/eGkva8X
 1rO21trq3JMsalynSxg59V8ToyTNYTm8n3XkkfjwKFmjoEpoFRP+0gw+WfBllh7qQNPW9+oLQbs
 bN3XyY920KUVoBK9Meg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130129
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97579-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[packett.cool,kernel.org,baylibre.com,linaro.org,quicinc.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5074286BE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 11:50:03AM +0100, Konrad Dybcio wrote:
> On 3/12/26 12:12 PM, Val Packett wrote:
> > These values seem to have been copied from newer SoCs, but e.g. SC7180
> > and SDM845 do not use them. They seem to play a role in causing the
> > "titan_top_gdsc stuck at off" errors on boot on the Surface Pro X.
> > 
> > Remove to fix.
> > 
> > Fixes: 691f3413baa4 ("clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver")
> > Signed-off-by: Val Packett <val@packett.cool>
> > ---
> >  drivers/clk/qcom/camcc-sc8180x.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
> > index 388fedf1dc81..cd4c40a81c28 100644
> > --- a/drivers/clk/qcom/camcc-sc8180x.c
> > +++ b/drivers/clk/qcom/camcc-sc8180x.c
> > @@ -2538,9 +2538,6 @@ static struct clk_branch cam_cc_mclk7_clk = {
> >  
> >  static struct gdsc titan_top_gdsc = {
> >  	.gdscr = 0xc1bc,
> > -	.en_rest_wait_val = 0x2,
> > -	.en_few_wait_val = 0x2,
> > -	.clk_dis_wait_val = 0xf,
> 
> Those are the 'correct' / on-reset values which if absent, are going to
> be overriden by the driver, with values destined for MSM8974, so please
> drop this one

Probably we should fix the drivers to stop showing in MSM8974 values...

-- 
With best wishes
Dmitry

