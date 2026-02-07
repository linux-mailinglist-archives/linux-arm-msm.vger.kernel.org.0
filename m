Return-Path: <linux-arm-msm+bounces-92112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3LxCMz4Bh2ltSwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 10:09:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5EB105475
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 10:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DEEE3019BAE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 09:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15B3301465;
	Sat,  7 Feb 2026 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jLW+1UiE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBnahU14"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B261C2EC097
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Feb 2026 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770455353; cv=none; b=DVheAE55Tm8ibhvVVbLfGf3zjlF8KlgxKH7XneS+WibWbXDa49WU1o7Pp2gxnyI474vFRn3IxZBn8OXMmje/UDpBjdo3b9q/RstF3ILi9+UKkG57DyNz6JsM3YSo0KeAB3KAAXFfYULSA9SsYtAUqkg91t9ykph48XL4IOBnPG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770455353; c=relaxed/simple;
	bh=/Q0De9mLDPa8YKtGWTTYvyBpC4eza9AMSOw35buO/K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzdG0i/XkibDNy6r50EtWLGre0i6Guy2YGVbpOQHwlxusUe2AGfvUZ9g55h/cDAwjuI96iNs++LVNEwCP1JGgCGE3s56/VQ/73tMf14yIrVUIYuZ9puJzyDwfE2aJRLqZeAQxqU3mJwVkZszo6oq6T8RQOxqGR4p0EKu3R442hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jLW+1UiE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBnahU14; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174NqiT1628508
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Feb 2026 09:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wKl1UJTA9PkCdgtMISsIvfb7
	RdXoHgYLCJ8J6Lj2IMM=; b=jLW+1UiEqLrQtP04viQnA0hcJiZOH/F81El8hWzj
	v9UB0Hj0ngmIvz3/BR4QTZpE+dRAZFN557S9gzMm3Z+7Cad2OmuTW1LVN+HgHy4p
	ZRpz/5CnlULKXMjZi2HfLAKKI+Yqj7Bnf/Qkt2lxyh8YZaNjszQ2mDHzJ9VPpqNk
	eN57JUOT0dn8tCp557iVHhU65OC0XdpfiRw5nhXfJpCfI3SDWDjV1HWuzh9+jlK8
	skGGbvtRRyAAmIfkNvpAi/Sk/nXNopoo/kw+zUYyOY4pw49mKFQ2RMnePfArCt3X
	CDoc+G02QyDAhV0CDEQFOVoES7ez3bq07KK/Ev9Dp6l8eA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xb50dmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 09:09:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5014ad65e3eso108358941cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 01:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770455352; x=1771060152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wKl1UJTA9PkCdgtMISsIvfb7RdXoHgYLCJ8J6Lj2IMM=;
        b=FBnahU14dOaf86hC0vZs8pn5EcWnRPauhnVNloN5J0dysoeBB+jWJQQtVkeDv4fUO+
         1P5Orj089gQqR+BZnPKdTBxjsvFCgktpb1IHMnRnl2xDZS2PT3yMvCulRcxoGd9993xn
         quzayDYn9TmkX2BMxiJCmFqIcxZRr+/k1uoDLAQduNyodcxYDd+h0v1zp1Bohiy0cHMb
         Ch9kXw2Zyyj/7mPr56TfrDPM00QATZXus/tr3QbcQ4arpI6vY+mfKDlUDtX4r2AgqMk7
         I/TEH5ES59OJTqFZ2ZtpBqLrIk22OAvoAlpgjM+lK9lI265xgVvwEfKekEopndZYYuvf
         boDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770455352; x=1771060152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKl1UJTA9PkCdgtMISsIvfb7RdXoHgYLCJ8J6Lj2IMM=;
        b=rnv0dUTCt65XDEkDyk1tRfN3tFkx9hI0ZXajosRS8e49pIsB+DJTZOTdZOIrtDcINT
         o3BQhFonsi4bT5x0pKyWSXyMTjgBfO1vLQgXqeqdwuVatygoLNDTpj5lb6kDeWMhjBOV
         U58O/R3rLk5WsdmPnI54dTqBq/2nlONAZyRPIVJXq+wxV3k6TPj69UYiwrUkK+Xb3/1s
         Yri6MFW+SvXnXikzHASLVHC5ysd3MC0Tdv0tAQ4h3ADUsZ7QDqHd+lxSqngRYsgk+r8U
         CBzcQZTnA0AuOb5yzPbA8Qi1i73O7LHeQKIQPsufRTPHedzpi1Wk09ztuELwTwEPN8I4
         Xxtg==
X-Forwarded-Encrypted: i=1; AJvYcCVFhZvgDv92OlVPI53irM+U18gBOZd20JK5MaXk4fJIdH7wKfEnSAmg9v//RKBe4EbqVE6yhj6x4QlLCs/E@vger.kernel.org
X-Gm-Message-State: AOJu0YzMSdHVZ7hK/b2QbuVHsqu8kKmu616iO48DVcmXkgCdS8v2ExKY
	ab6Bn0qeASHn6g2b6SRCrFHmMHdNKT382CvExDh2zaGk9B5w4rv4mvf9tbbnHSplJ3YVEo0pZ89
	cAgvMpn+rkAYP6h6cwMTAcVCaan+Z9VprC5+bEdVlUlWyvlw0aNvQGSlKt3905L/MEpmh
X-Gm-Gg: AZuq6aL61BbY/P5oN8l80yXjGh90DA0baOT393uLOmrCYZbcw/pK4nvdkFpUy51QOvw
	ZV/mAgRT5SZl5XpotNkDB4xJNRg4hrcVyAYzL7F0mbdpvQBiEtBgP+gLq10nCZZoCN9GLhqaZ2K
	cZ3/MsA4Fnn++G7fZsex1rD8Miu2jUAC4Gx3R04MD0AQ5Hla4MCWvlA1+CcEjArVn5RaPbT+Soc
	zhN6JYU1gWuCUIve86WfQVe9HyRn2+d/UVfERm5rpwY2rkQReKRDJDbJ4JQYdfKlsJOHqeEiCqU
	2uNImS0rkEBJ3w5+B4sCANEbgAhDLO4h6G9PaMGzz/2kkBCylhGHMdUt4dmKI0Q3dZbSzSJxNzW
	UwKjftoJ/4m/etpvFomcx+KBgHYtgSrGla+d/nUUob47deMGUkg3jtWCEXtIDJg/Dg9Z2IB4qI6
	jLSaTmXYFRf5zC5Ks/7ZtLHF8=
X-Received: by 2002:a05:622a:134c:b0:502:a218:1cf with SMTP id d75a77b69052e-5063927d1dbmr71949571cf.4.1770455351832;
        Sat, 07 Feb 2026 01:09:11 -0800 (PST)
X-Received: by 2002:a05:622a:134c:b0:502:a218:1cf with SMTP id d75a77b69052e-5063927d1dbmr71949391cf.4.1770455351341;
        Sat, 07 Feb 2026 01:09:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cfe00fsm1198900e87.32.2026.02.07.01.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 01:09:10 -0800 (PST)
Date: Sat, 7 Feb 2026 11:09:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: qcs615: Add missing dual edge GPIO IRQ
 errata flag
Message-ID: <k2t4jm6vqkrp46reo3nhr4e5awthm4gu2crow3hnl254p33ywo@pbbdhtdq5ag7>
References: <20260207-qcs615_gpio-v1-1-3b3923a3bdb9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207-qcs615_gpio-v1-1-3b3923a3bdb9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QMBlhwLL c=1 sm=1 tr=0 ts=69870138 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=Csa7zoAcJ9EAlDMVfGAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: V_gOD1dlLCV2RkEPBC9rWJoFzWul6HxM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA3MSBTYWx0ZWRfX7OgM+KETp1XU
 6zm1F9jD0XkNsamgd91RVTL5KjYv89S0YBZOLhvrnBFmi6QhXOnEUWRc52tNVWI/WV5rJDcCYWY
 hJm2knL2+rLx5AExdBb/5r34xme8z2VuiWLClPFDRPLiU8p9ltOJ/7I/g9bafTUVgR3qBopiddO
 z5PUQoCD6V1FYsX+q7BmqcjnSWjau++T5+U5/fbo6mLR/fr+fk6n7KQqDeQjsKNJSc5IPe/BMHd
 aLFGUVfUgbrujmHBb8t2DJEWiyFsjdHN+WZuND4qTu5QO4T+b2vTSl/+n/d2iJMbk4QMHx2y8Pg
 LjjCg7ydYnf9RqOurZfnG4ga6eS2jp+LQiclawFGYLqF1PQPnody+jzp12SC27jsDPaZmgvZIGr
 814O9sAwl8C8Jpay2EFZKAB2SodKIzo6y8Jzt6mFl8tHdoICD6VtFGydzUSHj7de5g+5E0LmoZ/
 mCpe2zs6+7Bibrs723Q==
X-Proofpoint-ORIG-GUID: V_gOD1dlLCV2RkEPBC9rWJoFzWul6HxM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602070071
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92112-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F5EB105475
X-Rspamd-Action: no action

On Sat, Feb 07, 2026 at 01:03:30PM +0530, Maulik Shah wrote:
> Configuring GPIO IRQ as dual edge breaks as the wakeirq_dual_edge_errata is
> not set. Add missing wakeirq_dual_edge_errata flag.

It breaks because HW doesn't support it, not because the flag is not
set.

> 
> Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platform")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-qcs615.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615.c b/drivers/pinctrl/qcom/pinctrl-qcs615.c
> index 4dfa820d4e77ce8157a3503ee8ec6e426b54e030..f1c827ddbfbfa59d03ddea560eca36ffa997aa8d 100644
> --- a/drivers/pinctrl/qcom/pinctrl-qcs615.c
> +++ b/drivers/pinctrl/qcom/pinctrl-qcs615.c
> @@ -1067,6 +1067,7 @@ static const struct msm_pinctrl_soc_data qcs615_tlmm = {
>  	.ntiles = ARRAY_SIZE(qcs615_tiles),
>  	.wakeirq_map = qcs615_pdc_map,
>  	.nwakeirq_map = ARRAY_SIZE(qcs615_pdc_map),
> +	.wakeirq_dual_edge_errata = true,
>  };
>  
>  static const struct of_device_id qcs615_tlmm_of_match[] = {
> 
> ---
> base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
> change-id: 20260207-qcs615_gpio-7b76c94f6921
> 
> Best regards,
> -- 
> Maulik Shah <maulik.shah@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

