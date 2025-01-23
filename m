Return-Path: <linux-arm-msm+bounces-45971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E456A1A3EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 13:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5255B188149B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09B120E6F2;
	Thu, 23 Jan 2025 12:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHA1YmEh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666AE20DD72
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737634224; cv=none; b=Bu7XSPhTbLpE9UKv+b6wEbsyDHvue+ctnfPHUuwhJnNkPXenu56olPEllde4PBvlizXA1v7v9kekPvXeOQQ3da2yoR4t/gnUSs7eXpe3TK4wmjJEInwL3EavAs4LQdTk0XBqt+88CcQNMh24aUhadJc8GN968LQ4cERk+ffOJy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737634224; c=relaxed/simple;
	bh=PqPlSi4frXtW3bZvjBLFpkOyKgJFOtgvNw64e8T9C/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUaH4C7csfAmGPYFqW3/+qFTyuC930AXvA7c4cuox0njAHByUkVmjG6kPR1G38duZ8LNo8XK3y9pa2u7AeBhdaLQgVsAvL7L4wLzk1H1WO0o6dtfwmEtwwBR0i9tXuFpaC1WhCP7Z+UoE4tISlL08U8RIWWwmpZbHERxxJBjkCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHA1YmEh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N42ci4015216
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uP55Ur8XNMrSEcarKm2Cf3ye7hv2qjL3p+Z7nj9vdEY=; b=oHA1YmEhPyU0XY85
	NocC5dIEUO8uxUx7PyBr4KnUY7BXJ0DGE0zJzo14xwdjVxtwIAmoXt/618+0/QLS
	oIg3R8Lpyk3sNegGDPhNqsFa8iVauzGyTUK/vNUV46DOsmuZjDYE54Bx/9qlicSV
	9KXXvY4xOKHt4GKxaTqjWNQ3alqRgpjjIVkgKdfu5koBUJGM4dn/gkGDmx4QmFLM
	4QQYW6zRrP63McLOfsmjRjINCf9BnaVx/U9OQljTVXsVVHRwNdOoDJTTyjAu4bws
	rXQBL9SZFuN12uhDDX8JT1TDzRZ+0kLWy/k9gJuDgupbAUyusMSW8Jf5lj2eLaqn
	2ay7lA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bed3932d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:10:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7be6f20f0a4so15006785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 04:10:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737634221; x=1738239021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uP55Ur8XNMrSEcarKm2Cf3ye7hv2qjL3p+Z7nj9vdEY=;
        b=LbH751qavP+j8nG0NXWqb0BFNPg9rlY26yPkgte1uWO/l4jYg+nISsJSkarqDSfJYm
         yG0fmbwakaFDcXqvBshNJkYdkMojByLJNBywzeC5eZSgtKrOasMoQ9iKqjXVitjErYNn
         svHjDwDEFfDBtg1nOZurBFfgjSJxjBm+QlA6vV1KH98FGuifaJJywrifmJU5PYmQYpnE
         T8EWPkpa8aRVXVwRiMkabpG6DPqtXil7qW5jsxaplHplkAvfhMY46/UmXVgvlRzATZPW
         cbVWBud2isa4FE7oMNxf9y/VlMWIKPS7N8lARV94auW+OThQlnZTLz7S7EsdkFTa4eAL
         Pmaw==
X-Forwarded-Encrypted: i=1; AJvYcCXc7OJefC6JdTstK4FeTqMqeX9wiZKuug8NouJtp6ouFa2Bd+RXayCoJEPsowCw8dfZBpFQp+3dvA/++XA1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5hyh+JB+7Jn7Bsnd7PcIiznVeITzdcJTwu6730YBqRIbWR3rB
	lOMC55skcvVZ/DGLjFfEPLaIIk0Gv/Z5NVlVIy2XckOqvjuCt9SSKE+InxONfuiK6ZaKakA872V
	8Oxhh6HlLRrXl15xdD24/IAYPWxIdFjcMuvUUgCA6BvQ9UhL+BpPRxF7w5lwzlz4c
X-Gm-Gg: ASbGncun8Xxlqu5WAA09mlAdnZ5xKLErkMhTyxeyn77LE8bm/jI7Yuvnf+DTz4/QMps
	q+sxy4IR6vHwbFBmanROtUOBL5WuXqljxPBqvvKy/0P0oeMYEaGpCUrOHvyvl3Zjz4asYZ7u+SV
	HDsNdMYU0M7ou0GyD4LO8kQ7PmABgmzhpkNSdlgz/1F5UCHITngSHmHMb2CFPxZF7yyLQPj6KHs
	yDWibKnMqWgpZNu7BH9oPVdHFVk97zt51tLB5Crm0oA8jd44Z312eIfZ9RiwF+G7U8DOtLlHZyK
	tHTmcLl/B4UPh+oEfaVR4OEwjO2dqhH3eZ95AX22ST9rx3Ub
X-Received: by 2002:a05:620a:43a4:b0:7b6:dc4e:44a5 with SMTP id af79cd13be357-7be8b2eb172mr453178785a.5.1737634221249;
        Thu, 23 Jan 2025 04:10:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGk9QmWCMALY5NFN3zw44HFYbbJQeUjUjt/MWh7mkg0EEMEy6ztwJ9Vakkm5UujWLtVawHekg==
X-Received: by 2002:a05:620a:43a4:b0:7b6:dc4e:44a5 with SMTP id af79cd13be357-7be8b2eb172mr453176385a.5.1737634220782;
        Thu, 23 Jan 2025 04:10:20 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73670cf8sm10047392a12.19.2025.01.23.04.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 04:10:20 -0800 (PST)
Message-ID: <829b9c2e-e6a0-473d-98dc-431b36ec8137@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 13:10:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom: uefisecapp: fix efivars registration race
To: Johan Hovold <johan+linaro@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20250120151000.13870-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250120151000.13870-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FAcdPPlpojmT0glLD91Z5mk8-lKJFR8J
X-Proofpoint-ORIG-GUID: FAcdPPlpojmT0glLD91Z5mk8-lKJFR8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501230092

On 20.01.2025 4:10 PM, Johan Hovold wrote:
> Since the conversion to using the TZ allocator, the efivars service is
> registered before the memory pool has been allocated, something which
> can lead to a NULL-pointer dereference in case of a racing EFI variable
> access.
> 
> Make sure that all resources have been set up before registering the
> efivars.
> 
> Fixes: 6612103ec35a ("firmware: qcom: qseecom: convert to using the TZ allocator")
> Cc: stable@vger.kernel.org	# 6.11
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

