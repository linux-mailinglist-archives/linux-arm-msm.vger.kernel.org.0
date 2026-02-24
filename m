Return-Path: <linux-arm-msm+bounces-93945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INVFEDNvnWk9QAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 10:28:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD02E18493E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 10:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20739302B1AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 09:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262F336BCF2;
	Tue, 24 Feb 2026 09:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BiaqOVCS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASWi59JY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF7936C584
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925297; cv=none; b=Z34AmcruMq72yfpFrnGeEyMaHl3df6oc8Y0soj1x8y+h3sC6p0HZXbwBfhf7jmhiFHa4+AMu6RN/UkC9JY9BFOZ+awsT4pfLt2XIPrD0XXPK6suIjuOvOIEXMkiUTCSyfjNwhKj9ojaerZ/ch2udcs7C5sBhK6UFPs17sDzgsXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925297; c=relaxed/simple;
	bh=BUYiHZMDg5CiQUEhI0NrAWFyLCOt5zr49z+m36g57As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9gxfDEqLCq1unKPNO2ZfGeH9jvDt9k5M/UIgMhCjx48h/e170/Bc3I3SXo4E8ZTmWbdF5R85RgMbzK8FieMRcTSHE8Q+isayB8AMQTz0aV0bQOJsHqHqRmjr3p7oZKoMHFA8EZ8O10++LehJDt+oVJ9sXv1ScWTB6honbnBjCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BiaqOVCS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ASWi59JY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4Lq7X1019523
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 09:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gPqtSj6o8M5PV8qFj3UT/bsM
	acHXiGqLaVAMN4CT/dw=; b=BiaqOVCSrfECB5ga3NKgy8g3K4aCBKEezFT7QC1l
	4WVigIx0m9qFTLyRncCIHd06O3yb4bliHwIM+eZ7i8kMKhvrgU8Nen+PKSwMKUfd
	MYA33NzwOC10Inr3wD76FuzmuNNpa4El8GEVNsYP9+ZR0EOTeuyDDzNQEhnQf7+R
	d0XPWZv9cPVA7mYMfpjw3xbp8k62qp1aCM4JsvWG/yWfW7ZhR+VemGNLO9Wdy4bD
	MLoieNI6A1s6sx5pUxvbSJD5+fwv/HevP9WoN+AF6OHP1msuRZabfpwcVvKt/PYD
	/lsv1hqavIjCeLHzVKuFm9/5OHmlnc4xkrJGxMw1JmRkqQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj8bdve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 09:28:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358f42fad0bso331899a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 01:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771925292; x=1772530092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gPqtSj6o8M5PV8qFj3UT/bsMacHXiGqLaVAMN4CT/dw=;
        b=ASWi59JYu2qnN8Nn8XxK4o5291nCjnfE0uxxuyzA2iEdxj6dgSqECxma4wlrBnhSQX
         WkhL7Z6MN0VDhwBI9FppinakgmK0TsBua6k6sLP8QaPYrVwaY+WwbNVUhk0urVlUc7qS
         anBCxbjKEWxtI5JHKc8cv3zKSHn+QTm0b5ZZ5RvxPdQCAEC+uSRzb5rNgswNyGvfQ0De
         4haNY7akzMrLqhx9mCW1URlW0++M72vOHmhgG0EIbzjsYGBAug4uVIVjK6tA2VCZMsEP
         68rPW4tEQ9aOE4ku31/RETz9SRTwYAS+xFwj1vUsqjOJqlO4quURRT8BxB1+/DjeVjol
         PIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771925292; x=1772530092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPqtSj6o8M5PV8qFj3UT/bsMacHXiGqLaVAMN4CT/dw=;
        b=xLVzoLZfOnWpVJLzfisjGIDM5F8+PmlHl06xljt+dWNFJolW/GBKBIl+1MX4I+Gi+m
         2C1/UZI9s1Zrqcz4shcv9KY663NAkBoE5f+Sd/3G58GyQN4x3SE9RMHdOmlEp9HUASNY
         xNMzx+RUKchgyrhDHyMdjJ/mgg0p6MAai8IxxqSzm4XNPCaMA9LxDDp122Rt/HElMTyk
         Gbn3svkzTQ9w89BvTzm6xVTkSWHgJEkDhfkPYFlFryR1XMbOa6xGsrtVgVDIPvX1Ji6L
         6wU1hkgr8EAVRWCjT2K0HVjA7TYAa4FGRPSC+Dg1BbnQVeh//pJvB9EWMm9Q+Luij99m
         n06w==
X-Forwarded-Encrypted: i=1; AJvYcCXHrDj1nDYtc78wrbjjh0n0D74/1hcUmNA4EGgjpUduY8CzV/CgTFkCWa7ddcmHHFP+44J6mybxJsi0FVV7@vger.kernel.org
X-Gm-Message-State: AOJu0YzLAK4ufhA/YcsZq8ibD5O3YCBHayq3IyDsdaw7FxdJ/hFlG11c
	7xdBe81Q5BPBLw3+UpFhi9dIDYxkDWh3zJ6vA4ek1BlBq4VWEF0sX3/xaxZAJQtAv/jnf6M5NKL
	ItpGYdvsozBCmIhmtaGCQWXuect+dRRVk2D71QaQ5AKqsn+cuhymtUevd/aKiU1sVVylC
X-Gm-Gg: AZuq6aJwMWu7dbzwXNGB+pZBvDvQHF5GGlPhhOy79MwvXqWa2V6a2yoemiNeuohkS2X
	OMt3kyTmcFzp/HGURQ7tN8161h7BV4SZ66HvIPTgAzGxtug+fgNNPCXdaAjpPkX2Gzu3um2gK4g
	oYlNfhi93777nS6PcjUjJ5Q6yeWnzlRiYAhi3Mfugngn+T+aFxvykD7gn2UvQfPEWp9cIBpycgC
	FbAIOQHTHDn+jBSs+5AXobDDcfh9d2yA4hyZs6NzbCcC5wvQhaBhw6FfmH/q2ubcT0hMqQg4Qdv
	qIGhWiOHGrhA6nsQYVp082FhDPiTkPyfhjyEPLcN/pcLG9JVQkHooeY6MUMWzVv5hhOFrQ4w5+x
	M6pXFHYLFaBbPsc2i41FKxiW3QrDH5KlbMQ3A0DczV9dNcG8fliKfR30=
X-Received: by 2002:a05:6a20:1595:b0:384:f573:42bf with SMTP id adf61e73a8af0-39545f8900bmr9357827637.53.1771925292297;
        Tue, 24 Feb 2026 01:28:12 -0800 (PST)
X-Received: by 2002:a05:6a20:1595:b0:384:f573:42bf with SMTP id adf61e73a8af0-39545f8900bmr9357803637.53.1771925291774;
        Tue, 24 Feb 2026 01:28:11 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f637easm97694695ad.37.2026.02.24.01.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:28:11 -0800 (PST)
Date: Tue, 24 Feb 2026 14:58:05 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/2] Add support for Gunyah Watchdog
Message-ID: <c5a57ab6-ad6c-4228-8ccb-7d7ef306b5b8@quicinc.com>
References: <20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA3OSBTYWx0ZWRfXwk22fvoi11y2
 NR0N5UObZJRctj83TY2kmPERpxIBrsYJrNcxrBCA+gpPyMSjfElaKyJBJbZgxuluI6VRBVJBMi4
 2WRjK0PaPBISpbpGiqhODd+y+ceQ97kfwbk0+WXqHCwy52aMa5WI7RqZXXHxADTUfxR4v1s/JfC
 2UOq6jShRL8qTUlXbj3pVXz+Q3qV5sgRKhH9ExjrZGl9HnxQrTkOaguH53FCTo41eklbtjO9tpr
 sjNZHAb0QaQy1K0rM3Zy1eL92czXgTspagepjOehNyRPg3qchCVCEZn1v5an51D/eMKwRapE67u
 rwS47BLR3+NRSZ8g4sAkrhfgJ7vlfPb8PeijbYYH/6If3UCUsTh+GKMWyIxaaHDEzkVQLSQ0R2e
 ZWhwzGghCF94p54rAk6KOFr2qe9OSpz84hHzP1X+0lHaYv/ML0XwSpny8kDCKPUnXMfgobKkjd/
 Fi1Xh5lGFb9VIe0gEmA==
X-Proofpoint-GUID: 9iEg44rZNp1B5tAVBO5ycjSXUKdYOeDq
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699d6f2d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=YScB8c1TSMsKagIZej4A:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9iEg44rZNp1B5tAVBO5ycjSXUKdYOeDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93945-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pavan.kondeti@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD02E18493E
X-Rspamd-Action: no action

Hi Bjorn / Wim,

On Tue, Nov 18, 2025 at 10:40:55AM +0000, Hrishabh Rajput via B4 Relay wrote:
> Gunyah is a Type-I hypervisor which was introduced in the patch series
> [1]. It is an open source hypervisor. The source repo is available at
> [2].
> 
> The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
> access the MMIO watchdog. It either provides the fully emulated MMIO
> based watchdog interface or the SMC-based watchdog interface depending
> on the hypervisor configuration.
> The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
> version 1.1 and uses Vendor Specific Hypervisor Service Calls space.
> 
> This patch series adds support for the SMC-based watchdog interface
> provided by the Gunyah Hypervisor.
> 
> This series is tested on SM8750 platform.
> 
> [1]
> https://lore.kernel.org/all/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/
> 
> [2]
> https://github.com/quic/gunyah-hypervisor
> 
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> ---
> Changes in v8:
> - Fix error handling in gunyah_wdt_probe() to fail silently with -ENODEV
>   if WDT_STATUS call returns -EOPNOTSUPP, indicating support for Gunyah
>   watchdog is not present. Fail with logs for other errors.
> - Link to v7: https://lore.kernel.org/r/20251114-gunyah_watchdog-v7-0-f5c155b941d5@oss.qualcomm.com
> 

The series applies cleanly on v7.0-rc1. I have tested the watchdog
driver functionality and ramdumps collection on Kodiak RB3 Gen2
platform. Can you please pick this series for v7.1?

As Hrishabh mentioned earlier, both patches don't have any compile time
dependencies.

Thanks,
Pavan

