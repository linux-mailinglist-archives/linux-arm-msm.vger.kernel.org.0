Return-Path: <linux-arm-msm+bounces-89194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B63D23B38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0D77317D1C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE7432E739;
	Thu, 15 Jan 2026 09:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OhnnM2dq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GHNHs6H7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56103346BC
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768470156; cv=none; b=M8B5+wsiyYBb1yjM62zB75gUrOJgwAVPseHsdimKpwq1DUKAyk/RlVaxrhpYB5zjq0LIeATAK1yp5vzpLqwB6uHrE9CfhmIl+IoQo14AlT1VcUGijSj0MJ5eD41anlASldZwfvb9xOQ//8rzoErqoXGKMVaqM2h6o5qYi2Q4ghM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768470156; c=relaxed/simple;
	bh=88EB0eEeZGB96ve0t+oLaA0+MPKwiJfMnc2a77jQVVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VglKRH/LEtH8Do2knlDzX2mteMyvVB0rMbUXFzzNshQnymm/D/K7EjqB9zYFl5EhgV+04w6zd0J6Kn9uMxtXWElJZfFj0Ad1QfTG52vZKjGhnQeehrKrN3Xdx0B7a6EEYxhzYRec7Lhfin2Sa89/EoI9zfbuLSdvnXMM563hyGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OhnnM2dq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GHNHs6H7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fw0Q1991673
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J0OOfu6f5Nk1cXvMYkdgiKPZusVb1yTTCdfQuLtoapU=; b=OhnnM2dqLL9vYjc2
	7N5rMoLad0asDbhs3eE8WvkeJOpDHI651W6tHUoBvpaufP3SFKYEgcNo+qzhFNrv
	It4js1yGN3QjFuscnhP/rbMRqEtNqNNU52gGOQfyOdExum+rJtiVW5AKfQnJ8gof
	8eVIogfBS4W6NYE9rlSA68M6P/ykj9NRCTezXwL57d73HW1ATey5T5Oeens8imoy
	xYWTmXKZXAOjh3j/MzGvlfmg23s4YbfnynHyBXrMavT5s/a/WapK3aqTYpq+X1Ay
	C/FL0eXY3+K3sUjL3jelaoQWRqhhTdyZJrx9I5+xX/LJGCIwZGS7xfLf4uEEHQvI
	5Wi58A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbuen1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:42:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52f07fbd0so318502785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768470153; x=1769074953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J0OOfu6f5Nk1cXvMYkdgiKPZusVb1yTTCdfQuLtoapU=;
        b=GHNHs6H7c10YM8geW1mtzrOJbIcxlt5VTk2NYjfHOeu8uinfMwEgYOKFALShKfeHAG
         qahkmP1enUsr7BZUF0skXlswj87T4W9hT8SNgydR90vF5FNoDjjCgNPIA2mh6vkLtOaJ
         6OG5GbS6aibIW8VgG+kZEzXKH9GB4rgUWbRG86e5GjmKDh3PMCl5zoSjGUwRKG4cBXTt
         HMt6cY1HPtWFycFvzzbhbSlrq9z0wc6/srgcJQ5Fhnx+idyBV4+HghFivcMJjRN70Lpt
         c7iSKsBIDaYEfLoh0ygEQh1omxUVmqmbsFWwwrW/3P7DXMOvT5HcbMsQzftOzzytNXSG
         TwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768470153; x=1769074953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0OOfu6f5Nk1cXvMYkdgiKPZusVb1yTTCdfQuLtoapU=;
        b=QUpEPrEEgmGErvjRzHVxbu4IcJ/7IY3zuYE4hPo4f9wAFq2lGdbvNIOTPEQxX6fBbv
         0PDE1ONRrvU6zjz8qTLLkQbyRthXob5DpfqKnJqyyTNfQ5+Rxqpjr3esVWxzlCPJmqKB
         IOnyp9Zl4NmlhTSCrHFqczPkJJLxja/iQ9OWfniOoGGm+w6F8sAlCpUOydRD4e6Z5ccJ
         yTWHKqX+ENw3DTDV/Tq8A7aHfbSIGBLwPaTb8r9CnNeWuaz9uEPuaWgIVXudqDbNUrx2
         5+EX0ZLa5yz5KKVExdwxPfyjlDZA3HqpbkneTEIZ5csFecyubO6u1n8p5CA5/kReumjE
         59vQ==
X-Gm-Message-State: AOJu0YwxPUIbd8RPytKQN92FBR0II5U2yaGGD2URr0Y0nF521N8ykb9/
	N1ciq9HUjcZNVbrt1DaVqR4rP3A8b2lqkUOppp5qjBV9Vsc8TkvZxBnSzOIGsQdPjhXl9f2UoQ/
	jdZwPScV3HZ8g7FYOVYNUmqeKiTXEij6hMGD4f5PDIhjJlEp9LuDiCkJd0s5tfa2jpDhT
X-Gm-Gg: AY/fxX751zGUA47jLLpN1/FBQRJyfFmjG6713V1ridDOn9TQvf9J/PbpnPuTjGc0p1n
	bDIIEJiB6Bie2flSApxj9h5qZ+noUiOI4c0Tu9zRr1XObDPdI4WyzbSpDLtcAEQ/Am+cNshiD7+
	2y70xU6rqzzfhFS2rOnaSNieIGkNRbkrgX2TJL65kNi0yvkS7K5+bTisATDy1n+3yaVOEleKqn0
	PJLpLzHvkkxkPJyXatSGq0JUDsH/NfsaOKWHXeVG7mdLiZqr3vQDT4ONsV+kJxmbFZzoB/4/JSQ
	B3C3WQdIDs+z+B47QxJfWJY+hCDg9YOF+EE0LNfYcPLDsZZmTYxwQdxm3BHiJtQ0vbNDaZ1LOFR
	c3BmAxkITFeB6wB2nFyZIir83fv0WUbFXx4wJq3D3z38AWUlv411T0gfBT5jQ1aTYlGBrWyXrgo
	E9za/f
X-Received: by 2002:a05:620a:4082:b0:8bb:7e56:f204 with SMTP id af79cd13be357-8c52fb56c2dmr804140085a.20.1768470152969;
        Thu, 15 Jan 2026 01:42:32 -0800 (PST)
X-Received: by 2002:a05:620a:4082:b0:8bb:7e56:f204 with SMTP id af79cd13be357-8c52fb56c2dmr804137285a.20.1768470152423;
        Thu, 15 Jan 2026 01:42:32 -0800 (PST)
Received: from [192.168.1.188] (87-92-245-163.rev.dnainternet.fi. [87.92.245.163])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6541209cd87sm1963901a12.35.2026.01.15.01.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 01:42:31 -0800 (PST)
Message-ID: <22a3ab11-9151-41cf-a0f2-8509abbd3d27@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 11:42:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] drm/msm/dp: Drop EV_USER_NOTIFICATION
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-5-08e2f3bcd2e0@oss.qualcomm.com>
 <17990836-4278-4c5b-afa4-eb631930ba2a@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <17990836-4278-4c5b-afa4-eb631930ba2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=6968b689 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3lO4ytp0PBcW_CA4VZMA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: P7FDh_dsS0fPN8TMvny84txMT4evDuNN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NiBTYWx0ZWRfXwhD24lXgsNvY
 w2UisuXoqC49xvQcBRhqvSvYmcYoV6gkFcGIJ+I+TAt62ZPyEIquXNyd6k2cEud7uoLzS8M73/J
 k7T/k7K0cJ1xejGNz6D0BA1Lbhnbeixr35fAN6CUahI93tqHY+Ix9EzFVF9e6NXgYQRAPrgHuuE
 6vGCIS4g31eXFZ85tPWYBIGyHkrks4XFGQu1L8iMEcqu6DvDvhJEDQME1EkWLfvd6fk5ns3CREz
 yh2VJgaLLRcm+wPlhpQKlhR63IKTMnW81iovoNjghGAZROqa2M/5cpbFfVx6rktzCxVQVH0qD/L
 u54jTTs8Xl+YWIowU9KZOqd7pp5nP+JtIAUcBkgTarQAsfrI/R0DjdfAyP9Se3U95MI2UB4Bj/r
 u7kC2yfnvuTn0tqMuwYhCGYVYuPM/KKQ7rQgppxS/goXRSHPpAQ6IZN1+QchpqEruGQTZO9pbpa
 dyN+tUgB2Q9IUakf5qw==
X-Proofpoint-GUID: P7FDh_dsS0fPN8TMvny84txMT4evDuNN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150066



On 15/01/2026 11:41, Konrad Dybcio wrote:
> On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
>> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>
>> Currently, we queue an event for signalling HPD connect/disconnect. This
>> can mean a delay in plug/unplug handling and notifying DRM core when a
>> hotplug happens.
>>
>> Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
>> handling.
> 
> IIUC, the drm_helper_hpd_irq_event() -> drm_bridge_hpd_notify() change
> also prevents us from checking *all* connectors if we get *any* HPD?

_unnecessarily_ checking all connectors if we know that HPD was here.

-- 
With best wishes
Dmitry


