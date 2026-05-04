Return-Path: <linux-arm-msm+bounces-105818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEDdIXYg+Wmz5wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 00:40:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FCF4C479E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 00:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E4F9302A6D9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 22:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2113386C21;
	Mon,  4 May 2026 22:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1S7IowS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VJYkgVgz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCB337C915
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 22:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777934416; cv=none; b=f26ia9XaquR6Np4uzpLnNVaKZcxhN2NJOcXz8YyMMBl0eWrKc+xCnx/Kiz3rAr+zag9ckZvTYYoifHNtHjceuhFEMLDw5KUtfXzt4ls1hTWY7MlwFubcv3Nb0D/vFo1NYdFfa9U0Yj0MuwOsCAEiPUyT4cOnTEDNKA+DOsme+Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777934416; c=relaxed/simple;
	bh=tbZ+AvvHbrL75au5Rx/mr5ZMruUtLT3oIM+mD3Zyhuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYrGiPcsCal9LdJOjsrvKknzHErMIz67AL/XPg+vxzd9YHZaM45bRYOmJradDZTBGyIomOiJbke8dLkh4uEWZfEI/F4mGPIw3ABR+8gxU1cdhR7H4BJ5m+kAMq4Z0hZagutTc4YS3t1A+i/MlAfd0XnAebSwYZYjwtZomfrV9fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1S7IowS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VJYkgVgz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644IZbVC4128847
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 22:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fKsRobYlVid8ozPAY7e2ux14
	j9F4sny35spO5DP0VcI=; b=I1S7IowSpcYgHQ4H0pXji/mLJv8SEaDLiv/VUtgp
	/z/FvWfVv0fDY24+m0OZoXQnGzvajzffJn169AGtzLyM3aYgk0+JY8oMisC3Uqab
	bWlYwEOeVuHCUbGHjGJ7s+trig68WzJhmOcnpy9nfd0LSdcIwjhL8nLKt7lleAy+
	1Y7PVLyqeEz/mlIGlNv9sFnWvSi928tP8L6/O1Evjw59pso+RwZnnP21HLRQLILa
	TvY0lJPOfM6fC1+pWb+594MNE+eWojJ/040hW/3I3rg6g1PAVOj3xYFtAotXvJXn
	gS+9sKljpzc5TeA3mi5bicUZ16POTgsIgNeoR7iuIfaGew==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw2jm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 22:40:13 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-953cccadb32so5864500241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 15:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777934413; x=1778539213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fKsRobYlVid8ozPAY7e2ux14j9F4sny35spO5DP0VcI=;
        b=VJYkgVgz6MJWh9PtioszXFJubt2RRmVrtpj/4aoQaWqcklfYZ8EGy2Q4DPBKIq/Gxa
         SU4yCcBkvObe6uZS/3lhGCO/aVp/mH3oIhRHNx71MSjFN9ef9+hvsXatvMvLfyU68b5V
         WtLZutxx1KvRp8OLZSAP/6dNtDhptTmx/YAH2cNSYzsVkXL+9updfTePMzX8ODj+mOjK
         hpTPdjExpvE9Mv/xPEeOgOrFSK7wV4skfD/LoDLnDcCC/LmSHGMUmwPJyvnCyvU2XUQH
         WEGjEz7Z3XJoTFIVnEILoJLhT37s/bZ6W2lm2BqM+5Om75M0/mLWw7NRHYEm+RgVutMb
         eHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934413; x=1778539213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKsRobYlVid8ozPAY7e2ux14j9F4sny35spO5DP0VcI=;
        b=KKUcWNVyyZVuQYbMwT70b6s1UeQRgOkcAAgWmFlETg+Bo3AzNP4qw3Ewn6npuigqml
         DdycZ4ZQUYJ37GrtY3m0XNaVKU+rq+QOtYjIIU0ryb8Znw50x9Py+5a8k2Mawf/x+qws
         FfyGpFqx52zeZb+6BWoNmMS+O0uUCkZxaPexkXlZrDGP3GVSxAy+3o21zc0JdKzt/54W
         pBZxKTIfzGAleaZXTl2sL/1GyJyaAb6DjtOUPt41c08CLetYFuQ5judxvERObLmXo9hy
         txm7jHcu6W/IezoarfYG56VOTk9ih567Mdi6ODc/C8TqF5yx7qgZALuwYZ5bDG8lOjdq
         Q9sw==
X-Forwarded-Encrypted: i=1; AFNElJ+MjBYqRegv2jKM2AVyocnwqnw1yf9Qk8WNCpu/640CVo8GcloHLviJZc+1sJqjYhmky3JjrYapfdhJDQGV@vger.kernel.org
X-Gm-Message-State: AOJu0YyGODQe5Iv0oUiO7eFDitdrb9efzvj3z8S7cbKP9W57KfsBfqsY
	rvZ4wDfm76yUcKGdlNarn5ZjpYNbWyTvcr41pIf3cHXZ/w0XMja2r0DCyy3LFSCEYzq8NVZOqoT
	D18FKvcjwM9UspLE0N7Twt6ziszMB9XTb6BPq0b6bpeDYCN9CIqnriegtq5O167W4dQPE
X-Gm-Gg: AeBDievutUhnI8KFQswKrqbnCNB2sr0Miqgeob/cUAVHbxqZlStnZtFm5ThYr60abEQ
	zZ9XXSGt2K7/BhGXrNeaAQXJFqSECXv33qetaneVsqvx499liC7EcPBsOIOwKWqnTTqJ+zrDzIS
	/lSW+WAOMutRnht19IV4WRFUUPLLgVngZP09GOdrrf/vyoGvc+KOT1CsUDPlN2VMjDJR7fSQ3/u
	hu5yLx4NB4IzTlP8en7y3tNMxvRcPx44yKQRPN9+w/1Ocj3NHhMfYnpIEQ8YMlQKTX03gfeMBp1
	4iDlJm8wrMMUr7vRb1bfFFGD3JINw3M0LrV4zmQYIt+NfUWWLSRCf+xmYAhhGwd6DrOapm4kmjU
	0uKhtrMjgWz515De1LDuuY8zztZGHYv49KuoS2qAVy0dQ9DZV51Aux5I/m3y2D+NNVvJ2WXdHPL
	A28gHuFoZTZFWZlfTa+9q09yhEfiNwPj4KI/RD4D2ERmlUKw==
X-Received: by 2002:a05:6122:896:b0:572:353f:be2d with SMTP id 71dfb90a1353d-5750c6b2f14mr6080117e0c.13.1777934412928;
        Mon, 04 May 2026 15:40:12 -0700 (PDT)
X-Received: by 2002:a05:6122:896:b0:572:353f:be2d with SMTP id 71dfb90a1353d-5750c6b2f14mr6080099e0c.13.1777934412502;
        Mon, 04 May 2026 15:40:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3936108fb8bsm33734251fa.2.2026.05.04.15.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 15:40:09 -0700 (PDT)
Date: Tue, 5 May 2026 01:40:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos-fairphone-fp6: Enable display
Message-ID: <6hygg2pm6fbp3scdurycihyov4ffgpkd4szmtjvwjpok7qbfk6@czbszxhvn7ev>
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-4-e09cb05651cc@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501-fp6-panel-v1-4-e09cb05651cc@fairphone.com>
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f9204d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=t_WoDEAhxH4J7FjSGWwA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: UkDZ-GZHBE4CT1y2hrK09Uan_TFSazNl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDIxMCBTYWx0ZWRfXycYFp539Elh3
 6wn0QO21tZaOd4fVjM8pJ3xfoiR7uuH1Ge6t4DhFI2DH/C6LQc+SvQ/9kJCRrNT46eTkHgguJ21
 xDM+FnihRCglndCKPXF8ErvuGXvPhVwR8bPXlT03ugxh9lyvFnQblNj+pHQQv5Cyt41jkU7+6QN
 Tkal+bR1ANV9CAqQNlYqHEo7re+HudfwXc6SwWUDhgn6RUyjRQbbn4IiMansj37LldlDxrn49Rq
 Edlg5dthNebeCTIZi1hnYAY/F6QIwuy9c8rDntxab+SCrNI0KYGkl9IYf6Covz3TBZzhjn3ExDy
 jWk9cLV2nivBlkc2FFGHnOihMr1Ov3t/v56GqMB/K9aVpD/54OiJxuid/y7WadKpXYJSm0sHeIV
 Dl7GYQfeDivbR+htcqge2nhx2p20lUEaUAXvcTjJLu6bw6AkWb7odgcDzyq+xr3zBeeeH5Q7EIl
 OsThQFffo2pEMMpa3GA==
X-Proofpoint-ORIG-GUID: UkDZ-GZHBE4CT1y2hrK09Uan_TFSazNl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040210
X-Rspamd-Queue-Id: D2FCF4C479E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105818-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.sr.ht,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Fri, May 01, 2026 at 03:52:48PM +0200, Luca Weiss wrote:
> Configure the MDSS nodes for the phone and add the panel node.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 64 ++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 

Modulo panel's compatible (which is discussed elsewhere):


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

