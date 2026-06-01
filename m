Return-Path: <linux-arm-msm+bounces-110491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKlFKAz3HGokUgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 05:05:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1913C619080
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 05:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 011A13008509
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 03:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F8B2236FD;
	Mon,  1 Jun 2026 03:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JSAwKYNJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9Yu6dZJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634611B6D1A
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 03:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780283146; cv=none; b=OKhM0IIlx5TCWGSjUBTMRVPVEzQkJ9M/pmq9OPt1KxEdr+hakmLtnn8bfLgWv4uWPWP+i55MVwf1UEKBHz5h2E2wHJvh2nWyRKWohLLOPsx1GtMh+nxlFGiBsl9qr0sNizoekIvFjFR2FBZh4cYDnSG1jbnRBW4FYthMufTnSEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780283146; c=relaxed/simple;
	bh=Vy+YhFE2gSXb5OnwZrw1eGd4N0Q6Gt8IqQN6HNr4hQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cTwueUEPRqrbVBHaB43iqecXGvT5Drfxo3RtYSo8FAP7c9UP5ZZjxv3eRFQB9qAFGgEd+FsrBV7tJrMjAhaQOF7n6A7kCn9pl1cyQmqgprGRu3hnDAFzp9yYGKAJ5f9vav9/dskX/UNd0jtM3XfanLwLGhAn7wmMWQqkm51TFqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JSAwKYNJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9Yu6dZJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6511oJRn1069059
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 03:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rr8eNIJSregUU9TOJrUB75ijnJ0oWETbhJRkNix2tbU=; b=JSAwKYNJgfeQHv1E
	VFTGLJwlquA8pV+O5K9DfrDl8KkjU5Nv5zHY/LwDevWWYw3yGWV36PrnWKCqY8xC
	J9o7Vr2P54ClDA5m7/WDRLFjXJa0mCyDy/QSR92TzXWxtJANaX2lGa+LmL950Tjv
	EVaTk9wb/9UtMHi6WgmxEMEGJ7q9PtONuMjS44t8eK8JbAlnsIR/LlQWdCfqz/Gw
	aPsAgol5iUG6bWiMNeGDGUTobAFGYsJA1Qt/zmwSnoLuEjxHFBv2Q49XNzrzQO0L
	/6HD8cMcdiGodgIOH5yuRPos6fJDNJVKin7BHzFG2GHCzpeufvmI7bqzE+CcBAR1
	9TCa2A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr98darq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 03:05:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a2cde332so407354a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 20:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780283143; x=1780887943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rr8eNIJSregUU9TOJrUB75ijnJ0oWETbhJRkNix2tbU=;
        b=C9Yu6dZJbtXH5IIo+L1BtdeICz1ggEU7MSv6eUKT4yuLfgv2Wv7/7O4krX7l2HYvwp
         AJaBeRBq3PIcJxW9AouSAvNOf5zwKJZ2ANzsz10UjeCKQeB4KlGJhq2O6Nh+dTuoWzBu
         lLXwUIb7dqmyYGdxE4+6FZBxm/Pq48rPQVy+JzXn6p086Wy2+j/UMJrGPRIoHtfkhmAp
         J7xvelq7XkqHgYorFzekMhBzLxHct4hGMhR6aAXm9Hsu7A53lQix5ytqv6vWFgL2XOEU
         V/lvl+oqJOM2Rz/bNz54nyDPPjz8S+Q+zdd5Cokvcx4qZrEWxDkAlou7gQy7hr5VK4PM
         Ph+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780283143; x=1780887943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rr8eNIJSregUU9TOJrUB75ijnJ0oWETbhJRkNix2tbU=;
        b=A3f1BSAteq50gAauAzwd2fv26Vwu7h3dXAGD7VIsGzbBMZxdHeZcmX7GkVHbmpZdry
         QC2JVvkGqELWPCpjbUqKs4Q6o0uoJpWmrjY0rdJ/dckN+icQXRxG5xClrPmWFLeqJEBx
         l/6rAIXK8RWH09sSdPMmik/uCKQkvDqftsTsjE97Mof6d2KC7Xy8/cHkPm0IyK84jvqa
         hRRVGToc4cD9kaJC+hqnksiTidQHSqYw2/61V8x+W4jUNlm8vWWnl440Qtqzmn4xRG2M
         5d3N2YqiTJP/6Uaep94rIoq/37ky7Ay4Edb83nir0kT5S/lajCTruMnN4Syoblj24li7
         my7w==
X-Forwarded-Encrypted: i=1; AFNElJ+tA2lUzUebduX0XuJyvQ/dcZ9PFFQYkjo8VSIHhcLHWBeWy89tsP9KaFOR03la5G2q2Zq4N/OTji7ooLag@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv7caUqWLegdTF8c/FfmbbwvKHZ2S0cEmROBEujOXJQIooAZjb
	K+ClSj4UlVZeWuPFGP1VpfzAGOcBxiDU6ibNrTBw5LTBM1/Olk9GtOXpImzAtTCvHd48cTNScDR
	Vh7iapQTMnZz05Dtnw5fpOA2UpSM9wWbJD14agIP2EH3x+WbOZoxzmlMXSdEE09dcJaDA
X-Gm-Gg: Acq92OFdBCYKfHSonQ2zA0MuqViyZLW3ReGChdyr+RoFSJ6bbSgaSPrYl92ALJ60FLe
	9ifuoQgR9YoTtdKEh/6c6uUE8QH6sB+0pW3rfiQmpl1ctS0nXQ+alU6aMBTvtj3OBC2l0Dd0Ibn
	Nl/r3Wxun5LG6G/EDIfu1sE2TJONzzVbjHOLDpU+Snb/PvoTigFfR9nfVxWZR5yFmMm9QIUcEbS
	o8S+eYIFQnS7h1DBzztRalbhfasWIK1JeYmXlZvGJ7Cju8TuwcG09xKmYLnEfi1dyQJ+pu71dIn
	PAYLptwVR8HrQHNrY/ADhXzfl6uwl1PY32xfN7K+21wRJdXF28+m1b8qLQ4jX2O9ExxQDYBbRoQ
	XkDTxtsjPjwUy4PNGkxKh9TL4rQnLi9UspcYcpHQXxtKyKbt3bx/Kulck0bo=
X-Received: by 2002:a05:6a20:748d:b0:3a3:a55f:405d with SMTP id adf61e73a8af0-3b427c572e9mr9284073637.13.1780283143080;
        Sun, 31 May 2026 20:05:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:748d:b0:3a3:a55f:405d with SMTP id adf61e73a8af0-3b427c572e9mr9284033637.13.1780283142589;
        Sun, 31 May 2026 20:05:42 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c857fb0b31dsm6793462a12.32.2026.05.31.20.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 20:05:42 -0700 (PDT)
Message-ID: <3a623652-dfde-469e-af55-d4b54e3ee1d4@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 08:35:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-2-953f246a0fbb@oss.qualcomm.com>
 <5nghgd3lt6vyewd3a7l4kahlxiidxdhgtu42tuyb7xeq62ztvu@tvclo336xtpi>
 <6d5fa33f-449e-4f22-b0d1-60a3a21a9907@oss.qualcomm.com>
 <pxio3igdcylbowpfiwb7r6s7q5spbo7g6i4iiun64zwn77v6xw@2kfvhzuhyxex>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <pxio3igdcylbowpfiwb7r6s7q5spbo7g6i4iiun64zwn77v6xw@2kfvhzuhyxex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1cf708 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=TlunYbtFrR_dMKcEUgQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: lTY3fn4wokUGlP-agRoSHal6vsU0DYFd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAyOCBTYWx0ZWRfX+YMy686XkH2Q
 TkL2IRs6p/akmeB9+8SnMu9WZQ/H+6lFNz0+o22UBXLNv7PZ1FUaltpWGAJBJrxFXdjDmec+jxp
 YvW8NjRKq5oO9ry6qC+v38VYGwObAIO4n0jz5a+8jKG7sUBnrdSdTpkC5fUmTDZ301UFp0QSIf0
 sMorZIrSoVkgdbnNI2+P0qKMt1seNiD5A0QbbSRa1kOw1qcYtkcCA5LaqQoumoX+TqEi33EvELb
 uDFHNCo+2kZZa5oEMuk/6ZYAgRQelYbwTM+YlJYXdfuUtRR3ZrNw9bAGNkUCaFLfyM/4x9VDKeh
 q3Tj8M7fClm1QtzKf/IZwyZGd3OBnT4DsMYUJ48+kVgEzE/7/x82F8QBSH5DEnXpoD0Ny9a844N
 IN3YLS1xnM6Zi1Jm6Q/wV1jaNfUk1Xe30xo6YwLyIl0hSyg2b17wTK+aM3zGFLedEH30Ymo2kJY
 WzKq69a50cFJteGA08w==
X-Proofpoint-ORIG-GUID: lTY3fn4wokUGlP-agRoSHal6vsU0DYFd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010028
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110491-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1913C619080
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 29-05-2026 05:03 pm, Dmitry Baryshkov wrote:
> On Fri, May 29, 2026 at 02:53:29PM +0530, Imran Shaik wrote:
>>
>>
>> On 28-05-2026 07:14 pm, Dmitry Baryshkov wrote:
>>> On Thu, May 28, 2026 at 03:37:03PM +0530, Imran Shaik wrote:
>>>> The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
>>>> but has minor differences with the number of input clocks. Update the
>>>> existing QCM2290 DISPCC bindings using conditional schema so that the
>>>> QCM2290 requirements remain unchanged while accommodating the additional
>>>> clocks required for Shikra.
>>>
>>> According to the IPcat, display clock controller also has (unused)
>>> inputs for the DSI1. Please extend the ABI for Agatti, then extend add
>>> Shikra.
>>>
>>
>> Sure, will add the DSI1 to Agatti as well. Since we are extending the ABI
>> for Agatti, I will remove the clock-names from the bindings
> 
> Why?
> 
>> and update the
>> DISPCC driver to use the indices-based approach instead.
>>
>> With these updates, the bindings, driver, and Agatti DT must be picked
>> together to avoid any functional issues or ABI breakage. I will explicitly
>> document these details in the commit message in the next series.
> 
> Well, no. DT comes through a separate tree anyway. Be sure that the
> updated driver works with the old DT. Also make sure to not change the
> order of the clocks, you can't break the ABI.
> 

Sure, I’ll keep the clock-names property and only append new clocks at 
the end without changing the current order.

Thanks,
Imran

