Return-Path: <linux-arm-msm+bounces-102285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGBrLn8c1mluBAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:14:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 360E13B9B43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF48D30333BB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37612E0B5C;
	Wed,  8 Apr 2026 09:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b00s5HsL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bfkKCDT7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A2E2C21C5
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639671; cv=none; b=Cw5KJ8Oxv7LiMngqXzTycsKgk0rmMWTN5SXLlWI4+9gq9gZcFpcEGnUTBGRdEAC1Ic9ynGUiHTDHN8ZI6qF2D4mFsRqSkrRI07k180kvR7BuZRk0FfXMs/uf1HIORRP4ygwWHnbSqId2Eh8YotQ3YSu7plCDvfOcdkgAkcSvEGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639671; c=relaxed/simple;
	bh=YvtodDdplKMdW3PBeWJkCqYTAkXl02h8pr2K+T1smhY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Kcsc30eX1cMOlJfKacPh910btkSWc49ieML9sJKlddSnB38f2kAiuwkLAmR+PZM0TrVyEyy0lmBjvJ/tbTPaQX+OP9VqKE3mmkKwBzxbifrcpYtcqbEKUdt+iwzFyFzxjoRlI+gGVubhNIE1BQXhB6e0c1l2Tc0x9iROvnVzLCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b00s5HsL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bfkKCDT7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6388rp9s2412265
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q7cTSR5FSGG/VsgFWndHXllplgpX+lHRL5bp+rlm+lc=; b=b00s5HsLbAeWD9rF
	OgTnWAL2NbNVpiIqljY5NG71G3Bo3Lepj7AmAgwB0vHEs60/jPB864tCHGtWUOiD
	Is8fDK/+9DnL4y4eiEAtfw1Unz9HNpqFkdOhiIcEbgUBwIDR6wYIJsiun832V/Vk
	JXXx2l1P4vc55kT9F/1/E07be5xnIKVe4KfBxrsDHBoKAIEFaMtz0O1gdjCkFHIw
	vrcsXme/qpbjHZrK85P44qlIsqS8LZQdpSH/a/s3urHUDxTvorKF87lmd2iaC5rk
	0D9XnZEzoouqfh+lYHfdWpwYYmu6gIK9OAsC8m15RLzc3ndEMBU53Yw9WFisAVBU
	aW5nxA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vb18c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:14:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2471321dcso167921795ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639668; x=1776244468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q7cTSR5FSGG/VsgFWndHXllplgpX+lHRL5bp+rlm+lc=;
        b=bfkKCDT7yPFTurXmWjkJb4eT2hTxa8fOOvwNhNnkEutO5N4J0MaVb54tHwVoOuTzHY
         98g4naa61MsyjyhWUno16/HMDiMOp3VO1m3zxUuT6vmch4CnLmqwy6MQSlPtUWFfXoYv
         xpQAHyx7AR6zr07NAL+H1UAhShFbQxiq30HM8qUgEMds7dkXh4gYE9tlHcwDHmFAKE3J
         kk33MJKzNIZd1ozwkyQCF1HBbagy0w77D701iaBpZ9ZtKsEPpoqWhxSvJu+ZPjFpFz45
         vMy0Mzy4R3yL80YQQR5mSYuboaPJMT+9LO6nd3OLlUBfotL1ILaWHAekBYNWkzaJL1NP
         y0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639668; x=1776244468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7cTSR5FSGG/VsgFWndHXllplgpX+lHRL5bp+rlm+lc=;
        b=raZaxNhzZxpt6M6laVOEN15alOLCPp805SLKr4DVJm2vkZdLBufcTZ5W08bsg3hAUx
         rZZ5sNi2C3pfcjaNSco3+VABMVr3KGTIvyzFZN0RtZ/hBNWKYtEdePVKWMuge4ZHP+Il
         MANu9RqGua3Y0zPwIxh4oGsTmB6Ca3udQCWPRRQT47UrK//g4kf7jQpm7rltEv9UwdYC
         1Xu4hogpQpQugeUwjHtodbmVpok/5yeblgiQ+RMs98jhAv4BZ/LHLNtZHwJG/GG4u7wm
         +wlO1FyG/92bdP8PWAuElmKiK2gU1UxIlHySzzLvPjmQiuaVInwnnZv6nM1Uowttj5M0
         V1JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPAdNRuYD3zvgoioENr3xS/ZkjZSajcudXgnK3AmVmlxlppJJ6xcrF+NSfvgH6l5O+b1hohUiS0isek1+i@vger.kernel.org
X-Gm-Message-State: AOJu0YzQxrEWud1lOB0R3ZBvfhd/GvWfA8fXzpN5kaMoyU8ZqpGQSwXB
	GBa3/x+asUzKigg6doFUNDnIpPc3suzF67q7IqAMFEAoqitU71puYInksES8IaY00gcctOHt2ai
	iYSYuWB45FO97qF2XCkB46BBAYmHCgpCpeCLFLTOrmj/8Jp/5R36zYwlHKl1MCb+55B3u
X-Gm-Gg: AeBDiesVzSiUmmdjlJdOx988PuLMlVtbklC2ZxyA7TpPU/hRMT3x9geWt05mshSuSjb
	2ONtQlnm4xONoci3Mh+CkUWhI1LTUVC/ULmYW8P4BCYCwcNpfjOPnsEBumnTgqgXYJvdVcv9mPl
	FyMHrp3XvhNdGW9uZks7iB6HGzG35bMrCNS74ZEJYmM/5OHZfnk4rYsFtoXPVfNqAcGp/mG7FK5
	6zZZz2SNuTwyKTq8QswzGaEdjJlFUoyv6bVKzLX3iKYV2RA74Jc0QMTWci9qhFre6bKCZvYX9zm
	x07FnZDobGqMAHWzkVo9ZLrC8kzGuZPeYkpbGVGuXiN9rJwFf4F2BJ+gfINc1o0ZupVeCCocpxJ
	v03V+1ztJCQwxO82DX+bkPYjudbE9GOPEj30TwZTsINDQ1BlnSSWUQis3UT7h3fKjtH4dSgkpDu
	GkcuPMfd6h7xjFoFUF
X-Received: by 2002:a17:903:4b28:b0:2b0:52b7:e82 with SMTP id d9443c01a7336-2b281867dc8mr185457325ad.16.1775639668341;
        Wed, 08 Apr 2026 02:14:28 -0700 (PDT)
X-Received: by 2002:a17:903:4b28:b0:2b0:52b7:e82 with SMTP id d9443c01a7336-2b281867dc8mr185456875ad.16.1775639667873;
        Wed, 08 Apr 2026 02:14:27 -0700 (PDT)
Received: from [10.249.21.102] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477a13dsm199169575ad.26.2026.04.08.02.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:14:27 -0700 (PDT)
Message-ID: <ed08f1f8-b820-40d7-956e-b346942e9ad2@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 17:14:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-2-ca784552a3e9@oss.qualcomm.com>
 <9bfaf15e-99c8-a98e-d0df-9df86872bfe8@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <9bfaf15e-99c8-a98e-d0df-9df86872bfe8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MiBTYWx0ZWRfX8LlGT+TiTtzx
 EH+IAeRJaJvY6GMgQYFz3LEhUiMaux41OMGEF7ARP11rQzjwx1MrUhzMV1F0mWvrVZM7sGxseVK
 MHT58rJXx/UQ+s8EEWOOAqW9HOT8zaFcK9ZQeJNoK1TwgTiegrlR45OVBxUOOnIpwGjSViiplWR
 Jtw341gSuGdob+EnmKAL1aFpETI+5xo1XTaI7yI2zj4/CUilefBVEQA0CWB6tW2m9KYjo/FDBy0
 CntgUuJWMpDtNnl5s3HZpYtBt4/2UAX6wh9+gR7Ydeo+5ut9E58Ziag9krVpsYeEDntCyZuZOIM
 CP+QTbM6beYhUiJIdArl7g6NHEPsCSrrp/Sqb/JxzwZJHwMlFi6OSEs2lMHfi2y3ADMFwpQ4TJa
 VjqiiR8n+2pTZ4IHWPkG1hUQc8MQJ12AWq645wgifSKN0YwEkW6qh0l07C4uQLf/Zr+TtJT2yBf
 arJQzdY28QGlg+CmgVQ==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d61c75 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=uc885YhAzpYNqufBhGQA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: e1D-R5lTvpSc0YnfEZ63Oe2znOb4Jcxz
X-Proofpoint-GUID: e1D-R5lTvpSc0YnfEZ63Oe2znOb4Jcxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-102285-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 360E13B9B43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/4/1 20:37, Dikshita Agarwal wrote:
>> +
>> +static void iris_vpu3_purwa_power_off_hardware(struct iris_core *core)
>> +{
>> +	iris_vpu3_power_off_hardware(core);
> 
> this will eventually call iris_vpu_power_off_hw which would try to disable
> IRIS_HW_AHB_CLK which is not applicable to purwa I think, will that not
> create any issue?
> 

All VPU3s will call this hook, but none of them have IRIS_HW_AHB_CLK.

-- 
Best Regards,
Wangao


