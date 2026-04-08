Return-Path: <linux-arm-msm+bounces-102281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJl9DWga1mkxBAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:05:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A32F93B9957
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 826DE3047BF1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA653AD512;
	Wed,  8 Apr 2026 09:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UZLP4BBZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U6vxKK/u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D733AE6E9
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639055; cv=none; b=lMxTsDhq21M+WNDLSajYKoA8IDAEYzJxhDiql+L0B0szfudY8YINH57mXNd1L97ZvDGFhZhgEYmURLqBdThrYbRafVuaF4zuS9+bwb2JB1Ou56/rUnZcPJq9Ar6Tdxfhl4K+EKzXuy7Ly99sp9FItCDIy9UN34oRDlCTLOz8P6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639055; c=relaxed/simple;
	bh=YdmBNLTrUfcDrdkiR7xIwh20GMEBSDmd65EatB+oU/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XCBBNXBGRK+AVlWss0V+5WEaXdp/4q4iwAUfgvqgE4FeF50ShE8zVlItbdhk/W6FTcoySJeK6osxEre/c2ubk+WvV5WkleDYrH5JmZjqbbp4/EniKqLztW7ZjJERlFd51sJVHbWXd0/LIiIlwH9Dbuw9j+VtoqMk9Lvc0NZhK90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UZLP4BBZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U6vxKK/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385YLU71006173
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0rSsxPoHQdJ2cv0VxA6KAemtm7kfCtF6KLSzW8wGIQU=; b=UZLP4BBZVBOobpJK
	RLM6WBA20uHVoG7PC4w1ck3z3a2AmpiLZnOAJ1pbiOxs641vgtx4JSQdchseagil
	p5WULTMuY5qTLTQAP2t/yxSE3Vejf4uZ6/LHmNeyNvpTrR4gz6pdHdpJ6S170Kf4
	s/Cyg7id7Xz40OsTYiJmm4ztt+at2oZLj0El8eeqgDxTguQuhvQu2gwKMskQaW2y
	zmQMRRwx0DLIjaCcDRef9fl17u2pQu+oix6vNi6VLWZcv4dXCBfTyYOIcWAb2B43
	F+gEJaOS3DEMjl3Bhu7l+yczeQEkMO4bThKAc8ZOIX7xye3XalvUlzE+X8U3QvM4
	O/UJkw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tpaf2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:04:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89ccb129547so19679466d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639046; x=1776243846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0rSsxPoHQdJ2cv0VxA6KAemtm7kfCtF6KLSzW8wGIQU=;
        b=U6vxKK/uM38yAUV5Ky1G5v12Tsfa6dOPyS8xL1HzPC01wahYrlpjoCqMHRmmB0Vf67
         lKmAS9EjqQqoS9aeZ5y0Tbc384u5gwmBrKTlwVL5eJoPqNu8GEAD4iP+beRxUf2aw6DY
         lTzto3CmfWr/mrEV99vPkdOXG9UeHw781Wb3vTiBn9ivgltWWVTUCiG3HGYqx22AtE4a
         /82ZZV7RqVaYvkcQjyvQIqmTm8IO1HCoV6ImrnaZBQXoxiumI/iOcZd4mewFyKc6esWR
         NG2w497kql5mkietQGrXVJ9KhzsZqe8wGyC0L+QBPl/K7hYSrMWsk+/DswbZhLXKq4YK
         xk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639046; x=1776243846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rSsxPoHQdJ2cv0VxA6KAemtm7kfCtF6KLSzW8wGIQU=;
        b=LWEr120jYTbLxqlafE4W/RfukcNtW04E6aV5VFTLzELmy32/6MwpqNzcbqeZC86xG4
         qyoNqjCzYHC1AZl6zNXDiv5kiWiKRQoXcB0UVXkC3xFBn69S8ARWhiTSzx104qu4jwQI
         DF0yolFyLLDHVyn7bu1Uw19Qfb1ggv4wBFF6bAtlepjgMILfv0SeZlJXxBJt32CF8MCj
         IAOus0xYlPqBH4uMwxv2qjS6KxOtDCVlnR4GSO9j8jQwECumeRoNSNK8EdTu7ZHJU+Ed
         JqmqlxWMtNbrtoUvHrF7CjACnm5azWsG0hyI8ju7g849FtB1TMxM7tqodfn5+AOWRR3e
         g4Pw==
X-Gm-Message-State: AOJu0YxYidS0TvSeVm8UP8mRdPxi0fiUZPS/GoOD1WzY4OJ13J6HQbGj
	I6NRRVt/wKpcR9Bxqwq2i+cYJ4hMYQbiCxl88kb9M/dD4AXIfwrzW54yRFKNm35vY39AI4RUAkw
	0FZcwmNuoSRiF+rX9B8XhguFpqXCauiKszBWG5Axc2B5mip30kz88Nh4rAkMD/zpgF9n2
X-Gm-Gg: AeBDietlAcWRUBBV4BnNCSe8qtmZ0yJuJE5KWhRbwJqLcv3XYNZzD0MNERMqOPZ4j9Y
	1nha3co1Ha67D/qk78FYKxgbFxwim/7me8zSw6yE9G/LUZKfbrZr3rjXtZXrc6SYgCEhU9yL7HS
	qGxc2NNXk4ZINm9swJgqOZus7S+3qMZIcsJ05jlpbdku2UDl7QwrusJB3kiH9r72wa7AcN66aIE
	EmnTIN5+u/64G12KjqC8etbepvnuj4ZTA6elom6tXV4A8qoeZs13u6OX8sm6tbaFaC6dsvOYZoR
	IIHCa+v1fqbK901xDMXEa7LDLE5Ad50J4HIrxBkoHlYiv+TUc1ixkcul4pFvlj1zFv1xRimcppI
	QC/ppRIW4CLfyu3ro47qW/U3pDBfv5mAF1FvdZwRJDZbcHzGtpFmUb5wCxAol6NgaVdm8ZFhhXS
	FtJJw=
X-Received: by 2002:a05:6214:224b:b0:89c:47e4:41e9 with SMTP id 6a1803df08f44-8a7046debb1mr231120656d6.6.1775639046020;
        Wed, 08 Apr 2026 02:04:06 -0700 (PDT)
X-Received: by 2002:a05:6214:224b:b0:89c:47e4:41e9 with SMTP id 6a1803df08f44-8a7046debb1mr231120266d6.6.1775639045586;
        Wed, 08 Apr 2026 02:04:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff128bsm624537266b.53.2026.04.08.02.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:04:04 -0700 (PDT)
Message-ID: <e0a4064b-91f8-424a-bf95-599721c56204@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:04:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Use
 board-specific CDSP firmware
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-5-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-5-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 621Ky76Wh98bddDaPsOeT8T-Cc1eNEEZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MSBTYWx0ZWRfX5nJ4u6/R19v4
 ogpknVnSk3VVtAvHe9s0OmB1gE+fLyMuTbBEzomaWLr7Q6whqPrj3bg52EEco0dXJ7QzcjCGZm6
 9/NQds5p7T0j9JC7IfRRDgQKwIszUaE50vdQXIo/s4C2dbNj3xItcA7/1DShi36klM7zi7f5jv8
 tXFOOt5YFkn3zXdIpoOxHBMw64zxy/bGZ7Md79HjIcA2PEyzC6D4E8I4fIYRxNhdINLedtnKf/7
 JrESZsBsZJJHhYpeBfvuUsbfG3rR1xkQUy626n3gfaPXp6hP8JBkEcHEIndkVq4aW7Ny4x/wsTw
 GfXYBFsF9GtWJFojGkKMflxL5G4iMvtal730PkYUM6N5JLEr28Sw22bhb7NUC3UxsH+DEefKi5P
 gl7PQoqohVBrYgaDZnGDU1jga4Ye2f3JaKJvqqXLgsXUkhIR3mm01U7BS2EUsZ01h0IenzL0J3E
 Nk3WurAdo6sKTAUmjwg==
X-Proofpoint-ORIG-GUID: 621Ky76Wh98bddDaPsOeT8T-Cc1eNEEZ
X-Authority-Analysis: v=2.4 cv=DNS/JSNb c=1 sm=1 tr=0 ts=69d61a07 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=p0WdMEafAAAA:8 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=XOjDPPaWi1ddxI8VvIQA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102281-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,radxa.com:email,gitlab.com:url,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[radxa.com,kernel.org,oss.qualcomm.com,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A32F93B9957
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 5:19 PM, Xilin Wu wrote:
> The official boot firmware for Dragon Q6A has been switched to the
> Qualcomm WP (Windows) boot firmware. Use the matching board-specific
> CDSP firmware instead of the generic one so that the DSP firmware stack
> remains compatible with the new boot firmware.
> 
> The corresponding custom DSP firmware has already been added to
> linux-firmware:
> 
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/882
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

It's a little shaky given you say it must be changed to remain compatible..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

