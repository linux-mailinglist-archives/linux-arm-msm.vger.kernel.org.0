Return-Path: <linux-arm-msm+bounces-97443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gD88MWP6s2nWeQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:52:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5262827C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC9D330117C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC9036D4F5;
	Fri, 13 Mar 2026 11:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iWlE0sQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AsS7tSvx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F960377EC4
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 11:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773402721; cv=none; b=f6Ped/POiKRm3sMqj4uRUBVE+StDTXMCCiiJ8oU+0WGQ0hownk8V97fu0doNF78/7eksqBYntTNIUDHZerpG0968V8G69kzpILfKDPpK0l+/wFs2p+qLjR5YTmPMR3WOcZU3GYdOPrjzaIiQJKIiT4/15O/FeKqBuU2DOWvPkjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773402721; c=relaxed/simple;
	bh=sxOI1OM0tiE7WtkyILuUlo5L6N3v2T029ANh2c2iziY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qT8Dir2VltzfVqFaSXgBWf4Wr2tYz6KYGGml8a+qDGKgNU13Lr1XN9+OLJCYw0d6uOGuktjMbBGZ9Gldnvpx26JUeAFepN3AkTjOmsYoqdOJkSd3Ey22Bfj1Fw+8VliDuhbBH3MREkBKwMNrupNNgNIVhO52yNDzRNw1sWGe7tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iWlE0sQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AsS7tSvx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8vQEs482058
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 11:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b4iHfh++NbbmWm/CPLemamwH/eRHGn5P/brlTPJIGlY=; b=iWlE0sQjPlpi7tFp
	wCmsmcnWREXWzmqlRNuwLleMKmkfL6nohvFk/ucro2udIL0WmJlZdjBMaR70o5XR
	0LcsmnWCvahhjwF1ktYqkeCsiI5VR0kaTqTdSyeZ2bRhjCna5oPpKXHOeDLUQ8Yj
	H2Yus1i99E6gkF8szoo0tEIRGxmbHMlf6OL8Pj/3/nPt5ROAenJcTTCMRxmB4JHY
	XxMIPaJsHnG623nh2Us7MKbysfwYRNcC01Rp4vbD1IDp8Bxt+mBUPpb+5fbKt+Ef
	abH033xr9YdeY53xeybT8cwtxg2EmtD5l0awDXMbT944C7mjHsmwmE0fQKCsSB27
	Z+AL4Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7rjhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 11:51:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a5b38affdso15460346d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 04:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773402719; x=1774007519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b4iHfh++NbbmWm/CPLemamwH/eRHGn5P/brlTPJIGlY=;
        b=AsS7tSvxF2AkDMGW1US5b+HT2nv7vsbqBrl6UIFG198/e01ST2geUrmolURUlLrM27
         q/y1uGpRi+DH0WMY7nF18tlp3YeuvYWXfUOSQNvRnL0OjaWHourftdbAkzpLkUHdx5xk
         dsl4l62eQklDWOdTd19ukJheNKgDvuPz+H/yp3I+LE3b/hWmTJGPXijpDYJ1ifSbeWef
         5J3qSExzvp4AzProS0WXYtP238WKhR0aEmAgnd8HksYz19OEm/jK6q/eXxKk7YrToglU
         21B8LasvHTXPFXhX7uIdDmT0UimPWyxxH4tUOYalvdfdvASVv/QWtAK8ueL97OsnOTdZ
         WjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773402719; x=1774007519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4iHfh++NbbmWm/CPLemamwH/eRHGn5P/brlTPJIGlY=;
        b=Sqfka4+Em3hEjj6ZUN7vnU+ua3kNsldnouw2P09F28eo7ZC24AYxuq/XFdeszKiHeP
         hiki3dWyTZjplgSkno5kRBxXi3bGW4LRCcTFb4VYNCPGMNcRQHuBXdGtASSN9qdfOhdW
         Y5emqDkiu21lDv8hmE5pLgjvFvTCuQC+gk6xqVgtbx2ln4salpNxG83VOzYMb7cl1Cvl
         1fp8tL+sThSlFnTqznApzYFe4kVxfrkSoqaTwqNjY6Wd//+JSGlqYz+CnLM7J9hxJXqw
         VBwLrva5vVLQDS6OeHlDchwMXvmWlWR+o1FUu86imu76hwZ6b4tsxv7XTXSaq9oFaLZb
         GiYg==
X-Forwarded-Encrypted: i=1; AJvYcCX2GPfRYHGFCzVhPcQjbH9uIlhYOre87jDpJpRdP6xBdhq8/CL46dofqgvv9hW7NczDkIc3PYuEYcCHjF/S@vger.kernel.org
X-Gm-Message-State: AOJu0YzNSyJOK+8/YjRx48qEV0AwB4WQBCkSROc6eL+EFc37iyak5pE5
	XUXKFug5lmxQaOL+/LMu8M40Og8eoic/f9bxxV1BrwlNNRB+9Gd6y8A4f++8QotbeLdnxBgmPNN
	r3TrJNy4sE4+fBRGswNuWJCkcuCcXlvU0B3z3UleNq+V4qlFDN607SIQb6ppkKQCciS58
X-Gm-Gg: ATEYQzzdBbTL2/crTJipF+7uPJpx9IjlbKF6foHFQQgJnIHHpuajRIoshbcs5ri5WsP
	/ng0wXQHefxaH3MDlRzklQZUpY6l3moxbii0hnnaMGtGaOYaXf2TcWNOFKpEYItvRQJdwsfciS/
	004i5xDLJ0bGXMhyBGT+Hlmdezxads+IQG1kN4VtNlo4ypPDNJj0zfxtbySDyegZWjJIbd5mI9s
	53oFFr5g1VeAddhNplVPTKqWTeYGcJko5Kvb672P1dd0KpREgl9cgv5BwSt2AMUh9Q0t7pdE+EI
	YNX+6bKt7LpqBeXRPui7wL/2ijiAHR7EOdDb8CjgniqB3WjYt0amwsLQLLkkXhNEeSv78mi/IUD
	N6AJEchEG0+uvM8krBwza8OS7RZP/WIofRIf7yh+8PJNBE8oD+0uxclV72+205SF5G4+pLYDldk
	ot3ts=
X-Received: by 2002:a05:6214:809c:b0:89a:4c1b:4f6d with SMTP id 6a1803df08f44-89a81fb81e7mr32514116d6.6.1773402718944;
        Fri, 13 Mar 2026 04:51:58 -0700 (PDT)
X-Received: by 2002:a05:6214:809c:b0:89a:4c1b:4f6d with SMTP id 6a1803df08f44-89a81fb81e7mr32513816d6.6.1773402718430;
        Fri, 13 Mar 2026 04:51:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cba6e57sm40730566b.8.2026.03.13.04.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 04:51:57 -0700 (PDT)
Message-ID: <3a80a27a-0586-41ea-957d-77fa3d023675@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:51:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] soc: qcom: ice: Allow explicit votes on 'iface'
 clock for ICE
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
 <20260310-qcom_ice_power_and_clk_vote-v2-11-b9c2a5471d9e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310-qcom_ice_power_and_clk_vote-v2-11-b9c2a5471d9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: px4NoRQuBxDqNwIgcOMQ-4SQIQDRKS0i
X-Proofpoint-GUID: px4NoRQuBxDqNwIgcOMQ-4SQIQDRKS0i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5MyBTYWx0ZWRfXzhsAOnMJxLgT
 cAgqR2zCxoYXUpH45MivA8Mg7Krrk3xbIe712Ov3PjIcfzAXGhjM0ES1FjYAWpc0gRHxqhfnOqj
 vv7sGNHmOLVDJAT6aYDn2d0X34FRfHU5mlG4T/mk43g1ugc0QytdRxYWqspj+ql49sl6E+kfYHx
 1+n5IK9Qz7M2jurIOrEPYpM0VSfcYguvAzn+kZN3YDmJ7/ba+d2z0gMQom6c16JO/ERN2PLpmt9
 lVguBPSysOTfZxblI5jY8RpFh3eBTU3VD077Y6Qta79ztsfWKH/0H6SKvmUJG92n9azpUztD41S
 y/E+/VwbMpYWa0RYfm96bDQRAmLva9+rQrd8YLP519nUldrC8KQJvLRxh04I8S6FCwz7D6Hi8aT
 Jx+8tQ2Hqpej6QhDB8fwF+0lfz3RE0HkYIW7OFQf80B9TG1EAX0ODaRua36KvddrL6oe8UAuQH9
 DihdEQVBqPd0Kpo2cig==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b3fa5f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KYTvFk41Yb9jba8_3vwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130093
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97443-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A5262827C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/10/26 9:06 AM, Harshal Dev wrote:
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
> ---
>  drivers/soc/qcom/ice.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index b203bc685cad..e05dc7b274e0 100644
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
> @@ -316,6 +317,13 @@ int qcom_ice_resume(struct qcom_ice *ice)
>  			err);
>  		return err;
>  	}
> +
> +	err = clk_prepare_enable(ice->iface_clk);
> +	if (err) {
> +		dev_err(dev, "failed to enable iface clock (%d)\n",
> +			err);

dev_err(dev, "Failed to enable 'iface' clock: %d\n", err);

(this line is very short, no need to wrap, also some nitty touch-ups)

[...]

> +	engine->iface_clk = devm_clk_get_optional_enabled(dev, "iface_clk");

Check for IS_ERR, _optional won't throw an error if it's absent,
but will if there's anything more serious that's wrong

Konrad

