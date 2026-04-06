Return-Path: <linux-arm-msm+bounces-101908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEMkEJEF02kYdQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 03:00:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 905383A0F15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 03:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FE4230057BA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 00:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F13A1FC7FB;
	Mon,  6 Apr 2026 00:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpZ/RM01";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eBCDEx4a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C021E0DD8
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 00:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775437198; cv=none; b=OkpLAMMFXQ1+oStAKe9A4VBrfi9Zh9CTcWwOfZv6Ub0mVYLicYkKZBx3X9O02pOMIcWAABBCKrGWUY3XWoE/QK5cYwM/iUY2zbht6/FDGY0uPNNHMXjFzH1/eVfA8MeYYM8SQ32lPUwOYgXyqC5CHiJQ5qHdgyxdzY4A2YeMEJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775437198; c=relaxed/simple;
	bh=QOXmw0yAcw6uv8eeBeVzE+uDcdLFxQ9fp1u21sG4oOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVcQeROIZYAiKgx2aGRrusTnj4tZ1Dz9gOzYdB+ZhlAdN3HzPKDQIg5WH+ldMYer0FBxZngcVXc8IEmRNj+xLJFFTZSRA1buBtG83PfAOv+7frdBT7JVlERNhQNFwOFTBK6It+/XRZU0hncQwkABh+qq1ZxpQjHKyCYfghhjjQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpZ/RM01; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eBCDEx4a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635AoIod2150124
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 00:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jJ0vIYrlGNsQyBLBU+pIF1wA
	qhZv+f4tNLozhqTFUjs=; b=OpZ/RM01nVPcVKb6Q/b8G2bHN7kKUFZty5svTxeL
	UbU0QEGi5ry3/UEB2l/bkmpSQNiTLy62aawr5VmVtOeXAxfMPe6pu83cuouCzcRz
	iM/9fBCi8D7A2ihXDBfCiMMxSyAPGaWOPAoFUVDBUJeH6cwHugmOyGwnQBB/xkPP
	J/4kl8g/PGhHS8CGLJES7ccBcUKO1FeawHdjE/7O7+7z3ATNGLnzuMbbNXMGybPb
	qAR2M7T+kvRIo4MKu+W9f7WzX0GZLZRDsv1k/kXYs/OgaApZ6CMmSX/p1mYdKkWh
	K+N9Bv4MdHQ2hmwP6rWu4f18u+7x2QeVjWYpjqsYEAvD1A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrkkas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 00:59:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d826ed6f9so25143481cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 17:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775437195; x=1776041995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jJ0vIYrlGNsQyBLBU+pIF1wAqhZv+f4tNLozhqTFUjs=;
        b=eBCDEx4a3PLXgVV336MQg8lMe1gHF6zQTjFCJ/f+HOrCxc10XfiuCIrLGUHp1K35nY
         /rOx/9JUURg/pBFDJrqfpoUeLO6altqY26m+NRxHNGSjBQa+RPoRuGERh5kMv8dqb6Mo
         /dKLD31ruYEWs/ZnjchlWXjgGSI60MlK68VXU0lhkx9WFh+Or1+tV4M6QzlgFmF8VB/c
         L5DDg8bxCsaaj9q3JZ5Tv1Lg1uTpxhqTYJ099uM1noHK/nZ9lhkF6aT0Obr3aUr9pJQF
         4Fc/X+VM6A6gXRf566oXse7H5+HCANv3/rxitYy2ljSsC/8NnQsxDqeFgcXIIn9kwKf7
         thAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775437195; x=1776041995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJ0vIYrlGNsQyBLBU+pIF1wAqhZv+f4tNLozhqTFUjs=;
        b=D/CeI5100z6VFuuoULkvhvv123cSqY1BD3WOM9IhTwGnX7oKfP/UcMRxIePygD1Xo7
         eef0tlHRO471+ZC1dMJKn9ZcrXu4lwXiw59IC0trx2dl07yyC4mMFXTzAHIITTkxSWIi
         UsFQpw8R3QnCBKT5RbwuVRE/995oxS9srxuAtraanZ69ilzDGrMgys//4gILx5Peiw+9
         SBDHiAlhRBO7TmyJUg9ktCULQKkiuDzve7NF0zlUeV/CS/lz+Ts+stCHIejbY0MkgIeH
         4R8AdGD30fHqFAg+1Okl886aZBOnfN8QXdtBWK/CERKvGsamzPc32s3ryHtC6NOD60yk
         cJKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBJaELta5SbwZqS1xk1iqXpFZxG3sn+TJoMYQk/JJf53thlaL7XVAkZUe1+oeqDUpQ+cLuRU0OBO9kOanE@vger.kernel.org
X-Gm-Message-State: AOJu0YxsAda7QFP0cBVb38uDOqW9YbKeVwOdfmEzYo1+h4EOzbrE4k+R
	AgwurlrY24WSLEF14whZNYI91PSDFzGRKOLr5mxuo7vSp2biBUdrAP07jYFnzrvVI+P6/SqJOVF
	EqW4gXnfvKTkXZmAE+XZRBsv2chbKnS6bMjk4mXUHdqcrAGW42ySln/1+szpDyu9ylhHC
X-Gm-Gg: AeBDiet5h0ub3+f9zBK64tOhcDNqkJjaOdes2MJUWriqVCQFv952iC2mMmEqcW6EVj/
	NL608TtSVwCqzNWiAAmuQsu42A3pNiuTh50VKeDnOLVVp61OZ2SqZ8BuiX4CrQe32uSRJB5N8Ns
	E8uWLXBgOC9+rbbJoa/d8V7BMc0GddeCmwihHxQfDegcn7hK4NpBTkug6j/CKV4kAzIg7gzl2A1
	c3IZxktRsy5eoEQXwGBJWxyX1524E7V0vFNOOyeYSioIz8WjVXTn7aXXT7uz4mlNMHNtbNR8YnS
	hgiGTutlPvg3HA68Y1XNyPCia8aq77HL6WZyb8uUt7sVGgbzechfhLAqQ4B10UqwvxnhQxK8cM1
	hxQMfQur+TtARl+L6GvBbFlaTsMZXvufs125HFgB25IFYCAFxa+R1OkWSc0Oy1OCkJDRtGvJXs+
	FgOMNUwGmB4VGMz8vpyJKgcJcfLyG3xsbiNbI=
X-Received: by 2002:a05:622a:999:b0:509:4410:4487 with SMTP id d75a77b69052e-50d632a0bd5mr144642451cf.24.1775437195272;
        Sun, 05 Apr 2026 17:59:55 -0700 (PDT)
X-Received: by 2002:a05:622a:999:b0:509:4410:4487 with SMTP id d75a77b69052e-50d632a0bd5mr144642071cf.24.1775437194806;
        Sun, 05 Apr 2026 17:59:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd3509sm3058813e87.75.2026.04.05.17.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 17:59:52 -0700 (PDT)
Date: Mon, 6 Apr 2026 03:59:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 5/8] dt-bindings: display/msm: qcom,eliza-mdss:
 Correct DPU and DP ranges in example
Message-ID: <z4chv32egqvi5nf3kemron6qlibgjl726c2joauld5nt7smfo4@eqbpdl5glffc>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
 <20260405-dts-qcom-display-regs-v2-5-34f4024c65dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-dts-qcom-display-regs-v2-5-34f4024c65dc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d3058c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=bHnmLuETDjlIWUPFTNkA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 20F-OdjNeokBv1roPAujFL-UCjt_5sja
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDAwNyBTYWx0ZWRfX8Ke41+n24rhv
 IG9dUALjtiycJueJ1z6dxXz2AlMCbvjq2PzAwu29IDU4KwA5zyjJmwMK6h62GWB8x1Gan1cS6qk
 gJncbuT+kYhcRgXv6DrTJPuxOv9Mfs6whAVEu8EpNBEk0Ih5E7hQ6IcAeRqfqs6PQH1lYdPIaab
 7SygjdNqWQO6Jb368vEp6h0okjBCQK27suAHgcRg4ddDGOci1aniFsO99ogpMGQjE89W46ReMa1
 yBBzcF3R33n3kRLdxd51mM6sHHb0BFnW3jBHiX6LxmH6mJHphJYsYXgwOjpP2QvRz+JOQKPcFjG
 YrhyIpITDVNYRFpSvCXniQNNxIIEbrIOnz4XtznEFx4AQ/nUiYNHZDhYlkfANmOcvxVD1kifZo1
 oUmeSNrXvZId7+LwXlnUdomSyu+7PkxD1ZvIwTQgaLwK6uUrakA3KGWJILpLQxYuYwkawdkQdga
 DAe6rldIYikfBoewqFA==
X-Proofpoint-GUID: 20F-OdjNeokBv1roPAujFL-UCjt_5sja
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_08,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060007
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
	TAGGED_FROM(0.00)[bounces-101908-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 905383A0F15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 04:34:01PM +0200, Krzysztof Kozlowski wrote:
> VBIF register range is 0x3000 long.  DisplayPort block has few too short
> ranges and misses four more address spaces.  Similarly first part of DSI
> space should be 0x300 long.
> 
> No practical impact, except when existing code is being re-used in new
> contributions.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,eliza-mdss.yaml        | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

