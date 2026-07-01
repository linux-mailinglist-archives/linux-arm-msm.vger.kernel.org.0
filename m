Return-Path: <linux-arm-msm+bounces-115712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2pqXAm0cRWq47AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:55:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA4D6EE6A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:55:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ldr70smB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bgM6bW39;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115712-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115712-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 411573052FC7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 13:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E20481679;
	Wed,  1 Jul 2026 13:22:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E5342B751
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 13:22:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912166; cv=none; b=SJUQ7Do63P8q5qdPvVnKFTDCX0eUeK+PurcRKhfcZsWokTjFi49J1egwaTgD1IAdvvlg3K+gerzqfbnQVo5OdbTlS6wEqGuYtwoXiL4/1KKa+XfKVM7gubSenpNaVKciiGDfaCkdXdyVpqnUr2BTO/P2jEkJqEBFA1ApaJ6TvG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912166; c=relaxed/simple;
	bh=DKQnqFgDvTrwaMpK+r+TY4JSM7zHMX+ITmDtTGd0feI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQgNxneYjgsySS7mP89DPGsaEa7QQHPLDdkFCX6lXS6GnWMr6Cy+MizacWqRjEGMEC+QI9nX+ocxGR+c0fB2puDnE0uLowZbTZRgUpJQY0LNynra60R/npCmsqg/IRT0Otk6k2bDyXbifHzzAciKC4N9v7r8CGb3R0Hb5QwEeRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldr70smB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgM6bW39; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A98O2756317
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 13:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E4dsKuVZYr3H4pAciMqT4eU/Q+AiTF8aSmswDNKUQ1k=; b=ldr70smB7v8HWz+s
	6M2oD56++fE+l+JJJQ5PuQj3pV7sB8KcXw2JtelayEHPAx8AJL5ZILKUe4Jj1wIO
	i3Mg+1j53PHW+Tf2idkFoRnH/5gAAeEYfESZYe0krB0qVjsPL63A6OvCtaWNShTV
	dUC3YdicyPOBpkbedZeTIiQB+c11G3Pcn+t0mk/rPPALvIiX+YPZM9sQ9C+mQ2aD
	5HUXLJ5WLuTYUoU5IlREeqg1xfQaUEbenx77ED5A0ICEPdWJZNXx0bXubl0A0m0B
	svUa/v9BGL/FpkKYxxHYh1EnbKopjEbbnjLcTfkQ/E3HkywHaXsxdjZNj9K2pkth
	fAVTmA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sqrufh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:22:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7392d893428so30042137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782912164; x=1783516964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E4dsKuVZYr3H4pAciMqT4eU/Q+AiTF8aSmswDNKUQ1k=;
        b=bgM6bW39HX/8mxWNO9buiS//scRWzl4IYgj0goRLnyWNkbwMMPwhTq7jAfaYh4Ry8G
         7TDc1YdntmuEQPlnHTgLK8NMVhjBIRWNU4qIsujNkUdJ47wabgoF8ttcxpY6ao8KaBc2
         g763OPMwYZsGiCsir6ZNBXME2fxgyRUTWzxBP26NWfuxfD2eIv44d19lIzpDOqVE2/mr
         KxRa+RgmD/vhpUeweACYa7WcDGCD1Z1GTedk080Bl6ESXe1ui5YAcbBAySHESoKgnCPR
         J31/UyL3Ou3ttynqduE3nwRCXIPw9cWz27i6IzFo29RTYsml0huzjxecwBu7iY8yjo8k
         ejJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912164; x=1783516964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4dsKuVZYr3H4pAciMqT4eU/Q+AiTF8aSmswDNKUQ1k=;
        b=pXRaLFpZsQIwsB2AyWBCSrSU4plu4+YvwdY+1bRkNOfnexnHsw87Yq0ItocB77H1QC
         jyR79rellQLKFdRW6wQKjbBf6sihJk1vXRP39KcUjUPZudGQmGoiJcJ5M8SPnW6FbVvq
         d+WR75BYfQY1Z91QeaQX++6bPZSbbQRNkI/voX0LsfNNlMOKU+XLHzYGM/sxZHeXJ+m/
         ws2S+id1jJPPPpVsdeCU61cQdRqWxFhcTfZgJpDFrVmbY0at2gVV4PO3M+CX+aGPx6nu
         Em/LtW8kXFuWzPGtdpKft22cWND/Tky5j2Vd2ldWJx/EP3/tafqWxShrWA/3/PLVezVg
         1enw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8vm5NwwQImaK7HRsjk7Tgo3FZbTGZ1+TB97oc/urfax8BUbaXYgyN61TEtNUlNw3sYpRfWB8jMimZIId/@vger.kernel.org
X-Gm-Message-State: AOJu0YzT6fA1W20ke4QeB3MB57TN/czMoTAJ/re0YkNBw6P7A6T5BYH2
	2EyTnQaDWwvqsSVXvXkgRNkK9i4GLU+UuNKBe9RgH0O56bN2NOzCtyTIib4ddoYN75luQfQtyo5
	CJSbF3Ga/8YbZl5Swxf3zFXVo6w2b45DFDrK8236ZVM9BtHEMhc5xe1yz7FOoIGV80E40
X-Gm-Gg: AfdE7ckRdxGaZ0ym4lnhwF1ld79cykWz/PWPhyvWh36IZj9SwGTu46ebyWqWYBm3F4Y
	5b2hWtEwdKu9+YZ+bA2O6vGpm9jqqo7wBOzOKuTgLgCfGXd4+XVRNj4dIBC/QRNoGl5Vf+wcwnV
	zPpnflSjVPaHQFA4JTyez0Ty2pGM4HJjC/+gDUkk3FaIQCL6EKga6x1JgP7R53di3HjepY2slnL
	zyRkJup64AcrS0z2AwtvMGdvrq/KsQ1fqLhDYrOPWChVdpKIkAiAqHHK4B6+oanDPxvLuoCjHHN
	ih6MrmG0el2XC/Axav2ATLxkkMS2j+56kJyoAP6rTjONt6ixu1MRspWPvo8yGcUTyF5Ex3r+fvr
	tpHfdk6JgL3Ahbh3jcyDiqa+g5MX9dqMIuWc=
X-Received: by 2002:a05:6102:5088:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73da7a92fbdmr184632137.1.1782912163712;
        Wed, 01 Jul 2026 06:22:43 -0700 (PDT)
X-Received: by 2002:a05:6102:5088:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73da7a92fbdmr184616137.1.1782912163356;
        Wed, 01 Jul 2026 06:22:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12a1f0ebc3sm93612366b.18.2026.07.01.06.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 06:22:42 -0700 (PDT)
Message-ID: <504e7411-6cd5-4afc-80a8-e163894ca6b1@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:22:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
 <20260617-evacc_glymur-v2-1-905108dacaaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260617-evacc_glymur-v2-1-905108dacaaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ffuOvqLDO0Z1DPRyqkvy35ZIKf5a-909
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzOCBTYWx0ZWRfXwTx/F3V3CXxT
 Af4geNI7pRDZ+DnvdxNwEY4y+p8l/Frd5OUD3W8JZ0ngM8VgqOB/7o7q4bm3MLVkm8Us4//3tBG
 mv2qX2LCVnZ5JORzC6/Qk0aDSmSq5tA=
X-Proofpoint-ORIG-GUID: ffuOvqLDO0Z1DPRyqkvy35ZIKf5a-909
X-Authority-Analysis: v=2.4 cv=ceHiaHDM c=1 sm=1 tr=0 ts=6a4514a4 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hAgpJja4_gNiCobD048A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzOCBTYWx0ZWRfX9hUQ0Qz7MMKp
 QHEpK1T/mPy0Q6pzJfJEckGKJD/oQB65107bq/AYyQE9CbfnG/bSdQFmNP5yBHP9b+v7ApgfNf3
 l7geUQSyPEciiJx52s9yofIvc7CtiB7m5uU41OPfmhoDJQCv0uUaX8b5GJSQLb/sBoKxJmKdoXe
 bjyrZaKVd5twvupV0FDPetm/yPElyxbuhviugSyEJR7U98+iahx99PnD3ntJGeqju0gup9f8CWI
 UoQWotXDkdehVnsunpZFRQ+S1Z/ReqCJKohDG2QFRgUFMFfGV8k96LdYkLDieIRlffOM19hMC0e
 l6giJvLVFPZW5xakJkBnMXalGhE2vhzTr9C8DkUGIzy2U1rbZYjM7TyQALKuiYCH541JvBxIagf
 dj66mtbRIMvU6zt0TKhUKJYoWt7EqaXDrmg3+PsuYioxh+GrtcuZkMA0GHQaEH4J8cjBq96Yy5S
 GwKwe4wDKxijwm2cl0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010138
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115712-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FA4D6EE6A3

On 6/17/26 1:07 PM, Taniya Das wrote:
> The gcc_eva_ahb_clk and gcc_eva_xo_clk branch clocks should not be
> registered as standalone GCC branch clocks. Drop these clocks from
> the GCC clock list and instead add their CBCR registers to the GCC
> critical clocks list to ensure they remain enabled during early boot.
> 
> If these clocks are registered as normal branch clocks, they may be
> gated, which breaks access to the EVA clock controller during clock
> controller probe, thus leave them as critical clocks similar to other
> subsystem AHB and XO clocks.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

