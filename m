Return-Path: <linux-arm-msm+bounces-85061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A650CB61D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 14:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3E4F30019F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 13:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2080029A1;
	Thu, 11 Dec 2025 13:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BqxuF4BO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g21JaJHe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BF82C11F3
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765461456; cv=none; b=Iug6tN8mOVcjjCyPCiPeRUDCS2s4KkeCe/ClBnGUzQqrwy38s1XyOEBJ2Z6OA5NgeFpXuiYtRZVdLJhdgIdZ5sY7xFGMugIHz9+sOh8wRAW+S7zGqPP+8oMtnfVJeTy5bYF3AeBKWYKVP0tRPCNtwlfO4/M7EPyR1uL61vtpWW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765461456; c=relaxed/simple;
	bh=OuMlHLzNS4UoipcRyLcjhFHesEueLunJpDH9EE7PnG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvCKFdWxiBWRqQZJy/awJR/AVqNV21njqwH+Xth7V6iUdlnNo0FR9y5QKj2rV1Xhj0EBULh45yrp5JX8yx25MytVi4Cr6NpFQwtY38mZmH+q9X3KVI6UjzukEfsjbNz7bvQV+bjWLkbD0lVjMdHNQt03UhLOVReooPcQJIkAcE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BqxuF4BO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g21JaJHe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBAY02m470650
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8vkofDSF6LVlR88JnejZSESC
	+DL/JeaQBWB5LFj+j/A=; b=BqxuF4BOgvj3CPuNRS/ephIc02OB+xvy4ilJwYtI
	Fu/bHYyYLnKk7Wvvh5J+ocTlcLjNgM2vMa+xnH5/z+3QGl82mTOnysBFTnBgGxLU
	qROKr4h5ykzOIyPZdPMlj/HGnB/6P0X9axmuhJeqqdYROIkjWPycTJV3Zlfe2XiW
	izVcBZrLeV+yHGaI3c6X+Kr+2D6+7IAbr/x+n7K6JNfwGQEokFkMUM2E7dUOCQIZ
	wjNWjtzyR+p0Kc7u2Gy6im06pIRnnS0TkZdidSJtM1IYe0KfL6KAio00PWaLGM+0
	+GkSdlTohU7qTFqca2Cjt2tZMvubL+Jf/xVJxXxGVx0KqQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aynpvswt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:57:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b4f267ba01so20211485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765461451; x=1766066251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8vkofDSF6LVlR88JnejZSESC+DL/JeaQBWB5LFj+j/A=;
        b=g21JaJHeLuOBSA5/v0zjyF56j3xzmykfVvPCAA3zjcObyMaYceX9jdQ1mEP4jHfVz4
         OY+fNwRVqSF5gZCgYHgo2qXXcxbCgX8tPcxtewemI1VmmeBHDlNV1oD1Q7MqYD1FLpem
         eJwv7SijzXdD50oYkq9/j6MpKKOhPsVdiPycOsH28QI2H76z69n8tW318NlG9TbZArrm
         tdXvxS3BmZhfvkubF7RVIKrwEn5V0mv1rkTrjKf2jYc2gjdsxuUoRBLLheUXNpfZ4mAa
         I8AZXrRTd7XWaSjsoJPLwH6DJnc+DdIjr8gBKb472+35XRsbKJWraCAYpdgAwuxVz7Co
         SmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461451; x=1766066251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vkofDSF6LVlR88JnejZSESC+DL/JeaQBWB5LFj+j/A=;
        b=ZxXO3Su6OuBxG20csB42WDWQ4jLtGUO3O6ROTyjELWnVHg1y19ZpBjI4UxWNgLtAcm
         n5MuTBHoL7TL+A6nT0Ac/utUhqbP3s4VQzvDI2wcVix7Xvn7ZnrKN7JB29iMG4P8kDKE
         IXXkvuPsA2mTzHvYSlziwqlhdkB1f9UnnMK4p7TxJvCHCQFypg+fR0u/adBwj694ZgEj
         yZkaqsrtHxVLyuIcyR2g7BVkjzD+1HutrXLLlgoCmR7kmBxc39MZvVmX5djyXPKoG5cl
         2YzP7KLgqBivdIToKULf44JZtT53LTVpz7zf7X9F3XEhN5jRzl4hO51JoO+cPzdXRDzq
         VA7w==
X-Forwarded-Encrypted: i=1; AJvYcCWEHLmwH4mrWG6u7fJNYL31QAZ17gToVD94BfFEv9ppRQNE6Hsy6WFD4oktZ78IMnxsg16w7BtpEGr8SO7b@vger.kernel.org
X-Gm-Message-State: AOJu0YwKqvq4x7JTennt8FiGkM+3hlmZW0GopyQbzOovgYHeFFXC9Nxh
	aQv9RM4SXeCqGAw7fMTgiUAqm5v1By/noi8EjvDkZQwsFO53mMlE+LcQBuec6/tspHdte0UiEo8
	US0mKVXX/wtqqlr1B3dyssPhSRMABm0ExD4tWHqoOImve4U7+PGF8jq4QHRaMR/LQm/a/
X-Gm-Gg: AY/fxX7aYTKoe8DImk0SW3BEfrnbTkSj9i6LpEEbBmfBUpKHV5v5BmuewH0dAoiMYKS
	0Aepftkexfi3Y/wYwx9iVWWs9o3wBJCVYlMNyYw0AH6pvZK6C6eUDrE1ELaJyEpyijzha/BUyiS
	ea6lPuDfv7EDvJzRWswwbY4j0TDmkgakJIgQT8osDbdCtbWGNjnM93qLGN6KJTUXXwZORvW2zBl
	kqEkqByz5Fg5PRz/7BvRQKG/Jh1rtF8c4ozT60aSBZFnyXa71kO8T8UIAbyXgKLE16xM4CTWDAP
	OPwcemynVxj7K6bAO58Hr3Dw5MIccjYStQrax9mWW8ce/f37SZAwt/7zAnp0bL2+FAftb018r/7
	CYomc+q9NpQK9Gy+c28HL0gH6dJOfJsD/yYv67fbZnUM2yGXzK9wn74YYGv30Kt3BtrBVoirwTr
	p+PeKfErs3mzcMez994mMM3jk=
X-Received: by 2002:ac8:7d8d:0:b0:4f1:8bfd:bdc2 with SMTP id d75a77b69052e-4f1bfe7d21cmr25792991cf.41.1765461450768;
        Thu, 11 Dec 2025 05:57:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyDvocEX7anTwimzSYssqCWlkfsifkzwxspPzYVu4nVwF9E+ZXaNz5wA7KYmnEQBLyAqQD7Q==
X-Received: by 2002:ac8:7d8d:0:b0:4f1:8bfd:bdc2 with SMTP id d75a77b69052e-4f1bfe7d21cmr25792661cf.41.1765461450259;
        Thu, 11 Dec 2025 05:57:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f3199e93sm892605e87.96.2025.12.11.05.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 05:57:29 -0800 (PST)
Date: Thu, 11 Dec 2025 15:57:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, andersson@kernel.org
Subject: Re: [PATCH v2] phy: qcom-qusb2: Fix NULL pointer dereference on
 early suspend
Message-ID: <h3jx5drjfg4xa56lrbdu3xxic53hez35jotkrznozawjjljfh3@kwo6hdccfkus>
References: <20251211134836.1777897-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211134836.1777897-1-loic.poulain@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDExMCBTYWx0ZWRfXxn1USjNxcFu5
 /7FiZsj3wBqulzKGSA3Up+2zhVLCipFXFbqIUgD7cgRavfg/v3B1thST6b0AiVorY8HKpckDEeG
 dHTjlwHUBl6ik/G1WN7FORvSqwcyEfR5NCI/WYcyhBoPi32aPjktwhTok9GjwUgmmDwjBELTygn
 ZFfewX5WoCm9Yalgj8OpB2OOB57BqpcfScT+kdmrSBufijszPrB8YaqgGT6xoghEJSEM6pSvJVw
 dhtFyb0uxdWzCSaPWOenR7L7ClsrimDZ/OBS0kF0WFeC0KjCnG0nYDO1j1RNnKPWO6qVoE0/CuI
 0WsPWD6dysSxe8drVYXhJTA64l9R/GWbVgIh34RmiVVQX9fVd/eWQ/D3/ylU7z9AMVenJDn/UTQ
 F8IiN4K3hCBboRqtdxp2EdRouQ5HHA==
X-Proofpoint-GUID: eE-1-Mf-70fn9xs2-PJxLiF2LTxkHknQ
X-Authority-Analysis: v=2.4 cv=C6nkCAP+ c=1 sm=1 tr=0 ts=693acdcb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EWeZSZyDK3lWYzenonkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: eE-1-Mf-70fn9xs2-PJxLiF2LTxkHknQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110110

On Thu, Dec 11, 2025 at 02:48:36PM +0100, Loic Poulain wrote:
> Enabling runtime PM before attaching the QPHY instance as driver data
> can lead to a NULL pointer dereference in runtime PM callbacks that
> expect valid driver data. There is a small window where the suspend
> callback may run after PM runtime enabling and before runtime forbid.
> This causes a sporadic crash during boot:
> 
> ```
> Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a1
> [...]
> CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 6.16.7+ #116 PREEMPT
> Workqueue: pm pm_runtime_work
> pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : qusb2_phy_runtime_suspend+0x14/0x1e0 [phy_qcom_qusb2]
> lr : pm_generic_runtime_suspend+0x2c/0x44
> [...]
> ```
> 
> Enable PM runtime only after attaching the QPHY instance as driver data to
> avoid a NULL pointer dereference in PM runtime callbacks.
> 
> Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent a
> short window where an unnecessary runtime suspend can occur.
> 
> Use the devres-managed version to ensure PM runtime is symmetrically
> disabled during driver removal for proper cleanup.
> 
> Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  v2: Move runtime-pm enabling after dev_set_drvdata
>      use devm_pm_runtime_enable() to fix unbalanced enabling on removal
>      reword commit message
> 
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index b5514a32ff8f..c496acbad0bb 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -1093,19 +1093,10 @@ static int qusb2_phy_probe(struct platform_device *pdev)
>  		or->hsdisc_trim.override = true;
>  	}
>  
> -	pm_runtime_set_active(dev);
> -	pm_runtime_enable(dev);
> -	/*
> -	 * Prevent runtime pm from being ON by default. Users can enable
> -	 * it using power/control in sysfs.
> -	 */
> -	pm_runtime_forbid(dev);
> -
>  	generic_phy = devm_phy_create(dev, NULL, &qusb2_phy_gen_ops);

No. phy_create() checks whether the device has runtime PM enabled. By
moving these calls later you've disabled runtime PM for the PHY.

>  	if (IS_ERR(generic_phy)) {
>  		ret = PTR_ERR(generic_phy);
>  		dev_err(dev, "failed to create phy, %d\n", ret);
> -		pm_runtime_disable(dev);
>  		return ret;
>  	}
>  	qphy->phy = generic_phy;
> @@ -1113,9 +1104,15 @@ static int qusb2_phy_probe(struct platform_device *pdev)
>  	dev_set_drvdata(dev, qphy);
>  	phy_set_drvdata(generic_phy, qphy);
>  
> +	/*
> +	 * Enable runtime PM support, but forbid it by default.
> +	 * Users can allow it again via the power/control attribute in sysfs.
> +	 */
> +	pm_runtime_set_active(dev);
> +	pm_runtime_forbid(dev);
> +	devm_pm_runtime_enable(dev);
> +
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> -	if (IS_ERR(phy_provider))
> -		pm_runtime_disable(dev);
>  
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

