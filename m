Return-Path: <linux-arm-msm+bounces-99135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFt8HHACwWlUPgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:05:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE512EEA78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:05:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C527C3028EA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C497E38228F;
	Mon, 23 Mar 2026 09:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWeiwXAC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BAwVVeFC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7077B3859E1
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256571; cv=none; b=sZjm/y9GVNPMr0BJuNOcE215u4Dye4iYAdldojZR8qjvrTPFslYSgFJ19vX5h9kFlnzrcWlZiNcwwiWKMYkAJ7XE4PAradiUJ4i+pzHtp6/nNzafuq9oTOHvOuMl11o7qBIaTy1zt06JVYR/qjGp252+6PgxNRRlsa6oZe6XCW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256571; c=relaxed/simple;
	bh=1YEYqDf1LB1KMCb1UKjOEBsNJ1K2jABt3RfVRVuTbdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YmDUoDSUY8uP9G2qR1t4SmdBzmuKP+UQ4jDMpJlHNe/ZB5DuCpRjawFMo7ArXmqYmIhroWGQmGM8+8IIkd3unmkOX9K3zoTer4cbpW0QDtBP0hYhsLT0ayY9RjtB6cZTTrvjuvI8S+niuF3r2TFEFvETrtPfMrEWcByPpNuGixU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWeiwXAC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BAwVVeFC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N72GQd472378
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eAeKaUPxN4hdmfgJf2X5L1nebaVTTWL1hb6JyibW76k=; b=cWeiwXACJWm3/cJa
	cH3GVXDtA00MLQLRFu8yw6y1IJb9z+opemAaWOclNihMmm9rU1GVP7gHwrtJYeTj
	u0mbpyPVRU7KO8u/6imZexx4TT8/QE1FrLi/NdfkgKC1XKKeKNqiRtpKwPQZI3qy
	jZKZv/qSosKQ+sfeLquviFj50bQI6M6KBA8yAX+/srhjk3WR7KgiSm5VcSosPilj
	Kif4j8BMoBr7zJyoOMIRrid1w51SDYKzxXjRfuYrryb39kVwJtQ1avLyqjsDlWzu
	Xlti97oZpAs53/Od5fv3e4yS3ZpuZSM4qQKTfY1T7JkqJSwlfCPNdSFkEvPbCThK
	9PmneQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvmmqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:02:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso11167375ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774256568; x=1774861368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eAeKaUPxN4hdmfgJf2X5L1nebaVTTWL1hb6JyibW76k=;
        b=BAwVVeFCD/VFoupxkljkq5OduRN4wGRl/jGAZiucdaKeywo8EpcbCSOKCNW0hWyWor
         87sT7mw60OXQfCxyGVa17u+0NJsxtg1tQBKdbfAQJ66Pz2pAaSCZ4oVsPwLU/BTfLy0c
         O+rneckiDzOaPzYC+y+tJqQCZTkLbbapOmnOpPHoAKg0ykNKh8gCXusX7H+VYbLl5y3O
         9M3Ye+EW1mR70PCcLF5O2GbL7LBwwVkV1IQjlg6tLc3WqatgDxhMTeibhgRWk+Rp7t3d
         6dH2mEMRG0oCQpl+bZM1rASy5lBRlK6WLsUNBuyGL/ILdNrON6Q7AoYMNcF1URkY2yuH
         BwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256568; x=1774861368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAeKaUPxN4hdmfgJf2X5L1nebaVTTWL1hb6JyibW76k=;
        b=YYAbhZ3Sd2MLElYKAZKLbFJ9R/C9/xulXYzLuYJxymz9Nw2FglG2Ks6+Fe5lQ4opUM
         wN/3n9c4KYGEUuQrlMJYKMvMwghxueXBgoMOK2usMikHTh2s4ssTH3MGbnZr5dI35H+M
         BD1PXIL3YTaWLhrESJZxdc5NqH38c2Ak3F1e2dYl2DfrFXrM8SOn5OW67ZaQjW/5Lw24
         ojAa9LX0SQN/+fs7FM40BX36AdlAYvqcRlgTw8317fygm/hzX/YxPolS8XHBA0CJ6869
         o9PZgiKLrjXm3SPQDr9wgyMLeZAgptCKGKy+hNCV3bXQOdZwQQLzZske57xNy7Pjm0Z7
         fw7A==
X-Forwarded-Encrypted: i=1; AJvYcCW3L3bl5LwNCmPh/zhNIWgxa7CM++g5245t60VZgq0TvL8fauW4Or0E16UzRzHO597rF4SnWB4v3C1GqyNf@vger.kernel.org
X-Gm-Message-State: AOJu0YzP2q+/BKkgR4LyGa91rHOBiTOuVzN3b9JZfAUBdyd6W9LtaYpP
	kmHnIZOp3LNf/90inbyAjW/KXl7p5Qr+pjXeb+tA3JDSkd16RUPO3aAmgba7U0GCc+X1dfVUyWv
	Xxh9Jyeo4R2NS7xMg/KUiKpzrcEU+7k76W7324gTm7NNja/1VTUTimM76RY/E8ct9l+4f
X-Gm-Gg: ATEYQzx/PK92R/AiV0RZJhMlcRONBzx+pWDLp5me4w6Ju8FVp4ek1Xy0dyWpNN7Ljc/
	8QJLTB4r+COXVhUZbdOsgUJM71VefXw69zV2xuk0c+4TQbvJ2qHoYwK0IRoxpEV1cBTTrjuQCfl
	wMj65IA4D943ekokbBf/v4tLhE3J7XUnUWpNXa81MHO7N0ydbuwst75jGcRvsSKUd1531SgztoU
	+Fnoc5hYRlgFBMc5wjz6kdTXhEPVSnfFV7EoK/6SjkO8+B2eJl9/2Y9bngZstDtXhIQMDJHbrt4
	qdqsnIU18PSaz1gq7dGXVHSKvVDs2Ejdl4G/cHbEfWarVTHxtVYkiS8ZDlEbdbJuhZ06w6pw/hQ
	pic2G7ckHNRMQ6rG+HJm6P2HhY1zBlDQ54wmdHz4S67k30Cd3EKY=
X-Received: by 2002:a17:902:d4d2:b0:2b0:6a3d:36e9 with SMTP id d9443c01a7336-2b0827a93ffmr105389165ad.33.1774256568229;
        Mon, 23 Mar 2026 02:02:48 -0700 (PDT)
X-Received: by 2002:a17:902:d4d2:b0:2b0:6a3d:36e9 with SMTP id d9443c01a7336-2b0827a93ffmr105388825ad.33.1774256567730;
        Mon, 23 Mar 2026 02:02:47 -0700 (PDT)
Received: from [10.218.12.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835298acsm106071805ad.22.2026.03.23.02.02.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:02:47 -0700 (PDT)
Message-ID: <b7b19386-510e-4892-84db-09a20bca635f@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:32:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750: Enable TSENS and thermal
 zones
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aastha.pandey@oss.qualcomm.com, dipa.mantre@oss.qualcomm.com,
        Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
References: <20260313-sm8750_tsens-v1-0-250fcc3794a2@oss.qualcomm.com>
 <20260313-sm8750_tsens-v1-2-250fcc3794a2@oss.qualcomm.com>
 <c4376a88-a490-4b58-bff3-b0f4d2f731b7@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <c4376a88-a490-4b58-bff3-b0f4d2f731b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA2OSBTYWx0ZWRfX7btvl53Vw6DK
 OAp4XG7rZhPQV9qhikd8Iyl20Nbbbp7Hf3679g57gLV8CONXjx+vYA1DIon1gJFJK7rPaeICcr2
 JjktEguUZbEBZzDcUzVzjVEEHXpEyYPoIhoGgZibfepS9pHivHl7B/EYm7I+Ni2hdm6A7FVOgND
 rwUMTrNa4scsL5z7GoPaWMF34WoQ7GwK7zY+Fgzo/wxaDSzHsZ0zl4eEDYmm97v0MfuGtjjCN2l
 N2JT/JnhtoavolxX8Y7j6GSQQh8tUrCS91lMtxxHKN1IrIX9z2QocPzUU4P8kH8XsnmZp3i4+Wu
 TgnhWgLIyRWwQjs38OHwsME6QoFJ/aFRgtFjHf+FvuGvx5DSMCvNTk69J5QWPN6Io1/sytet8xW
 w4aAJmzqoltw3o4OyL9RxAR2+82144hWfDkoSBrmKs6uk+sfCHzqer8lbhMXn60C2SRN+b1VSTE
 QAc2Kvk8GE3Lf39pBmQ==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69c101b9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RYkhNht3YKPCQp1dbvQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: co7i0N9Z9Y2upX4R--BSt6HwJMOMLnt9
X-Proofpoint-GUID: co7i0N9Z9Y2upX4R--BSt6HwJMOMLnt9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230069
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99135-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DBE512EEA78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/18/2026 3:14 PM, Konrad Dybcio wrote:
> On 3/13/26 11:34 AM, Gaurav Kohli wrote:
>> From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>>
>> The sm8750 includes four TSENS instances, with a total of 47 thermal
>> sensors distributed across various locations on the SoC.
>>
>> The TSENS max/reset threshold is configured to 130°C in the hardware.
>> Enable all TSENS instances, and define the thermal zones with a hot trip
>> at 120°C and critical trip at 125°C.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		cpu-0-0-0-thermal {
>> +			thermal-sensors = <&tsens0 1>;
>> +
>> +			trips {
>> +				trip-point0 {
>> +					temperature = <120000>;
>> +					hysteresis = <5000>;
>> +					type = "hot";
>> +				};
> 
> Are we going to use these trip points for the CPUs? If not, let's only
> keep the critical ones (again, for CPUs specifically since they get
> externally throttled)

thanks Konrad, for review.
We are not using this trip points for CPUs, For Kaanapali, Dmitry 
suggested to add more warning for CPUs also, if in case some user want 
to use it. So we have added for this soc also.

https://lore.kernel.org/all/vjx3bd75zdgdh6hzhrmlv5tlarnf6ea3yklwhg7jx6momknase@kstxwngyicd3/

> 
> Konrad


