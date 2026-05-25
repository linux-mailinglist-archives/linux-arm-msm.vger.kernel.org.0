Return-Path: <linux-arm-msm+bounces-109653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGldJiFEFGqmLQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:44:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 102975CAA3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6776F301828C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073B437FF7F;
	Mon, 25 May 2026 12:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYRiWHmS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jet+oYbu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47CA3812F4
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713052; cv=none; b=Vh2KxMAg8CwT24zXA4vM/kPgrX2Mr1qzz6dWa5OiusMm7VwhawjDQux199nXaiBRNTMrHBTtTl0KPXdMDk23/KHaqA345hSnOOJk4kzxx3+EZOMu3kPO4zD2KhFzlId9IputPw8I4WtNfs9vBI1v/56itGL1IGxL65nPJqtGxB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713052; c=relaxed/simple;
	bh=0l0FUTgfd/bqln04/9dA5OoUSKU/Xb+dFE0/6AzHq48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pHa/P1CJE9cRnL+cpunOORAwBlT/otaZSqpPH5REHuB0FutC46FCn2Ul713ZDRyPCtQtifeVYuuaQl8uH1RoatNpRXqy1kc26Yh62PdAnhiyU8MAlRJd9AyX9dZpaiRJlBAqgH8pTi7D2dFDh5jfzFv+/U36shNDwzcJCBH9Yxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYRiWHmS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jet+oYbu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P83sBp1861470
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4pIyAKElVfmOSXDKpxS/qE0T24eL34OfdEb+4InNyaU=; b=IYRiWHmS5MllFFAl
	ZgZq6MV8o5XZk5Vxn4j/TPkeQB09lXYfw/e0sXC+pAqb2JwwUtFTaHBXOUdDV2iv
	MY0stX+BHm7G+gSrkyFmZwEGA1R1p5O0TPi1q79QEj30HwFf6G1MTKMDfeS8G+lU
	O+XxDmj2p44S2JXFOuL2KtRkF9NvmTA3UrK8Wuz/gvgX8sp95qBAvjQBmq7yYZhX
	uUwT/ClBOIU49/nfLItUttHvlcsF8cYzOIqeZm5RbLnM4/yIX3sI1XI5jngxK1Rl
	fbtvhCxWu8w8CQE85v0ldz7QeWQoOtppH84UWopmD1bo36m15DxAyVTtKf/TG+QA
	xunlGA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w645y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:44:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d1d282deso6000021cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 05:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779713049; x=1780317849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4pIyAKElVfmOSXDKpxS/qE0T24eL34OfdEb+4InNyaU=;
        b=Jet+oYbuSkDdC5y0FjpjyqbWsemIl18Nvm5yHOi6Y4AWHNsBj7ZtsbiJev/zWlyN8l
         7dqEjUzCmOfZoS0XaXhHaixIktzXfRx3sIwa6vhZnLrmZVoDFaB49VbiZT3jwDUMl6xz
         PAPwa+yDjysGffmUtFFdrZvIU1GfsMOplpiaiL9J1pn/WbMa09dFoBVtbmex6yyZC/o+
         ZqlFAfYX7PxGFrhu0I7t1ooQFmas6il6MfbPh5bdpJRMRQNVlFHaiB0EkYQ4fM6FmpWu
         M4ujdeyi/aNd+pD9dk0/MZtky+mUKmR8ywun9eLiE0/Ot22cw6PmZARk7uzIGq/NEdXO
         l8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713049; x=1780317849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pIyAKElVfmOSXDKpxS/qE0T24eL34OfdEb+4InNyaU=;
        b=EpCflPaQmgklbghvRY9CeX44IjWNVluuw1V2V3LQELgR51ARG4ZfJhW1qMA8q80i2z
         AMwtG4OkyPnh/jmb+vV7pdFACfbZ442dPOQgIJMJ5chxT7JEW6lsgB5fIDDisXXoaSW2
         0zB+tyvzmeQ/PLO1UMkcml7xWUo7+1cCKLjjw0Z/Ek5stk/ju4K7n/M1BLJjV7YXRo6O
         wMYSGjY4aSyCDfaxkNuNwq2Hg1Q7WClTDlBjE8Nc2PbW3NGIasXr1VWGaFUUEopSoHDs
         QGrRUAvTWZJeYPuLheg4k6YG4sb555dBHCFKH0632IybuM7EzY0kn8BcO6/U/D0M/o+I
         gcHg==
X-Gm-Message-State: AOJu0Yz7VcRln+h+BI0Ah7OZp7JtobC8VWWvWz/0Wxo55T18vIyzzBzN
	XlyM6fX49cW8axalzADci17o8u//R3tmBN7YF9N1DitzcnEGSKSf9zKNnOUoRJ4YeVax7Qn2a6b
	SqNRfkkMnnRv9HoC81VG6hxZz76OEX2NnuxWKm3Sj02YvVh1g1MKxmB32Ew339L0HE6aN
X-Gm-Gg: Acq92OEcG7PooKyqUixcgUN6FFP/knuzRIEc7wl3wb0t7Fc0G8es4jMsWExlTgUiF+r
	K7rJPJ6holjyBAwiKHgNUi/FcGASjoJkA9rrhdmJPBhJtXlte8Lcs9s4izQomJ6T2kMdXhUic+j
	b0V4lNwtMJVrHTu+hAHzye/CpIC8AaK7haZS8lYTFjPIlNzhz+Xih60JTnRNozBMAcnSe1cKVmM
	LoVXRcXfCFE2YFF9ybr5WeqEZuSlFdGKOYtmAdhHb6xuGGgzU2xmI2yhxVTMcSPVsxvAeWWt91K
	SvQ2wB5CP2Ag8D0Ae08GAn3l52UWO6ivTG7u8p4rBQnDt9CJsV38RtqR+M0MyQDck6lGaKAcqO2
	KOwW2cEXFjUo69yViR5WifY36ZO9I4032t9xG2uP1hGBZ/Q==
X-Received: by 2002:a05:622a:a6c4:b0:50b:5286:f756 with SMTP id d75a77b69052e-516d4631a28mr105769031cf.6.1779713049201;
        Mon, 25 May 2026 05:44:09 -0700 (PDT)
X-Received: by 2002:a05:622a:a6c4:b0:50b:5286:f756 with SMTP id d75a77b69052e-516d4631a28mr105768701cf.6.1779713048589;
        Mon, 25 May 2026 05:44:08 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264d98asm394663366b.9.2026.05.25.05.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 05:44:07 -0700 (PDT)
Message-ID: <438196f5-677c-4797-8315-27767afd1cb1@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:44:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: sm6115: Add egpio support
To: Stanislav Zaikin <zstaseg@gmail.com>, andersson@kernel.org,
        linusw@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260522141149.1425711-1-zstaseg@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522141149.1425711-1-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a14441a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=D2ltqR5BaqNGB7-Ic-UA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMSBTYWx0ZWRfXwQhz9AzUZCZD
 rxUb2qCmObWMygLD5d0sgRmI+muepumVeF69TObffedgn2gtN2/Fq96uaaCG2AdDAH0DKM3iRww
 MU+QOGzvD5puOqX3bpBFfA85UVg3BS76lCLHC7nKoDiyeykmctfYPh6QJRyl+DAvoxNFD2VsxIo
 buUatDQHuske2yk7wMXr2dv9aEUyFj6yK1QljYog1EaEfNV9ZaaKoc4x8J1MNC0mfi3HqLDdJO9
 HzBNhcyFwwuEbbWjjC88qS6e5TYKCppbSq0ZsmLwo05XWO41q4Q/dZw2sQOoyQb/w3CJHrQvuas
 fwE2Gc+M4dYhR4cpYqOvmzuVlvqJWTphJtKRfe/CSuvklDIMQaPSO/QCT6OCmldR8cg+5C59tBL
 raNd4BVqoDjx+PZ8YHkfsPuHK/W+0/e1Eyu/geAVX1Wh7iDhm/SDQEvIDIaGDMNFwhmkfNP8rb4
 7piLLoM5yxZJ9zti/Zg==
X-Proofpoint-ORIG-GUID: rILVIRFPB0gkmAQ0_hK-4on6nGw_KMpQ
X-Proofpoint-GUID: rILVIRFPB0gkmAQ0_hK-4on6nGw_KMpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250131
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109653-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 102975CAA3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 4:11 PM, Stanislav Zaikin wrote:
> This mirrors the egpio support added to sc7280/sm8450/sm8250/etc. This change
> is necessary for GPIOs 98-112 (15 GPIOs) to be used as normal GPIOs.
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

