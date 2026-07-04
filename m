Return-Path: <linux-arm-msm+bounces-116440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o152FFBRSGq3owAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:18:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E73197063B0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:18:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Ijli7j/b";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XEYpNvlu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116440-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116440-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43182302EEDA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 00:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27841EDA32;
	Sat,  4 Jul 2026 00:18:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B9E18CBE1
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 00:18:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124293; cv=none; b=ZU/3lm4anQpVeMaViJiqeerEzrNHX6ldH5/yiK5rr8lvyCWpMsVR5EttGhfaeW6PHXLLv2uhSUYqqyB7Eay90u8JiiwL2nlxNRMLhYGRQ1q8OJd35llRiYWD1zax426ejRx3ZfGLoFnw/bdEZICKGvIS62VjoC6bh1l0EoWR0bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124293; c=relaxed/simple;
	bh=mLwEvp20IXBRwdat+VIdPCH6rg2xY0MI+tGWK4yiKl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WolDT7xrAMi5R8FERtBOh2lihCgUFRy/hF3dPBdR6lrwz8EWDW96IULfDRSd7vveZ7KrF2PgAaZlnCFl6ks8eTPOkgtk4Nzf+fmkLkvAzcJLwaGSWB/S8cr5nf0nsmgc40NGpzNJyurGbu4zOGxqcaYhe91rVuvrP/yEzWYWAzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ijli7j/b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEYpNvlu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPZWB1029409
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 00:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qu88vDNn8lT/9pEXwEgjFich
	A/sNekO5eCuOlfgco5Y=; b=Ijli7j/bVDtCFJRkN2n+vG0553UrgpQF3XAzciUf
	03KQxfYmcDpQ4lDfvqn/6s1NFjUboUUVdb2TyVo6IjsJ38v7qsHPqW81rKpjPxhq
	BhVfF896srmufyPFREzTGKWmNX8/j5ugsQtrbg5Rj5b0guPDpBgzSmByxMy3Yyuq
	EcbMY//a5J3nUKAk+u9c+PoCWEPfcks+P6lE3YjIw2UerrsUQyu+Rn1nqowuIHkG
	Y61GO3xRY4/igmjZOdXE1LLLVUAO+ENKwHHKa7Gdx09vNyAAcp+aayflbYoQFEI2
	f+roSM3AJ4Ky5kLh0j4C2IXQPeyRfpg4AXeZ/+nkH1RmKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcm22t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 00:18:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6a2f5995so158157485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 17:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124290; x=1783729090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu88vDNn8lT/9pEXwEgjFichA/sNekO5eCuOlfgco5Y=;
        b=XEYpNvluVIz4jU7BVjetOgMPkbS1HgUV+VFYQkDFaf0ZFVb6mNbTRSIUIU0HtDsecR
         6fXdVsHIIF7P5bIFNDNg4atHwLbRWYi8SdcbcZ9BziHJ6rFjHWqxVG9DY8F9xWGyPqxx
         u9zB00Ybq8rggniZAkHrLRZpqa1IhGoWcqwidBKS5UluAuXnk83j1vFKixGyjGsK5gax
         z3GaM6QtTsBVFi/QGXviDioFtYX4Zk67BFul/ZRjCTniJqHGWjvNB4Rojg5BqgKTc10r
         EkUgK8lcmrVQHL9TKPrYRKYO+TmojLDtvhn0lhDgmtoOhpM22t2A099TBiR+slL7pCVL
         lqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124290; x=1783729090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qu88vDNn8lT/9pEXwEgjFichA/sNekO5eCuOlfgco5Y=;
        b=VVuHm/tu9zVtVYKpxEkHtUVIHtipI5drfW36WKSf3tNOGamQDwpstNOGJni6htwkr6
         8eH5GRBbOvT8rhaOpLVCpHa4EtnrYXlo12dHRMn/RVNXLFtPZ8Vx3GgYba5ZflhPEPFJ
         RPw1dAFlPDNWlvqVKKKzqo8DCTLsPT8FXJbeO58Inlk12d1SYcJy7mnFPF++sfZFVV38
         4AqYgexmLxDWrcneTriezQ0vx4Z4AO+J8EamSwTXkeniO+aYOcgrm4dlfkfyOmzsfu8s
         QXzDAOuGfz5u4gBKUjKVver6/GJNdRVD4/jxhsOzM9gxDu/Uo9JSPmBSD+pJC3SuKLG0
         mlmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Mjxa0/B8eAcjwXIP2hcfjL6Dif7Wz0zI26ipZBoMqafxwDpKnJ1uQfMRW1BrMGaRD4Q8CDeT/HXOVnM8k@vger.kernel.org
X-Gm-Message-State: AOJu0YxndpA8AXQSdI7gpAlejTNHXoawf13bc9uUsvg+I3Y7OZi2+EC5
	Hc3iagQp/TpdKvZr+BnsFA7Mu2ZguqRnoPGQld/0uruaWeIrO9NgWxbhc5fin8bG3/GE+aKat8d
	mWaJA8FCNPHAMcSoWQI6CyXWrOLpqhrbukDiDS7BMuA4tPEd4a9kqbhj36cVRgYB2SiYi
X-Gm-Gg: AfdE7cntY7QSY1FTBC+psiK5HAWT+pOaz8bpT/sCBFa8p2gM6rQfac91Hyg8Ca17NHb
	76qjfRaRCI900ZPFNdR/7Deb0sRMVXT+Rzk/fMQ/qfjogrZfAY1bsV4Tny6rWLDhzFZC8ltnSn1
	oYK2iXUi2hS2+DV6DVZWekLmOtBDMjf4Ulz/i16HUXNXza6+ML7uwYKHGmluZCyQ4ES+8rHlxcw
	neswGkVwuZ+wE2C2jmc5Dj3bPnGI2NPHoyqVzGVvumykUKcgvGI0D+CULWniO18TGRuK+sBmCpw
	f5aAZzL/YTKr00HdoVFzpDfaWc6hwC45vdSbTLZK9+ZckQEoSoee1KQeXZ4mTSNIYYQPe6qG2u/
	qjljUUurx403oI3dyBRig/bD8ZdEdxzU0aQ5SFIBCFtslM4Z7QOKq8EMNZ5WgHiQD0ZdtXJdC81
	3h0SUTw075Rt/9xmF72GVkkcJI
X-Received: by 2002:a05:620a:370e:b0:92b:6805:9191 with SMTP id af79cd13be357-92e9a53c040mr220536485a.73.1783124290060;
        Fri, 03 Jul 2026 17:18:10 -0700 (PDT)
X-Received: by 2002:a05:620a:370e:b0:92b:6805:9191 with SMTP id af79cd13be357-92e9a53c040mr220533485a.73.1783124289565;
        Fri, 03 Jul 2026 17:18:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c1c4dsm850468e87.66.2026.07.03.17.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:18:07 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:18:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 09/19] clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for
 DISPCC and GPUCC GDSCs
Message-ID: <e3s42sg5lxb6e54dbd5wyvdgtcakolt5assoa4ukqtgkgus366@4uzp27sftrkm>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-9-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-9-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-GUID: 7SVP0XmzQMoX7tRjmJO2HTBILyhOc5k2
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a485142 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=oFJMpgkmR7-raAe1-hgA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 7SVP0XmzQMoX7tRjmJO2HTBILyhOc5k2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX6xuO0U8/V1FO
 l+EgBom3O+WTttjM5bbDrPmFcCQWKlENaHYuDbSsTYnjhhtqvOiQu/CuNZARHxwwcSj5pQSWBL9
 qwvos4jWHakDqYj5yMSUuj3kWSySCZdgnCt5M/BpoHhYCcvMo+8rl4qXFvZnpVfq/4hc6+nlWMI
 21e83ongLgbisDg4AdXe8GLFAxKS9/43lmi5+SSicqOiIhAp/Yoo6reFgYu77LeUENRgM9DKxAv
 dWs9laU04sURYjYtU/YDHHS2gJUL8rYip3ViRRJgj0yTdpXMqfsi3WeGENXsCBqL5me+AzHe6R6
 ckayqMkOQ1Ns0+r/X5O1LvxPD5PiCQeoq4YsA44ssInXk6foXhECKydziczmnKXHL0p1irMeM9t
 GEzlSHDRqJVauZtC2hddwAR2eUfy3Q+ZwArONZDLEaib6YCWhm3LpEUt2NF3s866ucvxLmnnbCW
 PQZglR16EvPg3bc57YA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX1akYjZR8LB9z
 AeaabzkbKTggdJXW4LcPhydye9nDFNu6LGMMXaCaJOr5P7WmODd9gOf40vbXW5E+clR2LWw6ohf
 8WmyKlwv5MUzGqXmjPGxf8R48if74to=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040001
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116440-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,4uzp27sftrkm:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E73197063B0

On Fri, Jul 03, 2026 at 12:01:31AM +0530, Imran Shaik wrote:
> On some targets, the GDSCR status bit may not reflect the actual state of

Which targets? This is all about Agatti.

> the GDSC, instead the power on/off bits in CFG_GDSCR must be polled to
> determine the GDSC state correctly. Set POLL_CFG_GDSCR flag for the QCM2290
> MDSS GDSC and GPUCC GX GDSC to ensure the correct GDSC status. This is not
> applicable for GPUCC CX GDSC, which relies on gds_hw_ctrl status.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
>  drivers/clk/qcom/gpucc-qcm2290.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
> index 89a6cdd26217381cd44a515766363cf94d0aaeeb..6ee074555099ab72106cfae7c21adbd1b4a0fdac 100644
> --- a/drivers/clk/qcom/dispcc-qcm2290.c
> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> @@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
>  		.name = "mdss_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = HW_CTRL_TRIGGER,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>  };
>  
>  static struct gdsc *disp_cc_qcm2290_gdscs[] = {
> diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
> index 66dea9d2a0e519dfc64d977ef107b5c875da3869..3b130f69bb93898ce49654f2366851a7c1c94524 100644
> --- a/drivers/clk/qcom/gpucc-qcm2290.c
> +++ b/drivers/clk/qcom/gpucc-qcm2290.c
> @@ -313,7 +313,7 @@ static struct gdsc gpu_gx_gdsc = {
>  	},
>  	.parent = &gpu_cx_gdsc.pd,
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = CLAMP_IO | AON_RESET | SW_RESET,
> +	.flags = POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
>  };
>  
>  static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

