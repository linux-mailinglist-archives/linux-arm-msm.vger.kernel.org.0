Return-Path: <linux-arm-msm+bounces-81993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3544AC619C9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 18:44:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 857143537F8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 17:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BAE2C2376;
	Sun, 16 Nov 2025 17:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obkVN4Co";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/8O4lVt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E8C227B95
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 17:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763315071; cv=none; b=FsMlklbfE9MBogQVa0jclynYBr42/pRPKwYjNr0CJ/S0W9f2r6mTgXmUe8Xb1wC51dLV4xIf9dt0kWNiVbZhZmdS3aH/YFL3Wd1Nt/gvYDB3kGRZp5dGhU98kH7st0U8uWNYCZ/BLBDKTXO6CIjqycEquYRLuBLJI7QM9hHgUhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763315071; c=relaxed/simple;
	bh=nw7qdV5MSyZBPvUMLOGqiCcxWCp5Q6eofr7m9dnzArE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFfNotaJcKo4ROjn0LR2sl5f3u9IdUn9fXOwbYCG+jd+Twifkfw9AhiXfFfoHctVMfriOC2RSYZ4SIS71ybjMbSurvLJyYfzouwnCnFmBG4j4t/DxhZK9ynHPIkF40aHcSvoIe2XaeGOsfYDkB/QwZNOpQSQVkoKkV/Cwp3Hf7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obkVN4Co; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/8O4lVt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AG7ahM1644572
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 17:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6ckrzDD69Oc6W3WWZikFHszo
	H4P9oZH4J4AzZwulVlw=; b=obkVN4CoPz3SFRgSjeU5Gq56gLl6LMjai0K92FNR
	zZ4IB8lcBXa038r2nSdiKGds2Fz9qShDugCFSGLS8GN8rrM/KwCJdx7wLWH2j0jm
	RzdXrlus93xXsX6GVE2b/SJAtX3PN3S4viFZjonHOSsfdb10kXtaho9x2LfO15/j
	tiN7lml1UIcOXuPzS+bRJfNU4VIDnJ3Tjm/Cl5dI2AeKjvlZg1uLtxGOsyQ1fwVv
	v44mzC/KhdwDSpNLQNCuNJRAXitRWkR/3PzV2A9CMgpMsm7J3VIy6RLc1UzHBM0o
	baXFQaIq6MPTvG6S/TkflqAzn27FaQIdr57uvnvd3AjKBA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejkmaegx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 17:44:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2f0be2cf0so45614885a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 09:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763315068; x=1763919868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ckrzDD69Oc6W3WWZikFHszoH4P9oZH4J4AzZwulVlw=;
        b=O/8O4lVteNKGCrNoQcSB7HsnPRIC2Tggbf9RYORwuSEggGW74IUnxvLWyvdxNMm+13
         If08dHkTlxmEVJfhhVW/CZidK5PM37LMR6dKGnHttg9+wFcMlj5SXVmKfpV8Ii/QvVhH
         l2h6GGwtf2iVAKoKghStEa9HVWQfQtvjRdWZ83BSoLzALP/AO5enHdIagMl8puFt2CgX
         sbCEWqeSF2WGmePDZoIWc74E8h4qvFfHbQroev7Ay4XyE6r6uWggAOLSn9ViyJ2hRNUs
         rGsVPBOcP3oDn4TX/cmO8D1Y3NAc8tjaufQtAeHlvWD9ruc1i3rqbHtovNZ0DNYh3nXK
         +Gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763315068; x=1763919868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ckrzDD69Oc6W3WWZikFHszoH4P9oZH4J4AzZwulVlw=;
        b=e7vCsjbeLAr5J2vd1NjsvZlf/Ka/OQhLLQQjJFUeqP+VHjihE8KXlNZ9om6XbMt1yA
         RPsinjvT+mTtumzfQD8qS1bECqODUEKfxVPaNXR+BzETjzqzHwPf9H6dIcEFhBY0rpRk
         7wW1xQBGlOhLcEf8HWxKHhtuR6TaZpXqAKTA3J6wrjyOuRGlFIKrOFYx2OPn1LEahtU+
         g04bLKwFTUK7dYYQAQ94MbG3FBI4Sl49NqwCfCoMjy/QVjKhBLfSA9kVjJUlNietbgZb
         W1np9ZpcyWqlrlObH26kduzsezK2NOjMqtSU9m3FSs7F+P/N+9fSvDT5XE3HJMZLwFMU
         DlBg==
X-Forwarded-Encrypted: i=1; AJvYcCXWsmqJgPj/HtAq8llaHRoYKC8CPaeQvubzMg/UEJfPOQxMef3stKtqMUWeORfvUJpDO/SqqfolN+FqZia3@vger.kernel.org
X-Gm-Message-State: AOJu0YxThIRwsHKNfXOVvAUt6XzGNYkqqjemN+s2S2gbzR7opAW8mFfC
	E0PQ/6FcRH4gYliyt45EKC1vwGXYB9BTOt2/Zk4oXfn6BvqTmdNCZAuHRExee8w2ug3H6JaRBdk
	TnomW1wjm+e3JNNsIZcFALvBi+gkI92ildwQ2wM4GcPfjGv74c85ltO7vcs5ixGEiFxUV
X-Gm-Gg: ASbGnctiJz4MAetvjQpSHfb3WxS6uAacmB62ObKBM3AwKfyz8Y6xkFxqgSLuNxQ8dRc
	pORIbhAU2YkT2E/Xyto6mjvqNRBfH69lMIZldhj/pML95Dck9NsX/BAMYwOiSBV9Py3i/HeUsZQ
	2D+KuUIM7Tv52/MBmoFTlMzGCbffYmfHzkiiPaXpcptMmk5zMWUN3JwVGfei4x3TtMyMlNaSTKW
	NHVTGjh+bfNMx3GRPY848kZnZECqfL0SJZTOFpPqbuoXb1vHKgRn7ts/7N+6XLHrkBJKn5oKgf2
	bBQo6vCS4W0OTsTRQROiXzs7o+zD20H1O4uNY8awpqfCc7CjESHYhPowerUjhfONTvJ7OwbahXd
	JBuKFRkLmwTxTb5/ZxbI3KSNaAT7/6BZSWIWs9wkBmjF9W+/9yDVdA/xery0p8T0W+ESPV0argt
	J8FxoSlpKvl4hE
X-Received: by 2002:a05:620a:2915:b0:8a1:21a6:e040 with SMTP id af79cd13be357-8b2c31dd7a7mr1237247585a.77.1763315068430;
        Sun, 16 Nov 2025 09:44:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKaGIm8km1aNdRP+dTb4v/7f2Smw2KjfX7iErL2XmCP1uDoRcMxQnclSmnNMtNglDPacylvw==
X-Received: by 2002:a05:620a:2915:b0:8a1:21a6:e040 with SMTP id af79cd13be357-8b2c31dd7a7mr1237245685a.77.1763315067972;
        Sun, 16 Nov 2025 09:44:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b305bsm2524572e87.28.2025.11.16.09.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 09:44:26 -0800 (PST)
Date: Sun, 16 Nov 2025 19:44:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 1/2] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
Message-ID: <t3hfhlp27numfxurtmtcwrovvlgwdvnujain46kwmi37zehdak@xt3vngtkxpsm>
References: <20251116-next-15nov_expose_sysfs-v1-0-3b7880e5b40e@oss.qualcomm.com>
 <20251116-next-15nov_expose_sysfs-v1-1-3b7880e5b40e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251116-next-15nov_expose_sysfs-v1-1-3b7880e5b40e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Eowh4R6p81tQqc6kEPNQP4asFb2UzYNC
X-Authority-Analysis: v=2.4 cv=N6ok1m9B c=1 sm=1 tr=0 ts=691a0d7d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=K1oLQLvFAJWIJyVb_FcA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDE0NyBTYWx0ZWRfX5ob35nbZzGv1
 P6NIaW5t7ygdRMn/9GzrUyfCGP5hWMkmEmVeRIZ5xK88EKDt66+7uUyVo8OGKZTFOvNlWxM5okY
 JArLE0m7mUWjD1z3c40kTjuYRVIMniTme6uF8AZUIP408CrTGibLdz30ZGv+sM7KRjS50v7Lm2g
 2AbtwkwLfy6wmfc5t8/BIXaiDnAQVic2zToN+UIz1LS2D6jpZ44sLTcTo4sGSMZNa8Qh0QQyffb
 aYzX+cCgyIVttEChAs/3IMw8VkX93tN3yVqva0zscoyo1qhGIIS7UWOy/iYI+h5HFfsAv2/tYfj
 3XBj+wElQ36rWdC2SQvodZsyV9GMKmMrXnJ8gCFupIuE0M0qOefP+2EFlP9uGHO6UPcN10ciz3Z
 hzv2YUoeaWz7PoJ3aueBfiYSjlrzFw==
X-Proofpoint-GUID: Eowh4R6p81tQqc6kEPNQP4asFb2UzYNC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160147

On Sun, Nov 16, 2025 at 08:49:47PM +0530, Shivendra Pratap wrote:
> Add ABI documentation for /sys/class/reboot-mode/*/reboot_modes, a
> read-only sysfs attribute exposing the list of supported reboot-mode
> arguments. This file is created by reboot-mode framework and provides a
> user-readable interface to query available reboot-mode arguments.
> 
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  .../testing/sysfs-class-reboot-mode-reboot_modes   | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
> new file mode 100644
> index 0000000000000000000000000000000000000000..28280ffe9bf962ef9d2136ea5d7c6aef77c4bd34
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
> @@ -0,0 +1,39 @@
> +What:		/sys/class/reboot-mode/<driver>/reboot_modes
> +Date:		November 2025
> +KernelVersion:	6.18.0-rc5
> +Contact:	linux-pm@vger.kernel.org
> +		Description:
> +		This interface exposes the reboot-mode arguments
> +		registered with the reboot-mode framework. It is
> +		a read-only interface and provides a space
> +		separated list of reboot-mode arguments supported
> +		on the current platform.
> +		Example:
> +		 recovery fastboot bootloader
> +
> +		The exact sysfs path may vary depending on the
> +		name of the driver that registers the arguments.
> +		Example:
> +		 /sys/class/reboot-mode/nvmem-reboot-mode/reboot_modes
> +		 /sys/class/reboot-mode/syscon-reboot-mode/reboot_modes
> +		 /sys/class/reboot-mode/qcom-pon/reboot_modes

This part is obvious, isn't it?

> +
> +		The supported arguments can be used by userspace
> +		to invoke device reset using the reboot() system
> +		call, with the "argument" as string to "*arg"
> +		parameter along with LINUX_REBOOT_CMD_RESTART2.
> +		Example:
> +		 reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
> +		        LINUX_REBOOT_CMD_RESTART2, "bootloader");

So, does one need to write a tool for invoking reboot with the corerct
set of args? If we are adding a sysfs interface, wouldn't it be logical
to also add another sysfs file, setting the argument?

> +
> +		A driver can expose the supported arguments by
> +		registering them with the reboot-mode framework
> +		using the property names that follow the
> +		mode-<argument> format.
> +		Example:
> +		 mode-bootloader, mode-recovery.
> +
> +		This attribute is useful for scripts or initramfs
> +		logic that need to programmatically determine
> +		which reboot-mode arguments are valid before
> +		triggering a reboot.
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

