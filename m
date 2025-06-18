Return-Path: <linux-arm-msm+bounces-61765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81044ADF73B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 21:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21E0F4A37B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 19:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD9121ADC6;
	Wed, 18 Jun 2025 19:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnM2iGOb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD12219A89
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 19:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750276256; cv=none; b=nou9jxRDGScvEDn9C6f9D5Ua5T47t81+dlUjG+SI+C+D6KlZ+3+PVcyCtMNAlmpPCdzAx8M4mNWQ1sukjDLXeFL2IJKH6nX3c1Bocwmki19W1bJUorgTMLg8vUvIvyFOTAuuqoLGaXDBcCh1hPnkfCyhnPWhBDJLFxV/vnshug0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750276256; c=relaxed/simple;
	bh=Abe84Q55V8uLaOGPFRiyP7NZWpfQt9lsxHaIzy2vJKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HCAtNemGT4nbCcaN/nLIKbkf5sO5noP7vQgh72gt0AAImK0M+W2dQzmrA37UxiyTgH+T1a5TcvPA7L0dhAhEsExUZYJ9pZ6g5X+7OVZS0/MhPsYDgjoJ0NzC6jifecaVSD3ULc+mygQ7dcb6cszc8AnrQYmI1dav98H55I5km7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnM2iGOb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IGBq0K005635
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 19:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FOzsOSYkCLW2ggvd0CZgtgGnw4BaefQGhIvMT/TEkjU=; b=XnM2iGObMqoEo6lf
	g2scR+b50htBei+ddhijz7lFpT6jkC+CUE9B8IXrQbeuRwAphjqxH4gyAzl36zGg
	EAXjXw8FnlhtfQzmXSoWBzc81DDcaiqBVYKs8qMwUCxRrMqxAweXcq+sm50ESf9a
	Su8mBE6j99asU3sNrJfLizPOqrstkfar1EqGiludaRf4yY9d1b4KQunRbfW867qY
	AQi5kkjx4Mo5EXhKRbevfj3jIroX9JknaAQS5bfQnsPadSdegb311jv401rYl1Gj
	XlMvCgq3IV7366lqZy2VYC6qOnWdCem0hX6XMnpoLK3cxzegaOrr/UxxL42IY1C1
	A2QL+g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47c0rvgmsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 19:50:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0979c176eso1203485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 12:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750276252; x=1750881052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FOzsOSYkCLW2ggvd0CZgtgGnw4BaefQGhIvMT/TEkjU=;
        b=LLDmBgKKfMpLxk+fxaOtjFmFFvq8hBzIKYUKvnASXvN2sGFChtg0xGqNUsz6ppKLfZ
         2NEOJ0oZ0AKKGdTwiw30RDmEw/+ecpwbzrKaw6Eg5WYT9mcNmp/67tLoWimCrds/uMb+
         6889HIdTLuW/GcHvjZOkGL5hgM3Jvzl5DpV4oPrdSFRWWGnzJAANWCE5pzhx+3+JLP5n
         u0FvetMyXBL/SDrc+EL/r7xOF7lvVAXh9IQvv7F39bAcUp2sch4l2epPWUKglQoa/awI
         AAJRd3ryWstZ1TsCtieO8moyNTRdFrqZ+kljk0iOYweVywGnAtgMaNDmZUhO1Mu76lod
         XkAQ==
X-Gm-Message-State: AOJu0YxnVkh0n81rSHG80VXp3me/Q4PzkWMf94gJYt9xwXnYzMvtZnF/
	pCgYLJoXN0UKovp/zhQdsZfQR+gLOSqkZE/0E++rCBxbrXP8sxIpSZS+thf+ugfUqc77JrNOAWV
	LfpLv0HlaRV8mqg+T0kqbR6Ik4ujcW/apeQxqSIsJrh4Z+8ohcHtDgRxnluZC/3K1i4LU
X-Gm-Gg: ASbGncvuA869JMp35HZew3ko75ed51IS1QATIcCpiwVcqrNj6qqkJL6cwTf6pkiaYGt
	9pQjAyuVfSN6ifC4JguvmpkhbNG91qVG/5zSCqA3ddn9n45SuCUVNwb1Yw+sthSPcXLHejRrvb7
	kx2rLRzQmdang9jfxl3r2AoW4nMxgHZkLR6qYN4uBT+8V50RoBDIxhczvE+dte2CkN6Bw3DPVtA
	JVDLL0WeT+sGq/ca+hfMw7D24HVQyWjG3Geg+IBl/40epUppe19iYFS2qAPHB6hoBZD7NPoerAn
	ytw4paku2GD9aKlshEtFGjqCnjnnANID1AIpkDeoMcoRwxepiAzXxpbS5nJ+DbLwcwDDdZ4GvxW
	cDzE=
X-Received: by 2002:a05:620a:4307:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d3f1b5439cmr37309485a.8.1750276252373;
        Wed, 18 Jun 2025 12:50:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKmaXk+Vmkvjg46kiwK/r2FLExfJoQV8V595azEx4ecLa7oANL+iNpPolnQOfeL6VLJxOtmQ==
X-Received: by 2002:a05:620a:4307:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d3f1b5439cmr37308185a.8.1750276251956;
        Wed, 18 Jun 2025 12:50:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adf8b393ea8sm966523166b.159.2025.06.18.12.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 12:50:51 -0700 (PDT)
Message-ID: <f4ee6c98-3071-4121-bd6b-a41959f7f5ef@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 21:50:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sar2130p: use defines for DSI PHY
 clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
 <20250618-sar2130p-fix-mdss-v1-3-78c2fb9e9fba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250618-sar2130p-fix-mdss-v1-3-78c2fb9e9fba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE2OCBTYWx0ZWRfX0xeS2Ys4ktgY
 dc4EnqzJgfjzwgeq2e0q6ikje3lye/nKYqL3CBteZ/z8vri1tGRqQ3nHaJSmzjlbjCO5/TMKhEF
 oi6EoHLjpj7cmW+Au/bEsdCd/KouHdRPbwB6DO9YNIRxB2ibgLMdA3UcgM1+9b7stD/a/82HFmw
 J1AFfrPpcRM9iIplVWQRK8+y/Hj79m1crsx3sHbse3Vj0miIv7O1nR9v5xzuA9XY0TShsAKuE6s
 s5mOlXn+Dl+T6mzlm7ewodcy8Fnl/1JWkxT7nvo9O6eRUIcHhO8hv5fIQRE4eabIBk+/uo3mJds
 IAxAWueUWK7xov2W+HXoPb0QLOfT95f+pjgf6DUC1MVyhariaIrMwoMtJXrflfwJdNODxpOPYNh
 mWOrAtA/zdwS1NIYTY50yw68UPNOuYtendw0YtJOUwatTT9sxyHiPsx0GloMyl4ljOop+pdL
X-Proofpoint-GUID: d0wK5qNmq9w_b4pUVrrwEThe9uN5rjH4
X-Authority-Analysis: v=2.4 cv=btJMBFai c=1 sm=1 tr=0 ts=6853189d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=FoSyCDDHJe3iGoLm4rcA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: d0wK5qNmq9w_b4pUVrrwEThe9uN5rjH4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0 mlxlogscore=485
 bulkscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180168

On 6/18/25 7:49 PM, Dmitry Baryshkov wrote:
> Use defined IDs to reference DSI PHY clocks instead of using raw
> numbers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

