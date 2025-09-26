Return-Path: <linux-arm-msm+bounces-75248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3702DBA29A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 410A01886777
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 07:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4330121D3CA;
	Fri, 26 Sep 2025 07:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k01Eqm0A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BAD7404E
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758870065; cv=none; b=GPqYcQXGtm0usEc8tiZ/fNDX+HQhpZl+Fl/fqnPme2Hb6jUhYAmlFSB3h/YZkcYqeT9EchP9i7YvtBMCltmysRedCUP9eCtPCiD9iU3+0zlei3uxfmgjxEXCHOg5oa8qWGlt84rcu3nJ4hUKFdpLn9zpzegUulm8KPGbc9SonXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758870065; c=relaxed/simple;
	bh=zsJxTlGg0VsEk089WKJG1Xw2vubU3qkBIxZbfdEBIzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H4b7nT1LyInvpWoXk7IYWqXYDZCXchdDrPcnGs2mh/6cx2IfOlgcetf9zsRp8reG9MaFlCPbKcos7g98Dtc7UiwawC64nfxNdjAwOTeONpBe2t5/m68Pm/gTJxa2/KChe3oNrs9IaB04AbHUOw+7OXRhLYyhN8YlwxoPY8S7fQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k01Eqm0A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6S5TJ021573
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twtmZmjdwxx4BdHpzYanIR/C135T5cqJSpQWsUGZmOM=; b=k01Eqm0AiGl13L1i
	wR2ZJoA2DrOM270U76AKYPoGYgS133g83QovHr7PO3cw2OVz0lePaALQZD3fwOuw
	yOFIaQ6RGmDnWjNm7Bup38ZqQr7sd1TQmTUSoOjydAzCrpktsMF40WiuDcUf+MZQ
	Ipnipgvtj9uU16lOQFJJEmqSalOGEM9RaiDC+zWxpywKhOG3186xdmDF+S5N6jd8
	fFvCr8SXwMNbqAyrSPZ0na+Fbam3T39AdnUMj2lgIWLEdFvVnzd2ioHX4cTXc+Vz
	CVTRtQhzvN/8IaEWjwL4ATANBhuXtrvguZ/dygqO7GKuEvtnL0WjZwC2V1d1QtlZ
	qe8Ghw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qsrwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:01:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b55118e2d01so1331201a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 00:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758870061; x=1759474861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=twtmZmjdwxx4BdHpzYanIR/C135T5cqJSpQWsUGZmOM=;
        b=wjAsDmrhLz1gKrJIKjGVUVXLPTNUpc7fRfvvib/DXxc6JvkBKCz17KxfZ8oqzy4JD2
         cUFOWyDXuLdtA686uAxaet8HlyGLzGpPR+Rt33VXCT/23XuiJcWTZoozLZQPa6NqoeDp
         JFCdX770Vs1ujtz7cqnsqYCEHEZx02GkbaaWdPJU4zlaetbXmibtyLykBvqdWPNDdrId
         wTrcNwoiHRrDMCom5KR4yezHUm6yGiq+hHg9AuJVnX/Gsv1DqvlP/g2MyqS2SBwQ+thO
         LJl4MrzvWeOvOTUvjOt3zql5hji+WXsNA/fkXmfYGXSr+XM1pUIdFcdElcluONxOadWL
         spkA==
X-Forwarded-Encrypted: i=1; AJvYcCWUaH/Zhke3MCrFClxPtkQT/9eanBiOOcdvZvmvOtZehW9O03ewfBroXeU3cnt7wQHH/n4N7Ao85zhfPuUB@vger.kernel.org
X-Gm-Message-State: AOJu0YzQiRtBkijPmW2yo+/yHaELlNoW+FHGg8S0zz1vSIEUrRfqWo3d
	5RG5E6J1yQQ6iROhBIJMnSapavSSk3n5qhFWJIspjMI4GjdhEtm2IcNOADYUhoG4ckpnncZZ1Fw
	jqMVh+TxXXIFuS+cRYHctcVh19MLeJDYRgsxAdyiRCt/1UzC3JC+1lQEaCkee60cfKHId
X-Gm-Gg: ASbGncuWpkzgkjyeWdagYBoyfrS+W825+EVr6qIPDTwm8v2m86MzxAHRzxRlO1tYlyC
	VNR5K/Iidrl2mZx2a320EQjngikPsOzUEwMWKLrK4IktAGebYpEytcC5kUgRAv3qdVS/8FRLX41
	E2aqoUzg2nNDC4aXZJZLAtigaqMYm9IA59WaPrjtB88lPdO7/KjOCEOBLTgOX5B98fZx4deJ4yB
	XIUAvDFLH8MuWq53NSZfA6R6pRaK8T/wMAsYjNqrJ85Kq27LrQO4Wpk+bpzH/tsphdlKNg9KJQ0
	swEqDRVd7CbLVy1lgEVNzzLkEEYmQ3rYw9zWWNBY+u/WLlixdGVEazjhyGktVrB6rd9o
X-Received: by 2002:a05:6a21:32a0:b0:24a:c995:e145 with SMTP id adf61e73a8af0-2e7c1bc5581mr7549220637.19.1758870061255;
        Fri, 26 Sep 2025 00:01:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyGIYWGRSEBYWR6xeL2JzwaVPSoeKg7XU8yQih9Mk5p8UafMojYVIFSGDBg9nHJ2JRg49gZg==
X-Received: by 2002:a05:6a21:32a0:b0:24a:c995:e145 with SMTP id adf61e73a8af0-2e7c1bc5581mr7549175637.19.1758870060728;
        Fri, 26 Sep 2025 00:01:00 -0700 (PDT)
Received: from [10.92.172.127] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53db8e3sm3891514a12.23.2025.09.26.00.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 00:01:00 -0700 (PDT)
Message-ID: <44c224d3-d5d3-4a88-bf88-34b9ab5239b3@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:30:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: gcc-glymur: Update the halt check flags for
 pipe clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-glymur_gcc_usb_fixes-v2-1-ee4619571efe@oss.qualcomm.com>
 <9066c8b1-bf25-4ce1-a0ee-16e9ab44dcad@oss.qualcomm.com>
 <gprk7uhwqnj37cyl5iae64qrevkts3z266y2e5k6z72bcujhml@n5yaik3jtm2a>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <gprk7uhwqnj37cyl5iae64qrevkts3z266y2e5k6z72bcujhml@n5yaik3jtm2a>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AzZKmZn5iQAqFAKKjdJA08wpzBGN0OQt
X-Proofpoint-ORIG-GUID: AzZKmZn5iQAqFAKKjdJA08wpzBGN0OQt
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d63a2e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=eUHWfAKrTrtQ6IGICcAA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXzoIu/lWKgK/t
 Za3ndkTwC7WUrgB9r5csxpddPwrcM9Xak9VuLBDsxlLcgq4wAwhtTxsZNaKBUly31TOkC0omk7M
 J7n6Nkxrb7PayKgqM2zpQ+mdBedSihbF5/eeLZuAuvY8Ij5lQ4+KzcwA/dbZeEtHgT4lrGbJF6K
 tIApg3V7RzLH6LBA6yfiF5KLph5fOjYS30x6rrTlsk2GbMaZxY+vHLt1S8PCHavMoNmQ9bMXnHz
 pOOO6i3uNjUvKld3K00idUky8QCdL61kXwhwxPkJzVsFB3upAXCTY5GGiIb3BKhSZAgCTPI5tP8
 XYb0xKEpuFUUf320q5Ss6uwJr1sMpzhPoE5uI46eXgr0IYJwJGeru3JvUFzFgbCPp5NB5Vuqw0Q
 Sd/3CGWVB/5vJAIY1ukEIl2IhCrfNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171



On 9/26/2025 2:48 AM, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 07:10:47PM +0530, Imran Shaik wrote:
>>
>>
>> On 9/25/2025 3:49 PM, Taniya Das wrote:
>>> The pipe clocks for PCIE and USB are externally sourced and they should
>>> not be polled by the clock driver. Update the halt_check flags to 'SKIP'
>>> to disable polling for these clocks.
>>>
>>> This helps avoid the clock status stuck at 'off' warnings, which are
>>> benign, since all consumers of the PHYs must initialize a given instance
>>> before performing any operations.
>>>
>>> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - Update the commit text to add the SoC name "glymur" [Konrad]
>>> - Update the commit subject to add more details [Konrad]
>>> - Add RB [Konrad]
>>> - Fix a typo [Markus Elfring]
>>> - Link to v1: https://lore.kernel.org/r/20250924-glymur_gcc_usb_fixes-v1-1-a90568723e64@oss.qualcomm.com
>>> ---
>>>  drivers/clk/qcom/gcc-glymur.c | 24 ++++++++++++------------
>>>  1 file changed, 12 insertions(+), 12 deletions(-)
>>> Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> 
> Note how you've responded. It will be ignored by all the tools. Please
> send it correctly.
> 

My bad. Thanks for pointing it.

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

> Anyway:
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
> 
>>
>> Thanks,
>> Imran
> 


