Return-Path: <linux-arm-msm+bounces-92499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sF1OJsoki2mTQQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:30:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1406011AD52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5777A3038D10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 12:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D465329361;
	Tue, 10 Feb 2026 12:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lsCRdX5C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hpOo3FVM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52835328B6A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770726597; cv=none; b=p4BdIjvEl28KXI0r1+b/Xq+jJPUq5hNZcIApKpiqcduI3n9gntcfzcTR+uZcEMqw8DUR0Zq/+Zy5Foy3MyzX9qjE2Gz33aLB7DUBLn2odFzuUMI7Ky1MV2wY1/J9/Zf204iwawNQO3NrgpxqxXtujard/eApOS4FnjMfZ+zEBWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770726597; c=relaxed/simple;
	bh=ynDOaw5zeBez/vvCTV1REmsBxtzx6Hnm60lupwpT6IE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDmXZpd1tu1+kY19f6V985GGjZOHcnKOJYSow52lLzUJ7pphCDZl1x4nUNoa2Qg3TNsFdao3fZxyig6+wpkWrDvekOQSwmsyn8s9umKF14zYsWjvHA/o8HE1KjnndjMUDAAlKL1np7ExHv1iWd84GmWKQv+7NFjVCukC9cpGP2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsCRdX5C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hpOo3FVM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A76xQ21151739
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=97rjhH1ymJyg+j1jFhkPQu06
	foz+oSrbQ48sEJepdxg=; b=lsCRdX5CFu4T81tdcnp5NNi6T4uNsndZ2hcBMU3K
	vvnnrpcOXhcj7NRQTUsTpN9+w8fjh3+pYHrOj1ORVr9ZqY7NnNEC+FI6gVbOhdgr
	Y8lPm6hvU2uKRrYkLCAHZvDyeUZm62iPwrT+OEpX++KSKEVUhV/rkNH8qwZtMqYX
	bFqMvXvfu76aG7l/rFEb62pmARnA1EVukO0EfbvcVvIMQeKKW3cT00kO6YNFJoM8
	T3jpIVleBXtVWfUAxT0cw8g+0a8FYvu6HGv53fuztfM7fTvjNsV1IptWbEYo6NNW
	IpHlNtAMBw0ep/1vCX1oWwe+QDYb6m8CeXcgds02gzQRqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c800j91fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:29:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52d3be24cso113911185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770726594; x=1771331394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=97rjhH1ymJyg+j1jFhkPQu06foz+oSrbQ48sEJepdxg=;
        b=hpOo3FVMGpqqY/GWUv2W50pZGtr4SG6dnZleQnMVF2uraUntynLBPHhKDhxICd8Cy4
         pP/wqwCqCpPBt43hJGNGhBDkSFDCFpNPCXwm3L0INbiS2VD9OiXTe8q/s6F5U5L5FoGt
         BLsN7O7IGL3H8h84wR1CqnxPpqBPc8W+mFRr8yzQxdQUWfq237uhU6b86jCq1L2GAVbz
         8sEYCO6Cjawn89gm7xTZ5UyZAtC63OKFL23JLOIvkEaq1X5rgjJc0Xk8GzZFGnrQrGsH
         UirvznFyJmqXKhSv3J7GSvRRXUXumFiU5DnCGSwabKSIqGHZf6bkzZEoyvC055TlRF4A
         lhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770726594; x=1771331394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97rjhH1ymJyg+j1jFhkPQu06foz+oSrbQ48sEJepdxg=;
        b=TDBtOvMCIhFyiolI9ZbrVBb43p0YHzJ6GM90p0+kCJ66jowUeEo+oT19cY7LOD5gKD
         3mX02HOBuORsr+alnkEBVBt9XEhNOPdP0LlokN8NYkVGELhGQeDWIrXK4UKkZcUxf6Ub
         BWc6Rs9VVOz6ts7m0cuOePTS7yGfGYmIiV+KriUX+Tz0JDYKpBQaeXvT0/0JPolkhl+6
         WW1qnZDnTKAnmZAFfVE1hrEmEPqm/dOdewuiwZPpClqXNLAAyCRO9VklWRUk11vJsVoc
         gy4YO6KZ03Ul5QV6wXd25D7KE0b1V9eBvElpujL1DpyNbokkR1u+axZxa559b7ihlCFJ
         fKfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwup38j9KegirzTY2mPi5pY/qd30ZBNFC/RgGoLJgdggWOoLWMwLSHSle5QBc90UBLfuyU/BGFRvFrKtVj@vger.kernel.org
X-Gm-Message-State: AOJu0YyjRjMes76Aees+85zPboOSNUdSrmkgvxfNCRFHDcZSB6ftR//N
	ZzZWJczR9BgRZ1o9m/FAn58Qezi14hTsGWI7ve3vvzFx4GcNmP7Ki9nSzOmbkbPD3bQ6YnJct/N
	aSmNlekUWmheJ5X12ygDPU8GwBtfpm1/57YGQbAWznuY+l6qBRD/n+k8O9sC0I/cAZGd7
X-Gm-Gg: AZuq6aIsXvkvVxOuu4iK6r50McVKDHkJqGcsXUeKhfJ4ZC7j/Rvl7HGRbUIeDR17UK/
	c8FgC25e+e8wpoQ4KsCVaZmpzdijtxptPh2tdhU+kLWQciPbIkaKovLg0kFtnhg9I3qZpfMsQYJ
	vTJ77CxE07j8KyWTetdWux+TO4Ol7ugLvszptLZVhhYxIz9je158G9wtvKKeld3GnwEaogEUd+H
	3lIFHdz3dBTp7hZJaJCAP2JmOVf31U29jWC1CIHSf6eg4sg0lzd2/F2LV+gKKI7lGKiP4TX9Uej
	T/ZjPJm4EcK6xZUvfSKHNq7xIbfmtKCqafr8R6DEQWiaLf7SzS8uGefrMLnD9Y8x1TDjC2aPqxi
	3S/GRbMtmY1N5sj1Wn3q8atPb9evxU1rw7F0Ty6QPhdcH8MEq5fgQShaY/h7gYnikzgLS3LrpqK
	hAywzRHpesWoJeC9ZGjWsVCeg3QPkpr5Gc6m8=
X-Received: by 2002:a05:620a:1a15:b0:8ca:2baa:774 with SMTP id af79cd13be357-8caeeb51219mr1933291985a.18.1770726594154;
        Tue, 10 Feb 2026 04:29:54 -0800 (PST)
X-Received: by 2002:a05:620a:1a15:b0:8ca:2baa:774 with SMTP id af79cd13be357-8caeeb51219mr1933287885a.18.1770726593647;
        Tue, 10 Feb 2026 04:29:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44e21b64sm3273652e87.78.2026.02.10.04.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:29:53 -0800 (PST)
Date: Tue, 10 Feb 2026 14:29:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: Re: [PATCH 0/1] Introduce Monaco EVK Peripheral Mezzanine
Message-ID: <qt5eymdqg74x6p4vfr4xwoz6pd6yjrxwjqfi4cquuwly5k3i4i@ujj4p4hfar7f>
References: <20260210103821.4169-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210103821.4169-1-umang.chheda@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwNCBTYWx0ZWRfXwzLEwt74m4Il
 o3nS7poyW7X1SonvBnX9aBh4DExntJdRztO4ADJeDVrNYhrO0MOZ75qhIqB8/AcGseoCkYaVLkx
 6vrBcpRd/LsjWIQNtuL49vfM760gps6xJjY09XqbmQBJR+O0UitH7ibEHBS679C4O7uyXwOC8UI
 tgwekrfzg14SOlIYIpJuhFCd/pVk7Pb/1IfIkZNCACP5/1NyaOfdREzANCeXup145+g6jFVJlMn
 AmGm+1Bnp1FNk9vo3W4U2X/IXV00V199m0NrvxSVExhkvBeQx7HEr2RRhEl20KzYzDjLQyd4SJW
 TYKvyCixA3uRwrReDAxBG3Qdh0B49BMOfyWTFqqAXvJ4VQO6qStz+roM7dl5f9QAjNu5N/HHCrW
 prUe2sW+c6PRs9EZu8c6A8c5LCD/KkiQzhtMX78QVHF5CXtBNayTqssehfik0HHsY+31W03H+e0
 76MqX4slMdf3OJhRgKQ==
X-Proofpoint-GUID: ne8BpO2jYVQHPgS5g6Qt1y7FOADRiCmL
X-Proofpoint-ORIG-GUID: ne8BpO2jYVQHPgS5g6Qt1y7FOADRiCmL
X-Authority-Analysis: v=2.4 cv=b9u/I9Gx c=1 sm=1 tr=0 ts=698b24c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=L1PSN8ylEX_lh-QUstkA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92499-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1406011AD52
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 04:08:20PM +0530, Umang Chheda wrote:
> Introduce device tree support for the Mezzanine peripheral expansion
> card used with the Qualcomm Monaco Evaluation Kit (EVK).
> 
> The Monaco Mezzanine is an additional add-on card which can be stacked
> on top of monaco-evk board to extend peripheral capabilities of
> monaco-evk used for industrial applications.
> 
> It connects via expansion headers on the monaco-evk and provides
> following peripherals :
> - 4x Type A USB ports in host mode.
> - TC9563 PCIe switch, which has following three downstream ports (DSP) :
>    - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.
>    - 2nd DSP connect M.2 B-key connector for connecting cellular modems.
>    - 3rd DSP with support for Dual Ethernet ports.
> - EEPROM.
> - LVDS Display.
> - 2*mini DP.

You don't need cover letter for 1-patch series.

> 
> Umang Chheda (1):
>   arm64: dts: qcom: monaco-evk: Add Mezzanine
> 
>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>  .../boot/dts/qcom/monaco-evk-mezzanine.dtso   | 189 ++++++++++++++++++
>  2 files changed, 193 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso
> 
> --
> 2.34.1
> 

-- 
With best wishes
Dmitry

