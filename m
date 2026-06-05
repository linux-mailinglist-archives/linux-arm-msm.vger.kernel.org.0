Return-Path: <linux-arm-msm+bounces-111352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 97t2H0GgImqjbAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:09:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 205FD6472E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:09:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nv0xwpfx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RwhSjJkQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111352-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111352-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 711033014110
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C193E95AE;
	Fri,  5 Jun 2026 10:05:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD757378D9C
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 10:05:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780653939; cv=none; b=hkigmp/K7x5nobJ0sJeixECyiquV65Zqyniq/1NIMAbWujlD5MYancjW3hLQP7ovPe3imcqO2mjZ3lqv4SPJPUd8BTmR1VVI1s0to0ixs3LiJxOeI5B3TJ8yKxIUXvc+FkU2J6f152l+f0tJKGezZ9sWfKoMc4YwTuvscPmE8mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780653939; c=relaxed/simple;
	bh=duYOw7ZH3FxY+OzRO3ZcutRr/EGTljg2RMxZkiPL1ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MPJQL+ekp+4ePseyNiOfBupJN+5NV71WGP3TQeNlOtNPi/w5cPdKqUXn0GjD2rylyYAhf78Bs4bB9jwoVQS3Tk88Ygo968UZTQS027qaFTjw43oJ/hI1yGFskuiDJskDryyMvVoZKqMlITDoTnJL8M/f5QM+Vlsnkx63b3Eh2wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nv0xwpfx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RwhSjJkQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6553Yd1x2975186
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 10:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ezpHQhDZ3yFgmtg3b97NN8aq1Mlm0WpLkU1kGXpDSVE=; b=nv0xwpfxXAZPN6jk
	b3iSYVrMF/kjHEc9GtvJuiksDxlbp5waTtXOXTK6FyCgbjahbuckHQEEOF8ZNImf
	A6iWD9gP706SE2XhNBc9s3Vh5MfBk2CsaH8R+lL9zzr+gkuHdaA0gLLvQ2clnRYf
	v3O3EAYd/zeSEB/fP2FAnqGF5jDy5wPyB7ScYJepkaCzmc+5tD1+TKVnUj64s0YP
	Z8fVOTxijcnjIr8jRkMZD/qb7e2aLHICOgb3CXkpHBA1uRNFb+9/RUSU68lmkHkA
	TnDgdMx+wXWVVb5HHHA/o8qCvgF4ird+CLyFLvp+9+3nRA2nzoRxMwT9LbVC8cEO
	i/C8Dw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekpnu9dpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 10:05:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf004bf8beso20388645ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 03:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780653937; x=1781258737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ezpHQhDZ3yFgmtg3b97NN8aq1Mlm0WpLkU1kGXpDSVE=;
        b=RwhSjJkQfczZHekHo7T0PRyAqkbp0KrOWnVpMSHbNnXcMTh3spkbPRPqALZ45bN2sg
         JfIG9qYLSnCc7ZgmYfGRrhDozOR17TW4ZsIhNCxlQJ/6TEm/Q5lg4geRFvdSFI1oeEMW
         BfVOMeXSyeUk+58N/x7zd8f2D57uQqkDOMwiVhY/qptmVmWU+d+dEtIy9y0I/39iHhWz
         mxfzGmC+RLLB8Em1L2ZnKox7SCvpw1ukJneoDYf6tGc5FFt7BuWgBPLWadSUnR+8lttU
         aa2Wk7e4bUOWUw/knJ4v7dva5GoNu1a86ioCvgvidkQkgPdcyPw2+YrS56/PfxhatvTH
         tQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780653937; x=1781258737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezpHQhDZ3yFgmtg3b97NN8aq1Mlm0WpLkU1kGXpDSVE=;
        b=af4IQRkEFXE4wjW3iWkz4lJ6+LBl4WaW8nU84NP6RmJoEuHq3zZAoBGiKSG9ZNzu4D
         HX6ZsQ2HRLYIIOjk1vww+7so9Ojo8+tqCL7TZNOIz6mkxjXjSongv0qWy/REiwF2vBDO
         UM0DvooztMzbHc+Vf3HKBayChuTF+6kGBNb9PRGYEGFpsAn19SMZFrf+/YBdxd3SrPlH
         u7p+E/gEiN0dQ7/cFvS/RARi1nokgKew1/0w1fOU2lJHt93zuozGNbPyptmFZRvC+21n
         dJj1U/CRAM4pFQ7x0bAvSS2g+g0D0Q00wcuA/oYgJVbFwaHinKmZ5cEaWTwc5/ir7fqh
         FtaQ==
X-Gm-Message-State: AOJu0YwaLlWjNVu1sEOLLk9K11IkekXetzLnIB2i0vQNE2cKke0g5uqB
	200HouRSXwGM4XWumLQ4PXxp9AnZ1haAyM4QTUveYuAjQ4RFlgr0dDtRGuGjwq5bJvxMKrGZ3da
	GZOnDKkw025D3VkeIx9kLySDOMvhk34Pv9JhlVEpzbPPaWHYVgwtZSgabe8PfHieKpLkB
X-Gm-Gg: Acq92OGgQOFvfBaVmIenerC/kKe6gqtnUHApiAcm32EBCvXxDEiH5re2kWejuNUnh3f
	nXVfkshs/uy8tDyGhKXfylCFmiPBp78QuUAPOSAv5JWyqLdB8JChqOKjHCJQQsgVsi3gFFdnkV6
	Ny9lRcFqrotwQITmEv7Pwjc+7b5cLPfBgouX7c3r0g7iMxx6ONzIKvcpjGBim5mDVSoxRT07XtV
	eqpxl8o44Wvo5iWNBPd5DXX6T9+wvjJlcl1CzIluyNcd6SXfEh2Cmb1Mwhr7HT7QxGOa13A+jTW
	GI5ee4uZTJOu5NQpEDovi/TKSU52XwMsTMp6AzTJER+w4uIYJPtMuPb2F9aE8kxghhM8cWdXP8b
	W96FxNDo8MyyUTM3iLgE34reKYKqMLlM5Q1+UpI8okyyGI12+JuPkXQQ6TQpkIw==
X-Received: by 2002:a17:903:248:b0:2c1:d49c:8396 with SMTP id d9443c01a7336-2c1e7b35a28mr29738655ad.1.1780653936755;
        Fri, 05 Jun 2026 03:05:36 -0700 (PDT)
X-Received: by 2002:a17:903:248:b0:2c1:d49c:8396 with SMTP id d9443c01a7336-2c1e7b35a28mr29738245ad.1.1780653936327;
        Fri, 05 Jun 2026 03:05:36 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm90762885ad.29.2026.06.05.03.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 03:05:35 -0700 (PDT)
Message-ID: <2fee6dcd-d9fb-4ee7-9844-05dd4b999f2a@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 15:35:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: lemans: Remove the gold_cpu_sleep
 idle state
To: Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260522-ml_cpuidle-v1-0-fd311cf33fb4@oss.qualcomm.com>
 <20260522-ml_cpuidle-v1-2-fd311cf33fb4@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260522-ml_cpuidle-v1-2-fd311cf33fb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qH4U-sFSq9q23vL4eD1X8ngzHMYbczoI
X-Authority-Analysis: v=2.4 cv=Ksl9H2WN c=1 sm=1 tr=0 ts=6a229f71 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=cx_M9POd4dFOPC6vIlAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA5NyBTYWx0ZWRfX+L6UJAHPULLw
 3ee5zFKe0xreZ8EUxM86QZBVnFksJZzn1S6xDJpRbC1JCokzgboEg5knkoYzZc6zijDr8KWlImy
 ui9jQNkTA3zAsRqhJn9+JIstBXBTtLOFThhBYiArrDqHncRNT8W/S2/qvgqrvBldw3EYtoiAATV
 ZR8rXu3zeaR14ieI+C52NG0CQTdYwxlwiO3r85lSv77TNOc6ljCvdUA8s6f7pPULR42A7JSwKDD
 ctmCnbUB1MdqjkjnBHV+iNshDHS4GoM9T6I1KZWMivCPjsFyb5dnZ0zxwRdlYh8sZLlskGlGaQQ
 rtDckrmTzs0mZ7cugSOnX14nCiTu1pBriFNHF7krBAHyoPyJUATt7wkvZ858qE0QK4zVG42GgBo
 wyvw81uAEjENdj97guJ68/rJzVyS+uEYPZn8aZ69QRNWbbZDHHM53KnEBE5mlgqRjhaZXcX/N8v
 43nLROl2xor5QkXyLvg==
X-Proofpoint-ORIG-GUID: qH4U-sFSq9q23vL4eD1X8ngzHMYbczoI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111352-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:navya.malempati@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 205FD6472E3



On 5/22/2026 4:40 PM, Navya Malempati wrote:
> Firmware supports both CPU power collapse (gold_cpu_sleep_0) and
> CPU PLL/rail power collapse (gold_rail_cpu_sleep_0) idle states.
> However, CPU power collapse mode is not utilized in favor of performance,
> so remove it for lemans, aligning with SM8350/SM8450/SM8550/SM8650.
> 
> Rename gold_rail_cpu_sleep_0 from cpu-sleep-1 to cpu-sleep-0 since it is
> now the only CPU idle state in use.
> 
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Thanks,
Maulik

