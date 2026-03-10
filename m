Return-Path: <linux-arm-msm+bounces-96636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJmeF2IjsGmVgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:57:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9FB251178
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FED532802C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA163CF032;
	Tue, 10 Mar 2026 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nL26nhQu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kseAQ/yu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048B93CF021
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145856; cv=none; b=e7Ig+PF/WBbrIPXx+lbvyca22rjn7h4YQ4VgFs03mC5W/xN04DqDvh3ENs26PQ5ziTm/vfMeX5mdSM2Cx9RrMk7svUqn1hnryVHN0kFtdt4RLMSZq/nW3G7QZF/tTbJ2TZZTdmGhQPgp8aps6LG5SiW0QjMEa/rP0E/JlfukOpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145856; c=relaxed/simple;
	bh=jSATiF9xfB3+Wq8PWkAs8NlQggZLlFInbMgv2F8b0Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGm+yGIglLj3CTAOJhcNbkE6a+9JVeZpaEP97DswuttapsRIh3Aj5hzmZEaX4mJvsSFG1pOnMPGG28GTfTHizPYYDP46fR/1omxst4SamqrOdA1HzjrY65korsrRKsOCVBbBL6ZRTc8+VB4QZA17HbJaKtjgLy1voQGRmIvX7a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nL26nhQu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kseAQ/yu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A9D4R8247058
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2VzkmLjRqtvKlkeC637966q5Nji7GS6ua5xJoVJknTY=; b=nL26nhQu1x836ekL
	0C4GUm6rVxtYqq9Sgcqsqi6S8MM+rueV28ANaIgyfFRkiPtv9cbTooT86dJeD2Zd
	wm+0bn4Kim0PEqJJa+bGJmnnK359aHbWACmVJpNrjfrJ6HQeu7zbcerKjI1YY26f
	fbBabm5ZIpRlgynFXdqM9gQ5q/TLF6zm509ZxT5mAWyl9QskkvdT2sX4FeT6aXJb
	b4m3nn3tzKfyDwnYzu7wQNyaDXZUolxSy7OH8plkxkn+Wi/ZWGpazm0bgepn7Aun
	XxeYSv2bvgCw4t6Othp4FSnEvbTHUPyBmEa30sr/KyfqRhUAfQkOJ+lEOGqcCLZq
	lrbbeQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8802f9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:30:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd90210336so68334585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773145853; x=1773750653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2VzkmLjRqtvKlkeC637966q5Nji7GS6ua5xJoVJknTY=;
        b=kseAQ/yuHLBtj500+LKcyt2Vy6Glr4YMNyBjoh608pt+Lo8xDB07X1TUbZlzNcA8m2
         sfCNu9fFUXYcuKhJN698sKITqoUtt8AYuujglgMXGeWYn9hKFLyGQ3F9yAvcVSMrny49
         bN9YRHqjin5c9FlyDlm8sNMeX7CQ3rl9q8RSI2gaSEq1GzGzOviBwXICXdYCcQbAsDxa
         9BbU25IA6NGQwDYiSS9yHtxmkiK7CABC1Ps4RXd1IodOLb0zPitIPckMVr+qH6Ft/7zv
         3NcnwBj7XdAn98KxnDY5jWnADX6SiP29xWrUJTYXJ/1VyukX1qcGrn2AudVNvHrK+H4z
         yAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145853; x=1773750653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VzkmLjRqtvKlkeC637966q5Nji7GS6ua5xJoVJknTY=;
        b=aWITYxRbv4QEraopVTk3fdlsUdKn5/aUbfq3IS9LjEQwc1DuWXx3deCI+Y3BE5/sr+
         6Y6LbjEBeX2FwlYKV4ERRjYcsnPTCh/vo0Xl1WXE8EK/e82xKot7jsRUB+9nUmMje+hH
         cpHCVv47nUyCvXVW0d57fxDypZcbsH9KXR/kkIRTAaS4ZrQ7wmn5UsSQUgBQZlauV7KY
         wywiki8gQU6Icv1XQATASD2Ua6mkQLgN930hyLaK894G1qATPLNRPIoe5zUNjC318pz0
         +slEWxbLF5p2hLUYnCqkTv/hyKJJ9SSa2D/cgjaA/zrmIfyo7YcWjEKgEo1b7oszEe+3
         YL/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmmYqi0Z/fZZpJ6gz6CGqOEYOZ6j+8WU6Ik7MvMNSLmlAuAfuxOlOj+k5VxOEZ3UzRuUmf6wt6gPkavo4G@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8cNXOcTZBJ2f4iBBxPB6UxvLxwIrz3MBDav4A50jqkbwv8/tE
	OIAWpKDzbziRany8wLku4WBXzyK0S96NtX9+Vgn8qqKIpLsrBVB1Iz96U4RCfcBA6QS5R5igNKR
	uypAkbZtCdgPN2G6Neb995WOERkBXvaYz2tiGwZGbm/JLSnITK7J5ydwRgqWQOtBRmi7Q
X-Gm-Gg: ATEYQzyl2NycqtARl/g3eA7sD2ids8W7s9ly0kSDyM/P0WM666rUVifWfeg/PqvBb3A
	p4mCme+UpXCAUfGGNbvVe92yJB/kV6IqQdxLfusEBvTAtB9bGvnfoNEeHHZ95zciEkMJ4VVy2Ck
	8hEMzSejlsWcoI8A9CUPrMr0HqMk31M7xIYRpvOCBtmzwM0etXoFwOjfioHs7guRNv8sNm1hLgP
	H2tOt50OZOCF4HO2thHq9DnxKh/05r04tWBQGeKQllntKbrq+HOLdLddSRKJElo6McxFwlbRwK/
	9ODLm9Qk0a5uErly3Lz797lzhLWZw/pB16takaeSCiqcnZLdxxIPzvyjljXeHvb5sq3DN0ms87t
	7HpOL0NbkxXEcoVFJD4H4H5Y2qHe0ovZrv6kUjzNLl4ZMvCJrsfdkp8++yhVv/YXtsNw/R+D4PA
	IYtcU=
X-Received: by 2002:a05:620a:209d:b0:8cd:8bfb:a4a with SMTP id af79cd13be357-8cd8bfb0eb3mr428494385a.0.1773145853050;
        Tue, 10 Mar 2026 05:30:53 -0700 (PDT)
X-Received: by 2002:a05:620a:209d:b0:8cd:8bfb:a4a with SMTP id af79cd13be357-8cd8bfb0eb3mr428491885a.0.1773145852600;
        Tue, 10 Mar 2026 05:30:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f189de1sm479139866b.63.2026.03.10.05.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:30:51 -0700 (PDT)
Message-ID: <bd0dc1de-c157-4f18-8010-ecade0a4b40f@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:30:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
To: Stephan Gerhold <stephan.gerhold@linaro.org>, Paul Adam <adamp@posteo.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260307-wiko-chuppito-v4-0-325ac66ae338@posteo.de>
 <20260307-wiko-chuppito-v4-3-325ac66ae338@posteo.de>
 <aa6P4rE7d2ftaeAw@linaro.org> <aa8__ofJBdMfavbq@MyryksLaptop>
 <aa9Epb7MQ0qVFWGO@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aa9Epb7MQ0qVFWGO@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwOCBTYWx0ZWRfX2A4G4L0Hwids
 r0mJyB28cQcWIBXVggF5fY4VqjJ5PYF39wpDnDt6IH3YjhBB50o282p7bQZklqIs4MwQCQpOdVu
 yVcclFdmKwC7TnMg195TOGw5ZzxUSLjf5S4bghCdfksqlBoayeqBY6/Y9g8lc50YiGBIgs/rRlQ
 33sWejd7Z+tTTq47wqfHhmKMKSTGwj4A1XYqvUyqIjjGYtrrN4vOwr422vpSAe3Gu8vlYev5OJd
 NX/jQMyXl7jru6mFPF/tl39X7BrnPS8fx1bfjJ3PT5ch7BKjnh0MONoWsbYgtI7/b4kybERyFxm
 e+K6tKEb6MoT5f2bNmUMIbEuPOrpPwW/zfc89hjx+bV7RKY40V8uu23q6vGRhYFjkWKVuC19DVb
 lWjYfXjzpSutflMJPcIKBgOa9E/zNKYAzqeKhuJdbi8YNihoPf190A21P19ALuleqMVYaHYO/e7
 NhJbjAAO39zInTEWr4g==
X-Proofpoint-GUID: 8KI1f47TZTuZ_knHzxIH9YntRDaVmznL
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69b00efe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=b88osBH9l-aT6nkOueUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 8KI1f47TZTuZ_knHzxIH9YntRDaVmznL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100108
X-Rspamd-Queue-Id: AE9FB251178
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96636-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 11:07 PM, Stephan Gerhold wrote:
> On Mon, Mar 09, 2026 at 09:48:12PM +0000, Paul Adam wrote:
>> On 26/03/09 10:16, Stephan Gerhold wrote:
>>>> diff --git a/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
>>>> new file mode 100644
>>>> index 000000000000..d927bae2b208
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
>>>> @@ -0,0 +1,315 @@
>>>> [...]
>>>> +&sound {
>>>> +	audio-routing = "AMIC1", "MIC BIAS Internal1",
>>>> +		"AMIC2", "MIC BIAS Internal2",
>>>> +		"AMIC3", "MIC BIAS Internal1";
>>>
>>> Sorry, just noticed this now:
>>>
>>> This seems a bit suspicious (I would expect "MIC BIAS Internal3"), have
>>> you tested if the secondary microphone works?
>>>
>>> Thanks,
>>> Stephan
>>
>> The secondary microphone does not work yet, neither with Internal1
>> nor Internal3.
>>
>> In the downstream devicetree its Internal1 for AMIC3.
>>
>> Is there a way for me to check which one is correct?
>>
> 
> To be absolutely sure, only with the schematic diagram of the board...
> 
> Another option would be that the secondary microphone simply does not
> exist at all (i.e. there is only one microphone). Any idea if it works
> on Android?
> 
> If in doubt, it would be better to remove the line for AMIC3.

whichever way it goes:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


