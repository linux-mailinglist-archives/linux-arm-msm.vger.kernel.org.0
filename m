Return-Path: <linux-arm-msm+bounces-90565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEcmC6Bud2mMgAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 14:39:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A1788F89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 14:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FA073071258
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192E033A6EC;
	Mon, 26 Jan 2026 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z3IXpmep";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qdd9lFuH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F7F339B5B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434472; cv=none; b=mLr3wBFNWiQ00zDYGB8xn5H5UCFgLEkzltI/sfn1Z6pJSUfbOiT7jTYCbUamo+tCJ3vaZPp015cVZjffNeiW+NJvNhUMilpDpacYAlWLfCK/2nWx/g3KTRzca/kLUOqHYy+ijQDYfkhjkIACHo7Q7XcvrlihXDhO2SwsC2VLifE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434472; c=relaxed/simple;
	bh=yXLAq9KlI8wvcQ/x/qHbyHeswnLofO7p2mbItxHUGag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dw7+YlePRyOHNQ7+P8p8yDaNISUbd23GqeQ2ybMrR7vgHwKj9cYMauhIZtnlTcFN0GTXszAZyX4Zk0HLlNFK5uSDNn0vbME2cPbkpt0EQHHUnYIu8ERaxHh1xpU/eAVuLWD0tubNocN8Mtz+rfZaATo1TqUI5uXNQbLCVvlYHP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3IXpmep; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qdd9lFuH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q8J4Gb791030
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ogUx9c3kIlHsbm7jPIpllnLu
	xzdPQLpiDV66FuQYNXM=; b=Z3IXpmepD25Rwer3iV4ZiZnV6wFeCdnof3NojsHQ
	AGxkHG/ezDhKh9WKel7QyeuDSOyQx4USsxODgSpA+DnaY3JdZf0Hmp6Vv+xvpll+
	yZ5QgAZxITm7eHWlw+SXd+5w0usnzVmtJAI79QDuoY+0cD9WsPaCYp0jjWSXEsUY
	8mz+4lsFsX2tV2GMqJQU40fXOV0uFAEH53UabprRlL89/DWgtZuVgVq1LNhhpQtv
	35OktO/ituRRjP3VUqniON5dPwwSUWa+tGHM5Yt5W3XMq1Rfv7CwuLiG5FX9pFpL
	eAyHpvcf+i2OXlNdzNcdUJaDMrXT2arLqAj4q31R4E16vg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3hcmnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:34:29 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9483db35badso3668736241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 05:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769434469; x=1770039269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ogUx9c3kIlHsbm7jPIpllnLuxzdPQLpiDV66FuQYNXM=;
        b=Qdd9lFuHSk2R86No3lE3iZi+u2ipD1pmpHAv2yS6bBuSfqUdIzAFPzIP2vsDoWQ5SS
         +d3/5ihwXbIXRk3ZNRLR8XWpdJIZzMWMlGJCWkAWIlbK561nLv/1aNU+jyFLvNqsDItd
         BM/gMigxY78Kcn2j77sP33ias9WLv9iFXm6WtrLfJM+WU32tJ8kEIxOgwZX8qpk9sD/6
         49SZ9go1h3++DBRi09Z5md03/bVhRLWF2H5uMMHFZeX51RDDXRBNXOM3Nk8yJoIksZW0
         ohCp1qZyMElQjcR4FInJGAmQ87Xl0YlcIrQw0eu+hkzxdvUP8MNPHbshbFwVyC/X5rDU
         HkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769434469; x=1770039269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogUx9c3kIlHsbm7jPIpllnLuxzdPQLpiDV66FuQYNXM=;
        b=PPg19t9TBHOGnu+vkoXvP8fIVdvtK4GCm+kH8HH8Q3py8ku2Fc7bHOjjU6kL813sX8
         pw+N1fluNNw5UeC38hU/9oE/yqntTI/f2MgpXFJgUTyxN/lsCdAAMB2yF2rnHvWGBWlx
         6CFjxmisA4NvUwWAOO/2mJ8V+Cv/wi2TSk5xKo9x3QX/ZHD8H7ULBj32xwX7zevmz/TY
         Ogt+ynMhTSUmgFapySIsmg+jM1qeJct7rjRgQV5WEjXlapuGeR/m2XDac3SFcJ4sTpyL
         8Qq5L10hzXTHi4AwtHmhbhKizdcdbMnbM2bqPmhX352yhSWHomNiXGdSoIOrYsVYdM0K
         1KDg==
X-Forwarded-Encrypted: i=1; AJvYcCUx2DmMRpeCT2QQbXMrQtPW/wQpvv3fCuu+N7WU3miw4AqgLrKA019b1JHWsBIgss4t4pKr6iF//zGfn6Zq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+mFtggbrLmbEaAMll9WQ8XtFBFoP8n04v3IDnxsRDtjCvphgt
	7dyfwu/0xYhc2UwspGayiCZLoWjgGkoiDXe60xe0o9R0HAYZJGhcMUwiF6s0c4Bco0/omW2+X1D
	VrrKgeOJWncZz/oy8C20Wcfe6jagZldiywOVitevUhnb8RM6TnzqxyT7e25YHbYyEE5/K
X-Gm-Gg: AZuq6aKQl/qpfUeEr45YaxAKAE7fPBab1aIvf8SIlJ1XL35IcOEN2lO/Vg6ZkyB80m0
	NrTsMghJ07qINFlVnhccnzp0U3szY3eAuRtn5kz9xP4MuSiXmnvDvkon4OP4sFaPfb9pV27y+kD
	x411/Qq0lkz3og1qtVvpyaa1L558iAZu11SByMtTB0cOZIxYFYV0PnAuPIHe0J8TN8Oloyhf2eD
	bFkmNGzl1gYFIyBFXJ2SNogZ8FpAVlmUSGFY+An/W98RKWJyJD/Tqo3YUymBJOQZPeLfzU+k1o+
	MbFmcys4R6nT7u3sWQWrjy6/6896jbqUAh2pBcKd/c+gQhchAog5juRu1w1DxFq+zx4VeLwpGk7
	lk5cMATOmSN0XKodFxbvzYhfoQktPCJBAXfOPsK1DaRinOk9/Ra6Hqb0zX6UxzguK5HLyR+ibFL
	t1M9CLAlrMxv9cVljsL7eEpC0=
X-Received: by 2002:a67:ea46:0:b0:5f5:7737:cdf9 with SMTP id ada2fe7eead31-5f57737dd04mr761428137.1.1769434468804;
        Mon, 26 Jan 2026 05:34:28 -0800 (PST)
X-Received: by 2002:a67:ea46:0:b0:5f5:7737:cdf9 with SMTP id ada2fe7eead31-5f57737dd04mr761424137.1.1769434468407;
        Mon, 26 Jan 2026 05:34:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918f94sm2731664e87.66.2026.01.26.05.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:34:27 -0800 (PST)
Date: Mon, 26 Jan 2026 15:34:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] interconnect: qcom: glymur: Add Mahua SoC support
Message-ID: <k54tulgkio5at744qcuhqijgb6hb6kjcahloyiiu3ujeoqoir4@vu3cuu7p4wvw>
References: <20260123-mahua_icc-v1-0-bc82cb087f1e@oss.qualcomm.com>
 <20260123-mahua_icc-v1-2-bc82cb087f1e@oss.qualcomm.com>
 <vpaz7jhnuagfl24dow3ktyhjtzktmhiiwh2rnflub3jbc3pgu2@2ydlmugmqgbt>
 <d160aa9b-d22d-4c12-ab4f-42b5dff375b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d160aa9b-d22d-4c12-ab4f-42b5dff375b5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDExNCBTYWx0ZWRfX35NS9QKVXbzP
 h5ekFOsxo+TPZjKjJpsZGcqH0glKOUiFJhC2Mapr2DUPbyo3CJPMyhX2xkPm6ELTYBqkfXzZtFJ
 U1N2ODKF/MUZ5ggkeKrIX05xYzuttPt3G8UMD8AqtxVX/kJLXKNlAh1bRYmut8wpwJ5vhQeXQhV
 mKM8jjUh4ubPThgSlSvcwL8c0ZsD28xPQqgKq7dtl1WN8zQoiOngzh9XOw4QNXil3jjL8rnB/0V
 uoV+ZmHj4dBgA4P++bbby5szdg2Knib9FxGeZMS7iZmuoWin9ophtkZXqVtKC9+CDY2kum+Bf6y
 9WKOYCOtrL/00cGzaziATLxtWJwrKsvg3I971fehSXHTlfVvgD4FUvkaeAPrxPny1YdJasVNFiV
 cf6fsT4P3U2FFRLV8qEZjSrE6fs91iC4k7Y9hbPjpvHxX5P0LLi3Oq8DSvHqkldkGlaQA/bt/8O
 tV1n0c0ulFXDqM1+11A==
X-Proofpoint-ORIG-GUID: w6xZQ9FWqAdY913-LwyOYDDqrsrvsVLI
X-Proofpoint-GUID: w6xZQ9FWqAdY913-LwyOYDDqrsrvsVLI
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=69776d65 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=_hxizIyGxqbTRImzlzYA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_03,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260114
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90565-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B6A1788F89
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 06:40:13PM +0530, Raviteja Laggyshetty wrote:
> On 1/23/2026 11:28 PM, Dmitry Baryshkov wrote:
> > On Fri, Jan 23, 2026 at 05:12:36PM +0000, Raviteja Laggyshetty wrote:
> >> +static int glymur_qnoc_probe(struct platform_device *pdev)
> >> +{
> >> +	if (device_is_compatible(&pdev->dev, "qcom,mahua-mc-virt")) {
> >> +		llcc_mc.channels = 8;
> >> +		ebi.channels = 8;
> >> +	} else if (device_is_compatible(&pdev->dev, "qcom,mahua-hscnoc")) {
> >> +		qns_llcc.channels = 8;
> >> +		chm_apps.channels = 4;
> >> +		qnm_pcie_west.buswidth = 32;
> >> +	} else if (device_is_compatible(&pdev->dev, "qcom,mahua-pcie-west-anoc")) {
> >> +		qns_pcie_west_mem_noc.buswidth = 32;
> >> +	}
> > 
> > Right here, set the node entries to NULL.
> 
> cnoc_cfg_nodes is declared as an array of const pointers, so the pointer
> values cannot be reassigned after initialization. To change the addresses,
> the const qualifier would need to be dropped. To preserve const, the 
> entire array has been duplicated instead by dropping the PCIE_3A related
> nodes.

Why? Just drop the const instead of creating unnecessary (almost)
duplication.

> > 
> >> +

-- 
With best wishes
Dmitry

