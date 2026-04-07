Return-Path: <linux-arm-msm+bounces-102146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL9SM9fp1GkjywcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:26:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4F93ADAA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9045C300D69B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9FF3AD525;
	Tue,  7 Apr 2026 11:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RH9N8BYx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HM9HGY8Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C673ACEF0
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 11:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561150; cv=none; b=YUkPMvr80bXDZ/TkJsMB42fmgGloMyuoBuDt0EEfd6wM7YDtOcNfR6EQm1drnoLmc+xM4jZSqXX2qQtheKrjDRQBEt37Up/d+IJP6X2UjrtCSaZO1Y5bLHA7k+svzjHYP/ZajWEe7wK508/4S29RzMbcFp8MSyxDjYl8R45Zy4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561150; c=relaxed/simple;
	bh=7VxopGj6OKf6wwgAmmK5nD4wXUdypyAd6t9vKyDOmIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpNQ1VI/vneQ+8+WmXMxHhfbjYFBRt2g5dH6f3wpaEnT1wCdmje2q4y369wOudqAzpYy1lGwpa4DqPhrIQT2WxV/8o6he3aobKPJRrWluW4ndI5IAL1pgELy8kESHTsJc8xu2Vq1oq0IwQ0WPab9OiSQQtfv/MZRY+K0rQ/5Xkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RH9N8BYx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HM9HGY8Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376gbFR3815288
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 11:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuA3/x1S6HYosIQcTCsqEgUi5XC8HNDAlPK2rNrD76I=; b=RH9N8BYxu/OoCdN5
	Zv7pjQeDLhWnl/+EWNBao3OErZ3jFXLuYAjY4WcpFECccorCchM2bNXs/mtxdz1s
	gK+on9zu3KOT15yfuDJ8Qn+napdG1BfhPPYoRzj0lNUIBkXZfwtMg83tf6AucTik
	YY+y2Db2Yn0zKOFj/8/y6ytdvOAes027AIFUCo+ddWSrce72uY4gnYa0v6URLo/j
	EAIxRiEp0aZS33P8OWDwEo8Ft01PeWYiy6ioI9ga8zUxQMb2LuNEVV2kAo8wDApb
	oQKvzEN3wF6zDPyh/KaAm3Sqyw7O+kA4pfO/DqoeBieyhXAixP9P49F5T5j0Emyt
	zkq44g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4tg6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:25:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d59968444aso59933885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775561148; x=1776165948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JuA3/x1S6HYosIQcTCsqEgUi5XC8HNDAlPK2rNrD76I=;
        b=HM9HGY8YF5JH9gciEeC78FRS1nqAcTpbcHZLFY0d7D4kIAhjUfh6kbcgoOz0GUTlus
         qD9c7hI+1zGgEGYpRzh8LnIy0hLdsOLwH4UCDMvUHXvINdHyXWf/F5hXffvUbzCmSvyY
         5oHy9xTQc5YG6zWWVTRZNGSTUL6fEje6/lqU+wvgNi37gjs2I39fcRBE2VpIwFRJwoI9
         cE+ChI1ABhdzRjo6gvqSTsSlbW7ZjboeoIZSJYH7uzgCwNLPk5GVrdifAKrW6dJqAZ65
         iAKkbtqjd8iNA54oNq6b8oZvhhvaosWzg0wqbDzTTVDHeAEAHl1BfCCVYMPUnvyYCQ8N
         9iGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561148; x=1776165948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuA3/x1S6HYosIQcTCsqEgUi5XC8HNDAlPK2rNrD76I=;
        b=mmH/9upCFpGy4L6ofHXKXUt/UzBSr7KzlXMS57JCNa67dCXwoNa2EJm/TmTx9KMCPH
         TPdh9qhKnyCvRmo/ekIQCuEEYCyQ3RvoBPUlPp211jckS0Dh52IHhlsIF4fk6MK4+1RR
         ycoyy4kSYFRUQfHfxUu1seT293tlfD4IEh1qFVXqbgxB0+VrObgyM2cU/8+2/ve/U+H4
         czLS7E5GQw5rDbmMdX68ocrkal4X+Hev5YhV2pdUqC68r4KhzRfFg7r+vy1vutlsl0AR
         Q/neR+5a9a3qhWSZ/QpJh74sXLfLXffWX8gfRTIaTkNy5cc8uWe5EWVsfdPeOUVF7jVc
         WqQQ==
X-Gm-Message-State: AOJu0Yz7eTDnuBSw1eDrJ6Eq1RDdd2OR6KEjyxYCHwHVX0e5OQur1JIi
	75ZQ5aG0tra0tNE3Mh74IddRoDXW/O+1JkYSOM52mE/u7kFP+pVwLTwDnWUgfUZVXgS6NpHYHG+
	I+Oj0UP0SoXL499pB0qvGo6ytpYUR9zc0xwe26MFBXcxQG77Mh+h8Ht+5N1a4pGuD5GII
X-Gm-Gg: AeBDievTeX2vahAI8GVDooLfslHSST0v+gafwFhq73VXIQBusD1a8X9dIo5YhT89iJX
	rMilhPD8qEgbs0xTMv1FWrsvZmbTz9AM4D5+9a/Vd8uNs95Z61XT3HpsN8bAXvApnz/QcNxJY5z
	qYf7jTaImPx66bE/lItMX1Ahd+ltZpNZLQyxOnsdJVCLRubxt/f5kA5cMs+WGc1H0Z2kBMwx3IX
	Ofjbl7YzcoFBSqRh7FFGW+f7TcIExjXdZg60JowRnL4hBNDjIKfxR7NJ/eMDN7PZUl3V1wiaAwV
	hiTnd9IrlklSon4ts+PvxTChvvoGJ0VAvp8GX0YgqENFHNfHixXd71ofI5dXedn6OECbw2QysYI
	qDswEXGV20N/cksPzEpuILEEcSV/N33dTwlbkidQVvlo8GZ78uOhlhqd1WThrssP8nL9pigOe3U
	HCX70=
X-Received: by 2002:a05:620a:489b:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8d41b2e38bbmr1773618385a.5.1775561147584;
        Tue, 07 Apr 2026 04:25:47 -0700 (PDT)
X-Received: by 2002:a05:620a:489b:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8d41b2e38bbmr1773615985a.5.1775561147051;
        Tue, 07 Apr 2026 04:25:47 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a74e8sm4218517a12.16.2026.04.07.04.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:25:46 -0700 (PDT)
Message-ID: <fc1fce6f-b37e-4d69-9121-dcf8df9740f5@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:25:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: lemans-ride: Enable mdss1
 display Port
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com
References: <20260402095003.3758176-1-quic_mkuntuma@quicinc.com>
 <20260402095003.3758176-3-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402095003.3758176-3-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d4e9bc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XQLX8yjaJUNYVVxXu1AA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tVTJv9mBIHefFgEY1NhgUr8j8ytign6D
X-Proofpoint-ORIG-GUID: tVTJv9mBIHefFgEY1NhgUr8j8ytign6D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNyBTYWx0ZWRfX+II/6Ug61AcI
 tB9liPYG1KpRmPukG7wEAI0Rtg0qk6w/XCDQmhmg4xdAylKsu6zAAShzHIuHfkme3O27eqE14f3
 rSjgS6f9gYc/Wa/zBKY8a2zPi3RAcWWwZIjJ2d9J925e8kCLJKlcN3Xoq52BcBaD2xGSi7GuzPu
 +S7LU9wD0+sNHCcUyD6DoqQChzTXrT2h/x8bQdst2ibRyiHTCJdTEmD8edXpDeYe2LCuSJp3Mep
 bJhbpKOTUMJTTptj/zoYxoBtsM75hL8fP7rJhixFD1T9SAjFdPou6t53w2JD/5kSEfXF+FxczEL
 ZFDxQuuqEaonhQzjBGRCkMZyw/PKPk4O4isJiqWBD84ATnMoe2ZnpPiMAKfzjRa1z00NH+eq3Xw
 lkYhbRKzceu8vwjDPcpZlWrOT68/mk282qtWBVO+tKHWWGWmvC6hS38xnPsDutc4bCDvMnoUNbq
 cziIyPX99N9CHeWgksw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070107
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102146-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[quicinc.com,oss.qualcomm.com,somainline.org,chromium.org,kernel.org,linaro.org,linux.dev,poorly.run,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 4B4F93ADAA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 11:50 AM, Mani Chandana Ballary Kuntumalla wrote:
> This change enables DP controllers, DPTX0 and DPTX1 alongside
> their corresponding PHYs of mdss1 which corresponds to edp2
> and edp3.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

