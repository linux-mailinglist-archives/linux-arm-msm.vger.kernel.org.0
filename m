Return-Path: <linux-arm-msm+bounces-87138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67488CEC5D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 18:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 582883007FE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 17:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E660429E0F7;
	Wed, 31 Dec 2025 17:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l26DDjCm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="COeLelaB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7953281732
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 17:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767201678; cv=none; b=hlWhIdDSe/UY3IoZQAeJIqKwteeH6FVl0mJUqT0AcBjZ35m5s1ziZ8x1css5mi7LxNPz9GT0dlyiPklJoIA+Vc70jmcv8D14A8QNkhnRTWVv6FD4Vx1G/oDuZhZn43XYAJhzf5ekMDD7FVWKJLloUsKFmKPXp1ueJocwertq9a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767201678; c=relaxed/simple;
	bh=tay2nClDN5u0dLBH48Nigw6h2YuZIfWBwzRI6S1sBDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZawzszLY/g/dA31HD6mr5ie0sVOtWatroQLWE6IRmp9mlpf2x2inRCcj5QOGhMm1GMXcVefMsBTM/HZG2M9bNN6XeOGRp+HT4qqaXfs3Dv8QJqcPi7H6arFBM2kLYR79q+xcT2nf5+aLgfFje7YgUaKuFZRhAS99lSQR9wwrNfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l26DDjCm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=COeLelaB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVGFOUY3496690
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 17:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dQHya+Foqa5xy7dPJRKV+36g
	WEP2/Y+pPWS79C24TpY=; b=l26DDjCmDJdDv1YGpSnPc1QNc9O768t6rQXulBaK
	RCDnHrX6vvN8GkKyu4mR5kn2QZA+ABa9AuK7vicm6KmopTGQkLqQJI/ASYMeQ4fm
	zfZ5IFz2n3KdOzdZt6GY4R7Ij0zwNyM/kIBe1pEJYvkj7kp6yUyLOx/Ms9Fc3JiR
	0wmiTOaYW5qhngkjz6bOn7HqXvoKqxD0AhLV03+wPbiFMnVPJj331dUFSzWoCKkQ
	m6Y4Vvww6iD+3ppvOCY5ek7l/Yu+OhguT7Uw2EUN+Cr8ITKjDj0VReZQvHBuQifO
	hdEPl+KeolblAvOyJ1niFxquKbRbMPpIj/qOS74UOT4Q6Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd76n83bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 17:21:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a3356a310so305122266d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 09:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767201676; x=1767806476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dQHya+Foqa5xy7dPJRKV+36gWEP2/Y+pPWS79C24TpY=;
        b=COeLelaBYDvCZnbQMqSy0DRhEUMXwYFIvFDNy5K/W7Qxg1rtTQ6nN03cr3IUpje4mr
         FG5YGix6jx228fJR4i+oUpsLoLT5h3Tw+w81pAM+FNnxkcbtNDNn5gUjgvwDK5eHrB0Q
         Z+mNjO0v2M4b+pS8MfCqlnvhobrsB+UFM7f6CYfFxdIyNYjl90TuuG+vfaRbofVCBvUX
         j3TjXFDCdJKjLwawQhb8QaL5RavN/kJhvnj1m0r0vNaW6h3PYYQtmAxwKYOwQ4TWOw8A
         RkQoO7VINdbaV5XRKxUwDAah58K5SaNYOcMv/cF2R5xxHxS3mNf3GM/ZQ9RtjIilrwrW
         7LFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767201676; x=1767806476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQHya+Foqa5xy7dPJRKV+36gWEP2/Y+pPWS79C24TpY=;
        b=ntTsoMtbLeyxcNvlo0/loJLz8yeUSkjvVdJRl4H1ANl44ywZizC8w4ym3reQ7zpMIo
         Q3fh7URCITYGZ1eVLZf/t+xwiUd4WTSFth1mrq2GhmjuSzOs1dCtfj9d8OiLAJPxRRml
         9BbC6v/fwAvN5adyFAZeb8ZVFMG91cbvddF/zzW/yofLVwceHffvw46mXBu3+FSTBJUS
         m84emsjvZ7XpdfHfVgJjtscESQcadP4jNeXZhBZrC65UTuMRA+nGA+Wkar7HOwrzMO/R
         hOlK/rSvHgexASEMS1k7QIZnAYjkYPZd2UJFmhwqhW7Sry+0O84zw7j5fQY6GshYOKXv
         Pk1g==
X-Forwarded-Encrypted: i=1; AJvYcCVxCpwFceFoDaz9sJueZ+Q5wzXYmUI5h9iTfu5HWZpqzYOejTwpHHmNWzL0rAHbounbY0nPYg7lq/TD0Jsn@vger.kernel.org
X-Gm-Message-State: AOJu0YxsxY6XDAQMJPXnld73d/68yjTQqqJVZaBJ/34a114mg4OSN7eb
	yk+DJVQKV7CSAMW8CJS/FFrcpWwR30Rp9goZ+zywqhSQsgD96/w0Fpz1HK1FJ+zQNwX5fO12E/w
	qV78yU01KMqV01RqM7CydbFaQv1Qmp+q1nxdMTo+uRRI0PzgE7Qk5l1vM4FHDsfrQYfA3
X-Gm-Gg: AY/fxX7UcyuCrqCXfFo+WU9Ke77Y4z1hGaxjltrmji/Wp4arPHkWqbGu9IGtI76t8vX
	9j8Z8QJnHJwNLe4+LQ1ub7W3rZIeZ/0vTdmMBLPqhs5HMow2NdMb8fQUp2ArRWgRpGDd2U0PHNQ
	+4VpbaJoheRm0JetopY2zX1m/f4X/r0G3pr21MujxANiaD7Bur2pgQGYLpHVeCDZHzWIA35ZNn+
	nSEF1upq5CIj/LgGL9gVoIl9gyDhEg+9KLDXdawqi63LbH/aqbDZRIynya2sYFfpcgJKRshUvvX
	MyiPwcsR7a91B4rD31eqZrmc/N3T4NkEltG77PsVHtMUItMhiPSEFow1c/gdeRksv722nOtx5qF
	W5UBO7qjLy5p5EHPeS/InEEO9G8SvMKhochWNU/dqrIudje9/KVr0kDRH4Yqsn7YaopLQJhMVx9
	cAGKgjU/P4Rm/WC3er7HIrvVU=
X-Received: by 2002:a05:622a:1aaa:b0:4f1:cce1:fc0 with SMTP id d75a77b69052e-4f4abd2b121mr651869551cf.37.1767201675814;
        Wed, 31 Dec 2025 09:21:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElxxqfxXmWosBcceluFnwcdalenFNVAKYDkaw7p2gGeASm2qh7jN/6til5XY6taRDl8/EVmQ==
X-Received: by 2002:a05:622a:1aaa:b0:4f1:cce1:fc0 with SMTP id d75a77b69052e-4f4abd2b121mr651868991cf.37.1767201675295;
        Wed, 31 Dec 2025 09:21:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5d37sm11125027e87.7.2025.12.31.09.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 09:21:14 -0800 (PST)
Date: Wed, 31 Dec 2025 19:21:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v5 1/2] Bluetooth: btqca: move WCN7850 workaround to the
 caller
Message-ID: <p6lbkyrdtmd6r3hglcyvmwnh4g4p57utfu2vk7ht3wedwj5ltf@auvclksstmjd>
References: <20251231075817.2611848-1-shuai.zhang@oss.qualcomm.com>
 <20251231075817.2611848-2-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231075817.2611848-2-shuai.zhang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE1MiBTYWx0ZWRfXwpg/rNWuJ+/i
 3s4vjQlYQx1dUN2X77/Kvvpkwy7eZH7gY2C0v9xuekpyJtatHMBOH7w34wqOB9DS6i/FKZw2VGP
 +4SSrAZPIQpVarKmR7c7INfbG+XQs4H5XcqKdyFxeZOrsXJSi+OuB6rRRrseF2QX+MCYVaiiR1V
 XX0qfIcCgp3MOYPJ2SDU3Cn3m6tpQwXZCRhNywKfk9cZc/1XIPtvVH+wMiaUewEoV6fVmcWTbJq
 oTIIsmZNBanr4/eXCq9MW+c4Ouh5s/QupT5BN+enxxWjIY2hnPQKTW7F2Twcn2r6gO51nlOZwJF
 PGASFm1BZR1xqPEPC7uOdvACTlE9ocii8gHRVxtKw3sTyK/VY/WwFksPHECqFdIO3+6mGljHqeK
 z3r9HDfc+aEomM1Ng8cI1SZHrwmZkk0MSTT4PGBI+yEVNeVkhQzMLRIYaWSe98u3G/J36M4p58J
 ymqn/lN9/WVtHBDtQUg==
X-Proofpoint-ORIG-GUID: Qbp52cD7CUFY2xvpmYUp9iE9Nju9n0bL
X-Authority-Analysis: v=2.4 cv=TdmbdBQh c=1 sm=1 tr=0 ts=69555b8c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sTNL8exjfK1nApysl9AA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Qbp52cD7CUFY2xvpmYUp9iE9Nju9n0bL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_05,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310152

On Wed, Dec 31, 2025 at 03:58:16PM +0800, Shuai Zhang wrote:
> To code uniformity, move WCN7850 workaround to the caller.
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c | 41 +++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 21 deletions(-)
> 
> @@ -862,8 +845,24 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  
>  	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>  	if (err < 0) {
> -		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
> -		return err;
> +		/* For WCN6750, if mbn file is not present then check for
> +		 * tlv file.
> +		 */
> +		if (soc_type == QCA_WCN6750) {

You can move this one level up:

	if (soc_type == QCA_WCN6750 && err) {
		try TLV
	}
	if (err) {
		bt_dev_err();
		return err;
	}


> +			bt_dev_dbg(hdev, "QCA Failed to request file: %s (%d)",
> +				   config.fwname, err);
> +			config.type = TLV_TYPE_PATCH;
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/msbtfw%02x.tlv", rom_ver);
> +			bt_dev_info(hdev, "QCA Downloading %s", config.fwname);
> +			err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +		}
> +
> +		if (err) {
> +			bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
> +				   config.fwname, err);
> +			return err;
> +		}
>  	}
>  
>  	/* Give the controller some time to get ready to receive the NVM */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

