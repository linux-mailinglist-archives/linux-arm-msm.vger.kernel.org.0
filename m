Return-Path: <linux-arm-msm+bounces-75130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FD3B9FD64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 16:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D300F2A818F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 14:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F4328AAEE;
	Thu, 25 Sep 2025 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="StYkfYyi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAEE6D1A7
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758808830; cv=none; b=hFiCfYWVJ69gf76yyrN0dIbPXRmun5w5H/TtOTfle9rp4WlWE5oX5Xhfk/1q+QhpOaWrZonzxBtNFYitFK2mm6ehoiQ5IiSAqwHUBegsuu3HhF/fcR+6w1jBCsSFPXcAlwBLKCGMEbWtyL3SNiauD5fuQ9Iqfj3TkemM1CXoglE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758808830; c=relaxed/simple;
	bh=h99PfcktUZ1KhQzpW3fuP7Ha9igucV/siOOOoJWcSD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5hRSAozS7vDuWJqqL3IC/djwnyhUebzGquOgpM+TYj1xD5zYXu30yPWpiaXjwmyHEZelpWPhAIm7HXQNLfl6ISwoImTssooyEAnfjzsTfW4tXifEfexxcxP+rmANkjBLxLpdVPFRTJ3SevM8FIf9KqovORqifdFI19RchLU31s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=StYkfYyi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9xfQG029565
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XUsWf7bqs2eSLAnjUL1U9rWsVFHxuSv71mbiVdSxlpI=; b=StYkfYyiiWvlWfg3
	Lvok7NmPvGhVDzCtlxPU7PMwnZrjxC5v1akAP39GebZDnuuWWraZhLlm5tgb7ns5
	n1bfqtOhDFhRjuRJKytYXNlRUiSSI7J5PA+MhPVmzLB6pNVKXtFmGlFnUHH47HV/
	7SYM864Dl7v4WbP+4gwT3Fn0pEZI/HLUCaPJZiXjI2EBL2py+BmUeSoIrkVKDq0F
	eVg3Bs6kVdnm4QY6XMQbShg6c8hgKDdKmBsz5q55vH/Rx5g90xZSiAl4X0sGeJKA
	mJKBpPdm/BS3O0Qdgz7MtBWHs2HQK7+3X9SkkfcAp05kxlt/P8WmMkClmZSLQgcB
	rlRwFQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fr6wj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:00:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4c39b8cb20fso3529361cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758808824; x=1759413624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XUsWf7bqs2eSLAnjUL1U9rWsVFHxuSv71mbiVdSxlpI=;
        b=R9RwSqIo3empVPGAJWoKqKaqe6oivE1bWqm3VO0Liv1awCvBtEzXDhWUS9eOUPjXsa
         rojA/MRXyJqtrKY9Dt6PilSSprG3ZVdDdQ6FSQJwKp6v9i0J8HEXU/IM6VeOgv2bMkYN
         e0l2KMuZNBfzR49eAHHd9Fs85lvLTWrqua6v0OBK0s1GRBP2bTqGXDaV6WLDSfC4hWub
         dxfgjfT1lKGKdsDqenS7AU6BcJPnrYRevPjWqowDw24uUVxQ7+//qnodPXORDsn3Q7K2
         P/iCM3PmOOvdoa4us5/E2T7onvQk2GsvZ/UwHlcS+efKus6qqGzrQ+BfSYyaW+QKwT0c
         s1yw==
X-Forwarded-Encrypted: i=1; AJvYcCWMKlNFPPhxzAQcc58fmaSmuVBUyXDsMjwIgbAo0qBX8bzi3EebgfOCyqTO28nGS4U0kOvlXDfFB9biQnl3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywle4p8csS/VFodqAQxrEo4oLZUiyVlJ+SXYhwCSfAS6lZ0rR10
	WwB7vigrzekZalEcXEIpi8dh0oM3IiETB5xSSTv45EIXgn5NEo91f8khBQFKHTiBbfFtHk724em
	KX7lnjdu8NNhZtMOmJhFUZ6hahrZXRs/ubq+Vjkklb9tEBXOW5GdDiMQXiRo5imfb8Xla
X-Gm-Gg: ASbGncs4840o0t1m8cEqEw+yCq2E3wMKnQmQHnjnnGsZjYpMvCbmhpOlq4sOh4SKTce
	secNREvUorxwK10KUDxSKuISHu7EZpqRH43tl3eHKCSj4A+NgcB8mm4eR+IFqbP+YUvAPSCSFF5
	+gqAK/24FmDxi545NVXcXTYGQzfnTWmujILh0NnhQJyojZrtalbvGEjMkAlMb1kII7wyxFif2fz
	cLBwHDtpmmmaiY6fi1u+4gYdibHFWHIkJXggdWBOW5t/GuKlVo0i9ewAiExX1S5RtuGvdMWFJ8w
	7jJJzkeefos3UO3homK8i0E7Epqhr9hgS2TGSpLtk1WVjZbC5Xb7skBMRyOHnPlJz6Wkpsw1VdI
	m4eXXWK1MWtADhv30awqbVg==
X-Received: by 2002:ac8:5d88:0:b0:4d4:ad40:fb0b with SMTP id d75a77b69052e-4da489a10e3mr31332541cf.5.1758808824141;
        Thu, 25 Sep 2025 07:00:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFX+I1iprsRH6SvaH+LsSyd3jhUP5sSOxeDSBSeH8H9xBMZUc+poCVqQXxwlYniTKKdMngEDA==
X-Received: by 2002:ac8:5d88:0:b0:4d4:ad40:fb0b with SMTP id d75a77b69052e-4da489a10e3mr31331691cf.5.1758808823362;
        Thu, 25 Sep 2025 07:00:23 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629878sm1264034a12.5.2025.09.25.07.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 07:00:22 -0700 (PDT)
Message-ID: <9d2ae733-6df5-4796-98c5-89e953c35f4b@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 16:00:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/24] arm64: dts: qcom: Update the pmh0110.dtsi for
 Glymur
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-14-24b601bbecc0@oss.qualcomm.com>
 <CAJKOXPdQH2jXcEY6ZpkmixvUt26SqdzYgDAiJ3RHMG7xkPyi_A@mail.gmail.com>
 <lcbcjpoazpwbltedkiqlw4l3aomwvi3qsfwvmwghb6uf5wvnme@kh7qdpunfuwr>
 <CAJKOXPcyhDdFW_u4YQLiHYj8gM7wYB-LOmB_PJs+5OOgn8WZFw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAJKOXPcyhDdFW_u4YQLiHYj8gM7wYB-LOmB_PJs+5OOgn8WZFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9BAOEbrZh4uPrPVLQOAI0f-8lXUfkbfB
X-Proofpoint-GUID: 9BAOEbrZh4uPrPVLQOAI0f-8lXUfkbfB
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d54afb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=SWti5kBmd2enZMrbPjAA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX05AJ59Ornzvx
 3BRirwWnIO1V9dDxTKlrLJSjj1L1vWhqql445SItM9djnFFkRBPOOdPCs0ZGB0CbQfIT83CgXaF
 BtGeZp8j8Kl4FqqPTRLp8Pm9x9ErV4kCZ4DdzmCr5miAX3lciDCkdWgf1ApfdUAclnyJ3nA1Uma
 oZnYeBrApYHs4vEjDfTQgha0/RmHM05KIOZRflOzsa80Hr1favDhQHe10iYLuj3wampLaW19VIF
 csan1LWMn587+xtTXpWEMK0VacqPJ1BteePqD8qAyXXqpx4yrYwlhTMraZYl1miObNnFQLcBQxc
 TvNHJopgE+abUnIFZRgTczU5qP9A8B192TrU30arX0SgDfXNg4B/JyaOzeQRWSPU8Rqctyg0f0j
 NUKM5oGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On 9/25/25 3:34 PM, Krzysztof Kozlowski wrote:
> On Thu, 25 Sept 2025 at 22:14, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Thu, Sep 25, 2025 at 05:08:54PM +0900, Krzysztof Kozlowski wrote:
>>> On Thu, 25 Sept 2025 at 15:34, Pankaj Patil
>>> <pankaj.patil@oss.qualcomm.com> wrote:

[...]

>>> NAK
>>>
>>> I already explained on IRC in great details why.
>>
>> A short summary or a link to a channel / date would be nice in order to
>> include other people into the discussion.
>>
> 
> Of course but:
> 1. You were there so maybe you remember the arguments, and:
> 2. I'm offline, using phone, not having laptop, replying during my
> personal time off just before merge window so any emergency time
> should be spent on important matters instead these two huge patch
> bombs adding such usage I already said: NO, don't do this.

Thanks for being dedicated to the cause - however since we're right
around the merge window, it's safe to assume these larger changes will
not be picked up, and we don't really expect you to reply immediately

There's a lot of code, so we'll definitely want you to take another
look at it after you're back (and before it gets merged)

Enjoy your time off!

Konrad

