Return-Path: <linux-arm-msm+bounces-113837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dE9DDZQ3NWpOpAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 14:35:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EB46A5CDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 14:35:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GsmCBC4h;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QLVhap8m;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113837-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113837-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0759730071C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 12:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B76379EF7;
	Fri, 19 Jun 2026 12:35:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72FB3750CB
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:35:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872529; cv=none; b=dif71t0HtSiF7GhqlhkT9pv8G4zCjZTD2aD2lov7Lzshey1Wuk9oBb8hk6bxgTfWYVEn7N8lb/8DbaeNVpoAMLcC+FkBKi4hkrH3H2j1TQQPZQVW4dbmX8Z5inr4IFoR+yINyUSTTvIsZyLEacPIC4YP+xcxspJIow16NhK8H0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872529; c=relaxed/simple;
	bh=BHT2BEZP7d3v9gf40t9/eFCAW0HPszC1k2qd82uPBkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A5Ti81RPBYB6m34vVSlkQCwOQsjECh7AAGoE92M4701Tyx/5xEZtHmuGfNjXRGFFI3AwbMyhpBsEXcETZDBiaLKEsoshNpkbV/ZC0tyi0Qr0Dw2p51O58sd9ALiUSyVYeYPxABwqcD7Q0mVzdpV7S2t6g6xWcHPWf/wMDZaHrtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsmCBC4h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLVhap8m; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7P0ek3737980
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3NhBX1Jobi1pxNTor8EgR7xCPiV5toNFXtLqEcMB0UU=; b=GsmCBC4hjfEK2wCz
	XEIGmsCefBRdpdODAFpvnI8yoJdsVDKj6JdM4qkUmPB0Y1eOoeTpA7gKCY/BF2sL
	Aw1i40bWq/9/z7l3Zof83+Bg+SCvWeLf/H0vrdcOWN72GzBgRuiQ3+sd2J/pQMaN
	/ape2mX6cwvH8JK5MojKhlbSO8MbvBtDmZWnWTj3Nf/yaylriavZxAUz++wcPGEU
	33EH6QsQxysCuuEqZRLygyhBPY+10peYIAJFRrufAE3yrZHevmeJbGy7fhYdjGeN
	JaiD5C71LuHgExdG0tvWDNzFiqScNHXAvVBf7L3uHdK11aHm2xm4qOAxiCIhHS2b
	wI7lcw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm26bsfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:35:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-920b7e31d32so10699385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 05:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781872526; x=1782477326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3NhBX1Jobi1pxNTor8EgR7xCPiV5toNFXtLqEcMB0UU=;
        b=QLVhap8miTQ0xlTQl2C7nq0PLPIjIn3iS+2lsBTzbwY+n4jTVsXAnVaKOrFFdPy4sU
         eets1HvNjJE51DwdqGMgH/zdOaa6r4Y6XoYvRrETQrsEb89qNt4/5RLotEVD5RZIdDC6
         bjTRNIHNdEPhgVKITo8cT2Os4H0+PGlSzU+Mji9WSirOaH4BEj/0LLnYFnlyGTKK9OMD
         ybPb19zfQ58uXZV63rPJbidDn1Ymh+5AvdbTgqNK7mnlVv2hzXFrAyy9eaBjDQHcK14k
         NFRRQt3o6+co4CWBSVAoKmIFPrc9IyTOhGCs0oWK5UTI2oMtqRQIjEFbYgqTFfIsyRgH
         +Nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781872526; x=1782477326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NhBX1Jobi1pxNTor8EgR7xCPiV5toNFXtLqEcMB0UU=;
        b=fTeb5MUmV6R9iRfauXZUlVUdqtc83tZKS+2LOCBs7psyrbrQfKXHw7KQA4WlchbWpm
         m+Ar9ua0XdoKHj+pb+iYOtrgkfeLPCDl27vGg4048A4llVDb4TZGnlXnj7CmVuzdIGAV
         cRT+cNSHZ5irfmGGw25Do7R8uLyZY6UO11S2OrCLWY7NL25KwLt9VzIabdnyzuSfoLQ1
         St+HH/qzQiGHnyIM7cncWZPGOl5LygljZgb6dPgdQLPJwaMb0xRWsrGzfs/WZO8lwxCt
         MHkpiyVrKWxiNMy/t31T31o8DdrxBW6pcMc2ZXjt1dQzkyDGMRL/cISvupSIAh2RQqRj
         cMQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yacrymlZOsYiylrViPFZPRq1+ZwmQCsAyWyFGNam4yxxiduU9pk101eXHkoyKGWCmn93EGTZzC13krslA@vger.kernel.org
X-Gm-Message-State: AOJu0YxwpatShfDhqXaQUb9voVptztjNh/uaX6t5Y/BTX+gibezqhmtk
	ZicfKWtUvE47uQgY94BynWzyvu4awtDDQqx8io6aly5RhYSwNg1O0Ij6YyqtiPyCJpw6UMOST3/
	WhSPU3toXRKf3PaBc8uRX2VE2/NPzikC/QM8seVGet/sgEuPdf8xVXtRb7mLKCl++Qc5V21w4TV
	iD
X-Gm-Gg: AfdE7ckJvtW7FvpN5Cr6onNrszsWX1vvJUXQPI5323q/zrYEPRbwmsSvsWC+KITRlzu
	FMuCDordY0h37HbJTSQ1gAtL7BkIh1V42dRBd57Yh7turpemMdD5TI5In2g5yitE2ZZjIzzzruF
	p8vxppxaMGjT3cAuPJITg8uW7YK2/D91dHmAQiI2veEl2Y6FBYN2zdnZpGfAZ/q+HC6vbft9rJe
	6zQkBJ8RZ9H5HiE/mJ6UxZqMSEFBpbn53vt3H5Qgo1QxvqSY4ipuDZ8Clu1uuOzImuy6leUams4
	sE+tn+QN6TEOkNghwmq+eJm3YIMHXzvls33aZ4zLwh9m8ecO+qMM251c384nlQe8E4gi/ooIwky
	eCL1MAi2sPt+6eyrwTZayLJbDjMgJsthWuMQ=
X-Received: by 2002:a05:620a:471f:b0:91c:9d38:30ac with SMTP id af79cd13be357-9208ccfd7c0mr323279085a.4.1781872526072;
        Fri, 19 Jun 2026 05:35:26 -0700 (PDT)
X-Received: by 2002:a05:620a:471f:b0:91c:9d38:30ac with SMTP id af79cd13be357-9208ccfd7c0mr323274285a.4.1781872525508;
        Fri, 19 Jun 2026 05:35:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69711f30d8bsm840334a12.14.2026.06.19.05.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 05:35:24 -0700 (PDT)
Message-ID: <423b4e86-3837-4d69-8f56-d8259be53ff5@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 14:35:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260607160435.36546-1-mitltlatltl@gmail.com>
 <280402c0-57bd-46a3-b95c-f9ae02122a09@oss.qualcomm.com>
 <CAH2e8h7aGiF1g_LgG4WxEj1eGbUp-T_U-yZVpoHgU8FsMOrWTg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h7aGiF1g_LgG4WxEj1eGbUp-T_U-yZVpoHgU8FsMOrWTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDExOCBTYWx0ZWRfXwdf/ymDt9b57
 ZcF9qL8vDpZakMStG34nsC7ewPeYlMjv0Qzri03DEV4+VlDTl0thL3bWwm/iv6bj6Z/HfMgDiHx
 Su38ywP8Ho5cuoFTJ+ZLcsOlMdBg2ZI=
X-Proofpoint-ORIG-GUID: s4vQfTl8afbXWxr4CFa4lt-Mnz5fZD3v
X-Authority-Analysis: v=2.4 cv=dL2WXuZb c=1 sm=1 tr=0 ts=6a35378f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=whVkP5h3prY9SN6-RgsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: s4vQfTl8afbXWxr4CFa4lt-Mnz5fZD3v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDExOCBTYWx0ZWRfX2z5mb8PI/Jaq
 RldvgBLOIHaHdn6AbNdxWsxYqI9TSaG+tJxslNTylj//EyeUzfCzARhfdEK7Al4Q5UQDSLHu2SV
 XqD8AmIjl+Cziab2uMszqU/e6ZTIudRblz13SJODI4AdWj7hfzQ976vJWzDj5dXJ3NP/rxDYFcI
 M2/XVTHP+fhvhK6262S5OiHtvOn3gMbZHp+LhNOiIP/5cvzHmbuFEf//H37fBkEjr0x9OZ8smLs
 kATq9lWNoWeoCmHxAG5olHKpWgrPVxOZMEfLuyeDQPZhTi1+ipez9l24MwM/2BYOXW6onH7Bf23
 KdtORxanOVVRoB53bg7NLWz0ql6FKrFImesWc6x5tA+UIT5CQ1TPobOBft1lBlHY8foDlC/MCe2
 yb/4IFYgI1/vza38q9IE0RTalYqT700nZhYdsEeg6fsjpTQb8vwh5QKepJVZiBM9cbGjXkzmA5m
 ITBK47rDVH5FryIFZDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113837-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5EB46A5CDF

On 6/11/26 7:29 AM, Pengyu Luo wrote:
> On Tue, Jun 9, 2026 at 8:17 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 6/7/26 6:04 PM, Pengyu Luo wrote:
>>> Define pinctrl definitions to enable camera master clocks on sc8280xp.
>>>
>>> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 56 ++++++++++++++++++++++++++
>>>  1 file changed, 56 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>> index a2bd6b10e475..0dbcd3069a3b 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>> @@ -5484,6 +5484,62 @@ tlmm: pinctrl@f100000 {
>>>                       gpio-ranges = <&tlmm 0 0 230>;
>>>                       wakeup-parent = <&pdc>;
>>>
>>> +                     cam_mclk0_default: cam-mclk0-default-state {
>>> +                             pins = "gpio119";
>>> +                             function = "cam_mclk";
>>> +                             drive-strength = <6>;
>>
>> Other platforms set this to 2 by default.
>>
>> What's the value set on Windows when the camera is in use?
>>
> 
> It is 6mA.
> 
> Let us get ctl_reg first on Windows
> 
> lkd> !dd f111000 L8
> # f111000 00000284 00000002 000000e2 00000000
> # f111010 00000001 00000801 00000000 00000000
> 
> ctl_reg => 0x284
> 
> in msm_gpio_dbg_show_one()
> ...
> drive = (ctl_reg >> g->drv_bit) & 7; // (0x284 >> 6) & 7 == 2
> ...
> seq_printf(s, " %dmA", msm_regval_to_drive(drive)); // (drive + 1) * 2 == 6;
> ...
> 
> x13s should be the same as gaokun3 in this part.

I confirmed as much and I'm willing to believe this is a default for
all 8280 devices

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

for the second patch, please mention in the commit message that the value
will now match windows and please add a fixes tag

Konrad

