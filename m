Return-Path: <linux-arm-msm+bounces-86855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3313DCE6D84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 14:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91555304EF69
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B333148AA;
	Mon, 29 Dec 2025 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ArypPUYP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ca3p8/8l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C36313E05
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013803; cv=none; b=LSxmimtp8+a8gLs7RsGr1+Mpl/Y63IBnYzT/E0c50onEwn1IKftOv02r40jnHqVf4KIWOkrwD3JiIV3HxVgef5Z3NIgiH94hTgH1eJIqoAEHKpGX5vPsogFTFmv7hEcVgDC+29SG+eZ+MCf0+fNMky1stsEF59eUTrEtZkWqVeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013803; c=relaxed/simple;
	bh=uzRIwvYsnyggvosgt2+KHtoM9B0+eZ6xtRrRv4Y3FcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h6i5w0unwZ09tABMe1dgzBmvG18KJvlk8O9mNGN1BMn5Myokv2w56iEhKUFoqqYdYEvgcG+YHMwvI6mxwUmOmpDNtA9k4vxfpoZtn+9PcFQLh8KEzwqLlnIeqmWwABSWEcT+E7x9wrjVkdHaXR7pZCScOBeCFyH/Ham1X2C4zPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ArypPUYP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ca3p8/8l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTA970s3642171
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1U2KevJnmKY84jN42Ic3+RugWNFdMyVeLE8MTpZ9s20=; b=ArypPUYPJymm+FeX
	ot84me93MTAVg0bKv0v3vYkVHfj1gkXhfUKwsWvlQq5eSRNrhxjjcoDKX0d4uYv6
	0XgmH6kvZ5R6VvWD77hqN1upOfmXBd0BjkvdOH1b9zA1x+GEqgiC9FLLIfuZ+sn3
	gf8dE+cduWrd6TiEKIWoyiY0yjYWKnV9ge2t4HG4Eu3MFF/lcgsh7Cgx4LeF4408
	OcrqSh2kvP0G7xNiPnrJnKwGUYfxuJ8DBzSa31qQqtQhtmwaUElEJX+ARk3xF3wy
	Y2bekP7sy1WNziNqamVG2WAfoWyuD7NeQlMtdBX9kYduQnOhsdc9jAJCyY9Lc7EM
	B6a74Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6sg4e6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:09:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee05927208so40841551cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 05:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767013799; x=1767618599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1U2KevJnmKY84jN42Ic3+RugWNFdMyVeLE8MTpZ9s20=;
        b=Ca3p8/8lbi5K79oY1HMum42fRDJxq3w3+ExdDtYZmkq8O7DkZ0LI8Yw8LBVa4ZS8iC
         Op/qADKnYCr2sVdX9jhc7CzacIPIHQ6NwLwdLCfe+FUWhksWTVQET5UckKAMMHeqxiaN
         Y90Xot2SmYuvjj95FGZ9MRv0DGR7n934onB+IufwuTjS37KmWgdDHCgWBhpwsbkt99DT
         IXRYXqS1UnXkVDEUghBmbsGU6Mawu6ZEApIQpyIVZbSbeyPg2HVdhjkC4dqwfzEmnxiI
         IGihnKSfKBztDSwxtMMfem3Hpwy8bMneZrB/H3QlYKPPWKqsXqWNrKm3blvJy3kPaT6W
         BypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767013799; x=1767618599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1U2KevJnmKY84jN42Ic3+RugWNFdMyVeLE8MTpZ9s20=;
        b=EcWfivg/64/olvvOKckaJBDp3nMAO71L9oyekdMpcE1QhdcgctoY+OojwH+mxRq1v/
         9sApHTYH8B0kdGJAH8/K1hnIzbn86eisV1EAYIhkHmhXjWkj0tGG8cwi7RhxVSqk9Tln
         FZdJeQ3gjFb5sXqRJuiBxkglCF81/sjDAu8FRQ4WjGsR3cXjSEgktlbp9Wzu8lxfMLd+
         +keE1bm1hKcWlaJnK86rjSsQzOMtQVAyiIoAbjLc1VnxmLHxapNxhkOaLPLE47Axf8aX
         vWfl8txXtw9UcJOKqIDZj9tIYP7++B/reoSXgzjcZsmdOdeYoGzPU9ayARZBab0TSlwS
         RSQw==
X-Forwarded-Encrypted: i=1; AJvYcCUvdyqu+5j9yi/AMjw9VeZAWr7xursUtDSkdFwaXJ9wjx/tOPLTbOsJzfWYRgJ6GfBr2PM5O7+rrUANTjEh@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ8CpBA208pJa973yf/dbtkjuvA1HIDfec1I3ObYDAu8i/8stD
	wipHVIzm+AfI0FTgMVUb4gqhItEepKYlZMIqomnBvopaUayfdBqc2cTiTXBIA7T6/9eFlBNpRsm
	3V4jXU5UzDsNNG03tj5oR7wP2+aLUuztr221Bkr079OQnN3T2EQc46Vfc32uM+2RMoPft
X-Gm-Gg: AY/fxX531/kfAJF5goNIvA8KPuvNGYYZeA9sv8aZq7NwXF3x7MExmAo9u86o1ea430L
	D9YYsv2xzVz+j1xnN+QLSUUld7NSvk2yDP/8rkRDaQaPpFUeZiNqPB2M47VXG12qPyi2+UJQHO/
	hJDh4Qne5WCULvJoTLeGmL25IuzspeQ3RpAi+xb4LBfZfN6I42S72SrilfOo1lurT7kC55ZzDMP
	p6BgrAajnfIkp4DDjDmI5XRDxdDpG63imrJ7IAp9b/VPYTf/uXodZHJog/W5myovOZ6j3znDff7
	lf7xJOTC0+Z3vVkVq3eurhj9x1R+ZcdFgZeJdNofcEgCxXTI53NQ9SVJ/5gSnLYan8Cd+hlZYPu
	wUbzEEDrYyo+WKhb2PlfHJy+S8T4WlhKn8GVHVam2VuPOvHMGPwzkb9nFHaaoGJt98g==
X-Received: by 2002:ac8:5891:0:b0:4f1:840a:c90f with SMTP id d75a77b69052e-4f4abccd72amr343273651cf.2.1767013799161;
        Mon, 29 Dec 2025 05:09:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeFn+ULom0MaqOFCpJdzSzf47AT9NbQIchSG4rj+Gfty0bp0BAWaFjA8ywPw14vBH4HYDXuQ==
X-Received: by 2002:ac8:5891:0:b0:4f1:840a:c90f with SMTP id d75a77b69052e-4f4abccd72amr343273221cf.2.1767013798757;
        Mon, 29 Dec 2025 05:09:58 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494c0esm31675297a12.20.2025.12.29.05.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 05:09:57 -0800 (PST)
Message-ID: <47cfbdbe-1b73-4fbb-aa55-fd1b29ddbb18@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 14:09:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251222095914.1995041-1-quic_nihalkum@quicinc.com>
 <20251222095914.1995041-6-quic_nihalkum@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251222095914.1995041-6-quic_nihalkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X5ln8-jGbPyg46Wur_j_IDsM_6UD4KJe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEyMiBTYWx0ZWRfX/mzizjD9sjCB
 m2PxgRRqZVT0EKTw9NK5iu2ZzYW0JHgtLE/WTovtVziP0a4YG6bluQWDTkYnioysc5bt4YKN1Cr
 DW0hfvajARxSiCX2OT4wdElb5PSflpe+ntVNbbj/6T6KckUK3ybu40KXzpxJZz/NfRd8AXNVND4
 VFMgK01NpkXf3xhYikws7YEnPf75KIUI/l4IHgAcq+SnC65XAh1sBRrBYX2N7iD9IkGlZi58OiA
 7gsZf3omKNFXA1X6GHUUVHOeIVdrib0/qE86bHsb/FHyrtb6sUf9cGOtXycqCC96qG2BMWe5Kwi
 fzWDq1CQX6mvYqeLRRJI5VtGYKsG0dd/nkKiwtu/CYmG6ZJVxzkkCPUTqF+DdGmkm9wyWaB/df8
 EMC3nQMcQ2OAt3vWEUbSyyiN6Md8kLbeoSj1y0EzN2Hxu+m2FmKdupdzachKd3dWVvYLQ8AHwXR
 jvukAOIw6P150QfxuzA==
X-Proofpoint-ORIG-GUID: X5ln8-jGbPyg46Wur_j_IDsM_6UD4KJe
X-Authority-Analysis: v=2.4 cv=Y+L1cxeN c=1 sm=1 tr=0 ts=69527da7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=dh2O1nY2NKEWDLYW15gA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290122

On 12/22/25 10:59 AM, Nihal Kumar Gupta wrote:
> Monaco EVK board does not include a camera sensor in its default hardware
> configuration. Introducing a device tree overlay to support optional
> integration of the IMX577 sensor via CSIPHY1.
> 
> Camera reset is handled through an I2C expander, and power is enabled
> via TLMM GPIO74.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -V '"imx577 3-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video1
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

