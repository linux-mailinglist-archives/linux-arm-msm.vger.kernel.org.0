Return-Path: <linux-arm-msm+bounces-91360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL3cI+a+fWkATgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 09:35:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3FCC146A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 09:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97934300B13E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 08:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BA428934F;
	Sat, 31 Jan 2026 08:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2XD7KNJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U+xjTBgR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE60C2AF1B
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 08:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769848548; cv=none; b=g+yXk9ilWQW0MCSlFeCx9vgnE2s3iZS2QzSS9QOp7EXPh3/XqK3HwOgPQOatGjt/7lD8dLfs/PQTinGSs4CMaltO8SEse1Pwn5oKbHIPFIhw4tUCS5XSabrOq9f4xfEsgtK5m1ICuas2H/8VP4gryp0VGyJq5H9/N+oWjpTV7Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769848548; c=relaxed/simple;
	bh=HAVV1ToO3M421MkmQxNF5lfdtFGGgQpm5uqJAiSZ8Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W38m9m23RzFP3SIKMjHRu1lNfW04yM2SNdMwCSrAVVlTbPrk1pYczPIC1Bg7WKqge2T5OZJ2DYY8SMpr6NIFjIoCFAWwufe1pwlGCSP3krIA1xe8BsqrmTNmqbx20cw8k2yvWch24ZIRTcyvQdcEb0jLzPOzKEpbSqi7h09VVbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2XD7KNJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+xjTBgR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4YrJZ658527
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 08:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6eJxbiPUj6Knf2StWTbwFKXXut5gCRCDRVyWEY4hCKw=; b=a2XD7KNJRZri/ia7
	8i/6ghrKYjRx6nu9pj2VpxYS2jbvKjH3LcUfsLOuiAAMskoB1dKpZa+U9wqIMrja
	kFy2SxZeCrTPsDZX4+LGQDF+UHRjNWp5S0P3sHNwOnZMzQ7IK6qRb/QsexZbwfzJ
	V7/rQusopK7t9nKPwIih6P1HCnLXot9BMua6oVl+0tQQWL3/AfpQpZYtQ+vOIgLr
	/cRYBxuKgvCduAmD7ZBv9scPISSOhhbJvreileR5mwhsJwp/wGgXIUX+3P3b1/6W
	o+MNnM8skoFIOjomfT69c2X9oR1td5heSqto9G9vuJax+dEdY5T31/pVSSRIVeNs
	NdlBCw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1au2gf49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 08:35:46 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56346eb4afeso2625099e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 00:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769848545; x=1770453345; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6eJxbiPUj6Knf2StWTbwFKXXut5gCRCDRVyWEY4hCKw=;
        b=U+xjTBgR9J8Ra+1Z/hB3Vz15gM780QyUTNZZniO6kCB/h+ihBV3Wp65HM1KfV0ljdk
         1OCA4i4BYSATJrhYwxSWcUUBSgUnK758lKc6Gf57TDgtbT0Fzfsb0/X8gRWB273tfma+
         xjvfD/gqfdrVAUWIkXsiIOwKg01hO+PUsdW8krv8wPncY8NK9pSQoVn6i1IW4emHYf3m
         8KnFFGYetGUyiyX6pTjXJWM6kyauTT53SpOBCzXJZFAhCUbOAWOIepsv3dV/n0x8tgRS
         d43AbkbLoNEWEAFwqTkjsPVac1Upr46RL+0n8cXARYRdXuzxPnsjEmEdagUJJiKexGob
         t0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769848545; x=1770453345;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6eJxbiPUj6Knf2StWTbwFKXXut5gCRCDRVyWEY4hCKw=;
        b=jdR3TttXn+mThhoDMITbzn44almjkwEctM6Uc6qfysXKwREbAMVZPX7G28xQ4wK4I9
         9Grq6OXOExE23tka14+RnkvyaFmV2bzbgyB65t2Wbp6gv0gL9j0OnQamYmUx1EsLbq33
         k8SutSj1KyVhFGX8D8viLmjWBh4L6q2oQN6TbmC/TbfRGbCHBAo6xHkZbcP8BpriBtE4
         FPDp9gsIT9vE+j1pvbBW3shpgy3nz38r4k2AivYaJ9TYrTL8wOoCdNUp7WZBoIo22Y9a
         GR7jzF34dOsb/snOPJueXwd6S2Lpgg+725P7wXdndzfv7Ad4Cef9+1lzXB9EZgjZJ1lm
         bJzg==
X-Forwarded-Encrypted: i=1; AJvYcCXrgRS0zk6h9vV+wIb22W4lAA1zkW0dx9y3GMAlpKMvUzcDlsMOvUevkG7Bz0G1EPPGNWr783V1XBT9UmIv@vger.kernel.org
X-Gm-Message-State: AOJu0YyPSEa2FwhKI3NIc6Y1zEV0TR4i5GJsOcJIHGy73PALfAPESWs4
	Y6hEx/Dss/7nF5suRO5NK+gdbIeT7y4+EuTKvRYzbHNea3zDxdRw6FxlgQ95NdH0j60G/FJNrdY
	d1ZS2ISDgls1MoAPU76910gBsQw+HYIxI1kgC8jGurU0ASZHEDSmIYvtkPWPlhDo+Fe5d
X-Gm-Gg: AZuq6aK5HM2tSrHtYkyjFOYQV1R6vfp4sFwDWSKOefb8nQ62La4ParcQuuPfBhSf3Gl
	f5UC6dWKb2ocaOwJnAL19nwdNk2aJ+yP7d6UpBSJFvhokPqx/d3H/uWXJWIlCeLWIVXH0YWHU1a
	F3MZ+YUiQIppFW0ZnA/+C9K3uFJ4h4gb2+sboHdFIVAvAdfmgm7FfYg4M1nkP6ducs1sDgJ9Tbw
	IM+K9Q4hMwCyMH8NdsXywEVW/y5rXBDqmyLe/cQT2BI7RWBA4nsXS7XNjH7FoQcwC1zhjbk98Nz
	3R/jK4jC3AgAXq/5ehkMFk3guvCzkCUXmuxZIS7KcJQr2784KN6UUUt3MrokNAP67QqJx4+RfyD
	lFc+RQ8fcYf+EeRpt1kHI6D97HeeupmwxgwcjB5/TuYF7byn6BQb+mNT2/U+LUP3WY+mU4BhzXt
	0R7L4b9xhoMXIRPxL2N3fGtO4=
X-Received: by 2002:a05:6102:370b:b0:5ee:9f76:1ab with SMTP id ada2fe7eead31-5f8e245d7famr1712642137.5.1769848545202;
        Sat, 31 Jan 2026 00:35:45 -0800 (PST)
X-Received: by 2002:a05:6102:370b:b0:5ee:9f76:1ab with SMTP id ada2fe7eead31-5f8e245d7famr1712634137.5.1769848544746;
        Sat, 31 Jan 2026 00:35:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07488749sm2183359e87.23.2026.01.31.00.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:35:44 -0800 (PST)
Date: Sat, 31 Jan 2026 10:35:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Le Qi <le.qi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: qcom: pd-mapper: Add QCS615 power domain
 mappings
Message-ID: <2qeqokaiyqdqxchfkblo4mx535lg7heh5oap2755zkmibyyvsl@spljufzt6kts>
References: <20260130061231.310113-1-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260130061231.310113-1-le.qi@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: OUx0XGr3y1FBBw18LvUq2eTt15E4U7of
X-Authority-Analysis: v=2.4 cv=TtfrRTXh c=1 sm=1 tr=0 ts=697dbee2 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-SMHJ_KENaIWFniUrY4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: OUx0XGr3y1FBBw18LvUq2eTt15E4U7of
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA3MCBTYWx0ZWRfXy73WzWdpfdvV
 PvCTeMkoMOos6NPGvPD2LgCZEg1EKaOAYk4f8PMMSgDk/My/Ilv31wrTbCTGoOwsTIf38vEno6d
 eYx64ZsdqcN+7wVoSweDaQKphcv07N0TTPb/MyYXxQB6OpvJnWhz4qzINceyoXRWlCDpECgvC7h
 jZPbvG6uigM/4ukYk2x4YbFMrF1VT4NsWNo7wM83p8s/kFDTJlHKqFFKkMykqbb4XnhYeANQywO
 sfC2UMOCktmJF6DYMGO0B92kE0I72IlupyYogrRZ6xuJocBvZkfaZDPkDqTm0INg3ga3AcA+0/D
 DrPlMarmGULTep6boJ1zbV98wooh9GuU1Up4E/n8cPOUdZO7GX1tdPEvDr3AAUW2miv+X/DuSik
 ECpWAGX2kxbY5qQvWGKO68cZstVHYYwbXWSbNPzqEDIuQA0MzDdFYN2Q/puLjNS3lRKYQejGMgp
 D+W10VfrVQPj7czVSnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91360-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF3FCC146A
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 02:12:31PM +0800, Le Qi wrote:
> Add the QCS615 domain table to the in-kernel pd-mapper so that audio
> subsystems no longer rely on the userspace pd-mapper daemon.
> This enables proper initialization of ADSP and CDSP domains directly
> from the kernel.
> 
> ---
> Changelog:
> 
> v2:
>   - Added mpss_root_pd and mpss_wlan_pd for Talos/SM6150 variants, as Wi‑Fi
>     firmware is loaded via MPSS (icnss). Confirmed by modemr.jsn/root_pd and
>     modemuw.jsn/wlan_pd from Redmi Note 7 Pro firmware
>   - v1-link: https://lore.kernel.org/all/20260122111318.500262-1-le.qi@oss.qualcomm.com/
> 
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

