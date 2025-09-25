Return-Path: <linux-arm-msm+bounces-74855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80606B9D071
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 03:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C27B19C6649
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1B527F732;
	Thu, 25 Sep 2025 01:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSAtxuGL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DFD1E487
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758764006; cv=none; b=ZBG+GQ3YUXyxFFjMdOwhYJOgkJE4pt9pM3uJAxkuacO9O658eHlkJPTF/tOG/xtKmq91CpWx4NoOmK34H+wHnbMp7vB5bDNiwTtvwaXOBCnOZpxlxtQrSsHfLh+H4m+bjzQcqnMgje6HTNlPYTuKc7ghEcV85QhJHsRTuWcgKzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758764006; c=relaxed/simple;
	bh=zrfzjVYTZ8zVuUra+29CM12pAOhebaaVlpFBa7gsymU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iROIHraJ9IJUX4Y6PdvieMtP4+pj59QUEWjuljzEZpCxn0Y9lFSYnIDHYdhRBtoLxSwIWTdIMR4p3K+3e8XjWt4KB6wMbEv+r/azZkgi1NXLn01X+xrQAZNifh1h3AAIN6J69qIQGpYMFwbeIg9bLDHQDNm3W+w56atY4OF0B1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSAtxuGL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1WOaV029619
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MAYOf+6wYe+77ArDzx9rSs0N
	PotguJku+fDW8OMKmmk=; b=aSAtxuGLrpxX4/FkwXLjKtpeP6nxmRmZjYqlLCEQ
	DEWF2ykZsnrp3lqedxOXHet9wjFmLvQsNsyHtctKafMTDlab7bTd47JFlZ2IKnFZ
	4sjaU9AjuxLFtylpwKhUFskjzR57jyJC+3vc6exiUhNua6D/6YfFLxhTIF3jb450
	zY0SX2MDFlSrXYVJq+hqnfHctr7wpk46b27P6qVkHqejZDorOoaXaJnZaV+lhUIp
	a871jpI1IpoNXW9LVF1GlKGn8Umtr3gSJiG+MAmg2rOjeLHW1XA7KPwAtgZciEWE
	Foc+gef2tYqIgGHrFGaMhsVich91UyfDByKbjUSdZul1LA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fp69j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:33:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d6a82099cfso10649681cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758764003; x=1759368803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAYOf+6wYe+77ArDzx9rSs0NPotguJku+fDW8OMKmmk=;
        b=b60ESHjbCUhuuV4oTmi0add2IvUq0hpdp87PNzlATvwjdPnFJeSS/9+1j3o48XY+Kc
         pQ30qFanbv9IM8gHKf9b5xBpLzLSPXlWxagrtqBqiOHPVwb2HyPSbiRzg9eYKZfRdBg8
         dxy+zqjON3QoGH3fMhVs21v4WbPkj79sSnLijvEiBk7x88f1ED9HV+aTXCWRN1omHaFb
         KjWYxMUQ1k5chnuFMYHxyrHQ0e2X+LjjnpYO8aSuVqy4I9mEtuRXiDAPjAXYBhjqLhmx
         AhdCa/edG6rptOQd2lVgJlmtvzAN/VOqE9Z5kmX6pKfy1cbPGc8wClzOEvmSpU9yEa35
         l1sA==
X-Forwarded-Encrypted: i=1; AJvYcCWDU97KvJYClfbzqQ3sSVV+GTqmeAl2YNBJFBTE9KZZa0gxuLn7ZCVdOSzQe/3HwmdgzHAcp1+ic1O1zo28@vger.kernel.org
X-Gm-Message-State: AOJu0YzY8a056+gHUcKUyyhCVdPUSU+3ISEJgxmVhIgcrYUlBGyGGpmp
	S+EZ/avp8gj3vYApSshb+BW2UhPICNU/pxeLECmtierQ6BVYScVuLfC+G5bk+1IW9/BsqkyEKcw
	KeWoZ4rSRVn2vF0vkSQUmhJ+sXIVx5UGFUkzdABcyLgJwc5uJy2/p9gzqA7Rb3TFcC4VK
X-Gm-Gg: ASbGnct4KWnSXhyoyuH76mwQQkKqc2jBPH0uQ6Q66DoTBhraDTjkfvMACl27vfr0mQ0
	sLuJ5WXTJ+FwTN7G1y6Afg0BD2d0nIwBKtFoMwI2CrdPTawVea9uSQg2EJsrnyIFUwEc25R1TYF
	WC6kzTnmnNAZcwipW2DFH3/JCB8SWviAyvy/pdCCCeHV7/pCVCJrSIlDwXr9WW0GjMbfn1JHsJX
	mRVTWh0dhxxW70ikRMmmSoQFH9LvDQOMZlhwRGTtOqEOJ2HyV3NP6lKCUGHKJQCDkHew0OQiF48
	NRXlKAY5SPKriFjdI0qOkskmWG2hszNSjwU07iaK5Ef+oqwbA7jq0mJALSOTyoPQF1R8jMZpBST
	okq7mcB+rdV2TJEMGaPhc0PPrnVaFs2lVduHDvrBp8WTAzsxbSWxP
X-Received: by 2002:a05:622a:5a92:b0:4d9:6e55:5e3 with SMTP id d75a77b69052e-4da4c58ce0fmr26416381cf.54.1758764003200;
        Wed, 24 Sep 2025 18:33:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs/buRc3wA7t9IKg8r3YHQpd1WKRsDmuKuJqSv26mWEzgo1bfg3M6RxBFT657MdZqpPgLz6g==
X-Received: by 2002:a05:622a:5a92:b0:4d9:6e55:5e3 with SMTP id d75a77b69052e-4da4c58ce0fmr26416231cf.54.1758764002749;
        Wed, 24 Sep 2025 18:33:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316ff59basm199254e87.130.2025.09.24.18.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 18:33:20 -0700 (PDT)
Date: Thu, 25 Sep 2025 04:33:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/10] phy: qualcomm: eusb2-repeater: Add SMB2370
 eUSB2 repeater support
Message-ID: <tij2dtgkb67f7b4nvyirnvocu6yqlityooatg3prxbqhfoagog@5r7izeeaid75>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
 <20250925005228.4035927-11-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925005228.4035927-11-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: MpN8PeAm9qOsIPYbuDjS_E7_OlV4f6o7
X-Proofpoint-GUID: MpN8PeAm9qOsIPYbuDjS_E7_OlV4f6o7
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d49be4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=E9wxpCBlzucncV4SwdQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX2YRnJ8at18SM
 t9q3Jqh3jiaU6n0R8wTqrONA9Ikyz4iA7VJQEWf+KybDV0V7cVwrU2JrfP0el7XszApH34TAZ+3
 t/ppTeMAt1mkfKbkJHdb6rnxGv0VT1YSEOsCUmEhjaGHf8/mToZlwl5A8MMmURL9BVmoFsvgRFD
 kx9qv7e/wh7edW1lqxb8WxT0ejaFnI0X6KAmbBmjtxefESaOqpkhd0uw7p0/196F/ayfuQJLxdi
 0E8DlKjadOM8O85GTGSz5yhHDHpgc0S0HfCRcIxFEXlWnMs9+2TQtE0pNh0BouiDN1NdEbF75dz
 mUEgZdzEwXhuwG37JgsIFR/sPJevoSbejXMICR5fmVhJjTpONnSODCxwVPw1SKEs7BgZnvwoebH
 cElEYnbj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On Wed, Sep 24, 2025 at 05:52:28PM -0700, Wesley Cheng wrote:
> Introduce support for the SMB2370 based eUSB2 repeater.  Configure the
> proper repeater tuning settings, as if this is not done correctly, it
> can lead to instability on the USB2 link, which leads to USB2
> enumeration failures, or random disconnects.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

