Return-Path: <linux-arm-msm+bounces-84803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E37CB15A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 23:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CEB7309B4FC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 22:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD762F0C70;
	Tue,  9 Dec 2025 22:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iy1gBp9Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EEhaQ+BV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684F523B612
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 22:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765320668; cv=none; b=aZ1f1QS4++a8GqorXZ1q7YWgtJNPvcbIOCSFvUGAONSFJfOf3rdc7V68wMTqYqQO7fLJ3hYxmyzITReID2xTWdWS+nsY/xf+uE/pnZiK39JPK7ZR/U6ofc4hQCLXeoQYeBPYS/fSkZFKdYDXDr69G7PPnM0BSxFFwH3kPdJ3gD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765320668; c=relaxed/simple;
	bh=4UviVE+MKxH5YXkUKOH1o7lscfz0/UhOf9AiPURZags=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iK5QRum0Io+v/ExkY3JmgAf8UVowaN4DmDv6aI6RkLyVYlTCg4G1STehnH5jt6fW6L/oC6LTazFZ8NuNL+Si18MkpC2lH7WdN5Fyv3QseuZh05Hv1KNfEqOLAWjNclHvI67bpg2RPgAktiKC6RjfsnJztH9FZNRtIw6i1JeKT0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iy1gBp9Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EEhaQ+BV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9MnTjb675845
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 22:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QEQMzl7vqNIap2ByUNZYi+y3
	EAq/MDWdLePRuwHVOoc=; b=Iy1gBp9YC7bM+9rD0CFVoQcnDIzWXbZb0blFrH/t
	OzDmsj1dZ87Z65SyzJ8fwsvO+e7F23EqzgLhF1bKfhkCs0PvuG+pH3dMfDJb/hZr
	AYE5MX/cD3Iq+fmo8pscBgEwRWDpViRHt4Y6C+hdclZGYc7SH3Y7RUu10IOl6KKj
	qLYEfxo+AxUQt1xfzUkhlpuRwlsz64jozRnDV6UPJ8oXOLrimgUgOnb7kVPrCfUu
	X+5pTC2SMz0wJvGqs5UKD9gxyDOzxgKV4IVwXdFTzkUxfhKrL0LWaSurr51K5QJV
	eFTgtw3tRMGweJve7sYm9Y80dILNL58CeM+AGafZgRiLXg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axqqn10kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 22:51:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee27e24711so110306221cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 14:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765320665; x=1765925465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QEQMzl7vqNIap2ByUNZYi+y3EAq/MDWdLePRuwHVOoc=;
        b=EEhaQ+BVvVSN9JIb1ybMRN3mbl43weM3mZBVP2dtXIe9emognnSZFcRKvz8SBTD6lc
         5YNqI0kGLTixbVPIK4LnsaYusax9WtSy1r3XQBN8wVE59TVEqsSZv75XI2h3C+Mp5TNu
         7NVW+kMMkiRlfsIToAvyVd0/08hCgwpp3T6Zuh5/tXyUqBF9aK2vkRtH7b7ULjYf0e2/
         r+0GbYQ2Bsmi2NmLRjUYsLpUIiEwSoQlhRfiG61zI24Y8GuxYiaZFbbrLAEiPPIVygHP
         MvbWksJgXoEiLjtohT6Q3ztb/R9tSpWUL02UXPzoDkNywMnQm045udzgodQarmOnBgBD
         q37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765320665; x=1765925465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEQMzl7vqNIap2ByUNZYi+y3EAq/MDWdLePRuwHVOoc=;
        b=MNls2E41s5agll35GGSVaxz2gFmVJk7AOFH/RYzvCgxyqAyR9zAVe2sGZd+2nxymb5
         MIBUHxOL59kXuQyCkkKhRHI6ztH/80VbBNIE1XpuCrPt/9MqWeFPl7ETLW+eCLZVjOsR
         sEEbWatxIcSE2IZMzzH+u/HG81NSQB7Jy9USERuWs8YSJiHG7Afl9AVsJTSVWPpMz6ZC
         eOmf1S7hl3V2lFY6wpnqNSt9CFvCj67pPOnOS9fHvh377D7Xo4DakrPsd2rKFN2gFPL5
         nkexrrLgfeeV7zfhzgqPFXf+JW/HdAVdLm4ldn43q7bjdDE4ZyAiW5owoFWcywIbvRNi
         Nt4g==
X-Forwarded-Encrypted: i=1; AJvYcCU3pXJ8hFnw0a/sf+b6sfxc4ThJW8aHo1kMewsdnfk1TAjmRXJNsR2fOKJ7jtBsvCkSdEDWNO2Rr+w/FSMA@vger.kernel.org
X-Gm-Message-State: AOJu0YwbddblthDRKYOMVFxWA4budDNk8WiV5idIJk/leZZS9A2MDQ/W
	mhvR8j7grpgrBu/dNPnlGPWFUiesrpDpENj1dvEj2Pyy5Pdxnm+DM3I+6O1CgfS76oR/droeAVJ
	xjIVm/PMFu2FcJgpeIeHq4kXRQ3WJQ4cyFLhIH1S7bRey0nJt/dDTOn65gIAbw2a2abu3
X-Gm-Gg: ASbGncttaAkQMS5VjY7UqIavhLDwq3VTYOURAEAEsSaofTxaIA2G+WIDRDZO94VS3Tq
	HP2IwV76cfu8nkdozJJlrfCzDB+qqL1N288H3RGl4q/NJWCZ9xRO7brbtr2pFY7G8iMKA0KNpjg
	dXrLS9rgPvHUnKZlrOI02f2dNR/fX0iKwaVP2FjuZfkY3OZ22HRuEtM6mfiy5mDLTKCM4GMy46u
	Sa0HFCe7d1ClGhEAiMlKKBjCQfAWY6OJGFMJWR37kFcvsY2gdl4q92xwB6NRWzW5F5bApZeGOj0
	FdJX07UIkr12FLa3+CentRIoNLBJdnNagZY05lLglw//q+7hTlGNVpCD0Ys7wcRuT9othad8nDK
	1fJhsdohhCbAqy/7lQYrT46yLxLIQrJ3S0f+s+i5KYvaSOl4HIdTpdznBz+V68r07Mih0ABmRfc
	gZ7uc6NQCmjIlKDboAgSLQvik=
X-Received: by 2002:a05:622a:229a:b0:4ed:1948:a8a2 with SMTP id d75a77b69052e-4f1b1a7e138mr5189921cf.40.1765320665285;
        Tue, 09 Dec 2025 14:51:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqXfCXoGkec/geIDZqj9qtcWGnUkW/xMVVONs/SH655X16SAhaO0w/9u2YnfaCWf+p71MfPg==
X-Received: by 2002:a05:622a:229a:b0:4ed:1948:a8a2 with SMTP id d75a77b69052e-4f1b1a7e138mr5189521cf.40.1765320664869;
        Tue, 09 Dec 2025 14:51:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e476sm5689248e87.54.2025.12.09.14.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 14:51:04 -0800 (PST)
Date: Wed, 10 Dec 2025 00:51:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Ji <xji@analogixsemi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 2/2] drm: bridge: anx7625: implement minimal Type-C
 support
Message-ID: <7wp25rctnwydxa3zfpbmddgygyxmg5eg5crv4yuo45k6ovvww2@bnvcw3yorqw2>
References: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
 <20251126-anx7625-typec-v1-2-22b30f846a88@oss.qualcomm.com>
 <aTGJXAnlkK5vQTzk@kuha>
 <BY5PR04MB673939B585B2419534D48E77C7A2A@BY5PR04MB6739.namprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR04MB673939B585B2419534D48E77C7A2A@BY5PR04MB6739.namprd04.prod.outlook.com>
X-Proofpoint-ORIG-GUID: xnTpZ92ZaGTsrIpcMSFBAYvKUQsK3vii
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE3OCBTYWx0ZWRfX4FD3Np51qyOT
 gDUUBP7tCPDGfn+FDT+hIdR6scnzZQU51LBDuZ8mVtZw+pMU16TSMQLoN7+yG9+Q/lGvQW3JNC+
 av36ClHO4JIVEc69ATSyHBlokz+sK985u25Jra9qWuR0eXWqU/6lQ3xwPWX0CJpu2DDdghG9bON
 eJbCZQZXvAVXNiBdxf9xC8JOj1NGt1RSb31QukBM5Who/dEQI44RoJ6Zl57R3ipebIqLtGAqDrG
 DIvA5NHRzBMiMBcC3yHBwm1gkLTXMBomYsGo5brXPPRKK0QGOFzLpsnKoflte4zZSFW02OCoL3Z
 g0N1TbEYw1BwYpxtv4yeBIxkfPNhYhLYKasYKSOw/99zOcCYcRZ+M1snNSZkV+IaLq+2RNKP8VG
 TRo8nKsjAyU5IKCbnhbUIku5Oy4nxw==
X-Authority-Analysis: v=2.4 cv=A5Jh/qWG c=1 sm=1 tr=0 ts=6938a7da cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GaQpPoNlAAAA:8 a=cm27Pg_UAAAA:8 a=PJmAgKdD5_Fpd0EMymkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=xF5q_uoM5gZT5J3czcBi:22
X-Proofpoint-GUID: xnTpZ92ZaGTsrIpcMSFBAYvKUQsK3vii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090178

On Mon, Dec 08, 2025 at 07:37:30AM +0000, Xin Ji wrote:
> Hi Dmitry, I found there is another patch "Register USB Type-C mode switches" which provided by Pin-yen Lin <treapking@chromium.org>, but I didn't find it in the v6.18, is it obsolete?.

It has been posted 2 years ago, it has not been reposted since that
time, it targets a very specific ChromeOS usecase. I can't call it
obsolete, but it wasn't merged.

> https://patchew.org/linux/20221124102056.393220-1-treapking@chromium.org/20221124102056.393220-6-treapking@chromium.org/
> 
> Thanks,
> Xin

-- 
With best wishes
Dmitry

