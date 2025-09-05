Return-Path: <linux-arm-msm+bounces-72233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6377B45306
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 11:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5B4E1893E90
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 09:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FF0283686;
	Fri,  5 Sep 2025 09:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7aPbkrB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973B0283FF5
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 09:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757063968; cv=none; b=aRH8CoqQSXJDbzY3QxrmhOR6v6KUBSU2PPRYwm+2W0Qqi2idne+CdmIJQxk1bNRaoGBcSkCceiR97s2i0t1H5Y003YUMe4Vax3VeOdtQGlSjKGEOQKw85ua4Kw8RJvGNEXJYYqPHmNlyorokclq4cTh+dN8qOU8yYwDzMQtkBTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757063968; c=relaxed/simple;
	bh=KIj4LNw/kvQGZYEBaGiUgR6MDjNc8MxHxSzTe1N9i3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t7R8tnPa4azI8xkR8YXhHtge/ihVxo7BWPA8PatBerg+/dCXrbhrBCwY+yJ5OFVJTsaxXGN7Gl6/9kaUKfBO8Z07A6FuVTbmbeDBx085fZMpOI8qyw+p2wE1b1+MBlQf9rTQNYlCwZi910zsR14jAddg6w5gSHgJbFtXy8KQQ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7aPbkrB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857aerJ008316
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 09:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5mheuVheNi86mdpcqpjAPrD0yOrcM0zmpE+Wh+IoKbM=; b=m7aPbkrBXZwIq3aD
	hOlXKrq0gqd9wvMNwbiJ//VYC+sWooDqXsbnyiYT443kmT533F4SAMcAB0ay5ah4
	NADhLw8Q0F53Oquj4L9a0RLEGMQJ/ZB9C3+fcb9MQRuC6ldkyUl5eJgBKt9yiDJ8
	NxR5sqv6b4XpjCF52O7XIIkek2/ZqCBrysp/z463BV+HrGs24xPsOETTNt5tV/ux
	TIUsIMBlmvxuW30HleGCIW1fqF5VPRosqFlj9JMZbvwbD4EUcooPIArBMSFCThHg
	rdQ49sx7S4MIwkgoPV6v3gWkCslUZfELzjo51s9ROF7XwDqDz4/Wn5Bw3kP7rvT5
	KWdP3Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjthja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 09:19:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b4bcb1e32dso8895691cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 02:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757063965; x=1757668765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5mheuVheNi86mdpcqpjAPrD0yOrcM0zmpE+Wh+IoKbM=;
        b=gh8iqpvCyk5DQyf9SqVstGLKjttDGL80cli1rdHK+3Xp69t8zfNHjGnloDdd/dT72y
         w1Y864zlQWq4/aqJ1SL6TXc24eJug30CucP9Vdooz99y3aQMz/2RvEx2PabQRb4yGrfm
         oHLXt1i425u+dhTgBUUEL0F618gt8Hn4aTbDsNm6e6Wr53Cmcak4p63uGjX8qZ4vTGIR
         x6UElws+ZE8WF11ur+LYlZRG/Bk9xsoEl2/UACh1dxwzDwMl8qJGASTjYCp3zYwxngg7
         JTHy+boJmQA4aHaW6gOn4+t3Rkskw+XDYeTAw5NCm4yg3DRpvhqDeDDjeCJskm/AOBGM
         8gtw==
X-Forwarded-Encrypted: i=1; AJvYcCW+Jbm2R7k2ClMez4awtbggzk87Upeto46XuV3weqKbcG2lm2yt+WCvdi3Jii4ptWXAAlLlS3mrrlTHzoUz@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ9svCZt/mZToQMVYc4AiyKNdLSrUU32BbumobJA25T/K9xUsO
	kbai5Y9qa1KyfFBUelXb6Xc5yBbBm3l59YJNJRnmcCRlWBoh+kDNmQ17WsomGsZOy/dfI9rdkCw
	H3mP3oQXAj03SOm3eLkGRaglCv5uwzr4uqKZnY3Ah6hENke5KsAfdeIBm72O0JpaItSyq
X-Gm-Gg: ASbGncv1YGPEJzJ2Pn5zS+MM690qE7BWMDr02AQXnjGYv0W2sUZQ9rvTIqH9GiGHEZ/
	sD1z9gx6BW4WgczghvqFGz0decEILgadaUEUJb9KlKljfLVjfFMW3MGM9TARe5nsNN2MMG9H9wj
	kyV4J8HSk0IVL85GKl+413//tsMu6qdGE/7u0G0a2YU+i8aiVIghADHxiP80GKKG3R9JOBA8A0b
	Y/ApaNrobTWo38xG/DmNIP5wyYOfFTDAXqXZgCt69kBr2gJmrVkn+PEAt5yyJeP3qkimcrsPxNR
	qjpsfA5T7fsj9xpt7Ov+GtnzBYVc3PhOq7LhIlBUgJ8+i3chiY0MlLyW0P5HpiTNstSYAqp+VHv
	W4o9RpwvlFjTUF+HFrGQQAg==
X-Received: by 2002:ac8:5ac3:0:b0:4b5:e391:e3e0 with SMTP id d75a77b69052e-4b5e391eb76mr29836381cf.0.1757063964592;
        Fri, 05 Sep 2025 02:19:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3F9vSGXSxcO4h54j2pqoF+PplowVt51lj9Vy7KzWudaCZVbxujLAhE+/saQeA+isoTjlbXg==
X-Received: by 2002:ac8:5ac3:0:b0:4b5:e391:e3e0 with SMTP id d75a77b69052e-4b5e391eb76mr29836081cf.0.1757063963994;
        Fri, 05 Sep 2025 02:19:23 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc22b594sm16732909a12.21.2025.09.05.02.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 02:19:23 -0700 (PDT)
Message-ID: <4007710b-9e0c-499e-bbf7-246133ca9f21@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 11:19:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: Add driver for Gunyah Watchdog
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        hrishabh.rajput@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250903-gunyah_watchdog-v1-2-3ae690530e4b@oss.qualcomm.com>
 <eaa2bd28-ed98-456a-b374-3183e54123fa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <eaa2bd28-ed98-456a-b374-3183e54123fa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68baab1d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=v9T48ajA7Nf6lPuJmEUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: JrjmuP2Si7vZ8KKuHbZBBK0uN9UhinFY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXwKXcO5+GXjBQ
 SMmO1xUHFvKSO4VAJ5CZALGzURBT58JTWhvf0t9kpaWLpRrbbxQNZsESr/g0Gi+/P7+solNnAaC
 Y2djUnpDOdxm94lvKuzj+wnuD1daPLEMyZ2NMzvEmAk1gI+UjsogajPgr4axqEYm56LQOagLPW5
 GW2/XoDCvNEifbgwoRle0//YHTCqwoyFgua0H99z76Q3o/n33kfN29RBPki7fNG+Wd6QPAJl00b
 g524zUY5nJxJ31MVtRp9rVx6ENRC101Y2ITi+TtUg8XJwyv37kGfsw530eCk2mNrpJFCGlnGftQ
 tadcmw0elT2HsPGW/j3qBabU//e0Vlw4ldqfhiv0YOyZqGTDrNCwpLhMP7ZUZxRW4jZGCWNnB03
 XWIuvvWw
X-Proofpoint-ORIG-GUID: JrjmuP2Si7vZ8KKuHbZBBK0uN9UhinFY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On 9/4/25 7:11 PM, Pavan Kondeti wrote:
> On Wed, Sep 03, 2025 at 07:34:00PM +0000, Hrishabh Rajput via B4 Relay wrote:
>> +static int gunyah_wdt_call(unsigned long func_id, unsigned long arg1,
>> +			   unsigned long arg2, struct arm_smccc_res *res)
>> +{
>> +	arm_smccc_1_1_smc(func_id, arg1, arg2, res);
>> +	return gunyah_error_remap(res->a0);
>> +}
>> +
>> +static int gunyah_wdt_start(struct watchdog_device *wdd)
>> +{
>> +	struct arm_smccc_res res;
>> +	unsigned int timeout_ms;
>> +	unsigned int pretimeout_ms;
>> +	int ret;
>> +
>> +	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0, &res);
>> +	if (ret)
>> +		return ret;
> 
> When I ran a simple echo test, it failed here on SM8650 with -EINVAL. May be Gunyah
> does not allow disabling watchdog when it is not enabled in the first
> place. May be something you can check if this is a difference between
> 8750 vs 8650.

Hm, makes one wonder if the opposite (won't enable when already enabled)
is true..

Konrad

