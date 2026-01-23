Return-Path: <linux-arm-msm+bounces-90379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GyvOVLHc2lZygAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:09:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FB57A057
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B2933030B26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A721276041;
	Fri, 23 Jan 2026 19:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NfOUlXjS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QyQAbD3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885DE23BD1D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769195210; cv=none; b=jiHR9kw28xMTAQLgRrhuWcUy88mCPcpObodD5EIu6j5nstQ0zeDHRkeQoDjigZK2CH20ofxifImwnIwPCXssR1SytBFI2KUJL60VuGym/cOMJijSVn7GKyeKLL/4DyCZvfMI8gVOc0cN3uSKB9XDvZfWIBE9EenHvFS6NCVpPB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769195210; c=relaxed/simple;
	bh=cXeKyQn1zrB0s/g/Zlf2fCZzGKuPI1EYK4pmTBNpp38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dhm4hAhs2GMude1jEKk54x2lyr6Qx23n2VrJAGQsXToKYwugQONlCyC8pgLoBiCi1RrNH61YXNFSLbCSbn+vO/jiwnTgw+Y6FabLHUVUuJBjpGq6Nka/fvnI7+0MZX1wBAl/Hk1hDUVtZ37ZX91+JrkpyiszfLklLDYGfSjHAuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NfOUlXjS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QyQAbD3D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NHF2dh722645
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qKhvdckabX5eF5ZjxFIcU92u
	hukFwsWBMCWJkQDEYrU=; b=NfOUlXjS1b02dU7qA4Vd6KoPlmWdROeLrKf/AoBX
	anCE3dDq/U275V9JxV1ZPImmYe1Afub1vklQv3gjsEvuMR6XQ/2wrm25fholb/YA
	1cWRb815a9Ejj79yXkppaqYvALouRuHplp1MMw2INZqGecdvLYCvNTxIvuMZhgex
	MV27y6NOatoS8CfvYcmhA21DYkqcr+ainL6sHzNLEN8P9qeXa7HMT2bdz1WDOnqm
	t8tJCb9YM1cqoQwwdcWV2VrU6YmvlNIBXf6/9LqexUtxoLUYDH1txQ1jBR4y+Yf4
	zEid6jc/B4NLpcU9DH1hn1cAqqKPvZK78xWdXs/QUDa6Pw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv069k8fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:06:46 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-93f69d06fe4so2655281241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769195206; x=1769800006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qKhvdckabX5eF5ZjxFIcU92uhukFwsWBMCWJkQDEYrU=;
        b=QyQAbD3D0EXb05wutDINEKwDkCyuBlIlKqe7k83zN6q1WaQVbpCCnsiIHsx6e88Wpa
         +eja8yXrTaAnCm7Sg3Jajuc3VQ0fzEPA6oRgkxDoo5SICZA92g0ALKOQ3JycwrLTBpN5
         PlSf2HQ8jxl420fOaAaNSk+72K1f1in+tsFbHVlq6VgQTU4tMQseLSoZmRf1th2eeY6E
         zw9aA/t1tt2pPRczoDBTARlhNAEJP1kolPS9uyvJawFxLyb2aT6UdvCqZGazZ+j10uNf
         9Pu32yAOvTz9ZWHVdKvmpWonaDDVo5css1KqpZOiMamhvhPCKT7VM4GF13t36wdyTvtZ
         wuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769195206; x=1769800006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKhvdckabX5eF5ZjxFIcU92uhukFwsWBMCWJkQDEYrU=;
        b=wkH0x6CtGN610HCVvNWWfhV7DSxgvWTmHXI+Hk4cGEXuvljI4UiEmPrWXi7lWbpNSh
         TokUwHPPqSQJcPmL6UUlHkQbVoUadHU61XIACxQ9s53lnqelHJlUacoaJMnBdDmpXvqu
         LaADZuosxxiIIWYhNNO9awOOd7JO5Epo5NIbfoIw5WULjquGaNxoAhetcrz2d2n+vebn
         ZQJ1IQl9JcX5JgnS3A48I3Aktyn5mZX1wjKpfFxb3nozOnz+R2Zg6exd0zAUmp3tOlUs
         6wkPIc3EYGSOJxpDUbOkOehd40qwOZXRw8w2IfV3QSOG/+owUC3px0s7u802ges8uLw1
         focw==
X-Forwarded-Encrypted: i=1; AJvYcCWZp4UPuY26Gtmz0LQh0d/zfbRfWGNrQYRyhbms3VcAjovKDa7Zz3ANTZM39Bhjo5XAsEL6fKLbUm8ApZYy@vger.kernel.org
X-Gm-Message-State: AOJu0YxGl4RTNu9QoVueVJIZ5dMnjl60O4IWWD5IFUU7tHQgGg4412Bb
	/QI38pyYsnbvhNMGoagiPi46AiPFTNXKHgobGMBfBVF9b+Y2eG8GEB5utc2KClHUX9p7HkVG+69
	NE/KQ5As2YQw/JPuZta71++K3YqNnnnLmEyyuBq/7nBkeX0VfsFncL1llhjhDCiw8LntN
X-Gm-Gg: AZuq6aIsxk2oMUUeGmyI4AExxWc8M5G0+5kygNmxVU5IRxXq59eTfBBJ5MZYYkYb3n9
	J16haGj9XW/E5bb45GvfHNdMWB6BO5LZsP7DC1L+yTi7sMxlMykWn/eZ2knTw/rlLK0EZ2SPz5n
	5d5RPyI157DIboqjRRxiZvcHI+gBk2JX279H8kGM4eKNRftIQMNbTrWC6QAt7vbhslyJIKbtIcv
	905Fh7skDcslwjyAOh7L9MJU7/SI5P0pRE0tMZfPeZYLB/PJCZ6xV3lgHxyRFwjBjHUNOUE+xSk
	XNQkK0QCOQqhp5l4eSUxBrmGOidutFc71GVQBhdhju7cyh//WN49uVPcTng71Gyx1PAYQW+Zazs
	2DHgUUK85BA8+KXwzfKOpD2UC9/73cPzT4XeAOgQJxvQfFUfgixeT52Q0OM7xRuGUSzY18W13Ip
	ewWhIsmmMkJU06BIHw5zBkX6c=
X-Received: by 2002:a05:6102:950:b0:5f5:3d46:e5fb with SMTP id ada2fe7eead31-5f5584d5694mr572032137.5.1769195205750;
        Fri, 23 Jan 2026 11:06:45 -0800 (PST)
X-Received: by 2002:a05:6102:950:b0:5f5:3d46:e5fb with SMTP id ada2fe7eead31-5f5584d5694mr572025137.5.1769195205315;
        Fri, 23 Jan 2026 11:06:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de48f0259sm836004e87.45.2026.01.23.11.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 11:06:44 -0800 (PST)
Date: Fri, 23 Jan 2026 21:06:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: Add Eliza interconnect provider
 driver
Message-ID: <mj2yai65bpxgky7svixb4hgtbekrmbym7fzc4rw6t77bot52iu@h3lxsrfy5zaw>
References: <20260123-eliza-interconnect-v1-0-010ff0d100c9@oss.qualcomm.com>
 <20260123-eliza-interconnect-v1-2-010ff0d100c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-eliza-interconnect-v1-2-010ff0d100c9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eLUeTXp1 c=1 sm=1 tr=0 ts=6973c6c6 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IdhJIH7UHSwZyGBE1u8A:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: ddYzhBVuUKx4tubPVFOgPlJTYUMTf0Ye
X-Proofpoint-ORIG-GUID: ddYzhBVuUKx4tubPVFOgPlJTYUMTf0Ye
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDE0NiBTYWx0ZWRfX0N/h0ck4WSXg
 Tk6UU7dpLwrj75D1W0kjCGVBCwuP7iRvlmlH8ynmb2+xbPjXvIh9cNv6Mx3+qe+hrKOOunyoLkF
 2H9JuWDVuV/dG8izJi/PLCrITtCw8KP2S+hGjxhS3bwMiUPv7h4Ju7qRugHx8/FOA8wzmElp/xA
 PTT0fw5E08+GlZqMdsgbR6MabzqV7D8cG0Cq9u4c/cbHQaKkd3LYUVXrvpWy+1eMJtjDJ5MxoGX
 HVUmhWygKMx3JIZ6odGdLxaq5SserhrwTBKUvRuqFIjw2vVFb9efEi2MGSPMJyjsVAbk9Ud0Y47
 7bLLTagyuhUUMGYob3fQOmzgifvEGPI6rM8MSLTitW9E3nmiL3nQagf5JVGxd5Q+ZmVuzVArcZI
 RXGc4c5XXtP8vw6GjJnK6lDx07EupR9qbgmStn0XWyfp6O7993aUTOoTErukuJrc8RK4oCz63tO
 HcK9++Ue9KWABxht9fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230146
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,oss.qualcomm.com:server fail,sea.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-90379-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 91FB57A057
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 02:43:21PM +0200, Abel Vesa wrote:
> From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> 
> Add driver for the Qualcomm interconnect buses found in Eliza
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pairs.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |    9 +
>  drivers/interconnect/qcom/Makefile |    2 +
>  drivers/interconnect/qcom/eliza.c  | 1586 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1597 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

