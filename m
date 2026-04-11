Return-Path: <linux-arm-msm+bounces-102791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMSkEnZb2mnb0ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 16:32:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF303E0579
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 16:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC59430157E2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 14:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A0F26D4F9;
	Sat, 11 Apr 2026 14:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p4MYeOhl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NqjSNyJF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3F91A6824
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 14:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775917936; cv=none; b=Euy/0dmyBzRelFnxjtm24usnM+TQdQcTFnZ4FiifXqowCn2PpYRpHeHaDoXt7Z4idqjftpqKlXFOsvbgPtNAb4FCFn7ju9VWhk7c3fUSJZAV45Y6Mu7N/D0vQOpPCKS75iJtkHV2C2dKoUJUAo2hIKcHnBEu5M1OkXFKzMOKPiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775917936; c=relaxed/simple;
	bh=O6qUX52tUJ3KEapFZVbL0RG35dX6gQjsnyPhWLm+Oz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKi1e0oittvO6S+3vRVOu1XVsUuIS82IwLdkoRQD/C4S5uL01qpZtxKvUb8vdhhI13mKdX7GHomGQa+q3VxEvx3KGMqKs837JxzVpZ6u5lwDigfmZY2G29ns3rqrjOn/DEeoYJzNLFQGCOb5ShOtjuaH5e7ggwiUKuuof/fbiak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p4MYeOhl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NqjSNyJF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B46SjJ2624912
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 14:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YwToZBYkR9ugFc+4CpkXl4SR
	RQEJGXYdhdsY0zhrdgo=; b=p4MYeOhlEu094PV906M5hgHhGoJCcglfWUrYBh98
	Eaapc06kA2VjXP+E/oHAzMOvbT1RsPl/ZcD4k+6zlLOcGF5k37xDGhRmwQghd3Ak
	+PHt7SAYAC2LRv/rzhBFVC2NCccZGyO071IgNp1GWhdViU7/Uo1bzClnB9YEqyku
	3j739cQifmR2x/sALjdEjPuO1k+o29B4eFZtXq1kstGd4cVxCscOgnkwJE7cRWCi
	YVlh1wOx2GK1OUIFG5VbcplZKoDjLMTHlLDeRK6GQCfFND7KgC/WLGHe2Wl/ZDlP
	PqDNiXGgBUwCF6ZsBgGFkvP5AnqCDYsUy+W1TYTePbdG5g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfeyyrv3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 14:32:14 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56b6a0a29f0so3084527e0c.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 07:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775917933; x=1776522733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YwToZBYkR9ugFc+4CpkXl4SRRQEJGXYdhdsY0zhrdgo=;
        b=NqjSNyJFGlqxoKHScLk3gEe4O/D+13nCygdGKVEtbgbT4OfQYUxcZrIgWQpjD9aSR5
         rxYT4H0JBvQMaZ7QJpvWatPM7ED3LArG8OB178KPWYfQSbFAFhYwmpVgd3hNewQWLXbr
         GCoYvY+Xb6hmwc+tBpGUVgKdXgokUUwpGiAOZNgE5kcIbt7ok0f3s1KOImYkSXU2NTeS
         bpQyQ7DjE090sJCfZFvcqXYuNG7py8b98CIkArvc68VaPAnDt8TxiKSkqQrJs1+K/Wlb
         2akcLr9q7t/xFgR6bZCQhwqaeOzFnAfVXrlB7VYKqb6PcYO3Q6VdUgsxA0bmmOipFAsU
         2AsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775917933; x=1776522733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwToZBYkR9ugFc+4CpkXl4SRRQEJGXYdhdsY0zhrdgo=;
        b=PVHQ1tParB4csTYhi1kshdUb71O3uBNohMib2aQWeLupK+RJR0C0kbGZ7NhAFsj8/O
         d9AbIAAvXnOz7lTRAGDEoOl9N5vcBwRyqErkTHuF9L730bQ3cqFeqFV1SAeIB77DrAm1
         V5u26Y+tTDWwOgaeDqgwBrGLs+5wanrStbvJXmiyYa0l/NV5S7nOW3B9el4EGvM9at4T
         PWpsWdvtrDJrvb9hM8zxam8YaxK2IV/PjCVJfLyYdhdTvwhvBmQC7/zHyucxj8gQOdOM
         /aHVarOqnr/fbw5hU+5I0Hna3AzICaT/7tAy8VP4vCX5LBwWVNtL+qLJTDrnVJwRIEsX
         ognw==
X-Forwarded-Encrypted: i=1; AJvYcCUAgktKek3KlI1YOjIwaP3xuwIeW5KydR3luTAG9f9A6WPGWscdKwzrjEN3seEcdD3z0f9YJcHzkN0NvVAI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxqh7JplLkuq2f0vN3beB1O/9k2WxwU2741PVeR3jQj6IyaLWo
	t6LHKFSDI5uvZ/dZsu/NZxGw4T7CRlQCp+0/lu2k1WssA1lPJWrG1Rk2bV9TAY07whkjlOvWY5N
	q+GZFibMAqB2G5B0/E0HH+WUqbQW9ubHprMjTPy0ackX/jxXbNorZsZmVFLclzfHHmjTaybL6oW
	Ci
X-Gm-Gg: AeBDievzcrCZqBjgUXbp4ccXvJnDjZ8rk5Nyw5W6eyLZWr3qkILfGqCr8l2AwgoP8IC
	Va4QS+UQlrQ4tAnGWk5roZ0Cd/270Ft/F6FQaeaj9v6C2WLAT0U9q62eetpsGCmNVfMteMldR/Z
	muTgUzemTpN/ap3R7/MyiYV2ViDIsL/6ci8W3i/syJhDkvaFtn/3i73rLi3tvQCx/Tgo19vNp2V
	vjn457/omm0XNTk+vjtlBe8KQEjjIjswFdht+yZUqmU+blQp6I9NyfF9idzprAXk8fu6rr/Y+rq
	R+fEk2zAxCLcQwPaL0Pv2R1YparJIW5qy0zRkYrhWT3WD029CU6NfaX1k/9Z+wOFb/R2pyVVTwJ
	i5GP1Hd4AXFVSk0ZdLy8arraLbVdPe2aGjBJVa0CAqBEoXvYteEHz+cM5q/fAq2/8mq/LNRbHTL
	lH0hD7xsPwNZjdwnwJsZjutunReRcQmhrzd1M=
X-Received: by 2002:a05:6102:6a94:b0:5fe:f4b9:fe2a with SMTP id ada2fe7eead31-60a007339b0mr3081290137.16.1775917933595;
        Sat, 11 Apr 2026 07:32:13 -0700 (PDT)
X-Received: by 2002:a05:6102:6a94:b0:5fe:f4b9:fe2a with SMTP id ada2fe7eead31-60a007339b0mr3081222137.16.1775917933192;
        Sat, 11 Apr 2026 07:32:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef06635sm1485923e87.77.2026.04.11.07.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:32:11 -0700 (PDT)
Date: Sat, 11 Apr 2026 17:32:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/35] dt-bindings: qcom,pdc: Tighten reg to single APSS
 DRV region
Message-ID: <gd5ixcfablbyyyz2wdacrvg43jogwg425na6utsgfcterm276k@tdko64tn6gwh>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410184124.1068210-2-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: k9qrpkWnpPNX9DawFsj_oM7cKmVAYWaP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEyNCBTYWx0ZWRfXxvIixPkKC4Kg
 1ApfLSqiDcxIHdzx5kRyr7sHO8tLnImueTuQPP0pjN//uQmk5TEMR7XelFOO2AmFZlH5brg9wFQ
 RRZoSTl6rCjGhs6muM9GxH3JfZZi5gKKs/5o7lvvMmpZXIMnfKydxNYI7eeS93JfiySeWV/3RhP
 cV/NUvjNfh4v52wa9BcIGzd9LUY7BT7tcYT5bkcEDUFr3yFS/JphxDIBIfLSztmI1Wq9p+EItjl
 tR7KlBoJgkpJe+shJya1ELIIiho4N44C9AGtSe/lWfxdeZYPHWRo/+1PDSCPHRGgx2FebH+jZ5V
 B6A3QV9Af6dIDbkJ3vTTVawLxJfTzcCc781cHgtEACKe2ULA+M5ED3CU7fEx0AyaX15JQKCuWWx
 aHbnsWDR7DKh/oCdl1kT8RRwpU8yqTxqz1+p+GXQS0e+A+9XUnDcXxp42XNRUd8FqKHCRyypVXa
 bn1qdWadLbZWZYL6+QA==
X-Authority-Analysis: v=2.4 cv=FPQrAeos c=1 sm=1 tr=0 ts=69da5b6e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=TkIDJqtRBj-jA9Rtr9wA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: k9qrpkWnpPNX9DawFsj_oM7cKmVAYWaP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110124
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102791-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,b220000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9FF303E0579
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 12:10:38AM +0530, Mukesh Ojha wrote:
> The PDC has multiple DRV regions, each sized 0x10000, where each region
> serves a specific client in the system. Linux only needs access to the

Nit: there are other OS than Linux. Would you rather point out that
other DRV regions are to be used by ... what?

> APSS DRV region, so the reg property should describe exactly one DRV
> region of size 0x10000.
> 
> The example was using 0x30000 (three DRV regions) which is incorrect.
> Fix it to use 0x10000 to match the single APSS DRV region that the
> driver actually maps, consistent with the DT fixes applied across all
> platforms in this series.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> index f9321366cae4..786709f2d13e 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> @@ -96,7 +96,7 @@ examples:
>  
>      pdc: interrupt-controller@b220000 {
>          compatible = "qcom,sdm845-pdc", "qcom,pdc";
> -        reg = <0xb220000 0x30000>;
> +        reg = <0xb220000 0x10000>;
>          qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
>          #interrupt-cells = <2>;
>          interrupt-parent = <&intc>;
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

