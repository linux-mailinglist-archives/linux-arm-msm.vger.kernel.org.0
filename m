Return-Path: <linux-arm-msm+bounces-107829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GI5pItYEB2pNqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:34:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE22854E8CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BB36310A210
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B393D1AA6;
	Fri, 15 May 2026 11:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aNWcPlgo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGthZVLu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A9D478E39
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843395; cv=none; b=SBB0AuLjy3g62pY8uVspwyonvUCvhoWLULjCo9NkCKeiSy/UPLH5WtwZZ69tqchsq/lkCIXMFA53I0FdC7noH2ap2SpfMnFny3716olZr6Bfr6IrQ88HJXTbkEIongaicgkPtNLuR6CLE7CIzns8PdK1ela3+XzJHBlGxNl+XJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843395; c=relaxed/simple;
	bh=cCW9t4VDuvvJp7F1+qa5eO+mb7cpDFU6V2KGPtVU1W8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TnA0PB+2MvGVw+toFbBtBmNoIR7Da3+ea2tY4tbFQzgCZCkNW2kyijBWj4M8TBvt51u5KbaSzp8knV/ZTTA/yESGY3CTx/H2Nz73NkoAcKMy2XQ87aq+pvWK8CSD8Od4dImANAoOgrMjJfIw5wNowmBdhvVfbk+9AFALSqaNVPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aNWcPlgo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGthZVLu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4vLob3197965
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SPS1BdPlzzseHEWwqikvhU0ttOry/wRa6oEMt+5JVig=; b=aNWcPlgo5Ducv9/N
	Sp4bUl5RdysKf4R4nTqKVYAq8fa588PxEAI/577KKSTr9h+WbAUWwmwzh5kJpaiK
	aPMaaLOvLd2ltLmfcrJwkVukn7mhdfLo2EPJMGsw8JbeFvQwZPD63Nkod0ieoVAu
	6Ajc+Knx64HaTODGqqjt6sAfGSfWezzRPWbBU0NWNoI9IytMwl1XQYduz6gFSIGw
	MpjBhEKhUxhNu5V+eD0XBUBMSW7wK8XcT9CBCJ2CHrKrBdsxn/VsSR3ZK6MwTqNn
	53gLAEmcnLJpHx1R18pNegn+g6xpeaGvJ/AsSInqJHapr1CL7rSgoBBp90FE2CLM
	wYvLqA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qayf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:09:52 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ff9e60dd65so695851137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778843392; x=1779448192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SPS1BdPlzzseHEWwqikvhU0ttOry/wRa6oEMt+5JVig=;
        b=CGthZVLuAsWAd7vtu1KJrTH7DeR6S3h46/lItbPAAOzuVg6TpN43I+PEppRnwlza3f
         VMfqEHS6AxX8CwXgKVK6P9xqNVUHmeU+wWZdODxix9IDlwKYlqllp1TZn+ejNrR6ttOh
         c+SN/K9xPEqLGkmLcB64wuOQjq9DzGE5YGG+zjRlX3fIAoREUn8gsX+xnLlQEYi6odZ/
         iGHYHEpTGzXRZqaFpHSUOI+VtKhnGVClKT5lEDS5V5cUw+1M0q48A856AmL3qJkKBv72
         IKnQppbhAytFV+5Nbt2XjhuAiGBGacz1gg4Bq547Eply2GP+G6tDwIMqJT+GfRxyT3Su
         Qd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843392; x=1779448192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPS1BdPlzzseHEWwqikvhU0ttOry/wRa6oEMt+5JVig=;
        b=gj71G+PbH8+QnBGdElRF/RoGBtdAD6afIsp4WL8x9VpTpD9HygW05Z8uoJLw0o5eLy
         rts+UPfr8jwPqG6kzelVCUVRhMZ4UyMug4jVTv0TVgI4z/jtiq/gAef+7JzsAbNXeIew
         1ZUWIruuMxz2ZDvUWD7Q8LjGNqIIVe7dmO8uPOyNjTIAsWwxebILSTz88VknXR3oZKkg
         /Y/7TBaQndowmj2v5sBDTt8bpsa3ThJpU6g6ouR6nSaYJlTZvcGCARs8maZAvOH0dXD/
         tu+iTmttYaJxF/NEixgDMsXJgiDsAFxN5+eHyYdkq+6X4IE4hsIVee/w1RaKH7YByJFE
         pRVA==
X-Forwarded-Encrypted: i=1; AFNElJ8uhvPDx5EuxywdexK/2s4ghrdCE5WLbS04zEMtQ2HxTvJoczyswfZ4UBtKk/5iU7G+quFIc1vz10pV24P9@vger.kernel.org
X-Gm-Message-State: AOJu0YwXJWm2E3etwZ/WVR8XOm1jy+u3Q4L5U4T7gGgbazQtXCEImaZD
	h3JSKR9m+q07a8NgrQ5VvX8zwkFMRwWwr5HpYzZ3175In/HjDckDvD5cK+qbQfoxrGbdP37rlSE
	M1uEXddVhYsIBAKc37KZZ0OM9HGgrg28uIAeZmydKJ7+Gi/r3slo/+nyrCtXWRXubax7Z
X-Gm-Gg: Acq92OHnDkTv2ng5Jd8OFfWYdq4uvvalORV/9QUDtL/W6HZ59npAKldd8ljC2RQXwC9
	TwkEvNzTSQJXChavND9DgTsjMIY/ZonwZ/U4XuKGlrSafzGPHG/cYAIgH9mjtgU0xIbYeXtOMPX
	O++lUHl7wEysabLUxzpL+n91B00enLYbxNPx9ggjWLc7dGs2P8MOsOTAcfclzj8206ngB+kgowH
	juXdSeH14WhlBAxM1+jAWr2xDIKxotglHCLiluQUauIPEUulXg5Q7Z1qsPcJogLoES871Zz6m6/
	E6mnXeboxiTPMDVhUhaTIq71H5wNCSeFmTq+n9SdRd7TsgKqMRQUHM9TulzezZRww8SgIWvqn4S
	MGBSOG9+OX4lsJKXyzHoy5ov/2HgCtdXAzvqeL0DMXJhGJpIApVEBcb8hsgpJteaiucUJHzmZl5
	8qSPZOBoMJ4UWNMg==
X-Received: by 2002:a05:6102:5092:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-63a3ca193e6mr615905137.2.1778843392241;
        Fri, 15 May 2026 04:09:52 -0700 (PDT)
X-Received: by 2002:a05:6102:5092:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-63a3ca193e6mr615897137.2.1778843391822;
        Fri, 15 May 2026 04:09:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e5eef9sm206598566b.51.2026.05.15.04.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:09:50 -0700 (PDT)
Message-ID: <05c78fde-a15c-4a36-bffb-667554362b2d@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:09:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add CAMSS support for SM6350
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QBz3tp5snc7Iawo07LxdACHGdFIXix9T
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a06ff00 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=n9fTaaqHRJLAcaDq8VUA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMiBTYWx0ZWRfX9yZqQApHMA1s
 FtT1XUV4E60p9Tdp8rO1NULY8jDz7l/NT3Fvhht0YZMLxJH8YosKii//q/5cG67vj2QjZ9K6urB
 sOlDrd0U+i7w/R4Kt17/DxbSD3kTOChyl46uh0Fy1XyfnNf889LG9TD/G8QH8QQB4bzGoZZN2aI
 IgbKz1CpL8mTfmRHie+AIgr5wCfszsZMO2YlVLjHH5TAbJpC24RV9KC7/W8vQSG3altqkjxudGU
 vpmb3WqiP8atXkPpilbvld2zFQQXG1fXK/Qg+SVSi9rmjbsuDPdKIAb70SVet20QxanJ81ZYqdj
 9v6PESVq5U+JH00tzKb0uk0XlMFkICe6QdURMjpSDgPaiVfLTlhA2fIlp7xxEk37atB9xfFH0Jn
 JnhsHglJ2LWsNQiXqCKjVflkyNAb4M9Fr7Kf4jBD/VkBiZtm5NtnaiO7d0J9yZiAh03payO7atl
 kzRGQk01R9Pq+uF7jFA==
X-Proofpoint-ORIG-GUID: QBz3tp5snc7Iawo07LxdACHGdFIXix9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150112
X-Rspamd-Queue-Id: EE22854E8CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107829-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[fairphone.com,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Action: no action

On 2/16/26 9:54 AM, Luca Weiss wrote:
> Add bindings, driver and dts to support the Camera Subsystem on the
> SM6350 SoC.
> 
> These patches were tested on a Fairphone 4 smartphone with WIP sensor
> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
> far as I can tell.
> 
> Though when stopping the camera stream, the following clock warning
> appears in dmesg. But it does not interfere with any functionality,
> starting and stopping the stream works and debugcc is showing 426.4 MHz
> while the clock is on, and 'off' while it's off.
> 
> Any suggestion how to fix this, is appreciated.

https://lore.kernel.org/linux-arm-msm/caa870e2-3795-40bc-9f0e-c93e313c8c6e@oss.qualcomm.com/

Could you check the ordering between disabling that clock and
calling icc_set(.., 0, 0)? Or perhaps we have another missing icc
path somewhere?

Konrad

