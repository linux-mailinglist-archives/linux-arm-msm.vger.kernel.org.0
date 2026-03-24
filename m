Return-Path: <linux-arm-msm+bounces-99656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJEoD7CMwmlvewQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:08:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F824308F04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A730730FFECF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BBD1A683E;
	Tue, 24 Mar 2026 13:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILeL5dpM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrsSmxUV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2274438D003
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357217; cv=none; b=b67OWVHLJlkslx4PP9XON+e2U2o8O6bqjkdeNe54SNfwM09mAZMgY5DHjcwiPWZHENoktn4dgGWFOdgCSbTZeIptPdd+UctTV3V565qt39pUxoeLjcnkmF2a1gRTMisiEMr9we7GyOt1TP4f5KDI1rmZCJmKKETVl/H6E9I3Ja8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357217; c=relaxed/simple;
	bh=Qo/Mik/vYS6SQbgLS8M2JqG7+aOVsZ6u8vdCMUadwzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNiXwFktqgIEYpV53fKr1B7i6ABvP1USKVxP8ebCS7uXzK5IiDaXiWgF3b0puRvEb+yye9YsvcVypnS/9oOjWhU5X2E1J8AC9xzPiN0ZoW8Dhd0QoWpCvMrL8ns59JqifNfDW0/q3JhZ0OxDA5dibUVmZTj0L+oTGM5JMfrT+Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILeL5dpM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrsSmxUV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OA7igQ1761789
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VmYwnXBlvcv2hQPXBjEzajPd9eX79Z+xiIQAGDfThCY=; b=ILeL5dpM+b+Qe9eo
	u0cS2yP8SuwWXd3xtd20iF0awNgk/KKDbanZs/cUs1ne+74zEM8XYNuAPTe0Ku4Y
	MhXTLOP3boJ3yQdud9yzaLsR/lgj+xaY2J3pYWOas2jS1jiXOxQZNZT1Q9nn7sOc
	XSJoJEYc2JfbbqWLV8rlPGFZ2Sd9U56jIerDtYkCprHBZokQLHS+/pjdtLS6Td8L
	wq19ab07kWVaa1mefo65XdR5QlOT0fxUjk9ffBGw/YUSVl/joSODxMHbQU2C3LHs
	8kSNCv/gxC/m8IFozfMH7zLb5BRNqgMT9CwZKSHL2X3hU9vgGmg8WPrF1y73paX4
	8S7Oqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f0cjgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:00:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b32feb719so34235151cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774357213; x=1774962013; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VmYwnXBlvcv2hQPXBjEzajPd9eX79Z+xiIQAGDfThCY=;
        b=KrsSmxUV31Km1BEFKeD3R2vSNZ/GwjaO4Hwh/v8+Me4s68tRKBZeE1hpFLAmObxgCR
         d/1TC4fsyO+RJh1AV54boKB/dS6QASBZlIXLSOqnWZsZUHcsogkPGoPH4xU7pA6a+mCf
         yqrFcOBTzEVndgFII/dCBqxADi4hUgVkWQN97xUpnFCVljplznA0QpNIDHMkGySoHzoh
         aqnPKj+nKAg0OI28t7hYjRYfqjPkAXrdMgz9XKn/jGZSH1g8tqlGTLISCskrCe27wtco
         oVgtP1tu8vHdZ9EYeaYAU+nWoJ+1/7KImRh8HHVqbSrZjZpNLgQEzYdf7LnF4Pb/Ze/b
         YQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357213; x=1774962013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmYwnXBlvcv2hQPXBjEzajPd9eX79Z+xiIQAGDfThCY=;
        b=iLYuwNvpjJxiIwTDCJ9C2PmLTWuHOShE9AOIDnR+EAkRBxVOyp0p51ZVef+m9du8j5
         IOgzVM0J6Yw1DPf8LL5zmD6bdNijVkRyuC7hYhVp3pJ3Fq+uUiR3Kerg71IR0T6OQQVK
         yV/Mow4V9n1frWhrqUOmgSwYQDG1+7O7wdDrX0i6200neUiYf1Vv0oAKiwW6xCgTbB0k
         LpoHg2XgGNGtSqfAFsYM6xKBeFlms1InZM5pToJc7yqaNLnUtwh+FrYKSK4fQtde5V5k
         KehnlHSJX0EzxTta2q3s9G63V0hBl9UIyPe78e18hPqHyjVOsbufojDTJEMYZfeljrVL
         XSDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8I27GFNbx620k09LyWQx21Lw8+A0E3acr2MddsqiMi4ReRpU5qYW/PbBun4gN6qNE4PB5EtVL0rC14Mkd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq1Jx361JK97oh39CGiMvEYF5k3gL6T7nmUM0aWyQ8GUEyNNLZ
	FllIbGEs4Uad3K3Z4YuddLsCL2JNvaV+bXlJXE5t3RH4HrF+UoBPKdl1vhJaRtdt5JSP0DmP4he
	SJ9KlQRqYwKHu3mg9C+z+NQ+n8GRHXHAOSQy9H7wiyZ9XYLURtGmPOYKSTOJkG5QvFRWt
X-Gm-Gg: ATEYQzzpCROemWv4kMUbes5Wp6MTumtglywfTzp/Q+cstW6keaxj15JGqxPz4RsW8bV
	/Trpexa/C9KYIQDCw4gMu3gn/0hoJmQvSOO/vY+7Vah6VY7TsxpEwnDUI8m4OVsIM5lv4XruvVr
	19jYmWEtF8kgMTHXhvbejlQYZBdkeUGEazmRCwBvOTNc115g3LTJ2tNK+THH4ls9NByNQHE258c
	gu+4fRbqOhdPWYvJkfrCkjrxsey55j/n9hdKe5Q1A4VsHVTIHybQT+TG/sVr/YY6hN1AK4S1N1f
	PGyuMoM7u9OWg6C0bo58yiH/aL8skIy/ymv7h9kUeiinGPBXKm9ZF9MqiF/vILHR7B2pROF3EhV
	u33czbonz+Yb9KH5Sac7pZJJW5pNK622fPkyYI6cbPu9DtDesku3zSSNPw++525drcJ2aQJSFTe
	68z40=
X-Received: by 2002:a05:622a:1992:b0:509:d76:fe73 with SMTP id d75a77b69052e-50b373d748amr187475761cf.3.1774357212262;
        Tue, 24 Mar 2026 06:00:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1992:b0:509:d76:fe73 with SMTP id d75a77b69052e-50b373d748amr187473241cf.3.1774357209941;
        Tue, 24 Mar 2026 06:00:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d22914ecsm4726697a12.21.2026.03.24.06.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:00:09 -0700 (PDT)
Message-ID: <bcce61b6-3fe4-43e5-9e1d-a4cba0bec0ac@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 14:00:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260321095029.2259489-1-mitltlatltl@gmail.com>
 <dda88cb7-090b-4baf-91f7-e6724b506134@oss.qualcomm.com>
 <vonorgmssumelw3nkgd335lzi3eekinlslqb24k5lqwzil3tyh@epcgwiiu3xqu>
 <ca88ed26-51a8-42dd-9b1c-3266a107c180@oss.qualcomm.com>
 <CAH2e8h6PB43h08aZsHmN68Cp5HHuEEmhD3WhF7KOaQGyqvHjsw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h6PB43h08aZsHmN68Cp5HHuEEmhD3WhF7KOaQGyqvHjsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c28add cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=0E1OWuO-EJLwnSaZFvwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: tRXbPtNlTiDim1ZNJA7ze6O049hS88ED
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMiBTYWx0ZWRfXwG8lhqL5o+js
 hz0mg9ehYtQTd8X+mjOkQQnsjz7kt7MqT/7B7B39LX+nZVc5e1hL9rxpD4PDOM49uTVvB9vFUMR
 AArrvpFZ0QM9a0mksuHtXoZALb/7OC1wP1KFu1ZoPtuNTMIZkbGsJaVE6xSYgJ+E7AADAVU6Ud4
 mMpR14IJ0uFcn7GTYisT1Dcxq0a5wiIYHGHrzegZEfSo1WzoCG5VLWIe9Kj2rR7fQfzFokOADWR
 LM+hmHNHiLIyV/6WlBl/Au0BJXXPUyjOiy7BREy3cTqj91y/wDGLVH4QrqdG+/AJBNhOno+Ks5C
 PRWTGJRwBgindca4qjBUc6n8Tic80yXYusy4DmvbDvPYnqAcD7HMi2fArOE38jzW03xsbQVoZlT
 eWfLBN7FAH2xeITuWjk81bnElCucAycykv2RZKgdia/lY/OAi+yNvuw2dLTNJpDlL1kgN3OUXU8
 CdZ7/grb9ihICPYhiNw==
X-Proofpoint-GUID: tRXbPtNlTiDim1ZNJA7ze6O049hS88ED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99656-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codelinaro.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F824308F04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 1:56 PM, Pengyu Luo wrote:
> On Tue, Mar 24, 2026 at 5:22 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 3/23/26 8:23 PM, Dmitry Baryshkov wrote:
>>> On Mon, Mar 23, 2026 at 01:54:29PM +0100, Konrad Dybcio wrote:
>>>> On 3/21/26 10:50 AM, Pengyu Luo wrote:
>>>>> Recently, when testing 10-bit dsi C-PHY panel, clks are different
>>>>> from the usual. (dsi0_phy_pll_out_dsiclk's parent is dsi0_pll_bit_clk
>>>>> now (dsiclk_sel = 0)) And we failed to set dsiclk's children.
>>>>>
>>>>> dsi_link_clk_set_rate_6g: Set clk rates: pclk=172992000, byteclk=108120000
>>>>>
>>>>> byteclk was set first to 108120000, so the vco rate was set to
>>>>> 108120000 * 7 * 1 * 1 = 756840000. When we was trying to set
>>>>> 172992000 on mdss_pixel_clk_src later.
>>>>>
>>>>> Since there was no matched ratio, we failed to set it. And dsiclk
>>>>> divider ratio was set to 15:1 (wrong cached register value 0xf and
>>>>> didn't update), we finally got 50455997, apparently wrong.
>>>>>
>>>>>   dsi0vco_clk                1       1        0        756839941
>>>>>      dsi0_pll_out_div_clk    1       1        0        756839941
>>>>>         dsi0_pll_post_out_div_clk 0       0        0        216239983
>>>>>         dsi0_pll_bit_clk     2       2        0        756839941
>>>>>            dsi0_phy_pll_out_dsiclk 2       2        0        50455997
>>>>>               disp_cc_mdss_pclk1_clk_src 1       1        0        50455997
>>>>>            dsi0_pll_by_2_bit_clk 0       0        0        378419970
>>>>>            dsi0_phy_pll_out_byteclk 2       2        0        108119991
>>>>>               disp_cc_mdss_byte1_clk_src 2       2        0        108119991
>>>>>
>>>>> Downstream clk_summary shows the mdss_pixel_clk_src support the
>>>>> ratio(35:16)
>>>>>
>>>>>  dsi0_phy_pll_out_dsiclk             2       2        0        378420000
>>>>>      disp_cc_mdss_pclk1_clk_src       1       1        0        172992000
>>>>>  dsi0_phy_pll_out_byteclk            2       2        0        108120000
>>>>>      disp_cc_mdss_byte1_clk_src       2       2        0        108120000
>>>>>
>>>>> After checking downstream source, 15:4 also seems to be supported,
>>>>> add them two.
>>>>
>>>> I don't see that, not even in the newest releases.. Is there even a reason
>>>> we have to list these divider pairs in the first place?
>>>
>>> https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/f7aec4359448d25c8a8d21ad8e8733d61f6b69ab
>>
>> Ahh branching..
>>
>>> We need those dividers to correctly program pclk RCG2 clocks.
>>
>> I would assume that's the case, but perhaps the real answer is "because we
>> don't want to try all possible combinations"
>>
> 
> So you meant the pixel clk can support any ratio actually, and just
> common ratio pairs are listed? That is interesting.

I don't know about pixel specifically, but generally RCG2 clocks can
do any rate, only limited by the register width, see:

drivers/clk/qcom/clk-rcg2.c : calc_rate()

Konrad

