Return-Path: <linux-arm-msm+bounces-103113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDz+IocY3mmDnAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:35:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA42D3F8CB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B62A430DD4C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE4D3D5228;
	Tue, 14 Apr 2026 10:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bicN4g58";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Odmk+Y74"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3553D649C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162639; cv=none; b=I3qgxNozlWmZIcrnjql+MtEttWSLsdIp4hlxdcoQEP9QZzT77sN/S9aZah17MPq8PssWsg6CT824IFHY/AfKIR40abiIOyr/ZT7G8+FRUpa+gPsiTwWve2tyO4p9fObXxMcozDW76LW1sHOlj8s3Dw4N/r/kvL1IYokT9mbuX10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162639; c=relaxed/simple;
	bh=37knq3BarReMdHJGIwkVqi0G+bltRDwoTcZKP0HE8Qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zf98o6apmrhxUY/agJ+HaCy1xlCf62Z65ifj6H2Zi6DyltbRawXr4uWFsyw218KEyxcQTvKplSYbLPuBqeMEb0lr3feblu6dHbNCkftzfC8bsOJP8Knc5FX9yUs3E/5N8768CadBiRhFMnYqWxIyKYLGUJ2j7Z10t2JBGBgdF2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bicN4g58; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Odmk+Y74; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6O0oX280927
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ap/nScOH8SyTtNz7MDWSz6sn+0rsjWhoxTX864ChwzI=; b=bicN4g58U6QbUH7I
	qbu5RHdwgpGEnCyZ3zVgIXLjx4Ttez9yppgluaPhtouPHDrFd5l5KHfsExTc/pfF
	uQQ5muezcwxxT/1uNoukEa9hDkv+13vecD2a6oUHRktpfZ2tB4/XPyu8SPfOzSQm
	O3UjPwDyYHCK8F1kzui8Z5MomIiZplzJBPY48orkMX6e89HQOpW/lY06ccVlan0q
	z6DRh3KvLQVDSzR9tS8GAmx5hCluA2CJhFA6l3ri7yCzRD08tL8pO56uJRg7NPAX
	VF2b6CRV4wcNmad0/x40v0U+ov25yhP72xnmadE3g0AdAaKA3sTE8pAXjL/FkxKr
	1rTTLQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vj9kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:30:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8c183c2eso50909821cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776162629; x=1776767429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ap/nScOH8SyTtNz7MDWSz6sn+0rsjWhoxTX864ChwzI=;
        b=Odmk+Y74pkPXQiHg1NpQU/AqiBc4tmlCIbh72d9XYl0tbKQwLIVMwCqUbK0C02yA61
         HJIAJMllcADAMzf0coqNSROzzYEHNxbAnav0KS27WKCtnM99FeyVkBdhQvN2Q4GGIxGD
         8zSsGRIi0Tob3ukMCyEgYEfSjvuy5OtEBkVmNzPNUm3FnEPPJvGtUlaQ/Ysu99iDLS7O
         MOkXJEagvZWgW5/SjQJgCpxOGOlbp3dWJ7FYrWHDHzocdpJx9TasOTfMcm1SWewAwVL7
         K80VXbC4bZtM1XHp3u3NX1wc5OLCrDeixm98Ni9qqbCLfdRwPcOJs+xRkd88RSAxvrOY
         aZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162629; x=1776767429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ap/nScOH8SyTtNz7MDWSz6sn+0rsjWhoxTX864ChwzI=;
        b=V8Ies73J8RKr/4HumrnErSoTDVwWHEeca5+YK3encNNbsDRdsmuJpevilh8YpdzXGc
         wnuWL/4SVidp43z44Vj3XZScIP3xLXhpsXwhMgJ4aV0c1Y1vyRPzlxIJjiKPQsRduNy2
         rb4zwmad1PBRVVM7D+LWVspW6LVQKR0tjj6yWR+Ijmf7ILigvlJ9DqHinFDfrqyvrnOj
         NdzMSlaK/fX9bV1ojdybxpgb4xAL0YDLRnuEIiic5C6AX7dAjAjBMeb9wrHi0PCzScDB
         Coj8FFYGyvH70VYnk3ReRU7iUudo5ETkml6iY2cspvN3jUGteCDFaAeBZlW7SAmsomI2
         JF1w==
X-Gm-Message-State: AOJu0YwG4iinlEUd+NCxe06+XLAynczzZYM6C3ylnVme8b3zWUdeGLD9
	Yq1nP/0hVbyRfM3oDwpAOElMZS4kl3L/VftfTeH3PSwIPe8drm094jsdVC4+8r9Gm5mwWXbbByh
	6BLycdLCXE5GTrfNhjSpUmgBbFugvTZiWf5KwScoRJnEVpOKc5MI1rKAZn5oR0nk8w5w2
X-Gm-Gg: AeBDiev0EAuPZTYJ2uxmD7mrbu1xmWklIu3UHfml/byT5/x8vxMF1flZkftmQmH9JjN
	c5gwLqga0yeeihp3h2RlNW8uvM7ceiRc0dofN23h8G2O+yLTERVVKHsmGdHmuZgnuAFK5eU3tiK
	NCdSx3hgGUI+oQ4dI6Lz+NFwZ75ujmbptoDdh9d0KYLG6JSbbDjuyX84bn1nu/Ug03efQTiGtrM
	x/CfmymJFnym8i2io7d/yhD+W7KiAHUMr+vFYjoCGWlKwqmeFTIocvpMwojcRTc5LQtXkindJVG
	soD71AxlWK59s8UeLXzutBUm1k16Zs/a1jQVOROVP5EoTnPdXCNzr7UNpyewbukWAxb6gTR00ew
	p12HEL3WHyC9TlCyQh7a9zJRscnQiaQs0uOAUAnft9CLR+tKZ9uZtCwHdpLX982SgASN0fTCUx6
	8N+PcdGcLAE89J4Q==
X-Received: by 2002:ac8:5fd1:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50dd5a9118cmr187675591cf.1.1776162628854;
        Tue, 14 Apr 2026 03:30:28 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50dd5a9118cmr187675131cf.1.1776162628229;
        Tue, 14 Apr 2026 03:30:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6717eb70fdfsm1265526a12.20.2026.04.14.03.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:30:26 -0700 (PDT)
Message-ID: <aba25e15-176a-4df4-9d8f-e05d36d52c9e@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:30:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: monaco: Add iface clock and
 power domain for ice sdhc
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com>
 <20260409-ice_emmc_clock_addition-v2-2-90bbcc057361@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409-ice_emmc_clock_addition-v2-2-90bbcc057361@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OE5_BM_1Nwvnp_MV8i3DuWl2LzBdGcTA
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69de1745 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=D6AGceYv9MrH0eYzXVsA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: OE5_BM_1Nwvnp_MV8i3DuWl2LzBdGcTA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5NyBTYWx0ZWRfX8f/bLBaxmB2a
 30fxChfqWA0kup/A0hOZxX/KJitTPRO+mqVVKB22eGtPoAluDGtIBUu59SThCp28iTVJpAY/SQ5
 /suqlc6sMCzo/Yb++EwnKlN2KGypflwFQuodzp82b2ytoRG9RAyQkp2X6tm8guvdO8w2ruwyYqP
 /F9DfGX42UkDVK8D4NiBQwJYwT7N+fAmr0v64dGoUbUk372h8takhGhsEXmVfw1BwTXxNA1uOIv
 JTpZMaqIu7hBbyrZlfyRMXG+KgHLub96XXZ2HPYyvv73uws1B/W0dHuXafqqcPgbrdODMdXfHUX
 7lwO3FiRfPNt5OyANiCBx4mI8UvJpD35izyAVaVuF2P6mrv8vUE0VzTyobv5UpzsVwqOGn+lH3F
 NzvXJlP68cqBmT7QsOJ+oZIZWchydT9lCv8JPCNV20QxvvA09zV+FjgAH4VRSvY1YTfSfVgE6M9
 sxBKz1eF1RaVePLWmEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140097
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103113-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA42D3F8CB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 10:31 AM, Kuldeep Singh wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core'
> clock the 'iface' clock should also be turned on by the driver. This can
> only be done if power domain is enabled.
> 
> Specify both power domain and the iface clock.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

