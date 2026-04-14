Return-Path: <linux-arm-msm+bounces-103220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MReJhiV3mlyGAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 21:27:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A8A3FE033
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 21:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7CEF8301FC0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D223090D5;
	Tue, 14 Apr 2026 19:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l6AfA2/R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MTRsoGkX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C342D593E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 19:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776194837; cv=none; b=lugPmIG1IqJjPsNO2gLyLB5A8KAXT18xSLq6k66yJwDQDDTrt8tPndzI7rMwMojwuBpFGK+FYLGRb+ICa5Eoigcir8pdw33p6/IvS/go30DpUA6FJwnW4d95U0kCM9EbpcjQD8wTPDKSL7BZrlbmDl9tehzho2oUqwf0ZzKdmWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776194837; c=relaxed/simple;
	bh=HIxYCzzwdBgIIgcddlq2kTcmNf7WFHQffDvd/3eoxAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moAEBeytA6dgWGl6WxO7PwTLnD9pJXE9EDqxxsmoeU7dZmpupdA6p2UuCyjhdZ2Qbf3Nn/iVfdWuG1u/4HdbPSGNJXPrvwrcz1yB7XqkPq2W6m3a5kYonEpbz4h8wmcaaKFrovFv0k3JksQ+QfBNTa4O7Pi+sU6BHH53cnZYFds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l6AfA2/R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MTRsoGkX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHcMo83100846
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 19:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RoJV5yRb42H7Wx3oSKEa1Xz8
	MaF0ZY9VJkqL/VP1l88=; b=l6AfA2/RuDvL8DMDwNTXzJ1F8ERMizpydS8tAZv0
	RJFW+4K8S/INQ8XFSVc8fKS/jcI3cinKROir0uB4NWZKNg3eNh93dp15EDzABRzY
	IzIuRzWPsBZ2+jyd2VxxnjjntcYsoSBwJg6cYQ99AimfYPq8ZM0p04xSe+yCzy4U
	Q0iia4Gg62U/Sv8TD1NSfe7JXVwccAsxQiiVjhyyew/eWNghJbcHM82dEuJT3Ps5
	cifPRiYnK04zoLg3LNeLpUiA4rNt0+53BsHGt5k62cDPQNdQNGimvN4mFuUCrsL6
	9Dgo6zvXDafPcRgEsTrdUY8+r/Gbmen1IUTa930DgPVWrw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht5h0c6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 19:27:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b323c43fdso105182501cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 12:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776194834; x=1776799634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RoJV5yRb42H7Wx3oSKEa1Xz8MaF0ZY9VJkqL/VP1l88=;
        b=MTRsoGkXXkYthuy9nBYSbkC2kHU7jsll+YdCLjTsADmJ5C4DclaJjx0Y2ritTloGSA
         qPQv++IAJut9Td9mpxklJx4FaKNHHlulrcL5CDcvf/rQ858NcgAudMmFTlaIHf+uSQfz
         T63jkLJfHpYq14VuLC0e8Wzexsd7aNcL5s8w8CAB54LLZ+NgZStYMQMYMFW1KGw7ijSO
         RTBB2fx+t7oz52njjMHrHAoJhKdO+aRtcB6gTE9Q2tGv/l9Ur+GAh1lx6m54buHndMq0
         j2aly4Uu/bRzbK5zo1PWZg0DtVkONxzxOzVVgwE0wP6qoKIH5YOsGntDizuiVSa+Xxsu
         UP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776194834; x=1776799634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoJV5yRb42H7Wx3oSKEa1Xz8MaF0ZY9VJkqL/VP1l88=;
        b=Gb87vUmOq/KRaQs63FKOBZK4V9X/tm/vAQoaUGQT5ZGC230jSfpdgnrRNUpl4UfnZf
         gwzMSQ3TSmwjrQrRQjkSnz/bn/voQYsN0/aJTVQZer1dXN9WYHs5bRVy69NcPMNV4iFH
         N6+M/es6n7yNWKshCLtqNKHZW6pjyo32AVqwYQT1etmxXRcUnDj2vC2cCOLa6HRmCZJ2
         zHA2h9jSToqKMoGgpUJP/a+CaCkcjAOM8DQdRcZNRh1Pbr9oI5qGik/dkTFJ4sgnnig2
         ffFc2M5rl6kpvUlTv3Mj35IOriayZBpGy/jBzHPZ7a2+9AbYAc5gcr1eDAU3fMvPjqFe
         56sQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zF/MAUM8NG/fjglV+rp/ycfsvLl2nYCq2RRrGIRNho8f/mh2U5jIbI+CikKCg0ZsQg6Hu7b5+LkO+K+5x@vger.kernel.org
X-Gm-Message-State: AOJu0YykZJ1OtWJrjT59TrGDCIZsnaL8ZwZDEJ0fvcGBdYVqcWjh3wwY
	SE4v01NfMHChtIYHqZcK100P/mLGaALDXNL5MftaWpZpVL8sA7a9Udvpn97woK4oqWM6yOXldfD
	Ak1QgMHFfa7RYNkQcHstlJdLJ5+1j1QruBLUQyL+5RzDDDr0Jwo1cdEegfkw+CEyhmwoq
X-Gm-Gg: AeBDieubWkat2Tttnh+F+qCP3zb7QLFGGehfL8XlOD65WOmoMa4/fgNPVn5aazSXM9s
	Z+QmpaI8gG2EhTE01lv7x6CmMObjDDdKITnEVDdj2gHoVluphppNFxaRydIm4xUZdgXh+/xhC5o
	XT9viS24cfhkUOE7bUaqaSjRd9VNyYCGf7mIyq0zJYhz7xiH+vWQP6bKJb2QdE13EZbm95pzQ7a
	ZCVaABwTKK6W+/f6+zWklfujuTAA4F1XqzkMxCFKbPXKcn0t6pUl00wdnE4NJTxGV4ZRkdv9eO3
	zfj2jw1zIrzdqvzl2xNCo0qPXu9w3RHUea5GJhSpodqhgjyob0AvJ2wmtlo2GbmSC2Cuy3x3SPx
	ca/6cYrTLqNchVU3pdBTzrqeluZfCyzyEUfvQrSv8q/Nw/AlCunN3n6/8mfsYHhEfK5x/VbgbIY
	Wh8puJC0iiURurZCwHzGDBI/I/92eTeLAiOOL31W98BSiG6A==
X-Received: by 2002:a05:622a:181b:b0:50d:9b4a:e6f with SMTP id d75a77b69052e-50dd5a91b71mr264673151cf.1.1776194833564;
        Tue, 14 Apr 2026 12:27:13 -0700 (PDT)
X-Received: by 2002:a05:622a:181b:b0:50d:9b4a:e6f with SMTP id d75a77b69052e-50dd5a91b71mr264672631cf.1.1776194833080;
        Tue, 14 Apr 2026 12:27:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eec42ca0sm3530179e87.0.2026.04.14.12.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 12:27:12 -0700 (PDT)
Date: Tue, 14 Apr 2026 22:27:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add power domains for Nord
 SoC
Message-ID: <2fue4vclozesm4d55id35eutqi7jxomwoc2fd76k4yfjvx7doy@3lfukpmsvoy2>
References: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
 <20260414035909.652992-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414035909.652992-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE4MSBTYWx0ZWRfX6b5h5afDZjdr
 qliY0IbVL2xQKOpu3e4GWc2QWFnd9LarvpO/jGP4r3MW0ygGsXyoFtfGROC5xf31O2TRJt6T7FT
 003F89weRFv7nD8rn0RFd4NY5Oe6IGUyxghTdSn5g7A2ClJrTiOCnem0Ut+oBulj1IFPlVf957f
 VRst0bud18KXe6WDDctMY88aGZhm5Kj4M9l/NHauznF8QPn/laDFCePXJVfZ1mHGakIWl/O4fXe
 H4zz1tpM18uY2wvQ6Bzzjnjk6e2YEsXnMoSLgd8ZKjHHQdBIHu2VSzz5S5Z0gWKcbn+cq6AbIn8
 w02agZJEekoJXbO0YsAZwRjIuXlwaYvZ7hNWb3cy3ZXHb/DU2KswDa7+hKXvFVQQqyiS/W9xuyK
 bF3diL+/ZHO6jhT/JicW30yXMXyISyqQlE5DPFumpsPyuUILNodu3ZGTTYkPRe1Yic93hCWs5A+
 bnSmQD1e9A7f6l93Itw==
X-Proofpoint-ORIG-GUID: fAWoS66l0BmP_yvAnjMUPttNC9DVhVAG
X-Proofpoint-GUID: fAWoS66l0BmP_yvAnjMUPttNC9DVhVAG
X-Authority-Analysis: v=2.4 cv=afFRWxot c=1 sm=1 tr=0 ts=69de9512 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=JNP-2SwAGeoVs9V6pf4A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140181
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103220-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 27A8A3FE033
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 11:59:09AM +0800, Shawn Guo wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Add RPMh power domains required for Nord SoC.  This includes
> new definitions for power domains supplying GFX1 and NSP3 subsystem.
> 
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 35 ++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

