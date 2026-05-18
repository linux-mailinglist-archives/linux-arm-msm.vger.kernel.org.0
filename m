Return-Path: <linux-arm-msm+bounces-108186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGElLxf9CmqA+wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:50:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3634756BF65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A3943028377
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8038C3F7860;
	Mon, 18 May 2026 11:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7FaMvne";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGwJpXqE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9203F44FC
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104733; cv=none; b=D+5T71km7dkmwOB9WBLCX84xuXCiyHKc6xj4ZvzC4s1fA0SwdBut2Qf4cj+rM1CebwF8wGM7hh0G1afVtHIwI+Eb3zOvKUIbsKzPsmuOBy94+G1uZSp5zgATttGhQhAViuR4+lMUhk4iaWnkUTGStnoYUDbzJABrzGxaAd5Ri/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104733; c=relaxed/simple;
	bh=9t7iVOOI+UxQvm/pVLW0wCjraZfj91isgU9NMHTFucE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJBE6pBAlZZaKnD/hgCmm9KBTWOLLm7PzadIlRGBi3U6OgwuqxT7jzH+95cSkd3TvvicDJjZ9+TFJNh9VK45geeqEJStvclvNOJoQMlb7GNMDG+gUf23c84ue3jTTgedzRryl4w6NSBAsA8Xt0e9nkIx8ZEmBjcLjJE1QfFYLhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7FaMvne; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGwJpXqE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7YfHk2333213
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CmR7UGnplXVXf6dhWEhuPDxQ
	neGsG+WELjkD/IvH4PI=; b=O7FaMvne7gZQizSB3tPGG9dlpS7EwO3kO9DO13iG
	piEPch4CO577PgXnH0z0veO3qTibsdWc43XYZnop0J7xp0gJVAXwyNLYIcqRPJ8r
	TyP6Hyl3NYtoPheTcWkcZYct7z5tznz89HwBxw84IK+/hS5XJzo4LRjXOKQWanQD
	9D47U0YeHh7QXHO3oQfoTYUwHW2cPiwkeZGw8e5gZY7iWj23eODh1mU4hBdaCLiw
	YTo2D24OGkaYxAkX2O0BCseoIVrGUmHj8oUlGXTFZxSowzYN2B3V9F0NkWSxEUjv
	7AG5PsLrWESnCGraVodWgWJRtYJ7LQ1c4BX0P2givXO6lA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qea7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:45:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-83ef22f8e8bso1413542b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 04:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779104730; x=1779709530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CmR7UGnplXVXf6dhWEhuPDxQneGsG+WELjkD/IvH4PI=;
        b=dGwJpXqEjxQMmppCvYtQhtbm+xpeK3FRzzqsSRTdJGEX1iQc8PFrq2Ukfw4IYMjwZj
         AaG//CY4rKBTXgSk8kW+OdMeco3k3AdZuxKwt5HaXeZf3JYNAR/Z4Igx2FvSoBd+2g+d
         CU0ZvgtY/Jd355j+bGaxuOgHoAwFP8bjRmZETe1ke2AdecR6jtX6Je6fGqQ29F1KqMmH
         /9ewwgX6PEdNmyJNmg3JPdBM94Bidiaxx6Fk8YWaNEkXkWejIMJKiq8mSjbdesYyrSA7
         BQXk0GJP9pGhmCE4KA6q2MY6w3xPnZWHIsLglMJ9BBnQfOI52RMV4WYfVKEoONRgicWJ
         guJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104730; x=1779709530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmR7UGnplXVXf6dhWEhuPDxQneGsG+WELjkD/IvH4PI=;
        b=evjsGymflc56DiWTSoFIgCo1lurZ2cclOL+/F8mSoh/fJ1wqeWQd908a3bvc4C1Sw7
         jKwHJGD+YTmzuoxtcPQ1SZqFKYkhWhyrcrZhnncqRy+EgrSeNC9BFuu02XBb8aCL1c6M
         /ioi0xiuXOdqMw41u90eGCAlN8LadonB0o9P0+pji2HcqLMFaqtpobEwOIfOQ8GoJ60D
         l9AYrvlhftU128rjRK0YcGK2aLnSCjitz8S5XQcSa6ZjIiMq/HYB3uwOZyfBpPIcTe4k
         Bv7PrFyAbM031xFkxjE6Fu1LFZ87ZnXtxSNbcVf0wxJBYfmQ+p8cSlhObZOUw2H6QSwo
         LN3g==
X-Gm-Message-State: AOJu0YwGRFzuaPHZIBqyekujpeH+W8vdj0xzqI4aeg5Rcfiq3fs6jAlA
	SRLZaEi75vrz25vynzoVDNKzxISSv1jItTIoRAude+q/JyyIZ/DM7h2n8PDvv4r/PQjjwFvJe5J
	s61tbAuV/apmNe+/fXunVUEq3CIcWQQOB13URindwElhiVHC+IBZi4bWdU64H7Oyme4Jv
X-Gm-Gg: Acq92OHhn63fAy25AOgeDbpJtd9dTybQW2N9aVJHHK5Hs9RW9d+mh8nzGwR10OSxMZl
	9Wy1PlPyQhe1PgYzhq10Q5R7SHak00oidMHWDgWMQSXtO4VBatUPvY0sNCXJpTWgZDXB//7BHQn
	u3DtObcwiJM2MMg5loK2/YHr/uWpfpfTPzjoB5AuTSbX8iFWdjE1ox8DuGnxaoo04bc+2f0suKv
	YZ895aEVEruuboJe83FIA2RfAMANLDh6C+vqows5yOF38D5tcRAWNedYyZjOXXFc5xO7WntpN2p
	cXCz/Me8qBF22IQDYQmopmhIt/qFikfbi5HM/9++ZVRsegsuOcFIuyxYcpoCvH/Vcmu8wdBy62l
	5nMbqBCe8kijiKBQV1SxkYKnYgilyB09EJT5Z4meh/YOl3uT9
X-Received: by 2002:a05:6a00:12e4:b0:835:405a:7e68 with SMTP id d2e1a72fcca58-83f33d9dd83mr15071390b3a.32.1779104729877;
        Mon, 18 May 2026 04:45:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:12e4:b0:835:405a:7e68 with SMTP id d2e1a72fcca58-83f33d9dd83mr15071363b3a.32.1779104729357;
        Mon, 18 May 2026 04:45:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm3984653b3a.48.2026.05.18.04.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:45:29 -0700 (PDT)
Date: Mon, 18 May 2026 17:15:23 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom,cpucp-mbox: Add Hawi
 compatible
Message-ID: <20260518114523.kll5qlwfwu4esnf5@hu-mojha-hyd.qualcomm.com>
References: <20260427182412.3666971-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427182412.3666971-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8pxeWvsmMT9upmmCGi3wOlzgbLmb1Hij
X-Proofpoint-GUID: 8pxeWvsmMT9upmmCGi3wOlzgbLmb1Hij
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a0afbdb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OZ16uQIpaqB3DC0mcKYA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDExMyBTYWx0ZWRfXzVOVHyCyuar1
 Pzwi2rdVwk52J5+VeH9DgfeXUNnSTTjFzz4kRvtlVsMjc3JjUewDI/RPWdbNKBNnz5ve2nVF/Lc
 rSkFdhy+xSBO2MDlZmphTToe0e7V4Dt7S6InUpC3ENfbHwJK7A1sSrdJ7jJa3FReQTKjehZHf5+
 3dJuGYEwbxHeXkWpQqqpCRiul0S9BGvksxqVKshqBI7X9iyknLs99Eb0MFrqu6N9gXR8hQKedtc
 9rggZpxMQPTOklFEMOK3NLiX1dHi4kDGvBx7Ulv+b+TbpspGhLyRmEwws0HOIOp8Jzm1kMy8K9p
 s5V00sGrCmMHV8BFjibdLRS4o/R4ueAvtIzZQq0quw91e3upIQLg1kdhIhN3WEyH1e+M480hpda
 s5icSEUFFAU8t9pDafTsQAHUhm7VkVmrLN9qgxAVscvPKDasaV+ZUjky+Kr6tqB77EIqqy4BU4A
 /XmOkOGmleOUKkVPjNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180113
X-Rspamd-Queue-Id: 3634756BF65
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108186-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,hu-mojha-hyd.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Jassi,

On Mon, Apr 27, 2026 at 11:54:12PM +0530, Mukesh Ojha wrote:
> Document CPU Control Processor (CPUCP) mailbox controller for Qualcomm
> Hawi SoCs. It is software compatible with X1E80100 CPUCP mailbox
> controller hence fallback to it.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> index 90bfde66cc4a..167ee222a163 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> @@ -19,6 +19,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-cpucp-mbox
> +              - qcom,hawi-cpucp-mbox
>                - qcom,kaanapali-cpucp-mbox
>                - qcom,sm8750-cpucp-mbox
>            - const: qcom,x1e80100-cpucp-mbox
> -- 
> 2.53.0
> 

I am just checking if this can be picked for upcoming merge window.

-- 
-Mukesh Ojha

