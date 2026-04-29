Return-Path: <linux-arm-msm+bounces-105241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oONLOrIj8mlmoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:28:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 894AA496E50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE453304F7D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C27D37B407;
	Wed, 29 Apr 2026 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EmPniOEj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDlkoptm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699AE37A4AB
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476139; cv=none; b=Xs+PzRyOEIh08loDfcM+SuGUez/WtuTfKMq6E9pMS6BiDM5tgKWFNuA3zokLy4asi7pVg/kW/lvkNdMDQJE0uOvI77w7/iG0bw0K4dy4MsKSGGjjomuS6+UVmtllqr36GJDFBp67jYs9ecYtbAjmEat6FxxM+um+l5qpAa4T/O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476139; c=relaxed/simple;
	bh=ED1uKMxhbgsFGIedSV0n7ptkbizayLFznKuIOuFpXeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QpErSpDoK5B9BX41BjtHu9HSJ6twF1qzBvTiXWjiW815fbLOA0TgjIiMA+ddPK+pbDmIG3XqqvYIAVOELbGtWey74ajMNOby5zoYDDeT2tGXzkAp6wDgVpbt/QWkbi4iI7KPPMJMYStC6NaZ2Rx4vQahozMhBjLSAjBDyb+OxA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EmPniOEj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDlkoptm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TEQcBO1796400
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+5mnuZjemqdu7hzirtL/WVIH/f1YJBhgAHq6MKdruYY=; b=EmPniOEjWMm+YMkl
	VwpCMsdX700nl+oM53QBVJVafLFG2S87JhuYUJ13CSUTkvNgLcEXplSWfh3jRjwJ
	awOiPn/rBYxUVgWZSaXsrvbwDzsYzItgyVrjLPmMZsOmES21OfGp58I+p9C3tdL1
	eQrAXTpWWE9DnLtqXtOWYBh3siMTyP6YJLEDQH8LIkGrKhyvFfa+V8knkS81o4GV
	c4dqujzhGgnjg2hGILyzY/CwUGjK8plGw7QrWjwMCtu5Ei5/6uV2nh/j0awYOi7A
	jCepQKamI1ZBQz3nxbW6ZoQy8uGQpUZaYEBGM12WrPpuqs92Q0Djhpqw2OWbuVPj
	A98chg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dukrp06vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:22:17 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f67ce97a7so8716990e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777476136; x=1778080936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+5mnuZjemqdu7hzirtL/WVIH/f1YJBhgAHq6MKdruYY=;
        b=IDlkoptmk+TsaKceLdkentowfhBc4N13zMzOTQclqM9Vp8LSxRUthrOvyLhiOGJZw2
         1TVs59Kxb4qKituMHxWk7wDrRI54cD+VtvewYWfNobHI1aJZBKzMEz7ZLnzzPcI7tTFz
         W4MHfslCbMUdBAWKUGmfX/hpRmW7PZv/MFwtjQuv521ZR7Hc0AnBeXM66khA8O7/HxhT
         l07dL4rN518tPwMUnNsW17wOUXVYF/5dI7CBB99sZ3xwZhuk0cNbBwzXFm5gQCvaYTyd
         guvHkUd3Y2CUNUtcCCPKV7j8ttz2AkgzmUViQSdQA5vszZln23lyewWzoTnhYbT+/izx
         3cfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476136; x=1778080936;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5mnuZjemqdu7hzirtL/WVIH/f1YJBhgAHq6MKdruYY=;
        b=UqJBWoytX1AuHK4lKxLeP3ZVGxG4InZL54xMa2gxEugvUxzFnbTY6RFMxENySkcQHq
         YohSsdoanuHxq6lXQZZGMwiYtWVbDYGr9JrDEN25dkdnX/YZmNod6QAgJcaO3Z4JsMfd
         7Mn+5zaMKfoyjcqnhkDWEqZQKXShXCO1PNQ14OuYsvKCy+6EYYdy4vTYO4Ne8xWLo/o8
         Ex2SG+CV6Ls4p+jIPlJGjmFN4Q84mGudDeFV1SvgeuV6GOmVk59iu6jEMoqsBbe443vN
         hnYbd8upeZR5aRIELYJ+GDdQ4E7KDtRD8LPAykPlf+OGl/Vr5MQM3Es/hctSQKJg5Znn
         KQfw==
X-Forwarded-Encrypted: i=1; AFNElJ8dDV6UC8DaHjT/u/bNqO5lC8giN2uPTn8BmISc4Ccu56O2c+d7U3q6lkfJaNsVSP3JAJsum3F6dFWYHVeJ@vger.kernel.org
X-Gm-Message-State: AOJu0YykBuEV5DM60/qRWm3HlbdXps4W7+R9QC4aJnCplEsSLX1m/zp2
	lqiK3euMqT6NR0E/vZHNvneysmfeHK5SQuxQzoQ5tp4/hz7KdIwtlPg4RCNtS8bnd4h/gCMos3X
	XvyEXzDQWa8gVRMCDhwxJHwvdxlFbHtJOoZr/1eZyGdPxZD4jnxOeJMBHvGqQY25zC+nl
X-Gm-Gg: AeBDieuffFOYJ5GPj/hGV5JN2j0LXTgyHawWg8HNCxhvQHtPl2n395gIzBTFUnnLFWr
	n438ArcRYCuZa5byxB7JErFgC84jKizFX0RhDXrAPRm9TQEjdjqKJ9Xbww+3NdoUI/S0Qj5IMSj
	V+Qm74henLch5yXVgjqVIQj2tp86PtTKIUWyUo7md2iwh1Db6bjrEU3fKh5qU/oeVS0xn+O6Ej7
	43jAKviTpAx250FxFumuZ5jhnR0jssiYP+Ikt2H+ieJGRbDl2K7gTGfqF67PzSCAPIFejVTZCZI
	Z5LbbJOBgGwHhJDox6MVkSsCnX77OHbg4vNTeE3Sne6B32cIdy77LXrXatSVZ34LrkT3ezDQI6h
	fX54Bp8/qEtRy+M0pbr+1MV6WUbLPPu5Rx5/I/17gA3InzbvSzb8vB1+n1L4=
X-Received: by 2002:a05:6122:3b8a:b0:56b:5e7e:d3fa with SMTP id 71dfb90a1353d-573b35ae17bmr1995392e0c.7.1777476136483;
        Wed, 29 Apr 2026 08:22:16 -0700 (PDT)
X-Received: by 2002:a05:6122:3b8a:b0:56b:5e7e:d3fa with SMTP id 71dfb90a1353d-573b35ae17bmr1995367e0c.7.1777476136026;
        Wed, 29 Apr 2026 08:22:16 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c57333fsm54194885e9.2.2026.04.29.08.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:22:15 -0700 (PDT)
Message-ID: <f9148fc8-31ca-4400-a12e-630c80db020b@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 17:22:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: defconfig: Enable CAMCC driver on Qualcomm
 Glymur SoC
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
 <20260429-glymur_camcc-v2-4-0c3fd1977869@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260429-glymur_camcc-v2-4-0c3fd1977869@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wYVimCtnd7IvKOO-fRw0Qx65aGGkJzMM
X-Proofpoint-GUID: wYVimCtnd7IvKOO-fRw0Qx65aGGkJzMM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE1NSBTYWx0ZWRfX8jOC1D8v5uFM
 6YsNA5T0agqVN+fFM3GsHtqY2W7LApm9NUd6rL1DTsw5ADwx3ABM5Ffpgi8uLJ+1ZRzWwN56PCo
 9yDCORSaDIElv1emo/SqaPH0eq5B7Sh2Tw9y+kjxrFxLzPR8MyS5DW8thFZ7zmMMjZ6+mnp5PAT
 4lfkCPWaT2NDvkwSg4Pw40ipvzG9ucqs1tTlvAAkVl1AlOhzLdLVtoFDD5Qc1rE2zet78BdkYam
 pp+h9G38OcYHXfWyhF4w4xF2hi+0SughdMYWY8O3Z+rgMus7LTOT1u/pUxASuB2+qBPgKmBwV7G
 4+oTUJPLvWUsRVUUayGDXfqFYgVQsocXLYMYKML3OG7Zjz3pWlvWAMPEUR4k5Hfq4irvP4A1uoj
 Efpa6T7R/Xjz7gJZ5u5f2hpTcenIrQPD/t2kNidUGcG3QQngv85aB1hfaNU52R0MSoOd3WMvThj
 WD728WW/deyIObyJUaQ==
X-Authority-Analysis: v=2.4 cv=WoQb99fv c=1 sm=1 tr=0 ts=69f22229 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gVjUULPjWigP8M3rbEwA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290155
X-Rspamd-Queue-Id: 894AA496E50
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105241-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 29/04/2026 16:14, Jagadeesh Kona wrote:
> Enable camera clock controller driver for camera functionality on
> Qualcomm Glymur-CRD and similar other platforms with Glymur SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

This change should be dropped instead. I am removing all Qualcomm clock
controllers from defconfig.

Best regards,
Krzysztof

