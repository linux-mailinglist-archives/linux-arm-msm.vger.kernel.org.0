Return-Path: <linux-arm-msm+bounces-89779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 98914D3C3FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 10:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E157C540E9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 09:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841563D667B;
	Tue, 20 Jan 2026 09:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pu1b26T5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBHG19SD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818303D649C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 09:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901306; cv=none; b=L2j8usABm77mKF6YGyG9rgbpZETslrb5ap0TiojDzWnedOmGZa3VotkAvk4a21n2CFl6kR/KFQS8xTlBtT2gkez9csZNgdCZmAMsExoME9Sm1WC3mB2faGndXZd13CPVhg9r4CPH5HRr3lqHjKKU3IGIWwqsPnwcKrz2Rc7g49M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901306; c=relaxed/simple;
	bh=vEFWiIISpy/xK8sVJEKh77nQoJhAvhtGHmAuoDTfmiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WE408bddfQiMlcFH7Uree8hjdzZtboCs77hT+3G9oJT9+FC7ZEN0hC5PiOhe5DXQKGoUn8W9dF5gguiYUQGi6L+TyOuaiMDIxD94Pk/SSjJF6WPke21bKmCRWtX05sxPfs2kLifNEnWZFJZ5wLHY37xJs60rGO0Ec1mXRFyV24g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pu1b26T5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SBHG19SD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K9HBD13176317
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 09:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDuluuRcOj3oAhAhMzTa0gmYjYkM3opUPACJ58+MEtE=; b=Pu1b26T5tSG6utZ2
	TaoC6xael9Gy22SPMpmzawqJx+4/39VDfJHLYvSLMAQrSagsK4Pblp0WGz4aiNGl
	+DgxtKBDcL42TK0WFMIcxiXxW4bOcu+q+1aqE6ExVzzc5MxMYpl00CqRWJ3wOJoa
	GoVpmDDxISgc0MFeVzYVPWOZ46CglGgnQTZo4u3vtW+uqsJPAZYCHrg80uBYOWl6
	KXfv6G+yRDDe7PH7i7DdGdgGouYtQbjfbeDioAN0IO3GKVUBB2DCMxqXD38wVUqQ
	wTf3DyWZEiApifjFg3qJUVIr/rgxpLBYMbzntJ/PAj0Hzc4/MpYfzW3E4uLIfMLL
	qIL4/g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt0p2h6yj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 09:28:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8887c0d3074so131475136d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 01:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768901302; x=1769506102; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LDuluuRcOj3oAhAhMzTa0gmYjYkM3opUPACJ58+MEtE=;
        b=SBHG19SDJAJeAnTVYGvU0ZiIHe/HOKo3TPkmuCZRiVWTtZxbIEvgbAuuWgTIR044Z9
         FQMSXgmjPWYPyk1kyIMfL6N1vtKhl1T/Xi+BwiSvpF0RPZNVSEWcW26rpqCr0BVaDYQW
         tYQecU6uYsOkpyu233iMseU+/to1rz3DxCKCaIcL2HcX4WunbO2yUax7AX2nxYpYdfwT
         1R1+RdHP3Ner2AtbpRhLrW+afoQP19SZfkSM9dAoQ+mCPbB+t+gLHO/uU2p2QfIsm3h4
         oG3ylpj5dB2F6fVA9nybLimh3pWKS98hH61+jgxSORrbJ24kjoNeNZ3CbYgaWT6vWGsh
         or1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768901302; x=1769506102;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LDuluuRcOj3oAhAhMzTa0gmYjYkM3opUPACJ58+MEtE=;
        b=iKrI/u/+m6BlhVAf9+Z4kounzngutzpn0x6fY5X0yJOlfqmPq0pqEMRqLXBAxeW9N4
         XckbpuqxUeYtYOspa394vHxMGOLC0vBKy0fF1OozU34GY4QD1QkAETgidd40CNZDRMCw
         /xdcEcmA/aWc2bDDVEkMaUT7yieYHsyyXwK3OR7dbhDK5ukmwBHiOwoRtT0mSAtVPOgs
         WeWOKMavps20V0sQ5ZFk6XuEpJqBxw+9sJPebPoUuZ5a1FxRJfqiywNAWFMgbYvORfLT
         qDrxFGhpbSy55uErxzYn7oUOOBjvQRZHckrXjeUrhcPh5wzigF9hkN/v2Usx3LILDysb
         r/mA==
X-Forwarded-Encrypted: i=1; AJvYcCW+2D4DXdkYNMW1oFVSa3gDrOrvOeIxk9BoGBMxNskr1GZah9wZF6sbtPRwLDT5E/NwFtgTNO4sp/+EfMWN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1uOORU5CzM6AH7ZkYW/E1uvdPb+5TrClL/q/rvmaN6cSzggIm
	LlW8GXL66lyyKK6dxyPGp5VYD68PFa1zbXJSFFFu10YW36EehRM9HOMRy+V/IJKwb6pqaIgK21P
	ORnOBVoBhkKlHJP26DCl5xY09xzYM8xX6tlCZArW8CW0drYcfUfJfKkpyHOc9eJi6bagUC4SeiV
	pRZzEmqw==
X-Gm-Gg: AZuq6aJ+rqVK0Dbqeqtajevmizkr7TQddOIUe7bTTNkmLf5OCL8S3tIFUq9hxEIiTKB
	bQsk567xWzMyxe2uDNiBUD/HVsC0kCF09X4ZPUS2ckWqCQ0PYl1qDgwhXTSkdbj3uqr9KXsY3nc
	Kq4HHdD2CPv+UH84xw3JQVHuFrXVphJk6tA9yWX1TLwYhTdb4oAxGSkIJeoUP2ww1jXLRpGvOWE
	Zqf0idYZNJanU8qd6C+DWNif1vkEd82WbtUAQP8DdAIEPargwN3TvyxqsOimzwctCf1rCZXInjy
	1B4xPMAaz+8eMmqHzIqfx9zQ4Rgsb2bnxcp5Wpt7cIrhod6m/miy8VLc4fbtnoV3BWYdYIuev7G
	U/gEHQObAqMZQ9Rp8y0s6m1l6f8b/PTl29A4eNT+NRoc28scdm+uSmnK/Wdg1/8GGnnvODGtjju
	6mDNE+vRjI5nnO2TJNQN3pDuQ=
X-Received: by 2002:a05:6214:194f:b0:786:8f81:42f with SMTP id 6a1803df08f44-894638dca24mr16257506d6.39.1768901302417;
        Tue, 20 Jan 2026 01:28:22 -0800 (PST)
X-Received: by 2002:a05:6214:194f:b0:786:8f81:42f with SMTP id 6a1803df08f44-894638dca24mr16257396d6.39.1768901301998;
        Tue, 20 Jan 2026 01:28:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59bfce7da74sm3120178e87.40.2026.01.20.01.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 01:28:21 -0800 (PST)
Date: Tue, 20 Jan 2026 11:28:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2] drm/msm/dp: Correct LeMans/Monaco DP phy
 Swing/Emphasis setting
Message-ID: <bq4usuzu7dl42ruduy4whbgnfamgnmyj7wuyd2oa472qet6tyv@pdku43m6e45x>
References: <20260119-klm_dpphy-v2-1-52252190940b@oss.qualcomm.com>
 <47skckagggxijdhinmmibtrd3dydixtj6pccrgjwyczs7bj2te@2rq2iprmzvyf>
 <749e716e-a6cb-4adb-8ffc-0d6f4c6d56c4@oss.qualcomm.com>
 <5ytgf7saw6yfvqzqmy4gtjygo4cx52vomi7mwswc7hgedzz3rb@eiqxiqs2cjmb>
 <8c63a77c-1676-461a-bfcf-55202e723718@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c63a77c-1676-461a-bfcf-55202e723718@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tHwgJdJ1kKqrLdWJqoLRMUEMARAjSyv6
X-Authority-Analysis: v=2.4 cv=drTWylg4 c=1 sm=1 tr=0 ts=696f4ab7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=SNWZ2FZe9L-OGZU4zVUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: tHwgJdJ1kKqrLdWJqoLRMUEMARAjSyv6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA3OCBTYWx0ZWRfXxN00vXK57VrQ
 2fCART6GXCMLrZAt1fylEKGpOkMDQBHyXYkjrprHJ6gbsb0VtHNXJQtU/8bLNMPc25TQjNHNqek
 s2B7eUnd7EY+kVEkNjj208ZVdCInYFVAEbWo5qlh23r0t6QUEfcy8mJSZuG6UDBezZh8EobhUj3
 kXhHr5xTuW+/9JMTWHYgShFX7CXq0mv+8zbIaZQUaYUfnRi20dncMxququZDdliQwBvv9jjNQ2w
 Y/Lri46hMPWHe1Wt8uu4xAX0gDca4qJ1d/OOmZ0ovrExn1+utDPk2aQ4gesHsL8QAXN+OVZD3iF
 M0RCe9+hGgaV0t6QO2iN//Uy+gUwcHs/ZJdApXxnZvRFV+fR2yqTrYaeHagV3aY2lcyaLulGjI0
 tgneIRMDv3kmR60LUQsviWzNr9aJbwvOf590dOrMBCDRWgx5pLVylfBF1trI3dKalpDDttK+3ks
 5Vt/hkvzrKpB7+Aqjxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200078

On Tue, Jan 20, 2026 at 03:56:10PM +0800, Yongxing Mou wrote:
> 
> 
> On 1/20/2026 11:12 AM, Dmitry Baryshkov wrote:
> > On Tue, Jan 20, 2026 at 10:43:46AM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 1/19/2026 8:55 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Jan 19, 2026 at 08:37:20PM +0800, Yongxing Mou wrote:
> > > > > Currently, the LeMans/Monaco devices and their derivative platforms
> > > > > operate in DP mode rather than eDP mode. Per the PHY HPG, the Swing and
> > > > > Emphasis settings need to be corrected to the proper values.
> > > > 
> > > > No, they need to be configured dynamically. I wrote earlier that the
> > > > driver needs refactoring.
> > > > 
> > > Hi, Dmitry. I plan to submit them in this order: this patch → LDO patch →
> > > refactor.
> > > Since the refactor involves more platforms and may take some time, I’d like
> > > to get this patch merged first.
> > 
> > This patch is incorrect. It trades working on some platforms (DP) vs
> > working of someo ther platforms (eDP). I don't think it is a proper fix
> > for any problem.
> > 
> Got it.. will post refactor series.

Thanks! I don't see a good way to fix your issue without restructuring
the driver.

Note, the driver has to support both older DT (which used separate -edp
and -dp compats) and the current one.

> > > > > 
> > > > > This will help achieve successful link training on some dongles.
> > > > > 
> > > > > Cc: stable@vger.kernel.org
> > > > > Fixes: 3f12bf16213c ("phy: qcom: edp: Add support for eDP PHY on SA8775P")
> > > > > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > ---
> > > > > Changes in v2:
> > > > > - Separate the LDO change out.[Konrad][Dmitry]
> > > > > - Modify the commit message.[Dmitry]
> > > > > - Link to v1: https://lore.kernel.org/r/20260109-klm_dpphy-v1-1-a6b6abe382de@oss.qualcomm.com
> > > > > ---
> > > > >    drivers/phy/qualcomm/phy-qcom-edp.c | 23 ++++++++++++++++++++++-
> > > > >    1 file changed, 22 insertions(+), 1 deletion(-)
> > > > > 
> > > > 
> > > 
> > > 
> > > -- 
> > > linux-phy mailing list
> > > linux-phy@lists.infradead.org
> > > https://lists.infradead.org/mailman/listinfo/linux-phy
> > 
> 

-- 
With best wishes
Dmitry

