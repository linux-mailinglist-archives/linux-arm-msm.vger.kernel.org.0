Return-Path: <linux-arm-msm+bounces-108772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PCsCrTIDWr93AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:44:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9971B58FE7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BCF730B4CFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3093EA95A;
	Wed, 20 May 2026 14:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgmR/z7d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fdw3vrrW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0543E9F9D
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287038; cv=none; b=PubXLxhCf3PlP32k2W2DTa8bo1e9iZXfLlri6kGYveaKRsZNj/74O1fzcc1GTHJ1WzFuX6EyebphZIFDWtpV9o9q09tAFNe4eVuYV+ycKguOZyktuYAgvccooBoOhak18zx8zrL79NyjUdXmEf2/2Opgn5ZWwxvpeNnv8bFVc4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287038; c=relaxed/simple;
	bh=qmCaiUhsXRp1nBJFDpnj4/1kbPlAml3acNXDkbqeY8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yo5rmhNRpKStp7iiTZdoj7DNN04w3D8MV2z/tk9B6xBcdgeEPbZ58HGJ9q+jYV8zbNl7M9CTv/SpeOcjWMCeJB4ztJGkpH8XtswE8gCDytcIUNyOtdqu8NDi26Z052E05b9ZfPmsBo8S32JCgJ3OuQpVWwhmQMImkINbOvwKCJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgmR/z7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fdw3vrrW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE6T8C118977
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zZgC57Ii0BTYgfnbECyQYyWw
	TDZMq6Ouh/2/CXADmS0=; b=LgmR/z7dVuueTtWW/lppz/vir7A6gg1VwtnB751Y
	GfD0zhBwFbr1SUGpI/3RkOoQSNDjKHEQ3pfs9fLv9hJ9+iFv8/PQCxgjXhLDa7ow
	lnc/RkTazKRZcdyuyeb/WWhP3u/jY2H9j7snh6dhPT12XVJ4Rn5pMeTC7L/AjFd3
	lsj/FDUtPQtcDSqq0koLghczP3GbuwktTDPdgs0plONjD7a63QMxif7NKXB3KOKr
	eQw2ZRnKjJg0Co03zsPrJr9ol+oz+fRHK+OWA45z7y6t5Wpqog8+hqyjzZm3VeLX
	rgQpG76x9VGlTJgnpqpypUmdajaL0w4aNCEXQRmdFdOmNA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee88250-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:23:48 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-575456ad2b2so3793238e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779287027; x=1779891827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zZgC57Ii0BTYgfnbECyQYyWwTDZMq6Ouh/2/CXADmS0=;
        b=Fdw3vrrWwl/sccQjJcFUVeZBZdI8EJjrqKT6lhwDUumhgzFxV6uprVZNIeU6UmDn5P
         nOX9/JAOkuHCB9TqWyokpnEI43KXEeRVLp8+7mwWm120vlJaPy7SbjOeTPibON8JoiTP
         8zjaADQ8yec3kcGXF4aFYNodaHCESnEfyLacfC3rRV3j9tfmp+bKIuMbPLJyuR75Nozs
         JR/NzWlfkMKdwPtAs22fSuld9Ko8HVbHZLt1DC3rzQe5VgOfXYIHpC1E5fdXVqAT3dKe
         J8U7hUtLdI4yfR7Fb8ye4SBdHrpUTzxdyFYjsFZwg65yGTxGg8RnhMKP1RF1UawroYdP
         Kelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287027; x=1779891827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZgC57Ii0BTYgfnbECyQYyWwTDZMq6Ouh/2/CXADmS0=;
        b=AVn+KYUl+N2p6Duhqf3mSTLQ7DRaEhkUWCPrOBkvyc4/ksqgKgWi4x7IfPMOEWNS6U
         NtFRGi33dF00es2ZTdY+IibHIWDZexYxKFg8VBQW1iN3IBdM+9milwI4WI3v1AINx93e
         Pv6HFPcVY5nPNUgRRXFYyz+NAQsxD4h7SLx4CNzAWUsAigiXNIStiOBJD4SDcuGz/IgI
         6BEgOIEKt1CJow10rEukjXUcvquuBA2TZYHgUU+TkSCM0dEY2fLFgQajFav9zeKIpKRM
         E4z4R7TfPEDwzGrF1SRyzCi9zhOP5PlGxegoN9qgALQCeFLqqI09xC8NjnXbP/5xr1J7
         /yTg==
X-Forwarded-Encrypted: i=1; AFNElJ+TCQjvaXH+t/30xRTfrNDupGeS3cL8kT4XQv6VDy/dc4wHrnnLc7JKcuL9MUO+3XDTI++8x5++U0nDRT2a@vger.kernel.org
X-Gm-Message-State: AOJu0YztCRDlLZ1RGZUMGdijdEboe8atBMMaznLc63/Mh3sOQ3WbmdrD
	fflU+tSdElS2SiOuPLFXkKMsXj3x7PWQgikVzZ+3U89TYLcyi3amj/eABbqfNZFBei7Cd8MwRmR
	8k9lvZAHWhtB3l4USd2rQilJN/LvVOca9Zim6ok4822+w9RC4E0bXifoSg2RpZeTsP8il
X-Gm-Gg: Acq92OEMcpaO5gSSVZNh8wkk31Rp/FdKwiXo/MMAZRwpmOZPBQKsbazcICPmxSDcBgH
	Xy8h8EhGuZvMDfHP+3W8ldcaS3VCPLN3ZVjgEgJWlCrtvmbFUCKNenYjDtkJLpeUo+1tIClHCbc
	O4r+LyJhZq8ngIDmx6HM9Rcs73Fu2vAKnedQK01NqfnUu6MvQU3FUUS8+ITyXE0w2RyAYu/oIzZ
	50d7HzuTi+qZC4iSsFdzc6p9we5OAoo2A/qWABRUV2gx/11PdxZ/QM9X8EtUvrCKWKFo1UDq5cg
	+2LVC5AOwEEW86b9m4lMGpj8MypEC3HAV9kkKfJU22BAi32OD6JXjbROIsUGud9lUKEohsoYiTn
	hE7qt2FEZvE7LghZNy2thu0wYVMzbm+ahNvCYjbs5k+bilqoBEwq2IrrO5dLHq3f8QWXevWhqJJ
	CfPv4rUmQWaMg6KBq9tYOOkkd43ui2d9MJ4nlp/3DZHrlAoA==
X-Received: by 2002:a05:6122:920:b0:56e:f071:d4ef with SMTP id 71dfb90a1353d-5760c0347e0mr11445824e0c.8.1779287026886;
        Wed, 20 May 2026 07:23:46 -0700 (PDT)
X-Received: by 2002:a05:6122:920:b0:56e:f071:d4ef with SMTP id 71dfb90a1353d-5760c0347e0mr11445742e0c.8.1779287026305;
        Wed, 20 May 2026 07:23:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cf080sm4955924e87.74.2026.05.20.07.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:23:45 -0700 (PDT)
Date: Wed, 20 May 2026 17:23:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ekansh.gupta@oss.qualcomm.com
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 06/15] accel/qda: Create compute context bank devices on
 QDA compute bus
Message-ID: <f527lflctqyqjrotd2qerlx4oikg6st6u2seqsjw6u5krkqrab@uhw33gnkp5c7>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-6-b2d984c297f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-qda-series-v1-6-b2d984c297f8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gUklj2WE7HVGIoUwPvp4d3dBXGMpHDGG
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0dc3f4 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=R2qd4bXIq2Q-l4e3V4sA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0MCBTYWx0ZWRfX07QxgwkwCaJJ
 Cae4brQBq/XpuSU9MIca96GYXFGYixkw+wkZLaEsLghsLx8PD4wYit/k71BpdFPydp0ck2HoM95
 YqxQyoBwCiEozks/r0XGmra2sV6wCch6Ifde9tGO5UVIJf5+SdkN+XW/bYiV2ROx9Olt8rDzUlw
 UznCxvByar7gRX5XDh/8duIqMwVfD0aC6QcO7y15r2s5Rjjo7SavivK+TpABkIJVEKXnYSNLZTD
 jxF3TJTzLP5ESNYhPIPE8vga5grl+oeXtZ4ifruZdb1bgXwy2pEglykalGN9Fdh2myViSJ37jvF
 KaWF6PchHFXKxZTvs+ufM1NpoqUw8V+9Shu4QW3rE+zUia5yUekXL9fPF8GuTsUmNgYnkPG9bc4
 ervLiVm7N2W8zaZw/PCllLiAdZ7cxz8OjrutgzNFJJqlO4izlitWFgS51OTzV1YBUucfgKIv7kn
 BAiYSOkH5n0RyDQuXZQ==
X-Proofpoint-GUID: gUklj2WE7HVGIoUwPvp4d3dBXGMpHDGG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200140
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108772-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9971B58FE7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 11:45:56AM +0530, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Introduce the CB (compute context bank) device management layer for the
> QDA driver. Each DSP domain node in the device tree may contain child
> nodes with compatible "qcom,fastrpc-compute-cb", each representing one
> IOMMU context bank. The driver enumerates those child nodes during
> RPMsg probe and creates a corresponding device on the qda-compute-cb
> bus for each one.
> 
> The CB devices are created via create_qda_cb_device(), which registers
> them on the qda-compute-cb bus so that the IOMMU subsystem assigns each
> device its own IOMMU domain, enabling per-session address space
> isolation for DSP buffer mapping.
> 
> The new qda_cb.c file provides two functions:
> 
>   qda_create_cb_device()
>     Reads the "reg" property from the DT child node to obtain the
>     stream ID, constructs a unique device name of the form
>     "qda-cb-<dsp>-<sid>", and registers the device on the compute bus.
>     A qda_cb_dev entry is allocated and appended to qdev->cb_devs so
>     that the list can be walked during teardown.
> 
>   qda_destroy_cb_device()
>     Removes the device from its IOMMU group before calling
>     device_unregister(), ensuring the IOMMU domain is released cleanly.
> 
> CB devices are populated before the DRM device is registered and
> destroyed before it is unplugged, so no DRM operation can race with
> CB teardown. On probe failure after population, qda_cb_unpopulate()
> is called to clean up any CBs that were successfully created before
> the error.
> 
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/Makefile    |  1 +
>  drivers/accel/qda/qda_cb.c    | 99 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_cb.h    | 32 ++++++++++++++
>  drivers/accel/qda/qda_drv.c   |  1 +
>  drivers/accel/qda/qda_drv.h   |  3 ++
>  drivers/accel/qda/qda_rpmsg.c | 12 +++++-
>  6 files changed, 147 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> index 424176f652a5..143c9e4e789e 100644
> --- a/drivers/accel/qda/Makefile
> +++ b/drivers/accel/qda/Makefile
> @@ -6,6 +6,7 @@
>  obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>  
>  qda-y := \
> +	qda_cb.o \
>  	qda_drv.o \
>  	qda_rpmsg.o
>  
> diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
> new file mode 100644
> index 000000000000..77caf8438c67
> --- /dev/null
> +++ b/drivers/accel/qda/qda_cb.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#include <linux/dma-mapping.h>
> +#include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/iommu.h>
> +#include <linux/qda_compute_bus.h>
> +#include <linux/slab.h>
> +#include <drm/drm_print.h>
> +#include "qda_drv.h"
> +#include "qda_cb.h"
> +
> +int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
> +{
> +	struct device *cb_dev;
> +	u32 sid = 0;
> +	char name[64];
> +	struct qda_cb_dev *entry;
> +
> +	drm_dbg_driver(&qdev->drm_dev, "Creating CB device for node: %s\n", cb_node->name);
> +
> +	of_property_read_u32(cb_node, "reg", &sid);
> +
> +	snprintf(name, sizeof(name), "qda-cb-%s-%u", qdev->dsp_name, sid);
> +
> +	cb_dev = create_qda_cb_device(qdev->dev, name, DMA_BIT_MASK(32), cb_node);

Wrong prefix. Pass the name format and the params to this function. Use
kasprintf in it.

> +	if (IS_ERR(cb_dev)) {
> +		drm_err(&qdev->drm_dev, "Failed to create CB device for SID %u: %ld\n",
> +			sid, PTR_ERR(cb_dev));
> +		return PTR_ERR(cb_dev);
> +	}
> +
> +	entry = kzalloc_obj(*entry);
> +	if (!entry) {
> +		device_unregister(cb_dev);
> +		return -ENOMEM;
> +	}
> +
> +	entry->dev = cb_dev;
> +	list_add_tail(&entry->node, &qdev->cb_devs);
> +
> +	drm_dbg_driver(&qdev->drm_dev, "Successfully created CB device for SID %u\n", sid);
> +	return 0;
> +}
> +
> +void qda_cb_unpopulate(struct qda_dev *qdev)
> +{
> +	struct qda_cb_dev *entry, *tmp;
> +
> +	list_for_each_entry_safe(entry, tmp, &qdev->cb_devs, node) {
> +		list_del(&entry->node);
> +		qda_destroy_cb_device(entry->dev);
> +		kfree(entry);
> +	}
> +}
> +
> +int qda_cb_populate(struct qda_dev *qdev, struct device_node *parent_node)
> +{
> +	struct device_node *child;
> +	int count = 0, success = 0;
> +
> +	for_each_child_of_node(parent_node, child) {
> +		if (of_device_is_compatible(child, "qcom,fastrpc-compute-cb")) {
> +			count++;
> +			if (qda_create_cb_device(qdev, child) == 0) {
> +				success++;
> +				dev_dbg(qdev->dev, "Created CB device for node: %s\n",
> +					child->name);

Stop counting successes.

> +			} else {
> +				dev_err(qdev->dev, "Failed to create CB device for: %s\n",
> +					child->name);

Unwind, return error.

> +			}
> +		}
> +	}
> +	if (count == 0)
> +		return 0;
> +	return success > 0 ? 0 : -ENODEV;
> +}
> +
> +void qda_destroy_cb_device(struct device *cb_dev)
> +{
> +	struct iommu_group *group;
> +
> +	if (!cb_dev) {

How can it be?

> +		pr_debug("qda: NULL CB device passed to destroy\n");
> +		return;
> +	}
> +
> +	dev_dbg(cb_dev, "Destroying CB device %s\n", dev_name(cb_dev));
> +
> +	group = iommu_group_get(cb_dev);
> +	if (group) {
> +		dev_dbg(cb_dev, "Removing %s from IOMMU group\n", dev_name(cb_dev));

Be uniform. It's either drm_dbg_foo() or dev_dbg() all over the place.
Don't mix them.

> +		iommu_group_remove_device(cb_dev);
> +		iommu_group_put(group);
> +	}
> +
> +	device_unregister(cb_dev);
> +}
> @@ -59,9 +61,17 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>  	}
>  	qdev->dsp_name = label;
>  
> +	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
> +	if (ret) {
> +		dev_err(qdev->dev, "Failed to populate child devices: %d\n", ret);
> +		return ret;
> +	}
> +
>  	ret = qda_register_device(qdev);
> -	if (ret)
> +	if (ret) {
> +		qda_cb_unpopulate(qdev);
>  		return ret;

Unwinding registration?

> +	}
>  
>  	drm_info(&qdev->drm_dev, "QDA RPMsg probe complete for %s\n", qdev->dsp_name);
>  	return 0;
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

