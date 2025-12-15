Return-Path: <linux-arm-msm+bounces-85276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B44CBF9FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 20:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A655300C0C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 19:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757D5331A78;
	Mon, 15 Dec 2025 19:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kA9815ys";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nd67Vsps"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5896328625
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765828749; cv=none; b=Y066NHK3pjRgTxi0vNdp5g/pm+bxKksjjrV5huOniY9SWmu/k7dn5JGl6OggrtJRYopFK7IrUlp64cfx2csciWhhINZSDrygKaNc8Qgo8N4RVtvOrXoSYkXGXnNRdDU6V38CunUQI727KKwsz8MXCAWs8UNKEr+9nxonM9zL3kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765828749; c=relaxed/simple;
	bh=yC0SgIlNTX1nxsWP07zPVRGfF5fMjksKp/EvwY0p6lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iq5+fvNFzx2GbXj8yn2wyddAnd/GGlVE0xNQ6TI8N4R9aZr+xI0hQQLFsYkpQZiHmpcKJ/bB3OqM5J2Y8xQBONLT5ENjuCH8F9SbF+x3JwncPYUgyhvXnNa4Ossx36S8XGjGAZY9YpqUUP0eGcQUudrHPPEB1+D723xOALCgUMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kA9815ys; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nd67Vsps; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFC5K4D367073
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=npDpDwwknv3Nv0rm7sBmaNw+
	jfUIH3g4Ct1bpwv9dlU=; b=kA9815ysSLA1IprbX75A0yvOCKefM2aPGJuEjxQ9
	vx1/1FaEDmAtdI7azSdkuWoz+F/VtpWt/fmUSr+39yvsBC+CKECROXbK1f+stRny
	FepD3eEovM0EW0e2exMPAOMLRdUU3VgT6E3Tzng6k3L4o0eRQPP7+824fU9mzaw7
	Ufkj67uCjH2B0qBe4czDrwdguO4EIjBfnO5ld7rgbA3lL15Ce0hMrmQEQvOTk5XO
	82ZsmuZf9L3ziNElyIXoJ1WNBzMwy0nSROg9xxvDN6174Zt6vYhm8LQyDiQMS0mx
	JuGtXIh1pw8/irv2680o32vpY8xvnBPChUl9Dng50mAFdg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2j1c1dfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:59:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a344b86f7so46775486d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 11:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765828746; x=1766433546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=npDpDwwknv3Nv0rm7sBmaNw+jfUIH3g4Ct1bpwv9dlU=;
        b=Nd67Vspsrxo6xfHl+PQwJ6g0N6IgIrIFJCrz7mDZBakE0w0a1l2pZ2fQdqO081v8sU
         hTk+N+9KM5cu/nwTPmn6+e5qrLPkgbDh0GU0hsAIARmmwTq28FIXPkxhkjNHzwIgtg65
         84krqKbethDpZ5riss5bJfeGXMhhIQq8GIpStPbcsA+YSGFOMKsSAKvRnwXG4q9GzoTz
         eMZRRQ13N9HjOlf/nFm7ZeROcNamsbimPP/89scDl4ioq9Nn4Y2aBhNcYIRUwfs1d2rW
         Va88QG/Hu7OTn+FEXYCwxefz9ky4lJQVXnIqImH63c4kZgX4I2YUFLBb6cH5rJozfWns
         V02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765828746; x=1766433546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npDpDwwknv3Nv0rm7sBmaNw+jfUIH3g4Ct1bpwv9dlU=;
        b=pEro+NYluNOLElRi3hbILYz0/Ai+ztxvB26zDKdUytH1wUYvfjvK4FH0pHPEESjbcF
         v0UFyTLsd2LVDEbW3yjVj6bB5FI/JZ/ZCg9uxSnKsvPaiYA986Uz04p82wHaMVbI1buR
         dNNcDbWjSyCc4UCHoXJNQHH6qInMIkXXkKLcJppavRq7CsloWw43PeM0l8U3ZXh0oa9p
         BPbWS6+Kd4KSNzwMG17LybD51jZ/L9cnrBm4nHdSwfPun7j6NPptnY6UemQspyJUxwBy
         bhh98kxW60vjbqHTuFJUDd1CbHZjMqGBNpAm0DQ62ua7beiXUDYz1iRmUsKE20rx/d+U
         RaBg==
X-Forwarded-Encrypted: i=1; AJvYcCWMY9mJX4pJum1v55CjE0AKSKPCySYVsII2C4oTjGCVVr5M19qxiX2s4yH1uAPFbAtI8j534q2ZVfxQIiTX@vger.kernel.org
X-Gm-Message-State: AOJu0YyDZF1Vosndpod5As5H/mg4C8fFoHO4eZOkQSH/zNRdStI+A7bi
	Tuc9gw0FblFgX7v2WXW3Xmp4ZiVmd3cZGsk2jXYLcp5M9ZWpkMBw3ppbWuiP84kEz7mUG7J9UjJ
	6tnOw3i2iKPqScJxqSLVg6MvBi05e4EjWIhZhDl89DwqPaK6cDClCSclfOyEdQMjmCpUb
X-Gm-Gg: AY/fxX4RcR6n84t7IsrUuNw/aYScEORwuSLYNUVkSk2fReqW6f1ERhNYhQOnmp8lRSQ
	eLW4335LvNlC70GH2eBI1/+ePARMF+xu9kwVsjcfDGupllReO7vrEkrlRLp/Or2RxkEq56tFU3L
	k85kd4L5Ld6IS4YQrGNFyxiixtmfd9GLwyPLsHqQ77VqEaN7Pbwkh70hbHU8Q3SwnUo7uGz2f6y
	mpjWorRP5ahcEumMNqpoAa0+hhR2Y59evLhtvoFsPmTXahhJ62JVef5vjbgTB+kMPwcilTYTPEi
	ATtaeQhHpZ9xmWsfbB1llnwUqeTz9DTZ+Q3pNFS3q6OJuCH/AH7dBN9saMrctdi+jJhmzJDoTmd
	rogeLnHQugylq8C1pKCiWiuKJy0ixLkIlfeGiplwGnB64heu8szzdNe+zXfnJCOH6cAByxLru1O
	IoDcESbsnrYgfw3tXcBpcl3+M=
X-Received: by 2002:a05:622a:1aaa:b0:4ec:f940:4e55 with SMTP id d75a77b69052e-4f1d059e34amr158794861cf.47.1765828745900;
        Mon, 15 Dec 2025 11:59:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElabcDphYCb71EoECRtI8s9ld2SxQ9xgj42DnlJMaZVGMuKd3guYQKxl5DIJz3IH+agPET2Q==
X-Received: by 2002:a05:622a:1aaa:b0:4ec:f940:4e55 with SMTP id d75a77b69052e-4f1d059e34amr158794451cf.47.1765828745352;
        Mon, 15 Dec 2025 11:59:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da503absm92224e87.60.2025.12.15.11.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 11:59:04 -0800 (PST)
Date: Mon, 15 Dec 2025 21:59:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v3 06/11] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <muo6zpkb6esy65ug6pd74xphl6inagleogexu454arngua334l@6rcfjeqyxnnz>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-7-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215083854.577-7-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE3MSBTYWx0ZWRfX+m9kVLkCXBJy
 D4JnpCSpwpnzvXZmR6GLyh/sjnToTij7tRbzpiGvRKdC0SN5bD9h3TBm8FkmV0RptzRMsyYoLMw
 SNo0OWzyV5o5X4H8TYsNKlUPwi7sOYVoe15hZOvfUag+h4DMn/emUVa2qwrIU+NtQ2mT3Zfq9w7
 xttVqViau+iNYXemTK3PD6UGNABFMy2QX4+cSA1WYiQkcZR3LOwon7tZEezejTxYRU/tDWNXd8B
 MSAN08Box/0mgA5KjmB6w+6w+35otYDtHQLNXEa15UALo/44AcTBAsuM6ZUI7Lfyhd2KbiuGDTX
 JosdzBpKScBLwn3Y/QiVOzcubkIZqE9L0FuKApZNWgm6E1cvy7E54Wx4cMqzyHBHmZu40R5DqTu
 EW50SoW3Zc8ZBbhPGkjTwY/DsNtYDw==
X-Proofpoint-GUID: rll_wnoxcRAJT0o844vyKJroTErKOQ0x
X-Authority-Analysis: v=2.4 cv=ceLfb3DM c=1 sm=1 tr=0 ts=6940688b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FygwiVb8ID-HIxUyOxIA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: rll_wnoxcRAJT0o844vyKJroTErKOQ0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150171

On Mon, Dec 15, 2025 at 04:38:49PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add DSI PHY support for the Kaanapali platform, kaanapali introduce

So, it is Kaanapali or kaanapali?

> addition of DSI2/DSI2_phy compared to SM8650, However, based on the
> HPG diagram, only DSI0_phy and DSI1_phy works.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
>  3 files changed, 26 insertions(+)
> 

-- 
With best wishes
Dmitry

