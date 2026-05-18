Return-Path: <linux-arm-msm+bounces-108188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJNqEFP+Cmop/AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:56:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D611656C0D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9CDC530CE410
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6DC03F39C0;
	Mon, 18 May 2026 11:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bs+eh4Ha";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FxRPWjK2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6263F6C47
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104981; cv=none; b=mlThFzVLE6PwF747eqTYzhlWBWQvTrF+EUjvF5dRYlLFewDkFaR4l2ydJUt4iZ+eBCnYNyS9/67Hq+wNVKfF7YUGdvBKmQiYRB5RZybHgVhdWt38NoBvByoUI7RJZUMv9Sgh+OTqs3EFtc+jFRsRfI5Y/l42iEn7n6I/Q++Utd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104981; c=relaxed/simple;
	bh=l5f8SfMk0HODWzWCjI3H1ZlSl+nLiAlJOsvBVqtyL/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwWc2oaxcMKqFYitRLDyq1GaIKrcD/D72yWYj0hNRAnK69HTICVUtlGxZVJqULiu5PijTdnVnQOYV34S1TynlUEHy9qFRwo2ts/2HXLX6bJ36s+3xxdp0lS8AzM5sz9Obmy5qjtBD5kgRXBjRcT3CYN3IiDZSnMZIyY/arXQ84U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bs+eh4Ha; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxRPWjK2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I9mgr12216526
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F0BiEN/sNtTqPDa1PtFNhLOF
	abpHae6776oegoTycxo=; b=Bs+eh4HaSM7xH5fXW9rCZf6q0+iTV8dQSgS84+UC
	i0uxu4mxDnEIHubxq1TA8MxDix54TcgvbA2WLwJvywB1947H6Qw+n+vgbO7goR5B
	R0McpLOscnwucfdk0cGBHD5/TPL0ZkyD0RX40BPoNPNM+9rkI6Yaw0zjBGdjpTxw
	9cJJVIRB3TzpEpQ+DJEWeO8Y8nKWnpy8PmoE1SZYcKaBvRytL08FMHESSdk+5V64
	X0g0hHLn4nh82sRpFmX3NvUyVYbvcj38aWijQg1In7jmF7lIGQmrKgD6euebAxZe
	JFus8vffIJ8pcKEsMkQkMQn4J7pJXtcCz9OgWVUtYf1EOA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7x7me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:49:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8276c91addso1049611a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 04:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779104979; x=1779709779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F0BiEN/sNtTqPDa1PtFNhLOFabpHae6776oegoTycxo=;
        b=FxRPWjK2db25fwS1eRqhPpy/HPhb8vdYdbR+aAWK1t+xA9dY1/sjaH8fFZdx4O7ZZI
         cfS1zeBNQZwVIp2jFi99pBW1Q1jSK/GO9rB8lk+dUETx9MDk/AWjLza2tOzkCJorxcS2
         vcLxCioJuWlRRJU1uDMCp2Wk0dVEqRHlodFgzRlPkdHFUouy9Mdc5L7pdVGv1FTnwhNm
         dxLbI/I0wR+3P0k8v1lshRKRPOvo/w8Ol7/IFKz70TrMqfJq0XoWDfiYiVOJk1S+I6pw
         yKJfGfKEJPfS+5N0h6u4C4fJZBKTWefyw9OAmiQdE5ggCx3XmmEiqpJ4X9fnBRnNYwnM
         oCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104979; x=1779709779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0BiEN/sNtTqPDa1PtFNhLOFabpHae6776oegoTycxo=;
        b=iPli+DdYG4+VgGGLN+FTBDOlUEHSjCZXJilfFcmAtXwqpvU2CUyPqnEuQYhDUv7RqV
         8G5yuFylVp3VRiLX8Y3ngScRY7uxV2bNyWQpGFZx20WsJe+g8CQX14pFK5agzepowvlk
         o+hrLo+s0uU6XN4o7iFzEvyJ1R1sybDeg6wVDqkSNeiwtNsSU7RbhPsWZoROXfOo2emf
         3gXi9mkRASJXhMYhIzGB/Sep4Ngb52X0iegY2v2rjGCHeGN1aXjGt2l54c4y+YQyCwum
         VlmiDBV1KhtGD9NUvku45wJoBMDdlH133BVNBeSk+m3yufxSgJ8RdCogaxirX3PzcCzR
         3rIw==
X-Gm-Message-State: AOJu0YxB9mUR+13+uHtZgwq+dbrKeRdAAhTgM5C+Y/UOZhLPhm7SrNym
	t1QLBc32iCxY3ES43Zlb+b+6drT8dwPrQVEgE9V6no4Wkcg82st5FQant4h0q5lB09aH/amtS4Y
	i3g5gzFZ765r8w/cHcTSaxXe5nu9piAkKJGnyiVmCXiwmbWwib/WY/c0/vqul2lDuHjgv
X-Gm-Gg: Acq92OFvZb8bBjJZ9U3G/F9kZGZQrot04KfmSTaE1WSL6IM5mtSYLNexR/IxrQ/RhjW
	MNOBQcneqlfXouUNTrOJKk7WAmhzWTrb4oWyyBAC1KR+xDiuXjxXoiXHqRvWwQPBkAPSy38wONB
	03t6R55m82votc1BdqrYz3FuxHkyCuPnOrn+FzGgEYb8tEJCEIMvJqDs1DtFNnaL+zVpVNjiktX
	mODSs32gXAY1XNCyXrM9I9Bnb3s+PZDUyuQrU4nFQ+DERjEtD96RAVjlnuQkXrXGvmkwRTcmDi2
	A/dOB/5ByrTIHXLqtj9CkXjnKPlvSNnKw2EGK3eZC6o6wAG4uChDZoY1SJ1mgAr4WfVJ29KDy0X
	k/3uiVcTL7gA0vCSdVsqqOY/NMtsXQPBDJs5HoRGLrZGuNECy
X-Received: by 2002:a05:6a20:12d3:b0:39b:89e0:2e2a with SMTP id adf61e73a8af0-3b22e6528bamr16398257637.5.1779104979086;
        Mon, 18 May 2026 04:49:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d3:b0:39b:89e0:2e2a with SMTP id adf61e73a8af0-3b22e6528bamr16398219637.5.1779104978556;
        Mon, 18 May 2026 04:49:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07b007sm13179228a12.11.2026.05.18.04.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:49:38 -0700 (PDT)
Date: Mon, 18 May 2026 17:19:32 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: qcom: Add Hawi compatible
Message-ID: <20260518114932.i5uzdkraf3ividue@hu-mojha-hyd.qualcomm.com>
References: <20260427182618.3667963-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427182618.3667963-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDExNCBTYWx0ZWRfX5zsOuXU9pCI+
 FOwxUzemkUNCdvEygx6RrrwMB7q0Xt85I+2c6oZbYo1ofjDH5JCCoIKMAHxiWpU1LRCYKRNXwMF
 EZY+Dz2pdTByKZCtxoUujAwZdkCRpYl1SI5TfO5grp2/6o96nrUxqUVs2O4/W0apITSDIzAfxHx
 isKJDvzFr1FhM6m9QLSfHbXmnON5PRD0l0GLrKrz2NZ6IdyHnjCSGnFSclYrIjaXocAYXlFOARh
 2aXlpPshcCZRxpW3oXC4hHEU9lYtjjGaqA6NdqJNOyzqXm+0n0WzRkto0Y12x6cnAqbxRYbdj3k
 vREO2MFWYmY49KvfbMJV4jLSFB7cXD/Txci00JHKzZW9HplLhAdOyLpT/N6wHQnyiS5JY0jtjhj
 vzPmV1tUhZKd/Hcm12UDn56mIqfhR+rIUe09Wn+rIbCfRGFGN93HWPqh6Cshm+gNmkbYhYS1ExR
 YIs59qhaT15dv42sczA==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a0afcd3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yRgZ8GWW88Essw8HruoA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: j9nCSrv72E1QRmvwK8LiMKEZZHQI9r_q
X-Proofpoint-GUID: j9nCSrv72E1QRmvwK8LiMKEZZHQI9r_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180114
X-Rspamd-Queue-Id: D611656C0D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108188-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Apr 27, 2026 at 11:56:18PM +0530, Mukesh Ojha wrote:
> Document compatible string for the QFPROM on Hawi platform.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 2ab047f2bb69..6117dd1d24d3 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -19,6 +19,7 @@ properties:
>        - enum:
>            - qcom,apq8064-qfprom
>            - qcom,apq8084-qfprom
> +          - qcom,hawi-qfprom
>            - qcom,ipq5018-qfprom
>            - qcom,ipq5332-qfprom
>            - qcom,ipq5424-qfprom
> -- 
> 2.53.0
>
Hi Srini,

If you can pick this up for upcoming merge window.

-- 
-Mukesh Ojha

