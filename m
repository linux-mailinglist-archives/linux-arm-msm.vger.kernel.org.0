Return-Path: <linux-arm-msm+bounces-71707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC567B4123F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 04:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6018E1B24D0B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 02:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FD21E25ED;
	Wed,  3 Sep 2025 02:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AgN98ydm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9351339A4
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 02:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756865799; cv=none; b=qKXnJWRkuXKO4Thhfs1lIxrk4tyCJAL9z0k9mz6Iwf9APVuteuLgqO7ljHCdJEXoQaoEvBmZ3aSYGNYd2dh64pI0uX2qe8vluPCUIvj8UuCiHPCydodPB5OqtlQ65Ntw4qtoRD3ZDbVYRqyiLT+anWhA3QW7ROuxPXZEd2uGSOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756865799; c=relaxed/simple;
	bh=v9zS6j9T98yNyfjNeGOWdW3vrw4eq89d9I5wRlLVeWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GvMc6okoObgbVXSchHfALzTbxrV8/heTfeqHMSdaPYEYcqiAoAVcrdYAtjLXYkCq3cbII/VKwNckN7edmCMKi5lx7WWUtU5xCXq7XopvoKE7evsRqG4lNrGTxj9VFjyiIVf7+3D9uBC+1vbm+jLsOJbnon3ACQLLC8DRmQhvDz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AgN98ydm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqBSO024014
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 02:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v9zS6j9T98yNyfjNeGOWdW3vrw4eq89d9I5wRlLVeWM=; b=AgN98ydm4gYvt7nB
	l9MYyadPaUTYUvFUVU9zZB0ns+g80ToOn8/+yPoceO9rYRbQ4DZuZCqe4KBmtP+E
	yN7SRhYjyFYa078gPdpYmTs4q7Os4P1xBATPDLTOPaBDG29Q7dvmCQQSlFWdqOUQ
	mUs8CCxq11+ML76qCOBaL09QYU0Rmsexa9b6mzeYBIiCxvpJ2Yd+8hl7ET4CQtLk
	7Or06L9LYQbo8mFnG4gOZKygS+jmm0iTvsFzad5viwRcg861q3nXHXVYIvyyhm6p
	gFe1w4eJYHWQNpByN1dMskGHMO8lnL7FbPea33tHY9g1oO5DPh+flFFrsI3hO3rb
	w0MxIQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush31rbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 02:16:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b471737c5efso4557631a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 19:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756865796; x=1757470596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v9zS6j9T98yNyfjNeGOWdW3vrw4eq89d9I5wRlLVeWM=;
        b=Bz3mIVtRkZvq84+kXd3584l4v/Ve+rkmH4dQg8bwUD/u9odwgC85qfY/GmO4ID874V
         dvf+wnmEFn34zPImmbMkwDubSNC6LS5cHjJD+xm4XAePDEXr5N8xaKVHgUKo+dOaoMVo
         BMWFi98HpqLo0AHdv39Q+XG9/3LSUWU+tXo5a2N+hAgRFXprA+bhLTkVhT0COQHZW7h2
         yULvVxLh4Fdi6bpL2qBN6APgUZUBnmDLwJiPRYVyOfYZaSzpev5pvuLtwnwwC4KZtQuC
         D4dNXQVdKS0Gm1q2d1mCk5Jn0ycWto/F6mLN2LkjNaAZAobsLc1WBhPWQL27mFnD0ByH
         JY3g==
X-Forwarded-Encrypted: i=1; AJvYcCUXlqgUxpkPChFmEXSrdy6NmbnhStlWh6iAC2adjYQCJEm/nsxxnaHefU5XLgAMtUmQmkmygEjOLTfZT+HI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7EP7ASSpYwi57mURzKk3W72qwqAPRfWuBHLhIP5ILIKwj3VjZ
	tzi10uCaK3W9jFqXFezJHSP+zbfxArMMZ7fBP3z7M+0GO2tz58uMTpFPY+aDqS7Zwhls9noR1UX
	GRxs1w6LE/QIiykjOcZT88qttOH3QWgYPCuIq6+zpXWMo6i92IbcxAfkZCRxHAeJi+dDw
X-Gm-Gg: ASbGncs4Bgpen9BR4MU4etPqAoF3HlkVyTSB2Qy5FVf54aGTuL/xQ4Xi6LxvUIjYYnM
	U/t+4L0imxawXONHRi1FBFf1QHwOg0O60rBZvnu1M12z8VJuvO+sIhY+zXLE0+ciYprDrb00xBn
	7sB0dlps9q1Da5Xa8XxAlXmUlJJY2bg0TMiYLSzqQLC7WkE241DgtOSjY3/jxIRim0Q6+lN2+W9
	l4YE0pBPBNFrqeF1XIMfHiDLVH/fMGT60IY90hxqCqKH9gR29J+AT4ifZY/lYt5FdJWjj4IW9xF
	Aa4hU25wRtIDy94E9gRk4ConPdb/5wRH9zYP9S4d7cNfb7e0ZInnXsfQ9MrvjEaTkP8w5j/Gwd/
	vpmktiJRcHxr5Bqk=
X-Received: by 2002:a05:6a20:5483:b0:238:f875:6261 with SMTP id adf61e73a8af0-243d6e0100amr17326293637.23.1756865795880;
        Tue, 02 Sep 2025 19:16:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn3oKdkiywXs7I27qdf2yUwn9EW1s0qdzWAjlJxUt+zYeJZsSbpJFkobFdywABWGuVgSjbzw==
X-Received: by 2002:a05:6a20:5483:b0:238:f875:6261 with SMTP id adf61e73a8af0-243d6e0100amr17326268637.23.1756865795446;
        Tue, 02 Sep 2025 19:16:35 -0700 (PDT)
Received: from [10.110.3.132] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4edf7ed519sm9565518a12.28.2025.09.02.19.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 19:16:35 -0700 (PDT)
Message-ID: <bec3a42d-317d-4758-924e-ac53f5dcfc10@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 10:16:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Update pcie phy bindings for qcs8300
To: Vinod Koul <vkoul@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, jingoohan1@gmail.com,
        mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
        bhelgaas@google.com, johan+linaro@kernel.org, kishon@kernel.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20250826091205.3625138-1-ziyue.zhang@oss.qualcomm.com>
 <20250826091205.3625138-2-ziyue.zhang@oss.qualcomm.com>
 <aLWW-izvybTo52VN@vaman>
Content-Language: en-US
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
In-Reply-To: <aLWW-izvybTo52VN@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX9nDgoGHgR1I0
 KgLJ/iWGx6V37jezTpglLrQ81UwIfHvqCtM0Nv9ozTCXw/b16hv8LAJJtNJr24Veth5eFehF6or
 X03QdcqQ8J1cWfrq9xdJVkZegF7zKXafYfM6kMWy1AwBDfJ9zQeglqQKzl4Pn1hCdMaPOZ+Vz8x
 mDKJyMDi8F7C3JidMFE8PT+4ELGc7uELaAci4axfDP8rIUlV8sCmF5SDtQN9NWJ/LzkT53d5ZtA
 Uiinqw+D0HXyD/DAT0gRURxeoCGp3JEVcKKfuQcaKQm01kuD4/tBjip9/kTSrDqFiBfY0r5JNMm
 UZJAd/oZJcRM7Wz1O4NgrGlhAyoi/YIQa9FSlQYhRVYC0YXKTpedEXmLx2aJx0zfEx+Mi8AI7lv
 0lcbHAUo
X-Proofpoint-ORIG-GUID: kGPxthgp0DJXSiP95lR4pmefz2o1Xx1I
X-Proofpoint-GUID: kGPxthgp0DJXSiP95lR4pmefz2o1Xx1I
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b7a504 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=buFmA9CyAF0SDTxNqVIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032


On 9/1/2025 8:52 PM, Vinod Koul wrote:
> On 26-08-25, 17:12, Ziyue Zhang wrote:
>> The gcc_aux_clk is not required by the PCIe PHY on qcs8300 and is not
>> specified in the device tree node. Hence, move the qcs8300 phy
>> compatibility entry into the list of PHYs that require six clocks.
>>
>> Removed the phy_aux clock from the PCIe PHY binding as it is no longer
>> used by any instance.
> This does not apply for me
>
>> Fixes: e46e59b77a9e ("dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the QCS8300 QMP PCIe PHY Gen4 x2")
> Not sure why is this deemed a fix, also no empty lines here

Hi Vinod

As per Johan’s suggestion in v7, it might be good to include a fix tag.

This patch resolves the issue where the QCS8300 PHY was previously

configured to require only 6 clocks instead of 7.

BRs

Ziyue


