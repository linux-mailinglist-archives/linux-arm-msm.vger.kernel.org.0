Return-Path: <linux-arm-msm+bounces-55736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8B5A9D157
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EEC93B288E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9740F217703;
	Fri, 25 Apr 2025 19:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VNgo4nb8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317A22D78A
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745608716; cv=none; b=fRYTvJUfqcWrxgnJC8KgOJQNXdlsGVZpZeTAM+trSL3KJw+UNegOXPmgbWceieJVCshs3wMz1gPzlAO5V6vnfs1zRRQqJlSFRsxbZbzCl3hFSyQJk44sGQ5Lx6Hb6AC07Hp8deGXog8b7WWeRzWM3c8xX4kBmW6vN+D/qg9l7Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745608716; c=relaxed/simple;
	bh=Zq5HVs6vQhexcjE3fPRZ53qXEqzpzPviTM8D/fiSMDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CVqrsaLkeTug3XoUu/7ziP4oVijd1dYsdMd5F9NgAQzx/QXYS/XlfoVu6OadEeRdikSh8nKD1kE3xX/9LEn/alXQ2m7vJU5otZWqy1SOwzFvl8UujxogzxtpxMGpnsgIq+y3MnkUIFNNLcY72VeJN7XvaxgHPc8RXUX1KKPnbbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VNgo4nb8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrxc011050
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s3eNxSzn8WLQ5vov8QNKQghOX59luaz++bJDtJ+81gU=; b=VNgo4nb8CDcDfhTY
	4K4KLR0PWIpB39pbhe8TggobGr0VpZVNhIUCNiHQnKTPwxB3Y/cSucHlBir3HKkl
	/vrDDu2FI8oIrOTGGmpeVIJWnFx3pDjl/OFRWypFElM/lHRseghVI+tE9HKRYqDu
	KIZy8B7zgyqxNQkxHBluTNnG0lhwg3Y/XTi/h1KPVPrrpsuhmhqicjKUO3lmnmKm
	yF1shlhqVVV7jVwoJ1Gk+F2+m9iinf40f/pHPb3b720Ymiz5bbMXaduKXk4VsZry
	QLMh8OOJHAFUrYN+PDYOMUxVATdPjTHnGwvpNOx1KnZcKAeBKOE33YPeewolRxG2
	2wKNsA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0j8a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:18:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5560e0893so9820985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745608713; x=1746213513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s3eNxSzn8WLQ5vov8QNKQghOX59luaz++bJDtJ+81gU=;
        b=pXfzZDFL3+mZlrwxrYaBkbpwXEP7GadjgZCoXSkJCuvof5Zb+S4oW5ZUHk/eoG5oMJ
         K/omrSaDVqNe6butcnlm5DTE/p2NWh84XFw9jwCtgnRUzOfZbV0P8ZBsL33oXGoxL1ZI
         gT/1UvwVWAngmoKKki4sWDQWs8BanOlcBbwta0WblBa9ky8ZlS5dPJlXuBMuEzrySZI3
         LUHu75vLIcKj78u1QkPnM8NdTl9cQy81Ae0J/7/SXM29gn3X9tKimwmzeMd5uAOZlzhd
         E6riDniW39rHnLAbN1Bwc8ViHZUn/pFulo48Ph30n29m3B5Sp5AdFQ5jIJDMQbjHmP6m
         vgKg==
X-Gm-Message-State: AOJu0Yy5oMB+USWF5fztNSyNNOobxyxwnqGBcflv7oieWERQaMZpDVUh
	2l7EAakvJSRAmYke9SLH0yUysjTcBiXcMEMMRGin9d8EVyKRAKX5UiBTfqVaKh2HRDVg1Tqn18Q
	11xjfyEXSHkeZnPJ/OrH0pxhudom3hi2BoTRla+/zqSHCSJF/ZvbJHJaY/F23TZak
X-Gm-Gg: ASbGnctmLyl8TKbazZwJAPu4FUoNms4Wm/u6J8biUd3wRBDtLHTDm5JiLoZ6cTgFkS1
	GNEuUEl8nc3A4XOt0VbH3MUztNIiaOg4qoArfJCg4EDflfGaEHR9gCpm7SweKSG7sO0NJwQzTY0
	0nBAH2i7IF8wUZ/RD90CrvvbvKWPrjrJJwZ9j3sYo8GGPW2zzPPH+0RKB7gPcF+DgnNbpj4TdEj
	ggDos3IZkhzm/3hKnjEDPpeclzOfLGrf5IxcLCURLFGcXX01uSQcNP1Aq66Sx29iTyV57ruJCvs
	KXe7o6Ap5ZcjFyWLHU5fB0MVhfDf91W5nMYO2u6XMJrSirhwS06Qdc2KH/zrbYstsvc=
X-Received: by 2002:a05:620a:1a04:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7c9607ce29bmr216565585a.14.1745608712910;
        Fri, 25 Apr 2025 12:18:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJVa9FA8nBwp6ryu4SRuNFm2d3hHuCDjNvkIKhicIY6i7Z4wC2GUw7RuiwzCsiGHbiOZ9nYw==
X-Received: by 2002:a05:620a:1a04:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7c9607ce29bmr216564085a.14.1745608712559;
        Fri, 25 Apr 2025 12:18:32 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecfa33csm175246066b.119.2025.04.25.12.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:18:32 -0700 (PDT)
Message-ID: <dc83ad6c-95e3-45f1-8b78-08af138a70e8@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:18:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] soc: qcom: socinfo: Add support for new fields in
 revision 20
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4TyMUA1Yq007uQ3BPRucy4VOIRbWIHQG
X-Proofpoint-ORIG-GUID: 4TyMUA1Yq007uQ3BPRucy4VOIRbWIHQG
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680be00a cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=y_N5iSi_J5k_ybs9BqwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNyBTYWx0ZWRfX5FvEuXGbPXX1 FLv0fdhKzB6yErh5IGeCNF8Nn+E3m/MjgmCwCN37AGBZhYEnyqsDvIFMjQnyNJ/ocvWhk4VWEzk Fsw5wtv1cGEx/gFdwL0QwxO0ESr1FHS0v2UkN93sDkhLY9dReb6Wbq0IAaN+SdaoymBEzVv4jQC
 gBJDn2SoSUisygjAkKo9xSOmkXNJLbfa4tn9J7JtRFahIpNlVo8VUFlNeIOGVs1fu4UIgokLKL9 lEL/poqkLkGj8MxucpRnSvePWC0YZ7eeqJhvn6L3lgcjXIHYIXuA7nE96F5Cf4T8dGVEySWf9JJ gYKqnIL0t+6R3yNWaTKebawfOnqR7ZXcEn3vkblaPJrSAgJ0IWjzk1nMG5ePa2UgWmLiZW/5h2T
 2UZdCKEeGKP3x7wXQyS0I3Py7+YKWKGG1iRK67f7biYGpFDARHm84ols50tmwuvZp4SaqH5T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250137

On 4/25/25 3:59 PM, Mukesh Ojha wrote:
> Add support for socinfo version 20. Version 20 adds a new field
> package id and its zeroth bit contain information that can be
> can be used to tune temperature thresholds on devices which might
> be able to withstand higher temperatures. Zeroth bit value 1 means
> that its heat dissipation is better and more relaxed thermal
> scheme can be put in place and 0 means a more aggressive scheme
> may be needed.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

