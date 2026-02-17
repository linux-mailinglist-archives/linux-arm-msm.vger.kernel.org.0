Return-Path: <linux-arm-msm+bounces-93082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJjDGfwjlGnXAAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:17:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC79F149D55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA1B630242B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209402D6E76;
	Tue, 17 Feb 2026 08:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kJ58iPct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8uUKgXx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F3715746E
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 08:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771316166; cv=none; b=KXckpSWuhggLgppB+JbpVAY4yEvMeCHnbp4gQ0my8HlnRhvcaZb9nJGJb2TYOZ9xfE9zses3QWtl7U+WtfMLbyQJj41HYGTe/IbNEUTQVSQyyHYEKzJYf2zqIHjDeUDX0G4qqdTYu4si7WIKFUHBnDmhMiU1g7AKKCUptcke2R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771316166; c=relaxed/simple;
	bh=B8POv8ZIKsRgvCr6Pbmc77ycRPgPxdSfwEH+5j/FWLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/xUQGEwLj3OZ6h84Z6iPtnVHlNAI2cYAWlFajUWnfVAYc+ONMnHSzfrRDHYLM/Jrd2cqJw+K7aCbEi1pd1CqgTo/sv9xbzj+9s3wc5NVkxYQb4BNvVMhMea4b9lmgyBI1EObA3btd4YXlDxmboWyAIECYC5WNvHO7Vxdho7Vl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kJ58iPct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8uUKgXx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GGUIHO1601370
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 08:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L7Se9ZozDPuZSwTwJ1P7pdf1
	wL0THwc/KeQEqUqTJZg=; b=kJ58iPctnagvC2lIwIZ+tUtNaI3SBiZhGZxUfxy3
	e/OP35RiIWwvEksFW1LGY6aPpwhNJMvskrhXbT1NlBvVwfbtUMHIK3TkuakV9rF0
	10KOtj7APxCeNffFXjPO6ZknRDpdPzq+SDPX68KsnUb8kvtlpE+Nf6+xKzerzZud
	JAt39Pn5Rnv0VtJArp2TjTQL7oQJLIu+NdaQwDRmKiWTvPAzP7MmFA5kuUIa3xta
	hqpM9bT0HIHXwiq15J+lOVPetBqwABI/k+FEji7I9VAY+EAqxnN0wXnbOP/Tcfui
	C98i5h9oyRtFuNmL6Jbdw2FodZ6EBGVRePZWz6cu6vpKoA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tm9h9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 08:16:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506c0231e63so267835671cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 00:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771316162; x=1771920962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L7Se9ZozDPuZSwTwJ1P7pdf1wL0THwc/KeQEqUqTJZg=;
        b=I8uUKgXxgBLZiul76GEtQW6Vx7kKcDNEV0Ahc2sPR7ky7/LW7D+4GqPVqx01afkSoI
         F08awKrYyZFK6K90+9aIOJ+xn6VI9h+WCFaNWtlC88+Fg1mk9s0AE8hRu2bDT/VgizA0
         e4J95hD3/FkXxq6/gKnVUkbhSDYIwyCw+l05NMjmpGQwgUYgB6aS0xepcdt6IhKcbzSl
         tsq23IX9eCKATUt1PHwOZl/KSitRi7G5qPnit597eR2wm5dOs4jJ2ZSIqoMvSPed8ZpL
         ha1P7gg5JehLzxMqQ6aPkczcquSwfmKb8+gETwH0TrQJrvsDacYgZKwADZHb+ZkmnQiV
         O8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771316162; x=1771920962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7Se9ZozDPuZSwTwJ1P7pdf1wL0THwc/KeQEqUqTJZg=;
        b=OyudUJtb5i1hqL1iFJR4tMdO54HwqMvPtyeJvoGy2IbpwseyXBM2nBsCBhbixQzjTW
         S6Zm8Z9tyIXjUdc8u5ssLRIZivD7kWHvt7irv5XhEDN0aNohb8t3qvqMhmYptIhvFzSn
         IeHQRUIF+5KGfhgYElS+izMiI/rOxdGPHl3MjJ0AiNY6lu2I6ipXammgFV2JNVQrVvDZ
         TZ+6U5b2XBcbUEXKPYTeiyKz9WDC+vjtVZwykmtJG+zfx24d1mcVoUQUoAdgckoHB/ZT
         xROPjjKJayJHuD/m7tG+CZju+7k6VOGla3VDXowljBTlQkzvIrOtFlhnoFaC2t4ozvLV
         TvSw==
X-Forwarded-Encrypted: i=1; AJvYcCUDBn5q74imx0upXqCTL7y2roimXTRM8fbfun40m616FxEJvNE1ojaCpFiAg7t0eZaKI3QdshVIa1kiIilX@vger.kernel.org
X-Gm-Message-State: AOJu0YxLZ924UliyvLYRKyc0sA+aqi1tD/vo/C9haLC/4m8IyJjPN9ur
	H396a4mbaEiHbbjip+toGLxqtDSlnjEhF7MP055in4wqmP2cq1CKdIJKuUezMPejWku2T8qdU0d
	OnvDie6ABxY1IsytL2YU+iR/fuzjbIEWT36cX7gqt5mv4oBrpeSZ+E/U4V1az5YOd2oDE
X-Gm-Gg: AZuq6aKM7x0dqFS9MoUcbWza6iFcQBHzWEc0PmNguySazFBIkyFn+CaxWLkv8axBkUB
	tUYA9YDHBJslJolI5wKIrZ1afNdHkUMGQ8KOPFdxPkRFX+31X5iaHV6RHVv9b2/u64uh3Zv1Gxp
	X/I5yZFzRLjI6vttf30d1pK8pC7ky5On7dWVnXdNywxN2tyckB2bgQuVTT1YBaNFX5ETsYONDWA
	cJdD/ZEPHoF+EZYOasCrzgpvNk7BgoyACQWiT68WTS7WIbcgwpzPnaxW6NPojsjRaYIXg3dWmUq
	iLkLSJKyZyrJk0zKja8WD4thdTIJan7mTfnbFVN1KeSkYmdAN4dKuIboZDrAj9xpbvc1Rk+a0GU
	oqQaQh/UxvPy6OXAO+Vu/rN56ClaY3s7/cTmhfDdI5irW9FrrTJ2YNmbgU4Dw4e7vBUxbdpqsUL
	C7SvAGmipxzQEEwyMLL1Dc8jCma9GsPZVaxUc=
X-Received: by 2002:a05:622a:4ca:b0:4ff:b0f4:c307 with SMTP id d75a77b69052e-506b275f142mr134586211cf.24.1771316161754;
        Tue, 17 Feb 2026 00:16:01 -0800 (PST)
X-Received: by 2002:a05:622a:4ca:b0:4ff:b0f4:c307 with SMTP id d75a77b69052e-506b275f142mr134586041cf.24.1771316161365;
        Tue, 17 Feb 2026 00:16:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5ac0bcsm3769119e87.61.2026.02.17.00.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 00:16:00 -0800 (PST)
Date: Tue, 17 Feb 2026 10:15:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        yifei@zhan.science
Subject: Re: [PATCH v2 3/6] drm/panel: Add Novatek/Tianma NT37700F panel
Message-ID: <3nhx24v2tqrvnhj4iklih5iprjqyqekedqbzn6vdmzvyxfikbw@bbn5hzefjyhw>
References: <20260217000854.131242-1-mailingradian@gmail.com>
 <20260217000854.131242-4-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217000854.131242-4-mailingradian@gmail.com>
X-Proofpoint-GUID: s1mv-1RDYS2e2NcIuOvbacMYb_xflxQE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2OCBTYWx0ZWRfX+CWnh5RXvYIN
 hcrutWwfjgi1Ey4YujsAAlCUwfkH3wCGUNVavjqTbbV6i7Um83qqpMWeLoScl7Q7wdgjWcso8YL
 wUzOfxiaaWkmE48q2wqtus8PZdlKFnyVzYs0sxo7pRI4QfH1+Mvs3csUfU/7WthxbLGqEPRBjwH
 AnTnEdsR/zeoCrxCwNLb+jYGrpo4bdymHcl2zPYPXe2FI6RJ9kTu2/NoHH11c4z4VsYkZJaa8Bf
 IgmtltuUxFYOKcZHupQH4YIzg8IfXOlqVsXvWVBT5v6yt+xpfOy9S/AcbppeByE6fgP3dioq1bi
 zTg81xQsBOE+md5yB8dn69rZ0tnL1uf/ve1wQM0k8imnutejPJAjpe5nSxmI1hX6rXWJSkxTMNe
 agJfeTXFE7n1hHVTUM7Hy4JJNqpOvxEvKxzEgOTxLWiyYlnx1tmgvRgyEzrhSdBc1QyekgkmU8C
 /OJcyfYYKp2uJzPY1pg==
X-Proofpoint-ORIG-GUID: s1mv-1RDYS2e2NcIuOvbacMYb_xflxQE
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=699423c2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=oINNAWDTXFj4uIHvT00A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93082-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org,zhan.science];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC79F149D55
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 07:08:51PM -0500, Richard Acayan wrote:
> Some Pixel 3a XL devices have a Tianma panel. Add support for it, with
> the aid of linux-mdss-dsi-panel-driver-generator.
> 
> Link: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Tested-by: Yifei Zhan <yifei@zhan.science>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-novatek-nt37700f.c    | 282 ++++++++++++++++++
>  3 files changed, 292 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37700f.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

