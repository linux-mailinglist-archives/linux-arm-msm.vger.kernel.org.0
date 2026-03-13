Return-Path: <linux-arm-msm+bounces-97582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMFCBR06tGl3jAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:23:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BABB286EF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C07F303C006
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A924A34B69C;
	Fri, 13 Mar 2026 16:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CF9qfFnT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMC1TfLu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB463C5DB5
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418777; cv=none; b=jx+L1MxcaQmVyGmjVFwgCib2zfrab4dYqAs7hL9cZjCFaaX/hddQgN2IH5MToL2h6qxclvorAERE7xjjb1GZ0Q+bEUDLBYPC9ki0bgd50nhxYVjdgRrII12bl4Yk2E8y9XzK/4fZSXuOmBcQRbrqf3GQGnyjCaSU2+dpU8D9U84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418777; c=relaxed/simple;
	bh=CUk+1Eqx8Eg7Gj79EP3JwQm6CTzkmToq1Tzgpw8RQIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXXJMfcLEQ9iCd120mYY+ZoVMsH8sUxtesQgUNXBOSR1JDOtUWO0mpyBh/iiuP2F58K79+kaa6sOQXA+RvU0pBwF/N9+iE0ZbT6K+nsCvGMAzBRXdCzv5r575hWsgMuhd5FOSM1d4x+YLgyARv//yx9+Fca7UnNnd67Ac/F6klQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CF9qfFnT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMC1TfLu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DBtFuW4140698
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jH5WdttmdPjFQXmMJeR4b+YI
	SdBHMwDeAfB+CsyH+/M=; b=CF9qfFnT4OKerIc5lhJhz6zRjl2pL2cU5hzd3TRi
	Q5Bp+Kr4V/rb4rXgxvUet78rIkYKhjPan4cBb8WL2OhEyBeMtXiCiGH77Wq+4cuR
	FtjaGS8P60Xl8o/R7k/+kk64hEKXHapUevjcoxZtxc+e5uykVKLkKC8U97YjPObz
	nj2+yTERYImClxRfk+QhMjouJWhgxSaUUgMQyNwZW/Sw38E2aCYEgdpex4A9pkyQ
	rDn6foGLfExZHrmJzv94ppC7f5bRl9IchYTbX0LmfL/P/fF/y8+WbPMl4mjgK2L8
	JQMJ57WEGIWKpwpe3RZ648kAyvBkc9SFvTVV6m2+Kj/Zpw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn2abjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:19:32 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffad14cd7aso3390049137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773418772; x=1774023572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jH5WdttmdPjFQXmMJeR4b+YISdBHMwDeAfB+CsyH+/M=;
        b=AMC1TfLuUMPFTnKMiSPH8Ihw7GodfI/pKgD0ifL9NvHKmeuYfrQoO4x3dG4sYrXUXW
         6P3T6VKojwnmD2r0YWp8dJ/mEwOK6p2uQBNRw14McTZfXKqkDeCXOEJwsFfyMMSlCPq0
         K1Fnds7okyC0HD7lo9kgSWfn0hvDM4p44SRP8eLffq2nEN7YEPb6RZU9NLvQTWSkzM0Q
         zeOtBW2ZqD2uxpy3ePh3pSE+pEF2kh0z5/oU4vXDK2fohjkJ6XoReA/l3Fxd3nqY8TQ5
         rOXJvD8rr6KhQ4LJUjEa+OMZ1YXkNVao8a4yIpuqQARN2htHYkcL7btC5xJeXSlQzNOb
         iDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773418772; x=1774023572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jH5WdttmdPjFQXmMJeR4b+YISdBHMwDeAfB+CsyH+/M=;
        b=EZSBdmKX69gxctslmye1iXrUx31bi9PXqFb1KkdI615IYDMRdLeV3KmCeU/73qJ4v3
         0O9z1FH9MXjj3OwQZ97TbvgHkxHsLewVFFvtflLZG+AZWHXuDViNpoIbhNm8QQAwCSdY
         bvwUOZeoHquKxKqdfjG9ALvedzNJTOx+lcPn+jJJn+cA5AhYWaXmLZlRBbpD7GSutwjL
         2KnzUCjv5+HbPUnflB1IPAW4zhZRvOfo2j4fTfkfxdNvZOOHLr+GiA1CimpRtI21UbQV
         iQ27MKyYy4csyt2N3tSCUL3bjFkEtgxMpIYK0IXZ5hfv6WBdxrDfIZX+58YC7zIvduOE
         It3g==
X-Forwarded-Encrypted: i=1; AJvYcCV2r5+44wE390Gqjk+SLzm4O2+FMIOvR/N2JHkMeMBvF3wBnSyfdMGmh6bqb3Ak7mi0JcBffTfz1eJxcoid@vger.kernel.org
X-Gm-Message-State: AOJu0YzNZB6z39K8dO2O8VUTBGzedcwv4c/glCR3br1ahlftRzJ68i94
	QoJFvzNh2sJBTMFQ13UfrZlRdmpge6ODx8XZuYnP81ixXLD5kDV4/MYsrg8Qpe9Q9Mb5Czdtmk6
	D2cx43ngmjFeqVLy5LL7vyu+wqxiFMwrDs5SQycLhZFPnHodKx0JeU29jgPpREPGdXH1F
X-Gm-Gg: ATEYQzzipz1Zq+biJX3Ya8ZY/pBylbqqBEqX/jafgC7jPzydhmeIUlTM9mp0dVVHjHr
	4C2Cl7iSePc5qScx4b6ybVa3gqnftQZAQzAV7ptjOD1Wg6dwQd5BRX358I+gmV6VAxWB7tizCC5
	JG2MSbACA4JI2a1VfdAQ6lWVPAPkqKtgvV/hZ+ih103eaXw2gJdYXcbsz1uCB5FaIut1ON5rMVf
	JzCJV/Syj+QwBVntE4nOcAxM3fS/DkRHS0hWbq+kqZyfUPLAMAcKO9/AIFd13NFDBM/dgVxMy+L
	hAfrhuFYayOSzq77Soa2e/EVe/y6CxXR8ASG+sg2Ji2k9jIkcsHgI6eyvq0neMv8zzTFLUmEQgl
	fq8ZXgKD9Lumxes8pAFInH8krdou4ifXNK88gwdJuCVI1zU+MH2FUDbTeCrChd7hugGtca2nrCr
	0TWP526AbrhOKQp53rluGLjhxCYBNX63SuvuI=
X-Received: by 2002:a05:6102:160b:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-6020e528099mr1558481137.25.1773418771887;
        Fri, 13 Mar 2026 09:19:31 -0700 (PDT)
X-Received: by 2002:a05:6102:160b:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-6020e528099mr1558462137.25.1773418771385;
        Fri, 13 Mar 2026 09:19:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e7c014sm15622661fa.44.2026.03.13.09.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:19:30 -0700 (PDT)
Date: Fri, 13 Mar 2026 18:19:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        r.mereu@arduino.cc, m.facchin@arduino.cc, geert+renesas@glider.be,
        arnd@arndb.de, ebiggers@kernel.org, michal.simek@amd.com,
        luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: monaco: Add missing
 usb-role-switch property
Message-ID: <pkst2oth6sq3humlpebtjufchffln3cdvkt7bhtenry3g6js3n@pd54pwuzmvro>
References: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260313103824.2634519-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313103824.2634519-3-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YOJLzGFyJoRnyAJt3SMbA2Mpfu7ix1Uz
X-Proofpoint-GUID: YOJLzGFyJoRnyAJt3SMbA2Mpfu7ix1Uz
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b43914 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=nhzPNyzC8DtltQpxoCwA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEzMCBTYWx0ZWRfX9LIHJj034UWP
 GC7DiDmV+YKRMQuhg4rzTY30ghyHG5ig9eOfXQvpL/qMg50g24xLsI5C+MkskOlCeGsHM2sVFtO
 B/dsXfL0cXQWvBVsG75SlSxPr+zZQYR4RVmRH0BD6g0mSMqFTQo4YOF+GdSSHS8NRXgjz/8cvFI
 mwHm10QYB3WxjNT9JFejVCaKsAYJyHz7ZQnYHQWGJ5pEZvlCfhebfHqn1uFWSepQoNyliNiiTzv
 hp3QRIHSZbgAjcw3bgX+A4gg7YsocybV17CD+pVajLr088GUAacOWK+GVRvNm7GNsgFNIZtCZXz
 DcUloUhLTtd+B7ygLGzFm2RgPACneV59eOOjx7wGZiQw/Z5D/Ap8Ro24Lzf0lPzNWiO3GpQwQ1C
 91gpoCnxM1mRc+4mjE17foX8Py6hUbSZNlQru/Ze+oNJfQdDZH5mciz1syAPRL/jvGXsJh3nkqa
 CF9JN3nP7Svr1rr7bYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130130
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97582-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,arduino.cc,glider.be,arndb.de,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6BABB286EF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 10:38:17AM +0000, Srinivas Kandagatla wrote:
> Add missing usb-role-switch property to usb controller node.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

