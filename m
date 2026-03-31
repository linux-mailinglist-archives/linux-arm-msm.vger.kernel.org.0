Return-Path: <linux-arm-msm+bounces-101040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMwoGFSty2nrKAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:17:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F29113689D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87181305614D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22133C3430;
	Tue, 31 Mar 2026 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YMYBo6Cc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PiixO7Fj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0642B3C4568
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774955804; cv=none; b=ErXw+emEkkTacreYiNXdI6YcVWlIowjp5pGSO0AMvEx9Wxqy/hm7xXv07vjRstHPRkFyFgJVP9bbAIKPOGLLxi036jL0LPhcmaBI8gVQdJbOI7jZjmm+Jr1UgY2r5bVs4wsZlVPsZZvQ14SNgBNknZ1SKVg2yRAnsWh6SNMtvSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774955804; c=relaxed/simple;
	bh=iT/Ia1aYo+U8Tv4pRevo8HCju7ee26D0HiSTbvl7/gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EC0dSKAvpBF6WSzD8C2y5BgAWVURAaSUjD+z0+VEDRyBX9YnlEYxaJAeWxUEn8rj0/dKeVFL0kc4ZqI6OzKoDW5+kxneov6imfwVYZ3Qrr42Cnnv0XsSgEd5PDGIUdGvpsetjYM9LUJArMXBmEZDOGe687W9FnBZtlGGNskCQ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMYBo6Cc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PiixO7Fj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6TZu01090309
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0dlTRBAoNWK7Ojv4RhajNx9W
	Ei2mlwlpkgjLYygi7GA=; b=YMYBo6CcqqbJVtf00O3PQ8d59l0KjtnuMCBWxBgZ
	VgnklkMwWMCgv/YV+M6dSycKznTJYUGAk9imeXkKN18+vXFgrGs3hNRkEu7j1g/A
	vN2wusxuE1N1wwDCjvht2HNZ8ygoaGmqV/9UHeFWVJa8/jxg9LYkR+JVBJbns/QI
	aOgF6WiwbSjXfmWa3YlAjthAGFMoG9ydJtW7fEL8IG1ELozi3a679ebGzDKQdxNC
	E6yhfv0JVey+adx1ZU0vewdAqIDZ0EBV33T623M7b5NLrUgBL4e9A6I8lMwhqrxy
	62iUjV0m4rXEUqPxGiulN9jT6YKZt1wOZIBlOxXashTALQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd4eey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:16:41 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1273dfdaf5dso3803552c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 04:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774955800; x=1775560600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0dlTRBAoNWK7Ojv4RhajNx9WEi2mlwlpkgjLYygi7GA=;
        b=PiixO7FjQRQSy0qZHMnVpj8KEDROKYs37CgwkEut6DGBM6RWAijCRNL+dsTVCdLHBC
         ZFJsInye+Gv/Zl4cxsk3EnNBhtXoLGv4dxgNRshDzGfR7cpZOs8c7XOrWitIA4N5jz0v
         d2KieyXJeIBveCeLE8ZyiF3CJAluP29aj0zdBg/R7QCMZrSWdhtRTGT3bLsw2fxSdJPA
         jCj6ai9EWD5fCubn0IHZDx2hCaiaK4MS3xsFP05iwwZz8RUJ+ObuHdmEn4ocRFK5q4ML
         nS8MpCQPZN8GU/tSvT3E7mwHkgYQOa7IHsXoiTigj7OELcWFVkXzHc/nXFnAe6g5WSXd
         S9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774955800; x=1775560600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dlTRBAoNWK7Ojv4RhajNx9WEi2mlwlpkgjLYygi7GA=;
        b=ditd2In1qeKxfXNUBwzNwMTlUHjG57XtHSGLQPU/P2Mr2rDVNqXxKI2l32S9LSFNFB
         dCKOmjZNPhFYApDSxwlU6lsWHIl0Vjh16QyqjDYgb5LzTZdiaMHmyZKDy/VuxG7bWJNq
         usgmroC45dN/RL+m1qozKXi65Q43WCTh1XjjoUhADmK8M8IxaZavHqKPgF/Nv+1mPV43
         Jb2GJ0LJN+VcqOfRx7Knf5IIkwEswNNHrH2JfpWW3reLCeixyRsuuFUtm4DZZl9JHN+C
         BgkGx7o3HJbjNQE0U8pQ/gu9tSCB5+8ck1JS1j91hB+xvavuohOkz7LZ78wdfq5jkrFd
         QbIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUvQd1Y90okk7PW+hFRuSmXVwzgJudJ4Fuu1VU9T3U3otD0X886azf2/oDuxzDJdKmTFIGxcc3yAGm3V/H@vger.kernel.org
X-Gm-Message-State: AOJu0YxkEj7s5D7c5iq2P7w93SqqEy4dCvvioq3ALSQjveviqEMduY3R
	hjlwrGQLcYYrguXPmba1bDOcTYXgTRqxnqSnIIwORhDTAHiGSlC0lwH92hjibdBben71i85NhrZ
	HTBSw0+aRaSd8u5+g5nI4UDrsBGLZ1UAjIYOnTERjh+Di2m2ohTWvcNGhjLOJssKLuNub
X-Gm-Gg: ATEYQzw0m/AAFCP2uBailGxdTlgUrSrTqfGGf/FMBjGbzTj7PyrJlBpDFJ1QiDSEZeU
	6X0+TFq5OuvO4GFRtox/mbFwQaeP/FUFVU34o35TCpx+n018G82gdpDgIa0u30kEb41vQ+NUP1Q
	ciuwbe2KttIpLwMHiRF/RvSoC0D9bAYhUyxg3zU+zvuF16nLt/uJsO92HO+oKCqn0F7g9c1gxqG
	WPhqIYdNFEQlHTxMQX5ap8suSbf2ivdSKrAVtV/GJr/fmIWIef5SyEhh00kYZnxz2rQyyfFIPfQ
	HICsE4JkN6VyQIyFcz1g6s0OJxVKDg5jrHCTZ4cQLwjd+x/F54t+30xP31XEjDcfxugfmHhNwck
	3NdM3JnYuYLc9/YD0Ha0HuP9qAiNKGmbjw4jqQjAPoxBivHo0Ug3ovc3QzspSMfVC
X-Received: by 2002:a05:7022:1284:b0:123:3c24:b15 with SMTP id a92af1059eb24-12bddf0c8aemr1398800c88.19.1774955800139;
        Tue, 31 Mar 2026 04:16:40 -0700 (PDT)
X-Received: by 2002:a05:7022:1284:b0:123:3c24:b15 with SMTP id a92af1059eb24-12bddf0c8aemr1398776c88.19.1774955799527;
        Tue, 31 Mar 2026 04:16:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97cad88sm10692781c88.1.2026.03.31.04.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 04:16:39 -0700 (PDT)
Date: Tue, 31 Mar 2026 19:16:33 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: remoteproc: qcom: Drop types for
 firmware-name
Message-ID: <acutEQ0064cLMa6B@QCOM-aGQu4IUr3Y>
References: <20260309123357.1911586-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309123357.1911586-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: T4yJvMFzfGFZpYmSDsVhbGFeBtCNspMj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwOCBTYWx0ZWRfX0D2+7QbT5dtN
 LfgaJug2V2/1LCtcIjegvSW02A4rT2zOc/mtN/030X8tAtUrWQkpgeZh82+QSnqdxwaWmommLIk
 LS8sEKlELT+1wd0zu+XUubFfs7XZNIFeMK0uo3/SL3/czLIGyC6yAID5JkymCtHBPvxblJgNmJE
 TOXe5qJPzk3nxMTEBN8kWOMglbHSPAyXiot8HLjAW/e5RHiZrmBXhcDGFzU00maNDqrSe5q/YDv
 IqoOceKb/cPZQW+P2bjlxQRAq8PleS1eJg0zp79S0qiYiQoYV1Nkb98Cy+BIYS/FYKm/cvoVDgA
 lMF9ZQ9Z9VjYtHIetXs7MEelq47pMbtTQjBx71l32rxsI3VVBbgkoK5mTmFterGs7GIaY2DqkEx
 8zLy9lyqWL9vDWdxcbt7Jk9OSaOPtyiBxvHJYn9p4aGmzNC/Km/MG4yVsqMcdo1u6YfhVPYnB+a
 4JyASSH7sY5U+amc6zA==
X-Proofpoint-ORIG-GUID: T4yJvMFzfGFZpYmSDsVhbGFeBtCNspMj
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cbad19 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NAI6pjMkAQNTJgJUrYgA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310108
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101040-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F29113689D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 09, 2026 at 08:33:57PM +0800, Shawn Guo wrote:
> The type of firmware-name is already defined by core schemas.  Drop it
> from individual bindings that have either a redundant definition or
> an override as string type.  For the later cases, constrain the number
> of expected firmware names to 1.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes in v2:
> - Add constraint of maxItems 1 for string type removal (Thanks to Krzysztof!)
> - Link to v1: https://lore.kernel.org/all/20260306140306.1328719-1-shengchao.guo@oss.qualcomm.com/

Hi Bjorn,

Did you get a chance to look at it, or is there anything I should do
on my end?

Shawn

