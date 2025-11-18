Return-Path: <linux-arm-msm+bounces-82299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 365BAC6966C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2F32A354B21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 12:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF3A306B33;
	Tue, 18 Nov 2025 12:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KwRRu+MC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xcsqcgkw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91A3A937
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763469210; cv=none; b=ZlC73sWL5lHTokJFqICyIJnRbVVmpyDnuyfqlpz3yUNbhDko49UhS9ug1Ewm3q5v49ZCNkRQLmjGBxiZsxBNINJN7PxHBiwdFFPENBSTMs10Uaz9nnKSHclu8cReUBuePu3yajq6Ljew27HTse7dY+TC3yZ/wKkC8EUncGuZI58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763469210; c=relaxed/simple;
	bh=yJJ6IeTtTpFGE1AGu9hntqLU7SpeHDHsbDpHfu2Ayao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KzaNmyTTtD4R26GHh7OPrcRQpwFx6HrQ30cwx0zZT2G7t3YAShWkKvU277Y6yybsOszsOQN40ISWo4ptwWAbT9ciB05SO/8QAATbRIKA3598hJVYwn3ZPUdfQjgEsFMyfJoSSHe50SCQDj9Gpjd/rHqc8rahCPn27owLkVz/+fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KwRRu+MC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xcsqcgkw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6fSP52272088
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xWH61jHILhuuM/eqN9zZnCfpTwI2FbUKKoAu6Ut/IXg=; b=KwRRu+MCgOwJ74KV
	IByhtwyp+OmF+NIBMsdfaKXEwLINLdNDBc9uP8PHmzmN6nLD23Gp+Te+umlxSy5W
	D54l/pGPqxwaYZbNgWBq/PYy9Kc7nS5lt1ZFcIJNEhxJtDQPaiUT7GUKcaLu4k1k
	PHBRFAZ+Qs6rBcqY52VBEU/jq2Ceah/+JDHXqzV5ImIm2JUf0Trl0kOTv2SPlc9P
	3eDWW7niR427sTkCU6w3WjCOu2mgZr9W8CVZY4ERG5/uT0nteGIfe7Iqm9LiJeKX
	TzFl2cpMScntfOXXJRhPc9wgUC960x/MAi4raLq2uBfb+SCTlUj2xpSdMHy+tbs3
	PYNYtQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrmh0g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:33:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edace8bc76so15477241cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763469207; x=1764074007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xWH61jHILhuuM/eqN9zZnCfpTwI2FbUKKoAu6Ut/IXg=;
        b=XcsqcgkwfvDU1pPambeuwzftbKoQhnx7s7zEMdJ5vZgRwe7/h30iaGbrxHZ9lkf51n
         WgfwCY60n3l1F2fYnUoYqsUR++QMv94ql3h0tJ7KQnGxcyB1Uw0/E5BV7afTsns76c8n
         4LE1ZlEClvV4zHjhi8JrE/Dz10xI78Q35MpEIfCzdVSu7qRY3Fl8r4ANID49fZUFwRJg
         lMnA0ZIWijktJNmkpaSsLgiiwXkLzXjUmChs380ThtGnZgtvuHTJf7I03wmLczYy0ZoG
         8Kui64mzTrduMARLB8se46MXUgtYxWxz8Mby4kNyyg7XSflW9GUgEBLdnyfXaYbQiZwQ
         SpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763469207; x=1764074007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWH61jHILhuuM/eqN9zZnCfpTwI2FbUKKoAu6Ut/IXg=;
        b=ARvXrjPZsSjt27Al0A+huWgzwjcZMRlbQTuqNsXYrzQYO7WDBvuSM2mX752hByNmxZ
         8Y3lX9/Pfn1O7ikVs+MWSCaqO0v6bp7/AUdWd9Y5hVX794rVH3aZEpYJ4LQJCUXCCvi8
         QzbtRdu8jrsIkg7T9n6Xgjm349NCIRSjOqlHrOBzZiCbwtIRuU3cGb0IlqWxny8DXdRe
         M1x0dpmng2iWO7XNVl0+3MFplw6sFm0W2WkFB0JgKOCAB/3cjNe9ltkFASDH2S7eikGK
         YkL+TIM5xp20J3e3vXSmSxTIdtO+9vR1KacSsLPeNh0UmuzHi/ZTCsEKWzAcD4digT3B
         lB4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJfuCDK48HxpOFwdGetBxxzk9Lp102m4famqxf5Unh0Iq5BhvYWsc+yoLbZFNp03XUoCsNR6UwHBx0RF1A@vger.kernel.org
X-Gm-Message-State: AOJu0YwiTdT52NW1/lgEyxQWmi/dIBrnvpZDnvbJ/XJWe4TE6RTB/PIY
	QpxyQNx67VxVCTX6VHUI9+XX4bxkMUWSlwgNYvUmGCc53ToETnxUwnpZRxB4ZQEiHRW+dFwL86B
	NC7vaUGBUsHCVub2GyxVR5ev8JFuiOLTI+o9IYWADeF/009thrkXRv1CcDJda7dNNM4pu
X-Gm-Gg: ASbGncvQMhCPFkb10Pwr2iszGSPp8O470AuNo6LGoVg1aERptwKZI2CinO2+tGyzpmW
	jD7Y6FnZD9co0aBRlXjDIBDg68ZCFK1EFD+8hORE90thP71V3tbGOnkevBh8WUAuZDEtcfinv7U
	7fnLnHSrXVyuZorlR594skXhroV0xUgXReMneJA88+BDvgLEvOEm0mTb2U8BuGD5b3NbuC0lNaq
	fXQNpfIBT0IVlk2SRzdlmlQVt7Y6kt0CT3Y9Mzy1f3Xpy9cJPWx1e1wm97Qlfui8pzoywGv9Rhw
	EPKKeVZoeZemKhCGHP3kken1sEUB06xoCW+DVWmuQvWNdqvUB68nWXqbSfYB4Acv874X5PR/35x
	3qrz9e1vxcoXOArj9pKOj2lrNwcNSbOOLo0AnTCdXmprYMzmydvIdcxP+AaCYwRgvj1E=
X-Received: by 2002:ac8:7d50:0:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4ee313fa866mr24770501cf.3.1763469207018;
        Tue, 18 Nov 2025 04:33:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFB8OaN3tmFzcOE29+YjSKwC8Jq3pDXXlW1BguEgp3kVHDiSSO5K52l1zjqF4g8J3kaErlFaQ==
X-Received: by 2002:ac8:7d50:0:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4ee313fa866mr24770151cf.3.1763469206515;
        Tue, 18 Nov 2025 04:33:26 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734ff75e4fsm1345957566b.12.2025.11.18.04.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 04:33:26 -0800 (PST)
Message-ID: <715ea6b0-a8d7-4ecf-b0c7-f4469c94b969@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:33:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] dt-bindings: panel: sw43408: adjust to reflect the
 DDIC and panel used
To: "Rob Herring (Arm)" <robh@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Casey Connolly <casey.connolly@linaro.org>,
        linux-arm-msm@vger.kernel.org, phodina@protonmail.com,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-2-317a2b400d8a@ixit.cz>
 <176346899005.2610273.2055455026150162691.robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <176346899005.2610273.2055455026150162691.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEwMCBTYWx0ZWRfX9fbaLkHbYkgO
 BnbooGRVnoXw8FK2GJXnYjZyckQYO/Z39IVDj1eZ2Q504VOnpSHTRfb7YpnszD9EG8WJUhI1mp0
 pQG00UAIS6jPgI2Zv8V0x7bnWXPHwqAdtPpU+cIwRp8+tPMoUaEMjv8t28s56Rlh0CtrKb6sqwO
 XJ50qmc4oDKQjY/ORZ+99RbbSsf4O3Xupwa6H+vHS3JmxirEm0k9hRk170BSzl9OHiCl8QdJzn0
 O1uqfUgUmYzTHOK3uaAs3o4bt00MGNf+vWhZJA3geCQVjU4S0Q3GBhJoJYPyQm30nLNv15Innbc
 PYy6nTpHWpcxC+HW5NwbFUfHq2EB3vei+TX5mpD71cVevzw/bsjz6ULuZrzmgazOc2dx35Pqwf3
 +zawW9jw1eDm9cSrSWr4ziINojDjaw==
X-Proofpoint-ORIG-GUID: FquB0aNpOFIMkqC-zGeDflgAN73MZndL
X-Proofpoint-GUID: FquB0aNpOFIMkqC-zGeDflgAN73MZndL
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=691c6797 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180100

On 11/18/25 1:29 PM, Rob Herring (Arm) wrote:
> 
> On Tue, 18 Nov 2025 12:30:37 +0100, David Heidelberg wrote:
>> Add compatible for used LG panel.
>> SW43408 is not panel, but DDIC. The panel itself is the
>> LG LH546WF1-ED01, so introduce combined compatible for it.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>  .../devicetree/bindings/display/panel/lg,sw43408.yaml         | 11 ++++++++---
>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/lg,sw43408.example.dtb: panel@0 (lg,sw43408): compatible:0: 'lg,sw43408' is not one of ['lg,sw43408-lh546wf1-ed01']
> 	from schema $id: http://devicetree.org/schemas/display/panel/lg,sw43408.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/lg,sw43408.example.dtb: panel@0 (lg,sw43408): compatible: ['lg,sw43408'] is too short

You got this error because you didn't fix the example DT (which would be
validated with `make dt_binding_check`

Konrad

