Return-Path: <linux-arm-msm+bounces-114961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BO0pLXBDQmod3AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:05:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DCB6D8A37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:05:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GsP5MDk0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Pt3mzhpz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114961-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114961-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B162D303477D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADA33FE34E;
	Mon, 29 Jun 2026 10:03:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2B53FDC14
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:03:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727423; cv=none; b=qqUChjYzjydkVy8VpFHblYoF1LnLmCuDxeE9R8YbiU+crldMRiUwYEVmwvRPTvItoGNVYsT9AGZqG4r5PhV/65rYsfR90mLqI4rMs79/Iuce8D5raS+i1maIPbDJdQv6ifu04bnLU3vZGIjXG454wAMJrnn450dRaMuxmWi/jZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727423; c=relaxed/simple;
	bh=4hEbbYpzi6ELOu6WWiNKsm97Qe7N5Zo4LC0qjRTpqiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IvRHwOVi2r/ST+BN2DwxDDYXr6OhrNWG0wokPSTo1G+5A77LHlfL24r2Jv45hQmdbzEKyQakKveheRD+KbOrnk1Brw5KylP2pXvhQZSbwhjknuWw35ZcGMhzsXnbSFj0gFKCVO27XBno/Wh6RrUAXZd7C4N12YlK8NUJMRRxams=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsP5MDk0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pt3mzhpz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T72ZNW2163894
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PYHNWcfl+oUcCDN6S/9Tc9R1TgjQaE4yesMb6v+V/Qc=; b=GsP5MDk0mqHQMzqj
	N9852vyZKCbZIehNPASb9xBdchuJObEM5NdxqOgwSw5ATSuvVXbR+ogtNdsFpbTT
	oYMk35j4nYHgQGiCVw28/H5USPQ400fnMTT9hCusy9lHHQ7UeDuCAWnuaBBFarY7
	8qIRGvTMFpKpzCIzKcULapv+h5wyv2iqsjbGVfj9STEqBwkszIIx7qFmUAcWEFvW
	J0orUNGfr/8+ZsIDciYFmmj/KscDNx17HflWmyhe/JnZG59k9J/gvNMbKcq5Jkb6
	KTDnf+bUJOhkYMGBCno7zS2Ifw1b6DrKcRuQk4gS3kpOUTar8QfZn+sM/32zeeK7
	N+HXNA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjgr97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:03:41 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73966c839bfso11215137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727420; x=1783332220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PYHNWcfl+oUcCDN6S/9Tc9R1TgjQaE4yesMb6v+V/Qc=;
        b=Pt3mzhpzaIHBIJ1J//D7N474/zjVdYp2VCFYKCm+DpbhjFYPLVwgYQ3PUG7oIRazuM
         6V1Dj3oFj2uy+NF7/dYi5y+gVVWq9PD00jp/Fi0LMjgzGrox5lHJSYpJjRpk5/6sqY+1
         moJBwvHovcYFZaLZDAMwO978hGdiKsoVN1w8TIYu4hjwRNV8hYceRR0SdbEynm07d2Vv
         QEnqWoO4Q4GMQjFN3RQiRd/p13ZovE3FpSAqL7he67dXVSXz7BNC1h1rZsQGs2IlOJAm
         9MCnPcRkRwqbGeyFKS9/GX97IvNuXxb4UC/wSt9HTjtMPJMtTNcHAT/PhHUCILSasrZx
         VOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727420; x=1783332220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PYHNWcfl+oUcCDN6S/9Tc9R1TgjQaE4yesMb6v+V/Qc=;
        b=nuVs8Pk7EIxIAINgcZEHWM0dnvJ6UfL3BPDTuMsNAd5nc96/hunSb50ERCaAp1XGBs
         7uoogzkAF4gjpyZ1gAq/UtZ50n0sVAUsoGfQyeYAqpb/rqoQS0iWHyUWtGcPNv1LX2VI
         Doy5nLxkRwvGqJBFg438uST2x0ERlPDTCtqlvMHk5NS2f4l6PHHleYwqUj6qn1+9y0Pl
         zLLcTqwAQFWpynm6SqPaYIWvFURv++nWXHT4gUyxASc2gLJwgdyAV7f3GNM64+hIFK04
         sfBDGzoUKfV96Hj8YGYG/jAYk1iVKtgrw2F9cTTrV0P8ilykIVFJ19HDdDNkdi9+5HaH
         oqGg==
X-Gm-Message-State: AOJu0YxpmPRdwDUfwzQAFfVJsA+8tLjr7xv0ha1trX8kPrJtXU77uJh1
	cx/9AzmrErJ5X0IQAvR1jA1/hvziCz/NgV6OHJWgQvG2NIMGS+6/vWjjspmPNNH8K35Een/ayTC
	oDbLNuUGTzPlSger2wZMvp/wSS1dKye9xPWkOySQcpWkha06nHtr+BYxFa2k844GDPv99
X-Gm-Gg: AfdE7ckA8SUrs9mOs7dy5zaUFNFJD/YJmpJ8AicYDvIwL84l0/ccFABcYOwhVJ2ZZ1d
	uo5SDCMCmZaPc6jtGI1zVVUtQmoYMwENkJoK2rkUYnT3axt7ANAaW+tEiRLBBUfqkqZzIZJg/3G
	Z3s2yODoFkTqGCc7RxM6WM+gj86Mq0FQ4hdprOxINpgwzl2216kcvilu7CyyPk5HD07nRwc+56A
	yDAaqGMjnPP5PFZPRwAtjjY9sk4GLSdgTolE59+/+gGpPpSQf/+nses7OWdL6ljwg/kP/4YQZz/
	VKNIp4oPFsngHpipSnIFnKdt+vr7g6tEtBbHbvsXFUhAIIrGYH+OGQz0JiEhM18+RMOD99+2CFF
	hYoab6cKUptPHe6besRRLnOg4/3a6vTmItBw=
X-Received: by 2002:ac5:c84e:0:b0:575:b506:43cd with SMTP id 71dfb90a1353d-5bd912ea4ddmr712002e0c.1.1782727420544;
        Mon, 29 Jun 2026 03:03:40 -0700 (PDT)
X-Received: by 2002:ac5:c84e:0:b0:575:b506:43cd with SMTP id 71dfb90a1353d-5bd912ea4ddmr711997e0c.1.1782727420123;
        Mon, 29 Jun 2026 03:03:40 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6985f30fb31sm2132833a12.21.2026.06.29.03.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:03:38 -0700 (PDT)
Message-ID: <1efac6e5-b4af-4c48-94a8-5e55cee0a864@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:03:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] drm/msm/mdss: keep mdp1-mem interconnect alive during
 suspend on SDM845
To: me@samcday.com, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260627-rfc-sdm845-interconnect-collapse-workaround-v1-1-608a38de3715@samcday.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260627-rfc-sdm845-interconnect-collapse-workaround-v1-1-608a38de3715@samcday.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oqFXU-aO2Ga2myrsXUo0fHLzzRVV18Dv
X-Proofpoint-ORIG-GUID: oqFXU-aO2Ga2myrsXUo0fHLzzRVV18Dv
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a4242fd cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=lKQ-AihTAAAA:8 a=R-HWJY1cPxioPo3k6UQA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=K6G5NyU7usMl-irPePdK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX89jGqoN8BDQZ
 BEz3S8adwXiWgOu6Ze+TC5HX+HEcJvrG+aY8u8fVnDdNAWgnZL/9EJHUML/qc/+LpJcueD/54hW
 QtuiGqFOkjKym+S6Py5wX+qk2hPEIqI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfXxH+pa4h8AJXF
 qrK/gpgBQUJcXoduJ70I44PT7beKbV3zWkVjgLAHTJznOu9rH7a/hzmEmfQSDdvFj5KJ+RiSl38
 j8yEMyllt1Nc+0J19ZhJTloc/95Tm/7VTDW/Cc+BmGXfE8N/4svQPFpDiJFwgmzVDcQ9pfDkHZO
 2GDFvKAGFl+jbwnD1mdzVoKUwEqrmuTBvbZ9VkBVlXiO0E+pqpM0+LskV+lvZKiPAmVoy8ta31V
 xcgMce4rsLUP4p8e36qWSrFH5U9mV0BPlKeUlkX+Fh/D4ZXlg575DlwXJlgCcVqm5b4nnMdGkcf
 pA+UrjQPi1Zx4NSMZlrRBOZxvcfqYqeXt2xs9JNuEZQdXJahlaEyz7x9ijH6GXz1FSt7Nd1q5hs
 fJzFhq4h0Q1kv1JxZbN2b2GxtTpdSZRHnKlr2nqCegM3aNfoYjRFWZp7rP//gjQ7YhRTOR+WdGn
 2b76pG4YgL14/4T2TWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114961-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:me@samcday.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,samcday.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[samcday.com,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56DCB6D8A37

On 6/27/26 2:18 PM, Sam Day via B4 Relay wrote:
> From: Sam Day <me@samcday.com>
> 
> If the peak vote for mdp1-mem is allowed to drop to zero, it seems to
> cause the fabric to collapse that path entirely, which causes the device
> to bus stall and fatally reset.

Which fabric? MMSS_NOC?

Can you experiment with setting keepalive = true/false on bcm_mmX
in drivers/interconnect/qcom/sdm845.c?

Konrad

