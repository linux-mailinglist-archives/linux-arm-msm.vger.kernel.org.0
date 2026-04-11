Return-Path: <linux-arm-msm+bounces-102797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uL8LDg5z2mln2ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 18:13:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5513E0C3E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 18:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 057713006B29
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 16:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E523A9624;
	Sat, 11 Apr 2026 16:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUkYjSH5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCfdOBrb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630AD3A6B66
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775923978; cv=none; b=VKQvGxjOoaqY1G9zpCK99XMhxxtsGP9iUKLiSIzgBtHYMGEJ178CDAE9+rkg3SNV5DK7SDGf9fCFkS38irExnN9oxsN+2RPopTYnQ42NBcKIneCNGERCHCQhimRBnfyZq/FzAppdOSx0YFB+L5VjtDr83XjsILcCCPom0yHDkKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775923978; c=relaxed/simple;
	bh=bofRuFQP5HiDDbmWiJlGOW5pFcZI/dduhU8+a8uHpFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jR11YlHwIsR66fN+J8ktAvBCRtBGYCVyDcKezSiCGAcY+k5cW/EvZAHsECaYkbZ7s9i8JNK2yYx670xfuM7StPDT0CBIivXGIvwmLozN3CY5i8tnFga3dwoH1it/AcsJH4YHprvRO9ToBq2L+yjL/wodP771xeFU+XcfrMNa8wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUkYjSH5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCfdOBrb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B7uC893335363
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 16:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uYcNzzxm/hI+gu2DC/7bHmlR
	eXhCbsJGa7eLMlz2hJQ=; b=eUkYjSH5f6r2Pt9BeR8E6yMPRai0wZO33gdP6zAx
	n4LbAV1MVkURPxtXMjGZEQ1hFRWP6xX4MC2WXUyrd/diZZcJC4VTCD2+MIJYJAXe
	7shGgStiF+YgLV4+WIcrmOFAbXrRlrq2I7Z3sTZu1xZWFU/k7yEX/tMCh2a0IdCv
	YgzYavKi4NwtQyjZOROuJd1eH4NtlvvfL7IjCtD2LfiJv3Hkvx0xyJyl05vvwEFn
	1P4LeQ79RB8xptAFD3ruuvtQxyjVRHqJVTDsQ2xOQfMtU99JnQcK7x+9m7JnTOpo
	/uPz99nNe2YfLCqPm5STlcY9983bveh7McNfDmb1xLTdfQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbp8ny7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 16:12:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b31cff27fso26582641cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 09:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775923976; x=1776528776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uYcNzzxm/hI+gu2DC/7bHmlReXhCbsJGa7eLMlz2hJQ=;
        b=XCfdOBrbpdZbYNbwG6xVF5FX8T4jSyey7V/FAAJRFaFJuLGJZ8d+zGS+SdG6721zo8
         KU2b4vCO8/D3LhuW8CRyqrhyxoGJt1uQnf3TdRWfNcr24rueyZu+3bQcXcm00McyR+O3
         FADZP1uG4NSD4ghewQs9pS0ZQagIqITyJEbE3s4L5hZmaR+N5eh46qbv4C76qMqUxlV+
         iqtPqc22/sdc+0igmG5ul3Z1FckJBqtbfFEVPMHcaDpGIfoVLY34tcLmr+b15UE1DGO6
         7fZHpTetgDlQaPIDdwYwUpuhZ07/EFgfsppfTe/zAzmSWM79kE09i5Dk0MYni7p5lF5l
         b2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775923976; x=1776528776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYcNzzxm/hI+gu2DC/7bHmlReXhCbsJGa7eLMlz2hJQ=;
        b=ZZXBRCF/F7ZdLx4ATgjVeqqJBxav/qnwrTq60y2zKIN5PczPFSJXdrEYC3gZhrE4y3
         nSFtdfuFPFAdCqLXN2Ptaf4HhWPGN+cHv+M41lgOtz0zF8uBCn7ZGI6i/D1QI84tl2bB
         auk2/Deh4xJJS2iu3n/TjEamjaXPNXTLaEQqziqJb9XhpIu5M95+hWObtTe5zF01DAN7
         2+Bfh9vb791ZND2RjuTmlA2VloVr5NXQsxvnsU1FTRxPePd03jeVouI/Ot+Wy+ZjuMRa
         fLwD+4Tl2vARyW+u6LfH9dv+UIXeXAjGVVk2boEgzyd/Z+QCwwqAkm+RUGYW5CFzAjWI
         RmWw==
X-Forwarded-Encrypted: i=1; AJvYcCV6HYFQZs3s+vbfnL2Yazsdwbyj8I316o6EFaJztV+YRzUN2gQpq0MwoUmZUjIsPEEujqtWbkzdK900F1JH@vger.kernel.org
X-Gm-Message-State: AOJu0YweGEIkXiEV/OoBBcsYMzw23n7csTAcufcQwpP7iawfqfBr3KIs
	HfgECw3kpTyGz2qv2wDH/ZWpTFgrwmxtcA1kk0FBAxBOEYmQB5OQId6XQ8SGIIiVVOqHsDbpp07
	ujHBYNGkXzQIRI1ewRDPi/sVnzcU0ksma34SiZKObxaaZLjYRzAsoqE3khBbXlKj2lBpW
X-Gm-Gg: AeBDievgn1WhVVhGN0y6uZpD/KJY3f/gFCKQdZ5vB2qBtB1Ls/bdtk81cJFjrhG0QKI
	iSk39b9VKQVk/KlpuDG0iMsSyVbJdwxCtaMioAe98Nk8YezsWrQi+0vIH0RNkDf5ZLgZPyXgQon
	CHR5ZY8vMbS00BCgLCPLRdYm+gzjulEEg6w2e7E18tmI60bD03QuRJIAEEvkGm/luVIzBrPLwma
	ESE0g+qam9sxvAJ3gu0uHmLxwSmQ4ofn0JD+5ZGRVwndd1wIFlqYnK2GtXHbT5ueqdID/8T1ciG
	C/1HKmEn5DRLQ5kyAfZpCB84cK40rnXHwzj78976ONBdLxvGaTwI34eHcDrKVyVUAkujk7KMAj5
	yBeehHbEfNrX5mm7W775c+2iKjWRgetyzfRnlxtrU/2heEFhqXFlnZaWPAjjRuUE1QBLHHuHon/
	m3mx+QU5cp9W/UQ9+cFbWO1vK1lIeXU+2sKPw=
X-Received: by 2002:a05:622a:90:b0:50b:4491:a2cf with SMTP id d75a77b69052e-50dd5b007d1mr110761081cf.27.1775923975730;
        Sat, 11 Apr 2026 09:12:55 -0700 (PDT)
X-Received: by 2002:a05:622a:90:b0:50b:4491:a2cf with SMTP id d75a77b69052e-50dd5b007d1mr110760601cf.27.1775923975265;
        Sat, 11 Apr 2026 09:12:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee1315sm1477003e87.53.2026.04.11.09.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 09:12:53 -0700 (PDT)
Date: Sat, 11 Apr 2026 19:12:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Constify qcom_cc_driver_data and list of
 critical CBCR registers
Message-ID: <7aevdufcxyuzlhw4ddia2etqcxwio4qarnyit6ms6w53tncqlf@uazoklj75rvd>
References: <20260410163326.566093-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410163326.566093-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69da7308 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-x_MtF83Af9THDvFyf0A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 0Us8D9yNUZiflgMcotutnCUYnbUaHges
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE0MCBTYWx0ZWRfX6PIS9VClM+18
 ECHyND40RauKTFcLBzbcJ4mxkQZbRuElCgoAJS5/H0aOwLwx1M2D8T2uFriuN+ylq7fGr1q58qJ
 5aHuhdGpaDjQy0X0n7g7vqmgS7HZYgVwwNsC0eEZ0yd12pS8aOvBhwB1scV+09zP8eoih4N2Qum
 8ZN0YNsESG6GFzRakEj+07nHsLE96YWWBMSfLMbOyWZkTznu3YE+uoPsCaNq3CB5l+14hkV3CXB
 w1JRYTa5h44b+A1aZHsxofDehHTRFm0jmvaNNb/KNYju3IQlflcNFluBzssPfkSsiR/R5qQ3fHm
 qGbzbhDOSZB8+JKFGhXFicFIX7/NGStcZK910IHUJk6nQ07b2+q0/iHjewy8lrErRLUo3qSpuMZ
 8lzSM5qvliVRN+9A+JdJiEQLXRD3qwJ1prYlfvJCF0u5fTpIGb1Q3JG3e7eeOLmo8oKiJVPyCrP
 tvnRWDEmTnEbIDsmwMQ==
X-Proofpoint-GUID: 0Us8D9yNUZiflgMcotutnCUYnbUaHges
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110140
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102797-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D5513E0C3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 06:33:27PM +0200, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
> are already treated by common.c code as pointers to const, so constify
> few remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Drivers introduced after my previous series was merged.
> ---
>  drivers/clk/qcom/gcc-nord.c     | 2 +-
>  drivers/clk/qcom/gpucc-sm8750.c | 4 ++--
>  drivers/clk/qcom/negcc-nord.c   | 2 +-
>  drivers/clk/qcom/nwgcc-nord.c   | 2 +-
>  drivers/clk/qcom/segcc-nord.c   | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

