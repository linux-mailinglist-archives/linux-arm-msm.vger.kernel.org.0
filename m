Return-Path: <linux-arm-msm+bounces-76022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 30694BBD727
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 11:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C8F764E9C4A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 09:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEFA21A23B9;
	Mon,  6 Oct 2025 09:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FtI2+KdI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320692A1BB
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 09:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759743059; cv=none; b=rGfADtq7RYhxsCYtR5ZpPr+aPjuJbDAURLkmH/IWmnTtATffQqNOoWfs7AF1HVry6/GfpXHS1tCZqOAaWCxTqaFKTIesIvvojqbFbdjFynpOucGrWDagdtUxl1ojUEYiqbovmIqzYKAfHFdR02sjqD3kzbasAEiy6VEqpwOMUnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759743059; c=relaxed/simple;
	bh=leaPRdjhUAhu65EKAwyIHOe5Bt9yDIhBkariT72x9hA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U4FA4x4QNxgzgEaxfqh4BZQizpCmXIC4MlAgH2pTOpJom4ONEDthurb1a8ocuXdvLAML25rF13oRUQZgY3Mp7yPipKXZHlvigiJsucBXO3RVIrmXCiBmZPONQ7XOj+hgPEydTF3PzAGF4kVL7bfz51VC6Pg2fFc2+P1pBQ6mSZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FtI2+KdI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595MXRH4024547
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 09:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vops52gUYvZ3NLTbdfUXQSMexbJtRLHsZnvJ7nngDMo=; b=FtI2+KdIXV07hdY4
	laJIJAarmK+hNExe9mi4lzgX+cXYQ04PSC4NXTEkyBjBALpo8h+B2Rh8hleKTZ/6
	PegV9Tqbq3bEp9UUNHfhHUjnZOcRWIrclthWn8LjIUlvQKzNMvuBebPIeqeoKeDj
	PuOtS31KiwfW1BFEwgq6xEM0LK11c1HIAWNas/2oWvkopE4PFkAuX/kIEk8pgKpT
	kE7170gd+B8MA5WsVOXcOG5b2zxzfE6Aiwrt2xcotbDA4wsfjMErbqM/6zfUCPv5
	HMIYeiehPpm/J/UeSkBChO2y2gnQshIBdV8kBC8MtQtqDowCdLFu/JCmrfoeGDyt
	H4sUhA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49k6bfjkeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 09:30:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-795ac54d6f8so10015766d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 02:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759743056; x=1760347856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vops52gUYvZ3NLTbdfUXQSMexbJtRLHsZnvJ7nngDMo=;
        b=r20cyPQf7ZR5JBvV5ExD7xmyT6xv92knrRhRNAp3xmR0zSlE38I/nz2IjStoyh520k
         EIbbhW9Hn75ucNrSXAl2yoCyA4yMNi25w41eH7iOns4+FIioB7UnB3rYS46ZJHFNTSCZ
         OIf7d5y8itN7L7OCCG+GmS6qMiUDoRfkWsX6pyM8XL4b2G+Mb404bn+VVUEaV8/ravY0
         L6dyAitGAVFnhVqkvY1m5YVZwLrqScMlvx8pyWnaORE7k6fVUyekmWgGstlRSBU8ddDp
         t/VLRNu+uPs8rUz2mb8BTQKnJ0xgwOtNEFsiux/zxHknIFqPA4KcBu3AYXC+VHXtLkzt
         axDA==
X-Gm-Message-State: AOJu0YxbV7d3dXNUle1m3KZmAe3K/8AL+JjhdBaa8ShxZIKi6H3RXzCn
	i2NbCzpIqf49mAxzDdmXqEixPbmk+dymXU18nNQ/GJqJ1Jo3YpqgZlZhiRPvKatL9vAfCrGZ+Zt
	pAcj30OAcBPaI3lJny1mRzl63suRM6mAVS6Qm62OoTJoTiLWUzpOfEroUoH42/Pb760M/
X-Gm-Gg: ASbGncsbFnuZhBdvx9dKkAlB+qo4FD+10QRZ+YqqzE/AR7Af7FOcbAuB2gNyi7C4Dx8
	DW7omnKQpBCI24d7jR0pt2Px5rafBzNgExlJ7oGOjuP+9wMJm4br8aqYwI9n0KPYZHhIo5g7EQP
	sjtQCsgyY9bE64dmQTRFVomhQj3uelMXawN/WadVEjGGLQtZfH17mgj+gnE3S2sifIHwKeREIuW
	/4/rNKTONA0n5rVQoSJCds1yTGIKVCX5GS48JWdVR9IVwW9cMW4JUTHIayF/KtYIMb2+6vyUoKu
	34B99Yx/jm0rNvD9nVd+lZDTHt2mLvfeLFqUX47iXwytzapeMH8oWyFGr1qgyM0FYe7vuGMkd6R
	Zk7e4iK6B7a7cwiFG4hDhuTWnxgU=
X-Received: by 2002:a05:6214:f23:b0:80a:9ebc:33f9 with SMTP id 6a1803df08f44-879dc89535cmr103756876d6.6.1759743055729;
        Mon, 06 Oct 2025 02:30:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBKGVvuT/dS5+zF4JwZxmMHMvCe6TF1FwUlsq3NgesrwmiFqhiDCKZ77vUMID+5OE3Uvgp/g==
X-Received: by 2002:a05:6214:f23:b0:80a:9ebc:33f9 with SMTP id 6a1803df08f44-879dc89535cmr103756506d6.6.1759743055006;
        Mon, 06 Oct 2025 02:30:55 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637880ffa4dsm9810213a12.29.2025.10.06.02.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 02:30:54 -0700 (PDT)
Message-ID: <7ef8ba74-4e9e-4b19-998e-40917d997ca8@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 11:30:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8996: add interconnect paths to
 USB2 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Yassine Oudjana
 <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251002-fix-msm8996-icc-v1-0-a36a05d1f869@oss.qualcomm.com>
 <20251002-fix-msm8996-icc-v1-2-a36a05d1f869@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251002-fix-msm8996-icc-v1-2-a36a05d1f869@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mFhPX9dtQv7dyjRPkwGkRzGLN8M1GBGy
X-Proofpoint-ORIG-GUID: mFhPX9dtQv7dyjRPkwGkRzGLN8M1GBGy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDEzNSBTYWx0ZWRfX8YIOgvayNX0k
 NBrHe7sHGuK6GXcn/HOKtinYNgBzzTTveHV2Gge18jrHqAvU+ioaTA6x21Ct24siXdlT+Li+pBZ
 +vy0y0Gz+AN4ASMthJ6I0HwRqFuB2CqEYjeP9Cnt3bs1MdDYECF8Iwnd+hZdDv3rxm4tlxVjGyC
 BC4szfxPPy9k1m9mfNokHeFd2dxf8uwqKlQYhstml/KbF133H2fMfu2I4hFiC46blZcvQc1m1uJ
 lkxLiZnb7ciStKMenx2lWpj7LAXHbsC8FDnSPGfOZotwaEA+ofZGhkmE54GirPoPzzrFWAYqF0A
 1pyE6fmF9kv0wHQtLRR+WtL2lYFLBXmJaUSNKE0zXQqHiKyFlwEkfpMW0vT6tmDrSeadgCiksCm
 huQxbp4q5CiU7REAjMUsnrWX5ad4HQ==
X-Authority-Analysis: v=2.4 cv=Hr572kTS c=1 sm=1 tr=0 ts=68e38c51 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=T_NsP1zJ15PqFYLLzu8A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040135

On 10/2/25 10:53 AM, Dmitry Baryshkov wrote:
> Add the missing interconnects to the USB2 host. The Fixes tag points to
> the commit which broke probing of the USB host on that platform.
> 
> Fixes: 130733a10079 ("interconnect: qcom: msm8996: Promote to core_initcall")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> ---
> Note: without the previous patch applying this one can result in the
> kernel stuck at booting because of the EPROBE_DEFER loop. I suggest
> applying them through the same tree in order to make sure that the tree
> is not broken (or using an immutable tag for the icc commit).
> ---

There seems to be syntax for this, at least for stable patches
(which we should probably either use or add +noautosel):

* Specify any additional patch prerequisites for cherry picking::

    xCxc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
    xCxc: <stable@vger.kernel.org> # 3.3.x: 1b9508f: sched: Rate-limit newidle
    xCxc: <stable@vger.kernel.org> # 3.3.x: fd21073: sched: Fix affinity logic
    xCxc: <stable@vger.kernel.org> # 3.3.x
    xSxixgxxnxexd-oxfxf-xbxy: Ingo Molnar <mingo@elte.hu>

(deliberatelly added a bunch of 'x'-es to not interrupt the maintainers'
b4 workflow)

(via https://www.kernel.org/doc/Documentation/process/stable-kernel-rules.rst)

Konrad

