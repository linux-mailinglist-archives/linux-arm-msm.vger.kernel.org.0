Return-Path: <linux-arm-msm+bounces-99447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBtZME3JwWlUWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:14:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CACAC2FECDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D259D3008621
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA1F381AE2;
	Mon, 23 Mar 2026 23:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nss4dijd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eaCHZYaK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6351369225
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774307656; cv=none; b=PNoSpO7/Y7/nRk48NCb3Vi9nWgHB9AxOiArX9PX5sx1JRBgYYukIuwoZglNQ5BJQCNiuITczv9TBDx7VR91NDXtLU9s73vtl6ylAQQqE3jFPwwv0PUWwg8alWAK3wE5IYYc/iWPun7tmTVw9CM6JrGFpZmhWrNvA22PKmclHLp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774307656; c=relaxed/simple;
	bh=4QF9F6Mi1IakMkxw/M1uGq0XCyBXL/snCuE/s2NrHrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EixnvPL5nokfLDy3RLy8e+wbE0o1JT/eVpBjmDgaDbMtJJni+E7JmYkr02IqwGNGx0jkVSAQnnyzRRE+b3Mbgqjnxw54eSOTZEezvXe4FvJah8ct2CV5ycsLGh7+C3zZTzLX0QL0+n4tpFBFB5ctIiLVM9gZvAtN8o3Aa4Bp+Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nss4dijd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eaCHZYaK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqWRg2831804
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D6BkZqnoNSPJB7maqyMGa4CK
	xe+HKu9cufTWT7EWliI=; b=nss4dijdYz+3jG5IqnSRYhGPWRu0RLrpYJ6Yh79h
	ZdDGSHj2kpo4H8N4WWOgvegyZd38YWkewALLnpGTjF1/ZjEu/rZ8sPIpUw6pCtr8
	ZUgoEUpHNcUcuvImOIkHo3rtV2QGkmpy+MZIDmZ7L18l1M5NULv/YVcAMFp9CdCV
	mWHKMObhnPcdfaA9Mp3kq8UUG7YZYShfVUsQPazyljho9glqnMl6q3tKHzaqzQJu
	UI3bq2xi7RZT7EDYU0xz5UP8pW0ECkoW0fr3lYoAiCHw+d7b50w9SsrRvftyNa9u
	RiUog9zp1krfrLNQwx3mEBlS4xAqlTVXglq9LLZLnZXNLQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d364jsytv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:14:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b317c40acso50693991cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774307654; x=1774912454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D6BkZqnoNSPJB7maqyMGa4CKxe+HKu9cufTWT7EWliI=;
        b=eaCHZYaKelAOKp+CBlaSNPMqJbM/a2dmD4Q3bcFkdZuxLIWxlLDyO/Sfkrv4XMGVhl
         xATbPY04yjQGiBRVznq4lpbopXccaqQlmwcbVozNiMplyRM/yA9KbT0XRjvigerU+Vui
         S5kLQn4iwZ2s2U8AKKVUpXtaQORfLvzpJK6I4ZCQSZJygSxYnOxP/lbpKLkDa3UEJLgg
         E3l2AlwMbiH+jSAhPk4x93kEje6nzd6pQLSV15Qk5layzTLm5WyqI3fA8jSVnEoPEP7v
         M5BY2eVEGhpLM8GGgp/f1DdCaVIzJU09qBvA+hGDdGLFswyixlpGINNqKaVTDXxVbCvC
         oSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774307654; x=1774912454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6BkZqnoNSPJB7maqyMGa4CKxe+HKu9cufTWT7EWliI=;
        b=lKt96a8cbmdolU8aLtsKO6DbfzWZOT7P++Y8oJxOIPN3Wpy0uUFiPHxEWUTOwi3RyF
         J2UuQFSkzC8RgrdBx0yN8bEG8P2/Tlf208GgVHjvcDlj/wRjS1W209A//ssACbwgFrhy
         qF2G2I+/dFR4XyQKWD5/T7x9jwOCYyrL6PZkButDPciuAiV916Yt6xjFF5TkI+yQzky9
         bgSzIrwHiOO+W4lZnfTbZTFfeZ5/cijQCO0LJOaxAS3FsX5/QHymeqsFjpE/AbdvTczi
         F8ZOR+U/VWa9WUYudmNYX+BrpteaUo2ayJFgMf0ne/ZGhtQXHrMAHIGPnwbFZfmZ0nuz
         BFaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX66Sb7VONmCXbGwWdQ7/37c2dsvkKymltmDmajybtiIIiOjAAXV91eTJt1bGFbpMAvUETH630ALmFaHoN@vger.kernel.org
X-Gm-Message-State: AOJu0YwYdsP9RU0fOrLXb2ZeZuL27XcSu5HZ+okNzDEfUIfb18JEfWCd
	7oIkPPTF54hQpjn1EdhHljh2mBci/2b7tWbR6Ioe85N4uBH+c5XRRGYy1UuCO8uCR/mF4AYhlcr
	THa3Z77gm+3drRWjhmBUIjTzz/P3Y7aEC/zxdHgiO3NsOM5ohXDDYFzaokpBODkH+ATl+
X-Gm-Gg: ATEYQzy/6No9KPZVEotFP+jikMnp5G8afUZTMPBYGPmk/5t+ZmTEl8O+jorcx0x85mj
	0yUEPmadQ9zUvD7nLCcfovcHBsqxDM/3Q7siellnenK8mPFfZuPrsVgrWn3xh/ri3so+n/e6oSF
	jkyPCv6uj93aKt3Ng2ic2YpTnLA0Q5iFszEJqCLmbTqYzb+IyFhaK2uEpUUt6O0i6TeKW8lgZAD
	3RH94oLtlpsbCJ/Lpujc11yF+HTTVBKrn3N/KD82j1JGtWN+fKVQeXO7zEpGkojrHXk1n9nApcP
	y7QzYd56y9EE+C1KWn9lVs+xPIh1j1eYtJAoG9hw0smRaPDCVvEP0Y93tOE9Z3e6NvnuBiu1Q7a
	Qz80aFiqUTHayTapb3GM+cmsHogykxzpgxIMbvbJNWzji2XZB7VYP8pmLOcia4HDPnK5LLQOFYJ
	NQxgtgaq05l16YkeswTw5nnSMohPX0eP8wF+s=
X-Received: by 2002:a05:622a:4c15:b0:50b:38c1:c6a with SMTP id d75a77b69052e-50b38c10fadmr221442951cf.19.1774307654188;
        Mon, 23 Mar 2026 16:14:14 -0700 (PDT)
X-Received: by 2002:a05:622a:4c15:b0:50b:38c1:c6a with SMTP id d75a77b69052e-50b38c10fadmr221442641cf.19.1774307653733;
        Mon, 23 Mar 2026 16:14:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9aa7cd0sm28541251fa.32.2026.03.23.16.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:14:11 -0700 (PDT)
Date: Tue, 24 Mar 2026 01:14:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] interconnect: qcom: icc-rpm: allow overwriting
 get_bw callback
Message-ID: <75zgkrwvjsmnvjeyosl326vcudklj6yhhyskdrsm23kbzhgve3@64nezs6c54kz>
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-4-7892b8d5f2ea@oss.qualcomm.com>
 <abb14718-3d94-426a-a0f0-d101470951ad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abb14718-3d94-426a-a0f0-d101470951ad@oss.qualcomm.com>
X-Proofpoint-GUID: XFO8-GIMtNaOFKJCFqpcgbUftMQnxp_Y
X-Proofpoint-ORIG-GUID: XFO8-GIMtNaOFKJCFqpcgbUftMQnxp_Y
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69c1c947 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=8nUxU6PwJs9B8C3Or1gA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE3MSBTYWx0ZWRfXx6NMr+AD3VFT
 bufWBVISB7ZKcy5BhIF9/RNmCSn7BwzrVmIlaeR3WGuNajUfM7514PBT2MKju6hYZrgXk+hVa0u
 98flK9xDbFxSOl7TPP+hD5nZkveVG2D094RALXX1ikJopJP/L43mCgNFpC5iCA/R+RKcRnZt0Cy
 WeO3hL0E20ktqLfQcw7k9WXp9FK4v2hGkGyJm0eConjabbKg/D3ZpfpPK8uz1KTtKSBAOPyDljy
 kW8hsweT87m58/o/l+O38RXXGJcSsjC7f8Lh9Py9DoPWZ/nMRRNY1VAnW19jjIS9OoaUfTH5gms
 ICnJhtJqKgiHdkTqEsDS9rnYlW3txdni2ak0EG8MN7dg9MIFvxqNhLybhgGA0uzp0r4uuYNXV8m
 JO0lezghic3eWFcBx/cXAVYnt9zFZhtniQXDx+39Lt2KzDPOHYB8qG3rLzx8lkoHkzkqbleAWfs
 Uwwgv+nsxkPEg6fSwTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230171
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99447-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CACAC2FECDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 11:32:33AM +0100, Konrad Dybcio wrote:
> On 3/23/26 2:17 AM, Dmitry Baryshkov wrote:
> > MSM8974 requires a separate get_bw callback, since on that platform
> > increasing the clock rate for some of the NoCs during boot may lead to
> > hangs. For the details see commit 9caf2d956cfa ("interconnect: qcom:
> > msm8974: Don't boost the NoC rate during boot").
> 
> Is there a single specific bus where this causes an issue, or is
> setting *any* resource to INT_MAX problematic?

I'd refer this to Luca. I didn't experiment that much (and also note,
this behaviour might be firmware-specific).

My goal for this patchset was to port as close as possible. We can drop
the get_bw later, after enabling more interconnects, writing the QoS,
etc.

-- 
With best wishes
Dmitry

