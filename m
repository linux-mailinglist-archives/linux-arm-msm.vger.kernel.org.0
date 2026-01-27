Return-Path: <linux-arm-msm+bounces-90840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHpnCw3teGkCuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:51:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F0C97F92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 984FA300B3F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFC5361DD7;
	Tue, 27 Jan 2026 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwkrUIJ3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cwspwkNn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5143612F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532652; cv=none; b=d80mtyo8cFGmJpkiYsM799JuDmAkOwGpFfYWOo5Hlkg5x0fDLNIo8Ttf6T7CJAHL7qjHlUdPUNHpNII5yclrtyncDzBeFPMW9xKO8sMuTNh9F6wdcs+/pE8mGPrzstetrU5G1fAXfpP8iqeDMabSDj843CG9e+vOHSlh2vbE8U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532652; c=relaxed/simple;
	bh=FXQ5DVGRAb65rM0epnJkqlu5NxnXpwgtQjwwqSIXZok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhfWjkpTaIU9cI+lilp+ql/eh85TL0RvQj1wRr9a8GZRg1HfcQkTTdHZiy5E6SEuryC0+Gp9PUqblUiVgEaAJiRxmbJAEoQy/H45/ZdL3yPv6/xyrwRDDI8vXsuhmMjSd5kgIxic/DuNw76qUMAjEq7P2dox8OGQ49qiUnnH2mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwkrUIJ3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cwspwkNn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAHAIl3714753
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E0LQ2QT7nv3LLfeKdfIwx01y
	S+8NwlJmqE8Lp2NWAgs=; b=iwkrUIJ3HIu6n4iqrdbYLKpFLxIkjsndC9WcO8Dh
	2AqzgZUm2v//ZQB9l7fe93PKRGa5bu5Hz4ZOgOgSVBaBb+oFgyouA4ZVNVoiWLns
	FO80HdIGt5z7mxNN+haCB0qMnVf6oFZDGTZDppShYDjsTZDxTwFliUSzF9DsB6F/
	RkxQEaFQuKsgjZegTTc+4I4MbfQsoto7MadYsBF2PqBWbo9W7VpU+jbHlMMdonum
	GA6Sj8EuWZsNcGbMRXENFB4DbPr54SDjL+1CPQQGw3aaPHaYeYVFFBPWo2V+Cf8O
	dbNJ+VgxMxjiaESHOC6K03Q4YTZ1syNw1Cc/uK4hn0gnRA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv0bupm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:50:50 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9483c49a63fso13040213241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769532649; x=1770137449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E0LQ2QT7nv3LLfeKdfIwx01yS+8NwlJmqE8Lp2NWAgs=;
        b=cwspwkNncgkZ9UYp67mVmHMaS7XpCQ2BXe46PRQqgyaUnnPv9wf/WLvZOKC/s4bHen
         Yo4jp7+0K8Um624CDtasKf3z9gGc1blEBmPCoqj03XMDkFzwKi/pOAyKuyC3j0s4Z9GA
         DesfH5IVwLovPU1lqlsd9JV6bZw66PkeVwU2WWXJCozy1mlUdRm9eL9PCxP97AXGTzZ9
         eX7bkr2o6ohApHYkKTV969K2fYNyTNZFH+dRoJNxsD2it+YXA8I3XRZtUx9LtPAcoo3K
         0HYEIf+vTKTEQi/V+FN0Co4RXg+W0WyR6orH+xTsFWjZbVq2Cn9mXHuY6I6TAMK0KJyp
         FZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769532649; x=1770137449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0LQ2QT7nv3LLfeKdfIwx01yS+8NwlJmqE8Lp2NWAgs=;
        b=PjrO4Jgj28uBHHNopdV8gBrRPvopeIXzJZsF6SVLt1P/MSYgCdXEYQVk9Pemk5PQ4W
         t4j2Nn5whgNzHzRaQfYxPOnMdKnmUCH+jCIwkLQT14CC57zprhlYcmGUyAHZOKJYcnam
         zFDU3AwenloHLrKBtCLaZ6CAKBFn+0SGWiWRQPNkk4zaNigzBe6qAeZMawkEQR5dHzl7
         r6PXJHkpD+6tBGg6tAyvaSfXFi1iODqujxoF+kkHN3lNC9D4VSWDkBu2dzgBEHj0tHJv
         U8V0OvYUvHkdAzMWubYlP+MuR0SK3k7CfyQ7K9ODsKUf6/5dL3CoewkKTxFJa+htXwLs
         YNew==
X-Forwarded-Encrypted: i=1; AJvYcCUy2p2a/Kc6tYyW4SkGsyYFJemexRmPvsBkSDhyDTERTZ00/69+wg7iwbvtWOx2QmDeEXWj/tSB8vyXlZrK@vger.kernel.org
X-Gm-Message-State: AOJu0YyYlb0q5WdbPvc59HuvL0pKPW3RBVVZUAo/8RNLFNrjYmg/egXD
	QnbWea9uMi0BJrGYK5QiV0sUPJmwHLmtIoMMtsW3JhQRVyHxRPrCLo8Gshrkl7eP5LJUOXF+1Ew
	TTt6cn1fJjQxC/afGeLlMl6s7y5Y4hbm4AkrQ8NowgMhzVuFXe6saWYFTdKQHeYFWkfc/
X-Gm-Gg: AZuq6aJ/+bceA+2GapZqrBzLRi8c1RzaUyNd/2XDQcq8V+4JY7tYjZf1DwnOON/YaAu
	ekX42SpMBTunZDtVJCGEMb5bSQ1xmz2chTFDp+/WGT15HWuWcsri4nzZjp+KRk3uAz3OOQEUzL1
	HqXuy6dyBOc9Z1by19R2zRkPqC3cOWWx/ToMVjKBLyHrxuEC/qGDIQCQO0b03uFClnptb4Mm3CY
	ELPKc2RZgDQMmuuXBkyZs1UQORK3odIyo6siPHbY5luFb82QKd7Y+kkNy1+GDKqxnxzLbX7EqrK
	bhpfi2eAqg/FSgEeUrhjgvaOOyECEGgeoOqK8CSd1zC1D34y9HFt3JIyK3hSFX/S/GpMx4qLe+T
	iAbrrVL1aRo9fcLC7pNtjdsFdbY5IIkM5RiyfkzdqrMwAGrrMmXrdYApZ+dZli3RL9S8MEsIBoy
	dLydoPVfvrXvcwGs4EwOBaRVk=
X-Received: by 2002:a05:6102:3583:b0:5ef:15b7:25aa with SMTP id ada2fe7eead31-5f72388ff8dmr1131390137.22.1769532649419;
        Tue, 27 Jan 2026 08:50:49 -0800 (PST)
X-Received: by 2002:a05:6102:3583:b0:5ef:15b7:25aa with SMTP id ada2fe7eead31-5f72388ff8dmr1131375137.22.1769532648955;
        Tue, 27 Jan 2026 08:50:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074819d6sm48243e87.20.2026.01.27.08.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:50:48 -0800 (PST)
Date: Tue, 27 Jan 2026 18:50:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH v2 3/8] remoteproc: qcom: probe all child devices
Message-ID: <6nv6mb5mvyzmqve3jgrzctnb5em7xlzpvj6fcxtdmuvfeqlsfw@yzeaojgjp5ax>
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
 <20260127155722.2797783-4-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127155722.2797783-4-gaurav.kohli@oss.qualcomm.com>
X-Proofpoint-GUID: Nb9v2bMCYYtnja8ar7QJkAjSbrl6NJEG
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=6978ecea cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=g46zYgqLIJPSDqYTzkoA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Nb9v2bMCYYtnja8ar7QJkAjSbrl6NJEG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzNyBTYWx0ZWRfXzlg5jOrs+X3w
 V6A2BRUQZMBQutYuY7neIUrlT6sP5stN+sAnARb/Ou95XvgJOTsbyPjrBNcKaOLR8C+c8fe2mIN
 FQwuoq5XxgA3wH2FwPVzu83PhhH8St5t+vOMz+dTquJYK2iGOHCIUYxi46AeQm4iMeMqcgBR3t6
 FE8w/s813MPlp8xHtQ19L6OYcxN9+mjKy5+5GIL1+nZj6IxU8F2SVmBejgBGktH+RaKqkN/2Bf8
 /CMtRIIzh4wTo2ygk7FN51Q9vTvyJpZve7O1sgCUWiiSSiWe3NOFwuJG1JyjzbpJz25OLKhh4WP
 yN4EJ9Lrt2+5lU9jWGxcwaxwz8j9CycwAR4A9cQQCg4no98TXaxd1jg72Gm9cij+ZPX5lMdgNqm
 uo/v/DRBUheLT96x8wqsstSTkd7FCQfqzIpwuGtp04TggFdBwQyPhbdjyu9SL5gGtUqnJkYdXSA
 gaBGkHiDFjmNqVRWhIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270137
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90840-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97F0C97F92
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 09:27:17PM +0530, Gaurav Kohli wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Currently, only qcom,bam-dmux nodes are supported as
> remoteproc children with of_platform_populate(). This limits
> the other child nodes to probe separately.
> 
> Generalise the qcom,bam-dmux child node support by probing all
> remoteproc children with of_platform_populate(). This enables
> support for devices that represent themselves as subnodes of
> the remoteproc, such as QMI clients.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5.c     | 4 ++++
>  drivers/remoteproc/qcom_q6v5_mss.c | 8 --------
>  2 files changed, 4 insertions(+), 8 deletions(-)

You received a question from the reviewers and then posted the same
patch without concluding the previous discussion. NAK.

-- 
With best wishes
Dmitry

