Return-Path: <linux-arm-msm+bounces-118032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TeqbLtGyT2rVmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:40:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4937732600
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:40:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PgAAYXhp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GzoZCyyR;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118032-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118032-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35FE5317F68A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2C238AC8D;
	Thu,  9 Jul 2026 13:47:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B8E329E6A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:47:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604876; cv=none; b=NTfpquEV0sYWyNOIHuEpyy5niJYuRcsZUkf/6/XUk5hkXRxqk/h/qYCB9u75krZTF4+b2tf7rXNrP8llT/C25vXOispaazrNZXq9BiKFC8avDejpqxNfNA8Zox4vkAe81MUJpnGgAYkFCl+ALZyFiT8nYqgsYB/gbJQHU0rNkIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604876; c=relaxed/simple;
	bh=66kDW3XPA/IVL7H/7ZZz5fJbIr+LgzIbNasoSYOmMx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLU/wnJ8JoUI1+JBA+nV4UVSpQeCjhl7kKvthhXLgK9uutsM4anImYt6RHp7OefYit/+VOtAQEtMxaYxBzZDGMlTnsA9gpAGfkZnli8er+sv2upNnhlNNKJTfQOvz/JoxmumT39fq8F6D7vr81q6pI6zgJN1B2tc6RwGrxzNb70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PgAAYXhp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GzoZCyyR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNPXg1667790
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eAxguwIfoyTw9d/WwpSbWgUQ
	k1tijeexcOmhi9TjxW0=; b=PgAAYXhpNxfiw17Kyy6OT6sEMBHOhNVqJ/+fWh3H
	hpM5ZDa+um3yLqJPms9GsX0aygTGP0cSTugFThNn5gd+bRgjftUCZEXDzspgoAFH
	Wm94ZqJ9MVsYYkQkPbZitLlZIGey/knGLrwLxZtqdQ7bME5w7niIk6zK98TVFo4p
	6c5imvbl1FeI56EvwtQmkc6Rps62je9MoF9KIFqteBJESi89Lx6O7btWtK3pd6U6
	xydcylUittTloDi63SkEH88VllozGr18MDIrmH5CLOFck7eibvq4ZhNBA3SFlpcJ
	9vu4s8Za6J7Y9Kp8h/9APGAO/2X4N0zkVH330+43x3myBg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6m2dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:47:54 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-737f1f1e1bbso249454137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604874; x=1784209674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eAxguwIfoyTw9d/WwpSbWgUQk1tijeexcOmhi9TjxW0=;
        b=GzoZCyyRr4Jj5/Fm9PyxVVQuVorqSquTjYTuXwGBV1/3uSQDrsEOIx5o8YaDpGbvZ9
         7Z17fQpvQjQmeng3yIyPWuY7aZS1NCRLU8Li4vaa2dCr/vT8nVRrfc8ly67O0rFT1vxz
         c958GrDyTvyHytmZDTteGIFU+V8xtxY+ml4ehmkDhi01QJh+KxHizhv6URhdUhpIRfrr
         WDjkrW/uoZUhRvtAUAvD1p9epzrK3Gnr3DeqoufTkwpbA4Bvzkxu0rF1qZrUmSYVZ5eH
         IlF54QYkwoP5V6r6jJ+15yMpvWwufLxPAFhEZrZMAl4WA+PlF8mFDDLJlUwVXtUSwW9/
         hQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604874; x=1784209674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAxguwIfoyTw9d/WwpSbWgUQk1tijeexcOmhi9TjxW0=;
        b=VgVA60aPUIOxjVuYz/rCXnBB/A01st7tuk1/ZrFXjY81QR/KFr/pQhixTt7jOjThZE
         gEjQE/CEkvk1xHZ3PEspJr+FJSMCyAnQryH0dhSx60Noy9+CPVv7Q3rFbXfbjLUIS+TT
         5BXQSgplJ3E5/a+SO1voa8U+TWtgMRwpj2r/l5Q73hGyXT7j2LkFryqGd0rJi9KwEZ0i
         CinU0TClW7Glbq/Z1XyLDPbFP/oymUtJFg6ViDqtXsVkex9si3zztemhXtZjHd/VmbuS
         IDazWZcK94RyJnxkQsuU4rDNpBdvCmmL+16TctR1X79Y7P79xtv2jZmQZ3S399oIlQQU
         J2/w==
X-Forwarded-Encrypted: i=1; AHgh+RqnKkLs1jWUv8rlCnhOyW12Xbgy2AHu+0WkUsxz88mPWHgajU4YkXiTWBDrkkgcs7/veZfeErUpMRLSviUX@vger.kernel.org
X-Gm-Message-State: AOJu0YwFKsd4UmP6MIsvsiyzyBc7lyvnmBsUiAhu8QSZJfk9PEbKICWp
	lSEJ4PRY17+QYTRhOYus9tBT8TX5SaT9rVIfyLO4MP8fFb/fyIwljbnRqR44lRIytBAaWOCKS9u
	ilF4/hdXcGLasbrRbCiKBYmwS2fg3XGkAH8xBQDAAaKVSpMdOVT0lsZn2K5owkKHzhxwp
X-Gm-Gg: AfdE7ck2/u/WMT/Dguoq1hxos58xHnJkTN9kbpa7DRNoLzkTdyfXdj8E4GaFkdDzLW3
	DVfc9mDjZIXzo1N/v35RhAuhqzlaeFvxLyZk/7BmbKFexbse5kAl5Cf3LN/Xwct6ZbKM1vbisIv
	l1/0gxrnDhqBxlFI6Rz/l2FCDV1f7dhd2zGlMIEassCWxmv8yevV8hejkyfVuA70YSJrVrfQgNd
	YdPHpnctOnmu3g+QPXjCefG63P0tnQJbYePOm8wGScymh8nqpDamLvn2ppY0MzIeHE1QjMLjge5
	octWoh9f89QjipoKkv4JBk8Hg+Xmr8RORmSXQYopyL8xzmWc3DrKFCTmnSoUUA9ekfx4ZB2Ecgh
	uYeZChMAbog6AaMfdvRJWycUG1No5bAOxRe/MVRBWVh/QoE77cT0yn2OzLOzk30BDzF8fIiHrhM
	teuq3jLUM7EtmYyoaj2seZg8G7
X-Received: by 2002:a05:6102:4489:b0:73d:23c3:3e25 with SMTP id ada2fe7eead31-744dff69b7dmr3980057137.27.1783604873648;
        Thu, 09 Jul 2026 06:47:53 -0700 (PDT)
X-Received: by 2002:a05:6102:4489:b0:73d:23c3:3e25 with SMTP id ada2fe7eead31-744dff69b7dmr3980030137.27.1783604873071;
        Thu, 09 Jul 2026 06:47:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13701easm5330961e87.16.2026.07.09.06.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:47:52 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:47:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Message-ID: <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNSBTYWx0ZWRfX4N0YHqKyAX9G
 aPH/49+WwmexH6jO/o6MDmGVjQR8SwH4PSObMZdDkt73sTcnobEIFZFBR91oNT9w7la08T+kYu3
 CsrktvxHMn975kqpCXv8shWi72H51jw=
X-Proofpoint-GUID: tXfzBQepLpYMceikXqN8PA458hs8orIC
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4fa68a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=HXgzhWCI9UixiBSUE-AA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: tXfzBQepLpYMceikXqN8PA458hs8orIC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNSBTYWx0ZWRfX93e7fwnH8sk8
 MQ6XY7n5ERM0fe/s1JuCSQHIQsMXY5VlbViU9vtdGwtnB4Zdj28ZpvSq6Elp0F6cVHI7oXfzg1c
 lYPKVmU8DHo6sxrd9++pzrFLKGujdPR70G2/NV7x4F0Q+mpbUHNZtKj7Fs1yVpxWyj3FvyRj8WY
 dM2wQNvTEtVWZ6ZrBTz1ZT8n5m54dJs0mDVx6i/4M8fmAsJGacEj3Z7a4EYaqw3AWQP2hCxsBwx
 XTf69E3oQVLcEET7W8uORBDfYdnjc8a+E57pmnaOCWAPatAAWx5xIu52aNeZAb5N32moHxndSeC
 4NJc+h+g62Km6rrcrXAGETMRStmc9raap0EjnoT6QZjbptmpV/M1UniySbA6Iknvn968ywfMdSJ
 dhJSvXNygpFjqRHfC7QInWtzAOeqc8TYjrCaM+fpk2jZ8/w+YsTTryicVwN1ylLw9epL+2fp3br
 yt4nTUF+6uDYbEe5PIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118032-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,jrkbrwfmqmrp:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krishna.kurapati@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:Thinh.Nguyen@synopsys.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4937732600

On Thu, Jul 09, 2026 at 02:22:36PM +0530, Krishna Kurapati wrote:
> Add property "qcom,has-eusb2-phy" to indicate whether the SoC has eUSB2 phy
> or not. This is used to modify dp/dm interrupts during host mode suspend.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index 8201656b41ed..0c6a839be82f 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -152,6 +152,13 @@ properties:
>        HS/FS/LS modes are supported.
>      type: boolean
>  
> +  qcom,has-eusb2-phy:
> +    description:
> +      If present, it indicates that the controller is working with eUSB2
> +      phy. This property is used to modify dp/dm interrupt configurations
> +      while entering suspend.
> +    type: boolean

I still have exactly the same concern. This information is already
present in the DT.

> +
>    wakeup-source: true
>  
>  required:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

