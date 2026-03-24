Return-Path: <linux-arm-msm+bounces-99578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHzDCBZYwmnQbwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:23:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D66930583D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43FE0301548D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D5D3DBD51;
	Tue, 24 Mar 2026 09:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nir1AA0v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DAT4pnlu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2243E3DBD52
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343666; cv=none; b=PWQrFvyP8plLPFpTiNktbRj0Lg6xxvJUfHogkA/J6PH7d1ubfMTcKJMPk+7Iz6l26HC6HnMvnaVCm3QY+rBm1JfqnIYQ8LLt62iaNOnPpYwmSRje2eM/ipAd0ERAbB47TQ0sdhQRhdhXKIMrZUY9u3kOkrq2+1ICyok7RvGI7WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343666; c=relaxed/simple;
	bh=1XDBE9N5yL6q5NLh6xhTYtrhIDGBuuo9/pJd2LX09zQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tFcKBJFYNt+TXAAfxjS/kW/ReYKyrLGGxWDG40gp9FP39g8d0hOqfNtHt5oqhM4njF5yNyqowIlkEuvAb1s5QgJNOLQA+pV7pfYtB5Bp9I0ywC3pEFfuzQPoedhleH4cnbA+khD2mQDzYMCAfsaidUd3moblBtuazUrSZYDNWFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nir1AA0v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DAT4pnlu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O7REOY2371464
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0IaNJvCEdTohWyKCIT4qk+cnIi6SSrthKfIU3P72Gbk=; b=Nir1AA0vkDbjuOln
	JtWsKJb+6DiDgxpBbDh/FWUI5eYJM/4n6gYTEHusJdda4GENhoBtpqdXvKVWtmFC
	Wyqk297Gow8+6KecqF5UCjeoeplY0QDP8D3W71L5QsX7r4nLIms8AQW96YprNGMT
	O7Cb4D77T896Cx+Oc3fRpuMzyLGIWOwByqqzz0LVHdyTEJi9JsVkBuvh5QizDkLB
	/9mdw+PqyHIWXnhfNOxZHsk8MQjHA/Z+6D9+ODczYkZTA9H2zrFpm4dgal2Us01/
	SAyu3s6/qawBAjBsAvU2XNCL5UzqqDx6pYPJXKiLm+pyiGkTtUne+NjA0Qk3yojQ
	/Roavw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3p830bft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:14:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a081737bbso59600116d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774343660; x=1774948460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0IaNJvCEdTohWyKCIT4qk+cnIi6SSrthKfIU3P72Gbk=;
        b=DAT4pnluNxRTks16mjX0QNQdjh/9oGUFqeFzkR503/13mKICRUaVvQ9KpuWQ3HHuaq
         gL87Ra47dCcssgIP+Em5ayMgoKbxTl1srMuO+slXYgIII5t60ZnbIpcDRgeMNJBokYBL
         GzZNFUSHWTh8nG1QjM/m55/M4SEhsG9KObTMLz80uAmv7iDOagwyOKX/sjkG+C78qzED
         dfwaqPdmC6lxN3a7PnHtTF2OYmdVG0ejE2CjFV8DnJs7HEtbpOHMYCNCE8CyaY2+XLrE
         9gNAnedu4PKpQbM4h5/2F9IzL62+IJgpNV75++vJ1HNt8zc/KW0lTOl+AfVfAvX4CN5k
         1HjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774343660; x=1774948460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0IaNJvCEdTohWyKCIT4qk+cnIi6SSrthKfIU3P72Gbk=;
        b=EGHlvLvSBn8zn+JfJAGHuOT6jQjL/jMqehu5MzEB0FupwH5GzTftNT0LiceqHYgdOf
         do/twYe9Q6T0L7G7G0OTnoOb06TIJxu8/2DbrdQLJn+Vk6D+2Ynr548Mo2SLF7USJ3Gn
         8U4eR0VL5opOiK3jMwFU025Q8WbswQ88aFc3mzddxsnoa74eW/lowH0P9PG1fezxqdoZ
         VTUJmo80t2yx5dL7+3EEctmA/85pv52YEDnKRNBB2BDQRUn6GJFGpg9EmOApc2pznO/t
         s7EpSi7mUX11xVMyNbeqjURAQV0EGOVmrcWhdpxxRPkS08o/6FAQ1KTV2nU7zAYFtnRA
         x0bQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+tTOnNSQbLNjyQTMe0hpAqa2PJSb7B+YxJ4y+8YI83l1Pqk1BhQrtKTeQ+m+0jHnwB5MH8OhpkbvLrA7H@vger.kernel.org
X-Gm-Message-State: AOJu0YwSdmsBQdQchRXY7+i+2VlQgeQjI7AypxWXGyQJw6avfhKOyrro
	QF1oD/t09SXLc4/c3darLvdIXQCdnq/3r/WLyuyZ072UFZ3KIdYHNY34a4A4CS/wQAI8RrT2z7V
	xiAdCO1xKTTzd0Yn6/2nqhXu/Yl5ZUUsXBKzQcEZrCVsGwKMR3CeY3L/gGqq1iOeJBD71lgR7QH
	kc
X-Gm-Gg: ATEYQzyzZmhPSzHPOAEVGhACi/J5jpFYR/DU7NHWodmIu+QwAZoah02LP7GRrXAiZFx
	fYqwUClJguKM1TZ/nmZFFmtP3CTp5zyqqz+sC5fUahLcLe/g6WDEgTLUt6UodgpcxabwDSrWsTG
	UReyANJaIc5hzm7y3rQP/ai0lDtopZmpKJg8Qg4B5fZcHWDJHDPxgbTtDnVGhFjG2rd1LURYRkP
	msV2wX50J9xhKCKF/KQ+PB5ikEFlZnl6G3hfY2SELp4XvpgF75qQh/V+5iV2yRDrFNH/YHHOoej
	AC2dXuvw77hfF6oWXdTlEf0caGOLvddyPvAaxGNqi026HirUMnqNz95b30wcOCjFoubO2zPavS8
	QYVSeDD97tkmzg7nOyc4beqLZhgPfrYNi+Qy8FPQeo/iRvAKhIpAVif861EoUmoMrFMumn99WwM
	8Vsqs=
X-Received: by 2002:a05:6214:2b06:b0:89c:51d0:20df with SMTP id 6a1803df08f44-89c85a4d8afmr168526866d6.3.1774343659946;
        Tue, 24 Mar 2026 02:14:19 -0700 (PDT)
X-Received: by 2002:a05:6214:2b06:b0:89c:51d0:20df with SMTP id 6a1803df08f44-89c85a4d8afmr168526676d6.3.1774343659479;
        Tue, 24 Mar 2026 02:14:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f440f2sm610816966b.5.2026.03.24.02.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:14:18 -0700 (PDT)
Message-ID: <753c4438-6450-467f-916e-b8a3f1d3940d@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:14:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS
 AXI PHY clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
References: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
 <26twtzbvqcevl7jq6idkhhhasf4kuu6a6p6qby2plcg4a3vola@exafx7os7jls>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <26twtzbvqcevl7jq6idkhhhasf4kuu6a6p6qby2plcg4a3vola@exafx7os7jls>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3MyBTYWx0ZWRfX8vYVXr+oOA3d
 AhSdmpTuWHryG7FfVKJFN+QmJOGlQAZB1OstNEN6zBVcEh2YUeTDevBa9IhrYSGuv04QJ1bm5gi
 8Eiwc9U+EpbHUyiYATzKUu/S1jaKvLUJaq+m4dVTNFiueXGNOQq0zYk4cv/uYL0oeixyywmF5EM
 KYaribRyPTPf3bSrfjomtbQtYe5wEkWsQrQC8jj6WdCYGZjeDnGH2CcKbdV6154ihUFgZtBNuRx
 L57fMDoR5AP/vQeovWiqwFPWusYLtdcD0SWfuXbzYt0b80DAmxof/qpWGVw62OjARH8vqZ2gqMb
 ODNMXSJ+QUBOeOfPR5F8ibg+xEgV73ZOqHCMuvU2k9x3YnfE72eeNPRLWVswVoAkXBgbv6Fc9jL
 L3pfpDhO9agpr2fjotXq49xUH2jOvUHKSxJeWc/ABvDpTb9RyWWZ+kZ53NwIc6DSBOxnmQCFehP
 CunNlbWazboPfuECxXw==
X-Proofpoint-ORIG-GUID: 8pgZcxckbieleXCOGfKS59EV1jK2nIPO
X-Authority-Analysis: v=2.4 cv=F6hat6hN c=1 sm=1 tr=0 ts=69c255ed cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=lpdi1krX-adDAkH61YkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 8pgZcxckbieleXCOGfKS59EV1jK2nIPO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99578-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D66930583D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 8:25 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 08:57:12PM +0200, Abel Vesa wrote:
>> According to internal documentation, the UFS AXI PHY clock requires
>> FORCE_MEM_CORE_ON to be enabled for UFS MCQ mode to work. Without this,
>> the UFS controller fails when operating in MCQ mode, which is already
>> enabled in the device tree.
>>
>> The UFS PHY ICE core clock already has this bit set, so apply the same
>> configuration to the UFS PHY AXI clock.
>>
>> Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
>> Reported-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/gcc-eliza.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Do we need to apply the same fix to any other platform?

Most of them, actually

Konrad

