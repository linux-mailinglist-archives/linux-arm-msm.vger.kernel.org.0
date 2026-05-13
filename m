Return-Path: <linux-arm-msm+bounces-107228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFZBCf8RBGoMDAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:54:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E8452DCFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1044530421D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 05:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BD33A5E7F;
	Wed, 13 May 2026 05:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ct5mndGR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYlhFcA9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD451346AD4
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651644; cv=none; b=lZRJrOXPe0+6+W0yTGBhgA4yc/OoO8qNLB/ToE9IbfpJLKd+chF+X0RWbKibSnHX+GzjKFQCwFEscLVxRZoKBq78w/vq1J3OzddbHV2hpiu/+4IGfUU/8CJXMaRyfzi8pAzAutey/18boKrKPAGF8gIlz31LY1/xxvsvaCs3fYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651644; c=relaxed/simple;
	bh=UnJvUJpRNNfyzbju9hIRD4XCLD21HfjRzO2le0X23OA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9IO50snSNoTrDPsxPsbYkBXosgI89aX16n3P5WsIEMtsy9p6nvKd8hw4L88Cugl4Q1JMtqMq8C+ocUFKxIQCDU4z6H2Mdotf50Jg8O7MW04J2Vsy4nuzi6IM6sdP1TNp7ljgHAB4p4l8zPpWcVWEVi0Stn7N08ko5L5PQukXR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ct5mndGR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYlhFcA9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p7QE2932908
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=igakZ+T9PFkC2Q5DCnBIRQV1
	/3qc7a5qRdWNS78TK/Y=; b=ct5mndGR5KLs3Y9OTa0/7E2LHpnDoK02ZbcREVYN
	P0Zs7zZ5AuAuh3fhGN0M2qNWm3qdQjKDZAvJYYv2wNrBBZndhkkI2UJ9gbHmRRfS
	i7C7uucqzfsziVpXHlyr5TVbaS+iXseo8wPCWLzRSLK0njI46vF4ayS+ZoNKlKUK
	gFVp22/ECt0DjUJdMtHCJBWT9d0DWWiKFyrLaUOoogXcLghrdodIX9Ju0ARs6L23
	qLW0oDf19el2UOyOaygz2PqiKg+60QUnAqocRIuBFE7j30+qJXCmKLhKV5SB2jeQ
	GRyLQxxwkg4yCRHBCW0tBplxlFGniO+6xJRlTgCxFO2ZpQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319uuxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:54:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50ff0bef198so131100721cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 22:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778651641; x=1779256441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=igakZ+T9PFkC2Q5DCnBIRQV1/3qc7a5qRdWNS78TK/Y=;
        b=LYlhFcA97dD7YJ8LP2X4t30/qwZi93/KsHGwk4HJzuAPqxXUCd/O15+MUKwCXB6283
         7O7vBpYnEs8ieCzxMTx1un4CjjEHMotVAoQLIZbWNP6Os4osQzysh7SJFKl3BlhE+yH6
         9tw5ZM4Dx8ZzaOJQqWGe7FuUdCrghvbJkG8GHdtq+ccU/pBza1w1tfltEJZ9EmRLuipg
         /QR8ndaCnWe6LwsM3sTiLYJr/YeyMThL8hwsCoX/wr2+5Sn0S8tuFLXvLd44g49XcB/e
         e95qeQ2TG/Aq8zoKGNrovgegV2j2n8A6m8IId5RUYlJ0fWREUyvLYp15Nn7GIG+vUdVx
         N0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778651641; x=1779256441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igakZ+T9PFkC2Q5DCnBIRQV1/3qc7a5qRdWNS78TK/Y=;
        b=KOCGr1k/e3yVscTszyTSAbeoqyh1fve5VbeAaT41A2zQb0JrM46SpEtpQqF1ky4cgT
         vECEvhCQ9I/GWfuYMtMRNY79ZSQ+vX8GOi6w034/hpN8bW3uLHClFgelBmbX+0gpLdJ3
         gHLD/v9yBXCiiB/kvMk7Q9Vj3e+5QJ4EBVWyc+27jApOpe5NCmvO+F/ASVd6/urEmtMZ
         saVkXYghBKXvIDhuRT0BMvspSkB395CoO8MEI/he2o7CwPWLfrQe4MUOaE0PbA9M0+qp
         XvRKR4qvtoyxhOeQ8/gVcCpGXz0liZyhrROtjqRSehsY/xYGhloNDudSDt26PVeEUmng
         bKQA==
X-Forwarded-Encrypted: i=1; AFNElJ8kbsMikskbZMq5UG1ntgvw8xfVLO9erUgrSt/dFGVUdry4n0xpbQW3iUacKNXr8sqFuPYMOcjwvkkxLK2S@vger.kernel.org
X-Gm-Message-State: AOJu0YyQZL1/skNakptZAwvl15cL2EjjfxV//03FDDUl8vGU4mFng9bw
	GWnvwEeRLuaksQRU9hIeVmjLlELZ/ed2MJmHZCl5XWl2C8CGrPl014kwtAvrMsOl4EcSGAG6rSD
	esMOJe9w9xkR2bvl9D8uxcs/r/zgvN8oMbxvKessPCrhFAvc08yxOdARFdJ/cIfncGLjZgYO2al
	vl
X-Gm-Gg: Acq92OHyVMAJ+B57DVp+ku5nHNe0JbhaZyxF83Z/k6m2nDW2Kwj32xkRJg9IRteIHin
	j1fCX9K9IQbFNOhWA4QVgy5dxxslAdl3AnPiY0iPY/fkUM3/1LQpaEZPe4G6xzTiMoQuutD/sHZ
	1ZjSZatyXRVsDJLs3K7TNN0szP5pcqyITvPivjz/zvgu+vIq+2YNZAx7u2vxxT6PpEi/xTXqukS
	rYPT5QXcn/KAM4nW745gVLkBHE4eWpLZBNCESa+Vf5Sf8GCeCEZ91TIl2GQv2mdxpuDRN5ks1F+
	mMqxdEZJIm+37D7U/3OXm3fVIr954jzOc/fLGnRkJl/F5ppCaO3JBi5idZklmZanDw1bynp8osN
	c6WZ4jFQWAkTJlAnrjWFME0hR02NEai7sBS5J
X-Received: by 2002:a05:622a:295:b0:50e:6313:6e12 with SMTP id d75a77b69052e-5162f4c2bc9mr24529001cf.16.1778651640909;
        Tue, 12 May 2026 22:54:00 -0700 (PDT)
X-Received: by 2002:a05:622a:295:b0:50e:6313:6e12 with SMTP id d75a77b69052e-5162f4c2bc9mr24528751cf.16.1778651640373;
        Tue, 12 May 2026 22:54:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548eb75c29sm36600978f8f.9.2026.05.12.22.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:53:58 -0700 (PDT)
Date: Wed, 13 May 2026 08:53:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Daniel J Blueman <daniel@quora.org>
Subject: Re: [RFT PATCH] clk: qcom: dispcc-x1e80100: Fix (possibly) dumping
 regmap
Message-ID: <esihuhpvp64c5washjymefi7p5272xh5qlme4myja4mduu4drl@i5zzpps45s4h>
References: <20260505152908.302097-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505152908.302097-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA1NyBTYWx0ZWRfX3bVUc+qZtXty
 iO/htJqAX49ecRi0yEm/Wme/7sulWxnD+J+2AFaxhTfdR/1ajoQ1H3UwPAG5XZcDfiV6IZhbk5j
 udjSVcCc2RG7e64Q1a/3fwL86xKUqUtShKGVNmfsu0SgMl3/+t7OSH7f/bWcP/N/6RhoMkLZ7II
 R07cx5wauXDHu7eQTEyRR2x3YRUWSaI8IDRw93C4yIVqMq2xga+HutuBvoAxpR5ejo7tV1LO+lW
 /wNSyNAXBzTbATx0id5/rNdgKNaxU85YabEzcsinLutOoFBw9xRimIdwAYy2p/4sDCMKqZw/9hz
 pBVKrYRXQ98fesBVAoHMzmLRBXEIoTlIubqz1h0VtffeSDWwDYjj0CqeJvm7om0MCL8JUlFZIhF
 RudEbEl8a/ZsBbjaMMrgE0J6y58RxP+7KNgu02J6A/nQZP1vXjARrvhGfwRSwGQe3fKzrfOUaEs
 Bg9H0mLzyaRMW+v8OSA==
X-Proofpoint-GUID: PSVZYIqEjMfLv7Twf4XHkvCpI3GHypiF
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a0411f9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8
 a=ytYsqP6yL_s07xMKdPkA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: PSVZYIqEjMfLv7Twf4XHkvCpI3GHypiF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130057
X-Rspamd-Queue-Id: 59E8452DCFE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107228-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-05-05 17:29:09, Krzysztof Kozlowski wrote:
> Reading few registers at the end of the block (e.g. 0x10000, 0x10004)
> might result in synchronous external abort, so limit the regmap to the
> last readable register which allows dumping the regs for debugging.
> 
> Reported-by: Daniel J Blueman <daniel@quora.org>
> Closes: https://lore.kernel.org/r/CAMVG2su+V5fcZ9LOC0Qm3bpfnhpbmQdJackc7-RvfztDL_dajw@mail.gmail.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

