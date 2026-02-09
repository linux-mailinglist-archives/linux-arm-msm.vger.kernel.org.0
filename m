Return-Path: <linux-arm-msm+bounces-92297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCQLG6TeiWnGCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:18:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D613510F8F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB0B8301625D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 13:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5A3374169;
	Mon,  9 Feb 2026 13:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YpfptaiI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cE6SSVN4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B945637104D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 13:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770643105; cv=none; b=AxCC/G/NzA/s9aRMqXHjJZrSsdD52lIRE0E8VB0f4qM+aOc5D4IcWlpqapNkMvtphDcGuoTHwEeSUBmmyLc8rnnaZUKi0DwNqXcwD+NakB8bOZsdtNG8AmYufAwiWHvHnzYsuHM2gQ4ApfV7gYE+dYA2i9KIMHGC+qSKTWTSMPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770643105; c=relaxed/simple;
	bh=t+T+dkJjE6ZZkwS3IFpC2HOVkq408dhr9gR38JgbWQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvrePqoMIHEWppajr/dG+nwEKusl8HQi9bCt2Kmu+p7RGLnhfSXQAQkhl7h9Tuf02fntGVdI3D5tefya4fC6EOQYpVZkaiSzbunr1ak07eoorlhJ4WEM3QLhRV5VaQGR/nFb/kyXcjjpnQDrM1aonXrF+ywaxjH0cOGwaQzpP1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YpfptaiI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cE6SSVN4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619B0wDc1922837
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 13:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ori76HCn/IvmJax1sLFXEw2S
	KjcoMzlrP78wr8+BP6c=; b=YpfptaiI9kSVNnshs/HkOXJIQetYeyK1FLgoQFhJ
	3o76tOZpKGPWXb9v139NUJ1q5yntDwD0vGoCewBOQFpZiGCqu/QiKbW6wVkLky6k
	3keugepI8SVmOuiVaZ19D1DPASnBRfO17kiZ5GTOHUp+MN/YtPaQGf1bpgQuKvRc
	3SujvpSVJZKeqm8dv5c84j53FQJ+gO/n/exuInMB2I6c2El/YZekiVDrsYQYmrq7
	nrxh8ttrN0L21XHsKkPmaVwTxY+Gy686OUC0D2q2cJnYdnuHYHX8fCBe0mHF180b
	uZ0ZojqDQsjZumU2jMpEK0iCoKsxJ/qXJljkupfaMFuYAg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c796ksj0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 13:18:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ed6c849so1284681685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 05:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770643083; x=1771247883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ori76HCn/IvmJax1sLFXEw2SKjcoMzlrP78wr8+BP6c=;
        b=cE6SSVN44TUH67aMpD17Uolp/buabfhIPZL67pDQuCyqoBqU7yvx5lxSXlvcls9Lpe
         NMqtIiqLQdBe0CPhjHaalNGVE+ufMWFZ733Ks9MQAmj05sT5SUwYld/VrOs5n3VjN3JR
         uNjATOan6x031BQ8BF6B1ZuOmUKukNx6jMu2iFGmKIiFh12NyR8AXCKhGajnkCZTDUoA
         fOahGmgn4ypG/BDoqt/CMH9P5ZI24R2+AV/1g0rbLDUAgD0vMwRPr+A6mLOiNvYGTry3
         BqVH4OjVaal6PpDuxVhB+UsmfTpPltxmE0xeAsVIKlSEci70nUmrBucuef4PBBY5MsGX
         xrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770643083; x=1771247883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ori76HCn/IvmJax1sLFXEw2SKjcoMzlrP78wr8+BP6c=;
        b=BrOmq0VRGangULCWxPcckPYZ0l9MdFMKCIcrpSD7pPRzfo0GBBgFSL2VijTdgzjMT6
         PXpOLjauypN3acPYqRs65VoQTCfjCHN1ZD5R1KPoJ7NY2Lm9fM9ja+uO2bTF32GhPnaD
         6cJIVKKE9UX9rGZqkxgCYgpFLGqdhLMdiFMqyDCc1qq77em9a7/oc+h6TjB5xzAuCLpx
         JZw37QPXDxwvOC5BGwdU5gsCXWHNheIGkAJ/sfNhiFpgRTZKEtFefuLgtQ2CWcYYay7+
         lxw71Z7w/KGT+Oj5u09Vcq8trqrED4QteXpn6RGwP04gsxXffR1KNFDjVUu/FGkok93K
         t2YA==
X-Forwarded-Encrypted: i=1; AJvYcCXfYOrorCrzYz1QqJnKbF9Zj9PiaHz2cx/VorCwuv5n5Sx+aAsyA/46ktyga7K7uo3lCeInu8g0ZhOZXf9R@vger.kernel.org
X-Gm-Message-State: AOJu0YyXyV9nnIWRR1fWHDZPuIzpRQ6iOUU8E1HcEauZcqoHXqei+Lln
	ZLGisL7PEUT8xfQ8r5mBXolpUbzb0JExr7tUUx4X4tHpxJ2s6bqnScd0WF4TW8YWGrW4vFlj2GX
	1p4z/FpEFXSlbe/Ui4yDExfhD6S3U1W3JO0GcHoDAzsduTtTBeHkr5mzs+8QytN9s9EKX
X-Gm-Gg: AZuq6aJbOGfsriHfyRPq937uOSiMOrDvjQyqaSfRjVX6t32FztlmDnlnfR0geHeQgaf
	9SVA70yoxukGS9G6rQmuqNHGWseZKLCnauRniuiqJluZzOJbpn5ObBg1QJYAjxNwptJN9qOCnBh
	l8IWx745T+P8nPVqqfaWuAFqQueURgsAz5sj9KpcDApgDHYuPJgeCLC4phqKvtp577QFc1rBRV6
	GYIP6ZU2+kISDNaPNLr7Zy3i47OiyCAeEeTvZH21kfxjPG1Hk1qb+rs7ODxFyn9QC7N9ZrCnx9Z
	YsyR1FkRTvzfSuBxUL9nbwzea9Tds8gbbLkDwg32pZjgOoG9EcqND6MjmOomqWh+zgtlNo/m0Dx
	+nu9uzNUPwOQKwjjk1sNaZXKnHiLcz3n6q7OF+Ps/C0XvGKF7jB5bqWIWXzSwmkvZFF37KjL6FX
	17sUC2ZUQIwzqhj2x9wRbAkqI=
X-Received: by 2002:a05:620a:d8c:b0:8ca:934a:5e35 with SMTP id af79cd13be357-8caf19d661emr1315100385a.84.1770643083118;
        Mon, 09 Feb 2026 05:18:03 -0800 (PST)
X-Received: by 2002:a05:620a:d8c:b0:8ca:934a:5e35 with SMTP id af79cd13be357-8caf19d661emr1315094785a.84.1770643082525;
        Mon, 09 Feb 2026 05:18:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b623639csm27411421fa.8.2026.02.09.05.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 05:18:01 -0800 (PST)
Date: Mon, 9 Feb 2026 15:18:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/5] phy: qcom: qmp-usbc: Prevent unnecessary PM
 runtime suspend at boot
Message-ID: <y63tdwixjlby6ixqwqpu6dsxa76vjss2swcubbnwdjvw6lun2z@lmpxjm3ex3ke>
References: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
 <20260205160240.748371-3-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205160240.748371-3-loic.poulain@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IeyKmGqa c=1 sm=1 tr=0 ts=6989de8b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=jqzBUNCQ8QzhMs2i4nsA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Ul3ySkKUYqmaTfuwv7cepK75WjUAR9sO
X-Proofpoint-GUID: Ul3ySkKUYqmaTfuwv7cepK75WjUAR9sO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExMSBTYWx0ZWRfX49cSz8/OrNdn
 lZHx2Abq2IT24z3KD2c9l5y+canfVHEKnM3r9rKlaN5n48k4Pr/y5YA/ruMfgjfki1mTt14rC6u
 JytxeY57D0++6E+P/IWOqB1WYCxQrq162AYNXkYSiEnERjzlqqz/rGUsoZ9XWa94RzRZ+U2vh1N
 YEJvz8309ySQM1FLTLDyoB1Jlyowv289DexoEhTe5dAl/70LgQsU7T47ELAEPHCLOkFw9mYk+vV
 S0rAT3e8lZNOEgzdwhptUWXpooQfTE/xklR+xv4Oy8yewGPxopyI61ukwJvw9xrDb6+K+oakcVL
 Wr8UmLE9u+jaPTDrbziz8XI0cUV7WVfL/HFaiEz2ZDHm3Xfb3lU2kSQEc/1AyyMbIKyNXl5msLn
 TkQGxGy9aUvzU68CbLNBQNU2FmgJ/VqC41lQOJry+jmVpl/Vuv6/GqTxPDoj+6Oqo1mse4TauAg
 sqDVlv78qZg2wqxPRhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92297-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D613510F8F2
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:02:37PM +0100, Loic Poulain wrote:
> There is a small window where the device can suspend after
> pm_runtime_enable() and before pm_runtime_forbid(), causing an
> unnecessary suspend/resume cycle while the PHY is not yet registered.
> 
> Move pm_runtime_forbid() before pm_runtime_enable() to eliminate
> this race.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

