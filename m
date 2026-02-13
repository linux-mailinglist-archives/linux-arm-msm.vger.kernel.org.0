Return-Path: <linux-arm-msm+bounces-92816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHXEMsJej2mtQgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 18:26:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48927138A04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 18:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC96D3038FC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 17:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0ECA365A00;
	Fri, 13 Feb 2026 17:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LzxnnhQM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NnfDCE79"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D217364E88
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 17:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771003578; cv=none; b=XrDYAEZmHHhmEX5dguUb+nq3nXfKAUQHRNHJ/3ogpYmEMvIhTpRkjdrIBJOqD2B2D6crqzcOQeexi9L54Mg18ZgRA+5I8V1nUkrvLhieA8wk656IatHv+TiIIGAq0ztf0G2EZkFqMMXVxGG2a+O8NPrGOI5rdiXDNEdkXwDAqt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771003578; c=relaxed/simple;
	bh=8TrtvTTNxEeTZRhHNhov12JjgRtv4ZwgGGXZZshGtZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlZeHoRYq5bYKMIjgT46V4VS5kW6qWyva6LIZlrtSRy4MYkCSLHscbD4LVevIhOKMB1gL5VwJuemWW+Q9IAma6WIDDoc4BSvvN54c2OfMXTMoZfVuPIw9IxHeMeOsODwGtPe78euJkDUk6A+QZ7pmowtxDT8kLJU6FUWOZNp6qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LzxnnhQM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnfDCE79; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DFXOD93043463
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 17:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PlyFBbUQVp4HXtMNveiNXCmc
	cPJmA4dANJAQzvSFSd4=; b=LzxnnhQMWq8v4mvI7kOskpP4MA50gxkKqLKzinXr
	S7f77hh4RTgtGZOaMXMi6ZxiHTfUKIx0Y81tVBiwmmbWtJkwIb7gg96/viLZtBbe
	e6rcZbnlTz7131c1R8iEaxwYF3ZxA89KQHqRgHl4EnxKRLQGsWngOqdGL+zyQehx
	OHMGHkJQ7aCZUVTLvLcR+TyQY6SFHtOw0XbkxqSJvPJY9i3EuyXqlZR1m5D7Ae/i
	jsOaDcSl1HxGnX/YtnEQZeiQmvIX1XGJhzrg4YX3rftAMWHNncc0Z/ZSUv9t6+MW
	5G2lRjtYA7zwzj+ty4e47Y7rX6YJC3y2IAz5Kw6mUik2qQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ps2ux92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 17:26:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8947d47793fso81570696d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771003576; x=1771608376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PlyFBbUQVp4HXtMNveiNXCmccPJmA4dANJAQzvSFSd4=;
        b=NnfDCE79uw0gaWsxNhgX87PDkLZ3NjE7xoeGOao/E1f0zrcF6VmStwL9Nue/4v0yJN
         0GanDDoUrWUzeM3ZUKJWjKV8RTg3njQZ1TlwT9gbYu0KUddYTNo3ezDqh4AKPGJHUC9L
         rlGePoiz1sq5wVuFnxSs/5YojF5aUBEJn7k99HLcPXG/fAoafG4hT0hXUQ97yLDxGfzE
         Hgv0Hia+9NpwMbLg1+Eq1fSKzcdQAXlrhZdalDlvkPHZfL23pb4/ZQxmoo/UNwy+ryKr
         fuLQgbf30ZcUybsFnO+FBgCuvP7CpIjqPd8wVwkYfAt232sKVugXZfmEfgtTqnkCLI3E
         uK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771003576; x=1771608376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlyFBbUQVp4HXtMNveiNXCmccPJmA4dANJAQzvSFSd4=;
        b=Mblih5Om83ZK1OWkvRZs9Q7Vox6k3tDEgwFSyZNJh3MQn9gqrLhewbmCg9BtrJ39xF
         hccS0rfrD19JK9lBmdHixyV9Np7O5qkiAPJ0VkhDrAgaYfmK7nknigr3fF36WwUtqkbw
         ZVMHT2JzGTIxU1Kj2h3Zd0TAb3i3CImfF0i42SZqqo8z7OuJ2bnDaUiu3J9COYX2Z4W0
         1UEDh2oAaj5RrJ5lNHm+Xp81JGFg4pbV1eV1Kf+nPDp9BI2q3zr46FkrkOwGLRho9RwF
         0i6j1/lafUEmklsP6TSBQHWqt8nJ1DL2l8E1gawqC2y8iThlQ/HYZUW5vfJ8jA2qiTTe
         Esnw==
X-Forwarded-Encrypted: i=1; AJvYcCUABq65JN5J6j9bURPJkzbon9qbp/mrLPkf9vbWzX9Bt84tLsonzIheN0YuGn0VkJeHvsqkuWohFq78p41x@vger.kernel.org
X-Gm-Message-State: AOJu0YxOEkQHKL2Qgk6rJabqvWpnJ6kBZ5v8LqtvZMXye0nLs/rzhtXQ
	2UyzxcwugF4eU6fwcRWvhQKu6iTnf2c1BW1nkhAo3WNntYAE6ALCIGrqbXkwmi7e/QNTLX/gIjZ
	f6Y+1RDEmiXQToLmJGsHPDNA7+8Bz4Ss/U8dvtS4L0ZQP5BJ3et0KtINBHgsdAiHlfJh+
X-Gm-Gg: AZuq6aIB/RyZOsxXRxWR6m7sU3M23UZAoAxNo0yU5VGOOmgy93E3RPN6AQtGPaROh6g
	THjbgo+Hgxkw8p5H+4c28O3omP2JM7MRlNZ9cpk7I4j0MhvHEUQHA7SOUOAWM+mmlmvvPZmYfyA
	k03LzFTZv8i6d6cf+bctahOeZwcm+j2Lss3oqreBR/I5RYhaUs9yco5Pyayqds3ezDVVB90uIL8
	xBpvPIlMG4Ki85ZNzf285FbfCZcksSse7RDQ1JgYbRcaUwmwO3RPA51QPG1ZiyVTz1NBl3/r9Ve
	x7NYIgvuyn2Xx6BC1o9SUhLbN/OXHEuEYVCBP55SLBfUK5ReEcDd19/GpKvZsZmgwYRjIC9kwmu
	GLMP5KwlvQBQDz7bVkHpUiFESruGR89KJgsM3BZH6F/Mn7J+Ebj8hRVCNUF4sUMWiDDdag17Ipg
	+dB+CmPXECviSK6H8vAPDuAk4S/eK9t54/WQc=
X-Received: by 2002:a05:620a:280b:b0:8ca:1107:1214 with SMTP id af79cd13be357-8cb4bf97ce9mr41058085a.7.1771003575816;
        Fri, 13 Feb 2026 09:26:15 -0800 (PST)
X-Received: by 2002:a05:620a:280b:b0:8ca:1107:1214 with SMTP id af79cd13be357-8cb4bf97ce9mr41047885a.7.1771003574496;
        Fri, 13 Feb 2026 09:26:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f563054sm1681135e87.1.2026.02.13.09.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:26:13 -0800 (PST)
Date: Fri, 13 Feb 2026 19:26:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>
Subject: Re: [PATCH v10 3/6] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
Message-ID: <ihgkjbcrxiutww7xrr2nksakypyhmukhnpeiukhf2qfnn42e7k@npacu2x7eig5>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260113092021.1887980-4-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113092021.1887980-4-varadarajan.narayanan@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: igpjY64kyE3oXYE5zLwRKIWEq1m6tkq6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEzNCBTYWx0ZWRfX0R0YHM8EkBGm
 GIIxFfza73iZCWbF3laKBdgUBG6gaj3KgfbyME/df3lhBXNrzqjJTvQn1LDTCN523QEriFdGl4J
 +Pf/ZdLjuFTjlzrJs5U/5DScLwzS9EH8ssuXfuFpYrTLmbuCFKo2wx0wLDgepKZejNe366/grlV
 JvFWGwLNGhXZZl5j8X3p4yIqKHYz+K6X/vUJWcNKDcl5UvC75JUwLDWCyesZPzjYxXnnEOq8l6L
 7w4vuiYXZtqvzKVqzc30WjJC8JQrE2uobB9jGYQBRTJMOLOusXoDIMIbQIFmk+9IgvFiia7JQUx
 /3LS6HDEo+7EPqAgoXej0tPTc3bfp8T3V0fAAFHoW1ROTBv9kv+gcWceb5WmGZ7uc9JMrazlRoP
 /ze23c9A33PB+rqzKPnz7t3osG3De+qUmgSgA3ECQ5jA1UBCgsIyBkiuIlPHl3qnwxQMpDjA2JY
 bdbA5wLDl1Y+o212jLA==
X-Authority-Analysis: v=2.4 cv=LoOfC3dc c=1 sm=1 tr=0 ts=698f5eb8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8 a=_028WNt5gqhadA5UqRUA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: igpjY64kyE3oXYE5zLwRKIWEq1m6tkq6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130134
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92816-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,quicinc.com,vger.kernel.org,oss.qualcomm.com,outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 48927138A04
X-Rspamd-Action: no action

On Tue, Jan 13, 2026 at 02:50:18PM +0530, Varadarajan Narayanan wrote:
> From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> 
> Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
> SoCs support secure Peripheral Image Loading (PIL).
> 
> Secure PIL image is signed firmware image which only trusted software such
> as TrustZone (TZ) can authenticate and load. Linux kernel will send a
> Peripheral Authentication Service (PAS) request to TZ to authenticate and
> load the PIL images.
> 
> In order to avoid overloading the existing WCSS driver or PAS driver, we
> came up with this new PAS based IPQ WCSS driver.
> 
> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> [ Dropped ipq5424 support ]
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> v10: Remove unused members from 'struct wcss_sec'
>      Remove glink and ssr subdevices if wcss_sec_probe() fails
> 
> v8: Dropped ipq5424 support.
>     The comments related to 'use_tmelcom' in [1] not applicable
>     [1] https://lore.kernel.org/linux-arm-msm/72f0d4f7-8d8a-4fc5-bac2-8094e971a0e3@oss.qualcomm.com/
>     Changed copyright for drivers/remoteproc/qcom_q6v5_wcss_sec.c
> ---
>  drivers/remoteproc/Kconfig              |  19 ++
>  drivers/remoteproc/Makefile             |   1 +
>  drivers/remoteproc/qcom_q6v5_wcss_sec.c | 325 ++++++++++++++++++++++++
>  include/linux/remoteproc.h              |   2 +
>  4 files changed, 347 insertions(+)
>  create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

