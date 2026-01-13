Return-Path: <linux-arm-msm+bounces-88726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A817D179C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65E84309D0C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1581E38170D;
	Tue, 13 Jan 2026 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRW2bO/8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A9qASAvw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACD733FE2B
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296078; cv=none; b=JZ4ZkHtf+Z1WDF7U3VZIxt9fa9rv5tP86HNRDQJxgg3NY2QvwKLrH6hF7qaiS2TOdQ9AndiacmDHjJBvEYo+fwgw5Z3HEyyulNiEzsvw5QE20WB9q2/Zc5w4Std6iul99VpZCoB78X6S4HVrZJWYy+dKgcRo2qiO6CI/sHLOoyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296078; c=relaxed/simple;
	bh=Rlr7mwtBcyRz8AkxKQslsvs/sH2b9falE/D2Iy0kM+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhFSFIdF33BcT7zBWPCrFzA5PEns/22XCRcyMbOxMkAsqa3hbM/tQsTHtmdYGDsy9PTdeEYGEpzI5jx9sjECdVEYGrsApQPy6VatjaG96hDWr+vj2xDJpnHFE1UxbxjuteL7VyMFoJQ/O3go2pBvXXsdtcFkSFFcE8oMeVxf+NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRW2bO/8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A9qASAvw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5nRoo3735049
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31iZECsNCqRxKyUF60JhJXKKA5LmDwD9E8aM+9WSyhw=; b=dRW2bO/8s05UmtjR
	OYxMOjjRBu6n7jyCQG9i01cM3IpVTtmbwGOpGM48h3TDAXOoCV/SM75zNhBnUIDG
	umESGNQc8aiPzoXl8TSEQOcQV4Tn4Z+ShGffjKbV+Qywi/BEACAU27mwh+5CLR68
	VsPq28xd601r6BMC9DTf478YxsiLqm7jW+j6iymjuKya0//hNuGaBYrfFzyTBEZy
	LzaS5bL8I61p2RvxMxXMIBqey3Fsukc21kdItvb6rX8zRhn5h3B1ZAnsOTjckU5H
	4TSahgKEaZ7mY9aKwBgBwMXX/GIkJTqRfYdDZttX8B9iia3KdmrL5ZpSXwWDejnS
	FEOzAw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng878kyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:21:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8887c61412bso19260246d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768296062; x=1768900862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=31iZECsNCqRxKyUF60JhJXKKA5LmDwD9E8aM+9WSyhw=;
        b=A9qASAvwAog5Oza0MRI6YJhAlHQJwbCvNMhN/yY3BNS/fmKTJLFG/EhyYaITT+gYx8
         VCaNGnJgKOf3KELFQ7RJJIlVaEtcopFzPehbjTFghOjjh1zeKM4m5x8LNVSzS6WkYfLA
         ukF3rrBMqT1S42SCIoU31rOoBNhS1zWPqhBxrCdc58Il6ziaX5K/QAdyJwPk3L/s+xZX
         rrn3WCn8rITCbzTHO7qONTf0wNeHINpK2OnfTKj/hYhcTgkkAcCpwdg6mpCCQOsMIMzD
         xoNLCC+NrMyEbHvQMLGjE4KfdJI6t5wzx/mArqwZwQW1u7iSAvv3RRUsKEVZPXxXcbi0
         Ofbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296062; x=1768900862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31iZECsNCqRxKyUF60JhJXKKA5LmDwD9E8aM+9WSyhw=;
        b=X56j/6UXvqWCjMr53xOD2U0UioTRTHgE96A6AJsRPehBzHhv+udND0QBJYGPEl5rpm
         eX0VV3Su0KkkJnhbcx43Xqo+6F14LU+RzR78e2hFXDdTWp9uF703NWkwPPEH+ZTCQkaN
         9IMq3e/bZ2dFj3i2QSy3Ul11TQYQ5pf1/+kL+LcwQrjt/UnOrw2KnYKrTqY4lWOevbMJ
         bDZawKxzKjk7YWd5a1Cpt1gBnxVfZ99EcyD3yFl4CG5L/x+9YkCiIq/iAUCGTLG2EGfr
         yqWhW56kgbO8GxXUUtQY3Qx2Uh1igOkrqkMMuQ5+6QBHxOwpXhUB24A+niSMMzn9hgpU
         +Lqg==
X-Forwarded-Encrypted: i=1; AJvYcCWMJUyXZ1jpr6JfvN2I1FaaWXtd0PiC5TNE6oNVVAwSvPUj12u5N1ZOd2pi4g8Z9vHNLzw4WoCSyJsdn+ua@vger.kernel.org
X-Gm-Message-State: AOJu0YyH4ZvpLc9nITG7w2Nxpo7Fl6DVLx0lhncQFNUC8EAavJLlqwrC
	vAf8cnczuZD92yYXBPkNP9QUSZCqJOzJjYqzoSMfPiSZmaWCMwnVhwCV17Q5COzt20sCuxKmAGy
	jmUKXDadnIdIdcwfd+/NeYCUKcvDnWj2dJPh1XWUd1zyfhe9xzHiZRiHdFiHwfH9VxZQy
X-Gm-Gg: AY/fxX706tD+Dxkhnkc3LFtyTk8d+eyOIZdUYamPx3vMiP0kH1yZN0lLgD31sIlUWS3
	8AqpzkONqwR/2adIMGTOEvBJ5WqnplIH2urFkQyam2nILVKyhvJZrNkuqFVgWB1TaEo4Wil5kIY
	j/D3r8azhaofEaVFQW4iQHJG2HSRoaeoKhColZsGp1JsiBOJmRyJ6lNyiKN76ynCOufHPwn3kIs
	Bsn3ePepjGXUBit6IkktrPE5E1cNCRa5ociC121XBsBgsir1cBgRLcOgTxX6iHlatOlkD70LXbl
	p7g7jubzWq1lD+3XCgM9G8kzyetN/+DqtvRWMxw6RYY6vFl+dooHKpU/lp6hXQ2FrEJISDUS+vn
	0hEnNPNb5DO8C8KIveslXdYMbtzxkh9zgHnb3ew/hn9CKCuXdDErMZxVKjTTbv0ZRBs4=
X-Received: by 2002:a05:620a:40c2:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c3893a11a8mr2125837085a.5.1768296061982;
        Tue, 13 Jan 2026 01:21:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4OnuSeA6QbV367W40dl4Ix9iFHMALktInIMXZY6erSj9Muhf4uN+sZ1f+zqQ5eVe104M4Vg==
X-Received: by 2002:a05:620a:40c2:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c3893a11a8mr2125835185a.5.1768296061436;
        Tue, 13 Jan 2026 01:21:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c4479sm19863659a12.1.2026.01.13.01.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:21:00 -0800 (PST)
Message-ID: <cca646c3-5e74-47cf-9dfa-49a888db0414@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 10:20:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Enable download mode register
 write
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260112151725.2308971-1-mukesh.ojha@oss.qualcomm.com>
 <433fc01b-0e59-49bf-afdc-a23e815cc563@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <433fc01b-0e59-49bf-afdc-a23e815cc563@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3OCBTYWx0ZWRfX2K+WEc8yM3C8
 Xg8MuKYbunoMLtMjPDcCe2URZZOEllhtM9bzwXPSzDZoY3P3oGPkHOOarthZnpcRU9rLNfXvdXK
 2E23Iw/uE+tEjROOYAuBFjHPI9oZspniARSSHsxJI0g2Qt6qOP8L7lraGLcEjlClrsjtTKtWgji
 pNKMLHYitwjOFN7vhtK6oLPQYfenLHK5fnv07ha8hQhskAG8E4ueSoxyLW+GL2qMQK3h6/sBa66
 ejwxO6apU8/1jfZ9+KF9Z/VetojHRIGc+4QEGTO5x8jvRhgfv5kWW6UPao9EeNwMBUEo2V4KQyF
 Xbf7mSaUw9F30BjPNNwhD9g7Jh/91UBjQY3erpiU5zUY5id3B+RK3LOvXGhq/2INWmqWGWugkds
 3rNg2+lrK9sZeHFD5IPN18w1Lt7MwWX62dgpw/zX3O3pwTJxqh7eSmlcKkUyeMYrYv/FpcH2iO1
 Jo9uaYZBbRNBZ400eFA==
X-Proofpoint-ORIG-GUID: wm5c077TNN66DCYVKQ1iaoTKD2ziZJQU
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=69660e7e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_yhzRq-LgXqgePbigCEA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: wm5c077TNN66DCYVKQ1iaoTKD2ziZJQU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130078

On 1/13/26 10:16 AM, Konrad Dybcio wrote:
> On 1/12/26 4:17 PM, Mukesh Ojha wrote:
>> Enable download mode setting for sm8750 which can help collect
>> ramdump for this SoC.
>>
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Actually no, we have a mess to undo..

There's already this node:

tcsrcc: clock-controller@f204008 {
        compatible = "qcom,sm8750-tcsr", "syscon";
        reg = <0x0 0x0f204008 0x0 0x3004>;

        clocks = <&rpmhcc RPMH_CXO_CLK>;

        #clock-cells = <1>;
        #reset-cells = <1>;
};

That's located at the rear end of TLMM (someone had a funny idea to
move registers around when designing this specific SoC)

Problem is, those registers aren't actually "TCSRCC", not even "TCSR"
Physically, they belong to the TLMM register window (which starts at
the base it promises under the TLMM node today and is 0xf0_0000-long.

What we should have done for a fairer representation is make TLMM a
clock provider on this specific platform

qcom,sm8750-tcsr binds the tcsrcc driver, so we can't describe the
actual TCSR (as in this patch).. we'll have to break something..

Konrad

