Return-Path: <linux-arm-msm+bounces-62777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F78AEB7C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C28FC7AA38A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 12:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3702BF017;
	Fri, 27 Jun 2025 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YmzTnhGA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB9625A35D
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027619; cv=none; b=XrcTmg1GBVh8ZaVkwl06PYiuenTxGb+/50rXEMRH9G8pxyNPA4GXYmLFijliv1p82jZ707jYbIOvGcVCvyuvarIP5UqGJg5/L4G0TejR+FU2DymFbh2kMdFhpbmQRVflivHBVoMhT8m0Qs+dL+kln/w2O1H9C+rHI2UXm6Jgplo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027619; c=relaxed/simple;
	bh=/z8OZm8i5By5aSp6kmEY29YnNMR2FD3gRy9aasC6SLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNkgyF0Ba6mq1Soryt2gt99RSPcWUiXi+9CdOCcIEfQ4zTdpObiwx7owoEEC1nmGIixBUBdKdOgdNhTQW9PkAlE76d9Q59qwqX7t8fceQmeXKkruntC7oG2KzAoau4fys9pBqmbhKl/kRxdqEssEkPdEyrKAC7dIwMNi32cSOvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YmzTnhGA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DNIE009923
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BXdS20jwqob7hyB8EL/DVXzC/VS+NAh0WftNCte1qv4=; b=YmzTnhGA9Nd6hsbv
	hly+kxubIDbOxUvViHunRMXDvLjmB3EXJSUpv51ZycWMcm6xYsn8ZIWCm2qfN3ZH
	Y74gbEMi/vhf1ioOThPOK5Vszo0fOLxvWsoQd4lujICSMtiXhZ9ml+azKH9gu9Oy
	82hkNumCxEM0G1QjiU9YGDZvX756dUrLp824mzBs70LCSmQFkO+GCiX8vPCRCdQe
	UqzHOVFDLOiZr1NAebERl+vdFsG9JjbPXquanIaWlax1iYnXj1flnA4OLqqF5MAv
	BZDDx4Vpp7Muxvajyg+mOPiO0i95h0BVmKPmmtQ24U5UCfUoXGABpjj5X91PQa9F
	6RxW1Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fghum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:33:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d40185a630so362410285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 05:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751027616; x=1751632416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXdS20jwqob7hyB8EL/DVXzC/VS+NAh0WftNCte1qv4=;
        b=A0gKRLZPfho85jse2qtCNMgZW5uhfC5c1v0z4s60znMFlH2j6yRt63DA1eVhIzuVol
         mSpYTiS2NDkGTQVQwV28crBMMYr0OJIzPAthpQ/I+4borAELy3K4UoBSlzkJfGettijn
         oWPboMCKTdKm+ZOontY7oSl+/2UNbCgLO9TPjgm1P8Vr9XIy8AjLaz01bMj42ILkLe4E
         iVe61HnEmZ1ekrTUH23TMj7PQlPhuk42ImTs+Zg71eSdRMoEb5TwzamATGfEGR6GgyLQ
         YVe1sSG8Md34+ZbYivZ4RX0HQ32s74/ym5eh9iwuU8UkwIEocURqsSvxpbm3rPFKJvyP
         wFBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIm8n9Y83+bWqBccNze9YNzjud9EmqNR112Eiyaay3E2f+xo2u08GHkt8O9sB5YCGj455EWup8A9KYhzIy@vger.kernel.org
X-Gm-Message-State: AOJu0YyNtsm854v+7hgqAj7pVPfZlENsb61brsAuksH+v5KHUE6hUb+V
	Al/kmR1bjUlCgQaindDqfFLbTxjgoXdJOmi8NrnV6mptxMywV14aI6v973ZtQ3aG39CakZcMiPK
	Gsg2JwssIpkO5C99gCwXQnxxBSdW2D2/UF4oDGfQs6QoUKxhdZ15JlURzw4erXVYIcPT9
X-Gm-Gg: ASbGncuSSQTs/qZQyavnMX9I/GxHsYurkTCEF8DOOtNGIvPDIS8AJQiIkcZTkq4dMSd
	cWNQaePraSvTIVshXxY26Ff1wSHMe7QrKU/tI6LdImaZVD0eAEDD1kHcRABS9Rl0gly8KivwDUK
	Ka7WevgEak0zCF7Orv7v2rn9XDmTcTVKc5gVZK6siQHKaWLZy69ME6Hi9cEFg1RlN581JQynDKO
	drOEmPqSI6lcmlJTVpo/gK0FK0lSlZ/cQQhrSrXFQ4n0omNeBAoL2TIWLDPVJtTry2Dh+EbEjMF
	fASfYv5EqnqtPRQhqfBFguXuzklc9Gi0Q1G9djad45Beb/qMmzyG5TUIeaysCb5XvL989tlt
X-Received: by 2002:a05:620a:4891:b0:7d2:3db:a4c0 with SMTP id af79cd13be357-7d443973399mr407200685a.41.1751027615471;
        Fri, 27 Jun 2025 05:33:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs16+j4Gol7ebRhR8zdcRYF6YNDJ3HXtdtuy6BCc73JijHBdyCsj4BxBxJzpUck0KcZdd8+A==
X-Received: by 2002:a05:620a:4891:b0:7d2:3db:a4c0 with SMTP id af79cd13be357-7d443973399mr407196785a.41.1751027614925;
        Fri, 27 Jun 2025 05:33:34 -0700 (PDT)
Received: from [10.185.26.70] (37-33-181-83.bb.dnainternet.fi. [37.33.181.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24d283sm441299e87.64.2025.06.27.05.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:33:32 -0700 (PDT)
Message-ID: <ab706b24-1dab-4fc0-9e37-fa1ecbd97fda@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 15:33:36 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc7280: Add memory region for
 audiopd
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ling Xu <quic_lxu5@quicinc.com>, cros-qcom-dts-watchers@chromium.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-2-quic_lxu5@quicinc.com>
 <uzyxagnmxz5tsjy32mfro2alwdpcq5kybwzcbsysul7u6adgdf@x7katw7eme6u>
 <b90ee18a-5e88-4c36-a623-ae9447c53a46@quicinc.com>
 <2mu3bncxoq57rxi22dyd6ys2wa5n3wmtadfvixozshxgenutai@dlkbqgplzrrd>
 <46caa88e-790b-4733-83bc-75ed6c7ca2d8@quicinc.com>
 <CAO9ioeVoqQhDhBW_fVU8kkt=3trV9YhEDUO0izdf8cuCDqU4Tw@mail.gmail.com>
 <76071cc9-b052-4628-9890-239b0acd260f@oss.qualcomm.com>
 <fd2vic3g5jjk22y7yv24mtwr27ies2my5lih3zfj6yw4zd2obo@artndh3vepbb>
 <c609cafa-5970-4694-9b6e-b5536df72eb7@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <c609cafa-5970-4694-9b6e-b5536df72eb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwNCBTYWx0ZWRfX929fTyBTCl/n
 KoB3+BueNPpR7IIlJxz/m3/QxhWBdDYYLbsSSyDZ/jcuwDEzstjaLPrjoLkLwJhzPhP02kibkjZ
 T+sklophRilphZ/J+eFjf+sOQzpi3RbKqEjlvY3yIFee7Pu1PnbOOL7Wm+8WVSEWP2udVK9Rvy2
 V4UIPeRE2XL9WSlJzGLXtt/iB3DtIWPg1qJg3shhBJBscB9D/3Aml0OsSkwUoVN6DyKJ3d6Ja37
 ru4z1YUYr6ZBZmMJOjXjLqGO+kpnD6Ndaiz0bJNL2F9eP7xJ/1RkyMIuK2nqn+cbgqbpyWqD3qv
 0Jgfd3rpIf00zayfCI3u6xnh/WoEN5gPb6xjS5EOASGas8mEGdEBqF6QAxp46VJviEkamrhk3b0
 +xvijCjn5+2FJCJuVJdXOOOzqphpvxCRh+lnloql+gu7y8Y0NbxWBbKkn9/9Unz40T2bhYhl
X-Proofpoint-ORIG-GUID: qznYPuSpWKO2PqbuF9DrPcUwGOjhJSKk
X-Proofpoint-GUID: qznYPuSpWKO2PqbuF9DrPcUwGOjhJSKk
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685e8fa0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=a09MB1VsJqAZHPW3esczKA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=R2xQUvtixtji6bILba0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=659
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270104

On 27/06/2025 15:16, Srinivas Kandagatla wrote:
> On 5/22/25 7:51 PM, Dmitry Baryshkov wrote:
>> On Thu, May 22, 2025 at 08:27:40PM +0200, Konrad Dybcio wrote:
>>> On 5/22/25 2:16 PM, Dmitry Baryshkov wrote:
>>>> On Thu, 22 May 2025 at 13:44, Ling Xu <quic_lxu5@quicinc.com> wrote:
>>>>>
>>>>> 在 5/20/2025 9:53 PM, Dmitry Baryshkov 写道:
>>>>>> On Tue, May 20, 2025 at 02:41:22PM +0800, Ling Xu wrote:
>>>>>>> 在 5/17/2025 5:47 AM, Dmitry Baryshkov 写道:
>>>>>>>> On Fri, May 16, 2025 at 04:30:27PM +0530, Ling Xu wrote:
>>>>>>>>> Add reserved memory region and VMIDs for audio PD dynamic loading and
>>>>>>>>> remote heap memory requirements.
>>>>>>>>
>>>>>>>> Why? Was it not working without this heap?
>>>>>>>
>>>>>>> yes, it will not working without this heap.
>>>>>>> Memory region is required for audio PD for dynamic loading and remote heap memory
>>>>>>> requirements. For more info, please refer below patches, it has provided a more
>>>>>>> detailed explanation.
>>>>>>> https://lore.kernel.org/all/bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com/
>>>>>>> https://lore.kernel.org/all/effea02f-6ffb-42e9-87df-081caafab728@oss.qualcomm.com/
>>>>>>
>>>>>> This triggers a bunch of questions:
>>>>>>
>>>>>> - What is audio PD?
>>>>>>
>>>>> Audio PD is a protection domain which is running on DSP for audio
>>>>> specific processing.
>>>>>> - Is it a required component?
>>>>> yes. it is needed wherever there is some audio use cases where
>>>>> DSP audio PD dynamic loading is needed.
>>>>
>>>> Which use cases?
>>>>
> 
> Usecase is for audio compress offload, ex: when we play mp3 or any other
> compress format, we need audio pd support.

This needs to be in the commit message.


-- 
With best wishes
Dmitry

