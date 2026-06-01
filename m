Return-Path: <linux-arm-msm+bounces-110517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPLcBYU5HWoqWQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 09:49:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6265061B151
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 09:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 285423032075
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 07:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822C7386C1B;
	Mon,  1 Jun 2026 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UX60/lja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvWTUt7V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C012E7389
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 07:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780299753; cv=none; b=Xm4eF9aqrZD/RobkP4NIniPb1v3YG5BR1moW8GgK8FEc5zjq9Sk/8yaKo9tYCuo9wqPSGOSLSOybCq2D3LGr/ZVUyGrs/OaYAwT9Xh4VlBMHxuEqA9hHeB+6wKGC4W1qH2mc7mekPMBRNke+qonnJuHrux7A1fNQ59JKv0vtWUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780299753; c=relaxed/simple;
	bh=DYK+sYUL7Av8uBu1CqHUoleYd0NACg90m/0uUKoAfOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1es7EhYaMJ+68+nsXIQWY+N8cIH6vrZb/rALmmqA/GovhiyvbJBnw7l2HT0Z/wy7n1a9VIoofYZt0bVeJ4HjO3nrAvlZSO/AwmqelvmG4r/uRDeIqT4WLDif+xH+NSMDB+4CNsraJNEKj8hjSjnCZxhmEopt+Tvy0B6vQIM5k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UX60/lja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvWTUt7V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65172PSB2953886
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 07:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UXkAj/ayfqpLe8vFJe2VET2p
	ub3Jm3brorN1VW1Aky8=; b=UX60/ljaTl3beZFRxSI/JZXOkoOGbKxZ/l9q5qcm
	X0PCIblOwd2YJ3e4fKcscSrIc6Eytmb05K3+JWaqUDALGeoxrvBRcZMVHSKklOD0
	QM3npE4zI3LT7iT4UY7zo4KBq7ViM8TT8nDsCGVqT0lQaXKt89ytbL4jpCJzdJJN
	VqI8kCAR3G38LYrWrLfz7S2VoLqmbRH5CFMcnAX3aOOU8Nrwo5YuhNhzuLc9n6m/
	H7VIbS+eEjPAVBhYGqmlnwj0HNoCkQUKoyoxig5vGDhAx6Is8+g5qqBqDFNNeXz/
	taH4Vy0vWyOgnxgrRvrSdKZFY5+CNSdCjdxdp9+sGa9BpQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs2he6sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 07:42:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c331eda3so13550935ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 00:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780299751; x=1780904551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UXkAj/ayfqpLe8vFJe2VET2pub3Jm3brorN1VW1Aky8=;
        b=HvWTUt7V0RYrzKtO4pf1mtSF8cIR6TyVNm6BK0D8elTcFeV+VTvMYh8bA8LvvOdtE5
         z143LwmvVLJE9Vz4WweRn7hBezumvRdXJzJqYqOvAeaYiPQ7Xu38puB6eg2RyU1nP0XR
         rOv9QOET/tPtaVBaN037KendwtlwSo9XljVbLhhC/Kw9RpFovB2EgXiMamOLKBeZmvRa
         u04u2g3SAF2nus1OxDf/zRl8XCRguewPOmgoQVnsM86oJSq21yiSxs6WfIs11xRTGzT7
         kLtUMBysYutsZHuFVlwIa9vrHK7YIraTSd6lxpkwNyN0XdKtwbjyUDtKe4bYJF2JSpor
         Vb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780299751; x=1780904551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXkAj/ayfqpLe8vFJe2VET2pub3Jm3brorN1VW1Aky8=;
        b=AK8wpLggD4kHscg3tAc10OYjMWZHndshMEk2GadYwuNnxGxk775DzokoHSySeq5tAc
         TTRnFaorpuVQPHrWKPFq0c7ePyqMFpWbuNDI0jrFO9qPhAlM6j6rVZyjV+gLghStXV/A
         q6BKPV7iHlpzW1/d2clx6GU0MqsAC0rsIlWvss383B2bNTkvKN4gOwb1Nf01jHzRTGTS
         hWdyQD4SJmBt2MrPM2whLXRqGOLZx+MpQt31/nyB1iqhHLoVN1o8TKlq9iD2JELcuNry
         oR37d+mOJMrN9gu9QJanPRYrHXvQUTKnMKiZ503NV4ZeDZGVbM8VsnwP50tFh2Ik5AZj
         6ylA==
X-Gm-Message-State: AOJu0YwPmC+9nxZ3j47YRsSklm7vo8Rb6tmLMyudEDfRFQs5LBpP/xMG
	Tqen/aGCz34UtmEKkx6/flVwhAz8y41gjuXI8TpD8iGZQJNY/0AiLSAUdjMVjWPV2TsGQLsalfo
	gVCbEO5r3dLZ1bm5xz7n1FMXodbS67+17f95p/AK4p9rakrME16cTYedHWGNGoRHj8VMe
X-Gm-Gg: Acq92OH+iBTRxW49jS4lDPNws5yQZpbRtoX7oyLfitDHvpe9kNPsBETY//phc+yS5UH
	K770C3ijjRzwI/pjsOwuzbDSEl8JY3kpTUQHEoqitcw+tRsRehLFxyOXQSDCMEq5mK1rEr7vlEm
	4ZiJSkZ8ydECBqT3qSlXpNHRZdJlYMnjmryS4XvlyN9t2vPm/x3qg/55q8ZSH0lQcCfYAXQEihZ
	RX1QymGH4Lu/TF7MmHwXTRDVVavOjYNys0RsTywdwR5438V0JL438RJGzLdyBW79K9rjEw/4gI4
	fnU2jjdvA1SBxmC86uDtDaHb/cEJic5nhKayeWWNQyiyWuZ0n8V6zL+3AD3f3Qa2k6I8ErD5cdm
	YHWM9yPXbsyiCDcZXB4ZPmhZqYRvkfUC25wuGDkl12Vc42rVKvNCmoDLqSXY=
X-Received: by 2002:a17:902:f641:b0:2c0:baaa:db94 with SMTP id d9443c01a7336-2c0baaadf6cmr78918295ad.22.1780299750800;
        Mon, 01 Jun 2026 00:42:30 -0700 (PDT)
X-Received: by 2002:a17:902:f641:b0:2c0:baaa:db94 with SMTP id d9443c01a7336-2c0baaadf6cmr78917845ad.22.1780299750231;
        Mon, 01 Jun 2026 00:42:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c26b3bsm96095185ad.64.2026.06.01.00.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 00:42:29 -0700 (PDT)
Date: Mon, 1 Jun 2026 13:12:23 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi
 ADSP compatible
Message-ID: <20260601074223.hit3f7mkgj3mqamg@hu-mojha-hyd.qualcomm.com>
References: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA3NiBTYWx0ZWRfX98tbGVph8jng
 67+0BpvXVqecNGY3z+UirQnmnFOuZJfB7zonqd8suToTj8gbWf0tJ/zGwpZ9JsPvZaMhdn3p7BW
 hrY5SQ53pnvCu48fJ5+qh2UJMnuWFFgCRVJxkrEfGLTd3LNBjqlc3vw6l+AF91S9tw8Xobcc7zz
 wlxOLKYgD5/9FV5sCGlz0A0kfTLXKGQ7eB2rMGvvROxblYLTRdZLthX+NmG958rkMfJjoOERkgV
 IieOW32grY22s31WMdc8iO7wX2d2kpPvZbn6UzDOTy7kOGl1lK5Ul+vQ588MaKVudyH9s9V8zqu
 w1j+HlVa9qNAvF8v3mAnvBeWSfHaCflOhyfNZL2QARwS6q9RBoe4YQoPJrl0lVWv9g30RKQWJNw
 eqrB5UaRaJDl1bAliwHhM6dLAwUjWq0ysvFbM/WXeOqBbEjdC4x29nGFXjAv6+GrlEjhi8RVVnJ
 5vcd90+1HlS4iLuEENg==
X-Proofpoint-ORIG-GUID: RpCPZQansQTFwF1Pxv7hxWC0qXqtnQ1h
X-Proofpoint-GUID: RpCPZQansQTFwF1Pxv7hxWC0qXqtnQ1h
X-Authority-Analysis: v=2.4 cv=UIvt2ify c=1 sm=1 tr=0 ts=6a1d37e7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JSqdKX-yHs5N7urRZRQA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,hu-mojha-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110517-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6265061B151
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 28, 2026 at 12:36:13AM +0530, Mukesh Ojha wrote:
> Document compatible string for the ADSP Peripheral Authentication
> Service on the Hawi SoC, which is compatible with the Qualcomm SM8550
> ADSP PAS and can fallback to SM8550 except for the one additional
> interrupt ("shutdown-ack").
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index 1e4db0c9fcf9..161e9b55cb3e 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -30,6 +30,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-adsp-pas
> +              - qcom,hawi-adsp-pas
>                - qcom,kaanapali-adsp-pas
>                - qcom,sm8750-adsp-pas
>            - const: qcom,sm8550-adsp-pas
> @@ -104,6 +105,7 @@ allOf:
>              enum:
>                - qcom,glymur-adsp-pas
>                - qcom,glymur-cdsp-pas
> +              - qcom,hawi-adsp-pas
>                - qcom,kaanapali-adsp-pas
>                - qcom,kaanapali-cdsp-pas
>                - qcom,sm8750-adsp-pas
> -- 
> 2.53.0
> 

Floating this up, if there is still a chance to get this series picked
up.

-- 
-Mukesh Ojha

