Return-Path: <linux-arm-msm+bounces-94502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K8HAY/doWlcwgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:08:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1645F1BBCA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93BB2303265F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 18:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8736736AB6F;
	Fri, 27 Feb 2026 18:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pijuw8w1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZYvu6nRU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08222368275
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772215677; cv=none; b=WvPp9cXdsYXR7lD7ZDUnqI9CRUQGeC+Bi1c8ZH5txp+XJDgMHE6Q0I1apdkP8vt9nZgTZMvKA8s85JDZV0kCEFw8LrXOczH07UhHMeKOqiU6isaNpnJVJH0oHNjs5QBgjkGUjSJ/yyWITXY08LMbvxBklFmIDw42Uos8lCvbiiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772215677; c=relaxed/simple;
	bh=RKAxMw6+tYzq1HQOmAwm5iRGu7fVG2JfPuI6rfBTTi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mRrMan/sOi+kbURk2ztcv6PSWspf+kkvCTUKiGOfLkF/kGPNLz+pjNe9DH9Y55lRjA191kOrYmYchkB3tIiLSjzf0RhDGK2LO5Oq9iygTp0M+ydGnoeIJcvnqJmfk6UvyuVPF598hm6GqNCzxfTl2yaot+QJ09UmDbdZpnJiWOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pijuw8w1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZYvu6nRU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0Mxj065415
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	823dFt7zxIlJX1RAw6gWs/3BdC5rgbHfxffaZTtrSPA=; b=Pijuw8w1Vc98imyY
	/KVVjkXvM8rbMbYQcidn6Tiv7F6p2amOiEnWwtzo4jkNJbKv7yvhOJBBGEaGSxbu
	7iYi4pelTqePnJotrbqGL7c+QcHz61/58L6E6tnnq8Edf32Nh5fb/Gf7kO7PqgmN
	B2JPQMkEKbyJiSFc0BcuFjWZGWQGKzh6h02sbhvTDtOe1zDo8rLajpJDcKlc1VUh
	DDSiOPLMuXy6jP8WqrPvMSIULjo8HlNcoa1HiQPeDA7dBVGJ4zhoIo03zJIz2IKy
	wivusYmXwGziijs7nuevCHxeoLNAZBNn2hfdgBKq8EGLycAx1K1PCYEp4Tc/iA0T
	YG17nw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cka2xh9qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:07:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50dfd542so207567185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772215674; x=1772820474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=823dFt7zxIlJX1RAw6gWs/3BdC5rgbHfxffaZTtrSPA=;
        b=ZYvu6nRUVvYYo8KTYdYXveYRbb0A+tMCbfAh/ehem4Aw/KsUyLIvEKOV1d80rHUVge
         YS8PWCcbm2Iw9RWSCHM/F9IcmrKbORIxJ01T3CAjNghyh756LYEvApJA29CkJwA7YJip
         aZuv5R1l+RRucodk14EUYrMEY/ygcJcrTplD2nvQtpFbRtkWh8W0GGcoxGkkuEqJdur1
         1KJEmhd6oYyXhdQw4mTl2or0epNzsN0/FKKJaocTT27DHj3yCKtKjTPqYIxJZubCC4z5
         l7ioGd4UVSLJYmfdviikdsYiWNj29Lzhz4Ifr5wGwCcibI0hYZY54c2UcI+439/NSXt4
         jgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772215674; x=1772820474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=823dFt7zxIlJX1RAw6gWs/3BdC5rgbHfxffaZTtrSPA=;
        b=HULLL8Kz3h8ft7wvoc7i7vD9wbF4rY4j5F9vcUgJstMHA6M+XQBqT8K9jl306Q7v3k
         cGm2CT+AzEoBaR2tto+00nvoHeDIdi0vd3kED0rmCB+fRVIMkkgY1G630zNKgPUGyDJb
         imoBrt+s2+c7fIT6ydW11clxfH83Dtavy8fDOBMUXoFy6ymj9bQvnNUl7iANNVGez7cI
         L+4WvwGHVUSqdJCSUr/JxNtwPN33mHsPBW9dxt4F0UTsvqWtQSKO07LUAF5KUILPed3M
         6RuuuBpc59Gj+HkfPZ7R+DgLHldJlDAa5jVKMLIveXPTBreYo6ApFfUq3icHqHVKYwp1
         jwZw==
X-Forwarded-Encrypted: i=1; AJvYcCXjpvfSwzhYayRD9krgU+XSWIRktOvI3y0INLd1G1r65IMDvgDOiG+qOiRA4mqiHFzzmTts4lB8oif2Nyhp@vger.kernel.org
X-Gm-Message-State: AOJu0YwhBsChwlB/5F0A2w9qQMjkKZgppWt6C/WGxWio5CLXg8xvMrDs
	x6mebZl9V/kfaLQJvv3Pe5b0x5SpRWDRHIsEPjASWo86F2ICmjqp5cI5GXeqNTaPq5v9MY573fN
	+T/PhqiVS0XEhPgFOIJtax4lUclL7ClL2uD68ljwJe+PJSKfhpj6Hfa98q9MO9Hm7ExRI
X-Gm-Gg: ATEYQzygHwvoKQEevadmM7WIcN9LbvePHVO20ayf/kM4lvyl56h2Yk4fwQjLhFTYJ5t
	K6FsOAW68oOr2+7RM62A6kLgd8PupwZNpZ77zPQRzJb+/MiDeEa3HyWXF8pJZPtxA9T2m74z6rt
	Ok+6AFCV0Hw6yW0xlKNbLqu4BMLT5JhnMtP6omheMXzNG09DCN3yFdl6sV5HcGc8/T9pDy3cRLE
	4XUHJPVzRDJ6MvAWAvaJl7MScIzDbsPikHF0WVzh3gdtg9iSzhI7V5NSP7ADxTlPEoWmLb/m2+8
	+0ioJEr8oppKPXEUVXMj0UcTjafTSql0tzbhz1eThyD8b94uuDALH6z4QMbmLNh05Xe0GtTNc0Z
	2ZgR+RXcUptFp8Jt7cBl3+73DYUD2F+xlvm2OBINDAEoP9PQHZc1rkx839RpZiBzPRV2Zg+Ckbc
	u/94A=
X-Received: by 2002:a05:620a:4004:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cbc8e79d8bmr361202485a.9.1772215674126;
        Fri, 27 Feb 2026 10:07:54 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cbc8e79d8bmr361196785a.9.1772215673496;
        Fri, 27 Feb 2026 10:07:53 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd4664asm1487000a12.11.2026.02.27.10.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 10:07:52 -0800 (PST)
Message-ID: <389ca5d3-a698-4dac-911c-39ba057e3d17@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 19:07:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: qmp-combo: Move pipe_clk on/off to common
To: Val Packett <val@packett.cool>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250927093915.45124-2-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250927093915.45124-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BOC+bVQG c=1 sm=1 tr=0 ts=69a1dd7a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NMrB2pzdCxszCODCV5UA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: uDUFrrbotZcO4aTAG4OeDdI0gWHW2Piy
X-Proofpoint-ORIG-GUID: uDUFrrbotZcO4aTAG4OeDdI0gWHW2Piy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2MCBTYWx0ZWRfXynWOx38grsv1
 fU3qM6RUQEEIYI/exKvc+cnStZkjkTaB4GLyKkmFvtmr4S6nHi8rOeurRNy/+zJ+8vUQcnlcXqH
 towviNG+p76AteQCBVAERaHzWPO+NU3uLtsHynzmpGbf9jvdlhrX2Kb9mA5oeUFXtEdfyKDIDpA
 xO7C3rSTZpzgsAWUU2Tr6N+F07pCGSCwIeJWQo+DRp5Qt7woQYubKt+Q2S+WxrnjkVEr7/exebY
 wAButKQzAdZ7gZK8bRIlx4iuKkr/C8SbuyMxHDIlCMIdU7EbbjOzF46s6fltPkZNNJwrGijoano
 lA5tHN0OL2U8j4EIDeNkY5ImPHGm74eBzUjIWxIKTl3rX9mHlZtXbTF2z7FJ+iQ97C2w5o8PJXG
 isd4vEE4LcberoKT3MD3VcGfUocWgqjcD2I4WHs5QMy6EptsyC3d2MyC73i4fCldRHMQ+UPo0kY
 rA5YYJm2psJ6zXF4vuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270160
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,packett.cool:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94502-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 1645F1BBCA1
X-Rspamd-Action: no action

On 9/27/25 11:17 AM, Val Packett wrote:
> Keep the USB pipe clock working when the phy is in DP-only mode, because
> the dwc controller still needs it for USB 2.0 over the same Type-C port.
> 
> Tested with the BenQ RD280UA monitor which has a downstream-facing port
> for data passthrough that's manually switchable between USB 2 and 3,
> corresponding to 4-lane and 2-lane DP respectively.
> 
> Note: the suspend/resume callbacks were already gating the enable/disable
> of this clock only on init_count and not usb_init_count!
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> o/
> 
> Just got my hands on a perfect test device for DP alt mode: a monitor with an
> on-demand toggle between 2 and 4 lanes. (Started digging because I thought
> I needed 4 lanes to use its full resolution and refresh rate, even though
> it turned out to be the dpu adjusted mode clock check rejecting the modes,
> patches for which are already posted.)
> 
> In [1] Konrad mentioned that "the hardware disagrees" with keeping the USB
> PLL always on. I'm not sure what exactly was meant by disagreement there,
> and I didn't find any specific code that touches that PLL in the driver,
> so I decided to just try it anyway.
> 
> Before the changes, 4-lane mode would actually kill the USB 2.0 functionality
> on the port, no recovery until reboot.
> 
> With this patch, I can switch the monitor between 4-lane and 2-lane modes
> (with an unplug-replug cycle..) and the USB 2.0 devices attached through
> the monitor keep working! (I verified the number of lanes used via dp_debug).
> 
> I'm sure it might not be that simple but from my limited and uninformed
> understanding without any internal knowledge, the "sneaky workaround"
> might actually be the intended way to do things?

+Bjorn, Wesley I wrote a wall of text for you, hopefully it makes sense

I now think I have some more knowledge about the setup.

The PIPE clock is an *output* of the PHY that feeds back into GCC, which
provides a XO-PHY mux, which then has a gate/branch downstream of it.
(that's 100% sure)

That branch (e.g. GCC_USB3_PRIM_PHY_PIPE_CLK) then feeds into the
destination core (PCIe, DWC3..) (that's *almost* 100% sure.. it's
surprisingly difficult to fully confirm)

Both msm-5.10 (and older) and upstream decided to keep that clock within
the PHY device though, and that makes.. some.. sense, because you're
not really supposed to turn it off (at least on recent chips), so much so
as switch its source from PHY to XO. That of course needs to happen when
the PHY is going to be disabled, as otherwise the PIPE clock is absent..

I can't really find information about when that branch is supposed to
be *disabled*, but one can probably assume with reasonable confidence
that if the PHY is offline (which generally only happens if the controller
is offline), that may be disabled as well.


The only remaining question remains then, where does the PIPE clock
come from? It's most likely not derived from the DP PLL.

The PHY has some slow onboard always-on clocks (for USB4 wakeup and
USB3 autonomous mode), but those are waay too slow to be driving PIPE
(which runs at 125 MHz @ SS, 312.5 MHz @ SS+).. so only the USB PLL
remains.

But then, in DP-only mode, SW_USB3PHY_RESET is asserted. The
documentation uses some imprecise wording with regards to what that
entails, but there's not many options left other than it may be
leaving the PLL in tact, while halting other parts of the USB3 logic.
Conversely, usb3phy_(nocsr_)reset is explicitly promised to reset the
USB_PLL.


I think the PLL also happens to be disabled when entering either of
the aforementioned sleep modes, since the table tells me the required
RPMH level is 'retention', which surely isn't enough to feed a big PLL.


The solution of teaching DWC3 how to switch clock sources is a little
involved, since we (to my understanding) have to/should omit programming
the parts that are conditional upon superspeed capabilities, and doing
that at runtime would probably realistically require making it type-C
aware (I don't think we want to go that route plus micro-b/MHL edge cases
*sigh*), or we could count on the suspend/resume work making it magically
click into place (since the dwc3 core does quite some re-programming upon
any sort of sus/res today anyway, it seems). If the latter happens, we may
end up reverting this patch as it may then turn out no longer necessary.

Today, i think this commit resolves this immediate issue and I think it's
the fix we should take (bumping my request of reordering the clock disables
and resubmitting..).

On an interesting note, if we take for granted my hypothesis about the
soft-reset not impacting the USB_PLL, this seems like an oversight in
programming guides, because USB4 transition sequences explicitly mention
the names which refer to resets coming from GCC, while DP/USB mix-and-
matching explicitly suggests using the soft-resets, but that might have
gone unnoticed, since dp-only hasn't been much of a prime use case for
in the past, as most of these chips were targetting mobile.

Konrad

