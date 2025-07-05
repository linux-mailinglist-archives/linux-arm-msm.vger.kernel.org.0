Return-Path: <linux-arm-msm+bounces-63815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CD8AF9FFC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 14:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 173E64872F9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 12:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E660A251791;
	Sat,  5 Jul 2025 12:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFEydif9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3F9255E53
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 12:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751717654; cv=none; b=J52ZWZWVxUpMWjbey2IBHwgD6hs4ZOl5rU5OaleP5CrTO5udbtyg+s75NujnWj03Nv5AM+j23TSpJdB/J0MGOd/QDhQ5LXwDeQi2t4OCNdRcAFf2gof6aEbMVrTAZgm6I9BYNlFJ9vRe95uNtNfUpfcLx9QNlQOqoxywwVZC7Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751717654; c=relaxed/simple;
	bh=seAMpBnJP2PohLbFT77DTsSpofMUFtCIgoK8sfHBeAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qjo1QfPVgkdeEne1FK0FqEJOGJq7uvDy/W/kvr/WvF26dZykgxlIiPfauLmjTsHN9VyMkPUQZFjPj5xqREnOLjjnui/SA/tk2zf0RisCuDw2FP5tsJ1UMxBSBe/ZyxwqmEQojLt9VEYa2eoitVGjQm6MiDbARnPSJDrCYicMCjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AFEydif9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565BDeRh003670
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 12:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X3R7m6vhpeMmt42NiP+KAtKx
	CzuhYxM1H5OHZBet0e0=; b=AFEydif9Ss2mTTURcUBU6IQoEkmsuLSccCcnyOb5
	VTfAMp/k81ecdON5/NnXvCErPxZPviPlUFndaAHnQVE4uD4i1Sbzx4ifQtzXrjT/
	Y5K9pJQPF0cw2cYIJj6aT5agl/m6cb+f1/+OH0dFZwITCN+T6nPmB5kOyoDipAXE
	OgSFmpGT6bgkGabaM9Qb3WcYP9Ij5Ve/R0Y1C4LlKCMPb7JHjh6jI4/Rkqeo6Hej
	aHZKGa9gGgO3ybFfVosI4vJb5QvstbSz+XCdH8Z/TzzygoCi68HoYHbeGQb/fwMD
	DbuSfiiic+OgQ1jUzyf150Xk5Uc1EpZLoWvKIloW1Lvf1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtk0t60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 12:14:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d44d773e23so433884085a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 05:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751717651; x=1752322451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3R7m6vhpeMmt42NiP+KAtKxCzuhYxM1H5OHZBet0e0=;
        b=aghx2u+UCJJHNJs/VLab4lokFFFL9elH839SnWEtFNXmmDdh7rzxW9ypuNP+iIsxH4
         BmzxZ8tk6FuR6OfQ9UY7qUyR4HJ9uBXedjPfmiA5dbqDq/ydNabefuCyR381UtdBz5hv
         56bEAT3f6beZf2pJ4hFzYxR7yRtrZhVCex3BiD8XSMDC5RB8h7arGfo0Yq/B2zU8EDg8
         3GPZ1SdQsN3q8jbsxvQJZGNjGbRO363Xlz3YJFq4U7JQ5MtImsKOL+2K6SHJzdsEzbq1
         CbrkW6tdqsJGC5jTJ5JvatmT7LftxkX0CADNAnHo0h1MXKX2q+UUtSUAeuEWD/LYML+a
         I9Cw==
X-Forwarded-Encrypted: i=1; AJvYcCX/PHZytR17csmpPweVNN/lbwrnIL74SlP+pceihJZQMBE+cJsYHW2ofvT8xY3OYxxxFXVZYoQEpC6j85U2@vger.kernel.org
X-Gm-Message-State: AOJu0YwvfTpWlI/1zh2WDrNgnmrYWxetm/LZ14tE7mX0MGLCA5mHxS1p
	rLTceI1FoylpAGpQ4gHV/gVLUiuwKpcN4RlqEbG6kJK8j68oyWWMwmq8boE2scWwGzMVUFiMric
	XoBrbLq0tU4tJKwIlqbmrbBmSJjL7q+Ff1Z+zHhAvLwzBz/KUuGjuvCjA5bFmuu984452
X-Gm-Gg: ASbGncsdlKyZplop28hA2hR78e7wITTOzFCt4qaNaqONIIq7JnXVS63lzNr4LWNOmOW
	q7f+8HYyiwDJR64DCWgGFNs6yMbbIaFt/QtN8oe9mUOHS4ySnrZ1cU6WBiutJ1u9iVT1Eai2Q1u
	06bLeMPz7PE4j1V4nK2j7RGJJD0MPwaQfuj87n92px/4lsj7LcVCZRMhsRu+33opE2XDtDx2Kj+
	sgCL4Su2/Yh2WPWVt7RKU8WPPO0bqjalXmZYLfLf81jJqmVPa18EOktl4h96lemyITeXy2yBh3r
	2JhJbaPT2jZiJNtTFsf+gBE9ihMuPieN+yF0W0e9nbtiXhr+U2nW95VRhG7hHNKkmYkOdHA9WpW
	BeKA9DG3Btv1jBphJDyUbJdWFxzpUKqZNUIQ=
X-Received: by 2002:a05:620a:3185:b0:7d5:db58:cc3d with SMTP id af79cd13be357-7d5dcd07298mr615685385a.43.1751717650867;
        Sat, 05 Jul 2025 05:14:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOs97+o0jfR6/wUb9M1mhcYSCb6Xy5iUX7EWsEjWj3V1Go8bZKGmNr9AhrCoaIdHHnYr2WJQ==
X-Received: by 2002:a05:620a:3185:b0:7d5:db58:cc3d with SMTP id af79cd13be357-7d5dcd07298mr615682885a.43.1751717650180;
        Sat, 05 Jul 2025 05:14:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c485esm562505e87.232.2025.07.05.05.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 05:14:09 -0700 (PDT)
Date: Sat, 5 Jul 2025 15:14:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: qcom: qdsp6: Add an error handling path in
 q6usb_component_probe()
Message-ID: <vyr2uogrgggvk3jrzgmvxhqbgj3ble2b2vwsqfrnbrimg37fel@72766uehk47c>
References: <1a3bf0ee02f880919190944e581bef2b428ca864.1751703113.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a3bf0ee02f880919190944e581bef2b428ca864.1751703113.git.christophe.jaillet@wanadoo.fr>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA3OSBTYWx0ZWRfX9HzRIsh3UZLt
 3NhlA95T79sbE7CONN6iMx5NYRpZTFbAkRooLVBX4fOkRZt4ckIwlN5YR6UfFPS9+j6eSCK2zTa
 jtJQcE3bZVfU7NsH6/lPSiozKWE5jKVoT2yX2TN4PTC8erUD5+Mp57Hu9+GFOrZLWzURrW2znBE
 FHJ8wbChePI6VG6qt5iSSALDw9ej6W2oCTiv5mV5I3yICQvwHNW4AEjTt8kAz439FQwDgns7F8Y
 C4jBQM61mRxQFJA++7GfNHe1bFwyy8EAZmQSwgRYBeliF/wtR/rWnfAWJsd5Yk2hHVR1V4ZDo/s
 gIaHCzfX2t8kRCDx3f+u6C6e8utJUOBvp4QiZVnTf2O8Mfxh1xd/4wwA2bxg3zXVx2UWiXAD3Be
 vypKvje3+BQpLcuy4WRBxXyXuyh3AczZIGULi7aUlExXlykPbJ2gDkWCpmU9QIcQR8flYVqr
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=68691714 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=i8X5gpMj71ElepJM6G4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: zJOYGa1mSwgKaJ8b2bKwLFpS4nvne4z1
X-Proofpoint-GUID: zJOYGa1mSwgKaJ8b2bKwLFpS4nvne4z1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050079

On Sat, Jul 05, 2025 at 10:12:25AM +0200, Christophe JAILLET wrote:
> If an error occurs after a successful q6usb_dai_add_aux_device() call,
> some resources should be released as already done in the remove function.
> 
> Add an error handling path in the probe and the missing clean-up.

Well... Yes and no. It's better if we don't unnecessarily destroy
devices in the probe path. I think a proper fix should be to move
q6usb_dai_add_aux_device() after snd_soc_usb_allocate_port().

> 
> Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Changes in v2:
>   - Propagate the error code returned by snd_soc_usb_allocate_port()
>     instead of an explicit -ENOMEM.   [Dan Carpenter]
> 
> v1: https://lore.kernel.org/all/7338875b20cb41693f803c6b9673cf7f3e5f089a.1746781775.git.christophe.jaillet@wanadoo.fr/
> ---
>  sound/soc/qcom/qdsp6/q6usb.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> index ebe0c2425927..0d998e872e82 100644
> --- a/sound/soc/qcom/qdsp6/q6usb.c
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> @@ -327,8 +327,10 @@ static int q6usb_component_probe(struct snd_soc_component *component)
>  		return ret;
>  
>  	usb = snd_soc_usb_allocate_port(component, &data->priv);
> -	if (IS_ERR(usb))
> -		return -ENOMEM;
> +	if (IS_ERR(usb)) {
> +		ret = PTR_ERR(usb);
> +		goto free_aux_devices;
> +	}
>  
>  	usb->connection_status_cb = q6usb_alsa_connection_cb;
>  	usb->update_offload_route_info = q6usb_update_offload_route;
> @@ -337,6 +339,12 @@ static int q6usb_component_probe(struct snd_soc_component *component)
>  	data->usb = usb;
>  
>  	return 0;
> +
> +free_aux_devices:
> +	auxiliary_device_delete(&data->uauxdev);
> +	auxiliary_device_uninit(&data->uauxdev);
> +
> +	return ret;
>  }
>  
>  static void q6usb_component_remove(struct snd_soc_component *component)
> -- 
> 2.50.0
> 

-- 
With best wishes
Dmitry

