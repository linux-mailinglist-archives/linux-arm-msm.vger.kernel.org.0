Return-Path: <linux-arm-msm+bounces-102138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI3JIcnj1GlMygcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:00:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FE03AD69C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D9AE300E3E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF943AC0EF;
	Tue,  7 Apr 2026 11:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o67dsR/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcSKVKCp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A273A9DA1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 11:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559617; cv=none; b=ZUInWiJ1S4yEhHpHrIGyiESLwwIcyYb2Ig9rBrc1Im8cHTeH1ZSOfA7NAG6lR8IMh1u/MxIm6cmyiFSruCtZsp8wBce1hw5KOluMp19Bvd3PWYz8oZz/Qmt/9DmL40DaB165gPMh0s2v+LRmKnOJIBEHlYkMC3XnC6P7XLwnXrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559617; c=relaxed/simple;
	bh=f0lOL8Tip+z9pohOgm0gCI1BDvaKi2M5LsQBnXqvCxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4klm+1bg2LjzJ1tNk8GIVTJsj+OqbJ56XWjvBAcbffde/XHNDw3bm0dpyOFeAo7+43tuaXLbswOW8PFht3v15V6y/VBhreVlP+Rc8z0wyY4eUuqk59D+ZIpPzdD6Ac0vUplyCgocM5AtYihK8hwCQiAoB69t9Fewa3wBFOunAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o67dsR/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcSKVKCp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376gd4Q2580241
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 11:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fuV+iVO4z24c9uYmVpxN15rS9osl+Z617fWZV5thnxw=; b=o67dsR/h4UCPZhQO
	v/KIvttt9gLEQwppsfB4RueL+KBSPO72WkU77sphzTPlBRYWAdHE42Gm4/F0ppR7
	Ox94fVBZOE5Dt6lFD6alqy3PuCzXLQcr0F14l2G150/1iaSkbtcRVIY37xGOhLoz
	q3w/hBWTeNMhK9AKO4lp8Lk2ljDPYMnSmllyU+FBYPuQC9LlUG7KrvCKyi6PWNsJ
	ItxeU59Y8FMmEhO+mOMGSN8RfigJ5OuJ7rHgS17jV/YLhEzhuxez69tE+qTrKY22
	2aPSJcyixdUaNEovusfhCqlweB0JbJk6oiWX8fvSJV9jdt3NPNXRtgagd1iaiGKp
	i3AaJQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf2dcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:00:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2955cc1eso6881681cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775559614; x=1776164414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fuV+iVO4z24c9uYmVpxN15rS9osl+Z617fWZV5thnxw=;
        b=NcSKVKCp1jMksRZKLGLhzfwm/gSDhe3MjmRRazPeAz7aOYbll/Z+ame0DxHFvsms5r
         mbnsQ/B6xx8i62TDmS+5ZqNKTU3P872al9V4BfwpZXE6z7gOLn4HqeDsE62D2XjXrbY4
         uJGd5qCH8XqeKgKAiMYMceGNrKbQVp/yK1AnvzfwzDvy0YHb92f/IfmfitMya5u7o5sS
         dNSGAOJ23VtqOPuDLdZb9yi1thuVIL/AHIKKEHLHab57aZKyMl6SDiff0s1333A5yUMA
         a103mFHHfEgtQW9g4McR85i80OkTfnHi0Df/93Q2Jr6SjTW5hMKETzTDMLeyk6JokTNk
         qDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775559614; x=1776164414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuV+iVO4z24c9uYmVpxN15rS9osl+Z617fWZV5thnxw=;
        b=ME8AOqW7IGLirsRqYTwGNtfvGWVP86hEHJvhQ9YzgBxxD3xZC7m4YwpmWJODGjkJTf
         7rBbG1oMz6cW5h0lrufMk3MfQhGKGqpWjig4i7lba0mK4mEOF2m1nUgcjQiU4zDVTpmE
         jlqrrcCzcqUAZkAXC+vHxqX7s+7il5dhMOIxyqDxjkDD1cYcIGCRiPlw7+5y6lith5OL
         b+D7hKK2RGJA89Nc5yDCYO4IpkCe/OvN9cxKaE4C8wz/khkRGGKHcFuzM3w+FRBnAKJ2
         2g8bxlbeS1/FD09QEB1Rt2RGwBHhR1h9hge3vGwccbfKKxRt7yG6gwq09op7WIMkwzqe
         hMfA==
X-Forwarded-Encrypted: i=1; AJvYcCWzljAZvQ64gaGr8CaKFRmJOkdLpy+GY5G6/RCKToZ5C24RaB2vKgWeejlp3YFoLtgIuHNdzQ13tvwQ3nQY@vger.kernel.org
X-Gm-Message-State: AOJu0YwQVKZGsciWsoF/bIUEFQmEXy5kV5jKkcdj3XyAKlI7aY/JIdEp
	1LTqdfS+uA5usU8QPisTJ/X6YqFUDefmmK0AKYZe38dGCq9bvoxaoQoYtuWgBpUQEFCkpyEw3i8
	lxveLpwa23p+RVhEQjxyFcvq6uf/iPyBrnXTTclN6jpbSvSpXBEAiM1EoqROGsqUrNYoI
X-Gm-Gg: AeBDietN7cokmxE+QJGiIf6x4z20H1BKFv1ydLCkPJ6NsjF/lbOnCebs2eIvYUKh07M
	gxmFHYnwawrysk7Nvs4yPKnXv0iIBl07kN93AWBCPnZjybbMS+VuVl/SHUmvJ8uMPlEfnfiiq0Z
	qnobdc/wmo39u+9Ir/GazW5ycW8SiDpS4RsXn3YaGRUeZ22A33jdoeyMH+7Bvl173PlHdgjh0Eu
	6ahcA6w8SaA1+ZFCZGlK1CCg28vam6vFrRDEIVj11jEJ7zUbt4xIYEwnOH+EqBk18lT0hMrPGwj
	wTMgwOjOipC7DgVnTiRThGZpcdf7VQXjkbbblRN5yczZb3ZboRqet4zdMATxViyKJiuoO8ToJzN
	Eq23o0tv4xybr7o4ea9qA1bNuF6NrWxJOPf/yAvwt46Fba8qaDx/XOBSbTT+PoiS+3I+0Na/biQ
	nB5Ks=
X-Received: by 2002:a05:622a:260f:b0:509:1057:4a67 with SMTP id d75a77b69052e-50d628aee82mr172729961cf.2.1775559613672;
        Tue, 07 Apr 2026 04:00:13 -0700 (PDT)
X-Received: by 2002:a05:622a:260f:b0:509:1057:4a67 with SMTP id d75a77b69052e-50d628aee82mr172729571cf.2.1775559613244;
        Tue, 07 Apr 2026 04:00:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff19c0sm541077466b.48.2026.04.07.04.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:00:12 -0700 (PDT)
Message-ID: <5ced60bc-e588-4bac-a6cf-3a0f97091993@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:00:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/msm/a8xx: Make a8xx_recover IFPC safe
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-5-4bb5583a5054@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-5-4bb5583a5054@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMiBTYWx0ZWRfX0pTPJn47vRpw
 13dT/HH8VGzsPOLEDJUOHuPkLoNrNtP+jUB7HOkHF2oLzIxSwzYBY9GkiTZDFOLp8/fnrNM0zqc
 hs/zcnm5dMRtJpzOizhDzBu6B77AC4Sd/nCHHkLnKvImMUCnQi+ois21HEbMKvwr4W/3tWQS8H2
 gWpP61s8BUVFO94jIipSx2i24zzgSlq+2Z+H/BA9m/AMRthbHGdfBYvc0kTENJ5T9khQj2d4TJw
 iOnN1tVGHUas20h0hBohYH4HGUAO5/i9LugjthAJp9B6unLFFKdu4ftcNuqtyLUpSGIvS28IyMF
 bZB+jtCymM0Id1qRTHkzMa+CTILjIDj+NYAcaVozlDLAy3DsxkUQBUf6QEnn+ACJkJHg6nKtoK/
 EZ1ac3gK85J3w/OYJoIxIyJYAbinIOv+eBx7NTwqHIvHuOw4FzAal21QpTVsuaaxZx0gZJG3a7f
 bQVUzoyI+eGpr+chOSQ==
X-Proofpoint-ORIG-GUID: CokFaAF4LLJimNJmleFjHNu-pJhlMdqY
X-Proofpoint-GUID: CokFaAF4LLJimNJmleFjHNu-pJhlMdqY
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d4e3be cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fzR4rbe9g08MilRDY0YA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102138-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47FE03AD69C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 11:30 AM, Taniya Das wrote:
> From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> Similar to a6xx_recover(), check the GX power domain status before
> accessing mmio in GX domain a8xx_recover().
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

