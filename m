Return-Path: <linux-arm-msm+bounces-115861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FpgkCjcdRmrVKAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 10:11:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1886F4A1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 10:11:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L3kagdsU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QOjF+9dJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115861-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115861-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 794483004251
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 08:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F11409615;
	Thu,  2 Jul 2026 08:10:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FD83D0927
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 08:10:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979835; cv=none; b=MMONH5+gjjcW4WgMtf9zmngY1zE5H6wb53lTOKJVU18J7c/rQcVGDEaJdyNiLQWtEBh1EXs7idY5Y2KpkCwT4c2iw8Qh9heaMPfZ2YmlldsXQZuDUnh032Dt5YD0QiEN/t99Q6v9TAd5RdTh8J/yCEeN6gooJAPj1RxcpiHwTMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979835; c=relaxed/simple;
	bh=Hg5WI0QJ7Y4hGTe9FzJ3p6JWZdFXs9Zue8ON4Iz2VG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRtLKMkTSPIPHGFClQ53rIWULbGS30g2MG0C3YMJY9BgGbT3e4bbahTg/Ir1ykKYFQxgTFyYDN5WTO0cw7Xa8tZBZtSrJhceaua/K815BaGeOAnyrKEQWJVcMHoeCvXGV+j9NfuSRUZPKhprf+cF85J8t/gUzBnvPO2yjl4qb5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3kagdsU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QOjF+9dJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KFTC3067557
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 08:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jumk73yfioQs57w64kWuCkPZ
	i5F1fvZFkxYmCpBQMAA=; b=L3kagdsU3Qo6lnMVpp9VPnPm6iEvwTaJIAtMQpUv
	IQgwJLBubtnR3ILZDn2+OA97ZUZddspEawMm99VbpzWYk4lMDJbMSfwuL9p39by3
	oy141qA6IHSgNIRiBgzDb0uYs7ejcM2yJxFCNCF8YNpov1sIp3b++klp16Tcr7GT
	du15HAfdNAE1qbiEC8heX7FvthC3LG8NMVcOFsbyAHSBD47luGx47Uxi+XoXgFWp
	adnDtLjx23eugxvhM4sHsQBUPt0PKHz/Z4YxmLXacN/4TKkv3yMtKKm/gt8v8pms
	eRArkGWWdQhqLh8Oki4nKh1drhph6mymGNq5Pa6LjoQRHA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510amj2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 08:10:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-380a638fb5bso1628953a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 01:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782979833; x=1783584633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jumk73yfioQs57w64kWuCkPZi5F1fvZFkxYmCpBQMAA=;
        b=QOjF+9dJZfvISHKYicJI5Sg6H62sQWK1gvPY9mVvVYRVZS0CppOl+nPPP8bsgWDoKn
         gaqdAT2urRLq4omx4g3mBun4OHE5PMfjqcrYB3qMZM4epCqyjrvL1ZnzgO2KpA1LHXQR
         RiK9Q6Rwjio0vechKnMbQyD1WjY787olct3Fi+UtbEIW4zOchGqerQV2peysIyREo4yC
         ddfxMFnvvfdgTW+f7cDZA/7B7mBQhPS6cA+c87DmLYeh7XDMC5KNsHy/dHApDU9joRuP
         BDTCDAfVEk0A8B1lje+HHyYUiP1wGrjYIERlL94DkQYQuG4r29e9yqB4sMlCK2GgX/gE
         flqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979833; x=1783584633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jumk73yfioQs57w64kWuCkPZi5F1fvZFkxYmCpBQMAA=;
        b=KFVrH3jKCF0eSUl3mN4M7GzADVPYlxvWEtHjF8jctnJuPX1QprmJXzD0cY3NOnJZCW
         z5JFdTYS3325VZjMV4n20kMyG4fjOBDmiTTqRGJ4cfrFjWEDiXgk3jFjqiAg/qIq+yHV
         rhI8hGPfcift/1krVvRaFkPGwJTjWKsvKFlAHgKpMf3/j+j6jXA5TAwsTNFTPKRBoD5Y
         37LO5qSai8inuXKpge7QMxbc/JjUti7tHdaz3Ib+/pCxIOtL86Yns2ON4Q6Im1CxTbyE
         wSq5UJCrBQ/2wGuGYt1MwXDBhxKLSAMEGfNdJZPS/DIMvG4uEY2RxQ0J520TyqkKRQ81
         OoCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrrSNBFRvwlZOUqXDN7ucxxSNwra6KMiBXb/6lIbXTQn9B2y5h0SFUTrNH9e2C1JVj4/fexeiMretNUNi2+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq9uWA8H8STYCvombljYmUMwYas1zykMYOhIYgskt5+x8hp6it
	h7dQquH+JHFZXA0fJg+fL3HmUnAPRthf7WOT2mWYWT0HUZewIEjB+d9Ag+8rik1omGQb/r97PkL
	aXywIHF2s8SUuI1lgw4DkpAc3gvQOr3sFVa1bNhvlWEdldqMb5gZeUZruNbZfkEtnNocbFfag+d
	KU
X-Gm-Gg: AfdE7ck0d5bhQGc2U2TKr2jq6zJo5CN4hPyF0R0OEfhvScjikGSMUQcViAcMwo3JHJV
	z4DEVWlTlZN8h/mvwCkNsWMlHsXElRghL2/vjnQ3NgcFjk92uOZ2/mJedh19T7OCpx/4HN9EzF+
	CU42q+DFhxJgxj1tCSodmMTewuKTLLWQHtgJyzslMkiNu1Jhu2bT1Qw3KlsfS+sAz0RPzwVavKc
	7tsb/lclKj6UT0ddstVZXugOmeRQKeel5PizAFU0SxDHmutndlspPoeOq5ggGHO/8x6AmxVPL2R
	RKtwpXLoRvrtsbyzrtdQDcxofbMl+kOLCH8AHLXgAkwWeSbJQNLqtGxlJay+Mpx8D3iwSJSJGUU
	FeewLZoH8O3u9bmG6Gmg5jjleb1pvagzraYMuXg==
X-Received: by 2002:a17:90b:28cc:b0:37f:9ce1:7360 with SMTP id 98e67ed59e1d1-380ba961e32mr3948178a91.33.1782979832751;
        Thu, 02 Jul 2026 01:10:32 -0700 (PDT)
X-Received: by 2002:a17:90b:28cc:b0:37f:9ce1:7360 with SMTP id 98e67ed59e1d1-380ba961e32mr3948141a91.33.1782979832169;
        Thu, 02 Jul 2026 01:10:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb80f5csm9111701eec.15.2026.07.02.01.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:31 -0700 (PDT)
Date: Thu, 2 Jul 2026 13:40:26 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] firmware: qcom: tzmem: guard against IS_ERR() in the
 cleanup handler
Message-ID: <20260702081026.c7rzopcn7vypggjq@hu-mojha-hyd.qualcomm.com>
References: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
 <20260701-qcom-scm-code-shrink-v1-1-02f5ce02c95a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-qcom-scm-code-shrink-v1-1-02f5ce02c95a@oss.qualcomm.com>
X-Proofpoint-GUID: nLCWv0QDnzdxgZ_zuqtZT4Yt0yNi5SSb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA4MyBTYWx0ZWRfXzctE9dC9Qqsh
 KirrVBLSYGaExsSl3oCfM0BU5bfVbFY1rDT5wBik1yiQjzq7RyWqE22yylkQFSIsV63iTNABIDK
 v7y9qlbq8XkoWqNLMnRPJbT4nOgek/Pb4RXtiODB1Ec3WSs2NG37LBPUAdQ7i+Rjf/W6Rt5utyg
 aqENiaIya1hbMX8x2zH+24ykCLoVEPA0rwovRd1oK5kW9Z+J3E89W/Fskv79fHVZWNUoHl8H9zf
 daM339xFw+TG4Kq76EC5UJ7PQrr5kcaMUK6AWJLDJvQ8pqb8biN6pKgzRNSM2wstLHQjWrS4mGe
 W8Msz16ecwczTZ/P8Rm7YotcC6JZv7P06B87x3adkMCOz4a/QqIza/QzioDFr54gnL2O58yPH27
 zbFy6qYAi1B6LUXtNme0LkGuGkXgV9HH94zzquFO0BwV7BwZ6SN2hyHLgJcZa6LhWxq+cbkuZur
 8oHvRa5Kk+PAeXQo/Lw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA4MyBTYWx0ZWRfX4Ot3IshWil+e
 uGmui/kAhCiUnzGyBkur8NEdgIlJ8LcSgyDeOMlewpDhUwj81k6x1+JWgpvW28KciRBoQOgZ2C1
 /el774W1dFo8fUcmM5oh6EkZnHunzHU=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a461cf9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=0DjZ3pmOFIqiz3DhSLkA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: nLCWv0QDnzdxgZ_zuqtZT4Yt0yNi5SSb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115861-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E1886F4A1A

On Wed, Jul 01, 2026 at 03:38:55PM +0200, Bartosz Golaszewski wrote:
> We currently only silently skip NULL-pointers in the cleanup handler for
> tzmem. It's possible that we get passed a pointer holding an ERR_PTR()
> value so skip it too.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  include/linux/firmware/qcom/qcom_tzmem.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/firmware/qcom/qcom_tzmem.h b/include/linux/firmware/qcom/qcom_tzmem.h
> index 23173e0c3dddd154dd56dc3dcb56bd20ada0520a..b5520178bf6f53b86b530571a3be9f302225f022 100644
> --- a/include/linux/firmware/qcom/qcom_tzmem.h
> +++ b/include/linux/firmware/qcom/qcom_tzmem.h
> @@ -58,7 +58,7 @@ devm_qcom_tzmem_pool_new(struct device *dev,
>  void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp);
>  void qcom_tzmem_free(void *ptr);
>  
> -DEFINE_FREE(qcom_tzmem, void *, if (_T) qcom_tzmem_free(_T))
> +DEFINE_FREE(qcom_tzmem, void *, if (!IS_ERR_OR_NULL(_T)) qcom_tzmem_free(_T))

Is this really required? Are we trying to address an issue which
does not exist today?

>  
>  phys_addr_t qcom_tzmem_to_phys(void *ptr);
>  
> 
> -- 
> 2.47.3
> 

-- 
-Mukesh Ojha

