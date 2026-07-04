Return-Path: <linux-arm-msm+bounces-116438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kBsDECpQSGp4owAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:13:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4A9706385
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:13:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HVTNoKVl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PtTURVng;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116438-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116438-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D65B3032F5A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 00:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BB6126C17;
	Sat,  4 Jul 2026 00:13:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A23414883F
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 00:13:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783123986; cv=none; b=cv5aG4+1NJatqe1VO8Mq0msVKN0UQXE5SYiuGkrYGpssYyjH8zhV14FE2lPTnG2pPYX06iOasynxfTwOUnt3JB1wYsPUbhge06Lv7gk07gBazAQDBSW3C1hRFHhBAaPpybKAOuzyZApkoX9yJfYOTVjRO1UBnUoLunzxKsawg7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783123986; c=relaxed/simple;
	bh=hruM/PHaLAkCf7zVpK5xJEGVufHn72WbxcVPSze9Lqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDmJOhyJBhkTyL6swiSeDOfu7uT5DAydSsh535LMCN14k0JGvnDe3KdKl3nPxVzpY3AUZrYzJYqgtMjzBzt8RRRltQw0X/Sv5Jei2aGqkoWjkT5ebZ2t8/nWtd5g8y14gA7Cyvswf2ASkJblyNSpAQybGCp+oBbexEgypRWsQhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVTNoKVl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PtTURVng; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPSgr1005411
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 00:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YtnHongBjsDZcPjVpSHCdUSm
	qjDL/oyRnfo9B+6G6+U=; b=HVTNoKVlj3+uziHECV96on/XvgNtzFa+AKqfIWq/
	nManMxj/WiV/09hkgU2KDVXzm6tBnSU6NHVOnqaRxp8JFigNZntLUWtcAskWcWm0
	Gvo1FdN/WIQBeVpfHlWu5DRFoYvuvbE2P0ICoGQpymXMJTtvRmFB3mM4naGLeG5V
	0LYr7d+3+dyFxvz9SkZSTh+kvKtvuX+HCCOBe1pQO+PLU2pXMziTVuJXGcRIVDI2
	Qk5Dduz2ww+SzPpdgWAeLx3Sl3eUl8oCzjn2wU4QpXgwFggew4xXQPxW330C1ag/
	MwvObTRpjSeDaXBrVvTVoKCcz4qi0/2tIIOk69FZoOW5nw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eyd22x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 00:13:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e820609d9so71275685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 17:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783123981; x=1783728781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YtnHongBjsDZcPjVpSHCdUSmqjDL/oyRnfo9B+6G6+U=;
        b=PtTURVngrYqUQYlBqMXQE731PZow29SwRJJVkikuIBHWJFc9kAiWKaPRi4g5NZHrIY
         f24G803q/Vy4Dg//yGg5wV8tEVO1jnYGgeRCUX7dONJhjbcS3/JJUiA9iHjsmY9LZ/Sz
         cgppdztm/YdQWrXNyDddk1lflGmy4H1ACubSa62CKEaeovLUHmc2RwXT7K3qCA3qz6/S
         lBLrAo3KM1rzsTmXuTab1ghlKRKvnDRbOBYGVsBgyC5X7AUdMO6Reet4qWsBmRD16+q9
         mdve0Barbrt0fqR7MTD8SSZ8Oa4Waurg1RrBN2ipu/bOT5r9N+KkIpd88lG1LSx/FWLo
         rJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783123981; x=1783728781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtnHongBjsDZcPjVpSHCdUSmqjDL/oyRnfo9B+6G6+U=;
        b=SO2MZYyIDK7fGtPRFyQC+UcAvg9ku5i2wNEUR5v1MNasHdYZYwtE3oPtY6KsJxZ8Nv
         41UIDz4cvzM9eddyOS8mjHNbSViecWwtqnANiD/ulkpzALENAqu4jq46WpbUqHXiSGm9
         6Uo/RbJa/9lOntERVJZh4e6WnPzeIQCKX5zQFQeHZJ2ty3jcvLrkWVByOk+3Iiu/KUNJ
         e96uaDRiDFRXBwCtGliiqYwZi78RpabW3pqCBh9N56/mnhU1zY8m0BZFbf/tCYlbUjgJ
         E77Hs5wHp/1msSccjRe7zvWqFkabhw8llvWZd/pvUYBQ6tUw6Yyk4SjPHy/Ylm8TZHmJ
         FF7A==
X-Forwarded-Encrypted: i=1; AFNElJ/3daNFH+JVew79WEkwf/CMBpI+kiHCbwoL52apSHIbxdg+WjWDAD7/eGj20NDojP7IJ+UYx6h7bQbBu3YN@vger.kernel.org
X-Gm-Message-State: AOJu0YwrnH+nze0MvcJiA/LzvJWvEOzz3HzKMcgaQq0IOKeA20OCnin9
	qK7QJs2xhdB6twR2FP9ptWK96qbOjpBndTiqnv8jz5pL/d6X65zYj+4ZU5yGtvLvuI9aTbHbWgb
	GLtIeX0dCh3tnbtvJziekbmnyyYBgYN91h8SWTonwRsWDrYdgfsWkJAOTI1TACIfB0aKZ
X-Gm-Gg: AfdE7cnTRfCIOgTQ8Vp6IMNQqPX8OnKtFbnK25SPMSo0zzM424cVTjXdJC/9VYWI5uL
	u1cwMfp60BToKAij0CgfoaCqg1ihn6V+La7XZpyMhRpU0TUzgfUeO5UhZRFrmM2G4xvpix+CJWX
	WFhawNyTqrhsKFC91Y/5KLoah/xxxAkVeEuKLb4j7h2kIETv65K1QpCNfSME5IfWPZ6laBCGpGf
	hxXC07mX2aoN/ZAvxxDewHulylzwOLyR4I/QOpfiD9xa4IQmzYOTUehu9WBDi83GvAoyAo86AdY
	FOoaQrF6ky26J4Xww3TkbWNPdHqUco2UtWplFMwY4TPWhJbPF4eWWsmafvdiItjCDPIGfirKMWB
	luJlOe2rn2z2YAJqkXtw+606uYUxTjDzZkjfWzysdjwcCU9lLDM1Ah4hhrjXBctjC/YGieew35Q
	8hHenJANto69aqH0nh/H9QZ4Nq
X-Received: by 2002:a05:620a:17a9:b0:92e:4927:2002 with SMTP id af79cd13be357-92e9a4a5359mr223197785a.39.1783123981543;
        Fri, 03 Jul 2026 17:13:01 -0700 (PDT)
X-Received: by 2002:a05:620a:17a9:b0:92e:4927:2002 with SMTP id af79cd13be357-92e9a4a5359mr223192685a.39.1783123981070;
        Fri, 03 Jul 2026 17:13:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed137705dsm867257e87.32.2026.07.03.17.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:12:59 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:12:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/19] clk: qcom: gcc-qcm2290: Keep the critical
 clocks always-on from probe
Message-ID: <2yegefce6tymennwlrarvkdirqsutsvhz5k5sbfeon3kyzvkll@vj2xqbiasuci>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-1-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-1-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0NCBTYWx0ZWRfX411xUo9cuEZO
 AkCJ1VEaVweVDXMRLLSQL21/q/TSLZKw0eqWBM4JbL4wSwmA5heAa79ULo1a3s7MZEh5GMI6CH/
 Xk6B18vcARF3CmUHJJGH+Rx9xG5elucQ56NB8PCEJzlaq/muGnU6WFHj3uI3jeaRKq65D+Zy5HR
 xzOEHql+2U7yX4zRgrrGlg/CBrms8ccw8BHCj1Gt+azQLyBPOMyFLTKaud+a5PMn6qwo93rF0qT
 MKkyCCh7AQCVXHgP1euJAB3p7yfJsM1OHMrLujSC5D3d+OxzqNPs4o6CEq99JOAVFpIHtlHKJmq
 97StA3kVnpg3vxhF1+yYDwFS0oQYuL3a+xK4GGVpFmaBaQyL+5pXbI4amfjjWvN5oTOe1XnL5QJ
 h23NClc3lQLEBxC46bVrnlfkkLsvAV45DQSVlnK4h2I6cfNfkjeC0gleKaatyts1eXWxbDfIMmy
 ltVCr5unoE/+1ZoWz8w==
X-Proofpoint-GUID: HTP7HjiWjRvxiNDs5a_-5I1WdZBgYBL_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0NCBTYWx0ZWRfX+DP4WKAmMYRs
 OFlfcr9LizIYYRUHTpA7hC+lnQJz/UHQNBER+jRNuIuufpQQifYi8NZ0GS9NKwIueOZc/jrAUc/
 yVew6nF23M4DdD2ECZQ4zR45plzNFDg=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a48500e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=P3Ave3MFjIR_A1ojsb8A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: HTP7HjiWjRvxiNDs5a_-5I1WdZBgYBL_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030244
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116438-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D4A9706385

On Fri, Jul 03, 2026 at 12:01:23AM +0530, Imran Shaik wrote:
> Some GCC branch clocks are required to be kept always-on due to the
> hardware requirements. Drop the modelling of those always-on QCM2290 GCC
> clocks and use the latest .clk_cbcr convention to keep them enabled from
> probe.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-qcm2290.c | 113 ++++++-----------------------------------
>  1 file changed, 15 insertions(+), 98 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

