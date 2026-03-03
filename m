Return-Path: <linux-arm-msm+bounces-95217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDaUNmVhp2lvhAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 23:32:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BDD1F800A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 23:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B9D2300C5B3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 22:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496673242BA;
	Tue,  3 Mar 2026 22:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOUoVTzJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jKqYDQwW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC9D16DC28
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 22:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772577096; cv=none; b=nX27mPlfU0+XPvgPe724bWEVmhPPZHAFmUye9+I1QT0z6duEy9LHWwkRzTuIHsS6+y0hzgFqRYDwOUMgeuABljIElghXOejh2nwc6op3iMWvU0qf4ooIKl9KzhDzjKBgELXetJP7AWKFTcIoBeCN+l4bupuocSbIiTvStVm0FTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772577096; c=relaxed/simple;
	bh=GwNMax6d5D+m5kKMSn7gmSftOxi+NWgYbuGv9xyj/iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tjd5jMJyR8DggY1kvApj+4GouYw8IEpA0MR1o9Mb1Da7jWxRVYp/dAPAArTxkVQOQf2tMXjkb9nNJ6ctbYyA5i98FQFyldBqJuVBy+FTzzP/JT1QEne7LBUdrF6GGyT/EKeHV6y0gxxuE1CL4dcNfhHdCyAHu6+ZqAeUA8ijnRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOUoVTzJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jKqYDQwW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623J6tFg1791904
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 22:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g5c0yPOmKPUzXOupNhKzfg/+
	Xjp8RH1qLTT5YyM/9ZM=; b=EOUoVTzJDgTno/EIu/Q8cP+nuBggf29M8LrS8gi3
	iVZcK5xWBh/XkZ49h/9yTGszdDQSsiQrc1nCxirFb5Rd5afY+0PC+2n8PhFd/r+a
	D/ZijR2x8zVDIc6UOCoNrHesVemPnKMVg2SvARfUHWYEwy1ZQ0889dcjpbzIt1Mr
	GR1MUR4D3KhKje1Ssx6JKzNkhoBV0K17MLPRUX/MJH7Aazg3nfEECl8SnoCbJd7c
	YSmvrz2b2aufxWWO/66HAp6I70T56cZ4kKSoEhqdrrgtadrGd59EACuYHPjbHAjY
	GsVKZ9vkruD2G7NYqLiVJjU1GxVQLtAJTfnvdDDicPI2mw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h28mvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 22:31:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506c0da79c5so532987631cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 14:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772577093; x=1773181893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g5c0yPOmKPUzXOupNhKzfg/+Xjp8RH1qLTT5YyM/9ZM=;
        b=jKqYDQwW42tuPVRxMdT5g4n4BECxeWvQEPjLs93ofbJOdy0Qh2/vbLP/ENhsKiJ85t
         918MlR+wYnadIHIsOEP1GPbvoerLBqIRDerzg8roCkdDAy2dV+sng8PtI4fA1vD0o0ts
         6zhz/IXXVfWZdErPfu6n0H4qtJqPt4+rH6T6dLyW0BzscsEG9924M3DY1KKUbT4rSaqQ
         ul21xKpwKal6DkKaYYjMWPDkh3OomYpqfH2NOtc/WgiloIAJokJ6ElS4YxlUqUCmKrV0
         bRi4hqXe4qYW1Z+Hd++A5aO3o7T4LW48NMbcyRfco4INqnUoODRYkWzUzYrDgPmQcnBE
         QdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772577093; x=1773181893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5c0yPOmKPUzXOupNhKzfg/+Xjp8RH1qLTT5YyM/9ZM=;
        b=gbjIApc8iJVKrcXrLT0kTPPtzQqwRf+SJ1euK5fuRDyMopj7iGGAFIHvaryUvE/LaN
         /RqKsEygYJXA8h+kDptEjD4dWUEf1fBukCPnnAIPDJ9bJXgGJsvbQToKEPSALTnUJjAZ
         5s2UwZBrCxiOb1F+i6yR6EBLRabKerKWQ9W9yQaQElzLYAuJNa7IMKpaG1cB8lGDbv8o
         4gCq6xtoOvDYfZ7Nh/Awy1tfi/38TgajSY/8yDUx2FOiJrKbYRhQwJVwSADGegEKnUb8
         uK57vYq1KZ/58woRIZUKDF5VKo7f5VNfZEaNC/UX7fBDQklUuKCesOby7yNB6ZhGZ+4c
         mSCA==
X-Forwarded-Encrypted: i=1; AJvYcCV8SymCd81h3QWhSw//QIGII2xZWdoddFHK++GX+oNyHwlzhVBCxKtZRE5k3wYIQ/ghxw5Iv+uWuVSZ5AYD@vger.kernel.org
X-Gm-Message-State: AOJu0YwIGpW8HLAQkZt0MwSIJwC6MeDqgx0RclfVo7Z6kRpcYqoioNVL
	0L60jnHCYUOO2abYqutMSKNDhQfqpAlTRKnIlIvxd8zO5EFczwsNIisT5ajGBcebsOK48j/rPQn
	1jtehBqPMZ+gj+B7y9EZgw96D69HsiziceWF9UttPCB6wO2yR2OFn73ckqoS+iqeEPeZd
X-Gm-Gg: ATEYQzzCtw4Ws+Oj5d8DI6iQZiyNKjPnXMWcERG5J6trvHdsSRhlSRxDnqja3jKTPED
	KMbrCd74OPcmofHb+07u2dC/YNDHwEPX7NrF/wswn9Z3+iEbN5AU759ne39FtfZku94peXXqWYX
	GTv6VGkRIQrM77SNKmM4Wf0UZ4F547aNmP4hk0QzwjtT/BMlFn2X7h6v+4txwmUgpYJkEFHMvXX
	mFd5IS8ykhl7idJLasJKXA04P6IuEAU4qtZPIgbcfHlJcPX0UIJVd3nG3v3LU2uaf4aY05ezHe/
	LvR1bNU0/2YMA4C+G3YR700Et4hEMNR42+pm/rf8zu/tC0Yf4DfGif03W2nrdfLbw7i+Cm+9O/O
	rvpkvXRrOCzKZDRlq1Kwi6CedgKbZYKlrFYnOukJu0S0ypTjMyzz9MvK2M/18+3kVEA5Mwg2zdY
	q9XNO598CEF8ffKMvf27rkSxmu+lejqTiOZ1g=
X-Received: by 2002:ac8:5a8c:0:b0:502:f26f:1388 with SMTP id d75a77b69052e-507528beb5dmr247648741cf.65.1772577093322;
        Tue, 03 Mar 2026 14:31:33 -0800 (PST)
X-Received: by 2002:ac8:5a8c:0:b0:502:f26f:1388 with SMTP id d75a77b69052e-507528beb5dmr247648361cf.65.1772577092827;
        Tue, 03 Mar 2026 14:31:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1235822d0sm837948e87.23.2026.03.03.14.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 14:31:31 -0800 (PST)
Date: Wed, 4 Mar 2026 00:31:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Message-ID: <yhatx2iuoofvsqpu5da7ohpyvzhc2y7uq3bhuhfuv6pkfpqrnz@75xei3bawzza>
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a76146 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=oDyGrVB8f0aMB-Xt79gA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: m8zhpK3-reGs1BGIIS7sJ1nBvjh0ZU5e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE4NSBTYWx0ZWRfX7MKYpwKbJwTp
 oMcERlT3XRSVU8CKak0oMpqLYoyjlM2X7dEX6xghSkserTcZjgi6uZ1OuIWb0wHLrVbfveocnQ5
 TaohB67DAxOm9tTxI9rkMXOTynh4hNS5g7ulKNCK+WmhV9FQ/9uY0yp6+Nuiwzl4D0mzWlyffI9
 p1yQFHZBMwQJ8IWsI2UoGA7CMlsebdXT7yeptLFSBNqK44Xn5OieKNFdkS1xNVtgzNMHDTUdke/
 gr/pPq6InwQ2wBNlcbG9lCp5YKVO2b3OrTE60Su7Gjr25j5+LOswjaxsX/Juj0lHN61ixNjZEiy
 /6MjdRuTT1kApqDOpK/F6OXsH7wxmvY+oTw7Hy04paKm7U/U+BMog1lwtyUT7KkRWnmag6tZLBp
 8aa8+RgKsDvoV2XOHpEUrkLNPbLT7uQwxfyw5tQgSy84ey4gB7j+wF6ty5G6a8OeXpKnfxxe5qA
 fLzAXJ77il3HEkRp3vQ==
X-Proofpoint-GUID: m8zhpK3-reGs1BGIIS7sJ1nBvjh0ZU5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030185
X-Rspamd-Queue-Id: 40BDD1F800A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95217-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 05:51:24PM -0800, Vijay Kumar Tumati wrote:
> Hi Bryan,
> 
> On 2/26/2026 4:34 AM, Bryan O'Donoghue wrote:
> > +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> As we are cleaning up the PHY device nodes, we should consider fixing the
> power domains as well. Although TOP GDSC is defined as a power domain, it is
> not the power source for the PHY devices. Rather, it is the MMCX, MXC and
> optionally MXA based on the architecture (Refer to 'Voltage rail' column for
> PHY clocks in IPCAT). There is no
> parent-child relationship between the TOP GDSC and these in the clock driver
> and it was just working as the required power rails are getting enabled
> by/for other MM devices.

Which domains are required to access CSI PHY registers?

> > +
> > +        vdda-0p8-supply = <&vreg_l2c_0p8>;
> > +        vdda-1p2-supply = <&vreg_l1c_1p2>;
> > +    };
> > +

-- 
With best wishes
Dmitry

