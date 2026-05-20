Return-Path: <linux-arm-msm+bounces-108815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMJcG2XUDWrW3wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:33:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEAB590F77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83A43308DA21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2123F1ABC;
	Wed, 20 May 2026 14:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QL7ttgxp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfyR3Ch5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17093F1AA5
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288919; cv=none; b=oTMNBy3D1y/69zHUmJbPKrG1j6TAWBnQri8UNXyt//IYubzIFrGspLsg/3dG9CH5YwGE9HGw/xlo7IHe2iSwCrruC1PXWhGX85Xsj54FM3aBldv1lNjqd4V9MVh4LosRG3hu3EUVsimkj3jNWH/4072y53OWgbc0bVtAoXO5s4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288919; c=relaxed/simple;
	bh=bsKrfT19/Dg39eGI2fJEyocjyeUDqPaBoUeZKAlTGTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LS9Wx+pjpZPRWwukWDKjXEgD4sNezwOK5fD7eianAtawZW1pERaN3CfdOvgzimaIkM3X2VaFgUpqs+PnKttqGYpEkjF+0Ttz2DCJ56NDJWWRe5ocjCgyZfNDZXM0LICXcomNiTbbw8GzfDhFsUENYYWsK867uarP9cBbVVzhkt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QL7ttgxp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfyR3Ch5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KEFd6t963885
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8EfUowemClkkBeFHarqbGwft
	5gIE1tGNjeNlEZjZHi8=; b=QL7ttgxpY7pVF73M2MCwtN7yEXbvSuwEzZlxb54c
	/cg71F2TdDRUT4fTm6azGpHHsdgrhIIfzcMqZ+ho5HAKvZR5mcnTDNSyLFAZyEPl
	8Pql3vy8gNiG0rOrAIojYEENSZLpQEhv35qX0R/e+e3IVBkC3eOGfY0dagNSCWPo
	9xPXuQI7dzI1dSjQ4erb+9yoEXh9HQ8U5TfYwh9iTFj9btPRK22Y8+WDaxa5Ltay
	TLNUf6gTfU+GTcC8ila+ss5KN+nPFp7YZORRiyb+iAODxjCZa9R/bYNl4mYzYmZK
	9R5cL4AiZAoLqi4NuP8F9wyK1iiUKptZ+473xJ/r4lv35Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ejh05p3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:55:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d6bf346adso111119481cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288915; x=1779893715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8EfUowemClkkBeFHarqbGwft5gIE1tGNjeNlEZjZHi8=;
        b=XfyR3Ch5JOnFvcDnxHpuUqe2yb6d235zQTgbVUy0Rs5laTQgifQJyYMO+MNXDzu0mi
         afsg0D8Wg1sq3chMWVuDZaK/DaupxPCyCAAS4gf4DXCm25585QKEanrbLkRpOAuSXGtE
         rZh+lEkUs+VNsqO+r6OD5jhe1sQSYDARkBfnLjZT/Uk3subFNxDEfhZ+O5UthCHh4Qff
         X7fX4UJTTrPS3R5OYIFVpmIHq4UAbLUGL+uknQLIz+/dmoSaDdQkJphv8FofUTO5nbks
         hiFymGhBOTukYFfhNZgTjezQyxuedySUMZAUl/DzsQnK7bQUSOG0SIgtom2Av+5/EKrm
         f/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288915; x=1779893715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EfUowemClkkBeFHarqbGwft5gIE1tGNjeNlEZjZHi8=;
        b=S0u9KUL7QEgIC+o68RX+M3En9OMKiDsSA1FO7p81AVQLz6EKCnSZ7YwBrq+BdbPE7b
         sQsu9s8yHdOMTv+EnJZ9HN/PiTV0vQ2Gr8Pge1LIiHA4BcSSJWiMFA6q5AN2V3HzWRq8
         bH8t49LGxBzkx9qIqwdHKFWz6TaZgYUUo8hHqEKezmgQg1yB3agJSCTR4t2q3UZoiblv
         uJXP6ULUEjuG8d9pDzFrBujO0NpLUcRYxjGqLXUBsrL9AmeqRRAfHkCGjy34KRZOJzVY
         yIjIKUf45vUwclHTiL1ORWct8GtOuX26D9+iJ5WUgKFq73OEG0zUsxA5uv6ppFpVQMtE
         TIiA==
X-Forwarded-Encrypted: i=1; AFNElJ/3PESR9iqhCyjYKysFHps6pLLnLo/BmejckzHLQCUyt+pjvgRDIwKDXCeXkfaCPxm5MmLErBu9h5Th+dow@vger.kernel.org
X-Gm-Message-State: AOJu0YzOLTfj51AM6VCYYPQU3kmuycifRG0mNQWuKpgvAsX9gmhg/J6h
	2wAkOWKw9cru3kyqi/CrzH5Vwu1X031Jn/UZNYEoeOgrDuM7zqXhjDVXEA9m+jgG4FYgfpEqUN3
	nedKs6yF26PGk9bkRYU5u/KFZAQsTiewMnUb314XxebhV8d5XhbJ93ZbusG8+/28pLlnj
X-Gm-Gg: Acq92OGrp5+0bJCn6HGaDFP+ToYbXhH51sj00C8eFUltlg3eEy+C3N8VSFRj8YQLdR3
	/BLafw1PzMD4hZFWKQelFxYasVYQblI0aKJIrHrNLQAeeeuhtb210IU4UOAAJagmfCOFg8XXvEb
	Ve6ZoGW6NAiLLXDvEtyR/4no7HmHBn1ThKggV9wKcausupfwTdK9D0LRXv8hNZxHz9qAh+A4p01
	rUwK6jrTiC+ZbmtVLSGv6EU9KBFYcnMhwKnvfri5Oxp/YSS9q6OqzRpQH/I84VtSKM6SAZymix+
	UArvzQDoyMeH7BZnv59ztWBJhPQhvjTCWVwI34xA4x23RoqYFNnSUl5W4z0I9rFzIA4T71a3/EO
	lGzPXOIUHgPariAlgAY4MqTZkdiHj+Lo6IDZi4nWVCqJDAG9LFbDOcenHAxq0pOL0FBPn9CWZdp
	LnwLyJA+Bpr0+5s87EhLuCLuPXXfq1fLbgv4b4a5xS2kKNvg==
X-Received: by 2002:a05:622a:180e:b0:50f:be4f:465d with SMTP id d75a77b69052e-5165a234758mr353075271cf.46.1779288914885;
        Wed, 20 May 2026 07:55:14 -0700 (PDT)
X-Received: by 2002:a05:622a:180e:b0:50f:be4f:465d with SMTP id d75a77b69052e-5165a234758mr353074691cf.46.1779288914396;
        Wed, 20 May 2026 07:55:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc0ccsm5049114e87.41.2026.05.20.07.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:55:13 -0700 (PDT)
Date: Wed, 20 May 2026 17:55:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: pas: Add Shikra remoteproc
 support
Message-ID: <gkawm2psopuodlmv6kw2e4hdud67ahgnpha6jxmyp2bvwob5ph@7uv2jkopp7z4>
References: <20260520-shikra-rproc-v2-0-583a2e413a3a@oss.qualcomm.com>
 <20260520-shikra-rproc-v2-2-583a2e413a3a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-shikra-rproc-v2-2-583a2e413a3a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QptuG1yd c=1 sm=1 tr=0 ts=6a0dcb53 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=CtAqrJV6yErwifH23rQA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfXx6hVGkMAYWq0
 GP3hevxZoh2brBw+lNJLCcJrEOI5bb7Yn6KgbSD4xOD/6ztxQBnosUwtWpkXrjkZADIYECtpCmk
 jXyLQYQcCqeKclQBxldaoMHlyR91cBhqd08wE5AE9j1Y0B/Ox4zR6VDY5P2P48rcRrg3NmX4ACB
 grOhRUI3yMpksaX+FEk3nbw/78mQtVKYZ0e+0p4L0h+u9FjVYby6iTElQGbLI0lELxFABfNOaX9
 phWLIBM9jD5NEiMAkkF+jWH70GTbZTppzGd3tRmc8rWFQQIy5kbjx5KkJX+1VSQ3p3nA4APMA+J
 /LZ2vQUSK/T8Ue6Wl/HRakZb5k8bm5WilTDssxMe9dCysYkrsCSlwpci8mh/dUorxuga2ADF9Fj
 gwXDFcM+rWvLh64H8xYxylIrTTIEiUx7VEvgP1Gznt98mUN7vthIkAffNpTjlwhnqpjWp0BHjEw
 prAE3XWEVT2FRTNspeA==
X-Proofpoint-GUID: 2rjrrJASIg8IbYKnxeqvDVHYBj8KYfpa
X-Proofpoint-ORIG-GUID: 2rjrrJASIg8IbYKnxeqvDVHYBj8KYfpa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200145
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108815-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DEEAB590F77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 08:08:06PM +0530, Komal Bajaj wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
> for the Qualcomm Shikra SoC.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 48 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

