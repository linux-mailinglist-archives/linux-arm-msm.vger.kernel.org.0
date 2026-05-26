Return-Path: <linux-arm-msm+bounces-109724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFHGANUzFWqPTgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:47:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B865D0F19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FFC1301D30C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A353BD22E;
	Tue, 26 May 2026 05:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oxat4nuD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFMYY/h8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865503955FD
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779774414; cv=none; b=jwQmcl5YgE7C98A5bTVNIUVtcNjUtW3OyBViGLQDfg1SPnHOdMI1XqEQ98H0XAsEojSeoF3sCZ/2PEqtBIvcQDg60lAjFx+jZQh9YIrSzT0SKr5Upqd8D6O6SqI39yPVVnff7Qc+5bgcup7LL7EWbm9B7NYlx1AhPmBC1YnvRck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779774414; c=relaxed/simple;
	bh=ps86Ba0cCUSFCCDq+mkUy9q3KNNVmGXrUPfYnf/43e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSsVOKSOULh0F1eIH3ckqiQlCxTOd1loLnUC30BMqJtWD/Ec3EOivcw+FCvstIWHucH8xSNPzT00DCJAzx2MG4kjsKmXtPWjQ5pFr0AJtALEutKo1Eu5TkwAwoT4KwpFo1xwSxM0yZxg/DsXuxnS3SqibFUDBENcsvUO4hR+pGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oxat4nuD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFMYY/h8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2BDGf691659
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2iFik4hUuN6UNkV/R8eN+n1d
	H5ylNRH3jiARbcS/5Cc=; b=oxat4nuDfKuQv/hYmzQCgEx8keRSfS4jWR3VeffE
	5tsCSCUxEOzhfBZ8nWPNnSyZJ6RvhBfEbZVrQTBxA3qi8IZC2ldtg3QffX1/6uVU
	Ru1OmMk/v6+4FIHFWkdXqSyCYZxXtUprpxBpkcPcZLOJOFlntNmxz+7J+N6xN/Ig
	CujLMJ4mLljpnNERKp+/iDcOkifgFJIZZYBBtpt7p2HGo2S9Ppl7hVwKxWmQsB0Q
	TI8pmc0JavRl3B+IAWwnud/twEJoOEVLLsZsJQXJJvO9kWgWKZhrOk/1fxHuWdRi
	qEkPxcn+4khWSMeEEe7DQeExVYk2q1fJmbW+fgb0Ad8mqA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2jgje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:46:52 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6322654bb6eso14646521137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 22:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779774411; x=1780379211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2iFik4hUuN6UNkV/R8eN+n1dH5ylNRH3jiARbcS/5Cc=;
        b=hFMYY/h8qa3eEtDG9IySoJHy9W5C7/7Aj9Gi9sPbNLvdHhrzlSuXoYe1Lh/bf3uvww
         URgygwxV+sCOpMNaG3EJaNzy9BJBj5VPp4LouiOrfkzu7757p3JGZBOXXXI2oNi+XCbj
         0nHLYhm7evGF31oHOoF0ncgQWX51EPuVZ2Vpx6l5j13RouBERap7IQuxP28OFFim/dy1
         K2GfaR5nT6dEhXbJo/TkNJXp/xybol2KxpkRU4rHhf9p1J7Pjl3z8YITlYE5/Fte2E3K
         hhHpDya8LqCm0tkJL3SF90urrA20ctRptcl7ME8N57VyJFyoX31qzEotZ1kFYXJFBkJu
         ibJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779774411; x=1780379211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2iFik4hUuN6UNkV/R8eN+n1dH5ylNRH3jiARbcS/5Cc=;
        b=A4PP3S/paLsae0HNf74AUi/JVAENJ9+js6b5Au8YNZ60MXetPriEzN5DWjNirwA7fY
         ld+3sFUBzRsRPVOunJlG6tXx6kyGVfcVawUeWrPyXmSOXGc4HsvtlmFyrKkjvPF8RD8Z
         rU+sI1wQV36XVGBgS55iy0Eu3cxJ8Tcw7AuiDzGOpxqml/EMd5RawXVqOmOythSiyqKO
         8VDwmdWP5gCC6RdnqJV5SDgEDahQKglOeWyyNV1aUQntKeaeh/j1bD5zAMKefowWUiFq
         0fj6PiWaC6MH3T9YmPYFeuYVECe/CLKFilVV0M2HLj1b/fqLX+NdAFkFmaUftfKz1X9e
         Hpsw==
X-Forwarded-Encrypted: i=1; AFNElJ9w1pCVnSTx9E6nxqZj0g/qCT1EbnEFVTYRA0ajXToQesbCj6oypD1xeR78FKKjSvdKg5nNePBN3Uc0RPRk@vger.kernel.org
X-Gm-Message-State: AOJu0YwGbLT9WDp+JRRJzwK4sRdTdQaH+XL1fOpARc4cHx9ar4CV21mT
	xaRU9hRsf6mqg/9hzeEeZnWNi4DKmkRNoU3EMwWjhhYZg5D4WPj1NBjNyZBrHMFh7bZ/OQz16WK
	sp+j4pQKHchA7dkjY2y+sLbtI9wcmvwyj6dqlMzZLHLBL3gHEOiTeUer1ul5vw/qa7umJ
X-Gm-Gg: Acq92OG79c2nF6qeN43q9SQ5HmCDI+AtXbAuCs41MF+jl9/scRZw75fQ0EbKbz5ukaf
	fJvSKFQ8wNCF/PmChN5bEHAs0bLeil46YxBzUIGEAZqDy/p+SnT2VF0ldQkVDF35uJR22ffZm8x
	DUoEhz6JoRke0NgZJ75+fzOtfps22in9wQcd4szGYOhaTPQuCXRM4oTtAnvriU2yxHLOvaNPY4c
	lqj7uQwJujC+yzDPpEvCmaxfn23hSmcr/jfLIqBPs8Hpgdd4PbUw4VbBw+vZ70zaD3BBSwsNpc3
	LjCK8jnpumjNNbu4cUUOY8UEJFmaStBKsVYIZa5UUzF4WhnOEEvt0LpsS1zHkLwOhaUOvL/RQfB
	Vv3e9nWpcTf/JyzSL0uCq6QpLYzguszXQGwcER0uIDMNw0OeQyZXS9uMLTEB36HHG1D1pvNJEGC
	E4aRthjT668zBsVqWpNScoKoKDK1jLUq6J5lY=
X-Received: by 2002:a67:f0d2:0:b0:6a2:b2a1:f170 with SMTP id ada2fe7eead31-6a2b2ef1eecmr434396137.19.1779774411569;
        Mon, 25 May 2026 22:46:51 -0700 (PDT)
X-Received: by 2002:a67:f0d2:0:b0:6a2:b2a1:f170 with SMTP id ada2fe7eead31-6a2b2ef1eecmr434394137.19.1779774411177;
        Mon, 25 May 2026 22:46:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa462e1d86sm197558e87.32.2026.05.25.22.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:46:49 -0700 (PDT)
Date: Tue, 26 May 2026 08:46:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
Message-ID: <dyukhyihftgrm53tdiugcfx36tfngelm3hi2otpxy4pzdiwlsm@ixh6amjmeglm>
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
X-Proofpoint-GUID: 1r0idDcDjSRUwdtTy37uFTyqow27fWVp
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a1533cc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=52tii9ovPz_KmwLdHQYA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 1r0idDcDjSRUwdtTy37uFTyqow27fWVp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0OCBTYWx0ZWRfX5FI4W9jERRRd
 XH6owEAfkx+WHWWcXA5ycek2ZCBmJxBgptDszE+Dadua/rCZnCAhBvawad7xudnUFCOFs8B+okd
 ohkVnZSzmaFhnXyh00R7vQ1stSG809V9Fut7JCQNau06AD5GwAa8KX4en+MjAeEeBV6s102FqSw
 qKT4N6kfrPc9pAiCYgmw/5yyYQ5ssoz3ftxkW3XrKiq0crOV4xXN7G9obY+uTMuH035iQDstSJV
 vKtfbXIoXKjCaGwBV5dsAh0+PAUVil0Zwhu0KV2Q9XN8SyXvZljfxr1AagMtOITQpWeNhpaKA/5
 VoiD2ap++NVpKw6slJED5rgImEv2ZdjS5u0j4KQjH5WUS/NtM7oU6+tQ+N4nR7AtZNe2GPLq64k
 QT0apqgpvy/3AFjGqpsl+Jc1PPaFbmM8O8z6bFWlnxljScJxRJDg4lQceAwwVxYlSjgy7U/YyjK
 M/yVHFf/oJWnNwTTp6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260048
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109724-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 49B865D0F19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 10:59:44AM +0530, Taniya Das wrote:
> The gcc_eva_ahb_clk and gcc_eva_xo_clk branch clocks should not be
> registered as standalone GCC branch clocks.

, otherwise .... what?

> Drop these clocks from
> the GCC clock list and instead add their CBCR registers to the GCC
> critical clocks list to ensure they remain enabled during early boot.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 32 ++------------------------------
>  1 file changed, 2 insertions(+), 30 deletions(-)
> 

-- 
With best wishes
Dmitry

