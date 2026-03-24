Return-Path: <linux-arm-msm+bounces-99709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJvKIFe+wmmjlQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:39:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A183192B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 16AFA3008D7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBF93DBD7D;
	Tue, 24 Mar 2026 16:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMnccjcd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e5HArqu+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3B43254B2
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369757; cv=none; b=nwbuQhMFqGeL6C1zyq79+iY5iL1i+cUimwfiU+k0f3WF/w+THDqRBodFqaLJIKTnvegrPtrOBJ+SbTZg4wnvKQwyrQgW+9/8lmlbMb03llCtNP3KpovnK85Hi26Ux8t6QVrx3JAqceqa/njB74k2mXjCUZ4Uo//cu90JwquQ98s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369757; c=relaxed/simple;
	bh=UeD+ccyuXzp4KswNuPRvWlDtjlYsrfE5RU/sfQfm49I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kY9F9+kQ6/YJuJF1Gk5/z6hFuDpFppm6ROa3ctE9Y6rArGxZntpyHEfQuDV4X5erVgzveD3JPs3jVEJQJ4sqcqgii69o6rXnStjfmmvez2dnneztSabplV3C53CyKiamBOgjNYJKLlZt8/5mmNUeuFFi4QdAaIyretwSwovu8UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMnccjcd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e5HArqu+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OFnpPb4056974
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bloNZMqkvNgLn7Iod2PLAtBjXQ3O0Tyeu/pRamykQeU=; b=pMnccjcdYN2my+9i
	f0k7XC7iekx6zyzlz+jRrCvfSrHwX7bRClIT1qG7KpOHccUb8hlRLeDtFBBwhTbp
	ibVhTEWjXKrPae+UWxxYeLzS5QqYG7OqadRom1hVans6tuPGJNPg0TRN4tWinJQn
	cVbG34ekJdbtUCeynokXGH9fos03cWNNjEXzl96RzQX6xEgLHNZ6DypRuDqhamez
	cu1itO1VFnl+C55wpkPpk+cT0IDMotOuEIyYmalhiolhoiarApjvcXgnxLbYxL1x
	wl/BsPeGriOI5tI/tYlrLXqyu44MwkwzHAGiWg4AEceNss8h3E1EkTOYssPmYHLv
	TU7pSw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jsktudq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:29:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3594620fe97so39581712a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774369755; x=1774974555; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bloNZMqkvNgLn7Iod2PLAtBjXQ3O0Tyeu/pRamykQeU=;
        b=e5HArqu+h7er86ENHVNWoExecqsmbUoUa1CuyW8sHcWRrpB7TPtdWZmMikrx/qe3y8
         x2iE4tSocntlhI7PtS11610p8GWsKyPiFojZPw7HOz8oMNzyedWnmMwOjtoieJccq2R8
         NMZGwsQyJA8c1TiszbjtM9ovbAr2gklrQ1sqi9Z4KEIpj5zR6g71ttg+rni5weFOwK8B
         ujzNhSAp0uQy5tHvFlbfo4r6dvHXYoK8WswAHJjD8Vn5HSq5rG8qtui0BiNI8bVxBPbC
         QLg9aBAWrf6kneRAY3Ot4By7QgkikgXICIFWDgtKuUVCF4hCxFBZqKR885F6896Vi3LQ
         Ut9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369755; x=1774974555;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bloNZMqkvNgLn7Iod2PLAtBjXQ3O0Tyeu/pRamykQeU=;
        b=suGb2wj5GlqxVJWTRVNAmPyQ5UvDOlymLxqi/7hhhJzrL9zeCAqkrJGaKH5ruYR1Hv
         KShYVIau2yio/u0J30i7M3n0Qp2vM27ruNUQlDh51zxOpMvuCgUTep6DU3q6dCafrHb7
         VbTgsC96IFyecE+Rrt8Uy8zraiobUuVoXeQEOBp4eQaDxgzRduRZIhkCutL+utSdxirM
         j3B25ttAa/Siu+cLjgd8FawX/50ku9saPNTlpRaMuttQyGZB4gDTwA+6Y1qkpVz4ORc+
         Rf/K97B4yZiSLmlE8lA2h+J/f9H/HDizd1dhQieADcrxDDSCHlvoHnx9qRDM5DzDgMk7
         0P+g==
X-Forwarded-Encrypted: i=1; AJvYcCUcFr4hvACqDIQJZ643yJ8pU91IazGSHYE/dl9+4LpTKHe61qWhIlIJ4Zn0Q2dKqwZ63KXLm2hZOdAC68z9@vger.kernel.org
X-Gm-Message-State: AOJu0YxSSl8qQcZHi6n37AdvdRq1YYtNQkxuX4llLCb7ZrUJdgj266Sg
	WitQJjollpChQkXkOBIr4DxICWZwyCOFA8KUi98tExZ4seNJ4ghY/uUiZYDKpLu6s4cm102eOac
	PqlsVnaJuyTaa5hEACYvAL9fiPa/hvUjEfGp2tMkQzklUpoIrOX0GpMUVP0bvSjLQRftt
X-Gm-Gg: ATEYQzx7wMXFkCQXD33LWhWyIerfqN1gFPAEQXvn/yEHQYxgGb5dFeJhQPeFCHxnNtK
	2Z8hqQRGl0XUelidAXIl4B5we219nHelLCk3q/uAiZapJCYlTWrgZ20kcid2nA/fvYW9kz0nnTX
	+mfuWjk8UN7uuflrobK0TZqlw0FBRyReSWl/PP4NFIk1NEnNP4aW3bJI4xn9YtQyhP8LPEmDX3P
	ZvC8OqPHqqcEXgsBX9BIoCdwPmOBczYVOPMOnSIm7MtT1758R5pCcKcCrkqSXv9yIi6twem/lSt
	h1fHRItjULAi8xGR9AkUxrii0rf4FwSTn8+KFu2lWm4Oc9tlSE6VM0OfkDqRGQcjJWhOLTsA3vH
	JgIg0ZvF3mbpL4dBcdss14TqteY2msLx/rsw0WX0=
X-Received: by 2002:a17:90b:5109:b0:359:8411:a40 with SMTP id 98e67ed59e1d1-35c0db7c249mr49606a91.0.1774369754799;
        Tue, 24 Mar 2026 09:29:14 -0700 (PDT)
X-Received: by 2002:a17:90b:5109:b0:359:8411:a40 with SMTP id 98e67ed59e1d1-35c0db7c249mr49560a91.0.1774369754161;
        Tue, 24 Mar 2026 09:29:14 -0700 (PDT)
Received: from work ([117.193.213.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03172a8asm3454223a91.15.2026.03.24.09.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:29:12 -0700 (PDT)
Date: Tue, 24 Mar 2026 21:59:01 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 02/11] soc: qcom: ice: Allow explicit votes on 'iface'
 clock for ICE
Message-ID: <xksiuqiwn7scljm4plslhfqb2lyyfpfgsg6kxzlexyc4jiyebp@4j6jbcjz2chb>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-2-e36044bbdfe9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-2-e36044bbdfe9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyOCBTYWx0ZWRfX9WboFlbPtNxJ
 23BAJk+/ucC0S5lTVtK7N/gXyXp3r1U5phUcUrZh4UXOyytHgwIBMekUZuoL0nSsPFxbe8hRh8O
 Pz1mSbYV6I5m1BEyEPuJFC7AAldFX6/OLxJoMeHX15xx/bel6tKenvKtGwR+6Igm6SI+Cp0YGGM
 1mksvgT1cF+FiopI9NAC03jjIxmCZN/K6L4MeR0bXuRjVNMNKihuVNADUx2vUaOrY1Q5wEb59be
 UdnHLcGZ/hCBAu0k0wd9sW60pLpwv76OUHTFkykQh7D221mp+stN2qu++unQ+3CbSiArLyvGnpW
 NM2II3oNKeu+UAIUwj0Soyc9Ih+vUlQKLsr0CI1DOFTYZad/7w+qNQeJP+0t1tXKe0lTfjEcSdO
 BbNKY4t6HWr7JKzJcGiAVXsxY2g5JFsm9BKv/Lntucv9ybUXdatUA4RX2IY/439NyVU+fyp+7mQ
 IJpEE9kdfU7oBGUN51g==
X-Proofpoint-GUID: Y7oaLdSxu9SHysZ09EqzjfIQ51gMHnrn
X-Proofpoint-ORIG-GUID: Y7oaLdSxu9SHysZ09EqzjfIQ51gMHnrn
X-Authority-Analysis: v=2.4 cv=I+pohdgg c=1 sm=1 tr=0 ts=69c2bbdb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=uAX2OPDX363vZhsEmAs2LA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qXHk5pxgE9dKUAm47cwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240128
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99709-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me,redhat.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 20A183192B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 02:47:55PM +0530, Harshal Dev wrote:
> Since Qualcomm inline-crypto engine (ICE) is now a dedicated driver
> de-coupled from the QCOM UFS driver, it explicitly votes for its required
> clocks during probe. For scenarios where the 'clk_ignore_unused' flag is
> not passed on the kernel command line, to avoid potential unclocked ICE
> hardware register access during probe the ICE driver should additionally
> vote on the 'iface' clock.
> Also update the suspend and resume callbacks to handle un-voting and voting
> on the 'iface' clock.
> 
> Fixes: 2afbf43a4aec6 ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/soc/qcom/ice.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index b203bc685cad..bf4ab2d9e5c0 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -108,6 +108,7 @@ struct qcom_ice {
>  	void __iomem *base;
>  
>  	struct clk *core_clk;
> +	struct clk *iface_clk;
>  	bool use_hwkm;
>  	bool hwkm_init_complete;
>  	u8 hwkm_version;
> @@ -312,8 +313,13 @@ int qcom_ice_resume(struct qcom_ice *ice)
>  
>  	err = clk_prepare_enable(ice->core_clk);
>  	if (err) {
> -		dev_err(dev, "failed to enable core clock (%d)\n",
> -			err);
> +		dev_err(dev, "Failed to enable core clock: %d\n", err);
> +		return err;
> +	}
> +
> +	err = clk_prepare_enable(ice->iface_clk);
> +	if (err) {
> +		dev_err(dev, "Failed to enable iface clock: %d\n", err);
>  		return err;
>  	}
>  	qcom_ice_hwkm_init(ice);
> @@ -323,6 +329,7 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
>  
>  int qcom_ice_suspend(struct qcom_ice *ice)
>  {
> +	clk_disable_unprepare(ice->iface_clk);
>  	clk_disable_unprepare(ice->core_clk);
>  	ice->hwkm_init_complete = false;
>  
> @@ -579,11 +586,17 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  	engine->core_clk = devm_clk_get_optional_enabled(dev, "ice_core_clk");
>  	if (!engine->core_clk)
>  		engine->core_clk = devm_clk_get_optional_enabled(dev, "ice");
> +	if (!engine->core_clk)
> +		engine->core_clk = devm_clk_get_optional_enabled(dev, "core");
>  	if (!engine->core_clk)
>  		engine->core_clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(engine->core_clk))
>  		return ERR_CAST(engine->core_clk);
>  
> +	engine->iface_clk = devm_clk_get_optional_enabled(dev, "iface");
> +	if (IS_ERR(engine->iface_clk))
> +		return ERR_CAST(engine->iface_clk);
> +
>  	if (!qcom_ice_check_supported(engine))
>  		return ERR_PTR(-EOPNOTSUPP);
>  
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

