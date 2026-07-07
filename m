Return-Path: <linux-arm-msm+bounces-117408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1SRVHvpkTWpSzQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 22:43:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D495371F9FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 22:43:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="GGmh/Uhm";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gCzYcJHi;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117408-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117408-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85D6A30166D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 20:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD19E3F23A4;
	Tue,  7 Jul 2026 20:41:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC3949620
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 20:41:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783456909; cv=none; b=ejoQuqhabXmWmWbznXx5XwEAuvBkiy26BREz05n5QeivAlb5XNujdn1c0/75eUM/v57rLpDhRQmJa3WPxDigoT+9yJctO+y808ngcQIpMo39XITikX2FxC5+p7dwl04dAT+/r4XYBy3X5H131ylt9hWcvgLhYK6lWr6erhezOW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783456909; c=relaxed/simple;
	bh=oat1GvbIX3mIF4dAriHPdkOESs774O5N7WYidfkBbd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZoM5TO1SLIkBBCpcrq5JI5yuuwOZ7JpJ2qiix8TQIbo9CdYbVKuS7U2SXdSCnczGSMvwgWnsUT2Fx5rMmU7WtgFI3DLphmtPZnhG/Jou3C/hZBzR8tutIqlG4MPy1VIMQbMVYuPG06luSFhK6LQX9nAXmvPMoLtE5sNsl0Xsoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGmh/Uhm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gCzYcJHi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5VZJ509571
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 20:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gCvkekoa4er4Tteeuol06EdVNkgFR18slO6Bu6KspqA=; b=GGmh/Uhm4xBaURoq
	hLEToFJLBw4he5yg2ex+RY23ERdEdBaOnI1ygr4Ic5BdZgS52J9MZ1wLLFt+awO8
	pXS2HxQeVrlVG8FG54ved26jVsyyu3IAJ6D0tKVuDOTCtiuIMkO7YsJkkJICxtwq
	uqaR0w5aJuc++hRa+B9ZofQZJviKIPiW38CGO8WxWgjhpjTbq4kCf54fKgz6St/i
	ZqD3iSG33tk+mc3ghjahHwFu87H1ho3o6vwm74G1ME8IY3yUYlvSpzGliocKaQwX
	wLk/7M/0TCwT8t4W9Mj31Mc2BeH0vC2KvFaknsk1fwtxEuBbz8+B+RAm0DDgJRM9
	X3nrVQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep37x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 20:41:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c20762d21so56971601cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 13:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783456907; x=1784061707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCvkekoa4er4Tteeuol06EdVNkgFR18slO6Bu6KspqA=;
        b=gCzYcJHiNb2c8Zs1+UbnxcBh2hGa8vdB7/MZ/B9ufjNLEmgRyCBGrLRmSsyK71pLwi
         MVG40p0/oZDUhzkBQ5El/uJMwfB/NNlW5AiZmn5xaLnCvVO0Spxrt4DlGUC0ERJO1MQ6
         r1wWp3Fwv34ZnYTSuRvP99ozadrzcQdT3OHyGfsGLqkA1GkU29WMF3cEqscZ0gKlbWqN
         +e3T3p+9T2fTdsCS9O1y4Pbsj3voFmxsIqwRcwPCjgf1Y5ln5i80I3FjosyODNdMSdMp
         NkLCBEO9xX4Z3Wy3IfnqAArsFZvKwaf+RK+MBPnBjIbB6/O03K2cjw4Fqp4GvSuRvG8K
         CK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783456907; x=1784061707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCvkekoa4er4Tteeuol06EdVNkgFR18slO6Bu6KspqA=;
        b=fDnfhJ5EcYVJmyBTH2PBDEyTjBF4LLvxDw6HcpqaLiJuyxHCwzzcS4TZLPIJG54N4E
         O/PiuM4iTPpfEFjz1qpChht09tqseUv+bA0KK5obJNN3tsXcPYMCPVpu8GArrdEwQ1vh
         kXCtJnnLyNhGfpFmnC81E9kEE5z6KJ59CkeB9c77GyAiu62k+2roQxwQx59cR/x2tsSX
         7Rl6DBCjVWWID/Pd9DNpe/bh9X8AzYCM8UT2xblKy6C7Zq4WoxKxq5b+kOiTpxR7ffbt
         OizJzTmgbFvTNxqmNcTY/H/jJYqBhQMpreHMYXmiqwtRvkvsjNBerw7HBFo6zwj928Tw
         h16Q==
X-Forwarded-Encrypted: i=1; AHgh+RpMm8ecqdxkmlk12utqzb1R1VMpxp72GmDsA+fJzmdTLQ++SM1wCrwkw+7czspAmnQI3Y0nePRvO/3/UiSv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9uZTez/+e7bxE5iHYVZ05qyUAUN0MBMRpr4Za01tHQZt0fMyI
	0xkRCQX+LN4LnhnL7tNSr2o890jSJOxJtuWxY8ldQQIZVP8d3OW926GshepNcaieP4Q+2EAE8ZJ
	w+dHdys/QZEXJrdLnYXJahjpcGMnQiPQ+sK8vcMuMita8ZyXHhfVMO8yxu7KckYXNog+h
X-Gm-Gg: AfdE7cmvsDSYpSyeEjENFMsqp7CW7vJWbh1VBkcxBUNPzu4e4Dx7RZm2uVDU6DQm9rA
	I3xBeAvdvTJ3qGnkDZgu6eJDCF/7coZz12t3AjsmHoMt4TXUTgljSY6xJPEQj+rlrlKnfOLaeyj
	GbhJGXwjvpnd49emezhcDNOSd2vOwgj3ZKh25SCjPuWvvQqpztkjk4U+EqvVEAjAGlTk7kTTeH/
	HLKTxcV7j1xFuXuEKeBuvbb9J1EryOC+wnhQwK5eIlz14s7LSzq/7fJsJ7yT2tqWMMYJOFzd47D
	9+e9nU/5GHuUbXleMiiplXNo2vJfaAP11HDhkav58bE+TiAFo8dF9hSTkXfGjufO5G+4V5xv61E
	E7I/BxHgiznCIXmjNauwMFMulnpY1IpmzJPnVuQ==
X-Received: by 2002:ac8:690e:0:b0:517:6d82:9aec with SMTP id d75a77b69052e-51c74676b89mr74824951cf.0.1783456906737;
        Tue, 07 Jul 2026 13:41:46 -0700 (PDT)
X-Received: by 2002:ac8:690e:0:b0:517:6d82:9aec with SMTP id d75a77b69052e-51c74676b89mr74824661cf.0.1783456906256;
        Tue, 07 Jul 2026 13:41:46 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm36001629f8f.20.2026.07.07.13.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 13:41:45 -0700 (PDT)
Message-ID: <64af4615-4581-43dd-a1b1-8324c63d5853@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 21:41:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add overlay
 for Waveshare WM8960 Audio HAT
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@oss.qualcomm.com
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260707163703.233405-4-srinivas.kandagatla@oss.qualcomm.com>
 <zfmtqi3k3miv3ncgla5x3gjktj5j25zkyqqxmyq5i44ynzfnhb@7mruev4sw5vm>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <zfmtqi3k3miv3ncgla5x3gjktj5j25zkyqqxmyq5i44ynzfnhb@7mruev4sw5vm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pDXWITl-EERbMShYT7NSinfcBon711jY
X-Proofpoint-ORIG-GUID: pDXWITl-EERbMShYT7NSinfcBon711jY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIwMSBTYWx0ZWRfX1tZHzsMPjI0A
 BxZWZKpQsVXYn2Jgj1COMWKKjJacwHN0PRHanAMs125zG49GyHnAgWwO+P3guFSLY12m+l7Xvyu
 ukfGBkoVroSGSG9RUGkoigyyV2VwoaxrbY7DHpoFqdJmzK7D+WMxTF4NC86FJIZKZxiuwJpmxmo
 WJshiuqNCcA5bYS3efMLnKx5htOd9soqwXiKLbo78j601kjd2xuOXsHeef9+7PulJUXXtXVA03b
 XZzBReq6rCuNNfiWicPLpQCiqZ0BL3do54S3VNGQ6oSf6Ok7O/8Zm9nbisCbuxLCMXAQRUN/++h
 ByqK8nujBbT6d/SBak1geXuARWUjr1ooNcnM/dmK8Y3cWgENcLVZF9utfhqQeDh1am4BUzzCg/S
 yusESvuMOIpXHyVMbtgbXmuMzom8PQAPgXb8sP07uPh/C9vtmJELT5opeeOS1OVNWRn+I2RtwkJ
 zue8h3+/vtIOy1f4e9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIwMSBTYWx0ZWRfX8H3UUFE9zoGD
 lFiW4Mc0AQ8pJ4GqBIsLX3hrdPSzsycSgfF42s10hEdPH5kIXNtRJ497bcFCEU7ILa0dkU1ymA+
 q+D7Xi8QnUjEHRolQjroV0OcxV6fGD4=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4d648b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=dzfq2vkET6RgKwHabl4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070201
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
	TAGGED_FROM(0.00)[bounces-117408-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D495371F9FA

On 7/7/26 7:15 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 05:37:03PM +0100, Srinivas Kandagatla wrote:
>> Add a DT overlay for the Waveshare WM8960 Audio HAT connected to the
>> 40-pin JHAT connector. The overlay adds the WM8960 fixed MCLK clock,
>> the WM8960 codec on I2C0, and the corresponding I2S1 playback and
>> capture DAI links to the sound card.
> 
> The contents of the overlay is more or less visible from the patch.
> Please provide some useful documentation, e.g. how to test the codec.
> Does one need extra UCM file for it? 

Yes, currently this has been tested manually with mixer commands from
console, the plan make this work with ucm dynamically based on the
existence of the dai-link that comes as part of overlay.

Here is wip ucm changes required for this,

https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/ventuno-q-jhat

--srini
> 
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>>  ...uino-monza-waveshare-wm8960-audio-hat.dtso | 100 ++++++++++++++++++
>>  2 files changed, 104 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso
> 
> 


