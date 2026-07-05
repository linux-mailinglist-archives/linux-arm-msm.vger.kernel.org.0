Return-Path: <linux-arm-msm+bounces-116539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aMCwCsUvSmq+/AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 12:19:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 487C4709BCE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 12:19:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="d/p/r6Ck";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Pp53hrYK;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116539-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116539-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68516300BDA3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 10:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5DF35F184;
	Sun,  5 Jul 2026 10:19:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0916A2FFF8D
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 10:19:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783246783; cv=none; b=UZ7qM6lQkrQxIi1voYS06iFGBxbyad+9rLbA4AH6AmJfo5eh0Lp4RmtbZ6tDO5Pct0GizrZy9aEEK/0KB/M/V1scDQEnsxtpk1m37tXBEEtFL4KTJJU+zhDPR77BB33XlzLLV2WWhSuxeJdyvg2G6sDK+Dox8HpoLTA7VLi6MvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783246783; c=relaxed/simple;
	bh=xBY+X7nL5AZz+gzrhUliZqJVFe9VocGCCYH1oenG6VQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBKyJsBkaunYtbwzNBWUjOz4h/YLxCVs8uiqQYb7nFSvlGstsq/VvQe68DR63/J8yN3gQ/pqjLpnoQSOJ/h2iq/EBjpjrXjyYQvJIzmYbQU9gTUsGBbnGOsGmCW0+Xx/MBJ/ToXYYjXPzIh/5GTw1xchy8BgmlsjksTrNDUWOCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/p/r6Ck; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pp53hrYK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664LRV1O4092395
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 10:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xpbe7dAQLjNnNWc71nhAnTIRBBKphawt2IUV/ANXlWw=; b=d/p/r6Ckktk9AztM
	pGL3GsxkNLlTiaAAekulPH8g6Z9lVwCHBHkqkfzqMlZc0jPDh2RUkq4r97Uh6Hry
	bkT7G9R/Sx/AceKnkVKzXGQVqDYSzmpn4tVKuhl3JzrCrSP0Ar03ljwrYrQCPZeV
	xIDsucmeigO5sbEFiX7dm4z/3Yk3lmgc5//ZxJYcRhQe7vn47rl8sz7y5DtgyaQF
	pfID5+WfqrlG+FhaaTmIEZxmJxBO4GSJFd9/PMaDg45fOJqJ5CbnUugtO5jzUKJm
	T/f1et17VY7/NQZ1AYciPCvMYDJkd+DmuX/t5CyENXMCnzlabqweu9AqHCV7FqAx
	+WbiZA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4stm6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 10:19:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fc66ee6a4so3845006a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 03:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783246780; x=1783851580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xpbe7dAQLjNnNWc71nhAnTIRBBKphawt2IUV/ANXlWw=;
        b=Pp53hrYK0gv1vMVTS86dM6B3gzRWw5hiUbew1MImcTIN6D+ij7WCuuDwmXn9kdgxSv
         hWDP2YfumHNNjcr+38Clhx1qZDvT2bg6novyuAMIyLhx+dWN1FvpjExEpKlHmn2Nvk5j
         F4w/T7pcHOwPOnDbYnZBCQWRjDphVRT9T+yKMplUU4cB39Y4sfZEXsndiy0xRqUX8arD
         wFdksZrv82UnWYWuuPn+vH67AG+Gbs8agpgHYuZjHuOEM9itlKJm3vjL8kzAkjwEKLAC
         URG/jDoVR50Kb/wT1s6ci9FlEXyWbUGwHS9zRvBYRpRiCXZ26LbGbaUC+qpkNqWROlfg
         1v/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783246781; x=1783851581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xpbe7dAQLjNnNWc71nhAnTIRBBKphawt2IUV/ANXlWw=;
        b=FZoJCN7ypFVc1vvfmxmUVPmWm5IJetWeFIxF5aByFc/A73Ro9KDS/QflTvgS28HegH
         PLBfoZ6Spofi8Fp+KdDJvcI+W6k5iOzlejCPe6m68LW2I85bADviTztEwBGik0ow8Cq/
         VqHNT1NWi1PIBh8oZ7VsEmInerpeJyXWs5CgCuha6PdI2bsxiQMUZAQn8YoUrFeAsEGN
         mbmBDDTEmy6i46ulzbLeU2V8T1YSpc3rOfRmXVLGy0do+F8zcCEmgUl84Mj0hSR/GRLG
         Lw/Y3qjZW5X8ZakgO1PJqvgxLIIQyL472ASobqvELX9+3kNzqUJdvpE0VnJ5sIg7K6Uq
         xpcQ==
X-Forwarded-Encrypted: i=1; AHgh+RqD1Z0SEDQP/S2GdCznxN9hS8XiwyNfXwfXAa4omSUNZi/NUHjJ+qfB9k2KbenrXt0dCiU60+hbFZjKLzU4@vger.kernel.org
X-Gm-Message-State: AOJu0YwNCvecqMpRYGVwqSCcYcF1vn6sE9pyNC2WXahB5Mjh8zS4AGCA
	qtAT9IE3U33MMMQ5CZU28ZSonN4xhJrQgPObcBrHo5B/78xJd89cKJjQUn5KUO/doY2HZM+FNTS
	zfKcm3sH2GVXgoM29hhWFUJyU/cRLFig4dLC5c0YEdw3e805ATp6R5yFoOu1PGeNGPX6HOSO280
	Np
X-Gm-Gg: AfdE7cn+3LCsNgPiLdpMXBAMymqQa5CBb7mbx5ICWwG6UlLhE2HVVCdMrme+K7gZGkA
	EZvZPOi1byS7DnwALqIK6GCVeahCLK5AoAycTrKSAzWTfk63flrbBLlDuQklfT4mB2k4sPuN16W
	8SapZCQOyJFOOGw1mjEzzIsOCNATJ6OEOc02HCLqi0AInCX+Dw1+AGdVHIer7qFsANTsnD1NHFT
	K5qozcdkP3HggA+mlqJiwDMj4clga/9Vld0KJFGRh+ySeeCbp3axFWqhZWhujFFJAL+qNXkh0rA
	a2+KdupeYrnPOTF/xLr0UaH3Mhw+ufAXy1CuD+opWiQVXVbUXSR1qHN8QTp0nhwPfhK22P8umv8
	MCB4pOdAu1MPbLHdk0aOxrkOhyeSYEt+tjc7h0aBJAA==
X-Received: by 2002:a17:90b:3fcf:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-3829f100a13mr5642961a91.23.1783246780487;
        Sun, 05 Jul 2026 03:19:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcf:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-3829f100a13mr5642945a91.23.1783246779990;
        Sun, 05 Jul 2026 03:19:39 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm9099831eec.15.2026.07.05.03.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 03:19:39 -0700 (PDT)
Message-ID: <49566b40-324b-4234-bb07-09e84749e666@oss.qualcomm.com>
Date: Sun, 5 Jul 2026 15:49:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] arm64: dts: qcom: kodiak: Enable CDSP & Modem
 cooling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-6-3882189c1f83@oss.qualcomm.com>
 <pli4napz5xis7i24oum73wnaecvqz53nxy7ek6mftlxsq7qkyt@nc7jp6oi4fix>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <pli4napz5xis7i24oum73wnaecvqz53nxy7ek6mftlxsq7qkyt@nc7jp6oi4fix>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDEwNiBTYWx0ZWRfXzKnjT2gpyDsA
 GhS7y8NBoZnF++9RseW333NV4CZj3AiWd4ZDzS7TFXmoE9Y+4lPzrWnxhRmOddqr5hKhVXs6RAk
 o05d7pwyBiHk6GZ9dhEAUNOU1aXlANw=
X-Proofpoint-ORIG-GUID: S61CAK38aE1tIBRyvlx_7inBFPgX0WGk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDEwNiBTYWx0ZWRfX9Ck4LK2UyVFw
 g/qi+W/qeZ7n9WhjOlzLrjpz7lH/8GPiEMMSTjRDurDJExHSEl2On3HnQaVm3FR+Jd+OBlWermk
 rQqEdoYtzTx8u6FgVALOkVLmoKl1r23D6wiyitr2aTExyGMIL7VIvZeaIhMtvBNyDzE493tzzNP
 83+Lj2+Hzipl6kyhLGM2s6OrNT+KOxHnvIjhPsljHQDEIwndGGWiyeT9xy8P06lCvWJ7Gejb7kM
 mn9fFLJTW4mRb2Dz8Vwe0ss4LHNhB0oBMKG4hHIgrOrv6GYlNnMS9TJOMOX1innT3d/aLEP+OkO
 F1aWB/IzTPQ3qQ8wZl+KKbjFVuzHzfpLJ7c/VHQLAl9O4rQl32QP5edQpMwoabxIFlvaLTVB9se
 se3WiG4LdJPQ0LPOoV8AlCsNz4r/dIZkAM8XRv2LYipVgXXk0n2hFcm2h7v37P8PrzR7persO5y
 6BlxIXyhAoz9CE6vpBQ==
X-Proofpoint-GUID: S61CAK38aE1tIBRyvlx_7inBFPgX0WGk
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4a2fbd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dzk2ctQkzv_BcHpUmM0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116539-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 487C4709BCE



On 7/3/2026 9:18 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 03, 2026 at 10:33:09AM +0530, Gaurav Kohli wrote:
>> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
>> when it reaches high temperatures in kodiak.
>>
>> Set up CDSP cooling by throttling the cdsp when it reaches 100°C and
>> for modem when it reaches to 95°C.
>>
>> Since the remoteproc_mpss node doesn't exist on non modem boards, the
>> cooling-maps that reference it cause DT compilation errors. To fix that
>> remove inherited mdmss cooling-map nodes.
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi               | 134 ++++++++++++++++++++-
>>   .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  17 +++
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  17 +++
>>   .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |  17 +++
>>   .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  17 +++
>>   .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  17 +++
>>   .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |  16 +++
>>   7 files changed, 231 insertions(+), 4 deletions(-)
>>
>> @@ -7716,6 +7722,8 @@ map0 {
>>   		};
>>   
>>   		nspss0-thermal {
>> +			polling-delay-passive = <200>;
> 
> Why? This applies to all added polling delays.

Thanks for review, will update the reasoning(passive polling mode) in 
commit message.

> 
>> +
>>   			thermal-sensors = <&tsens1 3>;
>>   
>>   			trips {
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> index bb5a42b038f1..400d128132fc 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> @@ -24,6 +24,23 @@
>>   /delete-node/ &adsp_mem;
>>   /delete-node/ &cdsp_mem;
>>   /delete-node/ &ipa_fw_mem;
>> +
>> +&mdmss0_thermal {
>> +	/delete-node/ cooling-maps;
> 
> Don't kill what is unnecessary to be killed. Remove only MPSS maps.

Thanks for review, will change this to delete only the MPSS map entries.

> 
>> +};
>> +
>> +&mdmss1_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss2_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss3_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>>   /delete-node/ &mpss_mem;
>>   /delete-node/ &remoteproc_mpss;
>>   /delete-node/ &remoteproc_wpss;
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 37a3b51323ce..187bc2899191 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -25,6 +25,23 @@
>>   /delete-node/ &rmtfs_mem;
>>   /delete-node/ &adsp_mem;
>>   /delete-node/ &cdsp_mem;
>> +
>> +&mdmss0_thermal {
>> +	/delete-node/ cooling-maps;
> 
> But MPSS is there. Why are you removing it?

thanks for review, Let me recheck this and fix this.

> 
>> +};
>> +
>> +&mdmss1_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss2_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss3_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>>   /delete-node/ &video_mem;
>>   /delete-node/ &wlan_ce_mem;
>>   /delete-node/ &wpss_mem;
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
>> index a5ad796cb65d..1e190ed18ae5 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
>> @@ -22,6 +22,23 @@
>>   /delete-node/ &cdsp_mem;
>>   /delete-node/ &ipa_fw_mem;
>>   /delete-node/ &mpss_mem;
>> +
>> +&mdmss0_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss1_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss2_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss3_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>>   /delete-node/ &remoteproc_mpss;
>>   /delete-node/ &remoteproc_wpss;
>>   /delete-node/ &rmtfs_mem;
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
>> index f47efca42d48..8e8dd4efd8c0 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
>> @@ -23,6 +23,23 @@
>>   /delete-node/ &adsp_mem;
>>   /delete-node/ &cdsp_mem;
>>   /delete-node/ &ipa_fw_mem;
>> +
>> +&mdmss0_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss1_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss2_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss3_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>>   /delete-node/ &mpss_mem;
>>   /delete-node/ &remoteproc_mpss;
>>   /delete-node/ &remoteproc_wpss;
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
>> index b721a8546800..1e9d7e7b5fa2 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
>> @@ -26,8 +26,25 @@ &ipa {
>>   	status = "okay";
>>   };
>>   
>> +&mdmss0_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss1_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss2_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss3_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>>   &remoteproc_mpss {
>>   	compatible = "qcom,sc7280-mss-pil";
>> +	/delete-property/ #cooling-cells;
>>   	reg = <0 0x04080000 0 0x10000>, <0 0x04180000 0 0x48>;
>>   	reg-names = "qdsp6", "rmb";
>>   
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
>> index 3ebc915f0dc2..6642076f62c4 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
>> @@ -7,6 +7,22 @@
>>   
>>   /* WIFI SKUs save 256M by not having modem/mba/rmtfs memory regions defined. */
>>   
>> +&mdmss0_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss1_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss2_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss3_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>>   /delete-node/ &mpss_mem;
>>   /delete-node/ &remoteproc_mpss;
>>   /delete-node/ &rmtfs_mem;
>>
>> -- 
>> 2.34.1
>>
> 


