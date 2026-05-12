Return-Path: <linux-arm-msm+bounces-107084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKmQNRMaA2p10QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 14:16:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D03E551FEA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 14:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C0EEC3008607
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 12:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F3F360EEC;
	Tue, 12 May 2026 12:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVNhecLq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zto1N+Kf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737B53314AC
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588174; cv=none; b=lvWw+SHOdghqkp/W/xyP/y1crVHUGbT3PgkfKNOayPUKHqYOwCIrw1isrvPloNMckikI+bhVeNhDdXoqx6Cl3EuL4YIaw5qEz6lmANoWi5fIgnw4KZ2Wtz3LI39bNFZ04TwdLT6W3eDx9JneH+oJ+J3AQ/fxAAUT/yXwUsG0ki8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588174; c=relaxed/simple;
	bh=WJbj0VUbTJOIHsU/qG51gaTf4+FZ6AkK+zLqDSQueH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F6NGobziOC1YCJPlFRUecR2JGTrtLYztFKMaghxkgvNY5z6c051i34fpPAbHcH/oX5jtd4VgQN5C0Gmpc66XZ5PNVfXl4aJgeWs4QSrXKEIHd4hTYis4+Vrpr14iX/c0Xm6K4ch6FpeXFXIJbWSgbj9COpK7XjFcUaqvVqoMVOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVNhecLq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zto1N+Kf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAtWcw3384770
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2MDoLVE56Y2SNVjDTt2clQoJLy4r8ALPLSko4jH/grc=; b=SVNhecLqJKHYixPe
	HP9mg1XwGcFFWuidg9YrFgr0QKRdMIUGAxBWHzGYHv6c8RYuwaqV5PDtRTY4vOOV
	BLAHMrXula6NAxYJnAQSkr0WO9b2ybOlhW0ehZVOlTQfU+q3bjXO9PZB9RUqjPNa
	xJ+efA2tv8lt4Hb6CVgXbfpqQ+b67xPu86aVNEjTtY1uLMFoEkMnaZwZa6NRJKLb
	GyIpO1FR4T6M7MBgnUtAPNY/MK+XWL3cUnNwu5Tg11lgNqVklk405rGLnH+/eRI9
	JdU86OemfhukfNavZXypt9sxADOTq2NDSZ97X4rp8306oJdYgLkOgZCLLLAt2Pc1
	/oUXwQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv4k5td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:16:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d4c66096e5so121218185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 05:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778588172; x=1779192972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2MDoLVE56Y2SNVjDTt2clQoJLy4r8ALPLSko4jH/grc=;
        b=Zto1N+Kfkj14liplHojzeoDWsHzVsoaJUOgkuN3Tgj2LrnK/Ubk3+pY+K2YRfIdhSy
         aMHcWfgtZlgNcgTedG4BosyO7/tYhmrE6yzBADHSOt/EQd9iMVuWTXM2OuxJQNpTaMQI
         GovBb2kU/PoR7+bVNU5KR2ys//3wrlre7C0F5+zTSYZXfC89VIH5tyrU+uy5Pz0eotkb
         6QCuds/34SiNvwuD4lxSAEQH+ImMBGtkw1bnlXCynsVrdIZbzRkBqBiL5a4oWasSgSCY
         KIbypXZkOX7Ydj5A2EblBc7N2Dh2YnnAYgIyorfLCLKta7GUmHtJovQo+ZrWU0fKIuG3
         65mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588172; x=1779192972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2MDoLVE56Y2SNVjDTt2clQoJLy4r8ALPLSko4jH/grc=;
        b=EcVHvw1M7qHOlbZdABfJY4x8XhwxObS+f47xeo1ZgXCZELHdlinwxMFJAIUwT5QGsf
         uFTyodCr88dPwEBe0Iz86mv5106xsc4X3hEAQJ6aIPPlS0WvaqzJZVCpV1pEKbEMAEaZ
         zyNknELhnBO4/xjnobiVKHDEUWHs8AuQH8de/yBYC0c1jgqOYksuOkWWTLAmGx/MZQBI
         ZzVTSqJbhNlgjzmtdsuIJU0XytlpVA83kv3HTdRQOaaIpkLl5PG8rfId6qIzYWDOjarT
         Pqlee5MjjBZRyzPcmAmll8OgYXE7GOURgwExi69jeOTydmsKALjoDANlp8d2vv/qtzP0
         7hfg==
X-Gm-Message-State: AOJu0YxC8+tUWzon68SmEOQHXONRrfG6jBwxesWf5A1+zrNaRVq58ro0
	4DD/RJ2T3N9KfTtLzQxjIsxkJxXgWEtqwNxEqIgMPjUfYSpflaA2L3PlrcIHiOzpdWneyAYTR00
	gaW6kXrsaB5FNMsEW2Ikst2jM87kIL8TXqWRPQfIc6Pes7rlCfrOS3teVl45kWUBIeGKh1T4Li9
	Zd
X-Gm-Gg: Acq92OF23b4W67vbBp6vTxvZ8t8FwRfdXGuhZNtMOUCDSyJqWnvLT36jUpLxcN1bZOI
	RRaDPjubOAxrL19wfShvpPlSlcozItgeAwLDbm/O42LCvBfTjYF/VFtAObFs4rUnVts1OZBAKzS
	I5XnREtVOJ0Fd4Lj3lzOoYjqizuYbgI+341/KUmv3SzODjhYbwKDn5ebr9+eKKUqM2a9G1ZpTWS
	JiRYaxcDyUYyfpESRFEcU2fqwHj0HbJlokTwrQErLULeWeFQX6G1Dc4GHaH6awiw7U5CkIM8uau
	DTaA60FRO7NXS2XWTv/NvkkU7mC5HsgnfQNlH7fyXyeDHIFK+thOLrkMoiY03tHqMYtYyOuaLBa
	SU9dBa79ZDW1iGNvlr1LBZ+afbbJvJBJqCCfnsPQJ1WioSWl6k+r1pUyVIYZGhIVTJgIaQCq4K+
	spoeU=
X-Received: by 2002:a05:620a:2894:b0:8fa:1f2c:c9a6 with SMTP id af79cd13be357-904de2998c4mr2750327385a.3.1778588171643;
        Tue, 12 May 2026 05:16:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2894:b0:8fa:1f2c:c9a6 with SMTP id af79cd13be357-904de2998c4mr2750323285a.3.1778588171091;
        Tue, 12 May 2026 05:16:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67f7d2b204fsm3850056a12.3.2026.05.12.05.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 05:16:10 -0700 (PDT)
Message-ID: <e032c072-57b3-44b4-84a7-5aff062b9c00@oss.qualcomm.com>
Date: Tue, 12 May 2026 14:16:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: rpmpd: Add Shikra RPM Power Domains
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com
References: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
 <20260429-add_rpmpd_shikra-v1-2-fdba28564380@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429-add_rpmpd_shikra-v1-2-fdba28564380@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZrTd7d7G c=1 sm=1 tr=0 ts=6a031a0c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XoaxEQdo0zjKg4FK9Y0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNyBTYWx0ZWRfXxPrheX0RWgbY
 YzdiJLeoCTH9fErJRiAZer91xnD+WT04frJXtCauJ83UEHlSqeZGQzfL//youjonfJk+s+y1DHM
 M/nWbPsAX1sz1ya+xSIroLs6hInaRzLkzxIYVpDbTqC0n7S9BX2hfjgFEmOLERa/C/zGSA5z4lH
 8Mt/s+M5jk39aJPMwY13QUalIllwiHDU+filXYMFNFAxoZINAmCVkKF/3MxIvX/itt/259T0CYr
 Mbggj5CgHMaKVQh/ip8PaU8OcW/1LVPpvOGeLXq7f8eudZJJBNnBrNldvj6zl2aXxmYdXoXnWyR
 5lbBihUezh/NjKCYzZn7jc1VVsfBhS7emcZrQO6pTPs8FIObSKGsw6h7ktHe21bypJbcO+JyYmG
 J3pETKqR4cb95u34OREdNTytg5kU76yEXVSiO7VOGKPhn62IlcPh/TqcMn0VPHHv09kEir4btC2
 n4/k6/0x36LmtjvC7SQ==
X-Proofpoint-ORIG-GUID: IZdTcUJF8o3tSaelcWjPiWbqkWe-QW92
X-Proofpoint-GUID: IZdTcUJF8o3tSaelcWjPiWbqkWe-QW92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120127
X-Rspamd-Queue-Id: D03E551FEA5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-107084-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 4/29/26 4:09 PM, Rakesh Kota wrote:
> Add RPM Power Domains support for the Shikra platform.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmpd.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
> index 15a11ff282c3f86b1e86c6604d165e297620f6cf..6f751ee5a7833912d54d2bcfd5d85837ab7a97d3 100644
> --- a/drivers/pmdomain/qcom/rpmpd.c
> +++ b/drivers/pmdomain/qcom/rpmpd.c
> @@ -863,6 +863,21 @@ static const struct rpmpd_desc sdm660_desc = {
>  	.max_state = RPM_SMD_LEVEL_TURBO,
>  };
>  
> +static struct rpmpd *shikra_rpmpds[] = {
> +	[RPMPD_VDDCX] =		&cx_rwcx0_lvl,
> +	[RPMPD_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
> +	[RPMPD_VDDCX_VFL] =	&cx_rwcx0_vfl,
> +	[RPMPD_VDDMX] =		&mx_rwmx0_lvl,
> +	[RPMPD_VDDMX_AO] =	&mx_rwmx0_lvl_ao,
> +	[RPMPD_VDDMX_VFL] =	&mx_rwmx0_vfl,
> +};

This is identical to sm6125_rpmpds. If you're sure the list is correct
and complete (no LPI domains etc.), you can drop this patch, and proceed
with just this change:

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0bf1e13a9964..e7d9e8e65641 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -73,6 +73,10 @@ properties:
           - enum:
               - qcom,msm8937-rpmpd
           - const: qcom,msm8917-rpmpd
+      - items:
+          - enum:
+              - qcom,shikra-rpmpd
+          - const: qcom,sm6125-rpmpd
 
   '#power-domain-cells':
     const: 1


Konrad

