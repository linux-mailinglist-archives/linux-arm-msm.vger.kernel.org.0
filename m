Return-Path: <linux-arm-msm+bounces-82426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B694CC6D20F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 982C94F22BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 07:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950442DD60F;
	Wed, 19 Nov 2025 07:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZ3MBwOr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1ShmBn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8D92D6E6A
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537417; cv=none; b=joTx1Wp0b0+mojI9JHOuMWIIe29mk0//HabzAJ/gZIYZL7PG9MoJprDLb1a6aCv8sm0ag8mFka/ABMVbnBci2EVE54vR0gfrR7rdm4A4MkulgQIVolJznqZ/QPrGcLi0Qo2ZhSpwPUeG3W+r7u4lZZL1006Vj1Zm0+eAPju/mQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537417; c=relaxed/simple;
	bh=wLa35XDm6IPnbg6hbzYVHjTSg581R2tB1S27xkWk2IA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHC8RdZEZe/zjqeoOsoByobZAl9RgTVAw7WqHzYdIKjXL2G+Up8gPzGpyRy4PHWFYLNpNze7/F7ssFrIvLBuWVwkhI+6iRw0Xv0Uxh+2wIwrhj4fRHvHonrwvmxLGAAvDGxeWo5/vDXQ9MJoqLwdFdBns2asPOS4DEOL3j1c1uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZ3MBwOr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1ShmBn2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7OVkU971170
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gr6zOUWr6GHGR7NZx6vebADU
	cm/oi70IB3+o15K/5YA=; b=DZ3MBwOrkOsisKJbtpBWpE4cuLqSVsNnbxjsxHe9
	iKeW+TaKZwQYG4wwevDSv9/fQVkUOcL8//P4Rfeud2O32p2EQ13Ry0bIglK9v4pC
	G8JYGRB3aZ3k8ER4rxQjPbZa/sJqRwCB4eldss0AcpbaGkz52rvOu78gAb0GwUww
	RDehzZQ9uwwZ8FI8KyMK71GNW3d5PLMJZKmrXE+uN1q43T/SAWtgILPwUAX/X07Z
	etNnMsgE5V2aVU7LNHMdyQ9HBpNPrrNXTR0UiX9xsY2xkXBpgoWHK76gE5bnblro
	xRN1NvoAUcdWWXhOfKgeuoeQo2LJ8QBIp/EoSSbWdq9p7A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9fu80hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:30:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6e701d26so156023021cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 23:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763537413; x=1764142213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gr6zOUWr6GHGR7NZx6vebADUcm/oi70IB3+o15K/5YA=;
        b=C1ShmBn2AHF6+HciYbl7bfpkv1sOB7pNP7RM5Dz3wGHX8Xs4g80rRS0c4chbh0bSja
         OodGi4S34VKCDpugFOvmgD2Z+c1N8sgRZotlZdbR6QPKYvmPKxp8HB0UPpgV6UXNDJW3
         KGLJVHu8lxPCBBrzt9oxfqUW2ZZwnWh/d/mbgeM7VtwPKNMH1jlyyrzwlO/r8U/slCJz
         wv+YMf0wPhUofVorVhVpk8idYiFQ8fH8hhSYuj5O23wx1PAbwGI+qnTQJb9eka+yJB9s
         /MgXJW8UzauPNIXUbtM3Nc7b3OcHX0bbyn8a9GAH+lRRvdy66LIZuTPdFDxepZQcy3Zn
         /OhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763537413; x=1764142213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gr6zOUWr6GHGR7NZx6vebADUcm/oi70IB3+o15K/5YA=;
        b=XoE8GEhNDzH/MyXMacpH/5UhmxrQK20t1ftfJzTruvlC35heSnOB4PWEmi5HEpU2N8
         V+wIleKP3dyPlRZY7oPUJKIf2sCy+mcvMD2e8m3J1q8RboVrKDpqHmKstxkCBtC1DP9w
         30O3fg7gWuNyM03tXhkZ51tzrYCldrJFnxW4holJVkgV/tfXlY//2rXgTwMPWSPXGro+
         tTjmaoM7DRQCq5FHv2W5KOluSbJWr5OyeJEe0JwQ40bxO3lrXVueHX2fen7CC1oWmuSH
         j60/MMclBIcdHeEGSCMBrkDtM6Sasse5swNkq0DAr880L4270EWG9tBFvHrRlIunQNmv
         ChAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3MlapPWoK9bRRVerdKdvse/tv4r+HWHlOohWsOaBM+BTww7LFN+6pkzC0Gdv9BnS3DsO7VdUocvkOHg9u@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8JBCpS2noYcSZ+YsoL+ZJKWp0ZWfRyN+jMlySuB41T5HvDtWK
	JbHx+Jy1svhuFLwvDHHKu8s5zrVClDU9GyIPEBE0eyby763S4/GvJH0oJjeCXrAqlao99nPHBFE
	5siMbOVHs1JOLgFhSVHih6x6QWCot2UeDFtumubxfcKX4Tl58MrejHlEVhOthmV/TrbGJ
X-Gm-Gg: ASbGncv2RVNRs5A28QgjHW3QTgRAkmWw0SJLhvBz5+KXs2EindVwAKPrSydtH8Y4fwA
	DwArKdKqKp0BE7VdG2IpuS8eauaJxWl3oUx7h6T2Wrr3A6QyxGkJtvesDBsKgPg4Yb74+WrHfaz
	rYlf2hV2A5DbNf7MY+8Kig8JRy8Tafo0DUQklxp96lHFXoHFB2WbyzT6zyn0KZ8AifHBl/ftpgE
	lFMRnMn6n95xIjawY1VAf2LUT2X9l+SKUl39Q07FDSZZ93Fy3DHDFbJl2fJXAUJgYv1ympaQcLO
	P0BU0YdAPH+xhDNEE6SfKXr+hFO1SH+h+enmgKikE0PYBiIXbVNDcnOPARo34P8RYVE9p9QfGP+
	Q2OQSxLAlGDK/cWv+EikrtOrC4xW6m2PdBmzS3cvH7DIsLr2SB7s9Kr+ojKFo18o1hJsLQynFZb
	Qn4h6xhgTSuvKHl4vxFZxeJdQ=
X-Received: by 2002:a05:622a:1805:b0:4ee:4126:661c with SMTP id d75a77b69052e-4ee41266803mr10122181cf.81.1763537413353;
        Tue, 18 Nov 2025 23:30:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiHQ8A794wC8FAFVGiBeoz1a+i7y/spa5oW2exn/cbbWa1BhXSiZK4W3EMjFKRgzYgR2jmAg==
X-Received: by 2002:a05:622a:1805:b0:4ee:4126:661c with SMTP id d75a77b69052e-4ee41266803mr10121711cf.81.1763537412918;
        Tue, 18 Nov 2025 23:30:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b30cfsm4512138e87.32.2025.11.18.23.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:30:12 -0800 (PST)
Date: Wed, 19 Nov 2025 09:30:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 7/8] drm/panel: sw43408: Improve wording when
 reset-gpios aren't available
Message-ID: <ye4ktw4ekpolnmbzkchdtllxpv53ftk6p5o2beld65o2ebedbz@fek4ildiq5td>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-7-317a2b400d8a@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-pixel-3-v3-7-317a2b400d8a@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA1NiBTYWx0ZWRfX3zxpyH5ZkgM2
 QLscHkIf08q8Chr8WYvTFkTZBKcroqICTdHZiM6oQJBuhLkY3NOK7nQ2e13e9EHivvw4uIydstE
 N269oANF5wo6cBgteiy8t+xRe0TFvLZh86uszNN7MXLhqLD68RarJLtu3EqDuKl513VYxgFBfz7
 ePNXoUoM6Vr0GjSToZNZ1ef0tgdfBt77gNO7VNBAZLGDxAUnjku4eZ/ZF8okNx4qSGyJXjMf7Y5
 iEp5TfNkFq2OAbw7Wfb5no//naCNpInEw/VqtSCgbTe7GHza0cG5YvY/dII0T5+fJFrBvj1Ir4P
 +m+QWDdCy0mT1so5uv8Dl1SqNUxS0IdtucAzn3kIKvinCcrnxs+CXNCDRI78wfaTVWNaesx9pCs
 zlGY5m+L9lihrWV9Uic6o55AdpYOAA==
X-Authority-Analysis: v=2.4 cv=KZTfcAYD c=1 sm=1 tr=0 ts=691d7206 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1NbFu7V7WBOcOkta9d0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: V8-jOJsjbV_-7ZrNx68Lb158QBtKeeo3
X-Proofpoint-GUID: V8-jOJsjbV_-7ZrNx68Lb158QBtKeeo3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190056

On Tue, Nov 18, 2025 at 12:30:42PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Choose better wording.
> 
> Cosmetic: also inline PTR_ERR.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

