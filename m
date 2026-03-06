Return-Path: <linux-arm-msm+bounces-95922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNKLCEJSq2n3cAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 23:16:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBE0228451
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 23:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D000303CD20
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 22:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BBE34F279;
	Fri,  6 Mar 2026 22:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfSjst4G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jF49rd7q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DB034F241
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 22:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772835379; cv=none; b=hiBnlDoN4Z6fD4hkTBv/zJUSpHc0QsJ75BfBy+6NoqEICveR3au7R3L8SVRJnEkW+8EFm2Mu7Y4WCo705lL2FP/wE0/STWbzSzJCcIaNjGQSIfd+EuMO2EJdA3PAnk2wady+z7ozxSjdG4nQVlOQ4vZXgzQdlUoAZ6IUV8Cu5XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772835379; c=relaxed/simple;
	bh=ozp5w2u9J7nebog4KwPAIQaw9Q3GF+gWT8k1KRnFxn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AiuE7HltefNkHnFchEm6NQAYYsh9Xrog0adCyqaaaT1jaYFt2ewESa2D3IY7JoXEOY8I6wTJ0o69X6Uu5ravCsjw0CIQ9O8IVLq8ahCZOJXBeSpjwObJIESNuQDgIJix9dgDbyUN35DuVFVw3tiUkfRhUWl7x+9TLOs1FPo64hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfSjst4G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jF49rd7q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626KWatd1169199
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 22:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i8xe+5eaNei8a3fpTPt0x8f/YBdZqjrjrkxNfSV82tg=; b=SfSjst4GB8hij3Ya
	xumyToC4COQ43yIm2aQSarzCnpo0ypGv1UWid+nyf1aAiMF0Mu+lt8Jlnh6wZEzC
	z4nAMHqTQKPfGzFi4Ldw17z950DNAf03OiMcQDe7wwE/yO+WD8U5uSjNlAz+xe+E
	DI126rXVobs/QALLHK6ZUrp94YQkgg6+6YV5FIgosf83knfO3y+5DeVGfbKpw505
	0N1VQxl+B1ZgE5cgBtv5aVouUiY6VafcBs3QVFZGcpXdHBxf4sdQkDacB7oeO5Xn
	213NzZUpLBiKTugTF1ByolEGCHvJCbJb5CxMg1cmT9VYtIEhF2oy8+NVVw03lLlg
	Bzz1rw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrukb6m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 22:16:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so958471eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 14:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772835376; x=1773440176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i8xe+5eaNei8a3fpTPt0x8f/YBdZqjrjrkxNfSV82tg=;
        b=jF49rd7q2ZFEmPlzUtEXVMtsVd71tthuDah3VBfRdNj5dkOEUXgcBzUmEIHUgZViHV
         uSx2oDYIHD0C4uwTWJ2eu1Urmkw6GWt9dxclmVFoPMvzEIW0vjz1CQx2x7gbtv+bxz8T
         ajCgPBNmypPdmEaxp9eaWxrugLJc0qkixnsbSSl12wov94kNZP30uSmINFyhi5zJ1Aj0
         MzPLwiPk8uBD9/e7lrM7s61QBufpsrXxoQ6HX8qsoVe9isBuFGhcZGbMmqabduaS1C2Q
         nZkpIg5wIlmrgQt19HujdEHnAhXGKae0XGtd4VadDY+Yv6X8ykmN0rUkSwDFnNfeov1n
         HyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772835376; x=1773440176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8xe+5eaNei8a3fpTPt0x8f/YBdZqjrjrkxNfSV82tg=;
        b=jTGCg0G/OA4T7D3JFDoS1+Zg8CkGx/bOVQBpPO51Ikw4g5uflnTtGGD+Be6ilobwxy
         ygZFtLtXi9nHMtEPOdTFxUhoWScJIwhUnCNk8WcH90vCFkH1lkbuCvLdvLK6GayOcvw9
         Ow+TIVTEeEb0rNjwhH3WxTOcM9Q4ZBTB0ZxHS8nVe6rTe+O7zphCkDSrRZdGmX5sRJ9J
         wx3a3GsWqPuR3AaMzClpp+ooXaziJMHcqM83mPib1AZV0la8+b763OEBUAEG8mJOxHyy
         CqIc+7E+QAKSrQfikwOIkqA2Oy+PZqTnILG5Plzw05dJoChqpKwrS8FN4nX+3Eb+aM8P
         09yA==
X-Forwarded-Encrypted: i=1; AJvYcCUeCLBFnO0vBIFj6glOSBO87h4GYRNeXahsA24ZavCJId9ydFFJ5dijzHgtS9OQghIh3jxyInYWdVh0YoT7@vger.kernel.org
X-Gm-Message-State: AOJu0YyBDNCPHxpXym7LOs12ucUmius2KZ1ZhYh07uD6NwppCJOVl22G
	45sw1eozUXrq682afGkF/dg6YG40Qkcwd6NVeYmB6D5eSGVwr7sHcv3Po4bNFqi+YhRMFX84f9I
	Wzs15FoDNBuX9xOdHyfpc7S3zrkOCaccpEurv/mD0VuJ1oN6sNn5lzAkqvqaTSVU8J/sT
X-Gm-Gg: ATEYQzy7m5juvaA8lKFug9bk88oDXiQ7Bb5TYromRmN0HJ1kYhcGwKucFQUGN1jxt2+
	gJW5ZkJPiDp5NMVBFd9o1OEGYqdCYsHCswyB9Sgq3oFTNKWg2Oq7Pkk1qYZ9utBYYddoxG/m2fH
	jE0Qfo0qNHZWE6+VkilUBgd+rKNMSLgzYA/OHUCblWhbAzJqhoE6rly+YSGass00YmQwbg3Ckdu
	O2+rOkbLc87UceG9SQK7oCGIRLHXymgOw3lOG76td/nWFPJwdBLhAq2l3dWfJiUymxfIWPbxQua
	/+A/M6CqCrsOJB7gn5yJjFaT6SnGZBT7SSdZdy3+Lnyn6gZoBtrPFy31AKphoRX5B7dz8qqEZ1L
	c/sJTft7+M7Yarpu44wikCKgT2rOyLvsAubfqUADAUOA37LJwmpCtQUSUUREH7ClW9XC3/HV31+
	SabOGt
X-Received: by 2002:a05:7300:641d:b0:2be:1b95:2400 with SMTP id 5a478bee46e88-2be4e0655c8mr1446321eec.23.1772835375980;
        Fri, 06 Mar 2026 14:16:15 -0800 (PST)
X-Received: by 2002:a05:7300:641d:b0:2be:1b95:2400 with SMTP id 5a478bee46e88-2be4e0655c8mr1446255eec.23.1772835375083;
        Fri, 06 Mar 2026 14:16:15 -0800 (PST)
Received: from [10.134.65.116] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f94823esm2301765eec.20.2026.03.06.14.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 14:16:14 -0800 (PST)
Message-ID: <f825ae05-6285-4d10-9d66-578fb1221495@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 14:16:13 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
 <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
 <13091f47-938d-43fb-a8c0-4b081818b557@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <13091f47-938d-43fb-a8c0-4b081818b557@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDIwOSBTYWx0ZWRfX9Oflg0CxX6W4
 MgPMsWKiH6YSxtOlTe86stXMR44HNoAyXU7pKk0V4GHCN1dISmuWZ+fa6k/IJ+1id8//ODisbtI
 siT60ro0BzRd+ab4JCaDWiyT9p+UHt+XdtgOtagZ7o3DPsa9ApJ/9VEHteHC0iYo7yyjQphTYsF
 AdphHHj8klLjeN77B+qdwQb54+LR1xo5/dC9SsNnwVFxkC681FKjtT1TNLcIhrkp6CDC9WgAIHS
 XQXRWYpucgiGrUa9EVtvVf6GEd+lwwSD2VP9kA8+eXWwIweCuto8YgU/CC/4AREQUfaw0oG93Hk
 6xcQDLaLeiuZdyQWHJfHnTio2uVLXyprPKpe5dgsnLY701iLGsi4JctL8bJ4+4dxf0oZA43c3OA
 StVPXj/+bv+xXgZg8Kiw4478pyrTgKuYbPyz82Oc4lO+HyhnpFcPyMtcjdzQG8YDBy1LP70GGy2
 wWGhbDkO0PJggvZa/ww==
X-Proofpoint-ORIG-GUID: NVkr8sYSp3GQccmCo_HiBWZH2KVPOUUb
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69ab5230 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Js8INul6CuAu6eKS1T4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: NVkr8sYSp3GQccmCo_HiBWZH2KVPOUUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_06,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060209
X-Rspamd-Queue-Id: 7CBE0228451
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
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	TAGGED_FROM(0.00)[bounces-95922-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[trilokkumar.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/2026 2:00 PM, Jeff Johnson wrote:
> On 3/6/2026 11:47 AM, Trilok Soni wrote:
>> On 3/6/2026 2:50 AM, Sumit Garg wrote:
>>> +MODULE_LICENSE("GPL");
>>> +MODULE_AUTHOR("Sumit Garg <sumit.garg@oss.qualcomm.com>");
>>
>> What is the convention for Qualcomm authored drivers? In some drivers
>> I find that Qualcomm doesn't add MODULE_AUTHOR. Can Qualcomm community
>> clarify it here. I prefer consistency here for the Qualcomm submissions. 
> 
> WLAN team was told to not have MODULE_AUTHOR(), so ath10k was the last WLAN
> driver that had a MODULE_AUTHOR() -- ath11k and ath12k do not have one.
> 
> And in reality it is very rare for a given module, over time, to only have a
> single author. The git history contains the real authorship. So just for that
> reason I'd drop it.

I agree and that is the same guideline I follow for the drivers we write
downstream. I just want to make sure that we discuss it here. We may not be able
to find one single solution, but I prefer to get consistency for Qualcomm
submissions. 

---Trilok Soni

