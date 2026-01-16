Return-Path: <linux-arm-msm+bounces-89340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC93D2DF70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 09:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0225F30142FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 08:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C352F6937;
	Fri, 16 Jan 2026 08:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PUSJ/j1r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCuiLE0u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD742FF140
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768551534; cv=none; b=b28LGYABydNTb5B32ydkEEJL5O7i0l3nyMA76wu5+snYSI3HwRpmJZ4PUJLgKXvymx5lEGAVysNuSSmVvChZUwPe7V7P5dS2Nk/CpPrjz0g4fEeXwhOR5TlGBXDNalMYvaAULG+olq4MCARBct9I3RvGT4jRjW7/kxAuPsPxQfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768551534; c=relaxed/simple;
	bh=U+I94Iug51nnAGv9ldMSSkhYbbafjdGKXLZnJRVe/2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjVi1+nnEu2dBeutLkUgE+GR2xTv/x6Yyn4tLEncdJ18X8ClKLvW9YwR3aUMg2v22rU8yOm6vY4vwzNH+Fpz+1j69j82NF4XM0RULPPA4NpZhsQoZdumSV3DJkBPMBIbn/2ALtE3CbaFVLu7WTLfHBHhr+njkTOj1x9HJ56VRBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PUSJ/j1r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCuiLE0u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMbiLw3596966
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iGunpU00SNV3xbEPHhyWD3SLNLFixk/WUO0vwRyUqcQ=; b=PUSJ/j1rXH0/BX/3
	KoYxXb0PrnVDSc6NtD2MRhAHjmd3CfwsMbQ/iCRwQLk4dEOSSBCztCFVVWzxdLMI
	tED4Vh44z+mzG6mYFmlspui0p9VvtT/X40wzMJazTbkj1vVlSNTwcO0Fri2sdQ1u
	BdDIcYjvzFPpkgIqEOxRVOKOOZg+hS+9jGcUcqoNYik/O3exFGczTjB5Cm4ISrJx
	pVMoBabWzSCuumgcIl0QGP6zUNLacLaEFX6cum1tITu0lsyGKNs6ps81xgtVyrGQ
	uLeDE9oTBO+pf7dfOCHsOfTEVBYw82YkJePQ4Es8WtplIcMYTK5YuwHXKluWQhlU
	kYjVHg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96rsc8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:18:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0d058fc56so14407215ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 00:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768551530; x=1769156330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iGunpU00SNV3xbEPHhyWD3SLNLFixk/WUO0vwRyUqcQ=;
        b=kCuiLE0uSZuOdLkRruR5VPevY4xCBxjO5Ng8MFUKFzgKLaEzFaA115b3wc8oILQHcW
         INH6mXqbBluejYCtIkEyHBCWf6PfWpRVhNs6QxW3GLQj4jEivS9MZX0ClwX/ypJdbxDD
         VeGwWfqx0ZMI66Ocy+q7gTlTHBVcGjYormAV9PTqivKjy//rVMkI6dqSqc0tiBjRMHaA
         o7GlUzj0UWN8enqpbeGOD0r2HWHbQePFTlVlCT0JcJk9K5LrKU6CI5Bkp+dLzAhYtIi+
         X95nD80OpkfSUoereQNpQ4HRtO/kX3Eo2p+YOI7KEXW4gNIEiNkG0+y2jKCD9d4DNh6e
         eztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768551530; x=1769156330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGunpU00SNV3xbEPHhyWD3SLNLFixk/WUO0vwRyUqcQ=;
        b=ll+1gnTsG6vKhJJA5v+SPc81DEF3Z2jjUPQPvtjcGM1DZuTjexKNgCe+mowW4mIjOk
         vXiGxN2eff0DaMLINX1YiYOo2ACjz9lNE3ttBha5+ycMxk/ylcOFwnWfsa4aOt2H/j/g
         NCd5QenXR2fEcxJYM7Z7aBq6mxi/EUN3HkjHi43JdakE3EZl36/LMbz+CJFq1LcBPQyy
         ipLzaQ97aroW4PGGlyXhUyBF1kyzpTlz5pqzbkcDRCOnzn6mDIgiRbLOL6QAQW38tIq5
         FE/kWh1+gDsz36QBugYnHRww8mQzJaCszZR3qgR1Dl4UMmCqWAVrATHNYufGZVzffuhy
         it6g==
X-Forwarded-Encrypted: i=1; AJvYcCUuRNC1m/yvU2c4SJABezelcSWRZ7nvUqM19YZl8VNEUk2SwSgytmOWw92/3GfdEV0PvthUJ1TVELnu3+ZN@vger.kernel.org
X-Gm-Message-State: AOJu0YzcX3Hk1ICC+URvreXd4fqaWOTV+T/R02UuKjFHEEQ8NGnORENf
	HdshCFEbdT75rc1S20PB46uYYkBee+tVLvy+VaoZ8dwbh054KoCl7fbMooycexhq96EadwSri50
	DWcpLYA6sX0FbHLwAWlv+m1JeUzuhuSVU+3M5bVZwhIKLTE9L7LtsjU5OSd2V5ddg0UUI
X-Gm-Gg: AY/fxX4a5BqvN1ckMViFejrqFkSsgthZwuaIIm7fJIdf24Vx16NlsRG0+8iQSt4D/yo
	Be1hPLeeEXafH7PZlK2vCt32PBzgEBDQlhg02SHf+ctUq/e2RAVMQ4eD5ybNAnqf4bXCHqH08qy
	z2dPshdYi1bXTpvOg6hfP+I2GN0qajzKz2MTi06cPFYHrG0kmLtwAoNwxnh77x6m6YppWLeHVFn
	ypwDVBdkYQ3mnZMrcrRrvMBXgMEhBRJdqcoDYA+TGFsEYkHD9wuVfA0/18PuX6AY9lMSwOM56qh
	ZqfDHvY666HsKyUzkDc5+ut9fR9ggt7jlmGcMyQHoYtx66c34P7PStpc+PyW0/mqmI4kMVCzBsz
	8jy33W7QzkP+bXJ83oNo8Fcf1Ft/LW8CtTkEldHs9YQJ4y2KWjUr++4XyspCS94lSKW14eogN6y
	SmK/n6
X-Received: by 2002:a17:902:da83:b0:2a1:3dae:8f22 with SMTP id d9443c01a7336-2a717808b49mr17698905ad.61.1768551530388;
        Fri, 16 Jan 2026 00:18:50 -0800 (PST)
X-Received: by 2002:a17:902:da83:b0:2a1:3dae:8f22 with SMTP id d9443c01a7336-2a717808b49mr17698695ad.61.1768551529909;
        Fri, 16 Jan 2026 00:18:49 -0800 (PST)
Received: from [10.133.33.64] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dbb7fsm13994655ad.64.2026.01.16.00.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 00:18:49 -0800 (PST)
Message-ID: <80411ac4-6143-4c2e-bc9e-20a734f15987@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 16:18:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Correct LeMans/Monaco DP phy Swing/Emphasis
 setting
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260109-klm_dpphy-v1-1-a6b6abe382de@oss.qualcomm.com>
 <5187dc04-a1a1-4537-9c80-aaa100dd0033@oss.qualcomm.com>
 <33d57a53-93b4-4ea3-a7bb-0b2015501bad@oss.qualcomm.com>
 <ldl7floy6bi5d6svs45xsdgbgkgwxpvj4kuazzg3e6dxzm654l@l5pjud7mvcgu>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <ldl7floy6bi5d6svs45xsdgbgkgwxpvj4kuazzg3e6dxzm654l@l5pjud7mvcgu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA2MCBTYWx0ZWRfX4Gp/ppQkYPeo
 lTUpHY6Hib5y7mGMeg7Fhd/f/u7+dMP0Eqra32ovg+qKNqMo+btcHfAREZcdKj/ODvmypCWRg/I
 5ohSDLgQXdAiIu1Ho+YfcDYV+TbFe3IwSHl4fD9UnL+D0B+kqPoBYOvDDGVIrQ23DjdrrSCGIH8
 Z7o7h2OS0DODLMHybO3rcq8uvV9fBGQVzIo21tZfhjqMzjhuj0wwhYM9Sw8DoKPVM665MiZr0Rq
 j7Gu2NWAQhNEHu8I/HKh+E7c49LocAPBSBOLIrFw04y2lgx/1NWI7v839Ffc7lj+R54yFfWFlT5
 GcrbquiAqRYiPUsyUSFHQGWL0d2xa9itE0efauIkuNFi69FZvnUYLGnyBlpbNpr0jnnA39sAmvB
 XYtpUa6p8REYgpcMO9DcxgrHQ8pPbUR3x95S6VSFPwQQAmyvBoMjuRgakmiUJPu3wLAq4zo5gm6
 feeClFEaFCcRdLJFvDw==
X-Proofpoint-ORIG-GUID: Bsaf5WEW8xOLD58dBhSipbcc3iuBjGyx
X-Proofpoint-GUID: Bsaf5WEW8xOLD58dBhSipbcc3iuBjGyx
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=6969f46b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lPA2UZEUP2jnaNcI3IQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160060



On 1/14/2026 2:55 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 13, 2026 at 08:04:06PM +0800, Yongxing Mou wrote:
>>
>>
>> On 1/9/2026 5:58 PM, Konrad Dybcio wrote:
>>> On 1/9/26 9:30 AM, Yongxing Mou wrote:
>>>> Currently, the LeMans/Monaco DP PHY operates in DP mode rather than eDP
>>>> mode. Per the PHY HPG, the Swing and Emphasis settings have been corrected
>>>> to the appropriate DP-mode values.
>>>>
>>>> Additionally, the HPG specifies that the LDO value should be set to 0 when
>>>> in DP mode. These misconfigurations can lead to link training failures on
>>>> certain dongles.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/phy/qualcomm/phy-qcom-edp.c | 27 ++++++++++++++++++++++++---
>>>>    1 file changed, 24 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>>>> index 13feab99feec..5b0d774bd715 100644
>>>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>>>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>>>> @@ -122,6 +122,13 @@ static const u8 dp_swing_hbr_rbr[4][4] = {
>>>>    	{ 0x1f, 0xff, 0xff, 0xff }
>>>>    };
>>>> +static const u8 dp_swing_hbr_rbr_v1[4][4] = {
>>>> +	{ 0x07, 0x0f, 0x16, 0x1f },
>>>> +	{ 0x11, 0x1e, 0x1f, 0xff },
>>>> +	{ 0x16, 0x1f, 0xff, 0xff },
>>>> +	{ 0x1f, 0xff, 0xff, 0xff }
>>>> +};
>>>
>>> For these platforms, I see 4 tables of settings:
>>>
>>> (Low/High) Swing/Pre-em for (Low/High) HBR
>>>
>>> None of them exactly match your change
>>>
>> Emm, this table is in LeMans eDP HPG, here are 6 tables. 4 of them use for
>> eDP mode and reset 2 tables used for DP mode. If my understanding is
>> incorrect, please correct me. Thanks ~~~ > [...]
>>>
>>>> -	ldo_config = edp->is_edp ? 0x0 : 0x1;
>>>> +	ldo_config = !edp->is_edp ? 0x0 : 0x1;
>>>
>>> You'll notice that this is further wrong, because for eDP, it should be
>>> 0x81 at low-swing-high-HBR and 0xc1 at low-swing-low-HBR, and 0 at both
>>> cases of high-swing
>>>
>>> Please split the LDO change into a separate commit because it touches
>>> more platforms
>>>
>>> Konrad
>>>
>>
>> Yes, you are right, here seems something not correct. i will separate this
>> change into single one.Here are some parts I don't fully understand here.
>> Could you please point it? How do we know whether it is in low‑swing or
>> high‑swing. I didn’t see any logic in the current code that determines this.
>> Also, the value in Hamoa seems not same with LeMans,it is 0x51 and 0x91.
>>
>> While going through the Hamoa HPG, I noticed a potential issue.
>>
>>   static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
>> 	.aux_cfg = edp_phy_aux_cfg_v4,
>> 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
>> 	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,...It use
>> dp_phy_swing_pre_emph_cfg not edp_phy_swing_pre_emph_cfg, but Hamoa really
>> use edp-panel here.. so does this phy cfg correct here?
> 
> All PHYs should support eDP and DP modes, so most of the configuration
> tables need to be updated/fixed. I tried going through all the tables,
> but I never had time to do it in a sane and complete way. As you started
> looking into it, would you please review programming for all chipsets
> starting from SC8180X?
> 
I don't got the SC8180X PHY HPG permission now. once i got it, will 
check it's configuration and see what i can do. But first i want to 
correct the LeMans and Hamoa configuration and post the LDO change. Do 
you mean switching between the eDP and DP mode tables based on is_edp, 
instead of using a fixed table?

