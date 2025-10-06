Return-Path: <linux-arm-msm+bounces-76075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 776E2BBE4D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 16:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EEDF9348EDC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 14:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AD52D540D;
	Mon,  6 Oct 2025 14:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EpwVL745"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D4719E819
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 14:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759760129; cv=none; b=HPUjWRO5ceSzNVqp2fn9hMWXKzAYyWWYkTsa8IIxyf5xNkIQDsIAPik4YYjtTWDJJbEcYqVymRzNeNut8pLlVT9UL4cixCEMI7J10VUSI36tvEkt/lTX5OplQ4BSObT2LN/FVQUpL2snjEQqsPiTqjeKQFnBHl2L0K0DaIKcLsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759760129; c=relaxed/simple;
	bh=ok4AtDYMOOhFNXyAmFF74kRt5VF7Vljw8v+VdN/XZbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cq/KheGHidvRGiGITBLzYePjXES09Haa1GUu/B+YgDKnKu6/haZw5hszJjo1EfEzcGYsXQvOcq+75uHKkLzDuizcHjBXk/EW3F4u1AxPBlvC8ZGHYD/Lply1Z24uKO5md99v5TFizo3JU3HnOhntQ92cBDl3dOIyIaYavYpmeN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EpwVL745; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NxrHt020199
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 14:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2oRfqLxti2zi2W/CuLcC7pD7vVbdx7nMsq75v+U2kTk=; b=EpwVL745J2Yku7HA
	Vj3t8daPxlh5Xj+aE0q2GZDoUWUPlcJcT0fDqgmju44GXi1G2KSRSMRYhCdeb9xw
	PNTj0FLABa7LHjvI1RVyZzQViP0cIheiSW4tNykOWHhQwJu2Xso8aw+ROINwZXIy
	oqQ9a1bPcw7yd3zN2hATt2O3uFzMe32KVp4Ba3/V95+VgMvXfzJxBedX3jTrpJDu
	qoOwGsQ6T4gsvtCVOQSPafn3GLdoTQTK3QSo9KLosSvcDqKDsDAPocnLzEYZQuSP
	/NCP1Cil56jxm+1Etcj/qU7B+1pKcN0eocXwYnQ7I0lWpRO3D56w2ZWoZh8pIaIg
	JkX5Vg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7kvyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 14:15:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e015898547so9188661cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 07:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759760125; x=1760364925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oRfqLxti2zi2W/CuLcC7pD7vVbdx7nMsq75v+U2kTk=;
        b=A/LHziCXlkO5YzMnaUDHM8JJV37VnC0rMevhN7Q+A6Z3vF2ja+ETyPMbFh08arHCms
         4aO2jnjE0R+q7bE2f8paGnotJAsnV7UGiQNuB7ny956rJ0LPiSV9rNObv6MUoEiM0ge8
         4YyGbMjkKCx7tsvv6YUtFERAZQ/S+k+dEf7wm+sIavfj8W+Nok80cBhjyiyz2NreZxUB
         fhjX/pXVg1MRr0z5JImyt9BSdgqRTTKe5sX+5TYnrdezECIgcfM+y3Mx3iDH7lPqt+u7
         y8dwNxGSXPsL/rru1Gl8YnIuUOdkhCzLzBAY8ORWatW9KZv0qBOvILbqzXTj6eQKlJg+
         QHHQ==
X-Gm-Message-State: AOJu0YyJIlqFi73/DKUTAsyPTYhEW4BX+h4Zqk4y26SJzRI0UUD1tqAa
	n5CMrT4qgEeEkvY5g7QzXrpwHtn5ur+x9DmSgNIzn+z5ZzASYd1nUG5TW/cNZPeC1nL4D6hDhMb
	RjISaGeDXcAgrgRRU4v2TdXg2pz4uCt+JtyYqBFb5gcsVaJT/6jZJxcfLVaIPz6Hintve
X-Gm-Gg: ASbGncsaaOXZpLFar7s+Nk/L/Za4ydnUO6gKS/bEW/g4W8QSaIuljkUzRGotL2GH5cY
	L6sYys2N4hGboZFJvz11/HBw9hACpRLRwpWwP+pf0UDlj7oQ3bG3ovX+Qkc1ZdKb7/ggovjm5ox
	UWE4Ko3kU8qnb8UZIqDur3RG/zB+zRWiSWqQAAbfwLAPe+qxv56H+KItsSpqNS0qQ/L7Vq8cWm5
	VIB8SpWZYu6sJ1Eo9LTk6lZDxYDGl6w/Fi0H2BmJMY5PEJwTawk/SNDr5uIHs8LaPIq5phXfQhS
	bY9e5+A7jLPwOKIgMGQ+F3Qa0AufOo0giDL250TwByRQTaSNKF0rzMeWYnw5p/xUxnK3tTq1p01
	U93R57j/4cWvo4dQ/n54boVkoK90=
X-Received: by 2002:ac8:7f87:0:b0:4dd:3948:3380 with SMTP id d75a77b69052e-4e576ac46b6mr96308691cf.11.1759760125115;
        Mon, 06 Oct 2025 07:15:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwO6cT4VTIUAGRglYg90QhjFzsOQ/k7qqX61THmdRovAb2bINmuVNJNYjeOMblpYuxHE/ASw==
X-Received: by 2002:ac8:7f87:0:b0:4dd:3948:3380 with SMTP id d75a77b69052e-4e576ac46b6mr96307981cf.11.1759760124328;
        Mon, 06 Oct 2025 07:15:24 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a174a6dsm1161275266b.90.2025.10.06.07.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 07:15:23 -0700 (PDT)
Message-ID: <babe2e5e-87a4-4871-a836-ddbd9cc8d868@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 16:15:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: Correct gpio used for
 slider
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
References: <20250927-slider-correct-v1-1-fb8cc7fdcedf@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250927-slider-correct-v1-1-fb8cc7fdcedf@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfXzm5rvRKV+A8I
 n+X9XmIj7T/cHSTAzKVJ5wGZtNm6wNAKtS9S5nvHqkv1P0pMYxz7vvihzrm0rqDXpPSGMhF6+ku
 jjwiv8FTZAot4mlOgVYuQl0SIoF82RpL4Pe1sVheQCzAHxMT3CPZLVswhM2JaVEbFkNZurrGISr
 NW301Jjctb8l7MPvjemG3nPNk5231onBgP128OzHfXKgjniHfNVM9J8LXS1V913rurL+V1tcFho
 ZavAbwL4lJNB55Yv9QQZbIwEOJpEbI+vKv1lFgN/zw8+5QfFzQvDxF3qzK47HNYBuVe0sA2KOuo
 OzAR7dEo7mXY/EMD00K/TCLs21eqP9GtA6wI3OMmWdiUjbsor3Hr/rCHOxX4L/cPAsl722vJoTy
 j04Tk/fxCY7QHRjGXPWZKzA/sRS6JQ==
X-Proofpoint-ORIG-GUID: M5rAHnbyzWtDSWus5M31idk4GpSUaroc
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e3cefe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=t6YKEHOi2jImhN9rZ5cA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: M5rAHnbyzWtDSWus5M31idk4GpSUaroc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037

On 9/27/25 1:20 PM, David Heidelberg via B4 Relay wrote:
> From: Gergo Koteles <soyer@irl.hu>
> 
> The previous GPIO numbers were wrong. Update them to the correct
> ones and fix the label.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

This is currently unused, can you bundle (or squash?) this with the
"add slider" series instead?

Konrad

