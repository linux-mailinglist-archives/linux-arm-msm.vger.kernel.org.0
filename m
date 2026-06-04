Return-Path: <linux-arm-msm+bounces-111134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g+ApO4oWIWo5/AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:09:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D6763D289
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:09:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UDGob3Cj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=E4YPp23u;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111134-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111134-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E12D43092F2B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 06:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBD43D47B7;
	Thu,  4 Jun 2026 06:01:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F14414883F
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 06:01:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780552913; cv=none; b=NOhClhqth/HrldW4fuiOq/YAPaeI+/9w8GUTmof9xXD1r+it6mFW/eRBnKItCWQJSIIHsHTLRC52EDdr0myyzDuzxdsAz9fkONQH40nvADWvtvvpcy7o6sp2Ki+bCPW7uhSWc3MLPDVHf9nBKEYcBJPSlR4tmbYlUPfMc8dlYgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780552913; c=relaxed/simple;
	bh=84ayR4B4aJcO8wg2iVF9z+mIv5zWJb6AyHz4PJZaKKw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gStjhUzUn8plhSP/mBmEbH4fi/lbKVAtLxRYQ1/gNYfY/g4W6qIaco9rwseMBvnVzoOQpaICAPFgTnSIwhItErNAy4EYOW++fafTl/JMYgsT4rtmppFcIvyGYkeSrhVchMCZLZDRToYm26m17l/dT+PFpc7LL9IP+t7wVSgz/ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDGob3Cj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4YPp23u; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653N2tdE1476717
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 06:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8dgiKFbDkeqTH5aR0tttNrB6PzO3jiYE3qdTpFLIH+I=; b=UDGob3CjXLWnXR8g
	a8MND0HbYIqj8rzuTe2NfSH3/m0NLBo9WOqOdf400ZJ7caQa1WfPWd6Y1GgTHMjt
	hOn53rzZAjqzi+GOx3k3QzfeAJEXOQOqHRVf+rmhoh610M7ygUGcSXENphnJ5DS9
	Pd7/aahzVbCBsXrKPLiGkfX5812wIOHCosnhjnFDiCF5+q9ZY6tCUYIwCDOeiNIb
	DPiMMoiTct7RlOJOavRtDk0btDlq/fICev0kTIoMqw67iMkz6aL1p0aM/bZeMpzu
	hsRYk/D0NGP7OEneTCR4uq56B30G4/dHa4r84/72GZQumgPKBLzaXWZYdOeOAZrf
	I55u6g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nu81t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 06:01:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf1845bddfso4941755ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 23:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780552911; x=1781157711; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8dgiKFbDkeqTH5aR0tttNrB6PzO3jiYE3qdTpFLIH+I=;
        b=E4YPp23uBW2BsbHy/W8BQ133y0nUvg062KY/abctjKkPWpFSpbuPGg9/WqWAhbK5+I
         NtarJZdM/UKWBt2PfQQojlM30s7LlJDFq9jFCgg3zRMEtxPfcrLrmWsZ0glkUGg/yYXc
         E9Hx59KWuZQ+ZHRJDlvarhW699A7L2siTsSXMWOjgfOwTy0orWzX1qCt5+oSkkQ/KtRM
         RkRJf7mgRA6/9ulpDXLcyxASx5Tn6hm4Qcy8N/xmN61DWLVjIbyZObYSVr3zcyMOWlTC
         X1G3IWZW1HihongoK5IMhL2ywMQLXwkxVXcoOCHts70M2SYh426nkcthoy5D6jbUKry0
         urKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780552911; x=1781157711;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8dgiKFbDkeqTH5aR0tttNrB6PzO3jiYE3qdTpFLIH+I=;
        b=lKaK4zWfyg+sQnhVJKThVynsP2vaJxSjZoxq+aTeufKl8AnDN4X/nXZ0AzpeVoJKWa
         BUKtDKFcXg/3+p9838zc7H6LgX2K6jgp7JYLeSksjWzj3lkPpwAn3P9pFKRyoOhtJnN2
         QMZczXFMJXpECEFJnWC0FqZ6neZfxM8Yim/B1h+JLluzjd263miToJMWj/JJA2MK98Kn
         Ud3S8Zrl7U9/MuVQhClJRlpq0hx25HJ8wvrv7bdcOonk2jgS68/7YpXp05tS0iIJCjCz
         qWo5GE5JuxBiC/bymIssJa3yrUhJ+EM5OuhrKahzEhzFuaUEpYTzWtcH1UzSnA0w1RrT
         siuA==
X-Gm-Message-State: AOJu0YxJzPRit9tp78ZgqaV0Om/aqNLT8vHt1GiLA/gywsbgA7gQIiqj
	PRfsIaZzvbKgJV558yCWoIhWlPqwYxNIJZ9vo8UexEoEBjqlZqhdukxeiAojYnfKGRWvtuBZWr4
	NCUFWkUu77KIJCcP38U8HAJwj0r4iNS2xUvF22xyd8aDAX8cuxx6D9qT5/CHGkW+KcAVf
X-Gm-Gg: Acq92OHjjOsuJKpMZomYjXUFaBX3vzLh6gNOgj0Lc7vVGA9Mz0tlIPbmI4GmwCW//Tb
	dZ26eMxXnxbhTe8DZAqENg0IK16cv2QNLE1WJ5KicpT1uLHCUM+a0QXRdChGSB8tja4o1jH4Tu3
	+wkDZtk/jVYGgewpq4XfO6WAvWJ2FZjqgcFXjm+0OmevtDOYSzxsxHnorm2PJ9m3NjXEJavjgQA
	dWWzM7GN6O8P1nc9MRXsi3G4lDroVdEYRnfYncKD8agka5V6SboU9/NDhxGtGQi0beHkTK1RyK3
	UjWmgOoyms9h3X4yqxbmDuatcML3OgvEFZcZV9gmOA+E/zboENJNqTbUkCqgCd8PcA67xDtiXsK
	Xqug8JW7CqQhSlHRYxNuTEG4Fexadtott0oon8jJSB9SbLX2SOOScQ/z0r9xpu4Cy
X-Received: by 2002:a17:902:f547:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2c163a3d1b6mr73809045ad.9.1780552910463;
        Wed, 03 Jun 2026 23:01:50 -0700 (PDT)
X-Received: by 2002:a17:902:f547:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2c163a3d1b6mr73808695ad.9.1780552910070;
        Wed, 03 Jun 2026 23:01:50 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609ed97sm44346975ad.41.2026.06.03.23.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:01:49 -0700 (PDT)
Message-ID: <29b9b286-63a0-f659-8407-9e8b5a9487de@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 11:31:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for
 video GDSC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _zaRXMuWvMj_ONIkG1f65JhXkY-F1bAL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1NiBTYWx0ZWRfX5PAD697ztXdG
 t9R0bdPSoCVoTzjNlHnr4QuKFGy2K0XnIKCfVtt34v/wVIwGu8iexVa6PmqhRiYP/8ZtD/7WcrW
 sKh/gpvz9laEz7TePRit/o0O/VRbIsW4fPnEfTWSfTIs13lWx4Dy4vsm3BwoOlf2j5bIrSMaZ56
 aRREL5+Nvm78nh1ladidXeuJ8rgQvg6n9vD1EvUb+zaXEkqwn+3Huit+UokFAlfCGHW2+owlArc
 5gp4/nlz0JkdTEwZ1d7VXa+8w/FXZ/s9z8OrsXkKH2jRn+L8fnPAzdy6P5UqM0QHUoMgPupj7mD
 emwVLzaU1f8Pr07FSmn/nrdc/FQESdqkkPp4ChA4nI6S64oq1YuOuVlFIqR4D3Z5zcFBS1ZX0pn
 l00dxrgykwbdGdfrKMX7Tfg8kEkI2m3e7E++A5uiyDXWF8/lzTLC9pz/PLAm9uYWlhsYzM9UGde
 UQv1+0Ifa8bav9+GTFg==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a2114cf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=V4j3QN97b3vMt8JjJHsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: _zaRXMuWvMj_ONIkG1f65JhXkY-F1bAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111134-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48D6763D289


On 5/15/2026 5:29 PM, Dmitry Baryshkov wrote:
> The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
> the video GDSC to HW and SW control modes at runtime. This requires domain
> to have the HW_CTRL_TRIGGER flag.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm6115.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
> index 4c3804701e24..c5251aff9886 100644
> --- a/drivers/clk/qcom/gcc-sm6115.c
> +++ b/drivers/clk/qcom/gcc-sm6115.c
> @@ -3218,6 +3218,7 @@ static struct gdsc gcc_vcodec0_gdsc = {
>  	.pd = {
>  		.name = "gcc_vcodec0",
>  	},
> +	.flags = HW_CTRL_TRIGGER,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


