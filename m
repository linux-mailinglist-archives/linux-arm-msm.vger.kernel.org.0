Return-Path: <linux-arm-msm+bounces-83812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 598A3C935CA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 02:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D07C94E0ED7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 01:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5EB1DE4CD;
	Sat, 29 Nov 2025 01:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q0JZLOgg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8MrR/I1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563DA1898F8
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 01:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764379209; cv=none; b=dZWgqhW/qt7FRCALdCXTLWyUfqc9MrrlX5ZS0TXaaDJ1h3FZ1iYTfzmWVkBgwYz6esQDvsFrX4QIblOmQALizcQ7KsY6q719LY8o5dquuTJeQkiZKQRkP2G5a9Y4g4K3Zv+DcMXYtPjesm1O7Ef1AMy/PzVkqEVOlDvQ6CakyRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764379209; c=relaxed/simple;
	bh=Ax0bKmxJe1NEQv57Z4816PJlfnyEwndNe80T60/cHzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFl84qIm2pFlYtmxfy9P0viAtoxM4eVy0MmYcyOiS0fp684taWi99tZR80czxic9GPxpG0ff+AUtc2e+b54bGofkaXf4f//BssnKvZ5YR/JEYGrqdqk1Uk56+sh1XcZ1JcCmPA+N5LUmI5QNcikQ0IFPK7K86AQvnqiWvQ48ImA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q0JZLOgg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8MrR/I1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ASJ7a7O798146
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 01:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S6FM8DGduVe9gcXmmL1kbMvQ
	Mdy5V/uRwxeMZhnSy7Q=; b=Q0JZLOggTpAsdRDyZHwkFvnEYHuQ6xG1q0cocGDK
	V65ol9sK9GAmBusKBM9VJxJbFSYR9Hsau2DkHKbyVAPDHfHf+yuGd2xyoEpQZAd1
	BhTk0OiVhgIGyr3LRJM0PJutZ9eWbVXwv0f79JWPQrK2OqbD1v74Knun4OszZ8qz
	0Remr+XTSY7XzByJmcBcgXnN4EWAaX/czM/45XGQFP4gp94CJC/LRgvb+GuqAUQ9
	XqXXemuQ/T/v3lDL6d1cIarU7/RkS2a/2TXBnd4afTlzlnWQjHFOnpadXycTXOPu
	/NmKFjRmS2kamq1ranvDPXAzw0EFl6/wacnplTlstIlTQA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqhmd0g2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 01:20:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8804b991a54so68091826d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 17:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764379205; x=1764984005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S6FM8DGduVe9gcXmmL1kbMvQMdy5V/uRwxeMZhnSy7Q=;
        b=I8MrR/I1KzzKv31RXr0IXOCB8QcEZ3tSU5AxdYwNq0VnmeFzWvJwGmS8bpK0dDQyxE
         GhmB2q09obgDzCqgMDLxh8utIILW0tlixb8qgTwNGi2d9tYdO0W5QRz+FkRLM6rAGxwG
         cyejpMdRTxrQu/tYv2XBXGo3QOTp2yTnmUdld1MC8VxyZ5vupKVyXlCAilRm5aGGBrJ5
         CWBSjxDzDqfY35l4MJUrqaIjBBMiZuIWWPB6jTgjunExB1dqMUP5UaSU4IMQkUoGDvip
         lS0eLbLfD3JiFWl9KRz70PGxdALayglHLuTW5nSCZyZ9rU3wxXn7lUFmp1XMHJUPHwnL
         KBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764379205; x=1764984005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6FM8DGduVe9gcXmmL1kbMvQMdy5V/uRwxeMZhnSy7Q=;
        b=e15tkSbraNAn7Chdh2etvxk5qE8SB4/xl107p8EcndBcaeSD73g0IDKrftnGHpn49S
         pS7m203A0Lq2GygDN0IOEHK/0prLhFHrvLM//u7zofhMUmHP1ockGaPjF32cK6SymZ11
         IpQod8Q5v0MxWCEIvmzhvZ8ZGKZ9YzmjMOuLoFNGtlBZMyMVGQASgeL9SKk4BEyobRME
         esRuS/1QC8YipWUJeSe7VnBYY43xdOethTANEx9B2u/O+vkva6zqTjgLIMN3pVlnpRyd
         8I/s4Xln7fZo1a6iwqKYD4+r3hOc62KaQ5RQfel4lfo7vt5q0Krwu+cYoABVjevaJe5i
         UZQg==
X-Forwarded-Encrypted: i=1; AJvYcCWPv9boLXJ93Ta7a0UNusrfVl/kUX2MFb9tNmZR14uQYyBuWZx/hLkgU4FYcqUDcjNbnqDnixztshUqT3JQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgwr/QAUkKCfZ1izdcUv4skPke8Mzs/mawDew5yu8C5+j5oXRj
	C6h4ag5VogZBYhXS1XABI4kTLNzJ87vAfiRlffDyrc009rVZrCTbOBE8ZewS8SobK4Nf4IoOuyf
	99Mpp9K1wfVtTX+27CPl3KAGEQ9C5kep8PLcZAjVJfd9aZkK3PFyavqVhqMjqG1UJoQ8c
X-Gm-Gg: ASbGncuUWWfqMWUH55o+u7RywzeTlHE/jXdpaHj6V5iHetCcHWQRhWzFKxfcbsWnAoB
	zGviaanm9QtJXCCPcCwrbzL9B96ed9n3D31Mi8tsnA+LxsenaHBXAoic9G3+cxkeQylPx+m508J
	Y0dCR5ZcwqbXkShZszirWOtXXHHlvKqmtSbCKIRjLbbPoqrU8B09Vh2GGadQ5BZ3QrFE8TDeiEH
	fNzfr75EW3ynmRQfxlYf0OWD3Z7yLUfHtAXxPvzGa25Q5zpy9N+4yv3XGURSCeGlAyyxRnUk0K3
	dEdP7HaHgHUOQnzHXl43LoJB4cY0aamB17SF3SIZwRGRRLW55Ab+N5OPhc19AI1IgQRMnBG4245
	KefU1Y/YEG+6s43LuNW1PSG5msH0LzRdKH78NMD0dEfEyAwBa60WgYMRlz/0CJxct5az9oexdjG
	1Pfi7qSwfpE+ouNJvm+ySFLnA=
X-Received: by 2002:a05:6214:4a8e:b0:882:42e6:171a with SMTP id 6a1803df08f44-8847c4c7df7mr460885676d6.29.1764379205448;
        Fri, 28 Nov 2025 17:20:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQCfRV4KKNT89Nq6AoyFt5iIZbL4G98X03t39ylDzO1tbriXbvqs4dfgDLreAtOeCmvLQLig==
X-Received: by 2002:a05:6214:4a8e:b0:882:42e6:171a with SMTP id 6a1803df08f44-8847c4c7df7mr460885286d6.29.1764379204928;
        Fri, 28 Nov 2025 17:20:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa43f33sm1543244e87.49.2025.11.28.17.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 17:20:03 -0800 (PST)
Date: Sat, 29 Nov 2025 03:20:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] interconnect: qcom: qcs8300: enable QoS configuration
Message-ID: <leg62pf274mgzit246bx7vpzdovuni37lwl6mbb54dk3iqowmk@olbpn2fnis2b>
References: <20251128150106.13849-1-odelu.kukatla@oss.qualcomm.com>
 <20251128150106.13849-3-odelu.kukatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128150106.13849-3-odelu.kukatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAwOCBTYWx0ZWRfX/hS+nfSZOsUU
 brKhjMlq114QiRSh1KS622kJqYE9G3ojxTdvWImotIjfgWk4no/aPaFHrXyl1/KI2lh+mHLUiAE
 4SyG3+kZnUALY9I2WQW/y3LsEJ3UwB0+OxHsQ5eYADnX6tNMSniFpHkVvt4iUrR481f45lKHc1w
 jWlv9aR2fNdUDt72DrJ+cx6geAXWGdho6oMU0nOlsr2TocL/x7C6hMPqHZRL+HKsuDP5t7Nb8yG
 ndha8wE5ONaXuGttV6A6XP7/Hk8kbo9sV8uiLnatREgMZN+OYwzFIBqUeKOZfFSQ201xD5qjybF
 4XhSLFS6GLRN/3LiQTtIc2B0UXyhK+tHK9Pura+MNiC3l8k7sm0EoxA+Jf5lZb0FPpRyutmspJ5
 c8jo44FzW/1kFzIeJ2EiCaBidFZMZQ==
X-Proofpoint-GUID: 01JPDucFi5yQivizuM6Atj-m22VbkaNX
X-Authority-Analysis: v=2.4 cv=BK++bVQG c=1 sm=1 tr=0 ts=692a4a46 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=i2ZByRJmBIJE-cFrtQgA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 01JPDucFi5yQivizuM6Atj-m22VbkaNX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290008

On Fri, Nov 28, 2025 at 08:31:05PM +0530, Odelu Kukatla wrote:
> Enable QoS configuration for master ports with predefined priority
> and urgency forwarding.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/qcs8300.c | 375 ++++++++++++++++++++++++++++
>  1 file changed, 375 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

