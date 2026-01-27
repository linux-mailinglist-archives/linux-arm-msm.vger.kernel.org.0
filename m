Return-Path: <linux-arm-msm+bounces-90834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAblKHXkeGlftwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:14:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1783397897
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E57DA300C993
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CE735EDBE;
	Tue, 27 Jan 2026 16:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J5aeP8Va";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JO/oedBJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9132DC34E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530274; cv=none; b=dN1TitsbLXlZa56EvGD9Idt4h0YDE9O/rWT/Nvs7AdeYxtL0TobHrPgytye7EbxYF/B8G7EcameX8ZMfMZjoSQzrbE9qAeSFMsZAISMmnpdHLbhgQ3kJKBqI4h0p0zKaZUxtbZ4I4fcJ2Lhy4tuCHQhioCKqcbFvdu5Q0diMIm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530274; c=relaxed/simple;
	bh=f8blZPMmP2uKNbdeWfk/2YDpCBfNTfna/PEqxzdJs3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSl6AGr5W+gRFjK/Zgeqqurm05UlNn2Z2Lrz/PDgaV07H1fPKcHFfRMw3Q0pOBvT0jZgKwKiDD3tYeHcOnz66lto2DESZ6SoFANiDzfsoNFMoj78undzkCARjbjYESizUdlvxyN8OE3H0ReJ92LNkQU1JD5mfFpoqMd808xDPwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J5aeP8Va; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JO/oedBJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60REZr9m1066201
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8fWdIXq6Sw/irgpXGik/ORVzIn5cU1rtiyzZ63WlMT0=; b=J5aeP8VaExXP58cC
	ZynB9WGYaLfJxdLijlI7b5QxKNexdXCcZhDNEFYnvo2tRykpi1me801IlxrO3yFS
	LXUMuGJpNabSZyIlUSNQw7d9fAi3vXBEyeZfklqgRdHYSiPjibla+QTo/q4Pr4KV
	z9MH8W6J51qXQS3ZKJ6gbtvK+Tvm7LdGqNZCKdi0j/98ECN3wI7vW3nK+LAtEIWZ
	JfSemnm3M07w5wqbXn2a6vfAk9wDKWJmRSzqfJW4izXlEur/sidBYgjbYniGjgg0
	DqxVP0iX1Z86Ze5Kuu/nCZnPl5/u+FsSpQu/u8YH4EYcFuggTt83xEKcEPVysnjz
	recc+g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxy8x0c4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:11:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a7a98ba326so64421605ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769530271; x=1770135071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8fWdIXq6Sw/irgpXGik/ORVzIn5cU1rtiyzZ63WlMT0=;
        b=JO/oedBJN3zAFY67dW7Zg1yGVlEx21vdR6u+w0a/SHqn3YqRK35GCMOst3GjpEeKeU
         hAudIjxLrtlMcVoSVT+AC2JwHnwshxoKO85ZIygWYSqtWIRpkUjeuqx/LC909nvgapYl
         ZOcZb/ZKl+lcSIDGet+4wHIhNGAuz5h4zd4Yzljkl3xCoONIMQF2qvCFUO4pM4zJ217T
         CUuZZg0EqCMfr6MV6iLWxH6NappuUxxrNNd4mWYvP/ZTvIV9oN99n0nGSUi8BEsUer7i
         4rVKxymPURkO3G304mdZ5GmrfdXPbSFVQt8I9NavTa2/Z6CCaCHsoS65VjYgbgURhtTV
         jc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769530271; x=1770135071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fWdIXq6Sw/irgpXGik/ORVzIn5cU1rtiyzZ63WlMT0=;
        b=Y+t6ckn5fPxuaL3FLT049jvMd2MUF58Z+IK+Hj2o/5O3DeSGJpN1xbbFny0B3RXfAe
         taPlQbwTy3kL4sWM4sEupX/yNvHZGAXDhpb6FvIDTYMIvfgXdh/bdP8pRugzph1YQ2Wh
         /DZSMSR4+hzoyQu8huqNI8o9dmqlvPNSP3aqAAnVgMfHPs0Qlt2XM8MEuaDZMXYV1DM9
         8Mn71IB5aTNAJxHmeDRDMPn+y9kWRnfiIJXsPCVMK5J2ZOLxn+PwoA/FXlw0iOSduBPi
         PZ/br0Fb7CJTgz3z/wfODfKcEyfrSK46dhbH3uIAcVHZWXRyRXNa4m4gwDD4i71nRE3P
         52cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgpAdqQNj2BYEpcUx23X3h/+B1lu8fbyUWeRxf73o4zbXsp2muAdwlhAJQ0KTvZq9A/HM7ptXU8Kwb4muc@vger.kernel.org
X-Gm-Message-State: AOJu0YxOb0x9UFiA+ibrAX6qOiJLVkwRRsRmJfJafGxI0Na3OXeVoLYO
	g8o2hQrwLGby1eNcvnVxexTJIhAdFNV8FRhIxXiF2D9Igre3y+0s4TSgN6NY0qfhOXf29vTKUiZ
	EZM2ovR1OfA+NwCKpQDtgISjIWpuG2KUADgbNONwGUjxve7ODJ1RXUswYi/C6G2V5t+Vb
X-Gm-Gg: AZuq6aLlMYu+ojAX97JyJqVhEmcQUSn6zSMtR3SRW69VsdkXgQ8x3jKvnnM+KKZGHEE
	uHbPRsVUZvZZYwwszo1ZvUXAu9T/mO/tUNpQ5z9FeRDdg7BbZtxJuWhJkak3NMb9RKKDIrD80m7
	sEXJ58q0ZDCe/5bTYOi3E43No0nr9BBTRPEe6fQ7izMiDKrEaHkxtoppg0oQcdXw0vrry3O/d0j
	LgJBCFvOr9LS+toLEnukQBDiqYiBP9Q84M1PNDxs/q1ZO4sNiYlFfUOR+liGKxashIf+Rcb0kd0
	tK27y4uLKjGL1g3l12FCtPzeu2tIsWgah8+IFDZy3nZ/H9+1mLmt1RthstjAIlHsfOQmAz450+A
	SoNQrTCUf0WygCIkWBZlq1GDDHVRv/Zy6u8ZDhoze1IM=
X-Received: by 2002:a17:902:d2cc:b0:2a7:bbe0:f01f with SMTP id d9443c01a7336-2a87120f624mr20172365ad.2.1769530271016;
        Tue, 27 Jan 2026 08:11:11 -0800 (PST)
X-Received: by 2002:a17:902:d2cc:b0:2a7:bbe0:f01f with SMTP id d9443c01a7336-2a87120f624mr20172005ad.2.1769530270363;
        Tue, 27 Jan 2026 08:11:10 -0800 (PST)
Received: from [192.168.0.171] ([49.205.248.59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcd96bsm123128645ad.33.2026.01.27.08.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 08:11:09 -0800 (PST)
Message-ID: <eef542b8-2a1c-4941-8895-453a108634dd@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 21:41:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] media: iris: add support for kaanapali platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <lpgw6eodclsvfwgvtljfiorvjkpd5vd27yhxs7i3ijfibaqzuk@bak2lwbyh77f>
 <2d4632b2-916a-4eda-ad08-44af68461dc8@oss.qualcomm.com>
 <vv4stkmrrwdqmbnpv7pg5nd4immtqo5iplwbcia3oykycfmg2m@dsithotfy5ls>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <vv4stkmrrwdqmbnpv7pg5nd4immtqo5iplwbcia3oykycfmg2m@dsithotfy5ls>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d9umuY5YbOLagH50y-njCKebsHSdL_S3
X-Authority-Analysis: v=2.4 cv=OcWVzxTY c=1 sm=1 tr=0 ts=6978e3a0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=4hJEjaH6g9CgPEswoao2AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=421KuCM3en4z17v6548A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: d9umuY5YbOLagH50y-njCKebsHSdL_S3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzMiBTYWx0ZWRfX3W/lvGu/HDOU
 BLFzNIVVIPrtPMu8YYQFiUHua5JcmxsXdk+Qs+1TcR8sJY5ieLYfJ1Y1Lo6ieMDtHzBBW58ufGn
 DmGkRgPW98RCXGOS+P4lS+NV5FB5JCcvHUTsXlzth8RTDQDR5qCVbjLObcyvV62p6wf9SzE0aVo
 c4lwKQRb+mlbu5+aypzO4EdgZ/B2CVJ+PrbPImOY3oQMXYsDWcQW9o3yoxafhVUt81busvYYZTi
 hFZ0T5JpFWjBaPGz6ok2LPXnUqYDI1kzVncMTyIedagWyOBh5HKIvpcA1NaQ1m13t9RECsecWBT
 byXfInLCuLKgcYS/tdP93AizH6oiSDcXECVpe/8d1c6N4X42cxOtQYnKsE9qSSoRyhVzyESSm6w
 BKUBTpKGlIHNstTFFnRqbw8jD7TIJVOk26nmfPPcUgK2sLLH/ZrVqDCsx4pWgrNWVqVaiz8G6Kn
 XbguD+FP0LKX1b+HMlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270132
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90834-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1783397897
X-Rspamd-Action: no action


On 1/27/2026 5:22 PM, Dmitry Baryshkov wrote:
> On Tue, Jan 27, 2026 at 04:56:34PM +0530, Vikash Garodia wrote:
>>
>> On 1/26/2026 7:08 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jan 26, 2026 at 05:55:43PM +0530, Vikash Garodia wrote:
>>>> Qualcomm kaanapali platform have a newer generation of video IP iris4.
>>>> The hardware have evolved mostly with respect to higher number of power
>>>> domains as well as multiple clock sources.
>>>>
>>>> The series extends support for multiple iommu-map entries for the same
>>>> input id. Considering iris as a client driver, it adds the handling for
>>>> multiple stream ids from VPU via iommu-map.
>>>>
>>>> This series is depend on the below series:
>>>> Link: https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/
>>>>
>>>> Following are the compliance and functional validation reports.
>>>
>>> Please validate with fluster too. Having a "knowingly good" command line
>>> is not a validation. It can't be reproduced by anybody else.
>>>
>>
>> Below is the fluster result on kaanapali (will add in cover letter in next
>> revision)
> 
> Nice, thanks!
> 
>>
>> H264:
>> 77/135 while testing JVT-AVC_V1 with GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
> 
> What about the extension testsuites? Even if they are not supported,
> they should not crash or cause the timeouts.
> 
>> - 52 test vectors failed due to interlaced clips - not supported
> 
> Yet or completely? Does "failed" mean "returned an error" or something
> else?

completely. Driver returns error on firmware detecting the content as 
interlace.

> 
>> - 3 test vectors failed due to unsupported bitstream.
>> - 2 test vectors failed because SP_SLICE type - not supported by the
>>    hardware.
>> - 1 test vector failed due to unsupported profile
>>
>> H265:
>>   129/147 testcases passed while testing JCT-VC-HEVC_V1 with
>>   GStreamer-H.265-V4L2-Gst1.0.
>>   The failing test case:
>>   - 10 testcases failed due to unsupported 10 bit format.
> 
> MAIN10? I was actually surprised, Venus driver supported them for the
> Iris2 hardware. Is it somethething to be fixed in future?

10bit would be added in iris. We are catching up with all the codecs, 
10bit should be next from decoder side.

> 
>>   - 4 testcase failed due to unsupported resolution
> 
> Can it be fixed?
> 
>>   - 2 testcase failed due to CRC mismatch
> 
> Which means an error in the testsuite or somewhere on our side?
> 
>>   - 2 test fails due to session error (under debug)
>>     - PICSIZE_C_Bossen_1
>>     - WPP_E_ericsson_MAIN_2
>>
>> VP9:
>> 235/305 testcases passed while testing VP9-TEST-VECTORS with
>>   GStreamer-VP9-V4L2-Gst1.0.
>>   The failing test case:
>>   - 64 testcases failed due to unsupported resolution
> 
> Can it be fixed?
> 
>>   - 2 testcases failed due to unsupported format
> 
> Hmm?
> 
>>   - 1 testcase failed with CRC mismatch (fails with ref decoder as well)
> 
> Could you please raise an issue against fluster?
> 
>>   - 2 testcase failed due to unsupported resolution after sequence change
> 
> Can it be fixed?
> 
>>   - 1 testcase failed due to unsupported stream
> 
> ?
> 
>>
>>>> gstreamer test:
>>>> Decoders validated with below commands, codec specific:
>>>> gst-launch-1.0 multifilesrc location=<input_file.h264> stop-index=0 !
>>>> parsebin ! v4l2h264dec ! video/x-raw ! videoconvert dither=none !
>>>> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
>>>
>>> Neither of these commands specify, what exactly was validated. They
>>> specify that you've validated _some_ videos. It's impossible to even
>>> reproduce your results, because you don't specify which files you've
>>> used.
>>>
>>
>> commands are shared indicating the pipeline used for validation for
>> different codec plugins. These are some basic encode and decode commands,
>> and shared for reference for anyone to pick input test files of their own.
> 
> Thanks, but it would also be helpful if you stated, which filesets were
> used for validation. There are enough public filesets for testing video
> decoders.

Ack, will add that info in the cover letter in next revision.

>>
>>>>
>>>> gst-launch-1.0 multifilesrc location=<input_file.hevc> stop-index=0 !
>>>> parsebin ! v4l2h265dec ! video/x-raw ! videoconvert dither=none !
>>>> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
>>>>
>>>> gst-launch-1.0 filesrc location=<input_file.webm> stop-index=0 !
>>>> parsebin ! vp9dec ! video/x-raw ! videoconvert dither=none !
>>>> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
>>>>
>>>> Encoders validated with below commands:
>>>> gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
>>>> format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h264enc
>>>> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
>>>> location=<output_file.h264>
>>>
>>> At least these should use test sinks in order to be reproducible.
>>
>> it is using filesink in the pipeline to generate the encoded bitstream
> 
> I should have been more explicit: test sinks to generate the image.
> 

If you could suggest a gst pipeline for it, i can give it a try.

Regards,
Vikash


