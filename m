Return-Path: <linux-arm-msm+bounces-112376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a8K2NSErKWqYRwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:15:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 293B8667B7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:15:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XOIUZIYj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aC90plOE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112376-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112376-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FE49335B4D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2AD3BBFD1;
	Wed, 10 Jun 2026 08:57:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B6F3B9D93
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:57:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081877; cv=none; b=cd8ZniWTGUFbnuVjFFwMu0piThdEMAiL9/iVw02gNWts7IOchXOnQAX/OHAZ3cA82c1W9JzrwyuVj4jqexOwlXEzjr3MOupjnm2Wson/sDZTYYoNW7+wjnGEAblqfk5zBd/OnxaLlnhWvJLAcHxBrRt8tjtdVNns5HObAKiLjfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081877; c=relaxed/simple;
	bh=QAyghAcVt5eMp9xbZvGFYS2BVeiVvAYw2ldCx0CAKus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nxTu4Ku3FSIiUhipM1Rwo5Ibfui4ox5nDWbdZ7d/kLUkNy3HE2nntHD4QrxwYc4ihhK2nBfGRGRpPd8Y0Xl6aSK9onLTxf0F569+g0+SfF+QqMfi4m6rZ/u7YkGOaPYCkqOgY15ziCJLs+EZOg+H31D/qkwBUBcUMxx95OGJUwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOIUZIYj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aC90plOE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7j1qX947217
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRCC2WnM2rmyRkqpJMx+C/5ibx09IpAJLZaFTYDrsgA=; b=XOIUZIYj33mFM/Eg
	EnGv7UJ6xm2qGYmtyELPxQ1gay9QLzQGOLbpoTpSfuc87zWaFvjYJsNRGn0ECt+O
	lAo3cdcj+Kx4JfydlKeU66bIzybg+I8iRXzFbImtoi1ByPnrA9xjAviOTb3PqhlL
	k2K35k6P6Nhc9Zt2M3KzsTkOQlCjenBb+TjnGMISxll3zObZicWBZzHuT48bTeDu
	ds9rywceUuwpQ7KGEcBqhcyid7LHGFpFj/C6K6ylUh1HLYSNMhmJGwcI/pYN1sSm
	CVgvW72BkVKFGVsGutkQnOIZAwd1SR+aiyckbjBfxRG+7Os3TaSHq5ymGH6j9l/P
	k06S5g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnnsmp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:57:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51759082206so19318471cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081875; x=1781686675; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wRCC2WnM2rmyRkqpJMx+C/5ibx09IpAJLZaFTYDrsgA=;
        b=aC90plOEzORr6NX20ZsuNf+WiY2hoGgumJ+jB8lF6zTUDXIKsBKurgPZWaqKhtw/Io
         uNO9nUdosMIq0it6NMcvE152rqalPaLNhUwo/4nO1uIsvQnVQBQnLiR88fdpRrURJpQp
         B5Y50tNIlZmqzd6Hrik+fLrxc84Ma7X6nUqpSdaH+ovFeEqaq5u9jpN9pNlzK9Z3+Adr
         kafZBMeUqo9tHhIJ0yGUYnWoYVNT86KGf3J5sb+vVqb67KVNrDv4cMDXzWFHA+di9Vqm
         mSy9ahCDPNQslLmnm7T/TidW99R2NuGZfVuv4oXVWP2DCPOctXaE+Jbi5B3pPinfM6qW
         zFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081875; x=1781686675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRCC2WnM2rmyRkqpJMx+C/5ibx09IpAJLZaFTYDrsgA=;
        b=mJaI8+0vIxFaWAtcmPYhCExJ+q7p3Ds06bnfd1QYSH3eEeqxuLpf2AhUan4e3vi7oD
         r+I5CMICP/Os/Ioxsz8Ve1J3btOhnfkw6s22z7FKicHy9ousqW/aw+R+dQiVoinZj7tQ
         /qUWX6h/mNJgcMZ60NQld3MZoUqgysW50xxP2IciUWQSK6iNAjp0fOUT/QctTbkSocz0
         9xn1c7uYtfGNomfjIoRmKMVSDKt+hPsBmgnihXN0l/oS/P2HmXdrOeOJ+hz76m6qwZ/j
         i6HIoFfuKoLFttYfb0Nn/O6WW4ZWUo4X2R2Pz06cx0N0cPP8rq0SVqVWuj60Fwx/ejwv
         npdQ==
X-Gm-Message-State: AOJu0YzaDuEDui+Q/E3Wvn8NdllqiJTp68ME+tFYVRkQXAWEb86yI1Ee
	14YBHB0Qpb5qI8Grvf6LY/RYF7JJATCXR1I2CUq6DKwG46PTF7khYMp77OyBBCGDD1MeXJYe2bX
	gpYNJWeBUqoasQ/6XE9xr52C+QcKvf/VYugqQQmVKur63vspaIVaK5yQ4U3qDI+ReeNQx
X-Gm-Gg: Acq92OHTl2Sw7HtP6yo5EbqiaimGrDT7+Hm1fzlYRThnRZG3+SwV1EdS+BiOz/6zGIG
	vfP9gJ2Br3lHASThvf0s7DUBdz+2MxrRB9hCJKb9oWEqAeGc1iuMtYDAd5h3KJ6xMgR0Kt0Plrh
	Wyz7hI6mwQpTu+0GFiABSY8BpX+b4oqFYk8VtjQy/l9HBD7SykCZa07YL7mewS1OsG1akeg+coC
	pHOPgT6IYfOAx17qQyum9Q7yfP8xyJbFoWt46VUE+YDOfIJR+zWwGJgJ3znB40Yp7bQCItUBf7b
	BsOezWSfWJBrfyBQYTw52N34eWum7MuCaAf0KcyQfZ/XwTUdz7iYPVa57cjpEZhSrk+1lWJ9wl9
	Oy8W08v1ulzaOUpFdVrdVcECFiMrbbbKwuSpI+YcatlSruHwuiEcYLQ5e
X-Received: by 2002:a05:622a:4c06:b0:517:5af6:77f9 with SMTP id d75a77b69052e-51795b3af28mr211913581cf.3.1781081874623;
        Wed, 10 Jun 2026 01:57:54 -0700 (PDT)
X-Received: by 2002:a05:622a:4c06:b0:517:5af6:77f9 with SMTP id d75a77b69052e-51795b3af28mr211913531cf.3.1781081874255;
        Wed, 10 Jun 2026 01:57:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051d86f75sm1153724166b.21.2026.06.10.01.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:57:53 -0700 (PDT)
Message-ID: <bebc6100-bf32-4a4f-b410-84640b817d7f@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:57:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: ipq5332: Move PHYs and PERST# to
 Root Port node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-move_perst_to_rp-v2-0-6c731523d08c@oss.qualcomm.com>
 <20260609-move_perst_to_rp-v2-1-6c731523d08c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-move_perst_to_rp-v2-1-6c731523d08c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Eu_Et30VZuXP5V5TeWEFolBC3-rstkIr
X-Proofpoint-ORIG-GUID: Eu_Et30VZuXP5V5TeWEFolBC3-rstkIr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX4h8raqy40KrO
 wmZHWQ/zOHTK8hvZ7dhAb9IOFJrSK6GOMxpiVmN9nwBtVIiNpxm0Z52V069Yc8D+uZ2v6WfX0S6
 Y02eI0H6MKOwvolJjn97g3WrAutfm//aX7UMTS9+EbYRxytGZ9HW1AamgPWYjRIsEjltvk6idot
 nPdNR8dEOJfFxJRePbz+fu1KMo67GtAYeILa9o3FeW8+CxyvH1uicLQwyG8rSLsDkewszjXNF0n
 toNU88NHolgOW464uAV734JKqr752tZn4qjDich9in/EzA2JDx27J0iS7UCAegCr0iFOnF4ysPH
 F2IZEc4CacYGHbtxTzbQKd05OHah97eGpDOAS6gZnmdK23WbnxGJeSlMIGsHytQyya3i+m7EvNh
 FNSb7gf30hdUOXA9f8wKXeOixaO/b1BAVy5wFo7oLVmLBv9cptPU5639Jfq+MV/lhat9K7OrgIi
 uXK9lXDma5L/l3CF6nQ==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a292713 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=b_Pr7HiucSRPs_5II3MA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112376-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 293B8667B7D

On 6/9/26 7:04 PM, Kathiravan Thirumoorthy wrote:
> Follow the new binding style by defining PHYs and PERST# (now RESET#)
> under the Root Port node. Avoid mixing styles and move these properties
> to the RP node.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

