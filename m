Return-Path: <linux-arm-msm+bounces-114892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nMxXH6AyQmqL1gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:53:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA3E6D7B59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:53:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=T1XGg8hW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YsggrJJZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114892-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114892-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D24FA300900B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAB730D3ED;
	Mon, 29 Jun 2026 08:53:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C3539657D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:53:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723194; cv=none; b=Cap/TlQMrMXdL2dllty5FbZ4VkqKQ54Ao3t8krxs9D3s3PKBJ6eLxIc10/ZFSQC6dkdnk5jIidvzCEpgoi1IiJXi/3N2rCUIFhZsorvEfhQRaJ8LUOZ0wBtY52HMWVt40d9CAjFJ1MjgMElN/odA9lPpqOLZi8Z53owYXtpxru0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723194; c=relaxed/simple;
	bh=F3OFBLlj8lAktFcr+xkCCxECEwRA6j6tVLIvdSaQSe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XdmgKU0cLmP/BGq5+VwtRjR0bwddYwIKUGajFVpYNp21Lydqi+3G0cvP9LfUl3MzDcNZtqmiCJWpJ7JT8Y1t0IfrxB76liyD+6vECQkHXsl0IbhljFXt2yaJubJxfxXcltNd0tBSrZDhp1BU2XkDd6hYlFEQsG6VoruTpjBtbqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1XGg8hW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsggrJJZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rBD12134485
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MxKbFO3jZdx0YMVM28FnI1izFIXZoinjwwywDy6J9aA=; b=T1XGg8hWV+HFSMfv
	ZayRu3sTjrhGUa6K+hGv3D8cpX854IbY+g+3K1kEJjx9PhYbM/nKcJXTSEWQTBdF
	KtpLoCpzE4TT4oRoQZuB8FOlEtbzTe7bQzLxawr7FK92zZzcvXx0+6QqixNhgvD3
	n3Evhjco5KhEgQYeM9crVLtLFWnTAZEVG8xlnNF/cICa8358tFuA/q/IEPKHFkWw
	zqtwANNOGtfe3yHk4XjGK2y+jtw2WhR/z6d4qAC1EHj/7Hexil8tvf8KGtxl211i
	WsY8rbmK3yhARXp7f3J9iXpHRKdGsabAUrkNjtcZ7ECLuXKdbOiM0puNFGkwKHsJ
	N+0PGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a5mcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:53:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e566bae1bso8905385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 01:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723191; x=1783327991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MxKbFO3jZdx0YMVM28FnI1izFIXZoinjwwywDy6J9aA=;
        b=YsggrJJZR10kLnvn+ocnIOjoDS2Mo+A29tXGAPbovxUNC4A4bXfFhslUKDgQPwCNCT
         T5ZceU/T9zormSrrdiaVXhEO0HcXRfpmqMkjtwEwmelmAvZEOPoGS/XszfOtOp3MXBFZ
         ifR0/hjJlHGgggnHrgdVZsUtcs0fejWCMBhwWZAcougqTQPtGMhwdIOAIUcRLYGcGPiO
         L9tIzZHYbX9PK1iL/qf48H7QqX2SbFn/1nhdWbsfmUk9yXjtmu75ZBuc/24S7oFWN96S
         +B04wb5ojrZ2hWmtj2R9yldKjja4r5AtzYBASw+q1NK8bVgafmXmhAYCTJ2nMrl9pXxx
         MKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723191; x=1783327991;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MxKbFO3jZdx0YMVM28FnI1izFIXZoinjwwywDy6J9aA=;
        b=BYj3cUdnXT+ZCac4aW0WUY+bfx1X9N4DrlPrKTEUP+7ppVIeNwqAFctqdFvhMmBNCs
         qknjcKvm6r3Pljur+bVob9Sgg81FOgEdbC4rs/RSZTBiaGG7Qd4mDN6ZXcJo4t1QIlTF
         m4+bzdLukO/HSbQO/Xw89TYhBUrVAhIxUr/t+Y6PLLzteAkaNy6+AGK67M55qyDWedNz
         3F9XGrtp8laXxqap7jEOfdXJE6Jbybz93o6EyzKPcb3klTB6ybG9AGxhrcRDylWf2Ur8
         oL0Fl1ySzeXE3g3cF+UvEgAvetQ4S53EDvakH4k121FduuHUy7Py+JG+T8lDuKuc4LTF
         eAUg==
X-Forwarded-Encrypted: i=1; AFNElJ9iZ95J7oEV2jTm/+VfZHtVPkvCFgeBonRV+2+l6eT8+fd/qpr8NIEskaGmBPzl6qtWSOpy1Z80vTpnmJiZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yza5h9qZAXjZ/bALpFWD06qksnuiKLSAnR2T485uH6ZNny1btMB
	hSmuzc9jdssdGK5Qb3tBOchFrUOt4hhbzcxZ860jXif0nGjVcdKLiSqMWiaZ9DSTw2I0THaYXxj
	47keIyOBO0ZvlfWtllMlISlM2BnjHw2w6yK1zZJElt0FCAUKEqvhn4Vc4Q2L8pRJsHz7Q
X-Gm-Gg: AfdE7cnxZxvCLwBtg94YLMrPxMgJh5p5Qg/mr6DbUKNoHrq1APnys7Rlf7G0qfLlqYj
	fE7dLR3MRdpz9SR2y549GnbMFXiivLSH/rvXYRF0wqAqfYtir4Mi5SMdJBQs+RkOsF9vorVn2Hg
	xtVY5He0KVfe3gVVYW/DWHEU7RvqoRTJetVsO1kcAjD8qAfvI3RXqIA0LrKlGG42vwkouC1gZwK
	Sk7A7PNPO/SJCcfx1oDjiTq4x6yDq/Hp3Pl/z0bNAS7iCwVfHgZjY7fAE6VhoBLQUdEj6h4e8tU
	Ndj2phRCyXnTv7aYHs/pCK/zN/YCXlTkRIN5nGUzRa0M8SbgL1UqtltgzpPsyYUwyfVXapMzpYh
	odvAyPRbRCAi+darlCDFwC+xLRiwrbDKKZ5o=
X-Received: by 2002:ac8:5dd1:0:b0:51b:e991:92bd with SMTP id d75a77b69052e-51be9919641mr61100301cf.7.1782723191470;
        Mon, 29 Jun 2026 01:53:11 -0700 (PDT)
X-Received: by 2002:ac8:5dd1:0:b0:51b:e991:92bd with SMTP id d75a77b69052e-51be9919641mr61099921cf.7.1782723190905;
        Mon, 29 Jun 2026 01:53:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05cbfsm739181166b.36.2026.06.29.01.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:53:09 -0700 (PDT)
Message-ID: <a509092a-1c65-493b-9df7-c8a89564bd7a@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:53:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] arm64: dts: qcom: shikra: Add A704 GPU support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-5-9b28a3b167e1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-5-9b28a3b167e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfXwRj6SRN1OcY+
 8KF8M8gXs5DzlEmNvaQUJXUlQ+KKXvX/qCrmRG1wP7e4y7TimIvaWqi7jKhKkBv6WW1ho6qm7Ht
 0N/CxkvqiTxTG+bafIQAahWhBZ53UqCtnJsYEeiXM7XWbfAq2TnT2O3atgXU2xKHsFVtzCBT+ah
 J9/uyMIvXHB/a7pRV65NhOaiB6VZyCGe3c6gO76t0JlpNEdvk6jACW1h7+b7tAr3jGyQkGGlC8b
 FtiXQvIiAS8Dq58coMZHY3SoUju9SYDqmuMgs58IvvDWDBNCHXU9jq95nT4RoncW6II4HisLMM3
 nG69x5jfH5lOxPjLLMRIYxfZkl674NlHDnHpVkOpi598k5mX20gPbmOCGcH3IXICzXKrckPuPkY
 5VES8Vxa2g1wOTmnN4OZZuhFDojb+prmzBp9w1FOx3o5ZCrpdXdnuZcsf5pK3oypgg7rtrFhXAJ
 1FKhAD1b/iIAk6VpeJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX4EKTHCzS0J09
 QzzrEntoirJ08YHxTS7E/yUpfD5wkU11wY4yzRsXZZYrDFnE0kWx9W1gYsIE3ojTt8rPBiKhMzp
 6rgqHYmjpKfEJ83P69Z5Jfjn+k83PmA=
X-Proofpoint-GUID: xl-OygJYQ2HkmFykaFbYQeKbugPDl4lc
X-Proofpoint-ORIG-GUID: xl-OygJYQ2HkmFykaFbYQeKbugPDl4lc
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a423278 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114892-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:asherawa@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDA3E6D7B59

On 6/28/26 8:23 PM, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Add the A704 GPU and GMU wrapper nodes with register maps, clocks,
> interconnects, IOMMU, OPP table and the zap-shader region.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

