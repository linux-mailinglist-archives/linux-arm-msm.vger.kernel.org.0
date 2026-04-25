Return-Path: <linux-arm-msm+bounces-104523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHCrKDba7GlEdAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 17:13:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E3A466AE2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 17:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 432BB300BC83
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 15:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAD137EFE8;
	Sat, 25 Apr 2026 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R3ztoQWy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VpYs6G11"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749B4342517
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 15:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777130035; cv=none; b=aCoH0z0B3vkuifECGmFaTPerLtM80aqFiw1jW46tXDa8vvVrjNUFH2EuCKDG+E50XuNI2dU7yNRrc5I0DtcqjWHvSFmdYWIR9WluImFfPqd8RXgwysmKUeFCHgsBUaZZF1VRKvb8NhDCHK/2IigDrV5GNzZkv6fHPS5zexVfJE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777130035; c=relaxed/simple;
	bh=q7kw2zvOYOZfIrQVu43Q9rg+v3DOzSEBWRSlSX0yqZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjfyYKeOsa1P9VRGcDNIaLBQfxSHipPtPyY6x05HKKUxh70KqmfwLxS95zVXbrVlU+fthy1t5NTtZ0yURWj4MwXagTDpbkueHG9FvkFUP1F9F2P0ORZ6JOd7cYJO1Gc8mxHjyWFFxNzC+Q0BNvtWJClYcwh19sfsVa74wUcx30Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R3ztoQWy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VpYs6G11; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3SEwc2954889
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 15:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ISjHcJxWlHfZdpd8WBKSKC6d
	k4V5pw+EOv5nNsZ3e3Q=; b=R3ztoQWyg2GnhG71qOaiKM9hKYp2rboHkSmABiiT
	Rm8ernq9x1nuXZT5P3AC3doT9IL8OjICCPI5V62I3gPyhkEon1i9OVmXRY+eUute
	p4R4wyYuFNgbwn01CI+CRoLJNFyrx+C4deS/bJbwiArraMF2OTDMRmAyVN1ur6dM
	KkHpeNSBVvsmfdKAfX3R0Y5FDnB8IIRPfIt8AtufYq/wNlc3wF8XKKt8c4myXr2c
	6ZpW8KQweyGQoOZxmxZTnBgACeeEq6phVhcdZGDUrwAQ2k/kXWWxj2tel+S8ZK84
	kYlRchvmUYfiTMqDnAD8/+rIMe6y3I2V4xOaHq5MlOJQtw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrh611-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 15:13:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a5f6110cadso208571346d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 08:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777130033; x=1777734833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ISjHcJxWlHfZdpd8WBKSKC6dk4V5pw+EOv5nNsZ3e3Q=;
        b=VpYs6G11LFPTWHTkgBumuWOnYjAcRm/HZwO2gY7/+xVR0QNn6nLqeCJDWb4SL9kod1
         pxwOEQsZHXLFgi1bFErqPRvZBGFMQM7JmIEMtU3wfzLCgWtKFoMGPpxUsj6prlDD9mNq
         GJCeIlHjsjX6V24Larcy1Di3Q/XV9Iy4Ijgnf8+wtCdTFueMLQTpVP4put76qPqiMSap
         CViCWqD+dkbfZGRcM3zuVXJg4bwlpEAyIXFiZyrztW3JeahQ7AmS2o4/iEp7zjMpuO52
         0f572QjtoR0AGZEO0uUkqe7FkkptZcc8cGYu1QB6mtF96yKW+uBu3jS1Rh59CsL0B3TT
         OZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777130033; x=1777734833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISjHcJxWlHfZdpd8WBKSKC6dk4V5pw+EOv5nNsZ3e3Q=;
        b=sYhcNmTHKCpRJsiDkxh9uxxKjkHXfnuCd9aFkVpJSQn2sGZIn44WkO0noFecsAQXCx
         Ba/rs+tHVGhm77vyep6xX0SYT1W6BeYgGMNXq/ZQdFw137GuN2wqfbwKEM/7I0wCqHn9
         sRxI8ZdnovtYNSMllYapKJuyy85FhHDVOtrHbGtz0c7amhzQMI+sx3Dx13U5F5p1PK9Q
         XK2bri2P1l6UsNnZ2evOWd43Bt8Nrxlmc8ApNb2bUE/wck7spsUAIEVMUaDIykWdcNjm
         Ea35QoYgAObuLh1gqy951xI4AaVMvaUwsFG9R4syHOCKky18NsY6jwRoo9bRWFc/Nw//
         ustQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lCa+1eIPbK9QWCc+/Cfg+kZBNtFab6NGFfkoOurt3B4NCaZ9Uneqx3BmvMLmwdh54lyQxvzWAB0N7fUCc@vger.kernel.org
X-Gm-Message-State: AOJu0YyhrPrkHpoxCKXR6eNFOE6dASrcWIqNxJ1POhjgRP87nxOidxdp
	g36WsDkAROZv1AEkUUWuJGelPPoxbkLYvppZ0/GhFbKpaa7CQoZK9uEuV32S1lgFsq3KwK4axQz
	xEtCKuPznFaG/T8h+kfPHu/X2B6G5nwju7T56WSNbMoukyNgqrYElOC6pPoMyEIhp3tnV
X-Gm-Gg: AeBDieuozejdde3mLGdqNueyGxA9X+dp/luDC5bkUcppVUumAd4c1nenvMRjV/+fFZh
	k4cmuxXw/noryZE44kA6Ee2TDHAV3/jJkeilsAyMRa/DxpcnNevKBingakZMNOVEmJOX1fB3S8L
	W+oBkRj37oz9mMIMyALG3KGpGAfdky6unt7SZFcr8QhGms/xSXjPT9n+BAF8DhrkZ0pC4ac4qdb
	VqoG8V8VXgIMR+U+LG91kWoBD6trbvzZiGFfT06RbzO8xjHok7Bxk0A0e8dDhhsESIO+Cxbg409
	yvDHpIe5EyMiMhr8JefOnIt6jscJ9NjHmffVcFbJ3mv9qdwKGxerc0V6AVbRtPuHGn+ictFl6q3
	JZgbAF1DfsxzmZOHFdO5AzeVJ2fW8gFucngSxOqxSPYyWuVo80P1vNQOpzNsTjKkTm57wiCwl3A
	Jr7api0bKGxb6I0WdV3HaTk4xNBS3sZfuDIvOKnrgZxN8u3g==
X-Received: by 2002:a05:6214:8008:b0:8ac:6f8c:a9b with SMTP id 6a1803df08f44-8b028059d56mr474099566d6.17.1777130032722;
        Sat, 25 Apr 2026 08:13:52 -0700 (PDT)
X-Received: by 2002:a05:6214:8008:b0:8ac:6f8c:a9b with SMTP id 6a1803df08f44-8b028059d56mr474099086d6.17.1777130032338;
        Sat, 25 Apr 2026 08:13:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7b22sm6760693e87.62.2026.04.25.08.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 08:13:51 -0700 (PDT)
Date: Sat, 25 Apr 2026 18:13:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ekansh.gupta@oss.qualcomm.com
Cc: konrad.dybcio@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: talos: Add memory-region for audio
 PD
Message-ID: <jjnciedre42mqllwoe4mkmi7a355itmbcmuhc3oyrpdjyitnkj@mntkm4zonfdq>
References: <20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDE1NiBTYWx0ZWRfXw8RH7ATpO8Ua
 Z7Dz9BRT76CUxYVYL/vxVy6UBmGdm7Gp04czzRCPiM/NkgvEQvT3X/Eb616ETvRRGoYksFAX8Po
 B0+jn7pdQ8+bz9NVlj35Oy+qOuOJ/p7SsP4glIfENF0ix9+OitybGvUSvphqXoai1vvYxVKxP8D
 32prChHoke6zOPvgHI8rK0BhTqKiXA2a+KksQwgQVe4eh03nKXd9PHKRAYAJv9uP0JrH4ABjogd
 LsPZiWMF11jexjXfq8N09hMxwW3eWB+rH+/9ZCDLQnGtDUN5vzjGI968IdPQEaRoyQc+mEsdkHP
 XeY0eLfFVVsHfySB4b8sc8MdHt5qepfCMlf9Q0EtGc6Kkx5VMX/nJR1hH3MPqF6rDRVv0uNhu3J
 EJlImZnboN8fxujeJYqwk13MXbpWVBPtMr5JWZMrg+s3a699lyigywefPefnEmhQVuFeY8rtwYj
 K34cMVvfWYAk2sUk7ZA==
X-Proofpoint-ORIG-GUID: nzpLBN8wx6y3UH4125uSaTWLlSncb0gR
X-Proofpoint-GUID: nzpLBN8wx6y3UH4125uSaTWLlSncb0gR
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69ecda31 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=a1fqm2Evnh9_vTGrcMEA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250156
X-Rspamd-Queue-Id: 04E3A466AE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104523-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Fri, Apr 24, 2026 at 03:40:22PM +0530, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.

And what happens if there is no such region allocated / assigned?

Also, can we please get the remote heap set up for all the platforms
where it makes sense? I see that it is only currently set for a very few
devices (hamoa, kodiak, lemans, monaco and SM8750). Checking the
downstream sources, I see the remoteheap being set starting from the
era of MSM8996 / SDM660.

> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

-- 
With best wishes
Dmitry

