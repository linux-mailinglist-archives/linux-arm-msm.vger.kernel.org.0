Return-Path: <linux-arm-msm+bounces-90383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIsxBU7Kc2mQygAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:21:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 681107A1AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2625030087BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9007F27B327;
	Fri, 23 Jan 2026 19:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7BHBAu+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jVB92avJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250EE208961
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769196107; cv=none; b=dphjdMoJjcFJ1TBZIx0Vu4wUKhxoER14KO++c35UujlKeictqlRp16W4/JAp8+oNFeYC/F+WZDmK1juCan1Xdni//Xm/xDBqt1tsRghdF5h8W+sShhmf7Yi9/P5TnkQPoN/hlVURHn2uV4NmCLoBfTMQkQ/aUNU3P3cPkpcaV3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769196107; c=relaxed/simple;
	bh=3ih25kkrbzzOIKV5SfFyuGNMM9BXQ24vJh42IpI2S7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OcetsUHjnO9CJHcBN6gw+i7NiqUT76qQYuVyv2YeSqzCFLsqbsSEDVwJwz0r8LAMQwxTV3gtXaNSwQhQhMvsYBCW1vI/iMqF7+MlxEg9GfrBq6Majyou5UwXI98ruDv1ToeOO9mWQfAncKYch5VbYAkfVbwQUQj2RxYy8DeSBk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7BHBAu+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jVB92avJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NGIbRR3649785
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+N5DapHNEE3mGIGkjplP4cJj
	1SZDYlh4Lmk+xa+z4L8=; b=N7BHBAu+8hsCETRgaa45xIHsqdpRloFSKYmrwiqP
	aaxeGRKzWDvPoysW7QVaqo82uKqzIO6EfaY2/m7kdF9gneyabzdG0Zy8AfhcmuZw
	8JHdc3jDPE2r69uYkmBugE2H0Z6ys8xzzp0uik+RxF4bM8T5xMMfbJD4QweylX+S
	Ti/a5PZgIIMotbQqi+zJdBodHw2BnpUYvDy62NyehBsCfnH+4oWjQII1yOTu/LMo
	UQ5CCjeHDC1zFLMZmAINYWOcDPgau0nFON6oQKMna8zlV7yrsZNvTWWrmZLD7dUq
	4qwvnDUwKn89EHG+VDw5xRdg/iVsegDo/kJPtki45Y/g9w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buy4nuhbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:21:45 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ec38a3265aso6482133137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769196104; x=1769800904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+N5DapHNEE3mGIGkjplP4cJj1SZDYlh4Lmk+xa+z4L8=;
        b=jVB92avJt9hMIMUqhfCAzUVqknc0GASreG3dplnQWkrWYzcFeJLFZKxP/J+x1uKm1z
         RP/P6HYVEo+KFg/x3EaaOzW9OI3JY62nHcZ7GOTAiYavPuTa9BP0dGz+4EGZ+1F3FINg
         T4zomSIRtHrD64T5kLoZVDLZiYWZn9I7pmQOxUJyikKbv/MpeBlKwk+H9FKXiKie/Sk5
         5CO/9i9CVUk4Xvcmc/9nc+R54P6ji1MsWB1cshVFIQ8yRgDawJDMXfQFgeYk8u+CfZud
         Htd6dL5Gc1Bpn0SaJBYTh28xWr1HhLFOl2ot/5niSlOtdnnH/Gcuxeo47Z7Dnmg7HcQy
         l1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769196104; x=1769800904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+N5DapHNEE3mGIGkjplP4cJj1SZDYlh4Lmk+xa+z4L8=;
        b=VkZ7+i/t2M4nT9gcH2w/G3Sv+C0f4ftzF4sN9kUTSPOWd1VJL8I6jgdBH49HiBNprf
         X1y4L9Vu+skq/knEFql/5P6wobCzt7LeMS0cht1j0WdF0EV4hOPqhH9QuPh8ATj017+5
         SvUsBf8Wl/waP4ztsOc+OCeed4U22zusbXWe8f8t4kBkNMl4OWUUl8JVuuk66NEtPh10
         muTm5KCrVNITA3UqjCpACg4Pk1D60CtxGv9ZxVDFKQeLqxnQbyHOAs2QbWsfhJpE7DQ5
         4qyo9hxHMjuWdv9BQMTp1/e6S3JsHACwDwY1frh3mDusooVLAc8t3ZGXdIbK8ViY+xDM
         cmrA==
X-Forwarded-Encrypted: i=1; AJvYcCWh3yawkefLQdQcxG0c3nKBvGsr0K9Vj3VnSrKnlcT2yqgMaZ+chITyyXQZVlgjNH/9O8JLQKTV4WrjDY0X@vger.kernel.org
X-Gm-Message-State: AOJu0YzzgUkehLUlKMvC+gkxN5GpTtEU1jBucvJW7mIzU+2yWMuFzLna
	dh0TvoRdQ4GBg4hyJV+niDUWt+q2VKOibclOnmivKFzmv9vByCmBanXxuTN2iYoWZLnyV5HSsfy
	RvGBCkt6bIoWkLOJ0cbMcSO7P+pwZNRuxaqpIP64hS1PffAx98EfEfCIik9FYOhx3Ol0Q
X-Gm-Gg: AZuq6aJnbihgA48iufAcz+U9oIaxt1rqT513kfg8w3Ikx6O4zHC7Yrc1WCbIob1aUuP
	2BxcgOyXuCfM9l/5nD9Orrf0JQXQoXNMkYj1qIyeMsE9dy+mkppY/CdZP0DNuTFZPLFunmAuxx4
	jJG50QyT87TWCli/J+tZ78+su4PzGa6CTC5Ybysio6l68MtniIavzZJy8GwbknoxIIlbJbPJSkk
	Bs12q3E18AUT7yiO4P+DI5gfkdAFUWJTVnvdVYNQdUH/FpFrO57n+f+nlVgFwM6ge1j7HGEjDYY
	q1czTG9cbWxgnLEtW+GEe0iq6Q0euuVvFukBivycZetqhkF1ZLuJhQ059p+Btm8C4vP1eqlf4sT
	1SbN7Pf2PdLVmYcROBGarJM3TCmk1l6SedBIlcJ7ZURVIHtGjv7EtDaW1bnzjgHCrdcBBL883Ia
	kCdMgt+jSpgd5BwhI65b20NTk=
X-Received: by 2002:a05:6102:162a:b0:5f1:b59d:a824 with SMTP id ada2fe7eead31-5f532e913f2mr2426492137.10.1769196104290;
        Fri, 23 Jan 2026 11:21:44 -0800 (PST)
X-Received: by 2002:a05:6102:162a:b0:5f1:b59d:a824 with SMTP id ada2fe7eead31-5f532e913f2mr2426484137.10.1769196103867;
        Fri, 23 Jan 2026 11:21:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de491f9besm843579e87.73.2026.01.23.11.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 11:21:43 -0800 (PST)
Date: Fri, 23 Jan 2026 21:21:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH v3 1/3] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <gfqpfzulzptkrbcrc2zcnqv6kmtdgwwxqc2rxnbq3rlh7azilj@srzlycd7wv4d>
References: <20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com>
 <20260123-enable-ufs-ice-clock-scaling-v3-1-d0d8532abd98@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-enable-ufs-ice-clock-scaling-v3-1-d0d8532abd98@oss.qualcomm.com>
X-Proofpoint-GUID: c2wkSTd-2mwUwRgxwvEcezNWRTq7_9Hb
X-Authority-Analysis: v=2.4 cv=I5lohdgg c=1 sm=1 tr=0 ts=6973ca49 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5EJMvZCbbiZMwH2kwcIA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: c2wkSTd-2mwUwRgxwvEcezNWRTq7_9Hb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDE0OCBTYWx0ZWRfXzOGu399Vc35Y
 kkvhjAoTXMNJLvUPmfuwavrq9I0eeT84Y6+W45+dz361nj7iZDwJRQuPM6mJmNTs3ANXIXcOZkH
 a79M59AWRkxlpxq9A3OfdlykDP5RsBkt/Hkhg4ysrtISfMyvUAQo+pBfyYcdqrKU+5MMy7gGBaX
 qT3IuWqdJ/CXN2v4cJuZwoqp8Jaw/FDc6G5OMluJJjHukhUYmZFAQ/ww3uXSLG6a6Qg26Shuunl
 GkSG7UZsjXJ6FmrbVKkKaFU/4TkRZ4f5ZWobZipn5t8Vhop1RZ+j3DKXxyvXn386N9aNdmh9zT+
 tkd2+9OzR9Cm9jaPQAdH8M/4KTi254luwO2++7FLRoRT6H9zf9Sqd5FVrnFBUTQ19PR2ilXne4y
 /5gPU/QMuWgBq2M4rVIOjAUFmJQl25ovtQrBVwfLMUEJ6jCwni2gsMS5NB1MgAtYfGSRWzG6gpi
 xmukBkt7Rchxeme9onQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90383-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 681107A1AE
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 12:42:12PM +0530, Abhinaba Rakshit wrote:
> Register optional operation-points-v2 table for ICE device
> and aquire its minimum and maximum frequency during ICE
> device probe.
> 
> Introduce clock scaling API qcom_ice_scale_clk which scale ICE
> core clock if valid (non-zero) frequencies are obtained from
> OPP-table. Disable clock scaling if OPP-table is not registered.
> 
> When an ICE-device specific OPP table is available, use the PM OPP
> framework to manage frequency scaling and maintain proper power-domain
> constraints.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ice.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/soc/qcom/ice.h |  1 +
>  2 files changed, 64 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index b203bc685cadd21d6f96eb1799963a13db4b2b72..ca6a7df7a6827378af1f013c7e62a835d1b80cc5 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
>  
>  #include <linux/firmware/qcom/qcom_scm.h>
>  
> @@ -111,6 +112,9 @@ struct qcom_ice {
>  	bool use_hwkm;
>  	bool hwkm_init_complete;
>  	u8 hwkm_version;
> +	unsigned long max_freq;
> +	unsigned long min_freq;
> +	bool has_opp;
>  };
>  
>  static bool qcom_ice_check_supported(struct qcom_ice *ice)
> @@ -549,10 +553,29 @@ int qcom_ice_import_key(struct qcom_ice *ice,
>  }
>  EXPORT_SYMBOL_GPL(qcom_ice_import_key);
>  
> +int qcom_ice_scale_clk(struct qcom_ice *ice, bool scale_up)
> +{
> +	int ret = 0;
> +
> +	if (!ice->has_opp)
> +		return ret;
> +
> +	if (scale_up && ice->max_freq)
> +		ret = dev_pm_opp_set_rate(ice->dev, ice->max_freq);
> +	else if (!scale_up && ice->min_freq)
> +		ret = dev_pm_opp_set_rate(ice->dev, ice->min_freq);

Do we expect that there allways will be only two entries in the OPP?
If so, it should be a part of the bindings. If not, please design the
API with more flexibility in mind.

> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_ice_scale_clk);
> +

-- 
With best wishes
Dmitry

