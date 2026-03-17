Return-Path: <linux-arm-msm+bounces-98070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMgSHKXquGmMlgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 06:46:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7575F2A4146
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 06:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 10A70301AA90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 05:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A78A37FF7F;
	Tue, 17 Mar 2026 05:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WtGQDtet";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V+9EjbQs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1D237FF6D
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 05:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773726359; cv=none; b=czGA8pIJpHvsQdKOeE7Fxd2kcYXDSqgy4JtD2Yjmnr/g1Z3rbClCoamNdazMAY3qNbSzcLZHFjuc5S2+xTFxdTtD7l/MYpT1DuU2I7yq/Yebd96eKmsQG7UB9Zvn7i+cuLybkJd5M+3OMxL7sbFpN1ftLX+bHaYQqMT8pmVqcMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773726359; c=relaxed/simple;
	bh=fuf8ZoCFY1YCBeMkkCy+oHHCQUWpTjYpMz1wubaQ9T0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bl9N3mgpzGsenHDxWK8cvoQ6D1y4hlcf48jIxSJTtt20GC/+5IDvzjBcLLRCuFzHXYrjJRaSaSXzPC2+u0bhQlynFayaZx4xhaZ3RhLWTBAHwxDeLsbYsnMljokaBvLD88ZBtCiTibsnXdLgNUQ9HlfPPpZxFbWXqL+LTstC2MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WtGQDtet; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V+9EjbQs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H0jjac1533915
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 05:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w0XTODnlAcuA37oAWUbNPpILHwuiuXJ/YIB9vgNmW3Y=; b=WtGQDtetxIBH5DO4
	oprvjd4rurfoycV7jP11a6hWETdXrRE2Zzv4ly9DlfISZd5w0fpTsGFVmgYwCPGn
	233iqn2YQU6a6p5q5oEv8G2Cdz9O1uJq/moqugpxeEQj7TiW7JhHbNQhca0XJ3Gx
	ayx8BT67dmoI9niYpvtL+GtBy/4FRqhflyeRKVjrDbg5LfOMEVkZsEVyz5HYWLWh
	VxBRSXcz+Rr89bgXam51ApGsslx9AvtOglb1Iex6M5nr3GO27UMDRmvEz4UdB7MS
	5gOw3kZP6OStx2T7VrAvpd4FkaLxBzvng2sJNwZ7YkcHWr34wql0hG8LOAITZV3I
	pTDX4Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm5k2kfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 05:45:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b068299665so2135845ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 22:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773726356; x=1774331156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0XTODnlAcuA37oAWUbNPpILHwuiuXJ/YIB9vgNmW3Y=;
        b=V+9EjbQsZJ5EX+a8vVkOWT8NFIvtBdd2OuZdHXIXVWe+EoWhE18LeSp5a0s/nEOrQk
         hNq4xhmxrwxYdEWMQkVFDevth6se27+aksNAbQiwlxMbC4EedkiBFV3Uqwugf3VrVWJB
         X6mFpCH2nTmFcnuIzFLMSB7hzEYdtzq84OGkdf4OC1oPQYFPUfEaFcJjn49gGIgRNdjp
         mkfHGtWQDR2jusfrBtkZkIivH7NXlF+T43GeOPRtP661gWJHqioZ23PaP/AM6PNRcKtp
         7SgKyJiD5QFKynzFAd6udKshUf0wvF3tUQxailA3om/R32F7OszFn4KfEhNpV4P2Rp5C
         8rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773726356; x=1774331156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0XTODnlAcuA37oAWUbNPpILHwuiuXJ/YIB9vgNmW3Y=;
        b=MGSxQh1SmrEbEOhLd6Y80fmwFB/5cG2w/NQVmcJY4W/dQQwO/3vDOZRRVhFPf85HXl
         pPQmxOU9gqg6Egtq3t61+l4kcTzDPKsooh3WoLwvjmqrccBgqFPFSGTUxWCiJScV3bqt
         72RppRthkHELZkrgDLecFaQ/ZDMr7ejf3PwGnwbpvcWEGY+lW+rxXp0DWbejzj1ylPvh
         m70sFJ9kLlzzf4Qo2VfEhNH9sXu4YXDwjthAjuy2sD/7STRfEXPo+wPBjwg4K+maR/U3
         588R9q3vDcuYIK1vzar/5fZZC9G4QhaoM/0AGCzR26aj6mQs8Eyahys6I0qAtZX/dE7z
         pg3Q==
X-Gm-Message-State: AOJu0Yx48ehRfue5m9YsQtFxeokqldh1y5zb09kfQHNLpMa8Tsoq10Ts
	JSpw5mo8gMOjUOPGvsLnfrmoSLeP45AIJq60DrVU+ujC+GynVDROrmDkE+Xpxt5aJiPcOPPlg0J
	W1FMJeSCU33lhbOheZskYqhQTMIncBQl9F3CGm7vt+hlujdmXLx0I78aE/bhQCLTpA98=
X-Gm-Gg: ATEYQzz0XCi3CkKKS92fWPoWcPmU9SQKxfGEi7pGH0LKu3v8ORJFzyJyjEqQHamLYzf
	i3GMBNvYNxJ9DXJRWI+sPp+CiTCiEmnxQz74saJ/RGsEHQI6/G2l9Dt9fI1qX9RaWMZN0FSi0k9
	Q+f9mdVe/pazC9RQZXpYMr+g2fqr8HgSTLAHmB9p3lH1VFZjKTFCemYBXH0qDgl359q6mYVPHwm
	ztL8y01Y2SVb2KFwc3SYQSFRE0iITc/e8r1Sel3F/WKqn47L54aruqKmAjxXENjznK3HP78jnqa
	pnE4pS08O7jsI3gJZ+Z74GknHs6SsGetcuxH8O/RcoVDqTHopwcKl1w77DnVUeJ/r/FuEFPxGyb
	+xlTX5sykHKJi8djIDb+Bw8Vd4unRrm3b7t/dPP/pDpE3q2F69d7/p1s=
X-Received: by 2002:a17:902:d54f:b0:2ad:9421:613b with SMTP id d9443c01a7336-2aeca8ec173mr148059465ad.9.1773726355830;
        Mon, 16 Mar 2026 22:45:55 -0700 (PDT)
X-Received: by 2002:a17:902:d54f:b0:2ad:9421:613b with SMTP id d9443c01a7336-2aeca8ec173mr148059135ad.9.1773726355344;
        Mon, 16 Mar 2026 22:45:55 -0700 (PDT)
Received: from [10.219.57.130] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b048527a9bsm84863935ad.14.2026.03.16.22.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 22:45:55 -0700 (PDT)
Message-ID: <39f51659-134a-49e9-9b44-cd67cfec0dd8@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 11:15:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] soc: qcom: icc-bwmon: Update zone1_thres_count to 3
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Pushpendra Singh <pussin@qti.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
References: <20260227111051.1789439-1-pussin@qti.qualcomm.com>
 <97890f38-2b17-4591-b5fe-cc0262f944ff@kernel.org>
Content-Language: en-US
From: Pushpendra Singh <pushpendra.singh@oss.qualcomm.com>
In-Reply-To: <97890f38-2b17-4591-b5fe-cc0262f944ff@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fJ00HJae c=1 sm=1 tr=0 ts=69b8ea94 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=YKrT8vFwr-me7sy2An8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA0OCBTYWx0ZWRfXwkCfGS3+1yHg
 ViZpmGQ00eYmFkAznRSRlHf45EZACBWRTaPswofLZ1zpQTlZwCNIeE9uUEWVNGJPFOZNRQbmhrN
 wgKEA+LVox7p9CWnxSNDxmq3cfNmKyAbJ7HelnkDBnxzmjgNp1nX5K2Cw9ZERLtWPUkLSaUyhZC
 2TnOk/z7qVdAz1oH7msYd/gU7vYnL/klhN5c9I2Ro7nWSUfOc0KZegTH8+EdjY5Oj8tvywYRuco
 u/io5/R/NHyTDHDHN653INA8lsi0AF8Bad3yFm8HBbRFUl12LEBuJgHoZlpW5R/GwTn/yDQ6ye5
 /rKnYVLMQr/cQXT2vdHACF3rmopPIMOnqyQ0qRJ+ZrOUGWk/FEASb7Dv7/FWLw7m1v/YC4GPeKC
 3YIwnT84KdApYGqy4BCqC24ysi6Df+EJdo+scA2i5U22Iq0moJ5A+pdwp/AJ8lC+NyAAYfv7w0L
 K1N7KoaJffXFAp9kmBw==
X-Proofpoint-GUID: EFoXJ3M8kcZu-iX5xW82IVzUNYHZaC-1
X-Proofpoint-ORIG-GUID: EFoXJ3M8kcZu-iX5xW82IVzUNYHZaC-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170048
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98070-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[pushpendra.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7575F2A4146
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 2/28/2026 3:19 PM, Krzysztof Kozlowski wrote:
> On 27/02/2026 12:10, Pushpendra Singh wrote:
>> From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>>
>> Reduce zone1_thres_count from 16 to 3 so the driver can lower the bus
>> vote after 3 sample windows instead of waiting for 16. The previous
>> 16‑window delay (~64 ms) is too long at higher FPS workloads,
>> causing delayed decision making and measurable power regression.
>>
>> Empirical tuning showed that lower values (e.g., 2) made bwmon behavior
>> jittery, while higher values (4–6) were stable but less responsive and
>> reduced power savings. A value of 3 provided the best balance: responsive
>> enough for timely power reduction while maintaining stable bwmon
>> operation.
>>
>> Significant power savings were observed across multiple use cases when
>> reducing the threshold from 16 to 3:
>>
>> USECASE			zone1_thres_count=16     zone1_thres_count=3
>> 4K video playback	   236.15 mA                  203.15 mA
>> Sleep			    7mA			        6.9mA
>> Display (idle display)	  71.95mA			67.11mA
> Which hardware exactly? Which kernel?
>
> You keep running this on downstream, like a lot of code from Qualcomm
> and speeches on conferences, so I just don't trust the numbers.

The numbers presented were obtained on then upstream 6.6 based kernels across multiple SoCs (sc7280/sa8775p).
Also, please suggest benchmarks and other perf level measurements done when the number 16 was chosen initially,
that way we can ensure there is no regression.

Regards,
Pushpendra Singh

>
> Best regards,
> Krzysztof

