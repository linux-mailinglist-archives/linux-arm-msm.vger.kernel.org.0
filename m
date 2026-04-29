Return-Path: <linux-arm-msm+bounces-105191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uElmEG/p8WmalQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:20:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD5A4936C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B893830156C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DB33EFD11;
	Wed, 29 Apr 2026 11:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kogCp32t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jF5jMVYS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7904B3DB63F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461608; cv=none; b=J8sIH5cuv7bDF309/8/QpGPcGzX21XspM9a7dUWorQmZpXZFA0yC45WBt6K9P6Z73gnXqlbx2z+PzFE0WvDzYefVSaPCnxSKjCY8xIZJFCz3H7o9To/lAkjrlC3hVLlj6tDwW/RLAseFryoGtLlcyqOZ34JViqyj3G2aUU4FwHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461608; c=relaxed/simple;
	bh=HycvfdCnGv/wFbxYr1QdrjLugfIpfHuxGvOoLjUxsuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eGuJTsN2d/CEwBFSD2+vVTDaNODf6+psMH6Z8dY2WBK8U54+vw+p4PnK0daC22Ms2GNS5rLLV4THzxUkK80uMRH9lKWcS9phyTKwv518ChvehjgEN/VlTBh0ya2fTAXARKy7lQiOLloGEBENCLWWjjwD7fUBCcwWUZOCGsbrlGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kogCp32t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jF5jMVYS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qkLZ2016413
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NSnqrdTwbXVr0DvCnsiHkAWhdNfmazKdA5tEfbIpEu4=; b=kogCp32tkCuf3wln
	B8qDaexLRVQkRsgO/8WI9aIOGdb2Gz3juE37tXLhTGVw7zOudy9w4Yn4Waqq6sTe
	9ZfhxmoJanAE3unnbbyydo9La4omPts3XUugtxE1dzQGZl3IMO9xsL9pUCoBDVsh
	UhOQRbNueY1nULK0eyoXH9RFEyeErHehBNMa+/CM7aDwshCizcFKkSj3mkn+B1Pb
	BoJl3IdPPN2SfofoH1rQfWy+CpQ3plr/VGLKuF9tkES/YK8p6UYJCl/RUNSvf7MT
	xHH8OlHsVk7cH/u/ZqZuZe6Bn+bY9JhDuO+9zgzy3MlDEosA1Tj/K8GPRwoPm/7I
	/RBlYg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du1eebh86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:20:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4678c6171so117290615ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777461606; x=1778066406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NSnqrdTwbXVr0DvCnsiHkAWhdNfmazKdA5tEfbIpEu4=;
        b=jF5jMVYSzNUbTlUgsNwdv6il+5qSAt0UknXBtEug4Xe3Z7uLX29lRbbE3C8vkwYHdd
         m0XpecyYIOAFLrjN3ORfu84H6fh8+zwUajgWVj1S66mpJTn8zXSniUy35hZqBFWf2r6I
         OFXv4id3+wiHIQP4qzpjzhO5b4EP5OljBUYVHR2IAkNNH72KlQakNt2k8WuBrYV0xMwy
         vGaSta8D1eVRGAcLDxsjXGoUOEVeKK9Zv29v4jK7hlSv5PlDzh4i0TIhUX5Aa2dETQ0N
         dtgmJ8Y5zHdH4Q7Pc9g7gYokozFxeT66HQUjQzzC6OcsZW/OrqKEm5cHE1PwYZt0AITs
         Qc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777461606; x=1778066406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSnqrdTwbXVr0DvCnsiHkAWhdNfmazKdA5tEfbIpEu4=;
        b=hZKVQHXKKO4eLoUML9WCPYHB59KeiJU9b/6cdZ7YUZdzoeQQIB+Wr1tB3unn5gIYk4
         kIpCQOVUwN3FtRG2ZkGWve+r+Kc7w8gORJzm064dth3aC42iMXdf157oc1cFYfe8o/sW
         f0IiX8S5vgaT1w1dHQY7q5qIwY+DyQgDa91DcIC1wtOjd+MR4vuNNy1EXouLo4VSmcXc
         bEpOG3+YLkfms4G9m1Uh/7Fw6XQztrIH9wX+PunjeBVZyWBOJnTqDhQdLDJ+vRrP1g7+
         uSaGCRqwW8czcXZ+IjqO2jCQ1Enl8TqbqiVxuZqgtdEpxRycYIsOW4MWhAxnD41yhdnv
         x1Pg==
X-Gm-Message-State: AOJu0YyYctt4weOgirxi5p2OLJsca6QS2ZAIjCF3qf/GlweC5K5KrVoo
	Tets7zcfwhW5X/CkWPYKkpjlaCCDOOW06EIeVi1qUW3Uk+VRM9pE30mGETNzzGjrpyR/dkY/GP1
	slPgb/wG6/CKNp8rqH067nsruAYGOBwBN9pwADIjo/8ag5Eh+UGV/wngEWKSF/Dpp64Kd
X-Gm-Gg: AeBDietdO7ua+rQwyB7MZ+7OeuRTHXS6OilbZ+LnCAY16M4H/cLNMuBDKRuELbn21QX
	Dbj/0fBaOhI+U5syCtCDDEg/hxpSJVpDBpxmIm8FfRnteVnQUeWCkKYS6HjVBlUR9gtYfG0w45S
	UzvblEIEO43kJBWXKx1laek8kj47p48SBIlf6eNzGUzTJjpiagCDqS5I4oBXbE+WQCh46ye/n66
	NiW52kL5NLXPwy1GLwqX/qtQog22g3QG8DiFjTcCr5ZYMOQDCH6WdHiINJsHZsewQaOZtcizzYs
	zrqEAN7Eg4Jmi2Lsx4OMiiXTb5d/3c2RmfURHjA4oa1ug0Wv4k+7smxTo8s06tb3rjTSvF249Gb
	qV+oQeD+d4L9G6t9M26MRlwWHVnNooRXtU4T/7HWrWnfTuIb70SIH9P1NxsqrR4Dn1BdihQaLcF
	RTTNZ0yIpJUydt1rXfhtQazamjNN2hAsKrSu67YzYeJF/fi1uoGPc=
X-Received: by 2002:a17:903:3848:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2b97c03f4d7mr69948885ad.0.1777461605937;
        Wed, 29 Apr 2026 04:20:05 -0700 (PDT)
X-Received: by 2002:a17:903:3848:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2b97c03f4d7mr69948585ad.0.1777461605458;
        Wed, 29 Apr 2026 04:20:05 -0700 (PDT)
Received: from [10.190.200.117] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f209sm18554265ad.52.2026.04.29.04.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:20:05 -0700 (PDT)
Message-ID: <02b672be-d721-46b1-bf40-02d0c6cd0870@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:49:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/6] arm64: defconfig: Enable Qualcomm reference device
 EC driver
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
 <20260427-add-driver-for-ec-v8-6-702f74e495f7@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260427-add-driver-for-ec-v8-6-702f74e495f7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C/7ZDwP+ c=1 sm=1 tr=0 ts=69f1e966 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8EeM0g2abuOJCfGMYRMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDExNCBTYWx0ZWRfX7DVHH3rjKgJt
 C8V3FHo54XdwpPocM9TUcrRfdyr/LzHKwsI56IKMWtIIpJQeLRg2XKFeI7ELlP4ZL9Xsh+/h4xV
 4Gkpnu+OK4/EfGCfnSDZhtX3G7kvIR2sk5mVSJmK1jJoXgeOl6Kkgy7XW7nSqHNM2E5PWbqWuw6
 BsMH0p5aG23KX/RK8NdMyVPr1Q6r3j3vtmO6/+t7qWOH1EAQZEGjNk4B93+J2ZszX+C8OPtp31P
 XqF+0j6/gqOMEoxVjjRLklPMvYGBvo86xeNBrV4NkPlLAeAwsjViO7TOB/Ws99lNfrsgdl7O7pG
 jcpJ6ZmStwIy7NG5PDVaalfTut4EdfYeDKBCaAag3KI4KeSa33IrR15nbvQNmyvgyxHhwjTs8YQ
 T364Rrp0AljCV/xVXGEw8XC3YjC1yKpbj4/bWpZPYOK6SZ2Fn8WK7fjx2llquImdErHhnHwfMfI
 DBOKUxARlkQFwd4Tpjw==
X-Proofpoint-GUID: XFyCn3jpk-MfuIc9jRQGP4hnksiLmLXE
X-Proofpoint-ORIG-GUID: XFyCn3jpk-MfuIc9jRQGP4hnksiLmLXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290114
X-Rspamd-Queue-Id: CFD5A4936C7
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105191-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/2026 3:34 PM, Anvesh Jain P wrote:
> Enable EC_QCOM_HAMOA as a module to support the embedded controller
> found on Qualcomm CRD reference devices such as Hamoa and Glymur.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index dd1ac01ee29b..c48fce61d738 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1440,6 +1440,7 @@ CONFIG_EC_ACER_ASPIRE1=m
>  CONFIG_EC_HUAWEI_GAOKUN=m
>  CONFIG_EC_LENOVO_YOGA_C630=m
>  CONFIG_EC_LENOVO_THINKPAD_T14S=m
> +CONFIG_EC_QCOM_HAMOA=m
>  CONFIG_COMMON_CLK_RK808=y
>  CONFIG_COMMON_CLK_SCMI=y
>  CONFIG_COMMON_CLK_SCPI=y
> 

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

