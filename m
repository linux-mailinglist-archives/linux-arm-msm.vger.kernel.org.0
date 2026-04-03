Return-Path: <linux-arm-msm+bounces-101724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG60NHYc0GnN3QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:00:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 388EB39800A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D05413046520
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 19:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AAE53B3885;
	Fri,  3 Apr 2026 19:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOyRI52j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQjg9i3u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D28D30EF68
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 19:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775246258; cv=none; b=hA7ScWCP8rNqBZCRoMmY3KkqDTF/gp15Aq7zGjgpjuc1wBAYMlJcc62lIqk5///pcH968teMYxomN2kLh3fX10tmbBtXZ8r5S1Pq5doxwRxJ9gwDg8JWYQwx/9JQ6AFdfScoR6939YuUDoBlplUBHMa5PBcbQh25Vn4/I4Jsx5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775246258; c=relaxed/simple;
	bh=ZfgYI/B2dtQvP6itSBrOwXYKvJ/kEHeKcxrISgqQFWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUX33rPV/A8uHYOG5g2EVIiHWfAzD1JpIRewM5rWO6wgPvNeKYx93IGYyAkcHlCVN6/88CnDAFKPuexA+x06k2tne+1HcbLe1jctGEILJZgeDEPlTPDcvUqnDqDkrTVfZwIclcDb26dVUWftEfbvcErDiuOT0bMq08KvnnZxTQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOyRI52j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQjg9i3u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633BgZv33780256
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 19:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PysCDH89SESlek6biv7T4EgV
	nU6bMf/7kJH/aTj8i/k=; b=QOyRI52jZU/NFiJJ6fKz1aayIf9ycqoAkFey0GtR
	pyeeqyduuWKWcz6wWD9oUvVqci+ZyoFCH/wiUYo9aV3HPrmwXXvAEvhr6q/FdcvH
	ZTPLpqH2Od7JFkE1IJoS+xa8BjUQ/bneIe/hVXVaF2BHKsmNLZVgF/XKJFsJ9Ng2
	woyosPJEwLV4YpHPF9e+F8QqlVb85ESw1yrzbIQ+8rUwfVigdmwv/jhoop9N0QNR
	LukiHxz/xhmxgB/1OALvKhFypm/erm+2d3ZNNu2md4riqEsRRDbSkCE89wulQOFO
	3qDJVhEAnPnKOs6PM+6WwiucPtJZF63vuLr47bYPoQ9Xsg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da663jnyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 19:57:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b3544bc7bso30746671cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 12:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775246255; x=1775851055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PysCDH89SESlek6biv7T4EgVnU6bMf/7kJH/aTj8i/k=;
        b=iQjg9i3u3gHCxpPCZvRnLprDxInJkHwjyn/jF4+9GKzwraXQIvWqUTfIcfx7sHYZCv
         ZCL1qMPm76LAezn/Jmrp5/SP7c6i3sALhoWHJOapD3mKaXnJ/b+uVH9q9pSHCgogObeK
         yputH4nFfpFTJh32Ej9E31Ud+/BEQsY4X/hYN3IEArW4P4MR4O/oeQs0TspNmVoru769
         Jrd+21AsSaDNI2O+I7zeyXmKU1MjNESfGlUIifTAJPfFJRmW9kQCwbylQ4nsbb05V1Ws
         i7SlPNmY/o4fVbfp9etOdHFXBFnVULn0zmspayuWlWPPQnYJXAF3IeyIeoB2vZMUWS95
         Dryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775246255; x=1775851055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PysCDH89SESlek6biv7T4EgVnU6bMf/7kJH/aTj8i/k=;
        b=bv8NjMsK77D9YGeCmlrMwVU/Gsyu7MUocFrjx/1WWkBBS5dVbrW8Eyjhe0znEKwndB
         AOwCfxgpDqaNQQNtqPxojc0dXNNC3DZNxkyzl5FpU66IY+sgPABZEQXhBFdzzX+2nzdQ
         3qjlud/BWip02cNcjhrCUpBvEKl9hXGzcAzotLX+bO+7q6FnuRA5y3a8xy6HGpIC6Suk
         qMfMxXfm+IekLya0BeaUtVUFERHYXnj7IEkr/uikkzx7JDDDRvedww8cEv62b0ixGRZK
         vDyWI0taXByh9eOWBnoxNI/sxu0kI2qTIamRTEI9JYVS4AepxlWcc3Ckr/WmVbHJGjmr
         JFYA==
X-Forwarded-Encrypted: i=1; AJvYcCUX5zc9U1XkjJMDWDjv2u/NpZrcCdciOYwAemFlDHWNP52mymTG9cbRh0GTKo5bJ/FcUPnC6l9KbuU8Umpn@vger.kernel.org
X-Gm-Message-State: AOJu0YwDP8hoAWW966bxY4Us96yhKTa6z5APV6jEMbL399bG7UC9r8Zm
	oCDdeySLqNq5v1V0vPCxAL4/bLFlx0wCqKhBgaQ4K9Ge+83tKDqV1/C04j64NEyntyiRhGGoRe7
	rXFbI7714uxL7d5SJxbVwe+VACL/HJTj12jNMW4eyGIcG3AwCw19jomPGjQV4G8ZxyTQN
X-Gm-Gg: ATEYQzyla3TlC8Zxzs42uorFZ5RKxuokAOOotcCEy9LFuO8G6jltp+HdGPyKUplriUu
	FK8ykVu2bwxxFHBV0EwGclTOLTycuoO5BPG+nhx8XBOs47oOfePeoKRU/XatSjLUe1OLNxgVyV0
	6FTvURmdh5ke2zmUrorg6/1Y8vA/GoGvynFcy0oO+Q5qdYhOoKOZgt9ZhUKbgFLA7V5hiW9Ec0I
	MGic5PmCwejSSl76XHHCz3ikhxqqGyAj2kBZJTbmqGD/i/GLmhBV0G7xkBCt6VThMKOM3nvto0g
	ODglUUO8M29+VS7/nnbQrAcEyXZHXN7OtAxIY4p94B+RT48C8YzKCtAHir2wNOVNAMicG+sKi4u
	AwuJFYcw5OOIeBluOe91+s7LbadIOWmJ36RvPfJ/lJp5kCB4Xxb7ikVmWfe8yCum5BUnFFvC/Ne
	ZJq3qsKd/TU32j6mKUiySjGQLpyTc7YOovuag=
X-Received: by 2002:a05:622a:5c89:b0:50b:1e5d:992b with SMTP id d75a77b69052e-50d62b53accmr63620811cf.54.1775246255121;
        Fri, 03 Apr 2026 12:57:35 -0700 (PDT)
X-Received: by 2002:a05:622a:5c89:b0:50b:1e5d:992b with SMTP id d75a77b69052e-50d62b53accmr63620531cf.54.1775246254565;
        Fri, 03 Apr 2026 12:57:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc9fasm1624857e87.63.2026.04.03.12.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:57:33 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:57:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
Message-ID: <qzmdcdda2el6ixyhwjzyaptagujt5zjdfwuunbhcproua7r2lk@6i7dc3byefxm>
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
 <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NyBTYWx0ZWRfXwIb6is0Hi3lU
 3T0afoR43sWxtTjYcZJ/77FG510xYeeDS/PBYdgc+W/zW/XHgoiUmRQbf3zfMCfDvRGAs4GNg2f
 yYA4cGbl3CSN5yy0T2zN+eKU6JTYiXFKX1OwPxSJ0mlAjZd7QX5LHd+NvV5Sp4PfS54lQtxpkha
 MFl/YZ6cVMNt0teFYJxYpB6s440b94BaU6grh3kWXEpp8ASnFI30j8WyL1Rhe4/a8qkEweXnoG6
 DTO3mRwbHXnnQBgkI8ob1a0/6zTog0L6AkBsucUqLF/eNaBGGcxuaQFdtO4dCoTvjQ3nh0rsCdX
 KEBiNQBFkjj97xBhzgkkLVaMlUPG5F/h/H1USpHmkkbCEn7OvDcZG3dL/L5C4htYDUhS86gl2oV
 NDyMWNGuV07bP32BgpNjsKtMnODhg2dF+T6nO0lSJO5KIn2MnvqOQ6FKODRw/a5Z9lmrk6S6oU2
 88atwOysMC+02f0UhUA==
X-Proofpoint-GUID: YQzCQx8hexWFPpmjYAgvnlAbWRO4bDE2
X-Proofpoint-ORIG-GUID: YQzCQx8hexWFPpmjYAgvnlAbWRO4bDE2
X-Authority-Analysis: v=2.4 cv=Acu83nXG c=1 sm=1 tr=0 ts=69d01bb0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ngLGKwS_UPeau5fYbXgA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030177
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101724-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 388EB39800A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 03:27:56PM +0200, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.
> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm    |    7 +
>  drivers/pinctrl/qcom/Makefile       |    1 +
>  drivers/pinctrl/qcom/pinctrl-nord.c | 3297 +++++++++++++++++++++++++++++++++++
>  3 files changed, 3305 insertions(+)
> 

I didn't perform a complete cross-check, but looks okay from my PoV.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

