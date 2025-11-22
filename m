Return-Path: <linux-arm-msm+bounces-82943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C27C7CC2A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 11:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8461A355EC6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 10:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624AA2F7AB4;
	Sat, 22 Nov 2025 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dr2tumK6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XiWcR0Xx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADADA1D79BE
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763805625; cv=none; b=cFEo0suR9u3Ly5+B4kHIvGfSYGXmtgr2FjYiAxepabSFLAp7gWrkFD4M6FkcU11UOEu4P2NDOUjrVqh/oseaO4U9IzvtOJ8LAtUrmgQnrHP/fCTIlhcJKAw1rMynyxXtSE0Eu+CElm1zDADmSVneHPqL1YvJMsj4cdbAhVfY4Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763805625; c=relaxed/simple;
	bh=vFK/fopWYKEcnzmzg2WZKqHLl202dBId2vQhix3vFbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KO1memJOYJ8D0CFJ2Vm6H9/em0Ta4YBl6JFrsDHTkFDgCfrTonw0oQjFkWc9aqEUPf+DP2admMuFsvXQQwEGZvt5lmyJjq67WyTQ62DSyE4BUdXs3TEcExTH8DLcWDFev7DhZqaqnVuapIwV6odFEGLaVXJbt+d7NcCYVDc0X40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dr2tumK6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XiWcR0Xx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM5JPBC1720580
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 10:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xuiWhSv+yQ61PQJwV+/RVVkjNi5HEs6bt1N7Kfg5jW0=; b=Dr2tumK6mU/LM+cI
	N10VUxRY7FMSqwSDAAguebDEIFy5V1BHwbw2QHTzaVOl4/b0oGIk8m/ULXAKrnto
	4dxTgFOI2QDHTheRKOUKXUWS2yeW9tOilB0uGTCp7Wvg4oNKZfvV1YjuqEqWYox6
	NJFxMIs7kY8REP427yts6Rd4ZcixCKXJiq/MKKupQn6utLD5TiRi0S7Ena3pJaoE
	rKipVB6ivI5vt4l/mROXvoWz1tFXUVQ0+M+0ghTtlOXpZi680s0meqL/B9JksGxw
	2UqDtP0hxyAbBhzbR5buTJv5K1VgofzZPQg3Y04/WludKaTH+KWhtJkN61L6+lP2
	NcDikg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak685rewg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 10:00:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297ddb3c707so25243305ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 02:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763805621; x=1764410421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xuiWhSv+yQ61PQJwV+/RVVkjNi5HEs6bt1N7Kfg5jW0=;
        b=XiWcR0XxNNGwHyEkKIDUrVdjW3i11ipmBN17qth/GHh4RoJ3xDk3K3BGzTyh9ELjsn
         VkfRCLUPK6+wXLU0ybduwgH1AFevauVfWzREBQdQ90l6dH/jXH1JNgA4+eFzWSK9C1WO
         RsfwiXHFm77hzvZCnZ9lIYQoTHfrffwxX202l8i41NOkrW+jdRObPYqDcm8PkLo67FkO
         kEObkDjINEconl1uRxLMehHMR+ZyBU+SOTqrQoSibW35Utyl2UUIXLhtbBln4Wio/mPo
         CcwaTKwNfDM0ponzp6QpnLYlHE9tNaeeIRH0YscNRt6zcXsLN/67amkFpv7/NCGDsoj5
         pr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763805621; x=1764410421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xuiWhSv+yQ61PQJwV+/RVVkjNi5HEs6bt1N7Kfg5jW0=;
        b=JWiFwEoZEaHciAmaM0tk3rkh3P0n9TP+th5ae+qMA8uAlfoq/7yEqTA1BGgiKcqUGB
         WPFatyGOpONhW3WU/A5R8eWfeOvgQ/3w4bKfdzSkbMou0+iUgmv9GsuYXGP5ntR/nObX
         mYlwIQMhKhgAN9/y4pw2WyY+i+VV2y6TE0bFRzqiUc75uJHkBbcCI78Ucza2sMIrXD26
         47f9zKWNEEmJLKCvm5RL8+zU+xU2/I7XZSx+81qxgnQNiowciFkeA7AM/+CsqVfx3W9R
         +QT+fhomRw1n4A2G00fk3SzVf/I6GYESncxEhpDU3Um6vAq8ZmLC4smDpn4f35BF3Ae5
         2GcA==
X-Forwarded-Encrypted: i=1; AJvYcCV+1Q555iXGY6rDw4sNNv86gpvh78scLe/xT2lHxMgogRQo4fudZbbQd00YQrqZLuI6j0/IE6l2dP09yzfH@vger.kernel.org
X-Gm-Message-State: AOJu0YzK228VBPYb5qnORZbAMPSRoOBQRZzZEQFek8t0LRuDvnqkNdrh
	v/ayiOpMFf+y49VTcuRUJWHqEljyEYby/rBRly3mSYn1BvXElOfDEGkUOWFxe+wkxkdix5SV05v
	y9ng66iPHme4aWRke/jXoC5pJ7DsJ+RCOlFmql/GSw7uKP3ftSaolLJcbgBhYx9embABK
X-Gm-Gg: ASbGnctihqw2zj3r8a7JUBdmkStIGj1NplMHJLy6vMM/1Tz6bkLBJTzY2qx2nyoDLU4
	jWaGKnUjZV+/a08pTpA0EKrGABL/qPXgIBjHzsyzGCyqaU/8xLrBLDsM9S2Vp9qXiS1pMxpleV0
	7TG5LYFi/CU9D1qb7ojdUQw8VqD4FA49J2sE577nOSNHAFY872EP5bmBqLnFxMkIXFKGFQ0qi/p
	Wx8W+1Kelh5ugnI0zfIlZ2Vy1Ztj0yEUW1yGA9t850lVQesII/CG8xLcR9pHwlzemZECHCvKz8h
	1+5E+aOolvtOv2h4IpjcqGKYS127VTXDLWHaC0fEq752to35vKOfOqr1GOBuOItkXX99kT3xwyF
	BwA6RpMC2X3ARW1dZBztJuicygwBWy8pkoyJ1Ew==
X-Received: by 2002:a17:902:d508:b0:295:7f3f:b943 with SMTP id d9443c01a7336-29b6bf3bce7mr76385615ad.28.1763805621348;
        Sat, 22 Nov 2025 02:00:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDEf35TVfVNEVsmLpL4nghzk513GLPSV00sS6BwfLhBbhSj/WbuA002eWMZfAjwPFPQhu8jw==
X-Received: by 2002:a17:902:d508:b0:295:7f3f:b943 with SMTP id d9443c01a7336-29b6bf3bce7mr76385145ad.28.1763805620832;
        Sat, 22 Nov 2025 02:00:20 -0800 (PST)
Received: from [192.168.0.195] ([49.204.24.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b2a155fsm79677115ad.88.2025.11.22.02.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 02:00:20 -0800 (PST)
Message-ID: <ab4bd349-9f63-4a2f-b643-414510adf8f9@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 15:30:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
 <20251121-gcc_kaanapali-v3-v3-1-89a594985a46@oss.qualcomm.com>
 <gxjidpjoc6h2rvuqpv2wjynumj6qfk6ktznte6igem5g4gt4ai@ukflachqlg3i>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <gxjidpjoc6h2rvuqpv2wjynumj6qfk6ktznte6igem5g4gt4ai@ukflachqlg3i>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Woom8Nfv c=1 sm=1 tr=0 ts=692189b6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=GH/ppe9Zt0ppH6VRuhbLmg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6HBrFCV5obpdwvJ6M5YA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: F0gySkB04z9594xBGuqY-bSePhKKpSen
X-Proofpoint-ORIG-GUID: F0gySkB04z9594xBGuqY-bSePhKKpSen
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDA3OSBTYWx0ZWRfX+sLv+KwX/YT6
 Kjkksn45igJ1AwvxRJNOVkZza7RuRtVoAYGp793bYL+w9Dtu7BDQONnw44jQZKLL1SiVHz2PPx2
 3XRJ4yN2fb/2Ncfxwvv/7srD6jbX/0EC9kEMgUTTOduaKuyAGIYJkonNkDqdm4HXLjOnPiwAeqI
 q5I99qtBZMLxr5d4uST6hql58K7/fI/FEmiVhI5XFL9hy6THPc0pE+2mlJvcqkw6/5SL59l460m
 SvQJJKAbce/VsProIZ+3PEo8WrOeD+2btWtBP3hM6eFcrT1WcJIbx3XzhJG9dJ7YOU3TmbnGw3Y
 +if8m4RcNUnhIo4O5uJER993lY3A0N65XcUZXHmCkeyispHPSTcmKnzZSxx3AlLA7wLBAXwRHFu
 BvOR0/nWH6Z6RUYSU45mVAnMRogLXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220079



On 11/22/2025 2:10 AM, Dmitry Baryshkov wrote:
> On Fri, Nov 21, 2025 at 11:26:27PM +0530, Taniya Das wrote:
>> Add the RPMH clocks present in Kaanapali SoC.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/clk-rpmh.c | 41 +++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
>> index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..c3d923a829f16f5a73ea148aca231a0d61d3396d 100644
>> --- a/drivers/clk/qcom/clk-rpmh.c
>> +++ b/drivers/clk/qcom/clk-rpmh.c
>> @@ -395,6 +395,18 @@ DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
>>  DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
>>  DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
>>  
>> +DEFINE_CLK_RPMH_VRM(clk1, _a1_e0, "C1A_E0", 1);
>> +DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);
> 
> This got better, but not enough. Why do we have now clk[12]_a1_e0, but
> clk[3458]_a, describing the same kind of resources?

I am going to fix those as Dmitry.

>> +
>> +DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
>> +DEFINE_CLK_RPMH_VRM(clk4, _a2_e0, "C4A_E0", 2);
>> +DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
>> +DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
>> +DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
>> +DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
>> +
>> +DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
>> +
>>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
>>  DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
>>  DEFINE_CLK_RPMH_BCM(ipa, "IP0");
> 

-- 
Thanks,
Taniya Das


