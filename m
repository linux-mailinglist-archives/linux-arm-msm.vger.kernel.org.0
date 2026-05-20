Return-Path: <linux-arm-msm+bounces-108746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG+MLOStDWq51QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:49:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 292D258E324
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACFA030C88BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656853E00A9;
	Wed, 20 May 2026 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbtzF/Bi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YoGy0lNQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC61D3DA5B5
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280889; cv=none; b=fIjWkIHogjdeYNyZcKQBCFPS0Lrl3/TYgjZZ7hlCaVlA+V7oWsKxx6UmRNZY5xpILvtYjCVhQM23FKMd1PqaYfViaOw1jilejppVAaeYCBLrmO5FVFHtjQz6eNojXhDpximx1esXXkIC3K73ZdcNi/gxQXd1g773G9g/RYXhmqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280889; c=relaxed/simple;
	bh=zCCict06pIOXxb1IpBlXdDfgZuXsApbE11u2/vLcW+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6neJvu8gQeJU+2QL0QlaazyH/fHtQm/Sim95upa6wmo7uj6blvm4bKyTU/OyKGstcBz/N236I5GnvUXS/YXY06pRRiVLJ+vA+Wv+ftyIDCsdCNTkqaC3UWalEkgNdUMFlelpPE0t5Ls/9qqKsMhO3ljTb91T8z3fM/FtU2yR+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbtzF/Bi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YoGy0lNQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7AKwp1954028
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zdpYM21M8Q0ktREpxiFdF0gP
	EhGDLYOGCqnBfOEn0DA=; b=SbtzF/BiR32o/geG0QtteC1Uzq1i6C4LZ/51oSut
	bHXz7+2Egv/9Pu81p1GHLwbUU6v6Iu2wkwkbrjlUntnzg+ifidGgt9VM9epsvb02
	QJyuQAO2GH9W5QLXYdDsdDj8i5rCGkLaknLoWC2t5++LNKC/aHKdYOEADVxIckmc
	f5GcHBZj4JhyR/wx1UFYQYewID+vCYTW6SgXAFjxHCuxyIIRDoo1vaOVzd46N/c9
	oANqQ91DOpmmtiWl1mA9rF5SY1bbVf3H9Gnu+DzHQOlUOByBkULTYojDOK+1WXZO
	Ew9E4FgIEl9tzdx/xPQevSKR3wevc2ve6dKWrZQnqaI8mQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3xvrqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:41:26 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95fc8572552so7985999241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 05:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779280886; x=1779885686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zdpYM21M8Q0ktREpxiFdF0gPEhGDLYOGCqnBfOEn0DA=;
        b=YoGy0lNQYTvBpiYWw0CEo4XfRrUgO2CkZI3LF+l3QW5AecRG/T9SEmYJi/HsKNqqoQ
         sceOaG37Q6vJKWZ8nU4TcpbF/wQ5RhYspCZ2WIXLX5FWyach8BRxRk07b2D7wLBkL8ca
         rUcFiLEDgOQArkCE6TJhvkUJZWxYKwI1nDg2wN6E0+PoVnPcVls8Xho4g2YN70ryyiJr
         juMNJBM2Icp6pVZnXWOW8KdC8lL5VHhVU4VxfTihq0eGzarCXPUoEWnRgSulf7rvcHQ1
         HaUmbhAOCAofVIFd4tqFqIDUsrpIVrUWyca0dfSmky84yYnGN2E0+Q4zwlHi7oD8esH+
         MDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280886; x=1779885686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdpYM21M8Q0ktREpxiFdF0gPEhGDLYOGCqnBfOEn0DA=;
        b=c5tunLvhmO7qJsAWJx/iZHek/czqkESTqpVWs6cz4kPkiGBiPPByv1Hg2nUlFa739L
         sWE6cH9Q6+9GXydYpkO4JDGdkcAWp/XRoglDOzFKhZ6FZ/5ax+eIL5/8vM5cXRjy1Vlp
         uJKX+GScyom4SwP8UMB8eyjsUqEjLhYEirc1yv5qQoiOk47wm1D4irVN4h6zbIpUQKOG
         mNeAIoC0mbfxVYFHhSJlAgcIeBetEHo4IC1FcxAH+ZYOT/mGeFX8B2XWRlVdDqIQYrZi
         Nhm4M8hTkIXrqQCFT4ZGUTRph5J6KC1IOqH7VxZmpPmsbD7eI00oSEB7bCaKEw228vGu
         asxA==
X-Forwarded-Encrypted: i=1; AFNElJ8WwDm030YPXaT7RHi1KRxYn68BwHiwE8XmDmvshMhKPKK74T8h9FpIuLWrPDkC+98BkA1oJMaOD0et7Acf@vger.kernel.org
X-Gm-Message-State: AOJu0YxsdAk3g/DHTBKycv+uDjhRd8hSk6J6/scrxbAmJ5igR1wqpqMX
	G/moojvbiMgTrSzPoxbeid2hbARhU0BJTadb8KgwzdicnNhCV9QwaGNuKKnEJjotI2/vjDJP8q8
	c59qWJX3O6+9iVa1G7A7eGEx78YlQ/XlnVZytGsPl4TP7FT8SQrWiRr1aAbV9Y+rSvptw
X-Gm-Gg: Acq92OEki+E9ndEAArk2leeHy35S889QR67ElUXFVo7b0sVLqRwRWt8GXE5EhEo3saM
	hrCpWUQ5HGpsu7GAP09sDvuUV4+GHJILzJ2nyoH3M0XVy6g5ufkHwmrcgx0j96WTe74sTPfbiGB
	XShwIeyGFWTI4O0ZUfCRU/t50sXraup+CTKGwHGZOwaqICMUY0gXntMygyb8Msj4dMv0ZNf9cUn
	RNw6ldUe0Mib2mGnkdGKd1eZs06Gp+aITkJZJjY67ChCYx1LcZzNp6Qh/fq8ydh9Jv4x5kGB6CR
	7fW43OWD40cyNT6YfOYQR368K6ZkkWzoXlUpTPexIMyUyWQncXjw9xU+Qoev/1o3JzgYL1ZdSSF
	multM/PuhzDojiIMhc+YVEN56vORXyMc75NGTgylpCk8spbarv6urAS4PGzkEViuXYs9qQtDU0T
	NUdLC1A09tEoVSXlU+jDb13bRdPD507GGW5bc=
X-Received: by 2002:a05:6102:304d:b0:5ff:e39d:9f93 with SMTP id ada2fe7eead31-63a3d42ebbamr13508332137.11.1779280885924;
        Wed, 20 May 2026 05:41:25 -0700 (PDT)
X-Received: by 2002:a05:6102:304d:b0:5ff:e39d:9f93 with SMTP id ada2fe7eead31-63a3d42ebbamr13508310137.11.1779280885368;
        Wed, 20 May 2026 05:41:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11e828sm4975736e87.35.2026.05.20.05.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:41:24 -0700 (PDT)
Date: Wed, 20 May 2026 15:41:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] cpufreq: qcom: Add cpufreq scaling support for
 Qualcomm Shikra SoC
Message-ID: <fmqsbwm6is5qzflvyt53ax3ls5vnxabb2fbl4bttbcxjnhnwwu@x2jso7rr743y>
References: <20260519-shikra-cpufreq-scaling-v2-0-2b09f0e1c9d8@oss.qualcomm.com>
 <20260519-shikra-cpufreq-scaling-v2-2-2b09f0e1c9d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-shikra-cpufreq-scaling-v2-2-2b09f0e1c9d8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WaY8rUhX c=1 sm=1 tr=0 ts=6a0dabf7 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=4ielwApaMtWjWprE9YYA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: iEWNGwRvKb7o7ZIl4sIGqN_oSlW7FqyO
X-Proofpoint-ORIG-GUID: iEWNGwRvKb7o7ZIl4sIGqN_oSlW7FqyO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMyBTYWx0ZWRfX6mDnJwfovvfI
 lMZuzL9a4KbBX0Cvc+oc956I+3fggC20NxYNhvJvHzXbTgUozBACg5op7yK2LqlOk7j2Z+pDkBY
 /DsuGlncRouI34wiBItANsl9briruzgcbLLj/EDk4C9Eh6bLAH1dAqPeHB/YuNJsti3yhfpGGYN
 ajp82bFPKWBM42NETrr62UoFRRVBpowl/DOBlMZRAG8WiyNnxPFE7aK6xejYodbRSAWkxzT7f+h
 lofjqjg5HhZDdx5nIn+21/n1+twgoYGhj4kgCYOzZtZd7z+YfBwpl4S0EAdTy1oKA/XfjjWk5Bz
 dT9K36Bxe87lgOrmDypMe2xdWS0OU5q1K4O6UJkjqAe5NCRiMFXCVZFmSXGICGngqbbPqI4yto0
 TiUf4nBLwcruhaM9+GDG9ISep9g3Dd/5gZkFcZFF4SUSa6Uj47WIjEMX7hfmwulAPUAK/pCxmUP
 03nMbws86WCDbvfdm5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200123
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108746-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 292D258E324
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 10:58:04PM +0530, Imran Shaik wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
> but supports only up to 12 frequency lookup table (LUT) entries. Hence,
> add shikra_epss_soc_data that reuses EPSS configuration with appropriate
> LUT entries limit.

What is the drawback of not using the exact limit for the LUT table?

> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)

-- 
With best wishes
Dmitry

