Return-Path: <linux-arm-msm+bounces-79777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 287FBC22F63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 03:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7D7F44EB546
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 02:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBCD271A94;
	Fri, 31 Oct 2025 02:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABZHWdIM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dV9xKuNo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAE31EEA31
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761877052; cv=none; b=sUuXduVWmqioZ2kScj1l4xORSeJ/3AU411rNXVIS21HdD0PoN5bIa8uEQShbLjaidmbv7yH0iI3xMhqCXHw998vNY6y5WXzbK5Pb3bsho6Qd3WzfyT54p0NMaYaGkgW0dNTuqExVl9Yyz2xFkEote+x5iUDtmuSX2RqBZoRnaUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761877052; c=relaxed/simple;
	bh=X6s8f9B2KM9vd9HXPjufd+VkW8o9mM1aybCul0Q86rA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GRLpqOoS8cLuYlLElldEouSv3gjdKzXY2XFtgV3AnSP0qNt5Gvk+Mnl/1DE57tNPvJ3Olsspc6Pl1zPDZjfgJPQRQ6eyxL/i8hCwBhhmqB1oSh8XSPjlsr5jSrmYMCLuoDUT7YGKgngpuCTVs9N4KlxJw0IGP/nrafOdJeCU04k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABZHWdIM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dV9xKuNo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UK1uYP3281504
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RBCLi4ChvVVrxy0q6O9ni8V6jsx7gpnSYJCNKWxoIg=; b=ABZHWdIMwEH9WCTv
	zlg10GfseJClW4FG+RyWFd3BAG6pw+HZPNHegk5iAlf6xD+UHkz5Y1o19Dg2ZelG
	4e6Wa5XHoq64GSl9B4TE16tmMDDpocO0IpGm/ZwqUwoGB1wbpaOD6RK3JjEnjx5W
	NaBw7eBNy+WSCdU+DhBY8PwRJD5a8p0nmcAJdM+f2DBYV4yzhlvoPmT+DoGUO6LD
	KLzohufpdNNbMy1rHO9ih2hTgzJy31HPuF1h3mLchsSrYoZS5iJ7/Q5v5igaysD6
	qxf7XsxwDkeIBzayybEnLJiTTaAMXVtLKpPJTFAXzcpaZNNbB+ZBk3m3GnyXSuGD
	xzuq9Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a468kjccc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:17:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33bbbb41a84so3687805a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 19:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761877048; x=1762481848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0RBCLi4ChvVVrxy0q6O9ni8V6jsx7gpnSYJCNKWxoIg=;
        b=dV9xKuNo1iU/1OU0irlZYnvhSvWCFUiXwF2zZRRT6mhTdb0c0LM38IVErE6+qagQsf
         1BfEPJgJfx8NlWroeBSpvDGgWh6mImUMtNsjHdAex3ciUPJeDig8B/V4AmjmDU9oJfe6
         o4+TNRcRo3aMk54hHat5QR2gOZx2MHwuKJhT644VkEnCJTbr6/r83tp5XUppdUZU8Zeo
         gG5z3DWSDA5Jh3CGJXZ//nS2db+IWbMQV6I3GBcamvEaiTInL5/VivTceTnigH0qUYio
         Lw//uVH4io9YZ9xOvA6M8tBuJ+0chFG3zYxTOJwxUSB1/ZGOzjHONlgKLy5y1E9vqR2c
         MRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761877048; x=1762481848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0RBCLi4ChvVVrxy0q6O9ni8V6jsx7gpnSYJCNKWxoIg=;
        b=biFH6yzNuaTfSTSB6UHEW+dQyLaZdl4TxtevlRKVtUbvkEW4W8zrIXduJnIUYdQyya
         /1f/p2yxNVFYMN2dCWXKHJH1QLiscfaBJ2qYdDMSRUVQ8gA5CyVi1S5e9t8kxmY9GwRT
         x3/vlt2QwT0VVzCrUyW6sWjxu+wYgpxwgcWkCTINQ/RZLVkJ9thia1mxBpU9oT2vHZnE
         u1VU/mvU81QxM6rYwWkleF5JbHRbiiPNCQSbIwWHKupjsza0lcbQ2pDFxpsHeuDj+PDR
         XhasqGKxKUGRZfeX9/n5CB7PACmAhFOMutwrmyJrH6oZNJCFqXp6Z9k0W/hjSfVaZoAm
         PSMA==
X-Forwarded-Encrypted: i=1; AJvYcCWQW8J2QJYf1h1DG/VnvnxZcLfN6rZUE4YY8825RRZMt816HU6SMKN+EKgvbdHpxc7AXq5x1Eg4jzCi7sdt@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyzd3AcJMp1uI9ESHX1MVVHkuYa4cyjA7Ap7W/9L8u37/kSZeX
	ZvbbOGxyFbnpUeXWdLC0vSCs4GhnX/unEuzXIeP7LNid2WMO+1v5fx28aXjrYf5Qx4c8XsBIYB+
	xVep468RJrOtoA+eUGOEt6/w+jBatehnFQb97rwZ3FRthBgdK42EdMSrzS6V8fyRGvAO4
X-Gm-Gg: ASbGncvXl+vUEMXdWwMuvSHnvn4xkd0/IF9H6t6mA+gFqP9mdBHqBRuKnZE99bprgsa
	kuh9Ip8e7vH6gHPpdsVYe6wzR6uVznQBnhEbF3s9HV2myle2JJSb0UO5sv6NzgFEHnibHliXEtK
	OxErdXBP9rDbmcpQ6hIBqNpVnGvZmHde+eujN9Zm7d77jZ9VQWuUKDwyj871MGzaS+L4bebkEKF
	1W1yJjzBsuKsucFLzUcssbhIEZNVm0U1QtAJlVRfCu53ZahnV1y1UDKP+UiJQAT64M+o9pfM0kd
	6uXNzXuy8LyKgdQMmKe3TUsVy4PUfjkPdYyP+RfSIFJ9Ryqpu3JDWLiFdKgp4K7opjwAYPWhUS5
	rEEQ9Izwuo1Od+NIkXf0eEkevWmly6kkkj7QqrcbuhKDl8h7P+xlVpSWVKTXVbCoU44HNig==
X-Received: by 2002:a17:90b:2584:b0:330:6d5e:f174 with SMTP id 98e67ed59e1d1-34083055439mr2409424a91.20.1761877047815;
        Thu, 30 Oct 2025 19:17:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9falBZKVcylZWCH4G/onhKqQ9MxiOjfP8YU20DqJtlRyYGNpFe3ZpstGwO4uUqN++QHWxbQ==
X-Received: by 2002:a17:90b:2584:b0:330:6d5e:f174 with SMTP id 98e67ed59e1d1-34083055439mr2409392a91.20.1761877047286;
        Thu, 30 Oct 2025 19:17:27 -0700 (PDT)
Received: from [10.133.33.25] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3409288c8f6sm369375a91.7.2025.10.30.19.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 19:17:26 -0700 (PDT)
Message-ID: <79dd446c-0c78-4dd0-b1cf-431d3995d94f@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 10:17:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com>
 <20251028-add-support-for-camss-on-kaanapali-v4-1-7eb484c89585@oss.qualcomm.com>
 <20251030-masterful-daring-lorikeet-ae45b0@kuoka>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20251030-masterful-daring-lorikeet-ae45b0@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAxNyBTYWx0ZWRfX13uG3M6wAmL1
 4k0F2smKOrGzf1VPiIF8eGeDwNDF5xE3jkY9zX1+12K7rH+lgM0TwRhlBfhW4mHX6//5NFQS735
 AdmtDQt/QPvkaQPxg599MuYMOASBDzMAVbjHPWLvZLSL3bt7rtzS0XzhtBRxi5JxA9nCvibvMWw
 w6rDjAXmuRJcFiCPH1tWYhXkxHwkxaUVGLzEh/ijXaesXe2awtJYzK5Cea2VcMiHIL9FeG5jcYI
 MYl/NiqnwOqYb2jR0AWfdk43ddmJ8ahM77s0KcPDfV4iHcKAqhmEdngH1Jop4wMjaeSp09LBiz3
 emgitQaX/z4Hipyi6ExCE+sWXc9dR1ODuzcS4HcPXc1aQr4THFxccmnfQ/OOfgonE8xaeb/w2iu
 nwz4btPXWD+ZlFkZxJi82z9nNXlZBA==
X-Proofpoint-ORIG-GUID: 9sCAqcYvrE3TSivctxX2x9f1mEPrB2m5
X-Authority-Analysis: v=2.4 cv=LoWfC3dc c=1 sm=1 tr=0 ts=69041c38 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=D9yHQimw3Z_xc7UoUzwA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: 9sCAqcYvrE3TSivctxX2x9f1mEPrB2m5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310017

On 10/30/2025 3:12 PM, Krzysztof Kozlowski wrote:
> On Tue, Oct 28, 2025 at 10:44:10PM -0700, Hangxiang Ma wrote:
>> Add Kaanapali compatible consistent with CAMSS CCI interfaces.
>>
> 
> You are using b4 so I don't understand why you still ignore our review.
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
> 
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 
> Best regards,
> Krzysztof
> 
On 10/30/2025 8:30 PM, Andi Shyti wrote:> Hi,
> 
> On Tue, Oct 28, 2025 at 10:44:10PM -0700, Hangxiang Ma wrote:
>> Add Kaanapali compatible consistent with CAMSS CCI interfaces.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Patch 1/6 applied to i2c/i2c-host.
> 
> b4 added automatically Loic's and Krzysztof's r-b. Please, next
> time don't forget to add the reviews you got. It's also useful
> for the maintainer not to dig the mail history to figure out the
> tags you received.
> 
> Thanks,
> Andi

Thanks Krzysztof, Andi. Will add these tags by b4 tool in next revision.

---
Hangxiang


