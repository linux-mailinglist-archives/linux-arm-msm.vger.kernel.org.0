Return-Path: <linux-arm-msm+bounces-83968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5A5C97683
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 13:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C57C3A53A8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 12:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF47130C63D;
	Mon,  1 Dec 2025 12:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wt1D9rQf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VGCEeRA5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F2A2DAFDB
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 12:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593320; cv=none; b=JhRF3WI18aQ01K0Jde5yrGausyURYCJQhQCVQbGp65LMr/IINyFloSJJvzvW931ZTbRceho/A256kaHjhlbsSBD2n9t+lljkXsBtrzzcXPX+lLfepQCb/+MfiHJyRCt3/fPpdq0tBnwdIncAvH7zOB0IhBgudVZUYJRwxnbmytQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593320; c=relaxed/simple;
	bh=qAHaFUAElk7/jopPzD+/mdf1FarzhhYUTTKZK/63yN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XcwMCXxVq33TbobSsU8J0/wj/FZMPgdaNNO2co4kQ4cYGzgg59sKHd1jKxhSJzAsRk6IHW3SDnV5kkzk237ZZcw4aebUXEOgO2h7J6S4FXYGrJLnMoYwSUOKSx/7thzUKwKIWllyvcOE4JNG3iNVjIMLbbTlQJ+W+zJyLS9Y4hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wt1D9rQf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VGCEeRA5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18OTMF4060566
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 12:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31Lr3ce7GGqaTRhfeak+RVWxiplPSWjZJKKcGxNvE7A=; b=Wt1D9rQfQsZTKjyW
	xsVtXzItW2zWdLhVKwk27nRz4SmxXN1yuAomNZdLopvEQUibMspO17XKMFJurOWb
	Byh4hlsw+Z0XHXDyiCy23uFTMoMOVnhPBihGfSM7kHUDexpw+sY4JSabR9qrvXIX
	YYanXrN+KsiCeW05QkTbmML7ydBklszAE7mO6VBslxCrNO+nnGM4nvfyvkXcWzu5
	RQ1v89lKH6XXCt+j5E5jcBKZPsEePhKV8gJ83aRorcRDkR8qtnY9eXhQfguBb1D9
	WVJgt52f8bAgYHG2zntkkfRBDWqc8MgrpRojFv+YWnMlrDypYbeIbfMhvmBfuaCI
	x/dMHQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as7fwrrej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 12:48:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso9749041cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 04:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764593316; x=1765198116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=31Lr3ce7GGqaTRhfeak+RVWxiplPSWjZJKKcGxNvE7A=;
        b=VGCEeRA5dOwuHsjOOV4RA/0E5Yl0e/r32PpZbVfyBhhckEajWWH1Lb0jh1gp/4bV2Q
         YOtLBMtjkjEB/iEpFmbdn4MwyZioxPxMLJipfZ90jzKbtasFCcEBs5dCUxBmZSfFhTmh
         UFtvLhIoqk2vl3OmUSKRQpyx4766weRvEYGX+P1JXFl22p4kfCqOJ5QRTbqntF0W0Bnj
         OrgP5XWfQIrwyEfKRnTNGHq5nOkiwNH+pjXlz2YDYN8y+1NHIwya0PQAcv3nN20+XXzq
         VhinkCPo1//SRK2hFOmU/EMwfKuOY/7kQ0mpkrKj5FJN2R9lN3z1OYPdUcl4iiqfUPcM
         H9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593316; x=1765198116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31Lr3ce7GGqaTRhfeak+RVWxiplPSWjZJKKcGxNvE7A=;
        b=TfVdevAO3rVx5cysCK8FoDpyueK4yO3hffUnJEuA/TlasAgflOLKcBN2ppG4N2salc
         8wKUZFhczx/DMXg/VbfjddKwLxGexHSHwcjyzBnPDLKymn//cpQyabomUzgKzMYGHu75
         tpehBFs0MX1DmAx8sLqZtO+evAq86csR9Re7k/rtV/F91dlIk2ziVt133YL4cap2+2wt
         j97o6L/aOl6dN/84jC19ANQPfd3tY3wkUUOyFxjfiO0SCdZlqYTTrJejsByFQ3d67FXQ
         lwDoyzV+L9x2nvYDNSiVoKqpLwjiJ/e4A0Pv0jriHgVe7BaKsUDirxrKS6NYHCkjQ/CH
         J1sQ==
X-Gm-Message-State: AOJu0YwICMx1c8jZEAvlnNdOLTjcDECXndJgtJHikxiIRC62WwNxPbjr
	YjSnC8yeLOfCdRgfJAo+Tb2stNxnBtDhK2UDxKTo3s/tE7FR4qadzwZJv9lU1qjQFuhatRlNDeb
	mEWfST04Obzg/sJiCYjTW9B0/QpvV41vCevl3K9RAYdU645clfvMkNzFsfCFphNet6/0m
X-Gm-Gg: ASbGncurAORyXsxfCtBHbJJGWR4bB2IQVYrJfjTiDFosJtqU2Tx3evmp1UGIZSItNPS
	e2ESW2ArJ0lHIkgDkNPJUWVfITbD6gx3AeUcF75oixvFxPY6wGLPDrPAPd0slsuIpJryZ2i+hFl
	lTwM0VKwo4Uo8t7QS1om6CUk8nlVRftWDvi3kPwRCn4fX9AYd/gqSMowxL35VIPtenpeyQmW2ii
	Ex5qQFQSp18Xo574DhDWFXxhxTxTdroWmnCQUOiBL3Amjko0D9pZSSzCEZapkLw0Nzsqx+KPqp0
	5ACvCThUrkxTVke8LY8KafmP8M9v9ky9dLuculhqbNDuTQAKfDp++wr1D4ZqnGDxZ7WV58JchJJ
	n94EIoY+Gn51QdfCUywqkpze7qiuV59hYKVlVcnC2EcPhsPR5dRwj2f+b58PQi7xhIhg=
X-Received: by 2002:a05:622a:1184:b0:4ed:afb4:5e30 with SMTP id d75a77b69052e-4ee5895624cmr419914381cf.11.1764593316158;
        Mon, 01 Dec 2025 04:48:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEm7ZEX2gV3I745dgmxGg4UIToSiI/z143Wd93/fuoI9uQxffD0Ca16doOxKPxwTjvkLFo0ag==
X-Received: by 2002:a05:622a:1184:b0:4ed:afb4:5e30 with SMTP id d75a77b69052e-4ee5895624cmr419914051cf.11.1764593315786;
        Mon, 01 Dec 2025 04:48:35 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a695esm1190842866b.33.2025.12.01.04.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:48:35 -0800 (PST)
Message-ID: <3fcfc5b8-7509-4e4c-a1cd-e973d7e1d091@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 13:48:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: labibb is not used on
 OnePlus 6/6T
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251130-oneplus-labibb-v1-1-bb3653e43120@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251130-oneplus-labibb-v1-1-bb3653e43120@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwNCBTYWx0ZWRfX7/uapXnOBkcq
 JQWtfb54T+vR2gz3PyvqExgU8/gG/brKRyItPMOahK8maMrbw5FjwZMfY7UpzoDwWmJ6uHRBmqz
 M3NNgk7tLtLwqrZZfJbyxXVbUv5GUsapGHzyCzwJqCspdiBfr6HGblmiDdVJ75BJjrPSye2518s
 wHAaCPZiOWxXBHuMECwbGxPHKu1QHm76AClfmXJcc+ZSlWb3IqRca6nR5xF58p4+BGwP2Sg+ysq
 ZBwzUOH6YPowQ84cg35CW8CnashaFnu/av+kXX0rvR85jUqwTWMFygWDFmizAhhf8n1EGRi6UFh
 o7inBCPHoXYFLgUwOHiNxJNT/t8rcVuX3u/w1yH2nyV6Efu/G+y7kppGpAb5kBx4MfHGr37wJVQ
 ghEK61EqWTEslhwLIg6qQMuDnlFGrg==
X-Authority-Analysis: v=2.4 cv=TbabdBQh c=1 sm=1 tr=0 ts=692d8ea4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e__-_AqODaZNEJG0dXkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: AE9_8PAdKmsBpbKgSO3NoWQNW6PFxi46
X-Proofpoint-GUID: AE9_8PAdKmsBpbKgSO3NoWQNW6PFxi46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010104

On 11/30/25 1:08 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The lab and ibb regulators aren't used here. Disable them.
> 
> Removes following warnings:
> qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb: Failed to create device link (0x180) with supplier c440000.spmi for /soc@0/spmi@c440000/pmic@3/labibb/lab
> qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb: Failed to create device link (0x180) with supplier c440000.spmi for /soc@0/spmi@c440000/pmic@3/labibb/ibb

These are only vaguely related, as there's nothing to be wary about that's
specific to these devices - it's just devlink being grumpy

> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> I assume this is right approach, as OLEDs on both devices are driven by
> different regulators.
> 
> Question is, if should be labibb nodes enabled by default?

They're onboard. I'd rather keep them predictably parked than left in
whatever (potentially ON) state the bootloader may leave them at

Konrad

